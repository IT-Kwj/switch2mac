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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_81 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_63 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 m_85 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2584 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_138);
        out.gl_Position.z = _2901;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_164);
        out.gl_Position.z = _2956;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = 1.0 / _152;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _120 * _166;
    bool _172 = !_168;
    float _174 = _170;
    float _192;
    if (!_172)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _170;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = 1.0 / _216;
    bool _220 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -_212;
    float _234 = _232 + 1.0;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _230 * _234;
    float _252 = -_230;
    float _254 = _252 + 1.0;
    float _256 = _200 * _218;
    float _258 = in.m_57.x;
    float _260 = in.m_57.y;
    float _262 = in.m_57.z;
    float _264 = fma(_238, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_248, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = fma(_242, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _264 * _250;
    float _272 = _266 * _250;
    float _274 = _268 * _250;
    float _276 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _278 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _272);
    float _280 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _278);
    float _286 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _280);
    float _288 = _282 * _258;
    float _290 = _284 * _260;
    float _292 = _286 * _262;
    bool _294 = !_244;
    if (!_294)
    {
        float _296 = in.m_55.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _174 = _310;
    }
    float _312 = _174;
    float _314 = in.m_55.x;
    float _316 = in.m_55.y;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    float _322 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _324 = in.m_46.x;
    float _326 = in.m_46.y;
    float _328 = in.m_46.z;
    float _330 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _332 = in.m_55.z;
    float _334 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _336 = int(_334);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _348 = _344 || _346;
    float _350 = _320 * _120;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _354 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _356 = int(_354);
    float _358 = _314 * 2.0;
    float _360 = _314 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _362 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _364 = exp2(_350);
    float _366 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _368 = -_352;
    float _370 = fma(_360, 2.0, _368);
    float _372 = fma(_362, -2.0, _338);
    float _374 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _316 + _314;
    float _380 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].x, _366);
    float _382 = floor(_358);
    float _384 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _388 = _316 * 2.0;
    float _390 = _378 + (-1.0);
    float _392 = _316 + _332;
    float _394 = _332 * 2.0;
    float _396 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _398 = _392 + (-1.0);
    float _400 = float(_336);
    float _402 = floor(_388);
    float _404 = -_364;
    float _406 = _404 + 1.0;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _410 = -_120;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[76].x, _370);
    bool _414 = _382 > 0.0;
    bool _416 = _382 >= 0.0;
    bool _418 = isnan(_382);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = floor(_394);
    float _428 = float(_356);
    bool _430 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(1.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _442 = 1.0 + _440;
    float _444 = _348 ? _406 : 0.0;
    float _446 = 1.0 / _400;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _452 = _402 > 0.0;
    float _454 = _428 * _120;
    float _456 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _458 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].w, _450);
    int _460 = _424 ? 0 : 1;
    float _462 = 1.0 / _442;
    bool _464 = _402 >= 0.0;
    bool _466 = isnan(_402);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _456);
    bool _476 = _426 > 0.0;
    float _478 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    bool _480 = _426 >= 0.0;
    bool _482 = isnan(_426);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _372);
    int _492 = ~_460;
    int _494 = _492 + 1;
    int _496 = _494 + 1;
    float _498 = _446 * _120;
    int _500 = _496;
    if (!_414)
    {
        int _502 = ~_460;
        int _504 = _502 + 1;
        _500 = _504;
    }
    int _506 = _500;
    float _508 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    int _510 = _472 ? 0 : 1;
    float _512 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _514 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[6].z, _386);
    float _516 = _508 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _518 = ~_510;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    int _524 = _522;
    if (_438)
    {
        float _526 = _444 * _462;
        _130 = _526;
    }
    float _528 = _130;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _540 = _538 != 0;
    float _542 = _512 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_452)
    {
        int _544 = ~_510;
        int _546 = _544 + 1;
        _524 = _546;
    }
    int _548 = _524;
    float _550 = _514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    bool _558 = !_536;
    int _560 = _558 ? 0 : 1;
    bool _562 = !_532;
    int _564 = _562 ? 0 : 1;
    bool _566 = !_540;
    int _568 = _566 ? 0 : 1;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _580 = _578 != 0;
    int _582 = _488 ? 0 : 1;
    float _584 = float(_506);
    bool _586 = !_572;
    int _588 = _586 ? 0 : 1;
    bool _590 = !_576;
    int _592 = _590 ? 0 : 1;
    int _594 = abs(_588);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _516 + _596;
    int _600 = abs(_592);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _542 + _602;
    int _606 = ~_582;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _598 * _598;
    float _614 = float(_600);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _550 + _616;
    int _620 = _610;
    if (!_476)
    {
        int _622 = ~_582;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = fma(_604, _604, _612);
    float _630 = _614 * _584;
    float _632 = float(_594);
    float _634 = fma(_618, _618, _628);
    float _636 = float(_626);
    float _638 = _630 * (-2.0);
    bool _640 = !_580;
    int _642 = _640 ? 0 : 1;
    float _644 = sqrt(_634);
    float _646 = _316 + (-0.5);
    float _648 = fma(_638, _554, _554);
    int _650 = abs(_642);
    float _652 = _632 * _636;
    float _654 = fma(_408, _638, _408);
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _648);
    float _658 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = rsqrt(_634);
    float _662 = _332 + _314;
    float _664 = float(_548);
    float _666 = _658 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _668 = float(_650);
    float _670 = _652 * (-2.0);
    float _672 = _644 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _674 = _662 + (-1.0);
    float _676 = _668 * _664;
    float _678 = _314 + (-0.5);
    float _680 = fma(_670, _552, _552);
    float _682 = precise::min(_666, _672);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _686 = _676 * (-2.0);
    float _688 = fma(_396, _670, _396);
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _692 = _660 * _682;
    float _694 = fma(_684, _686, _684);
    float _696 = fma(_686, _556, _556);
    float _698 = _332 + (-0.5);
    float _700 = fma(_688, _528, _690);
    float _702 = _598 * _692;
    float _704 = _604 * _692;
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _708 = fma(_654, _528, _656);
    float _710 = -_702;
    float _712 = _598 + _710;
    float _714 = -_704;
    float _716 = _604 + _714;
    float _718 = fma(_694, _528, _706);
    float _720 = _618 * _692;
    float _722 = _712 * _712;
    float _724 = _708 * 0.15915493667125701904296875;
    float _726 = _700 * 0.15915493667125701904296875;
    float _728 = -_720;
    float _730 = _618 + _728;
    float _732 = fma(_716, _716, _722);
    float _734 = _724 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = fma(_730, _730, _732);
    float _740 = in.m_61.x;
    float _742 = in.m_61.y;
    float _744 = in.m_61.z;
    bool _746 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _748 = isnan(0.5);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _754 = _750 || _752;
    float _756 = _724 * 6.283185482025146484375;
    float _758 = cos(_756);
    bool _760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _762 = isnan(0.5);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _768 = _764 || _766;
    float _770 = sqrt(_738);
    float _772 = _718 * 0.15915493667125701904296875;
    float _774 = _726 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _742);
    float _780 = _726 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _660 * _770;
    float _786 = _322 * _784;
    float _788 = _658 * _784;
    float _790 = _330 * _784;
    float _792 = _772 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = _776 * _736;
    float _798 = _776 * _758;
    float _800 = _786 * _778;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _744);
    float _804 = _772 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = _782 * _758;
    float _810 = _782 * _736;
    float _812 = _790 * _802;
    float _814 = -_702;
    float _816 = _516 + _814;
    float _818 = _776 * _794;
    float _820 = _758 * _794;
    float _822 = _782 * _794;
    float _824 = _736 * _794;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _740);
    float _828 = _818 * _800;
    float _830 = _816 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = _788 * _826;
    float _834 = fma(_806, _808, _796);
    float _836 = _822 * _800;
    float _838 = -_810;
    float _840 = fma(_806, _798, _838);
    float _842 = -_798;
    float _844 = fma(_806, _810, _842);
    float _846 = -_800;
    float _848 = _806 * _846;
    float _850 = fma(_834, _832, _836);
    float _852 = fma(_806, _796, _808);
    float _854 = fma(_840, _832, _828);
    float _856 = fma(_820, _832, _848);
    float _858 = fma(_844, _812, _850);
    float _860 = -_704;
    float _862 = _542 + _860;
    float _864 = -_720;
    float _866 = _550 + _864;
    float _868 = fma(_824, _812, _856);
    float _870 = _858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _872 = _858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _874 = fma(_852, _812, _854);
    float _876 = _816 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _878 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _870);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _872);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _876);
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _878);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _880);
    float _890 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[10].z, _882);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[11].z, _884);
    float _894 = _886 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _896 = _888 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _898 = _890 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _900 = _892 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _902 = _550 + _894;
    float _904 = _542 + _896;
    float _906 = _858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _908 = 1.0 / _900;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _902 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _904 + _914;
    float _918 = _898 + _900;
    float _920 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _906);
    float _922 = _912 * _912;
    float _924 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _920);
    float _926 = fma(_916, _916, _922);
    float _928 = _924 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _930 = sqrt(_926);
    float _932 = _918 * _908;
    float _934 = _932 * 0.5;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _938 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _936);
    float _940 = _516 + _928;
    float _942 = 1.0 / _938;
    bool _944 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _946 = _924;
    float _948 = _928;
    float _950 = _868;
    float _952 = _938;
    float _954 = _930;
    float _956 = _720;
    float _958 = _702;
    float _960 = _908;
    float _962 = _904;
    if (!_944)
    {
        _946 = _904;
    }
    float _964 = _946;
    float _966 = _964;
    if (!_944)
    {
        _948 = _902;
    }
    float _968 = _948;
    float _970 = _968;
    if (!_944)
    {
        _950 = _940;
    }
    float _972 = _950;
    bool _974 = !_944;
    float _976 = _972;
    if (!_974)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _982 = _930 + _980;
        float _984 = rsqrt(_926);
        float _986 = _982 * _978;
        float _988 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = _986 * 0.15915493667125701904296875;
        float _992 = _990 * 6.283185482025146484375;
        float _994 = cos(_992);
        float _996 = _990 * 6.283185482025146484375;
        float _998 = sin(_996);
        float _1000 = _994 + (-1.0);
        float _1002 = fma(_998, _988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1004 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = _984 * _1002;
        float _1008 = fma(_940, _994, _1004);
        float _1010 = fma(_916, _1006, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1012 = fma(_912, _1006, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _1010;
        _970 = _1012;
        _976 = _1008;
        _952 = _990;
        _954 = _1000;
    }
    float _1014 = _966;
    float _1016 = _970;
    float _1018 = _976;
    float _1020 = _952;
    float _1022 = _954;
    float _1024 = -_704;
    float _1026 = _1024 + _1014;
    float _1028 = -_720;
    float _1030 = _1028 + _1016;
    float _1032 = -_702;
    float _1034 = _1032 + _1018;
    float _1036 = _1026;
    float _1038 = _1014;
    float _1040 = _1034;
    float _1042 = _1018;
    float _1044 = _1022;
    float _1046 = _1020;
    if (_768)
    {
        _956 = 1.0;
    }
    float _1048 = _956;
    float _1050 = _1048;
    if (_754)
    {
        _958 = _1026;
    }
    float _1052 = _958;
    float _1054 = _1052;
    if (_754)
    {
        _1036 = _1030;
    }
    float _1056 = _1036;
    float _1058 = _1056;
    if (!_754)
    {
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1062 = _816 + _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1066 = _862 + _1064;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1070 = -_542;
        float _1072 = _1070 + _1014;
        float _1074 = _1062 * _1062;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1078 = _866 + _1076;
        float _1080 = -_516;
        float _1082 = _1080 + _1018;
        float _1084 = -_550;
        float _1086 = _1084 + _1016;
        float _1088 = fma(_1066, _1066, _1074);
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1092 = fma(_1078, _1078, _1088);
        float _1094 = sqrt(_1092);
        float _1096 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1098 = precise::min(_1094, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1100 = _1098 * _1090;
        float _1102 = _1096 * _1100;
        float _1104 = fma(_1072, _1102, _862);
        float _1106 = fma(_1082, _1102, _816);
        float _1108 = fma(_1086, _1102, _866);
        _1038 = _1072;
        _1040 = _1106;
        _1054 = _1104;
        _1058 = _1108;
        _1042 = _1082;
        _1044 = _1090;
    }
    float _1110 = _1038;
    float _1112 = _1040;
    float _1114 = _1054;
    float _1116 = _1058;
    float _1118 = _1042;
    float _1120 = _1044;
    float _1122 = _1110;
    float _1124 = _1120;
    if (_768)
    {
        _960 = 1.0;
    }
    float _1126 = _960;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1130 = _942 * _1128;
    float _1132 = _1126;
    if (!_768)
    {
        float _1134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1140 = _1136 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1138 * 0.15915493667125701904296875;
        float _1146 = _1136 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = 1.0 / _1142;
        float _1152 = _1144 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1148 * _1150;
        float _1158 = _1144 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1154 * _1156;
        float _1164 = 1.0 / _1162;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1166;
        float _1170 = 1.0 / _1168;
        float _1172 = _1160 * _1164;
        float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1176 = fma(_1130, _1172, _1174);
        float _1178 = _1176 * _1170;
        float _1180 = precise::clamp(_1178, 0.0, 1.0);
        _1050 = _1180;
    }
    float _1182 = _1050;
    if (!_768)
    {
        float _1184 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1190 = _1186 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = _1188 * 0.15915493667125701904296875;
        float _1196 = _1186 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = 1.0 / _1192;
        float _1202 = _1194 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1198 * _1200;
        float _1208 = _1194 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1204 * _1206;
        float _1214 = 1.0 / _1212;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1218 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1216;
        float _1220 = 1.0 / _1218;
        float _1222 = _1210 * _1214;
        float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1226 = fma(_1130, _1222, _1224);
        float _1228 = _1226 * _1220;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + 1.0;
        _1122 = _1214;
        _1132 = _1234;
    }
    float _1236 = _1122;
    float _1238 = _1132;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1242 = _1112 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1114 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _1116 + _1248;
    float _1252 = _1242 * _1242;
    float _1254 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1246, _1246, _1252);
    float _1260 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1262 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1264 = fma(_1250, _1250, _1258);
    float _1266 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1260);
    float _1268 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1262);
    float _1270 = rsqrt(_1264);
    float _1272 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1276 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = sqrt(_1264);
    float _1280 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1282 = _1246 * _1280;
    float _1284 = _1250 * _1280;
    float _1286 = _1282 * _1282;
    float _1288 = _1284 * _1284;
    float _1290 = _1286 + _1288;
    float _1292 = sqrt(_1290);
    bool _1294 = _1292 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1298 = _1292 + _1296;
    float _1300 = _1118;
    float _1302 = _1290;
    float _1304 = _1298;
    float _1306 = _1282;
    float _1308 = _1284;
    float _1310 = _1286;
    float _1312 = _1288;
    if (_1294)
    {
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    if (_1294)
    {
        float _1318 = rsqrt(_1290);
        _1302 = _1318;
    }
    float _1320 = _1302;
    if (_1294)
    {
        float _1322 = _1298 * _1316;
        _1304 = _1322;
    }
    float _1324 = _1304;
    if (_1294)
    {
        float _1326 = _1324 * 0.15915493667125701904296875;
        _962 = _1326;
    }
    float _1328 = _962;
    float _1330 = _1316;
    if (_1294)
    {
        float _1332 = _1328 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        _1330 = _1334;
    }
    float _1336 = _1330;
    float _1338 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1340 = precise::max(0.0, _1338);
    float _1342 = _1236;
    if (_1294)
    {
        float _1344 = _1328 * 6.283185482025146484375;
        float _1346 = cos(_1344);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = -_1280;
    float _1352 = -_1340;
    float _1354 = fma(_1242, _1350, _1352);
    if (_1294)
    {
        float _1356 = _1354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1356;
    }
    float _1358 = _1046;
    float _1360 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1362 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1364 = _1358;
    float _1366 = _1336;
    if (_1294)
    {
        float _1368 = fma(_1336, _1358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    if (!_1294)
    {
        _1366 = _1354;
    }
    float _1374 = _1366;
    float _1376 = floor(_1362);
    float _1378 = _1374;
    if (_1294)
    {
        float _1380 = _1348 + (-1.0);
        _1124 = _1380;
    }
    float _1382 = _1124;
    float _1384 = _1382;
    if (_1294)
    {
        float _1386 = _1320 * _1370;
        _1372 = _1386;
    }
    float _1388 = _1372;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1392 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1390);
    float _1394 = precise::clamp(_1392, 0.0, 1.0);
    if (_1294)
    {
        float _1396 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1294)
    {
        float _1400 = _1282 * _1388;
        _1306 = _1400;
    }
    float _1402 = _1306;
    if (_1294)
    {
        float _1404 = _1284 * _1388;
        _1308 = _1404;
    }
    float _1406 = _1308;
    if (_1294)
    {
        float _1408 = fma(_1354, _1348, _1398);
        _1378 = _1408;
    }
    float _1410 = _1378;
    if (_1294)
    {
        float _1412 = _1402 * _1402;
        _1310 = _1412;
    }
    float _1414 = _1310;
    if (_1294)
    {
        float _1416 = _1406 * _1406;
        _1312 = _1416;
    }
    float _1418 = _1312;
    float _1420 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1360);
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1410, _1410, _1414);
    float _1428 = fma(_866, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1430 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1432 = _1426 + _1418;
    float _1434 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1436 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1430);
    float _1438 = abs(_1424);
    float _1440 = log2(_1438);
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1444 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1446 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1436);
    float _1448 = -_1276;
    float _1450 = fma(_1448, _1442, 1.0);
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1456 = rsqrt(_1432);
    float _1458 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1460 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1458);
    float _1462 = floor(_1428);
    float _1464 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1460);
    float _1466 = _1456 * _1402;
    float _1468 = _1456 * _1410;
    float _1470 = _1456 * _1406;
    float _1472 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1464);
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1476 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = log2(_1450);
    float _1480 = _1468 + 1.0;
    float _1482 = -_1474;
    float _1484 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = -_1462;
    float _1488 = _1428 + _1486;
    float _1490 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1452);
    float _1492 = -_1470;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = -_1376;
    float _1498 = _1362 + _1496;
    float _1500 = 1.0 / _1472;
    float _1502 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1504 = fma(_1494, -0.5, 0.5);
    float _1506 = fma(_1494, 0.5, 0.5);
    float _1508 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1490);
    float _1510 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1502);
    float _1512 = fma(_1506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1514 = exp2(_1476);
    float _1516 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1518 = _1478 * 0.693147182464599609375;
    float _1520 = fma(_1506, _1512, -0.212114393711090087890625);
    float _1522 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1524 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1508);
    float _1526 = fma(_1506, _1520, 1.570728778839111328125);
    float _1528 = sqrt(_1504);
    float _1530 = _1522 * _1500;
    float _1532 = _1524 * _1500;
    float _1534 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1536 = fma(_1532, -0.5, 0.5);
    float _1538 = -_1468;
    float _1540 = fma(_1514, _1480, _1538);
    float2 _5069 = float2(_1498, _1488);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5069, float2(0.0), isnan(_5069)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5069, float2(0.0), isnan(_5069)), level(0.0)).x;
    float _1544 = fma(_1540, 0.5, 0.5);
    float _1546 = _1528 * 0.636619746685028076171875;
    float _1548 = fma(_1530, 0.5, 0.5);
    float _1550 = -_1526;
    float _1552 = fma(_1546, _1550, 1.0);
    float3 _5092 = float3(_1548, _1536, _1534);
    float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5092, float3(0.0), isnan(_5092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5092, float3(0.0), isnan(_5092)), level(0.0)).x;
    float3 _5103 = float3(_1548, _1536, _1534);
    float4 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5103, float3(0.0), isnan(_5103)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5103, float3(0.0), isnan(_5103)), level(0.0)).xyzw;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = _1557.w;
    float2 _5119 = float2(_1552, _1544);
    float3 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5119, float2(0.0), isnan(_5119)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5119, float2(0.0), isnan(_5119)), level(0.0)).xyz;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = float(uint(_356));
    float _1579 = trunc(_498);
    int _1581 = int(_1579);
    float _1583 = _454 * _166;
    bool _1585 = _356 == 0;
    out.m_63.x = _862;
    out.m_63.y = _816;
    out.m_63.z = _866;
    int _1587 = abs(_564);
    float _1589 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1591 = abs(_568);
    out.m_65.w = _682;
    float _1593 = 1.0 / _1577;
    out.m_67.x = _788;
    out.m_69.x = _1114;
    out.m_69.y = _1112;
    out.m_69.z = _1116;
    float _1595 = float(uint(_1581));
    float _1597 = trunc(_1583);
    int _1599 = int(_1597);
    int _1601 = as_type<int>(_1593) + (-2);
    float _1603 = exp2(_1589);
    float _1605 = as_type<float>(_1601) * _1595;
    int _1607 = ~_356;
    int _1609 = _1607 + 1;
    int _1611 = ~_356;
    int _1613 = _1611 + 1;
    float _1615 = trunc(_1605);
    float _1617 = precise::max(_1615, 0.0);
    uint _1620 = uint(_1617);
    int _1622 = ~_356;
    int _1624 = _1622 + 1;
    float _1626 = -_1603;
    float _1628 = _1626 + 1.0;
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1632 = _1609 * int(_1620);
    int _1634 = _1632 + _1581;
    float _1636 = float(uint(_1634));
    float _1638 = as_type<float>(_1601) * _1636;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1642 = _1640 != 0;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    bool _1650 = !_1642;
    float _1652 = _1650 ? 7.345489978790283203125 : 1.0;
    float _1654 = _1652 * _314;
    float _1656 = float(_1581);
    float _1658 = floor(_1654);
    bool _1660 = _1656 >= _428;
    bool _1662 = isnan(_1656);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_428);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    int _1672 = int(_1620) + int(_1648);
    float _1674 = trunc(_1670);
    int _1676 = int(_1674);
    int _1678 = _1613 * _1672;
    int _1680 = _1678 + _1581;
    bool _1682 = uint(_1680) >= uint(_356);
    float _1684 = -_1658;
    float _1686 = _1654 + _1684;
    bool _1688 = !_1682;
    int _1690 = _1688 ? 0 : (-1);
    float _1692 = _1686 * _428;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1696 = _1694 != 0;
    int _1698 = ~_1672;
    int _1700 = _1698 + _1690;
    int _1702 = _1700 + 1;
    bool _1704 = !_1696;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = trunc(_1692);
    int _1710 = int(_1708);
    int _1712 = _356 + (-1);
    int _1714 = _356 * _1702;
    int _1716 = _1714 + _1581;
    int _1718 = ~_1676;
    int _1720 = _1718 + 1;
    int _1722 = _1720 + 1;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1726 = _1724 != 0;
    bool _1728 = !_1585;
    int _1730 = _1728 ? _1716 : (-1);
    int _1732 = abs(_1706);
    int _1734 = abs(_560);
    int _1736 = _1730 * _1722;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1744 = _1742 != 0;
    int _1746 = _1676 * _1712;
    int _1748 = _1746 + _1736;
    bool _1750 = !_1726;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1748 * _1734;
    int _1756 = _1710 * _1732;
    int _1758 = _1756 + _1581;
    int _1760 = abs(_1752);
    int _1762 = _1599 * _1587;
    int _1764 = _1762 + _1754;
    float _1766 = as_type<float>(_1587);
    float _1768 = _1472;
    if (_1740)
    {
        float _1770 = in.m_55.x;
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = _316 > 0.5;
    int _1776 = _1758 * _1591;
    int _1778 = _1776 + _1764;
    float _1780 = in.m_71.y;
    int _1782 = _1710 * _1760;
    int _1784 = _1782 + _1778;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1790 = float(uint(_1784));
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1794 = _1792 != 0;
    float _1796 = 1.0 / _1788;
    float _1798 = as_type<float>(_1601) * _1790;
    float _1800 = trunc(_1798);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    bool _1806 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1808 = isnan(_312);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1820 = in.m_71.x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1828 = -_1780;
    float _1830 = _1828 + 1.0;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1836;
    float _1840 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1838 * _1796;
    float _1848 = _1780;
    float _1850 = _1844;
    if (_1744)
    {
        float _1852 = _1774 ? _1830 : _1780;
        _1848 = _1852;
    }
    float _1854 = _1848;
    int _1856 = _1624 * int(_1804);
    int _1858 = _1856 + _1784;
    float _1860 = 1.0 / _1826;
    out.m_75.x = _1840;
    out.m_75.y = _1842;
    out.m_75.z = _1844;
    out.m_75.w = _1834;
    bool _1862 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1864 = isnan(_312);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1876 = float(uint(_1858));
    bool _1878 = _1772 > 0.5;
    bool _1880 = _1878 && _1740;
    float _1882 = -_1872;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1890 = as_type<float>(_1601) * _1876;
    float _1892 = float(uint(_1758));
    float _1894 = -_490;
    float _1896 = fma(_478, _1874, _1894);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1900 = _312 + _1898;
    float _1902 = _1888;
    if (_1740)
    {
        _1850 = _1820;
    }
    float _1904 = _1850;
    float _1906 = _1816 * _1884;
    bool _1908 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1910 = isnan(_312);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1916 = _1912 || _1914;
    float _1918 = float(_1916);
    float _1920 = fma(_1846, _1900, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1922 = -_1816;
    float _1924 = _1922 + 1.0;
    float _1926 = trunc(_1890);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    float _1932 = as_type<float>(_1601) * _1892;
    float _1934 = _1888 * _1860;
    float _1936 = _1904;
    if (_1880)
    {
        float _1938 = -_1904;
        float _1940 = _1938 + 1.0;
        _1936 = _1940;
    }
    float _1942 = _1936;
    if (!_1740)
    {
        _1902 = _1820;
    }
    float _1944 = _1902;
    float _1946 = _1918 * _1924;
    float _1948 = -_1918;
    float _1950 = _1948 + 1.0;
    bool _1952 = _742 != 0.0;
    bool _1954 = isnan(_742);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan(0.0);
    bool _1960 = _1956 || _1958;
    float _1962 = trunc(_1932);
    float _1964 = precise::max(_1962, 0.0);
    uint _1966 = uint(_1964);
    float _1968 = _1920 * _1946;
    float _1970 = _1944;
    if (_1740)
    {
        _1970 = _1942;
    }
    float _1972 = _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1976 = _312 + _1974;
    int _1978 = ~_356;
    int _1980 = _1978 + 1;
    float _1982 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1968);
    int _1984 = ~_356;
    int _1986 = _1984 + 1;
    float _1988 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1990 = int(_1804) + int(_1930);
    float _1992 = fma(_1934, _1976, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1994 = fma(_474, _1988, _412);
    bool _1996 = _740 == 0.0;
    bool _1998 = !_1960;
    bool _2000 = _1996 && _1998;
    float _2002 = fma(_1992, _1906, _1982);
    int _2004 = _1986 * _1990;
    int _2006 = _2004 + _1784;
    float _2008 = in.m_77.x;
    float _2010 = in.m_77.y;
    float _2012 = in.m_77.z;
    int _2014 = _1980 * int(_1966);
    int _2016 = _2014 + _1758;
    float _2018 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2002);
    bool _2020 = uint(_2006) >= uint(_356);
    float _2022 = _1994 + 0.5;
    bool _2024 = _744 == 0.0;
    bool _2026 = _2024 && _2000;
    float _2028 = float(uint(_2016));
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2032 = !_2020;
    int _2034 = _2032 ? 0 : (-1);
    float _2036 = as_type<float>(_1601) * _2028;
    int _2038 = ~_1990;
    int _2040 = _2038 + _2034;
    int _2042 = _2040 + 1;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2046 = _1896 + 0.5;
    float _2048 = trunc(_2036);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2056 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2058 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _2022;
    out.m_79.y = _2046;
    float _2064 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2066 = _2008;
    float _2068 = _2012;
    float _2070 = _2010;
    if (!_2026)
    {
        float _2072 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2066 = _2072;
    }
    float _2074 = _2066;
    int _2076 = _356 * _2042;
    int _2078 = _2076 + _1784;
    if (!_2026)
    {
        float _2080 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2068 = _2080;
    }
    float _2082 = _2068;
    int _2084 = ~_356;
    int _2086 = _2084 + 1;
    if (!_2026)
    {
        float _2088 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2070 = _2088;
    }
    float _2090 = _2070;
    float _2092 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2094 = !_1585;
    int _2096 = _2094 ? _2078 : (-1);
    out.m_81.x = _2056;
    out.m_81.y = _2058;
    out.m_81.z = _2062;
    out.m_81.w = _2060;
    int _2098 = int(_1966) + int(_2052);
    float _2100 = -_806;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    int _2104 = _2096 >> 31;
    float _2106 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2110 = _2096 & 3;
    bool _2112 = _2110 != 0;
    float _2114 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2116 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2114);
    int _2118 = _2086 * _2098;
    int _2120 = _2118 + _1758;
    float _2122 = -_806;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2092);
    int _2126 = _2104 & 3;
    float _2128 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2102);
    float _2130 = -_806;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    float _2134 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    int _2136 = _2096 + _2126;
    float _2138 = abs(_1130);
    float _2140 = log2(_2138);
    bool _2142 = uint(_2120) >= uint(_356);
    float _2144 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2132);
    int _2146 = _2136 >> 2;
    float _2148 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2108);
    float _2152 = _2134 * _2090;
    int _2154 = _2146 << 4;
    int _2156 = _2154 + 368;
    float _2158 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    int _2160 = _2096 & 3;
    bool _2162 = _2160 != 0;
    float _2164 = _2128 * _2090;
    uint _2166 = uint(int(uint(_2156) >> uint(2)));
    uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
    int _2170 = int(_2166) & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = int(_2166) + 1;
    uint _2176 = uint(int(uint(_2174) >> uint(2)));
    int _2178 = _2174 & 3;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[int(_2176)][_2178];
    float _2182 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2158);
    float _2184 = _2144 * _2090;
    bool _2186 = !_2142;
    int _2188 = _2186 ? 0 : (-1);
    float _2190 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2150);
    bool _2192 = uint(_2160) > 1u;
    float _2194 = fma(_2182, _2074, _2152);
    int _2196 = ~_2098;
    int _2198 = _2196 + _2188;
    int _2200 = _2198 + 1;
    int _2202 = _2156 + 8;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = _2112 ? 0 : 1;
    float _2222 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2224 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2228 = ~_2220;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    bool _2236 = uint(_2160) >= 2u;
    float _2238 = fma(_2190, _2074, _2164);
    float _2240 = exp2(_2222);
    int _2242 = _2232;
    if (!_2192)
    {
        int _2244 = ~_2220;
        int _2246 = _2244 + 1;
        _2242 = _2246;
    }
    int _2248 = _2242;
    float _2250 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    bool _2252 = _2160 != 3;
    float _2254 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2226);
    int _2256 = abs(_2248);
    float _2258 = fma(_2234, _2082, _2238);
    int _2260 = _2236 ? 0 : 1;
    float _2262 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2250);
    bool _2264 = !_2162;
    int _2266 = _2264 ? 0 : 1;
    float _2268 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2254);
    float _2270 = fma(_2262, _2074, _2184);
    int _2272 = ~_2260;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = fma(_2268, _2082, _2194);
    int _2280 = abs(_2266);
    float _2282 = -_1542;
    float _2284 = _2282 + 1.0;
    bool _2286 = _2160 != 3;
    int _2288 = _356 * _2200;
    int _2290 = _2288 + _1758;
    int _2292 = _2276;
    if (_2252)
    {
        int _2294 = ~_2260;
        int _2296 = _2294 + 1;
        _2292 = _2296;
    }
    int _2298 = _2292;
    float _2300 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2302 = ~_2256;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = _1630 * _1554;
    float _2310 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2300);
    bool _2312 = !_2286;
    int _2314 = _2312 ? 0 : (-1);
    float _2316 = fma(_2240, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    int _2320 = abs(_2298);
    float _2322 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    int _2324 = _2306 * as_type<int>(_2180);
    bool _2326 = !_1794;
    int _2328 = _2326 ? 0 : 1;
    int _2330 = ~_2280;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    bool _2336 = _1130 <= 8000.0;
    bool _2338 = isnan(_1130);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    bool _2348 = !_1585;
    int _2350 = _2348 ? _2290 : (-1);
    int _2352 = _2334 * as_type<int>(_2172);
    int _2354 = _2352 + _2324;
    int _2356 = abs(_2314);
    float _2358 = _1522 + _1472;
    float _2360 = _1575 * _2308;
    float _2362 = fma(_2322, _2082, _2270);
    int _2364 = abs(_2328);
    float _2366 = _2358 * 0.5;
    int _2368 = ~_2320;
    int _2370 = _2368 + 1;
    int _2372 = _2370 + 1;
    float _2374 = fma(_2318, -2.0, 3.0);
    float _2376 = _2318 * _2318;
    int _2378 = _2372 * as_type<int>(_2210);
    int _2380 = _2378 + _2354;
    int _2382 = ~_2356;
    int _2384 = _2382 + 1;
    int _2386 = _2384 + 1;
    float _2388 = _2376 * _2374;
    float _2390 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2392 = ~_2364;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = fma(_1565, _2360, _1563);
    int _2400 = _2386 * as_type<int>(_2218);
    int _2402 = _2400 + _2380;
    float _2404 = -_2388;
    float _2406 = _2404 + 1.0;
    float _2408 = in.m_83.x;
    float _2410 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2412 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2388);
    int _2414 = _2402 * _2396;
    float _2416 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2410);
    float _2418 = _1472 * 0.5;
    float _2420 = _2346 * _2412;
    int _2422 = _2350 * _2364;
    int _2424 = _2422 + _2414;
    float _2426 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2416);
    float _2428 = fma(_1524, -0.5, _2418);
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2432 = _2426 + _1472;
    out.gl_Position.x = _1522;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _2426;
    out.gl_Position.w = _1472;
    float _2434 = _2284 * _2430;
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = float(_2424);
    float _2440 = _2432 * 0.5;
    out.m_85.x = _2278;
    out.m_85.y = _2258;
    out.m_85.z = _2362;
    float _2442 = -_2436;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2446 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2448 = isnan(_1278);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2454 = _2450 || _2452;
    out.m_87.x = _2366;
    out.m_87.y = _2428;
    out.m_87.z = _2440;
    out.m_87.w = _1472;
    float _2456 = _2444 * _2408;
    out.m_89.x = _2438;
    float _2458 = _1565 * _2308;
    float _2460 = -_1630;
    float _2462 = _2460 + 1.0;
    float _2464 = _2456 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2466 = fma(_1571, _2458, _1559);
    float _2468 = fma(_1573, _2458, _1561);
    float _2470 = _1565 * _2462;
    out.m_91.x = _2464;
    float _2472 = _1182 * _1238;
    float _2474 = _2408;
    float _2476 = _2418;
    float _2478 = _2426;
    float _2480 = _2458;
    float _2482 = _2472;
    if (!_2454)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2474;
    out.m_93.x = _2466;
    out.m_93.y = _2468;
    out.m_93.z = _2398;
    out.m_93.w = _2470;
    float _2486 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2488 = _2484;
    float _2490 = _2484;
    if (!_2454)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2492 = _2476;
    float _2494 = _2492;
    float _2496 = _2492;
    if (!_2454)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _1768;
    float _2500 = _2498;
    float _2502 = _2498;
    if (!_2454)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2504 = _2478;
    float _2506 = _2504;
    float _2508 = _2504;
    if (!_2454)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2510 = _2480;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2454)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2516 = _2482;
    bool _2518 = !_2454;
    float _2520 = _2516;
    float _2522 = _2516;
    if (!_2518)
    {
        bool _2524 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2526 = isnan(_1278);
        bool _2528 = _2524 || _2526;
        bool _2530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2532 = _2528 || _2530;
        if (!_2532)
        {
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = _1278 + _2534;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2538;
            float _2542 = 1.0 / _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2564 = _2536 * _2542;
            float _2566 = precise::clamp(_2564, 0.0, 1.0);
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2572 = fma(_2566, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2574 = fma(_2566, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2566, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2578 = fma(_2566, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2580 = fma(_2566, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2582 = fma(_2566, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2496 = _2574;
            _2514 = _2580;
            _2490 = _2572;
            _2508 = _2578;
            _2502 = _2576;
            _2522 = _2582;
            _2584 = true;
        }
        else
        {
            bool _2586 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2588 = isnan(_1278);
            bool _2590 = _2586 || _2588;
            bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2594 = _2590 || _2592;
            if (!_2594)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2596 = _2488;
            _2490 = _2596;
            if (!_2594)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2598 = _2494;
            _2496 = _2598;
            if (!_2594)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2600 = _2500;
            _2502 = _2600;
            if (!_2594)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2602 = _2506;
            _2508 = _2602;
            if (!_2594)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2604 = _2512;
            _2514 = _2604;
            if (!_2594)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2606 = _2520;
            bool _2608 = !_2594;
            _2522 = _2606;
            if (!_2608)
            {
                bool _2610 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2612 = isnan(_1278);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2618 = _2614 || _2616;
                if (!_2618)
                {
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = _1278 + _2620;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2624;
                    float _2628 = 1.0 / _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2650 = _2622 * _2628;
                    float _2652 = precise::clamp(_2650, 0.0, 1.0);
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2658 = fma(_2652, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2496 = _2660;
                    _2514 = _2666;
                    _2490 = _2658;
                    _2508 = _2664;
                    _2502 = _2662;
                    _2522 = _2668;
                    _2584 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2584 = false;
    float _2670 = _2496;
    float _2672 = _2514;
    float _2674 = _2490;
    float _2676 = _2508;
    float _2678 = _2502;
    float _2680 = _2522;
    float _2682 = _2486 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_2258, -0.5, 0.5);
    float _2686 = precise::clamp(_2684, 0.0, 1.0);
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = -_2674;
    float _2694 = _2692 + _2676;
    out.m_53.x = _2682;
    float _2696 = fma(_2686, _2690, _2670);
    float _2698 = -_2678;
    float _2700 = _2698 + _2680;
    float _2702 = fma(_2686, _2694, _2674);
    float _2704 = _2696 * 0.586610972881317138671875;
    bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = fma(_2686, _2700, _2678);
    out.m_95.x = 0.0;
    float _2710 = fma(_2702, 0.298911988735198974609375, _2704);
    bool _2712 = _1182 > 0.0;
    bool _2714 = isnan(_1182);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan(0.0);
    bool _2720 = _2716 || _2718;
    float _2722 = fma(_2708, 0.114477999508380889892578125, _2710);
    bool _2724 = _1238 <= 0.0;
    bool _2726 = !_2720;
    bool _2728 = _2724 || _2726;
    float _2730 = -_2722;
    float _2732 = _2702 + _2730;
    float _2734 = -_2722;
    float _2736 = _2696 + _2734;
    float _2738 = -_2722;
    float _2740 = _2708 + _2738;
    float _2742 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2744 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2746 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    bool _2748 = !_2706;
    if (!_2748)
    {
        float _2750 = -_1112;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2754 = -_1114;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2758 = -_1116;
        float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2762 = _2752 * _2752;
        float _2764 = fma(_2756, _2756, _2762);
        float _2766 = fma(_2760, _2760, _2764);
        float _2768 = sqrt(_2766);
        float _2770 = rsqrt(_2766);
        float _2772 = -_2768;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2776 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = _2756 * _2770;
        float _2782 = _2752 * _2770;
        float _2784 = abs(_2778);
        float _2786 = log2(_2784);
        float _2788 = _2760 * _2770;
        float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2792 = _2258 * _2782;
        float _2794 = -_2782;
        float _2796 = -_2790;
        float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2796);
        float _2800 = fma(_2278, _2780, _2792);
        float _2802 = -_2788;
        float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2798);
        float _2806 = fma(_2362, _2788, _2800);
        float _2808 = precise::clamp(_2806, 0.0, 1.0);
        float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2812 = _2804 + _2810;
        float _2814 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2818 = precise::clamp(_2816, 0.0, 1.0);
        float _2820 = exp2(_2814);
        float _2822 = _2820 * _2818;
        float _2824 = _2808 * _2822;
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2826;
        out.m_95.y = _2828;
        out.m_95.z = _2830;
    }
    out.m_65.x = _2742;
    out.m_65.y = _2744;
    out.m_65.z = _2746;
    if (!_2728)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2832;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2584 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_138);
        out.gl_Position.z = _2901;
    }
    if (!_124)
    {
        return out;
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_164);
        out.gl_Position.z = _2956;
    }
    if (_158)
    {
        return out;
    }
    float _166 = 1.0 / _152;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _120 * _166;
    bool _172 = !_168;
    float _174 = _170;
    float _192;
    if (!_172)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _170;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = 1.0 / _216;
    bool _220 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -_212;
    float _234 = _232 + 1.0;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _230 * _234;
    float _252 = -_230;
    float _254 = _252 + 1.0;
    float _256 = _200 * _218;
    float _258 = in.m_57.x;
    float _260 = in.m_57.y;
    float _262 = in.m_57.z;
    float _264 = fma(_238, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_248, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = fma(_242, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _264 * _250;
    float _272 = _266 * _250;
    float _274 = _268 * _250;
    float _276 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _278 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _272);
    float _280 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _278);
    float _286 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _280);
    float _288 = _282 * _258;
    float _290 = _284 * _260;
    float _292 = _286 * _262;
    bool _294 = !_244;
    if (!_294)
    {
        float _296 = in.m_55.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _174 = _310;
    }
    float _312 = _174;
    float _314 = in.m_55.x;
    float _316 = in.m_55.y;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    float _322 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _324 = in.m_46.x;
    float _326 = in.m_46.y;
    float _328 = in.m_46.z;
    float _330 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _332 = in.m_55.z;
    float _334 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _336 = int(_334);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _348 = _344 || _346;
    float _350 = _320 * _120;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _354 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _356 = int(_354);
    float _358 = _314 * 2.0;
    float _360 = _314 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _362 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _364 = exp2(_350);
    float _366 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _368 = -_352;
    float _370 = fma(_360, 2.0, _368);
    float _372 = fma(_362, -2.0, _338);
    float _374 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _316 + _314;
    float _380 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].x, _366);
    float _382 = floor(_358);
    float _384 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _388 = _316 * 2.0;
    float _390 = _378 + (-1.0);
    float _392 = _316 + _332;
    float _394 = _332 * 2.0;
    float _396 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _398 = _392 + (-1.0);
    float _400 = float(_336);
    float _402 = floor(_388);
    float _404 = -_364;
    float _406 = _404 + 1.0;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _410 = -_120;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[76].x, _370);
    bool _414 = _382 > 0.0;
    bool _416 = _382 >= 0.0;
    bool _418 = isnan(_382);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = floor(_394);
    float _428 = float(_356);
    bool _430 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(1.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _442 = 1.0 + _440;
    float _444 = _348 ? _406 : 0.0;
    float _446 = 1.0 / _400;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _452 = _402 > 0.0;
    float _454 = _428 * _120;
    float _456 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _458 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].w, _450);
    int _460 = _424 ? 0 : 1;
    float _462 = 1.0 / _442;
    bool _464 = _402 >= 0.0;
    bool _466 = isnan(_402);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _456);
    bool _476 = _426 > 0.0;
    float _478 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    bool _480 = _426 >= 0.0;
    bool _482 = isnan(_426);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _372);
    int _492 = ~_460;
    int _494 = _492 + 1;
    int _496 = _494 + 1;
    float _498 = _446 * _120;
    int _500 = _496;
    if (!_414)
    {
        int _502 = ~_460;
        int _504 = _502 + 1;
        _500 = _504;
    }
    int _506 = _500;
    float _508 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    int _510 = _472 ? 0 : 1;
    float _512 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _514 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[6].z, _386);
    float _516 = _508 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _518 = ~_510;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    int _524 = _522;
    if (_438)
    {
        float _526 = _444 * _462;
        _130 = _526;
    }
    float _528 = _130;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _540 = _538 != 0;
    float _542 = _512 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_452)
    {
        int _544 = ~_510;
        int _546 = _544 + 1;
        _524 = _546;
    }
    int _548 = _524;
    float _550 = _514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    bool _558 = !_536;
    int _560 = _558 ? 0 : 1;
    bool _562 = !_532;
    int _564 = _562 ? 0 : 1;
    bool _566 = !_540;
    int _568 = _566 ? 0 : 1;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _580 = _578 != 0;
    int _582 = _488 ? 0 : 1;
    float _584 = float(_506);
    bool _586 = !_572;
    int _588 = _586 ? 0 : 1;
    bool _590 = !_576;
    int _592 = _590 ? 0 : 1;
    int _594 = abs(_588);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _516 + _596;
    int _600 = abs(_592);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _542 + _602;
    int _606 = ~_582;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _598 * _598;
    float _614 = float(_600);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _550 + _616;
    int _620 = _610;
    if (!_476)
    {
        int _622 = ~_582;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = fma(_604, _604, _612);
    float _630 = _614 * _584;
    float _632 = float(_594);
    float _634 = fma(_618, _618, _628);
    float _636 = float(_626);
    float _638 = _630 * (-2.0);
    bool _640 = !_580;
    int _642 = _640 ? 0 : 1;
    float _644 = sqrt(_634);
    float _646 = _316 + (-0.5);
    float _648 = fma(_638, _554, _554);
    int _650 = abs(_642);
    float _652 = _632 * _636;
    float _654 = fma(_408, _638, _408);
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _648);
    float _658 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = rsqrt(_634);
    float _662 = _332 + _314;
    float _664 = float(_548);
    float _666 = _658 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _668 = float(_650);
    float _670 = _652 * (-2.0);
    float _672 = _644 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _674 = _662 + (-1.0);
    float _676 = _668 * _664;
    float _678 = _314 + (-0.5);
    float _680 = fma(_670, _552, _552);
    float _682 = precise::min(_666, _672);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _686 = _676 * (-2.0);
    float _688 = fma(_396, _670, _396);
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _692 = _660 * _682;
    float _694 = fma(_684, _686, _684);
    float _696 = fma(_686, _556, _556);
    float _698 = _332 + (-0.5);
    float _700 = fma(_688, _528, _690);
    float _702 = _598 * _692;
    float _704 = _604 * _692;
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _708 = fma(_654, _528, _656);
    float _710 = -_702;
    float _712 = _598 + _710;
    float _714 = -_704;
    float _716 = _604 + _714;
    float _718 = fma(_694, _528, _706);
    float _720 = _618 * _692;
    float _722 = _712 * _712;
    float _724 = _708 * 0.15915493667125701904296875;
    float _726 = _700 * 0.15915493667125701904296875;
    float _728 = -_720;
    float _730 = _618 + _728;
    float _732 = fma(_716, _716, _722);
    float _734 = _724 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = fma(_730, _730, _732);
    float _740 = in.m_61.x;
    float _742 = in.m_61.y;
    float _744 = in.m_61.z;
    bool _746 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _748 = isnan(0.5);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _754 = _750 || _752;
    float _756 = _724 * 6.283185482025146484375;
    float _758 = cos(_756);
    bool _760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _762 = isnan(0.5);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _768 = _764 || _766;
    float _770 = sqrt(_738);
    float _772 = _718 * 0.15915493667125701904296875;
    float _774 = _726 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _742);
    float _780 = _726 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _660 * _770;
    float _786 = _322 * _784;
    float _788 = _658 * _784;
    float _790 = _330 * _784;
    float _792 = _772 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = _776 * _736;
    float _798 = _776 * _758;
    float _800 = _786 * _778;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _744);
    float _804 = _772 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = _782 * _758;
    float _810 = _782 * _736;
    float _812 = _790 * _802;
    float _814 = -_702;
    float _816 = _516 + _814;
    float _818 = _776 * _794;
    float _820 = _758 * _794;
    float _822 = _782 * _794;
    float _824 = _736 * _794;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _740);
    float _828 = _818 * _800;
    float _830 = _816 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = _788 * _826;
    float _834 = fma(_806, _808, _796);
    float _836 = _822 * _800;
    float _838 = -_810;
    float _840 = fma(_806, _798, _838);
    float _842 = -_798;
    float _844 = fma(_806, _810, _842);
    float _846 = -_800;
    float _848 = _806 * _846;
    float _850 = fma(_834, _832, _836);
    float _852 = fma(_806, _796, _808);
    float _854 = fma(_840, _832, _828);
    float _856 = fma(_820, _832, _848);
    float _858 = fma(_844, _812, _850);
    float _860 = -_704;
    float _862 = _542 + _860;
    float _864 = -_720;
    float _866 = _550 + _864;
    float _868 = fma(_824, _812, _856);
    float _870 = _858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _872 = _858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _874 = fma(_852, _812, _854);
    float _876 = _816 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _878 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _870);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _872);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _876);
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _878);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _880);
    float _890 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[10].z, _882);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[11].z, _884);
    float _894 = _886 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _896 = _888 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _898 = _890 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _900 = _892 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _902 = _550 + _894;
    float _904 = _542 + _896;
    float _906 = _858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _908 = 1.0 / _900;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _902 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _904 + _914;
    float _918 = _898 + _900;
    float _920 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _906);
    float _922 = _912 * _912;
    float _924 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _920);
    float _926 = fma(_916, _916, _922);
    float _928 = _924 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _930 = sqrt(_926);
    float _932 = _918 * _908;
    float _934 = _932 * 0.5;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _938 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _936);
    float _940 = _516 + _928;
    float _942 = 1.0 / _938;
    bool _944 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _946 = _924;
    float _948 = _928;
    float _950 = _868;
    float _952 = _938;
    float _954 = _930;
    float _956 = _720;
    float _958 = _702;
    float _960 = _908;
    float _962 = _904;
    if (!_944)
    {
        _946 = _904;
    }
    float _964 = _946;
    float _966 = _964;
    if (!_944)
    {
        _948 = _902;
    }
    float _968 = _948;
    float _970 = _968;
    if (!_944)
    {
        _950 = _940;
    }
    float _972 = _950;
    bool _974 = !_944;
    float _976 = _972;
    if (!_974)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _982 = _930 + _980;
        float _984 = rsqrt(_926);
        float _986 = _982 * _978;
        float _988 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = _986 * 0.15915493667125701904296875;
        float _992 = _990 * 6.283185482025146484375;
        float _994 = cos(_992);
        float _996 = _990 * 6.283185482025146484375;
        float _998 = sin(_996);
        float _1000 = _994 + (-1.0);
        float _1002 = fma(_998, _988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1004 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = _984 * _1002;
        float _1008 = fma(_940, _994, _1004);
        float _1010 = fma(_916, _1006, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1012 = fma(_912, _1006, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _1010;
        _970 = _1012;
        _976 = _1008;
        _952 = _990;
        _954 = _1000;
    }
    float _1014 = _966;
    float _1016 = _970;
    float _1018 = _976;
    float _1020 = _952;
    float _1022 = _954;
    float _1024 = -_704;
    float _1026 = _1024 + _1014;
    float _1028 = -_720;
    float _1030 = _1028 + _1016;
    float _1032 = -_702;
    float _1034 = _1032 + _1018;
    float _1036 = _1026;
    float _1038 = _1014;
    float _1040 = _1034;
    float _1042 = _1018;
    float _1044 = _1022;
    float _1046 = _1020;
    if (_768)
    {
        _956 = 1.0;
    }
    float _1048 = _956;
    float _1050 = _1048;
    if (_754)
    {
        _958 = _1026;
    }
    float _1052 = _958;
    float _1054 = _1052;
    if (_754)
    {
        _1036 = _1030;
    }
    float _1056 = _1036;
    float _1058 = _1056;
    if (!_754)
    {
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1062 = _816 + _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1066 = _862 + _1064;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1070 = -_542;
        float _1072 = _1070 + _1014;
        float _1074 = _1062 * _1062;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1078 = _866 + _1076;
        float _1080 = -_516;
        float _1082 = _1080 + _1018;
        float _1084 = -_550;
        float _1086 = _1084 + _1016;
        float _1088 = fma(_1066, _1066, _1074);
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1092 = fma(_1078, _1078, _1088);
        float _1094 = sqrt(_1092);
        float _1096 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1098 = precise::min(_1094, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1100 = _1098 * _1090;
        float _1102 = _1096 * _1100;
        float _1104 = fma(_1072, _1102, _862);
        float _1106 = fma(_1082, _1102, _816);
        float _1108 = fma(_1086, _1102, _866);
        _1038 = _1072;
        _1040 = _1106;
        _1054 = _1104;
        _1058 = _1108;
        _1042 = _1082;
        _1044 = _1090;
    }
    float _1110 = _1038;
    float _1112 = _1040;
    float _1114 = _1054;
    float _1116 = _1058;
    float _1118 = _1042;
    float _1120 = _1044;
    float _1122 = _1110;
    float _1124 = _1120;
    if (_768)
    {
        _960 = 1.0;
    }
    float _1126 = _960;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1130 = _942 * _1128;
    float _1132 = _1126;
    if (!_768)
    {
        float _1134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1140 = _1136 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1138 * 0.15915493667125701904296875;
        float _1146 = _1136 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = 1.0 / _1142;
        float _1152 = _1144 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1148 * _1150;
        float _1158 = _1144 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1154 * _1156;
        float _1164 = 1.0 / _1162;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1166;
        float _1170 = 1.0 / _1168;
        float _1172 = _1160 * _1164;
        float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1176 = fma(_1130, _1172, _1174);
        float _1178 = _1176 * _1170;
        float _1180 = precise::clamp(_1178, 0.0, 1.0);
        _1050 = _1180;
    }
    float _1182 = _1050;
    if (!_768)
    {
        float _1184 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1190 = _1186 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = _1188 * 0.15915493667125701904296875;
        float _1196 = _1186 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = 1.0 / _1192;
        float _1202 = _1194 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1198 * _1200;
        float _1208 = _1194 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1204 * _1206;
        float _1214 = 1.0 / _1212;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1218 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1216;
        float _1220 = 1.0 / _1218;
        float _1222 = _1210 * _1214;
        float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1226 = fma(_1130, _1222, _1224);
        float _1228 = _1226 * _1220;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + 1.0;
        _1122 = _1214;
        _1132 = _1234;
    }
    float _1236 = _1122;
    float _1238 = _1132;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1242 = _1112 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1114 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _1116 + _1248;
    float _1252 = _1242 * _1242;
    float _1254 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1246, _1246, _1252);
    float _1260 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1262 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1264 = fma(_1250, _1250, _1258);
    float _1266 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1260);
    float _1268 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1262);
    float _1270 = rsqrt(_1264);
    float _1272 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1276 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = sqrt(_1264);
    float _1280 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1282 = _1246 * _1280;
    float _1284 = _1250 * _1280;
    float _1286 = _1282 * _1282;
    float _1288 = _1284 * _1284;
    float _1290 = _1286 + _1288;
    float _1292 = sqrt(_1290);
    bool _1294 = _1292 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1298 = _1292 + _1296;
    float _1300 = _1118;
    float _1302 = _1290;
    float _1304 = _1298;
    float _1306 = _1282;
    float _1308 = _1284;
    float _1310 = _1286;
    float _1312 = _1288;
    if (_1294)
    {
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    if (_1294)
    {
        float _1318 = rsqrt(_1290);
        _1302 = _1318;
    }
    float _1320 = _1302;
    if (_1294)
    {
        float _1322 = _1298 * _1316;
        _1304 = _1322;
    }
    float _1324 = _1304;
    if (_1294)
    {
        float _1326 = _1324 * 0.15915493667125701904296875;
        _962 = _1326;
    }
    float _1328 = _962;
    float _1330 = _1316;
    if (_1294)
    {
        float _1332 = _1328 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        _1330 = _1334;
    }
    float _1336 = _1330;
    float _1338 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1340 = precise::max(0.0, _1338);
    float _1342 = _1236;
    if (_1294)
    {
        float _1344 = _1328 * 6.283185482025146484375;
        float _1346 = cos(_1344);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = -_1280;
    float _1352 = -_1340;
    float _1354 = fma(_1242, _1350, _1352);
    if (_1294)
    {
        float _1356 = _1354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1356;
    }
    float _1358 = _1046;
    float _1360 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1362 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1364 = _1358;
    float _1366 = _1336;
    if (_1294)
    {
        float _1368 = fma(_1336, _1358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    if (!_1294)
    {
        _1366 = _1354;
    }
    float _1374 = _1366;
    float _1376 = floor(_1362);
    float _1378 = _1374;
    if (_1294)
    {
        float _1380 = _1348 + (-1.0);
        _1124 = _1380;
    }
    float _1382 = _1124;
    float _1384 = _1382;
    if (_1294)
    {
        float _1386 = _1320 * _1370;
        _1372 = _1386;
    }
    float _1388 = _1372;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1392 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1390);
    float _1394 = precise::clamp(_1392, 0.0, 1.0);
    if (_1294)
    {
        float _1396 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1294)
    {
        float _1400 = _1282 * _1388;
        _1306 = _1400;
    }
    float _1402 = _1306;
    if (_1294)
    {
        float _1404 = _1284 * _1388;
        _1308 = _1404;
    }
    float _1406 = _1308;
    if (_1294)
    {
        float _1408 = fma(_1354, _1348, _1398);
        _1378 = _1408;
    }
    float _1410 = _1378;
    if (_1294)
    {
        float _1412 = _1402 * _1402;
        _1310 = _1412;
    }
    float _1414 = _1310;
    if (_1294)
    {
        float _1416 = _1406 * _1406;
        _1312 = _1416;
    }
    float _1418 = _1312;
    float _1420 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1360);
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1410, _1410, _1414);
    float _1428 = fma(_866, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1430 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1432 = _1426 + _1418;
    float _1434 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1436 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1430);
    float _1438 = abs(_1424);
    float _1440 = log2(_1438);
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1444 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1446 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1436);
    float _1448 = -_1276;
    float _1450 = fma(_1448, _1442, 1.0);
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1456 = rsqrt(_1432);
    float _1458 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1460 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1458);
    float _1462 = floor(_1428);
    float _1464 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1460);
    float _1466 = _1456 * _1402;
    float _1468 = _1456 * _1410;
    float _1470 = _1456 * _1406;
    float _1472 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1464);
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1476 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = log2(_1450);
    float _1480 = _1468 + 1.0;
    float _1482 = -_1474;
    float _1484 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = -_1462;
    float _1488 = _1428 + _1486;
    float _1490 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1452);
    float _1492 = -_1470;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = -_1376;
    float _1498 = _1362 + _1496;
    float _1500 = 1.0 / _1472;
    float _1502 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1504 = fma(_1494, -0.5, 0.5);
    float _1506 = fma(_1494, 0.5, 0.5);
    float _1508 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1490);
    float _1510 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1502);
    float _1512 = fma(_1506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1514 = exp2(_1476);
    float _1516 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1518 = _1478 * 0.693147182464599609375;
    float _1520 = fma(_1506, _1512, -0.212114393711090087890625);
    float _1522 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1524 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1508);
    float _1526 = fma(_1506, _1520, 1.570728778839111328125);
    float _1528 = sqrt(_1504);
    float _1530 = _1522 * _1500;
    float _1532 = _1524 * _1500;
    float _1534 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1536 = fma(_1532, -0.5, 0.5);
    float _1538 = -_1468;
    float _1540 = fma(_1514, _1480, _1538);
    float2 _5069 = float2(_1498, _1488);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5069, float2(0.0), isnan(_5069)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5069, float2(0.0), isnan(_5069)), level(0.0)).x;
    float _1544 = fma(_1540, 0.5, 0.5);
    float _1546 = _1528 * 0.636619746685028076171875;
    float _1548 = fma(_1530, 0.5, 0.5);
    float _1550 = -_1526;
    float _1552 = fma(_1546, _1550, 1.0);
    float3 _5092 = float3(_1548, _1536, _1534);
    float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5092, float3(0.0), isnan(_5092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5092, float3(0.0), isnan(_5092)), level(0.0)).x;
    float3 _5103 = float3(_1548, _1536, _1534);
    float4 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5103, float3(0.0), isnan(_5103)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5103, float3(0.0), isnan(_5103)), level(0.0)).xyzw;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = _1557.w;
    float2 _5119 = float2(_1552, _1544);
    float3 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5119, float2(0.0), isnan(_5119)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5119, float2(0.0), isnan(_5119)), level(0.0)).xyz;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = float(uint(_356));
    float _1579 = trunc(_498);
    int _1581 = int(_1579);
    float _1583 = _454 * _166;
    bool _1585 = _356 == 0;
    out.m_63.x = _862;
    out.m_63.y = _816;
    out.m_63.z = _866;
    int _1587 = abs(_564);
    float _1589 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1591 = abs(_568);
    out.m_65.w = _682;
    float _1593 = 1.0 / _1577;
    out.m_67.x = _788;
    out.m_69.x = _1114;
    out.m_69.y = _1112;
    out.m_69.z = _1116;
    float _1595 = float(uint(_1581));
    float _1597 = trunc(_1583);
    int _1599 = int(_1597);
    int _1601 = as_type<int>(_1593) + (-2);
    float _1603 = exp2(_1589);
    float _1605 = as_type<float>(_1601) * _1595;
    int _1607 = ~_356;
    int _1609 = _1607 + 1;
    int _1611 = ~_356;
    int _1613 = _1611 + 1;
    float _1615 = trunc(_1605);
    float _1617 = precise::max(_1615, 0.0);
    uint _1620 = uint(_1617);
    int _1622 = ~_356;
    int _1624 = _1622 + 1;
    float _1626 = -_1603;
    float _1628 = _1626 + 1.0;
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1632 = _1609 * int(_1620);
    int _1634 = _1632 + _1581;
    float _1636 = float(uint(_1634));
    float _1638 = as_type<float>(_1601) * _1636;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1642 = _1640 != 0;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    bool _1650 = !_1642;
    float _1652 = _1650 ? 7.345489978790283203125 : 1.0;
    float _1654 = _1652 * _314;
    float _1656 = float(_1581);
    float _1658 = floor(_1654);
    bool _1660 = _1656 >= _428;
    bool _1662 = isnan(_1656);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_428);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    int _1672 = int(_1620) + int(_1648);
    float _1674 = trunc(_1670);
    int _1676 = int(_1674);
    int _1678 = _1613 * _1672;
    int _1680 = _1678 + _1581;
    bool _1682 = uint(_1680) >= uint(_356);
    float _1684 = -_1658;
    float _1686 = _1654 + _1684;
    bool _1688 = !_1682;
    int _1690 = _1688 ? 0 : (-1);
    float _1692 = _1686 * _428;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1696 = _1694 != 0;
    int _1698 = ~_1672;
    int _1700 = _1698 + _1690;
    int _1702 = _1700 + 1;
    bool _1704 = !_1696;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = trunc(_1692);
    int _1710 = int(_1708);
    int _1712 = _356 + (-1);
    int _1714 = _356 * _1702;
    int _1716 = _1714 + _1581;
    int _1718 = ~_1676;
    int _1720 = _1718 + 1;
    int _1722 = _1720 + 1;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1726 = _1724 != 0;
    bool _1728 = !_1585;
    int _1730 = _1728 ? _1716 : (-1);
    int _1732 = abs(_1706);
    int _1734 = abs(_560);
    int _1736 = _1730 * _1722;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1744 = _1742 != 0;
    int _1746 = _1676 * _1712;
    int _1748 = _1746 + _1736;
    bool _1750 = !_1726;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1748 * _1734;
    int _1756 = _1710 * _1732;
    int _1758 = _1756 + _1581;
    int _1760 = abs(_1752);
    int _1762 = _1599 * _1587;
    int _1764 = _1762 + _1754;
    float _1766 = as_type<float>(_1587);
    float _1768 = _1472;
    if (_1740)
    {
        float _1770 = in.m_55.x;
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = _316 > 0.5;
    int _1776 = _1758 * _1591;
    int _1778 = _1776 + _1764;
    float _1780 = in.m_71.y;
    int _1782 = _1710 * _1760;
    int _1784 = _1782 + _1778;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1790 = float(uint(_1784));
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1794 = _1792 != 0;
    float _1796 = 1.0 / _1788;
    float _1798 = as_type<float>(_1601) * _1790;
    float _1800 = trunc(_1798);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    bool _1806 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1808 = isnan(_312);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1820 = in.m_71.x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1828 = -_1780;
    float _1830 = _1828 + 1.0;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1836;
    float _1840 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1838 * _1796;
    float _1848 = _1780;
    float _1850 = _1844;
    if (_1744)
    {
        float _1852 = _1774 ? _1830 : _1780;
        _1848 = _1852;
    }
    float _1854 = _1848;
    int _1856 = _1624 * int(_1804);
    int _1858 = _1856 + _1784;
    float _1860 = 1.0 / _1826;
    out.m_75.x = _1840;
    out.m_75.y = _1842;
    out.m_75.z = _1844;
    out.m_75.w = _1834;
    bool _1862 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1864 = isnan(_312);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1876 = float(uint(_1858));
    bool _1878 = _1772 > 0.5;
    bool _1880 = _1878 && _1740;
    float _1882 = -_1872;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1890 = as_type<float>(_1601) * _1876;
    float _1892 = float(uint(_1758));
    float _1894 = -_490;
    float _1896 = fma(_478, _1874, _1894);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1900 = _312 + _1898;
    float _1902 = _1888;
    if (_1740)
    {
        _1850 = _1820;
    }
    float _1904 = _1850;
    float _1906 = _1816 * _1884;
    bool _1908 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1910 = isnan(_312);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1916 = _1912 || _1914;
    float _1918 = float(_1916);
    float _1920 = fma(_1846, _1900, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1922 = -_1816;
    float _1924 = _1922 + 1.0;
    float _1926 = trunc(_1890);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    float _1932 = as_type<float>(_1601) * _1892;
    float _1934 = _1888 * _1860;
    float _1936 = _1904;
    if (_1880)
    {
        float _1938 = -_1904;
        float _1940 = _1938 + 1.0;
        _1936 = _1940;
    }
    float _1942 = _1936;
    if (!_1740)
    {
        _1902 = _1820;
    }
    float _1944 = _1902;
    float _1946 = _1918 * _1924;
    float _1948 = -_1918;
    float _1950 = _1948 + 1.0;
    bool _1952 = _742 != 0.0;
    bool _1954 = isnan(_742);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan(0.0);
    bool _1960 = _1956 || _1958;
    float _1962 = trunc(_1932);
    float _1964 = precise::max(_1962, 0.0);
    uint _1966 = uint(_1964);
    float _1968 = _1920 * _1946;
    float _1970 = _1944;
    if (_1740)
    {
        _1970 = _1942;
    }
    float _1972 = _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1976 = _312 + _1974;
    int _1978 = ~_356;
    int _1980 = _1978 + 1;
    float _1982 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1968);
    int _1984 = ~_356;
    int _1986 = _1984 + 1;
    float _1988 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1990 = int(_1804) + int(_1930);
    float _1992 = fma(_1934, _1976, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1994 = fma(_474, _1988, _412);
    bool _1996 = _740 == 0.0;
    bool _1998 = !_1960;
    bool _2000 = _1996 && _1998;
    float _2002 = fma(_1992, _1906, _1982);
    int _2004 = _1986 * _1990;
    int _2006 = _2004 + _1784;
    float _2008 = in.m_77.x;
    float _2010 = in.m_77.y;
    float _2012 = in.m_77.z;
    int _2014 = _1980 * int(_1966);
    int _2016 = _2014 + _1758;
    float _2018 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2002);
    bool _2020 = uint(_2006) >= uint(_356);
    float _2022 = _1994 + 0.5;
    bool _2024 = _744 == 0.0;
    bool _2026 = _2024 && _2000;
    float _2028 = float(uint(_2016));
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2032 = !_2020;
    int _2034 = _2032 ? 0 : (-1);
    float _2036 = as_type<float>(_1601) * _2028;
    int _2038 = ~_1990;
    int _2040 = _2038 + _2034;
    int _2042 = _2040 + 1;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2046 = _1896 + 0.5;
    float _2048 = trunc(_2036);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2056 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2058 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _2022;
    out.m_79.y = _2046;
    float _2064 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2066 = _2008;
    float _2068 = _2012;
    float _2070 = _2010;
    if (!_2026)
    {
        float _2072 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2066 = _2072;
    }
    float _2074 = _2066;
    int _2076 = _356 * _2042;
    int _2078 = _2076 + _1784;
    if (!_2026)
    {
        float _2080 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2068 = _2080;
    }
    float _2082 = _2068;
    int _2084 = ~_356;
    int _2086 = _2084 + 1;
    if (!_2026)
    {
        float _2088 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2070 = _2088;
    }
    float _2090 = _2070;
    float _2092 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2094 = !_1585;
    int _2096 = _2094 ? _2078 : (-1);
    out.m_81.x = _2056;
    out.m_81.y = _2058;
    out.m_81.z = _2062;
    out.m_81.w = _2060;
    int _2098 = int(_1966) + int(_2052);
    float _2100 = -_806;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    int _2104 = _2096 >> 31;
    float _2106 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2110 = _2096 & 3;
    bool _2112 = _2110 != 0;
    float _2114 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2116 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2114);
    int _2118 = _2086 * _2098;
    int _2120 = _2118 + _1758;
    float _2122 = -_806;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2092);
    int _2126 = _2104 & 3;
    float _2128 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2102);
    float _2130 = -_806;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    float _2134 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    int _2136 = _2096 + _2126;
    float _2138 = abs(_1130);
    float _2140 = log2(_2138);
    bool _2142 = uint(_2120) >= uint(_356);
    float _2144 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2132);
    int _2146 = _2136 >> 2;
    float _2148 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2108);
    float _2152 = _2134 * _2090;
    int _2154 = _2146 << 4;
    int _2156 = _2154 + 368;
    float _2158 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    int _2160 = _2096 & 3;
    bool _2162 = _2160 != 0;
    float _2164 = _2128 * _2090;
    uint _2166 = uint(int(uint(_2156) >> uint(2)));
    uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
    int _2170 = int(_2166) & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = int(_2166) + 1;
    uint _2176 = uint(int(uint(_2174) >> uint(2)));
    int _2178 = _2174 & 3;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[int(_2176)][_2178];
    float _2182 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2158);
    float _2184 = _2144 * _2090;
    bool _2186 = !_2142;
    int _2188 = _2186 ? 0 : (-1);
    float _2190 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2150);
    bool _2192 = uint(_2160) > 1u;
    float _2194 = fma(_2182, _2074, _2152);
    int _2196 = ~_2098;
    int _2198 = _2196 + _2188;
    int _2200 = _2198 + 1;
    int _2202 = _2156 + 8;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = _2112 ? 0 : 1;
    float _2222 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2224 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2228 = ~_2220;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    bool _2236 = uint(_2160) >= 2u;
    float _2238 = fma(_2190, _2074, _2164);
    float _2240 = exp2(_2222);
    int _2242 = _2232;
    if (!_2192)
    {
        int _2244 = ~_2220;
        int _2246 = _2244 + 1;
        _2242 = _2246;
    }
    int _2248 = _2242;
    float _2250 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    bool _2252 = _2160 != 3;
    float _2254 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2226);
    int _2256 = abs(_2248);
    float _2258 = fma(_2234, _2082, _2238);
    int _2260 = _2236 ? 0 : 1;
    float _2262 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2250);
    bool _2264 = !_2162;
    int _2266 = _2264 ? 0 : 1;
    float _2268 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2254);
    float _2270 = fma(_2262, _2074, _2184);
    int _2272 = ~_2260;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = fma(_2268, _2082, _2194);
    int _2280 = abs(_2266);
    float _2282 = -_1542;
    float _2284 = _2282 + 1.0;
    bool _2286 = _2160 != 3;
    int _2288 = _356 * _2200;
    int _2290 = _2288 + _1758;
    int _2292 = _2276;
    if (_2252)
    {
        int _2294 = ~_2260;
        int _2296 = _2294 + 1;
        _2292 = _2296;
    }
    int _2298 = _2292;
    float _2300 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2302 = ~_2256;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = _1630 * _1554;
    float _2310 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2300);
    bool _2312 = !_2286;
    int _2314 = _2312 ? 0 : (-1);
    float _2316 = fma(_2240, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    int _2320 = abs(_2298);
    float _2322 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    int _2324 = _2306 * as_type<int>(_2180);
    bool _2326 = !_1794;
    int _2328 = _2326 ? 0 : 1;
    int _2330 = ~_2280;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    bool _2336 = _1130 <= 8000.0;
    bool _2338 = isnan(_1130);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    bool _2348 = !_1585;
    int _2350 = _2348 ? _2290 : (-1);
    int _2352 = _2334 * as_type<int>(_2172);
    int _2354 = _2352 + _2324;
    int _2356 = abs(_2314);
    float _2358 = _1522 + _1472;
    float _2360 = _1575 * _2308;
    float _2362 = fma(_2322, _2082, _2270);
    int _2364 = abs(_2328);
    float _2366 = _2358 * 0.5;
    int _2368 = ~_2320;
    int _2370 = _2368 + 1;
    int _2372 = _2370 + 1;
    float _2374 = fma(_2318, -2.0, 3.0);
    float _2376 = _2318 * _2318;
    int _2378 = _2372 * as_type<int>(_2210);
    int _2380 = _2378 + _2354;
    int _2382 = ~_2356;
    int _2384 = _2382 + 1;
    int _2386 = _2384 + 1;
    float _2388 = _2376 * _2374;
    float _2390 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2392 = ~_2364;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = fma(_1565, _2360, _1563);
    int _2400 = _2386 * as_type<int>(_2218);
    int _2402 = _2400 + _2380;
    float _2404 = -_2388;
    float _2406 = _2404 + 1.0;
    float _2408 = in.m_83.x;
    float _2410 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2412 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2388);
    int _2414 = _2402 * _2396;
    float _2416 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2410);
    float _2418 = _1472 * 0.5;
    float _2420 = _2346 * _2412;
    int _2422 = _2350 * _2364;
    int _2424 = _2422 + _2414;
    float _2426 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2416);
    float _2428 = fma(_1524, -0.5, _2418);
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2432 = _2426 + _1472;
    out.gl_Position.x = _1522;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _2426;
    out.gl_Position.w = _1472;
    float _2434 = _2284 * _2430;
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = float(_2424);
    float _2440 = _2432 * 0.5;
    out.m_85.x = _2278;
    out.m_85.y = _2258;
    out.m_85.z = _2362;
    float _2442 = -_2436;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2446 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2448 = isnan(_1278);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2454 = _2450 || _2452;
    out.m_87.x = _2366;
    out.m_87.y = _2428;
    out.m_87.z = _2440;
    out.m_87.w = _1472;
    float _2456 = _2444 * _2408;
    out.m_89.x = _2438;
    float _2458 = _1565 * _2308;
    float _2460 = -_1630;
    float _2462 = _2460 + 1.0;
    float _2464 = _2456 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2466 = fma(_1571, _2458, _1559);
    float _2468 = fma(_1573, _2458, _1561);
    float _2470 = _1565 * _2462;
    out.m_91.x = _2464;
    float _2472 = _1182 * _1238;
    float _2474 = _2408;
    float _2476 = _2418;
    float _2478 = _2426;
    float _2480 = _2458;
    float _2482 = _2472;
    if (!_2454)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2474;
    out.m_93.x = _2466;
    out.m_93.y = _2468;
    out.m_93.z = _2398;
    out.m_93.w = _2470;
    float _2486 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2488 = _2484;
    float _2490 = _2484;
    if (!_2454)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2492 = _2476;
    float _2494 = _2492;
    float _2496 = _2492;
    if (!_2454)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _1768;
    float _2500 = _2498;
    float _2502 = _2498;
    if (!_2454)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2504 = _2478;
    float _2506 = _2504;
    float _2508 = _2504;
    if (!_2454)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2510 = _2480;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2454)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2516 = _2482;
    bool _2518 = !_2454;
    float _2520 = _2516;
    float _2522 = _2516;
    if (!_2518)
    {
        bool _2524 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2526 = isnan(_1278);
        bool _2528 = _2524 || _2526;
        bool _2530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2532 = _2528 || _2530;
        if (!_2532)
        {
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = _1278 + _2534;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2538;
            float _2542 = 1.0 / _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2564 = _2536 * _2542;
            float _2566 = precise::clamp(_2564, 0.0, 1.0);
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2572 = fma(_2566, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2574 = fma(_2566, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2566, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2578 = fma(_2566, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2580 = fma(_2566, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2582 = fma(_2566, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2496 = _2574;
            _2514 = _2580;
            _2490 = _2572;
            _2508 = _2578;
            _2502 = _2576;
            _2522 = _2582;
            _2584 = true;
        }
        else
        {
            bool _2586 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2588 = isnan(_1278);
            bool _2590 = _2586 || _2588;
            bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2594 = _2590 || _2592;
            if (!_2594)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2596 = _2488;
            _2490 = _2596;
            if (!_2594)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2598 = _2494;
            _2496 = _2598;
            if (!_2594)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2600 = _2500;
            _2502 = _2600;
            if (!_2594)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2602 = _2506;
            _2508 = _2602;
            if (!_2594)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2604 = _2512;
            _2514 = _2604;
            if (!_2594)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2606 = _2520;
            bool _2608 = !_2594;
            _2522 = _2606;
            if (!_2608)
            {
                bool _2610 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2612 = isnan(_1278);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2618 = _2614 || _2616;
                if (!_2618)
                {
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = _1278 + _2620;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2624;
                    float _2628 = 1.0 / _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2650 = _2622 * _2628;
                    float _2652 = precise::clamp(_2650, 0.0, 1.0);
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2658 = fma(_2652, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2496 = _2660;
                    _2514 = _2666;
                    _2490 = _2658;
                    _2508 = _2664;
                    _2502 = _2662;
                    _2522 = _2668;
                    _2584 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2584 = false;
    float _2670 = _2496;
    float _2672 = _2514;
    float _2674 = _2490;
    float _2676 = _2508;
    float _2678 = _2502;
    float _2680 = _2522;
    float _2682 = _2486 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_2258, -0.5, 0.5);
    float _2686 = precise::clamp(_2684, 0.0, 1.0);
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = -_2674;
    float _2694 = _2692 + _2676;
    out.m_53.x = _2682;
    float _2696 = fma(_2686, _2690, _2670);
    float _2698 = -_2678;
    float _2700 = _2698 + _2680;
    float _2702 = fma(_2686, _2694, _2674);
    float _2704 = _2696 * 0.586610972881317138671875;
    bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = fma(_2686, _2700, _2678);
    out.m_95.x = 0.0;
    float _2710 = fma(_2702, 0.298911988735198974609375, _2704);
    bool _2712 = _1182 > 0.0;
    bool _2714 = isnan(_1182);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan(0.0);
    bool _2720 = _2716 || _2718;
    float _2722 = fma(_2708, 0.114477999508380889892578125, _2710);
    bool _2724 = _1238 <= 0.0;
    bool _2726 = !_2720;
    bool _2728 = _2724 || _2726;
    float _2730 = -_2722;
    float _2732 = _2702 + _2730;
    float _2734 = -_2722;
    float _2736 = _2696 + _2734;
    float _2738 = -_2722;
    float _2740 = _2708 + _2738;
    float _2742 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2744 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2746 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    bool _2748 = !_2706;
    if (!_2748)
    {
        float _2750 = -_1112;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2754 = -_1114;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2758 = -_1116;
        float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2762 = _2752 * _2752;
        float _2764 = fma(_2756, _2756, _2762);
        float _2766 = fma(_2760, _2760, _2764);
        float _2768 = sqrt(_2766);
        float _2770 = rsqrt(_2766);
        float _2772 = -_2768;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2776 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = _2756 * _2770;
        float _2782 = _2752 * _2770;
        float _2784 = abs(_2778);
        float _2786 = log2(_2784);
        float _2788 = _2760 * _2770;
        float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2792 = _2258 * _2782;
        float _2794 = -_2782;
        float _2796 = -_2790;
        float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2796);
        float _2800 = fma(_2278, _2780, _2792);
        float _2802 = -_2788;
        float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2798);
        float _2806 = fma(_2362, _2788, _2800);
        float _2808 = precise::clamp(_2806, 0.0, 1.0);
        float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2812 = _2804 + _2810;
        float _2814 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2818 = precise::clamp(_2816, 0.0, 1.0);
        float _2820 = exp2(_2814);
        float _2822 = _2820 * _2818;
        float _2824 = _2808 * _2822;
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2826;
        out.m_95.y = _2828;
        out.m_95.z = _2830;
    }
    out.m_65.x = _2742;
    out.m_65.y = _2744;
    out.m_65.z = _2746;
    if (!_2728)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2832;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2584 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_138);
        out.gl_Position.z = _2901;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2956 = as_type<float>(_164);
        out.gl_Position.z = _2956;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = 1.0 / _152;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _120 * _166;
    bool _172 = !_168;
    float _174 = _170;
    float _192;
    if (!_172)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _170;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = 1.0 / _216;
    bool _220 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -_212;
    float _234 = _232 + 1.0;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _230 * _234;
    float _252 = -_230;
    float _254 = _252 + 1.0;
    float _256 = _200 * _218;
    float _258 = in.m_57.x;
    float _260 = in.m_57.y;
    float _262 = in.m_57.z;
    float _264 = fma(_238, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_248, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = fma(_242, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _264 * _250;
    float _272 = _266 * _250;
    float _274 = _268 * _250;
    float _276 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _278 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _272);
    float _280 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _278);
    float _286 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _280);
    float _288 = _282 * _258;
    float _290 = _284 * _260;
    float _292 = _286 * _262;
    bool _294 = !_244;
    if (!_294)
    {
        float _296 = in.m_55.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _174 = _310;
    }
    float _312 = _174;
    float _314 = in.m_55.x;
    float _316 = in.m_55.y;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    float _322 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _324 = in.m_46.x;
    float _326 = in.m_46.y;
    float _328 = in.m_46.z;
    float _330 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _332 = in.m_55.z;
    float _334 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _336 = int(_334);
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _342 = isnan(0.0);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _348 = _344 || _346;
    float _350 = _320 * _120;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _354 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _356 = int(_354);
    float _358 = _314 * 2.0;
    float _360 = _314 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _362 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _364 = exp2(_350);
    float _366 = _326 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _368 = -_352;
    float _370 = fma(_360, 2.0, _368);
    float _372 = fma(_362, -2.0, _338);
    float _374 = _326 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _326 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _316 + _314;
    float _380 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].x, _366);
    float _382 = floor(_358);
    float _384 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _388 = _316 * 2.0;
    float _390 = _378 + (-1.0);
    float _392 = _316 + _332;
    float _394 = _332 * 2.0;
    float _396 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _398 = _392 + (-1.0);
    float _400 = float(_336);
    float _402 = floor(_388);
    float _404 = -_364;
    float _406 = _404 + 1.0;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _410 = -_120;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[76].x, _370);
    bool _414 = _382 > 0.0;
    bool _416 = _382 >= 0.0;
    bool _418 = isnan(_382);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = floor(_394);
    float _428 = float(_356);
    bool _430 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(1.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _442 = 1.0 + _440;
    float _444 = _348 ? _406 : 0.0;
    float _446 = 1.0 / _400;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _452 = _402 > 0.0;
    float _454 = _428 * _120;
    float _456 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _458 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].w, _450);
    int _460 = _424 ? 0 : 1;
    float _462 = 1.0 / _442;
    bool _464 = _402 >= 0.0;
    bool _466 = isnan(_402);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _456);
    bool _476 = _426 > 0.0;
    float _478 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _458);
    bool _480 = _426 >= 0.0;
    bool _482 = isnan(_426);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _372);
    int _492 = ~_460;
    int _494 = _492 + 1;
    int _496 = _494 + 1;
    float _498 = _446 * _120;
    int _500 = _496;
    if (!_414)
    {
        int _502 = ~_460;
        int _504 = _502 + 1;
        _500 = _504;
    }
    int _506 = _500;
    float _508 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    int _510 = _472 ? 0 : 1;
    float _512 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _514 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[6].z, _386);
    float _516 = _508 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _518 = ~_510;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    int _524 = _522;
    if (_438)
    {
        float _526 = _444 * _462;
        _130 = _526;
    }
    float _528 = _130;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _540 = _538 != 0;
    float _542 = _512 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_452)
    {
        int _544 = ~_510;
        int _546 = _544 + 1;
        _524 = _546;
    }
    int _548 = _524;
    float _550 = _514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    bool _558 = !_536;
    int _560 = _558 ? 0 : 1;
    bool _562 = !_532;
    int _564 = _562 ? 0 : 1;
    bool _566 = !_540;
    int _568 = _566 ? 0 : 1;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _580 = _578 != 0;
    int _582 = _488 ? 0 : 1;
    float _584 = float(_506);
    bool _586 = !_572;
    int _588 = _586 ? 0 : 1;
    bool _590 = !_576;
    int _592 = _590 ? 0 : 1;
    int _594 = abs(_588);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _516 + _596;
    int _600 = abs(_592);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _542 + _602;
    int _606 = ~_582;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _598 * _598;
    float _614 = float(_600);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _550 + _616;
    int _620 = _610;
    if (!_476)
    {
        int _622 = ~_582;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = fma(_604, _604, _612);
    float _630 = _614 * _584;
    float _632 = float(_594);
    float _634 = fma(_618, _618, _628);
    float _636 = float(_626);
    float _638 = _630 * (-2.0);
    bool _640 = !_580;
    int _642 = _640 ? 0 : 1;
    float _644 = sqrt(_634);
    float _646 = _316 + (-0.5);
    float _648 = fma(_638, _554, _554);
    int _650 = abs(_642);
    float _652 = _632 * _636;
    float _654 = fma(_408, _638, _408);
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _648);
    float _658 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = rsqrt(_634);
    float _662 = _332 + _314;
    float _664 = float(_548);
    float _666 = _658 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _668 = float(_650);
    float _670 = _652 * (-2.0);
    float _672 = _644 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _674 = _662 + (-1.0);
    float _676 = _668 * _664;
    float _678 = _314 + (-0.5);
    float _680 = fma(_670, _552, _552);
    float _682 = precise::min(_666, _672);
    float _684 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _686 = _676 * (-2.0);
    float _688 = fma(_396, _670, _396);
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _692 = _660 * _682;
    float _694 = fma(_684, _686, _684);
    float _696 = fma(_686, _556, _556);
    float _698 = _332 + (-0.5);
    float _700 = fma(_688, _528, _690);
    float _702 = _598 * _692;
    float _704 = _604 * _692;
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[196].z, _696);
    float _708 = fma(_654, _528, _656);
    float _710 = -_702;
    float _712 = _598 + _710;
    float _714 = -_704;
    float _716 = _604 + _714;
    float _718 = fma(_694, _528, _706);
    float _720 = _618 * _692;
    float _722 = _712 * _712;
    float _724 = _708 * 0.15915493667125701904296875;
    float _726 = _700 * 0.15915493667125701904296875;
    float _728 = -_720;
    float _730 = _618 + _728;
    float _732 = fma(_716, _716, _722);
    float _734 = _724 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = fma(_730, _730, _732);
    float _740 = in.m_61.x;
    float _742 = in.m_61.y;
    float _744 = in.m_61.z;
    bool _746 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _748 = isnan(0.5);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _754 = _750 || _752;
    float _756 = _724 * 6.283185482025146484375;
    float _758 = cos(_756);
    bool _760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _762 = isnan(0.5);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _768 = _764 || _766;
    float _770 = sqrt(_738);
    float _772 = _718 * 0.15915493667125701904296875;
    float _774 = _726 * 6.283185482025146484375;
    float _776 = sin(_774);
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _742);
    float _780 = _726 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _660 * _770;
    float _786 = _322 * _784;
    float _788 = _658 * _784;
    float _790 = _330 * _784;
    float _792 = _772 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = _776 * _736;
    float _798 = _776 * _758;
    float _800 = _786 * _778;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _744);
    float _804 = _772 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = _782 * _758;
    float _810 = _782 * _736;
    float _812 = _790 * _802;
    float _814 = -_702;
    float _816 = _516 + _814;
    float _818 = _776 * _794;
    float _820 = _758 * _794;
    float _822 = _782 * _794;
    float _824 = _736 * _794;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _740);
    float _828 = _818 * _800;
    float _830 = _816 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = _788 * _826;
    float _834 = fma(_806, _808, _796);
    float _836 = _822 * _800;
    float _838 = -_810;
    float _840 = fma(_806, _798, _838);
    float _842 = -_798;
    float _844 = fma(_806, _810, _842);
    float _846 = -_800;
    float _848 = _806 * _846;
    float _850 = fma(_834, _832, _836);
    float _852 = fma(_806, _796, _808);
    float _854 = fma(_840, _832, _828);
    float _856 = fma(_820, _832, _848);
    float _858 = fma(_844, _812, _850);
    float _860 = -_704;
    float _862 = _542 + _860;
    float _864 = -_720;
    float _866 = _550 + _864;
    float _868 = fma(_824, _812, _856);
    float _870 = _858 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _872 = _858 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _874 = fma(_852, _812, _854);
    float _876 = _816 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _878 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _870);
    float _880 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _872);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _876);
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _878);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _880);
    float _890 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[10].z, _882);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[11].z, _884);
    float _894 = _886 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _896 = _888 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _898 = _890 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _900 = _892 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _902 = _550 + _894;
    float _904 = _542 + _896;
    float _906 = _858 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _908 = 1.0 / _900;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _902 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _904 + _914;
    float _918 = _898 + _900;
    float _920 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _906);
    float _922 = _912 * _912;
    float _924 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _920);
    float _926 = fma(_916, _916, _922);
    float _928 = _924 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _930 = sqrt(_926);
    float _932 = _918 * _908;
    float _934 = _932 * 0.5;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _938 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _936);
    float _940 = _516 + _928;
    float _942 = 1.0 / _938;
    bool _944 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _946 = _924;
    float _948 = _928;
    float _950 = _868;
    float _952 = _938;
    float _954 = _930;
    float _956 = _720;
    float _958 = _702;
    float _960 = _908;
    float _962 = _904;
    if (!_944)
    {
        _946 = _904;
    }
    float _964 = _946;
    float _966 = _964;
    if (!_944)
    {
        _948 = _902;
    }
    float _968 = _948;
    float _970 = _968;
    if (!_944)
    {
        _950 = _940;
    }
    float _972 = _950;
    bool _974 = !_944;
    float _976 = _972;
    if (!_974)
    {
        float _978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _982 = _930 + _980;
        float _984 = rsqrt(_926);
        float _986 = _982 * _978;
        float _988 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _990 = _986 * 0.15915493667125701904296875;
        float _992 = _990 * 6.283185482025146484375;
        float _994 = cos(_992);
        float _996 = _990 * 6.283185482025146484375;
        float _998 = sin(_996);
        float _1000 = _994 + (-1.0);
        float _1002 = fma(_998, _988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1004 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = _984 * _1002;
        float _1008 = fma(_940, _994, _1004);
        float _1010 = fma(_916, _1006, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1012 = fma(_912, _1006, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _1010;
        _970 = _1012;
        _976 = _1008;
        _952 = _990;
        _954 = _1000;
    }
    float _1014 = _966;
    float _1016 = _970;
    float _1018 = _976;
    float _1020 = _952;
    float _1022 = _954;
    float _1024 = -_704;
    float _1026 = _1024 + _1014;
    float _1028 = -_720;
    float _1030 = _1028 + _1016;
    float _1032 = -_702;
    float _1034 = _1032 + _1018;
    float _1036 = _1026;
    float _1038 = _1014;
    float _1040 = _1034;
    float _1042 = _1018;
    float _1044 = _1022;
    float _1046 = _1020;
    if (_768)
    {
        _956 = 1.0;
    }
    float _1048 = _956;
    float _1050 = _1048;
    if (_754)
    {
        _958 = _1026;
    }
    float _1052 = _958;
    float _1054 = _1052;
    if (_754)
    {
        _1036 = _1030;
    }
    float _1056 = _1036;
    float _1058 = _1056;
    if (!_754)
    {
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1062 = _816 + _1060;
        float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1066 = _862 + _1064;
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1070 = -_542;
        float _1072 = _1070 + _1014;
        float _1074 = _1062 * _1062;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1078 = _866 + _1076;
        float _1080 = -_516;
        float _1082 = _1080 + _1018;
        float _1084 = -_550;
        float _1086 = _1084 + _1016;
        float _1088 = fma(_1066, _1066, _1074);
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1092 = fma(_1078, _1078, _1088);
        float _1094 = sqrt(_1092);
        float _1096 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1098 = precise::min(_1094, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1100 = _1098 * _1090;
        float _1102 = _1096 * _1100;
        float _1104 = fma(_1072, _1102, _862);
        float _1106 = fma(_1082, _1102, _816);
        float _1108 = fma(_1086, _1102, _866);
        _1038 = _1072;
        _1040 = _1106;
        _1054 = _1104;
        _1058 = _1108;
        _1042 = _1082;
        _1044 = _1090;
    }
    float _1110 = _1038;
    float _1112 = _1040;
    float _1114 = _1054;
    float _1116 = _1058;
    float _1118 = _1042;
    float _1120 = _1044;
    float _1122 = _1110;
    float _1124 = _1120;
    if (_768)
    {
        _960 = 1.0;
    }
    float _1126 = _960;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1130 = _942 * _1128;
    float _1132 = _1126;
    if (!_768)
    {
        float _1134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1140 = _1136 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1138 * 0.15915493667125701904296875;
        float _1146 = _1136 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = 1.0 / _1142;
        float _1152 = _1144 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1148 * _1150;
        float _1158 = _1144 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1154 * _1156;
        float _1164 = 1.0 / _1162;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1166;
        float _1170 = 1.0 / _1168;
        float _1172 = _1160 * _1164;
        float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1176 = fma(_1130, _1172, _1174);
        float _1178 = _1176 * _1170;
        float _1180 = precise::clamp(_1178, 0.0, 1.0);
        _1050 = _1180;
    }
    float _1182 = _1050;
    if (!_768)
    {
        float _1184 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1190 = _1186 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = _1188 * 0.15915493667125701904296875;
        float _1196 = _1186 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = 1.0 / _1192;
        float _1202 = _1194 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1198 * _1200;
        float _1208 = _1194 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = _1204 * _1206;
        float _1214 = 1.0 / _1212;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1218 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1216;
        float _1220 = 1.0 / _1218;
        float _1222 = _1210 * _1214;
        float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1226 = fma(_1130, _1222, _1224);
        float _1228 = _1226 * _1220;
        float _1230 = precise::clamp(_1228, 0.0, 1.0);
        float _1232 = -_1230;
        float _1234 = _1232 + 1.0;
        _1122 = _1214;
        _1132 = _1234;
    }
    float _1236 = _1122;
    float _1238 = _1132;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1242 = _1112 + _1240;
    float _1244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1246 = _1114 + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1250 = _1116 + _1248;
    float _1252 = _1242 * _1242;
    float _1254 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1258 = fma(_1246, _1246, _1252);
    float _1260 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1262 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1256);
    float _1264 = fma(_1250, _1250, _1258);
    float _1266 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1260);
    float _1268 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1262);
    float _1270 = rsqrt(_1264);
    float _1272 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1276 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = sqrt(_1264);
    float _1280 = _1270 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1282 = _1246 * _1280;
    float _1284 = _1250 * _1280;
    float _1286 = _1282 * _1282;
    float _1288 = _1284 * _1284;
    float _1290 = _1286 + _1288;
    float _1292 = sqrt(_1290);
    bool _1294 = _1292 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1298 = _1292 + _1296;
    float _1300 = _1118;
    float _1302 = _1290;
    float _1304 = _1298;
    float _1306 = _1282;
    float _1308 = _1284;
    float _1310 = _1286;
    float _1312 = _1288;
    if (_1294)
    {
        float _1314 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1314;
    }
    float _1316 = _1300;
    if (_1294)
    {
        float _1318 = rsqrt(_1290);
        _1302 = _1318;
    }
    float _1320 = _1302;
    if (_1294)
    {
        float _1322 = _1298 * _1316;
        _1304 = _1322;
    }
    float _1324 = _1304;
    if (_1294)
    {
        float _1326 = _1324 * 0.15915493667125701904296875;
        _962 = _1326;
    }
    float _1328 = _962;
    float _1330 = _1316;
    if (_1294)
    {
        float _1332 = _1328 * 6.283185482025146484375;
        float _1334 = sin(_1332);
        _1330 = _1334;
    }
    float _1336 = _1330;
    float _1338 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1340 = precise::max(0.0, _1338);
    float _1342 = _1236;
    if (_1294)
    {
        float _1344 = _1328 * 6.283185482025146484375;
        float _1346 = cos(_1344);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = -_1280;
    float _1352 = -_1340;
    float _1354 = fma(_1242, _1350, _1352);
    if (_1294)
    {
        float _1356 = _1354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1356;
    }
    float _1358 = _1046;
    float _1360 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1362 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1364 = _1358;
    float _1366 = _1336;
    if (_1294)
    {
        float _1368 = fma(_1336, _1358, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = _1370;
    if (!_1294)
    {
        _1366 = _1354;
    }
    float _1374 = _1366;
    float _1376 = floor(_1362);
    float _1378 = _1374;
    if (_1294)
    {
        float _1380 = _1348 + (-1.0);
        _1124 = _1380;
    }
    float _1382 = _1124;
    float _1384 = _1382;
    if (_1294)
    {
        float _1386 = _1320 * _1370;
        _1372 = _1386;
    }
    float _1388 = _1372;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1392 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1390);
    float _1394 = precise::clamp(_1392, 0.0, 1.0);
    if (_1294)
    {
        float _1396 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1396;
    }
    float _1398 = _1384;
    if (_1294)
    {
        float _1400 = _1282 * _1388;
        _1306 = _1400;
    }
    float _1402 = _1306;
    if (_1294)
    {
        float _1404 = _1284 * _1388;
        _1308 = _1404;
    }
    float _1406 = _1308;
    if (_1294)
    {
        float _1408 = fma(_1354, _1348, _1398);
        _1378 = _1408;
    }
    float _1410 = _1378;
    if (_1294)
    {
        float _1412 = _1402 * _1402;
        _1310 = _1412;
    }
    float _1414 = _1310;
    if (_1294)
    {
        float _1416 = _1406 * _1406;
        _1312 = _1416;
    }
    float _1418 = _1312;
    float _1420 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1360);
    float _1422 = -_1394;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1410, _1410, _1414);
    float _1428 = fma(_866, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1430 = _1112 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1432 = _1426 + _1418;
    float _1434 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1436 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1430);
    float _1438 = abs(_1424);
    float _1440 = log2(_1438);
    float _1442 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1444 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1446 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1436);
    float _1448 = -_1276;
    float _1450 = fma(_1448, _1442, 1.0);
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1454 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1456 = rsqrt(_1432);
    float _1458 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1460 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1458);
    float _1462 = floor(_1428);
    float _1464 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1460);
    float _1466 = _1456 * _1402;
    float _1468 = _1456 * _1410;
    float _1470 = _1456 * _1406;
    float _1472 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1464);
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1476 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = log2(_1450);
    float _1480 = _1468 + 1.0;
    float _1482 = -_1474;
    float _1484 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = -_1462;
    float _1488 = _1428 + _1486;
    float _1490 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1452);
    float _1492 = -_1470;
    float _1494 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1496 = -_1376;
    float _1498 = _1362 + _1496;
    float _1500 = 1.0 / _1472;
    float _1502 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1504 = fma(_1494, -0.5, 0.5);
    float _1506 = fma(_1494, 0.5, 0.5);
    float _1508 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1490);
    float _1510 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1502);
    float _1512 = fma(_1506, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1514 = exp2(_1476);
    float _1516 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1518 = _1478 * 0.693147182464599609375;
    float _1520 = fma(_1506, _1512, -0.212114393711090087890625);
    float _1522 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1516);
    float _1524 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1508);
    float _1526 = fma(_1506, _1520, 1.570728778839111328125);
    float _1528 = sqrt(_1504);
    float _1530 = _1522 * _1500;
    float _1532 = _1524 * _1500;
    float _1534 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1536 = fma(_1532, -0.5, 0.5);
    float _1538 = -_1468;
    float _1540 = fma(_1514, _1480, _1538);
    float2 _5069 = float2(_1498, _1488);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5069, float2(0.0), isnan(_5069)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5069, float2(0.0), isnan(_5069)), level(0.0)).x;
    float _1544 = fma(_1540, 0.5, 0.5);
    float _1546 = _1528 * 0.636619746685028076171875;
    float _1548 = fma(_1530, 0.5, 0.5);
    float _1550 = -_1526;
    float _1552 = fma(_1546, _1550, 1.0);
    float3 _5092 = float3(_1548, _1536, _1534);
    float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5092, float3(0.0), isnan(_5092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5092, float3(0.0), isnan(_5092)), level(0.0)).x;
    float3 _5103 = float3(_1548, _1536, _1534);
    float4 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5103, float3(0.0), isnan(_5103)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5103, float3(0.0), isnan(_5103)), level(0.0)).xyzw;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = _1557.w;
    float2 _5119 = float2(_1552, _1544);
    float3 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5119, float2(0.0), isnan(_5119)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5119, float2(0.0), isnan(_5119)), level(0.0)).xyz;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = float(uint(_356));
    float _1579 = trunc(_498);
    int _1581 = int(_1579);
    float _1583 = _454 * _166;
    bool _1585 = _356 == 0;
    out.m_63.x = _862;
    out.m_63.y = _816;
    out.m_63.z = _866;
    int _1587 = abs(_564);
    float _1589 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1591 = abs(_568);
    out.m_65.w = _682;
    float _1593 = 1.0 / _1577;
    out.m_67.x = _788;
    out.m_69.x = _1114;
    out.m_69.y = _1112;
    out.m_69.z = _1116;
    float _1595 = float(uint(_1581));
    float _1597 = trunc(_1583);
    int _1599 = int(_1597);
    int _1601 = as_type<int>(_1593) + (-2);
    float _1603 = exp2(_1589);
    float _1605 = as_type<float>(_1601) * _1595;
    int _1607 = ~_356;
    int _1609 = _1607 + 1;
    int _1611 = ~_356;
    int _1613 = _1611 + 1;
    float _1615 = trunc(_1605);
    float _1617 = precise::max(_1615, 0.0);
    uint _1620 = uint(_1617);
    int _1622 = ~_356;
    int _1624 = _1622 + 1;
    float _1626 = -_1603;
    float _1628 = _1626 + 1.0;
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1632 = _1609 * int(_1620);
    int _1634 = _1632 + _1581;
    float _1636 = float(uint(_1634));
    float _1638 = as_type<float>(_1601) * _1636;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1642 = _1640 != 0;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    bool _1650 = !_1642;
    float _1652 = _1650 ? 7.345489978790283203125 : 1.0;
    float _1654 = _1652 * _314;
    float _1656 = float(_1581);
    float _1658 = floor(_1654);
    bool _1660 = _1656 >= _428;
    bool _1662 = isnan(_1656);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_428);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    int _1672 = int(_1620) + int(_1648);
    float _1674 = trunc(_1670);
    int _1676 = int(_1674);
    int _1678 = _1613 * _1672;
    int _1680 = _1678 + _1581;
    bool _1682 = uint(_1680) >= uint(_356);
    float _1684 = -_1658;
    float _1686 = _1654 + _1684;
    bool _1688 = !_1682;
    int _1690 = _1688 ? 0 : (-1);
    float _1692 = _1686 * _428;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1696 = _1694 != 0;
    int _1698 = ~_1672;
    int _1700 = _1698 + _1690;
    int _1702 = _1700 + 1;
    bool _1704 = !_1696;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = trunc(_1692);
    int _1710 = int(_1708);
    int _1712 = _356 + (-1);
    int _1714 = _356 * _1702;
    int _1716 = _1714 + _1581;
    int _1718 = ~_1676;
    int _1720 = _1718 + 1;
    int _1722 = _1720 + 1;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1726 = _1724 != 0;
    bool _1728 = !_1585;
    int _1730 = _1728 ? _1716 : (-1);
    int _1732 = abs(_1706);
    int _1734 = abs(_560);
    int _1736 = _1730 * _1722;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1744 = _1742 != 0;
    int _1746 = _1676 * _1712;
    int _1748 = _1746 + _1736;
    bool _1750 = !_1726;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _1748 * _1734;
    int _1756 = _1710 * _1732;
    int _1758 = _1756 + _1581;
    int _1760 = abs(_1752);
    int _1762 = _1599 * _1587;
    int _1764 = _1762 + _1754;
    float _1766 = as_type<float>(_1587);
    float _1768 = _1472;
    if (_1740)
    {
        float _1770 = in.m_55.x;
        _1766 = _1770;
    }
    float _1772 = _1766;
    bool _1774 = _316 > 0.5;
    int _1776 = _1758 * _1591;
    int _1778 = _1776 + _1764;
    float _1780 = in.m_71.y;
    int _1782 = _1710 * _1760;
    int _1784 = _1782 + _1778;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1790 = float(uint(_1784));
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1794 = _1792 != 0;
    float _1796 = 1.0 / _1788;
    float _1798 = as_type<float>(_1601) * _1790;
    float _1800 = trunc(_1798);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    bool _1806 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1808 = isnan(_312);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1820 = in.m_71.x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1826 = _1824 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1828 = -_1780;
    float _1830 = _1828 + 1.0;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1836;
    float _1840 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1838 * _1796;
    float _1848 = _1780;
    float _1850 = _1844;
    if (_1744)
    {
        float _1852 = _1774 ? _1830 : _1780;
        _1848 = _1852;
    }
    float _1854 = _1848;
    int _1856 = _1624 * int(_1804);
    int _1858 = _1856 + _1784;
    float _1860 = 1.0 / _1826;
    out.m_75.x = _1840;
    out.m_75.y = _1842;
    out.m_75.z = _1844;
    out.m_75.w = _1834;
    bool _1862 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1864 = isnan(_312);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1876 = float(uint(_1858));
    bool _1878 = _1772 > 0.5;
    bool _1880 = _1878 && _1740;
    float _1882 = -_1872;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1890 = as_type<float>(_1601) * _1876;
    float _1892 = float(uint(_1758));
    float _1894 = -_490;
    float _1896 = fma(_478, _1874, _1894);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1900 = _312 + _1898;
    float _1902 = _1888;
    if (_1740)
    {
        _1850 = _1820;
    }
    float _1904 = _1850;
    float _1906 = _1816 * _1884;
    bool _1908 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1910 = isnan(_312);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1916 = _1912 || _1914;
    float _1918 = float(_1916);
    float _1920 = fma(_1846, _1900, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1922 = -_1816;
    float _1924 = _1922 + 1.0;
    float _1926 = trunc(_1890);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    float _1932 = as_type<float>(_1601) * _1892;
    float _1934 = _1888 * _1860;
    float _1936 = _1904;
    if (_1880)
    {
        float _1938 = -_1904;
        float _1940 = _1938 + 1.0;
        _1936 = _1940;
    }
    float _1942 = _1936;
    if (!_1740)
    {
        _1902 = _1820;
    }
    float _1944 = _1902;
    float _1946 = _1918 * _1924;
    float _1948 = -_1918;
    float _1950 = _1948 + 1.0;
    bool _1952 = _742 != 0.0;
    bool _1954 = isnan(_742);
    bool _1956 = _1952 || _1954;
    bool _1958 = isnan(0.0);
    bool _1960 = _1956 || _1958;
    float _1962 = trunc(_1932);
    float _1964 = precise::max(_1962, 0.0);
    uint _1966 = uint(_1964);
    float _1968 = _1920 * _1946;
    float _1970 = _1944;
    if (_1740)
    {
        _1970 = _1942;
    }
    float _1972 = _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1976 = _312 + _1974;
    int _1978 = ~_356;
    int _1980 = _1978 + 1;
    float _1982 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1968);
    int _1984 = ~_356;
    int _1986 = _1984 + 1;
    float _1988 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1990 = int(_1804) + int(_1930);
    float _1992 = fma(_1934, _1976, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1994 = fma(_474, _1988, _412);
    bool _1996 = _740 == 0.0;
    bool _1998 = !_1960;
    bool _2000 = _1996 && _1998;
    float _2002 = fma(_1992, _1906, _1982);
    int _2004 = _1986 * _1990;
    int _2006 = _2004 + _1784;
    float _2008 = in.m_77.x;
    float _2010 = in.m_77.y;
    float _2012 = in.m_77.z;
    int _2014 = _1980 * int(_1966);
    int _2016 = _2014 + _1758;
    float _2018 = fma(_1872, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2002);
    bool _2020 = uint(_2006) >= uint(_356);
    float _2022 = _1994 + 0.5;
    bool _2024 = _744 == 0.0;
    bool _2026 = _2024 && _2000;
    float _2028 = float(uint(_2016));
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2032 = !_2020;
    int _2034 = _2032 ? 0 : (-1);
    float _2036 = as_type<float>(_1601) * _2028;
    int _2038 = ~_1990;
    int _2040 = _2038 + _2034;
    int _2042 = _2040 + 1;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2046 = _1896 + 0.5;
    float _2048 = trunc(_2036);
    float _2050 = precise::max(_2048, 0.0);
    uint _2052 = uint(_2050);
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2056 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2058 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2060 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _2022;
    out.m_79.y = _2046;
    float _2064 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2066 = _2008;
    float _2068 = _2012;
    float _2070 = _2010;
    if (!_2026)
    {
        float _2072 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2066 = _2072;
    }
    float _2074 = _2066;
    int _2076 = _356 * _2042;
    int _2078 = _2076 + _1784;
    if (!_2026)
    {
        float _2080 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2012);
        _2068 = _2080;
    }
    float _2082 = _2068;
    int _2084 = ~_356;
    int _2086 = _2084 + 1;
    if (!_2026)
    {
        float _2088 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2010);
        _2070 = _2088;
    }
    float _2090 = _2070;
    float _2092 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2094 = !_1585;
    int _2096 = _2094 ? _2078 : (-1);
    out.m_81.x = _2056;
    out.m_81.y = _2058;
    out.m_81.z = _2062;
    out.m_81.w = _2060;
    int _2098 = int(_1966) + int(_2052);
    float _2100 = -_806;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    int _2104 = _2096 >> 31;
    float _2106 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = _834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2110 = _2096 & 3;
    bool _2112 = _2110 != 0;
    float _2114 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2116 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2114);
    int _2118 = _2086 * _2098;
    int _2120 = _2118 + _1758;
    float _2122 = -_806;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2092);
    int _2126 = _2104 & 3;
    float _2128 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2102);
    float _2130 = -_806;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    float _2134 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    int _2136 = _2096 + _2126;
    float _2138 = abs(_1130);
    float _2140 = log2(_2138);
    bool _2142 = uint(_2120) >= uint(_356);
    float _2144 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2132);
    int _2146 = _2136 >> 2;
    float _2148 = _834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2108);
    float _2152 = _2134 * _2090;
    int _2154 = _2146 << 4;
    int _2156 = _2154 + 368;
    float _2158 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    int _2160 = _2096 & 3;
    bool _2162 = _2160 != 0;
    float _2164 = _2128 * _2090;
    uint _2166 = uint(int(uint(_2156) >> uint(2)));
    uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
    int _2170 = int(_2166) & 3;
    float _2172 = (*spvDescriptorSet0.vp_c9)._m0[int(_2168)][_2170];
    int _2174 = int(_2166) + 1;
    uint _2176 = uint(int(uint(_2174) >> uint(2)));
    int _2178 = _2174 & 3;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[int(_2176)][_2178];
    float _2182 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2158);
    float _2184 = _2144 * _2090;
    bool _2186 = !_2142;
    int _2188 = _2186 ? 0 : (-1);
    float _2190 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2150);
    bool _2192 = uint(_2160) > 1u;
    float _2194 = fma(_2182, _2074, _2152);
    int _2196 = ~_2098;
    int _2198 = _2196 + _2188;
    int _2200 = _2198 + 1;
    int _2202 = _2156 + 8;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[int(_2214)][_2216];
    int _2220 = _2112 ? 0 : 1;
    float _2222 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2224 = _834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2226 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2228 = ~_2220;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    bool _2236 = uint(_2160) >= 2u;
    float _2238 = fma(_2190, _2074, _2164);
    float _2240 = exp2(_2222);
    int _2242 = _2232;
    if (!_2192)
    {
        int _2244 = ~_2220;
        int _2246 = _2244 + 1;
        _2242 = _2246;
    }
    int _2248 = _2242;
    float _2250 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    bool _2252 = _2160 != 3;
    float _2254 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2226);
    int _2256 = abs(_2248);
    float _2258 = fma(_2234, _2082, _2238);
    int _2260 = _2236 ? 0 : 1;
    float _2262 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2250);
    bool _2264 = !_2162;
    int _2266 = _2264 ? 0 : 1;
    float _2268 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2254);
    float _2270 = fma(_2262, _2074, _2184);
    int _2272 = ~_2260;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = fma(_2268, _2082, _2194);
    int _2280 = abs(_2266);
    float _2282 = -_1542;
    float _2284 = _2282 + 1.0;
    bool _2286 = _2160 != 3;
    int _2288 = _356 * _2200;
    int _2290 = _2288 + _1758;
    int _2292 = _2276;
    if (_2252)
    {
        int _2294 = ~_2260;
        int _2296 = _2294 + 1;
        _2292 = _2296;
    }
    int _2298 = _2292;
    float _2300 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2302 = ~_2256;
    int _2304 = _2302 + 1;
    int _2306 = _2304 + 1;
    float _2308 = _1630 * _1554;
    float _2310 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2300);
    bool _2312 = !_2286;
    int _2314 = _2312 ? 0 : (-1);
    float _2316 = fma(_2240, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2318 = precise::clamp(_2316, 0.0, 1.0);
    int _2320 = abs(_2298);
    float _2322 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2310);
    int _2324 = _2306 * as_type<int>(_2180);
    bool _2326 = !_1794;
    int _2328 = _2326 ? 0 : 1;
    int _2330 = ~_2280;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    bool _2336 = _1130 <= 8000.0;
    bool _2338 = isnan(_1130);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    bool _2348 = !_1585;
    int _2350 = _2348 ? _2290 : (-1);
    int _2352 = _2334 * as_type<int>(_2172);
    int _2354 = _2352 + _2324;
    int _2356 = abs(_2314);
    float _2358 = _1522 + _1472;
    float _2360 = _1575 * _2308;
    float _2362 = fma(_2322, _2082, _2270);
    int _2364 = abs(_2328);
    float _2366 = _2358 * 0.5;
    int _2368 = ~_2320;
    int _2370 = _2368 + 1;
    int _2372 = _2370 + 1;
    float _2374 = fma(_2318, -2.0, 3.0);
    float _2376 = _2318 * _2318;
    int _2378 = _2372 * as_type<int>(_2210);
    int _2380 = _2378 + _2354;
    int _2382 = ~_2356;
    int _2384 = _2382 + 1;
    int _2386 = _2384 + 1;
    float _2388 = _2376 * _2374;
    float _2390 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2392 = ~_2364;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = fma(_1565, _2360, _1563);
    int _2400 = _2386 * as_type<int>(_2218);
    int _2402 = _2400 + _2380;
    float _2404 = -_2388;
    float _2406 = _2404 + 1.0;
    float _2408 = in.m_83.x;
    float _2410 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2412 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2388);
    int _2414 = _2402 * _2396;
    float _2416 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2410);
    float _2418 = _1472 * 0.5;
    float _2420 = _2346 * _2412;
    int _2422 = _2350 * _2364;
    int _2424 = _2422 + _2414;
    float _2426 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2416);
    float _2428 = fma(_1524, -0.5, _2418);
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2432 = _2426 + _1472;
    out.gl_Position.x = _1522;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _2426;
    out.gl_Position.w = _1472;
    float _2434 = _2284 * _2430;
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = float(_2424);
    float _2440 = _2432 * 0.5;
    out.m_85.x = _2278;
    out.m_85.y = _2258;
    out.m_85.z = _2362;
    float _2442 = -_2436;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2446 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2448 = isnan(_1278);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2454 = _2450 || _2452;
    out.m_87.x = _2366;
    out.m_87.y = _2428;
    out.m_87.z = _2440;
    out.m_87.w = _1472;
    float _2456 = _2444 * _2408;
    out.m_89.x = _2438;
    float _2458 = _1565 * _2308;
    float _2460 = -_1630;
    float _2462 = _2460 + 1.0;
    float _2464 = _2456 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2466 = fma(_1571, _2458, _1559);
    float _2468 = fma(_1573, _2458, _1561);
    float _2470 = _1565 * _2462;
    out.m_91.x = _2464;
    float _2472 = _1182 * _1238;
    float _2474 = _2408;
    float _2476 = _2418;
    float _2478 = _2426;
    float _2480 = _2458;
    float _2482 = _2472;
    if (!_2454)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2474;
    out.m_93.x = _2466;
    out.m_93.y = _2468;
    out.m_93.z = _2398;
    out.m_93.w = _2470;
    float _2486 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2488 = _2484;
    float _2490 = _2484;
    if (!_2454)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2492 = _2476;
    float _2494 = _2492;
    float _2496 = _2492;
    if (!_2454)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _1768;
    float _2500 = _2498;
    float _2502 = _2498;
    if (!_2454)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2504 = _2478;
    float _2506 = _2504;
    float _2508 = _2504;
    if (!_2454)
    {
        _2480 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2510 = _2480;
    float _2512 = _2510;
    float _2514 = _2510;
    if (!_2454)
    {
        _2482 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2516 = _2482;
    bool _2518 = !_2454;
    float _2520 = _2516;
    float _2522 = _2516;
    if (!_2518)
    {
        bool _2524 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2526 = isnan(_1278);
        bool _2528 = _2524 || _2526;
        bool _2530 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2532 = _2528 || _2530;
        if (!_2532)
        {
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = _1278 + _2534;
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2538;
            float _2542 = 1.0 / _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2564 = _2536 * _2542;
            float _2566 = precise::clamp(_2564, 0.0, 1.0);
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2572 = fma(_2566, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2574 = fma(_2566, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2566, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2578 = fma(_2566, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2580 = fma(_2566, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2582 = fma(_2566, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2496 = _2574;
            _2514 = _2580;
            _2490 = _2572;
            _2508 = _2578;
            _2502 = _2576;
            _2522 = _2582;
            _2584 = true;
        }
        else
        {
            bool _2586 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2588 = isnan(_1278);
            bool _2590 = _2586 || _2588;
            bool _2592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2594 = _2590 || _2592;
            if (!_2594)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2596 = _2488;
            _2490 = _2596;
            if (!_2594)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2598 = _2494;
            _2496 = _2598;
            if (!_2594)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2600 = _2500;
            _2502 = _2600;
            if (!_2594)
            {
                _2506 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2602 = _2506;
            _2508 = _2602;
            if (!_2594)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2604 = _2512;
            _2514 = _2604;
            if (!_2594)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2606 = _2520;
            bool _2608 = !_2594;
            _2522 = _2606;
            if (!_2608)
            {
                bool _2610 = _1278 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2612 = isnan(_1278);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2618 = _2614 || _2616;
                if (!_2618)
                {
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = _1278 + _2620;
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2624;
                    float _2628 = 1.0 / _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2650 = _2622 * _2628;
                    float _2652 = precise::clamp(_2650, 0.0, 1.0);
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2658 = fma(_2652, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2660 = fma(_2652, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2652, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2664 = fma(_2652, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2666 = fma(_2652, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2668 = fma(_2652, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2496 = _2660;
                    _2514 = _2666;
                    _2490 = _2658;
                    _2508 = _2664;
                    _2502 = _2662;
                    _2522 = _2668;
                    _2584 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2508 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2584 = false;
    float _2670 = _2496;
    float _2672 = _2514;
    float _2674 = _2490;
    float _2676 = _2508;
    float _2678 = _2502;
    float _2680 = _2522;
    float _2682 = _2486 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_2258, -0.5, 0.5);
    float _2686 = precise::clamp(_2684, 0.0, 1.0);
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = -_2674;
    float _2694 = _2692 + _2676;
    out.m_53.x = _2682;
    float _2696 = fma(_2686, _2690, _2670);
    float _2698 = -_2678;
    float _2700 = _2698 + _2680;
    float _2702 = fma(_2686, _2694, _2674);
    float _2704 = _2696 * 0.586610972881317138671875;
    bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = fma(_2686, _2700, _2678);
    out.m_95.x = 0.0;
    float _2710 = fma(_2702, 0.298911988735198974609375, _2704);
    bool _2712 = _1182 > 0.0;
    bool _2714 = isnan(_1182);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan(0.0);
    bool _2720 = _2716 || _2718;
    float _2722 = fma(_2708, 0.114477999508380889892578125, _2710);
    bool _2724 = _1238 <= 0.0;
    bool _2726 = !_2720;
    bool _2728 = _2724 || _2726;
    float _2730 = -_2722;
    float _2732 = _2702 + _2730;
    float _2734 = -_2722;
    float _2736 = _2696 + _2734;
    float _2738 = -_2722;
    float _2740 = _2708 + _2738;
    float _2742 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2744 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    float _2746 = fma(_2740, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2722);
    bool _2748 = !_2706;
    if (!_2748)
    {
        float _2750 = -_1112;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2754 = -_1114;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2758 = -_1116;
        float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2762 = _2752 * _2752;
        float _2764 = fma(_2756, _2756, _2762);
        float _2766 = fma(_2760, _2760, _2764);
        float _2768 = sqrt(_2766);
        float _2770 = rsqrt(_2766);
        float _2772 = -_2768;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2776 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = _2756 * _2770;
        float _2782 = _2752 * _2770;
        float _2784 = abs(_2778);
        float _2786 = log2(_2784);
        float _2788 = _2760 * _2770;
        float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2792 = _2258 * _2782;
        float _2794 = -_2782;
        float _2796 = -_2790;
        float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2796);
        float _2800 = fma(_2278, _2780, _2792);
        float _2802 = -_2788;
        float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2798);
        float _2806 = fma(_2362, _2788, _2800);
        float _2808 = precise::clamp(_2806, 0.0, 1.0);
        float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2812 = _2804 + _2810;
        float _2814 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2816 = _2812 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2818 = precise::clamp(_2816, 0.0, 1.0);
        float _2820 = exp2(_2814);
        float _2822 = _2820 * _2818;
        float _2824 = _2808 * _2822;
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2828 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2826;
        out.m_95.y = _2828;
        out.m_95.z = _2830;
    }
    out.m_65.x = _2742;
    out.m_65.y = _2744;
    out.m_65.z = _2746;
    if (!_2728)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2832;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

