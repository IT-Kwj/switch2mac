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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
    float4 m_65 [[attribute(13)]];
    float4 m_69 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _468 = false;
    bool _344 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2426 = as_type<float>(_118);
        out.gl_Position.z = _2426;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    float _140 = _136;
    if (_132)
    {
        float _142 = float(_102);
        _138 = _142;
    }
    float _144 = _138;
    bool _146 = _136 >= _144;
    bool _148 = !_132;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_156);
        out.gl_Position.z = _2495;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = _160 * _168;
    float _186 = _160 * _174;
    float _188 = fma(_158, _166, _184);
    float _190 = _160 * _180;
    float _192 = fma(_158, _172, _186);
    float _194 = fma(_158, _178, _190);
    float _196 = fma(_162, _170, _188);
    float _198 = fma(_162, _176, _192);
    float _200 = fma(_162, _182, _194);
    bool _202 = !_164;
    float _204 = _172;
    float _206 = _176;
    float _208 = _196;
    float _210 = _200;
    float _228;
    if (!_202)
    {
        float _212 = in.m_57.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_102);
        float _234 = 1.0 / _232;
        float _236 = _136 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    bool _244 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_238);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    bool _260 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_238);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_254;
    float _274 = _272 + 1.0;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _276;
    float _280 = 1.0 / _258;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = _270 * _274;
    float _286 = -_270;
    float _288 = _286 + 1.0;
    float _290 = _242 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = fma(_278, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _304 = _296 * _284;
    float _306 = fma(_300, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _308 = _302 * _284;
    float _310 = _306 * _284;
    float _312 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].x, _304);
    float _314 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].y, _310);
    float _316 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].x, _312);
    float _320 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].y, _314);
    float _322 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].z, _316);
    bool _324 = !_282;
    float _342;
    if (!_324)
    {
        float _326 = in.m_57.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_102);
        float _348 = 1.0 / _346;
        float _350 = _136 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_59.x;
    float _356 = in.m_59.y;
    float _358 = in.m_59.z;
    bool _360 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _362 = isnan(_352);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _376 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _378 = isnan(_352);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _352 + _392;
    float _396 = -_370;
    float _398 = _396 + 1.0;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _402 = 1.0 / _374;
    float _404 = _386 * _398;
    float _406 = -_386;
    float _408 = _406 + 1.0;
    float _410 = _322 * _358;
    float _412 = _320 * _356;
    float _414 = _390 * _402;
    float _416 = _318 * _354;
    float _418 = fma(_414, _394, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _420 = _418 * _404;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[115].x, _420);
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[116].x, _426);
    float _436 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _440 = !_400;
    float _464;
    float _466;
    if (!_440)
    {
        float _442 = in.m_57.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _446 = float(_102);
        float _448 = 1.0 / _446;
        float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _452 = _136 * _448;
        float _454 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _456 = _454 * _444;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = _452;
        _468 = true;
    }
    else
    {
        float _470 = float(_102);
        float _472 = 1.0 / _470;
        float _474 = _136 * _472;
        _464 = _474;
        _466 = _474;
    }
    _468 = false;
    float _476 = _464;
    float _478 = _466;
    float _480 = in.m_57.z;
    float _482 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _484 = in.m_57.x;
    float _486 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _490 = _488 != 0;
    float _492 = in.m_57.y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _508 = _506 != 0;
    float _510 = _480 * 2.0;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _516 = _484 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _518 = _484 * 2.0;
    float _520 = floor(_510);
    float _522 = -_496;
    float _524 = fma(_516, 2.0, _522);
    float _526 = _484 + _492;
    float _528 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _530 = _492 * 2.0;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _534 = _526 + (-1.0);
    float _536 = floor(_518);
    float _538 = fma(_528, -2.0, _494);
    float _540 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[88].w, _532);
    float _542 = -_136;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _524);
    bool _546 = _520 > 0.0;
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _550 = _520 >= 0.0;
    bool _552 = isnan(_520);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _492 + _480;
    float _562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _564 = log2(_562);
    float _566 = _534;
    if (_490)
    {
        _566 = _492;
    }
    float _568 = _566;
    int _570 = _558 ? 0 : 1;
    float _572 = _560 + (-1.0);
    float _574 = _568;
    float _576 = _572;
    if (!_490)
    {
        _574 = _484;
    }
    float _578 = _574;
    int _580 = ~_570;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _588 = _584;
    if (!_546)
    {
        int _590 = ~_570;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = floor(_530);
    bool _598 = !_500;
    int _600 = _598 ? 0 : 1;
    float _602 = _578 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_490)
    {
        _576 = _484;
    }
    float _604 = _576;
    float _606 = _604;
    if (!_490)
    {
        _606 = _480;
    }
    float _608 = _606;
    float _610 = _564 * _136;
    bool _612 = _536 > 0.0;
    float _614 = fma(_602, -2.0, _514);
    int _616 = abs(_600);
    float _618 = _608 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _620 = float(_594);
    float _622 = exp2(_610);
    float _624 = float(_616);
    float _626 = -_512;
    float _628 = fma(_618, 2.0, _626);
    bool _630 = _536 >= 0.0;
    bool _632 = isnan(_536);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    bool _640 = _596 > 0.0;
    float _642 = _624 * _620;
    int _644 = _638 ? 0 : 1;
    float _646 = in.m_61.x;
    float _648 = in.m_61.y;
    float _650 = in.m_61.z;
    bool _652 = _596 >= 0.0;
    bool _654 = isnan(_596);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(1.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _674 = 1.0 + _672;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _678 = ~_644;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = 1.0 / _674;
    int _686 = _682;
    if (!_612)
    {
        int _688 = ~_644;
        int _690 = _688 + 1;
        _686 = _690;
    }
    int _692 = _686;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _696 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    bool _698 = !_504;
    int _700 = _698 ? 0 : 1;
    float _702 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[78].z, _694);
    float _704 = -_622;
    float _706 = _704 + 1.0;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _710 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _702);
    int _722 = abs(_700);
    float _724 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[88].z, _708);
    float _726 = _718 ? _706 : 0.0;
    float _728 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _614);
    float _730 = _642 * (-2.0);
    float _732 = float(_722);
    float _734 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _696);
    float _736 = float(_692);
    float _738 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _538);
    float _740 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _724);
    float _742 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _540);
    float _744 = -_136;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[86].x, _628);
    if (_670)
    {
        float _748 = _726 * _684;
        _140 = _748;
    }
    float _750 = _140;
    float _752 = _484 + (-0.5);
    float _754 = fma(_730, _646, _646);
    bool _756 = !_508;
    int _758 = _756 ? 0 : 1;
    float _760 = _732 * _736;
    int _762 = _660 ? 0 : 1;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[196].x, _754);
    float _766 = fma(_548, _730, _548);
    int _768 = abs(_758);
    float _770 = _760 * (-2.0);
    int _772 = ~_762;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = in.m_42.x;
    float _780 = in.m_42.y;
    float _782 = in.m_42.z;
    int _784 = _776;
    if (!_640)
    {
        int _786 = ~_762;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_766, _750, _764);
    float _794 = _492 + (-0.5);
    float _796 = fma(_770, _648, _648);
    float _798 = fma(_586, _770, _586);
    float _800 = float(_768);
    float _802 = _792 * 0.15915493667125701904296875;
    float _804 = float(_790);
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].y, _796);
    float _808 = _802 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _800 * _804;
    float _814 = fma(_798, _750, _806);
    float _816 = _484 + _480;
    float _818 = in.m_63.x;
    float _820 = in.m_63.y;
    float _822 = in.m_63.z;
    float _824 = _812 * (-2.0);
    float _826 = _814 * 0.15915493667125701904296875;
    float _828 = _816 + (-1.0);
    float _830 = _802 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = fma(_824, _650, _650);
    float _838 = _480 + (-0.5);
    float _840 = _180 * _780;
    float _842 = fma(_834, _824, _834);
    float _844 = _168 * _780;
    float _846 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _836);
    float _848 = fma(_178, _778, _840);
    float _850 = fma(_166, _778, _844);
    float _852 = fma(_842, _750, _846);
    float _854 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = _826 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _852 * 0.15915493667125701904296875;
    float _862 = fma(_170, _782, _850);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _818);
    float _868 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _870 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _868;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _822);
    float _874 = _860 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = _854 * _866;
    float _880 = _870 * _870;
    float _882 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _884 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _882;
    float _886 = _482 * _864;
    float _888 = _486 * _872;
    float _890 = fma(_182, _782, _848);
    float _892 = _826 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_884, _884, _880);
    float _898 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _900 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _898;
    float _902 = _810 * _858;
    float _904 = _832 * _858;
    float _906 = _174 * _780;
    float _908 = fma(_900, _900, _896);
    float _910 = _860 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _876 * _886;
    float _916 = _858 * _876;
    float _918 = in.m_55.w;
    float _920 = fma(_172, _778, _906);
    float _922 = _832 * _894;
    float _924 = _832 * _914;
    float _926 = sqrt(_908);
    float _928 = _894 * _876;
    float _930 = _810 * _894;
    float _932 = _810 * _914;
    float _934 = fma(_912, _922, _902);
    float _936 = -_886;
    float _938 = _912 * _936;
    float _940 = -_930;
    float _942 = fma(_912, _904, _940);
    float _944 = -_904;
    float _946 = fma(_912, _930, _944);
    float _948 = fma(_934, _878, _924);
    float _950 = fma(_928, _878, _938);
    float _952 = in.m_51.w;
    float _954 = fma(_912, _902, _922);
    float _956 = fma(_942, _888, _948);
    float _958 = fma(_946, _878, _932);
    float _960 = fma(_916, _888, _950);
    float _962 = fma(_926, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _964 = _956 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _966 = fma(_954, _888, _958);
    float _968 = _956 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _890 + _918;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _964);
    float _974 = precise::max(_962, 1.0);
    float _976 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _972);
    float _980 = precise::min(_974, 1.89999997615814208984375);
    float _982 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _984 = _978 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _986 = _982 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _988 = fma(_984, _980, _970);
    float _990 = _862 + _952;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _994 = _988 + _992;
    float _996 = fma(_986, _980, _990);
    float _998 = _994 * _994;
    float _1000 = in.m_53.w;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1004 = _996 + _1002;
    float _1006 = fma(_1004, _1004, _998);
    float _1008 = _956 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1010 = sqrt(_1006);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1008);
    float _1014 = fma(_176, _782, _920);
    float _1016 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1018 = _1014 + _1000;
    bool _1020 = _1010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1024 = fma(_1022, _980, _1018);
    float _1026 = _1022;
    if (!_1020)
    {
        _1026 = _996;
    }
    float _1028 = _1026;
    float _1030 = _1028;
    if (!_1020)
    {
        _204 = _988;
    }
    float _1032 = _204;
    float _1034 = _1032;
    if (!_1020)
    {
        _206 = _1024;
    }
    float _1036 = _206;
    bool _1038 = !_1020;
    float _1040 = _1036;
    if (!_1038)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1046 = _1010 + _1044;
        float _1048 = rsqrt(_1006);
        float _1050 = _1046 * _1042;
        float _1052 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = _1050 * 0.15915493667125701904296875;
        float _1056 = _1054 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058 + (-1.0);
        float _1066 = fma(_1062, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = _1048 * _1066;
        float _1072 = fma(_1024, _1058, _1068);
        float _1074 = fma(_1004, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1076 = fma(_994, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1040 = _1072;
        _1030 = _1074;
        _1034 = _1076;
    }
    float _1078 = _1040;
    float _1080 = _1030;
    float _1082 = _1034;
    float _1084 = -_1018;
    float _1086 = _1084 + _1078;
    float _1088 = -_990;
    float _1090 = _1088 + _1080;
    float _1092 = -_970;
    float _1094 = _1092 + _1082;
    float _1096 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1098 = _1086 * _1086;
    float _1100 = fma(_1090, _1090, _1098);
    bool _1102 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.5);
    bool _1110 = _1106 || _1108;
    bool _1112 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.5);
    bool _1120 = _1116 || _1118;
    float _1122 = fma(_1094, _1094, _1100);
    float _1124 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1096);
    float _1126 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = sqrt(_1122);
    float _1130 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1124);
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1134 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1138 = _1018 + _1136;
    float _1140 = 1.0 / _1132;
    float _1142 = _1138 * _1138;
    bool _1144 = _1128 > 0.0;
    float _1146 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1134);
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _990 + _1148;
    float _1152 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1154 = fma(_1150, _1150, _1142);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1158 = _970 + _1156;
    float _1160 = _1152 + _1132;
    float _1162 = fma(_1158, _1158, _1154);
    float _1164 = _1160 * _1140;
    float _1166 = _1164 * 0.5;
    float _1168 = _1154;
    float _1170 = _1160;
    float _1172 = _1078;
    float _1174 = _1086;
    float _1176 = _1082;
    float _1178 = _1080;
    if (!_1144)
    {
        _1168 = _1080;
    }
    float _1180 = _1168;
    float _1182 = _1180;
    if (!_1144)
    {
        _1170 = _1082;
    }
    float _1184 = _1170;
    bool _1186 = !_1144;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = _198 * _198;
        float _1192 = rsqrt(_1122);
        float _1194 = fma(_196, _196, _1190);
        float _1196 = fma(_200, _200, _1194);
        float _1198 = sqrt(_1196);
        float _1200 = _1090 * _1192;
        float _1202 = _1086 * _1192;
        float _1204 = _1094 * _1192;
        bool _1206 = _1198 > 0.0;
        float _1208 = _1198;
        float _1210 = _1192;
        if (!_1206)
        {
            _1208 = _1080;
        }
        float _1212 = _1208;
        _1182 = _1212;
        if (!_1206)
        {
            _1210 = _1082;
        }
        float _1214 = _1210;
        bool _1216 = !_1206;
        _1188 = _1214;
        if (!_1216)
        {
            float _1218 = rsqrt(_1196);
            float _1220 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1222 = _198 * _1218;
            float _1224 = _196 * _1218;
            float _1226 = _1202 * _1222;
            float _1228 = _200 * _1218;
            float _1230 = fma(_1200, _1224, _1226);
            float _1232 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1234 = fma(_1204, _1228, _1230);
            float _1236 = _1234 * _1232;
            float _1238 = fma(_196, _1236, _1080);
            float _1240 = fma(_198, _1236, _1078);
            float _1242 = fma(_200, _1236, _1082);
            _1182 = _1238;
            _1172 = _1240;
            _1188 = _1242;
            _1174 = _1236;
        }
    }
    float _1244 = _1182;
    float _1246 = _1172;
    float _1248 = _1188;
    float _1250 = _1174;
    float _1252 = _1250;
    if (_1120)
    {
        _1252 = 1.0;
    }
    float _1254 = _1252;
    float _1256 = _1254;
    if (_1110)
    {
        _208 = _1244;
    }
    float _1258 = _208;
    float _1260 = _1258;
    if (_1110)
    {
        _1176 = _1246;
    }
    float _1262 = _1176;
    float _1264 = _1262;
    if (_1110)
    {
        _1178 = _1248;
    }
    float _1266 = _1178;
    float _1268 = _1266;
    if (!_1110)
    {
        float _1270 = sqrt(_1162);
        float _1272 = -_990;
        float _1274 = _1272 + _1244;
        float _1276 = -_970;
        float _1278 = _1276 + _1248;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1284 = precise::min(_1270, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1288 = _1284 * _1282;
        float _1290 = -_1018;
        float _1292 = _1290 + _1246;
        float _1294 = _1286 * _1288;
        float _1296 = fma(_1274, _1294, _990);
        float _1298 = fma(_1292, _1294, _1018);
        float _1300 = fma(_1278, _1294, _970);
        _1264 = _1298;
        _1260 = _1296;
        _1268 = _1300;
    }
    float _1302 = _1264;
    float _1304 = _1260;
    float _1306 = _1268;
    if (!_1120)
    {
        float _1308 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1312 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
        float _1314 = _1308 * 0.15915493667125701904296875;
        float _1316 = _1314 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        float _1320 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = _1314 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = 1.0 / _1318;
        float _1330 = _1322 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = _1326 * _1328;
        float _1336 = 1.0 / _1312;
        float _1338 = _1332 * _1334;
        float _1340 = _1322 * 6.283185482025146484375;
        float _1342 = sin(_1340);
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1346 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1350 = _1336 * _1348;
        float _1352 = 1.0 / _1338;
        float _1354 = 1.0 / _1346;
        float _1356 = _1342 * _1352;
        float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1360 = fma(_1356, _1350, _1358);
        float _1362 = _1360 * _1354;
        float _1364 = precise::clamp(_1362, 0.0, 1.0);
        _1256 = _1364;
    }
    float _1366 = _1256;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _1302 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1304 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1306 + _1376;
    float _1380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1382 = _1370 * _1370;
    float _1384 = fma(_1374, _1374, _1382);
    float _1386 = precise::max(0.0, _1380);
    float _1388 = fma(_1378, _1378, _1384);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1374 * _1394;
    float _1398 = _1378 * _1394;
    float _1400 = -_1394;
    float _1402 = -_1386;
    float _1404 = fma(_1370, _1400, _1402);
    float _1406 = _1396 * _1396;
    float _1408 = _1398 * _1398;
    float _1410 = _1406 + _1408;
    float _1412 = sqrt(_1410);
    bool _1414 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = _1412 + _1416;
    float _1420 = _1378;
    float _1422 = _1386;
    float _1424 = _1370;
    float _1426 = _1418;
    float _1428 = _1382;
    if (_1414)
    {
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1430;
    }
    float _1432 = _1420;
    if (_1414)
    {
        float _1434 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1434;
    }
    float _1436 = _1422;
    float _1438 = _1436;
    if (!_1414)
    {
        _1424 = _1396;
    }
    float _1440 = _1424;
    float _1442 = _1432;
    float _1444 = _1440;
    if (_1414)
    {
        float _1446 = _1418 * _1432;
        _1426 = _1446;
    }
    float _1448 = _1426;
    if (_1414)
    {
        float _1450 = rsqrt(_1410);
        _1442 = _1450;
    }
    float _1452 = _1442;
    float _1454 = _1452;
    if (_1414)
    {
        float _1456 = _1448 * 0.15915493667125701904296875;
        _1428 = _1456;
    }
    float _1458 = _1428;
    float _1460 = _1448;
    float _1462 = _1458;
    if (_1414)
    {
        float _1464 = _1458 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        _1460 = _1466;
    }
    float _1468 = _1460;
    float _1470 = _1390;
    if (_1414)
    {
        float _1472 = _1458 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        _1470 = _1474;
    }
    float _1476 = _1470;
    float _1478 = _1468;
    if (_1414)
    {
        float _1480 = fma(_1468, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1480;
    }
    float _1482 = _1478;
    float _1484 = _1482;
    if (_1414)
    {
        float _1486 = _1452 * _1482;
        _210 = _1486;
    }
    float _1488 = _210;
    if (!_1414)
    {
        _1484 = _1404;
    }
    float _1490 = _1484;
    float _1492 = _1490;
    if (!_1414)
    {
        _1454 = _1406;
    }
    float _1494 = _1454;
    float _1496 = _1494;
    float _1498 = _1476;
    if (_1414)
    {
        float _1500 = _1476 + (-1.0);
        _1438 = _1500;
    }
    float _1502 = _1438;
    float _1504 = _1502;
    if (_1414)
    {
        float _1506 = _1396 * _1488;
        _1444 = _1506;
    }
    float _1508 = _1444;
    if (_1414)
    {
        float _1510 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1462 = _1510;
    }
    float _1512 = _1462;
    if (!_1414)
    {
        _1504 = _1398;
    }
    float _1514 = _1504;
    float _1516 = _1514;
    if (_1414)
    {
        float _1518 = _1398 * _1488;
        _1516 = _1518;
    }
    float _1520 = _1516;
    if (_1414)
    {
        float _1522 = _1508 * _1508;
        _1496 = _1522;
    }
    float _1524 = _1496;
    if (_1414)
    {
        float _1526 = fma(_1404, _1476, _1512);
        _1492 = _1526;
    }
    float _1528 = _1492;
    if (!_1414)
    {
        _1498 = _1408;
    }
    float _1530 = _1498;
    float _1532 = _1530;
    if (_1414)
    {
        float _1534 = _1520 * _1520;
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = fma(_1528, _1528, _1524);
    float _1540 = _1538 + _1536;
    float _1542 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1554 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = rsqrt(_1540);
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1550);
    float _1568 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1574 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1576 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1568);
    float _1578 = abs(_1560);
    float _1580 = log2(_1578);
    float _1582 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1572);
    float _1584 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1586 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1588 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1590 = _1556 * _1508;
    float _1592 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1596 = _1556 * _1528;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = _1556 * _1520;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1594);
    float _1604 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1606 = -_1598;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = -_1588;
    float _1612 = fma(_1610, _1552, 1.0);
    float _1614 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1616 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1618 = -_1600;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1622 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1626 = log2(_1612);
    float _1628 = fma(_1620, -0.5, 0.5);
    float _1630 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1632 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1634 = fma(_1620, 0.5, 0.5);
    float _1636 = _1596 + 1.0;
    float _1638 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1630);
    float _1640 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1632);
    float _1642 = 1.0 / _1624;
    float _1644 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1638);
    float _1646 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1648 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1650 = exp2(_1616);
    float _1652 = _1626 * 0.693147182464599609375;
    float _1654 = sqrt(_1628);
    float _1656 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1658 = _1646 * _1642;
    float _1660 = _1648 * _1642;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1664 = fma(_1634, _1656, -0.212114393711090087890625);
    float _1666 = fma(_1658, 0.5, 0.5);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = -_1596;
    float _1672 = fma(_1650, _1636, _1670);
    float _1674 = fma(_1634, _1664, 1.570728778839111328125);
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = _1654 * 0.636619746685028076171875;
    float3 _4886 = float3(_1666, _1668, _1662);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4886, float3(0.0), isnan(_4886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4886, float3(0.0), isnan(_4886)), level(0.0)).x;
    float3 _4897 = float3(_1666, _1668, _1662);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4897, float3(0.0), isnan(_4897)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4897, float3(0.0), isnan(_4897)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float _1693 = -_1674;
    float _1695 = fma(_1678, _1693, 1.0);
    float2 _4919 = float2(_1695, _1676);
    float3 _1699 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4919, float2(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4919, float2(0.0), isnan(_4919)), level(0.0)).xyz;
    float _1701 = _1699.x;
    float _1703 = _1699.y;
    float _1705 = _1699.z;
    float _1707 = in.m_65.y;
    bool _1709 = _492 > 0.5;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1713 = in.m_57.w;
    out.m_67.x = _430;
    out.m_67.y = _432;
    out.m_67.z = _436;
    out.m_67.w = _438;
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1717 = _1715 != 0;
    float _1719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1721 = _480 > 0.5;
    float _1723 = in.m_69.x;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1729 = in.m_69.z;
    float _1731 = 1.0 / _1727;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1735 = _1733 != 0;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1739 = _1737 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1749 = -_1707;
    float _1751 = _1749 + 1.0;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1755 = _1753 != 0;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1763 = _1761 != 0;
    float _1765 = 1.0 / _1739;
    int _1767 = _1709 ? as_type<int>(_1751) : as_type<int>(_1707);
    float _1769 = in.m_69.w;
    int _1771 = _1721 ? as_type<int>(_1751) : as_type<int>(_1707);
    float _1773 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1775 = _1717 ? as_type<float>(_1767) : _1707;
    float _1777 = in.m_69.y;
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1781 = _1779 != 0;
    float _1783 = 1.0 / _1759;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1787 = _1785 != 0;
    out.m_71.x = _1723;
    float _1789 = _1735 ? as_type<float>(_1771) : _1707;
    float _1791 = fma(_1773, _1775, -0.5);
    bool _1793 = _1713 > 0.5;
    out.m_71.z = _1729;
    float _1795 = 1.0 / _1747;
    float _1797 = -_738;
    float _1799 = fma(_734, _1791, _1797);
    float _1801 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1803 = _1707;
    bool _1805 = _1781;
    float _1807 = _1791;
    if (_1781)
    {
        float _1809 = _1793 ? _1751 : _1707;
        _1803 = _1809;
    }
    float _1811 = _1803;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1821;
    float _1825 = 1.0 / _1743;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1831 = _1823 * _1731;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1839 = _1837 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_1755)
    {
        bool _1841 = _484 > 0.5;
        _1805 = _1841;
    }
    bool _1843 = _1805;
    float _1845 = 1.0 / _1819;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1849 = _1847 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    out.m_71.w = _1769;
    bool _1851 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1853 = isnan(_476);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = fma(_1789, _1801, -0.5);
    bool _1865 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1867 = isnan(_476);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = 1.0 / _1829;
    out.m_71.y = _1777;
    bool _1879 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1881 = isnan(_478);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = -_728;
    float _1893 = fma(_742, _1863, _1891);
    float _1895 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1897 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1899 = isnan(_478);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = 1.0 / _1849;
    float _1911 = _1839 * _1845;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1917 = _1915 * _1825;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1919;
    float _1923 = 1.0 / _1815;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1925;
    float _1929 = _1927 * _1783;
    float _1931 = in.m_65.x;
    float _1933 = 1.0 / _1835;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1939;
    float _1943 = _1937 * _1765;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1949 = _1941 * _1795;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1955 = _1921 * _1923;
    float _1957 = _1947 * _1877;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1959;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1965 = _476 + _1963;
    float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1969 = _476 + _1967;
    bool _1971 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1973 = isnan(_476);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1979 = _1975 || _1977;
    float _1981 = float(_1979);
    float _1983 = _1961 * _1909;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1987 = _478 + _1985;
    float _1989 = _1953 * _1933;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1993 = _476 + _1991;
    float _1995 = fma(_1831, _1965, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1997 = fma(_1943, _1987, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2001 = _478 + _1999;
    float _2003 = fma(_1911, _1993, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2005 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2007 = _478 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2011 = _478 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2015 = _478 + _2013;
    float _2017 = fma(_1955, _2001, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2019 = fma(_1917, _2007, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2021 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2023 = isnan(_478);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = fma(_1929, _1969, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2035 = fma(_1957, _2011, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2039 = _478 + _2037;
    float _2041 = fma(_1949, _2015, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _2043 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2045 = isnan(_478);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2057 = _478 + _2055;
    float _2059 = fma(_1989, _2039, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2061 = -_2031;
    float _2063 = _2061 + 1.0;
    bool _2065 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2067 = isnan(_478);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    float _2077 = fma(_1983, _2057, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2079 = -_2053;
    float _2081 = _2079 + 1.0;
    bool _2083 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2085 = isnan(_478);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = _2053 * _2063;
    bool _2097 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2099 = isnan(_476);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    float _2109 = _2075 * _2081;
    float _2111 = -_2075;
    float _2113 = _2111 + 1.0;
    bool _2115 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2117 = isnan(_478);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2123);
    float _2127 = -_2093;
    float _2129 = _2127 + 1.0;
    float _2131 = -_1981;
    float _2133 = _2131 + 1.0;
    float _2135 = _2093 * _2113;
    bool _2137 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2139 = isnan(_478);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = _2125 * _2129;
    float _2151 = -_1889;
    float _2153 = _2151 + 1.0;
    float _2155 = -_2125;
    float _2157 = _2155 + 1.0;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2161 = _2057;
    int _2163 = as_type<int>(_1995);
    float _2165 = _1931;
    if (!_1755)
    {
        _2161 = _1931;
    }
    float _2167 = _2161;
    float _2169 = _2147 * _2153;
    float _2171 = -_2147;
    float _2173 = _2171 + 1.0;
    float _2175 = _1889 * _2157;
    float _2177 = _1875 * _2133;
    float _2179 = -_1875;
    float _2181 = _2179 + 1.0;
    float _2183 = _1907 * _2173;
    float _2185 = -_1907;
    float _2187 = _2185 + 1.0;
    int _2189 = as_type<int>(_2173);
    float _2191 = _2167;
    if (_1787)
    {
        float _2193 = -_1931;
        float _2195 = _2193 + 1.0;
        _2189 = as_type<int>(_2195);
    }
    int _2197 = _2189;
    float _2199 = _1861 * _2181;
    float _2201 = _1997 * _2183;
    float _2203 = -_1861;
    float _2205 = _2203 + 1.0;
    float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2209 = _1995 * _2199;
    float _2211 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2201);
    int _2213 = as_type<int>(_2205);
    if (_1755)
    {
        float _2215 = -_1931;
        float _2217 = _2215 + 1.0;
        _2163 = as_type<int>(_2217);
    }
    int _2219 = _2163;
    if (!_1763)
    {
        _1807 = _1931;
    }
    float _2221 = _1807;
    float _2223 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2209);
    float _2225 = _2221;
    if (_1763)
    {
        float _2227 = -_1931;
        float _2229 = _2227 + 1.0;
        _2213 = as_type<int>(_2229);
    }
    int _2231 = _2213;
    float _2233 = fma(_2019, _2169, _2211);
    if (_1755)
    {
        float _2235 = _1843 ? as_type<float>(_2219) : _1931;
        _2191 = _2235;
    }
    float _2237 = _2191;
    float _2239 = -_2107;
    float _2241 = _2239 + 1.0;
    float _2243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2245 = fma(_2041, _2175, _2233);
    if (_1763)
    {
        float _2247 = _1721 ? as_type<float>(_2231) : _1931;
        _2225 = _2247;
    }
    float _2249 = _2225;
    float _2251 = _1981 * _2241;
    if (_1787)
    {
        float _2253 = _1709 ? as_type<float>(_2197) : _1931;
        _2165 = _2253;
    }
    float _2255 = _2165;
    float _2257 = fma(_2035, _2149, _2245);
    float _2259 = _2207 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2261 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2265 = fma(_2017, _2135, _2257);
    float _2267 = fma(_2259, _2255, -0.5);
    float _2269 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2261);
    float _2271 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2273 = fma(_740, _2267, _746);
    float _2275 = fma(_2059, _2109, _2265);
    float _2277 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2279 = _2271 * _2159;
    float _2281 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2283 = fma(_2077, _2095, _2275);
    float _2285 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2277);
    float _2287 = _1895 * _2243;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2291 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2283);
    float _2293 = exp2(_2281);
    float _2295 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2297 = _2285 + _1624;
    float _2299 = fma(_2003, _2177, _2223);
    float _2301 = fma(_2295, _2237, -0.5);
    float _2303 = _2297 * 0.5;
    float _2305 = fma(_2033, _2251, _2299);
    bool _2307 = _1366 > 0.0;
    bool _2309 = isnan(_1366);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(0.0);
    bool _2315 = _2311 || _2313;
    float _2317 = fma(_720, _2301, _544);
    float _2319 = _2273 + 0.5;
    float _2321 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2305);
    float _2323 = _2317 + 0.5;
    float _2325 = _1893 + 0.5;
    float _2327 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2329 = -_2293;
    float _2331 = _2329 + 1.0;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2335 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_73.x = _2319;
    out.m_73.y = _2325;
    float _2337 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2339 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2341 = _2327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _2291;
    float _2343 = _1799 + 0.5;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2347 = _2321 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1648;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1624;
    float _2349 = _2335 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2323;
    out.m_77.y = _2343;
    out.m_77.z = _2279;
    out.m_77.w = _2287;
    out.m_79.x = _2339;
    out.m_79.y = _2341;
    out.m_79.z = _2345;
    out.m_79.w = _2347;
    out.m_81.z = _2303;
    out.m_81.w = _1624;
    out.m_45.x = _2349;
    float _2351 = _2337 * _1680;
    float _2353 = -_2337;
    float _2355 = _2353 + 1.0;
    float _2357 = _1691 * _2351;
    float _2359 = _1705 * _2351;
    float _2361 = fma(_1701, _2357, _1685);
    float _2363 = fma(_1703, _2357, _1687);
    float _2365 = _1691 * _2355;
    float _2367 = fma(_1691, _2359, _1689);
    out.m_83.x = _2361;
    out.m_83.y = _2363;
    out.m_83.z = _2367;
    out.m_83.w = _2365;
    if (_2315)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2369 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2369;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _468 = false;
    bool _344 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2426 = as_type<float>(_118);
        out.gl_Position.z = _2426;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    float _140 = _136;
    if (_132)
    {
        float _142 = float(_102);
        _138 = _142;
    }
    float _144 = _138;
    bool _146 = _136 >= _144;
    bool _148 = !_132;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_156);
        out.gl_Position.z = _2495;
    }
    if (_150)
    {
        return out;
    }
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = _160 * _168;
    float _186 = _160 * _174;
    float _188 = fma(_158, _166, _184);
    float _190 = _160 * _180;
    float _192 = fma(_158, _172, _186);
    float _194 = fma(_158, _178, _190);
    float _196 = fma(_162, _170, _188);
    float _198 = fma(_162, _176, _192);
    float _200 = fma(_162, _182, _194);
    bool _202 = !_164;
    float _204 = _172;
    float _206 = _176;
    float _208 = _196;
    float _210 = _200;
    float _228;
    if (!_202)
    {
        float _212 = in.m_57.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_102);
        float _234 = 1.0 / _232;
        float _236 = _136 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    bool _244 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_238);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    bool _260 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_238);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_254;
    float _274 = _272 + 1.0;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _276;
    float _280 = 1.0 / _258;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = _270 * _274;
    float _286 = -_270;
    float _288 = _286 + 1.0;
    float _290 = _242 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = fma(_278, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _304 = _296 * _284;
    float _306 = fma(_300, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _308 = _302 * _284;
    float _310 = _306 * _284;
    float _312 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].x, _304);
    float _314 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].y, _310);
    float _316 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].x, _312);
    float _320 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].y, _314);
    float _322 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].z, _316);
    bool _324 = !_282;
    float _342;
    if (!_324)
    {
        float _326 = in.m_57.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_102);
        float _348 = 1.0 / _346;
        float _350 = _136 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_59.x;
    float _356 = in.m_59.y;
    float _358 = in.m_59.z;
    bool _360 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _362 = isnan(_352);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _376 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _378 = isnan(_352);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _352 + _392;
    float _396 = -_370;
    float _398 = _396 + 1.0;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _402 = 1.0 / _374;
    float _404 = _386 * _398;
    float _406 = -_386;
    float _408 = _406 + 1.0;
    float _410 = _322 * _358;
    float _412 = _320 * _356;
    float _414 = _390 * _402;
    float _416 = _318 * _354;
    float _418 = fma(_414, _394, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _420 = _418 * _404;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[115].x, _420);
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[116].x, _426);
    float _436 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _440 = !_400;
    float _464;
    float _466;
    if (!_440)
    {
        float _442 = in.m_57.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _446 = float(_102);
        float _448 = 1.0 / _446;
        float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _452 = _136 * _448;
        float _454 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _456 = _454 * _444;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = _452;
        _468 = true;
    }
    else
    {
        float _470 = float(_102);
        float _472 = 1.0 / _470;
        float _474 = _136 * _472;
        _464 = _474;
        _466 = _474;
    }
    _468 = false;
    float _476 = _464;
    float _478 = _466;
    float _480 = in.m_57.z;
    float _482 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _484 = in.m_57.x;
    float _486 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _490 = _488 != 0;
    float _492 = in.m_57.y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _508 = _506 != 0;
    float _510 = _480 * 2.0;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _516 = _484 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _518 = _484 * 2.0;
    float _520 = floor(_510);
    float _522 = -_496;
    float _524 = fma(_516, 2.0, _522);
    float _526 = _484 + _492;
    float _528 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _530 = _492 * 2.0;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _534 = _526 + (-1.0);
    float _536 = floor(_518);
    float _538 = fma(_528, -2.0, _494);
    float _540 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[88].w, _532);
    float _542 = -_136;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _524);
    bool _546 = _520 > 0.0;
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _550 = _520 >= 0.0;
    bool _552 = isnan(_520);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _492 + _480;
    float _562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _564 = log2(_562);
    float _566 = _534;
    if (_490)
    {
        _566 = _492;
    }
    float _568 = _566;
    int _570 = _558 ? 0 : 1;
    float _572 = _560 + (-1.0);
    float _574 = _568;
    float _576 = _572;
    if (!_490)
    {
        _574 = _484;
    }
    float _578 = _574;
    int _580 = ~_570;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _588 = _584;
    if (!_546)
    {
        int _590 = ~_570;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = floor(_530);
    bool _598 = !_500;
    int _600 = _598 ? 0 : 1;
    float _602 = _578 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_490)
    {
        _576 = _484;
    }
    float _604 = _576;
    float _606 = _604;
    if (!_490)
    {
        _606 = _480;
    }
    float _608 = _606;
    float _610 = _564 * _136;
    bool _612 = _536 > 0.0;
    float _614 = fma(_602, -2.0, _514);
    int _616 = abs(_600);
    float _618 = _608 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _620 = float(_594);
    float _622 = exp2(_610);
    float _624 = float(_616);
    float _626 = -_512;
    float _628 = fma(_618, 2.0, _626);
    bool _630 = _536 >= 0.0;
    bool _632 = isnan(_536);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    bool _640 = _596 > 0.0;
    float _642 = _624 * _620;
    int _644 = _638 ? 0 : 1;
    float _646 = in.m_61.x;
    float _648 = in.m_61.y;
    float _650 = in.m_61.z;
    bool _652 = _596 >= 0.0;
    bool _654 = isnan(_596);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(1.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _674 = 1.0 + _672;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _678 = ~_644;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = 1.0 / _674;
    int _686 = _682;
    if (!_612)
    {
        int _688 = ~_644;
        int _690 = _688 + 1;
        _686 = _690;
    }
    int _692 = _686;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _696 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    bool _698 = !_504;
    int _700 = _698 ? 0 : 1;
    float _702 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[78].z, _694);
    float _704 = -_622;
    float _706 = _704 + 1.0;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _710 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _702);
    int _722 = abs(_700);
    float _724 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[88].z, _708);
    float _726 = _718 ? _706 : 0.0;
    float _728 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _614);
    float _730 = _642 * (-2.0);
    float _732 = float(_722);
    float _734 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _696);
    float _736 = float(_692);
    float _738 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _538);
    float _740 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _724);
    float _742 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _540);
    float _744 = -_136;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[86].x, _628);
    if (_670)
    {
        float _748 = _726 * _684;
        _140 = _748;
    }
    float _750 = _140;
    float _752 = _484 + (-0.5);
    float _754 = fma(_730, _646, _646);
    bool _756 = !_508;
    int _758 = _756 ? 0 : 1;
    float _760 = _732 * _736;
    int _762 = _660 ? 0 : 1;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[196].x, _754);
    float _766 = fma(_548, _730, _548);
    int _768 = abs(_758);
    float _770 = _760 * (-2.0);
    int _772 = ~_762;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = in.m_42.x;
    float _780 = in.m_42.y;
    float _782 = in.m_42.z;
    int _784 = _776;
    if (!_640)
    {
        int _786 = ~_762;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_766, _750, _764);
    float _794 = _492 + (-0.5);
    float _796 = fma(_770, _648, _648);
    float _798 = fma(_586, _770, _586);
    float _800 = float(_768);
    float _802 = _792 * 0.15915493667125701904296875;
    float _804 = float(_790);
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].y, _796);
    float _808 = _802 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _800 * _804;
    float _814 = fma(_798, _750, _806);
    float _816 = _484 + _480;
    float _818 = in.m_63.x;
    float _820 = in.m_63.y;
    float _822 = in.m_63.z;
    float _824 = _812 * (-2.0);
    float _826 = _814 * 0.15915493667125701904296875;
    float _828 = _816 + (-1.0);
    float _830 = _802 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = fma(_824, _650, _650);
    float _838 = _480 + (-0.5);
    float _840 = _180 * _780;
    float _842 = fma(_834, _824, _834);
    float _844 = _168 * _780;
    float _846 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _836);
    float _848 = fma(_178, _778, _840);
    float _850 = fma(_166, _778, _844);
    float _852 = fma(_842, _750, _846);
    float _854 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = _826 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _852 * 0.15915493667125701904296875;
    float _862 = fma(_170, _782, _850);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _818);
    float _868 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _870 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _868;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _822);
    float _874 = _860 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = _854 * _866;
    float _880 = _870 * _870;
    float _882 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _884 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _882;
    float _886 = _482 * _864;
    float _888 = _486 * _872;
    float _890 = fma(_182, _782, _848);
    float _892 = _826 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_884, _884, _880);
    float _898 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _900 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _898;
    float _902 = _810 * _858;
    float _904 = _832 * _858;
    float _906 = _174 * _780;
    float _908 = fma(_900, _900, _896);
    float _910 = _860 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _876 * _886;
    float _916 = _858 * _876;
    float _918 = in.m_55.w;
    float _920 = fma(_172, _778, _906);
    float _922 = _832 * _894;
    float _924 = _832 * _914;
    float _926 = sqrt(_908);
    float _928 = _894 * _876;
    float _930 = _810 * _894;
    float _932 = _810 * _914;
    float _934 = fma(_912, _922, _902);
    float _936 = -_886;
    float _938 = _912 * _936;
    float _940 = -_930;
    float _942 = fma(_912, _904, _940);
    float _944 = -_904;
    float _946 = fma(_912, _930, _944);
    float _948 = fma(_934, _878, _924);
    float _950 = fma(_928, _878, _938);
    float _952 = in.m_51.w;
    float _954 = fma(_912, _902, _922);
    float _956 = fma(_942, _888, _948);
    float _958 = fma(_946, _878, _932);
    float _960 = fma(_916, _888, _950);
    float _962 = fma(_926, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _964 = _956 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _966 = fma(_954, _888, _958);
    float _968 = _956 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _890 + _918;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _964);
    float _974 = precise::max(_962, 1.0);
    float _976 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _972);
    float _980 = precise::min(_974, 1.89999997615814208984375);
    float _982 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _984 = _978 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _986 = _982 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _988 = fma(_984, _980, _970);
    float _990 = _862 + _952;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _994 = _988 + _992;
    float _996 = fma(_986, _980, _990);
    float _998 = _994 * _994;
    float _1000 = in.m_53.w;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1004 = _996 + _1002;
    float _1006 = fma(_1004, _1004, _998);
    float _1008 = _956 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1010 = sqrt(_1006);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1008);
    float _1014 = fma(_176, _782, _920);
    float _1016 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1018 = _1014 + _1000;
    bool _1020 = _1010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1024 = fma(_1022, _980, _1018);
    float _1026 = _1022;
    if (!_1020)
    {
        _1026 = _996;
    }
    float _1028 = _1026;
    float _1030 = _1028;
    if (!_1020)
    {
        _204 = _988;
    }
    float _1032 = _204;
    float _1034 = _1032;
    if (!_1020)
    {
        _206 = _1024;
    }
    float _1036 = _206;
    bool _1038 = !_1020;
    float _1040 = _1036;
    if (!_1038)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1046 = _1010 + _1044;
        float _1048 = rsqrt(_1006);
        float _1050 = _1046 * _1042;
        float _1052 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = _1050 * 0.15915493667125701904296875;
        float _1056 = _1054 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058 + (-1.0);
        float _1066 = fma(_1062, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = _1048 * _1066;
        float _1072 = fma(_1024, _1058, _1068);
        float _1074 = fma(_1004, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1076 = fma(_994, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1040 = _1072;
        _1030 = _1074;
        _1034 = _1076;
    }
    float _1078 = _1040;
    float _1080 = _1030;
    float _1082 = _1034;
    float _1084 = -_1018;
    float _1086 = _1084 + _1078;
    float _1088 = -_990;
    float _1090 = _1088 + _1080;
    float _1092 = -_970;
    float _1094 = _1092 + _1082;
    float _1096 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1098 = _1086 * _1086;
    float _1100 = fma(_1090, _1090, _1098);
    bool _1102 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.5);
    bool _1110 = _1106 || _1108;
    bool _1112 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.5);
    bool _1120 = _1116 || _1118;
    float _1122 = fma(_1094, _1094, _1100);
    float _1124 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1096);
    float _1126 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = sqrt(_1122);
    float _1130 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1124);
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1134 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1138 = _1018 + _1136;
    float _1140 = 1.0 / _1132;
    float _1142 = _1138 * _1138;
    bool _1144 = _1128 > 0.0;
    float _1146 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1134);
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _990 + _1148;
    float _1152 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1154 = fma(_1150, _1150, _1142);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1158 = _970 + _1156;
    float _1160 = _1152 + _1132;
    float _1162 = fma(_1158, _1158, _1154);
    float _1164 = _1160 * _1140;
    float _1166 = _1164 * 0.5;
    float _1168 = _1154;
    float _1170 = _1160;
    float _1172 = _1078;
    float _1174 = _1086;
    float _1176 = _1082;
    float _1178 = _1080;
    if (!_1144)
    {
        _1168 = _1080;
    }
    float _1180 = _1168;
    float _1182 = _1180;
    if (!_1144)
    {
        _1170 = _1082;
    }
    float _1184 = _1170;
    bool _1186 = !_1144;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = _198 * _198;
        float _1192 = rsqrt(_1122);
        float _1194 = fma(_196, _196, _1190);
        float _1196 = fma(_200, _200, _1194);
        float _1198 = sqrt(_1196);
        float _1200 = _1090 * _1192;
        float _1202 = _1086 * _1192;
        float _1204 = _1094 * _1192;
        bool _1206 = _1198 > 0.0;
        float _1208 = _1198;
        float _1210 = _1192;
        if (!_1206)
        {
            _1208 = _1080;
        }
        float _1212 = _1208;
        _1182 = _1212;
        if (!_1206)
        {
            _1210 = _1082;
        }
        float _1214 = _1210;
        bool _1216 = !_1206;
        _1188 = _1214;
        if (!_1216)
        {
            float _1218 = rsqrt(_1196);
            float _1220 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1222 = _198 * _1218;
            float _1224 = _196 * _1218;
            float _1226 = _1202 * _1222;
            float _1228 = _200 * _1218;
            float _1230 = fma(_1200, _1224, _1226);
            float _1232 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1234 = fma(_1204, _1228, _1230);
            float _1236 = _1234 * _1232;
            float _1238 = fma(_196, _1236, _1080);
            float _1240 = fma(_198, _1236, _1078);
            float _1242 = fma(_200, _1236, _1082);
            _1182 = _1238;
            _1172 = _1240;
            _1188 = _1242;
            _1174 = _1236;
        }
    }
    float _1244 = _1182;
    float _1246 = _1172;
    float _1248 = _1188;
    float _1250 = _1174;
    float _1252 = _1250;
    if (_1120)
    {
        _1252 = 1.0;
    }
    float _1254 = _1252;
    float _1256 = _1254;
    if (_1110)
    {
        _208 = _1244;
    }
    float _1258 = _208;
    float _1260 = _1258;
    if (_1110)
    {
        _1176 = _1246;
    }
    float _1262 = _1176;
    float _1264 = _1262;
    if (_1110)
    {
        _1178 = _1248;
    }
    float _1266 = _1178;
    float _1268 = _1266;
    if (!_1110)
    {
        float _1270 = sqrt(_1162);
        float _1272 = -_990;
        float _1274 = _1272 + _1244;
        float _1276 = -_970;
        float _1278 = _1276 + _1248;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1284 = precise::min(_1270, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1288 = _1284 * _1282;
        float _1290 = -_1018;
        float _1292 = _1290 + _1246;
        float _1294 = _1286 * _1288;
        float _1296 = fma(_1274, _1294, _990);
        float _1298 = fma(_1292, _1294, _1018);
        float _1300 = fma(_1278, _1294, _970);
        _1264 = _1298;
        _1260 = _1296;
        _1268 = _1300;
    }
    float _1302 = _1264;
    float _1304 = _1260;
    float _1306 = _1268;
    if (!_1120)
    {
        float _1308 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1312 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
        float _1314 = _1308 * 0.15915493667125701904296875;
        float _1316 = _1314 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        float _1320 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = _1314 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = 1.0 / _1318;
        float _1330 = _1322 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = _1326 * _1328;
        float _1336 = 1.0 / _1312;
        float _1338 = _1332 * _1334;
        float _1340 = _1322 * 6.283185482025146484375;
        float _1342 = sin(_1340);
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1346 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1350 = _1336 * _1348;
        float _1352 = 1.0 / _1338;
        float _1354 = 1.0 / _1346;
        float _1356 = _1342 * _1352;
        float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1360 = fma(_1356, _1350, _1358);
        float _1362 = _1360 * _1354;
        float _1364 = precise::clamp(_1362, 0.0, 1.0);
        _1256 = _1364;
    }
    float _1366 = _1256;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _1302 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1304 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1306 + _1376;
    float _1380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1382 = _1370 * _1370;
    float _1384 = fma(_1374, _1374, _1382);
    float _1386 = precise::max(0.0, _1380);
    float _1388 = fma(_1378, _1378, _1384);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1374 * _1394;
    float _1398 = _1378 * _1394;
    float _1400 = -_1394;
    float _1402 = -_1386;
    float _1404 = fma(_1370, _1400, _1402);
    float _1406 = _1396 * _1396;
    float _1408 = _1398 * _1398;
    float _1410 = _1406 + _1408;
    float _1412 = sqrt(_1410);
    bool _1414 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = _1412 + _1416;
    float _1420 = _1378;
    float _1422 = _1386;
    float _1424 = _1370;
    float _1426 = _1418;
    float _1428 = _1382;
    if (_1414)
    {
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1430;
    }
    float _1432 = _1420;
    if (_1414)
    {
        float _1434 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1434;
    }
    float _1436 = _1422;
    float _1438 = _1436;
    if (!_1414)
    {
        _1424 = _1396;
    }
    float _1440 = _1424;
    float _1442 = _1432;
    float _1444 = _1440;
    if (_1414)
    {
        float _1446 = _1418 * _1432;
        _1426 = _1446;
    }
    float _1448 = _1426;
    if (_1414)
    {
        float _1450 = rsqrt(_1410);
        _1442 = _1450;
    }
    float _1452 = _1442;
    float _1454 = _1452;
    if (_1414)
    {
        float _1456 = _1448 * 0.15915493667125701904296875;
        _1428 = _1456;
    }
    float _1458 = _1428;
    float _1460 = _1448;
    float _1462 = _1458;
    if (_1414)
    {
        float _1464 = _1458 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        _1460 = _1466;
    }
    float _1468 = _1460;
    float _1470 = _1390;
    if (_1414)
    {
        float _1472 = _1458 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        _1470 = _1474;
    }
    float _1476 = _1470;
    float _1478 = _1468;
    if (_1414)
    {
        float _1480 = fma(_1468, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1480;
    }
    float _1482 = _1478;
    float _1484 = _1482;
    if (_1414)
    {
        float _1486 = _1452 * _1482;
        _210 = _1486;
    }
    float _1488 = _210;
    if (!_1414)
    {
        _1484 = _1404;
    }
    float _1490 = _1484;
    float _1492 = _1490;
    if (!_1414)
    {
        _1454 = _1406;
    }
    float _1494 = _1454;
    float _1496 = _1494;
    float _1498 = _1476;
    if (_1414)
    {
        float _1500 = _1476 + (-1.0);
        _1438 = _1500;
    }
    float _1502 = _1438;
    float _1504 = _1502;
    if (_1414)
    {
        float _1506 = _1396 * _1488;
        _1444 = _1506;
    }
    float _1508 = _1444;
    if (_1414)
    {
        float _1510 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1462 = _1510;
    }
    float _1512 = _1462;
    if (!_1414)
    {
        _1504 = _1398;
    }
    float _1514 = _1504;
    float _1516 = _1514;
    if (_1414)
    {
        float _1518 = _1398 * _1488;
        _1516 = _1518;
    }
    float _1520 = _1516;
    if (_1414)
    {
        float _1522 = _1508 * _1508;
        _1496 = _1522;
    }
    float _1524 = _1496;
    if (_1414)
    {
        float _1526 = fma(_1404, _1476, _1512);
        _1492 = _1526;
    }
    float _1528 = _1492;
    if (!_1414)
    {
        _1498 = _1408;
    }
    float _1530 = _1498;
    float _1532 = _1530;
    if (_1414)
    {
        float _1534 = _1520 * _1520;
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = fma(_1528, _1528, _1524);
    float _1540 = _1538 + _1536;
    float _1542 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1554 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = rsqrt(_1540);
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1550);
    float _1568 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1574 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1576 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1568);
    float _1578 = abs(_1560);
    float _1580 = log2(_1578);
    float _1582 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1572);
    float _1584 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1586 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1588 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1590 = _1556 * _1508;
    float _1592 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1596 = _1556 * _1528;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = _1556 * _1520;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1594);
    float _1604 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1606 = -_1598;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = -_1588;
    float _1612 = fma(_1610, _1552, 1.0);
    float _1614 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1616 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1618 = -_1600;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1622 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1626 = log2(_1612);
    float _1628 = fma(_1620, -0.5, 0.5);
    float _1630 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1632 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1634 = fma(_1620, 0.5, 0.5);
    float _1636 = _1596 + 1.0;
    float _1638 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1630);
    float _1640 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1632);
    float _1642 = 1.0 / _1624;
    float _1644 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1638);
    float _1646 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1648 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1650 = exp2(_1616);
    float _1652 = _1626 * 0.693147182464599609375;
    float _1654 = sqrt(_1628);
    float _1656 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1658 = _1646 * _1642;
    float _1660 = _1648 * _1642;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1664 = fma(_1634, _1656, -0.212114393711090087890625);
    float _1666 = fma(_1658, 0.5, 0.5);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = -_1596;
    float _1672 = fma(_1650, _1636, _1670);
    float _1674 = fma(_1634, _1664, 1.570728778839111328125);
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = _1654 * 0.636619746685028076171875;
    float3 _4886 = float3(_1666, _1668, _1662);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4886, float3(0.0), isnan(_4886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4886, float3(0.0), isnan(_4886)), level(0.0)).x;
    float3 _4897 = float3(_1666, _1668, _1662);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4897, float3(0.0), isnan(_4897)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4897, float3(0.0), isnan(_4897)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float _1693 = -_1674;
    float _1695 = fma(_1678, _1693, 1.0);
    float2 _4919 = float2(_1695, _1676);
    float3 _1699 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4919, float2(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4919, float2(0.0), isnan(_4919)), level(0.0)).xyz;
    float _1701 = _1699.x;
    float _1703 = _1699.y;
    float _1705 = _1699.z;
    float _1707 = in.m_65.y;
    bool _1709 = _492 > 0.5;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1713 = in.m_57.w;
    out.m_67.x = _430;
    out.m_67.y = _432;
    out.m_67.z = _436;
    out.m_67.w = _438;
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1717 = _1715 != 0;
    float _1719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1721 = _480 > 0.5;
    float _1723 = in.m_69.x;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1729 = in.m_69.z;
    float _1731 = 1.0 / _1727;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1735 = _1733 != 0;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1739 = _1737 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1749 = -_1707;
    float _1751 = _1749 + 1.0;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1755 = _1753 != 0;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1763 = _1761 != 0;
    float _1765 = 1.0 / _1739;
    int _1767 = _1709 ? as_type<int>(_1751) : as_type<int>(_1707);
    float _1769 = in.m_69.w;
    int _1771 = _1721 ? as_type<int>(_1751) : as_type<int>(_1707);
    float _1773 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1775 = _1717 ? as_type<float>(_1767) : _1707;
    float _1777 = in.m_69.y;
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1781 = _1779 != 0;
    float _1783 = 1.0 / _1759;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1787 = _1785 != 0;
    out.m_71.x = _1723;
    float _1789 = _1735 ? as_type<float>(_1771) : _1707;
    float _1791 = fma(_1773, _1775, -0.5);
    bool _1793 = _1713 > 0.5;
    out.m_71.z = _1729;
    float _1795 = 1.0 / _1747;
    float _1797 = -_738;
    float _1799 = fma(_734, _1791, _1797);
    float _1801 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1803 = _1707;
    bool _1805 = _1781;
    float _1807 = _1791;
    if (_1781)
    {
        float _1809 = _1793 ? _1751 : _1707;
        _1803 = _1809;
    }
    float _1811 = _1803;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1821;
    float _1825 = 1.0 / _1743;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1831 = _1823 * _1731;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1839 = _1837 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_1755)
    {
        bool _1841 = _484 > 0.5;
        _1805 = _1841;
    }
    bool _1843 = _1805;
    float _1845 = 1.0 / _1819;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1849 = _1847 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    out.m_71.w = _1769;
    bool _1851 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1853 = isnan(_476);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = fma(_1789, _1801, -0.5);
    bool _1865 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1867 = isnan(_476);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = 1.0 / _1829;
    out.m_71.y = _1777;
    bool _1879 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1881 = isnan(_478);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = -_728;
    float _1893 = fma(_742, _1863, _1891);
    float _1895 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1897 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1899 = isnan(_478);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = 1.0 / _1849;
    float _1911 = _1839 * _1845;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1917 = _1915 * _1825;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1919;
    float _1923 = 1.0 / _1815;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1925;
    float _1929 = _1927 * _1783;
    float _1931 = in.m_65.x;
    float _1933 = 1.0 / _1835;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1939;
    float _1943 = _1937 * _1765;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1949 = _1941 * _1795;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1955 = _1921 * _1923;
    float _1957 = _1947 * _1877;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1959;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1965 = _476 + _1963;
    float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1969 = _476 + _1967;
    bool _1971 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1973 = isnan(_476);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1979 = _1975 || _1977;
    float _1981 = float(_1979);
    float _1983 = _1961 * _1909;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1987 = _478 + _1985;
    float _1989 = _1953 * _1933;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1993 = _476 + _1991;
    float _1995 = fma(_1831, _1965, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1997 = fma(_1943, _1987, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2001 = _478 + _1999;
    float _2003 = fma(_1911, _1993, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2005 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2007 = _478 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2011 = _478 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2015 = _478 + _2013;
    float _2017 = fma(_1955, _2001, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2019 = fma(_1917, _2007, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2021 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2023 = isnan(_478);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = fma(_1929, _1969, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2035 = fma(_1957, _2011, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2039 = _478 + _2037;
    float _2041 = fma(_1949, _2015, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _2043 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2045 = isnan(_478);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2057 = _478 + _2055;
    float _2059 = fma(_1989, _2039, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2061 = -_2031;
    float _2063 = _2061 + 1.0;
    bool _2065 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2067 = isnan(_478);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    float _2077 = fma(_1983, _2057, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2079 = -_2053;
    float _2081 = _2079 + 1.0;
    bool _2083 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2085 = isnan(_478);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = _2053 * _2063;
    bool _2097 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2099 = isnan(_476);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    float _2109 = _2075 * _2081;
    float _2111 = -_2075;
    float _2113 = _2111 + 1.0;
    bool _2115 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2117 = isnan(_478);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2123);
    float _2127 = -_2093;
    float _2129 = _2127 + 1.0;
    float _2131 = -_1981;
    float _2133 = _2131 + 1.0;
    float _2135 = _2093 * _2113;
    bool _2137 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2139 = isnan(_478);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = _2125 * _2129;
    float _2151 = -_1889;
    float _2153 = _2151 + 1.0;
    float _2155 = -_2125;
    float _2157 = _2155 + 1.0;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2161 = _2057;
    int _2163 = as_type<int>(_1995);
    float _2165 = _1931;
    if (!_1755)
    {
        _2161 = _1931;
    }
    float _2167 = _2161;
    float _2169 = _2147 * _2153;
    float _2171 = -_2147;
    float _2173 = _2171 + 1.0;
    float _2175 = _1889 * _2157;
    float _2177 = _1875 * _2133;
    float _2179 = -_1875;
    float _2181 = _2179 + 1.0;
    float _2183 = _1907 * _2173;
    float _2185 = -_1907;
    float _2187 = _2185 + 1.0;
    int _2189 = as_type<int>(_2173);
    float _2191 = _2167;
    if (_1787)
    {
        float _2193 = -_1931;
        float _2195 = _2193 + 1.0;
        _2189 = as_type<int>(_2195);
    }
    int _2197 = _2189;
    float _2199 = _1861 * _2181;
    float _2201 = _1997 * _2183;
    float _2203 = -_1861;
    float _2205 = _2203 + 1.0;
    float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2209 = _1995 * _2199;
    float _2211 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2201);
    int _2213 = as_type<int>(_2205);
    if (_1755)
    {
        float _2215 = -_1931;
        float _2217 = _2215 + 1.0;
        _2163 = as_type<int>(_2217);
    }
    int _2219 = _2163;
    if (!_1763)
    {
        _1807 = _1931;
    }
    float _2221 = _1807;
    float _2223 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2209);
    float _2225 = _2221;
    if (_1763)
    {
        float _2227 = -_1931;
        float _2229 = _2227 + 1.0;
        _2213 = as_type<int>(_2229);
    }
    int _2231 = _2213;
    float _2233 = fma(_2019, _2169, _2211);
    if (_1755)
    {
        float _2235 = _1843 ? as_type<float>(_2219) : _1931;
        _2191 = _2235;
    }
    float _2237 = _2191;
    float _2239 = -_2107;
    float _2241 = _2239 + 1.0;
    float _2243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2245 = fma(_2041, _2175, _2233);
    if (_1763)
    {
        float _2247 = _1721 ? as_type<float>(_2231) : _1931;
        _2225 = _2247;
    }
    float _2249 = _2225;
    float _2251 = _1981 * _2241;
    if (_1787)
    {
        float _2253 = _1709 ? as_type<float>(_2197) : _1931;
        _2165 = _2253;
    }
    float _2255 = _2165;
    float _2257 = fma(_2035, _2149, _2245);
    float _2259 = _2207 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2261 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2265 = fma(_2017, _2135, _2257);
    float _2267 = fma(_2259, _2255, -0.5);
    float _2269 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2261);
    float _2271 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2273 = fma(_740, _2267, _746);
    float _2275 = fma(_2059, _2109, _2265);
    float _2277 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2279 = _2271 * _2159;
    float _2281 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2283 = fma(_2077, _2095, _2275);
    float _2285 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2277);
    float _2287 = _1895 * _2243;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2291 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2283);
    float _2293 = exp2(_2281);
    float _2295 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2297 = _2285 + _1624;
    float _2299 = fma(_2003, _2177, _2223);
    float _2301 = fma(_2295, _2237, -0.5);
    float _2303 = _2297 * 0.5;
    float _2305 = fma(_2033, _2251, _2299);
    bool _2307 = _1366 > 0.0;
    bool _2309 = isnan(_1366);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(0.0);
    bool _2315 = _2311 || _2313;
    float _2317 = fma(_720, _2301, _544);
    float _2319 = _2273 + 0.5;
    float _2321 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2305);
    float _2323 = _2317 + 0.5;
    float _2325 = _1893 + 0.5;
    float _2327 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2329 = -_2293;
    float _2331 = _2329 + 1.0;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2335 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_73.x = _2319;
    out.m_73.y = _2325;
    float _2337 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2339 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2341 = _2327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _2291;
    float _2343 = _1799 + 0.5;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2347 = _2321 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1648;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1624;
    float _2349 = _2335 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2323;
    out.m_77.y = _2343;
    out.m_77.z = _2279;
    out.m_77.w = _2287;
    out.m_79.x = _2339;
    out.m_79.y = _2341;
    out.m_79.z = _2345;
    out.m_79.w = _2347;
    out.m_81.z = _2303;
    out.m_81.w = _1624;
    out.m_45.x = _2349;
    float _2351 = _2337 * _1680;
    float _2353 = -_2337;
    float _2355 = _2353 + 1.0;
    float _2357 = _1691 * _2351;
    float _2359 = _1705 * _2351;
    float _2361 = fma(_1701, _2357, _1685);
    float _2363 = fma(_1703, _2357, _1687);
    float _2365 = _1691 * _2355;
    float _2367 = fma(_1691, _2359, _1689);
    out.m_83.x = _2361;
    out.m_83.y = _2363;
    out.m_83.z = _2367;
    out.m_83.w = _2365;
    if (_2315)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2369 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2369;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _468 = false;
    bool _344 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2426 = as_type<float>(_118);
        out.gl_Position.z = _2426;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    float _140 = _136;
    if (_132)
    {
        float _142 = float(_102);
        _138 = _142;
    }
    float _144 = _138;
    bool _146 = _136 >= _144;
    bool _148 = !_132;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_45.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2495 = as_type<float>(_156);
        out.gl_Position.z = _2495;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = _160 * _168;
    float _186 = _160 * _174;
    float _188 = fma(_158, _166, _184);
    float _190 = _160 * _180;
    float _192 = fma(_158, _172, _186);
    float _194 = fma(_158, _178, _190);
    float _196 = fma(_162, _170, _188);
    float _198 = fma(_162, _176, _192);
    float _200 = fma(_162, _182, _194);
    bool _202 = !_164;
    float _204 = _172;
    float _206 = _176;
    float _208 = _196;
    float _210 = _200;
    float _228;
    if (!_202)
    {
        float _212 = in.m_57.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_102);
        float _234 = 1.0 / _232;
        float _236 = _136 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    bool _244 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_238);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    bool _260 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_238);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -_254;
    float _274 = _272 + 1.0;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _276;
    float _280 = 1.0 / _258;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = _270 * _274;
    float _286 = -_270;
    float _288 = _286 + 1.0;
    float _290 = _242 * _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = fma(_278, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = fma(_294, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _304 = _296 * _284;
    float _306 = fma(_300, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _308 = _302 * _284;
    float _310 = _306 * _284;
    float _312 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].x, _304);
    float _314 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].y, _310);
    float _316 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].x, _312);
    float _320 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].y, _314);
    float _322 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].z, _316);
    bool _324 = !_282;
    float _342;
    if (!_324)
    {
        float _326 = in.m_57.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_102);
        float _348 = 1.0 / _346;
        float _350 = _136 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_59.x;
    float _356 = in.m_59.y;
    float _358 = in.m_59.z;
    bool _360 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _362 = isnan(_352);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _376 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _378 = isnan(_352);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _394 = _352 + _392;
    float _396 = -_370;
    float _398 = _396 + 1.0;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _402 = 1.0 / _374;
    float _404 = _386 * _398;
    float _406 = -_386;
    float _408 = _406 + 1.0;
    float _410 = _322 * _358;
    float _412 = _320 * _356;
    float _414 = _390 * _402;
    float _416 = _318 * _354;
    float _418 = fma(_414, _394, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _420 = _418 * _404;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[115].x, _420);
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _430 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[116].x, _426);
    float _436 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _440 = !_400;
    float _464;
    float _466;
    if (!_440)
    {
        float _442 = in.m_57.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _446 = float(_102);
        float _448 = 1.0 / _446;
        float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _452 = _136 * _448;
        float _454 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _456 = _454 * _444;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = _452;
        _468 = true;
    }
    else
    {
        float _470 = float(_102);
        float _472 = 1.0 / _470;
        float _474 = _136 * _472;
        _464 = _474;
        _466 = _474;
    }
    _468 = false;
    float _476 = _464;
    float _478 = _466;
    float _480 = in.m_57.z;
    float _482 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _484 = in.m_57.x;
    float _486 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _490 = _488 != 0;
    float _492 = in.m_57.y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _508 = _506 != 0;
    float _510 = _480 * 2.0;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _516 = _484 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _518 = _484 * 2.0;
    float _520 = floor(_510);
    float _522 = -_496;
    float _524 = fma(_516, 2.0, _522);
    float _526 = _484 + _492;
    float _528 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _530 = _492 * 2.0;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _534 = _526 + (-1.0);
    float _536 = floor(_518);
    float _538 = fma(_528, -2.0, _494);
    float _540 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[88].w, _532);
    float _542 = -_136;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _524);
    bool _546 = _520 > 0.0;
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _550 = _520 >= 0.0;
    bool _552 = isnan(_520);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _492 + _480;
    float _562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _564 = log2(_562);
    float _566 = _534;
    if (_490)
    {
        _566 = _492;
    }
    float _568 = _566;
    int _570 = _558 ? 0 : 1;
    float _572 = _560 + (-1.0);
    float _574 = _568;
    float _576 = _572;
    if (!_490)
    {
        _574 = _484;
    }
    float _578 = _574;
    int _580 = ~_570;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _588 = _584;
    if (!_546)
    {
        int _590 = ~_570;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = floor(_530);
    bool _598 = !_500;
    int _600 = _598 ? 0 : 1;
    float _602 = _578 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_490)
    {
        _576 = _484;
    }
    float _604 = _576;
    float _606 = _604;
    if (!_490)
    {
        _606 = _480;
    }
    float _608 = _606;
    float _610 = _564 * _136;
    bool _612 = _536 > 0.0;
    float _614 = fma(_602, -2.0, _514);
    int _616 = abs(_600);
    float _618 = _608 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _620 = float(_594);
    float _622 = exp2(_610);
    float _624 = float(_616);
    float _626 = -_512;
    float _628 = fma(_618, 2.0, _626);
    bool _630 = _536 >= 0.0;
    bool _632 = isnan(_536);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    bool _640 = _596 > 0.0;
    float _642 = _624 * _620;
    int _644 = _638 ? 0 : 1;
    float _646 = in.m_61.x;
    float _648 = in.m_61.y;
    float _650 = in.m_61.z;
    bool _652 = _596 >= 0.0;
    bool _654 = isnan(_596);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(1.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _674 = 1.0 + _672;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _678 = ~_644;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = 1.0 / _674;
    int _686 = _682;
    if (!_612)
    {
        int _688 = ~_644;
        int _690 = _688 + 1;
        _686 = _690;
    }
    int _692 = _686;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _696 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    bool _698 = !_504;
    int _700 = _698 ? 0 : 1;
    float _702 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[78].z, _694);
    float _704 = -_622;
    float _706 = _704 + 1.0;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _710 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _718 = _714 || _716;
    float _720 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _702);
    int _722 = abs(_700);
    float _724 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[88].z, _708);
    float _726 = _718 ? _706 : 0.0;
    float _728 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _614);
    float _730 = _642 * (-2.0);
    float _732 = float(_722);
    float _734 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _696);
    float _736 = float(_692);
    float _738 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _538);
    float _740 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _724);
    float _742 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _540);
    float _744 = -_136;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[86].x, _628);
    if (_670)
    {
        float _748 = _726 * _684;
        _140 = _748;
    }
    float _750 = _140;
    float _752 = _484 + (-0.5);
    float _754 = fma(_730, _646, _646);
    bool _756 = !_508;
    int _758 = _756 ? 0 : 1;
    float _760 = _732 * _736;
    int _762 = _660 ? 0 : 1;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[196].x, _754);
    float _766 = fma(_548, _730, _548);
    int _768 = abs(_758);
    float _770 = _760 * (-2.0);
    int _772 = ~_762;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = in.m_42.x;
    float _780 = in.m_42.y;
    float _782 = in.m_42.z;
    int _784 = _776;
    if (!_640)
    {
        int _786 = ~_762;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_766, _750, _764);
    float _794 = _492 + (-0.5);
    float _796 = fma(_770, _648, _648);
    float _798 = fma(_586, _770, _586);
    float _800 = float(_768);
    float _802 = _792 * 0.15915493667125701904296875;
    float _804 = float(_790);
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].y, _796);
    float _808 = _802 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _800 * _804;
    float _814 = fma(_798, _750, _806);
    float _816 = _484 + _480;
    float _818 = in.m_63.x;
    float _820 = in.m_63.y;
    float _822 = in.m_63.z;
    float _824 = _812 * (-2.0);
    float _826 = _814 * 0.15915493667125701904296875;
    float _828 = _816 + (-1.0);
    float _830 = _802 * 6.283185482025146484375;
    float _832 = cos(_830);
    float _834 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = fma(_824, _650, _650);
    float _838 = _480 + (-0.5);
    float _840 = _180 * _780;
    float _842 = fma(_834, _824, _834);
    float _844 = _168 * _780;
    float _846 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _836);
    float _848 = fma(_178, _778, _840);
    float _850 = fma(_166, _778, _844);
    float _852 = fma(_842, _750, _846);
    float _854 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = _826 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _852 * 0.15915493667125701904296875;
    float _862 = fma(_170, _782, _850);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _820);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _818);
    float _868 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _870 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _868;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _822);
    float _874 = _860 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = _854 * _866;
    float _880 = _870 * _870;
    float _882 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _884 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _882;
    float _886 = _482 * _864;
    float _888 = _486 * _872;
    float _890 = fma(_182, _782, _848);
    float _892 = _826 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = fma(_884, _884, _880);
    float _898 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _900 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _898;
    float _902 = _810 * _858;
    float _904 = _832 * _858;
    float _906 = _174 * _780;
    float _908 = fma(_900, _900, _896);
    float _910 = _860 * 6.283185482025146484375;
    float _912 = sin(_910);
    float _914 = _876 * _886;
    float _916 = _858 * _876;
    float _918 = in.m_55.w;
    float _920 = fma(_172, _778, _906);
    float _922 = _832 * _894;
    float _924 = _832 * _914;
    float _926 = sqrt(_908);
    float _928 = _894 * _876;
    float _930 = _810 * _894;
    float _932 = _810 * _914;
    float _934 = fma(_912, _922, _902);
    float _936 = -_886;
    float _938 = _912 * _936;
    float _940 = -_930;
    float _942 = fma(_912, _904, _940);
    float _944 = -_904;
    float _946 = fma(_912, _930, _944);
    float _948 = fma(_934, _878, _924);
    float _950 = fma(_928, _878, _938);
    float _952 = in.m_51.w;
    float _954 = fma(_912, _902, _922);
    float _956 = fma(_942, _888, _948);
    float _958 = fma(_946, _878, _932);
    float _960 = fma(_916, _888, _950);
    float _962 = fma(_926, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _964 = _956 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _966 = fma(_954, _888, _958);
    float _968 = _956 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _970 = _890 + _918;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].x, _964);
    float _974 = precise::max(_962, 1.0);
    float _976 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].x, _968);
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[26].z, _972);
    float _980 = precise::min(_974, 1.89999997615814208984375);
    float _982 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _984 = _978 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _986 = _982 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _988 = fma(_984, _980, _970);
    float _990 = _862 + _952;
    float _992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _994 = _988 + _992;
    float _996 = fma(_986, _980, _990);
    float _998 = _994 * _994;
    float _1000 = in.m_53.w;
    float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1004 = _996 + _1002;
    float _1006 = fma(_1004, _1004, _998);
    float _1008 = _956 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1010 = sqrt(_1006);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1008);
    float _1014 = fma(_176, _782, _920);
    float _1016 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1018 = _1014 + _1000;
    bool _1020 = _1010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1024 = fma(_1022, _980, _1018);
    float _1026 = _1022;
    if (!_1020)
    {
        _1026 = _996;
    }
    float _1028 = _1026;
    float _1030 = _1028;
    if (!_1020)
    {
        _204 = _988;
    }
    float _1032 = _204;
    float _1034 = _1032;
    if (!_1020)
    {
        _206 = _1024;
    }
    float _1036 = _206;
    bool _1038 = !_1020;
    float _1040 = _1036;
    if (!_1038)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1046 = _1010 + _1044;
        float _1048 = rsqrt(_1006);
        float _1050 = _1046 * _1042;
        float _1052 = _1024 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = _1050 * 0.15915493667125701904296875;
        float _1056 = _1054 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058 + (-1.0);
        float _1066 = fma(_1062, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = _1048 * _1066;
        float _1072 = fma(_1024, _1058, _1068);
        float _1074 = fma(_1004, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1076 = fma(_994, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1040 = _1072;
        _1030 = _1074;
        _1034 = _1076;
    }
    float _1078 = _1040;
    float _1080 = _1030;
    float _1082 = _1034;
    float _1084 = -_1018;
    float _1086 = _1084 + _1078;
    float _1088 = -_990;
    float _1090 = _1088 + _1080;
    float _1092 = -_970;
    float _1094 = _1092 + _1082;
    float _1096 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1098 = _1086 * _1086;
    float _1100 = fma(_1090, _1090, _1098);
    bool _1102 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan(0.5);
    bool _1110 = _1106 || _1108;
    bool _1112 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(0.5);
    bool _1120 = _1116 || _1118;
    float _1122 = fma(_1094, _1094, _1100);
    float _1124 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1096);
    float _1126 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = sqrt(_1122);
    float _1130 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1124);
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1134 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1138 = _1018 + _1136;
    float _1140 = 1.0 / _1132;
    float _1142 = _1138 * _1138;
    bool _1144 = _1128 > 0.0;
    float _1146 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1134);
    float _1148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1150 = _990 + _1148;
    float _1152 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1154 = fma(_1150, _1150, _1142);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1158 = _970 + _1156;
    float _1160 = _1152 + _1132;
    float _1162 = fma(_1158, _1158, _1154);
    float _1164 = _1160 * _1140;
    float _1166 = _1164 * 0.5;
    float _1168 = _1154;
    float _1170 = _1160;
    float _1172 = _1078;
    float _1174 = _1086;
    float _1176 = _1082;
    float _1178 = _1080;
    if (!_1144)
    {
        _1168 = _1080;
    }
    float _1180 = _1168;
    float _1182 = _1180;
    if (!_1144)
    {
        _1170 = _1082;
    }
    float _1184 = _1170;
    bool _1186 = !_1144;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = _198 * _198;
        float _1192 = rsqrt(_1122);
        float _1194 = fma(_196, _196, _1190);
        float _1196 = fma(_200, _200, _1194);
        float _1198 = sqrt(_1196);
        float _1200 = _1090 * _1192;
        float _1202 = _1086 * _1192;
        float _1204 = _1094 * _1192;
        bool _1206 = _1198 > 0.0;
        float _1208 = _1198;
        float _1210 = _1192;
        if (!_1206)
        {
            _1208 = _1080;
        }
        float _1212 = _1208;
        _1182 = _1212;
        if (!_1206)
        {
            _1210 = _1082;
        }
        float _1214 = _1210;
        bool _1216 = !_1206;
        _1188 = _1214;
        if (!_1216)
        {
            float _1218 = rsqrt(_1196);
            float _1220 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1222 = _198 * _1218;
            float _1224 = _196 * _1218;
            float _1226 = _1202 * _1222;
            float _1228 = _200 * _1218;
            float _1230 = fma(_1200, _1224, _1226);
            float _1232 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1234 = fma(_1204, _1228, _1230);
            float _1236 = _1234 * _1232;
            float _1238 = fma(_196, _1236, _1080);
            float _1240 = fma(_198, _1236, _1078);
            float _1242 = fma(_200, _1236, _1082);
            _1182 = _1238;
            _1172 = _1240;
            _1188 = _1242;
            _1174 = _1236;
        }
    }
    float _1244 = _1182;
    float _1246 = _1172;
    float _1248 = _1188;
    float _1250 = _1174;
    float _1252 = _1250;
    if (_1120)
    {
        _1252 = 1.0;
    }
    float _1254 = _1252;
    float _1256 = _1254;
    if (_1110)
    {
        _208 = _1244;
    }
    float _1258 = _208;
    float _1260 = _1258;
    if (_1110)
    {
        _1176 = _1246;
    }
    float _1262 = _1176;
    float _1264 = _1262;
    if (_1110)
    {
        _1178 = _1248;
    }
    float _1266 = _1178;
    float _1268 = _1266;
    if (!_1110)
    {
        float _1270 = sqrt(_1162);
        float _1272 = -_990;
        float _1274 = _1272 + _1244;
        float _1276 = -_970;
        float _1278 = _1276 + _1248;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1284 = precise::min(_1270, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1288 = _1284 * _1282;
        float _1290 = -_1018;
        float _1292 = _1290 + _1246;
        float _1294 = _1286 * _1288;
        float _1296 = fma(_1274, _1294, _990);
        float _1298 = fma(_1292, _1294, _1018);
        float _1300 = fma(_1278, _1294, _970);
        _1264 = _1298;
        _1260 = _1296;
        _1268 = _1300;
    }
    float _1302 = _1264;
    float _1304 = _1260;
    float _1306 = _1268;
    if (!_1120)
    {
        float _1308 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1312 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
        float _1314 = _1308 * 0.15915493667125701904296875;
        float _1316 = _1314 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        float _1320 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = _1314 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = 1.0 / _1318;
        float _1330 = _1322 * 6.283185482025146484375;
        float _1332 = cos(_1330);
        float _1334 = _1326 * _1328;
        float _1336 = 1.0 / _1312;
        float _1338 = _1332 * _1334;
        float _1340 = _1322 * 6.283185482025146484375;
        float _1342 = sin(_1340);
        float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1346 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1350 = _1336 * _1348;
        float _1352 = 1.0 / _1338;
        float _1354 = 1.0 / _1346;
        float _1356 = _1342 * _1352;
        float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1360 = fma(_1356, _1350, _1358);
        float _1362 = _1360 * _1354;
        float _1364 = precise::clamp(_1362, 0.0, 1.0);
        _1256 = _1364;
    }
    float _1366 = _1256;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1370 = _1302 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1304 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1378 = _1306 + _1376;
    float _1380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1382 = _1370 * _1370;
    float _1384 = fma(_1374, _1374, _1382);
    float _1386 = precise::max(0.0, _1380);
    float _1388 = fma(_1378, _1378, _1384);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1374 * _1394;
    float _1398 = _1378 * _1394;
    float _1400 = -_1394;
    float _1402 = -_1386;
    float _1404 = fma(_1370, _1400, _1402);
    float _1406 = _1396 * _1396;
    float _1408 = _1398 * _1398;
    float _1410 = _1406 + _1408;
    float _1412 = sqrt(_1410);
    bool _1414 = _1412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1418 = _1412 + _1416;
    float _1420 = _1378;
    float _1422 = _1386;
    float _1424 = _1370;
    float _1426 = _1418;
    float _1428 = _1382;
    if (_1414)
    {
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1420 = _1430;
    }
    float _1432 = _1420;
    if (_1414)
    {
        float _1434 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1434;
    }
    float _1436 = _1422;
    float _1438 = _1436;
    if (!_1414)
    {
        _1424 = _1396;
    }
    float _1440 = _1424;
    float _1442 = _1432;
    float _1444 = _1440;
    if (_1414)
    {
        float _1446 = _1418 * _1432;
        _1426 = _1446;
    }
    float _1448 = _1426;
    if (_1414)
    {
        float _1450 = rsqrt(_1410);
        _1442 = _1450;
    }
    float _1452 = _1442;
    float _1454 = _1452;
    if (_1414)
    {
        float _1456 = _1448 * 0.15915493667125701904296875;
        _1428 = _1456;
    }
    float _1458 = _1428;
    float _1460 = _1448;
    float _1462 = _1458;
    if (_1414)
    {
        float _1464 = _1458 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        _1460 = _1466;
    }
    float _1468 = _1460;
    float _1470 = _1390;
    if (_1414)
    {
        float _1472 = _1458 * 6.283185482025146484375;
        float _1474 = cos(_1472);
        _1470 = _1474;
    }
    float _1476 = _1470;
    float _1478 = _1468;
    if (_1414)
    {
        float _1480 = fma(_1468, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1478 = _1480;
    }
    float _1482 = _1478;
    float _1484 = _1482;
    if (_1414)
    {
        float _1486 = _1452 * _1482;
        _210 = _1486;
    }
    float _1488 = _210;
    if (!_1414)
    {
        _1484 = _1404;
    }
    float _1490 = _1484;
    float _1492 = _1490;
    if (!_1414)
    {
        _1454 = _1406;
    }
    float _1494 = _1454;
    float _1496 = _1494;
    float _1498 = _1476;
    if (_1414)
    {
        float _1500 = _1476 + (-1.0);
        _1438 = _1500;
    }
    float _1502 = _1438;
    float _1504 = _1502;
    if (_1414)
    {
        float _1506 = _1396 * _1488;
        _1444 = _1506;
    }
    float _1508 = _1444;
    if (_1414)
    {
        float _1510 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1462 = _1510;
    }
    float _1512 = _1462;
    if (!_1414)
    {
        _1504 = _1398;
    }
    float _1514 = _1504;
    float _1516 = _1514;
    if (_1414)
    {
        float _1518 = _1398 * _1488;
        _1516 = _1518;
    }
    float _1520 = _1516;
    if (_1414)
    {
        float _1522 = _1508 * _1508;
        _1496 = _1522;
    }
    float _1524 = _1496;
    if (_1414)
    {
        float _1526 = fma(_1404, _1476, _1512);
        _1492 = _1526;
    }
    float _1528 = _1492;
    if (!_1414)
    {
        _1498 = _1408;
    }
    float _1530 = _1498;
    float _1532 = _1530;
    if (_1414)
    {
        float _1534 = _1520 * _1520;
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = fma(_1528, _1528, _1524);
    float _1540 = _1538 + _1536;
    float _1542 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1546 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1544);
    float _1548 = precise::clamp(_1546, 0.0, 1.0);
    float _1550 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1554 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1556 = rsqrt(_1540);
    float _1558 = -_1548;
    float _1560 = _1558 + 1.0;
    float _1562 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1564 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1554);
    float _1566 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1550);
    float _1568 = _1302 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1562);
    float _1574 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1576 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1568);
    float _1578 = abs(_1560);
    float _1580 = log2(_1578);
    float _1582 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1572);
    float _1584 = _1574 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1586 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1588 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1590 = _1556 * _1508;
    float _1592 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1596 = _1556 * _1528;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1600 = _1556 * _1520;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1594);
    float _1604 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1606 = -_1598;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1606);
    float _1610 = -_1588;
    float _1612 = fma(_1610, _1552, 1.0);
    float _1614 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1616 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1618 = -_1600;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1608);
    float _1622 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1626 = log2(_1612);
    float _1628 = fma(_1620, -0.5, 0.5);
    float _1630 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1632 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1634 = fma(_1620, 0.5, 0.5);
    float _1636 = _1596 + 1.0;
    float _1638 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1630);
    float _1640 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1632);
    float _1642 = 1.0 / _1624;
    float _1644 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1638);
    float _1646 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1640);
    float _1648 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1650 = exp2(_1616);
    float _1652 = _1626 * 0.693147182464599609375;
    float _1654 = sqrt(_1628);
    float _1656 = fma(_1634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1658 = _1646 * _1642;
    float _1660 = _1648 * _1642;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1664 = fma(_1634, _1656, -0.212114393711090087890625);
    float _1666 = fma(_1658, 0.5, 0.5);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = -_1596;
    float _1672 = fma(_1650, _1636, _1670);
    float _1674 = fma(_1634, _1664, 1.570728778839111328125);
    float _1676 = fma(_1672, 0.5, 0.5);
    float _1678 = _1654 * 0.636619746685028076171875;
    float3 _4886 = float3(_1666, _1668, _1662);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4886, float3(0.0), isnan(_4886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4886, float3(0.0), isnan(_4886)), level(0.0)).x;
    float3 _4897 = float3(_1666, _1668, _1662);
    float4 _1683 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4897, float3(0.0), isnan(_4897)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4897, float3(0.0), isnan(_4897)), level(0.0)).xyzw;
    float _1685 = _1683.x;
    float _1687 = _1683.y;
    float _1689 = _1683.z;
    float _1691 = _1683.w;
    float _1693 = -_1674;
    float _1695 = fma(_1678, _1693, 1.0);
    float2 _4919 = float2(_1695, _1676);
    float3 _1699 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4919, float2(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4919, float2(0.0), isnan(_4919)), level(0.0)).xyz;
    float _1701 = _1699.x;
    float _1703 = _1699.y;
    float _1705 = _1699.z;
    float _1707 = in.m_65.y;
    bool _1709 = _492 > 0.5;
    float _1711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1713 = in.m_57.w;
    out.m_67.x = _430;
    out.m_67.y = _432;
    out.m_67.z = _436;
    out.m_67.w = _438;
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1717 = _1715 != 0;
    float _1719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1721 = _480 > 0.5;
    float _1723 = in.m_69.x;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1727 = _1725 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1729 = in.m_69.z;
    float _1731 = 1.0 / _1727;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1735 = _1733 != 0;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1739 = _1737 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1749 = -_1707;
    float _1751 = _1749 + 1.0;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1755 = _1753 != 0;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1763 = _1761 != 0;
    float _1765 = 1.0 / _1739;
    int _1767 = _1709 ? as_type<int>(_1751) : as_type<int>(_1707);
    float _1769 = in.m_69.w;
    int _1771 = _1721 ? as_type<int>(_1751) : as_type<int>(_1707);
    float _1773 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1775 = _1717 ? as_type<float>(_1767) : _1707;
    float _1777 = in.m_69.y;
    int _1779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1781 = _1779 != 0;
    float _1783 = 1.0 / _1759;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1787 = _1785 != 0;
    out.m_71.x = _1723;
    float _1789 = _1735 ? as_type<float>(_1771) : _1707;
    float _1791 = fma(_1773, _1775, -0.5);
    bool _1793 = _1713 > 0.5;
    out.m_71.z = _1729;
    float _1795 = 1.0 / _1747;
    float _1797 = -_738;
    float _1799 = fma(_734, _1791, _1797);
    float _1801 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1803 = _1707;
    bool _1805 = _1781;
    float _1807 = _1791;
    if (_1781)
    {
        float _1809 = _1793 ? _1751 : _1707;
        _1803 = _1809;
    }
    float _1811 = _1803;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1821;
    float _1825 = 1.0 / _1743;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1831 = _1823 * _1731;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1839 = _1837 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_1755)
    {
        bool _1841 = _484 > 0.5;
        _1805 = _1841;
    }
    bool _1843 = _1805;
    float _1845 = 1.0 / _1819;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1849 = _1847 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    out.m_71.w = _1769;
    bool _1851 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1853 = isnan(_476);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = fma(_1789, _1801, -0.5);
    bool _1865 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1867 = isnan(_476);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = 1.0 / _1829;
    out.m_71.y = _1777;
    bool _1879 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1881 = isnan(_478);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    float _1891 = -_728;
    float _1893 = fma(_742, _1863, _1891);
    float _1895 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1897 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1899 = isnan(_478);
    bool _1901 = _1897 || _1899;
    bool _1903 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1905 = _1901 || _1903;
    float _1907 = float(_1905);
    float _1909 = 1.0 / _1849;
    float _1911 = _1839 * _1845;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1917 = _1915 * _1825;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1919;
    float _1923 = 1.0 / _1815;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1925;
    float _1929 = _1927 * _1783;
    float _1931 = in.m_65.x;
    float _1933 = 1.0 / _1835;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1935;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1939;
    float _1943 = _1937 * _1765;
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1949 = _1941 * _1795;
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1953 = _1951 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1955 = _1921 * _1923;
    float _1957 = _1947 * _1877;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1959;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1965 = _476 + _1963;
    float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1969 = _476 + _1967;
    bool _1971 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1973 = isnan(_476);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1979 = _1975 || _1977;
    float _1981 = float(_1979);
    float _1983 = _1961 * _1909;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1987 = _478 + _1985;
    float _1989 = _1953 * _1933;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1993 = _476 + _1991;
    float _1995 = fma(_1831, _1965, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1997 = fma(_1943, _1987, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2001 = _478 + _1999;
    float _2003 = fma(_1911, _1993, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2005 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2007 = _478 + _2005;
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2011 = _478 + _2009;
    float _2013 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2015 = _478 + _2013;
    float _2017 = fma(_1955, _2001, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2019 = fma(_1917, _2007, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2021 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2023 = isnan(_478);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = fma(_1929, _1969, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2035 = fma(_1957, _2011, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2039 = _478 + _2037;
    float _2041 = fma(_1949, _2015, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _2043 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2045 = isnan(_478);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2057 = _478 + _2055;
    float _2059 = fma(_1989, _2039, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2061 = -_2031;
    float _2063 = _2061 + 1.0;
    bool _2065 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2067 = isnan(_478);
    bool _2069 = _2065 || _2067;
    bool _2071 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2073 = _2069 || _2071;
    float _2075 = float(_2073);
    float _2077 = fma(_1983, _2057, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2079 = -_2053;
    float _2081 = _2079 + 1.0;
    bool _2083 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2085 = isnan(_478);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = _2053 * _2063;
    bool _2097 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2099 = isnan(_476);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    float _2109 = _2075 * _2081;
    float _2111 = -_2075;
    float _2113 = _2111 + 1.0;
    bool _2115 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2117 = isnan(_478);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2123 = _2119 || _2121;
    float _2125 = float(_2123);
    float _2127 = -_2093;
    float _2129 = _2127 + 1.0;
    float _2131 = -_1981;
    float _2133 = _2131 + 1.0;
    float _2135 = _2093 * _2113;
    bool _2137 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2139 = isnan(_478);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = _2125 * _2129;
    float _2151 = -_1889;
    float _2153 = _2151 + 1.0;
    float _2155 = -_2125;
    float _2157 = _2155 + 1.0;
    float _2159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2161 = _2057;
    int _2163 = as_type<int>(_1995);
    float _2165 = _1931;
    if (!_1755)
    {
        _2161 = _1931;
    }
    float _2167 = _2161;
    float _2169 = _2147 * _2153;
    float _2171 = -_2147;
    float _2173 = _2171 + 1.0;
    float _2175 = _1889 * _2157;
    float _2177 = _1875 * _2133;
    float _2179 = -_1875;
    float _2181 = _2179 + 1.0;
    float _2183 = _1907 * _2173;
    float _2185 = -_1907;
    float _2187 = _2185 + 1.0;
    int _2189 = as_type<int>(_2173);
    float _2191 = _2167;
    if (_1787)
    {
        float _2193 = -_1931;
        float _2195 = _2193 + 1.0;
        _2189 = as_type<int>(_2195);
    }
    int _2197 = _2189;
    float _2199 = _1861 * _2181;
    float _2201 = _1997 * _2183;
    float _2203 = -_1861;
    float _2205 = _2203 + 1.0;
    float _2207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2209 = _1995 * _2199;
    float _2211 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2201);
    int _2213 = as_type<int>(_2205);
    if (_1755)
    {
        float _2215 = -_1931;
        float _2217 = _2215 + 1.0;
        _2163 = as_type<int>(_2217);
    }
    int _2219 = _2163;
    if (!_1763)
    {
        _1807 = _1931;
    }
    float _2221 = _1807;
    float _2223 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2209);
    float _2225 = _2221;
    if (_1763)
    {
        float _2227 = -_1931;
        float _2229 = _2227 + 1.0;
        _2213 = as_type<int>(_2229);
    }
    int _2231 = _2213;
    float _2233 = fma(_2019, _2169, _2211);
    if (_1755)
    {
        float _2235 = _1843 ? as_type<float>(_2219) : _1931;
        _2191 = _2235;
    }
    float _2237 = _2191;
    float _2239 = -_2107;
    float _2241 = _2239 + 1.0;
    float _2243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2245 = fma(_2041, _2175, _2233);
    if (_1763)
    {
        float _2247 = _1721 ? as_type<float>(_2231) : _1931;
        _2225 = _2247;
    }
    float _2249 = _2225;
    float _2251 = _1981 * _2241;
    if (_1787)
    {
        float _2253 = _1709 ? as_type<float>(_2197) : _1931;
        _2165 = _2253;
    }
    float _2255 = _2165;
    float _2257 = fma(_2035, _2149, _2245);
    float _2259 = _2207 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2261 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2265 = fma(_2017, _2135, _2257);
    float _2267 = fma(_2259, _2255, -0.5);
    float _2269 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2261);
    float _2271 = _2249 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2273 = fma(_740, _2267, _746);
    float _2275 = fma(_2059, _2109, _2265);
    float _2277 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2279 = _2271 * _2159;
    float _2281 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2283 = fma(_2077, _2095, _2275);
    float _2285 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2277);
    float _2287 = _1895 * _2243;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2291 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2283);
    float _2293 = exp2(_2281);
    float _2295 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2297 = _2285 + _1624;
    float _2299 = fma(_2003, _2177, _2223);
    float _2301 = fma(_2295, _2237, -0.5);
    float _2303 = _2297 * 0.5;
    float _2305 = fma(_2033, _2251, _2299);
    bool _2307 = _1366 > 0.0;
    bool _2309 = isnan(_1366);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(0.0);
    bool _2315 = _2311 || _2313;
    float _2317 = fma(_720, _2301, _544);
    float _2319 = _2273 + 0.5;
    float _2321 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2305);
    float _2323 = _2317 + 0.5;
    float _2325 = _1893 + 0.5;
    float _2327 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2329 = -_2293;
    float _2331 = _2329 + 1.0;
    float _2333 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2335 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_73.x = _2319;
    out.m_73.y = _2325;
    float _2337 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2339 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2341 = _2327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _2291;
    float _2343 = _1799 + 0.5;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2347 = _2321 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1648;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1624;
    float _2349 = _2335 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2323;
    out.m_77.y = _2343;
    out.m_77.z = _2279;
    out.m_77.w = _2287;
    out.m_79.x = _2339;
    out.m_79.y = _2341;
    out.m_79.z = _2345;
    out.m_79.w = _2347;
    out.m_81.z = _2303;
    out.m_81.w = _1624;
    out.m_45.x = _2349;
    float _2351 = _2337 * _1680;
    float _2353 = -_2337;
    float _2355 = _2353 + 1.0;
    float _2357 = _1691 * _2351;
    float _2359 = _1705 * _2351;
    float _2361 = fma(_1701, _2357, _1685);
    float _2363 = fma(_1703, _2357, _1687);
    float _2365 = _1691 * _2355;
    float _2367 = fma(_1691, _2359, _1689);
    out.m_83.x = _2361;
    out.m_83.y = _2363;
    out.m_83.z = _2367;
    out.m_83.w = _2365;
    if (_2315)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2369 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2369;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

