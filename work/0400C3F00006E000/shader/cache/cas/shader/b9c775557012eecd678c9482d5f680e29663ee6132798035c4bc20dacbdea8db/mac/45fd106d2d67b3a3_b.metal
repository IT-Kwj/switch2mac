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
    float4 m_77 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2237 = false;
    bool _346 = false;
    bool _232 = false;
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
        float _2542 = as_type<float>(_128);
        out.gl_Position.z = _2542;
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
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2612 = as_type<float>(_166);
        out.gl_Position.z = _2612;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
    float _194 = _170 * _178;
    float _196 = _170 * _184;
    float _198 = fma(_168, _176, _194);
    float _200 = _170 * _190;
    float _202 = fma(_168, _182, _196);
    float _204 = fma(_172, _180, _198);
    float _206 = fma(_168, _188, _200);
    float _208 = fma(_172, _186, _202);
    float _210 = fma(_172, _192, _206);
    bool _212 = !_174;
    float _230;
    if (!_212)
    {
        float _214 = in.m_63.x;
        float _216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _222 = _220 * _216;
        float _224 = floor(_222);
        float _226 = -_224;
        float _228 = _222 + _226;
        _230 = _228;
        _232 = true;
    }
    else
    {
        float _234 = float(_112);
        float _236 = 1.0 / _234;
        float _238 = _146 * _236;
        _230 = _238;
    }
    _232 = false;
    float _240 = _230;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _240 + _242;
    bool _246 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_240);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _260;
    float _266 = -_256;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = _244 * _264;
    bool _276 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_240);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = fma(_272, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _294;
    float _298 = _286 * _268;
    float _300 = fma(_290, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_296, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = -_286;
    float _306 = _304 + 1.0;
    float _308 = _292 * _298;
    float _310 = _300 * _298;
    float _312 = _302 * _298;
    float _314 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _316 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _312);
    float _320 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].x, _316);
    float _322 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].y, _318);
    float _324 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].z, _314);
    bool _326 = !_262;
    float _344;
    if (!_326)
    {
        float _328 = in.m_63.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_112);
        float _350 = 1.0 / _348;
        float _352 = _146 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    float _356 = in.m_65.x;
    float _358 = in.m_65.y;
    float _360 = in.m_65.z;
    float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _364 = log2(_362);
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _378 = _376 != 0;
    float _380 = in.m_67.y;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _392 = _390 != 0;
    float _394 = in.m_69.y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _398 = in.m_63.y;
    float _400 = _364 * _146;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _404 = in.m_63.z;
    float _406 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = in.m_63.x;
    float _410 = _320 * _356;
    float _412 = exp2(_400);
    float _414 = _184 * _368;
    float _416 = _190 * _368;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _420 = _368 + _380;
    float _422 = in.m_69.x;
    float _424 = -_394;
    float _426 = _424 + 1.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _436 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _438 = _398 > 0.5;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _442 = 1.0 / _434;
    float _444 = fma(_182, _366, _414);
    float _446 = _394;
    float _448 = _436;
    if (_374)
    {
        float _450 = _438 ? _426 : _394;
        _446 = _450;
    }
    float _452 = _446;
    float _454 = _404 * 2.0;
    float _456 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = fma(_188, _366, _416);
    bool _460 = _408 > 0.5;
    bool _462 = _460 && _378;
    float _464 = in.m_59.w;
    float _466 = 1.0 / _430;
    float _468 = fma(_186, _370, _444);
    out.m_71.x = _456;
    out.m_71.y = _436;
    out.m_71.z = _406;
    out.m_71.w = _402;
    bool _470 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = fma(_192, _370, _458);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _484 = 1.0 + _482;
    float _486 = floor(_454);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _488;
    float _492 = _398 + _404;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = -_412;
    float _500 = _498 + 1.0;
    float _502 = _492 + (-1.0);
    float _504 = _490 * _442;
    float _506 = _496 * _466;
    float _508 = _496;
    if (!_378)
    {
        _508 = _422;
    }
    float _510 = _508;
    float _512 = 1.0 / _484;
    float _514 = _510;
    if (_378)
    {
        _448 = _422;
    }
    float _516 = _448;
    float _518 = _408 + _398;
    float _520 = _408 * 2.0;
    float _522 = in.m_61.w;
    float _524 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = _516;
    int _528 = as_type<int>(_524);
    if (_462)
    {
        float _530 = -_516;
        float _532 = _530 + 1.0;
        _526 = _532;
    }
    float _534 = _526;
    bool _536 = _486 > 0.0;
    float _538 = _398 * 2.0;
    bool _540 = _486 >= 0.0;
    bool _542 = isnan(_486);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = _518 + (-1.0);
    if (_378)
    {
        _514 = _534;
    }
    float _552 = _514;
    float _554 = floor(_520);
    float _556 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _558 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _566 = _562 || _564;
    float _568 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _570 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = isnan(_354);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _584 = _566 ? _500 : 0.0;
    float _586 = floor(_538);
    bool _588 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _590 = isnan(_354);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -_580;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _354 + _604;
    if (_478)
    {
        float _608 = _584 * _512;
        _148 = _608;
    }
    float _610 = _148;
    bool _612 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_354);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = _598 * _602;
    float _626 = -_598;
    float _628 = _626 + 1.0;
    float _630 = fma(_504, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _632 = _554 > 0.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _354 + _634;
    float _638 = _622 * _628;
    float _640 = _468 + _464;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    bool _646 = _554 >= 0.0;
    bool _648 = isnan(_554);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = _630 * _638;
    int _658 = _548 ? 0 : 1;
    float _660 = _480 + _522;
    int _662 = _654 ? 0 : 1;
    float _664 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _656);
    int _666 = ~_658;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _674 = !_384;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_506, _636, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _680 = _670;
    if (!_536)
    {
        int _682 = ~_658;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _690 = _420 + _688;
    bool _692 = _586 > 0.0;
    float _694 = fma(_678, _624, _664);
    int _696 = ~_662;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _704 = abs(_676);
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _708 = _700;
    if (!_632)
    {
        int _710 = ~_662;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _718 = _640 + _716;
    bool _720 = _586 >= 0.0;
    bool _722 = isnan(_586);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _732 = _660 + _730;
    float _734 = float(_704);
    float _736 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[28].x, _706);
    float _738 = float(_686);
    float _740 = _452 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _742 = _728 ? 0 : 1;
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].z, _736);
    float _746 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[117].x, _694);
    float _748 = _734 * _738;
    int _750 = ~_742;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _740 * _672;
    bool _758 = !_388;
    int _760 = _758 ? 0 : 1;
    float _762 = _568 * _702;
    int _764 = _754;
    float _766 = _762;
    if (!_692)
    {
        int _768 = ~_742;
        int _770 = _768 + 1;
        _764 = _770;
    }
    int _772 = _764;
    float _774 = in.m_73.x;
    float _776 = in.m_73.y;
    float _778 = in.m_73.z;
    float _780 = _746 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _782 = abs(_760);
    out.m_75.x = _762;
    out.m_75.y = _756;
    bool _784 = _744 >= 0.0;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _788 = _748 * (-2.0);
    float _790 = _690 * _690;
    float _792 = float(_714);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _798 = fma(_718, _718, _790);
    float _800 = float(_782);
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = fma(_732, _732, _798);
    float _808 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _800 * _792;
    if (_784)
    {
        _766 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _812 = _766;
    float _814 = fma(_582, _788, _582);
    if (_784)
    {
        out.m_51.x = 0.0;
    }
    float _816 = rsqrt(_806);
    float _818 = _810 * (-2.0);
    float _820 = fma(_788, _774, _774);
    out.m_77.x = _802;
    out.m_77.y = _804;
    out.m_77.z = _808;
    out.m_77.w = _780;
    float _822 = _408 + (-0.5);
    float _824 = fma(_524, _818, _524);
    if (_784)
    {
        float _826 = _812 * 5.0;
        _528 = as_type<int>(_826);
    }
    int _828 = _528;
    float _830 = fma(_818, _776, _776);
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[196].x, _820);
    float _834 = _398 + (-0.5);
    if (_784)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3646 = as_type<float>(_828);
        out.gl_Position.z = _3646;
    }
    float _836 = fma(_814, _610, _832);
    bool _838 = !_392;
    int _840 = _838 ? 0 : 1;
    int _842 = abs(_840);
    float _844 = _556 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _846 = float(_842);
    float _848 = _844 * _816;
    float _850 = _718 * _848;
    float _852 = _690 * _848;
    if (_784)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _854 = -_852;
    float _856 = _420 + _854;
    float _858 = _732 * _848;
    float _860 = -_850;
    float _862 = _640 + _860;
    float _864 = float(_772);
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = _856 + _866;
    float _870 = _836 * 0.15915493667125701904296875;
    float _872 = -_858;
    float _874 = _660 + _872;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _862 + _876;
    float _880 = _868 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = -_852;
    float _884 = _690 + _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = _874 + _886;
    float _890 = _846 * _864;
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = -_850;
    float _896 = _718 + _894;
    float _898 = _884 * _884;
    float _900 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _830);
    float _902 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _904 = _890 * (-2.0);
    float _906 = fma(_896, _896, _898);
    float _908 = -_858;
    float _910 = _732 + _908;
    float _912 = _408 + _404;
    bool _914 = _902 >= 0.0;
    float _916 = fma(_824, _610, _900);
    float _918 = fma(_904, _778, _778);
    float _920 = _404 + (-0.5);
    float _922 = fma(_910, _910, _906);
    float _924 = _912 + (-1.0);
    float _926 = _916 * 0.15915493667125701904296875;
    float _928 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _918);
    float _930 = _870 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _936 = _918;
    float _938 = _888;
    if (_914)
    {
        _936 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _940 = _936;
    float _942 = fma(_934, _904, _934);
    int _944 = as_type<int>(_940);
    if (_914)
    {
        out.m_51.x = 0.0;
    }
    float _946 = _926 * 6.283185482025146484375;
    float _948 = sin(_946);
    if (_914)
    {
        float _950 = _940 * 5.0;
        _944 = as_type<int>(_950);
    }
    int _952 = _944;
    float _954 = fma(_942, _610, _928);
    if (_914)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_952);
        out.gl_Position.z = _3843;
    }
    float _956 = _926 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = sqrt(_922);
    float _962 = _870 * 6.283185482025146484375;
    float _964 = cos(_962);
    float _966 = _954 * 0.15915493667125701904296875;
    if (_914)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _968 = in.m_79.x;
    float _970 = in.m_79.y;
    float _972 = in.m_79.z;
    float _974 = _966 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = _322 * _358;
    float _980 = _816 * _960;
    float _982 = _324 * _360;
    float _984 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = _964 * _958;
    float _988 = _964 * _948;
    float _990 = _966 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = _932 * _958;
    float _996 = _932 * _948;
    float _998 = _556 * _980;
    float _1000 = _964 * _976;
    float _1002 = _958 * _976;
    float _1004 = _980 * _984;
    float _1006 = _932 * _976;
    float _1008 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1010 = _948 * _976;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _970);
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _968);
    float _1016 = _1012 * _1004;
    float _1018 = _980 * _1008;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _972);
    float _1022 = _1014 * _998;
    float _1024 = fma(_992, _986, _996);
    float _1026 = _1000 * _1016;
    float _1028 = _1020 * _1018;
    float _1030 = -_1016;
    float _1032 = _992 * _1030;
    float _1034 = -_994;
    float _1036 = fma(_992, _988, _1034);
    float _1038 = fma(_1024, _1022, _1026);
    float _1040 = -_988;
    float _1042 = fma(_992, _994, _1040);
    float _1044 = fma(_1002, _1022, _1032);
    float _1046 = _1006 * _1016;
    float _1048 = fma(_1036, _1028, _1038);
    float _1050 = fma(_992, _996, _986);
    float _1052 = fma(_1010, _1028, _1044);
    float _1054 = fma(_1042, _1022, _1046);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1062 = fma(_1050, _1028, _1054);
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1056);
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1060);
    float _1070 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1064);
    float _1072 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1074 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1076 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1082 = _660 + _1076;
    float _1084 = _640 + _1078;
    float _1086 = _420 + _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1084 + _1092;
    float _1096 = _1090 * _1090;
    float _1098 = fma(_1094, _1094, _1096);
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1096;
    float _1106 = _1084;
    float _1108 = _1082;
    if (!_1102)
    {
        _1104 = _1086;
    }
    float _1110 = _1104;
    bool _1112 = !_1102;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1100 + _1118;
        float _1122 = rsqrt(_1098);
        float _1124 = _1120 * _1116;
        float _1126 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = _1124 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 + (-1.0);
        float _1140 = fma(_1136, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1142 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = _1122 * _1140;
        float _1146 = fma(_1086, _1132, _1142);
        float _1148 = fma(_1094, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1090, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1106 = _1148;
        _1108 = _1150;
        _1114 = _1146;
    }
    float _1152 = _1106;
    float _1154 = _1108;
    float _1156 = _1114;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1160 = _1152 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1164 = _1154 + _1162;
    float _1166 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1168 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4194 = float2(_1166, _1168);
    float _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4194, float2(0.0), isnan(_4194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4194, float2(0.0), isnan(_4194)), level(0.0)).x;
    float _1172 = -_420;
    float _1174 = _1172 + _1156;
    float _1176 = -_640;
    float _1178 = _1176 + _1152;
    float _1180 = -_660;
    float _1182 = _1180 + _1154;
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1192 = _1188 || _1190;
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_1170, 100.0, _420);
    float _1206 = _1174 * _1174;
    float _1208 = fma(_1170, 100.0, _1156);
    float _1210 = -_852;
    float _1212 = _1210 + _1204;
    float _1214 = fma(_1178, _1178, _1206);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1182, _1182, _1214);
    float _1222 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1216);
    float _1224 = sqrt(_1220);
    float _1226 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1222);
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1230 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1232 = 1.0 / _1228;
    float _1234 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1230);
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1238 = _1224 > 0.0;
    float _1240 = _1236 + _1228;
    float _1242 = _1240 * _1232;
    float _1244 = _1242 * 0.5;
    float _1246 = _1232;
    float _1248 = _1244;
    float _1250 = _1154;
    float _1252 = _1156;
    if (!_1238)
    {
        _1246 = _1208;
    }
    float _1254 = _1246;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = _1254;
    float _1262 = _1254;
    if (!_1238)
    {
        _1248 = _1152;
    }
    float _1264 = _1248;
    float _1266 = 1.0 / _1258;
    bool _1268 = !_1238;
    float _1270 = _1264;
    if (!_1268)
    {
        float _1272 = _204 * _204;
        float _1274 = rsqrt(_1220);
        float _1276 = fma(_208, _208, _1272);
        float _1278 = fma(_210, _210, _1276);
        float _1280 = sqrt(_1278);
        float _1282 = _1174 * _1274;
        float _1284 = _1178 * _1274;
        float _1286 = _1182 * _1274;
        bool _1288 = _1280 > 0.0;
        float _1290 = _1280;
        _1252 = _1274;
        if (!_1288)
        {
            _1290 = _1152;
        }
        float _1292 = _1290;
        _1270 = _1292;
        if (!_1288)
        {
            _1260 = _1208;
        }
        float _1294 = _1260;
        bool _1296 = !_1288;
        _1262 = _1294;
        if (!_1296)
        {
            float _1298 = rsqrt(_1278);
            float _1300 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1302 = _204 * _1298;
            float _1304 = _208 * _1298;
            float _1306 = _210 * _1298;
            float _1308 = _1282 * _1302;
            float _1310 = fma(_1284, _1304, _1308);
            float _1312 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1314 = fma(_1286, _1306, _1310);
            float _1316 = _1314 * _1312;
            float _1318 = fma(_208, _1316, _1152);
            float _1320 = fma(_204, _1316, _1208);
            float _1322 = fma(_210, _1316, _1154);
            _1270 = _1318;
            _1250 = _1322;
            _1262 = _1320;
            _1252 = _1316;
        }
    }
    float _1324 = _1270;
    float _1326 = _1250;
    float _1328 = _1262;
    float _1330 = _1252;
    float _1332 = -_850;
    float _1334 = _1332 + _1324;
    float _1336 = -_858;
    float _1338 = _1336 + _1326;
    float _1340 = -_852;
    float _1342 = _1340 + _1328;
    float _1344 = _1330;
    float _1346 = _1342;
    float _1348 = _1334;
    float _1350 = _1338;
    float _1352 = _1326;
    if (_1202)
    {
        _1344 = 1.0;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1192)
    {
        float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1360 = _1212 + _1358;
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1364 = -_660;
        float _1366 = _1364 + _1326;
        float _1368 = -_1204;
        float _1370 = _1368 + _1328;
        float _1372 = _1360 * _1360;
        float _1374 = fma(_878, _878, _1372);
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1378 = fma(_888, _888, _1374);
        float _1380 = 1.0 / _980;
        float _1382 = sqrt(_1378);
        float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1386 = precise::min(_1382, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1388 = _1386 * _1362;
        float _1390 = -_640;
        float _1392 = _1390 + _1324;
        float _1394 = _1388 * _1380;
        float _1396 = _1384 * _1394;
        float _1398 = _1366 * _1394;
        float _1400 = fma(_1370, _1396, _1212);
        float _1402 = fma(_1392, _1396, _862);
        float _1404 = fma(_1384, _1398, _874);
        _1346 = _1400;
        _1348 = _1402;
        _1350 = _1404;
    }
    float _1406 = _1346;
    float _1408 = _1348;
    float _1410 = _1350;
    if (_1202)
    {
        _1352 = 1.0;
    }
    float _1412 = _1352;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1416 = _1266 * _1414;
    float _1418 = _1412;
    if (!_1202)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1448;
        float _1452 = _1440 * _1442;
        float _1454 = 1.0 / _1450;
        float _1456 = 1.0 / _1452;
        float _1458 = _1446 * _1456;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1462 = fma(_1416, _1458, _1460);
        float _1464 = _1462 * _1454;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        _938 = _1442;
        _1356 = _1466;
    }
    float _1468 = _938;
    float _1470 = _1356;
    float _1472 = _1468;
    if (!_1202)
    {
        float _1474 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1476 = _1474 * 0.15915493667125701904296875;
        float _1478 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1480 = _1476 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1478 * 0.15915493667125701904296875;
        float _1486 = _1476 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = 1.0 / _1482;
        float _1492 = _1484 * 6.283185482025146484375;
        float _1494 = cos(_1492);
        float _1496 = _1488 * _1490;
        float _1498 = _1484 * 6.283185482025146484375;
        float _1500 = sin(_1498);
        float _1502 = _1494 * _1496;
        float _1504 = 1.0 / _1502;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1508 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1506;
        float _1510 = 1.0 / _1508;
        float _1512 = _1500 * _1504;
        float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1516 = fma(_1416, _1512, _1514);
        float _1518 = _1516 * _1510;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        float _1522 = -_1520;
        float _1524 = _1522 + 1.0;
        _1472 = _1502;
        _1418 = _1524;
    }
    float _1526 = _1472;
    float _1528 = _1418;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1406 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1536 = _1408 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1410 + _1538;
    float _1542 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = _1532 * _1532;
    float _1546 = fma(_1536, _1536, _1544);
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = rsqrt(_1548);
    float _1552 = sqrt(_1548);
    float _1554 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1536 * _1554;
    float _1558 = _1540 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 + _1562;
    float _1566 = sqrt(_1564);
    bool _1568 = _1566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1566 + _1570;
    float _1574 = _1540;
    float _1576 = _1550;
    float _1578 = _1572;
    float _1580 = _1526;
    if (_1568)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1582;
    }
    float _1584 = _1574;
    if (_1568)
    {
        float _1586 = rsqrt(_1564);
        _1576 = _1586;
    }
    float _1588 = _1576;
    float _1590 = _1588;
    if (_1568)
    {
        float _1592 = _1572 * _1584;
        _1578 = _1592;
    }
    float _1594 = _1578;
    if (_1568)
    {
        float _1596 = _1594 * 0.15915493667125701904296875;
        _1580 = _1596;
    }
    float _1598 = _1580;
    float _1600 = _1584;
    float _1602 = _1598;
    if (_1568)
    {
        float _1604 = _1598 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1600 = _1606;
    }
    float _1608 = _1600;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1544;
    float _1616 = _1612;
    if (_1568)
    {
        float _1618 = _1598 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = -_1554;
    float _1626 = -_1612;
    float _1628 = fma(_1532, _1624, _1626);
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1632 = _1628;
    if (_1568)
    {
        float _1634 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1634;
    }
    float _1636 = _1616;
    float _1638 = _1636;
    if (!_1568)
    {
        _1602 = _1560;
    }
    float _1640 = _1602;
    float _1642 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1644 = _1608;
    float _1646 = _1640;
    if (_1568)
    {
        float _1648 = fma(_1608, _1636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1644 = _1648;
    }
    float _1650 = _1644;
    float _1652 = _1650;
    float _1654 = _1622;
    if (_1568)
    {
        float _1656 = _1622 + (-1.0);
        _1638 = _1656;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    if (_1568)
    {
        float _1662 = _1588 * _1650;
        _1630 = _1662;
    }
    float _1664 = _1630;
    if (!_1568)
    {
        _1590 = _1556;
    }
    float _1666 = _1590;
    float _1668 = _1666;
    if (_1568)
    {
        float _1670 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1670;
    }
    float _1672 = _1660;
    if (_1568)
    {
        float _1674 = _1556 * _1664;
        _1668 = _1674;
    }
    float _1676 = _1668;
    if (!_1568)
    {
        _1652 = _1558;
    }
    float _1678 = _1652;
    float _1680 = _1678;
    if (_1568)
    {
        float _1682 = _1558 * _1664;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (_1568)
    {
        float _1686 = fma(_1628, _1622, _1672);
        _1632 = _1686;
    }
    float _1688 = _1632;
    if (_1568)
    {
        float _1690 = _1676 * _1676;
        _1646 = _1690;
    }
    float _1692 = _1646;
    if (!_1568)
    {
        _1654 = _1562;
    }
    float _1694 = _1654;
    float _1696 = _1694;
    if (_1568)
    {
        float _1698 = _1684 * _1684;
        _1696 = _1698;
    }
    float _1700 = _1696;
    float _1702 = fma(_1688, _1688, _1692);
    float _1704 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = floor(_1642);
    float _1708 = _1702 + _1700;
    float _1710 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1714 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1712);
    float _1716 = precise::clamp(_1714, 0.0, 1.0);
    float _1718 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1710);
    float _1720 = rsqrt(_1708);
    float _1722 = -_1716;
    float _1724 = _1722 + 1.0;
    float _1726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1728 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1730 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1732 = fma(_874, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1734 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1738 = abs(_1724);
    float _1740 = log2(_1738);
    float _1742 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1730);
    float _1744 = -_1736;
    float _1746 = fma(_1744, _1726, 1.0);
    float _1748 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1750 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1752 = _1720 * _1676;
    float _1754 = _1720 * _1688;
    float _1756 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = _1720 * _1684;
    float _1764 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1766 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = -_1760;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1768);
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1774 = floor(_1732);
    float _1776 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1764);
    float _1778 = -_1762;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1770);
    float _1782 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1772);
    float _1784 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1786 = -_1706;
    float _1788 = _1642 + _1786;
    float _1790 = fma(_1780, -0.5, 0.5);
    float _1792 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1794 = log2(_1746);
    float _1796 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1798 = fma(_1780, 0.5, 0.5);
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1796);
    float _1802 = exp2(_1784);
    float _1804 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = -_1774;
    float _1808 = _1732 + _1806;
    float _1810 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1800);
    float _1812 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1814 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = fma(_1798, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1818 = sqrt(_1790);
    float _1820 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1810);
    float _1822 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1824 = _1754 + 1.0;
    float _1826 = fma(_1798, _1816, -0.212114393711090087890625);
    float _1828 = _1794 * 0.693147182464599609375;
    float _1830 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1822);
    float _1832 = 1.0 / _1812;
    float _1834 = -_1754;
    float _1836 = fma(_1802, _1824, _1834);
    float _1838 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float2 _5239 = float2(_1788, _1808);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5239, float2(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5239, float2(0.0), isnan(_5239)), level(0.0)).x;
    float _1842 = fma(_1798, _1826, 1.570728778839111328125);
    float _1844 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = _1818 * 0.636619746685028076171875;
    float _1848 = -_1842;
    float _1850 = fma(_1846, _1848, 1.0);
    float _1852 = fma(_1836, 0.5, 0.5);
    float _1854 = _1820 * _1832;
    float _1856 = _1838 * _1832;
    float _1858 = fma(_1854, 0.5, 0.5);
    float _1860 = fma(_1856, -0.5, 0.5);
    float3 _5276 = float3(_1858, _1860, _1844);
    float _1862 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5276, float3(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5276, float3(0.0), isnan(_5276)), level(0.0)).x;
    float3 _5287 = float3(_1858, _1860, _1844);
    float4 _1865 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5287, float3(0.0), isnan(_5287)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5287, float3(0.0), isnan(_5287)), level(0.0)).xyzw;
    float _1867 = _1865.x;
    float _1869 = _1865.y;
    float _1871 = _1865.z;
    float _1873 = _1865.w;
    float2 _5303 = float2(_1850, _1852);
    float3 _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5303, float2(0.0), isnan(_5303)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5303, float2(0.0), isnan(_5303)), level(0.0)).xyz;
    float _1879 = _1877.x;
    float _1881 = _1877.y;
    float _1883 = _1877.z;
    float _1885 = in.m_81.x;
    float _1887 = in.m_81.y;
    float _1889 = in.m_81.z;
    bool _1891 = _970 != 0.0;
    bool _1893 = isnan(_970);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.0);
    bool _1899 = _1895 || _1897;
    float _1901 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1905 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1907 = _968 == 0.0;
    bool _1909 = !_1899;
    bool _1911 = _1907 && _1909;
    float _1913 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1915 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1903);
    float _1917 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    bool _1919 = _972 == 0.0;
    bool _1921 = _1919 && _1911;
    float _1923 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1925 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1927 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1929 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1931 = -_992;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1923);
    float _1935 = -_992;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1925);
    float _1939 = -_992;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1927);
    float _1943 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1945 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1933);
    float _1947 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1949 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1937);
    float _1951 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1941);
    float _1953 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1943);
    float _1955 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = _1887;
    float _1959 = _1885;
    float _1961 = _1889;
    if (!_1921)
    {
        float _1963 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1957 = _1963;
    }
    float _1965 = _1957;
    if (!_1921)
    {
        float _1967 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1885);
        _1959 = _1967;
    }
    float _1969 = _1959;
    float _1971 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1915);
    float _1973 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1917);
    float _1975 = _1945 * _1965;
    float _1977 = _1949 * _1965;
    float _1979 = _1951 * _1965;
    if (!_1921)
    {
        float _1981 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1889);
        _1961 = _1981;
    }
    float _1983 = _1961;
    float _1985 = fma(_1947, _1969, _1975);
    float _1987 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1953);
    float _1989 = fma(_1971, _1969, _1977);
    float _1991 = fma(_1973, _1969, _1979);
    float _1993 = fma(_1987, _1983, _1985);
    float _1995 = abs(_1416);
    float _1997 = log2(_1995);
    float _1999 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2001 = in.m_67.x;
    float _2003 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _2005 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1929);
    float _2007 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2009 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2011 = isnan(_1552);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2017 = _2013 || _2015;
    float _2019 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2003);
    float _2021 = exp2(_1999);
    float _2023 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2005);
    float _2025 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2027 = fma(_2019, _1983, _1989);
    float _2029 = fma(_2023, _1983, _1991);
    float _2031 = _1812 * 0.5;
    float _2033 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_83.x = _1993;
    out.m_83.y = _2027;
    out.m_83.z = _2029;
    float _2035 = exp2(_2033);
    float _2037 = -_2021;
    float _2039 = _2037 + 1.0;
    float _2041 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = _1820 + _1812;
    float _2047 = fma(_2043, -2.0, 3.0);
    float _2049 = _2043 * _2043;
    bool _2051 = _1416 <= 8000.0;
    bool _2053 = isnan(_1416);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(8000.0);
    bool _2059 = _2055 || _2057;
    float _2061 = float(_2059);
    float _2063 = _2045 * 0.5;
    float _2065 = _2049 * _2047;
    float _2067 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2025);
    float _2069 = -_2065;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2067);
    float _2075 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2065);
    float _2077 = fma(_1838, -0.5, _2031);
    float _2079 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2081 = _2073 + _1812;
    float _2083 = _2061 * _2075;
    out.gl_Position.x = _1820;
    out.gl_Position.y = _1838;
    out.gl_Position.z = _2073;
    out.gl_Position.w = _1812;
    float _2085 = _2081 * 0.5;
    float _2087 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _2063;
    out.m_85.y = _2077;
    out.m_85.z = _2085;
    out.m_85.w = _1812;
    float _2089 = _1470 * _1528;
    float _2091 = _1812;
    float _2093 = _2085;
    float _2095 = _2077;
    float _2097 = _2089;
    if (!_2017)
    {
        _2091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2099 = _2091;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2017)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2105 = _2093;
    float _2107 = _2105;
    float _2109 = _2105;
    if (!_2017)
    {
        _2095 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2111 = _2095;
    float _2113 = -_1840;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * _2087;
    float _2119 = precise::clamp(_2117, 0.0, 1.0);
    float _2121 = -_2119;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2125 = _2123 * _2001;
    float _2127 = _2125 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2127;
    float _2129 = _2079 * _1862;
    float _2131 = -_2079;
    float _2133 = _2131 + 1.0;
    float _2135 = _1873 * _2129;
    float _2137 = _1883 * _2129;
    float _2139 = _1873 * _2133;
    float _2141 = fma(_1879, _2135, _1867);
    float _2143 = fma(_1881, _2135, _1869);
    float _2145 = fma(_1873, _2137, _1871);
    float _2147 = _2089 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2149 = _1869;
    float _2151 = _1867;
    float _2153 = _2111;
    float _2155 = _2111;
    if (!_2017)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2157 = _2149;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2017)
    {
        _2151 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2163 = _2151;
    out.m_89.x = _2141;
    out.m_89.y = _2143;
    out.m_89.z = _2145;
    out.m_89.w = _2139;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2017)
    {
        _2097 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2169 = _2097;
    bool _2171 = !_2017;
    float _2173 = _2169;
    float _2175 = _2169;
    if (!_2171)
    {
        bool _2177 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2179 = isnan(_1552);
        bool _2181 = _2177 || _2179;
        bool _2183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2185 = _2181 || _2183;
        if (!_2185)
        {
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2189 = _1552 + _2187;
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2193 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2203 = 1.0 / _2193;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2217 = _2189 * _2203;
            float _2219 = precise::clamp(_2217, 0.0, 1.0);
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2225 = fma(_2219, _2197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2227 = fma(_2219, _2201, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2229 = fma(_2219, _2207, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2231 = fma(_2219, _2223, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2233 = fma(_2219, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2235 = fma(_2219, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2167 = _2229;
            _2155 = _2225;
            _2161 = _2227;
            _2109 = _2233;
            _2103 = _2231;
            _2175 = _2235;
            _2237 = true;
        }
        else
        {
            bool _2239 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2241 = isnan(_1552);
            bool _2243 = _2239 || _2241;
            bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2247 = _2243 || _2245;
            if (!_2247)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2249 = _2159;
            _2161 = _2249;
            if (!_2247)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2251 = _2165;
            _2167 = _2251;
            if (!_2247)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2253 = _2101;
            _2103 = _2253;
            if (!_2247)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2255 = _2107;
            _2109 = _2255;
            if (!_2247)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2257 = _2153;
            _2155 = _2257;
            if (!_2247)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2259 = _2173;
            bool _2261 = !_2247;
            _2175 = _2259;
            if (!_2261)
            {
                bool _2263 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2265 = isnan(_1552);
                bool _2267 = _2263 || _2265;
                bool _2269 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2271 = _2267 || _2269;
                if (!_2271)
                {
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2275 = _1552 + _2273;
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2279 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2277;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2289 = 1.0 / _2279;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2303 = _2275 * _2289;
                    float _2305 = precise::clamp(_2303, 0.0, 1.0);
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2311 = fma(_2305, _2283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2313 = fma(_2305, _2287, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2315 = fma(_2305, _2293, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2317 = fma(_2305, _2309, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2319 = fma(_2305, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2321 = fma(_2305, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2167 = _2315;
                    _2155 = _2311;
                    _2161 = _2313;
                    _2109 = _2319;
                    _2103 = _2317;
                    _2175 = _2321;
                    _2237 = true;
                }
                else
                {
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2237 = false;
    float _2323 = _2167;
    float _2325 = _2155;
    float _2327 = _2161;
    float _2329 = _2109;
    float _2331 = _2103;
    float _2333 = _2175;
    float _2335 = fma(_2027, -0.5, 0.5);
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    float _2339 = -_2323;
    float _2341 = _2339 + _2325;
    float _2343 = -_2327;
    float _2345 = _2343 + _2329;
    out.m_91.x = 0.0;
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = fma(_2337, _2341, _2323);
    float _2353 = fma(_2337, _2345, _2327);
    bool _2355 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2357 = _2351 * 0.586610972881317138671875;
    float _2359 = fma(_2337, _2349, _2331);
    float _2361 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2363 = fma(_2353, 0.298911988735198974609375, _2357);
    bool _2365 = _1470 > 0.0;
    bool _2367 = isnan(_1470);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan(0.0);
    bool _2373 = _2369 || _2371;
    float _2375 = fma(_2359, 0.114477999508380889892578125, _2363);
    out.m_51.x = _2361;
    bool _2377 = _1528 <= 0.0;
    bool _2379 = !_2373;
    bool _2381 = _2377 || _2379;
    float _2383 = -_2375;
    float _2385 = _2353 + _2383;
    float _2387 = -_2375;
    float _2389 = _2359 + _2387;
    float _2391 = fma(_2385, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    float _2393 = -_2375;
    float _2395 = _2351 + _2393;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    float _2399 = fma(_2389, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    bool _2401 = !_2355;
    if (!_2401)
    {
        float _2403 = -_1406;
        float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2407 = -_1408;
        float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2411 = -_1410;
        float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2415 = _2405 * _2405;
        float _2417 = fma(_2409, _2409, _2415);
        float _2419 = fma(_2413, _2413, _2417);
        float _2421 = sqrt(_2419);
        float _2423 = rsqrt(_2419);
        float _2425 = -_2421;
        float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2429 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        float _2433 = _2409 * _2423;
        float _2435 = _2405 * _2423;
        float _2437 = abs(_2431);
        float _2439 = log2(_2437);
        float _2441 = _2413 * _2423;
        float _2443 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2445 = _2027 * _2435;
        float _2447 = -_2435;
        float _2449 = -_2443;
        float _2451 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2449);
        float _2453 = fma(_1993, _2433, _2445);
        float _2455 = -_2441;
        float _2457 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2451);
        float _2459 = fma(_2029, _2441, _2453);
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2465 = _2457 + _2463;
        float _2467 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2471 = precise::clamp(_2469, 0.0, 1.0);
        float _2473 = exp2(_2467);
        float _2475 = _2473 * _2471;
        float _2477 = _2461 * _2475;
        float _2479 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2481 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2483 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2479;
        out.m_91.y = _2481;
        out.m_91.z = _2483;
    }
    out.m_93.x = _2391;
    out.m_93.y = _2397;
    out.m_93.z = _2399;
    if (!_2381)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2485 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2485;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2237 = false;
    bool _346 = false;
    bool _232 = false;
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
        float _2542 = as_type<float>(_128);
        out.gl_Position.z = _2542;
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
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2612 = as_type<float>(_166);
        out.gl_Position.z = _2612;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
    float _194 = _170 * _178;
    float _196 = _170 * _184;
    float _198 = fma(_168, _176, _194);
    float _200 = _170 * _190;
    float _202 = fma(_168, _182, _196);
    float _204 = fma(_172, _180, _198);
    float _206 = fma(_168, _188, _200);
    float _208 = fma(_172, _186, _202);
    float _210 = fma(_172, _192, _206);
    bool _212 = !_174;
    float _230;
    if (!_212)
    {
        float _214 = in.m_63.x;
        float _216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _222 = _220 * _216;
        float _224 = floor(_222);
        float _226 = -_224;
        float _228 = _222 + _226;
        _230 = _228;
        _232 = true;
    }
    else
    {
        float _234 = float(_112);
        float _236 = 1.0 / _234;
        float _238 = _146 * _236;
        _230 = _238;
    }
    _232 = false;
    float _240 = _230;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _240 + _242;
    bool _246 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_240);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _260;
    float _266 = -_256;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = _244 * _264;
    bool _276 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_240);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = fma(_272, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _294;
    float _298 = _286 * _268;
    float _300 = fma(_290, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_296, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = -_286;
    float _306 = _304 + 1.0;
    float _308 = _292 * _298;
    float _310 = _300 * _298;
    float _312 = _302 * _298;
    float _314 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _316 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _312);
    float _320 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].x, _316);
    float _322 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].y, _318);
    float _324 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].z, _314);
    bool _326 = !_262;
    float _344;
    if (!_326)
    {
        float _328 = in.m_63.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_112);
        float _350 = 1.0 / _348;
        float _352 = _146 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    float _356 = in.m_65.x;
    float _358 = in.m_65.y;
    float _360 = in.m_65.z;
    float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _364 = log2(_362);
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _378 = _376 != 0;
    float _380 = in.m_67.y;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _392 = _390 != 0;
    float _394 = in.m_69.y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _398 = in.m_63.y;
    float _400 = _364 * _146;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _404 = in.m_63.z;
    float _406 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = in.m_63.x;
    float _410 = _320 * _356;
    float _412 = exp2(_400);
    float _414 = _184 * _368;
    float _416 = _190 * _368;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _420 = _368 + _380;
    float _422 = in.m_69.x;
    float _424 = -_394;
    float _426 = _424 + 1.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _436 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _438 = _398 > 0.5;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _442 = 1.0 / _434;
    float _444 = fma(_182, _366, _414);
    float _446 = _394;
    float _448 = _436;
    if (_374)
    {
        float _450 = _438 ? _426 : _394;
        _446 = _450;
    }
    float _452 = _446;
    float _454 = _404 * 2.0;
    float _456 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = fma(_188, _366, _416);
    bool _460 = _408 > 0.5;
    bool _462 = _460 && _378;
    float _464 = in.m_59.w;
    float _466 = 1.0 / _430;
    float _468 = fma(_186, _370, _444);
    out.m_71.x = _456;
    out.m_71.y = _436;
    out.m_71.z = _406;
    out.m_71.w = _402;
    bool _470 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = fma(_192, _370, _458);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _484 = 1.0 + _482;
    float _486 = floor(_454);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _488;
    float _492 = _398 + _404;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = -_412;
    float _500 = _498 + 1.0;
    float _502 = _492 + (-1.0);
    float _504 = _490 * _442;
    float _506 = _496 * _466;
    float _508 = _496;
    if (!_378)
    {
        _508 = _422;
    }
    float _510 = _508;
    float _512 = 1.0 / _484;
    float _514 = _510;
    if (_378)
    {
        _448 = _422;
    }
    float _516 = _448;
    float _518 = _408 + _398;
    float _520 = _408 * 2.0;
    float _522 = in.m_61.w;
    float _524 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = _516;
    int _528 = as_type<int>(_524);
    if (_462)
    {
        float _530 = -_516;
        float _532 = _530 + 1.0;
        _526 = _532;
    }
    float _534 = _526;
    bool _536 = _486 > 0.0;
    float _538 = _398 * 2.0;
    bool _540 = _486 >= 0.0;
    bool _542 = isnan(_486);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = _518 + (-1.0);
    if (_378)
    {
        _514 = _534;
    }
    float _552 = _514;
    float _554 = floor(_520);
    float _556 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _558 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _566 = _562 || _564;
    float _568 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _570 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = isnan(_354);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _584 = _566 ? _500 : 0.0;
    float _586 = floor(_538);
    bool _588 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _590 = isnan(_354);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -_580;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _354 + _604;
    if (_478)
    {
        float _608 = _584 * _512;
        _148 = _608;
    }
    float _610 = _148;
    bool _612 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_354);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = _598 * _602;
    float _626 = -_598;
    float _628 = _626 + 1.0;
    float _630 = fma(_504, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _632 = _554 > 0.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _354 + _634;
    float _638 = _622 * _628;
    float _640 = _468 + _464;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    bool _646 = _554 >= 0.0;
    bool _648 = isnan(_554);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = _630 * _638;
    int _658 = _548 ? 0 : 1;
    float _660 = _480 + _522;
    int _662 = _654 ? 0 : 1;
    float _664 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _656);
    int _666 = ~_658;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _674 = !_384;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_506, _636, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _680 = _670;
    if (!_536)
    {
        int _682 = ~_658;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _690 = _420 + _688;
    bool _692 = _586 > 0.0;
    float _694 = fma(_678, _624, _664);
    int _696 = ~_662;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _704 = abs(_676);
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _708 = _700;
    if (!_632)
    {
        int _710 = ~_662;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _718 = _640 + _716;
    bool _720 = _586 >= 0.0;
    bool _722 = isnan(_586);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _732 = _660 + _730;
    float _734 = float(_704);
    float _736 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[28].x, _706);
    float _738 = float(_686);
    float _740 = _452 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _742 = _728 ? 0 : 1;
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].z, _736);
    float _746 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[117].x, _694);
    float _748 = _734 * _738;
    int _750 = ~_742;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _740 * _672;
    bool _758 = !_388;
    int _760 = _758 ? 0 : 1;
    float _762 = _568 * _702;
    int _764 = _754;
    float _766 = _762;
    if (!_692)
    {
        int _768 = ~_742;
        int _770 = _768 + 1;
        _764 = _770;
    }
    int _772 = _764;
    float _774 = in.m_73.x;
    float _776 = in.m_73.y;
    float _778 = in.m_73.z;
    float _780 = _746 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _782 = abs(_760);
    out.m_75.x = _762;
    out.m_75.y = _756;
    bool _784 = _744 >= 0.0;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _788 = _748 * (-2.0);
    float _790 = _690 * _690;
    float _792 = float(_714);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _798 = fma(_718, _718, _790);
    float _800 = float(_782);
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = fma(_732, _732, _798);
    float _808 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _800 * _792;
    if (_784)
    {
        _766 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _812 = _766;
    float _814 = fma(_582, _788, _582);
    if (_784)
    {
        out.m_51.x = 0.0;
    }
    float _816 = rsqrt(_806);
    float _818 = _810 * (-2.0);
    float _820 = fma(_788, _774, _774);
    out.m_77.x = _802;
    out.m_77.y = _804;
    out.m_77.z = _808;
    out.m_77.w = _780;
    float _822 = _408 + (-0.5);
    float _824 = fma(_524, _818, _524);
    if (_784)
    {
        float _826 = _812 * 5.0;
        _528 = as_type<int>(_826);
    }
    int _828 = _528;
    float _830 = fma(_818, _776, _776);
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[196].x, _820);
    float _834 = _398 + (-0.5);
    if (_784)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3646 = as_type<float>(_828);
        out.gl_Position.z = _3646;
    }
    float _836 = fma(_814, _610, _832);
    bool _838 = !_392;
    int _840 = _838 ? 0 : 1;
    int _842 = abs(_840);
    float _844 = _556 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _846 = float(_842);
    float _848 = _844 * _816;
    float _850 = _718 * _848;
    float _852 = _690 * _848;
    if (_784)
    {
        return out;
    }
    float _854 = -_852;
    float _856 = _420 + _854;
    float _858 = _732 * _848;
    float _860 = -_850;
    float _862 = _640 + _860;
    float _864 = float(_772);
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = _856 + _866;
    float _870 = _836 * 0.15915493667125701904296875;
    float _872 = -_858;
    float _874 = _660 + _872;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _862 + _876;
    float _880 = _868 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = -_852;
    float _884 = _690 + _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = _874 + _886;
    float _890 = _846 * _864;
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = -_850;
    float _896 = _718 + _894;
    float _898 = _884 * _884;
    float _900 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _830);
    float _902 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _904 = _890 * (-2.0);
    float _906 = fma(_896, _896, _898);
    float _908 = -_858;
    float _910 = _732 + _908;
    float _912 = _408 + _404;
    bool _914 = _902 >= 0.0;
    float _916 = fma(_824, _610, _900);
    float _918 = fma(_904, _778, _778);
    float _920 = _404 + (-0.5);
    float _922 = fma(_910, _910, _906);
    float _924 = _912 + (-1.0);
    float _926 = _916 * 0.15915493667125701904296875;
    float _928 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _918);
    float _930 = _870 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _936 = _918;
    float _938 = _888;
    if (_914)
    {
        _936 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _940 = _936;
    float _942 = fma(_934, _904, _934);
    int _944 = as_type<int>(_940);
    if (_914)
    {
        out.m_51.x = 0.0;
    }
    float _946 = _926 * 6.283185482025146484375;
    float _948 = sin(_946);
    if (_914)
    {
        float _950 = _940 * 5.0;
        _944 = as_type<int>(_950);
    }
    int _952 = _944;
    float _954 = fma(_942, _610, _928);
    if (_914)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_952);
        out.gl_Position.z = _3843;
    }
    float _956 = _926 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = sqrt(_922);
    float _962 = _870 * 6.283185482025146484375;
    float _964 = cos(_962);
    float _966 = _954 * 0.15915493667125701904296875;
    if (_914)
    {
        return out;
    }
    float _968 = in.m_79.x;
    float _970 = in.m_79.y;
    float _972 = in.m_79.z;
    float _974 = _966 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = _322 * _358;
    float _980 = _816 * _960;
    float _982 = _324 * _360;
    float _984 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = _964 * _958;
    float _988 = _964 * _948;
    float _990 = _966 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = _932 * _958;
    float _996 = _932 * _948;
    float _998 = _556 * _980;
    float _1000 = _964 * _976;
    float _1002 = _958 * _976;
    float _1004 = _980 * _984;
    float _1006 = _932 * _976;
    float _1008 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1010 = _948 * _976;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _970);
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _968);
    float _1016 = _1012 * _1004;
    float _1018 = _980 * _1008;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _972);
    float _1022 = _1014 * _998;
    float _1024 = fma(_992, _986, _996);
    float _1026 = _1000 * _1016;
    float _1028 = _1020 * _1018;
    float _1030 = -_1016;
    float _1032 = _992 * _1030;
    float _1034 = -_994;
    float _1036 = fma(_992, _988, _1034);
    float _1038 = fma(_1024, _1022, _1026);
    float _1040 = -_988;
    float _1042 = fma(_992, _994, _1040);
    float _1044 = fma(_1002, _1022, _1032);
    float _1046 = _1006 * _1016;
    float _1048 = fma(_1036, _1028, _1038);
    float _1050 = fma(_992, _996, _986);
    float _1052 = fma(_1010, _1028, _1044);
    float _1054 = fma(_1042, _1022, _1046);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1062 = fma(_1050, _1028, _1054);
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1056);
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1060);
    float _1070 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1064);
    float _1072 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1074 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1076 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1082 = _660 + _1076;
    float _1084 = _640 + _1078;
    float _1086 = _420 + _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1084 + _1092;
    float _1096 = _1090 * _1090;
    float _1098 = fma(_1094, _1094, _1096);
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1096;
    float _1106 = _1084;
    float _1108 = _1082;
    if (!_1102)
    {
        _1104 = _1086;
    }
    float _1110 = _1104;
    bool _1112 = !_1102;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1100 + _1118;
        float _1122 = rsqrt(_1098);
        float _1124 = _1120 * _1116;
        float _1126 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = _1124 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 + (-1.0);
        float _1140 = fma(_1136, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1142 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = _1122 * _1140;
        float _1146 = fma(_1086, _1132, _1142);
        float _1148 = fma(_1094, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1090, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1106 = _1148;
        _1108 = _1150;
        _1114 = _1146;
    }
    float _1152 = _1106;
    float _1154 = _1108;
    float _1156 = _1114;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1160 = _1152 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1164 = _1154 + _1162;
    float _1166 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1168 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4194 = float2(_1166, _1168);
    float _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4194, float2(0.0), isnan(_4194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4194, float2(0.0), isnan(_4194)), level(0.0)).x;
    float _1172 = -_420;
    float _1174 = _1172 + _1156;
    float _1176 = -_640;
    float _1178 = _1176 + _1152;
    float _1180 = -_660;
    float _1182 = _1180 + _1154;
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1192 = _1188 || _1190;
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_1170, 100.0, _420);
    float _1206 = _1174 * _1174;
    float _1208 = fma(_1170, 100.0, _1156);
    float _1210 = -_852;
    float _1212 = _1210 + _1204;
    float _1214 = fma(_1178, _1178, _1206);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1182, _1182, _1214);
    float _1222 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1216);
    float _1224 = sqrt(_1220);
    float _1226 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1222);
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1230 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1232 = 1.0 / _1228;
    float _1234 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1230);
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1238 = _1224 > 0.0;
    float _1240 = _1236 + _1228;
    float _1242 = _1240 * _1232;
    float _1244 = _1242 * 0.5;
    float _1246 = _1232;
    float _1248 = _1244;
    float _1250 = _1154;
    float _1252 = _1156;
    if (!_1238)
    {
        _1246 = _1208;
    }
    float _1254 = _1246;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = _1254;
    float _1262 = _1254;
    if (!_1238)
    {
        _1248 = _1152;
    }
    float _1264 = _1248;
    float _1266 = 1.0 / _1258;
    bool _1268 = !_1238;
    float _1270 = _1264;
    if (!_1268)
    {
        float _1272 = _204 * _204;
        float _1274 = rsqrt(_1220);
        float _1276 = fma(_208, _208, _1272);
        float _1278 = fma(_210, _210, _1276);
        float _1280 = sqrt(_1278);
        float _1282 = _1174 * _1274;
        float _1284 = _1178 * _1274;
        float _1286 = _1182 * _1274;
        bool _1288 = _1280 > 0.0;
        float _1290 = _1280;
        _1252 = _1274;
        if (!_1288)
        {
            _1290 = _1152;
        }
        float _1292 = _1290;
        _1270 = _1292;
        if (!_1288)
        {
            _1260 = _1208;
        }
        float _1294 = _1260;
        bool _1296 = !_1288;
        _1262 = _1294;
        if (!_1296)
        {
            float _1298 = rsqrt(_1278);
            float _1300 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1302 = _204 * _1298;
            float _1304 = _208 * _1298;
            float _1306 = _210 * _1298;
            float _1308 = _1282 * _1302;
            float _1310 = fma(_1284, _1304, _1308);
            float _1312 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1314 = fma(_1286, _1306, _1310);
            float _1316 = _1314 * _1312;
            float _1318 = fma(_208, _1316, _1152);
            float _1320 = fma(_204, _1316, _1208);
            float _1322 = fma(_210, _1316, _1154);
            _1270 = _1318;
            _1250 = _1322;
            _1262 = _1320;
            _1252 = _1316;
        }
    }
    float _1324 = _1270;
    float _1326 = _1250;
    float _1328 = _1262;
    float _1330 = _1252;
    float _1332 = -_850;
    float _1334 = _1332 + _1324;
    float _1336 = -_858;
    float _1338 = _1336 + _1326;
    float _1340 = -_852;
    float _1342 = _1340 + _1328;
    float _1344 = _1330;
    float _1346 = _1342;
    float _1348 = _1334;
    float _1350 = _1338;
    float _1352 = _1326;
    if (_1202)
    {
        _1344 = 1.0;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1192)
    {
        float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1360 = _1212 + _1358;
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1364 = -_660;
        float _1366 = _1364 + _1326;
        float _1368 = -_1204;
        float _1370 = _1368 + _1328;
        float _1372 = _1360 * _1360;
        float _1374 = fma(_878, _878, _1372);
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1378 = fma(_888, _888, _1374);
        float _1380 = 1.0 / _980;
        float _1382 = sqrt(_1378);
        float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1386 = precise::min(_1382, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1388 = _1386 * _1362;
        float _1390 = -_640;
        float _1392 = _1390 + _1324;
        float _1394 = _1388 * _1380;
        float _1396 = _1384 * _1394;
        float _1398 = _1366 * _1394;
        float _1400 = fma(_1370, _1396, _1212);
        float _1402 = fma(_1392, _1396, _862);
        float _1404 = fma(_1384, _1398, _874);
        _1346 = _1400;
        _1348 = _1402;
        _1350 = _1404;
    }
    float _1406 = _1346;
    float _1408 = _1348;
    float _1410 = _1350;
    if (_1202)
    {
        _1352 = 1.0;
    }
    float _1412 = _1352;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1416 = _1266 * _1414;
    float _1418 = _1412;
    if (!_1202)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1448;
        float _1452 = _1440 * _1442;
        float _1454 = 1.0 / _1450;
        float _1456 = 1.0 / _1452;
        float _1458 = _1446 * _1456;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1462 = fma(_1416, _1458, _1460);
        float _1464 = _1462 * _1454;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        _938 = _1442;
        _1356 = _1466;
    }
    float _1468 = _938;
    float _1470 = _1356;
    float _1472 = _1468;
    if (!_1202)
    {
        float _1474 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1476 = _1474 * 0.15915493667125701904296875;
        float _1478 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1480 = _1476 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1478 * 0.15915493667125701904296875;
        float _1486 = _1476 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = 1.0 / _1482;
        float _1492 = _1484 * 6.283185482025146484375;
        float _1494 = cos(_1492);
        float _1496 = _1488 * _1490;
        float _1498 = _1484 * 6.283185482025146484375;
        float _1500 = sin(_1498);
        float _1502 = _1494 * _1496;
        float _1504 = 1.0 / _1502;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1508 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1506;
        float _1510 = 1.0 / _1508;
        float _1512 = _1500 * _1504;
        float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1516 = fma(_1416, _1512, _1514);
        float _1518 = _1516 * _1510;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        float _1522 = -_1520;
        float _1524 = _1522 + 1.0;
        _1472 = _1502;
        _1418 = _1524;
    }
    float _1526 = _1472;
    float _1528 = _1418;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1406 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1536 = _1408 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1410 + _1538;
    float _1542 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = _1532 * _1532;
    float _1546 = fma(_1536, _1536, _1544);
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = rsqrt(_1548);
    float _1552 = sqrt(_1548);
    float _1554 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1536 * _1554;
    float _1558 = _1540 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 + _1562;
    float _1566 = sqrt(_1564);
    bool _1568 = _1566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1566 + _1570;
    float _1574 = _1540;
    float _1576 = _1550;
    float _1578 = _1572;
    float _1580 = _1526;
    if (_1568)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1582;
    }
    float _1584 = _1574;
    if (_1568)
    {
        float _1586 = rsqrt(_1564);
        _1576 = _1586;
    }
    float _1588 = _1576;
    float _1590 = _1588;
    if (_1568)
    {
        float _1592 = _1572 * _1584;
        _1578 = _1592;
    }
    float _1594 = _1578;
    if (_1568)
    {
        float _1596 = _1594 * 0.15915493667125701904296875;
        _1580 = _1596;
    }
    float _1598 = _1580;
    float _1600 = _1584;
    float _1602 = _1598;
    if (_1568)
    {
        float _1604 = _1598 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1600 = _1606;
    }
    float _1608 = _1600;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1544;
    float _1616 = _1612;
    if (_1568)
    {
        float _1618 = _1598 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = -_1554;
    float _1626 = -_1612;
    float _1628 = fma(_1532, _1624, _1626);
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1632 = _1628;
    if (_1568)
    {
        float _1634 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1634;
    }
    float _1636 = _1616;
    float _1638 = _1636;
    if (!_1568)
    {
        _1602 = _1560;
    }
    float _1640 = _1602;
    float _1642 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1644 = _1608;
    float _1646 = _1640;
    if (_1568)
    {
        float _1648 = fma(_1608, _1636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1644 = _1648;
    }
    float _1650 = _1644;
    float _1652 = _1650;
    float _1654 = _1622;
    if (_1568)
    {
        float _1656 = _1622 + (-1.0);
        _1638 = _1656;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    if (_1568)
    {
        float _1662 = _1588 * _1650;
        _1630 = _1662;
    }
    float _1664 = _1630;
    if (!_1568)
    {
        _1590 = _1556;
    }
    float _1666 = _1590;
    float _1668 = _1666;
    if (_1568)
    {
        float _1670 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1670;
    }
    float _1672 = _1660;
    if (_1568)
    {
        float _1674 = _1556 * _1664;
        _1668 = _1674;
    }
    float _1676 = _1668;
    if (!_1568)
    {
        _1652 = _1558;
    }
    float _1678 = _1652;
    float _1680 = _1678;
    if (_1568)
    {
        float _1682 = _1558 * _1664;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (_1568)
    {
        float _1686 = fma(_1628, _1622, _1672);
        _1632 = _1686;
    }
    float _1688 = _1632;
    if (_1568)
    {
        float _1690 = _1676 * _1676;
        _1646 = _1690;
    }
    float _1692 = _1646;
    if (!_1568)
    {
        _1654 = _1562;
    }
    float _1694 = _1654;
    float _1696 = _1694;
    if (_1568)
    {
        float _1698 = _1684 * _1684;
        _1696 = _1698;
    }
    float _1700 = _1696;
    float _1702 = fma(_1688, _1688, _1692);
    float _1704 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = floor(_1642);
    float _1708 = _1702 + _1700;
    float _1710 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1714 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1712);
    float _1716 = precise::clamp(_1714, 0.0, 1.0);
    float _1718 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1710);
    float _1720 = rsqrt(_1708);
    float _1722 = -_1716;
    float _1724 = _1722 + 1.0;
    float _1726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1728 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1730 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1732 = fma(_874, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1734 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1738 = abs(_1724);
    float _1740 = log2(_1738);
    float _1742 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1730);
    float _1744 = -_1736;
    float _1746 = fma(_1744, _1726, 1.0);
    float _1748 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1750 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1752 = _1720 * _1676;
    float _1754 = _1720 * _1688;
    float _1756 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = _1720 * _1684;
    float _1764 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1766 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = -_1760;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1768);
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1774 = floor(_1732);
    float _1776 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1764);
    float _1778 = -_1762;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1770);
    float _1782 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1772);
    float _1784 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1786 = -_1706;
    float _1788 = _1642 + _1786;
    float _1790 = fma(_1780, -0.5, 0.5);
    float _1792 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1794 = log2(_1746);
    float _1796 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1798 = fma(_1780, 0.5, 0.5);
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1796);
    float _1802 = exp2(_1784);
    float _1804 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = -_1774;
    float _1808 = _1732 + _1806;
    float _1810 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1800);
    float _1812 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1814 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = fma(_1798, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1818 = sqrt(_1790);
    float _1820 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1810);
    float _1822 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1824 = _1754 + 1.0;
    float _1826 = fma(_1798, _1816, -0.212114393711090087890625);
    float _1828 = _1794 * 0.693147182464599609375;
    float _1830 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1822);
    float _1832 = 1.0 / _1812;
    float _1834 = -_1754;
    float _1836 = fma(_1802, _1824, _1834);
    float _1838 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float2 _5239 = float2(_1788, _1808);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5239, float2(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5239, float2(0.0), isnan(_5239)), level(0.0)).x;
    float _1842 = fma(_1798, _1826, 1.570728778839111328125);
    float _1844 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = _1818 * 0.636619746685028076171875;
    float _1848 = -_1842;
    float _1850 = fma(_1846, _1848, 1.0);
    float _1852 = fma(_1836, 0.5, 0.5);
    float _1854 = _1820 * _1832;
    float _1856 = _1838 * _1832;
    float _1858 = fma(_1854, 0.5, 0.5);
    float _1860 = fma(_1856, -0.5, 0.5);
    float3 _5276 = float3(_1858, _1860, _1844);
    float _1862 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5276, float3(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5276, float3(0.0), isnan(_5276)), level(0.0)).x;
    float3 _5287 = float3(_1858, _1860, _1844);
    float4 _1865 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5287, float3(0.0), isnan(_5287)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5287, float3(0.0), isnan(_5287)), level(0.0)).xyzw;
    float _1867 = _1865.x;
    float _1869 = _1865.y;
    float _1871 = _1865.z;
    float _1873 = _1865.w;
    float2 _5303 = float2(_1850, _1852);
    float3 _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5303, float2(0.0), isnan(_5303)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5303, float2(0.0), isnan(_5303)), level(0.0)).xyz;
    float _1879 = _1877.x;
    float _1881 = _1877.y;
    float _1883 = _1877.z;
    float _1885 = in.m_81.x;
    float _1887 = in.m_81.y;
    float _1889 = in.m_81.z;
    bool _1891 = _970 != 0.0;
    bool _1893 = isnan(_970);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.0);
    bool _1899 = _1895 || _1897;
    float _1901 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1905 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1907 = _968 == 0.0;
    bool _1909 = !_1899;
    bool _1911 = _1907 && _1909;
    float _1913 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1915 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1903);
    float _1917 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    bool _1919 = _972 == 0.0;
    bool _1921 = _1919 && _1911;
    float _1923 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1925 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1927 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1929 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1931 = -_992;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1923);
    float _1935 = -_992;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1925);
    float _1939 = -_992;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1927);
    float _1943 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1945 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1933);
    float _1947 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1949 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1937);
    float _1951 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1941);
    float _1953 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1943);
    float _1955 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = _1887;
    float _1959 = _1885;
    float _1961 = _1889;
    if (!_1921)
    {
        float _1963 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1957 = _1963;
    }
    float _1965 = _1957;
    if (!_1921)
    {
        float _1967 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1885);
        _1959 = _1967;
    }
    float _1969 = _1959;
    float _1971 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1915);
    float _1973 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1917);
    float _1975 = _1945 * _1965;
    float _1977 = _1949 * _1965;
    float _1979 = _1951 * _1965;
    if (!_1921)
    {
        float _1981 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1889);
        _1961 = _1981;
    }
    float _1983 = _1961;
    float _1985 = fma(_1947, _1969, _1975);
    float _1987 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1953);
    float _1989 = fma(_1971, _1969, _1977);
    float _1991 = fma(_1973, _1969, _1979);
    float _1993 = fma(_1987, _1983, _1985);
    float _1995 = abs(_1416);
    float _1997 = log2(_1995);
    float _1999 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2001 = in.m_67.x;
    float _2003 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _2005 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1929);
    float _2007 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2009 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2011 = isnan(_1552);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2017 = _2013 || _2015;
    float _2019 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2003);
    float _2021 = exp2(_1999);
    float _2023 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2005);
    float _2025 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2027 = fma(_2019, _1983, _1989);
    float _2029 = fma(_2023, _1983, _1991);
    float _2031 = _1812 * 0.5;
    float _2033 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_83.x = _1993;
    out.m_83.y = _2027;
    out.m_83.z = _2029;
    float _2035 = exp2(_2033);
    float _2037 = -_2021;
    float _2039 = _2037 + 1.0;
    float _2041 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = _1820 + _1812;
    float _2047 = fma(_2043, -2.0, 3.0);
    float _2049 = _2043 * _2043;
    bool _2051 = _1416 <= 8000.0;
    bool _2053 = isnan(_1416);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(8000.0);
    bool _2059 = _2055 || _2057;
    float _2061 = float(_2059);
    float _2063 = _2045 * 0.5;
    float _2065 = _2049 * _2047;
    float _2067 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2025);
    float _2069 = -_2065;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2067);
    float _2075 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2065);
    float _2077 = fma(_1838, -0.5, _2031);
    float _2079 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2081 = _2073 + _1812;
    float _2083 = _2061 * _2075;
    out.gl_Position.x = _1820;
    out.gl_Position.y = _1838;
    out.gl_Position.z = _2073;
    out.gl_Position.w = _1812;
    float _2085 = _2081 * 0.5;
    float _2087 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _2063;
    out.m_85.y = _2077;
    out.m_85.z = _2085;
    out.m_85.w = _1812;
    float _2089 = _1470 * _1528;
    float _2091 = _1812;
    float _2093 = _2085;
    float _2095 = _2077;
    float _2097 = _2089;
    if (!_2017)
    {
        _2091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2099 = _2091;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2017)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2105 = _2093;
    float _2107 = _2105;
    float _2109 = _2105;
    if (!_2017)
    {
        _2095 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2111 = _2095;
    float _2113 = -_1840;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * _2087;
    float _2119 = precise::clamp(_2117, 0.0, 1.0);
    float _2121 = -_2119;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2125 = _2123 * _2001;
    float _2127 = _2125 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2127;
    float _2129 = _2079 * _1862;
    float _2131 = -_2079;
    float _2133 = _2131 + 1.0;
    float _2135 = _1873 * _2129;
    float _2137 = _1883 * _2129;
    float _2139 = _1873 * _2133;
    float _2141 = fma(_1879, _2135, _1867);
    float _2143 = fma(_1881, _2135, _1869);
    float _2145 = fma(_1873, _2137, _1871);
    float _2147 = _2089 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2149 = _1869;
    float _2151 = _1867;
    float _2153 = _2111;
    float _2155 = _2111;
    if (!_2017)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2157 = _2149;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2017)
    {
        _2151 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2163 = _2151;
    out.m_89.x = _2141;
    out.m_89.y = _2143;
    out.m_89.z = _2145;
    out.m_89.w = _2139;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2017)
    {
        _2097 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2169 = _2097;
    bool _2171 = !_2017;
    float _2173 = _2169;
    float _2175 = _2169;
    if (!_2171)
    {
        bool _2177 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2179 = isnan(_1552);
        bool _2181 = _2177 || _2179;
        bool _2183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2185 = _2181 || _2183;
        if (!_2185)
        {
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2189 = _1552 + _2187;
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2193 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2203 = 1.0 / _2193;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2217 = _2189 * _2203;
            float _2219 = precise::clamp(_2217, 0.0, 1.0);
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2225 = fma(_2219, _2197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2227 = fma(_2219, _2201, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2229 = fma(_2219, _2207, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2231 = fma(_2219, _2223, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2233 = fma(_2219, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2235 = fma(_2219, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2167 = _2229;
            _2155 = _2225;
            _2161 = _2227;
            _2109 = _2233;
            _2103 = _2231;
            _2175 = _2235;
            _2237 = true;
        }
        else
        {
            bool _2239 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2241 = isnan(_1552);
            bool _2243 = _2239 || _2241;
            bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2247 = _2243 || _2245;
            if (!_2247)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2249 = _2159;
            _2161 = _2249;
            if (!_2247)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2251 = _2165;
            _2167 = _2251;
            if (!_2247)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2253 = _2101;
            _2103 = _2253;
            if (!_2247)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2255 = _2107;
            _2109 = _2255;
            if (!_2247)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2257 = _2153;
            _2155 = _2257;
            if (!_2247)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2259 = _2173;
            bool _2261 = !_2247;
            _2175 = _2259;
            if (!_2261)
            {
                bool _2263 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2265 = isnan(_1552);
                bool _2267 = _2263 || _2265;
                bool _2269 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2271 = _2267 || _2269;
                if (!_2271)
                {
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2275 = _1552 + _2273;
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2279 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2277;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2289 = 1.0 / _2279;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2303 = _2275 * _2289;
                    float _2305 = precise::clamp(_2303, 0.0, 1.0);
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2311 = fma(_2305, _2283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2313 = fma(_2305, _2287, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2315 = fma(_2305, _2293, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2317 = fma(_2305, _2309, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2319 = fma(_2305, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2321 = fma(_2305, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2167 = _2315;
                    _2155 = _2311;
                    _2161 = _2313;
                    _2109 = _2319;
                    _2103 = _2317;
                    _2175 = _2321;
                    _2237 = true;
                }
                else
                {
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2237 = false;
    float _2323 = _2167;
    float _2325 = _2155;
    float _2327 = _2161;
    float _2329 = _2109;
    float _2331 = _2103;
    float _2333 = _2175;
    float _2335 = fma(_2027, -0.5, 0.5);
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    float _2339 = -_2323;
    float _2341 = _2339 + _2325;
    float _2343 = -_2327;
    float _2345 = _2343 + _2329;
    out.m_91.x = 0.0;
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = fma(_2337, _2341, _2323);
    float _2353 = fma(_2337, _2345, _2327);
    bool _2355 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2357 = _2351 * 0.586610972881317138671875;
    float _2359 = fma(_2337, _2349, _2331);
    float _2361 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2363 = fma(_2353, 0.298911988735198974609375, _2357);
    bool _2365 = _1470 > 0.0;
    bool _2367 = isnan(_1470);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan(0.0);
    bool _2373 = _2369 || _2371;
    float _2375 = fma(_2359, 0.114477999508380889892578125, _2363);
    out.m_51.x = _2361;
    bool _2377 = _1528 <= 0.0;
    bool _2379 = !_2373;
    bool _2381 = _2377 || _2379;
    float _2383 = -_2375;
    float _2385 = _2353 + _2383;
    float _2387 = -_2375;
    float _2389 = _2359 + _2387;
    float _2391 = fma(_2385, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    float _2393 = -_2375;
    float _2395 = _2351 + _2393;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    float _2399 = fma(_2389, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    bool _2401 = !_2355;
    if (!_2401)
    {
        float _2403 = -_1406;
        float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2407 = -_1408;
        float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2411 = -_1410;
        float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2415 = _2405 * _2405;
        float _2417 = fma(_2409, _2409, _2415);
        float _2419 = fma(_2413, _2413, _2417);
        float _2421 = sqrt(_2419);
        float _2423 = rsqrt(_2419);
        float _2425 = -_2421;
        float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2429 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        float _2433 = _2409 * _2423;
        float _2435 = _2405 * _2423;
        float _2437 = abs(_2431);
        float _2439 = log2(_2437);
        float _2441 = _2413 * _2423;
        float _2443 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2445 = _2027 * _2435;
        float _2447 = -_2435;
        float _2449 = -_2443;
        float _2451 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2449);
        float _2453 = fma(_1993, _2433, _2445);
        float _2455 = -_2441;
        float _2457 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2451);
        float _2459 = fma(_2029, _2441, _2453);
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2465 = _2457 + _2463;
        float _2467 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2471 = precise::clamp(_2469, 0.0, 1.0);
        float _2473 = exp2(_2467);
        float _2475 = _2473 * _2471;
        float _2477 = _2461 * _2475;
        float _2479 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2481 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2483 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2479;
        out.m_91.y = _2481;
        out.m_91.z = _2483;
    }
    out.m_93.x = _2391;
    out.m_93.y = _2397;
    out.m_93.z = _2399;
    if (!_2381)
    {
        return out;
    }
    float _2485 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2485;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2237 = false;
    bool _346 = false;
    bool _232 = false;
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
        float _2542 = as_type<float>(_128);
        out.gl_Position.z = _2542;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2612 = as_type<float>(_166);
        out.gl_Position.z = _2612;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
    float _194 = _170 * _178;
    float _196 = _170 * _184;
    float _198 = fma(_168, _176, _194);
    float _200 = _170 * _190;
    float _202 = fma(_168, _182, _196);
    float _204 = fma(_172, _180, _198);
    float _206 = fma(_168, _188, _200);
    float _208 = fma(_172, _186, _202);
    float _210 = fma(_172, _192, _206);
    bool _212 = !_174;
    float _230;
    if (!_212)
    {
        float _214 = in.m_63.x;
        float _216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _220 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _222 = _220 * _216;
        float _224 = floor(_222);
        float _226 = -_224;
        float _228 = _222 + _226;
        _230 = _228;
        _232 = true;
    }
    else
    {
        float _234 = float(_112);
        float _236 = 1.0 / _234;
        float _238 = _146 * _236;
        _230 = _238;
    }
    _232 = false;
    float _240 = _230;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _240 + _242;
    bool _246 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_240);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _264 = 1.0 / _260;
    float _266 = -_256;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = _244 * _264;
    bool _276 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _278 = isnan(_240);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = fma(_272, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _294;
    float _298 = _286 * _268;
    float _300 = fma(_290, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_296, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = -_286;
    float _306 = _304 + 1.0;
    float _308 = _292 * _298;
    float _310 = _300 * _298;
    float _312 = _302 * _298;
    float _314 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _316 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _312);
    float _320 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].x, _316);
    float _322 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].y, _318);
    float _324 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[144].z, _314);
    bool _326 = !_262;
    float _344;
    if (!_326)
    {
        float _328 = in.m_63.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_112);
        float _350 = 1.0 / _348;
        float _352 = _146 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    float _356 = in.m_65.x;
    float _358 = in.m_65.y;
    float _360 = in.m_65.z;
    float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _364 = log2(_362);
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _378 = _376 != 0;
    float _380 = in.m_67.y;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _392 = _390 != 0;
    float _394 = in.m_69.y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _398 = in.m_63.y;
    float _400 = _364 * _146;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _404 = in.m_63.z;
    float _406 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = in.m_63.x;
    float _410 = _320 * _356;
    float _412 = exp2(_400);
    float _414 = _184 * _368;
    float _416 = _190 * _368;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _420 = _368 + _380;
    float _422 = in.m_69.x;
    float _424 = -_394;
    float _426 = _424 + 1.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _436 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _438 = _398 > 0.5;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _442 = 1.0 / _434;
    float _444 = fma(_182, _366, _414);
    float _446 = _394;
    float _448 = _436;
    if (_374)
    {
        float _450 = _438 ? _426 : _394;
        _446 = _450;
    }
    float _452 = _446;
    float _454 = _404 * 2.0;
    float _456 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = fma(_188, _366, _416);
    bool _460 = _408 > 0.5;
    bool _462 = _460 && _378;
    float _464 = in.m_59.w;
    float _466 = 1.0 / _430;
    float _468 = fma(_186, _370, _444);
    out.m_71.x = _456;
    out.m_71.y = _436;
    out.m_71.z = _406;
    out.m_71.w = _402;
    bool _470 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = fma(_192, _370, _458);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _484 = 1.0 + _482;
    float _486 = floor(_454);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _488;
    float _492 = _398 + _404;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = -_412;
    float _500 = _498 + 1.0;
    float _502 = _492 + (-1.0);
    float _504 = _490 * _442;
    float _506 = _496 * _466;
    float _508 = _496;
    if (!_378)
    {
        _508 = _422;
    }
    float _510 = _508;
    float _512 = 1.0 / _484;
    float _514 = _510;
    if (_378)
    {
        _448 = _422;
    }
    float _516 = _448;
    float _518 = _408 + _398;
    float _520 = _408 * 2.0;
    float _522 = in.m_61.w;
    float _524 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = _516;
    int _528 = as_type<int>(_524);
    if (_462)
    {
        float _530 = -_516;
        float _532 = _530 + 1.0;
        _526 = _532;
    }
    float _534 = _526;
    bool _536 = _486 > 0.0;
    float _538 = _398 * 2.0;
    bool _540 = _486 >= 0.0;
    bool _542 = isnan(_486);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = _518 + (-1.0);
    if (_378)
    {
        _514 = _534;
    }
    float _552 = _514;
    float _554 = floor(_520);
    float _556 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _558 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _566 = _562 || _564;
    float _568 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _570 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = isnan(_354);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _584 = _566 ? _500 : 0.0;
    float _586 = floor(_538);
    bool _588 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _590 = isnan(_354);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -_580;
    float _602 = _600 + 1.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _354 + _604;
    if (_478)
    {
        float _608 = _584 * _512;
        _148 = _608;
    }
    float _610 = _148;
    bool _612 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _614 = isnan(_354);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = _598 * _602;
    float _626 = -_598;
    float _628 = _626 + 1.0;
    float _630 = fma(_504, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _632 = _554 > 0.0;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _354 + _634;
    float _638 = _622 * _628;
    float _640 = _468 + _464;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    bool _646 = _554 >= 0.0;
    bool _648 = isnan(_554);
    bool _650 = _646 || _648;
    bool _652 = isnan(0.0);
    bool _654 = _650 || _652;
    float _656 = _630 * _638;
    int _658 = _548 ? 0 : 1;
    float _660 = _480 + _522;
    int _662 = _654 ? 0 : 1;
    float _664 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _656);
    int _666 = ~_658;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _674 = !_384;
    int _676 = _674 ? 0 : 1;
    float _678 = fma(_506, _636, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _680 = _670;
    if (!_536)
    {
        int _682 = ~_658;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _690 = _420 + _688;
    bool _692 = _586 > 0.0;
    float _694 = fma(_678, _624, _664);
    int _696 = ~_662;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _704 = abs(_676);
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _708 = _700;
    if (!_632)
    {
        int _710 = ~_662;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _718 = _640 + _716;
    bool _720 = _586 >= 0.0;
    bool _722 = isnan(_586);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _732 = _660 + _730;
    float _734 = float(_704);
    float _736 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[28].x, _706);
    float _738 = float(_686);
    float _740 = _452 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _742 = _728 ? 0 : 1;
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[28].z, _736);
    float _746 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[117].x, _694);
    float _748 = _734 * _738;
    int _750 = ~_742;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _740 * _672;
    bool _758 = !_388;
    int _760 = _758 ? 0 : 1;
    float _762 = _568 * _702;
    int _764 = _754;
    float _766 = _762;
    if (!_692)
    {
        int _768 = ~_742;
        int _770 = _768 + 1;
        _764 = _770;
    }
    int _772 = _764;
    float _774 = in.m_73.x;
    float _776 = in.m_73.y;
    float _778 = in.m_73.z;
    float _780 = _746 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _782 = abs(_760);
    out.m_75.x = _762;
    out.m_75.y = _756;
    bool _784 = _744 >= 0.0;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _788 = _748 * (-2.0);
    float _790 = _690 * _690;
    float _792 = float(_714);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _798 = fma(_718, _718, _790);
    float _800 = float(_782);
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = fma(_732, _732, _798);
    float _808 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _800 * _792;
    if (_784)
    {
        _766 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _812 = _766;
    float _814 = fma(_582, _788, _582);
    if (_784)
    {
        out.m_51.x = 0.0;
    }
    float _816 = rsqrt(_806);
    float _818 = _810 * (-2.0);
    float _820 = fma(_788, _774, _774);
    out.m_77.x = _802;
    out.m_77.y = _804;
    out.m_77.z = _808;
    out.m_77.w = _780;
    float _822 = _408 + (-0.5);
    float _824 = fma(_524, _818, _524);
    if (_784)
    {
        float _826 = _812 * 5.0;
        _528 = as_type<int>(_826);
    }
    int _828 = _528;
    float _830 = fma(_818, _776, _776);
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[196].x, _820);
    float _834 = _398 + (-0.5);
    if (_784)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3646 = as_type<float>(_828);
        out.gl_Position.z = _3646;
    }
    float _836 = fma(_814, _610, _832);
    bool _838 = !_392;
    int _840 = _838 ? 0 : 1;
    int _842 = abs(_840);
    float _844 = _556 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _846 = float(_842);
    float _848 = _844 * _816;
    float _850 = _718 * _848;
    float _852 = _690 * _848;
    if (_784)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _854 = -_852;
    float _856 = _420 + _854;
    float _858 = _732 * _848;
    float _860 = -_850;
    float _862 = _640 + _860;
    float _864 = float(_772);
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = _856 + _866;
    float _870 = _836 * 0.15915493667125701904296875;
    float _872 = -_858;
    float _874 = _660 + _872;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _878 = _862 + _876;
    float _880 = _868 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = -_852;
    float _884 = _690 + _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = _874 + _886;
    float _890 = _846 * _864;
    float _892 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = -_850;
    float _896 = _718 + _894;
    float _898 = _884 * _884;
    float _900 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _830);
    float _902 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _904 = _890 * (-2.0);
    float _906 = fma(_896, _896, _898);
    float _908 = -_858;
    float _910 = _732 + _908;
    float _912 = _408 + _404;
    bool _914 = _902 >= 0.0;
    float _916 = fma(_824, _610, _900);
    float _918 = fma(_904, _778, _778);
    float _920 = _404 + (-0.5);
    float _922 = fma(_910, _910, _906);
    float _924 = _912 + (-1.0);
    float _926 = _916 * 0.15915493667125701904296875;
    float _928 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[196].z, _918);
    float _930 = _870 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _936 = _918;
    float _938 = _888;
    if (_914)
    {
        _936 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _940 = _936;
    float _942 = fma(_934, _904, _934);
    int _944 = as_type<int>(_940);
    if (_914)
    {
        out.m_51.x = 0.0;
    }
    float _946 = _926 * 6.283185482025146484375;
    float _948 = sin(_946);
    if (_914)
    {
        float _950 = _940 * 5.0;
        _944 = as_type<int>(_950);
    }
    int _952 = _944;
    float _954 = fma(_942, _610, _928);
    if (_914)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3843 = as_type<float>(_952);
        out.gl_Position.z = _3843;
    }
    float _956 = _926 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = sqrt(_922);
    float _962 = _870 * 6.283185482025146484375;
    float _964 = cos(_962);
    float _966 = _954 * 0.15915493667125701904296875;
    if (_914)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _968 = in.m_79.x;
    float _970 = in.m_79.y;
    float _972 = in.m_79.z;
    float _974 = _966 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = _322 * _358;
    float _980 = _816 * _960;
    float _982 = _324 * _360;
    float _984 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _986 = _964 * _958;
    float _988 = _964 * _948;
    float _990 = _966 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = _932 * _958;
    float _996 = _932 * _948;
    float _998 = _556 * _980;
    float _1000 = _964 * _976;
    float _1002 = _958 * _976;
    float _1004 = _980 * _984;
    float _1006 = _932 * _976;
    float _1008 = _982 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1010 = _948 * _976;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _970);
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _968);
    float _1016 = _1012 * _1004;
    float _1018 = _980 * _1008;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _972);
    float _1022 = _1014 * _998;
    float _1024 = fma(_992, _986, _996);
    float _1026 = _1000 * _1016;
    float _1028 = _1020 * _1018;
    float _1030 = -_1016;
    float _1032 = _992 * _1030;
    float _1034 = -_994;
    float _1036 = fma(_992, _988, _1034);
    float _1038 = fma(_1024, _1022, _1026);
    float _1040 = -_988;
    float _1042 = fma(_992, _994, _1040);
    float _1044 = fma(_1002, _1022, _1032);
    float _1046 = _1006 * _1016;
    float _1048 = fma(_1036, _1028, _1038);
    float _1050 = fma(_992, _996, _986);
    float _1052 = fma(_1010, _1028, _1044);
    float _1054 = fma(_1042, _1022, _1046);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1062 = fma(_1050, _1028, _1054);
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1056);
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1060);
    float _1070 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1064);
    float _1072 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1074 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1068);
    float _1076 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1082 = _660 + _1076;
    float _1084 = _640 + _1078;
    float _1086 = _420 + _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1094 = _1084 + _1092;
    float _1096 = _1090 * _1090;
    float _1098 = fma(_1094, _1094, _1096);
    float _1100 = sqrt(_1098);
    bool _1102 = _1100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1096;
    float _1106 = _1084;
    float _1108 = _1082;
    if (!_1102)
    {
        _1104 = _1086;
    }
    float _1110 = _1104;
    bool _1112 = !_1102;
    float _1114 = _1110;
    if (!_1112)
    {
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1120 = _1100 + _1118;
        float _1122 = rsqrt(_1098);
        float _1124 = _1120 * _1116;
        float _1126 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = _1124 * 0.15915493667125701904296875;
        float _1130 = _1128 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 + (-1.0);
        float _1140 = fma(_1136, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1142 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = _1122 * _1140;
        float _1146 = fma(_1086, _1132, _1142);
        float _1148 = fma(_1094, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1090, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1106 = _1148;
        _1108 = _1150;
        _1114 = _1146;
    }
    float _1152 = _1106;
    float _1154 = _1108;
    float _1156 = _1114;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1160 = _1152 + _1158;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1164 = _1154 + _1162;
    float _1166 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1168 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4194 = float2(_1166, _1168);
    float _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4194, float2(0.0), isnan(_4194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4194, float2(0.0), isnan(_4194)), level(0.0)).x;
    float _1172 = -_420;
    float _1174 = _1172 + _1156;
    float _1176 = -_640;
    float _1178 = _1176 + _1152;
    float _1180 = -_660;
    float _1182 = _1180 + _1154;
    bool _1184 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1186 = isnan(0.5);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1192 = _1188 || _1190;
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_1170, 100.0, _420);
    float _1206 = _1174 * _1174;
    float _1208 = fma(_1170, 100.0, _1156);
    float _1210 = -_852;
    float _1212 = _1210 + _1204;
    float _1214 = fma(_1178, _1178, _1206);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1218 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1182, _1182, _1214);
    float _1222 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1216);
    float _1224 = sqrt(_1220);
    float _1226 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1222);
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1230 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1232 = 1.0 / _1228;
    float _1234 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1230);
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1238 = _1224 > 0.0;
    float _1240 = _1236 + _1228;
    float _1242 = _1240 * _1232;
    float _1244 = _1242 * 0.5;
    float _1246 = _1232;
    float _1248 = _1244;
    float _1250 = _1154;
    float _1252 = _1156;
    if (!_1238)
    {
        _1246 = _1208;
    }
    float _1254 = _1246;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
    float _1260 = _1254;
    float _1262 = _1254;
    if (!_1238)
    {
        _1248 = _1152;
    }
    float _1264 = _1248;
    float _1266 = 1.0 / _1258;
    bool _1268 = !_1238;
    float _1270 = _1264;
    if (!_1268)
    {
        float _1272 = _204 * _204;
        float _1274 = rsqrt(_1220);
        float _1276 = fma(_208, _208, _1272);
        float _1278 = fma(_210, _210, _1276);
        float _1280 = sqrt(_1278);
        float _1282 = _1174 * _1274;
        float _1284 = _1178 * _1274;
        float _1286 = _1182 * _1274;
        bool _1288 = _1280 > 0.0;
        float _1290 = _1280;
        _1252 = _1274;
        if (!_1288)
        {
            _1290 = _1152;
        }
        float _1292 = _1290;
        _1270 = _1292;
        if (!_1288)
        {
            _1260 = _1208;
        }
        float _1294 = _1260;
        bool _1296 = !_1288;
        _1262 = _1294;
        if (!_1296)
        {
            float _1298 = rsqrt(_1278);
            float _1300 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1302 = _204 * _1298;
            float _1304 = _208 * _1298;
            float _1306 = _210 * _1298;
            float _1308 = _1282 * _1302;
            float _1310 = fma(_1284, _1304, _1308);
            float _1312 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1314 = fma(_1286, _1306, _1310);
            float _1316 = _1314 * _1312;
            float _1318 = fma(_208, _1316, _1152);
            float _1320 = fma(_204, _1316, _1208);
            float _1322 = fma(_210, _1316, _1154);
            _1270 = _1318;
            _1250 = _1322;
            _1262 = _1320;
            _1252 = _1316;
        }
    }
    float _1324 = _1270;
    float _1326 = _1250;
    float _1328 = _1262;
    float _1330 = _1252;
    float _1332 = -_850;
    float _1334 = _1332 + _1324;
    float _1336 = -_858;
    float _1338 = _1336 + _1326;
    float _1340 = -_852;
    float _1342 = _1340 + _1328;
    float _1344 = _1330;
    float _1346 = _1342;
    float _1348 = _1334;
    float _1350 = _1338;
    float _1352 = _1326;
    if (_1202)
    {
        _1344 = 1.0;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1192)
    {
        float _1358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1360 = _1212 + _1358;
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1364 = -_660;
        float _1366 = _1364 + _1326;
        float _1368 = -_1204;
        float _1370 = _1368 + _1328;
        float _1372 = _1360 * _1360;
        float _1374 = fma(_878, _878, _1372);
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1378 = fma(_888, _888, _1374);
        float _1380 = 1.0 / _980;
        float _1382 = sqrt(_1378);
        float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1386 = precise::min(_1382, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1388 = _1386 * _1362;
        float _1390 = -_640;
        float _1392 = _1390 + _1324;
        float _1394 = _1388 * _1380;
        float _1396 = _1384 * _1394;
        float _1398 = _1366 * _1394;
        float _1400 = fma(_1370, _1396, _1212);
        float _1402 = fma(_1392, _1396, _862);
        float _1404 = fma(_1384, _1398, _874);
        _1346 = _1400;
        _1348 = _1402;
        _1350 = _1404;
    }
    float _1406 = _1346;
    float _1408 = _1348;
    float _1410 = _1350;
    if (_1202)
    {
        _1352 = 1.0;
    }
    float _1412 = _1352;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1416 = _1266 * _1414;
    float _1418 = _1412;
    if (!_1202)
    {
        float _1420 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = _1420 * 0.15915493667125701904296875;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 0.15915493667125701904296875;
        float _1432 = _1422 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = 1.0 / _1428;
        float _1438 = _1430 * 6.283185482025146484375;
        float _1440 = cos(_1438);
        float _1442 = _1434 * _1436;
        float _1444 = _1430 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1448;
        float _1452 = _1440 * _1442;
        float _1454 = 1.0 / _1450;
        float _1456 = 1.0 / _1452;
        float _1458 = _1446 * _1456;
        float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1462 = fma(_1416, _1458, _1460);
        float _1464 = _1462 * _1454;
        float _1466 = precise::clamp(_1464, 0.0, 1.0);
        _938 = _1442;
        _1356 = _1466;
    }
    float _1468 = _938;
    float _1470 = _1356;
    float _1472 = _1468;
    if (!_1202)
    {
        float _1474 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1476 = _1474 * 0.15915493667125701904296875;
        float _1478 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1480 = _1476 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1478 * 0.15915493667125701904296875;
        float _1486 = _1476 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = 1.0 / _1482;
        float _1492 = _1484 * 6.283185482025146484375;
        float _1494 = cos(_1492);
        float _1496 = _1488 * _1490;
        float _1498 = _1484 * 6.283185482025146484375;
        float _1500 = sin(_1498);
        float _1502 = _1494 * _1496;
        float _1504 = 1.0 / _1502;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1508 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1506;
        float _1510 = 1.0 / _1508;
        float _1512 = _1500 * _1504;
        float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1516 = fma(_1416, _1512, _1514);
        float _1518 = _1516 * _1510;
        float _1520 = precise::clamp(_1518, 0.0, 1.0);
        float _1522 = -_1520;
        float _1524 = _1522 + 1.0;
        _1472 = _1502;
        _1418 = _1524;
    }
    float _1526 = _1472;
    float _1528 = _1418;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1406 + _1530;
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1536 = _1408 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1540 = _1410 + _1538;
    float _1542 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = _1532 * _1532;
    float _1546 = fma(_1536, _1536, _1544);
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = rsqrt(_1548);
    float _1552 = sqrt(_1548);
    float _1554 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1536 * _1554;
    float _1558 = _1540 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 + _1562;
    float _1566 = sqrt(_1564);
    bool _1568 = _1566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1566 + _1570;
    float _1574 = _1540;
    float _1576 = _1550;
    float _1578 = _1572;
    float _1580 = _1526;
    if (_1568)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1582;
    }
    float _1584 = _1574;
    if (_1568)
    {
        float _1586 = rsqrt(_1564);
        _1576 = _1586;
    }
    float _1588 = _1576;
    float _1590 = _1588;
    if (_1568)
    {
        float _1592 = _1572 * _1584;
        _1578 = _1592;
    }
    float _1594 = _1578;
    if (_1568)
    {
        float _1596 = _1594 * 0.15915493667125701904296875;
        _1580 = _1596;
    }
    float _1598 = _1580;
    float _1600 = _1584;
    float _1602 = _1598;
    if (_1568)
    {
        float _1604 = _1598 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1600 = _1606;
    }
    float _1608 = _1600;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1544;
    float _1616 = _1612;
    if (_1568)
    {
        float _1618 = _1598 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = -_1554;
    float _1626 = -_1612;
    float _1628 = fma(_1532, _1624, _1626);
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1632 = _1628;
    if (_1568)
    {
        float _1634 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1634;
    }
    float _1636 = _1616;
    float _1638 = _1636;
    if (!_1568)
    {
        _1602 = _1560;
    }
    float _1640 = _1602;
    float _1642 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1644 = _1608;
    float _1646 = _1640;
    if (_1568)
    {
        float _1648 = fma(_1608, _1636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1644 = _1648;
    }
    float _1650 = _1644;
    float _1652 = _1650;
    float _1654 = _1622;
    if (_1568)
    {
        float _1656 = _1622 + (-1.0);
        _1638 = _1656;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    if (_1568)
    {
        float _1662 = _1588 * _1650;
        _1630 = _1662;
    }
    float _1664 = _1630;
    if (!_1568)
    {
        _1590 = _1556;
    }
    float _1666 = _1590;
    float _1668 = _1666;
    if (_1568)
    {
        float _1670 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1670;
    }
    float _1672 = _1660;
    if (_1568)
    {
        float _1674 = _1556 * _1664;
        _1668 = _1674;
    }
    float _1676 = _1668;
    if (!_1568)
    {
        _1652 = _1558;
    }
    float _1678 = _1652;
    float _1680 = _1678;
    if (_1568)
    {
        float _1682 = _1558 * _1664;
        _1680 = _1682;
    }
    float _1684 = _1680;
    if (_1568)
    {
        float _1686 = fma(_1628, _1622, _1672);
        _1632 = _1686;
    }
    float _1688 = _1632;
    if (_1568)
    {
        float _1690 = _1676 * _1676;
        _1646 = _1690;
    }
    float _1692 = _1646;
    if (!_1568)
    {
        _1654 = _1562;
    }
    float _1694 = _1654;
    float _1696 = _1694;
    if (_1568)
    {
        float _1698 = _1684 * _1684;
        _1696 = _1698;
    }
    float _1700 = _1696;
    float _1702 = fma(_1688, _1688, _1692);
    float _1704 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = floor(_1642);
    float _1708 = _1702 + _1700;
    float _1710 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1714 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1712);
    float _1716 = precise::clamp(_1714, 0.0, 1.0);
    float _1718 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1710);
    float _1720 = rsqrt(_1708);
    float _1722 = -_1716;
    float _1724 = _1722 + 1.0;
    float _1726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1728 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1730 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1732 = fma(_874, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1734 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1738 = abs(_1724);
    float _1740 = log2(_1738);
    float _1742 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1730);
    float _1744 = -_1736;
    float _1746 = fma(_1744, _1726, 1.0);
    float _1748 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1750 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1752 = _1720 * _1676;
    float _1754 = _1720 * _1688;
    float _1756 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1760 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1762 = _1720 * _1684;
    float _1764 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1766 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = -_1760;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1768);
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1774 = floor(_1732);
    float _1776 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1764);
    float _1778 = -_1762;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1770);
    float _1782 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1772);
    float _1784 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1786 = -_1706;
    float _1788 = _1642 + _1786;
    float _1790 = fma(_1780, -0.5, 0.5);
    float _1792 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1794 = log2(_1746);
    float _1796 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1798 = fma(_1780, 0.5, 0.5);
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1796);
    float _1802 = exp2(_1784);
    float _1804 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = -_1774;
    float _1808 = _1732 + _1806;
    float _1810 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1800);
    float _1812 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1792);
    float _1814 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1816 = fma(_1798, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1818 = sqrt(_1790);
    float _1820 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1810);
    float _1822 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1814);
    float _1824 = _1754 + 1.0;
    float _1826 = fma(_1798, _1816, -0.212114393711090087890625);
    float _1828 = _1794 * 0.693147182464599609375;
    float _1830 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1822);
    float _1832 = 1.0 / _1812;
    float _1834 = -_1754;
    float _1836 = fma(_1802, _1824, _1834);
    float _1838 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float2 _5239 = float2(_1788, _1808);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5239, float2(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5239, float2(0.0), isnan(_5239)), level(0.0)).x;
    float _1842 = fma(_1798, _1826, 1.570728778839111328125);
    float _1844 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = _1818 * 0.636619746685028076171875;
    float _1848 = -_1842;
    float _1850 = fma(_1846, _1848, 1.0);
    float _1852 = fma(_1836, 0.5, 0.5);
    float _1854 = _1820 * _1832;
    float _1856 = _1838 * _1832;
    float _1858 = fma(_1854, 0.5, 0.5);
    float _1860 = fma(_1856, -0.5, 0.5);
    float3 _5276 = float3(_1858, _1860, _1844);
    float _1862 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5276, float3(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5276, float3(0.0), isnan(_5276)), level(0.0)).x;
    float3 _5287 = float3(_1858, _1860, _1844);
    float4 _1865 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5287, float3(0.0), isnan(_5287)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5287, float3(0.0), isnan(_5287)), level(0.0)).xyzw;
    float _1867 = _1865.x;
    float _1869 = _1865.y;
    float _1871 = _1865.z;
    float _1873 = _1865.w;
    float2 _5303 = float2(_1850, _1852);
    float3 _1877 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5303, float2(0.0), isnan(_5303)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5303, float2(0.0), isnan(_5303)), level(0.0)).xyz;
    float _1879 = _1877.x;
    float _1881 = _1877.y;
    float _1883 = _1877.z;
    float _1885 = in.m_81.x;
    float _1887 = in.m_81.y;
    float _1889 = in.m_81.z;
    bool _1891 = _970 != 0.0;
    bool _1893 = isnan(_970);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.0);
    bool _1899 = _1895 || _1897;
    float _1901 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1905 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1907 = _968 == 0.0;
    bool _1909 = !_1899;
    bool _1911 = _1907 && _1909;
    float _1913 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1915 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1903);
    float _1917 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    bool _1919 = _972 == 0.0;
    bool _1921 = _1919 && _1911;
    float _1923 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1925 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1927 = _1000 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1929 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1931 = -_992;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1923);
    float _1935 = -_992;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1925);
    float _1939 = -_992;
    float _1941 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1927);
    float _1943 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1945 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1933);
    float _1947 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1913);
    float _1949 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1937);
    float _1951 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1941);
    float _1953 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1943);
    float _1955 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = _1887;
    float _1959 = _1885;
    float _1961 = _1889;
    if (!_1921)
    {
        float _1963 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1957 = _1963;
    }
    float _1965 = _1957;
    if (!_1921)
    {
        float _1967 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1885);
        _1959 = _1967;
    }
    float _1969 = _1959;
    float _1971 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1915);
    float _1973 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1917);
    float _1975 = _1945 * _1965;
    float _1977 = _1949 * _1965;
    float _1979 = _1951 * _1965;
    if (!_1921)
    {
        float _1981 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1889);
        _1961 = _1981;
    }
    float _1983 = _1961;
    float _1985 = fma(_1947, _1969, _1975);
    float _1987 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1953);
    float _1989 = fma(_1971, _1969, _1977);
    float _1991 = fma(_1973, _1969, _1979);
    float _1993 = fma(_1987, _1983, _1985);
    float _1995 = abs(_1416);
    float _1997 = log2(_1995);
    float _1999 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2001 = in.m_67.x;
    float _2003 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _2005 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1929);
    float _2007 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2009 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2011 = isnan(_1552);
    bool _2013 = _2009 || _2011;
    bool _2015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2017 = _2013 || _2015;
    float _2019 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2003);
    float _2021 = exp2(_1999);
    float _2023 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2005);
    float _2025 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2027 = fma(_2019, _1983, _1989);
    float _2029 = fma(_2023, _1983, _1991);
    float _2031 = _1812 * 0.5;
    float _2033 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_83.x = _1993;
    out.m_83.y = _2027;
    out.m_83.z = _2029;
    float _2035 = exp2(_2033);
    float _2037 = -_2021;
    float _2039 = _2037 + 1.0;
    float _2041 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = _1820 + _1812;
    float _2047 = fma(_2043, -2.0, 3.0);
    float _2049 = _2043 * _2043;
    bool _2051 = _1416 <= 8000.0;
    bool _2053 = isnan(_1416);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(8000.0);
    bool _2059 = _2055 || _2057;
    float _2061 = float(_2059);
    float _2063 = _2045 * 0.5;
    float _2065 = _2049 * _2047;
    float _2067 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2025);
    float _2069 = -_2065;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2067);
    float _2075 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2065);
    float _2077 = fma(_1838, -0.5, _2031);
    float _2079 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2081 = _2073 + _1812;
    float _2083 = _2061 * _2075;
    out.gl_Position.x = _1820;
    out.gl_Position.y = _1838;
    out.gl_Position.z = _2073;
    out.gl_Position.w = _1812;
    float _2085 = _2081 * 0.5;
    float _2087 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _2063;
    out.m_85.y = _2077;
    out.m_85.z = _2085;
    out.m_85.w = _1812;
    float _2089 = _1470 * _1528;
    float _2091 = _1812;
    float _2093 = _2085;
    float _2095 = _2077;
    float _2097 = _2089;
    if (!_2017)
    {
        _2091 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2099 = _2091;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2017)
    {
        _2093 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2105 = _2093;
    float _2107 = _2105;
    float _2109 = _2105;
    if (!_2017)
    {
        _2095 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2111 = _2095;
    float _2113 = -_1840;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * _2087;
    float _2119 = precise::clamp(_2117, 0.0, 1.0);
    float _2121 = -_2119;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2125 = _2123 * _2001;
    float _2127 = _2125 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _2127;
    float _2129 = _2079 * _1862;
    float _2131 = -_2079;
    float _2133 = _2131 + 1.0;
    float _2135 = _1873 * _2129;
    float _2137 = _1883 * _2129;
    float _2139 = _1873 * _2133;
    float _2141 = fma(_1879, _2135, _1867);
    float _2143 = fma(_1881, _2135, _1869);
    float _2145 = fma(_1873, _2137, _1871);
    float _2147 = _2089 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2149 = _1869;
    float _2151 = _1867;
    float _2153 = _2111;
    float _2155 = _2111;
    if (!_2017)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2157 = _2149;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2017)
    {
        _2151 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2163 = _2151;
    out.m_89.x = _2141;
    out.m_89.y = _2143;
    out.m_89.z = _2145;
    out.m_89.w = _2139;
    float _2165 = _2163;
    float _2167 = _2163;
    if (!_2017)
    {
        _2097 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2169 = _2097;
    bool _2171 = !_2017;
    float _2173 = _2169;
    float _2175 = _2169;
    if (!_2171)
    {
        bool _2177 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2179 = isnan(_1552);
        bool _2181 = _2177 || _2179;
        bool _2183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2185 = _2181 || _2183;
        if (!_2185)
        {
            float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2189 = _1552 + _2187;
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2193 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2191;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2203 = 1.0 / _2193;
            float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2217 = _2189 * _2203;
            float _2219 = precise::clamp(_2217, 0.0, 1.0);
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2225 = fma(_2219, _2197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2227 = fma(_2219, _2201, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2229 = fma(_2219, _2207, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2231 = fma(_2219, _2223, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2233 = fma(_2219, _2211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2235 = fma(_2219, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2167 = _2229;
            _2155 = _2225;
            _2161 = _2227;
            _2109 = _2233;
            _2103 = _2231;
            _2175 = _2235;
            _2237 = true;
        }
        else
        {
            bool _2239 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2241 = isnan(_1552);
            bool _2243 = _2239 || _2241;
            bool _2245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2247 = _2243 || _2245;
            if (!_2247)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2249 = _2159;
            _2161 = _2249;
            if (!_2247)
            {
                _2165 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2251 = _2165;
            _2167 = _2251;
            if (!_2247)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2253 = _2101;
            _2103 = _2253;
            if (!_2247)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2255 = _2107;
            _2109 = _2255;
            if (!_2247)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2257 = _2153;
            _2155 = _2257;
            if (!_2247)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2259 = _2173;
            bool _2261 = !_2247;
            _2175 = _2259;
            if (!_2261)
            {
                bool _2263 = _1552 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2265 = isnan(_1552);
                bool _2267 = _2263 || _2265;
                bool _2269 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2271 = _2267 || _2269;
                if (!_2271)
                {
                    float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2275 = _1552 + _2273;
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2279 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2277;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2289 = 1.0 / _2279;
                    float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2303 = _2275 * _2289;
                    float _2305 = precise::clamp(_2303, 0.0, 1.0);
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2311 = fma(_2305, _2283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2313 = fma(_2305, _2287, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2315 = fma(_2305, _2293, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2317 = fma(_2305, _2309, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2319 = fma(_2305, _2297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2321 = fma(_2305, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2167 = _2315;
                    _2155 = _2311;
                    _2161 = _2313;
                    _2109 = _2319;
                    _2103 = _2317;
                    _2175 = _2321;
                    _2237 = true;
                }
                else
                {
                    _2167 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2237 = false;
    float _2323 = _2167;
    float _2325 = _2155;
    float _2327 = _2161;
    float _2329 = _2109;
    float _2331 = _2103;
    float _2333 = _2175;
    float _2335 = fma(_2027, -0.5, 0.5);
    float _2337 = precise::clamp(_2335, 0.0, 1.0);
    float _2339 = -_2323;
    float _2341 = _2339 + _2325;
    float _2343 = -_2327;
    float _2345 = _2343 + _2329;
    out.m_91.x = 0.0;
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = fma(_2337, _2341, _2323);
    float _2353 = fma(_2337, _2345, _2327);
    bool _2355 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2357 = _2351 * 0.586610972881317138671875;
    float _2359 = fma(_2337, _2349, _2331);
    float _2361 = _2147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2363 = fma(_2353, 0.298911988735198974609375, _2357);
    bool _2365 = _1470 > 0.0;
    bool _2367 = isnan(_1470);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan(0.0);
    bool _2373 = _2369 || _2371;
    float _2375 = fma(_2359, 0.114477999508380889892578125, _2363);
    out.m_51.x = _2361;
    bool _2377 = _1528 <= 0.0;
    bool _2379 = !_2373;
    bool _2381 = _2377 || _2379;
    float _2383 = -_2375;
    float _2385 = _2353 + _2383;
    float _2387 = -_2375;
    float _2389 = _2359 + _2387;
    float _2391 = fma(_2385, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    float _2393 = -_2375;
    float _2395 = _2351 + _2393;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    float _2399 = fma(_2389, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2375);
    bool _2401 = !_2355;
    if (!_2401)
    {
        float _2403 = -_1406;
        float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2407 = -_1408;
        float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2411 = -_1410;
        float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2415 = _2405 * _2405;
        float _2417 = fma(_2409, _2409, _2415);
        float _2419 = fma(_2413, _2413, _2417);
        float _2421 = sqrt(_2419);
        float _2423 = rsqrt(_2419);
        float _2425 = -_2421;
        float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2429 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        float _2433 = _2409 * _2423;
        float _2435 = _2405 * _2423;
        float _2437 = abs(_2431);
        float _2439 = log2(_2437);
        float _2441 = _2413 * _2423;
        float _2443 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2445 = _2027 * _2435;
        float _2447 = -_2435;
        float _2449 = -_2443;
        float _2451 = fma(_2447, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2449);
        float _2453 = fma(_1993, _2433, _2445);
        float _2455 = -_2441;
        float _2457 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2451);
        float _2459 = fma(_2029, _2441, _2453);
        float _2461 = precise::clamp(_2459, 0.0, 1.0);
        float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2465 = _2457 + _2463;
        float _2467 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2471 = precise::clamp(_2469, 0.0, 1.0);
        float _2473 = exp2(_2467);
        float _2475 = _2473 * _2471;
        float _2477 = _2461 * _2475;
        float _2479 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2481 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2483 = _2477 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2479;
        out.m_91.y = _2481;
        out.m_91.z = _2483;
    }
    out.m_93.x = _2391;
    out.m_93.y = _2397;
    out.m_93.z = _2399;
    if (!_2381)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2485 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2485;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

