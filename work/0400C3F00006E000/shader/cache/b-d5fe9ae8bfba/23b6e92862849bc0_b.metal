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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1623 = false;
    bool _828 = false;
    bool _346 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_48.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1928 = as_type<float>(_118);
        out.gl_Position.z = _1928;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_53.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_148)
    {
        out.m_51.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_154);
        out.gl_Position.z = _1996;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _158 = !_156;
    float _176;
    if (!_158)
    {
        float _160 = in.m_55.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_102);
        float _182 = 1.0 / _180;
        float _184 = _136 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _186 + _204;
    bool _208 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _228 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_186);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_202;
    float _242 = _240 + 1.0;
    float _244 = 1.0 / _226;
    float _246 = _238 * _242;
    float _248 = -_238;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _222;
    float _260 = _218 * _250;
    float _262 = -_218;
    float _264 = _262 + 1.0;
    float _266 = _206 * _244;
    float _268 = _190 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = fma(_254, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = fma(_276, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _278 * _260;
    float _286 = _280 * _260;
    float _288 = _282 * _260;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _302 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _304 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _306 = fma(_292, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _308 = fma(_296, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _310 = fma(_300, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _312 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _314 = fma(_306, _246, _302);
    float _316 = fma(_308, _246, _304);
    float _318 = fma(_310, _246, _312);
    float _320 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].x, _314);
    float _322 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].y, _316);
    float _324 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].z, _318);
    bool _326 = !_256;
    float _344;
    if (!_326)
    {
        float _328 = in.m_55.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_102);
        float _350 = 1.0 / _348;
        float _352 = _136 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    float _356 = in.m_57.x;
    float _358 = in.m_57.y;
    float _360 = in.m_57.z;
    float _362 = in.m_59.x;
    float _364 = in.m_59.y;
    float _366 = in.m_59.z;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _370 = _368 != 0;
    float _372 = in.m_48.x;
    float _374 = in.m_48.y;
    float _376 = in.m_48.z;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _380 = _378 != 0;
    float _382 = in.m_55.y;
    float _384 = in.m_61.y;
    float _386 = 0.0;
    if (_370)
    {
        float _388 = in.m_55.x;
        _386 = _388;
    }
    float _390 = _386;
    float _392 = _322 * _358;
    float _394 = _320 * _356;
    float _396 = _324 * _360;
    float _398 = in.m_61.x;
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _364);
    float _402 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _366);
    float _410 = _400 * _402;
    float _412 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _414 = _404 * _406;
    float _416 = _374 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _418 = _374 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _420 = _382 > 0.5;
    float _422 = _408 * _412;
    float _424 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].x, _416);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].x, _418);
    float _428 = _410 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _430 = _410 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _432 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _424);
    float _434 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].x, _428);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].x, _430);
    float _440 = _432 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _442 = _434 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[8].z, _436);
    float _446 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].z, _438);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -_384;
    float _454 = _452 + 1.0;
    float _456 = _440 + _444;
    float _458 = _442 + _446;
    float _460 = 1.0 / _450;
    float _462 = _374 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _466 = _456 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _458 + _468;
    float _472 = _384;
    float _474 = _376;
    float _476 = _364;
    float _478 = _366;
    if (_380)
    {
        float _480 = _420 ? _454 : _384;
        _472 = _480;
    }
    float _482 = _472;
    float _484 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _486 = _466 * _466;
    float _488 = _470 * _470;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    bool _496 = _364 != 0.0;
    bool _498 = isnan(_364);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    float _510 = _486 + _488;
    bool _512 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = isnan(_354);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _354 + _524;
    bool _528 = _362 == 0.0;
    bool _530 = !_504;
    bool _532 = _528 && _530;
    float _534 = sqrt(_510);
    bool _536 = _390 > 0.5;
    bool _538 = _536 && _370;
    float _540 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _542 = _366 == 0.0;
    bool _544 = _542 && _532;
    float _546 = _508 * _460;
    bool _548 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _550 = isnan(_354);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -_522;
    float _562 = _560 + 1.0;
    float _564 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].x, _540);
    float _566 = fma(_546, _526, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _484);
    float _570 = _558 * _562;
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[9].z, _564);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _576 = _570;
    float _578 = _522;
    if (!_370)
    {
        _474 = _398;
    }
    float _580 = _474;
    float _582 = _566 * _570;
    float _584 = _580;
    float _586 = _582;
    if (_370)
    {
        _576 = _398;
    }
    float _588 = _576;
    float _590 = -_558;
    float _592 = _590 + 1.0;
    bool _594 = _534 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _596 = _490;
    float _598 = _588;
    float _600 = _492;
    float _602 = _494;
    float _604 = _592;
    if (!_544)
    {
        float _606 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _490);
        _596 = _606;
    }
    float _608 = _596;
    float _610 = _568 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_538)
    {
        float _614 = -_588;
        float _616 = _614 + 1.0;
        _598 = _616;
    }
    float _618 = _598;
    float _620 = _618;
    if (!_544)
    {
        float _622 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _492);
        _600 = _622;
    }
    float _624 = _600;
    float _626 = _610 + _572;
    if (!_544)
    {
        float _628 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[17].y, _494);
        _602 = _628;
    }
    float _630 = _602;
    float _632 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    if (_370)
    {
        _584 = _618;
    }
    float _634 = _584;
    if (!_594)
    {
        _620 = _488;
    }
    float _636 = _620;
    float _638 = _636;
    if (!_594)
    {
        _586 = _486;
    }
    float _640 = _586;
    float _642 = _640;
    if (!_594)
    {
        _476 = _456;
    }
    float _644 = _476;
    float _646 = _644;
    if (!_594)
    {
        _604 = _458;
    }
    float _648 = _604;
    float _650 = _648;
    if (!_594)
    {
        _478 = _626;
    }
    float _652 = _478;
    bool _654 = !_594;
    float _656 = _652;
    if (!_654)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _662 = _534 + _660;
        float _664 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _666 = rsqrt(_510);
        float _668 = _662 * _658;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _670 * 6.283185482025146484375;
        float _674 = sin(_672);
        float _676 = _670 * 6.283185482025146484375;
        float _678 = cos(_676);
        float _680 = fma(_674, _664, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _682 = _666 * _680;
        float _684 = _678 + (-1.0);
        float _686 = fma(_466, _682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _688 = fma(_470, _682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _690 = _684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _694 = _686 + _692;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _698 = _688 + _696;
        float _700 = fma(_626, _678, _690);
        float _702 = _694 * _694;
        float _704 = _698 * _698;
        _656 = _700;
        _642 = _702;
        _638 = _704;
        _646 = _686;
        _650 = _688;
    }
    float _706 = _656;
    float _708 = _642;
    float _710 = _638;
    float _712 = _646;
    float _714 = _650;
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _718 = _706 + _716;
    float _720 = _624 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _722 = _624 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _724 = _624 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _726 = fma(_718, _718, _708);
    float _728 = _482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _730 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[8].x, _720);
    float _732 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[10].x, _724);
    float _734 = _726 + _710;
    float _736 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[9].x, _722);
    float _738 = _634 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _740 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[116].x, _632);
    float _742 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[8].z, _730);
    float _744 = sqrt(_734);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _754 = _738 * _574;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _758 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[9].z, _736);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _762 = _728 * _612;
    float _764 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _766 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _770 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _774 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].z, _732);
    out.m_65.x = _754;
    out.m_65.y = _762;
    bool _780 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _782 = isnan(_744);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _788 = _784 || _786;
    out.m_67.x = _770;
    out.m_67.y = _772;
    out.m_67.z = _774;
    out.m_69.x = _764;
    out.m_69.y = _766;
    out.m_69.z = _768;
    out.m_69.w = _776;
    out.m_71.x = _742;
    out.m_71.y = _758;
    out.m_71.z = _778;
    float _790 = _770;
    float _792 = _772;
    if (!_788)
    {
        _578 = 1.0;
    }
    float _794 = _578;
    bool _796 = !_788;
    float _798 = _794;
    if (!_796)
    {
        bool _800 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _802 = isnan(_744);
        bool _804 = _800 || _802;
        bool _806 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _808 = _804 || _806;
        if (!_808)
        {
            float _810 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _812 = _744 + _810;
            float _814 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _816 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _814;
            float _818 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _820 = _818 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _822 = 1.0 / _816;
            float _824 = _812 * _822;
            float _826 = fma(_824, _820, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _798 = _826;
            _828 = true;
        }
        else
        {
            bool _830 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _832 = isnan(_744);
            bool _834 = _830 || _832;
            bool _836 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _838 = _834 || _836;
            if (!_838)
            {
                float _840 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _842 = _744 + _840;
                float _844 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _846 = _844 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _848 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _850 = _848 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _852 = 1.0 / _846;
                float _854 = _842 * _852;
                float _856 = fma(_854, _850, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _798 = _856;
                _828 = true;
            }
            else
            {
                _798 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _828 = false;
    float _858 = _798;
    float _860 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _862 = _706 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _866 = _712 + _864;
    float _868 = fma(_862, _858, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _870 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _872 = _714 + _870;
    float _874 = fma(_866, _858, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _876 = fma(_440, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _880 = _868 + _878;
    float _882 = fma(_872, _858, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _886 = _874 + _884;
    float _888 = _880 * _880;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _892 = _882 + _890;
    float _894 = floor(_876);
    float _896 = fma(_886, _886, _888);
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _900 = fma(_892, _892, _896);
    float _902 = rsqrt(_900);
    float _904 = _902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _906 = _886 * _904;
    float _908 = _892 * _904;
    float _910 = _906 * _906;
    float _912 = _908 * _908;
    float _914 = _910 + _912;
    float _916 = sqrt(_914);
    bool _918 = _916 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _916 + _920;
    float _924 = _892;
    float _926 = _922;
    float _928 = _880;
    if (_918)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _924 = _930;
    }
    float _932 = _924;
    if (_918)
    {
        float _934 = rsqrt(_914);
        _790 = _934;
    }
    float _936 = _790;
    float _938 = _936;
    if (_918)
    {
        float _940 = _922 * _932;
        _926 = _940;
    }
    float _942 = _926;
    if (_918)
    {
        float _944 = _942 * 0.15915493667125701904296875;
        _792 = _944;
    }
    float _946 = _792;
    float _948 = _776;
    if (_918)
    {
        float _950 = _946 * 6.283185482025146484375;
        float _952 = sin(_950);
        _948 = _952;
    }
    float _954 = _948;
    float _956 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _958 = precise::max(0.0, _956);
    float _960 = _902;
    float _962 = _958;
    float _964 = _956;
    if (_918)
    {
        float _966 = _946 * 6.283185482025146484375;
        float _968 = cos(_966);
        _960 = _968;
    }
    float _970 = _960;
    float _972 = -_904;
    float _974 = -_958;
    float _976 = fma(_880, _972, _974);
    if (_918)
    {
        float _978 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _978;
    }
    float _980 = _962;
    float _982 = _954;
    float _984 = _980;
    if (_918)
    {
        float _986 = fma(_954, _980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _928 = _986;
    }
    float _988 = _928;
    float _990 = _988;
    if (!_918)
    {
        _982 = _976;
    }
    float _992 = _982;
    float _994 = _992;
    float _996 = _970;
    if (_918)
    {
        float _998 = _970 + (-1.0);
        _964 = _998;
    }
    float _1000 = _964;
    float _1002 = _1000;
    if (_918)
    {
        float _1004 = _936 * _988;
        _984 = _1004;
    }
    float _1006 = _984;
    if (!_918)
    {
        _990 = _906;
    }
    float _1008 = _990;
    float _1010 = _1008;
    if (_918)
    {
        float _1012 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1012;
    }
    float _1014 = _1002;
    float _1016 = _1014;
    if (_918)
    {
        float _1018 = _906 * _1006;
        _1010 = _1018;
    }
    float _1020 = _1010;
    if (!_918)
    {
        _938 = _908;
    }
    float _1022 = _938;
    float _1024 = _1022;
    if (_918)
    {
        float _1026 = _908 * _1006;
        _1024 = _1026;
    }
    float _1028 = _1024;
    if (_918)
    {
        float _1030 = fma(_976, _970, _1014);
        _994 = _1030;
    }
    float _1032 = _994;
    if (!_918)
    {
        _996 = _910;
    }
    float _1034 = _996;
    float _1036 = _1034;
    if (_918)
    {
        float _1038 = _1020 * _1020;
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (!_918)
    {
        _1016 = _912;
    }
    float _1042 = _1016;
    float _1044 = sqrt(_900);
    float _1046 = _1042;
    if (_918)
    {
        float _1048 = _1028 * _1028;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = fma(_1032, _1032, _1040);
    float _1054 = _868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1056 = _868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1058 = _1052 + _1050;
    float _1060 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1062 = _868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1064 = _868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = rsqrt(_1058);
    float _1068 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1054);
    float _1070 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1062);
    float _1072 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1074 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1056);
    float _1076 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1068);
    float _1078 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1070);
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1082 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1080);
    float _1084 = precise::clamp(_1082, 0.0, 1.0);
    float _1086 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1072);
    float _1088 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1090 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1092 = -_1084;
    float _1094 = _1092 + 1.0;
    float _1096 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1098 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1074);
    float _1100 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1102 = floor(_1060);
    float _1104 = _1066 * _1028;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1100);
    float _1110 = _1066 * _1020;
    float _1112 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1114 = -_894;
    float _1116 = _876 + _1114;
    float _1118 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1108);
    float _1120 = abs(_1094);
    float _1122 = log2(_1120);
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1126 = -_1112;
    float _1128 = fma(_1126, _898, 1.0);
    float _1130 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1118);
    float _1132 = _1066 * _1032;
    float _1134 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1136 = -_1124;
    float _1138 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1136);
    float _1140 = log2(_1128);
    float _1142 = -_1102;
    float _1144 = _1060 + _1142;
    float _1146 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1134);
    float _1148 = -_1104;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1138);
    float _1152 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = _1132 + 1.0;
    float _1156 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1146);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1160 = fma(_1150, -0.5, 0.5);
    float _1162 = 1.0 / _1130;
    float _1164 = fma(_1150, 0.5, 0.5);
    float _1166 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1168 = fma(_1164, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1170 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1166);
    float _1172 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1156);
    float _1174 = exp2(_1158);
    float _1176 = fma(_1164, _1168, -0.212114393711090087890625);
    float _1178 = _1140 * 0.693147182464599609375;
    float _1180 = fma(_1164, _1176, 1.570728778839111328125);
    float _1182 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1184 = sqrt(_1160);
    float _1186 = _1172 * _1162;
    float _1188 = -_1132;
    float _1190 = fma(_1174, _1154, _1188);
    float _1192 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1170);
    float _1194 = fma(_1190, 0.5, 0.5);
    float _1196 = _1192 * _1162;
    float _1198 = fma(_1186, 0.5, 0.5);
    float _1200 = _1184 * 0.636619746685028076171875;
    float _1202 = fma(_1196, -0.5, 0.5);
    float _1204 = -_1180;
    float _1206 = fma(_1200, _1204, 1.0);
    float2 _3775 = float2(_1116, _1144);
    float _1208 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3775, float2(0.0), isnan(_3775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3775, float2(0.0), isnan(_3775)), level(0.0)).x;
    float3 _3786 = float3(_1198, _1202, _1182);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3786, float3(0.0), isnan(_3786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3786, float3(0.0), isnan(_3786)), level(0.0)).x;
    float3 _3797 = float3(_1198, _1202, _1182);
    float4 _1213 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3797, float3(0.0), isnan(_3797)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3797, float3(0.0), isnan(_3797)), level(0.0)).xyzw;
    float _1215 = _1213.x;
    float _1217 = _1213.y;
    float _1219 = _1213.z;
    float _1221 = _1213.w;
    float2 _3813 = float2(_1206, _1194);
    float3 _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3813, float2(0.0), isnan(_3813)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3813, float2(0.0), isnan(_3813)), level(0.0)).xyz;
    float _1227 = _1225.x;
    float _1229 = _1225.y;
    float _1231 = _1225.z;
    float _1233 = _610 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1235 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1237 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1233);
    float _1239 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1237);
    float _1241 = _610 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1245 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1241);
    float _1247 = 1.0 / _1243;
    float _1249 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1245);
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1253 = _1251 + _1243;
    float _1255 = _1253 * _1247;
    float _1257 = _1255 * 0.5;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1261 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1259);
    float _1263 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1265 = 1.0 / _1261;
    float _1267 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1263);
    float _1269 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1271 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1269);
    float _1273 = _1271 + _1130;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1277 = _1265 * _1275;
    float _1279 = _1273 * 0.5;
    float _1281 = in.m_73.x;
    float _1283 = abs(_1277);
    float _1285 = log2(_1283);
    out.m_75.z = _1279;
    out.m_75.w = _1130;
    float _1287 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1289 = exp2(_1287);
    out.gl_Position.x = _1172;
    out.gl_Position.y = _1192;
    out.gl_Position.z = _1271;
    out.gl_Position.w = _1130;
    float _1291 = exp2(_1235);
    float _1293 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1295 = precise::clamp(_1293, 0.0, 1.0);
    bool _1297 = _1277 <= 8000.0;
    bool _1299 = isnan(_1277);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan(8000.0);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = fma(_1295, -2.0, 3.0);
    float _1311 = _1295 * _1295;
    bool _1313 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    float _1323 = _1311 * _1309;
    float _1325 = -_1323;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1323);
    float _1331 = _1172;
    float _1333 = _1327;
    float _1335 = _1235;
    if (_1321)
    {
        _1331 = 1.0;
    }
    float _1337 = _1331;
    float _1339 = _1307 * _1329;
    float _1341 = _1337;
    if (_1321)
    {
        _1333 = 1.0;
    }
    float _1343 = _1333;
    float _1345 = _1343;
    float _1347 = _1217;
    float _1349 = _1215;
    if (!_1321)
    {
        float _1351 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1353 = _1351 * 0.15915493667125701904296875;
        float _1355 = _1353 * 6.283185482025146484375;
        float _1357 = cos(_1355);
        float _1359 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1353 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = 1.0 / _1357;
        float _1369 = _1361 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = _1361 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = _1371 * _1373;
        float _1381 = 1.0 / _1379;
        float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1385 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1383;
        float _1387 = 1.0 / _1385;
        float _1389 = _1377 * _1381;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = fma(_1277, _1389, _1391);
        float _1395 = _1393 * _1387;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        _1335 = _1379;
        _1345 = _1397;
    }
    float _1399 = _1335;
    float _1401 = _1345;
    float _1403 = _1399;
    if (!_1321)
    {
        float _1405 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1407 = _1405 * 0.15915493667125701904296875;
        float _1409 = _1407 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1407 * 6.283185482025146484375;
        float _1419 = sin(_1417);
        float _1421 = 1.0 / _1411;
        float _1423 = _1415 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = _1415 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = 1.0 / _1433;
        float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1439 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1437;
        float _1441 = 1.0 / _1439;
        float _1443 = _1431 * _1435;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = fma(_1277, _1443, _1445);
        float _1449 = _1447 * _1441;
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = -_1451;
        float _1455 = _1453 + 1.0;
        _1341 = _1455;
        _1403 = _1441;
    }
    float _1457 = _1341;
    float _1459 = _1403;
    float _1461 = -_1291;
    float _1463 = _1461 + 1.0;
    float _1465 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1467 = -_1208;
    float _1469 = _1467 + 1.0;
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1473 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1475 = isnan(_1044);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1481 = _1477 || _1479;
    float _1483 = _1469 * _1465;
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = _1471 * _1210;
    float _1489 = -_1471;
    float _1491 = _1489 + 1.0;
    float _1493 = -_1485;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1497 = _1221 * _1487;
    float _1499 = _1231 * _1487;
    float _1501 = _1495 * _1281;
    float _1503 = _1221 * _1491;
    float _1505 = fma(_1227, _1497, _1215);
    float _1507 = fma(_1229, _1497, _1217);
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1511 = fma(_1221, _1499, _1219);
    float _1513 = _1401 * _1457;
    float _1515 = _1459;
    float _1517 = _1491;
    float _1519 = _1497;
    float _1521 = _1501;
    if (!_1481)
    {
        _1347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1523 = _1347;
    out.m_77.x = _1509;
    float _1525 = _1523;
    float _1527 = _1523;
    if (!_1481)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1529 = _1349;
    float _1531 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1533 = _1529;
    float _1535 = _1529;
    if (!_1481)
    {
        _1515 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1537 = _1515;
    out.m_79.x = _1505;
    out.m_79.y = _1507;
    out.m_79.z = _1511;
    out.m_79.w = _1503;
    float _1539 = _1537;
    float _1541 = _1537;
    if (!_1481)
    {
        _1517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1543 = _1517;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1481)
    {
        _1519 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _1519;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1481)
    {
        _1521 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1555 = _1521;
    bool _1557 = !_1481;
    float _1559 = _1555;
    float _1561 = _1555;
    if (!_1557)
    {
        bool _1563 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1565 = isnan(_1044);
        bool _1567 = _1563 || _1565;
        bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1571 = _1567 || _1569;
        if (!_1571)
        {
            float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1575 = _1044 + _1573;
            float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1579 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1577;
            float _1581 = 1.0 / _1579;
            float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1603 = _1575 * _1581;
            float _1605 = precise::clamp(_1603, 0.0, 1.0);
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1611 = fma(_1605, _1585, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1613 = fma(_1605, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1615 = fma(_1605, _1589, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1617 = fma(_1605, _1593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1619 = fma(_1605, _1597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1621 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1535 = _1613;
            _1553 = _1619;
            _1527 = _1611;
            _1547 = _1617;
            _1541 = _1615;
            _1561 = _1621;
            _1623 = true;
        }
        else
        {
            bool _1625 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1627 = isnan(_1044);
            bool _1629 = _1625 || _1627;
            bool _1631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1633 = _1629 || _1631;
            if (!_1633)
            {
                _1525 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1635 = _1525;
            _1527 = _1635;
            if (!_1633)
            {
                _1533 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1637 = _1533;
            _1535 = _1637;
            if (!_1633)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1639 = _1539;
            _1541 = _1639;
            if (!_1633)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1641 = _1545;
            _1547 = _1641;
            if (!_1633)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1643 = _1551;
            _1553 = _1643;
            if (!_1633)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1645 = _1559;
            bool _1647 = !_1633;
            _1561 = _1645;
            if (!_1647)
            {
                bool _1649 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1651 = isnan(_1044);
                bool _1653 = _1649 || _1651;
                bool _1655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1657 = _1653 || _1655;
                if (!_1657)
                {
                    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1661 = _1044 + _1659;
                    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1665 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1663;
                    float _1667 = 1.0 / _1665;
                    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1675 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1679 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1683 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1689 = _1661 * _1667;
                    float _1691 = precise::clamp(_1689, 0.0, 1.0);
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1697 = fma(_1691, _1671, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1699 = fma(_1691, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1701 = fma(_1691, _1675, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1703 = fma(_1691, _1679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1705 = fma(_1691, _1683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1707 = fma(_1691, _1687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1535 = _1699;
                    _1553 = _1705;
                    _1527 = _1697;
                    _1547 = _1703;
                    _1541 = _1701;
                    _1561 = _1707;
                    _1623 = true;
                }
                else
                {
                    _1535 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1527 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1623 = false;
    float _1709 = _1535;
    float _1711 = _1553;
    float _1713 = _1527;
    float _1715 = _1547;
    float _1717 = _1541;
    float _1719 = _1561;
    float _1721 = fma(_758, -0.5, 0.5);
    float _1723 = precise::clamp(_1721, 0.0, 1.0);
    float _1725 = -_1709;
    float _1727 = _1725 + _1711;
    float _1729 = _1531 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1731 = -_1713;
    float _1733 = _1731 + _1715;
    out.m_81.x = 0.0;
    float _1735 = fma(_1723, _1727, _1709);
    float _1737 = fma(_1723, _1733, _1713);
    out.m_51.x = _1729;
    float _1739 = -_1717;
    float _1741 = _1739 + _1719;
    float _1743 = _1735 * 0.586610972881317138671875;
    bool _1745 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1747 = fma(_1723, _1741, _1717);
    float _1749 = fma(_1737, 0.298911988735198974609375, _1743);
    bool _1751 = _1401 > 0.0;
    bool _1753 = isnan(_1401);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = fma(_1747, 0.114477999508380889892578125, _1749);
    bool _1763 = _1457 <= 0.0;
    bool _1765 = !_1759;
    bool _1767 = _1763 || _1765;
    float _1769 = -_1761;
    float _1771 = _1737 + _1769;
    float _1773 = -_1761;
    float _1775 = _1735 + _1773;
    float _1777 = -_1761;
    float _1779 = _1747 + _1777;
    float _1781 = fma(_1771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    float _1783 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    float _1785 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    bool _1787 = !_1745;
    if (!_1787)
    {
        float _1789 = -_868;
        float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1793 = -_874;
        float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1797 = -_882;
        float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1801 = _1791 * _1791;
        float _1803 = fma(_1795, _1795, _1801);
        float _1805 = fma(_1799, _1799, _1803);
        float _1807 = sqrt(_1805);
        float _1809 = rsqrt(_1805);
        float _1811 = -_1807;
        float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1815 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        float _1819 = _1795 * _1809;
        float _1821 = _1791 * _1809;
        float _1823 = abs(_1817);
        float _1825 = log2(_1823);
        float _1827 = _1799 * _1809;
        float _1829 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1831 = _758 * _1821;
        float _1833 = -_1821;
        float _1835 = -_1829;
        float _1837 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1835);
        float _1839 = fma(_742, _1819, _1831);
        float _1841 = -_1827;
        float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1837);
        float _1845 = fma(_778, _1827, _1839);
        float _1847 = precise::clamp(_1845, 0.0, 1.0);
        float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1851 = _1843 + _1849;
        float _1853 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1857 = precise::clamp(_1855, 0.0, 1.0);
        float _1859 = exp2(_1853);
        float _1861 = _1859 * _1857;
        float _1863 = _1847 * _1861;
        float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1869 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _1865;
        out.m_81.y = _1867;
        out.m_81.z = _1869;
    }
    out.m_83.x = _1781;
    out.m_83.y = _1783;
    out.m_83.z = _1785;
    if (!_1767)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1871 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1871;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1623 = false;
    bool _828 = false;
    bool _346 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_48.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1928 = as_type<float>(_118);
        out.gl_Position.z = _1928;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_53.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_148)
    {
        out.m_51.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_154);
        out.gl_Position.z = _1996;
    }
    if (_148)
    {
        return out;
    }
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _158 = !_156;
    float _176;
    if (!_158)
    {
        float _160 = in.m_55.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_102);
        float _182 = 1.0 / _180;
        float _184 = _136 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _186 + _204;
    bool _208 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _228 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_186);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_202;
    float _242 = _240 + 1.0;
    float _244 = 1.0 / _226;
    float _246 = _238 * _242;
    float _248 = -_238;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _222;
    float _260 = _218 * _250;
    float _262 = -_218;
    float _264 = _262 + 1.0;
    float _266 = _206 * _244;
    float _268 = _190 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = fma(_254, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = fma(_276, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _278 * _260;
    float _286 = _280 * _260;
    float _288 = _282 * _260;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _302 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _304 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _306 = fma(_292, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _308 = fma(_296, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _310 = fma(_300, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _312 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _314 = fma(_306, _246, _302);
    float _316 = fma(_308, _246, _304);
    float _318 = fma(_310, _246, _312);
    float _320 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].x, _314);
    float _322 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].y, _316);
    float _324 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].z, _318);
    bool _326 = !_256;
    float _344;
    if (!_326)
    {
        float _328 = in.m_55.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_102);
        float _350 = 1.0 / _348;
        float _352 = _136 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    float _356 = in.m_57.x;
    float _358 = in.m_57.y;
    float _360 = in.m_57.z;
    float _362 = in.m_59.x;
    float _364 = in.m_59.y;
    float _366 = in.m_59.z;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _370 = _368 != 0;
    float _372 = in.m_48.x;
    float _374 = in.m_48.y;
    float _376 = in.m_48.z;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _380 = _378 != 0;
    float _382 = in.m_55.y;
    float _384 = in.m_61.y;
    float _386 = 0.0;
    if (_370)
    {
        float _388 = in.m_55.x;
        _386 = _388;
    }
    float _390 = _386;
    float _392 = _322 * _358;
    float _394 = _320 * _356;
    float _396 = _324 * _360;
    float _398 = in.m_61.x;
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _364);
    float _402 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _366);
    float _410 = _400 * _402;
    float _412 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _414 = _404 * _406;
    float _416 = _374 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _418 = _374 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _420 = _382 > 0.5;
    float _422 = _408 * _412;
    float _424 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].x, _416);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].x, _418);
    float _428 = _410 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _430 = _410 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _432 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _424);
    float _434 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].x, _428);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].x, _430);
    float _440 = _432 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _442 = _434 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[8].z, _436);
    float _446 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].z, _438);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -_384;
    float _454 = _452 + 1.0;
    float _456 = _440 + _444;
    float _458 = _442 + _446;
    float _460 = 1.0 / _450;
    float _462 = _374 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _466 = _456 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _458 + _468;
    float _472 = _384;
    float _474 = _376;
    float _476 = _364;
    float _478 = _366;
    if (_380)
    {
        float _480 = _420 ? _454 : _384;
        _472 = _480;
    }
    float _482 = _472;
    float _484 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _486 = _466 * _466;
    float _488 = _470 * _470;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    bool _496 = _364 != 0.0;
    bool _498 = isnan(_364);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    float _510 = _486 + _488;
    bool _512 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = isnan(_354);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _354 + _524;
    bool _528 = _362 == 0.0;
    bool _530 = !_504;
    bool _532 = _528 && _530;
    float _534 = sqrt(_510);
    bool _536 = _390 > 0.5;
    bool _538 = _536 && _370;
    float _540 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _542 = _366 == 0.0;
    bool _544 = _542 && _532;
    float _546 = _508 * _460;
    bool _548 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _550 = isnan(_354);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -_522;
    float _562 = _560 + 1.0;
    float _564 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].x, _540);
    float _566 = fma(_546, _526, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _484);
    float _570 = _558 * _562;
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[9].z, _564);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _576 = _570;
    float _578 = _522;
    if (!_370)
    {
        _474 = _398;
    }
    float _580 = _474;
    float _582 = _566 * _570;
    float _584 = _580;
    float _586 = _582;
    if (_370)
    {
        _576 = _398;
    }
    float _588 = _576;
    float _590 = -_558;
    float _592 = _590 + 1.0;
    bool _594 = _534 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _596 = _490;
    float _598 = _588;
    float _600 = _492;
    float _602 = _494;
    float _604 = _592;
    if (!_544)
    {
        float _606 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _490);
        _596 = _606;
    }
    float _608 = _596;
    float _610 = _568 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_538)
    {
        float _614 = -_588;
        float _616 = _614 + 1.0;
        _598 = _616;
    }
    float _618 = _598;
    float _620 = _618;
    if (!_544)
    {
        float _622 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _492);
        _600 = _622;
    }
    float _624 = _600;
    float _626 = _610 + _572;
    if (!_544)
    {
        float _628 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[17].y, _494);
        _602 = _628;
    }
    float _630 = _602;
    float _632 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    if (_370)
    {
        _584 = _618;
    }
    float _634 = _584;
    if (!_594)
    {
        _620 = _488;
    }
    float _636 = _620;
    float _638 = _636;
    if (!_594)
    {
        _586 = _486;
    }
    float _640 = _586;
    float _642 = _640;
    if (!_594)
    {
        _476 = _456;
    }
    float _644 = _476;
    float _646 = _644;
    if (!_594)
    {
        _604 = _458;
    }
    float _648 = _604;
    float _650 = _648;
    if (!_594)
    {
        _478 = _626;
    }
    float _652 = _478;
    bool _654 = !_594;
    float _656 = _652;
    if (!_654)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _662 = _534 + _660;
        float _664 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _666 = rsqrt(_510);
        float _668 = _662 * _658;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _670 * 6.283185482025146484375;
        float _674 = sin(_672);
        float _676 = _670 * 6.283185482025146484375;
        float _678 = cos(_676);
        float _680 = fma(_674, _664, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _682 = _666 * _680;
        float _684 = _678 + (-1.0);
        float _686 = fma(_466, _682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _688 = fma(_470, _682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _690 = _684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _694 = _686 + _692;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _698 = _688 + _696;
        float _700 = fma(_626, _678, _690);
        float _702 = _694 * _694;
        float _704 = _698 * _698;
        _656 = _700;
        _642 = _702;
        _638 = _704;
        _646 = _686;
        _650 = _688;
    }
    float _706 = _656;
    float _708 = _642;
    float _710 = _638;
    float _712 = _646;
    float _714 = _650;
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _718 = _706 + _716;
    float _720 = _624 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _722 = _624 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _724 = _624 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _726 = fma(_718, _718, _708);
    float _728 = _482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _730 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[8].x, _720);
    float _732 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[10].x, _724);
    float _734 = _726 + _710;
    float _736 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[9].x, _722);
    float _738 = _634 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _740 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[116].x, _632);
    float _742 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[8].z, _730);
    float _744 = sqrt(_734);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _754 = _738 * _574;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _758 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[9].z, _736);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _762 = _728 * _612;
    float _764 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _766 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _770 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _774 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].z, _732);
    out.m_65.x = _754;
    out.m_65.y = _762;
    bool _780 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _782 = isnan(_744);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _788 = _784 || _786;
    out.m_67.x = _770;
    out.m_67.y = _772;
    out.m_67.z = _774;
    out.m_69.x = _764;
    out.m_69.y = _766;
    out.m_69.z = _768;
    out.m_69.w = _776;
    out.m_71.x = _742;
    out.m_71.y = _758;
    out.m_71.z = _778;
    float _790 = _770;
    float _792 = _772;
    if (!_788)
    {
        _578 = 1.0;
    }
    float _794 = _578;
    bool _796 = !_788;
    float _798 = _794;
    if (!_796)
    {
        bool _800 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _802 = isnan(_744);
        bool _804 = _800 || _802;
        bool _806 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _808 = _804 || _806;
        if (!_808)
        {
            float _810 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _812 = _744 + _810;
            float _814 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _816 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _814;
            float _818 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _820 = _818 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _822 = 1.0 / _816;
            float _824 = _812 * _822;
            float _826 = fma(_824, _820, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _798 = _826;
            _828 = true;
        }
        else
        {
            bool _830 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _832 = isnan(_744);
            bool _834 = _830 || _832;
            bool _836 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _838 = _834 || _836;
            if (!_838)
            {
                float _840 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _842 = _744 + _840;
                float _844 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _846 = _844 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _848 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _850 = _848 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _852 = 1.0 / _846;
                float _854 = _842 * _852;
                float _856 = fma(_854, _850, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _798 = _856;
                _828 = true;
            }
            else
            {
                _798 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _828 = false;
    float _858 = _798;
    float _860 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _862 = _706 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _866 = _712 + _864;
    float _868 = fma(_862, _858, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _870 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _872 = _714 + _870;
    float _874 = fma(_866, _858, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _876 = fma(_440, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _880 = _868 + _878;
    float _882 = fma(_872, _858, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _886 = _874 + _884;
    float _888 = _880 * _880;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _892 = _882 + _890;
    float _894 = floor(_876);
    float _896 = fma(_886, _886, _888);
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _900 = fma(_892, _892, _896);
    float _902 = rsqrt(_900);
    float _904 = _902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _906 = _886 * _904;
    float _908 = _892 * _904;
    float _910 = _906 * _906;
    float _912 = _908 * _908;
    float _914 = _910 + _912;
    float _916 = sqrt(_914);
    bool _918 = _916 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _916 + _920;
    float _924 = _892;
    float _926 = _922;
    float _928 = _880;
    if (_918)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _924 = _930;
    }
    float _932 = _924;
    if (_918)
    {
        float _934 = rsqrt(_914);
        _790 = _934;
    }
    float _936 = _790;
    float _938 = _936;
    if (_918)
    {
        float _940 = _922 * _932;
        _926 = _940;
    }
    float _942 = _926;
    if (_918)
    {
        float _944 = _942 * 0.15915493667125701904296875;
        _792 = _944;
    }
    float _946 = _792;
    float _948 = _776;
    if (_918)
    {
        float _950 = _946 * 6.283185482025146484375;
        float _952 = sin(_950);
        _948 = _952;
    }
    float _954 = _948;
    float _956 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _958 = precise::max(0.0, _956);
    float _960 = _902;
    float _962 = _958;
    float _964 = _956;
    if (_918)
    {
        float _966 = _946 * 6.283185482025146484375;
        float _968 = cos(_966);
        _960 = _968;
    }
    float _970 = _960;
    float _972 = -_904;
    float _974 = -_958;
    float _976 = fma(_880, _972, _974);
    if (_918)
    {
        float _978 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _978;
    }
    float _980 = _962;
    float _982 = _954;
    float _984 = _980;
    if (_918)
    {
        float _986 = fma(_954, _980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _928 = _986;
    }
    float _988 = _928;
    float _990 = _988;
    if (!_918)
    {
        _982 = _976;
    }
    float _992 = _982;
    float _994 = _992;
    float _996 = _970;
    if (_918)
    {
        float _998 = _970 + (-1.0);
        _964 = _998;
    }
    float _1000 = _964;
    float _1002 = _1000;
    if (_918)
    {
        float _1004 = _936 * _988;
        _984 = _1004;
    }
    float _1006 = _984;
    if (!_918)
    {
        _990 = _906;
    }
    float _1008 = _990;
    float _1010 = _1008;
    if (_918)
    {
        float _1012 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1012;
    }
    float _1014 = _1002;
    float _1016 = _1014;
    if (_918)
    {
        float _1018 = _906 * _1006;
        _1010 = _1018;
    }
    float _1020 = _1010;
    if (!_918)
    {
        _938 = _908;
    }
    float _1022 = _938;
    float _1024 = _1022;
    if (_918)
    {
        float _1026 = _908 * _1006;
        _1024 = _1026;
    }
    float _1028 = _1024;
    if (_918)
    {
        float _1030 = fma(_976, _970, _1014);
        _994 = _1030;
    }
    float _1032 = _994;
    if (!_918)
    {
        _996 = _910;
    }
    float _1034 = _996;
    float _1036 = _1034;
    if (_918)
    {
        float _1038 = _1020 * _1020;
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (!_918)
    {
        _1016 = _912;
    }
    float _1042 = _1016;
    float _1044 = sqrt(_900);
    float _1046 = _1042;
    if (_918)
    {
        float _1048 = _1028 * _1028;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = fma(_1032, _1032, _1040);
    float _1054 = _868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1056 = _868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1058 = _1052 + _1050;
    float _1060 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1062 = _868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1064 = _868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = rsqrt(_1058);
    float _1068 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1054);
    float _1070 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1062);
    float _1072 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1074 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1056);
    float _1076 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1068);
    float _1078 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1070);
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1082 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1080);
    float _1084 = precise::clamp(_1082, 0.0, 1.0);
    float _1086 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1072);
    float _1088 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1090 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1092 = -_1084;
    float _1094 = _1092 + 1.0;
    float _1096 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1098 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1074);
    float _1100 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1102 = floor(_1060);
    float _1104 = _1066 * _1028;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1100);
    float _1110 = _1066 * _1020;
    float _1112 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1114 = -_894;
    float _1116 = _876 + _1114;
    float _1118 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1108);
    float _1120 = abs(_1094);
    float _1122 = log2(_1120);
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1126 = -_1112;
    float _1128 = fma(_1126, _898, 1.0);
    float _1130 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1118);
    float _1132 = _1066 * _1032;
    float _1134 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1136 = -_1124;
    float _1138 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1136);
    float _1140 = log2(_1128);
    float _1142 = -_1102;
    float _1144 = _1060 + _1142;
    float _1146 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1134);
    float _1148 = -_1104;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1138);
    float _1152 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = _1132 + 1.0;
    float _1156 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1146);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1160 = fma(_1150, -0.5, 0.5);
    float _1162 = 1.0 / _1130;
    float _1164 = fma(_1150, 0.5, 0.5);
    float _1166 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1168 = fma(_1164, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1170 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1166);
    float _1172 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1156);
    float _1174 = exp2(_1158);
    float _1176 = fma(_1164, _1168, -0.212114393711090087890625);
    float _1178 = _1140 * 0.693147182464599609375;
    float _1180 = fma(_1164, _1176, 1.570728778839111328125);
    float _1182 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1184 = sqrt(_1160);
    float _1186 = _1172 * _1162;
    float _1188 = -_1132;
    float _1190 = fma(_1174, _1154, _1188);
    float _1192 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1170);
    float _1194 = fma(_1190, 0.5, 0.5);
    float _1196 = _1192 * _1162;
    float _1198 = fma(_1186, 0.5, 0.5);
    float _1200 = _1184 * 0.636619746685028076171875;
    float _1202 = fma(_1196, -0.5, 0.5);
    float _1204 = -_1180;
    float _1206 = fma(_1200, _1204, 1.0);
    float2 _3775 = float2(_1116, _1144);
    float _1208 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3775, float2(0.0), isnan(_3775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3775, float2(0.0), isnan(_3775)), level(0.0)).x;
    float3 _3786 = float3(_1198, _1202, _1182);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3786, float3(0.0), isnan(_3786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3786, float3(0.0), isnan(_3786)), level(0.0)).x;
    float3 _3797 = float3(_1198, _1202, _1182);
    float4 _1213 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3797, float3(0.0), isnan(_3797)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3797, float3(0.0), isnan(_3797)), level(0.0)).xyzw;
    float _1215 = _1213.x;
    float _1217 = _1213.y;
    float _1219 = _1213.z;
    float _1221 = _1213.w;
    float2 _3813 = float2(_1206, _1194);
    float3 _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3813, float2(0.0), isnan(_3813)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3813, float2(0.0), isnan(_3813)), level(0.0)).xyz;
    float _1227 = _1225.x;
    float _1229 = _1225.y;
    float _1231 = _1225.z;
    float _1233 = _610 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1235 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1237 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1233);
    float _1239 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1237);
    float _1241 = _610 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1245 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1241);
    float _1247 = 1.0 / _1243;
    float _1249 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1245);
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1253 = _1251 + _1243;
    float _1255 = _1253 * _1247;
    float _1257 = _1255 * 0.5;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1261 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1259);
    float _1263 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1265 = 1.0 / _1261;
    float _1267 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1263);
    float _1269 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1271 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1269);
    float _1273 = _1271 + _1130;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1277 = _1265 * _1275;
    float _1279 = _1273 * 0.5;
    float _1281 = in.m_73.x;
    float _1283 = abs(_1277);
    float _1285 = log2(_1283);
    out.m_75.z = _1279;
    out.m_75.w = _1130;
    float _1287 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1289 = exp2(_1287);
    out.gl_Position.x = _1172;
    out.gl_Position.y = _1192;
    out.gl_Position.z = _1271;
    out.gl_Position.w = _1130;
    float _1291 = exp2(_1235);
    float _1293 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1295 = precise::clamp(_1293, 0.0, 1.0);
    bool _1297 = _1277 <= 8000.0;
    bool _1299 = isnan(_1277);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan(8000.0);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = fma(_1295, -2.0, 3.0);
    float _1311 = _1295 * _1295;
    bool _1313 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    float _1323 = _1311 * _1309;
    float _1325 = -_1323;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1323);
    float _1331 = _1172;
    float _1333 = _1327;
    float _1335 = _1235;
    if (_1321)
    {
        _1331 = 1.0;
    }
    float _1337 = _1331;
    float _1339 = _1307 * _1329;
    float _1341 = _1337;
    if (_1321)
    {
        _1333 = 1.0;
    }
    float _1343 = _1333;
    float _1345 = _1343;
    float _1347 = _1217;
    float _1349 = _1215;
    if (!_1321)
    {
        float _1351 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1353 = _1351 * 0.15915493667125701904296875;
        float _1355 = _1353 * 6.283185482025146484375;
        float _1357 = cos(_1355);
        float _1359 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1353 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = 1.0 / _1357;
        float _1369 = _1361 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = _1361 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = _1371 * _1373;
        float _1381 = 1.0 / _1379;
        float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1385 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1383;
        float _1387 = 1.0 / _1385;
        float _1389 = _1377 * _1381;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = fma(_1277, _1389, _1391);
        float _1395 = _1393 * _1387;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        _1335 = _1379;
        _1345 = _1397;
    }
    float _1399 = _1335;
    float _1401 = _1345;
    float _1403 = _1399;
    if (!_1321)
    {
        float _1405 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1407 = _1405 * 0.15915493667125701904296875;
        float _1409 = _1407 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1407 * 6.283185482025146484375;
        float _1419 = sin(_1417);
        float _1421 = 1.0 / _1411;
        float _1423 = _1415 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = _1415 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = 1.0 / _1433;
        float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1439 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1437;
        float _1441 = 1.0 / _1439;
        float _1443 = _1431 * _1435;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = fma(_1277, _1443, _1445);
        float _1449 = _1447 * _1441;
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = -_1451;
        float _1455 = _1453 + 1.0;
        _1341 = _1455;
        _1403 = _1441;
    }
    float _1457 = _1341;
    float _1459 = _1403;
    float _1461 = -_1291;
    float _1463 = _1461 + 1.0;
    float _1465 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1467 = -_1208;
    float _1469 = _1467 + 1.0;
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1473 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1475 = isnan(_1044);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1481 = _1477 || _1479;
    float _1483 = _1469 * _1465;
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = _1471 * _1210;
    float _1489 = -_1471;
    float _1491 = _1489 + 1.0;
    float _1493 = -_1485;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1497 = _1221 * _1487;
    float _1499 = _1231 * _1487;
    float _1501 = _1495 * _1281;
    float _1503 = _1221 * _1491;
    float _1505 = fma(_1227, _1497, _1215);
    float _1507 = fma(_1229, _1497, _1217);
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1511 = fma(_1221, _1499, _1219);
    float _1513 = _1401 * _1457;
    float _1515 = _1459;
    float _1517 = _1491;
    float _1519 = _1497;
    float _1521 = _1501;
    if (!_1481)
    {
        _1347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1523 = _1347;
    out.m_77.x = _1509;
    float _1525 = _1523;
    float _1527 = _1523;
    if (!_1481)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1529 = _1349;
    float _1531 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1533 = _1529;
    float _1535 = _1529;
    if (!_1481)
    {
        _1515 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1537 = _1515;
    out.m_79.x = _1505;
    out.m_79.y = _1507;
    out.m_79.z = _1511;
    out.m_79.w = _1503;
    float _1539 = _1537;
    float _1541 = _1537;
    if (!_1481)
    {
        _1517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1543 = _1517;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1481)
    {
        _1519 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _1519;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1481)
    {
        _1521 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1555 = _1521;
    bool _1557 = !_1481;
    float _1559 = _1555;
    float _1561 = _1555;
    if (!_1557)
    {
        bool _1563 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1565 = isnan(_1044);
        bool _1567 = _1563 || _1565;
        bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1571 = _1567 || _1569;
        if (!_1571)
        {
            float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1575 = _1044 + _1573;
            float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1579 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1577;
            float _1581 = 1.0 / _1579;
            float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1603 = _1575 * _1581;
            float _1605 = precise::clamp(_1603, 0.0, 1.0);
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1611 = fma(_1605, _1585, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1613 = fma(_1605, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1615 = fma(_1605, _1589, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1617 = fma(_1605, _1593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1619 = fma(_1605, _1597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1621 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1535 = _1613;
            _1553 = _1619;
            _1527 = _1611;
            _1547 = _1617;
            _1541 = _1615;
            _1561 = _1621;
            _1623 = true;
        }
        else
        {
            bool _1625 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1627 = isnan(_1044);
            bool _1629 = _1625 || _1627;
            bool _1631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1633 = _1629 || _1631;
            if (!_1633)
            {
                _1525 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1635 = _1525;
            _1527 = _1635;
            if (!_1633)
            {
                _1533 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1637 = _1533;
            _1535 = _1637;
            if (!_1633)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1639 = _1539;
            _1541 = _1639;
            if (!_1633)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1641 = _1545;
            _1547 = _1641;
            if (!_1633)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1643 = _1551;
            _1553 = _1643;
            if (!_1633)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1645 = _1559;
            bool _1647 = !_1633;
            _1561 = _1645;
            if (!_1647)
            {
                bool _1649 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1651 = isnan(_1044);
                bool _1653 = _1649 || _1651;
                bool _1655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1657 = _1653 || _1655;
                if (!_1657)
                {
                    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1661 = _1044 + _1659;
                    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1665 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1663;
                    float _1667 = 1.0 / _1665;
                    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1675 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1679 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1683 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1689 = _1661 * _1667;
                    float _1691 = precise::clamp(_1689, 0.0, 1.0);
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1697 = fma(_1691, _1671, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1699 = fma(_1691, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1701 = fma(_1691, _1675, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1703 = fma(_1691, _1679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1705 = fma(_1691, _1683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1707 = fma(_1691, _1687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1535 = _1699;
                    _1553 = _1705;
                    _1527 = _1697;
                    _1547 = _1703;
                    _1541 = _1701;
                    _1561 = _1707;
                    _1623 = true;
                }
                else
                {
                    _1535 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1527 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1623 = false;
    float _1709 = _1535;
    float _1711 = _1553;
    float _1713 = _1527;
    float _1715 = _1547;
    float _1717 = _1541;
    float _1719 = _1561;
    float _1721 = fma(_758, -0.5, 0.5);
    float _1723 = precise::clamp(_1721, 0.0, 1.0);
    float _1725 = -_1709;
    float _1727 = _1725 + _1711;
    float _1729 = _1531 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1731 = -_1713;
    float _1733 = _1731 + _1715;
    out.m_81.x = 0.0;
    float _1735 = fma(_1723, _1727, _1709);
    float _1737 = fma(_1723, _1733, _1713);
    out.m_51.x = _1729;
    float _1739 = -_1717;
    float _1741 = _1739 + _1719;
    float _1743 = _1735 * 0.586610972881317138671875;
    bool _1745 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1747 = fma(_1723, _1741, _1717);
    float _1749 = fma(_1737, 0.298911988735198974609375, _1743);
    bool _1751 = _1401 > 0.0;
    bool _1753 = isnan(_1401);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = fma(_1747, 0.114477999508380889892578125, _1749);
    bool _1763 = _1457 <= 0.0;
    bool _1765 = !_1759;
    bool _1767 = _1763 || _1765;
    float _1769 = -_1761;
    float _1771 = _1737 + _1769;
    float _1773 = -_1761;
    float _1775 = _1735 + _1773;
    float _1777 = -_1761;
    float _1779 = _1747 + _1777;
    float _1781 = fma(_1771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    float _1783 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    float _1785 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    bool _1787 = !_1745;
    if (!_1787)
    {
        float _1789 = -_868;
        float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1793 = -_874;
        float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1797 = -_882;
        float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1801 = _1791 * _1791;
        float _1803 = fma(_1795, _1795, _1801);
        float _1805 = fma(_1799, _1799, _1803);
        float _1807 = sqrt(_1805);
        float _1809 = rsqrt(_1805);
        float _1811 = -_1807;
        float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1815 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        float _1819 = _1795 * _1809;
        float _1821 = _1791 * _1809;
        float _1823 = abs(_1817);
        float _1825 = log2(_1823);
        float _1827 = _1799 * _1809;
        float _1829 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1831 = _758 * _1821;
        float _1833 = -_1821;
        float _1835 = -_1829;
        float _1837 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1835);
        float _1839 = fma(_742, _1819, _1831);
        float _1841 = -_1827;
        float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1837);
        float _1845 = fma(_778, _1827, _1839);
        float _1847 = precise::clamp(_1845, 0.0, 1.0);
        float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1851 = _1843 + _1849;
        float _1853 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1857 = precise::clamp(_1855, 0.0, 1.0);
        float _1859 = exp2(_1853);
        float _1861 = _1859 * _1857;
        float _1863 = _1847 * _1861;
        float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1869 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _1865;
        out.m_81.y = _1867;
        out.m_81.z = _1869;
    }
    out.m_83.x = _1781;
    out.m_83.y = _1783;
    out.m_83.z = _1785;
    if (!_1767)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1871 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1871;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1623 = false;
    bool _828 = false;
    bool _346 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_48.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_51.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1928 = as_type<float>(_118);
        out.gl_Position.z = _1928;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_53.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_148)
    {
        out.m_51.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1996 = as_type<float>(_154);
        out.gl_Position.z = _1996;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _158 = !_156;
    float _176;
    if (!_158)
    {
        float _160 = in.m_55.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_102);
        float _182 = 1.0 / _180;
        float _184 = _136 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _186 + _204;
    bool _208 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _228 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_186);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_202;
    float _242 = _240 + 1.0;
    float _244 = 1.0 / _226;
    float _246 = _238 * _242;
    float _248 = -_238;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _258 = 1.0 / _222;
    float _260 = _218 * _250;
    float _262 = -_218;
    float _264 = _262 + 1.0;
    float _266 = _206 * _244;
    float _268 = _190 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    float _278 = fma(_254, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = fma(_276, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = _278 * _260;
    float _286 = _280 * _260;
    float _288 = _282 * _260;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _302 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _304 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _306 = fma(_292, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _308 = fma(_296, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _310 = fma(_300, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _312 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _314 = fma(_306, _246, _302);
    float _316 = fma(_308, _246, _304);
    float _318 = fma(_310, _246, _312);
    float _320 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].x, _314);
    float _322 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].y, _316);
    float _324 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[145].z, _318);
    bool _326 = !_256;
    float _344;
    if (!_326)
    {
        float _328 = in.m_55.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_102);
        float _350 = 1.0 / _348;
        float _352 = _136 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    float _356 = in.m_57.x;
    float _358 = in.m_57.y;
    float _360 = in.m_57.z;
    float _362 = in.m_59.x;
    float _364 = in.m_59.y;
    float _366 = in.m_59.z;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _370 = _368 != 0;
    float _372 = in.m_48.x;
    float _374 = in.m_48.y;
    float _376 = in.m_48.z;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _380 = _378 != 0;
    float _382 = in.m_55.y;
    float _384 = in.m_61.y;
    float _386 = 0.0;
    if (_370)
    {
        float _388 = in.m_55.x;
        _386 = _388;
    }
    float _390 = _386;
    float _392 = _322 * _358;
    float _394 = _320 * _356;
    float _396 = _324 * _360;
    float _398 = in.m_61.x;
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _364);
    float _402 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _366);
    float _410 = _400 * _402;
    float _412 = _396 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _414 = _404 * _406;
    float _416 = _374 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _418 = _374 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _420 = _382 > 0.5;
    float _422 = _408 * _412;
    float _424 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].x, _416);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].x, _418);
    float _428 = _410 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _430 = _410 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _432 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _424);
    float _434 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _426);
    float _436 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].x, _428);
    float _438 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].x, _430);
    float _440 = _432 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _442 = _434 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _444 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[8].z, _436);
    float _446 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[10].z, _438);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = -_384;
    float _454 = _452 + 1.0;
    float _456 = _440 + _444;
    float _458 = _442 + _446;
    float _460 = 1.0 / _450;
    float _462 = _374 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _464 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _466 = _456 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _470 = _458 + _468;
    float _472 = _384;
    float _474 = _376;
    float _476 = _364;
    float _478 = _366;
    if (_380)
    {
        float _480 = _420 ? _454 : _384;
        _472 = _480;
    }
    float _482 = _472;
    float _484 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].x, _462);
    float _486 = _466 * _466;
    float _488 = _470 * _470;
    float _490 = in.m_63.x;
    float _492 = in.m_63.y;
    float _494 = in.m_63.z;
    bool _496 = _364 != 0.0;
    bool _498 = isnan(_364);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    float _510 = _486 + _488;
    bool _512 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = isnan(_354);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _354 + _524;
    bool _528 = _362 == 0.0;
    bool _530 = !_504;
    bool _532 = _528 && _530;
    float _534 = sqrt(_510);
    bool _536 = _390 > 0.5;
    bool _538 = _536 && _370;
    float _540 = _410 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _542 = _366 == 0.0;
    bool _544 = _542 && _532;
    float _546 = _508 * _460;
    bool _548 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _550 = isnan(_354);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -_522;
    float _562 = _560 + 1.0;
    float _564 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].x, _540);
    float _566 = fma(_546, _526, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _484);
    float _570 = _558 * _562;
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[9].z, _564);
    float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _576 = _570;
    float _578 = _522;
    if (!_370)
    {
        _474 = _398;
    }
    float _580 = _474;
    float _582 = _566 * _570;
    float _584 = _580;
    float _586 = _582;
    if (_370)
    {
        _576 = _398;
    }
    float _588 = _576;
    float _590 = -_558;
    float _592 = _590 + 1.0;
    bool _594 = _534 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _596 = _490;
    float _598 = _588;
    float _600 = _492;
    float _602 = _494;
    float _604 = _592;
    if (!_544)
    {
        float _606 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _490);
        _596 = _606;
    }
    float _608 = _596;
    float _610 = _568 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_538)
    {
        float _614 = -_588;
        float _616 = _614 + 1.0;
        _598 = _616;
    }
    float _618 = _598;
    float _620 = _618;
    if (!_544)
    {
        float _622 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _492);
        _600 = _622;
    }
    float _624 = _600;
    float _626 = _610 + _572;
    if (!_544)
    {
        float _628 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[17].y, _494);
        _602 = _628;
    }
    float _630 = _602;
    float _632 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    if (_370)
    {
        _584 = _618;
    }
    float _634 = _584;
    if (!_594)
    {
        _620 = _488;
    }
    float _636 = _620;
    float _638 = _636;
    if (!_594)
    {
        _586 = _486;
    }
    float _640 = _586;
    float _642 = _640;
    if (!_594)
    {
        _476 = _456;
    }
    float _644 = _476;
    float _646 = _644;
    if (!_594)
    {
        _604 = _458;
    }
    float _648 = _604;
    float _650 = _648;
    if (!_594)
    {
        _478 = _626;
    }
    float _652 = _478;
    bool _654 = !_594;
    float _656 = _652;
    if (!_654)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _662 = _534 + _660;
        float _664 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _666 = rsqrt(_510);
        float _668 = _662 * _658;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _670 * 6.283185482025146484375;
        float _674 = sin(_672);
        float _676 = _670 * 6.283185482025146484375;
        float _678 = cos(_676);
        float _680 = fma(_674, _664, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _682 = _666 * _680;
        float _684 = _678 + (-1.0);
        float _686 = fma(_466, _682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _688 = fma(_470, _682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _690 = _684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _694 = _686 + _692;
        float _696 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _698 = _688 + _696;
        float _700 = fma(_626, _678, _690);
        float _702 = _694 * _694;
        float _704 = _698 * _698;
        _656 = _700;
        _642 = _702;
        _638 = _704;
        _646 = _686;
        _650 = _688;
    }
    float _706 = _656;
    float _708 = _642;
    float _710 = _638;
    float _712 = _646;
    float _714 = _650;
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _718 = _706 + _716;
    float _720 = _624 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _722 = _624 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _724 = _624 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _726 = fma(_718, _718, _708);
    float _728 = _482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _730 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[8].x, _720);
    float _732 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[10].x, _724);
    float _734 = _726 + _710;
    float _736 = fma(_608, (*spvDescriptorSet0.vp_c10)._m0[9].x, _722);
    float _738 = _634 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _740 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[116].x, _632);
    float _742 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[8].z, _730);
    float _744 = sqrt(_734);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _754 = _738 * _574;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _758 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[9].z, _736);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _762 = _728 * _612;
    float _764 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _766 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _770 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _774 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _740 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _778 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].z, _732);
    out.m_65.x = _754;
    out.m_65.y = _762;
    bool _780 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _782 = isnan(_744);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _788 = _784 || _786;
    out.m_67.x = _770;
    out.m_67.y = _772;
    out.m_67.z = _774;
    out.m_69.x = _764;
    out.m_69.y = _766;
    out.m_69.z = _768;
    out.m_69.w = _776;
    out.m_71.x = _742;
    out.m_71.y = _758;
    out.m_71.z = _778;
    float _790 = _770;
    float _792 = _772;
    if (!_788)
    {
        _578 = 1.0;
    }
    float _794 = _578;
    bool _796 = !_788;
    float _798 = _794;
    if (!_796)
    {
        bool _800 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _802 = isnan(_744);
        bool _804 = _800 || _802;
        bool _806 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _808 = _804 || _806;
        if (!_808)
        {
            float _810 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _812 = _744 + _810;
            float _814 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _816 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _814;
            float _818 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _820 = _818 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _822 = 1.0 / _816;
            float _824 = _812 * _822;
            float _826 = fma(_824, _820, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _798 = _826;
            _828 = true;
        }
        else
        {
            bool _830 = _744 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _832 = isnan(_744);
            bool _834 = _830 || _832;
            bool _836 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _838 = _834 || _836;
            if (!_838)
            {
                float _840 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _842 = _744 + _840;
                float _844 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _846 = _844 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _848 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _850 = _848 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _852 = 1.0 / _846;
                float _854 = _842 * _852;
                float _856 = fma(_854, _850, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _798 = _856;
                _828 = true;
            }
            else
            {
                _798 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _828 = false;
    float _858 = _798;
    float _860 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _862 = _706 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _866 = _712 + _864;
    float _868 = fma(_862, _858, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _870 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _872 = _714 + _870;
    float _874 = fma(_866, _858, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _876 = fma(_440, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _880 = _868 + _878;
    float _882 = fma(_872, _858, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _886 = _874 + _884;
    float _888 = _880 * _880;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _892 = _882 + _890;
    float _894 = floor(_876);
    float _896 = fma(_886, _886, _888);
    float _898 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _900 = fma(_892, _892, _896);
    float _902 = rsqrt(_900);
    float _904 = _902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _906 = _886 * _904;
    float _908 = _892 * _904;
    float _910 = _906 * _906;
    float _912 = _908 * _908;
    float _914 = _910 + _912;
    float _916 = sqrt(_914);
    bool _918 = _916 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _916 + _920;
    float _924 = _892;
    float _926 = _922;
    float _928 = _880;
    if (_918)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _924 = _930;
    }
    float _932 = _924;
    if (_918)
    {
        float _934 = rsqrt(_914);
        _790 = _934;
    }
    float _936 = _790;
    float _938 = _936;
    if (_918)
    {
        float _940 = _922 * _932;
        _926 = _940;
    }
    float _942 = _926;
    if (_918)
    {
        float _944 = _942 * 0.15915493667125701904296875;
        _792 = _944;
    }
    float _946 = _792;
    float _948 = _776;
    if (_918)
    {
        float _950 = _946 * 6.283185482025146484375;
        float _952 = sin(_950);
        _948 = _952;
    }
    float _954 = _948;
    float _956 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _958 = precise::max(0.0, _956);
    float _960 = _902;
    float _962 = _958;
    float _964 = _956;
    if (_918)
    {
        float _966 = _946 * 6.283185482025146484375;
        float _968 = cos(_966);
        _960 = _968;
    }
    float _970 = _960;
    float _972 = -_904;
    float _974 = -_958;
    float _976 = fma(_880, _972, _974);
    if (_918)
    {
        float _978 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _962 = _978;
    }
    float _980 = _962;
    float _982 = _954;
    float _984 = _980;
    if (_918)
    {
        float _986 = fma(_954, _980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _928 = _986;
    }
    float _988 = _928;
    float _990 = _988;
    if (!_918)
    {
        _982 = _976;
    }
    float _992 = _982;
    float _994 = _992;
    float _996 = _970;
    if (_918)
    {
        float _998 = _970 + (-1.0);
        _964 = _998;
    }
    float _1000 = _964;
    float _1002 = _1000;
    if (_918)
    {
        float _1004 = _936 * _988;
        _984 = _1004;
    }
    float _1006 = _984;
    if (!_918)
    {
        _990 = _906;
    }
    float _1008 = _990;
    float _1010 = _1008;
    if (_918)
    {
        float _1012 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1012;
    }
    float _1014 = _1002;
    float _1016 = _1014;
    if (_918)
    {
        float _1018 = _906 * _1006;
        _1010 = _1018;
    }
    float _1020 = _1010;
    if (!_918)
    {
        _938 = _908;
    }
    float _1022 = _938;
    float _1024 = _1022;
    if (_918)
    {
        float _1026 = _908 * _1006;
        _1024 = _1026;
    }
    float _1028 = _1024;
    if (_918)
    {
        float _1030 = fma(_976, _970, _1014);
        _994 = _1030;
    }
    float _1032 = _994;
    if (!_918)
    {
        _996 = _910;
    }
    float _1034 = _996;
    float _1036 = _1034;
    if (_918)
    {
        float _1038 = _1020 * _1020;
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (!_918)
    {
        _1016 = _912;
    }
    float _1042 = _1016;
    float _1044 = sqrt(_900);
    float _1046 = _1042;
    if (_918)
    {
        float _1048 = _1028 * _1028;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = fma(_1032, _1032, _1040);
    float _1054 = _868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1056 = _868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1058 = _1052 + _1050;
    float _1060 = fma(_442, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1062 = _868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1064 = _868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = rsqrt(_1058);
    float _1068 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1054);
    float _1070 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1062);
    float _1072 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1074 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1056);
    float _1076 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1068);
    float _1078 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1070);
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1082 = fma(_1044, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1080);
    float _1084 = precise::clamp(_1082, 0.0, 1.0);
    float _1086 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1072);
    float _1088 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1090 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1092 = -_1084;
    float _1094 = _1092 + 1.0;
    float _1096 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1098 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1074);
    float _1100 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1102 = floor(_1060);
    float _1104 = _1066 * _1028;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1100);
    float _1110 = _1066 * _1020;
    float _1112 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1114 = -_894;
    float _1116 = _876 + _1114;
    float _1118 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1108);
    float _1120 = abs(_1094);
    float _1122 = log2(_1120);
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1126 = -_1112;
    float _1128 = fma(_1126, _898, 1.0);
    float _1130 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1118);
    float _1132 = _1066 * _1032;
    float _1134 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1136 = -_1124;
    float _1138 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1136);
    float _1140 = log2(_1128);
    float _1142 = -_1102;
    float _1144 = _1060 + _1142;
    float _1146 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1134);
    float _1148 = -_1104;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1138);
    float _1152 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1154 = _1132 + 1.0;
    float _1156 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1146);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1160 = fma(_1150, -0.5, 0.5);
    float _1162 = 1.0 / _1130;
    float _1164 = fma(_1150, 0.5, 0.5);
    float _1166 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1152);
    float _1168 = fma(_1164, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1170 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1166);
    float _1172 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1156);
    float _1174 = exp2(_1158);
    float _1176 = fma(_1164, _1168, -0.212114393711090087890625);
    float _1178 = _1140 * 0.693147182464599609375;
    float _1180 = fma(_1164, _1176, 1.570728778839111328125);
    float _1182 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1184 = sqrt(_1160);
    float _1186 = _1172 * _1162;
    float _1188 = -_1132;
    float _1190 = fma(_1174, _1154, _1188);
    float _1192 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1170);
    float _1194 = fma(_1190, 0.5, 0.5);
    float _1196 = _1192 * _1162;
    float _1198 = fma(_1186, 0.5, 0.5);
    float _1200 = _1184 * 0.636619746685028076171875;
    float _1202 = fma(_1196, -0.5, 0.5);
    float _1204 = -_1180;
    float _1206 = fma(_1200, _1204, 1.0);
    float2 _3775 = float2(_1116, _1144);
    float _1208 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3775, float2(0.0), isnan(_3775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3775, float2(0.0), isnan(_3775)), level(0.0)).x;
    float3 _3786 = float3(_1198, _1202, _1182);
    float _1210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3786, float3(0.0), isnan(_3786)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3786, float3(0.0), isnan(_3786)), level(0.0)).x;
    float3 _3797 = float3(_1198, _1202, _1182);
    float4 _1213 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3797, float3(0.0), isnan(_3797)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3797, float3(0.0), isnan(_3797)), level(0.0)).xyzw;
    float _1215 = _1213.x;
    float _1217 = _1213.y;
    float _1219 = _1213.z;
    float _1221 = _1213.w;
    float2 _3813 = float2(_1206, _1194);
    float3 _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3813, float2(0.0), isnan(_3813)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3813, float2(0.0), isnan(_3813)), level(0.0)).xyz;
    float _1227 = _1225.x;
    float _1229 = _1225.y;
    float _1231 = _1225.z;
    float _1233 = _610 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1235 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1237 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1233);
    float _1239 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1237);
    float _1241 = _610 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1245 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1241);
    float _1247 = 1.0 / _1243;
    float _1249 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1245);
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1253 = _1251 + _1243;
    float _1255 = _1253 * _1247;
    float _1257 = _1255 * 0.5;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1261 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1259);
    float _1263 = _1090 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1265 = 1.0 / _1261;
    float _1267 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1263);
    float _1269 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1267);
    float _1271 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1269);
    float _1273 = _1271 + _1130;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1277 = _1265 * _1275;
    float _1279 = _1273 * 0.5;
    float _1281 = in.m_73.x;
    float _1283 = abs(_1277);
    float _1285 = log2(_1283);
    out.m_75.z = _1279;
    out.m_75.w = _1130;
    float _1287 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1289 = exp2(_1287);
    out.gl_Position.x = _1172;
    out.gl_Position.y = _1192;
    out.gl_Position.z = _1271;
    out.gl_Position.w = _1130;
    float _1291 = exp2(_1235);
    float _1293 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1295 = precise::clamp(_1293, 0.0, 1.0);
    bool _1297 = _1277 <= 8000.0;
    bool _1299 = isnan(_1277);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan(8000.0);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = fma(_1295, -2.0, 3.0);
    float _1311 = _1295 * _1295;
    bool _1313 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.5);
    bool _1321 = _1317 || _1319;
    float _1323 = _1311 * _1309;
    float _1325 = -_1323;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1323);
    float _1331 = _1172;
    float _1333 = _1327;
    float _1335 = _1235;
    if (_1321)
    {
        _1331 = 1.0;
    }
    float _1337 = _1331;
    float _1339 = _1307 * _1329;
    float _1341 = _1337;
    if (_1321)
    {
        _1333 = 1.0;
    }
    float _1343 = _1333;
    float _1345 = _1343;
    float _1347 = _1217;
    float _1349 = _1215;
    if (!_1321)
    {
        float _1351 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1353 = _1351 * 0.15915493667125701904296875;
        float _1355 = _1353 * 6.283185482025146484375;
        float _1357 = cos(_1355);
        float _1359 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1361 = _1359 * 0.15915493667125701904296875;
        float _1363 = _1353 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = 1.0 / _1357;
        float _1369 = _1361 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = _1361 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = _1371 * _1373;
        float _1381 = 1.0 / _1379;
        float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1385 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1383;
        float _1387 = 1.0 / _1385;
        float _1389 = _1377 * _1381;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = fma(_1277, _1389, _1391);
        float _1395 = _1393 * _1387;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        _1335 = _1379;
        _1345 = _1397;
    }
    float _1399 = _1335;
    float _1401 = _1345;
    float _1403 = _1399;
    if (!_1321)
    {
        float _1405 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1407 = _1405 * 0.15915493667125701904296875;
        float _1409 = _1407 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1415 = _1413 * 0.15915493667125701904296875;
        float _1417 = _1407 * 6.283185482025146484375;
        float _1419 = sin(_1417);
        float _1421 = 1.0 / _1411;
        float _1423 = _1415 * 6.283185482025146484375;
        float _1425 = cos(_1423);
        float _1427 = _1419 * _1421;
        float _1429 = _1415 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = 1.0 / _1433;
        float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1439 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1437;
        float _1441 = 1.0 / _1439;
        float _1443 = _1431 * _1435;
        float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1447 = fma(_1277, _1443, _1445);
        float _1449 = _1447 * _1441;
        float _1451 = precise::clamp(_1449, 0.0, 1.0);
        float _1453 = -_1451;
        float _1455 = _1453 + 1.0;
        _1341 = _1455;
        _1403 = _1441;
    }
    float _1457 = _1341;
    float _1459 = _1403;
    float _1461 = -_1291;
    float _1463 = _1461 + 1.0;
    float _1465 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1467 = -_1208;
    float _1469 = _1467 + 1.0;
    float _1471 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1473 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1475 = isnan(_1044);
    bool _1477 = _1473 || _1475;
    bool _1479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1481 = _1477 || _1479;
    float _1483 = _1469 * _1465;
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = _1471 * _1210;
    float _1489 = -_1471;
    float _1491 = _1489 + 1.0;
    float _1493 = -_1485;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1497 = _1221 * _1487;
    float _1499 = _1231 * _1487;
    float _1501 = _1495 * _1281;
    float _1503 = _1221 * _1491;
    float _1505 = fma(_1227, _1497, _1215);
    float _1507 = fma(_1229, _1497, _1217);
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1511 = fma(_1221, _1499, _1219);
    float _1513 = _1401 * _1457;
    float _1515 = _1459;
    float _1517 = _1491;
    float _1519 = _1497;
    float _1521 = _1501;
    if (!_1481)
    {
        _1347 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1523 = _1347;
    out.m_77.x = _1509;
    float _1525 = _1523;
    float _1527 = _1523;
    if (!_1481)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1529 = _1349;
    float _1531 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1533 = _1529;
    float _1535 = _1529;
    if (!_1481)
    {
        _1515 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1537 = _1515;
    out.m_79.x = _1505;
    out.m_79.y = _1507;
    out.m_79.z = _1511;
    out.m_79.w = _1503;
    float _1539 = _1537;
    float _1541 = _1537;
    if (!_1481)
    {
        _1517 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1543 = _1517;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1481)
    {
        _1519 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _1519;
    float _1551 = _1549;
    float _1553 = _1549;
    if (!_1481)
    {
        _1521 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1555 = _1521;
    bool _1557 = !_1481;
    float _1559 = _1555;
    float _1561 = _1555;
    if (!_1557)
    {
        bool _1563 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1565 = isnan(_1044);
        bool _1567 = _1563 || _1565;
        bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1571 = _1567 || _1569;
        if (!_1571)
        {
            float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1575 = _1044 + _1573;
            float _1577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1579 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1577;
            float _1581 = 1.0 / _1579;
            float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1585 = _1583 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1603 = _1575 * _1581;
            float _1605 = precise::clamp(_1603, 0.0, 1.0);
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1611 = fma(_1605, _1585, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1613 = fma(_1605, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1615 = fma(_1605, _1589, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1617 = fma(_1605, _1593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1619 = fma(_1605, _1597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1621 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1535 = _1613;
            _1553 = _1619;
            _1527 = _1611;
            _1547 = _1617;
            _1541 = _1615;
            _1561 = _1621;
            _1623 = true;
        }
        else
        {
            bool _1625 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1627 = isnan(_1044);
            bool _1629 = _1625 || _1627;
            bool _1631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1633 = _1629 || _1631;
            if (!_1633)
            {
                _1525 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1635 = _1525;
            _1527 = _1635;
            if (!_1633)
            {
                _1533 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1637 = _1533;
            _1535 = _1637;
            if (!_1633)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1639 = _1539;
            _1541 = _1639;
            if (!_1633)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1641 = _1545;
            _1547 = _1641;
            if (!_1633)
            {
                _1551 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1643 = _1551;
            _1553 = _1643;
            if (!_1633)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1645 = _1559;
            bool _1647 = !_1633;
            _1561 = _1645;
            if (!_1647)
            {
                bool _1649 = _1044 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1651 = isnan(_1044);
                bool _1653 = _1649 || _1651;
                bool _1655 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1657 = _1653 || _1655;
                if (!_1657)
                {
                    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1661 = _1044 + _1659;
                    float _1663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1665 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1663;
                    float _1667 = 1.0 / _1665;
                    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1671 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1675 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1679 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1683 = _1681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1687 = _1685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1689 = _1661 * _1667;
                    float _1691 = precise::clamp(_1689, 0.0, 1.0);
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1697 = fma(_1691, _1671, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1699 = fma(_1691, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1701 = fma(_1691, _1675, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1703 = fma(_1691, _1679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1705 = fma(_1691, _1683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1707 = fma(_1691, _1687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1535 = _1699;
                    _1553 = _1705;
                    _1527 = _1697;
                    _1547 = _1703;
                    _1541 = _1701;
                    _1561 = _1707;
                    _1623 = true;
                }
                else
                {
                    _1535 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1553 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1527 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1623 = false;
    float _1709 = _1535;
    float _1711 = _1553;
    float _1713 = _1527;
    float _1715 = _1547;
    float _1717 = _1541;
    float _1719 = _1561;
    float _1721 = fma(_758, -0.5, 0.5);
    float _1723 = precise::clamp(_1721, 0.0, 1.0);
    float _1725 = -_1709;
    float _1727 = _1725 + _1711;
    float _1729 = _1531 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1731 = -_1713;
    float _1733 = _1731 + _1715;
    out.m_81.x = 0.0;
    float _1735 = fma(_1723, _1727, _1709);
    float _1737 = fma(_1723, _1733, _1713);
    out.m_51.x = _1729;
    float _1739 = -_1717;
    float _1741 = _1739 + _1719;
    float _1743 = _1735 * 0.586610972881317138671875;
    bool _1745 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1747 = fma(_1723, _1741, _1717);
    float _1749 = fma(_1737, 0.298911988735198974609375, _1743);
    bool _1751 = _1401 > 0.0;
    bool _1753 = isnan(_1401);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = fma(_1747, 0.114477999508380889892578125, _1749);
    bool _1763 = _1457 <= 0.0;
    bool _1765 = !_1759;
    bool _1767 = _1763 || _1765;
    float _1769 = -_1761;
    float _1771 = _1737 + _1769;
    float _1773 = -_1761;
    float _1775 = _1735 + _1773;
    float _1777 = -_1761;
    float _1779 = _1747 + _1777;
    float _1781 = fma(_1771, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    float _1783 = fma(_1775, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    float _1785 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1761);
    bool _1787 = !_1745;
    if (!_1787)
    {
        float _1789 = -_868;
        float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1793 = -_874;
        float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1797 = -_882;
        float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1801 = _1791 * _1791;
        float _1803 = fma(_1795, _1795, _1801);
        float _1805 = fma(_1799, _1799, _1803);
        float _1807 = sqrt(_1805);
        float _1809 = rsqrt(_1805);
        float _1811 = -_1807;
        float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1815 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        float _1819 = _1795 * _1809;
        float _1821 = _1791 * _1809;
        float _1823 = abs(_1817);
        float _1825 = log2(_1823);
        float _1827 = _1799 * _1809;
        float _1829 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1831 = _758 * _1821;
        float _1833 = -_1821;
        float _1835 = -_1829;
        float _1837 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1835);
        float _1839 = fma(_742, _1819, _1831);
        float _1841 = -_1827;
        float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1837);
        float _1845 = fma(_778, _1827, _1839);
        float _1847 = precise::clamp(_1845, 0.0, 1.0);
        float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1851 = _1843 + _1849;
        float _1853 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1857 = precise::clamp(_1855, 0.0, 1.0);
        float _1859 = exp2(_1853);
        float _1861 = _1859 * _1857;
        float _1863 = _1847 * _1861;
        float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1869 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_81.x = _1865;
        out.m_81.y = _1867;
        out.m_81.z = _1869;
    }
    out.m_83.x = _1781;
    out.m_83.y = _1783;
    out.m_83.z = _1785;
    if (!_1767)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1871 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1871;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

