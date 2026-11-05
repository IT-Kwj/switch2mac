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
    float4 m_73 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1747 = false;
    bool _368 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2091 = as_type<float>(_126);
        out.gl_Position.z = _2091;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_110);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2161 = as_type<float>(_164);
        out.gl_Position.z = _2161;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _142 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _196 + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _240 = isnan(_196);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_212;
    float _252 = _250 + 1.0;
    float _254 = 1.0 / _236;
    float _256 = _248 * _252;
    float _258 = -_248;
    float _260 = _258 + 1.0;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = 1.0 / _232;
    float _270 = _228 * _260;
    float _272 = -_228;
    float _274 = _272 + 1.0;
    float _276 = _216 * _254;
    float _278 = _200 * _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    float _288 = fma(_264, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_282, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_286, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = in.m_55.x;
    float _296 = in.m_55.y;
    float _298 = in.m_55.z;
    float _300 = _288 * _270;
    float _302 = _290 * _270;
    float _304 = _292 * _270;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].x, _300);
    float _320 = fma(_308, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_312, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _324 = fma(_316, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _326 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _328 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].z, _304);
    float _330 = fma(_320, _256, _318);
    float _332 = fma(_322, _256, _326);
    float _334 = fma(_324, _256, _328);
    float _336 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _330);
    float _338 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _332);
    float _340 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _334);
    float _342 = _336 * _294;
    float _344 = _338 * _296;
    float _346 = _340 * _298;
    bool _348 = !_266;
    float _366;
    if (!_348)
    {
        float _350 = in.m_53.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_110);
        float _372 = 1.0 / _370;
        float _374 = _142 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_53.z;
    float _380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _382 = log2(_380);
    float _384 = in.m_53.x;
    float _386 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _390 = in.m_53.y;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _412);
    float _416 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _418 = _382 * _142;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _416);
    float _422 = _378 * 2.0;
    float _424 = _384 * 2.0;
    float _426 = floor(_422);
    float _428 = _390 * 2.0;
    float _430 = _390 + _378;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _406);
    float _434 = _430 + (-1.0);
    float _436 = floor(_424);
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _414);
    float _440 = _386 * _432;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _444 = _384 + _390;
    float _446 = floor(_428);
    bool _448 = _426 > 0.0;
    float _450 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _452 = _426 >= 0.0;
    bool _454 = isnan(_426);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _444 + (-1.0);
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _450);
    int _466 = _460 ? 0 : 1;
    float _468 = exp2(_418);
    bool _470 = _436 > 0.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _474 = 1.0 + _472;
    int _476 = ~_466;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    float _482 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _484 = _436 >= 0.0;
    bool _486 = isnan(_436);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    int _494 = _480;
    float _496 = _440;
    if (!_448)
    {
        int _498 = ~_466;
        int _500 = _498 + 1;
        _494 = _500;
    }
    int _502 = _494;
    float _504 = 1.0 / _474;
    float _506 = in.m_59.x;
    float _508 = in.m_59.y;
    float _510 = in.m_59.z;
    bool _512 = _446 > 0.0;
    bool _514 = _446 >= 0.0;
    bool _516 = isnan(_446);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    bool _524 = !_394;
    int _526 = _524 ? 0 : 1;
    float _528 = float(_502);
    float _530 = -_468;
    float _532 = _530 + 1.0;
    int _534 = abs(_526);
    float _536 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _464);
    bool _538 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = float(_534);
    int _550 = _492 ? 0 : 1;
    float _552 = sqrt(_536);
    bool _554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _562 = _558 || _560;
    float _564 = _548 * _528;
    int _566 = ~_550;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    bool _572 = !_398;
    int _574 = _572 ? 0 : 1;
    int _576 = _570;
    if (!_470)
    {
        int _578 = ~_550;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 * (-2.0);
    float _586 = _562 ? _532 : 0.0;
    int _588 = _522 ? 0 : 1;
    float _590 = fma(_482, _584, _482);
    int _592 = abs(_574);
    if (_546)
    {
        float _594 = _586 * _504;
        _144 = _594;
    }
    float _596 = _144;
    float _598 = fma(_584, _506, _506);
    int _600 = ~_588;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    float _606 = sqrt(_438);
    float _608 = _384 + (-0.5);
    int _610 = _604;
    if (!_512)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    bool _618 = !_402;
    int _620 = _618 ? 0 : 1;
    float _622 = float(_616);
    float _624 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _598);
    float _626 = float(_592);
    float _628 = in.m_46.x;
    float _630 = in.m_46.y;
    float _632 = in.m_46.z;
    float _634 = float(_582);
    float _636 = fma(_590, _596, _624);
    int _638 = abs(_620);
    float _640 = _626 * _634;
    float _642 = float(_638);
    float _644 = _384 + _378;
    float _646 = _378 + (-0.5);
    float _648 = _640 * (-2.0);
    float _650 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _420);
    float _652 = _642 * _622;
    float _654 = _390 + (-0.5);
    float _656 = _644 + (-1.0);
    float _658 = fma(_648, _508, _508);
    float _660 = _652 * (-2.0);
    float _662 = fma(_442, _648, _442);
    float _664 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _668 = fma(_660, _510, _510);
    float _670 = sqrt(_650);
    float _672 = fma(_664, _660, _664);
    float _674 = fma(_662, _596, _666);
    float _676 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _668);
    float _678 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _680 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _682 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _684 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _686 = fma(_672, _596, _676);
    float _688 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].x, _678);
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].z, _680);
    float _692 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].y, _682);
    float _694 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].w, _684);
    float _696 = _636 * 0.15915493667125701904296875;
    float _698 = _674 * 0.15915493667125701904296875;
    float _700 = _686 * 0.15915493667125701904296875;
    float _702 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].x, _688);
    float _704 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].z, _690);
    float _706 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].y, _692);
    float _708 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].w, _694);
    float _710 = _696 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _702 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _716 = _706 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _718 = _704 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _408);
    float _722 = _606 * _714;
    float _724 = _670 * _716;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _410);
    float _728 = _696 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _552 * _718;
    float _734 = _724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _736 = _724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _738 = _388 * _720;
    float _740 = _404 * _726;
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _736);
    float _746 = _698 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = _708 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _742);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _744);
    float _756 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].w, _752);
    float _758 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].w, _754);
    float _760 = _698 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _756 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _768 = _724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _770 = _700 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = _730 * _748;
    float _776 = _712 * _748;
    float _778 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _768);
    float _780 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _778);
    float _782 = _700 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _712 * _762;
    float _788 = _730 * _762;
    float _790 = _712 * _772;
    float _792 = _762 * _772;
    float _794 = _748 * _772;
    float _796 = _730 * _772;
    float _798 = _790 * _738;
    float _800 = -_774;
    float _802 = fma(_784, _786, _800);
    float _804 = -_738;
    float _806 = _784 * _804;
    float _808 = fma(_784, _776, _788);
    float _810 = fma(_784, _788, _776);
    float _812 = fma(_802, _440, _798);
    float _814 = fma(_792, _440, _806);
    float _816 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].w, _780);
    float _818 = -_786;
    float _820 = fma(_784, _774, _818);
    float _822 = fma(_808, _740, _812);
    float _824 = fma(_794, _740, _814);
    float _826 = _816 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _828 = _764 + _822;
    float _830 = _766 + _824;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _828 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _838 = _830 + _836;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = _796 * _738;
    float _846 = sqrt(_842);
    float _848 = fma(_810, _440, _844);
    float _850 = fma(_820, _740, _848);
    float _852 = _826 + _850;
    bool _854 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _856 = _850;
    float _858 = _750;
    float _860 = _772;
    float _862 = _768;
    float _864 = _780;
    float _866 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    if (!_854)
    {
        _856 = _830;
    }
    float _868 = _856;
    float _870 = _868;
    if (!_854)
    {
        _858 = _828;
    }
    float _872 = _858;
    float _874 = _872;
    if (!_854)
    {
        _860 = _852;
    }
    float _876 = _860;
    bool _878 = !_854;
    float _880 = _876;
    if (!_878)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _886 = _846 + _884;
        float _888 = _852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _890 = rsqrt(_842);
        float _892 = _886 * _882;
        float _894 = _892 * 0.15915493667125701904296875;
        float _896 = _894 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = _894 * 6.283185482025146484375;
        float _902 = sin(_900);
        float _904 = _898 + (-1.0);
        float _906 = _904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = fma(_902, _888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _910 = fma(_852, _898, _906);
        float _912 = _890 * _908;
        float _914 = fma(_838, _912, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _916 = fma(_834, _912, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _880 = _910;
        _870 = _914;
        _874 = _916;
        _496 = _894;
        _862 = _908;
    }
    float _918 = _880;
    float _920 = _870;
    float _922 = _874;
    float _924 = _496;
    float _926 = _862;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _918 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _920 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _922 + _936;
    float _940 = _930 * _930;
    float _942 = fma(_934, _934, _940);
    float _944 = fma(_938, _938, _942);
    float _946 = rsqrt(_944);
    float _948 = sqrt(_944);
    float _950 = _934 * _946;
    float _952 = _938 * _946;
    float _954 = _930 * _946;
    float _956 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _960 = _956 * _956;
    float _962 = _958 * _958;
    float _964 = _960 + _962;
    float _966 = sqrt(_964);
    bool _968 = _966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = _966 + _970;
    float _974 = _924;
    float _976 = _964;
    float _978 = _972;
    if (_968)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _980;
    }
    float _982 = _974;
    if (_968)
    {
        float _984 = rsqrt(_964);
        _976 = _984;
    }
    float _986 = _976;
    float _988 = _986;
    if (_968)
    {
        float _990 = _972 * _982;
        _978 = _990;
    }
    float _992 = _978;
    if (_968)
    {
        float _994 = _992 * 0.15915493667125701904296875;
        _864 = _994;
    }
    float _996 = _864;
    float _998 = _834;
    float _1000 = _996;
    if (_968)
    {
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        _998 = _1004;
    }
    float _1006 = _998;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1010 = precise::max(0.0, _1008);
    float _1012 = _926;
    float _1014 = _1010;
    float _1016 = _1008;
    if (_968)
    {
        float _1018 = _996 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        _1012 = _1020;
    }
    float _1022 = _1012;
    float _1024 = -_954;
    float _1026 = -_1010;
    float _1028 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1026);
    float _1030 = _1028;
    if (_968)
    {
        float _1032 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1032;
    }
    float _1034 = _1014;
    float _1036 = _1034;
    if (!_968)
    {
        _1000 = _958;
    }
    float _1038 = _1000;
    float _1040 = _1006;
    float _1042 = _1038;
    if (_968)
    {
        float _1044 = fma(_1006, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    float _1050 = _1022;
    if (_968)
    {
        float _1052 = _1022 + (-1.0);
        _1016 = _1052;
    }
    float _1054 = _1016;
    if (_968)
    {
        float _1056 = _986 * _1046;
        _866 = _1056;
    }
    float _1058 = _866;
    if (!_968)
    {
        _1048 = _956;
    }
    float _1060 = _1048;
    float _1062 = _1060;
    if (_968)
    {
        float _1064 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1064;
    }
    float _1066 = _1036;
    if (_968)
    {
        float _1068 = _956 * _1058;
        _1062 = _1068;
    }
    float _1070 = _1062;
    if (_968)
    {
        float _1072 = _958 * _1058;
        _1042 = _1072;
    }
    float _1074 = _1042;
    if (!_968)
    {
        _988 = _962;
    }
    float _1076 = _988;
    float _1078 = _1076;
    if (_968)
    {
        float _1080 = fma(_1028, _1022, _1066);
        _1030 = _1080;
    }
    float _1082 = _1030;
    if (!_968)
    {
        _1050 = _960;
    }
    float _1084 = _1050;
    float _1086 = _1084;
    if (_968)
    {
        float _1088 = _1070 * _1070;
        _1086 = _1088;
    }
    float _1090 = _1086;
    if (_968)
    {
        float _1092 = _1074 * _1074;
        _1078 = _1092;
    }
    float _1094 = _1078;
    float _1096 = _918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1098 = fma(_1082, _1082, _1090);
    float _1100 = _918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1102 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1096);
    float _1104 = _1098 + _1094;
    float _1106 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1110 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1108);
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    float _1114 = _918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1106);
    float _1118 = rsqrt(_1104);
    float _1120 = -_1112;
    float _1122 = _1120 + 1.0;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1128 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1114);
    float _1130 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1134 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1128);
    float _1136 = abs(_1122);
    float _1138 = log2(_1136);
    float _1140 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1102);
    float _1142 = -_1132;
    float _1144 = fma(_1142, _1124, 1.0);
    float _1146 = _918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1148 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1150 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = _1118 * _1070;
    float _1156 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1146);
    float _1158 = _1118 * _1082;
    float _1160 = floor(_1130);
    float _1162 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1164 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1156);
    float _1166 = _1118 * _1074;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1170 = -_1162;
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1170);
    float _1174 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = floor(_1150);
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1172);
    float _1184 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1168);
    float _1186 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1182, -0.5, 0.5);
    float _1190 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1192 = fma(_1182, 0.5, 0.5);
    float _1194 = -_1160;
    float _1196 = _1130 + _1194;
    float _1198 = log2(_1144);
    float _1200 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1190);
    float _1202 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1204 = fma(_1192, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1202);
    float _1208 = -_1178;
    float _1210 = _1150 + _1208;
    float _1212 = exp2(_1176);
    float _1214 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1216 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = _1158 + 1.0;
    float _1220 = fma(_1192, _1204, -0.212114393711090087890625);
    float _1222 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1214);
    float _1224 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = 1.0 / _1200;
    float _1228 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1230 = _1198 * 0.693147182464599609375;
    float _1232 = sqrt(_1188);
    float _1234 = -_1158;
    float _1236 = fma(_1212, _1218, _1234);
    float2 _3881 = float2(_1196, _1210);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3881, float2(0.0), isnan(_3881)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3881, float2(0.0), isnan(_3881)), level(0.0)).x;
    float _1240 = fma(_1192, _1220, 1.570728778839111328125);
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1244 = _1224 * _1226;
    float _1246 = _1228 * _1226;
    float _1248 = fma(_1236, 0.5, 0.5);
    float _1250 = fma(_1244, 0.5, 0.5);
    float _1252 = fma(_1246, -0.5, 0.5);
    float _1254 = _1232 * 0.636619746685028076171875;
    float _1256 = -_1240;
    float _1258 = fma(_1254, _1256, 1.0);
    float3 _3920 = float3(_1250, _1252, _1242);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).x;
    float3 _3931 = float3(_1250, _1252, _1242);
    float4 _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3931, float3(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3931, float3(0.0), isnan(_3931)), level(0.0)).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float2 _3947 = float2(_1258, _1248);
    float3 _1275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3947, float2(0.0), isnan(_3947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3947, float2(0.0), isnan(_3947)), level(0.0)).xyz;
    float _1277 = _1275.x;
    float _1279 = _1275.y;
    float _1281 = _1275.z;
    float _1283 = _826 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1285 = in.m_61.x;
    float _1287 = _826 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1289 = _390 > 0.5;
    float _1291 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1283);
    float _1293 = in.m_61.z;
    float _1295 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1287);
    float _1297 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1291);
    float _1299 = in.m_61.y;
    float _1301 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1295);
    float _1303 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1305 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = in.m_63.y;
    float _1309 = 1.0 / _1303;
    float _1311 = _1305 + _1303;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1317 = in.m_63.x;
    int _1319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1321 = _1319 != 0;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1327 = _1325 != 0;
    float _1329 = in.m_61.w;
    float _1331 = 1.0 / _1315;
    bool _1333 = _384 > 0.5;
    bool _1335 = _1333 && _1321;
    float _1337 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1285;
    float _1339 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1341 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1343 = _1311 * _1309;
    float _1345 = _1343 * 0.5;
    out.m_65.z = _1293;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    out.m_65.y = _1299;
    float _1353 = exp2(_1339);
    float _1355 = -_1307;
    float _1357 = _1355 + 1.0;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1341);
    out.m_67.x = _920;
    out.m_67.y = _918;
    out.m_67.z = _922;
    float _1365 = _1307;
    float _1367 = _1242;
    float _1369 = _1317;
    float _1371 = _1200;
    float _1373 = _1228;
    if (_1327)
    {
        float _1375 = _1289 ? _1357 : _1307;
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = 1.0 / _1351;
    float _1383 = in.m_69.x;
    float _1385 = in.m_69.y;
    float _1387 = in.m_69.z;
    bool _1389 = _408 != 0.0;
    bool _1391 = isnan(_408);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1363);
    if (_1321)
    {
        _1367 = _1317;
    }
    float _1401 = _1367;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1403;
    bool _1407 = _406 == 0.0;
    bool _1409 = !_1397;
    bool _1411 = _1407 && _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1415 = _376 + _1413;
    out.m_71.x = _1337;
    out.m_71.y = _1379;
    out.m_71.z = _1361;
    float _1417 = _1405 * _1331;
    bool _1419 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1421 = isnan(_376);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1427 = _1423 || _1425;
    float _1429 = float(_1427);
    float _1431 = _1401;
    if (_1335)
    {
        float _1433 = -_1401;
        float _1435 = _1433 + 1.0;
        _1431 = _1435;
    }
    float _1437 = _1431;
    bool _1439 = _410 == 0.0;
    bool _1441 = _1439 && _1411;
    float _1443 = fma(_1417, _1415, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1445 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1447 = isnan(_376);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1459 = _1381 * _1457;
    if (_1321)
    {
        _1369 = _1437;
    }
    float _1461 = _1369;
    out.m_65.w = _1329;
    float _1463 = -_1353;
    float _1465 = _1463 + 1.0;
    float _1467 = abs(_1459);
    float _1469 = log2(_1467);
    float _1471 = -_1429;
    float _1473 = _1471 + 1.0;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1477 = _1455 * _1473;
    float _1479 = -_1455;
    float _1481 = _1479 + 1.0;
    float _1483 = _1385;
    float _1485 = _1383;
    float _1487 = _1387;
    if (!_1441)
    {
        float _1489 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1385);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1495 = _1443 * _1477;
    float _1497 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1441)
    {
        float _1499 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1383);
        _1485 = _1499;
    }
    float _1501 = _1485;
    if (!_1441)
    {
        float _1503 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1387);
        _1487 = _1503;
    }
    float _1505 = _1487;
    float _1507 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1495);
    float _1509 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1511 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1513 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1507);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1519 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1521 = _1497 * _1493;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1527 = exp2(_1511);
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1535 = _1459 <= 8000.0;
    bool _1537 = isnan(_1459);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan(8000.0);
    bool _1543 = _1539 || _1541;
    float _1545 = float(_1543);
    float _1547 = _796 * _1491;
    float _1549 = -_1491;
    float _1551 = _784 * _1549;
    float _1553 = _790 * _1491;
    out.m_73.x = _1529;
    out.m_73.y = _1531;
    out.m_73.z = _1533;
    out.m_73.w = _1519;
    float _1555 = _1509 * _1515;
    float _1557 = fma(_810, _1501, _1547);
    float _1559 = fma(_792, _1501, _1551);
    float _1561 = in.m_75.x;
    float _1563 = fma(_802, _1501, _1553);
    float _1565 = fma(_820, _1505, _1557);
    float _1567 = fma(_794, _1505, _1559);
    float _1569 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    out.m_77.x = _1521;
    out.m_77.y = _1555;
    float _1573 = fma(_808, _1505, _1563);
    bool _1575 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1577 = isnan(_948);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1583 = _1579 || _1581;
    float _1585 = fma(_1571, -2.0, 3.0);
    float _1587 = _1571 * _1571;
    float _1589 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1399);
    out.m_79.x = _1567;
    out.m_79.y = _1565;
    out.m_79.z = _1573;
    float _1591 = _1587 * _1585;
    float _1593 = _1589 + _1200;
    float _1595 = -_1591;
    float _1597 = _1595 + 1.0;
    float _1599 = _1593 * 0.5;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1591);
    float _1603 = _1545 * _1601;
    out.m_81.z = _1599;
    out.m_81.w = _1200;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1589;
    out.gl_Position.w = _1200;
    float _1607 = _1200;
    float _1609 = _1599;
    float _1611 = _1589;
    if (!_1583)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1613 = _1607;
    float _1615 = _1613;
    float _1617 = _1613;
    if (!_1583)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1619 = _1609;
    float _1621 = -_1475;
    float _1623 = _1621 + 1.0;
    float _1625 = _1623;
    float _1627 = _1619;
    float _1629 = _1619;
    if (!_1583)
    {
        _1371 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1631 = _1371;
    float _1633 = _1631;
    float _1635 = _1631;
    if (!_1583)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1637 = _1611;
    float _1639 = _1637;
    float _1641 = _1637;
    if (!_1583)
    {
        _1373 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1643 = _1373;
    float _1645 = -_1238;
    float _1647 = _1645 + 1.0;
    float _1649 = _1647 * _1605;
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = -_1651;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1657 = _1655 * _1561;
    float _1659 = _1657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1661 = _1475 * _1260;
    float _1663 = _1271 * _1623;
    out.m_83.x = _1659;
    float _1665 = _1643;
    float _1667 = _1643;
    if (!_1583)
    {
        _1625 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1669 = _1625;
    float _1671 = _1271 * _1661;
    float _1673 = _1281 * _1661;
    float _1675 = fma(_1277, _1671, _1265);
    float _1677 = fma(_1279, _1671, _1267);
    float _1679 = fma(_1271, _1673, _1269);
    out.m_85.x = _1675;
    out.m_85.y = _1677;
    out.m_85.z = _1679;
    out.m_85.w = _1663;
    bool _1681 = !_1583;
    float _1683 = _1669;
    float _1685 = _1669;
    if (!_1681)
    {
        bool _1687 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1689 = isnan(_948);
        bool _1691 = _1687 || _1689;
        bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1695 = _1691 || _1693;
        if (!_1695)
        {
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1699 = _948 + _1697;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1703 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1701;
            float _1705 = 1.0 / _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1727 = _1699 * _1705;
            float _1729 = precise::clamp(_1727, 0.0, 1.0);
            float _1731 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1735 = fma(_1729, _1709, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1737 = fma(_1729, _1733, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1739 = fma(_1729, _1713, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1741 = fma(_1729, _1717, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1743 = fma(_1729, _1721, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1745 = fma(_1729, _1725, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1629 = _1737;
            _1667 = _1743;
            _1617 = _1735;
            _1641 = _1741;
            _1635 = _1739;
            _1685 = _1745;
            _1747 = true;
        }
        else
        {
            bool _1749 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1751 = isnan(_948);
            bool _1753 = _1749 || _1751;
            bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1757 = _1753 || _1755;
            if (!_1757)
            {
                _1615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1759 = _1615;
            _1617 = _1759;
            if (!_1757)
            {
                _1627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1761 = _1627;
            _1629 = _1761;
            if (!_1757)
            {
                _1633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1763 = _1633;
            _1635 = _1763;
            if (!_1757)
            {
                _1639 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1765 = _1639;
            _1641 = _1765;
            if (!_1757)
            {
                _1665 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1767 = _1665;
            _1667 = _1767;
            if (!_1757)
            {
                _1683 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1769 = _1683;
            bool _1771 = !_1757;
            _1685 = _1769;
            if (!_1771)
            {
                bool _1773 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1775 = isnan(_948);
                bool _1777 = _1773 || _1775;
                bool _1779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1781 = _1777 || _1779;
                if (!_1781)
                {
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1785 = _948 + _1783;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1787;
                    float _1791 = 1.0 / _1789;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1813 = _1785 * _1791;
                    float _1815 = precise::clamp(_1813, 0.0, 1.0);
                    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1821 = fma(_1815, _1795, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1823 = fma(_1815, _1819, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1825 = fma(_1815, _1799, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1827 = fma(_1815, _1803, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1829 = fma(_1815, _1807, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1831 = fma(_1815, _1811, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1629 = _1823;
                    _1667 = _1829;
                    _1617 = _1821;
                    _1641 = _1827;
                    _1635 = _1825;
                    _1685 = _1831;
                    _1747 = true;
                }
                else
                {
                    _1629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1667 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1641 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1685 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1747 = false;
    float _1833 = _1629;
    float _1835 = _1667;
    float _1837 = _1617;
    float _1839 = _1641;
    float _1841 = _1635;
    float _1843 = _1685;
    float _1845 = fma(_1565, -0.5, 0.5);
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = -_1833;
    float _1851 = _1849 + _1835;
    float _1853 = -_1837;
    float _1855 = _1853 + _1839;
    float _1857 = -_1841;
    float _1859 = _1857 + _1843;
    bool _1861 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1863 = fma(_1847, _1851, _1833);
    float _1865 = fma(_1847, _1855, _1837);
    float _1867 = fma(_1847, _1859, _1841);
    float _1869 = _1863 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _1871 = fma(_1865, 0.298911988735198974609375, _1869);
    float _1873 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1875 = fma(_1867, 0.114477999508380889892578125, _1871);
    out.m_83.w = _1873;
    float _1877 = -_1875;
    float _1879 = _1865 + _1877;
    float _1881 = -_1875;
    float _1883 = _1863 + _1881;
    float _1885 = -_1875;
    float _1887 = _1867 + _1885;
    out.m_87.x = 0.0;
    float _1889 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1893 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    out.m_89.x = 0.0;
    out.m_91.x = _1889;
    out.m_91.y = _1891;
    out.m_91.z = _1893;
    if (!_1861)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1895 = -_918;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1899 = -_920;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1903 = -_922;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1907 = _1897 * _1897;
    float _1909 = fma(_1901, _1901, _1907);
    float _1911 = fma(_1905, _1905, _1909);
    float _1913 = rsqrt(_1911);
    float _1915 = _1897 * _1913;
    float _1917 = _1901 * _1913;
    float _1919 = _1905 * _1913;
    float _1921 = sqrt(_1911);
    float _1923 = -_954;
    float _1925 = _1923 + _1915;
    float _1927 = -_950;
    float _1929 = _1927 + _1917;
    float _1931 = -_952;
    float _1933 = _1931 + _1919;
    float _1935 = _1925 * _1925;
    float _1937 = fma(_1929, _1929, _1935);
    float _1939 = fma(_1933, _1933, _1937);
    float _1941 = -_1921;
    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1945 = rsqrt(_1939);
    float _1947 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1949 = precise::clamp(_1947, 0.0, 1.0);
    float _1951 = abs(_1949);
    float _1953 = log2(_1951);
    float _1955 = _1925 * _1945;
    float _1957 = _1929 * _1945;
    float _1959 = _1933 * _1945;
    float _1961 = _1565 * _1955;
    float _1963 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = _1565 * _1915;
    float _1969 = fma(_1567, _1957, _1961);
    float _1971 = _1965 * _1965;
    float _1973 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1975 = fma(_1567, _1917, _1967);
    float _1977 = fma(_1573, _1959, _1969);
    float _1979 = precise::clamp(_1977, 0.0, 1.0);
    float _1981 = _1971 + (-1.0);
    float _1983 = fma(_1573, _1919, _1975);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = _1979 * _1979;
    float _1989 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1991 = exp2(_1973);
    float _1993 = fma(_1987, _1981, 1.0);
    float _1995 = -_1915;
    float _1997 = -_1989;
    float _1999 = fma(_1995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1997);
    float _2001 = _1993 * _1993;
    float _2003 = -_1919;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1999);
    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2009 = _2005 + _2007;
    float _2011 = 1.0 / _2001;
    float _2013 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2015 = precise::clamp(_2013, 0.0, 1.0);
    float _2017 = _1991 * _2015;
    float _2019 = _1985 * _2017;
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2023 = _1971 * _2011;
    float _2025 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2027 = _2019 * _2023;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2031 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2021;
    out.m_87.y = _2025;
    out.m_87.z = _2029;
    out.m_89.x = _2031;
    out.m_89.y = _2033;
    out.m_89.z = _2035;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1747 = false;
    bool _368 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2091 = as_type<float>(_126);
        out.gl_Position.z = _2091;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_110);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2161 = as_type<float>(_164);
        out.gl_Position.z = _2161;
    }
    if (_154)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _142 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _196 + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _240 = isnan(_196);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_212;
    float _252 = _250 + 1.0;
    float _254 = 1.0 / _236;
    float _256 = _248 * _252;
    float _258 = -_248;
    float _260 = _258 + 1.0;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = 1.0 / _232;
    float _270 = _228 * _260;
    float _272 = -_228;
    float _274 = _272 + 1.0;
    float _276 = _216 * _254;
    float _278 = _200 * _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    float _288 = fma(_264, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_282, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_286, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = in.m_55.x;
    float _296 = in.m_55.y;
    float _298 = in.m_55.z;
    float _300 = _288 * _270;
    float _302 = _290 * _270;
    float _304 = _292 * _270;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].x, _300);
    float _320 = fma(_308, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_312, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _324 = fma(_316, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _326 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _328 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].z, _304);
    float _330 = fma(_320, _256, _318);
    float _332 = fma(_322, _256, _326);
    float _334 = fma(_324, _256, _328);
    float _336 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _330);
    float _338 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _332);
    float _340 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _334);
    float _342 = _336 * _294;
    float _344 = _338 * _296;
    float _346 = _340 * _298;
    bool _348 = !_266;
    float _366;
    if (!_348)
    {
        float _350 = in.m_53.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_110);
        float _372 = 1.0 / _370;
        float _374 = _142 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_53.z;
    float _380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _382 = log2(_380);
    float _384 = in.m_53.x;
    float _386 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _390 = in.m_53.y;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _412);
    float _416 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _418 = _382 * _142;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _416);
    float _422 = _378 * 2.0;
    float _424 = _384 * 2.0;
    float _426 = floor(_422);
    float _428 = _390 * 2.0;
    float _430 = _390 + _378;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _406);
    float _434 = _430 + (-1.0);
    float _436 = floor(_424);
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _414);
    float _440 = _386 * _432;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _444 = _384 + _390;
    float _446 = floor(_428);
    bool _448 = _426 > 0.0;
    float _450 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _452 = _426 >= 0.0;
    bool _454 = isnan(_426);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _444 + (-1.0);
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _450);
    int _466 = _460 ? 0 : 1;
    float _468 = exp2(_418);
    bool _470 = _436 > 0.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _474 = 1.0 + _472;
    int _476 = ~_466;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    float _482 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _484 = _436 >= 0.0;
    bool _486 = isnan(_436);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    int _494 = _480;
    float _496 = _440;
    if (!_448)
    {
        int _498 = ~_466;
        int _500 = _498 + 1;
        _494 = _500;
    }
    int _502 = _494;
    float _504 = 1.0 / _474;
    float _506 = in.m_59.x;
    float _508 = in.m_59.y;
    float _510 = in.m_59.z;
    bool _512 = _446 > 0.0;
    bool _514 = _446 >= 0.0;
    bool _516 = isnan(_446);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    bool _524 = !_394;
    int _526 = _524 ? 0 : 1;
    float _528 = float(_502);
    float _530 = -_468;
    float _532 = _530 + 1.0;
    int _534 = abs(_526);
    float _536 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _464);
    bool _538 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = float(_534);
    int _550 = _492 ? 0 : 1;
    float _552 = sqrt(_536);
    bool _554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _562 = _558 || _560;
    float _564 = _548 * _528;
    int _566 = ~_550;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    bool _572 = !_398;
    int _574 = _572 ? 0 : 1;
    int _576 = _570;
    if (!_470)
    {
        int _578 = ~_550;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 * (-2.0);
    float _586 = _562 ? _532 : 0.0;
    int _588 = _522 ? 0 : 1;
    float _590 = fma(_482, _584, _482);
    int _592 = abs(_574);
    if (_546)
    {
        float _594 = _586 * _504;
        _144 = _594;
    }
    float _596 = _144;
    float _598 = fma(_584, _506, _506);
    int _600 = ~_588;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    float _606 = sqrt(_438);
    float _608 = _384 + (-0.5);
    int _610 = _604;
    if (!_512)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    bool _618 = !_402;
    int _620 = _618 ? 0 : 1;
    float _622 = float(_616);
    float _624 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _598);
    float _626 = float(_592);
    float _628 = in.m_46.x;
    float _630 = in.m_46.y;
    float _632 = in.m_46.z;
    float _634 = float(_582);
    float _636 = fma(_590, _596, _624);
    int _638 = abs(_620);
    float _640 = _626 * _634;
    float _642 = float(_638);
    float _644 = _384 + _378;
    float _646 = _378 + (-0.5);
    float _648 = _640 * (-2.0);
    float _650 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _420);
    float _652 = _642 * _622;
    float _654 = _390 + (-0.5);
    float _656 = _644 + (-1.0);
    float _658 = fma(_648, _508, _508);
    float _660 = _652 * (-2.0);
    float _662 = fma(_442, _648, _442);
    float _664 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _668 = fma(_660, _510, _510);
    float _670 = sqrt(_650);
    float _672 = fma(_664, _660, _664);
    float _674 = fma(_662, _596, _666);
    float _676 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _668);
    float _678 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _680 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _682 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _684 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _686 = fma(_672, _596, _676);
    float _688 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].x, _678);
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].z, _680);
    float _692 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].y, _682);
    float _694 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].w, _684);
    float _696 = _636 * 0.15915493667125701904296875;
    float _698 = _674 * 0.15915493667125701904296875;
    float _700 = _686 * 0.15915493667125701904296875;
    float _702 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].x, _688);
    float _704 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].z, _690);
    float _706 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].y, _692);
    float _708 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].w, _694);
    float _710 = _696 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _702 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _716 = _706 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _718 = _704 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _408);
    float _722 = _606 * _714;
    float _724 = _670 * _716;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _410);
    float _728 = _696 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _552 * _718;
    float _734 = _724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _736 = _724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _738 = _388 * _720;
    float _740 = _404 * _726;
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _736);
    float _746 = _698 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = _708 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _742);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _744);
    float _756 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].w, _752);
    float _758 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].w, _754);
    float _760 = _698 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _756 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _768 = _724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _770 = _700 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = _730 * _748;
    float _776 = _712 * _748;
    float _778 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _768);
    float _780 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _778);
    float _782 = _700 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _712 * _762;
    float _788 = _730 * _762;
    float _790 = _712 * _772;
    float _792 = _762 * _772;
    float _794 = _748 * _772;
    float _796 = _730 * _772;
    float _798 = _790 * _738;
    float _800 = -_774;
    float _802 = fma(_784, _786, _800);
    float _804 = -_738;
    float _806 = _784 * _804;
    float _808 = fma(_784, _776, _788);
    float _810 = fma(_784, _788, _776);
    float _812 = fma(_802, _440, _798);
    float _814 = fma(_792, _440, _806);
    float _816 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].w, _780);
    float _818 = -_786;
    float _820 = fma(_784, _774, _818);
    float _822 = fma(_808, _740, _812);
    float _824 = fma(_794, _740, _814);
    float _826 = _816 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _828 = _764 + _822;
    float _830 = _766 + _824;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _828 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _838 = _830 + _836;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = _796 * _738;
    float _846 = sqrt(_842);
    float _848 = fma(_810, _440, _844);
    float _850 = fma(_820, _740, _848);
    float _852 = _826 + _850;
    bool _854 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _856 = _850;
    float _858 = _750;
    float _860 = _772;
    float _862 = _768;
    float _864 = _780;
    float _866 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    if (!_854)
    {
        _856 = _830;
    }
    float _868 = _856;
    float _870 = _868;
    if (!_854)
    {
        _858 = _828;
    }
    float _872 = _858;
    float _874 = _872;
    if (!_854)
    {
        _860 = _852;
    }
    float _876 = _860;
    bool _878 = !_854;
    float _880 = _876;
    if (!_878)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _886 = _846 + _884;
        float _888 = _852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _890 = rsqrt(_842);
        float _892 = _886 * _882;
        float _894 = _892 * 0.15915493667125701904296875;
        float _896 = _894 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = _894 * 6.283185482025146484375;
        float _902 = sin(_900);
        float _904 = _898 + (-1.0);
        float _906 = _904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = fma(_902, _888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _910 = fma(_852, _898, _906);
        float _912 = _890 * _908;
        float _914 = fma(_838, _912, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _916 = fma(_834, _912, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _880 = _910;
        _870 = _914;
        _874 = _916;
        _496 = _894;
        _862 = _908;
    }
    float _918 = _880;
    float _920 = _870;
    float _922 = _874;
    float _924 = _496;
    float _926 = _862;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _918 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _920 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _922 + _936;
    float _940 = _930 * _930;
    float _942 = fma(_934, _934, _940);
    float _944 = fma(_938, _938, _942);
    float _946 = rsqrt(_944);
    float _948 = sqrt(_944);
    float _950 = _934 * _946;
    float _952 = _938 * _946;
    float _954 = _930 * _946;
    float _956 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _960 = _956 * _956;
    float _962 = _958 * _958;
    float _964 = _960 + _962;
    float _966 = sqrt(_964);
    bool _968 = _966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = _966 + _970;
    float _974 = _924;
    float _976 = _964;
    float _978 = _972;
    if (_968)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _980;
    }
    float _982 = _974;
    if (_968)
    {
        float _984 = rsqrt(_964);
        _976 = _984;
    }
    float _986 = _976;
    float _988 = _986;
    if (_968)
    {
        float _990 = _972 * _982;
        _978 = _990;
    }
    float _992 = _978;
    if (_968)
    {
        float _994 = _992 * 0.15915493667125701904296875;
        _864 = _994;
    }
    float _996 = _864;
    float _998 = _834;
    float _1000 = _996;
    if (_968)
    {
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        _998 = _1004;
    }
    float _1006 = _998;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1010 = precise::max(0.0, _1008);
    float _1012 = _926;
    float _1014 = _1010;
    float _1016 = _1008;
    if (_968)
    {
        float _1018 = _996 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        _1012 = _1020;
    }
    float _1022 = _1012;
    float _1024 = -_954;
    float _1026 = -_1010;
    float _1028 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1026);
    float _1030 = _1028;
    if (_968)
    {
        float _1032 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1032;
    }
    float _1034 = _1014;
    float _1036 = _1034;
    if (!_968)
    {
        _1000 = _958;
    }
    float _1038 = _1000;
    float _1040 = _1006;
    float _1042 = _1038;
    if (_968)
    {
        float _1044 = fma(_1006, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    float _1050 = _1022;
    if (_968)
    {
        float _1052 = _1022 + (-1.0);
        _1016 = _1052;
    }
    float _1054 = _1016;
    if (_968)
    {
        float _1056 = _986 * _1046;
        _866 = _1056;
    }
    float _1058 = _866;
    if (!_968)
    {
        _1048 = _956;
    }
    float _1060 = _1048;
    float _1062 = _1060;
    if (_968)
    {
        float _1064 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1064;
    }
    float _1066 = _1036;
    if (_968)
    {
        float _1068 = _956 * _1058;
        _1062 = _1068;
    }
    float _1070 = _1062;
    if (_968)
    {
        float _1072 = _958 * _1058;
        _1042 = _1072;
    }
    float _1074 = _1042;
    if (!_968)
    {
        _988 = _962;
    }
    float _1076 = _988;
    float _1078 = _1076;
    if (_968)
    {
        float _1080 = fma(_1028, _1022, _1066);
        _1030 = _1080;
    }
    float _1082 = _1030;
    if (!_968)
    {
        _1050 = _960;
    }
    float _1084 = _1050;
    float _1086 = _1084;
    if (_968)
    {
        float _1088 = _1070 * _1070;
        _1086 = _1088;
    }
    float _1090 = _1086;
    if (_968)
    {
        float _1092 = _1074 * _1074;
        _1078 = _1092;
    }
    float _1094 = _1078;
    float _1096 = _918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1098 = fma(_1082, _1082, _1090);
    float _1100 = _918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1102 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1096);
    float _1104 = _1098 + _1094;
    float _1106 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1110 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1108);
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    float _1114 = _918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1106);
    float _1118 = rsqrt(_1104);
    float _1120 = -_1112;
    float _1122 = _1120 + 1.0;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1128 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1114);
    float _1130 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1134 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1128);
    float _1136 = abs(_1122);
    float _1138 = log2(_1136);
    float _1140 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1102);
    float _1142 = -_1132;
    float _1144 = fma(_1142, _1124, 1.0);
    float _1146 = _918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1148 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1150 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = _1118 * _1070;
    float _1156 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1146);
    float _1158 = _1118 * _1082;
    float _1160 = floor(_1130);
    float _1162 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1164 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1156);
    float _1166 = _1118 * _1074;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1170 = -_1162;
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1170);
    float _1174 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = floor(_1150);
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1172);
    float _1184 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1168);
    float _1186 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1182, -0.5, 0.5);
    float _1190 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1192 = fma(_1182, 0.5, 0.5);
    float _1194 = -_1160;
    float _1196 = _1130 + _1194;
    float _1198 = log2(_1144);
    float _1200 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1190);
    float _1202 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1204 = fma(_1192, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1202);
    float _1208 = -_1178;
    float _1210 = _1150 + _1208;
    float _1212 = exp2(_1176);
    float _1214 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1216 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = _1158 + 1.0;
    float _1220 = fma(_1192, _1204, -0.212114393711090087890625);
    float _1222 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1214);
    float _1224 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = 1.0 / _1200;
    float _1228 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1230 = _1198 * 0.693147182464599609375;
    float _1232 = sqrt(_1188);
    float _1234 = -_1158;
    float _1236 = fma(_1212, _1218, _1234);
    float2 _3881 = float2(_1196, _1210);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3881, float2(0.0), isnan(_3881)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3881, float2(0.0), isnan(_3881)), level(0.0)).x;
    float _1240 = fma(_1192, _1220, 1.570728778839111328125);
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1244 = _1224 * _1226;
    float _1246 = _1228 * _1226;
    float _1248 = fma(_1236, 0.5, 0.5);
    float _1250 = fma(_1244, 0.5, 0.5);
    float _1252 = fma(_1246, -0.5, 0.5);
    float _1254 = _1232 * 0.636619746685028076171875;
    float _1256 = -_1240;
    float _1258 = fma(_1254, _1256, 1.0);
    float3 _3920 = float3(_1250, _1252, _1242);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).x;
    float3 _3931 = float3(_1250, _1252, _1242);
    float4 _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3931, float3(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3931, float3(0.0), isnan(_3931)), level(0.0)).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float2 _3947 = float2(_1258, _1248);
    float3 _1275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3947, float2(0.0), isnan(_3947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3947, float2(0.0), isnan(_3947)), level(0.0)).xyz;
    float _1277 = _1275.x;
    float _1279 = _1275.y;
    float _1281 = _1275.z;
    float _1283 = _826 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1285 = in.m_61.x;
    float _1287 = _826 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1289 = _390 > 0.5;
    float _1291 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1283);
    float _1293 = in.m_61.z;
    float _1295 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1287);
    float _1297 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1291);
    float _1299 = in.m_61.y;
    float _1301 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1295);
    float _1303 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1305 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = in.m_63.y;
    float _1309 = 1.0 / _1303;
    float _1311 = _1305 + _1303;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1317 = in.m_63.x;
    int _1319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1321 = _1319 != 0;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1327 = _1325 != 0;
    float _1329 = in.m_61.w;
    float _1331 = 1.0 / _1315;
    bool _1333 = _384 > 0.5;
    bool _1335 = _1333 && _1321;
    float _1337 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1285;
    float _1339 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1341 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1343 = _1311 * _1309;
    float _1345 = _1343 * 0.5;
    out.m_65.z = _1293;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    out.m_65.y = _1299;
    float _1353 = exp2(_1339);
    float _1355 = -_1307;
    float _1357 = _1355 + 1.0;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1341);
    out.m_67.x = _920;
    out.m_67.y = _918;
    out.m_67.z = _922;
    float _1365 = _1307;
    float _1367 = _1242;
    float _1369 = _1317;
    float _1371 = _1200;
    float _1373 = _1228;
    if (_1327)
    {
        float _1375 = _1289 ? _1357 : _1307;
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = 1.0 / _1351;
    float _1383 = in.m_69.x;
    float _1385 = in.m_69.y;
    float _1387 = in.m_69.z;
    bool _1389 = _408 != 0.0;
    bool _1391 = isnan(_408);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1363);
    if (_1321)
    {
        _1367 = _1317;
    }
    float _1401 = _1367;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1403;
    bool _1407 = _406 == 0.0;
    bool _1409 = !_1397;
    bool _1411 = _1407 && _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1415 = _376 + _1413;
    out.m_71.x = _1337;
    out.m_71.y = _1379;
    out.m_71.z = _1361;
    float _1417 = _1405 * _1331;
    bool _1419 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1421 = isnan(_376);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1427 = _1423 || _1425;
    float _1429 = float(_1427);
    float _1431 = _1401;
    if (_1335)
    {
        float _1433 = -_1401;
        float _1435 = _1433 + 1.0;
        _1431 = _1435;
    }
    float _1437 = _1431;
    bool _1439 = _410 == 0.0;
    bool _1441 = _1439 && _1411;
    float _1443 = fma(_1417, _1415, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1445 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1447 = isnan(_376);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1459 = _1381 * _1457;
    if (_1321)
    {
        _1369 = _1437;
    }
    float _1461 = _1369;
    out.m_65.w = _1329;
    float _1463 = -_1353;
    float _1465 = _1463 + 1.0;
    float _1467 = abs(_1459);
    float _1469 = log2(_1467);
    float _1471 = -_1429;
    float _1473 = _1471 + 1.0;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1477 = _1455 * _1473;
    float _1479 = -_1455;
    float _1481 = _1479 + 1.0;
    float _1483 = _1385;
    float _1485 = _1383;
    float _1487 = _1387;
    if (!_1441)
    {
        float _1489 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1385);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1495 = _1443 * _1477;
    float _1497 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1441)
    {
        float _1499 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1383);
        _1485 = _1499;
    }
    float _1501 = _1485;
    if (!_1441)
    {
        float _1503 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1387);
        _1487 = _1503;
    }
    float _1505 = _1487;
    float _1507 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1495);
    float _1509 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1511 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1513 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1507);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1519 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1521 = _1497 * _1493;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1527 = exp2(_1511);
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1535 = _1459 <= 8000.0;
    bool _1537 = isnan(_1459);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan(8000.0);
    bool _1543 = _1539 || _1541;
    float _1545 = float(_1543);
    float _1547 = _796 * _1491;
    float _1549 = -_1491;
    float _1551 = _784 * _1549;
    float _1553 = _790 * _1491;
    out.m_73.x = _1529;
    out.m_73.y = _1531;
    out.m_73.z = _1533;
    out.m_73.w = _1519;
    float _1555 = _1509 * _1515;
    float _1557 = fma(_810, _1501, _1547);
    float _1559 = fma(_792, _1501, _1551);
    float _1561 = in.m_75.x;
    float _1563 = fma(_802, _1501, _1553);
    float _1565 = fma(_820, _1505, _1557);
    float _1567 = fma(_794, _1505, _1559);
    float _1569 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    out.m_77.x = _1521;
    out.m_77.y = _1555;
    float _1573 = fma(_808, _1505, _1563);
    bool _1575 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1577 = isnan(_948);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1583 = _1579 || _1581;
    float _1585 = fma(_1571, -2.0, 3.0);
    float _1587 = _1571 * _1571;
    float _1589 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1399);
    out.m_79.x = _1567;
    out.m_79.y = _1565;
    out.m_79.z = _1573;
    float _1591 = _1587 * _1585;
    float _1593 = _1589 + _1200;
    float _1595 = -_1591;
    float _1597 = _1595 + 1.0;
    float _1599 = _1593 * 0.5;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1591);
    float _1603 = _1545 * _1601;
    out.m_81.z = _1599;
    out.m_81.w = _1200;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1589;
    out.gl_Position.w = _1200;
    float _1607 = _1200;
    float _1609 = _1599;
    float _1611 = _1589;
    if (!_1583)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1613 = _1607;
    float _1615 = _1613;
    float _1617 = _1613;
    if (!_1583)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1619 = _1609;
    float _1621 = -_1475;
    float _1623 = _1621 + 1.0;
    float _1625 = _1623;
    float _1627 = _1619;
    float _1629 = _1619;
    if (!_1583)
    {
        _1371 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1631 = _1371;
    float _1633 = _1631;
    float _1635 = _1631;
    if (!_1583)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1637 = _1611;
    float _1639 = _1637;
    float _1641 = _1637;
    if (!_1583)
    {
        _1373 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1643 = _1373;
    float _1645 = -_1238;
    float _1647 = _1645 + 1.0;
    float _1649 = _1647 * _1605;
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = -_1651;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1657 = _1655 * _1561;
    float _1659 = _1657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1661 = _1475 * _1260;
    float _1663 = _1271 * _1623;
    out.m_83.x = _1659;
    float _1665 = _1643;
    float _1667 = _1643;
    if (!_1583)
    {
        _1625 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1669 = _1625;
    float _1671 = _1271 * _1661;
    float _1673 = _1281 * _1661;
    float _1675 = fma(_1277, _1671, _1265);
    float _1677 = fma(_1279, _1671, _1267);
    float _1679 = fma(_1271, _1673, _1269);
    out.m_85.x = _1675;
    out.m_85.y = _1677;
    out.m_85.z = _1679;
    out.m_85.w = _1663;
    bool _1681 = !_1583;
    float _1683 = _1669;
    float _1685 = _1669;
    if (!_1681)
    {
        bool _1687 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1689 = isnan(_948);
        bool _1691 = _1687 || _1689;
        bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1695 = _1691 || _1693;
        if (!_1695)
        {
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1699 = _948 + _1697;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1703 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1701;
            float _1705 = 1.0 / _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1727 = _1699 * _1705;
            float _1729 = precise::clamp(_1727, 0.0, 1.0);
            float _1731 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1735 = fma(_1729, _1709, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1737 = fma(_1729, _1733, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1739 = fma(_1729, _1713, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1741 = fma(_1729, _1717, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1743 = fma(_1729, _1721, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1745 = fma(_1729, _1725, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1629 = _1737;
            _1667 = _1743;
            _1617 = _1735;
            _1641 = _1741;
            _1635 = _1739;
            _1685 = _1745;
            _1747 = true;
        }
        else
        {
            bool _1749 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1751 = isnan(_948);
            bool _1753 = _1749 || _1751;
            bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1757 = _1753 || _1755;
            if (!_1757)
            {
                _1615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1759 = _1615;
            _1617 = _1759;
            if (!_1757)
            {
                _1627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1761 = _1627;
            _1629 = _1761;
            if (!_1757)
            {
                _1633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1763 = _1633;
            _1635 = _1763;
            if (!_1757)
            {
                _1639 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1765 = _1639;
            _1641 = _1765;
            if (!_1757)
            {
                _1665 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1767 = _1665;
            _1667 = _1767;
            if (!_1757)
            {
                _1683 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1769 = _1683;
            bool _1771 = !_1757;
            _1685 = _1769;
            if (!_1771)
            {
                bool _1773 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1775 = isnan(_948);
                bool _1777 = _1773 || _1775;
                bool _1779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1781 = _1777 || _1779;
                if (!_1781)
                {
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1785 = _948 + _1783;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1787;
                    float _1791 = 1.0 / _1789;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1813 = _1785 * _1791;
                    float _1815 = precise::clamp(_1813, 0.0, 1.0);
                    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1821 = fma(_1815, _1795, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1823 = fma(_1815, _1819, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1825 = fma(_1815, _1799, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1827 = fma(_1815, _1803, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1829 = fma(_1815, _1807, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1831 = fma(_1815, _1811, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1629 = _1823;
                    _1667 = _1829;
                    _1617 = _1821;
                    _1641 = _1827;
                    _1635 = _1825;
                    _1685 = _1831;
                    _1747 = true;
                }
                else
                {
                    _1629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1667 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1641 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1685 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1747 = false;
    float _1833 = _1629;
    float _1835 = _1667;
    float _1837 = _1617;
    float _1839 = _1641;
    float _1841 = _1635;
    float _1843 = _1685;
    float _1845 = fma(_1565, -0.5, 0.5);
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = -_1833;
    float _1851 = _1849 + _1835;
    float _1853 = -_1837;
    float _1855 = _1853 + _1839;
    float _1857 = -_1841;
    float _1859 = _1857 + _1843;
    bool _1861 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1863 = fma(_1847, _1851, _1833);
    float _1865 = fma(_1847, _1855, _1837);
    float _1867 = fma(_1847, _1859, _1841);
    float _1869 = _1863 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _1871 = fma(_1865, 0.298911988735198974609375, _1869);
    float _1873 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1875 = fma(_1867, 0.114477999508380889892578125, _1871);
    out.m_83.w = _1873;
    float _1877 = -_1875;
    float _1879 = _1865 + _1877;
    float _1881 = -_1875;
    float _1883 = _1863 + _1881;
    float _1885 = -_1875;
    float _1887 = _1867 + _1885;
    out.m_87.x = 0.0;
    float _1889 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1893 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    out.m_89.x = 0.0;
    out.m_91.x = _1889;
    out.m_91.y = _1891;
    out.m_91.z = _1893;
    if (!_1861)
    {
        return out;
    }
    float _1895 = -_918;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1899 = -_920;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1903 = -_922;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1907 = _1897 * _1897;
    float _1909 = fma(_1901, _1901, _1907);
    float _1911 = fma(_1905, _1905, _1909);
    float _1913 = rsqrt(_1911);
    float _1915 = _1897 * _1913;
    float _1917 = _1901 * _1913;
    float _1919 = _1905 * _1913;
    float _1921 = sqrt(_1911);
    float _1923 = -_954;
    float _1925 = _1923 + _1915;
    float _1927 = -_950;
    float _1929 = _1927 + _1917;
    float _1931 = -_952;
    float _1933 = _1931 + _1919;
    float _1935 = _1925 * _1925;
    float _1937 = fma(_1929, _1929, _1935);
    float _1939 = fma(_1933, _1933, _1937);
    float _1941 = -_1921;
    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1945 = rsqrt(_1939);
    float _1947 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1949 = precise::clamp(_1947, 0.0, 1.0);
    float _1951 = abs(_1949);
    float _1953 = log2(_1951);
    float _1955 = _1925 * _1945;
    float _1957 = _1929 * _1945;
    float _1959 = _1933 * _1945;
    float _1961 = _1565 * _1955;
    float _1963 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = _1565 * _1915;
    float _1969 = fma(_1567, _1957, _1961);
    float _1971 = _1965 * _1965;
    float _1973 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1975 = fma(_1567, _1917, _1967);
    float _1977 = fma(_1573, _1959, _1969);
    float _1979 = precise::clamp(_1977, 0.0, 1.0);
    float _1981 = _1971 + (-1.0);
    float _1983 = fma(_1573, _1919, _1975);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = _1979 * _1979;
    float _1989 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1991 = exp2(_1973);
    float _1993 = fma(_1987, _1981, 1.0);
    float _1995 = -_1915;
    float _1997 = -_1989;
    float _1999 = fma(_1995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1997);
    float _2001 = _1993 * _1993;
    float _2003 = -_1919;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1999);
    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2009 = _2005 + _2007;
    float _2011 = 1.0 / _2001;
    float _2013 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2015 = precise::clamp(_2013, 0.0, 1.0);
    float _2017 = _1991 * _2015;
    float _2019 = _1985 * _2017;
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2023 = _1971 * _2011;
    float _2025 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2027 = _2019 * _2023;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2031 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2021;
    out.m_87.y = _2025;
    out.m_87.z = _2029;
    out.m_89.x = _2031;
    out.m_89.y = _2033;
    out.m_89.z = _2035;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1747 = false;
    bool _368 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2091 = as_type<float>(_126);
        out.gl_Position.z = _2091;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_110);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_49.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2161 = as_type<float>(_164);
        out.gl_Position.z = _2161;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _142 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _196 + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _240 = isnan(_196);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_212;
    float _252 = _250 + 1.0;
    float _254 = 1.0 / _236;
    float _256 = _248 * _252;
    float _258 = -_248;
    float _260 = _258 + 1.0;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = 1.0 / _232;
    float _270 = _228 * _260;
    float _272 = -_228;
    float _274 = _272 + 1.0;
    float _276 = _216 * _254;
    float _278 = _200 * _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    float _288 = fma(_264, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _290 = fma(_282, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _292 = fma(_286, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = in.m_55.x;
    float _296 = in.m_55.y;
    float _298 = in.m_55.z;
    float _300 = _288 * _270;
    float _302 = _290 * _270;
    float _304 = _292 * _270;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].x, _300);
    float _320 = fma(_308, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_312, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _324 = fma(_316, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _326 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _328 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[143].z, _304);
    float _330 = fma(_320, _256, _318);
    float _332 = fma(_322, _256, _326);
    float _334 = fma(_324, _256, _328);
    float _336 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _330);
    float _338 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _332);
    float _340 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _334);
    float _342 = _336 * _294;
    float _344 = _338 * _296;
    float _346 = _340 * _298;
    bool _348 = !_266;
    float _366;
    if (!_348)
    {
        float _350 = in.m_53.x;
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _350 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_110);
        float _372 = 1.0 / _370;
        float _374 = _142 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_53.z;
    float _380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _382 = log2(_380);
    float _384 = in.m_53.x;
    float _386 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _390 = in.m_53.y;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _412);
    float _416 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _418 = _382 * _142;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _416);
    float _422 = _378 * 2.0;
    float _424 = _384 * 2.0;
    float _426 = floor(_422);
    float _428 = _390 * 2.0;
    float _430 = _390 + _378;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _406);
    float _434 = _430 + (-1.0);
    float _436 = floor(_424);
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _414);
    float _440 = _386 * _432;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _444 = _384 + _390;
    float _446 = floor(_428);
    bool _448 = _426 > 0.0;
    float _450 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _452 = _426 >= 0.0;
    bool _454 = isnan(_426);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = _444 + (-1.0);
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _450);
    int _466 = _460 ? 0 : 1;
    float _468 = exp2(_418);
    bool _470 = _436 > 0.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _474 = 1.0 + _472;
    int _476 = ~_466;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    float _482 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _484 = _436 >= 0.0;
    bool _486 = isnan(_436);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    int _494 = _480;
    float _496 = _440;
    if (!_448)
    {
        int _498 = ~_466;
        int _500 = _498 + 1;
        _494 = _500;
    }
    int _502 = _494;
    float _504 = 1.0 / _474;
    float _506 = in.m_59.x;
    float _508 = in.m_59.y;
    float _510 = in.m_59.z;
    bool _512 = _446 > 0.0;
    bool _514 = _446 >= 0.0;
    bool _516 = isnan(_446);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    bool _524 = !_394;
    int _526 = _524 ? 0 : 1;
    float _528 = float(_502);
    float _530 = -_468;
    float _532 = _530 + 1.0;
    int _534 = abs(_526);
    float _536 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _464);
    bool _538 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = float(_534);
    int _550 = _492 ? 0 : 1;
    float _552 = sqrt(_536);
    bool _554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _562 = _558 || _560;
    float _564 = _548 * _528;
    int _566 = ~_550;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    bool _572 = !_398;
    int _574 = _572 ? 0 : 1;
    int _576 = _570;
    if (!_470)
    {
        int _578 = ~_550;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 * (-2.0);
    float _586 = _562 ? _532 : 0.0;
    int _588 = _522 ? 0 : 1;
    float _590 = fma(_482, _584, _482);
    int _592 = abs(_574);
    if (_546)
    {
        float _594 = _586 * _504;
        _144 = _594;
    }
    float _596 = _144;
    float _598 = fma(_584, _506, _506);
    int _600 = ~_588;
    int _602 = _600 + 1;
    int _604 = _602 + 1;
    float _606 = sqrt(_438);
    float _608 = _384 + (-0.5);
    int _610 = _604;
    if (!_512)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    bool _618 = !_402;
    int _620 = _618 ? 0 : 1;
    float _622 = float(_616);
    float _624 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[196].x, _598);
    float _626 = float(_592);
    float _628 = in.m_46.x;
    float _630 = in.m_46.y;
    float _632 = in.m_46.z;
    float _634 = float(_582);
    float _636 = fma(_590, _596, _624);
    int _638 = abs(_620);
    float _640 = _626 * _634;
    float _642 = float(_638);
    float _644 = _384 + _378;
    float _646 = _378 + (-0.5);
    float _648 = _640 * (-2.0);
    float _650 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _420);
    float _652 = _642 * _622;
    float _654 = _390 + (-0.5);
    float _656 = _644 + (-1.0);
    float _658 = fma(_648, _508, _508);
    float _660 = _652 * (-2.0);
    float _662 = fma(_442, _648, _442);
    float _664 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _658);
    float _668 = fma(_660, _510, _510);
    float _670 = sqrt(_650);
    float _672 = fma(_664, _660, _664);
    float _674 = fma(_662, _596, _666);
    float _676 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _668);
    float _678 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _680 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _682 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _684 = _630 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _686 = fma(_672, _596, _676);
    float _688 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].x, _678);
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].z, _680);
    float _692 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].y, _682);
    float _694 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[14].w, _684);
    float _696 = _636 * 0.15915493667125701904296875;
    float _698 = _674 * 0.15915493667125701904296875;
    float _700 = _686 * 0.15915493667125701904296875;
    float _702 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].x, _688);
    float _704 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].z, _690);
    float _706 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].y, _692);
    float _708 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[16].w, _694);
    float _710 = _696 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = _702 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _716 = _706 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _718 = _704 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _408);
    float _722 = _606 * _714;
    float _724 = _670 * _716;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _410);
    float _728 = _696 * 6.283185482025146484375;
    float _730 = cos(_728);
    float _732 = _552 * _718;
    float _734 = _724 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _736 = _724 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _738 = _388 * _720;
    float _740 = _404 * _726;
    float _742 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _734);
    float _744 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _736);
    float _746 = _698 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = _708 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[26].z, _742);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[24].z, _744);
    float _756 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].w, _752);
    float _758 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].w, _754);
    float _760 = _698 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _756 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _768 = _724 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _770 = _700 * 6.283185482025146484375;
    float _772 = cos(_770);
    float _774 = _730 * _748;
    float _776 = _712 * _748;
    float _778 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _768);
    float _780 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[25].z, _778);
    float _782 = _700 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _712 * _762;
    float _788 = _730 * _762;
    float _790 = _712 * _772;
    float _792 = _762 * _772;
    float _794 = _748 * _772;
    float _796 = _730 * _772;
    float _798 = _790 * _738;
    float _800 = -_774;
    float _802 = fma(_784, _786, _800);
    float _804 = -_738;
    float _806 = _784 * _804;
    float _808 = fma(_784, _776, _788);
    float _810 = fma(_784, _788, _776);
    float _812 = fma(_802, _440, _798);
    float _814 = fma(_792, _440, _806);
    float _816 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].w, _780);
    float _818 = -_786;
    float _820 = fma(_784, _774, _818);
    float _822 = fma(_808, _740, _812);
    float _824 = fma(_794, _740, _814);
    float _826 = _816 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _828 = _764 + _822;
    float _830 = _766 + _824;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _828 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _838 = _830 + _836;
    float _840 = _834 * _834;
    float _842 = fma(_838, _838, _840);
    float _844 = _796 * _738;
    float _846 = sqrt(_842);
    float _848 = fma(_810, _440, _844);
    float _850 = fma(_820, _740, _848);
    float _852 = _826 + _850;
    bool _854 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _856 = _850;
    float _858 = _750;
    float _860 = _772;
    float _862 = _768;
    float _864 = _780;
    float _866 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    if (!_854)
    {
        _856 = _830;
    }
    float _868 = _856;
    float _870 = _868;
    if (!_854)
    {
        _858 = _828;
    }
    float _872 = _858;
    float _874 = _872;
    if (!_854)
    {
        _860 = _852;
    }
    float _876 = _860;
    bool _878 = !_854;
    float _880 = _876;
    if (!_878)
    {
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _886 = _846 + _884;
        float _888 = _852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _890 = rsqrt(_842);
        float _892 = _886 * _882;
        float _894 = _892 * 0.15915493667125701904296875;
        float _896 = _894 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = _894 * 6.283185482025146484375;
        float _902 = sin(_900);
        float _904 = _898 + (-1.0);
        float _906 = _904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = fma(_902, _888, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _910 = fma(_852, _898, _906);
        float _912 = _890 * _908;
        float _914 = fma(_838, _912, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _916 = fma(_834, _912, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _880 = _910;
        _870 = _914;
        _874 = _916;
        _496 = _894;
        _862 = _908;
    }
    float _918 = _880;
    float _920 = _870;
    float _922 = _874;
    float _924 = _496;
    float _926 = _862;
    float _928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = _918 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = _920 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = _922 + _936;
    float _940 = _930 * _930;
    float _942 = fma(_934, _934, _940);
    float _944 = fma(_938, _938, _942);
    float _946 = rsqrt(_944);
    float _948 = sqrt(_944);
    float _950 = _934 * _946;
    float _952 = _938 * _946;
    float _954 = _930 * _946;
    float _956 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _960 = _956 * _956;
    float _962 = _958 * _958;
    float _964 = _960 + _962;
    float _966 = sqrt(_964);
    bool _968 = _966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = _966 + _970;
    float _974 = _924;
    float _976 = _964;
    float _978 = _972;
    if (_968)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _980;
    }
    float _982 = _974;
    if (_968)
    {
        float _984 = rsqrt(_964);
        _976 = _984;
    }
    float _986 = _976;
    float _988 = _986;
    if (_968)
    {
        float _990 = _972 * _982;
        _978 = _990;
    }
    float _992 = _978;
    if (_968)
    {
        float _994 = _992 * 0.15915493667125701904296875;
        _864 = _994;
    }
    float _996 = _864;
    float _998 = _834;
    float _1000 = _996;
    if (_968)
    {
        float _1002 = _996 * 6.283185482025146484375;
        float _1004 = sin(_1002);
        _998 = _1004;
    }
    float _1006 = _998;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1010 = precise::max(0.0, _1008);
    float _1012 = _926;
    float _1014 = _1010;
    float _1016 = _1008;
    if (_968)
    {
        float _1018 = _996 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        _1012 = _1020;
    }
    float _1022 = _1012;
    float _1024 = -_954;
    float _1026 = -_1010;
    float _1028 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1026);
    float _1030 = _1028;
    if (_968)
    {
        float _1032 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1014 = _1032;
    }
    float _1034 = _1014;
    float _1036 = _1034;
    if (!_968)
    {
        _1000 = _958;
    }
    float _1038 = _1000;
    float _1040 = _1006;
    float _1042 = _1038;
    if (_968)
    {
        float _1044 = fma(_1006, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    float _1050 = _1022;
    if (_968)
    {
        float _1052 = _1022 + (-1.0);
        _1016 = _1052;
    }
    float _1054 = _1016;
    if (_968)
    {
        float _1056 = _986 * _1046;
        _866 = _1056;
    }
    float _1058 = _866;
    if (!_968)
    {
        _1048 = _956;
    }
    float _1060 = _1048;
    float _1062 = _1060;
    if (_968)
    {
        float _1064 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1064;
    }
    float _1066 = _1036;
    if (_968)
    {
        float _1068 = _956 * _1058;
        _1062 = _1068;
    }
    float _1070 = _1062;
    if (_968)
    {
        float _1072 = _958 * _1058;
        _1042 = _1072;
    }
    float _1074 = _1042;
    if (!_968)
    {
        _988 = _962;
    }
    float _1076 = _988;
    float _1078 = _1076;
    if (_968)
    {
        float _1080 = fma(_1028, _1022, _1066);
        _1030 = _1080;
    }
    float _1082 = _1030;
    if (!_968)
    {
        _1050 = _960;
    }
    float _1084 = _1050;
    float _1086 = _1084;
    if (_968)
    {
        float _1088 = _1070 * _1070;
        _1086 = _1088;
    }
    float _1090 = _1086;
    if (_968)
    {
        float _1092 = _1074 * _1074;
        _1078 = _1092;
    }
    float _1094 = _1078;
    float _1096 = _918 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1098 = fma(_1082, _1082, _1090);
    float _1100 = _918 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1102 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1096);
    float _1104 = _1098 + _1094;
    float _1106 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1110 = fma(_948, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1108);
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    float _1114 = _918 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1116 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1106);
    float _1118 = rsqrt(_1104);
    float _1120 = -_1112;
    float _1122 = _1120 + 1.0;
    float _1124 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1128 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1114);
    float _1130 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1134 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1128);
    float _1136 = abs(_1122);
    float _1138 = log2(_1136);
    float _1140 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1102);
    float _1142 = -_1132;
    float _1144 = fma(_1142, _1124, 1.0);
    float _1146 = _918 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1148 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1150 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1152 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = _1118 * _1070;
    float _1156 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1146);
    float _1158 = _1118 * _1082;
    float _1160 = floor(_1130);
    float _1162 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1164 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1156);
    float _1166 = _1118 * _1074;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1170 = -_1162;
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1170);
    float _1174 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = floor(_1150);
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1172);
    float _1184 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1168);
    float _1186 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1182, -0.5, 0.5);
    float _1190 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1192 = fma(_1182, 0.5, 0.5);
    float _1194 = -_1160;
    float _1196 = _1130 + _1194;
    float _1198 = log2(_1144);
    float _1200 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1190);
    float _1202 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1204 = fma(_1192, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1202);
    float _1208 = -_1178;
    float _1210 = _1150 + _1208;
    float _1212 = exp2(_1176);
    float _1214 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1216 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1218 = _1158 + 1.0;
    float _1220 = fma(_1192, _1204, -0.212114393711090087890625);
    float _1222 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1214);
    float _1224 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1216);
    float _1226 = 1.0 / _1200;
    float _1228 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1222);
    float _1230 = _1198 * 0.693147182464599609375;
    float _1232 = sqrt(_1188);
    float _1234 = -_1158;
    float _1236 = fma(_1212, _1218, _1234);
    float2 _3881 = float2(_1196, _1210);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3881, float2(0.0), isnan(_3881)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3881, float2(0.0), isnan(_3881)), level(0.0)).x;
    float _1240 = fma(_1192, _1220, 1.570728778839111328125);
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1244 = _1224 * _1226;
    float _1246 = _1228 * _1226;
    float _1248 = fma(_1236, 0.5, 0.5);
    float _1250 = fma(_1244, 0.5, 0.5);
    float _1252 = fma(_1246, -0.5, 0.5);
    float _1254 = _1232 * 0.636619746685028076171875;
    float _1256 = -_1240;
    float _1258 = fma(_1254, _1256, 1.0);
    float3 _3920 = float3(_1250, _1252, _1242);
    float _1260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).x;
    float3 _3931 = float3(_1250, _1252, _1242);
    float4 _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3931, float3(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3931, float3(0.0), isnan(_3931)), level(0.0)).xyzw;
    float _1265 = _1263.x;
    float _1267 = _1263.y;
    float _1269 = _1263.z;
    float _1271 = _1263.w;
    float2 _3947 = float2(_1258, _1248);
    float3 _1275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3947, float2(0.0), isnan(_3947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3947, float2(0.0), isnan(_3947)), level(0.0)).xyz;
    float _1277 = _1275.x;
    float _1279 = _1275.y;
    float _1281 = _1275.z;
    float _1283 = _826 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1285 = in.m_61.x;
    float _1287 = _826 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1289 = _390 > 0.5;
    float _1291 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1283);
    float _1293 = in.m_61.z;
    float _1295 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1287);
    float _1297 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1291);
    float _1299 = in.m_61.y;
    float _1301 = fma(_764, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1295);
    float _1303 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1305 = _1301 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = in.m_63.y;
    float _1309 = 1.0 / _1303;
    float _1311 = _1305 + _1303;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1317 = in.m_63.x;
    int _1319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1321 = _1319 != 0;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1327 = _1325 != 0;
    float _1329 = in.m_61.w;
    float _1331 = 1.0 / _1315;
    bool _1333 = _384 > 0.5;
    bool _1335 = _1333 && _1321;
    float _1337 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1285;
    float _1339 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1341 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1343 = _1311 * _1309;
    float _1345 = _1343 * 0.5;
    out.m_65.z = _1293;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1351 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1349);
    out.m_65.y = _1299;
    float _1353 = exp2(_1339);
    float _1355 = -_1307;
    float _1357 = _1355 + 1.0;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = fma(_1174, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1341);
    out.m_67.x = _920;
    out.m_67.y = _918;
    out.m_67.z = _922;
    float _1365 = _1307;
    float _1367 = _1242;
    float _1369 = _1317;
    float _1371 = _1200;
    float _1373 = _1228;
    if (_1327)
    {
        float _1375 = _1289 ? _1357 : _1307;
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = 1.0 / _1351;
    float _1383 = in.m_69.x;
    float _1385 = in.m_69.y;
    float _1387 = in.m_69.z;
    bool _1389 = _408 != 0.0;
    bool _1391 = isnan(_408);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1363);
    if (_1321)
    {
        _1367 = _1317;
    }
    float _1401 = _1367;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1403;
    bool _1407 = _406 == 0.0;
    bool _1409 = !_1397;
    bool _1411 = _1407 && _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1415 = _376 + _1413;
    out.m_71.x = _1337;
    out.m_71.y = _1379;
    out.m_71.z = _1361;
    float _1417 = _1405 * _1331;
    bool _1419 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1421 = isnan(_376);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1427 = _1423 || _1425;
    float _1429 = float(_1427);
    float _1431 = _1401;
    if (_1335)
    {
        float _1433 = -_1401;
        float _1435 = _1433 + 1.0;
        _1431 = _1435;
    }
    float _1437 = _1431;
    bool _1439 = _410 == 0.0;
    bool _1441 = _1439 && _1411;
    float _1443 = fma(_1417, _1415, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1445 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1447 = isnan(_376);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1459 = _1381 * _1457;
    if (_1321)
    {
        _1369 = _1437;
    }
    float _1461 = _1369;
    out.m_65.w = _1329;
    float _1463 = -_1353;
    float _1465 = _1463 + 1.0;
    float _1467 = abs(_1459);
    float _1469 = log2(_1467);
    float _1471 = -_1429;
    float _1473 = _1471 + 1.0;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1477 = _1455 * _1473;
    float _1479 = -_1455;
    float _1481 = _1479 + 1.0;
    float _1483 = _1385;
    float _1485 = _1383;
    float _1487 = _1387;
    if (!_1441)
    {
        float _1489 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1385);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1495 = _1443 * _1477;
    float _1497 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1441)
    {
        float _1499 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1383);
        _1485 = _1499;
    }
    float _1501 = _1485;
    if (!_1441)
    {
        float _1503 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1387);
        _1487 = _1503;
    }
    float _1505 = _1487;
    float _1507 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1495);
    float _1509 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1511 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1513 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1507);
    float _1515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1519 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1521 = _1497 * _1493;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1527 = exp2(_1511);
    float _1529 = _1517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1535 = _1459 <= 8000.0;
    bool _1537 = isnan(_1459);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan(8000.0);
    bool _1543 = _1539 || _1541;
    float _1545 = float(_1543);
    float _1547 = _796 * _1491;
    float _1549 = -_1491;
    float _1551 = _784 * _1549;
    float _1553 = _790 * _1491;
    out.m_73.x = _1529;
    out.m_73.y = _1531;
    out.m_73.z = _1533;
    out.m_73.w = _1519;
    float _1555 = _1509 * _1515;
    float _1557 = fma(_810, _1501, _1547);
    float _1559 = fma(_792, _1501, _1551);
    float _1561 = in.m_75.x;
    float _1563 = fma(_802, _1501, _1553);
    float _1565 = fma(_820, _1505, _1557);
    float _1567 = fma(_794, _1505, _1559);
    float _1569 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1571 = precise::clamp(_1569, 0.0, 1.0);
    out.m_77.x = _1521;
    out.m_77.y = _1555;
    float _1573 = fma(_808, _1505, _1563);
    bool _1575 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1577 = isnan(_948);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1583 = _1579 || _1581;
    float _1585 = fma(_1571, -2.0, 3.0);
    float _1587 = _1571 * _1571;
    float _1589 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1399);
    out.m_79.x = _1567;
    out.m_79.y = _1565;
    out.m_79.z = _1573;
    float _1591 = _1587 * _1585;
    float _1593 = _1589 + _1200;
    float _1595 = -_1591;
    float _1597 = _1595 + 1.0;
    float _1599 = _1593 * 0.5;
    float _1601 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1591);
    float _1603 = _1545 * _1601;
    out.m_81.z = _1599;
    out.m_81.w = _1200;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1224;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1589;
    out.gl_Position.w = _1200;
    float _1607 = _1200;
    float _1609 = _1599;
    float _1611 = _1589;
    if (!_1583)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1613 = _1607;
    float _1615 = _1613;
    float _1617 = _1613;
    if (!_1583)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1619 = _1609;
    float _1621 = -_1475;
    float _1623 = _1621 + 1.0;
    float _1625 = _1623;
    float _1627 = _1619;
    float _1629 = _1619;
    if (!_1583)
    {
        _1371 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1631 = _1371;
    float _1633 = _1631;
    float _1635 = _1631;
    if (!_1583)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1637 = _1611;
    float _1639 = _1637;
    float _1641 = _1637;
    if (!_1583)
    {
        _1373 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1643 = _1373;
    float _1645 = -_1238;
    float _1647 = _1645 + 1.0;
    float _1649 = _1647 * _1605;
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = -_1651;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1657 = _1655 * _1561;
    float _1659 = _1657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1661 = _1475 * _1260;
    float _1663 = _1271 * _1623;
    out.m_83.x = _1659;
    float _1665 = _1643;
    float _1667 = _1643;
    if (!_1583)
    {
        _1625 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1669 = _1625;
    float _1671 = _1271 * _1661;
    float _1673 = _1281 * _1661;
    float _1675 = fma(_1277, _1671, _1265);
    float _1677 = fma(_1279, _1671, _1267);
    float _1679 = fma(_1271, _1673, _1269);
    out.m_85.x = _1675;
    out.m_85.y = _1677;
    out.m_85.z = _1679;
    out.m_85.w = _1663;
    bool _1681 = !_1583;
    float _1683 = _1669;
    float _1685 = _1669;
    if (!_1681)
    {
        bool _1687 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1689 = isnan(_948);
        bool _1691 = _1687 || _1689;
        bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1695 = _1691 || _1693;
        if (!_1695)
        {
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1699 = _948 + _1697;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1703 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1701;
            float _1705 = 1.0 / _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1727 = _1699 * _1705;
            float _1729 = precise::clamp(_1727, 0.0, 1.0);
            float _1731 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1735 = fma(_1729, _1709, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1737 = fma(_1729, _1733, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1739 = fma(_1729, _1713, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1741 = fma(_1729, _1717, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1743 = fma(_1729, _1721, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1745 = fma(_1729, _1725, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1629 = _1737;
            _1667 = _1743;
            _1617 = _1735;
            _1641 = _1741;
            _1635 = _1739;
            _1685 = _1745;
            _1747 = true;
        }
        else
        {
            bool _1749 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1751 = isnan(_948);
            bool _1753 = _1749 || _1751;
            bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1757 = _1753 || _1755;
            if (!_1757)
            {
                _1615 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1759 = _1615;
            _1617 = _1759;
            if (!_1757)
            {
                _1627 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1761 = _1627;
            _1629 = _1761;
            if (!_1757)
            {
                _1633 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1763 = _1633;
            _1635 = _1763;
            if (!_1757)
            {
                _1639 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1765 = _1639;
            _1641 = _1765;
            if (!_1757)
            {
                _1665 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1767 = _1665;
            _1667 = _1767;
            if (!_1757)
            {
                _1683 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1769 = _1683;
            bool _1771 = !_1757;
            _1685 = _1769;
            if (!_1771)
            {
                bool _1773 = _948 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1775 = isnan(_948);
                bool _1777 = _1773 || _1775;
                bool _1779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1781 = _1777 || _1779;
                if (!_1781)
                {
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1785 = _948 + _1783;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1789 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1787;
                    float _1791 = 1.0 / _1789;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1801 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1813 = _1785 * _1791;
                    float _1815 = precise::clamp(_1813, 0.0, 1.0);
                    float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1821 = fma(_1815, _1795, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1823 = fma(_1815, _1819, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1825 = fma(_1815, _1799, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1827 = fma(_1815, _1803, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1829 = fma(_1815, _1807, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1831 = fma(_1815, _1811, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1629 = _1823;
                    _1667 = _1829;
                    _1617 = _1821;
                    _1641 = _1827;
                    _1635 = _1825;
                    _1685 = _1831;
                    _1747 = true;
                }
                else
                {
                    _1629 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1667 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1617 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1641 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1635 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1685 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1747 = false;
    float _1833 = _1629;
    float _1835 = _1667;
    float _1837 = _1617;
    float _1839 = _1641;
    float _1841 = _1635;
    float _1843 = _1685;
    float _1845 = fma(_1565, -0.5, 0.5);
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = -_1833;
    float _1851 = _1849 + _1835;
    float _1853 = -_1837;
    float _1855 = _1853 + _1839;
    float _1857 = -_1841;
    float _1859 = _1857 + _1843;
    bool _1861 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1863 = fma(_1847, _1851, _1833);
    float _1865 = fma(_1847, _1855, _1837);
    float _1867 = fma(_1847, _1859, _1841);
    float _1869 = _1863 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _1871 = fma(_1865, 0.298911988735198974609375, _1869);
    float _1873 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1875 = fma(_1867, 0.114477999508380889892578125, _1871);
    out.m_83.w = _1873;
    float _1877 = -_1875;
    float _1879 = _1865 + _1877;
    float _1881 = -_1875;
    float _1883 = _1863 + _1881;
    float _1885 = -_1875;
    float _1887 = _1867 + _1885;
    out.m_87.x = 0.0;
    float _1889 = fma(_1879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1891 = fma(_1883, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    float _1893 = fma(_1887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1875);
    out.m_89.x = 0.0;
    out.m_91.x = _1889;
    out.m_91.y = _1891;
    out.m_91.z = _1893;
    if (!_1861)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1895 = -_918;
    float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1899 = -_920;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1903 = -_922;
    float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1907 = _1897 * _1897;
    float _1909 = fma(_1901, _1901, _1907);
    float _1911 = fma(_1905, _1905, _1909);
    float _1913 = rsqrt(_1911);
    float _1915 = _1897 * _1913;
    float _1917 = _1901 * _1913;
    float _1919 = _1905 * _1913;
    float _1921 = sqrt(_1911);
    float _1923 = -_954;
    float _1925 = _1923 + _1915;
    float _1927 = -_950;
    float _1929 = _1927 + _1917;
    float _1931 = -_952;
    float _1933 = _1931 + _1919;
    float _1935 = _1925 * _1925;
    float _1937 = fma(_1929, _1929, _1935);
    float _1939 = fma(_1933, _1933, _1937);
    float _1941 = -_1921;
    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1945 = rsqrt(_1939);
    float _1947 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1949 = precise::clamp(_1947, 0.0, 1.0);
    float _1951 = abs(_1949);
    float _1953 = log2(_1951);
    float _1955 = _1925 * _1945;
    float _1957 = _1929 * _1945;
    float _1959 = _1933 * _1945;
    float _1961 = _1565 * _1955;
    float _1963 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = _1565 * _1915;
    float _1969 = fma(_1567, _1957, _1961);
    float _1971 = _1965 * _1965;
    float _1973 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1975 = fma(_1567, _1917, _1967);
    float _1977 = fma(_1573, _1959, _1969);
    float _1979 = precise::clamp(_1977, 0.0, 1.0);
    float _1981 = _1971 + (-1.0);
    float _1983 = fma(_1573, _1919, _1975);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = _1979 * _1979;
    float _1989 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1991 = exp2(_1973);
    float _1993 = fma(_1987, _1981, 1.0);
    float _1995 = -_1915;
    float _1997 = -_1989;
    float _1999 = fma(_1995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1997);
    float _2001 = _1993 * _1993;
    float _2003 = -_1919;
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1999);
    float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2009 = _2005 + _2007;
    float _2011 = 1.0 / _2001;
    float _2013 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2015 = precise::clamp(_2013, 0.0, 1.0);
    float _2017 = _1991 * _2015;
    float _2019 = _1985 * _2017;
    float _2021 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2023 = _1971 * _2011;
    float _2025 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2027 = _2019 * _2023;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2031 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2033 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2021;
    out.m_87.y = _2025;
    out.m_87.z = _2029;
    out.m_89.x = _2031;
    out.m_89.y = _2033;
    out.m_89.z = _2035;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

