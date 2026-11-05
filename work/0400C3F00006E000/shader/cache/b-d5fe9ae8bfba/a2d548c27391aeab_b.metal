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
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4626 = false;
    bool _3955 = false;
    bool _530 = false;
    bool _414 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4911 = as_type<float>(_128);
        out.gl_Position.z = _4911;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4980 = as_type<float>(_166);
        out.gl_Position.z = _4980;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _394 = _376;
    float _412;
    if (!_392)
    {
        float _396 = in.m_55.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_112);
        float _418 = 1.0 / _416;
        float _420 = _146 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    bool _424 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _426 = isnan(_422);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_422);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _422 + _456;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _466 = 1.0 / _438;
    float _468 = _450 * _462;
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = _454 * _466;
    float _476 = fma(_474, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _476 * _468;
    float _480 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[116].x, _480);
    float _490 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    out.m_59.x = _490;
    out.m_59.y = _492;
    out.m_59.z = _494;
    out.m_59.w = _496;
    float _504 = _390 * _502;
    float _506 = _388 * _500;
    float _508 = _386 * _498;
    bool _510 = !_464;
    float _528;
    if (!_510)
    {
        float _512 = in.m_55.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_112);
        float _534 = 1.0 / _532;
        float _536 = _146 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _542 = int(_540);
    float _544 = in.m_55.x;
    bool _546 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = isnan(_538);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = in.m_55.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _566 = int(_564);
    float _568 = in.m_55.z;
    float _570 = -_556;
    float _572 = _570 + 1.0;
    float _574 = in.m_61.x;
    float _576 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _578 = int(_576);
    float _580 = float(_542);
    float _582 = 0.0;
    bool _584 = _562;
    float _586 = _572;
    if (_562)
    {
        _582 = 1.0;
    }
    float _588 = _582;
    float _590 = _588;
    if (!_562)
    {
        _590 = 1.2345600128173828125;
    }
    float _592 = _590;
    if (_562)
    {
        _394 = 1.0;
    }
    float _594 = _394;
    float _596 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _598 = int(_596);
    float _600 = float(_566);
    float _602 = _594;
    if (!_562)
    {
        _602 = 7.345489978790283203125;
    }
    float _604 = _602;
    float _606 = 1.0 / _580;
    float _608 = float(_578);
    float _610 = _604 * _544;
    float _612 = 1.0 / _600;
    float _614 = float(uint(_598));
    int _616 = ~_598;
    int _618 = _616 + 1;
    int _620 = _598 + (-1);
    float _622 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _624 = int(_622);
    float _626 = _606 * _146;
    float _628 = 1.0 / _608;
    float _630 = _612 * _146;
    float _632 = _612;
    if (_562)
    {
        _632 = _544;
    }
    float _634 = _632;
    float _636 = _634;
    float _638 = _574;
    if (!_562)
    {
        _636 = _558;
    }
    float _640 = _636;
    float _642 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _644 = int(_642);
    float _646 = float(uint(_624));
    float _648 = _640 * _592;
    float _650 = 1.0 / _614;
    float _652 = _628 * _146;
    float _654 = _628;
    int _656 = _624;
    if (_562)
    {
        _654 = 1.0;
    }
    float _658 = _654;
    float _660 = _658;
    if (!_562)
    {
        _660 = 5.839270114898681640625;
    }
    float _662 = _660;
    float _664 = trunc(_626);
    int _666 = int(_664);
    float _668 = float(uint(_644));
    int _670 = ~_644;
    int _672 = _670 + 1;
    float _674 = 1.0 / _646;
    float _676 = trunc(_630);
    int _678 = int(_676);
    int _680 = as_type<int>(_650) + (-2);
    float _682 = float(uint(_666));
    float _684 = 1.0 / _668;
    float _686 = as_type<float>(_680) * _682;
    int _688 = as_type<int>(_674) + (-2);
    float _690 = _674;
    if (_562)
    {
        _690 = _544;
    }
    float _692 = _690;
    float _694 = _692;
    if (!_562)
    {
        _694 = _568;
    }
    float _696 = _694;
    float _698 = trunc(_652);
    int _700 = int(_698);
    float _702 = float(uint(_678));
    float _704 = _696 * _662;
    float _706 = as_type<float>(_688) * _702;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    float _712 = trunc(_686);
    float _714 = precise::max(_712, 0.0);
    uint _717 = uint(_714);
    int _719 = as_type<int>(_684) + (-2);
    int _721 = ~_624;
    int _723 = _721 + 1;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _727 = _725 != 0;
    float _729 = float(uint(_700));
    float _731 = trunc(_706);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    if (_710)
    {
        bool _737 = _544 > 0.5;
        _584 = _737;
    }
    bool _739 = _584;
    float _741 = as_type<float>(_719) * _729;
    float _743 = 0.0;
    if (!_710)
    {
        _743 = _574;
    }
    float _745 = _743;
    int _747 = _618 * int(_717);
    int _749 = _747 + _666;
    float _751 = floor(_610);
    float _753 = in.m_55.w;
    int _755 = 0;
    float _757 = _745;
    if (_727)
    {
        float _759 = -_574;
        float _761 = _759 + 1.0;
        _755 = as_type<int>(_761);
    }
    int _763 = _755;
    float _765 = float(uint(_749));
    float _767 = trunc(_741);
    float _769 = precise::max(_767, 0.0);
    uint _771 = uint(_769);
    int _773 = _723 * int(_735);
    int _775 = _773 + _678;
    float _777 = as_type<float>(_680) * _765;
    int _779 = as_type<int>(_765);
    float _781 = _777;
    if (_710)
    {
        float _783 = -_574;
        float _785 = _783 + 1.0;
        _779 = as_type<int>(_785);
    }
    int _787 = _779;
    float _789 = float(uint(_775));
    float _791 = trunc(_777);
    float _793 = precise::max(_791, 0.0);
    uint _795 = uint(_793);
    if (_710)
    {
        float _797 = _739 ? as_type<float>(_787) : _574;
        _757 = _797;
    }
    float _799 = _757;
    float _801 = as_type<float>(_688) * _789;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _805 = _803 != 0;
    int _807 = _672 * int(_771);
    int _809 = _807 + _700;
    float _811 = floor(_648);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _823 = _821 != 0;
    bool _825 = _568 > 0.5;
    float _827 = float(uint(_809));
    int _829 = as_type<int>(_801);
    if (!_727)
    {
        _781 = _574;
    }
    float _831 = _781;
    float _833 = trunc(_801);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _831;
    if (_727)
    {
        float _841 = _825 ? as_type<float>(_763) : _574;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = as_type<float>(_719) * _827;
    int _847 = ~_598;
    int _849 = _847 + 1;
    bool _851 = !_819;
    int _853 = _851 ? 0 : 1;
    bool _855 = _753 > 0.5;
    float _857 = trunc(_845);
    float _859 = precise::max(_857, 0.0);
    uint _861 = uint(_859);
    int _863 = int(_717) + int(_795);
    if (_805)
    {
        float _865 = -_574;
        float _867 = _865 + 1.0;
        _829 = as_type<int>(_867);
    }
    int _869 = _829;
    float _871 = -_751;
    float _873 = _610 + _871;
    float _875 = -_811;
    float _877 = _648 + _875;
    bool _879 = _558 > 0.5;
    float _881 = floor(_704);
    int _883 = _849 * _863;
    int _885 = _883 + _666;
    int _887 = int(_735) + int(_837);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _891 = _889 != 0;
    if (_805)
    {
        float _893 = _879 ? as_type<float>(_869) : _574;
        _638 = _893;
    }
    float _895 = _638;
    int _897 = int(_771) + int(_861);
    int _899 = ~_624;
    int _901 = _899 + 1;
    bool _903 = uint(_885) >= uint(_598);
    float _905 = float(_112);
    int _907 = _901 * _887;
    int _909 = _907 + _678;
    float _911 = -_881;
    float _913 = _704 + _911;
    bool _915 = !_891;
    int _917 = _915 ? 0 : 1;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _921 = _919 != 0;
    float _923 = 1.0 / _905;
    int _925 = ~_644;
    int _927 = _925 + 1;
    float _929 = float(_598);
    bool _931 = !_921;
    int _933 = _931 ? 0 : 1;
    bool _935 = uint(_909) >= uint(_624);
    float _937 = _873 * _929;
    int _939 = _927 * _897;
    int _941 = _939 + _700;
    float _943 = float(_666);
    bool _945 = !_903;
    int _947 = _945 ? 0 : (-1);
    bool _949 = !_815;
    int _951 = _949 ? 0 : 1;
    float _953 = trunc(_937);
    int _955 = int(_953);
    bool _957 = uint(_941) >= uint(_644);
    bool _959 = _943 >= _929;
    bool _961 = isnan(_943);
    bool _963 = _959 || _961;
    bool _965 = isnan(_929);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    int _971 = ~_863;
    int _973 = _971 + _947;
    int _975 = _973 + 1;
    bool _977 = !_935;
    int _979 = _977 ? 0 : (-1);
    float _981 = float(_624);
    float _983 = trunc(_969);
    int _985 = int(_983);
    float _987 = float(_678);
    int _989 = ~_887;
    int _991 = _989 + _979;
    int _993 = _991 + 1;
    bool _995 = _987 >= _981;
    bool _997 = isnan(_987);
    bool _999 = _995 || _997;
    bool _1001 = isnan(_981);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1009 = _1007 != 0;
    int _1011 = _624 * _993;
    int _1013 = _1011 + _678;
    int _1015 = abs(_917);
    bool _1017 = !_1009;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = trunc(_1005);
    int _1023 = int(_1021);
    float _1025 = _929 * _146;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1033 = _1031 != 0;
    int _1035 = ~_985;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _955 * _1015;
    int _1043 = _1041 + _666;
    float _1045 = _1025 * _923;
    bool _1047 = !_1029;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = _598 * _975;
    int _1053 = _1051 + _666;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1061 = _1059 != 0;
    bool _1063 = _598 == 0;
    float _1065 = trunc(_1045);
    int _1067 = int(_1065);
    bool _1069 = !_1033;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = !_1063;
    int _1075 = _1073 ? _1053 : (-1);
    bool _1077 = _624 == 0;
    int _1079 = abs(_853);
    int _1081 = _1075 * _1039;
    int _1083 = ~_1023;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    bool _1089 = !_1077;
    int _1091 = _1089 ? _1013 : (-1);
    int _1093 = _985 * _620;
    int _1095 = _1093 + _1081;
    int _1097 = abs(_951);
    int _1099 = _1087 * _1091;
    float _1101 = _981 * _877;
    int _1103 = _624 + (-1);
    float _1105 = _923 * _146;
    bool _1107 = !_823;
    int _1109 = _1107 ? 0 : 1;
    int _1111 = _1095 * _1079;
    int _1113 = abs(_1049);
    float _1115 = _981 * _1105;
    int _1117 = _1023 * _1103;
    int _1119 = _1117 + _1099;
    int _1121 = abs(_1109);
    int _1123 = _1067 * _1097;
    int _1125 = _1123 + _1111;
    int _1127 = abs(_1019);
    float _1129 = trunc(_1101);
    int _1131 = int(_1129);
    int _1133 = abs(_933);
    int _1135 = _1043 * _1121;
    int _1137 = _1135 + _1125;
    int _1139 = abs(_1071);
    float _1141 = in.m_61.y;
    bool _1143 = !_1057;
    int _1145 = _1143 ? 0 : 1;
    int _1147 = _955 * _1133;
    int _1149 = _1147 + _1137;
    float _1151 = trunc(_1115);
    int _1153 = int(_1151);
    float _1155 = float(uint(_1043));
    float _1157 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1159 = _1119 * _1139;
    float _1161 = as_type<float>(_680) * _1155;
    float _1163 = float(uint(_1149));
    bool _1165 = !_957;
    int _1167 = _1165 ? 0 : (-1);
    int _1169 = _1131 * _1127;
    int _1171 = _1169 + _678;
    int _1173 = abs(_1145);
    float _1175 = trunc(_1161);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = ~_897;
    int _1183 = _1181 + _1167;
    int _1185 = _1183 + 1;
    float _1187 = float(_644);
    int _1189 = _1153 * _1113;
    int _1191 = _1189 + _1159;
    float _1193 = as_type<float>(_680) * _1163;
    float _1195 = float(_700);
    float _1197 = _1187 * _913;
    int _1199 = ~_598;
    int _1201 = _1199 + 1;
    float _1203 = trunc(_1193);
    float _1205 = precise::max(_1203, 0.0);
    uint _1207 = uint(_1205);
    bool _1209 = _1195 >= _1187;
    bool _1211 = isnan(_1195);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(_1187);
    bool _1217 = _1213 || _1215;
    float _1219 = float(_1217);
    int _1221 = _1171 * _1173;
    int _1223 = _1221 + _1191;
    bool _1225 = !_1061;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = -_1141;
    float _1231 = _1229 + 1.0;
    int _1233 = _1201 * int(_1179);
    int _1235 = _1233 + _1043;
    int _1237 = ~_598;
    int _1239 = _1237 + 1;
    int _1241 = abs(_1227);
    float _1243 = trunc(_1219);
    int _1245 = int(_1243);
    float _1247 = float(uint(_1235));
    bool _1249 = _558 > 0.5;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    float _1255 = as_type<float>(_680) * _1247;
    int _1257 = _1239 * int(_1207);
    int _1259 = _1257 + _1149;
    float _1261 = trunc(_1197);
    int _1263 = int(_1261);
    int _1265 = _1249 ? as_type<int>(_1231) : as_type<int>(_1141);
    float _1267 = float(uint(_1259));
    float _1269 = _1253 ? as_type<float>(_1265) : _1141;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1273 = _1271 != 0;
    float _1275 = trunc(_1255);
    float _1277 = precise::max(_1275, 0.0);
    uint _1279 = uint(_1277);
    int _1281 = _1131 * _1241;
    int _1283 = _1281 + _1223;
    float _1285 = as_type<float>(_680) * _1267;
    int _1287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1289 = _1287 != 0;
    int _1291 = _644 * _1185;
    int _1293 = _1291 + _700;
    int _1295 = _855 ? as_type<int>(_1231) : as_type<int>(_1141);
    float _1297 = _1187 * _1105;
    float _1299 = float(uint(_1283));
    float _1301 = trunc(_1285);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1313 = _1311 != 0;
    bool _1315 = !_1289;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = as_type<float>(_688) * _1299;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1323 = _1321 != 0;
    bool _1325 = _644 == 0;
    int _1327 = ~_1245;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = trunc(_1319);
    float _1335 = precise::max(_1333, 0.0);
    uint _1337 = uint(_1335);
    bool _1339 = !_1325;
    int _1341 = _1339 ? _1293 : (-1);
    bool _1343 = !_1313;
    int _1345 = _1343 ? 0 : 1;
    bool _1347 = _568 > 0.5;
    int _1349 = _1331 * _1341;
    int _1351 = _644 + (-1);
    int _1353 = abs(_1317);
    int _1355 = abs(_1345);
    int _1357 = _1245 * _1351;
    int _1359 = _1357 + _1349;
    int _1361 = ~_624;
    int _1363 = _1361 + 1;
    int _1365 = _1263 * _1353;
    int _1367 = _1365 + _700;
    float _1369 = _1273 ? as_type<float>(_1295) : _1141;
    float _1371 = _1141;
    if (_1323)
    {
        float _1373 = _1347 ? _1231 : _1141;
        _1371 = _1373;
    }
    float _1375 = _1371;
    int _1377 = int(_1207) + int(_1305);
    int _1379 = _1359 * _1355;
    float _1381 = trunc(_1297);
    int _1383 = int(_1381);
    int _1385 = _1363 * int(_1337);
    int _1387 = _1385 + _1283;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1391 = _1389 != 0;
    bool _1393 = !_1309;
    int _1395 = _1393 ? 0 : 1;
    float _1397 = float(uint(_1387));
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1401 = _1399 != 0;
    bool _1403 = !_1391;
    int _1405 = _1403 ? 0 : 1;
    float _1407 = as_type<float>(_688) * _1397;
    int _1409 = ~_598;
    int _1411 = _1409 + 1;
    int _1413 = abs(_1395);
    float _1415 = trunc(_1407);
    float _1417 = precise::max(_1415, 0.0);
    uint _1419 = uint(_1417);
    bool _1421 = !_1401;
    int _1423 = _1421 ? 0 : 1;
    int _1425 = _1411 * _1377;
    int _1427 = _1425 + _1149;
    int _1429 = abs(_1405);
    int _1431 = _1383 * _1413;
    int _1433 = _1431 + _1379;
    int _1435 = ~_598;
    int _1437 = _1435 + 1;
    int _1439 = abs(_1423);
    int _1441 = int(_1179) + int(_1279);
    int _1443 = _1367 * _1429;
    int _1445 = _1443 + _1433;
    bool _1447 = uint(_1427) >= uint(_598);
    int _1449 = _1437 * _1441;
    int _1451 = _1449 + _1043;
    float _1453 = float(uint(_1171));
    bool _1455 = !_1447;
    int _1457 = _1455 ? 0 : (-1);
    int _1459 = _1263 * _1439;
    int _1461 = _1459 + _1445;
    bool _1463 = uint(_1451) >= uint(_598);
    float _1465 = as_type<float>(_688) * _1453;
    int _1467 = ~_1377;
    int _1469 = _1467 + _1457;
    int _1471 = _1469 + 1;
    float _1473 = float(uint(_1461));
    float _1475 = trunc(_1465);
    float _1477 = precise::max(_1475, 0.0);
    uint _1479 = uint(_1477);
    int _1481 = int(_1337) + int(_1419);
    int _1483 = _598 * _1471;
    int _1485 = _1483 + _1149;
    bool _1487 = !_1463;
    int _1489 = _1487 ? 0 : (-1);
    float _1491 = as_type<float>(_719) * _1473;
    int _1493 = ~_624;
    int _1495 = _1493 + 1;
    int _1497 = ~_1441;
    int _1499 = _1497 + _1489;
    int _1501 = _1499 + 1;
    bool _1503 = !_1063;
    int _1505 = _1503 ? _1485 : (-1);
    float _1507 = trunc(_1491);
    float _1509 = precise::max(_1507, 0.0);
    uint _1511 = uint(_1509);
    int _1513 = _1495 * _1481;
    int _1515 = _1513 + _1283;
    int _1517 = ~_624;
    int _1519 = _1517 + 1;
    int _1521 = _598 * _1501;
    int _1523 = _1521 + _1043;
    int _1525 = ~_644;
    int _1527 = _1525 + 1;
    bool _1529 = uint(_1515) >= uint(_624);
    int _1531 = _1519 * int(_1479);
    int _1533 = _1531 + _1171;
    bool _1535 = !_1529;
    int _1537 = _1535 ? 0 : (-1);
    int _1539 = _1505 & 3;
    bool _1541 = _1539 != 0;
    int _1543 = ~_1481;
    int _1545 = _1543 + _1537;
    int _1547 = _1545 + 1;
    int _1549 = _1527 * int(_1511);
    int _1551 = _1549 + _1461;
    float _1553 = float(uint(_1533));
    bool _1555 = uint(_1539) > 1u;
    int _1557 = _624 * _1547;
    int _1559 = _1557 + _1283;
    int _1561 = _1505 & 3;
    bool _1563 = _1561 != 0;
    float _1565 = as_type<float>(_688) * _1553;
    float _1567 = float(uint(_1551));
    bool _1569 = !_1077;
    int _1571 = _1569 ? _1559 : (-1);
    float _1573 = trunc(_1565);
    float _1575 = precise::max(_1573, 0.0);
    uint _1577 = uint(_1575);
    int _1579 = _1563 ? 0 : 1;
    float _1581 = as_type<float>(_719) * _1567;
    bool _1583 = !_1063;
    int _1585 = _1583 ? _1523 : (-1);
    float _1587 = float(uint(_1367));
    int _1589 = _1571 & 3;
    bool _1591 = _1589 != 0;
    float _1593 = as_type<float>(_719) * _1587;
    int _1595 = ~_1579;
    int _1597 = _1595 + 1;
    int _1599 = _1597 + 1;
    float _1601 = _544 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1603 = _1599;
    if (!_1555)
    {
        int _1605 = ~_1579;
        int _1607 = _1605 + 1;
        _1603 = _1607;
    }
    int _1609 = _1603;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1615 = _1613 != 0;
    float _1617 = trunc(_1581);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = _1591 ? 0 : 1;
    float _1625 = -_1611;
    float _1627 = fma(_1601, 2.0, _1625);
    bool _1629 = _1589 != 3;
    bool _1631 = uint(_1539) >= 2u;
    float _1633 = -_146;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1627);
    bool _1637 = !_1615;
    int _1639 = _1637 ? 0 : 1;
    float _1641 = trunc(_1593);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    bool _1647 = uint(_1589) >= 2u;
    int _1649 = _1631 ? 0 : 1;
    bool _1651 = _1539 != 3;
    int _1653 = _1647 ? 0 : 1;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1661 = _1659 != 0;
    int _1663 = int(_1479) + int(_1577);
    int _1665 = ~_624;
    int _1667 = _1665 + 1;
    float _1669 = in.m_48.x;
    float _1671 = in.m_48.y;
    float _1673 = in.m_48.z;
    int _1675 = ~_1653;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _1679;
    if (_1629)
    {
        int _1683 = ~_1653;
        int _1685 = _1683 + 1;
        _1681 = _1685;
    }
    int _1687 = _1681;
    int _1689 = ~_644;
    int _1691 = _1689 + 1;
    int _1693 = ~_1649;
    int _1695 = _1693 + 1;
    int _1697 = _1695 + 1;
    int _1699 = _1667 * _1663;
    int _1701 = _1699 + _1171;
    int _1703 = int(_1511) + int(_1621);
    int _1705 = _1691 * int(_1645);
    int _1707 = _1705 + _1367;
    int _1709 = _1697;
    int _1711 = int(_1645);
    if (_1651)
    {
        int _1713 = ~_1649;
        int _1715 = _1713 + 1;
        _1709 = _1715;
    }
    int _1717 = _1709;
    int _1719 = ~_644;
    int _1721 = _1719 + 1;
    bool _1723 = uint(_1701) >= uint(_624);
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1729 = _1721 * _1703;
    int _1731 = _1729 + _1461;
    float _1733 = float(uint(_1707));
    float _1735 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1737 = !_1723;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1743 = 1.0 / _1727;
    bool _1745 = uint(_1731) >= uint(_644);
    float _1747 = as_type<float>(_719) * _1733;
    float _1749 = _544 * 2.0;
    float _1751 = fma(_1157, -2.0, _1741);
    bool _1753 = !_1745;
    int _1755 = _1753 ? 0 : (-1);
    float _1757 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1759 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1761 = uint(_1589) > 1u;
    float _1763 = _544 + _558;
    float _1765 = floor(_1749);
    float _1767 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1735);
    float _1769 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1757);
    float _1771 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1759);
    int _1773 = ~_1663;
    int _1775 = _1773 + _1739;
    int _1777 = _1775 + 1;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1779;
    float _1783 = _1763 + (-1.0);
    float _1785 = trunc(_1747);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    int _1791 = ~_1703;
    int _1793 = _1791 + _1755;
    int _1795 = _1793 + 1;
    int _1797 = _624 * _1777;
    int _1799 = _1797 + _1171;
    float _1801 = _1781 * _1743;
    float _1803 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1805 = ~_1623;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _644 * _1795;
    int _1813 = _1811 + _1461;
    bool _1815 = !_1657;
    int _1817 = _1815 ? 0 : 1;
    float _1819 = _558 + _568;
    int _1821 = _1809;
    if (!_1761)
    {
        int _1823 = ~_1623;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    float _1829 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1767);
    bool _1831 = _644 == 0;
    float _1833 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1771);
    bool _1835 = !_1077;
    int _1837 = _1835 ? _1799 : (-1);
    float _1839 = _1829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1841 = _1539 != 3;
    float _1843 = _1819 + (-1.0);
    bool _1845 = !_1831;
    int _1847 = _1845 ? _1813 : (-1);
    float _1849 = _1833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1851 = _1765 > 0.0;
    bool _1853 = _1765 >= 0.0;
    bool _1855 = isnan(_1765);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.0);
    bool _1861 = _1857 || _1859;
    float _1863 = _558 * 2.0;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1867 = _1865 != 0;
    bool _1869 = !_1541;
    int _1871 = _1869 ? 0 : 1;
    int _1873 = _1847 & 3;
    bool _1875 = _1873 != 0;
    float _1877 = floor(_1863);
    int _1879 = int(_1645) + int(_1789);
    int _1881 = ~_644;
    int _1883 = _1881 + 1;
    int _1885 = _1571 & 3;
    bool _1887 = _1885 != 0;
    bool _1889 = !_1661;
    int _1891 = _1889 ? 0 : 1;
    int _1893 = _1883 * _1879;
    int _1895 = _1893 + _1367;
    bool _1897 = _1873 != 3;
    bool _1899 = !_1887;
    int _1901 = _1899 ? 0 : 1;
    bool _1903 = uint(_1873) > 1u;
    bool _1905 = !_1841;
    int _1907 = _1905 ? 0 : (-1);
    bool _1909 = uint(_1873) >= 2u;
    int _1911 = _1875 ? 0 : 1;
    int _1913 = _1909 ? 0 : 1;
    float _1915 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1867)
    {
        _656 = 0;
    }
    int _1917 = _656;
    bool _1919 = uint(_1895) >= uint(_644);
    int _1921 = _1917;
    if (!_1867)
    {
        _1921 = 2;
    }
    int _1923 = _1921;
    int _1925 = ~_1913;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    bool _1931 = !_1919;
    int _1933 = _1931 ? 0 : (-1);
    int _1935 = _1929;
    if (_1897)
    {
        int _1937 = ~_1913;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = ~_1911;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    bool _1949 = _1923 != 2;
    int _1951 = _1947;
    if (!_1903)
    {
        int _1953 = ~_1911;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    int _1959 = _1505 >> 31;
    bool _1961 = _1589 != 3;
    int _1963 = ~_1879;
    int _1965 = _1963 + _1933;
    int _1967 = _1965 + 1;
    int _1969 = _1847 >> 31;
    bool _1971 = _1877 > 0.0;
    int _1973 = _644 * _1967;
    int _1975 = _1973 + _1367;
    bool _1977 = _1877 >= 0.0;
    bool _1979 = isnan(_1877);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    int _1987 = _1959 & 3;
    int _1989 = _1969 & 3;
    int _1991 = _1571 >> 31;
    int _1993 = _1505 + _1987;
    int _1995 = _1847 + _1989;
    int _1997 = _1861 ? 0 : 1;
    bool _1999 = _1873 != 3;
    float _2001 = _568 * 2.0;
    int _2003 = _1991 & 3;
    int _2005 = _1993 >> 2;
    if (_1867)
    {
        _1711 = 0;
    }
    int _2007 = _1711;
    int _2009 = _1995 >> 2;
    int _2011 = _2007;
    if (!_1867)
    {
        _2011 = 1;
    }
    int _2013 = _2011;
    int _2015 = _1847 & 3;
    bool _2017 = _2015 != 0;
    int _2019 = _1571 + _2003;
    int _2021 = _2005 << 4;
    int _2023 = _2021 + 368;
    float _2025 = floor(_2001);
    int _2027 = _2009 << 4;
    int _2029 = _2027 + 656;
    bool _2031 = !_2017;
    int _2033 = _2031 ? 0 : 1;
    uint _2035 = uint(int(uint(_2023) >> uint(2)));
    uint _2037 = uint(int(uint(int(_2035)) >> uint(2)));
    int _2039 = int(_2035) & 3;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[int(_2037)][_2039];
    int _2043 = int(_2035) + 1;
    uint _2045 = uint(int(uint(_2043) >> uint(2)));
    int _2047 = _2043 & 3;
    float _2049 = (*spvDescriptorSet0.vp_c9)._m0[int(_2045)][_2047];
    bool _2051 = _644 == 0;
    bool _2053 = !_1961;
    int _2055 = _2053 ? 0 : (-1);
    bool _2057 = !_2051;
    int _2059 = _2057 ? _1975 : (-1);
    bool _2061 = !_1999;
    int _2063 = _2061 ? 0 : (-1);
    uint _2065 = uint(int(uint(_2029) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2087 = _2085 != 0;
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2091 = _2089 != 0;
    float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2095 = _538 + _2093;
    int _2097 = _2019 >> 2;
    bool _2099 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2101 = isnan(_538);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = fma(_1801, _2095, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2113 = ~_1997;
    int _2115 = _2113 + 1;
    int _2117 = _2115 + 1;
    float _2119 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1769);
    int _2121 = _2097 << 4;
    int _2123 = _2121 + 512;
    int _2125 = _2117;
    if (!_1851)
    {
        int _2127 = ~_1997;
        int _2129 = _2127 + 1;
        _2125 = _2129;
    }
    int _2131 = _2125;
    float _2133 = _2119 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2135 = !_2083;
    int _2137 = _2135 ? 0 : 1;
    uint _2139 = uint(int(uint(_2123) >> uint(2)));
    uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
    int _2143 = int(_2139) & 3;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[int(_2141)][_2143];
    int _2147 = int(_2139) + 1;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    int _2151 = _2147 & 3;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[int(_2149)][_2151];
    bool _2155 = _2025 > 0.0;
    bool _2157 = _2025 >= 0.0;
    bool _2159 = isnan(_2025);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(0.0);
    bool _2165 = _2161 || _2163;
    float _2167 = _2109 * _572;
    int _2169 = abs(_1957);
    int _2171 = _2165 ? 0 : 1;
    float _2173 = _2111 * _2167;
    float _2175 = -_2109;
    float _2177 = _2175 + 1.0;
    int _2179 = _2023 + 8;
    uint _2181 = uint(int(uint(_2179) >> uint(2)));
    uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
    int _2185 = int(_2181) & 3;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[int(_2183)][_2185];
    int _2189 = int(_2181) + 1;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    int _2193 = _2189 & 3;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[int(_2191)][_2193];
    bool _2197 = _2013 != 1;
    float _2199 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2173);
    int _2201 = ~_2171;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2209 = int(_2207);
    int _2211 = _2205;
    if (!_2155)
    {
        int _2213 = ~_2171;
        int _2215 = _2213 + 1;
        _2211 = _2215;
    }
    int _2217 = _2211;
    float _2219 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2199);
    int _2221 = _2123 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c9)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2241 = abs(_1609);
    int _2243 = abs(_1827);
    int _2245 = _2029 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = abs(_1871);
    int _2265 = ~_2241;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    int _2271 = ~_2169;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    int _2277 = ~_2263;
    int _2279 = _2277 + 1;
    int _2281 = _2279 + 1;
    int _2283 = _2269 * as_type<int>(_2049);
    int _2285 = _2275 * as_type<int>(_2079);
    int _2287 = abs(_1901);
    int _2289 = _2281 * as_type<int>(_2041);
    int _2291 = _2289 + _2283;
    int _2293 = abs(_2033);
    float _2295 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2297 = int(_2295);
    int _2299 = abs(_1717);
    int _2301 = abs(_1687);
    int _2303 = ~_2243;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = ~_2299;
    int _2311 = _2309 + 1;
    int _2313 = _2311 + 1;
    int _2315 = ~_2287;
    int _2317 = _2315 + 1;
    int _2319 = _2317 + 1;
    int _2321 = _2307 * as_type<int>(_2153);
    float _2323 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2325 = int(_2323);
    int _2327 = ~_2293;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    int _2333 = _2313 * as_type<int>(_2187);
    int _2335 = _2333 + _2291;
    int _2337 = ~_2301;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    int _2343 = _2319 * as_type<int>(_2145);
    int _2345 = _2343 + _2321;
    int _2347 = abs(_1941);
    int _2349 = _2331 * as_type<int>(_2071);
    int _2351 = _2349 + _2285;
    int _2353 = abs(_2063);
    int _2355 = ~_2347;
    int _2357 = _2355 + 1;
    int _2359 = _2357 + 1;
    int _2361 = _2341 * as_type<int>(_2229);
    int _2363 = _2361 + _2345;
    int _2365 = abs(_1907);
    int _2367 = abs(_2055);
    float _2369 = float(uint(_2209));
    int _2371 = ~_2353;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = _2359 * as_type<int>(_2253);
    int _2379 = _2377 + _2351;
    int _2381 = ~_2365;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = float(uint(_2297));
    float _2389 = 1.0 / _2369;
    int _2391 = ~_2367;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _2375 * as_type<int>(_2261);
    int _2399 = _2397 + _2379;
    int _2401 = abs(_1639);
    int _2403 = _2385 * as_type<int>(_2195);
    int _2405 = _2403 + _2335;
    int _2407 = abs(_1817);
    int _2409 = _2395 * as_type<int>(_2237);
    int _2411 = _2409 + _2363;
    int _2413 = abs(_1891);
    float _2415 = 1.0 / _2387;
    int _2417 = abs(_2209);
    int _2419 = ~_2401;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    int _2425 = ~_2407;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    float _2431 = float(uint(_2325));
    int _2433 = _2405 * _2423;
    int _2435 = ~_2413;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    int _2441 = _2429 * _2411;
    float _2443 = float(uint(_2417));
    int _2445 = abs(_2297);
    int _2447 = _2439 * _2399;
    float _2449 = 1.0 / _2431;
    int _2451 = abs(_2325);
    int _2453 = _1585 * _2401;
    int _2455 = _2453 + _2433;
    float _2457 = float(uint(_2445));
    int _2459 = _1837 * _2407;
    int _2461 = _2459 + _2441;
    int _2463 = _2059 * _2413;
    int _2465 = _2463 + _2447;
    int _2467 = as_type<int>(_2389) + (-2);
    float _2469 = 1.0 / _2443;
    float _2471 = float(uint(_2455));
    int _2473 = as_type<int>(_2415) + (-2);
    float _2475 = as_type<float>(_2467) * _2471;
    float _2477 = float(uint(_2461));
    float _2479 = 1.0 / _2457;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2483 = float(uint(_2451));
    float _2485 = as_type<float>(_2473) * _2477;
    int _2487 = abs(_2455);
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2491 = as_type<int>(_2449) + (-2);
    float _2493 = 1.0 / _2483;
    float _2495 = float(uint(_2465));
    int _2497 = as_type<int>(_2469) + (-2);
    float _2499 = float(uint(_2487));
    float _2501 = as_type<float>(_2491) * _2495;
    float _2503 = trunc(_2475);
    float _2505 = precise::max(_2503, 0.0);
    uint _2507 = uint(_2505);
    float _2509 = as_type<float>(_2497) * _2499;
    int _2511 = abs(_2461);
    float _2513 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2515 = as_type<int>(_2479) + (-2);
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2519 = float(uint(_2511));
    float _2521 = trunc(_2485);
    float _2523 = precise::max(_2521, 0.0);
    uint _2525 = uint(_2523);
    int _2527 = abs(_2465);
    float _2529 = _2513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2531 = _2529;
    if (_1949)
    {
        _586 = _544;
    }
    float _2533 = _586;
    float _2535 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2537 = _2533;
    float _2539 = _2535;
    if (!_1949)
    {
        _2537 = _568;
    }
    float _2541 = _2537;
    float _2543 = as_type<float>(_2515) * _2519;
    float _2545 = trunc(_2501);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    int _2551 = ~_2209;
    int _2553 = _2551 + 1;
    float _2555 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2557 = ~_2297;
    int _2559 = _2557 + 1;
    int _2561 = as_type<int>(_2493) + (-2);
    int _2563 = _2553 * int(_2507);
    int _2565 = _2563 + _2455;
    float _2567 = float(uint(_2527));
    float _2569 = trunc(_2509);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    int _2575 = ~_2325;
    int _2577 = _2575 + 1;
    float _2579 = -_2239;
    float _2581 = fma(_2555, 2.0, _2579);
    int _2583 = ~_2417;
    int _2585 = _2583 + 1;
    float _2587 = as_type<float>(_2561) * _2567;
    int _2589 = _2559 * int(_2525);
    int _2591 = _2589 + _2461;
    float _2593 = float(uint(_2565));
    float _2595 = -_146;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2581);
    float _2599 = trunc(_2543);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    int _2605 = _2577 * int(_2549);
    int _2607 = _2605 + _2465;
    float _2609 = float(uint(_2591));
    float _2611 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2613 = as_type<float>(_2467) * _2593;
    int _2615 = ~_2445;
    int _2617 = _2615 + 1;
    float _2619 = float(uint(_2607));
    float _2621 = trunc(_2587);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    int _2627 = _2585 * int(_2573);
    int _2629 = _2627 + _2487;
    float _2631 = as_type<float>(_2473) * _2609;
    out.m_63.x = _2529;
    out.m_63.y = _2535;
    out.m_63.z = _2489;
    out.m_63.w = _2611;
    float _2633 = as_type<float>(_2491) * _2619;
    float _2635 = float(uint(_2629));
    int _2637 = _2617 * int(_2603);
    int _2639 = _2637 + _2511;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2643 = trunc(_2631);
    float _2645 = precise::max(_2643, 0.0);
    uint _2647 = uint(_2645);
    float _2649 = as_type<float>(_2497) * _2635;
    int _2651 = ~_2451;
    int _2653 = _2651 + 1;
    float _2655 = float(uint(_2639));
    float _2657 = _2611;
    if (!_2197)
    {
        _2539 = _568;
    }
    float _2659 = _2539;
    float _2661 = trunc(_2613);
    float _2663 = precise::max(_2661, 0.0);
    uint _2665 = uint(_2663);
    float _2667 = _2659;
    if (_2197)
    {
        _2667 = _558;
    }
    float _2669 = _2667;
    float _2671 = as_type<float>(_2515) * _2655;
    if (!_2197)
    {
        _2657 = _558;
    }
    float _2673 = _2657;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2677 = abs(_2137);
    float _2679 = fma(_2669, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2641);
    int _2681 = _2653 * int(_2625);
    int _2683 = _2681 + _2527;
    float _2685 = trunc(_2633);
    float _2687 = precise::max(_2685, 0.0);
    uint _2689 = uint(_2687);
    float _2691 = _2673;
    if (!_2197)
    {
        _2531 = _2673;
    }
    float _2693 = _2531;
    float _2695 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2679);
    float _2697 = _2693;
    if (_2197)
    {
        _2691 = _544;
    }
    float _2699 = _2691;
    float _2701 = float(uint(_2683));
    int _2703 = int(_2525) + int(_2647);
    float _2705 = trunc(_2649);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    int _2711 = int(_2507) + int(_2665);
    float _2713 = as_type<float>(_2561) * _2701;
    float _2715 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2675);
    int _2717 = ~_2297;
    int _2719 = _2717 + 1;
    int _2721 = ~_2209;
    int _2723 = _2721 + 1;
    float _2725 = trunc(_2671);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    int _2731 = int(_2549) + int(_2689);
    int _2733 = _2723 * _2711;
    int _2735 = _2733 + _2455;
    float _2737 = as_type<float>(_2689);
    float _2739 = _2701;
    if (_1949)
    {
        _2737 = _558;
    }
    float _2741 = _2737;
    float _2743 = _2741;
    if (!_1949)
    {
        _2743 = _544;
    }
    float _2745 = _2743;
    float _2747 = trunc(_2713);
    float _2749 = precise::max(_2747, 0.0);
    uint _2751 = uint(_2749);
    int _2753 = _2719 * _2703;
    int _2755 = _2753 + _2461;
    int _2757 = int(_2573) + int(_2709);
    bool _2759 = uint(_2735) >= uint(_2209);
    bool _2761 = uint(_2755) >= uint(_2297);
    int _2763 = ~_2417;
    int _2765 = _2763 + 1;
    int _2767 = ~_2445;
    int _2769 = _2767 + 1;
    int _2771 = int(_2603) + int(_2729);
    int _2773 = _2765 * _2757;
    int _2775 = _2773 + _2487;
    int _2777 = ~_2325;
    int _2779 = _2777 + 1;
    int _2781 = ~_2451;
    int _2783 = _2781 + 1;
    int _2785 = int(_2625) + int(_2751);
    int _2787 = _2779 * _2731;
    int _2789 = _2787 + _2465;
    bool _2791 = !_2759;
    int _2793 = _2791 ? 0 : (-1);
    int _2795 = _2769 * _2771;
    int _2797 = _2795 + _2511;
    bool _2799 = uint(_2775) >= uint(_2417);
    int _2801 = _2783 * _2785;
    int _2803 = _2801 + _2527;
    int _2805 = _2455 ^ _2209;
    int _2807 = as_type<int>(_2745);
    float _2809 = as_type<float>(_2775);
    if (!_2197)
    {
        _2739 = _568;
    }
    float _2811 = _2739;
    bool _2813 = !_2761;
    int _2815 = _2813 ? 0 : (-1);
    float _2817 = _2811;
    if (_2197)
    {
        _2697 = _544;
    }
    float _2819 = _2697;
    if (_2197)
    {
        _2817 = _558;
    }
    float _2821 = _2817;
    bool _2823 = uint(_2797) >= uint(_2445);
    float _2825 = _2819 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2827 = uint(_2789) >= uint(_2325);
    bool _2829 = !_2799;
    int _2831 = _2829 ? 0 : (-1);
    uint _2833 = uint(int(uint(_2805) >> uint(31)));
    int _2835 = ~_2711;
    int _2837 = _2835 + _2793;
    int _2839 = _2837 + 1;
    bool _2841 = !_2827;
    int _2843 = _2841 ? 0 : (-1);
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2847 = ~_2831;
    int _2849 = _2757 + _2847;
    int _2851 = _2849 + 1;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2855 = _2133 + _2853;
    int _2857 = ~int(_2833);
    int _2859 = _2857 + 1;
    int _2861 = _2209 * _2839;
    int _2863 = _2861 + _2455;
    int _2865 = ~_2703;
    int _2867 = _2865 + _2815;
    int _2869 = _2867 + 1;
    float _2871 = _2855 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2873 = uint(_2803) >= uint(_2451);
    bool _2875 = _2209 == 0;
    int _2877 = _2297 * _2869;
    int _2879 = _2877 + _2461;
    int _2881 = ~_2731;
    int _2883 = _2881 + _2843;
    int _2885 = _2883 + 1;
    float _2887 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2889 = _1839 + _2887;
    int _2891 = _2851 ^ _2859;
    bool _2893 = !_2823;
    int _2895 = _2893 ? 0 : (-1);
    int _2897 = _2325 * _2885;
    int _2899 = _2897 + _2465;
    bool _2901 = !_2875;
    int _2903 = _2901 ? _2863 : (-1);
    float _2905 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2907 = _2209 == 0;
    float _2909 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2871);
    int _2911 = ~_2859;
    int _2913 = _2911 + _2891;
    int _2915 = _2913 + 1;
    float _2917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2919 = _1849 + _2917;
    bool _2921 = _2297 == 0;
    float _2923 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2925 = !_2907;
    int _2927 = _2925 ? _2915 : (-1);
    float _2929 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2909);
    bool _2931 = !_2921;
    int _2933 = _2931 ? _2879 : (-1);
    float _2935 = fma(_2923, _799, -0.5);
    bool _2937 = _2325 == 0;
    bool _2939 = !_2937;
    int _2941 = _2939 ? _2899 : (-1);
    bool _2943 = _2929 >= 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2947 = _2297 == 0;
    int _2949 = _2461 ^ _2297;
    float _2951 = fma(_2905, -2.0, _2945);
    float _2953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2955 = uint(int(uint(_2949) >> uint(31)));
    float _2957 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2951);
    int _2959 = ~_2895;
    int _2961 = _2771 + _2959;
    int _2963 = _2961 + 1;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2967 = ~int(_2955);
    int _2969 = _2967 + 1;
    float _2971 = _2905;
    if (_2943)
    {
        out.m_51.x = 0.0;
    }
    float _2973 = float(_2217);
    float _2975 = -_2965;
    float _2977 = fma(_2825, 2.0, _2975);
    float _2979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_2943)
    {
        _2971 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2981 = _2971;
    float _2983 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2985 = float(_2677);
    if (_2943)
    {
        float _2987 = _2981 * 5.0;
        _2807 = as_type<int>(_2987);
    }
    int _2989 = _2807;
    int _2991 = _2963 ^ _2969;
    float _2993 = _2985 * _2973;
    float _2995 = float(_2903);
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2943)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9013 = as_type<float>(_2989);
        out.gl_Position.z = _9013;
    }
    float _2999 = float(_2933);
    float _3001 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3003 = ~_2969;
    int _3005 = _3003 + _2991;
    int _3007 = _3005 + 1;
    float _3009 = fma(_2923, _2995, _1635);
    float _3011 = fma(_2983, -2.0, _2997);
    float _3013 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3015 = !_2947;
    int _3017 = _3015 ? _3007 : (-1);
    bool _3019 = _2325 == 0;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3023 = -_146;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2977);
    int _3027 = _2465 ^ _2325;
    float _3029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3031 = fma(_3013, _895, -0.5);
    float _3033 = fma(_3001, _2999, _3025);
    float _3035 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3021);
    bool _3037 = !_2873;
    int _3039 = _3037 ? 0 : (-1);
    float _3041 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2715);
    uint _3043 = uint(int(uint(_3027) >> uint(31)));
    float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3049 = float(_2941);
    float _3051 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3035);
    int _3053 = ~_3039;
    int _3055 = _2785 + _3053;
    int _3057 = _3055 + 1;
    float _3059 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3047);
    int _3061 = ~int(_3043);
    int _3063 = _3061 + 1;
    float _3065 = fma(_3001, _843, -0.5);
    float _3067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3069 = fma(_3013, _3049, _2597);
    int _3071 = _3057 ^ _3063;
    float _3073 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3059);
    float _3075 = fma(_3051, _2935, _3009);
    float _3077 = fma(_3041, _3065, _3033);
    int _3079 = ~_3063;
    int _3081 = _3079 + _3071;
    int _3083 = _3081 + 1;
    float _3085 = fma(_3073, _3031, _3069);
    float _3087 = float(_2927);
    float _3089 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3091 = log2(_3089);
    float _3093 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3095 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1751);
    float _3097 = _3029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3099 = !_3019;
    int _3101 = _3099 ? _3083 : (-1);
    float _3103 = fma(_1269, _3093, -0.5);
    float _3105 = -_3095;
    float _3107 = fma(_3093, _3087, _3105);
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3111 = float(_3017);
    float _3113 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3115 = float(_3101);
    float _3117 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3011);
    float _3119 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3109);
    float _3121 = fma(_1369, _3097, -0.5);
    float _3123 = -_2957;
    float _3125 = fma(_3097, _3111, _3123);
    float _3127 = -_3117;
    float _3129 = fma(_3113, _3115, _3127);
    float _3131 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3119);
    float _3133 = _3091 * _146;
    float _3135 = _2855 * _2855;
    float _3137 = fma(_3131, _3103, _3107);
    float _3139 = fma(_3113, _1375, -0.5);
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3143 = exp2(_3133);
    float _3145 = fma(_2695, _3121, _3125);
    float _3147 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3141);
    float _3149 = fma(_2889, _2889, _3135);
    float _3151 = in.m_65.x;
    float _3153 = in.m_65.y;
    float _3155 = in.m_65.z;
    float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3159 = 1.0 + _3157;
    float _3161 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3147);
    float _3163 = fma(_2919, _2919, _3149);
    bool _3165 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3167 = isnan(1.0);
    bool _3169 = _3165 || _3167;
    bool _3171 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3173 = _3169 || _3171;
    float _3175 = 1.0 / _3159;
    float _3177 = fma(_3161, _3139, _3129);
    bool _3179 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3181 = isnan(0.0);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3187 = _3183 || _3185;
    float _3189 = _3085 + 0.5;
    float _3191 = _2993 * (-2.0);
    float _3193 = _3177 + 0.5;
    float _3195 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3197 = -_3143;
    float _3199 = _3197 + 1.0;
    float _3201 = rsqrt(_3163);
    float _3203 = _3075 + 0.5;
    float _3205 = _3077 + 0.5;
    float _3207 = _3137 + 0.5;
    float _3209 = _3187 ? _3199 : 0.0;
    float _3211 = _3145 + 0.5;
    float _3213 = _3195 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3215 = _1985 ? 0 : 1;
    out.m_67.x = _3189;
    out.m_67.y = _3193;
    if (_3173)
    {
        float _3217 = _3209 * _3175;
        _150 = _3217;
    }
    float _3219 = _150;
    bool _3221 = !_2087;
    int _3223 = _3221 ? 0 : 1;
    float _3225 = fma(_1803, _3191, _1803);
    out.m_69.x = _3203;
    out.m_69.y = _3207;
    out.m_69.z = _3205;
    out.m_69.w = _3211;
    float _3227 = fma(_3191, _3151, _3151);
    float _3229 = _544 + (-0.5);
    int _3231 = ~_3215;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    float _3237 = _3213 * _3201;
    bool _3239 = !_2091;
    int _3241 = _3239 ? 0 : 1;
    int _3243 = abs(_3223);
    float _3245 = _2889 * _3237;
    float _3247 = _2855 * _3237;
    int _3249 = _3235;
    float _3251 = _3155;
    if (_2943)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3253 = -_3247;
    float _3255 = _2133 + _3253;
    float _3257 = -_3245;
    float _3259 = _1839 + _3257;
    float _3261 = float(_2131);
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3265 = _3255 + _3263;
    float _3267 = float(_3243);
    float _3269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3271 = _3259 + _3269;
    float _3273 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3227);
    float _3275 = _3265 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_1971)
    {
        int _3277 = ~_3215;
        int _3279 = _3277 + 1;
        _3249 = _3279;
    }
    int _3281 = _3249;
    float _3283 = _3267 * _3261;
    float _3285 = fma(_3225, _3219, _3273);
    float _3287 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3275);
    int _3289 = abs(_3241);
    float _3291 = _3283 * (-2.0);
    float _3293 = _2919 * _3237;
    float _3295 = _558 + (-0.5);
    float _3297 = float(_3281);
    float _3299 = fma(_3291, _3153, _3153);
    float _3301 = float(_3289);
    float _3303 = -_3293;
    float _3305 = _1849 + _3303;
    float _3307 = fma(_1915, _3291, _1915);
    float _3309 = fma(_3295, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3299);
    float _3311 = _544 + _568;
    float _3313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3315 = _3305 + _3313;
    float _3317 = _3301 * _3297;
    float _3319 = fma(_3307, _3219, _3309);
    float _3321 = _3311 + (-1.0);
    float _3323 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3287);
    float _3325 = _3317 * (-2.0);
    float _3327 = -_3247;
    float _3329 = _2855 + _3327;
    float _3331 = fma(_3321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3333 = _568 + (-0.5);
    float _3335 = fma(_3325, _3155, _3155);
    bool _3337 = _3323 >= 0.0;
    float _3339 = -_3245;
    float _3341 = _2889 + _3339;
    float _3343 = _3329 * _3329;
    float _3345 = fma(_3331, _3325, _3331);
    float _3347 = fma(_3333, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3335);
    float _3349 = -_3293;
    float _3351 = _2919 + _3349;
    float _3353 = fma(_3341, _3341, _3343);
    float _3355 = _3285 * 0.15915493667125701904296875;
    float _3357 = _3319 * 0.15915493667125701904296875;
    float _3359 = fma(_3345, _3219, _3347);
    float _3361 = fma(_3351, _3351, _3353);
    float _3363 = _3355 * 6.283185482025146484375;
    float _3365 = sin(_3363);
    float _3367 = _3359 * 0.15915493667125701904296875;
    if (_3337)
    {
        _3251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3369 = _3251;
    int _3371 = as_type<int>(_3369);
    if (_3337)
    {
        out.m_51.x = 0.0;
    }
    float _3373 = _3357 * 6.283185482025146484375;
    float _3375 = sin(_3373);
    if (_3337)
    {
        float _3377 = _3369 * 5.0;
        _3371 = as_type<int>(_3377);
    }
    int _3379 = _3371;
    if (_3337)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9624 = as_type<float>(_3379);
        out.gl_Position.z = _9624;
    }
    float _3381 = _3355 * 6.283185482025146484375;
    float _3383 = cos(_3381);
    float _3385 = _3357 * 6.283185482025146484375;
    float _3387 = cos(_3385);
    float _3389 = _3365 * _3375;
    float _3391 = sqrt(_3361);
    float _3393 = _3367 * 6.283185482025146484375;
    float _3395 = sin(_3393);
    if (_3337)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3397 = -_2133;
    float _3399 = _3397 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3401 = -_1839;
    float _3403 = _3401 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3405 = in.m_71.x;
    float _3407 = in.m_71.y;
    float _3409 = in.m_71.z;
    float _3411 = -_1849;
    float _3413 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3415 = _3399 * _3399;
    float _3417 = _3367 * 6.283185482025146484375;
    float _3419 = cos(_3417);
    float _3421 = _3201 * _3391;
    float _3423 = _3383 * _3387;
    float _3425 = fma(_3403, _3403, _3415);
    float _3427 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3429 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3431 = fma(_3413, _3413, _3425);
    float _3433 = fma(_3395, _3423, _3389);
    float _3435 = fma(_3395, _3389, _3423);
    float _3437 = _3383 * _3375;
    float _3439 = rsqrt(_3431);
    float _3441 = _3421 * _3429;
    float _3443 = _3365 * _3387;
    float _3445 = _3421 * _3427;
    float _3447 = _3195 * _3421;
    float _3449 = _3375 * _3419;
    float _3451 = _3365 * _3419;
    float _3453 = _3383 * _3419;
    float _3455 = _3387 * _3419;
    float _3457 = -_3437;
    float _3459 = fma(_3395, _3443, _3457);
    float _3461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3407);
    float _3463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3405);
    bool _3465 = _3407 != 0.0;
    bool _3467 = isnan(_3407);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan(0.0);
    bool _3473 = _3469 || _3471;
    float _3475 = -_3443;
    float _3477 = fma(_3395, _3437, _3475);
    float _3479 = _3441 * _3461;
    float _3481 = _3447 * _3463;
    float _3483 = _3403 * _3439;
    float _3485 = _3413 * _3439;
    float _3487 = in.m_73.x;
    float _3489 = in.m_73.y;
    float _3491 = in.m_73.z;
    float _3493 = _3399 * _3439;
    float _3495 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3497 = _3483 * _3495;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3501 = _3485 * _3499;
    float _3503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3409);
    bool _3505 = _3405 == 0.0;
    bool _3507 = !_3473;
    bool _3509 = _3505 && _3507;
    float _3511 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3513 = -_3497;
    float _3515 = fma(_3485, _3511, _3513);
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3519 = _3493 * _3517;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3523 = -_3501;
    float _3525 = fma(_3493, _3521, _3523);
    float _3527 = _3445 * _3503;
    float _3529 = _3515 * _3515;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3533 = -_3519;
    float _3535 = fma(_3483, _3531, _3533);
    bool _3537 = _3409 == 0.0;
    bool _3539 = _3537 && _3509;
    float _3541 = in.m_75.x;
    float _3543 = in.m_75.y;
    float _3545 = in.m_75.z;
    float _3547 = in.m_75.w;
    float _3549 = fma(_3525, _3525, _3529);
    float _3551 = -_3479;
    float _3553 = _3395 * _3551;
    float _3555 = _3453 * _3479;
    float _3557 = _3451 * _3479;
    float _3559 = fma(_3535, _3535, _3549);
    float _3561 = fma(_3455, _3481, _3553);
    float _3563 = fma(_3433, _3481, _3555);
    float _3565 = fma(_3459, _3481, _3557);
    float _3567 = rsqrt(_3559);
    float _3569 = fma(_3449, _3527, _3561);
    float _3571 = _3553;
    float _3573 = _3481;
    float _3575 = _3487;
    float _3577 = _3549;
    if (_3539)
    {
        _3571 = _3487;
    }
    float _3579 = _3571;
    float _3581 = _3579;
    if (_3539)
    {
        _2809 = _3491;
    }
    float _3583 = _2809;
    float _3585 = _3583;
    if (_3539)
    {
        _3573 = _3579;
    }
    float _3587 = _3573;
    float _3589 = _3587;
    if (!_3539)
    {
        _3581 = _3487;
    }
    float _3591 = _3581;
    float _3593 = fma(_3477, _3527, _3563);
    if (_3539)
    {
        _3575 = _3583;
    }
    float _3595 = _3575;
    float _3597 = _3595;
    if (!_3539)
    {
        _3585 = _3491;
    }
    float _3599 = _3585;
    float _3601 = fma(_3435, _3527, _3565);
    if (!_3539)
    {
        float _3603 = fma(_3405, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3591);
        _3589 = _3603;
    }
    float _3605 = _3589;
    float _3607 = _3515 * _3567;
    float _3609 = _3525 * _3567;
    if (!_3539)
    {
        float _3611 = fma(_3409, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3599);
        _3597 = _3611;
    }
    float _3613 = _3597;
    float _3615 = _3535 * _3567;
    float _3617 = _3485 * _3607;
    float _3619 = _3493 * _3609;
    float _3621 = _3613;
    if (_3539)
    {
        _3577 = _3489;
    }
    float _3623 = _3577;
    float _3625 = _3623;
    if (!_3539)
    {
        float _3627 = fma(_3407, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3489);
        _3625 = _3627;
    }
    float _3629 = _3625;
    float _3631 = -_3617;
    float _3633 = fma(_3493, _3615, _3631);
    float _3635 = -_3619;
    float _3637 = fma(_3483, _3607, _3635);
    float _3639 = _3545 * _3591;
    float _3641 = _3541 * _3489;
    float _3643 = _3633 * _3593;
    float _3645 = _3637 * _3593;
    float _3647 = -_3639;
    float _3649 = fma(_3541, _3599, _3647);
    float _3651 = _3543 * _3599;
    float _3653 = fma(_3609, _3569, _3643);
    float _3655 = fma(_3615, _3569, _3645);
    float _3657 = -_3641;
    float _3659 = fma(_3543, _3591, _3657);
    float _3661 = -_3651;
    float _3663 = fma(_3545, _3489, _3661);
    float _3665 = fma(_3483, _3601, _3653);
    float _3667 = fma(_3485, _3601, _3655);
    float _3669 = _3453 * _3633;
    float _3671 = _3663 * _3547;
    float _3673 = _3483 * _3615;
    float _3675 = _1839 + _3665;
    float _3677 = _1849 + _3667;
    float _3679 = _3453 * _3637;
    float _3681 = -_3673;
    float _3683 = fma(_3485, _3609, _3681);
    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3687 = _3675 + _3685;
    float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3691 = _3677 + _3689;
    float _3693 = _3649 * _3547;
    float _3695 = _3453 * _3683;
    float _3697 = _3687 * _3687;
    float _3699 = _3691 * _3691;
    float _3701 = _3659 * _3547;
    float _3703 = _3433 * _3633;
    float _3705 = _3433 * _3683;
    float _3707 = _3433 * _3637;
    float _3709 = _3697 + _3699;
    float _3711 = _3477 * _3633;
    float _3713 = _3477 * _3637;
    float _3715 = _3477 * _3683;
    float _3717 = fma(_3455, _3609, _3703);
    float _3719 = fma(_3455, _3607, _3705);
    float _3721 = fma(_3455, _3615, _3707);
    float _3723 = _3683 * _3593;
    float _3725 = sqrt(_3709);
    float _3727 = -_3395;
    float _3729 = fma(_3727, _3609, _3669);
    float _3731 = -_3395;
    float _3733 = fma(_3731, _3607, _3695);
    float _3735 = fma(_3607, _3569, _3723);
    float _3737 = -_3395;
    float _3739 = fma(_3737, _3615, _3679);
    float _3741 = fma(_3449, _3615, _3713);
    float _3743 = fma(_3449, _3609, _3711);
    float _3745 = fma(_3493, _3601, _3735);
    float _3747 = fma(_3449, _3607, _3715);
    float _3749 = fma(_3451, _3483, _3729);
    float _3751 = fma(_3451, _3493, _3733);
    float _3753 = fma(_3451, _3485, _3739);
    float _3755 = _2133 + _3745;
    float _3757 = fma(_3459, _3483, _3717);
    float _3759 = fma(_3459, _3493, _3719);
    float _3761 = fma(_3459, _3485, _3721);
    bool _3763 = _3725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3765 = fma(_3435, _3483, _3743);
    float _3767 = fma(_3435, _3493, _3747);
    float _3769 = fma(_3435, _3485, _3741);
    float _3771 = _3749 * _3543;
    float _3773 = _3751 * _3543;
    float _3775 = _3753 * _3543;
    float _3777 = _3749 * _3629;
    float _3779 = _3693 * _3749;
    float _3781 = _3751 * _3629;
    float _3783 = _3693 * _3751;
    float _3785 = _3693 * _3753;
    float _3787 = _3753 * _3629;
    float _3789 = _3693;
    float _3791 = _3697;
    float _3793 = _3699;
    float _3795 = _3675;
    float _3797 = _3677;
    float _3799 = _3701;
    if (!_3763)
    {
        _3789 = _3755;
    }
    float _3801 = _3789;
    bool _3803 = !_3763;
    float _3805 = _3801;
    if (!_3803)
    {
        float _3807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3811 = _3725 + _3809;
        float _3813 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3815 = rsqrt(_3709);
        float _3817 = _3811 * _3807;
        float _3819 = _3817 * 0.15915493667125701904296875;
        float _3821 = _3819 * 6.283185482025146484375;
        float _3823 = sin(_3821);
        float _3825 = _3819 * 6.283185482025146484375;
        float _3827 = cos(_3825);
        float _3829 = fma(_3823, _3813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3831 = _3815 * _3829;
        float _3833 = fma(_3687, _3831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3835 = _3827 + (-1.0);
        float _3837 = fma(_3691, _3831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3841 = _3833 + _3839;
        float _3843 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3847 = _3837 + _3845;
        float _3849 = _3841 * _3841;
        float _3851 = fma(_3755, _3827, _3843);
        float _3853 = _3847 * _3847;
        _3805 = _3851;
        _3791 = _3849;
        _3793 = _3853;
        _3795 = _3833;
        _3797 = _3837;
    }
    float _3855 = _3805;
    float _3857 = _3791;
    float _3859 = _3793;
    float _3861 = _3795;
    float _3863 = _3797;
    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3867 = _3855 + _3865;
    float _3869 = fma(_3757, _3541, _3771);
    float _3871 = fma(_3759, _3541, _3773);
    float _3873 = fma(_3757, _3605, _3777);
    float _3875 = fma(_3867, _3867, _3857);
    float _3877 = fma(_3759, _3605, _3781);
    float _3879 = fma(_3761, _3605, _3787);
    float _3881 = fma(_3761, _3541, _3775);
    float _3883 = _3875 + _3859;
    float _3885 = fma(_3671, _3757, _3779);
    float _3887 = fma(_3671, _3759, _3783);
    float _3889 = fma(_3671, _3761, _3785);
    float _3891 = fma(_3765, _3545, _3869);
    float _3893 = fma(_3767, _3545, _3871);
    float _3895 = sqrt(_3883);
    float _3897 = fma(_3769, _3545, _3881);
    float _3899 = fma(_3765, _3613, _3873);
    float _3901 = fma(_3701, _3765, _3885);
    float _3903 = fma(_3767, _3613, _3877);
    float _3905 = fma(_3701, _3767, _3887);
    float _3907 = fma(_3701, _3769, _3889);
    float _3909 = fma(_3769, _3613, _3879);
    out.m_77.x = _3891;
    out.m_77.y = _3893;
    out.m_77.z = _3897;
    out.m_79.x = _3901;
    out.m_79.y = _3905;
    out.m_79.z = _3907;
    out.m_81.x = _3899;
    out.m_81.y = _3903;
    out.m_81.z = _3909;
    bool _3911 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3913 = isnan(_3895);
    bool _3915 = _3911 || _3913;
    bool _3917 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3919 = _3915 || _3917;
    if (!_3919)
    {
        _3621 = 1.0;
    }
    float _3921 = _3621;
    bool _3923 = !_3919;
    float _3925 = _3921;
    if (!_3923)
    {
        bool _3927 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3929 = isnan(_3895);
        bool _3931 = _3927 || _3929;
        bool _3933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3935 = _3931 || _3933;
        if (!_3935)
        {
            float _3937 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3939 = _3895 + _3937;
            float _3941 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3943 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3941;
            float _3945 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3947 = _3945 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3949 = 1.0 / _3943;
            float _3951 = _3939 * _3949;
            float _3953 = fma(_3951, _3947, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3925 = _3953;
            _3799 = _3949;
            _3955 = true;
        }
        else
        {
            bool _3957 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3959 = isnan(_3895);
            bool _3961 = _3957 || _3959;
            bool _3963 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3965 = _3961 || _3963;
            if (!_3965)
            {
                float _3967 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3969 = _3895 + _3967;
                float _3971 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3973 = _3971 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3975 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3977 = _3975 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3979 = 1.0 / _3973;
                float _3981 = _3969 * _3979;
                float _3983 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3925 = _3983;
                _3799 = _3979;
                _3955 = true;
            }
            else
            {
                _3925 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3955 = false;
    float _3985 = _3925;
    float _3987 = _3799;
    float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3991 = _3855 + _3989;
    float _3993 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3995 = _3861 + _3993;
    float _3997 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3999 = _3863 + _3997;
    float _4001 = fma(_3991, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4003 = fma(_3995, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4005 = fma(_3999, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4007 = -_3247;
    float _4009 = _4007 + _4001;
    float _4011 = -_3245;
    float _4013 = _4011 + _4003;
    float _4015 = -_3293;
    float _4017 = _4015 + _4005;
    float _4019 = fma(_3305, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4023 = _4009 + _4021;
    float _4025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4027 = _4013 + _4025;
    float _4029 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4031 = _4017 + _4029;
    float _4033 = floor(_4019);
    float _4035 = _4023 * _4023;
    float _4037 = fma(_4027, _4027, _4035);
    float _4039 = fma(_4031, _4031, _4037);
    float _4041 = rsqrt(_4039);
    float _4043 = -_4033;
    float _4045 = _4019 + _4043;
    float _4047 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4049 = _4027 * _4047;
    float _4051 = _4031 * _4047;
    float _4053 = _4049 * _4049;
    float _4055 = _4051 * _4051;
    float _4057 = _4053 + _4055;
    float _4059 = sqrt(_4057);
    bool _4061 = _4059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4065 = _4059 + _4063;
    float _4067 = _3987;
    float _4069 = _4057;
    float _4071 = _4065;
    float _4073 = _4023;
    float _4075 = _4047;
    if (_4061)
    {
        float _4077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4067 = _4077;
    }
    float _4079 = _4067;
    if (_4061)
    {
        float _4081 = rsqrt(_4057);
        _4069 = _4081;
    }
    float _4083 = _4069;
    float _4085 = _4079;
    if (_4061)
    {
        float _4087 = _4065 * _4079;
        _4071 = _4087;
    }
    float _4089 = _4071;
    if (_4061)
    {
        float _4091 = _4089 * 0.15915493667125701904296875;
        _4085 = _4091;
    }
    float _4093 = _4085;
    float _4095 = _4031;
    float _4097 = _4093;
    if (_4061)
    {
        float _4099 = _4093 * 6.283185482025146484375;
        float _4101 = cos(_4099);
        _4095 = _4101;
    }
    float _4103 = _4095;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4107 = precise::max(0.0, _4105);
    float _4109 = _4041;
    float _4111 = _4107;
    if (_4061)
    {
        float _4113 = _4093 * 6.283185482025146484375;
        float _4115 = sin(_4113);
        _4109 = _4115;
    }
    float _4117 = _4109;
    float _4119 = -_4047;
    float _4121 = -_4107;
    float _4123 = fma(_4023, _4119, _4121);
    float _4125 = _4123;
    if (_4061)
    {
        float _4127 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4073 = _4127;
    }
    float _4129 = _4073;
    float _4131 = _4129;
    if (_4061)
    {
        float _4133 = _4103 + (-1.0);
        _4111 = _4133;
    }
    float _4135 = _4111;
    if (!_4061)
    {
        _4097 = _4049;
    }
    float _4137 = _4097;
    float _4139 = _4117;
    float _4141 = _4137;
    if (_4061)
    {
        float _4143 = fma(_4117, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4139 = _4143;
    }
    float _4145 = _4139;
    float _4147 = _4145;
    if (_4061)
    {
        float _4149 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4131 = _4149;
    }
    float _4151 = _4131;
    float _4153 = sqrt(_4039);
    float _4155 = _4151;
    if (_4061)
    {
        float _4157 = _4083 * _4145;
        _4075 = _4157;
    }
    float _4159 = _4075;
    if (_4061)
    {
        float _4161 = fma(_4123, _4103, _4151);
        _4125 = _4161;
    }
    float _4163 = _4125;
    float _4165 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4061)
    {
        float _4167 = _4049 * _4159;
        _4141 = _4167;
    }
    float _4169 = _4141;
    if (!_4061)
    {
        _4147 = _4051;
    }
    float _4171 = _4147;
    float _4173 = _4171;
    if (_4061)
    {
        float _4175 = _4051 * _4159;
        _4173 = _4175;
    }
    float _4177 = _4173;
    if (!_4061)
    {
        _4155 = _4053;
    }
    float _4179 = _4155;
    float _4181 = _4179;
    if (_4061)
    {
        float _4183 = _4169 * _4169;
        _4181 = _4183;
    }
    float _4185 = _4181;
    float _4187 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_4061)
    {
        _4165 = _4055;
    }
    float _4189 = _4165;
    float _4191 = _4189;
    if (_4061)
    {
        float _4193 = _4177 * _4177;
        _4191 = _4193;
    }
    float _4195 = _4191;
    float _4197 = fma(_4163, _4163, _4185);
    float _4199 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4201 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4203 = _4197 + _4195;
    float _4205 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4199);
    float _4207 = floor(_4187);
    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4211 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4209);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4205);
    float _4217 = -_4213;
    float _4219 = _4217 + 1.0;
    float _4221 = _4215 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4223 = rsqrt(_4203);
    float _4225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4227 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4229 = -_4227;
    float _4231 = fma(_4229, _4225, 1.0);
    float _4233 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4235 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4237 = abs(_4219);
    float _4239 = log2(_4237);
    float _4241 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4235);
    float _4243 = _4223 * _4169;
    float _4245 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4233);
    float _4247 = _4223 * _4177;
    float _4249 = _4223 * _4163;
    float _4251 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4241);
    float _4253 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4245);
    float _4255 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4201);
    float _4257 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4259 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4261 = _4253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4263 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4255);
    float _4265 = -_4257;
    float _4267 = fma(_4249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4265);
    float _4269 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4271 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4273 = _4263 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4275 = -_4247;
    float _4277 = fma(_4275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4267);
    float _4279 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4269);
    float _4281 = -_4207;
    float _4283 = _4187 + _4281;
    float _4285 = exp2(_4271);
    float _4287 = fma(_4277, -0.5, 0.5);
    float _4289 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4279);
    float _4291 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4293 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4295 = fma(_4277, 0.5, 0.5);
    float _4297 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4289);
    float _4299 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4291);
    float _4301 = log2(_4231);
    float _4303 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4293);
    float _4305 = fma(_4295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4307 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4299);
    float _4309 = _4249 + 1.0;
    float _4311 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4303);
    float _4313 = fma(_4295, _4305, -0.212114393711090087890625);
    float _4315 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4307);
    float _4317 = 1.0 / _4297;
    float _4319 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4311);
    float _4321 = -_4249;
    float _4323 = fma(_4285, _4309, _4321);
    float _4325 = fma(_4295, _4313, 1.570728778839111328125);
    float2 _11173 = float2(_4283, _4045);
    float _4327 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11173, float2(0.0), isnan(_11173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11173, float2(0.0), isnan(_11173)), level(0.0)).x;
    float _4329 = fma(_4323, 0.5, 0.5);
    float _4331 = sqrt(_4287);
    float _4333 = _4301 * 0.693147182464599609375;
    float _4335 = _4333 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4337 = _4315 * _4317;
    float _4339 = _4319 * _4317;
    float _4341 = fma(_4337, 0.5, 0.5);
    float _4343 = fma(_4339, -0.5, 0.5);
    float _4345 = _4331 * 0.636619746685028076171875;
    float3 _11208 = float3(_4341, _4343, _4335);
    float _4347 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11208, float3(0.0), isnan(_11208)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11208, float3(0.0), isnan(_11208)), level(0.0)).x;
    float _4349 = -_4325;
    float _4351 = fma(_4345, _4349, 1.0);
    float3 _11224 = float3(_4341, _4343, _4335);
    float4 _4354 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11224, float3(0.0), isnan(_11224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11224, float3(0.0), isnan(_11224)), level(0.0)).xyzw;
    float _4356 = _4354.x;
    float _4358 = _4354.y;
    float _4360 = _4354.z;
    float _4362 = _4354.w;
    float2 _11240 = float2(_4351, _4329);
    float3 _4366 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11240, float2(0.0), isnan(_11240)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11240, float2(0.0), isnan(_11240)), level(0.0)).xyz;
    float _4368 = _4366.x;
    float _4370 = _4366.y;
    float _4372 = _4366.z;
    float _4374 = _3255 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _4376 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4378 = isnan(_4153);
    bool _4380 = _4376 || _4378;
    bool _4382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4384 = _4380 || _4382;
    float _4386 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4374);
    float _4388 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4386);
    float _4390 = _3255 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4392 = _4388 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4394 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4390);
    float _4396 = 1.0 / _4392;
    float _4398 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4394);
    float _4400 = _4398 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4402 = _4400 + _4392;
    float _4404 = _4402 * _4396;
    float _4406 = _4404 * 0.5;
    float _4408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4410 = fma(_4406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4408);
    float _4412 = 1.0 / _4410;
    float _4414 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4416 = exp2(_4414);
    float _4418 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4420 = _4412 * _4418;
    float _4422 = abs(_4420);
    float _4424 = log2(_4422);
    float _4426 = -_4416;
    float _4428 = _4426 + 1.0;
    bool _4430 = _4420 <= 8000.0;
    bool _4432 = isnan(_4420);
    bool _4434 = _4430 || _4432;
    bool _4436 = isnan(8000.0);
    bool _4438 = _4434 || _4436;
    float _4440 = float(_4438);
    float _4442 = _4424 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4444 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4446 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4444);
    float _4448 = exp2(_4442);
    float _4450 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4446);
    float _4452 = fma(_4448, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4454 = precise::clamp(_4452, 0.0, 1.0);
    float _4456 = in.m_83.x;
    float _4458 = fma(_4454, -2.0, 3.0);
    float _4460 = _4454 * _4454;
    float _4462 = _4460 * _4458;
    float _4464 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4450);
    float _4466 = -_4462;
    float _4468 = _4466 + 1.0;
    float _4470 = _4464 + _4297;
    out.gl_Position.x = _4315;
    out.gl_Position.y = _4319;
    out.gl_Position.z = _4464;
    out.gl_Position.w = _4297;
    float _4472 = fma(_4468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4462);
    float _4474 = _4470 * 0.5;
    float _4476 = _4440 * _4472;
    float _4478 = _4428 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _4474;
    out.m_85.w = _4297;
    float _4480 = _4476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4482 = _4464;
    float _4484 = _4319;
    float _4486 = _4315;
    float _4488 = _4297;
    if (!_4384)
    {
        _4482 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4490 = _4482;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4384)
    {
        _4484 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4496 = _4484;
    float _4498 = -_4478;
    float _4500 = _4498 + 1.0;
    float _4502 = _4500;
    float _4504 = _4496;
    float _4506 = _4496;
    if (!_4384)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4508 = _4486;
    float _4510 = _4508;
    float _4512 = _4508;
    if (!_4384)
    {
        _4488 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4514 = _4488;
    float _4516 = -_4327;
    float _4518 = _4516 + 1.0;
    float _4520 = _4518 * _4480;
    float _4522 = precise::clamp(_4520, 0.0, 1.0);
    float _4524 = -_4522;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4528 = _4526 * _4456;
    float _4530 = _4528 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4532 = _4528;
    float _4534 = _4514;
    float _4536 = _4514;
    if (!_4384)
    {
        _4532 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4538 = _4532;
    float _4540 = _4478 * _4347;
    out.m_87.x = _4530;
    float _4542 = _4362 * _4540;
    float _4544 = _4372 * _4540;
    float _4546 = fma(_4368, _4542, _4356);
    float _4548 = fma(_4370, _4542, _4358);
    float _4550 = _4362 * _4500;
    float _4552 = fma(_4362, _4544, _4360);
    float _4554 = _4538;
    float _4556 = _4538;
    if (!_4384)
    {
        _4502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4558 = _4502;
    out.m_89.x = _4546;
    out.m_89.y = _4548;
    out.m_89.z = _4552;
    out.m_89.w = _4550;
    bool _4560 = !_4384;
    float _4562 = _4558;
    float _4564 = _4558;
    if (!_4560)
    {
        bool _4566 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4568 = isnan(_4153);
        bool _4570 = _4566 || _4568;
        bool _4572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4574 = _4570 || _4572;
        if (!_4574)
        {
            float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4578 = _4153 + _4576;
            float _4580 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4582 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4580;
            float _4584 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4586 = _4584 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4588 = 1.0 / _4582;
            float _4590 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4592 = _4590 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4594 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4596 = _4594 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4598 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4600 = _4598 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4602 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4604 = _4602 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4606 = _4578 * _4588;
            float _4608 = precise::clamp(_4606, 0.0, 1.0);
            float _4610 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4612 = _4610 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4614 = fma(_4608, _4586, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4616 = fma(_4608, _4612, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4618 = fma(_4608, _4592, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4620 = fma(_4608, _4596, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4622 = fma(_4608, _4600, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4624 = fma(_4608, _4604, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4506 = _4618;
            _4564 = _4622;
            _4494 = _4614;
            _4536 = _4620;
            _4512 = _4616;
            _4556 = _4624;
            _4626 = true;
        }
        else
        {
            bool _4628 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4630 = isnan(_4153);
            bool _4632 = _4628 || _4630;
            bool _4634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4636 = _4632 || _4634;
            if (!_4636)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4638 = _4492;
            _4494 = _4638;
            if (!_4636)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4640 = _4504;
            _4506 = _4640;
            if (!_4636)
            {
                _4510 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4642 = _4510;
            _4512 = _4642;
            if (!_4636)
            {
                _4534 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4644 = _4534;
            _4536 = _4644;
            if (!_4636)
            {
                _4562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4646 = _4562;
            _4564 = _4646;
            if (!_4636)
            {
                _4554 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4648 = _4554;
            bool _4650 = !_4636;
            _4556 = _4648;
            if (!_4650)
            {
                bool _4652 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4654 = isnan(_4153);
                bool _4656 = _4652 || _4654;
                bool _4658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4660 = _4656 || _4658;
                if (!_4660)
                {
                    float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4664 = _4153 + _4662;
                    float _4666 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4668 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4666;
                    float _4670 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4672 = _4670 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4674 = 1.0 / _4668;
                    float _4676 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4678 = _4676 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4680 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4682 = _4680 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4684 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4686 = _4684 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4688 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4690 = _4688 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4692 = _4664 * _4674;
                    float _4694 = precise::clamp(_4692, 0.0, 1.0);
                    float _4696 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4698 = _4696 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4700 = fma(_4694, _4672, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4702 = fma(_4694, _4698, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4704 = fma(_4694, _4678, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4706 = fma(_4694, _4682, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4708 = fma(_4694, _4686, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4710 = fma(_4694, _4690, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4506 = _4704;
                    _4564 = _4708;
                    _4494 = _4700;
                    _4536 = _4706;
                    _4512 = _4702;
                    _4556 = _4710;
                    _4626 = true;
                }
                else
                {
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4536 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4512 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4556 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4626 = false;
    float _4712 = _4506;
    float _4714 = _4564;
    float _4716 = _4494;
    float _4718 = _4536;
    float _4720 = _4512;
    float _4722 = _4556;
    float _4724 = fma(_3903, -0.5, 0.5);
    float _4726 = precise::clamp(_4724, 0.0, 1.0);
    float _4728 = -_4712;
    float _4730 = _4728 + _4714;
    float _4732 = -_4716;
    float _4734 = _4732 + _4718;
    float _4736 = -_4720;
    float _4738 = _4736 + _4722;
    bool _4740 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4742 = fma(_4726, _4730, _4712);
    float _4744 = fma(_4726, _4734, _4716);
    float _4746 = fma(_4726, _4738, _4720);
    float _4748 = _4742 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _4750 = fma(_4744, 0.298911988735198974609375, _4748);
    float _4752 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4754 = fma(_4746, 0.114477999508380889892578125, _4750);
    out.m_87.w = _4752;
    float _4756 = -_4754;
    float _4758 = _4744 + _4756;
    float _4760 = -_4754;
    float _4762 = _4742 + _4760;
    float _4764 = -_4754;
    float _4766 = _4746 + _4764;
    out.m_91.x = 0.0;
    float _4768 = fma(_4758, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    float _4770 = fma(_4762, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    float _4772 = fma(_4766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    out.m_93.x = _4768;
    out.m_93.y = _4770;
    out.m_93.z = _4772;
    if (!_4740)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4774 = -_4009;
    float _4776 = _4774 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4778 = -_4013;
    float _4780 = _4778 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4782 = -_4017;
    float _4784 = _4782 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4786 = _4776 * _4776;
    float _4788 = fma(_4780, _4780, _4786);
    float _4790 = fma(_4784, _4784, _4788);
    float _4792 = sqrt(_4790);
    float _4794 = rsqrt(_4790);
    float _4796 = -_4792;
    float _4798 = _4796 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4800 = _4798 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4802 = precise::clamp(_4800, 0.0, 1.0);
    float _4804 = _4780 * _4794;
    float _4806 = _4776 * _4794;
    float _4808 = abs(_4802);
    float _4810 = log2(_4808);
    float _4812 = _4784 * _4794;
    float _4814 = _4804 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4816 = _3903 * _4806;
    float _4818 = -_4806;
    float _4820 = -_4814;
    float _4822 = fma(_4818, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4820);
    float _4824 = fma(_3899, _4804, _4816);
    float _4826 = -_4812;
    float _4828 = fma(_4826, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4822);
    float _4830 = fma(_3909, _4812, _4824);
    float _4832 = precise::clamp(_4830, 0.0, 1.0);
    float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4836 = _4828 + _4834;
    float _4838 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4840 = _4836 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4842 = precise::clamp(_4840, 0.0, 1.0);
    float _4844 = exp2(_4838);
    float _4846 = _4844 * _4842;
    float _4848 = _4832 * _4846;
    float _4850 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4852 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4854 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4850;
    out.m_91.y = _4852;
    out.m_91.z = _4854;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4626 = false;
    bool _3955 = false;
    bool _530 = false;
    bool _414 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4911 = as_type<float>(_128);
        out.gl_Position.z = _4911;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4980 = as_type<float>(_166);
        out.gl_Position.z = _4980;
    }
    if (_160)
    {
        return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _394 = _376;
    float _412;
    if (!_392)
    {
        float _396 = in.m_55.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_112);
        float _418 = 1.0 / _416;
        float _420 = _146 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    bool _424 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _426 = isnan(_422);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_422);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _422 + _456;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _466 = 1.0 / _438;
    float _468 = _450 * _462;
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = _454 * _466;
    float _476 = fma(_474, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _476 * _468;
    float _480 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[116].x, _480);
    float _490 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    out.m_59.x = _490;
    out.m_59.y = _492;
    out.m_59.z = _494;
    out.m_59.w = _496;
    float _504 = _390 * _502;
    float _506 = _388 * _500;
    float _508 = _386 * _498;
    bool _510 = !_464;
    float _528;
    if (!_510)
    {
        float _512 = in.m_55.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_112);
        float _534 = 1.0 / _532;
        float _536 = _146 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _542 = int(_540);
    float _544 = in.m_55.x;
    bool _546 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = isnan(_538);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = in.m_55.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _566 = int(_564);
    float _568 = in.m_55.z;
    float _570 = -_556;
    float _572 = _570 + 1.0;
    float _574 = in.m_61.x;
    float _576 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _578 = int(_576);
    float _580 = float(_542);
    float _582 = 0.0;
    bool _584 = _562;
    float _586 = _572;
    if (_562)
    {
        _582 = 1.0;
    }
    float _588 = _582;
    float _590 = _588;
    if (!_562)
    {
        _590 = 1.2345600128173828125;
    }
    float _592 = _590;
    if (_562)
    {
        _394 = 1.0;
    }
    float _594 = _394;
    float _596 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _598 = int(_596);
    float _600 = float(_566);
    float _602 = _594;
    if (!_562)
    {
        _602 = 7.345489978790283203125;
    }
    float _604 = _602;
    float _606 = 1.0 / _580;
    float _608 = float(_578);
    float _610 = _604 * _544;
    float _612 = 1.0 / _600;
    float _614 = float(uint(_598));
    int _616 = ~_598;
    int _618 = _616 + 1;
    int _620 = _598 + (-1);
    float _622 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _624 = int(_622);
    float _626 = _606 * _146;
    float _628 = 1.0 / _608;
    float _630 = _612 * _146;
    float _632 = _612;
    if (_562)
    {
        _632 = _544;
    }
    float _634 = _632;
    float _636 = _634;
    float _638 = _574;
    if (!_562)
    {
        _636 = _558;
    }
    float _640 = _636;
    float _642 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _644 = int(_642);
    float _646 = float(uint(_624));
    float _648 = _640 * _592;
    float _650 = 1.0 / _614;
    float _652 = _628 * _146;
    float _654 = _628;
    int _656 = _624;
    if (_562)
    {
        _654 = 1.0;
    }
    float _658 = _654;
    float _660 = _658;
    if (!_562)
    {
        _660 = 5.839270114898681640625;
    }
    float _662 = _660;
    float _664 = trunc(_626);
    int _666 = int(_664);
    float _668 = float(uint(_644));
    int _670 = ~_644;
    int _672 = _670 + 1;
    float _674 = 1.0 / _646;
    float _676 = trunc(_630);
    int _678 = int(_676);
    int _680 = as_type<int>(_650) + (-2);
    float _682 = float(uint(_666));
    float _684 = 1.0 / _668;
    float _686 = as_type<float>(_680) * _682;
    int _688 = as_type<int>(_674) + (-2);
    float _690 = _674;
    if (_562)
    {
        _690 = _544;
    }
    float _692 = _690;
    float _694 = _692;
    if (!_562)
    {
        _694 = _568;
    }
    float _696 = _694;
    float _698 = trunc(_652);
    int _700 = int(_698);
    float _702 = float(uint(_678));
    float _704 = _696 * _662;
    float _706 = as_type<float>(_688) * _702;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    float _712 = trunc(_686);
    float _714 = precise::max(_712, 0.0);
    uint _717 = uint(_714);
    int _719 = as_type<int>(_684) + (-2);
    int _721 = ~_624;
    int _723 = _721 + 1;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _727 = _725 != 0;
    float _729 = float(uint(_700));
    float _731 = trunc(_706);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    if (_710)
    {
        bool _737 = _544 > 0.5;
        _584 = _737;
    }
    bool _739 = _584;
    float _741 = as_type<float>(_719) * _729;
    float _743 = 0.0;
    if (!_710)
    {
        _743 = _574;
    }
    float _745 = _743;
    int _747 = _618 * int(_717);
    int _749 = _747 + _666;
    float _751 = floor(_610);
    float _753 = in.m_55.w;
    int _755 = 0;
    float _757 = _745;
    if (_727)
    {
        float _759 = -_574;
        float _761 = _759 + 1.0;
        _755 = as_type<int>(_761);
    }
    int _763 = _755;
    float _765 = float(uint(_749));
    float _767 = trunc(_741);
    float _769 = precise::max(_767, 0.0);
    uint _771 = uint(_769);
    int _773 = _723 * int(_735);
    int _775 = _773 + _678;
    float _777 = as_type<float>(_680) * _765;
    int _779 = as_type<int>(_765);
    float _781 = _777;
    if (_710)
    {
        float _783 = -_574;
        float _785 = _783 + 1.0;
        _779 = as_type<int>(_785);
    }
    int _787 = _779;
    float _789 = float(uint(_775));
    float _791 = trunc(_777);
    float _793 = precise::max(_791, 0.0);
    uint _795 = uint(_793);
    if (_710)
    {
        float _797 = _739 ? as_type<float>(_787) : _574;
        _757 = _797;
    }
    float _799 = _757;
    float _801 = as_type<float>(_688) * _789;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _805 = _803 != 0;
    int _807 = _672 * int(_771);
    int _809 = _807 + _700;
    float _811 = floor(_648);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _823 = _821 != 0;
    bool _825 = _568 > 0.5;
    float _827 = float(uint(_809));
    int _829 = as_type<int>(_801);
    if (!_727)
    {
        _781 = _574;
    }
    float _831 = _781;
    float _833 = trunc(_801);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _831;
    if (_727)
    {
        float _841 = _825 ? as_type<float>(_763) : _574;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = as_type<float>(_719) * _827;
    int _847 = ~_598;
    int _849 = _847 + 1;
    bool _851 = !_819;
    int _853 = _851 ? 0 : 1;
    bool _855 = _753 > 0.5;
    float _857 = trunc(_845);
    float _859 = precise::max(_857, 0.0);
    uint _861 = uint(_859);
    int _863 = int(_717) + int(_795);
    if (_805)
    {
        float _865 = -_574;
        float _867 = _865 + 1.0;
        _829 = as_type<int>(_867);
    }
    int _869 = _829;
    float _871 = -_751;
    float _873 = _610 + _871;
    float _875 = -_811;
    float _877 = _648 + _875;
    bool _879 = _558 > 0.5;
    float _881 = floor(_704);
    int _883 = _849 * _863;
    int _885 = _883 + _666;
    int _887 = int(_735) + int(_837);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _891 = _889 != 0;
    if (_805)
    {
        float _893 = _879 ? as_type<float>(_869) : _574;
        _638 = _893;
    }
    float _895 = _638;
    int _897 = int(_771) + int(_861);
    int _899 = ~_624;
    int _901 = _899 + 1;
    bool _903 = uint(_885) >= uint(_598);
    float _905 = float(_112);
    int _907 = _901 * _887;
    int _909 = _907 + _678;
    float _911 = -_881;
    float _913 = _704 + _911;
    bool _915 = !_891;
    int _917 = _915 ? 0 : 1;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _921 = _919 != 0;
    float _923 = 1.0 / _905;
    int _925 = ~_644;
    int _927 = _925 + 1;
    float _929 = float(_598);
    bool _931 = !_921;
    int _933 = _931 ? 0 : 1;
    bool _935 = uint(_909) >= uint(_624);
    float _937 = _873 * _929;
    int _939 = _927 * _897;
    int _941 = _939 + _700;
    float _943 = float(_666);
    bool _945 = !_903;
    int _947 = _945 ? 0 : (-1);
    bool _949 = !_815;
    int _951 = _949 ? 0 : 1;
    float _953 = trunc(_937);
    int _955 = int(_953);
    bool _957 = uint(_941) >= uint(_644);
    bool _959 = _943 >= _929;
    bool _961 = isnan(_943);
    bool _963 = _959 || _961;
    bool _965 = isnan(_929);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    int _971 = ~_863;
    int _973 = _971 + _947;
    int _975 = _973 + 1;
    bool _977 = !_935;
    int _979 = _977 ? 0 : (-1);
    float _981 = float(_624);
    float _983 = trunc(_969);
    int _985 = int(_983);
    float _987 = float(_678);
    int _989 = ~_887;
    int _991 = _989 + _979;
    int _993 = _991 + 1;
    bool _995 = _987 >= _981;
    bool _997 = isnan(_987);
    bool _999 = _995 || _997;
    bool _1001 = isnan(_981);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1009 = _1007 != 0;
    int _1011 = _624 * _993;
    int _1013 = _1011 + _678;
    int _1015 = abs(_917);
    bool _1017 = !_1009;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = trunc(_1005);
    int _1023 = int(_1021);
    float _1025 = _929 * _146;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1033 = _1031 != 0;
    int _1035 = ~_985;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _955 * _1015;
    int _1043 = _1041 + _666;
    float _1045 = _1025 * _923;
    bool _1047 = !_1029;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = _598 * _975;
    int _1053 = _1051 + _666;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1061 = _1059 != 0;
    bool _1063 = _598 == 0;
    float _1065 = trunc(_1045);
    int _1067 = int(_1065);
    bool _1069 = !_1033;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = !_1063;
    int _1075 = _1073 ? _1053 : (-1);
    bool _1077 = _624 == 0;
    int _1079 = abs(_853);
    int _1081 = _1075 * _1039;
    int _1083 = ~_1023;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    bool _1089 = !_1077;
    int _1091 = _1089 ? _1013 : (-1);
    int _1093 = _985 * _620;
    int _1095 = _1093 + _1081;
    int _1097 = abs(_951);
    int _1099 = _1087 * _1091;
    float _1101 = _981 * _877;
    int _1103 = _624 + (-1);
    float _1105 = _923 * _146;
    bool _1107 = !_823;
    int _1109 = _1107 ? 0 : 1;
    int _1111 = _1095 * _1079;
    int _1113 = abs(_1049);
    float _1115 = _981 * _1105;
    int _1117 = _1023 * _1103;
    int _1119 = _1117 + _1099;
    int _1121 = abs(_1109);
    int _1123 = _1067 * _1097;
    int _1125 = _1123 + _1111;
    int _1127 = abs(_1019);
    float _1129 = trunc(_1101);
    int _1131 = int(_1129);
    int _1133 = abs(_933);
    int _1135 = _1043 * _1121;
    int _1137 = _1135 + _1125;
    int _1139 = abs(_1071);
    float _1141 = in.m_61.y;
    bool _1143 = !_1057;
    int _1145 = _1143 ? 0 : 1;
    int _1147 = _955 * _1133;
    int _1149 = _1147 + _1137;
    float _1151 = trunc(_1115);
    int _1153 = int(_1151);
    float _1155 = float(uint(_1043));
    float _1157 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1159 = _1119 * _1139;
    float _1161 = as_type<float>(_680) * _1155;
    float _1163 = float(uint(_1149));
    bool _1165 = !_957;
    int _1167 = _1165 ? 0 : (-1);
    int _1169 = _1131 * _1127;
    int _1171 = _1169 + _678;
    int _1173 = abs(_1145);
    float _1175 = trunc(_1161);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = ~_897;
    int _1183 = _1181 + _1167;
    int _1185 = _1183 + 1;
    float _1187 = float(_644);
    int _1189 = _1153 * _1113;
    int _1191 = _1189 + _1159;
    float _1193 = as_type<float>(_680) * _1163;
    float _1195 = float(_700);
    float _1197 = _1187 * _913;
    int _1199 = ~_598;
    int _1201 = _1199 + 1;
    float _1203 = trunc(_1193);
    float _1205 = precise::max(_1203, 0.0);
    uint _1207 = uint(_1205);
    bool _1209 = _1195 >= _1187;
    bool _1211 = isnan(_1195);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(_1187);
    bool _1217 = _1213 || _1215;
    float _1219 = float(_1217);
    int _1221 = _1171 * _1173;
    int _1223 = _1221 + _1191;
    bool _1225 = !_1061;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = -_1141;
    float _1231 = _1229 + 1.0;
    int _1233 = _1201 * int(_1179);
    int _1235 = _1233 + _1043;
    int _1237 = ~_598;
    int _1239 = _1237 + 1;
    int _1241 = abs(_1227);
    float _1243 = trunc(_1219);
    int _1245 = int(_1243);
    float _1247 = float(uint(_1235));
    bool _1249 = _558 > 0.5;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    float _1255 = as_type<float>(_680) * _1247;
    int _1257 = _1239 * int(_1207);
    int _1259 = _1257 + _1149;
    float _1261 = trunc(_1197);
    int _1263 = int(_1261);
    int _1265 = _1249 ? as_type<int>(_1231) : as_type<int>(_1141);
    float _1267 = float(uint(_1259));
    float _1269 = _1253 ? as_type<float>(_1265) : _1141;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1273 = _1271 != 0;
    float _1275 = trunc(_1255);
    float _1277 = precise::max(_1275, 0.0);
    uint _1279 = uint(_1277);
    int _1281 = _1131 * _1241;
    int _1283 = _1281 + _1223;
    float _1285 = as_type<float>(_680) * _1267;
    int _1287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1289 = _1287 != 0;
    int _1291 = _644 * _1185;
    int _1293 = _1291 + _700;
    int _1295 = _855 ? as_type<int>(_1231) : as_type<int>(_1141);
    float _1297 = _1187 * _1105;
    float _1299 = float(uint(_1283));
    float _1301 = trunc(_1285);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1313 = _1311 != 0;
    bool _1315 = !_1289;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = as_type<float>(_688) * _1299;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1323 = _1321 != 0;
    bool _1325 = _644 == 0;
    int _1327 = ~_1245;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = trunc(_1319);
    float _1335 = precise::max(_1333, 0.0);
    uint _1337 = uint(_1335);
    bool _1339 = !_1325;
    int _1341 = _1339 ? _1293 : (-1);
    bool _1343 = !_1313;
    int _1345 = _1343 ? 0 : 1;
    bool _1347 = _568 > 0.5;
    int _1349 = _1331 * _1341;
    int _1351 = _644 + (-1);
    int _1353 = abs(_1317);
    int _1355 = abs(_1345);
    int _1357 = _1245 * _1351;
    int _1359 = _1357 + _1349;
    int _1361 = ~_624;
    int _1363 = _1361 + 1;
    int _1365 = _1263 * _1353;
    int _1367 = _1365 + _700;
    float _1369 = _1273 ? as_type<float>(_1295) : _1141;
    float _1371 = _1141;
    if (_1323)
    {
        float _1373 = _1347 ? _1231 : _1141;
        _1371 = _1373;
    }
    float _1375 = _1371;
    int _1377 = int(_1207) + int(_1305);
    int _1379 = _1359 * _1355;
    float _1381 = trunc(_1297);
    int _1383 = int(_1381);
    int _1385 = _1363 * int(_1337);
    int _1387 = _1385 + _1283;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1391 = _1389 != 0;
    bool _1393 = !_1309;
    int _1395 = _1393 ? 0 : 1;
    float _1397 = float(uint(_1387));
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1401 = _1399 != 0;
    bool _1403 = !_1391;
    int _1405 = _1403 ? 0 : 1;
    float _1407 = as_type<float>(_688) * _1397;
    int _1409 = ~_598;
    int _1411 = _1409 + 1;
    int _1413 = abs(_1395);
    float _1415 = trunc(_1407);
    float _1417 = precise::max(_1415, 0.0);
    uint _1419 = uint(_1417);
    bool _1421 = !_1401;
    int _1423 = _1421 ? 0 : 1;
    int _1425 = _1411 * _1377;
    int _1427 = _1425 + _1149;
    int _1429 = abs(_1405);
    int _1431 = _1383 * _1413;
    int _1433 = _1431 + _1379;
    int _1435 = ~_598;
    int _1437 = _1435 + 1;
    int _1439 = abs(_1423);
    int _1441 = int(_1179) + int(_1279);
    int _1443 = _1367 * _1429;
    int _1445 = _1443 + _1433;
    bool _1447 = uint(_1427) >= uint(_598);
    int _1449 = _1437 * _1441;
    int _1451 = _1449 + _1043;
    float _1453 = float(uint(_1171));
    bool _1455 = !_1447;
    int _1457 = _1455 ? 0 : (-1);
    int _1459 = _1263 * _1439;
    int _1461 = _1459 + _1445;
    bool _1463 = uint(_1451) >= uint(_598);
    float _1465 = as_type<float>(_688) * _1453;
    int _1467 = ~_1377;
    int _1469 = _1467 + _1457;
    int _1471 = _1469 + 1;
    float _1473 = float(uint(_1461));
    float _1475 = trunc(_1465);
    float _1477 = precise::max(_1475, 0.0);
    uint _1479 = uint(_1477);
    int _1481 = int(_1337) + int(_1419);
    int _1483 = _598 * _1471;
    int _1485 = _1483 + _1149;
    bool _1487 = !_1463;
    int _1489 = _1487 ? 0 : (-1);
    float _1491 = as_type<float>(_719) * _1473;
    int _1493 = ~_624;
    int _1495 = _1493 + 1;
    int _1497 = ~_1441;
    int _1499 = _1497 + _1489;
    int _1501 = _1499 + 1;
    bool _1503 = !_1063;
    int _1505 = _1503 ? _1485 : (-1);
    float _1507 = trunc(_1491);
    float _1509 = precise::max(_1507, 0.0);
    uint _1511 = uint(_1509);
    int _1513 = _1495 * _1481;
    int _1515 = _1513 + _1283;
    int _1517 = ~_624;
    int _1519 = _1517 + 1;
    int _1521 = _598 * _1501;
    int _1523 = _1521 + _1043;
    int _1525 = ~_644;
    int _1527 = _1525 + 1;
    bool _1529 = uint(_1515) >= uint(_624);
    int _1531 = _1519 * int(_1479);
    int _1533 = _1531 + _1171;
    bool _1535 = !_1529;
    int _1537 = _1535 ? 0 : (-1);
    int _1539 = _1505 & 3;
    bool _1541 = _1539 != 0;
    int _1543 = ~_1481;
    int _1545 = _1543 + _1537;
    int _1547 = _1545 + 1;
    int _1549 = _1527 * int(_1511);
    int _1551 = _1549 + _1461;
    float _1553 = float(uint(_1533));
    bool _1555 = uint(_1539) > 1u;
    int _1557 = _624 * _1547;
    int _1559 = _1557 + _1283;
    int _1561 = _1505 & 3;
    bool _1563 = _1561 != 0;
    float _1565 = as_type<float>(_688) * _1553;
    float _1567 = float(uint(_1551));
    bool _1569 = !_1077;
    int _1571 = _1569 ? _1559 : (-1);
    float _1573 = trunc(_1565);
    float _1575 = precise::max(_1573, 0.0);
    uint _1577 = uint(_1575);
    int _1579 = _1563 ? 0 : 1;
    float _1581 = as_type<float>(_719) * _1567;
    bool _1583 = !_1063;
    int _1585 = _1583 ? _1523 : (-1);
    float _1587 = float(uint(_1367));
    int _1589 = _1571 & 3;
    bool _1591 = _1589 != 0;
    float _1593 = as_type<float>(_719) * _1587;
    int _1595 = ~_1579;
    int _1597 = _1595 + 1;
    int _1599 = _1597 + 1;
    float _1601 = _544 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1603 = _1599;
    if (!_1555)
    {
        int _1605 = ~_1579;
        int _1607 = _1605 + 1;
        _1603 = _1607;
    }
    int _1609 = _1603;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1615 = _1613 != 0;
    float _1617 = trunc(_1581);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = _1591 ? 0 : 1;
    float _1625 = -_1611;
    float _1627 = fma(_1601, 2.0, _1625);
    bool _1629 = _1589 != 3;
    bool _1631 = uint(_1539) >= 2u;
    float _1633 = -_146;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1627);
    bool _1637 = !_1615;
    int _1639 = _1637 ? 0 : 1;
    float _1641 = trunc(_1593);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    bool _1647 = uint(_1589) >= 2u;
    int _1649 = _1631 ? 0 : 1;
    bool _1651 = _1539 != 3;
    int _1653 = _1647 ? 0 : 1;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1661 = _1659 != 0;
    int _1663 = int(_1479) + int(_1577);
    int _1665 = ~_624;
    int _1667 = _1665 + 1;
    float _1669 = in.m_48.x;
    float _1671 = in.m_48.y;
    float _1673 = in.m_48.z;
    int _1675 = ~_1653;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _1679;
    if (_1629)
    {
        int _1683 = ~_1653;
        int _1685 = _1683 + 1;
        _1681 = _1685;
    }
    int _1687 = _1681;
    int _1689 = ~_644;
    int _1691 = _1689 + 1;
    int _1693 = ~_1649;
    int _1695 = _1693 + 1;
    int _1697 = _1695 + 1;
    int _1699 = _1667 * _1663;
    int _1701 = _1699 + _1171;
    int _1703 = int(_1511) + int(_1621);
    int _1705 = _1691 * int(_1645);
    int _1707 = _1705 + _1367;
    int _1709 = _1697;
    int _1711 = int(_1645);
    if (_1651)
    {
        int _1713 = ~_1649;
        int _1715 = _1713 + 1;
        _1709 = _1715;
    }
    int _1717 = _1709;
    int _1719 = ~_644;
    int _1721 = _1719 + 1;
    bool _1723 = uint(_1701) >= uint(_624);
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1729 = _1721 * _1703;
    int _1731 = _1729 + _1461;
    float _1733 = float(uint(_1707));
    float _1735 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1737 = !_1723;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1743 = 1.0 / _1727;
    bool _1745 = uint(_1731) >= uint(_644);
    float _1747 = as_type<float>(_719) * _1733;
    float _1749 = _544 * 2.0;
    float _1751 = fma(_1157, -2.0, _1741);
    bool _1753 = !_1745;
    int _1755 = _1753 ? 0 : (-1);
    float _1757 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1759 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1761 = uint(_1589) > 1u;
    float _1763 = _544 + _558;
    float _1765 = floor(_1749);
    float _1767 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1735);
    float _1769 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1757);
    float _1771 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1759);
    int _1773 = ~_1663;
    int _1775 = _1773 + _1739;
    int _1777 = _1775 + 1;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1779;
    float _1783 = _1763 + (-1.0);
    float _1785 = trunc(_1747);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    int _1791 = ~_1703;
    int _1793 = _1791 + _1755;
    int _1795 = _1793 + 1;
    int _1797 = _624 * _1777;
    int _1799 = _1797 + _1171;
    float _1801 = _1781 * _1743;
    float _1803 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1805 = ~_1623;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _644 * _1795;
    int _1813 = _1811 + _1461;
    bool _1815 = !_1657;
    int _1817 = _1815 ? 0 : 1;
    float _1819 = _558 + _568;
    int _1821 = _1809;
    if (!_1761)
    {
        int _1823 = ~_1623;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    float _1829 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1767);
    bool _1831 = _644 == 0;
    float _1833 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1771);
    bool _1835 = !_1077;
    int _1837 = _1835 ? _1799 : (-1);
    float _1839 = _1829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1841 = _1539 != 3;
    float _1843 = _1819 + (-1.0);
    bool _1845 = !_1831;
    int _1847 = _1845 ? _1813 : (-1);
    float _1849 = _1833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1851 = _1765 > 0.0;
    bool _1853 = _1765 >= 0.0;
    bool _1855 = isnan(_1765);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.0);
    bool _1861 = _1857 || _1859;
    float _1863 = _558 * 2.0;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1867 = _1865 != 0;
    bool _1869 = !_1541;
    int _1871 = _1869 ? 0 : 1;
    int _1873 = _1847 & 3;
    bool _1875 = _1873 != 0;
    float _1877 = floor(_1863);
    int _1879 = int(_1645) + int(_1789);
    int _1881 = ~_644;
    int _1883 = _1881 + 1;
    int _1885 = _1571 & 3;
    bool _1887 = _1885 != 0;
    bool _1889 = !_1661;
    int _1891 = _1889 ? 0 : 1;
    int _1893 = _1883 * _1879;
    int _1895 = _1893 + _1367;
    bool _1897 = _1873 != 3;
    bool _1899 = !_1887;
    int _1901 = _1899 ? 0 : 1;
    bool _1903 = uint(_1873) > 1u;
    bool _1905 = !_1841;
    int _1907 = _1905 ? 0 : (-1);
    bool _1909 = uint(_1873) >= 2u;
    int _1911 = _1875 ? 0 : 1;
    int _1913 = _1909 ? 0 : 1;
    float _1915 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1867)
    {
        _656 = 0;
    }
    int _1917 = _656;
    bool _1919 = uint(_1895) >= uint(_644);
    int _1921 = _1917;
    if (!_1867)
    {
        _1921 = 2;
    }
    int _1923 = _1921;
    int _1925 = ~_1913;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    bool _1931 = !_1919;
    int _1933 = _1931 ? 0 : (-1);
    int _1935 = _1929;
    if (_1897)
    {
        int _1937 = ~_1913;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = ~_1911;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    bool _1949 = _1923 != 2;
    int _1951 = _1947;
    if (!_1903)
    {
        int _1953 = ~_1911;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    int _1959 = _1505 >> 31;
    bool _1961 = _1589 != 3;
    int _1963 = ~_1879;
    int _1965 = _1963 + _1933;
    int _1967 = _1965 + 1;
    int _1969 = _1847 >> 31;
    bool _1971 = _1877 > 0.0;
    int _1973 = _644 * _1967;
    int _1975 = _1973 + _1367;
    bool _1977 = _1877 >= 0.0;
    bool _1979 = isnan(_1877);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    int _1987 = _1959 & 3;
    int _1989 = _1969 & 3;
    int _1991 = _1571 >> 31;
    int _1993 = _1505 + _1987;
    int _1995 = _1847 + _1989;
    int _1997 = _1861 ? 0 : 1;
    bool _1999 = _1873 != 3;
    float _2001 = _568 * 2.0;
    int _2003 = _1991 & 3;
    int _2005 = _1993 >> 2;
    if (_1867)
    {
        _1711 = 0;
    }
    int _2007 = _1711;
    int _2009 = _1995 >> 2;
    int _2011 = _2007;
    if (!_1867)
    {
        _2011 = 1;
    }
    int _2013 = _2011;
    int _2015 = _1847 & 3;
    bool _2017 = _2015 != 0;
    int _2019 = _1571 + _2003;
    int _2021 = _2005 << 4;
    int _2023 = _2021 + 368;
    float _2025 = floor(_2001);
    int _2027 = _2009 << 4;
    int _2029 = _2027 + 656;
    bool _2031 = !_2017;
    int _2033 = _2031 ? 0 : 1;
    uint _2035 = uint(int(uint(_2023) >> uint(2)));
    uint _2037 = uint(int(uint(int(_2035)) >> uint(2)));
    int _2039 = int(_2035) & 3;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[int(_2037)][_2039];
    int _2043 = int(_2035) + 1;
    uint _2045 = uint(int(uint(_2043) >> uint(2)));
    int _2047 = _2043 & 3;
    float _2049 = (*spvDescriptorSet0.vp_c9)._m0[int(_2045)][_2047];
    bool _2051 = _644 == 0;
    bool _2053 = !_1961;
    int _2055 = _2053 ? 0 : (-1);
    bool _2057 = !_2051;
    int _2059 = _2057 ? _1975 : (-1);
    bool _2061 = !_1999;
    int _2063 = _2061 ? 0 : (-1);
    uint _2065 = uint(int(uint(_2029) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2087 = _2085 != 0;
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2091 = _2089 != 0;
    float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2095 = _538 + _2093;
    int _2097 = _2019 >> 2;
    bool _2099 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2101 = isnan(_538);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = fma(_1801, _2095, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2113 = ~_1997;
    int _2115 = _2113 + 1;
    int _2117 = _2115 + 1;
    float _2119 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1769);
    int _2121 = _2097 << 4;
    int _2123 = _2121 + 512;
    int _2125 = _2117;
    if (!_1851)
    {
        int _2127 = ~_1997;
        int _2129 = _2127 + 1;
        _2125 = _2129;
    }
    int _2131 = _2125;
    float _2133 = _2119 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2135 = !_2083;
    int _2137 = _2135 ? 0 : 1;
    uint _2139 = uint(int(uint(_2123) >> uint(2)));
    uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
    int _2143 = int(_2139) & 3;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[int(_2141)][_2143];
    int _2147 = int(_2139) + 1;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    int _2151 = _2147 & 3;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[int(_2149)][_2151];
    bool _2155 = _2025 > 0.0;
    bool _2157 = _2025 >= 0.0;
    bool _2159 = isnan(_2025);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(0.0);
    bool _2165 = _2161 || _2163;
    float _2167 = _2109 * _572;
    int _2169 = abs(_1957);
    int _2171 = _2165 ? 0 : 1;
    float _2173 = _2111 * _2167;
    float _2175 = -_2109;
    float _2177 = _2175 + 1.0;
    int _2179 = _2023 + 8;
    uint _2181 = uint(int(uint(_2179) >> uint(2)));
    uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
    int _2185 = int(_2181) & 3;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[int(_2183)][_2185];
    int _2189 = int(_2181) + 1;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    int _2193 = _2189 & 3;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[int(_2191)][_2193];
    bool _2197 = _2013 != 1;
    float _2199 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2173);
    int _2201 = ~_2171;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2209 = int(_2207);
    int _2211 = _2205;
    if (!_2155)
    {
        int _2213 = ~_2171;
        int _2215 = _2213 + 1;
        _2211 = _2215;
    }
    int _2217 = _2211;
    float _2219 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2199);
    int _2221 = _2123 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c9)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2241 = abs(_1609);
    int _2243 = abs(_1827);
    int _2245 = _2029 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = abs(_1871);
    int _2265 = ~_2241;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    int _2271 = ~_2169;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    int _2277 = ~_2263;
    int _2279 = _2277 + 1;
    int _2281 = _2279 + 1;
    int _2283 = _2269 * as_type<int>(_2049);
    int _2285 = _2275 * as_type<int>(_2079);
    int _2287 = abs(_1901);
    int _2289 = _2281 * as_type<int>(_2041);
    int _2291 = _2289 + _2283;
    int _2293 = abs(_2033);
    float _2295 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2297 = int(_2295);
    int _2299 = abs(_1717);
    int _2301 = abs(_1687);
    int _2303 = ~_2243;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = ~_2299;
    int _2311 = _2309 + 1;
    int _2313 = _2311 + 1;
    int _2315 = ~_2287;
    int _2317 = _2315 + 1;
    int _2319 = _2317 + 1;
    int _2321 = _2307 * as_type<int>(_2153);
    float _2323 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2325 = int(_2323);
    int _2327 = ~_2293;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    int _2333 = _2313 * as_type<int>(_2187);
    int _2335 = _2333 + _2291;
    int _2337 = ~_2301;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    int _2343 = _2319 * as_type<int>(_2145);
    int _2345 = _2343 + _2321;
    int _2347 = abs(_1941);
    int _2349 = _2331 * as_type<int>(_2071);
    int _2351 = _2349 + _2285;
    int _2353 = abs(_2063);
    int _2355 = ~_2347;
    int _2357 = _2355 + 1;
    int _2359 = _2357 + 1;
    int _2361 = _2341 * as_type<int>(_2229);
    int _2363 = _2361 + _2345;
    int _2365 = abs(_1907);
    int _2367 = abs(_2055);
    float _2369 = float(uint(_2209));
    int _2371 = ~_2353;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = _2359 * as_type<int>(_2253);
    int _2379 = _2377 + _2351;
    int _2381 = ~_2365;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = float(uint(_2297));
    float _2389 = 1.0 / _2369;
    int _2391 = ~_2367;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _2375 * as_type<int>(_2261);
    int _2399 = _2397 + _2379;
    int _2401 = abs(_1639);
    int _2403 = _2385 * as_type<int>(_2195);
    int _2405 = _2403 + _2335;
    int _2407 = abs(_1817);
    int _2409 = _2395 * as_type<int>(_2237);
    int _2411 = _2409 + _2363;
    int _2413 = abs(_1891);
    float _2415 = 1.0 / _2387;
    int _2417 = abs(_2209);
    int _2419 = ~_2401;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    int _2425 = ~_2407;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    float _2431 = float(uint(_2325));
    int _2433 = _2405 * _2423;
    int _2435 = ~_2413;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    int _2441 = _2429 * _2411;
    float _2443 = float(uint(_2417));
    int _2445 = abs(_2297);
    int _2447 = _2439 * _2399;
    float _2449 = 1.0 / _2431;
    int _2451 = abs(_2325);
    int _2453 = _1585 * _2401;
    int _2455 = _2453 + _2433;
    float _2457 = float(uint(_2445));
    int _2459 = _1837 * _2407;
    int _2461 = _2459 + _2441;
    int _2463 = _2059 * _2413;
    int _2465 = _2463 + _2447;
    int _2467 = as_type<int>(_2389) + (-2);
    float _2469 = 1.0 / _2443;
    float _2471 = float(uint(_2455));
    int _2473 = as_type<int>(_2415) + (-2);
    float _2475 = as_type<float>(_2467) * _2471;
    float _2477 = float(uint(_2461));
    float _2479 = 1.0 / _2457;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2483 = float(uint(_2451));
    float _2485 = as_type<float>(_2473) * _2477;
    int _2487 = abs(_2455);
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2491 = as_type<int>(_2449) + (-2);
    float _2493 = 1.0 / _2483;
    float _2495 = float(uint(_2465));
    int _2497 = as_type<int>(_2469) + (-2);
    float _2499 = float(uint(_2487));
    float _2501 = as_type<float>(_2491) * _2495;
    float _2503 = trunc(_2475);
    float _2505 = precise::max(_2503, 0.0);
    uint _2507 = uint(_2505);
    float _2509 = as_type<float>(_2497) * _2499;
    int _2511 = abs(_2461);
    float _2513 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2515 = as_type<int>(_2479) + (-2);
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2519 = float(uint(_2511));
    float _2521 = trunc(_2485);
    float _2523 = precise::max(_2521, 0.0);
    uint _2525 = uint(_2523);
    int _2527 = abs(_2465);
    float _2529 = _2513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2531 = _2529;
    if (_1949)
    {
        _586 = _544;
    }
    float _2533 = _586;
    float _2535 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2537 = _2533;
    float _2539 = _2535;
    if (!_1949)
    {
        _2537 = _568;
    }
    float _2541 = _2537;
    float _2543 = as_type<float>(_2515) * _2519;
    float _2545 = trunc(_2501);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    int _2551 = ~_2209;
    int _2553 = _2551 + 1;
    float _2555 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2557 = ~_2297;
    int _2559 = _2557 + 1;
    int _2561 = as_type<int>(_2493) + (-2);
    int _2563 = _2553 * int(_2507);
    int _2565 = _2563 + _2455;
    float _2567 = float(uint(_2527));
    float _2569 = trunc(_2509);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    int _2575 = ~_2325;
    int _2577 = _2575 + 1;
    float _2579 = -_2239;
    float _2581 = fma(_2555, 2.0, _2579);
    int _2583 = ~_2417;
    int _2585 = _2583 + 1;
    float _2587 = as_type<float>(_2561) * _2567;
    int _2589 = _2559 * int(_2525);
    int _2591 = _2589 + _2461;
    float _2593 = float(uint(_2565));
    float _2595 = -_146;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2581);
    float _2599 = trunc(_2543);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    int _2605 = _2577 * int(_2549);
    int _2607 = _2605 + _2465;
    float _2609 = float(uint(_2591));
    float _2611 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2613 = as_type<float>(_2467) * _2593;
    int _2615 = ~_2445;
    int _2617 = _2615 + 1;
    float _2619 = float(uint(_2607));
    float _2621 = trunc(_2587);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    int _2627 = _2585 * int(_2573);
    int _2629 = _2627 + _2487;
    float _2631 = as_type<float>(_2473) * _2609;
    out.m_63.x = _2529;
    out.m_63.y = _2535;
    out.m_63.z = _2489;
    out.m_63.w = _2611;
    float _2633 = as_type<float>(_2491) * _2619;
    float _2635 = float(uint(_2629));
    int _2637 = _2617 * int(_2603);
    int _2639 = _2637 + _2511;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2643 = trunc(_2631);
    float _2645 = precise::max(_2643, 0.0);
    uint _2647 = uint(_2645);
    float _2649 = as_type<float>(_2497) * _2635;
    int _2651 = ~_2451;
    int _2653 = _2651 + 1;
    float _2655 = float(uint(_2639));
    float _2657 = _2611;
    if (!_2197)
    {
        _2539 = _568;
    }
    float _2659 = _2539;
    float _2661 = trunc(_2613);
    float _2663 = precise::max(_2661, 0.0);
    uint _2665 = uint(_2663);
    float _2667 = _2659;
    if (_2197)
    {
        _2667 = _558;
    }
    float _2669 = _2667;
    float _2671 = as_type<float>(_2515) * _2655;
    if (!_2197)
    {
        _2657 = _558;
    }
    float _2673 = _2657;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2677 = abs(_2137);
    float _2679 = fma(_2669, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2641);
    int _2681 = _2653 * int(_2625);
    int _2683 = _2681 + _2527;
    float _2685 = trunc(_2633);
    float _2687 = precise::max(_2685, 0.0);
    uint _2689 = uint(_2687);
    float _2691 = _2673;
    if (!_2197)
    {
        _2531 = _2673;
    }
    float _2693 = _2531;
    float _2695 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2679);
    float _2697 = _2693;
    if (_2197)
    {
        _2691 = _544;
    }
    float _2699 = _2691;
    float _2701 = float(uint(_2683));
    int _2703 = int(_2525) + int(_2647);
    float _2705 = trunc(_2649);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    int _2711 = int(_2507) + int(_2665);
    float _2713 = as_type<float>(_2561) * _2701;
    float _2715 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2675);
    int _2717 = ~_2297;
    int _2719 = _2717 + 1;
    int _2721 = ~_2209;
    int _2723 = _2721 + 1;
    float _2725 = trunc(_2671);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    int _2731 = int(_2549) + int(_2689);
    int _2733 = _2723 * _2711;
    int _2735 = _2733 + _2455;
    float _2737 = as_type<float>(_2689);
    float _2739 = _2701;
    if (_1949)
    {
        _2737 = _558;
    }
    float _2741 = _2737;
    float _2743 = _2741;
    if (!_1949)
    {
        _2743 = _544;
    }
    float _2745 = _2743;
    float _2747 = trunc(_2713);
    float _2749 = precise::max(_2747, 0.0);
    uint _2751 = uint(_2749);
    int _2753 = _2719 * _2703;
    int _2755 = _2753 + _2461;
    int _2757 = int(_2573) + int(_2709);
    bool _2759 = uint(_2735) >= uint(_2209);
    bool _2761 = uint(_2755) >= uint(_2297);
    int _2763 = ~_2417;
    int _2765 = _2763 + 1;
    int _2767 = ~_2445;
    int _2769 = _2767 + 1;
    int _2771 = int(_2603) + int(_2729);
    int _2773 = _2765 * _2757;
    int _2775 = _2773 + _2487;
    int _2777 = ~_2325;
    int _2779 = _2777 + 1;
    int _2781 = ~_2451;
    int _2783 = _2781 + 1;
    int _2785 = int(_2625) + int(_2751);
    int _2787 = _2779 * _2731;
    int _2789 = _2787 + _2465;
    bool _2791 = !_2759;
    int _2793 = _2791 ? 0 : (-1);
    int _2795 = _2769 * _2771;
    int _2797 = _2795 + _2511;
    bool _2799 = uint(_2775) >= uint(_2417);
    int _2801 = _2783 * _2785;
    int _2803 = _2801 + _2527;
    int _2805 = _2455 ^ _2209;
    int _2807 = as_type<int>(_2745);
    float _2809 = as_type<float>(_2775);
    if (!_2197)
    {
        _2739 = _568;
    }
    float _2811 = _2739;
    bool _2813 = !_2761;
    int _2815 = _2813 ? 0 : (-1);
    float _2817 = _2811;
    if (_2197)
    {
        _2697 = _544;
    }
    float _2819 = _2697;
    if (_2197)
    {
        _2817 = _558;
    }
    float _2821 = _2817;
    bool _2823 = uint(_2797) >= uint(_2445);
    float _2825 = _2819 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2827 = uint(_2789) >= uint(_2325);
    bool _2829 = !_2799;
    int _2831 = _2829 ? 0 : (-1);
    uint _2833 = uint(int(uint(_2805) >> uint(31)));
    int _2835 = ~_2711;
    int _2837 = _2835 + _2793;
    int _2839 = _2837 + 1;
    bool _2841 = !_2827;
    int _2843 = _2841 ? 0 : (-1);
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2847 = ~_2831;
    int _2849 = _2757 + _2847;
    int _2851 = _2849 + 1;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2855 = _2133 + _2853;
    int _2857 = ~int(_2833);
    int _2859 = _2857 + 1;
    int _2861 = _2209 * _2839;
    int _2863 = _2861 + _2455;
    int _2865 = ~_2703;
    int _2867 = _2865 + _2815;
    int _2869 = _2867 + 1;
    float _2871 = _2855 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2873 = uint(_2803) >= uint(_2451);
    bool _2875 = _2209 == 0;
    int _2877 = _2297 * _2869;
    int _2879 = _2877 + _2461;
    int _2881 = ~_2731;
    int _2883 = _2881 + _2843;
    int _2885 = _2883 + 1;
    float _2887 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2889 = _1839 + _2887;
    int _2891 = _2851 ^ _2859;
    bool _2893 = !_2823;
    int _2895 = _2893 ? 0 : (-1);
    int _2897 = _2325 * _2885;
    int _2899 = _2897 + _2465;
    bool _2901 = !_2875;
    int _2903 = _2901 ? _2863 : (-1);
    float _2905 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2907 = _2209 == 0;
    float _2909 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2871);
    int _2911 = ~_2859;
    int _2913 = _2911 + _2891;
    int _2915 = _2913 + 1;
    float _2917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2919 = _1849 + _2917;
    bool _2921 = _2297 == 0;
    float _2923 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2925 = !_2907;
    int _2927 = _2925 ? _2915 : (-1);
    float _2929 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2909);
    bool _2931 = !_2921;
    int _2933 = _2931 ? _2879 : (-1);
    float _2935 = fma(_2923, _799, -0.5);
    bool _2937 = _2325 == 0;
    bool _2939 = !_2937;
    int _2941 = _2939 ? _2899 : (-1);
    bool _2943 = _2929 >= 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2947 = _2297 == 0;
    int _2949 = _2461 ^ _2297;
    float _2951 = fma(_2905, -2.0, _2945);
    float _2953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2955 = uint(int(uint(_2949) >> uint(31)));
    float _2957 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2951);
    int _2959 = ~_2895;
    int _2961 = _2771 + _2959;
    int _2963 = _2961 + 1;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2967 = ~int(_2955);
    int _2969 = _2967 + 1;
    float _2971 = _2905;
    if (_2943)
    {
        out.m_51.x = 0.0;
    }
    float _2973 = float(_2217);
    float _2975 = -_2965;
    float _2977 = fma(_2825, 2.0, _2975);
    float _2979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_2943)
    {
        _2971 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2981 = _2971;
    float _2983 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2985 = float(_2677);
    if (_2943)
    {
        float _2987 = _2981 * 5.0;
        _2807 = as_type<int>(_2987);
    }
    int _2989 = _2807;
    int _2991 = _2963 ^ _2969;
    float _2993 = _2985 * _2973;
    float _2995 = float(_2903);
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2943)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9013 = as_type<float>(_2989);
        out.gl_Position.z = _9013;
    }
    float _2999 = float(_2933);
    float _3001 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3003 = ~_2969;
    int _3005 = _3003 + _2991;
    int _3007 = _3005 + 1;
    float _3009 = fma(_2923, _2995, _1635);
    float _3011 = fma(_2983, -2.0, _2997);
    float _3013 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3015 = !_2947;
    int _3017 = _3015 ? _3007 : (-1);
    bool _3019 = _2325 == 0;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3023 = -_146;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2977);
    int _3027 = _2465 ^ _2325;
    float _3029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3031 = fma(_3013, _895, -0.5);
    float _3033 = fma(_3001, _2999, _3025);
    float _3035 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3021);
    bool _3037 = !_2873;
    int _3039 = _3037 ? 0 : (-1);
    float _3041 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2715);
    uint _3043 = uint(int(uint(_3027) >> uint(31)));
    float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3049 = float(_2941);
    float _3051 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3035);
    int _3053 = ~_3039;
    int _3055 = _2785 + _3053;
    int _3057 = _3055 + 1;
    float _3059 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3047);
    int _3061 = ~int(_3043);
    int _3063 = _3061 + 1;
    float _3065 = fma(_3001, _843, -0.5);
    float _3067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3069 = fma(_3013, _3049, _2597);
    int _3071 = _3057 ^ _3063;
    float _3073 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3059);
    float _3075 = fma(_3051, _2935, _3009);
    float _3077 = fma(_3041, _3065, _3033);
    int _3079 = ~_3063;
    int _3081 = _3079 + _3071;
    int _3083 = _3081 + 1;
    float _3085 = fma(_3073, _3031, _3069);
    float _3087 = float(_2927);
    float _3089 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3091 = log2(_3089);
    float _3093 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3095 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1751);
    float _3097 = _3029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3099 = !_3019;
    int _3101 = _3099 ? _3083 : (-1);
    float _3103 = fma(_1269, _3093, -0.5);
    float _3105 = -_3095;
    float _3107 = fma(_3093, _3087, _3105);
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3111 = float(_3017);
    float _3113 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3115 = float(_3101);
    float _3117 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3011);
    float _3119 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3109);
    float _3121 = fma(_1369, _3097, -0.5);
    float _3123 = -_2957;
    float _3125 = fma(_3097, _3111, _3123);
    float _3127 = -_3117;
    float _3129 = fma(_3113, _3115, _3127);
    float _3131 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3119);
    float _3133 = _3091 * _146;
    float _3135 = _2855 * _2855;
    float _3137 = fma(_3131, _3103, _3107);
    float _3139 = fma(_3113, _1375, -0.5);
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3143 = exp2(_3133);
    float _3145 = fma(_2695, _3121, _3125);
    float _3147 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3141);
    float _3149 = fma(_2889, _2889, _3135);
    float _3151 = in.m_65.x;
    float _3153 = in.m_65.y;
    float _3155 = in.m_65.z;
    float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3159 = 1.0 + _3157;
    float _3161 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3147);
    float _3163 = fma(_2919, _2919, _3149);
    bool _3165 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3167 = isnan(1.0);
    bool _3169 = _3165 || _3167;
    bool _3171 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3173 = _3169 || _3171;
    float _3175 = 1.0 / _3159;
    float _3177 = fma(_3161, _3139, _3129);
    bool _3179 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3181 = isnan(0.0);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3187 = _3183 || _3185;
    float _3189 = _3085 + 0.5;
    float _3191 = _2993 * (-2.0);
    float _3193 = _3177 + 0.5;
    float _3195 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3197 = -_3143;
    float _3199 = _3197 + 1.0;
    float _3201 = rsqrt(_3163);
    float _3203 = _3075 + 0.5;
    float _3205 = _3077 + 0.5;
    float _3207 = _3137 + 0.5;
    float _3209 = _3187 ? _3199 : 0.0;
    float _3211 = _3145 + 0.5;
    float _3213 = _3195 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3215 = _1985 ? 0 : 1;
    out.m_67.x = _3189;
    out.m_67.y = _3193;
    if (_3173)
    {
        float _3217 = _3209 * _3175;
        _150 = _3217;
    }
    float _3219 = _150;
    bool _3221 = !_2087;
    int _3223 = _3221 ? 0 : 1;
    float _3225 = fma(_1803, _3191, _1803);
    out.m_69.x = _3203;
    out.m_69.y = _3207;
    out.m_69.z = _3205;
    out.m_69.w = _3211;
    float _3227 = fma(_3191, _3151, _3151);
    float _3229 = _544 + (-0.5);
    int _3231 = ~_3215;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    float _3237 = _3213 * _3201;
    bool _3239 = !_2091;
    int _3241 = _3239 ? 0 : 1;
    int _3243 = abs(_3223);
    float _3245 = _2889 * _3237;
    float _3247 = _2855 * _3237;
    int _3249 = _3235;
    float _3251 = _3155;
    if (_2943)
    {
        return out;
    }
    float _3253 = -_3247;
    float _3255 = _2133 + _3253;
    float _3257 = -_3245;
    float _3259 = _1839 + _3257;
    float _3261 = float(_2131);
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3265 = _3255 + _3263;
    float _3267 = float(_3243);
    float _3269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3271 = _3259 + _3269;
    float _3273 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3227);
    float _3275 = _3265 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_1971)
    {
        int _3277 = ~_3215;
        int _3279 = _3277 + 1;
        _3249 = _3279;
    }
    int _3281 = _3249;
    float _3283 = _3267 * _3261;
    float _3285 = fma(_3225, _3219, _3273);
    float _3287 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3275);
    int _3289 = abs(_3241);
    float _3291 = _3283 * (-2.0);
    float _3293 = _2919 * _3237;
    float _3295 = _558 + (-0.5);
    float _3297 = float(_3281);
    float _3299 = fma(_3291, _3153, _3153);
    float _3301 = float(_3289);
    float _3303 = -_3293;
    float _3305 = _1849 + _3303;
    float _3307 = fma(_1915, _3291, _1915);
    float _3309 = fma(_3295, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3299);
    float _3311 = _544 + _568;
    float _3313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3315 = _3305 + _3313;
    float _3317 = _3301 * _3297;
    float _3319 = fma(_3307, _3219, _3309);
    float _3321 = _3311 + (-1.0);
    float _3323 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3287);
    float _3325 = _3317 * (-2.0);
    float _3327 = -_3247;
    float _3329 = _2855 + _3327;
    float _3331 = fma(_3321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3333 = _568 + (-0.5);
    float _3335 = fma(_3325, _3155, _3155);
    bool _3337 = _3323 >= 0.0;
    float _3339 = -_3245;
    float _3341 = _2889 + _3339;
    float _3343 = _3329 * _3329;
    float _3345 = fma(_3331, _3325, _3331);
    float _3347 = fma(_3333, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3335);
    float _3349 = -_3293;
    float _3351 = _2919 + _3349;
    float _3353 = fma(_3341, _3341, _3343);
    float _3355 = _3285 * 0.15915493667125701904296875;
    float _3357 = _3319 * 0.15915493667125701904296875;
    float _3359 = fma(_3345, _3219, _3347);
    float _3361 = fma(_3351, _3351, _3353);
    float _3363 = _3355 * 6.283185482025146484375;
    float _3365 = sin(_3363);
    float _3367 = _3359 * 0.15915493667125701904296875;
    if (_3337)
    {
        _3251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3369 = _3251;
    int _3371 = as_type<int>(_3369);
    if (_3337)
    {
        out.m_51.x = 0.0;
    }
    float _3373 = _3357 * 6.283185482025146484375;
    float _3375 = sin(_3373);
    if (_3337)
    {
        float _3377 = _3369 * 5.0;
        _3371 = as_type<int>(_3377);
    }
    int _3379 = _3371;
    if (_3337)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9624 = as_type<float>(_3379);
        out.gl_Position.z = _9624;
    }
    float _3381 = _3355 * 6.283185482025146484375;
    float _3383 = cos(_3381);
    float _3385 = _3357 * 6.283185482025146484375;
    float _3387 = cos(_3385);
    float _3389 = _3365 * _3375;
    float _3391 = sqrt(_3361);
    float _3393 = _3367 * 6.283185482025146484375;
    float _3395 = sin(_3393);
    if (_3337)
    {
        return out;
    }
    float _3397 = -_2133;
    float _3399 = _3397 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3401 = -_1839;
    float _3403 = _3401 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3405 = in.m_71.x;
    float _3407 = in.m_71.y;
    float _3409 = in.m_71.z;
    float _3411 = -_1849;
    float _3413 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3415 = _3399 * _3399;
    float _3417 = _3367 * 6.283185482025146484375;
    float _3419 = cos(_3417);
    float _3421 = _3201 * _3391;
    float _3423 = _3383 * _3387;
    float _3425 = fma(_3403, _3403, _3415);
    float _3427 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3429 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3431 = fma(_3413, _3413, _3425);
    float _3433 = fma(_3395, _3423, _3389);
    float _3435 = fma(_3395, _3389, _3423);
    float _3437 = _3383 * _3375;
    float _3439 = rsqrt(_3431);
    float _3441 = _3421 * _3429;
    float _3443 = _3365 * _3387;
    float _3445 = _3421 * _3427;
    float _3447 = _3195 * _3421;
    float _3449 = _3375 * _3419;
    float _3451 = _3365 * _3419;
    float _3453 = _3383 * _3419;
    float _3455 = _3387 * _3419;
    float _3457 = -_3437;
    float _3459 = fma(_3395, _3443, _3457);
    float _3461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3407);
    float _3463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3405);
    bool _3465 = _3407 != 0.0;
    bool _3467 = isnan(_3407);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan(0.0);
    bool _3473 = _3469 || _3471;
    float _3475 = -_3443;
    float _3477 = fma(_3395, _3437, _3475);
    float _3479 = _3441 * _3461;
    float _3481 = _3447 * _3463;
    float _3483 = _3403 * _3439;
    float _3485 = _3413 * _3439;
    float _3487 = in.m_73.x;
    float _3489 = in.m_73.y;
    float _3491 = in.m_73.z;
    float _3493 = _3399 * _3439;
    float _3495 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3497 = _3483 * _3495;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3501 = _3485 * _3499;
    float _3503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3409);
    bool _3505 = _3405 == 0.0;
    bool _3507 = !_3473;
    bool _3509 = _3505 && _3507;
    float _3511 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3513 = -_3497;
    float _3515 = fma(_3485, _3511, _3513);
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3519 = _3493 * _3517;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3523 = -_3501;
    float _3525 = fma(_3493, _3521, _3523);
    float _3527 = _3445 * _3503;
    float _3529 = _3515 * _3515;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3533 = -_3519;
    float _3535 = fma(_3483, _3531, _3533);
    bool _3537 = _3409 == 0.0;
    bool _3539 = _3537 && _3509;
    float _3541 = in.m_75.x;
    float _3543 = in.m_75.y;
    float _3545 = in.m_75.z;
    float _3547 = in.m_75.w;
    float _3549 = fma(_3525, _3525, _3529);
    float _3551 = -_3479;
    float _3553 = _3395 * _3551;
    float _3555 = _3453 * _3479;
    float _3557 = _3451 * _3479;
    float _3559 = fma(_3535, _3535, _3549);
    float _3561 = fma(_3455, _3481, _3553);
    float _3563 = fma(_3433, _3481, _3555);
    float _3565 = fma(_3459, _3481, _3557);
    float _3567 = rsqrt(_3559);
    float _3569 = fma(_3449, _3527, _3561);
    float _3571 = _3553;
    float _3573 = _3481;
    float _3575 = _3487;
    float _3577 = _3549;
    if (_3539)
    {
        _3571 = _3487;
    }
    float _3579 = _3571;
    float _3581 = _3579;
    if (_3539)
    {
        _2809 = _3491;
    }
    float _3583 = _2809;
    float _3585 = _3583;
    if (_3539)
    {
        _3573 = _3579;
    }
    float _3587 = _3573;
    float _3589 = _3587;
    if (!_3539)
    {
        _3581 = _3487;
    }
    float _3591 = _3581;
    float _3593 = fma(_3477, _3527, _3563);
    if (_3539)
    {
        _3575 = _3583;
    }
    float _3595 = _3575;
    float _3597 = _3595;
    if (!_3539)
    {
        _3585 = _3491;
    }
    float _3599 = _3585;
    float _3601 = fma(_3435, _3527, _3565);
    if (!_3539)
    {
        float _3603 = fma(_3405, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3591);
        _3589 = _3603;
    }
    float _3605 = _3589;
    float _3607 = _3515 * _3567;
    float _3609 = _3525 * _3567;
    if (!_3539)
    {
        float _3611 = fma(_3409, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3599);
        _3597 = _3611;
    }
    float _3613 = _3597;
    float _3615 = _3535 * _3567;
    float _3617 = _3485 * _3607;
    float _3619 = _3493 * _3609;
    float _3621 = _3613;
    if (_3539)
    {
        _3577 = _3489;
    }
    float _3623 = _3577;
    float _3625 = _3623;
    if (!_3539)
    {
        float _3627 = fma(_3407, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3489);
        _3625 = _3627;
    }
    float _3629 = _3625;
    float _3631 = -_3617;
    float _3633 = fma(_3493, _3615, _3631);
    float _3635 = -_3619;
    float _3637 = fma(_3483, _3607, _3635);
    float _3639 = _3545 * _3591;
    float _3641 = _3541 * _3489;
    float _3643 = _3633 * _3593;
    float _3645 = _3637 * _3593;
    float _3647 = -_3639;
    float _3649 = fma(_3541, _3599, _3647);
    float _3651 = _3543 * _3599;
    float _3653 = fma(_3609, _3569, _3643);
    float _3655 = fma(_3615, _3569, _3645);
    float _3657 = -_3641;
    float _3659 = fma(_3543, _3591, _3657);
    float _3661 = -_3651;
    float _3663 = fma(_3545, _3489, _3661);
    float _3665 = fma(_3483, _3601, _3653);
    float _3667 = fma(_3485, _3601, _3655);
    float _3669 = _3453 * _3633;
    float _3671 = _3663 * _3547;
    float _3673 = _3483 * _3615;
    float _3675 = _1839 + _3665;
    float _3677 = _1849 + _3667;
    float _3679 = _3453 * _3637;
    float _3681 = -_3673;
    float _3683 = fma(_3485, _3609, _3681);
    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3687 = _3675 + _3685;
    float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3691 = _3677 + _3689;
    float _3693 = _3649 * _3547;
    float _3695 = _3453 * _3683;
    float _3697 = _3687 * _3687;
    float _3699 = _3691 * _3691;
    float _3701 = _3659 * _3547;
    float _3703 = _3433 * _3633;
    float _3705 = _3433 * _3683;
    float _3707 = _3433 * _3637;
    float _3709 = _3697 + _3699;
    float _3711 = _3477 * _3633;
    float _3713 = _3477 * _3637;
    float _3715 = _3477 * _3683;
    float _3717 = fma(_3455, _3609, _3703);
    float _3719 = fma(_3455, _3607, _3705);
    float _3721 = fma(_3455, _3615, _3707);
    float _3723 = _3683 * _3593;
    float _3725 = sqrt(_3709);
    float _3727 = -_3395;
    float _3729 = fma(_3727, _3609, _3669);
    float _3731 = -_3395;
    float _3733 = fma(_3731, _3607, _3695);
    float _3735 = fma(_3607, _3569, _3723);
    float _3737 = -_3395;
    float _3739 = fma(_3737, _3615, _3679);
    float _3741 = fma(_3449, _3615, _3713);
    float _3743 = fma(_3449, _3609, _3711);
    float _3745 = fma(_3493, _3601, _3735);
    float _3747 = fma(_3449, _3607, _3715);
    float _3749 = fma(_3451, _3483, _3729);
    float _3751 = fma(_3451, _3493, _3733);
    float _3753 = fma(_3451, _3485, _3739);
    float _3755 = _2133 + _3745;
    float _3757 = fma(_3459, _3483, _3717);
    float _3759 = fma(_3459, _3493, _3719);
    float _3761 = fma(_3459, _3485, _3721);
    bool _3763 = _3725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3765 = fma(_3435, _3483, _3743);
    float _3767 = fma(_3435, _3493, _3747);
    float _3769 = fma(_3435, _3485, _3741);
    float _3771 = _3749 * _3543;
    float _3773 = _3751 * _3543;
    float _3775 = _3753 * _3543;
    float _3777 = _3749 * _3629;
    float _3779 = _3693 * _3749;
    float _3781 = _3751 * _3629;
    float _3783 = _3693 * _3751;
    float _3785 = _3693 * _3753;
    float _3787 = _3753 * _3629;
    float _3789 = _3693;
    float _3791 = _3697;
    float _3793 = _3699;
    float _3795 = _3675;
    float _3797 = _3677;
    float _3799 = _3701;
    if (!_3763)
    {
        _3789 = _3755;
    }
    float _3801 = _3789;
    bool _3803 = !_3763;
    float _3805 = _3801;
    if (!_3803)
    {
        float _3807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3811 = _3725 + _3809;
        float _3813 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3815 = rsqrt(_3709);
        float _3817 = _3811 * _3807;
        float _3819 = _3817 * 0.15915493667125701904296875;
        float _3821 = _3819 * 6.283185482025146484375;
        float _3823 = sin(_3821);
        float _3825 = _3819 * 6.283185482025146484375;
        float _3827 = cos(_3825);
        float _3829 = fma(_3823, _3813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3831 = _3815 * _3829;
        float _3833 = fma(_3687, _3831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3835 = _3827 + (-1.0);
        float _3837 = fma(_3691, _3831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3841 = _3833 + _3839;
        float _3843 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3847 = _3837 + _3845;
        float _3849 = _3841 * _3841;
        float _3851 = fma(_3755, _3827, _3843);
        float _3853 = _3847 * _3847;
        _3805 = _3851;
        _3791 = _3849;
        _3793 = _3853;
        _3795 = _3833;
        _3797 = _3837;
    }
    float _3855 = _3805;
    float _3857 = _3791;
    float _3859 = _3793;
    float _3861 = _3795;
    float _3863 = _3797;
    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3867 = _3855 + _3865;
    float _3869 = fma(_3757, _3541, _3771);
    float _3871 = fma(_3759, _3541, _3773);
    float _3873 = fma(_3757, _3605, _3777);
    float _3875 = fma(_3867, _3867, _3857);
    float _3877 = fma(_3759, _3605, _3781);
    float _3879 = fma(_3761, _3605, _3787);
    float _3881 = fma(_3761, _3541, _3775);
    float _3883 = _3875 + _3859;
    float _3885 = fma(_3671, _3757, _3779);
    float _3887 = fma(_3671, _3759, _3783);
    float _3889 = fma(_3671, _3761, _3785);
    float _3891 = fma(_3765, _3545, _3869);
    float _3893 = fma(_3767, _3545, _3871);
    float _3895 = sqrt(_3883);
    float _3897 = fma(_3769, _3545, _3881);
    float _3899 = fma(_3765, _3613, _3873);
    float _3901 = fma(_3701, _3765, _3885);
    float _3903 = fma(_3767, _3613, _3877);
    float _3905 = fma(_3701, _3767, _3887);
    float _3907 = fma(_3701, _3769, _3889);
    float _3909 = fma(_3769, _3613, _3879);
    out.m_77.x = _3891;
    out.m_77.y = _3893;
    out.m_77.z = _3897;
    out.m_79.x = _3901;
    out.m_79.y = _3905;
    out.m_79.z = _3907;
    out.m_81.x = _3899;
    out.m_81.y = _3903;
    out.m_81.z = _3909;
    bool _3911 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3913 = isnan(_3895);
    bool _3915 = _3911 || _3913;
    bool _3917 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3919 = _3915 || _3917;
    if (!_3919)
    {
        _3621 = 1.0;
    }
    float _3921 = _3621;
    bool _3923 = !_3919;
    float _3925 = _3921;
    if (!_3923)
    {
        bool _3927 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3929 = isnan(_3895);
        bool _3931 = _3927 || _3929;
        bool _3933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3935 = _3931 || _3933;
        if (!_3935)
        {
            float _3937 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3939 = _3895 + _3937;
            float _3941 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3943 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3941;
            float _3945 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3947 = _3945 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3949 = 1.0 / _3943;
            float _3951 = _3939 * _3949;
            float _3953 = fma(_3951, _3947, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3925 = _3953;
            _3799 = _3949;
            _3955 = true;
        }
        else
        {
            bool _3957 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3959 = isnan(_3895);
            bool _3961 = _3957 || _3959;
            bool _3963 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3965 = _3961 || _3963;
            if (!_3965)
            {
                float _3967 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3969 = _3895 + _3967;
                float _3971 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3973 = _3971 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3975 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3977 = _3975 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3979 = 1.0 / _3973;
                float _3981 = _3969 * _3979;
                float _3983 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3925 = _3983;
                _3799 = _3979;
                _3955 = true;
            }
            else
            {
                _3925 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3955 = false;
    float _3985 = _3925;
    float _3987 = _3799;
    float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3991 = _3855 + _3989;
    float _3993 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3995 = _3861 + _3993;
    float _3997 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3999 = _3863 + _3997;
    float _4001 = fma(_3991, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4003 = fma(_3995, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4005 = fma(_3999, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4007 = -_3247;
    float _4009 = _4007 + _4001;
    float _4011 = -_3245;
    float _4013 = _4011 + _4003;
    float _4015 = -_3293;
    float _4017 = _4015 + _4005;
    float _4019 = fma(_3305, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4023 = _4009 + _4021;
    float _4025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4027 = _4013 + _4025;
    float _4029 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4031 = _4017 + _4029;
    float _4033 = floor(_4019);
    float _4035 = _4023 * _4023;
    float _4037 = fma(_4027, _4027, _4035);
    float _4039 = fma(_4031, _4031, _4037);
    float _4041 = rsqrt(_4039);
    float _4043 = -_4033;
    float _4045 = _4019 + _4043;
    float _4047 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4049 = _4027 * _4047;
    float _4051 = _4031 * _4047;
    float _4053 = _4049 * _4049;
    float _4055 = _4051 * _4051;
    float _4057 = _4053 + _4055;
    float _4059 = sqrt(_4057);
    bool _4061 = _4059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4065 = _4059 + _4063;
    float _4067 = _3987;
    float _4069 = _4057;
    float _4071 = _4065;
    float _4073 = _4023;
    float _4075 = _4047;
    if (_4061)
    {
        float _4077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4067 = _4077;
    }
    float _4079 = _4067;
    if (_4061)
    {
        float _4081 = rsqrt(_4057);
        _4069 = _4081;
    }
    float _4083 = _4069;
    float _4085 = _4079;
    if (_4061)
    {
        float _4087 = _4065 * _4079;
        _4071 = _4087;
    }
    float _4089 = _4071;
    if (_4061)
    {
        float _4091 = _4089 * 0.15915493667125701904296875;
        _4085 = _4091;
    }
    float _4093 = _4085;
    float _4095 = _4031;
    float _4097 = _4093;
    if (_4061)
    {
        float _4099 = _4093 * 6.283185482025146484375;
        float _4101 = cos(_4099);
        _4095 = _4101;
    }
    float _4103 = _4095;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4107 = precise::max(0.0, _4105);
    float _4109 = _4041;
    float _4111 = _4107;
    if (_4061)
    {
        float _4113 = _4093 * 6.283185482025146484375;
        float _4115 = sin(_4113);
        _4109 = _4115;
    }
    float _4117 = _4109;
    float _4119 = -_4047;
    float _4121 = -_4107;
    float _4123 = fma(_4023, _4119, _4121);
    float _4125 = _4123;
    if (_4061)
    {
        float _4127 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4073 = _4127;
    }
    float _4129 = _4073;
    float _4131 = _4129;
    if (_4061)
    {
        float _4133 = _4103 + (-1.0);
        _4111 = _4133;
    }
    float _4135 = _4111;
    if (!_4061)
    {
        _4097 = _4049;
    }
    float _4137 = _4097;
    float _4139 = _4117;
    float _4141 = _4137;
    if (_4061)
    {
        float _4143 = fma(_4117, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4139 = _4143;
    }
    float _4145 = _4139;
    float _4147 = _4145;
    if (_4061)
    {
        float _4149 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4131 = _4149;
    }
    float _4151 = _4131;
    float _4153 = sqrt(_4039);
    float _4155 = _4151;
    if (_4061)
    {
        float _4157 = _4083 * _4145;
        _4075 = _4157;
    }
    float _4159 = _4075;
    if (_4061)
    {
        float _4161 = fma(_4123, _4103, _4151);
        _4125 = _4161;
    }
    float _4163 = _4125;
    float _4165 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4061)
    {
        float _4167 = _4049 * _4159;
        _4141 = _4167;
    }
    float _4169 = _4141;
    if (!_4061)
    {
        _4147 = _4051;
    }
    float _4171 = _4147;
    float _4173 = _4171;
    if (_4061)
    {
        float _4175 = _4051 * _4159;
        _4173 = _4175;
    }
    float _4177 = _4173;
    if (!_4061)
    {
        _4155 = _4053;
    }
    float _4179 = _4155;
    float _4181 = _4179;
    if (_4061)
    {
        float _4183 = _4169 * _4169;
        _4181 = _4183;
    }
    float _4185 = _4181;
    float _4187 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_4061)
    {
        _4165 = _4055;
    }
    float _4189 = _4165;
    float _4191 = _4189;
    if (_4061)
    {
        float _4193 = _4177 * _4177;
        _4191 = _4193;
    }
    float _4195 = _4191;
    float _4197 = fma(_4163, _4163, _4185);
    float _4199 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4201 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4203 = _4197 + _4195;
    float _4205 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4199);
    float _4207 = floor(_4187);
    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4211 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4209);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4205);
    float _4217 = -_4213;
    float _4219 = _4217 + 1.0;
    float _4221 = _4215 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4223 = rsqrt(_4203);
    float _4225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4227 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4229 = -_4227;
    float _4231 = fma(_4229, _4225, 1.0);
    float _4233 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4235 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4237 = abs(_4219);
    float _4239 = log2(_4237);
    float _4241 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4235);
    float _4243 = _4223 * _4169;
    float _4245 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4233);
    float _4247 = _4223 * _4177;
    float _4249 = _4223 * _4163;
    float _4251 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4241);
    float _4253 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4245);
    float _4255 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4201);
    float _4257 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4259 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4261 = _4253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4263 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4255);
    float _4265 = -_4257;
    float _4267 = fma(_4249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4265);
    float _4269 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4271 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4273 = _4263 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4275 = -_4247;
    float _4277 = fma(_4275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4267);
    float _4279 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4269);
    float _4281 = -_4207;
    float _4283 = _4187 + _4281;
    float _4285 = exp2(_4271);
    float _4287 = fma(_4277, -0.5, 0.5);
    float _4289 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4279);
    float _4291 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4293 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4295 = fma(_4277, 0.5, 0.5);
    float _4297 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4289);
    float _4299 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4291);
    float _4301 = log2(_4231);
    float _4303 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4293);
    float _4305 = fma(_4295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4307 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4299);
    float _4309 = _4249 + 1.0;
    float _4311 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4303);
    float _4313 = fma(_4295, _4305, -0.212114393711090087890625);
    float _4315 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4307);
    float _4317 = 1.0 / _4297;
    float _4319 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4311);
    float _4321 = -_4249;
    float _4323 = fma(_4285, _4309, _4321);
    float _4325 = fma(_4295, _4313, 1.570728778839111328125);
    float2 _11173 = float2(_4283, _4045);
    float _4327 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11173, float2(0.0), isnan(_11173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11173, float2(0.0), isnan(_11173)), level(0.0)).x;
    float _4329 = fma(_4323, 0.5, 0.5);
    float _4331 = sqrt(_4287);
    float _4333 = _4301 * 0.693147182464599609375;
    float _4335 = _4333 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4337 = _4315 * _4317;
    float _4339 = _4319 * _4317;
    float _4341 = fma(_4337, 0.5, 0.5);
    float _4343 = fma(_4339, -0.5, 0.5);
    float _4345 = _4331 * 0.636619746685028076171875;
    float3 _11208 = float3(_4341, _4343, _4335);
    float _4347 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11208, float3(0.0), isnan(_11208)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11208, float3(0.0), isnan(_11208)), level(0.0)).x;
    float _4349 = -_4325;
    float _4351 = fma(_4345, _4349, 1.0);
    float3 _11224 = float3(_4341, _4343, _4335);
    float4 _4354 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11224, float3(0.0), isnan(_11224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11224, float3(0.0), isnan(_11224)), level(0.0)).xyzw;
    float _4356 = _4354.x;
    float _4358 = _4354.y;
    float _4360 = _4354.z;
    float _4362 = _4354.w;
    float2 _11240 = float2(_4351, _4329);
    float3 _4366 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11240, float2(0.0), isnan(_11240)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11240, float2(0.0), isnan(_11240)), level(0.0)).xyz;
    float _4368 = _4366.x;
    float _4370 = _4366.y;
    float _4372 = _4366.z;
    float _4374 = _3255 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _4376 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4378 = isnan(_4153);
    bool _4380 = _4376 || _4378;
    bool _4382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4384 = _4380 || _4382;
    float _4386 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4374);
    float _4388 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4386);
    float _4390 = _3255 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4392 = _4388 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4394 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4390);
    float _4396 = 1.0 / _4392;
    float _4398 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4394);
    float _4400 = _4398 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4402 = _4400 + _4392;
    float _4404 = _4402 * _4396;
    float _4406 = _4404 * 0.5;
    float _4408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4410 = fma(_4406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4408);
    float _4412 = 1.0 / _4410;
    float _4414 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4416 = exp2(_4414);
    float _4418 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4420 = _4412 * _4418;
    float _4422 = abs(_4420);
    float _4424 = log2(_4422);
    float _4426 = -_4416;
    float _4428 = _4426 + 1.0;
    bool _4430 = _4420 <= 8000.0;
    bool _4432 = isnan(_4420);
    bool _4434 = _4430 || _4432;
    bool _4436 = isnan(8000.0);
    bool _4438 = _4434 || _4436;
    float _4440 = float(_4438);
    float _4442 = _4424 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4444 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4446 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4444);
    float _4448 = exp2(_4442);
    float _4450 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4446);
    float _4452 = fma(_4448, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4454 = precise::clamp(_4452, 0.0, 1.0);
    float _4456 = in.m_83.x;
    float _4458 = fma(_4454, -2.0, 3.0);
    float _4460 = _4454 * _4454;
    float _4462 = _4460 * _4458;
    float _4464 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4450);
    float _4466 = -_4462;
    float _4468 = _4466 + 1.0;
    float _4470 = _4464 + _4297;
    out.gl_Position.x = _4315;
    out.gl_Position.y = _4319;
    out.gl_Position.z = _4464;
    out.gl_Position.w = _4297;
    float _4472 = fma(_4468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4462);
    float _4474 = _4470 * 0.5;
    float _4476 = _4440 * _4472;
    float _4478 = _4428 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _4474;
    out.m_85.w = _4297;
    float _4480 = _4476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4482 = _4464;
    float _4484 = _4319;
    float _4486 = _4315;
    float _4488 = _4297;
    if (!_4384)
    {
        _4482 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4490 = _4482;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4384)
    {
        _4484 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4496 = _4484;
    float _4498 = -_4478;
    float _4500 = _4498 + 1.0;
    float _4502 = _4500;
    float _4504 = _4496;
    float _4506 = _4496;
    if (!_4384)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4508 = _4486;
    float _4510 = _4508;
    float _4512 = _4508;
    if (!_4384)
    {
        _4488 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4514 = _4488;
    float _4516 = -_4327;
    float _4518 = _4516 + 1.0;
    float _4520 = _4518 * _4480;
    float _4522 = precise::clamp(_4520, 0.0, 1.0);
    float _4524 = -_4522;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4528 = _4526 * _4456;
    float _4530 = _4528 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4532 = _4528;
    float _4534 = _4514;
    float _4536 = _4514;
    if (!_4384)
    {
        _4532 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4538 = _4532;
    float _4540 = _4478 * _4347;
    out.m_87.x = _4530;
    float _4542 = _4362 * _4540;
    float _4544 = _4372 * _4540;
    float _4546 = fma(_4368, _4542, _4356);
    float _4548 = fma(_4370, _4542, _4358);
    float _4550 = _4362 * _4500;
    float _4552 = fma(_4362, _4544, _4360);
    float _4554 = _4538;
    float _4556 = _4538;
    if (!_4384)
    {
        _4502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4558 = _4502;
    out.m_89.x = _4546;
    out.m_89.y = _4548;
    out.m_89.z = _4552;
    out.m_89.w = _4550;
    bool _4560 = !_4384;
    float _4562 = _4558;
    float _4564 = _4558;
    if (!_4560)
    {
        bool _4566 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4568 = isnan(_4153);
        bool _4570 = _4566 || _4568;
        bool _4572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4574 = _4570 || _4572;
        if (!_4574)
        {
            float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4578 = _4153 + _4576;
            float _4580 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4582 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4580;
            float _4584 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4586 = _4584 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4588 = 1.0 / _4582;
            float _4590 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4592 = _4590 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4594 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4596 = _4594 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4598 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4600 = _4598 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4602 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4604 = _4602 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4606 = _4578 * _4588;
            float _4608 = precise::clamp(_4606, 0.0, 1.0);
            float _4610 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4612 = _4610 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4614 = fma(_4608, _4586, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4616 = fma(_4608, _4612, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4618 = fma(_4608, _4592, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4620 = fma(_4608, _4596, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4622 = fma(_4608, _4600, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4624 = fma(_4608, _4604, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4506 = _4618;
            _4564 = _4622;
            _4494 = _4614;
            _4536 = _4620;
            _4512 = _4616;
            _4556 = _4624;
            _4626 = true;
        }
        else
        {
            bool _4628 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4630 = isnan(_4153);
            bool _4632 = _4628 || _4630;
            bool _4634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4636 = _4632 || _4634;
            if (!_4636)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4638 = _4492;
            _4494 = _4638;
            if (!_4636)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4640 = _4504;
            _4506 = _4640;
            if (!_4636)
            {
                _4510 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4642 = _4510;
            _4512 = _4642;
            if (!_4636)
            {
                _4534 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4644 = _4534;
            _4536 = _4644;
            if (!_4636)
            {
                _4562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4646 = _4562;
            _4564 = _4646;
            if (!_4636)
            {
                _4554 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4648 = _4554;
            bool _4650 = !_4636;
            _4556 = _4648;
            if (!_4650)
            {
                bool _4652 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4654 = isnan(_4153);
                bool _4656 = _4652 || _4654;
                bool _4658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4660 = _4656 || _4658;
                if (!_4660)
                {
                    float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4664 = _4153 + _4662;
                    float _4666 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4668 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4666;
                    float _4670 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4672 = _4670 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4674 = 1.0 / _4668;
                    float _4676 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4678 = _4676 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4680 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4682 = _4680 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4684 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4686 = _4684 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4688 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4690 = _4688 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4692 = _4664 * _4674;
                    float _4694 = precise::clamp(_4692, 0.0, 1.0);
                    float _4696 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4698 = _4696 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4700 = fma(_4694, _4672, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4702 = fma(_4694, _4698, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4704 = fma(_4694, _4678, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4706 = fma(_4694, _4682, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4708 = fma(_4694, _4686, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4710 = fma(_4694, _4690, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4506 = _4704;
                    _4564 = _4708;
                    _4494 = _4700;
                    _4536 = _4706;
                    _4512 = _4702;
                    _4556 = _4710;
                    _4626 = true;
                }
                else
                {
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4536 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4512 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4556 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4626 = false;
    float _4712 = _4506;
    float _4714 = _4564;
    float _4716 = _4494;
    float _4718 = _4536;
    float _4720 = _4512;
    float _4722 = _4556;
    float _4724 = fma(_3903, -0.5, 0.5);
    float _4726 = precise::clamp(_4724, 0.0, 1.0);
    float _4728 = -_4712;
    float _4730 = _4728 + _4714;
    float _4732 = -_4716;
    float _4734 = _4732 + _4718;
    float _4736 = -_4720;
    float _4738 = _4736 + _4722;
    bool _4740 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4742 = fma(_4726, _4730, _4712);
    float _4744 = fma(_4726, _4734, _4716);
    float _4746 = fma(_4726, _4738, _4720);
    float _4748 = _4742 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _4750 = fma(_4744, 0.298911988735198974609375, _4748);
    float _4752 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4754 = fma(_4746, 0.114477999508380889892578125, _4750);
    out.m_87.w = _4752;
    float _4756 = -_4754;
    float _4758 = _4744 + _4756;
    float _4760 = -_4754;
    float _4762 = _4742 + _4760;
    float _4764 = -_4754;
    float _4766 = _4746 + _4764;
    out.m_91.x = 0.0;
    float _4768 = fma(_4758, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    float _4770 = fma(_4762, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    float _4772 = fma(_4766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    out.m_93.x = _4768;
    out.m_93.y = _4770;
    out.m_93.z = _4772;
    if (!_4740)
    {
        return out;
    }
    float _4774 = -_4009;
    float _4776 = _4774 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4778 = -_4013;
    float _4780 = _4778 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4782 = -_4017;
    float _4784 = _4782 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4786 = _4776 * _4776;
    float _4788 = fma(_4780, _4780, _4786);
    float _4790 = fma(_4784, _4784, _4788);
    float _4792 = sqrt(_4790);
    float _4794 = rsqrt(_4790);
    float _4796 = -_4792;
    float _4798 = _4796 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4800 = _4798 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4802 = precise::clamp(_4800, 0.0, 1.0);
    float _4804 = _4780 * _4794;
    float _4806 = _4776 * _4794;
    float _4808 = abs(_4802);
    float _4810 = log2(_4808);
    float _4812 = _4784 * _4794;
    float _4814 = _4804 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4816 = _3903 * _4806;
    float _4818 = -_4806;
    float _4820 = -_4814;
    float _4822 = fma(_4818, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4820);
    float _4824 = fma(_3899, _4804, _4816);
    float _4826 = -_4812;
    float _4828 = fma(_4826, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4822);
    float _4830 = fma(_3909, _4812, _4824);
    float _4832 = precise::clamp(_4830, 0.0, 1.0);
    float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4836 = _4828 + _4834;
    float _4838 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4840 = _4836 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4842 = precise::clamp(_4840, 0.0, 1.0);
    float _4844 = exp2(_4838);
    float _4846 = _4844 * _4842;
    float _4848 = _4832 * _4846;
    float _4850 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4852 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4854 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4850;
    out.m_91.y = _4852;
    out.m_91.z = _4854;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4626 = false;
    bool _3955 = false;
    bool _530 = false;
    bool _414 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4911 = as_type<float>(_128);
        out.gl_Position.z = _4911;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4980 = as_type<float>(_166);
        out.gl_Position.z = _4980;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    bool _208 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _210 = isnan(_198);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _198 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _222;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _240 = 1.0 / _234;
    float _242 = 1.0 / _230;
    float _244 = _202 * _236;
    bool _246 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_198);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_218;
    float _260 = _258 + 1.0;
    float _262 = _256 * _260;
    float _264 = _206 * _240;
    bool _266 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_198);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -_256;
    float _300 = _298 + 1.0;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _226 * _242;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = _292 * _304;
    float _318 = fma(_280, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _320 = fma(_310, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _322 = fma(_314, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = _276 * _300;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _330 = _320 * _316;
    float _332 = _322 * _316;
    float _334 = _318 * _316;
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = fma(_296, _264, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_342, _264, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_328, _264, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_354, _324, _344);
    float _370 = fma(_352, _244, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _372 = fma(_362, _244, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_366, _244, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_356, _324, _346);
    float _378 = fma(_358, _324, _348);
    float _380 = fma(_370, _262, _368);
    float _382 = fma(_372, _262, _376);
    float _384 = fma(_374, _262, _378);
    float _386 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_238;
    float _394 = _376;
    float _412;
    if (!_392)
    {
        float _396 = in.m_55.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_112);
        float _418 = 1.0 / _416;
        float _420 = _146 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    bool _424 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _426 = isnan(_422);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_422);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _422 + _456;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _466 = 1.0 / _438;
    float _468 = _450 * _462;
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = _454 * _466;
    float _476 = fma(_474, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _476 * _468;
    float _480 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[116].x, _480);
    float _490 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    out.m_59.x = _490;
    out.m_59.y = _492;
    out.m_59.z = _494;
    out.m_59.w = _496;
    float _504 = _390 * _502;
    float _506 = _388 * _500;
    float _508 = _386 * _498;
    bool _510 = !_464;
    float _528;
    if (!_510)
    {
        float _512 = in.m_55.x;
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _516 = _512 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        float _532 = float(_112);
        float _534 = 1.0 / _532;
        float _536 = _146 * _534;
        _528 = _536;
    }
    _530 = false;
    float _538 = _528;
    float _540 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _542 = int(_540);
    float _544 = in.m_55.x;
    bool _546 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _548 = isnan(_538);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = in.m_55.y;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _566 = int(_564);
    float _568 = in.m_55.z;
    float _570 = -_556;
    float _572 = _570 + 1.0;
    float _574 = in.m_61.x;
    float _576 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _578 = int(_576);
    float _580 = float(_542);
    float _582 = 0.0;
    bool _584 = _562;
    float _586 = _572;
    if (_562)
    {
        _582 = 1.0;
    }
    float _588 = _582;
    float _590 = _588;
    if (!_562)
    {
        _590 = 1.2345600128173828125;
    }
    float _592 = _590;
    if (_562)
    {
        _394 = 1.0;
    }
    float _594 = _394;
    float _596 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _598 = int(_596);
    float _600 = float(_566);
    float _602 = _594;
    if (!_562)
    {
        _602 = 7.345489978790283203125;
    }
    float _604 = _602;
    float _606 = 1.0 / _580;
    float _608 = float(_578);
    float _610 = _604 * _544;
    float _612 = 1.0 / _600;
    float _614 = float(uint(_598));
    int _616 = ~_598;
    int _618 = _616 + 1;
    int _620 = _598 + (-1);
    float _622 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _624 = int(_622);
    float _626 = _606 * _146;
    float _628 = 1.0 / _608;
    float _630 = _612 * _146;
    float _632 = _612;
    if (_562)
    {
        _632 = _544;
    }
    float _634 = _632;
    float _636 = _634;
    float _638 = _574;
    if (!_562)
    {
        _636 = _558;
    }
    float _640 = _636;
    float _642 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _644 = int(_642);
    float _646 = float(uint(_624));
    float _648 = _640 * _592;
    float _650 = 1.0 / _614;
    float _652 = _628 * _146;
    float _654 = _628;
    int _656 = _624;
    if (_562)
    {
        _654 = 1.0;
    }
    float _658 = _654;
    float _660 = _658;
    if (!_562)
    {
        _660 = 5.839270114898681640625;
    }
    float _662 = _660;
    float _664 = trunc(_626);
    int _666 = int(_664);
    float _668 = float(uint(_644));
    int _670 = ~_644;
    int _672 = _670 + 1;
    float _674 = 1.0 / _646;
    float _676 = trunc(_630);
    int _678 = int(_676);
    int _680 = as_type<int>(_650) + (-2);
    float _682 = float(uint(_666));
    float _684 = 1.0 / _668;
    float _686 = as_type<float>(_680) * _682;
    int _688 = as_type<int>(_674) + (-2);
    float _690 = _674;
    if (_562)
    {
        _690 = _544;
    }
    float _692 = _690;
    float _694 = _692;
    if (!_562)
    {
        _694 = _568;
    }
    float _696 = _694;
    float _698 = trunc(_652);
    int _700 = int(_698);
    float _702 = float(uint(_678));
    float _704 = _696 * _662;
    float _706 = as_type<float>(_688) * _702;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    float _712 = trunc(_686);
    float _714 = precise::max(_712, 0.0);
    uint _717 = uint(_714);
    int _719 = as_type<int>(_684) + (-2);
    int _721 = ~_624;
    int _723 = _721 + 1;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _727 = _725 != 0;
    float _729 = float(uint(_700));
    float _731 = trunc(_706);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    if (_710)
    {
        bool _737 = _544 > 0.5;
        _584 = _737;
    }
    bool _739 = _584;
    float _741 = as_type<float>(_719) * _729;
    float _743 = 0.0;
    if (!_710)
    {
        _743 = _574;
    }
    float _745 = _743;
    int _747 = _618 * int(_717);
    int _749 = _747 + _666;
    float _751 = floor(_610);
    float _753 = in.m_55.w;
    int _755 = 0;
    float _757 = _745;
    if (_727)
    {
        float _759 = -_574;
        float _761 = _759 + 1.0;
        _755 = as_type<int>(_761);
    }
    int _763 = _755;
    float _765 = float(uint(_749));
    float _767 = trunc(_741);
    float _769 = precise::max(_767, 0.0);
    uint _771 = uint(_769);
    int _773 = _723 * int(_735);
    int _775 = _773 + _678;
    float _777 = as_type<float>(_680) * _765;
    int _779 = as_type<int>(_765);
    float _781 = _777;
    if (_710)
    {
        float _783 = -_574;
        float _785 = _783 + 1.0;
        _779 = as_type<int>(_785);
    }
    int _787 = _779;
    float _789 = float(uint(_775));
    float _791 = trunc(_777);
    float _793 = precise::max(_791, 0.0);
    uint _795 = uint(_793);
    if (_710)
    {
        float _797 = _739 ? as_type<float>(_787) : _574;
        _757 = _797;
    }
    float _799 = _757;
    float _801 = as_type<float>(_688) * _789;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _805 = _803 != 0;
    int _807 = _672 * int(_771);
    int _809 = _807 + _700;
    float _811 = floor(_648);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _819 = _817 != 0;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _823 = _821 != 0;
    bool _825 = _568 > 0.5;
    float _827 = float(uint(_809));
    int _829 = as_type<int>(_801);
    if (!_727)
    {
        _781 = _574;
    }
    float _831 = _781;
    float _833 = trunc(_801);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _831;
    if (_727)
    {
        float _841 = _825 ? as_type<float>(_763) : _574;
        _839 = _841;
    }
    float _843 = _839;
    float _845 = as_type<float>(_719) * _827;
    int _847 = ~_598;
    int _849 = _847 + 1;
    bool _851 = !_819;
    int _853 = _851 ? 0 : 1;
    bool _855 = _753 > 0.5;
    float _857 = trunc(_845);
    float _859 = precise::max(_857, 0.0);
    uint _861 = uint(_859);
    int _863 = int(_717) + int(_795);
    if (_805)
    {
        float _865 = -_574;
        float _867 = _865 + 1.0;
        _829 = as_type<int>(_867);
    }
    int _869 = _829;
    float _871 = -_751;
    float _873 = _610 + _871;
    float _875 = -_811;
    float _877 = _648 + _875;
    bool _879 = _558 > 0.5;
    float _881 = floor(_704);
    int _883 = _849 * _863;
    int _885 = _883 + _666;
    int _887 = int(_735) + int(_837);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _891 = _889 != 0;
    if (_805)
    {
        float _893 = _879 ? as_type<float>(_869) : _574;
        _638 = _893;
    }
    float _895 = _638;
    int _897 = int(_771) + int(_861);
    int _899 = ~_624;
    int _901 = _899 + 1;
    bool _903 = uint(_885) >= uint(_598);
    float _905 = float(_112);
    int _907 = _901 * _887;
    int _909 = _907 + _678;
    float _911 = -_881;
    float _913 = _704 + _911;
    bool _915 = !_891;
    int _917 = _915 ? 0 : 1;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _921 = _919 != 0;
    float _923 = 1.0 / _905;
    int _925 = ~_644;
    int _927 = _925 + 1;
    float _929 = float(_598);
    bool _931 = !_921;
    int _933 = _931 ? 0 : 1;
    bool _935 = uint(_909) >= uint(_624);
    float _937 = _873 * _929;
    int _939 = _927 * _897;
    int _941 = _939 + _700;
    float _943 = float(_666);
    bool _945 = !_903;
    int _947 = _945 ? 0 : (-1);
    bool _949 = !_815;
    int _951 = _949 ? 0 : 1;
    float _953 = trunc(_937);
    int _955 = int(_953);
    bool _957 = uint(_941) >= uint(_644);
    bool _959 = _943 >= _929;
    bool _961 = isnan(_943);
    bool _963 = _959 || _961;
    bool _965 = isnan(_929);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    int _971 = ~_863;
    int _973 = _971 + _947;
    int _975 = _973 + 1;
    bool _977 = !_935;
    int _979 = _977 ? 0 : (-1);
    float _981 = float(_624);
    float _983 = trunc(_969);
    int _985 = int(_983);
    float _987 = float(_678);
    int _989 = ~_887;
    int _991 = _989 + _979;
    int _993 = _991 + 1;
    bool _995 = _987 >= _981;
    bool _997 = isnan(_987);
    bool _999 = _995 || _997;
    bool _1001 = isnan(_981);
    bool _1003 = _999 || _1001;
    float _1005 = float(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1009 = _1007 != 0;
    int _1011 = _624 * _993;
    int _1013 = _1011 + _678;
    int _1015 = abs(_917);
    bool _1017 = !_1009;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = trunc(_1005);
    int _1023 = int(_1021);
    float _1025 = _929 * _146;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1033 = _1031 != 0;
    int _1035 = ~_985;
    int _1037 = _1035 + 1;
    int _1039 = _1037 + 1;
    int _1041 = _955 * _1015;
    int _1043 = _1041 + _666;
    float _1045 = _1025 * _923;
    bool _1047 = !_1029;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = _598 * _975;
    int _1053 = _1051 + _666;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1057 = _1055 != 0;
    int _1059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1061 = _1059 != 0;
    bool _1063 = _598 == 0;
    float _1065 = trunc(_1045);
    int _1067 = int(_1065);
    bool _1069 = !_1033;
    int _1071 = _1069 ? 0 : 1;
    bool _1073 = !_1063;
    int _1075 = _1073 ? _1053 : (-1);
    bool _1077 = _624 == 0;
    int _1079 = abs(_853);
    int _1081 = _1075 * _1039;
    int _1083 = ~_1023;
    int _1085 = _1083 + 1;
    int _1087 = _1085 + 1;
    bool _1089 = !_1077;
    int _1091 = _1089 ? _1013 : (-1);
    int _1093 = _985 * _620;
    int _1095 = _1093 + _1081;
    int _1097 = abs(_951);
    int _1099 = _1087 * _1091;
    float _1101 = _981 * _877;
    int _1103 = _624 + (-1);
    float _1105 = _923 * _146;
    bool _1107 = !_823;
    int _1109 = _1107 ? 0 : 1;
    int _1111 = _1095 * _1079;
    int _1113 = abs(_1049);
    float _1115 = _981 * _1105;
    int _1117 = _1023 * _1103;
    int _1119 = _1117 + _1099;
    int _1121 = abs(_1109);
    int _1123 = _1067 * _1097;
    int _1125 = _1123 + _1111;
    int _1127 = abs(_1019);
    float _1129 = trunc(_1101);
    int _1131 = int(_1129);
    int _1133 = abs(_933);
    int _1135 = _1043 * _1121;
    int _1137 = _1135 + _1125;
    int _1139 = abs(_1071);
    float _1141 = in.m_61.y;
    bool _1143 = !_1057;
    int _1145 = _1143 ? 0 : 1;
    int _1147 = _955 * _1133;
    int _1149 = _1147 + _1137;
    float _1151 = trunc(_1115);
    int _1153 = int(_1151);
    float _1155 = float(uint(_1043));
    float _1157 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1159 = _1119 * _1139;
    float _1161 = as_type<float>(_680) * _1155;
    float _1163 = float(uint(_1149));
    bool _1165 = !_957;
    int _1167 = _1165 ? 0 : (-1);
    int _1169 = _1131 * _1127;
    int _1171 = _1169 + _678;
    int _1173 = abs(_1145);
    float _1175 = trunc(_1161);
    float _1177 = precise::max(_1175, 0.0);
    uint _1179 = uint(_1177);
    int _1181 = ~_897;
    int _1183 = _1181 + _1167;
    int _1185 = _1183 + 1;
    float _1187 = float(_644);
    int _1189 = _1153 * _1113;
    int _1191 = _1189 + _1159;
    float _1193 = as_type<float>(_680) * _1163;
    float _1195 = float(_700);
    float _1197 = _1187 * _913;
    int _1199 = ~_598;
    int _1201 = _1199 + 1;
    float _1203 = trunc(_1193);
    float _1205 = precise::max(_1203, 0.0);
    uint _1207 = uint(_1205);
    bool _1209 = _1195 >= _1187;
    bool _1211 = isnan(_1195);
    bool _1213 = _1209 || _1211;
    bool _1215 = isnan(_1187);
    bool _1217 = _1213 || _1215;
    float _1219 = float(_1217);
    int _1221 = _1171 * _1173;
    int _1223 = _1221 + _1191;
    bool _1225 = !_1061;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = -_1141;
    float _1231 = _1229 + 1.0;
    int _1233 = _1201 * int(_1179);
    int _1235 = _1233 + _1043;
    int _1237 = ~_598;
    int _1239 = _1237 + 1;
    int _1241 = abs(_1227);
    float _1243 = trunc(_1219);
    int _1245 = int(_1243);
    float _1247 = float(uint(_1235));
    bool _1249 = _558 > 0.5;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    float _1255 = as_type<float>(_680) * _1247;
    int _1257 = _1239 * int(_1207);
    int _1259 = _1257 + _1149;
    float _1261 = trunc(_1197);
    int _1263 = int(_1261);
    int _1265 = _1249 ? as_type<int>(_1231) : as_type<int>(_1141);
    float _1267 = float(uint(_1259));
    float _1269 = _1253 ? as_type<float>(_1265) : _1141;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1273 = _1271 != 0;
    float _1275 = trunc(_1255);
    float _1277 = precise::max(_1275, 0.0);
    uint _1279 = uint(_1277);
    int _1281 = _1131 * _1241;
    int _1283 = _1281 + _1223;
    float _1285 = as_type<float>(_680) * _1267;
    int _1287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1289 = _1287 != 0;
    int _1291 = _644 * _1185;
    int _1293 = _1291 + _700;
    int _1295 = _855 ? as_type<int>(_1231) : as_type<int>(_1141);
    float _1297 = _1187 * _1105;
    float _1299 = float(uint(_1283));
    float _1301 = trunc(_1285);
    float _1303 = precise::max(_1301, 0.0);
    uint _1305 = uint(_1303);
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1313 = _1311 != 0;
    bool _1315 = !_1289;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = as_type<float>(_688) * _1299;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1323 = _1321 != 0;
    bool _1325 = _644 == 0;
    int _1327 = ~_1245;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = trunc(_1319);
    float _1335 = precise::max(_1333, 0.0);
    uint _1337 = uint(_1335);
    bool _1339 = !_1325;
    int _1341 = _1339 ? _1293 : (-1);
    bool _1343 = !_1313;
    int _1345 = _1343 ? 0 : 1;
    bool _1347 = _568 > 0.5;
    int _1349 = _1331 * _1341;
    int _1351 = _644 + (-1);
    int _1353 = abs(_1317);
    int _1355 = abs(_1345);
    int _1357 = _1245 * _1351;
    int _1359 = _1357 + _1349;
    int _1361 = ~_624;
    int _1363 = _1361 + 1;
    int _1365 = _1263 * _1353;
    int _1367 = _1365 + _700;
    float _1369 = _1273 ? as_type<float>(_1295) : _1141;
    float _1371 = _1141;
    if (_1323)
    {
        float _1373 = _1347 ? _1231 : _1141;
        _1371 = _1373;
    }
    float _1375 = _1371;
    int _1377 = int(_1207) + int(_1305);
    int _1379 = _1359 * _1355;
    float _1381 = trunc(_1297);
    int _1383 = int(_1381);
    int _1385 = _1363 * int(_1337);
    int _1387 = _1385 + _1283;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1391 = _1389 != 0;
    bool _1393 = !_1309;
    int _1395 = _1393 ? 0 : 1;
    float _1397 = float(uint(_1387));
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1401 = _1399 != 0;
    bool _1403 = !_1391;
    int _1405 = _1403 ? 0 : 1;
    float _1407 = as_type<float>(_688) * _1397;
    int _1409 = ~_598;
    int _1411 = _1409 + 1;
    int _1413 = abs(_1395);
    float _1415 = trunc(_1407);
    float _1417 = precise::max(_1415, 0.0);
    uint _1419 = uint(_1417);
    bool _1421 = !_1401;
    int _1423 = _1421 ? 0 : 1;
    int _1425 = _1411 * _1377;
    int _1427 = _1425 + _1149;
    int _1429 = abs(_1405);
    int _1431 = _1383 * _1413;
    int _1433 = _1431 + _1379;
    int _1435 = ~_598;
    int _1437 = _1435 + 1;
    int _1439 = abs(_1423);
    int _1441 = int(_1179) + int(_1279);
    int _1443 = _1367 * _1429;
    int _1445 = _1443 + _1433;
    bool _1447 = uint(_1427) >= uint(_598);
    int _1449 = _1437 * _1441;
    int _1451 = _1449 + _1043;
    float _1453 = float(uint(_1171));
    bool _1455 = !_1447;
    int _1457 = _1455 ? 0 : (-1);
    int _1459 = _1263 * _1439;
    int _1461 = _1459 + _1445;
    bool _1463 = uint(_1451) >= uint(_598);
    float _1465 = as_type<float>(_688) * _1453;
    int _1467 = ~_1377;
    int _1469 = _1467 + _1457;
    int _1471 = _1469 + 1;
    float _1473 = float(uint(_1461));
    float _1475 = trunc(_1465);
    float _1477 = precise::max(_1475, 0.0);
    uint _1479 = uint(_1477);
    int _1481 = int(_1337) + int(_1419);
    int _1483 = _598 * _1471;
    int _1485 = _1483 + _1149;
    bool _1487 = !_1463;
    int _1489 = _1487 ? 0 : (-1);
    float _1491 = as_type<float>(_719) * _1473;
    int _1493 = ~_624;
    int _1495 = _1493 + 1;
    int _1497 = ~_1441;
    int _1499 = _1497 + _1489;
    int _1501 = _1499 + 1;
    bool _1503 = !_1063;
    int _1505 = _1503 ? _1485 : (-1);
    float _1507 = trunc(_1491);
    float _1509 = precise::max(_1507, 0.0);
    uint _1511 = uint(_1509);
    int _1513 = _1495 * _1481;
    int _1515 = _1513 + _1283;
    int _1517 = ~_624;
    int _1519 = _1517 + 1;
    int _1521 = _598 * _1501;
    int _1523 = _1521 + _1043;
    int _1525 = ~_644;
    int _1527 = _1525 + 1;
    bool _1529 = uint(_1515) >= uint(_624);
    int _1531 = _1519 * int(_1479);
    int _1533 = _1531 + _1171;
    bool _1535 = !_1529;
    int _1537 = _1535 ? 0 : (-1);
    int _1539 = _1505 & 3;
    bool _1541 = _1539 != 0;
    int _1543 = ~_1481;
    int _1545 = _1543 + _1537;
    int _1547 = _1545 + 1;
    int _1549 = _1527 * int(_1511);
    int _1551 = _1549 + _1461;
    float _1553 = float(uint(_1533));
    bool _1555 = uint(_1539) > 1u;
    int _1557 = _624 * _1547;
    int _1559 = _1557 + _1283;
    int _1561 = _1505 & 3;
    bool _1563 = _1561 != 0;
    float _1565 = as_type<float>(_688) * _1553;
    float _1567 = float(uint(_1551));
    bool _1569 = !_1077;
    int _1571 = _1569 ? _1559 : (-1);
    float _1573 = trunc(_1565);
    float _1575 = precise::max(_1573, 0.0);
    uint _1577 = uint(_1575);
    int _1579 = _1563 ? 0 : 1;
    float _1581 = as_type<float>(_719) * _1567;
    bool _1583 = !_1063;
    int _1585 = _1583 ? _1523 : (-1);
    float _1587 = float(uint(_1367));
    int _1589 = _1571 & 3;
    bool _1591 = _1589 != 0;
    float _1593 = as_type<float>(_719) * _1587;
    int _1595 = ~_1579;
    int _1597 = _1595 + 1;
    int _1599 = _1597 + 1;
    float _1601 = _544 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1603 = _1599;
    if (!_1555)
    {
        int _1605 = ~_1579;
        int _1607 = _1605 + 1;
        _1603 = _1607;
    }
    int _1609 = _1603;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1615 = _1613 != 0;
    float _1617 = trunc(_1581);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    int _1623 = _1591 ? 0 : 1;
    float _1625 = -_1611;
    float _1627 = fma(_1601, 2.0, _1625);
    bool _1629 = _1589 != 3;
    bool _1631 = uint(_1539) >= 2u;
    float _1633 = -_146;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1627);
    bool _1637 = !_1615;
    int _1639 = _1637 ? 0 : 1;
    float _1641 = trunc(_1593);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    bool _1647 = uint(_1589) >= 2u;
    int _1649 = _1631 ? 0 : 1;
    bool _1651 = _1539 != 3;
    int _1653 = _1647 ? 0 : 1;
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1661 = _1659 != 0;
    int _1663 = int(_1479) + int(_1577);
    int _1665 = ~_624;
    int _1667 = _1665 + 1;
    float _1669 = in.m_48.x;
    float _1671 = in.m_48.y;
    float _1673 = in.m_48.z;
    int _1675 = ~_1653;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    int _1681 = _1679;
    if (_1629)
    {
        int _1683 = ~_1653;
        int _1685 = _1683 + 1;
        _1681 = _1685;
    }
    int _1687 = _1681;
    int _1689 = ~_644;
    int _1691 = _1689 + 1;
    int _1693 = ~_1649;
    int _1695 = _1693 + 1;
    int _1697 = _1695 + 1;
    int _1699 = _1667 * _1663;
    int _1701 = _1699 + _1171;
    int _1703 = int(_1511) + int(_1621);
    int _1705 = _1691 * int(_1645);
    int _1707 = _1705 + _1367;
    int _1709 = _1697;
    int _1711 = int(_1645);
    if (_1651)
    {
        int _1713 = ~_1649;
        int _1715 = _1713 + 1;
        _1709 = _1715;
    }
    int _1717 = _1709;
    int _1719 = ~_644;
    int _1721 = _1719 + 1;
    bool _1723 = uint(_1701) >= uint(_624);
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1729 = _1721 * _1703;
    int _1731 = _1729 + _1461;
    float _1733 = float(uint(_1707));
    float _1735 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1737 = !_1723;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1743 = 1.0 / _1727;
    bool _1745 = uint(_1731) >= uint(_644);
    float _1747 = as_type<float>(_719) * _1733;
    float _1749 = _544 * 2.0;
    float _1751 = fma(_1157, -2.0, _1741);
    bool _1753 = !_1745;
    int _1755 = _1753 ? 0 : (-1);
    float _1757 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1759 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1761 = uint(_1589) > 1u;
    float _1763 = _544 + _558;
    float _1765 = floor(_1749);
    float _1767 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1735);
    float _1769 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1757);
    float _1771 = fma(_1669, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1759);
    int _1773 = ~_1663;
    int _1775 = _1773 + _1739;
    int _1777 = _1775 + 1;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1779;
    float _1783 = _1763 + (-1.0);
    float _1785 = trunc(_1747);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    int _1791 = ~_1703;
    int _1793 = _1791 + _1755;
    int _1795 = _1793 + 1;
    int _1797 = _624 * _1777;
    int _1799 = _1797 + _1171;
    float _1801 = _1781 * _1743;
    float _1803 = fma(_1783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1805 = ~_1623;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _644 * _1795;
    int _1813 = _1811 + _1461;
    bool _1815 = !_1657;
    int _1817 = _1815 ? 0 : 1;
    float _1819 = _558 + _568;
    int _1821 = _1809;
    if (!_1761)
    {
        int _1823 = ~_1623;
        int _1825 = _1823 + 1;
        _1821 = _1825;
    }
    int _1827 = _1821;
    float _1829 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1767);
    bool _1831 = _644 == 0;
    float _1833 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1771);
    bool _1835 = !_1077;
    int _1837 = _1835 ? _1799 : (-1);
    float _1839 = _1829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1841 = _1539 != 3;
    float _1843 = _1819 + (-1.0);
    bool _1845 = !_1831;
    int _1847 = _1845 ? _1813 : (-1);
    float _1849 = _1833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1851 = _1765 > 0.0;
    bool _1853 = _1765 >= 0.0;
    bool _1855 = isnan(_1765);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.0);
    bool _1861 = _1857 || _1859;
    float _1863 = _558 * 2.0;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1867 = _1865 != 0;
    bool _1869 = !_1541;
    int _1871 = _1869 ? 0 : 1;
    int _1873 = _1847 & 3;
    bool _1875 = _1873 != 0;
    float _1877 = floor(_1863);
    int _1879 = int(_1645) + int(_1789);
    int _1881 = ~_644;
    int _1883 = _1881 + 1;
    int _1885 = _1571 & 3;
    bool _1887 = _1885 != 0;
    bool _1889 = !_1661;
    int _1891 = _1889 ? 0 : 1;
    int _1893 = _1883 * _1879;
    int _1895 = _1893 + _1367;
    bool _1897 = _1873 != 3;
    bool _1899 = !_1887;
    int _1901 = _1899 ? 0 : 1;
    bool _1903 = uint(_1873) > 1u;
    bool _1905 = !_1841;
    int _1907 = _1905 ? 0 : (-1);
    bool _1909 = uint(_1873) >= 2u;
    int _1911 = _1875 ? 0 : 1;
    int _1913 = _1909 ? 0 : 1;
    float _1915 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1867)
    {
        _656 = 0;
    }
    int _1917 = _656;
    bool _1919 = uint(_1895) >= uint(_644);
    int _1921 = _1917;
    if (!_1867)
    {
        _1921 = 2;
    }
    int _1923 = _1921;
    int _1925 = ~_1913;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    bool _1931 = !_1919;
    int _1933 = _1931 ? 0 : (-1);
    int _1935 = _1929;
    if (_1897)
    {
        int _1937 = ~_1913;
        int _1939 = _1937 + 1;
        _1935 = _1939;
    }
    int _1941 = _1935;
    int _1943 = ~_1911;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    bool _1949 = _1923 != 2;
    int _1951 = _1947;
    if (!_1903)
    {
        int _1953 = ~_1911;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    int _1959 = _1505 >> 31;
    bool _1961 = _1589 != 3;
    int _1963 = ~_1879;
    int _1965 = _1963 + _1933;
    int _1967 = _1965 + 1;
    int _1969 = _1847 >> 31;
    bool _1971 = _1877 > 0.0;
    int _1973 = _644 * _1967;
    int _1975 = _1973 + _1367;
    bool _1977 = _1877 >= 0.0;
    bool _1979 = isnan(_1877);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    int _1987 = _1959 & 3;
    int _1989 = _1969 & 3;
    int _1991 = _1571 >> 31;
    int _1993 = _1505 + _1987;
    int _1995 = _1847 + _1989;
    int _1997 = _1861 ? 0 : 1;
    bool _1999 = _1873 != 3;
    float _2001 = _568 * 2.0;
    int _2003 = _1991 & 3;
    int _2005 = _1993 >> 2;
    if (_1867)
    {
        _1711 = 0;
    }
    int _2007 = _1711;
    int _2009 = _1995 >> 2;
    int _2011 = _2007;
    if (!_1867)
    {
        _2011 = 1;
    }
    int _2013 = _2011;
    int _2015 = _1847 & 3;
    bool _2017 = _2015 != 0;
    int _2019 = _1571 + _2003;
    int _2021 = _2005 << 4;
    int _2023 = _2021 + 368;
    float _2025 = floor(_2001);
    int _2027 = _2009 << 4;
    int _2029 = _2027 + 656;
    bool _2031 = !_2017;
    int _2033 = _2031 ? 0 : 1;
    uint _2035 = uint(int(uint(_2023) >> uint(2)));
    uint _2037 = uint(int(uint(int(_2035)) >> uint(2)));
    int _2039 = int(_2035) & 3;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[int(_2037)][_2039];
    int _2043 = int(_2035) + 1;
    uint _2045 = uint(int(uint(_2043) >> uint(2)));
    int _2047 = _2043 & 3;
    float _2049 = (*spvDescriptorSet0.vp_c9)._m0[int(_2045)][_2047];
    bool _2051 = _644 == 0;
    bool _2053 = !_1961;
    int _2055 = _2053 ? 0 : (-1);
    bool _2057 = !_2051;
    int _2059 = _2057 ? _1975 : (-1);
    bool _2061 = !_1999;
    int _2063 = _2061 ? 0 : (-1);
    uint _2065 = uint(int(uint(_2029) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2087 = _2085 != 0;
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2091 = _2089 != 0;
    float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2095 = _538 + _2093;
    int _2097 = _2019 >> 2;
    bool _2099 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2101 = isnan(_538);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = fma(_1801, _2095, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2113 = ~_1997;
    int _2115 = _2113 + 1;
    int _2117 = _2115 + 1;
    float _2119 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1769);
    int _2121 = _2097 << 4;
    int _2123 = _2121 + 512;
    int _2125 = _2117;
    if (!_1851)
    {
        int _2127 = ~_1997;
        int _2129 = _2127 + 1;
        _2125 = _2129;
    }
    int _2131 = _2125;
    float _2133 = _2119 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2135 = !_2083;
    int _2137 = _2135 ? 0 : 1;
    uint _2139 = uint(int(uint(_2123) >> uint(2)));
    uint _2141 = uint(int(uint(int(_2139)) >> uint(2)));
    int _2143 = int(_2139) & 3;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[int(_2141)][_2143];
    int _2147 = int(_2139) + 1;
    uint _2149 = uint(int(uint(_2147) >> uint(2)));
    int _2151 = _2147 & 3;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[int(_2149)][_2151];
    bool _2155 = _2025 > 0.0;
    bool _2157 = _2025 >= 0.0;
    bool _2159 = isnan(_2025);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(0.0);
    bool _2165 = _2161 || _2163;
    float _2167 = _2109 * _572;
    int _2169 = abs(_1957);
    int _2171 = _2165 ? 0 : 1;
    float _2173 = _2111 * _2167;
    float _2175 = -_2109;
    float _2177 = _2175 + 1.0;
    int _2179 = _2023 + 8;
    uint _2181 = uint(int(uint(_2179) >> uint(2)));
    uint _2183 = uint(int(uint(int(_2181)) >> uint(2)));
    int _2185 = int(_2181) & 3;
    float _2187 = (*spvDescriptorSet0.vp_c9)._m0[int(_2183)][_2185];
    int _2189 = int(_2181) + 1;
    uint _2191 = uint(int(uint(_2189) >> uint(2)));
    int _2193 = _2189 & 3;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[int(_2191)][_2193];
    bool _2197 = _2013 != 1;
    float _2199 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2173);
    int _2201 = ~_2171;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2209 = int(_2207);
    int _2211 = _2205;
    if (!_2155)
    {
        int _2213 = ~_2171;
        int _2215 = _2213 + 1;
        _2211 = _2215;
    }
    int _2217 = _2211;
    float _2219 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2199);
    int _2221 = _2123 + 8;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    uint _2225 = uint(int(uint(int(_2223)) >> uint(2)));
    int _2227 = int(_2223) & 3;
    float _2229 = (*spvDescriptorSet0.vp_c9)._m0[int(_2225)][_2227];
    int _2231 = int(_2223) + 1;
    uint _2233 = uint(int(uint(_2231) >> uint(2)));
    int _2235 = _2231 & 3;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[int(_2233)][_2235];
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2241 = abs(_1609);
    int _2243 = abs(_1827);
    int _2245 = _2029 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = abs(_1871);
    int _2265 = ~_2241;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    int _2271 = ~_2169;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    int _2277 = ~_2263;
    int _2279 = _2277 + 1;
    int _2281 = _2279 + 1;
    int _2283 = _2269 * as_type<int>(_2049);
    int _2285 = _2275 * as_type<int>(_2079);
    int _2287 = abs(_1901);
    int _2289 = _2281 * as_type<int>(_2041);
    int _2291 = _2289 + _2283;
    int _2293 = abs(_2033);
    float _2295 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2297 = int(_2295);
    int _2299 = abs(_1717);
    int _2301 = abs(_1687);
    int _2303 = ~_2243;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    int _2309 = ~_2299;
    int _2311 = _2309 + 1;
    int _2313 = _2311 + 1;
    int _2315 = ~_2287;
    int _2317 = _2315 + 1;
    int _2319 = _2317 + 1;
    int _2321 = _2307 * as_type<int>(_2153);
    float _2323 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2325 = int(_2323);
    int _2327 = ~_2293;
    int _2329 = _2327 + 1;
    int _2331 = _2329 + 1;
    int _2333 = _2313 * as_type<int>(_2187);
    int _2335 = _2333 + _2291;
    int _2337 = ~_2301;
    int _2339 = _2337 + 1;
    int _2341 = _2339 + 1;
    int _2343 = _2319 * as_type<int>(_2145);
    int _2345 = _2343 + _2321;
    int _2347 = abs(_1941);
    int _2349 = _2331 * as_type<int>(_2071);
    int _2351 = _2349 + _2285;
    int _2353 = abs(_2063);
    int _2355 = ~_2347;
    int _2357 = _2355 + 1;
    int _2359 = _2357 + 1;
    int _2361 = _2341 * as_type<int>(_2229);
    int _2363 = _2361 + _2345;
    int _2365 = abs(_1907);
    int _2367 = abs(_2055);
    float _2369 = float(uint(_2209));
    int _2371 = ~_2353;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = _2359 * as_type<int>(_2253);
    int _2379 = _2377 + _2351;
    int _2381 = ~_2365;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = float(uint(_2297));
    float _2389 = 1.0 / _2369;
    int _2391 = ~_2367;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _2375 * as_type<int>(_2261);
    int _2399 = _2397 + _2379;
    int _2401 = abs(_1639);
    int _2403 = _2385 * as_type<int>(_2195);
    int _2405 = _2403 + _2335;
    int _2407 = abs(_1817);
    int _2409 = _2395 * as_type<int>(_2237);
    int _2411 = _2409 + _2363;
    int _2413 = abs(_1891);
    float _2415 = 1.0 / _2387;
    int _2417 = abs(_2209);
    int _2419 = ~_2401;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    int _2425 = ~_2407;
    int _2427 = _2425 + 1;
    int _2429 = _2427 + 1;
    float _2431 = float(uint(_2325));
    int _2433 = _2405 * _2423;
    int _2435 = ~_2413;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    int _2441 = _2429 * _2411;
    float _2443 = float(uint(_2417));
    int _2445 = abs(_2297);
    int _2447 = _2439 * _2399;
    float _2449 = 1.0 / _2431;
    int _2451 = abs(_2325);
    int _2453 = _1585 * _2401;
    int _2455 = _2453 + _2433;
    float _2457 = float(uint(_2445));
    int _2459 = _1837 * _2407;
    int _2461 = _2459 + _2441;
    int _2463 = _2059 * _2413;
    int _2465 = _2463 + _2447;
    int _2467 = as_type<int>(_2389) + (-2);
    float _2469 = 1.0 / _2443;
    float _2471 = float(uint(_2455));
    int _2473 = as_type<int>(_2415) + (-2);
    float _2475 = as_type<float>(_2467) * _2471;
    float _2477 = float(uint(_2461));
    float _2479 = 1.0 / _2457;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2483 = float(uint(_2451));
    float _2485 = as_type<float>(_2473) * _2477;
    int _2487 = abs(_2455);
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2491 = as_type<int>(_2449) + (-2);
    float _2493 = 1.0 / _2483;
    float _2495 = float(uint(_2465));
    int _2497 = as_type<int>(_2469) + (-2);
    float _2499 = float(uint(_2487));
    float _2501 = as_type<float>(_2491) * _2495;
    float _2503 = trunc(_2475);
    float _2505 = precise::max(_2503, 0.0);
    uint _2507 = uint(_2505);
    float _2509 = as_type<float>(_2497) * _2499;
    int _2511 = abs(_2461);
    float _2513 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2515 = as_type<int>(_2479) + (-2);
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2519 = float(uint(_2511));
    float _2521 = trunc(_2485);
    float _2523 = precise::max(_2521, 0.0);
    uint _2525 = uint(_2523);
    int _2527 = abs(_2465);
    float _2529 = _2513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2531 = _2529;
    if (_1949)
    {
        _586 = _544;
    }
    float _2533 = _586;
    float _2535 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2537 = _2533;
    float _2539 = _2535;
    if (!_1949)
    {
        _2537 = _568;
    }
    float _2541 = _2537;
    float _2543 = as_type<float>(_2515) * _2519;
    float _2545 = trunc(_2501);
    float _2547 = precise::max(_2545, 0.0);
    uint _2549 = uint(_2547);
    int _2551 = ~_2209;
    int _2553 = _2551 + 1;
    float _2555 = _2541 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2557 = ~_2297;
    int _2559 = _2557 + 1;
    int _2561 = as_type<int>(_2493) + (-2);
    int _2563 = _2553 * int(_2507);
    int _2565 = _2563 + _2455;
    float _2567 = float(uint(_2527));
    float _2569 = trunc(_2509);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    int _2575 = ~_2325;
    int _2577 = _2575 + 1;
    float _2579 = -_2239;
    float _2581 = fma(_2555, 2.0, _2579);
    int _2583 = ~_2417;
    int _2585 = _2583 + 1;
    float _2587 = as_type<float>(_2561) * _2567;
    int _2589 = _2559 * int(_2525);
    int _2591 = _2589 + _2461;
    float _2593 = float(uint(_2565));
    float _2595 = -_146;
    float _2597 = fma(_2595, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2581);
    float _2599 = trunc(_2543);
    float _2601 = precise::max(_2599, 0.0);
    uint _2603 = uint(_2601);
    int _2605 = _2577 * int(_2549);
    int _2607 = _2605 + _2465;
    float _2609 = float(uint(_2591));
    float _2611 = _2219 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2613 = as_type<float>(_2467) * _2593;
    int _2615 = ~_2445;
    int _2617 = _2615 + 1;
    float _2619 = float(uint(_2607));
    float _2621 = trunc(_2587);
    float _2623 = precise::max(_2621, 0.0);
    uint _2625 = uint(_2623);
    int _2627 = _2585 * int(_2573);
    int _2629 = _2627 + _2487;
    float _2631 = as_type<float>(_2473) * _2609;
    out.m_63.x = _2529;
    out.m_63.y = _2535;
    out.m_63.z = _2489;
    out.m_63.w = _2611;
    float _2633 = as_type<float>(_2491) * _2619;
    float _2635 = float(uint(_2629));
    int _2637 = _2617 * int(_2603);
    int _2639 = _2637 + _2511;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2643 = trunc(_2631);
    float _2645 = precise::max(_2643, 0.0);
    uint _2647 = uint(_2645);
    float _2649 = as_type<float>(_2497) * _2635;
    int _2651 = ~_2451;
    int _2653 = _2651 + 1;
    float _2655 = float(uint(_2639));
    float _2657 = _2611;
    if (!_2197)
    {
        _2539 = _568;
    }
    float _2659 = _2539;
    float _2661 = trunc(_2613);
    float _2663 = precise::max(_2661, 0.0);
    uint _2665 = uint(_2663);
    float _2667 = _2659;
    if (_2197)
    {
        _2667 = _558;
    }
    float _2669 = _2667;
    float _2671 = as_type<float>(_2515) * _2655;
    if (!_2197)
    {
        _2657 = _558;
    }
    float _2673 = _2657;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2677 = abs(_2137);
    float _2679 = fma(_2669, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2641);
    int _2681 = _2653 * int(_2625);
    int _2683 = _2681 + _2527;
    float _2685 = trunc(_2633);
    float _2687 = precise::max(_2685, 0.0);
    uint _2689 = uint(_2687);
    float _2691 = _2673;
    if (!_2197)
    {
        _2531 = _2673;
    }
    float _2693 = _2531;
    float _2695 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2679);
    float _2697 = _2693;
    if (_2197)
    {
        _2691 = _544;
    }
    float _2699 = _2691;
    float _2701 = float(uint(_2683));
    int _2703 = int(_2525) + int(_2647);
    float _2705 = trunc(_2649);
    float _2707 = precise::max(_2705, 0.0);
    uint _2709 = uint(_2707);
    int _2711 = int(_2507) + int(_2665);
    float _2713 = as_type<float>(_2561) * _2701;
    float _2715 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2675);
    int _2717 = ~_2297;
    int _2719 = _2717 + 1;
    int _2721 = ~_2209;
    int _2723 = _2721 + 1;
    float _2725 = trunc(_2671);
    float _2727 = precise::max(_2725, 0.0);
    uint _2729 = uint(_2727);
    int _2731 = int(_2549) + int(_2689);
    int _2733 = _2723 * _2711;
    int _2735 = _2733 + _2455;
    float _2737 = as_type<float>(_2689);
    float _2739 = _2701;
    if (_1949)
    {
        _2737 = _558;
    }
    float _2741 = _2737;
    float _2743 = _2741;
    if (!_1949)
    {
        _2743 = _544;
    }
    float _2745 = _2743;
    float _2747 = trunc(_2713);
    float _2749 = precise::max(_2747, 0.0);
    uint _2751 = uint(_2749);
    int _2753 = _2719 * _2703;
    int _2755 = _2753 + _2461;
    int _2757 = int(_2573) + int(_2709);
    bool _2759 = uint(_2735) >= uint(_2209);
    bool _2761 = uint(_2755) >= uint(_2297);
    int _2763 = ~_2417;
    int _2765 = _2763 + 1;
    int _2767 = ~_2445;
    int _2769 = _2767 + 1;
    int _2771 = int(_2603) + int(_2729);
    int _2773 = _2765 * _2757;
    int _2775 = _2773 + _2487;
    int _2777 = ~_2325;
    int _2779 = _2777 + 1;
    int _2781 = ~_2451;
    int _2783 = _2781 + 1;
    int _2785 = int(_2625) + int(_2751);
    int _2787 = _2779 * _2731;
    int _2789 = _2787 + _2465;
    bool _2791 = !_2759;
    int _2793 = _2791 ? 0 : (-1);
    int _2795 = _2769 * _2771;
    int _2797 = _2795 + _2511;
    bool _2799 = uint(_2775) >= uint(_2417);
    int _2801 = _2783 * _2785;
    int _2803 = _2801 + _2527;
    int _2805 = _2455 ^ _2209;
    int _2807 = as_type<int>(_2745);
    float _2809 = as_type<float>(_2775);
    if (!_2197)
    {
        _2739 = _568;
    }
    float _2811 = _2739;
    bool _2813 = !_2761;
    int _2815 = _2813 ? 0 : (-1);
    float _2817 = _2811;
    if (_2197)
    {
        _2697 = _544;
    }
    float _2819 = _2697;
    if (_2197)
    {
        _2817 = _558;
    }
    float _2821 = _2817;
    bool _2823 = uint(_2797) >= uint(_2445);
    float _2825 = _2819 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2827 = uint(_2789) >= uint(_2325);
    bool _2829 = !_2799;
    int _2831 = _2829 ? 0 : (-1);
    uint _2833 = uint(int(uint(_2805) >> uint(31)));
    int _2835 = ~_2711;
    int _2837 = _2835 + _2793;
    int _2839 = _2837 + 1;
    bool _2841 = !_2827;
    int _2843 = _2841 ? 0 : (-1);
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2847 = ~_2831;
    int _2849 = _2757 + _2847;
    int _2851 = _2849 + 1;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2855 = _2133 + _2853;
    int _2857 = ~int(_2833);
    int _2859 = _2857 + 1;
    int _2861 = _2209 * _2839;
    int _2863 = _2861 + _2455;
    int _2865 = ~_2703;
    int _2867 = _2865 + _2815;
    int _2869 = _2867 + 1;
    float _2871 = _2855 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2873 = uint(_2803) >= uint(_2451);
    bool _2875 = _2209 == 0;
    int _2877 = _2297 * _2869;
    int _2879 = _2877 + _2461;
    int _2881 = ~_2731;
    int _2883 = _2881 + _2843;
    int _2885 = _2883 + 1;
    float _2887 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2889 = _1839 + _2887;
    int _2891 = _2851 ^ _2859;
    bool _2893 = !_2823;
    int _2895 = _2893 ? 0 : (-1);
    int _2897 = _2325 * _2885;
    int _2899 = _2897 + _2465;
    bool _2901 = !_2875;
    int _2903 = _2901 ? _2863 : (-1);
    float _2905 = _2821 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2907 = _2209 == 0;
    float _2909 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2871);
    int _2911 = ~_2859;
    int _2913 = _2911 + _2891;
    int _2915 = _2913 + 1;
    float _2917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2919 = _1849 + _2917;
    bool _2921 = _2297 == 0;
    float _2923 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2925 = !_2907;
    int _2927 = _2925 ? _2915 : (-1);
    float _2929 = fma(_2919, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2909);
    bool _2931 = !_2921;
    int _2933 = _2931 ? _2879 : (-1);
    float _2935 = fma(_2923, _799, -0.5);
    bool _2937 = _2325 == 0;
    bool _2939 = !_2937;
    int _2941 = _2939 ? _2899 : (-1);
    bool _2943 = _2929 >= 0.0;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2947 = _2297 == 0;
    int _2949 = _2461 ^ _2297;
    float _2951 = fma(_2905, -2.0, _2945);
    float _2953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2955 = uint(int(uint(_2949) >> uint(31)));
    float _2957 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2951);
    int _2959 = ~_2895;
    int _2961 = _2771 + _2959;
    int _2963 = _2961 + 1;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2967 = ~int(_2955);
    int _2969 = _2967 + 1;
    float _2971 = _2905;
    if (_2943)
    {
        out.m_51.x = 0.0;
    }
    float _2973 = float(_2217);
    float _2975 = -_2965;
    float _2977 = fma(_2825, 2.0, _2975);
    float _2979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_2943)
    {
        _2971 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2981 = _2971;
    float _2983 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2985 = float(_2677);
    if (_2943)
    {
        float _2987 = _2981 * 5.0;
        _2807 = as_type<int>(_2987);
    }
    int _2989 = _2807;
    int _2991 = _2963 ^ _2969;
    float _2993 = _2985 * _2973;
    float _2995 = float(_2903);
    float _2997 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_2943)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9013 = as_type<float>(_2989);
        out.gl_Position.z = _9013;
    }
    float _2999 = float(_2933);
    float _3001 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3003 = ~_2969;
    int _3005 = _3003 + _2991;
    int _3007 = _3005 + 1;
    float _3009 = fma(_2923, _2995, _1635);
    float _3011 = fma(_2983, -2.0, _2997);
    float _3013 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3015 = !_2947;
    int _3017 = _3015 ? _3007 : (-1);
    bool _3019 = _2325 == 0;
    float _3021 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3023 = -_146;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2977);
    int _3027 = _2465 ^ _2325;
    float _3029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3031 = fma(_3013, _895, -0.5);
    float _3033 = fma(_3001, _2999, _3025);
    float _3035 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3021);
    bool _3037 = !_2873;
    int _3039 = _3037 ? 0 : (-1);
    float _3041 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2715);
    uint _3043 = uint(int(uint(_3027) >> uint(31)));
    float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3049 = float(_2941);
    float _3051 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3035);
    int _3053 = ~_3039;
    int _3055 = _2785 + _3053;
    int _3057 = _3055 + 1;
    float _3059 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3047);
    int _3061 = ~int(_3043);
    int _3063 = _3061 + 1;
    float _3065 = fma(_3001, _843, -0.5);
    float _3067 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3069 = fma(_3013, _3049, _2597);
    int _3071 = _3057 ^ _3063;
    float _3073 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3059);
    float _3075 = fma(_3051, _2935, _3009);
    float _3077 = fma(_3041, _3065, _3033);
    int _3079 = ~_3063;
    int _3081 = _3079 + _3071;
    int _3083 = _3081 + 1;
    float _3085 = fma(_3073, _3031, _3069);
    float _3087 = float(_2927);
    float _3089 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3091 = log2(_3089);
    float _3093 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3095 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1751);
    float _3097 = _3029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3099 = !_3019;
    int _3101 = _3099 ? _3083 : (-1);
    float _3103 = fma(_1269, _3093, -0.5);
    float _3105 = -_3095;
    float _3107 = fma(_3093, _3087, _3105);
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3111 = float(_3017);
    float _3113 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3115 = float(_3101);
    float _3117 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3011);
    float _3119 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3109);
    float _3121 = fma(_1369, _3097, -0.5);
    float _3123 = -_2957;
    float _3125 = fma(_3097, _3111, _3123);
    float _3127 = -_3117;
    float _3129 = fma(_3113, _3115, _3127);
    float _3131 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3119);
    float _3133 = _3091 * _146;
    float _3135 = _2855 * _2855;
    float _3137 = fma(_3131, _3103, _3107);
    float _3139 = fma(_3113, _1375, -0.5);
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3143 = exp2(_3133);
    float _3145 = fma(_2695, _3121, _3125);
    float _3147 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3141);
    float _3149 = fma(_2889, _2889, _3135);
    float _3151 = in.m_65.x;
    float _3153 = in.m_65.y;
    float _3155 = in.m_65.z;
    float _3157 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3159 = 1.0 + _3157;
    float _3161 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3147);
    float _3163 = fma(_2919, _2919, _3149);
    bool _3165 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3167 = isnan(1.0);
    bool _3169 = _3165 || _3167;
    bool _3171 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3173 = _3169 || _3171;
    float _3175 = 1.0 / _3159;
    float _3177 = fma(_3161, _3139, _3129);
    bool _3179 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3181 = isnan(0.0);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3187 = _3183 || _3185;
    float _3189 = _3085 + 0.5;
    float _3191 = _2993 * (-2.0);
    float _3193 = _3177 + 0.5;
    float _3195 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3197 = -_3143;
    float _3199 = _3197 + 1.0;
    float _3201 = rsqrt(_3163);
    float _3203 = _3075 + 0.5;
    float _3205 = _3077 + 0.5;
    float _3207 = _3137 + 0.5;
    float _3209 = _3187 ? _3199 : 0.0;
    float _3211 = _3145 + 0.5;
    float _3213 = _3195 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3215 = _1985 ? 0 : 1;
    out.m_67.x = _3189;
    out.m_67.y = _3193;
    if (_3173)
    {
        float _3217 = _3209 * _3175;
        _150 = _3217;
    }
    float _3219 = _150;
    bool _3221 = !_2087;
    int _3223 = _3221 ? 0 : 1;
    float _3225 = fma(_1803, _3191, _1803);
    out.m_69.x = _3203;
    out.m_69.y = _3207;
    out.m_69.z = _3205;
    out.m_69.w = _3211;
    float _3227 = fma(_3191, _3151, _3151);
    float _3229 = _544 + (-0.5);
    int _3231 = ~_3215;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    float _3237 = _3213 * _3201;
    bool _3239 = !_2091;
    int _3241 = _3239 ? 0 : 1;
    int _3243 = abs(_3223);
    float _3245 = _2889 * _3237;
    float _3247 = _2855 * _3237;
    int _3249 = _3235;
    float _3251 = _3155;
    if (_2943)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3253 = -_3247;
    float _3255 = _2133 + _3253;
    float _3257 = -_3245;
    float _3259 = _1839 + _3257;
    float _3261 = float(_2131);
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3265 = _3255 + _3263;
    float _3267 = float(_3243);
    float _3269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3271 = _3259 + _3269;
    float _3273 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3227);
    float _3275 = _3265 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_1971)
    {
        int _3277 = ~_3215;
        int _3279 = _3277 + 1;
        _3249 = _3279;
    }
    int _3281 = _3249;
    float _3283 = _3267 * _3261;
    float _3285 = fma(_3225, _3219, _3273);
    float _3287 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3275);
    int _3289 = abs(_3241);
    float _3291 = _3283 * (-2.0);
    float _3293 = _2919 * _3237;
    float _3295 = _558 + (-0.5);
    float _3297 = float(_3281);
    float _3299 = fma(_3291, _3153, _3153);
    float _3301 = float(_3289);
    float _3303 = -_3293;
    float _3305 = _1849 + _3303;
    float _3307 = fma(_1915, _3291, _1915);
    float _3309 = fma(_3295, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3299);
    float _3311 = _544 + _568;
    float _3313 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3315 = _3305 + _3313;
    float _3317 = _3301 * _3297;
    float _3319 = fma(_3307, _3219, _3309);
    float _3321 = _3311 + (-1.0);
    float _3323 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3287);
    float _3325 = _3317 * (-2.0);
    float _3327 = -_3247;
    float _3329 = _2855 + _3327;
    float _3331 = fma(_3321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3333 = _568 + (-0.5);
    float _3335 = fma(_3325, _3155, _3155);
    bool _3337 = _3323 >= 0.0;
    float _3339 = -_3245;
    float _3341 = _2889 + _3339;
    float _3343 = _3329 * _3329;
    float _3345 = fma(_3331, _3325, _3331);
    float _3347 = fma(_3333, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3335);
    float _3349 = -_3293;
    float _3351 = _2919 + _3349;
    float _3353 = fma(_3341, _3341, _3343);
    float _3355 = _3285 * 0.15915493667125701904296875;
    float _3357 = _3319 * 0.15915493667125701904296875;
    float _3359 = fma(_3345, _3219, _3347);
    float _3361 = fma(_3351, _3351, _3353);
    float _3363 = _3355 * 6.283185482025146484375;
    float _3365 = sin(_3363);
    float _3367 = _3359 * 0.15915493667125701904296875;
    if (_3337)
    {
        _3251 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3369 = _3251;
    int _3371 = as_type<int>(_3369);
    if (_3337)
    {
        out.m_51.x = 0.0;
    }
    float _3373 = _3357 * 6.283185482025146484375;
    float _3375 = sin(_3373);
    if (_3337)
    {
        float _3377 = _3369 * 5.0;
        _3371 = as_type<int>(_3377);
    }
    int _3379 = _3371;
    if (_3337)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9624 = as_type<float>(_3379);
        out.gl_Position.z = _9624;
    }
    float _3381 = _3355 * 6.283185482025146484375;
    float _3383 = cos(_3381);
    float _3385 = _3357 * 6.283185482025146484375;
    float _3387 = cos(_3385);
    float _3389 = _3365 * _3375;
    float _3391 = sqrt(_3361);
    float _3393 = _3367 * 6.283185482025146484375;
    float _3395 = sin(_3393);
    if (_3337)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3397 = -_2133;
    float _3399 = _3397 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3401 = -_1839;
    float _3403 = _3401 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3405 = in.m_71.x;
    float _3407 = in.m_71.y;
    float _3409 = in.m_71.z;
    float _3411 = -_1849;
    float _3413 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3415 = _3399 * _3399;
    float _3417 = _3367 * 6.283185482025146484375;
    float _3419 = cos(_3417);
    float _3421 = _3201 * _3391;
    float _3423 = _3383 * _3387;
    float _3425 = fma(_3403, _3403, _3415);
    float _3427 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3429 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3431 = fma(_3413, _3413, _3425);
    float _3433 = fma(_3395, _3423, _3389);
    float _3435 = fma(_3395, _3389, _3423);
    float _3437 = _3383 * _3375;
    float _3439 = rsqrt(_3431);
    float _3441 = _3421 * _3429;
    float _3443 = _3365 * _3387;
    float _3445 = _3421 * _3427;
    float _3447 = _3195 * _3421;
    float _3449 = _3375 * _3419;
    float _3451 = _3365 * _3419;
    float _3453 = _3383 * _3419;
    float _3455 = _3387 * _3419;
    float _3457 = -_3437;
    float _3459 = fma(_3395, _3443, _3457);
    float _3461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3407);
    float _3463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3405);
    bool _3465 = _3407 != 0.0;
    bool _3467 = isnan(_3407);
    bool _3469 = _3465 || _3467;
    bool _3471 = isnan(0.0);
    bool _3473 = _3469 || _3471;
    float _3475 = -_3443;
    float _3477 = fma(_3395, _3437, _3475);
    float _3479 = _3441 * _3461;
    float _3481 = _3447 * _3463;
    float _3483 = _3403 * _3439;
    float _3485 = _3413 * _3439;
    float _3487 = in.m_73.x;
    float _3489 = in.m_73.y;
    float _3491 = in.m_73.z;
    float _3493 = _3399 * _3439;
    float _3495 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3497 = _3483 * _3495;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3501 = _3485 * _3499;
    float _3503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3409);
    bool _3505 = _3405 == 0.0;
    bool _3507 = !_3473;
    bool _3509 = _3505 && _3507;
    float _3511 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3513 = -_3497;
    float _3515 = fma(_3485, _3511, _3513);
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3519 = _3493 * _3517;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3523 = -_3501;
    float _3525 = fma(_3493, _3521, _3523);
    float _3527 = _3445 * _3503;
    float _3529 = _3515 * _3515;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3533 = -_3519;
    float _3535 = fma(_3483, _3531, _3533);
    bool _3537 = _3409 == 0.0;
    bool _3539 = _3537 && _3509;
    float _3541 = in.m_75.x;
    float _3543 = in.m_75.y;
    float _3545 = in.m_75.z;
    float _3547 = in.m_75.w;
    float _3549 = fma(_3525, _3525, _3529);
    float _3551 = -_3479;
    float _3553 = _3395 * _3551;
    float _3555 = _3453 * _3479;
    float _3557 = _3451 * _3479;
    float _3559 = fma(_3535, _3535, _3549);
    float _3561 = fma(_3455, _3481, _3553);
    float _3563 = fma(_3433, _3481, _3555);
    float _3565 = fma(_3459, _3481, _3557);
    float _3567 = rsqrt(_3559);
    float _3569 = fma(_3449, _3527, _3561);
    float _3571 = _3553;
    float _3573 = _3481;
    float _3575 = _3487;
    float _3577 = _3549;
    if (_3539)
    {
        _3571 = _3487;
    }
    float _3579 = _3571;
    float _3581 = _3579;
    if (_3539)
    {
        _2809 = _3491;
    }
    float _3583 = _2809;
    float _3585 = _3583;
    if (_3539)
    {
        _3573 = _3579;
    }
    float _3587 = _3573;
    float _3589 = _3587;
    if (!_3539)
    {
        _3581 = _3487;
    }
    float _3591 = _3581;
    float _3593 = fma(_3477, _3527, _3563);
    if (_3539)
    {
        _3575 = _3583;
    }
    float _3595 = _3575;
    float _3597 = _3595;
    if (!_3539)
    {
        _3585 = _3491;
    }
    float _3599 = _3585;
    float _3601 = fma(_3435, _3527, _3565);
    if (!_3539)
    {
        float _3603 = fma(_3405, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3591);
        _3589 = _3603;
    }
    float _3605 = _3589;
    float _3607 = _3515 * _3567;
    float _3609 = _3525 * _3567;
    if (!_3539)
    {
        float _3611 = fma(_3409, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3599);
        _3597 = _3611;
    }
    float _3613 = _3597;
    float _3615 = _3535 * _3567;
    float _3617 = _3485 * _3607;
    float _3619 = _3493 * _3609;
    float _3621 = _3613;
    if (_3539)
    {
        _3577 = _3489;
    }
    float _3623 = _3577;
    float _3625 = _3623;
    if (!_3539)
    {
        float _3627 = fma(_3407, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3489);
        _3625 = _3627;
    }
    float _3629 = _3625;
    float _3631 = -_3617;
    float _3633 = fma(_3493, _3615, _3631);
    float _3635 = -_3619;
    float _3637 = fma(_3483, _3607, _3635);
    float _3639 = _3545 * _3591;
    float _3641 = _3541 * _3489;
    float _3643 = _3633 * _3593;
    float _3645 = _3637 * _3593;
    float _3647 = -_3639;
    float _3649 = fma(_3541, _3599, _3647);
    float _3651 = _3543 * _3599;
    float _3653 = fma(_3609, _3569, _3643);
    float _3655 = fma(_3615, _3569, _3645);
    float _3657 = -_3641;
    float _3659 = fma(_3543, _3591, _3657);
    float _3661 = -_3651;
    float _3663 = fma(_3545, _3489, _3661);
    float _3665 = fma(_3483, _3601, _3653);
    float _3667 = fma(_3485, _3601, _3655);
    float _3669 = _3453 * _3633;
    float _3671 = _3663 * _3547;
    float _3673 = _3483 * _3615;
    float _3675 = _1839 + _3665;
    float _3677 = _1849 + _3667;
    float _3679 = _3453 * _3637;
    float _3681 = -_3673;
    float _3683 = fma(_3485, _3609, _3681);
    float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3687 = _3675 + _3685;
    float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3691 = _3677 + _3689;
    float _3693 = _3649 * _3547;
    float _3695 = _3453 * _3683;
    float _3697 = _3687 * _3687;
    float _3699 = _3691 * _3691;
    float _3701 = _3659 * _3547;
    float _3703 = _3433 * _3633;
    float _3705 = _3433 * _3683;
    float _3707 = _3433 * _3637;
    float _3709 = _3697 + _3699;
    float _3711 = _3477 * _3633;
    float _3713 = _3477 * _3637;
    float _3715 = _3477 * _3683;
    float _3717 = fma(_3455, _3609, _3703);
    float _3719 = fma(_3455, _3607, _3705);
    float _3721 = fma(_3455, _3615, _3707);
    float _3723 = _3683 * _3593;
    float _3725 = sqrt(_3709);
    float _3727 = -_3395;
    float _3729 = fma(_3727, _3609, _3669);
    float _3731 = -_3395;
    float _3733 = fma(_3731, _3607, _3695);
    float _3735 = fma(_3607, _3569, _3723);
    float _3737 = -_3395;
    float _3739 = fma(_3737, _3615, _3679);
    float _3741 = fma(_3449, _3615, _3713);
    float _3743 = fma(_3449, _3609, _3711);
    float _3745 = fma(_3493, _3601, _3735);
    float _3747 = fma(_3449, _3607, _3715);
    float _3749 = fma(_3451, _3483, _3729);
    float _3751 = fma(_3451, _3493, _3733);
    float _3753 = fma(_3451, _3485, _3739);
    float _3755 = _2133 + _3745;
    float _3757 = fma(_3459, _3483, _3717);
    float _3759 = fma(_3459, _3493, _3719);
    float _3761 = fma(_3459, _3485, _3721);
    bool _3763 = _3725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3765 = fma(_3435, _3483, _3743);
    float _3767 = fma(_3435, _3493, _3747);
    float _3769 = fma(_3435, _3485, _3741);
    float _3771 = _3749 * _3543;
    float _3773 = _3751 * _3543;
    float _3775 = _3753 * _3543;
    float _3777 = _3749 * _3629;
    float _3779 = _3693 * _3749;
    float _3781 = _3751 * _3629;
    float _3783 = _3693 * _3751;
    float _3785 = _3693 * _3753;
    float _3787 = _3753 * _3629;
    float _3789 = _3693;
    float _3791 = _3697;
    float _3793 = _3699;
    float _3795 = _3675;
    float _3797 = _3677;
    float _3799 = _3701;
    if (!_3763)
    {
        _3789 = _3755;
    }
    float _3801 = _3789;
    bool _3803 = !_3763;
    float _3805 = _3801;
    if (!_3803)
    {
        float _3807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3811 = _3725 + _3809;
        float _3813 = _3755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3815 = rsqrt(_3709);
        float _3817 = _3811 * _3807;
        float _3819 = _3817 * 0.15915493667125701904296875;
        float _3821 = _3819 * 6.283185482025146484375;
        float _3823 = sin(_3821);
        float _3825 = _3819 * 6.283185482025146484375;
        float _3827 = cos(_3825);
        float _3829 = fma(_3823, _3813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3831 = _3815 * _3829;
        float _3833 = fma(_3687, _3831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3835 = _3827 + (-1.0);
        float _3837 = fma(_3691, _3831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3841 = _3833 + _3839;
        float _3843 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3847 = _3837 + _3845;
        float _3849 = _3841 * _3841;
        float _3851 = fma(_3755, _3827, _3843);
        float _3853 = _3847 * _3847;
        _3805 = _3851;
        _3791 = _3849;
        _3793 = _3853;
        _3795 = _3833;
        _3797 = _3837;
    }
    float _3855 = _3805;
    float _3857 = _3791;
    float _3859 = _3793;
    float _3861 = _3795;
    float _3863 = _3797;
    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3867 = _3855 + _3865;
    float _3869 = fma(_3757, _3541, _3771);
    float _3871 = fma(_3759, _3541, _3773);
    float _3873 = fma(_3757, _3605, _3777);
    float _3875 = fma(_3867, _3867, _3857);
    float _3877 = fma(_3759, _3605, _3781);
    float _3879 = fma(_3761, _3605, _3787);
    float _3881 = fma(_3761, _3541, _3775);
    float _3883 = _3875 + _3859;
    float _3885 = fma(_3671, _3757, _3779);
    float _3887 = fma(_3671, _3759, _3783);
    float _3889 = fma(_3671, _3761, _3785);
    float _3891 = fma(_3765, _3545, _3869);
    float _3893 = fma(_3767, _3545, _3871);
    float _3895 = sqrt(_3883);
    float _3897 = fma(_3769, _3545, _3881);
    float _3899 = fma(_3765, _3613, _3873);
    float _3901 = fma(_3701, _3765, _3885);
    float _3903 = fma(_3767, _3613, _3877);
    float _3905 = fma(_3701, _3767, _3887);
    float _3907 = fma(_3701, _3769, _3889);
    float _3909 = fma(_3769, _3613, _3879);
    out.m_77.x = _3891;
    out.m_77.y = _3893;
    out.m_77.z = _3897;
    out.m_79.x = _3901;
    out.m_79.y = _3905;
    out.m_79.z = _3907;
    out.m_81.x = _3899;
    out.m_81.y = _3903;
    out.m_81.z = _3909;
    bool _3911 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3913 = isnan(_3895);
    bool _3915 = _3911 || _3913;
    bool _3917 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3919 = _3915 || _3917;
    if (!_3919)
    {
        _3621 = 1.0;
    }
    float _3921 = _3621;
    bool _3923 = !_3919;
    float _3925 = _3921;
    if (!_3923)
    {
        bool _3927 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3929 = isnan(_3895);
        bool _3931 = _3927 || _3929;
        bool _3933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3935 = _3931 || _3933;
        if (!_3935)
        {
            float _3937 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3939 = _3895 + _3937;
            float _3941 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3943 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3941;
            float _3945 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3947 = _3945 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3949 = 1.0 / _3943;
            float _3951 = _3939 * _3949;
            float _3953 = fma(_3951, _3947, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3925 = _3953;
            _3799 = _3949;
            _3955 = true;
        }
        else
        {
            bool _3957 = _3895 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3959 = isnan(_3895);
            bool _3961 = _3957 || _3959;
            bool _3963 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3965 = _3961 || _3963;
            if (!_3965)
            {
                float _3967 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3969 = _3895 + _3967;
                float _3971 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3973 = _3971 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3975 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3977 = _3975 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3979 = 1.0 / _3973;
                float _3981 = _3969 * _3979;
                float _3983 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3925 = _3983;
                _3799 = _3979;
                _3955 = true;
            }
            else
            {
                _3925 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3955 = false;
    float _3985 = _3925;
    float _3987 = _3799;
    float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3991 = _3855 + _3989;
    float _3993 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3995 = _3861 + _3993;
    float _3997 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3999 = _3863 + _3997;
    float _4001 = fma(_3991, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4003 = fma(_3995, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4005 = fma(_3999, _3985, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4007 = -_3247;
    float _4009 = _4007 + _4001;
    float _4011 = -_3245;
    float _4013 = _4011 + _4003;
    float _4015 = -_3293;
    float _4017 = _4015 + _4005;
    float _4019 = fma(_3305, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4023 = _4009 + _4021;
    float _4025 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4027 = _4013 + _4025;
    float _4029 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4031 = _4017 + _4029;
    float _4033 = floor(_4019);
    float _4035 = _4023 * _4023;
    float _4037 = fma(_4027, _4027, _4035);
    float _4039 = fma(_4031, _4031, _4037);
    float _4041 = rsqrt(_4039);
    float _4043 = -_4033;
    float _4045 = _4019 + _4043;
    float _4047 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4049 = _4027 * _4047;
    float _4051 = _4031 * _4047;
    float _4053 = _4049 * _4049;
    float _4055 = _4051 * _4051;
    float _4057 = _4053 + _4055;
    float _4059 = sqrt(_4057);
    bool _4061 = _4059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4065 = _4059 + _4063;
    float _4067 = _3987;
    float _4069 = _4057;
    float _4071 = _4065;
    float _4073 = _4023;
    float _4075 = _4047;
    if (_4061)
    {
        float _4077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4067 = _4077;
    }
    float _4079 = _4067;
    if (_4061)
    {
        float _4081 = rsqrt(_4057);
        _4069 = _4081;
    }
    float _4083 = _4069;
    float _4085 = _4079;
    if (_4061)
    {
        float _4087 = _4065 * _4079;
        _4071 = _4087;
    }
    float _4089 = _4071;
    if (_4061)
    {
        float _4091 = _4089 * 0.15915493667125701904296875;
        _4085 = _4091;
    }
    float _4093 = _4085;
    float _4095 = _4031;
    float _4097 = _4093;
    if (_4061)
    {
        float _4099 = _4093 * 6.283185482025146484375;
        float _4101 = cos(_4099);
        _4095 = _4101;
    }
    float _4103 = _4095;
    float _4105 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4107 = precise::max(0.0, _4105);
    float _4109 = _4041;
    float _4111 = _4107;
    if (_4061)
    {
        float _4113 = _4093 * 6.283185482025146484375;
        float _4115 = sin(_4113);
        _4109 = _4115;
    }
    float _4117 = _4109;
    float _4119 = -_4047;
    float _4121 = -_4107;
    float _4123 = fma(_4023, _4119, _4121);
    float _4125 = _4123;
    if (_4061)
    {
        float _4127 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4073 = _4127;
    }
    float _4129 = _4073;
    float _4131 = _4129;
    if (_4061)
    {
        float _4133 = _4103 + (-1.0);
        _4111 = _4133;
    }
    float _4135 = _4111;
    if (!_4061)
    {
        _4097 = _4049;
    }
    float _4137 = _4097;
    float _4139 = _4117;
    float _4141 = _4137;
    if (_4061)
    {
        float _4143 = fma(_4117, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4139 = _4143;
    }
    float _4145 = _4139;
    float _4147 = _4145;
    if (_4061)
    {
        float _4149 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4131 = _4149;
    }
    float _4151 = _4131;
    float _4153 = sqrt(_4039);
    float _4155 = _4151;
    if (_4061)
    {
        float _4157 = _4083 * _4145;
        _4075 = _4157;
    }
    float _4159 = _4075;
    if (_4061)
    {
        float _4161 = fma(_4123, _4103, _4151);
        _4125 = _4161;
    }
    float _4163 = _4125;
    float _4165 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4061)
    {
        float _4167 = _4049 * _4159;
        _4141 = _4167;
    }
    float _4169 = _4141;
    if (!_4061)
    {
        _4147 = _4051;
    }
    float _4171 = _4147;
    float _4173 = _4171;
    if (_4061)
    {
        float _4175 = _4051 * _4159;
        _4173 = _4175;
    }
    float _4177 = _4173;
    if (!_4061)
    {
        _4155 = _4053;
    }
    float _4179 = _4155;
    float _4181 = _4179;
    if (_4061)
    {
        float _4183 = _4169 * _4169;
        _4181 = _4183;
    }
    float _4185 = _4181;
    float _4187 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_4061)
    {
        _4165 = _4055;
    }
    float _4189 = _4165;
    float _4191 = _4189;
    if (_4061)
    {
        float _4193 = _4177 * _4177;
        _4191 = _4193;
    }
    float _4195 = _4191;
    float _4197 = fma(_4163, _4163, _4185);
    float _4199 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4201 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4203 = _4197 + _4195;
    float _4205 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4199);
    float _4207 = floor(_4187);
    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4211 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4209);
    float _4213 = precise::clamp(_4211, 0.0, 1.0);
    float _4215 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4205);
    float _4217 = -_4213;
    float _4219 = _4217 + 1.0;
    float _4221 = _4215 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4223 = rsqrt(_4203);
    float _4225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4227 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4229 = -_4227;
    float _4231 = fma(_4229, _4225, 1.0);
    float _4233 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4235 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4237 = abs(_4219);
    float _4239 = log2(_4237);
    float _4241 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4235);
    float _4243 = _4223 * _4169;
    float _4245 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4233);
    float _4247 = _4223 * _4177;
    float _4249 = _4223 * _4163;
    float _4251 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4241);
    float _4253 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4245);
    float _4255 = fma(_4013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4201);
    float _4257 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4259 = _4251 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4261 = _4253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4263 = fma(_4017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4255);
    float _4265 = -_4257;
    float _4267 = fma(_4249, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4265);
    float _4269 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4271 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4273 = _4263 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4275 = -_4247;
    float _4277 = fma(_4275, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4267);
    float _4279 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4269);
    float _4281 = -_4207;
    float _4283 = _4187 + _4281;
    float _4285 = exp2(_4271);
    float _4287 = fma(_4277, -0.5, 0.5);
    float _4289 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4279);
    float _4291 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4293 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4295 = fma(_4277, 0.5, 0.5);
    float _4297 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4289);
    float _4299 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4291);
    float _4301 = log2(_4231);
    float _4303 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4293);
    float _4305 = fma(_4295, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4307 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4299);
    float _4309 = _4249 + 1.0;
    float _4311 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4303);
    float _4313 = fma(_4295, _4305, -0.212114393711090087890625);
    float _4315 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4307);
    float _4317 = 1.0 / _4297;
    float _4319 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4311);
    float _4321 = -_4249;
    float _4323 = fma(_4285, _4309, _4321);
    float _4325 = fma(_4295, _4313, 1.570728778839111328125);
    float2 _11173 = float2(_4283, _4045);
    float _4327 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11173, float2(0.0), isnan(_11173)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11173, float2(0.0), isnan(_11173)), level(0.0)).x;
    float _4329 = fma(_4323, 0.5, 0.5);
    float _4331 = sqrt(_4287);
    float _4333 = _4301 * 0.693147182464599609375;
    float _4335 = _4333 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4337 = _4315 * _4317;
    float _4339 = _4319 * _4317;
    float _4341 = fma(_4337, 0.5, 0.5);
    float _4343 = fma(_4339, -0.5, 0.5);
    float _4345 = _4331 * 0.636619746685028076171875;
    float3 _11208 = float3(_4341, _4343, _4335);
    float _4347 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11208, float3(0.0), isnan(_11208)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11208, float3(0.0), isnan(_11208)), level(0.0)).x;
    float _4349 = -_4325;
    float _4351 = fma(_4345, _4349, 1.0);
    float3 _11224 = float3(_4341, _4343, _4335);
    float4 _4354 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11224, float3(0.0), isnan(_11224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11224, float3(0.0), isnan(_11224)), level(0.0)).xyzw;
    float _4356 = _4354.x;
    float _4358 = _4354.y;
    float _4360 = _4354.z;
    float _4362 = _4354.w;
    float2 _11240 = float2(_4351, _4329);
    float3 _4366 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11240, float2(0.0), isnan(_11240)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11240, float2(0.0), isnan(_11240)), level(0.0)).xyz;
    float _4368 = _4366.x;
    float _4370 = _4366.y;
    float _4372 = _4366.z;
    float _4374 = _3255 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _4376 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4378 = isnan(_4153);
    bool _4380 = _4376 || _4378;
    bool _4382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4384 = _4380 || _4382;
    float _4386 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4374);
    float _4388 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4386);
    float _4390 = _3255 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4392 = _4388 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4394 = fma(_3259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4390);
    float _4396 = 1.0 / _4392;
    float _4398 = fma(_3305, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4394);
    float _4400 = _4398 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4402 = _4400 + _4392;
    float _4404 = _4402 * _4396;
    float _4406 = _4404 * 0.5;
    float _4408 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4410 = fma(_4406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4408);
    float _4412 = 1.0 / _4410;
    float _4414 = _4239 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4416 = exp2(_4414);
    float _4418 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4420 = _4412 * _4418;
    float _4422 = abs(_4420);
    float _4424 = log2(_4422);
    float _4426 = -_4416;
    float _4428 = _4426 + 1.0;
    bool _4430 = _4420 <= 8000.0;
    bool _4432 = isnan(_4420);
    bool _4434 = _4430 || _4432;
    bool _4436 = isnan(8000.0);
    bool _4438 = _4434 || _4436;
    float _4440 = float(_4438);
    float _4442 = _4424 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4444 = _4259 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4446 = fma(_4261, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4444);
    float _4448 = exp2(_4442);
    float _4450 = fma(_4221, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4446);
    float _4452 = fma(_4448, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4454 = precise::clamp(_4452, 0.0, 1.0);
    float _4456 = in.m_83.x;
    float _4458 = fma(_4454, -2.0, 3.0);
    float _4460 = _4454 * _4454;
    float _4462 = _4460 * _4458;
    float _4464 = fma(_4273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4450);
    float _4466 = -_4462;
    float _4468 = _4466 + 1.0;
    float _4470 = _4464 + _4297;
    out.gl_Position.x = _4315;
    out.gl_Position.y = _4319;
    out.gl_Position.z = _4464;
    out.gl_Position.w = _4297;
    float _4472 = fma(_4468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4462);
    float _4474 = _4470 * 0.5;
    float _4476 = _4440 * _4472;
    float _4478 = _4428 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _4474;
    out.m_85.w = _4297;
    float _4480 = _4476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4482 = _4464;
    float _4484 = _4319;
    float _4486 = _4315;
    float _4488 = _4297;
    if (!_4384)
    {
        _4482 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4490 = _4482;
    float _4492 = _4490;
    float _4494 = _4490;
    if (!_4384)
    {
        _4484 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4496 = _4484;
    float _4498 = -_4478;
    float _4500 = _4498 + 1.0;
    float _4502 = _4500;
    float _4504 = _4496;
    float _4506 = _4496;
    if (!_4384)
    {
        _4486 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4508 = _4486;
    float _4510 = _4508;
    float _4512 = _4508;
    if (!_4384)
    {
        _4488 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4514 = _4488;
    float _4516 = -_4327;
    float _4518 = _4516 + 1.0;
    float _4520 = _4518 * _4480;
    float _4522 = precise::clamp(_4520, 0.0, 1.0);
    float _4524 = -_4522;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4528 = _4526 * _4456;
    float _4530 = _4528 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4532 = _4528;
    float _4534 = _4514;
    float _4536 = _4514;
    if (!_4384)
    {
        _4532 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4538 = _4532;
    float _4540 = _4478 * _4347;
    out.m_87.x = _4530;
    float _4542 = _4362 * _4540;
    float _4544 = _4372 * _4540;
    float _4546 = fma(_4368, _4542, _4356);
    float _4548 = fma(_4370, _4542, _4358);
    float _4550 = _4362 * _4500;
    float _4552 = fma(_4362, _4544, _4360);
    float _4554 = _4538;
    float _4556 = _4538;
    if (!_4384)
    {
        _4502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4558 = _4502;
    out.m_89.x = _4546;
    out.m_89.y = _4548;
    out.m_89.z = _4552;
    out.m_89.w = _4550;
    bool _4560 = !_4384;
    float _4562 = _4558;
    float _4564 = _4558;
    if (!_4560)
    {
        bool _4566 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4568 = isnan(_4153);
        bool _4570 = _4566 || _4568;
        bool _4572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4574 = _4570 || _4572;
        if (!_4574)
        {
            float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4578 = _4153 + _4576;
            float _4580 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4582 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4580;
            float _4584 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4586 = _4584 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4588 = 1.0 / _4582;
            float _4590 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4592 = _4590 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4594 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4596 = _4594 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4598 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4600 = _4598 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4602 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4604 = _4602 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4606 = _4578 * _4588;
            float _4608 = precise::clamp(_4606, 0.0, 1.0);
            float _4610 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4612 = _4610 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4614 = fma(_4608, _4586, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4616 = fma(_4608, _4612, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4618 = fma(_4608, _4592, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4620 = fma(_4608, _4596, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4622 = fma(_4608, _4600, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4624 = fma(_4608, _4604, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4506 = _4618;
            _4564 = _4622;
            _4494 = _4614;
            _4536 = _4620;
            _4512 = _4616;
            _4556 = _4624;
            _4626 = true;
        }
        else
        {
            bool _4628 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4630 = isnan(_4153);
            bool _4632 = _4628 || _4630;
            bool _4634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4636 = _4632 || _4634;
            if (!_4636)
            {
                _4492 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4638 = _4492;
            _4494 = _4638;
            if (!_4636)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4640 = _4504;
            _4506 = _4640;
            if (!_4636)
            {
                _4510 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4642 = _4510;
            _4512 = _4642;
            if (!_4636)
            {
                _4534 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4644 = _4534;
            _4536 = _4644;
            if (!_4636)
            {
                _4562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4646 = _4562;
            _4564 = _4646;
            if (!_4636)
            {
                _4554 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4648 = _4554;
            bool _4650 = !_4636;
            _4556 = _4648;
            if (!_4650)
            {
                bool _4652 = _4153 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4654 = isnan(_4153);
                bool _4656 = _4652 || _4654;
                bool _4658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4660 = _4656 || _4658;
                if (!_4660)
                {
                    float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4664 = _4153 + _4662;
                    float _4666 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4668 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4666;
                    float _4670 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4672 = _4670 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4674 = 1.0 / _4668;
                    float _4676 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4678 = _4676 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4680 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4682 = _4680 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4684 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4686 = _4684 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4688 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4690 = _4688 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4692 = _4664 * _4674;
                    float _4694 = precise::clamp(_4692, 0.0, 1.0);
                    float _4696 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4698 = _4696 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4700 = fma(_4694, _4672, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4702 = fma(_4694, _4698, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4704 = fma(_4694, _4678, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4706 = fma(_4694, _4682, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4708 = fma(_4694, _4686, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4710 = fma(_4694, _4690, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4506 = _4704;
                    _4564 = _4708;
                    _4494 = _4700;
                    _4536 = _4706;
                    _4512 = _4702;
                    _4556 = _4710;
                    _4626 = true;
                }
                else
                {
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4494 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4536 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4512 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4556 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4626 = false;
    float _4712 = _4506;
    float _4714 = _4564;
    float _4716 = _4494;
    float _4718 = _4536;
    float _4720 = _4512;
    float _4722 = _4556;
    float _4724 = fma(_3903, -0.5, 0.5);
    float _4726 = precise::clamp(_4724, 0.0, 1.0);
    float _4728 = -_4712;
    float _4730 = _4728 + _4714;
    float _4732 = -_4716;
    float _4734 = _4732 + _4718;
    float _4736 = -_4720;
    float _4738 = _4736 + _4722;
    bool _4740 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4742 = fma(_4726, _4730, _4712);
    float _4744 = fma(_4726, _4734, _4716);
    float _4746 = fma(_4726, _4738, _4720);
    float _4748 = _4742 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _4750 = fma(_4744, 0.298911988735198974609375, _4748);
    float _4752 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4754 = fma(_4746, 0.114477999508380889892578125, _4750);
    out.m_87.w = _4752;
    float _4756 = -_4754;
    float _4758 = _4744 + _4756;
    float _4760 = -_4754;
    float _4762 = _4742 + _4760;
    float _4764 = -_4754;
    float _4766 = _4746 + _4764;
    out.m_91.x = 0.0;
    float _4768 = fma(_4758, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    float _4770 = fma(_4762, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    float _4772 = fma(_4766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4754);
    out.m_93.x = _4768;
    out.m_93.y = _4770;
    out.m_93.z = _4772;
    if (!_4740)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4774 = -_4009;
    float _4776 = _4774 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4778 = -_4013;
    float _4780 = _4778 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4782 = -_4017;
    float _4784 = _4782 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4786 = _4776 * _4776;
    float _4788 = fma(_4780, _4780, _4786);
    float _4790 = fma(_4784, _4784, _4788);
    float _4792 = sqrt(_4790);
    float _4794 = rsqrt(_4790);
    float _4796 = -_4792;
    float _4798 = _4796 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4800 = _4798 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4802 = precise::clamp(_4800, 0.0, 1.0);
    float _4804 = _4780 * _4794;
    float _4806 = _4776 * _4794;
    float _4808 = abs(_4802);
    float _4810 = log2(_4808);
    float _4812 = _4784 * _4794;
    float _4814 = _4804 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4816 = _3903 * _4806;
    float _4818 = -_4806;
    float _4820 = -_4814;
    float _4822 = fma(_4818, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4820);
    float _4824 = fma(_3899, _4804, _4816);
    float _4826 = -_4812;
    float _4828 = fma(_4826, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4822);
    float _4830 = fma(_3909, _4812, _4824);
    float _4832 = precise::clamp(_4830, 0.0, 1.0);
    float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4836 = _4828 + _4834;
    float _4838 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4840 = _4836 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4842 = precise::clamp(_4840, 0.0, 1.0);
    float _4844 = exp2(_4838);
    float _4846 = _4844 * _4842;
    float _4848 = _4832 * _4846;
    float _4850 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4852 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4854 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4850;
    out.m_91.y = _4852;
    out.m_91.z = _4854;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

