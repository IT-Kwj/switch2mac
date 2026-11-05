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
    float4 m_79 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_103 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_73 [[attribute(13)]];
    float4 m_85 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2590 = false;
    bool _384 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_122);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_51.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2936 = as_type<float>(_138);
        out.gl_Position.z = _2936;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_53.w;
    float _144 = float(_122);
    float _146 = -_142;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_142);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    bool _160 = _148 >= _144;
    bool _162 = !_158;
    bool _164 = _160 || _162;
    float _166 = _148;
    if (_164)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _130;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _140 = as_type<int>(_170);
    }
    int _172 = _140;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3000 = as_type<float>(_172);
        out.gl_Position.z = _3000;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = 1.0 / _144;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = _148 * _180;
    float _204 = _174 * _174;
    float _206 = _176 * _176;
    float _208 = _178 * _178;
    float _210 = fma(_184, _184, _204);
    float _212 = fma(_186, _186, _206);
    float _214 = fma(_188, _188, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = _186 * _198;
    float _234 = fma(_184, _196, _232);
    float _236 = _216;
    float _238 = _222;
    if (_228)
    {
        float _240 = rsqrt(_216);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = 0.0;
    float _246 = 0.0;
    if (!_228)
    {
        _244 = 0.0;
        _246 = 0.0;
    }
    float _248 = _244;
    float _250 = _246;
    bool _252 = _226 > 0.0;
    float _254 = _176 * _198;
    float _256 = _192 * _198;
    float _258 = 0.0;
    float _260 = _250;
    float _262 = _248;
    if (!_228)
    {
        _258 = 0.0;
    }
    float _264 = _258;
    float _266 = fma(_188, _200, _234);
    float _268 = fma(_174, _196, _254);
    float _270 = 0.0;
    float _272 = _264;
    float _274 = _266;
    if (_230)
    {
        float _276 = rsqrt(_218);
        _270 = _276;
    }
    float _278 = _270;
    float _280 = fma(_190, _196, _256);
    float _282 = 0.0;
    float _284 = 0.0;
    if (!_230)
    {
        _282 = 0.0;
        _284 = 0.0;
    }
    float _286 = _282;
    float _288 = _284;
    float _290 = 0.0;
    float _292 = _286;
    float _294 = _288;
    if (!_230)
    {
        _290 = 0.0;
    }
    float _296 = _290;
    float _298 = fma(_178, _200, _268);
    float _300 = 0.0;
    float _302 = _296;
    float _304 = _298;
    if (!_252)
    {
        _300 = 0.0;
    }
    float _306 = _300;
    float _308 = 0.0;
    float _310 = _306;
    if (_252)
    {
        float _312 = rsqrt(_220);
        _308 = _312;
    }
    float _314 = _308;
    float _316 = 0.0;
    if (!_252)
    {
        _316 = 0.0;
    }
    float _318 = _316;
    float _320 = fma(_194, _200, _280);
    float _322 = _318;
    if (!_252)
    {
        _238 = 0.0;
    }
    float _324 = _238;
    float _326 = _324;
    if (_228)
    {
        float _328 = _242 * _174;
        _260 = _328;
    }
    float _330 = _260;
    if (_228)
    {
        float _332 = _242 * _184;
        _272 = _332;
    }
    float _334 = _272;
    if (_228)
    {
        float _336 = _242 * _190;
        _262 = _336;
    }
    float _338 = _262;
    if (_230)
    {
        float _340 = _278 * _176;
        _302 = _340;
    }
    float _342 = _302;
    if (_230)
    {
        float _344 = _278 * _186;
        _292 = _344;
    }
    float _346 = _292;
    if (_230)
    {
        float _348 = _278 * _192;
        _294 = _348;
    }
    float _350 = _294;
    if (_252)
    {
        float _352 = _314 * _178;
        _310 = _352;
    }
    float _354 = _310;
    if (_252)
    {
        float _356 = _314 * _188;
        _322 = _356;
    }
    float _358 = _322;
    if (_252)
    {
        float _360 = _314 * _194;
        _326 = _360;
    }
    float _362 = _326;
    bool _364 = !_182;
    float _382;
    if (!_364)
    {
        float _366 = in.m_63.x;
        float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _370 = _366 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _372 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _374 = _372 * _368;
        float _376 = floor(_374);
        float _378 = -_376;
        float _380 = _374 + _378;
        _382 = _380;
        _384 = true;
    }
    else
    {
        _382 = _202;
    }
    _384 = false;
    float _386 = _382;
    float _388 = in.m_48.x;
    float _390 = in.m_48.y;
    float _392 = in.m_48.z;
    float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _396 = -_202;
    float _398 = _396 + 1.0;
    float _400 = in.m_63.y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = in.m_63.z;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = 1.0 / _404;
    float _414 = in.m_57.w;
    bool _416 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_386);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _202 * _394;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _398 * _394;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = 1.0 / _410;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _440 = _386 + _438;
    bool _442 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _444 = isnan(_386);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = in.m_59.w;
    float _456 = _186 * _390;
    float _458 = _192 * _390;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _460;
    float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _466 = in.m_63.x;
    float _468 = fma(_184, _388, _456);
    float _470 = fma(_190, _388, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _386 + _472;
    float _476 = precise::min(_430, _434);
    float _478 = fma(_188, _392, _468);
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    float _484 = fma(_194, _392, _470);
    float _486 = _400 + _406;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _498 = _496 != 0;
    float _500 = _440 * _436;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _504 = _502 != 0;
    float _506 = _474 * _412;
    float _508 = 1.0 / _462;
    float _510 = _486 + (-1.0);
    bool _512 = !_490;
    int _514 = _512 ? 0 : 1;
    float _516 = _478 + _414;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _524 = _522 != 0;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _528 = _526 != 0;
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _532 = _484 + _454;
    float _534 = _482 * _148;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _538 = _386 + _536;
    float _540 = _482;
    float _542 = _510;
    float _544 = _390;
    if (_504)
    {
        _540 = _466;
    }
    float _546 = _540;
    float _548 = exp2(_534);
    float _550 = _546;
    if (_504)
    {
        _542 = _400;
    }
    float _552 = _542;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _556 = 1.0 + _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _560 = _552;
    if (!_504)
    {
        _550 = _406;
    }
    float _562 = _550;
    float _564 = _466 + _406;
    if (!_504)
    {
        _560 = _466;
    }
    float _566 = _560;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _570 = _538 * _508;
    float _572 = _562 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _574 = 1.0 / _556;
    float _576 = _566 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _578 = _564 + (-1.0);
    float _580 = -_558;
    float _582 = fma(_572, 2.0, _580);
    float _584 = fma(_576, -2.0, _568);
    float _586 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _588 = -_548;
    float _590 = _588 + 1.0;
    bool _592 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _594 = isnan(1.0);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _600 = _596 || _598;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _604 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _612 = _608 || _610;
    float _614 = _400 * 2.0;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _620 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[88].z, _602);
    float _622 = _612 ? _590 : 0.0;
    float _624 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[88].w, _616);
    float _626 = fma(_618, _400, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _628 = floor(_614);
    float _630 = _466 + _400;
    float _632 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _620);
    float _634 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _624);
    float _636 = _626 * _148;
    float _638 = -_148;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[86].x, _582);
    float _642 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _584);
    if (_600)
    {
        float _644 = _622 * _574;
        _166 = _644;
    }
    float _646 = _166;
    float _648 = _630 + (-1.0);
    float _650 = _406 * 2.0;
    float _652 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _658;
    bool _662 = !_494;
    int _664 = _662 ? 0 : 1;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _666;
    float _670 = floor(_650);
    float _672 = fma(_656, _506, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _674 = fma(_660, _506, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _676 = fma(_668, _506, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _678 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _680 = isnan(_386);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _466 * 2.0;
    bool _692 = _628 > 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _698 = _628 >= 0.0;
    bool _700 = isnan(_628);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _716 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _718 = isnan(_386);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_688;
    float _730 = _728 + 1.0;
    float _732 = floor(_690);
    float _734 = fma(_696, _500, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _736 = fma(_710, _500, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _738 = fma(_714, _500, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _740 = _726 * _730;
    float _742 = -_726;
    float _744 = _742 + 1.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _746;
    bool _750 = !_498;
    int _752 = _750 ? 0 : 1;
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _760;
    float _764 = _452 * _744;
    bool _766 = _670 > 0.0;
    float _768 = -_452;
    float _770 = _768 + 1.0;
    bool _772 = _670 >= 0.0;
    bool _774 = isnan(_670);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(_758, _570, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _784 = fma(_762, _570, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _786 = fma(_748, _570, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _788 = _426 * _770;
    int _790 = _780 ? 0 : 1;
    float _792 = -_426;
    float _794 = _792 + 1.0;
    bool _796 = _732 >= 0.0;
    bool _798 = isnan(_732);
    bool _800 = _796 || _798;
    bool _802 = isnan(0.0);
    bool _804 = _800 || _802;
    float _806 = _672 * _788;
    float _808 = _674 * _788;
    float _810 = _676 * _788;
    float _812 = _646 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _814 = ~_790;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].y, _808);
    bool _822 = !_528;
    int _824 = _822 ? 0 : 1;
    float _826 = _812 * _754;
    int _828 = _818;
    if (!_766)
    {
        int _830 = ~_790;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].z, _810);
    int _838 = _706 ? 0 : 1;
    float _840 = _646 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _842 = _804 ? 0 : 1;
    float _844 = fma(_736, _764, _820);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _856 = _854 != 0;
    float _858 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].x, _806);
    bool _860 = _732 > 0.0;
    float _862 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[203].x, _826);
    int _864 = ~_842;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    float _870 = fma(_734, _764, _858);
    bool _872 = !_852;
    int _874 = _872 ? 0 : 1;
    float _876 = floor(_862);
    float _878 = _840 * _464;
    float _880 = fma(_738, _764, _836);
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    bool _888 = !_848;
    int _890 = _888 ? 0 : 1;
    float _892 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[203].z, _878);
    int _894 = abs(_874);
    float _896 = _862 * 6.283185482025146484375;
    int _898 = _868;
    bool _900 = _848;
    if (!_860)
    {
        int _902 = ~_842;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    float _908 = floor(_892);
    float _910 = float(_834);
    float _912 = _862 + 0.25;
    int _914 = ~_838;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = fma(_782, _740, _870);
    int _922 = abs(_890);
    float _924 = fma(_466, 6.283185482025146484375, _636);
    int _926 = _918;
    if (!_692)
    {
        int _928 = ~_838;
        int _930 = _928 + 1;
        _926 = _930;
    }
    int _932 = _926;
    float _934 = floor(_912);
    float _936 = _896 * 0.15915493667125701904296875;
    float _938 = float(_906);
    float _940 = -_876;
    float _942 = _862 + _940;
    float _944 = float(_894);
    float _946 = fma(_784, _740, _844);
    float _948 = float(_922);
    float _950 = -_476;
    float _952 = _950 + 1.0;
    float _954 = _936 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _944 * _938;
    int _960 = abs(_664);
    float _962 = _948 * _910;
    bool _964 = _942 >= 0.5;
    bool _966 = isnan(_942);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.5);
    bool _972 = _968 || _970;
    float _974 = _892 + 0.25;
    float _976 = _958 * (-2.0);
    int _978 = abs(_514);
    float _980 = floor(_974);
    bool _982 = !_972;
    float _984 = _982 ? 0.5 : (-0.5);
    float _986 = fma(_530, _976, _530);
    float _988 = float(_960);
    float _990 = -_934;
    float _992 = _912 + _990;
    float _994 = fma(_976, _884, _884);
    float _996 = -_908;
    float _998 = _892 + _996;
    float _1000 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1002 = _1000 * 2.0;
    float _1004 = _892 * 6.283185482025146484375;
    float _1006 = _956 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1008 = _992 > 0.5;
    float _1010 = _988 * _1002;
    float _1012 = _1004 * 0.15915493667125701904296875;
    float _1014 = float(_978);
    float _1016 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].y, _946);
    float _1018 = -_980;
    float _1020 = _974 + _1018;
    int _1022 = abs(_752);
    float _1024 = _400 + (-0.5);
    float _1026 = fma(_1014, _1006, _1010);
    float _1028 = _1012 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    bool _1032 = !_524;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = in.m_67.x;
    bool _1038 = _998 >= 0.5;
    bool _1040 = isnan(_998);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.5);
    bool _1046 = _1042 || _1044;
    float _1048 = _992;
    float _1050 = _1020;
    if (_1008)
    {
        float _1052 = -_992;
        float _1054 = _1052 + 1.0;
        _1048 = _1054;
    }
    float _1056 = _1048;
    bool _1058 = !_520;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = fma(_786, _740, _880);
    int _1064 = abs(_1034);
    float _1066 = fma(_1056, 4.0, -1.0);
    float _1068 = float(_1022);
    bool _1070 = !_1046;
    float _1072 = _1070 ? 0.5 : (-0.5);
    float _1074 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1076 = abs(_1060);
    bool _1078 = _1020 > 0.5;
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = _1080 * 2.0;
    float _1084 = float(_1064);
    float _1086 = fma(_1068, _1074, _1026);
    float _1088 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _994);
    float _1090 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1092 = _1084 * _1082;
    float _1094 = float(_1076);
    float _1096 = fma(_986, _646, _1088);
    float _1098 = fma(_1086, 3.1415927410125732421875, _882);
    float _1100 = _962 * (-2.0);
    float _1102 = float(_932);
    float _1104 = fma(_1094, _1090, _1092);
    if (_1078)
    {
        float _1106 = -_1020;
        float _1108 = _1106 + 1.0;
        _1050 = _1108;
    }
    float _1110 = _1050;
    float _1112 = _924 * 0.15915493667125701904296875;
    float _1114 = _532 * _532;
    int _1116 = abs(_824);
    float _1118 = fma(_1110, 4.0, -1.0);
    bool _1120 = !_856;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = fma(_516, _516, _1114);
    float _1126 = float(_1116);
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1130 = abs(_1122);
    float _1132 = _466 + (-0.5);
    float _1134 = fma(_1098, _1100, _1098);
    float _1136 = fma(_1126, _1128, _1104);
    float _1138 = float(_1130);
    float _1140 = fma(_652, _1100, _652);
    float _1142 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1134);
    float _1144 = _1112 * 6.283185482025146484375;
    float _1146 = sin(_1144);
    float _1148 = in.m_67.y;
    float _1150 = _1138 * _1102;
    float _1152 = fma(_1136, 3.1415927410125732421875, _886);
    float _1154 = fma(_1140, _646, _1142);
    float _1156 = in.m_69.x;
    float _1158 = in.m_69.y;
    float _1160 = in.m_69.z;
    float _1162 = _1150 * (-2.0);
    float _1164 = _1096 * 0.15915493667125701904296875;
    float _1166 = _1154 * 0.15915493667125701904296875;
    float _1168 = in.m_67.z;
    float _1170 = fma(_586, _1162, _586);
    float _1172 = fma(_1152, _1162, _1152);
    float _1174 = _406 + (-0.5);
    float _1176 = _1164 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = in.m_71.y;
    float _1182 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1172);
    float _1184 = abs(_1146);
    float _1186 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1188 = fma(_1170, _646, _1182);
    float _1190 = _1164 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].x, _920);
    float _1196 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1186);
    float _1198 = _1188 * 0.15915493667125701904296875;
    float _1200 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1062);
    float _1202 = _690 + (-1.0);
    float _1204 = -_1196;
    float _1206 = _1204 + _1148;
    float _1208 = _1166 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1016 * _1158;
    float _1214 = _1194 * _1156;
    float _1216 = _1200 * _1160;
    float _1218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1036);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1206);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1226 = sqrt(_1124);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1168);
    float _1230 = _1222 * _1218;
    float _1232 = _1224 * _1220;
    float _1234 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _390 + _1180;
    float _1238 = _1166 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _1210 * _1192;
    float _1244 = _1210 * _1178;
    float _1246 = _1234 * _1228;
    float _1248 = _1198 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1202 * _1226;
    float _1254 = _1252 * 0.75;
    float _1256 = _1198 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = _1240 * _1178;
    float _1262 = _1240 * _1192;
    float _1264 = _1254 * 0.15915493667125701904296875;
    float _1266 = _1210 * _1250;
    float _1268 = _1240 * _1250;
    float _1270 = _1192 * _1250;
    float _1272 = _1178 * _1250;
    float _1274 = _1266 * _1232;
    float _1276 = _1268 * _1232;
    float _1278 = _1264 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = fma(_1258, _1242, _1260);
    float _1284 = -_1244;
    float _1286 = fma(_1258, _1262, _1284);
    float _1288 = -_1262;
    float _1290 = fma(_1258, _1244, _1288);
    float _1292 = -_1232;
    float _1294 = _1258 * _1292;
    float _1296 = fma(_1282, _1230, _1274);
    float _1298 = fma(_1258, _1260, _1242);
    float _1300 = fma(_1286, _1230, _1276);
    float _1302 = fma(_1270, _1230, _1294);
    float _1304 = fma(_1290, _1246, _1296);
    float _1306 = _1264 * 6.283185482025146484375;
    float _1308 = cos(_1306);
    float _1310 = fma(_1272, _1246, _1302);
    float _1312 = _1304 * _346;
    float _1314 = fma(_1298, _1246, _1300);
    float _1316 = _1304 * _350;
    float _1318 = fma(_1310, _334, _1312);
    float _1320 = fma(_1310, _338, _1316);
    float _1322 = fma(_1314, _358, _1318);
    float _1324 = fma(_1314, _362, _1320);
    float _1326 = _1322 * _1280;
    float _1328 = _1322 * _1308;
    float _1330 = -_1326;
    float _1332 = fma(_1324, _1308, _1330);
    float _1334 = fma(_1324, _1280, _1328);
    float _1336 = _532 + _1332;
    float _1338 = _516 + _1334;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1342 = _1336 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1346 = _1338 + _1344;
    float _1348 = _1342 * _1342;
    float _1350 = fma(_1346, _1346, _1348);
    float _1352 = sqrt(_1350);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = _1352 + _1356;
    float _1360 = _1332;
    float _1362 = _1352;
    float _1364 = _1212;
    float _1366 = _1146;
    if (_1354)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1368;
    }
    float _1370 = _1360;
    if (_1354)
    {
        float _1372 = _1358 * _1370;
        _1362 = _1372;
    }
    float _1374 = _1362;
    if (_1354)
    {
        float _1376 = _1374 * 0.15915493667125701904296875;
        _1364 = _1376;
    }
    float _1378 = _1364;
    float _1380 = _1304 * _342;
    float _1382 = _1370;
    float _1384 = _1380;
    if (_1354)
    {
        float _1386 = _1378 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        _1382 = _1388;
    }
    float _1390 = _1382;
    float _1392 = fma(_1310, _330, _1380);
    if (!_1354)
    {
        _1384 = _1338;
    }
    float _1394 = _1384;
    float _1396 = fma(_1314, _354, _1392);
    float _1398 = _1314;
    float _1400 = _1396;
    float _1402 = _1394;
    if (_1354)
    {
        float _1404 = rsqrt(_1350);
        _1398 = _1404;
    }
    float _1406 = _1398;
    float _1408 = _1236 + _1396;
    if (_1354)
    {
        float _1410 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _544 = _1410;
    }
    float _1412 = _544;
    float _1414 = _1412;
    if (_1354)
    {
        float _1416 = fma(_1390, _1412, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1400 = _1416;
    }
    float _1418 = _1400;
    if (!_1354)
    {
        _1414 = _1336;
    }
    float _1420 = _1414;
    float _1422 = _1406;
    float _1424 = _1420;
    if (_1354)
    {
        float _1426 = _1406 * _1418;
        _1422 = _1426;
    }
    float _1428 = _1422;
    float _1430 = _1428;
    if (_1354)
    {
        float _1432 = fma(_1346, _1428, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1402 = _1432;
    }
    float _1434 = _1402;
    float _1436 = _1434;
    if (_1354)
    {
        float _1438 = fma(_1342, _1428, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1424 = _1438;
    }
    float _1440 = _1424;
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1444 = _1434 + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1448 = _1440 + _1446;
    float _1450 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1452 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4878 = float2(_1450, _1452);
    float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4878, float2(0.0), isnan(_4878)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4878, float2(0.0), isnan(_4878)), level(0.0)).x;
    float _1456 = _1390;
    float _1458 = _1444;
    float _1460 = _1448;
    float _1462 = _1440;
    if (_1354)
    {
        float _1464 = _1378 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1456 = _1466;
    }
    float _1468 = _1456;
    if (!_1354)
    {
        _1458 = _1408;
    }
    float _1470 = _1458;
    float _1472 = -_516;
    float _1474 = _1472 + _1434;
    float _1476 = -_532;
    float _1478 = _1476 + _1440;
    bool _1480 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1482 = isnan(0.5);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1488 = _1484 || _1486;
    float _1490 = fma(_532, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1492 = _1470;
    if (_1354)
    {
        float _1494 = _1468 + (-1.0);
        _1430 = _1494;
    }
    float _1496 = _1430;
    if (_1354)
    {
        float _1498 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1460 = _1498;
    }
    float _1500 = _1460;
    if (_1354)
    {
        float _1502 = fma(_1408, _1468, _1500);
        _1492 = _1502;
    }
    float _1504 = _1492;
    float _1506 = -_1236;
    float _1508 = _1506 + _1504;
    float _1510 = fma(_516, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1512 = _1508 * _1508;
    float _1514 = floor(_1490);
    float _1516 = fma(_1474, _1474, _1512);
    float _1518 = fma(_1478, _1478, _1516);
    float _1520 = floor(_1510);
    float _1522 = sqrt(_1518);
    float _1524 = -_1520;
    float _1526 = _1510 + _1524;
    float _1528 = -_1514;
    float _1530 = _1490 + _1528;
    bool _1532 = _1522 > 0.0;
    float _1534 = _1522;
    float _1536 = _1504;
    if (!_1532)
    {
        _1534 = _1440;
    }
    float _1538 = _1534;
    float _1540 = fma(_1454, 100.0, _1504);
    float _1542 = fma(_1454, 100.0, _1236);
    float _1544 = _1538;
    float _1546 = _1454;
    if (!_1532)
    {
        _1536 = _1540;
    }
    float _1548 = _1536;
    bool _1550 = !_1532;
    float _1552 = _1548;
    if (!_1550)
    {
        float _1554 = _298 * _298;
        float _1556 = fma(_266, _266, _1554);
        float _1558 = rsqrt(_1518);
        float _1560 = fma(_320, _320, _1556);
        float _1562 = sqrt(_1560);
        float _1564 = _1474 * _1558;
        float _1566 = _1508 * _1558;
        float _1568 = _1478 * _1558;
        bool _1570 = _1562 > 0.0;
        float _1572 = _1562;
        float _1574 = _1558;
        _1366 = _1566;
        if (!_1570)
        {
            _1572 = _1540;
        }
        float _1576 = _1572;
        _1552 = _1576;
        if (!_1570)
        {
            _1574 = _1440;
        }
        float _1578 = _1574;
        bool _1580 = !_1570;
        _1544 = _1578;
        if (!_1580)
        {
            float _1582 = rsqrt(_1560);
            float _1584 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1586 = _298 * _1582;
            float _1588 = _266 * _1582;
            float _1590 = _1566 * _1586;
            float _1592 = _320 * _1582;
            float _1594 = fma(_1564, _1588, _1590);
            float _1596 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1598 = fma(_1568, _1592, _1594);
            float _1600 = _1598 * _1596;
            float _1602 = fma(_266, _1600, _1434);
            float _1604 = fma(_298, _1600, _1540);
            float _1606 = fma(_320, _1600, _1440);
            _1552 = _1604;
            _1544 = _1606;
            _1436 = _1602;
            _1546 = _1584;
        }
    }
    float _1608 = _1552;
    float _1610 = _1544;
    float _1612 = _1436;
    float _1614 = _1546;
    float _1616 = _1366;
    float _1618 = _1612;
    float _1620 = _1610;
    float _1622 = _1614;
    float _1624 = _1616;
    if (_1488)
    {
        _1462 = _1608;
    }
    float _1626 = _1462;
    float _1628 = _1626;
    if (!_1488)
    {
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1632 = _1542 + _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1636 = _516 + _1634;
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1640 = -_1542;
        float _1642 = _1640 + _1608;
        float _1644 = _1632 * _1632;
        float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1648 = _532 + _1646;
        float _1650 = -_532;
        float _1652 = _1650 + _1610;
        float _1654 = fma(_1636, _1636, _1644);
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = fma(_1648, _1648, _1654);
        float _1660 = sqrt(_1658);
        float _1662 = _1638 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1664 = precise::min(_1660, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1666 = _1664 * _1656;
        float _1668 = -_516;
        float _1670 = _1668 + _1612;
        float _1672 = _1662 * _1666;
        float _1674 = fma(_1670, _1672, _516);
        float _1676 = fma(_1642, _1672, _1542);
        float _1678 = fma(_1652, _1672, _532);
        _1628 = _1676;
        _1618 = _1674;
        _1620 = _1678;
        _1622 = _1666;
        _274 = _1672;
    }
    float _1680 = _1628;
    float _1682 = _1618;
    float _1684 = _1620;
    float _1686 = _1622;
    float _1688 = _274;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1692 = _1680 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1696 = _1682 + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1700 = _1684 + _1698;
    float _1702 = _1692 * _1692;
    float _1704 = fma(_1696, _1696, _1702);
    float _1706 = fma(_1700, _1700, _1704);
    float _1708 = rsqrt(_1706);
    float _1710 = sqrt(_1706);
    float _1712 = _1696 * _1708;
    float _1714 = _1700 * _1708;
    float _1716 = _1692 * _1708;
    float _1718 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1718 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 + _1724;
    float _1728 = sqrt(_1726);
    bool _1730 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1728 + _1732;
    float _1736 = _1686;
    float _1738 = _1726;
    float _1740 = _1734;
    if (_1730)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1742;
    }
    float _1744 = _1736;
    if (_1730)
    {
        float _1746 = rsqrt(_1726);
        _1738 = _1746;
    }
    float _1748 = _1738;
    if (_1730)
    {
        float _1750 = _1734 * _1744;
        _1740 = _1750;
    }
    float _1752 = _1740;
    if (_1730)
    {
        float _1754 = _1752 * 0.15915493667125701904296875;
        _304 = _1754;
    }
    float _1756 = _304;
    float _1758 = _1688;
    float _1760 = _1756;
    if (_1730)
    {
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        _1758 = _1764;
    }
    float _1766 = _1758;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = precise::max(0.0, _1768);
    float _1772 = _1744;
    float _1774 = _1770;
    float _1776 = _1768;
    if (_1730)
    {
        float _1778 = _1756 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        _1772 = _1780;
    }
    float _1782 = _1772;
    float _1784 = -_1716;
    float _1786 = -_1770;
    float _1788 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1786);
    if (_1730)
    {
        float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1774 = _1790;
    }
    float _1792 = _1774;
    float _1794 = _1766;
    float _1796 = _1792;
    if (_1730)
    {
        float _1798 = fma(_1766, _1792, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1794 = _1798;
    }
    float _1800 = _1794;
    float _1802 = _1800;
    if (!_1730)
    {
        _1796 = _1788;
    }
    float _1804 = _1796;
    float _1806 = _1804;
    float _1808 = _1782;
    if (_1730)
    {
        float _1810 = _1782 + (-1.0);
        _1776 = _1810;
    }
    float _1812 = _1776;
    float _1814 = _1812;
    if (_1730)
    {
        float _1816 = _1748 * _1800;
        _1624 = _1816;
    }
    float _1818 = _1624;
    if (!_1730)
    {
        _1802 = _1718;
    }
    float _1820 = _1802;
    float _1822 = _1820;
    if (_1730)
    {
        float _1824 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1760 = _1824;
    }
    float _1826 = _1760;
    float _1828 = _1826;
    if (_1730)
    {
        float _1830 = _1718 * _1818;
        _1822 = _1830;
    }
    float _1832 = _1822;
    if (!_1730)
    {
        _1814 = _1720;
    }
    float _1834 = _1814;
    float _1836 = _1834;
    if (_1730)
    {
        float _1838 = _1720 * _1818;
        _1836 = _1838;
    }
    float _1840 = _1836;
    if (_1730)
    {
        float _1842 = fma(_1788, _1782, _1826);
        _1806 = _1842;
    }
    float _1844 = _1806;
    if (!_1730)
    {
        _1828 = _1722;
    }
    float _1846 = _1828;
    float _1848 = _1846;
    if (_1730)
    {
        float _1850 = _1832 * _1832;
        _1848 = _1850;
    }
    float _1852 = _1848;
    if (!_1730)
    {
        _1808 = _1724;
    }
    float _1854 = _1808;
    float _1856 = _1854;
    if (_1730)
    {
        float _1858 = _1840 * _1840;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1864 = fma(_1844, _1844, _1852);
    float _1866 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1862);
    float _1868 = _1864 + _1860;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1866);
    float _1878 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1880 = rsqrt(_1868);
    float _1882 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1886 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1888 = -_1874;
    float _1890 = _1888 + 1.0;
    float _1892 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1894 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1878);
    float _1896 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1886);
    float _1898 = abs(_1890);
    float _1900 = log2(_1898);
    float _1902 = -_1892;
    float _1904 = fma(_1902, _1884, 1.0);
    float _1906 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1908 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1896);
    float _1910 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1894);
    float _1912 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1906);
    float _1914 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1916 = _1880 * _1832;
    float _1918 = _1880 * _1844;
    float _1920 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1912);
    float _1922 = _1880 * _1840;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1926 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1928 = _1920 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1930 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = -_1924;
    float _1934 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1932);
    float _1936 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1938 = log2(_1904);
    float _1940 = _1918 + 1.0;
    float _1942 = -_1922;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1934);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1926);
    float _1948 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1950 = fma(_1944, -0.5, 0.5);
    float _1952 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1946);
    float _1954 = exp2(_1936);
    float _1956 = fma(_1944, 0.5, 0.5);
    float _1958 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1960 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1952);
    float _1962 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1948);
    float _1964 = fma(_1956, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = 1.0 / _1960;
    float _1968 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1958);
    float _1970 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1962);
    float2 _5716 = float2(_1526, _1530);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5716, float2(0.0), isnan(_5716)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5716, float2(0.0), isnan(_5716)), level(0.0)).x;
    float _1974 = fma(_1956, _1964, -0.212114393711090087890625);
    float _1976 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1968);
    float _1978 = _1938 * 0.693147182464599609375;
    float _1980 = sqrt(_1950);
    float _1982 = fma(_1956, _1974, 1.570728778839111328125);
    float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1986 = -_1918;
    float _1988 = fma(_1954, _1940, _1986);
    float _1990 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1970);
    float _1992 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1976);
    float _1994 = _1990 * _1966;
    float _1996 = _1992 * _1966;
    float _1998 = _1980 * 0.636619746685028076171875;
    float _2000 = fma(_1988, 0.5, 0.5);
    float _2002 = fma(_1994, 0.5, 0.5);
    float _2004 = fma(_1996, -0.5, 0.5);
    float _2006 = -_1982;
    float _2008 = fma(_1998, _2006, 1.0);
    float3 _5783 = float3(_2002, _2004, _1984);
    float _2010 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5783, float3(0.0), isnan(_5783)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5783, float3(0.0), isnan(_5783)), level(0.0)).x;
    float3 _5794 = float3(_2002, _2004, _1984);
    float4 _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5794, float3(0.0), isnan(_5794)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5794, float3(0.0), isnan(_5794)), level(0.0)).xyzw;
    float _2015 = _2013.x;
    float _2017 = _2013.y;
    float _2019 = _2013.z;
    float _2021 = _2013.w;
    float2 _5810 = float2(_2008, _2000);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5810, float2(0.0), isnan(_5810)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5810, float2(0.0), isnan(_5810)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2035 = in.m_73.y;
    float _2037 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2041 = _400 > 0.5;
    float _2043 = _2033 * _466;
    float _2045 = in.m_73.x;
    float _2047 = _2037 * _466;
    bool _2049 = _406 > 0.5;
    float _2051 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2053 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2055 = trunc(_2043);
    int _2057 = int(_2055);
    out.m_75.x = _1682;
    out.m_75.y = _1680;
    out.m_75.z = _1684;
    float _2059 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2053);
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2067 = _2065 != 0;
    float _2069 = trunc(_2047);
    int _2071 = int(_2069);
    int _2073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2075 = _2073 != 0;
    float _2077 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2081 = _2079 != 0;
    float _2083 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2059);
    float _2085 = -_2035;
    float _2087 = _2085 + 1.0;
    int _2089 = _2057 << 4;
    int _2091 = _2089 + 1712;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2095 = _2035;
    float _2097 = _1992;
    float _2099 = _1990;
    if (_2063)
    {
        bool _2101 = _466 > 0.5;
        _900 = _2101;
    }
    bool _2103 = _900;
    uint _2106 = uint(int(uint(_2091) >> uint(2)));
    uint _2108 = uint(int(uint(int(_2106)) >> uint(2)));
    int _2110 = int(_2106) & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = int(_2106) + 1;
    uint _2116 = uint(int(uint(_2114) >> uint(2)));
    int _2118 = _2114 & 3;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[int(_2116)][_2118];
    int _2122 = _2049 ? as_type<int>(_2087) : as_type<int>(_2035);
    float _2124 = -_1196;
    float _2126 = -_1148;
    bool _2128 = _2124 != _2126;
    bool _2130 = isnan(_2124);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan(_2126);
    bool _2136 = _2132 || _2134;
    int _2138 = _2071 << 4;
    int _2140 = _2138 + 1968;
    float _2142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2144 = _1036 == 0.0;
    bool _2146 = !_2136;
    bool _2148 = _2144 && _2146;
    int _2150 = _2091 + 8;
    uint _2152 = uint(int(uint(_2150) >> uint(2)));
    uint _2154 = uint(int(uint(int(_2152)) >> uint(2)));
    int _2156 = int(_2152) & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    float _2160 = _2081 ? as_type<float>(_2122) : _2035;
    bool _2162 = _1168 == 0.0;
    bool _2164 = _2162 && _2148;
    float _2166 = as_type<float>(_2071);
    int _2168 = _2140;
    if (_2067)
    {
        float _2170 = _2041 ? _2087 : _2035;
        _2095 = _2170;
    }
    float _2172 = _2095;
    float _2174 = fma(_2160, _2077, -0.5);
    float _2176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2178 = _2140 + 8;
    uint _2180 = uint(int(uint(_2178) >> uint(2)));
    uint _2182 = uint(int(uint(int(_2180)) >> uint(2)));
    int _2184 = int(_2180) & 3;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[int(_2182)][_2184];
    float _2188 = -_642;
    float _2190 = fma(_634, _2174, _2188);
    float _2192 = _2045;
    if (!_2063)
    {
        _2166 = _2045;
    }
    float _2194 = _2166;
    float _2196 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2200 = exp2(_2051);
    uint _2202 = uint(int(uint(_2140) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    float _2218 = _2194;
    if (_2075)
    {
        float _2220 = -_2045;
        float _2222 = _2220 + 1.0;
        _2168 = as_type<int>(_2222);
    }
    int _2224 = _2168;
    float _2226 = -_2200;
    float _2228 = _2226 + 1.0;
    float _2230 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2232 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2234 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2236 = in.m_77.x;
    float _2238 = in.m_77.y;
    float _2240 = in.m_77.z;
    float _2242 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2244 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2246 = as_type<int>(_2186);
    if (_2063)
    {
        float _2248 = -_2045;
        float _2250 = _2248 + 1.0;
        _2246 = as_type<int>(_2250);
    }
    int _2252 = _2246;
    float _2254 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2256 = _2254;
    if (_2063)
    {
        float _2258 = _2103 ? as_type<float>(_2252) : _2045;
        _2218 = _2258;
    }
    float _2260 = _2218;
    float _2262 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2264 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2266 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2270 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2272 = _2236;
    float _2274 = _2238;
    float _2276 = _2240;
    if (!_2164)
    {
        float _2278 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2236);
        _2272 = _2278;
    }
    float _2280 = _2272;
    float _2282 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2284 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2075)
    {
        float _2286 = _2041 ? as_type<float>(_2224) : _2045;
        _2192 = _2286;
    }
    float _2288 = _2192;
    out.m_79.x = _2266;
    out.m_79.y = _2268;
    out.m_79.z = _2270;
    out.m_79.w = _2198;
    if (!_2164)
    {
        float _2290 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2238);
        _2274 = _2290;
    }
    float _2292 = _2274;
    if (!_2164)
    {
        float _2294 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2240);
        _2276 = _2294;
    }
    float _2296 = _2276;
    float _2298 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = fma(_2196, _2288, -0.5);
    float _2302 = _1266 * _2292;
    float _2304 = -_2292;
    float _2306 = _1258 * _2304;
    float _2308 = _1268 * _2292;
    float _2310 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = fma(_1282, _2280, _2302);
    float _2314 = fma(_1270, _2280, _2306);
    float _2316 = fma(_1286, _2280, _2308);
    bool _2318 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2320 = isnan(_1710);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2326 = _2322 || _2324;
    float _2328 = fma(_1290, _2296, _2312);
    float _2330 = _2282 * _2142;
    float _2332 = _2284 * _2176;
    float _2334 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2336 = fma(_632, _2300, _640);
    float _2338 = _2190 + 0.5;
    float _2340 = fma(_1272, _2296, _2314);
    out.m_81.x = _2332;
    out.m_81.y = _2330;
    float _2342 = _2336 + 0.5;
    float _2344 = _2328 * _346;
    float _2346 = _2328 * _342;
    float _2348 = _2328 * _350;
    float _2350 = fma(_1298, _2296, _2316);
    out.m_83.x = _2342;
    out.m_83.y = _2338;
    float _2352 = fma(_2340, _334, _2344);
    float _2354 = fma(_2340, _330, _2346);
    float _2356 = fma(_2340, _338, _2348);
    float _2358 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2334);
    float _2360 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2362 = fma(_2350, _358, _2352);
    float _2364 = fma(_2350, _354, _2354);
    float _2366 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2358);
    float _2368 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2360);
    float _2370 = fma(_2350, _362, _2356);
    float _2372 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2374 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2368);
    float _2376 = in.m_71.x;
    float _2378 = 1.0 / _2372;
    float _2380 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2382 = in.m_85.w;
    float _2384 = _2380 + _2372;
    out.m_87.x = _2298;
    out.m_87.y = _2310;
    out.m_87.z = _2254;
    float _2386 = in.m_85.y;
    float _2388 = in.m_85.z;
    float _2390 = _2384 * _2378;
    float _2392 = _2390 * 0.5;
    out.m_89.x = _2362;
    out.m_89.y = _2364;
    out.m_89.z = _2370;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2396 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2394);
    if (!_2326)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2398 = _2256;
    float _2400 = in.m_85.x;
    float _2402 = 1.0 / _2396;
    out.m_91.w = _2382;
    out.m_91.y = _2386;
    out.m_91.z = _2388;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2406 = _2402 * _2404;
    float _2408 = _2386;
    float _2410 = _2388;
    float _2412 = _2398;
    float _2414 = _2398;
    if (!_2326)
    {
        _2408 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2416 = _2408;
    float _2418 = abs(_2406);
    float _2420 = log2(_2418);
    out.m_91.x = _2400;
    float _2422 = _2416;
    float _2424 = _2416;
    if (!_2326)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2426 = _2410;
    bool _2428 = _2406 <= 8000.0;
    bool _2430 = isnan(_2406);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(8000.0);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2442 = exp2(_2440);
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = fma(_2446, -2.0, 3.0);
    float _2450 = _2446 * _2446;
    float _2452 = _2450 * _2448;
    float _2454 = -_2452;
    float _2456 = _2454 + 1.0;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2452);
    float _2460 = _2438 * _2458;
    float _2462 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2464 = -_1972;
    float _2466 = _2464 + 1.0;
    float _2468 = _2466 * _2462;
    float _2470 = precise::clamp(_2468, 0.0, 1.0);
    float _2472 = -_2470;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2476 = _2474 * _2376;
    float _2478 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2083);
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2482 = _2478 + _1960;
    out.gl_Position.x = _1990;
    out.gl_Position.y = _1992;
    out.gl_Position.z = _2478;
    out.gl_Position.w = _1960;
    out.m_93.x = _2480;
    float _2484 = _2230 * _2010;
    float _2486 = -_2230;
    float _2488 = _2486 + 1.0;
    float _2490 = _2021 * _2484;
    float _2492 = _2031 * _2484;
    float _2494 = _2021 * _2488;
    float _2496 = _2482;
    float _2498 = _2426;
    float _2500 = _2426;
    if (!_2326)
    {
        _2097 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2502 = _2097;
    float _2504 = fma(_2027, _2490, _2015);
    float _2506 = fma(_2029, _2490, _2017);
    float _2508 = _2482 * 0.5;
    float _2510 = fma(_2021, _2492, _2019);
    float _2512 = _2502;
    float _2514 = _2502;
    if (!_2326)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2516 = _2496;
    float _2518 = _2516;
    float _2520 = _2516;
    if (!_2326)
    {
        _2099 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2522 = _2099;
    out.m_95.z = _2508;
    out.m_95.w = _1960;
    out.m_97.x = _2504;
    out.m_97.y = _2506;
    out.m_97.z = _2510;
    out.m_97.w = _2494;
    bool _2524 = !_2326;
    float _2526 = _2522;
    float _2528 = _2522;
    if (!_2524)
    {
        bool _2530 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2532 = isnan(_1710);
        bool _2534 = _2530 || _2532;
        bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2538 = _2534 || _2536;
        if (!_2538)
        {
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2542 = _1710 + _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2546 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2544;
            float _2548 = 1.0 / _2546;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2570 = _2542 * _2548;
            float _2572 = precise::clamp(_2570, 0.0, 1.0);
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2578 = fma(_2572, _2552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2572, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2582 = fma(_2572, _2556, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2584 = fma(_2572, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2586 = fma(_2572, _2564, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2588 = fma(_2572, _2568, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2424 = _2578;
            _2514 = _2586;
            _2414 = _2580;
            _2520 = _2584;
            _2500 = _2582;
            _2528 = _2588;
            _2590 = true;
        }
        else
        {
            bool _2592 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2594 = isnan(_1710);
            bool _2596 = _2592 || _2594;
            bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2600 = _2596 || _2598;
            if (!_2600)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2602 = _2412;
            _2414 = _2602;
            if (!_2600)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2604 = _2422;
            _2424 = _2604;
            if (!_2600)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2606 = _2498;
            _2500 = _2606;
            if (!_2600)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2608 = _2518;
            _2520 = _2608;
            if (!_2600)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2610 = _2512;
            _2514 = _2610;
            if (!_2600)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2612 = _2526;
            bool _2614 = !_2600;
            _2528 = _2612;
            if (!_2614)
            {
                bool _2616 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2618 = isnan(_1710);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2624 = _2620 || _2622;
                if (!_2624)
                {
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2628 = _1710 + _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2632 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2630;
                    float _2634 = 1.0 / _2632;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2656 = _2628 * _2634;
                    float _2658 = precise::clamp(_2656, 0.0, 1.0);
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2664 = fma(_2658, _2638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2658, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2668 = fma(_2658, _2642, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2670 = fma(_2658, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2672 = fma(_2658, _2650, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2674 = fma(_2658, _2654, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2424 = _2664;
                    _2514 = _2672;
                    _2414 = _2666;
                    _2520 = _2670;
                    _2500 = _2668;
                    _2528 = _2674;
                    _2590 = true;
                }
                else
                {
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2590 = false;
    float _2676 = _2424;
    float _2678 = _2514;
    float _2680 = _2414;
    float _2682 = _2520;
    float _2684 = _2500;
    float _2686 = _2528;
    float _2688 = fma(_2364, -0.5, 0.5);
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    float _2696 = -_2680;
    float _2698 = _2696 + _2682;
    float _2700 = -_2684;
    float _2702 = _2700 + _2686;
    bool _2704 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2706 = fma(_2690, _2694, _2676);
    float _2708 = fma(_2690, _2698, _2680);
    float _2710 = fma(_2690, _2702, _2684);
    float _2712 = _2706 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2714 = fma(_2708, 0.298911988735198974609375, _2712);
    float _2716 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2718 = fma(_2710, 0.114477999508380889892578125, _2714);
    out.m_93.w = _2716;
    float _2720 = -_2718;
    float _2722 = _2708 + _2720;
    float _2724 = -_2718;
    float _2726 = _2706 + _2724;
    float _2728 = -_2718;
    float _2730 = _2710 + _2728;
    out.m_99.x = 0.0;
    float _2732 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2734 = fma(_2726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2736 = fma(_2730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    out.m_101.x = 0.0;
    out.m_103.x = _2732;
    out.m_103.y = _2734;
    out.m_103.z = _2736;
    if (!_2704)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2738 = -_1680;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2742 = -_1682;
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2746 = -_1684;
    float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2750 = _2740 * _2740;
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = fma(_2748, _2748, _2752);
    float _2756 = rsqrt(_2754);
    float _2758 = _2740 * _2756;
    float _2760 = _2744 * _2756;
    float _2762 = _2748 * _2756;
    float _2764 = sqrt(_2754);
    float _2766 = -_1716;
    float _2768 = _2766 + _2758;
    float _2770 = -_1712;
    float _2772 = _2770 + _2760;
    float _2774 = -_1714;
    float _2776 = _2774 + _2762;
    float _2778 = _2768 * _2768;
    float _2780 = fma(_2772, _2772, _2778);
    float _2782 = fma(_2776, _2776, _2780);
    float _2784 = -_2764;
    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2788 = rsqrt(_2782);
    float _2790 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2792 = precise::clamp(_2790, 0.0, 1.0);
    float _2794 = abs(_2792);
    float _2796 = log2(_2794);
    float _2798 = _2768 * _2788;
    float _2800 = _2772 * _2788;
    float _2802 = _2776 * _2788;
    float _2804 = _2364 * _2798;
    float _2806 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2808 = precise::clamp(_2806, 0.0, 1.0);
    float _2810 = _2364 * _2758;
    float _2812 = fma(_2362, _2800, _2804);
    float _2814 = _2808 * _2808;
    float _2816 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2818 = fma(_2362, _2760, _2810);
    float _2820 = fma(_2370, _2802, _2812);
    float _2822 = precise::clamp(_2820, 0.0, 1.0);
    float _2824 = _2814 + (-1.0);
    float _2826 = fma(_2370, _2762, _2818);
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = _2822 * _2822;
    float _2832 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2834 = exp2(_2816);
    float _2836 = fma(_2830, _2824, 1.0);
    float _2838 = -_2758;
    float _2840 = -_2832;
    float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2840);
    float _2844 = _2836 * _2836;
    float _2846 = -_2762;
    float _2848 = fma(_2846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2842);
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2852 = _2848 + _2850;
    float _2854 = 1.0 / _2844;
    float _2856 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2858 = precise::clamp(_2856, 0.0, 1.0);
    float _2860 = _2834 * _2858;
    float _2862 = _2828 * _2860;
    float _2864 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2866 = _2814 * _2854;
    float _2868 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2870 = _2862 * _2866;
    float _2872 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2874 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2876 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2878 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2864;
    out.m_99.y = _2868;
    out.m_99.z = _2872;
    out.m_101.x = _2874;
    out.m_101.y = _2876;
    out.m_101.z = _2878;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2590 = false;
    bool _384 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_122);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_51.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2936 = as_type<float>(_138);
        out.gl_Position.z = _2936;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_53.w;
    float _144 = float(_122);
    float _146 = -_142;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_142);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    bool _160 = _148 >= _144;
    bool _162 = !_158;
    bool _164 = _160 || _162;
    float _166 = _148;
    if (_164)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _130;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _140 = as_type<int>(_170);
    }
    int _172 = _140;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3000 = as_type<float>(_172);
        out.gl_Position.z = _3000;
    }
    if (_164)
    {
        return out;
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = 1.0 / _144;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = _148 * _180;
    float _204 = _174 * _174;
    float _206 = _176 * _176;
    float _208 = _178 * _178;
    float _210 = fma(_184, _184, _204);
    float _212 = fma(_186, _186, _206);
    float _214 = fma(_188, _188, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = _186 * _198;
    float _234 = fma(_184, _196, _232);
    float _236 = _216;
    float _238 = _222;
    if (_228)
    {
        float _240 = rsqrt(_216);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = 0.0;
    float _246 = 0.0;
    if (!_228)
    {
        _244 = 0.0;
        _246 = 0.0;
    }
    float _248 = _244;
    float _250 = _246;
    bool _252 = _226 > 0.0;
    float _254 = _176 * _198;
    float _256 = _192 * _198;
    float _258 = 0.0;
    float _260 = _250;
    float _262 = _248;
    if (!_228)
    {
        _258 = 0.0;
    }
    float _264 = _258;
    float _266 = fma(_188, _200, _234);
    float _268 = fma(_174, _196, _254);
    float _270 = 0.0;
    float _272 = _264;
    float _274 = _266;
    if (_230)
    {
        float _276 = rsqrt(_218);
        _270 = _276;
    }
    float _278 = _270;
    float _280 = fma(_190, _196, _256);
    float _282 = 0.0;
    float _284 = 0.0;
    if (!_230)
    {
        _282 = 0.0;
        _284 = 0.0;
    }
    float _286 = _282;
    float _288 = _284;
    float _290 = 0.0;
    float _292 = _286;
    float _294 = _288;
    if (!_230)
    {
        _290 = 0.0;
    }
    float _296 = _290;
    float _298 = fma(_178, _200, _268);
    float _300 = 0.0;
    float _302 = _296;
    float _304 = _298;
    if (!_252)
    {
        _300 = 0.0;
    }
    float _306 = _300;
    float _308 = 0.0;
    float _310 = _306;
    if (_252)
    {
        float _312 = rsqrt(_220);
        _308 = _312;
    }
    float _314 = _308;
    float _316 = 0.0;
    if (!_252)
    {
        _316 = 0.0;
    }
    float _318 = _316;
    float _320 = fma(_194, _200, _280);
    float _322 = _318;
    if (!_252)
    {
        _238 = 0.0;
    }
    float _324 = _238;
    float _326 = _324;
    if (_228)
    {
        float _328 = _242 * _174;
        _260 = _328;
    }
    float _330 = _260;
    if (_228)
    {
        float _332 = _242 * _184;
        _272 = _332;
    }
    float _334 = _272;
    if (_228)
    {
        float _336 = _242 * _190;
        _262 = _336;
    }
    float _338 = _262;
    if (_230)
    {
        float _340 = _278 * _176;
        _302 = _340;
    }
    float _342 = _302;
    if (_230)
    {
        float _344 = _278 * _186;
        _292 = _344;
    }
    float _346 = _292;
    if (_230)
    {
        float _348 = _278 * _192;
        _294 = _348;
    }
    float _350 = _294;
    if (_252)
    {
        float _352 = _314 * _178;
        _310 = _352;
    }
    float _354 = _310;
    if (_252)
    {
        float _356 = _314 * _188;
        _322 = _356;
    }
    float _358 = _322;
    if (_252)
    {
        float _360 = _314 * _194;
        _326 = _360;
    }
    float _362 = _326;
    bool _364 = !_182;
    float _382;
    if (!_364)
    {
        float _366 = in.m_63.x;
        float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _370 = _366 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _372 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _374 = _372 * _368;
        float _376 = floor(_374);
        float _378 = -_376;
        float _380 = _374 + _378;
        _382 = _380;
        _384 = true;
    }
    else
    {
        _382 = _202;
    }
    _384 = false;
    float _386 = _382;
    float _388 = in.m_48.x;
    float _390 = in.m_48.y;
    float _392 = in.m_48.z;
    float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _396 = -_202;
    float _398 = _396 + 1.0;
    float _400 = in.m_63.y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = in.m_63.z;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = 1.0 / _404;
    float _414 = in.m_57.w;
    bool _416 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_386);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _202 * _394;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _398 * _394;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = 1.0 / _410;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _440 = _386 + _438;
    bool _442 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _444 = isnan(_386);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = in.m_59.w;
    float _456 = _186 * _390;
    float _458 = _192 * _390;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _460;
    float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _466 = in.m_63.x;
    float _468 = fma(_184, _388, _456);
    float _470 = fma(_190, _388, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _386 + _472;
    float _476 = precise::min(_430, _434);
    float _478 = fma(_188, _392, _468);
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    float _484 = fma(_194, _392, _470);
    float _486 = _400 + _406;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _498 = _496 != 0;
    float _500 = _440 * _436;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _504 = _502 != 0;
    float _506 = _474 * _412;
    float _508 = 1.0 / _462;
    float _510 = _486 + (-1.0);
    bool _512 = !_490;
    int _514 = _512 ? 0 : 1;
    float _516 = _478 + _414;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _524 = _522 != 0;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _528 = _526 != 0;
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _532 = _484 + _454;
    float _534 = _482 * _148;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _538 = _386 + _536;
    float _540 = _482;
    float _542 = _510;
    float _544 = _390;
    if (_504)
    {
        _540 = _466;
    }
    float _546 = _540;
    float _548 = exp2(_534);
    float _550 = _546;
    if (_504)
    {
        _542 = _400;
    }
    float _552 = _542;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _556 = 1.0 + _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _560 = _552;
    if (!_504)
    {
        _550 = _406;
    }
    float _562 = _550;
    float _564 = _466 + _406;
    if (!_504)
    {
        _560 = _466;
    }
    float _566 = _560;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _570 = _538 * _508;
    float _572 = _562 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _574 = 1.0 / _556;
    float _576 = _566 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _578 = _564 + (-1.0);
    float _580 = -_558;
    float _582 = fma(_572, 2.0, _580);
    float _584 = fma(_576, -2.0, _568);
    float _586 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _588 = -_548;
    float _590 = _588 + 1.0;
    bool _592 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _594 = isnan(1.0);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _600 = _596 || _598;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _604 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _612 = _608 || _610;
    float _614 = _400 * 2.0;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _620 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[88].z, _602);
    float _622 = _612 ? _590 : 0.0;
    float _624 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[88].w, _616);
    float _626 = fma(_618, _400, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _628 = floor(_614);
    float _630 = _466 + _400;
    float _632 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _620);
    float _634 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _624);
    float _636 = _626 * _148;
    float _638 = -_148;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[86].x, _582);
    float _642 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _584);
    if (_600)
    {
        float _644 = _622 * _574;
        _166 = _644;
    }
    float _646 = _166;
    float _648 = _630 + (-1.0);
    float _650 = _406 * 2.0;
    float _652 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _658;
    bool _662 = !_494;
    int _664 = _662 ? 0 : 1;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _666;
    float _670 = floor(_650);
    float _672 = fma(_656, _506, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _674 = fma(_660, _506, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _676 = fma(_668, _506, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _678 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _680 = isnan(_386);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _466 * 2.0;
    bool _692 = _628 > 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _698 = _628 >= 0.0;
    bool _700 = isnan(_628);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _716 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _718 = isnan(_386);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_688;
    float _730 = _728 + 1.0;
    float _732 = floor(_690);
    float _734 = fma(_696, _500, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _736 = fma(_710, _500, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _738 = fma(_714, _500, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _740 = _726 * _730;
    float _742 = -_726;
    float _744 = _742 + 1.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _746;
    bool _750 = !_498;
    int _752 = _750 ? 0 : 1;
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _760;
    float _764 = _452 * _744;
    bool _766 = _670 > 0.0;
    float _768 = -_452;
    float _770 = _768 + 1.0;
    bool _772 = _670 >= 0.0;
    bool _774 = isnan(_670);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(_758, _570, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _784 = fma(_762, _570, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _786 = fma(_748, _570, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _788 = _426 * _770;
    int _790 = _780 ? 0 : 1;
    float _792 = -_426;
    float _794 = _792 + 1.0;
    bool _796 = _732 >= 0.0;
    bool _798 = isnan(_732);
    bool _800 = _796 || _798;
    bool _802 = isnan(0.0);
    bool _804 = _800 || _802;
    float _806 = _672 * _788;
    float _808 = _674 * _788;
    float _810 = _676 * _788;
    float _812 = _646 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _814 = ~_790;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].y, _808);
    bool _822 = !_528;
    int _824 = _822 ? 0 : 1;
    float _826 = _812 * _754;
    int _828 = _818;
    if (!_766)
    {
        int _830 = ~_790;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].z, _810);
    int _838 = _706 ? 0 : 1;
    float _840 = _646 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _842 = _804 ? 0 : 1;
    float _844 = fma(_736, _764, _820);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _856 = _854 != 0;
    float _858 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].x, _806);
    bool _860 = _732 > 0.0;
    float _862 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[203].x, _826);
    int _864 = ~_842;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    float _870 = fma(_734, _764, _858);
    bool _872 = !_852;
    int _874 = _872 ? 0 : 1;
    float _876 = floor(_862);
    float _878 = _840 * _464;
    float _880 = fma(_738, _764, _836);
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    bool _888 = !_848;
    int _890 = _888 ? 0 : 1;
    float _892 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[203].z, _878);
    int _894 = abs(_874);
    float _896 = _862 * 6.283185482025146484375;
    int _898 = _868;
    bool _900 = _848;
    if (!_860)
    {
        int _902 = ~_842;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    float _908 = floor(_892);
    float _910 = float(_834);
    float _912 = _862 + 0.25;
    int _914 = ~_838;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = fma(_782, _740, _870);
    int _922 = abs(_890);
    float _924 = fma(_466, 6.283185482025146484375, _636);
    int _926 = _918;
    if (!_692)
    {
        int _928 = ~_838;
        int _930 = _928 + 1;
        _926 = _930;
    }
    int _932 = _926;
    float _934 = floor(_912);
    float _936 = _896 * 0.15915493667125701904296875;
    float _938 = float(_906);
    float _940 = -_876;
    float _942 = _862 + _940;
    float _944 = float(_894);
    float _946 = fma(_784, _740, _844);
    float _948 = float(_922);
    float _950 = -_476;
    float _952 = _950 + 1.0;
    float _954 = _936 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _944 * _938;
    int _960 = abs(_664);
    float _962 = _948 * _910;
    bool _964 = _942 >= 0.5;
    bool _966 = isnan(_942);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.5);
    bool _972 = _968 || _970;
    float _974 = _892 + 0.25;
    float _976 = _958 * (-2.0);
    int _978 = abs(_514);
    float _980 = floor(_974);
    bool _982 = !_972;
    float _984 = _982 ? 0.5 : (-0.5);
    float _986 = fma(_530, _976, _530);
    float _988 = float(_960);
    float _990 = -_934;
    float _992 = _912 + _990;
    float _994 = fma(_976, _884, _884);
    float _996 = -_908;
    float _998 = _892 + _996;
    float _1000 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1002 = _1000 * 2.0;
    float _1004 = _892 * 6.283185482025146484375;
    float _1006 = _956 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1008 = _992 > 0.5;
    float _1010 = _988 * _1002;
    float _1012 = _1004 * 0.15915493667125701904296875;
    float _1014 = float(_978);
    float _1016 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].y, _946);
    float _1018 = -_980;
    float _1020 = _974 + _1018;
    int _1022 = abs(_752);
    float _1024 = _400 + (-0.5);
    float _1026 = fma(_1014, _1006, _1010);
    float _1028 = _1012 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    bool _1032 = !_524;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = in.m_67.x;
    bool _1038 = _998 >= 0.5;
    bool _1040 = isnan(_998);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.5);
    bool _1046 = _1042 || _1044;
    float _1048 = _992;
    float _1050 = _1020;
    if (_1008)
    {
        float _1052 = -_992;
        float _1054 = _1052 + 1.0;
        _1048 = _1054;
    }
    float _1056 = _1048;
    bool _1058 = !_520;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = fma(_786, _740, _880);
    int _1064 = abs(_1034);
    float _1066 = fma(_1056, 4.0, -1.0);
    float _1068 = float(_1022);
    bool _1070 = !_1046;
    float _1072 = _1070 ? 0.5 : (-0.5);
    float _1074 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1076 = abs(_1060);
    bool _1078 = _1020 > 0.5;
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = _1080 * 2.0;
    float _1084 = float(_1064);
    float _1086 = fma(_1068, _1074, _1026);
    float _1088 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _994);
    float _1090 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1092 = _1084 * _1082;
    float _1094 = float(_1076);
    float _1096 = fma(_986, _646, _1088);
    float _1098 = fma(_1086, 3.1415927410125732421875, _882);
    float _1100 = _962 * (-2.0);
    float _1102 = float(_932);
    float _1104 = fma(_1094, _1090, _1092);
    if (_1078)
    {
        float _1106 = -_1020;
        float _1108 = _1106 + 1.0;
        _1050 = _1108;
    }
    float _1110 = _1050;
    float _1112 = _924 * 0.15915493667125701904296875;
    float _1114 = _532 * _532;
    int _1116 = abs(_824);
    float _1118 = fma(_1110, 4.0, -1.0);
    bool _1120 = !_856;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = fma(_516, _516, _1114);
    float _1126 = float(_1116);
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1130 = abs(_1122);
    float _1132 = _466 + (-0.5);
    float _1134 = fma(_1098, _1100, _1098);
    float _1136 = fma(_1126, _1128, _1104);
    float _1138 = float(_1130);
    float _1140 = fma(_652, _1100, _652);
    float _1142 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1134);
    float _1144 = _1112 * 6.283185482025146484375;
    float _1146 = sin(_1144);
    float _1148 = in.m_67.y;
    float _1150 = _1138 * _1102;
    float _1152 = fma(_1136, 3.1415927410125732421875, _886);
    float _1154 = fma(_1140, _646, _1142);
    float _1156 = in.m_69.x;
    float _1158 = in.m_69.y;
    float _1160 = in.m_69.z;
    float _1162 = _1150 * (-2.0);
    float _1164 = _1096 * 0.15915493667125701904296875;
    float _1166 = _1154 * 0.15915493667125701904296875;
    float _1168 = in.m_67.z;
    float _1170 = fma(_586, _1162, _586);
    float _1172 = fma(_1152, _1162, _1152);
    float _1174 = _406 + (-0.5);
    float _1176 = _1164 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = in.m_71.y;
    float _1182 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1172);
    float _1184 = abs(_1146);
    float _1186 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1188 = fma(_1170, _646, _1182);
    float _1190 = _1164 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].x, _920);
    float _1196 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1186);
    float _1198 = _1188 * 0.15915493667125701904296875;
    float _1200 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1062);
    float _1202 = _690 + (-1.0);
    float _1204 = -_1196;
    float _1206 = _1204 + _1148;
    float _1208 = _1166 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1016 * _1158;
    float _1214 = _1194 * _1156;
    float _1216 = _1200 * _1160;
    float _1218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1036);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1206);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1226 = sqrt(_1124);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1168);
    float _1230 = _1222 * _1218;
    float _1232 = _1224 * _1220;
    float _1234 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _390 + _1180;
    float _1238 = _1166 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _1210 * _1192;
    float _1244 = _1210 * _1178;
    float _1246 = _1234 * _1228;
    float _1248 = _1198 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1202 * _1226;
    float _1254 = _1252 * 0.75;
    float _1256 = _1198 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = _1240 * _1178;
    float _1262 = _1240 * _1192;
    float _1264 = _1254 * 0.15915493667125701904296875;
    float _1266 = _1210 * _1250;
    float _1268 = _1240 * _1250;
    float _1270 = _1192 * _1250;
    float _1272 = _1178 * _1250;
    float _1274 = _1266 * _1232;
    float _1276 = _1268 * _1232;
    float _1278 = _1264 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = fma(_1258, _1242, _1260);
    float _1284 = -_1244;
    float _1286 = fma(_1258, _1262, _1284);
    float _1288 = -_1262;
    float _1290 = fma(_1258, _1244, _1288);
    float _1292 = -_1232;
    float _1294 = _1258 * _1292;
    float _1296 = fma(_1282, _1230, _1274);
    float _1298 = fma(_1258, _1260, _1242);
    float _1300 = fma(_1286, _1230, _1276);
    float _1302 = fma(_1270, _1230, _1294);
    float _1304 = fma(_1290, _1246, _1296);
    float _1306 = _1264 * 6.283185482025146484375;
    float _1308 = cos(_1306);
    float _1310 = fma(_1272, _1246, _1302);
    float _1312 = _1304 * _346;
    float _1314 = fma(_1298, _1246, _1300);
    float _1316 = _1304 * _350;
    float _1318 = fma(_1310, _334, _1312);
    float _1320 = fma(_1310, _338, _1316);
    float _1322 = fma(_1314, _358, _1318);
    float _1324 = fma(_1314, _362, _1320);
    float _1326 = _1322 * _1280;
    float _1328 = _1322 * _1308;
    float _1330 = -_1326;
    float _1332 = fma(_1324, _1308, _1330);
    float _1334 = fma(_1324, _1280, _1328);
    float _1336 = _532 + _1332;
    float _1338 = _516 + _1334;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1342 = _1336 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1346 = _1338 + _1344;
    float _1348 = _1342 * _1342;
    float _1350 = fma(_1346, _1346, _1348);
    float _1352 = sqrt(_1350);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = _1352 + _1356;
    float _1360 = _1332;
    float _1362 = _1352;
    float _1364 = _1212;
    float _1366 = _1146;
    if (_1354)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1368;
    }
    float _1370 = _1360;
    if (_1354)
    {
        float _1372 = _1358 * _1370;
        _1362 = _1372;
    }
    float _1374 = _1362;
    if (_1354)
    {
        float _1376 = _1374 * 0.15915493667125701904296875;
        _1364 = _1376;
    }
    float _1378 = _1364;
    float _1380 = _1304 * _342;
    float _1382 = _1370;
    float _1384 = _1380;
    if (_1354)
    {
        float _1386 = _1378 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        _1382 = _1388;
    }
    float _1390 = _1382;
    float _1392 = fma(_1310, _330, _1380);
    if (!_1354)
    {
        _1384 = _1338;
    }
    float _1394 = _1384;
    float _1396 = fma(_1314, _354, _1392);
    float _1398 = _1314;
    float _1400 = _1396;
    float _1402 = _1394;
    if (_1354)
    {
        float _1404 = rsqrt(_1350);
        _1398 = _1404;
    }
    float _1406 = _1398;
    float _1408 = _1236 + _1396;
    if (_1354)
    {
        float _1410 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _544 = _1410;
    }
    float _1412 = _544;
    float _1414 = _1412;
    if (_1354)
    {
        float _1416 = fma(_1390, _1412, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1400 = _1416;
    }
    float _1418 = _1400;
    if (!_1354)
    {
        _1414 = _1336;
    }
    float _1420 = _1414;
    float _1422 = _1406;
    float _1424 = _1420;
    if (_1354)
    {
        float _1426 = _1406 * _1418;
        _1422 = _1426;
    }
    float _1428 = _1422;
    float _1430 = _1428;
    if (_1354)
    {
        float _1432 = fma(_1346, _1428, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1402 = _1432;
    }
    float _1434 = _1402;
    float _1436 = _1434;
    if (_1354)
    {
        float _1438 = fma(_1342, _1428, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1424 = _1438;
    }
    float _1440 = _1424;
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1444 = _1434 + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1448 = _1440 + _1446;
    float _1450 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1452 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4878 = float2(_1450, _1452);
    float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4878, float2(0.0), isnan(_4878)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4878, float2(0.0), isnan(_4878)), level(0.0)).x;
    float _1456 = _1390;
    float _1458 = _1444;
    float _1460 = _1448;
    float _1462 = _1440;
    if (_1354)
    {
        float _1464 = _1378 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1456 = _1466;
    }
    float _1468 = _1456;
    if (!_1354)
    {
        _1458 = _1408;
    }
    float _1470 = _1458;
    float _1472 = -_516;
    float _1474 = _1472 + _1434;
    float _1476 = -_532;
    float _1478 = _1476 + _1440;
    bool _1480 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1482 = isnan(0.5);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1488 = _1484 || _1486;
    float _1490 = fma(_532, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1492 = _1470;
    if (_1354)
    {
        float _1494 = _1468 + (-1.0);
        _1430 = _1494;
    }
    float _1496 = _1430;
    if (_1354)
    {
        float _1498 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1460 = _1498;
    }
    float _1500 = _1460;
    if (_1354)
    {
        float _1502 = fma(_1408, _1468, _1500);
        _1492 = _1502;
    }
    float _1504 = _1492;
    float _1506 = -_1236;
    float _1508 = _1506 + _1504;
    float _1510 = fma(_516, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1512 = _1508 * _1508;
    float _1514 = floor(_1490);
    float _1516 = fma(_1474, _1474, _1512);
    float _1518 = fma(_1478, _1478, _1516);
    float _1520 = floor(_1510);
    float _1522 = sqrt(_1518);
    float _1524 = -_1520;
    float _1526 = _1510 + _1524;
    float _1528 = -_1514;
    float _1530 = _1490 + _1528;
    bool _1532 = _1522 > 0.0;
    float _1534 = _1522;
    float _1536 = _1504;
    if (!_1532)
    {
        _1534 = _1440;
    }
    float _1538 = _1534;
    float _1540 = fma(_1454, 100.0, _1504);
    float _1542 = fma(_1454, 100.0, _1236);
    float _1544 = _1538;
    float _1546 = _1454;
    if (!_1532)
    {
        _1536 = _1540;
    }
    float _1548 = _1536;
    bool _1550 = !_1532;
    float _1552 = _1548;
    if (!_1550)
    {
        float _1554 = _298 * _298;
        float _1556 = fma(_266, _266, _1554);
        float _1558 = rsqrt(_1518);
        float _1560 = fma(_320, _320, _1556);
        float _1562 = sqrt(_1560);
        float _1564 = _1474 * _1558;
        float _1566 = _1508 * _1558;
        float _1568 = _1478 * _1558;
        bool _1570 = _1562 > 0.0;
        float _1572 = _1562;
        float _1574 = _1558;
        _1366 = _1566;
        if (!_1570)
        {
            _1572 = _1540;
        }
        float _1576 = _1572;
        _1552 = _1576;
        if (!_1570)
        {
            _1574 = _1440;
        }
        float _1578 = _1574;
        bool _1580 = !_1570;
        _1544 = _1578;
        if (!_1580)
        {
            float _1582 = rsqrt(_1560);
            float _1584 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1586 = _298 * _1582;
            float _1588 = _266 * _1582;
            float _1590 = _1566 * _1586;
            float _1592 = _320 * _1582;
            float _1594 = fma(_1564, _1588, _1590);
            float _1596 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1598 = fma(_1568, _1592, _1594);
            float _1600 = _1598 * _1596;
            float _1602 = fma(_266, _1600, _1434);
            float _1604 = fma(_298, _1600, _1540);
            float _1606 = fma(_320, _1600, _1440);
            _1552 = _1604;
            _1544 = _1606;
            _1436 = _1602;
            _1546 = _1584;
        }
    }
    float _1608 = _1552;
    float _1610 = _1544;
    float _1612 = _1436;
    float _1614 = _1546;
    float _1616 = _1366;
    float _1618 = _1612;
    float _1620 = _1610;
    float _1622 = _1614;
    float _1624 = _1616;
    if (_1488)
    {
        _1462 = _1608;
    }
    float _1626 = _1462;
    float _1628 = _1626;
    if (!_1488)
    {
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1632 = _1542 + _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1636 = _516 + _1634;
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1640 = -_1542;
        float _1642 = _1640 + _1608;
        float _1644 = _1632 * _1632;
        float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1648 = _532 + _1646;
        float _1650 = -_532;
        float _1652 = _1650 + _1610;
        float _1654 = fma(_1636, _1636, _1644);
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = fma(_1648, _1648, _1654);
        float _1660 = sqrt(_1658);
        float _1662 = _1638 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1664 = precise::min(_1660, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1666 = _1664 * _1656;
        float _1668 = -_516;
        float _1670 = _1668 + _1612;
        float _1672 = _1662 * _1666;
        float _1674 = fma(_1670, _1672, _516);
        float _1676 = fma(_1642, _1672, _1542);
        float _1678 = fma(_1652, _1672, _532);
        _1628 = _1676;
        _1618 = _1674;
        _1620 = _1678;
        _1622 = _1666;
        _274 = _1672;
    }
    float _1680 = _1628;
    float _1682 = _1618;
    float _1684 = _1620;
    float _1686 = _1622;
    float _1688 = _274;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1692 = _1680 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1696 = _1682 + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1700 = _1684 + _1698;
    float _1702 = _1692 * _1692;
    float _1704 = fma(_1696, _1696, _1702);
    float _1706 = fma(_1700, _1700, _1704);
    float _1708 = rsqrt(_1706);
    float _1710 = sqrt(_1706);
    float _1712 = _1696 * _1708;
    float _1714 = _1700 * _1708;
    float _1716 = _1692 * _1708;
    float _1718 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1718 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 + _1724;
    float _1728 = sqrt(_1726);
    bool _1730 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1728 + _1732;
    float _1736 = _1686;
    float _1738 = _1726;
    float _1740 = _1734;
    if (_1730)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1742;
    }
    float _1744 = _1736;
    if (_1730)
    {
        float _1746 = rsqrt(_1726);
        _1738 = _1746;
    }
    float _1748 = _1738;
    if (_1730)
    {
        float _1750 = _1734 * _1744;
        _1740 = _1750;
    }
    float _1752 = _1740;
    if (_1730)
    {
        float _1754 = _1752 * 0.15915493667125701904296875;
        _304 = _1754;
    }
    float _1756 = _304;
    float _1758 = _1688;
    float _1760 = _1756;
    if (_1730)
    {
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        _1758 = _1764;
    }
    float _1766 = _1758;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = precise::max(0.0, _1768);
    float _1772 = _1744;
    float _1774 = _1770;
    float _1776 = _1768;
    if (_1730)
    {
        float _1778 = _1756 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        _1772 = _1780;
    }
    float _1782 = _1772;
    float _1784 = -_1716;
    float _1786 = -_1770;
    float _1788 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1786);
    if (_1730)
    {
        float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1774 = _1790;
    }
    float _1792 = _1774;
    float _1794 = _1766;
    float _1796 = _1792;
    if (_1730)
    {
        float _1798 = fma(_1766, _1792, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1794 = _1798;
    }
    float _1800 = _1794;
    float _1802 = _1800;
    if (!_1730)
    {
        _1796 = _1788;
    }
    float _1804 = _1796;
    float _1806 = _1804;
    float _1808 = _1782;
    if (_1730)
    {
        float _1810 = _1782 + (-1.0);
        _1776 = _1810;
    }
    float _1812 = _1776;
    float _1814 = _1812;
    if (_1730)
    {
        float _1816 = _1748 * _1800;
        _1624 = _1816;
    }
    float _1818 = _1624;
    if (!_1730)
    {
        _1802 = _1718;
    }
    float _1820 = _1802;
    float _1822 = _1820;
    if (_1730)
    {
        float _1824 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1760 = _1824;
    }
    float _1826 = _1760;
    float _1828 = _1826;
    if (_1730)
    {
        float _1830 = _1718 * _1818;
        _1822 = _1830;
    }
    float _1832 = _1822;
    if (!_1730)
    {
        _1814 = _1720;
    }
    float _1834 = _1814;
    float _1836 = _1834;
    if (_1730)
    {
        float _1838 = _1720 * _1818;
        _1836 = _1838;
    }
    float _1840 = _1836;
    if (_1730)
    {
        float _1842 = fma(_1788, _1782, _1826);
        _1806 = _1842;
    }
    float _1844 = _1806;
    if (!_1730)
    {
        _1828 = _1722;
    }
    float _1846 = _1828;
    float _1848 = _1846;
    if (_1730)
    {
        float _1850 = _1832 * _1832;
        _1848 = _1850;
    }
    float _1852 = _1848;
    if (!_1730)
    {
        _1808 = _1724;
    }
    float _1854 = _1808;
    float _1856 = _1854;
    if (_1730)
    {
        float _1858 = _1840 * _1840;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1864 = fma(_1844, _1844, _1852);
    float _1866 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1862);
    float _1868 = _1864 + _1860;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1866);
    float _1878 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1880 = rsqrt(_1868);
    float _1882 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1886 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1888 = -_1874;
    float _1890 = _1888 + 1.0;
    float _1892 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1894 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1878);
    float _1896 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1886);
    float _1898 = abs(_1890);
    float _1900 = log2(_1898);
    float _1902 = -_1892;
    float _1904 = fma(_1902, _1884, 1.0);
    float _1906 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1908 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1896);
    float _1910 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1894);
    float _1912 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1906);
    float _1914 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1916 = _1880 * _1832;
    float _1918 = _1880 * _1844;
    float _1920 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1912);
    float _1922 = _1880 * _1840;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1926 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1928 = _1920 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1930 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = -_1924;
    float _1934 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1932);
    float _1936 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1938 = log2(_1904);
    float _1940 = _1918 + 1.0;
    float _1942 = -_1922;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1934);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1926);
    float _1948 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1950 = fma(_1944, -0.5, 0.5);
    float _1952 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1946);
    float _1954 = exp2(_1936);
    float _1956 = fma(_1944, 0.5, 0.5);
    float _1958 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1960 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1952);
    float _1962 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1948);
    float _1964 = fma(_1956, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = 1.0 / _1960;
    float _1968 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1958);
    float _1970 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1962);
    float2 _5716 = float2(_1526, _1530);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5716, float2(0.0), isnan(_5716)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5716, float2(0.0), isnan(_5716)), level(0.0)).x;
    float _1974 = fma(_1956, _1964, -0.212114393711090087890625);
    float _1976 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1968);
    float _1978 = _1938 * 0.693147182464599609375;
    float _1980 = sqrt(_1950);
    float _1982 = fma(_1956, _1974, 1.570728778839111328125);
    float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1986 = -_1918;
    float _1988 = fma(_1954, _1940, _1986);
    float _1990 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1970);
    float _1992 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1976);
    float _1994 = _1990 * _1966;
    float _1996 = _1992 * _1966;
    float _1998 = _1980 * 0.636619746685028076171875;
    float _2000 = fma(_1988, 0.5, 0.5);
    float _2002 = fma(_1994, 0.5, 0.5);
    float _2004 = fma(_1996, -0.5, 0.5);
    float _2006 = -_1982;
    float _2008 = fma(_1998, _2006, 1.0);
    float3 _5783 = float3(_2002, _2004, _1984);
    float _2010 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5783, float3(0.0), isnan(_5783)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5783, float3(0.0), isnan(_5783)), level(0.0)).x;
    float3 _5794 = float3(_2002, _2004, _1984);
    float4 _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5794, float3(0.0), isnan(_5794)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5794, float3(0.0), isnan(_5794)), level(0.0)).xyzw;
    float _2015 = _2013.x;
    float _2017 = _2013.y;
    float _2019 = _2013.z;
    float _2021 = _2013.w;
    float2 _5810 = float2(_2008, _2000);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5810, float2(0.0), isnan(_5810)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5810, float2(0.0), isnan(_5810)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2035 = in.m_73.y;
    float _2037 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2041 = _400 > 0.5;
    float _2043 = _2033 * _466;
    float _2045 = in.m_73.x;
    float _2047 = _2037 * _466;
    bool _2049 = _406 > 0.5;
    float _2051 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2053 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2055 = trunc(_2043);
    int _2057 = int(_2055);
    out.m_75.x = _1682;
    out.m_75.y = _1680;
    out.m_75.z = _1684;
    float _2059 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2053);
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2067 = _2065 != 0;
    float _2069 = trunc(_2047);
    int _2071 = int(_2069);
    int _2073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2075 = _2073 != 0;
    float _2077 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2081 = _2079 != 0;
    float _2083 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2059);
    float _2085 = -_2035;
    float _2087 = _2085 + 1.0;
    int _2089 = _2057 << 4;
    int _2091 = _2089 + 1712;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2095 = _2035;
    float _2097 = _1992;
    float _2099 = _1990;
    if (_2063)
    {
        bool _2101 = _466 > 0.5;
        _900 = _2101;
    }
    bool _2103 = _900;
    uint _2106 = uint(int(uint(_2091) >> uint(2)));
    uint _2108 = uint(int(uint(int(_2106)) >> uint(2)));
    int _2110 = int(_2106) & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = int(_2106) + 1;
    uint _2116 = uint(int(uint(_2114) >> uint(2)));
    int _2118 = _2114 & 3;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[int(_2116)][_2118];
    int _2122 = _2049 ? as_type<int>(_2087) : as_type<int>(_2035);
    float _2124 = -_1196;
    float _2126 = -_1148;
    bool _2128 = _2124 != _2126;
    bool _2130 = isnan(_2124);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan(_2126);
    bool _2136 = _2132 || _2134;
    int _2138 = _2071 << 4;
    int _2140 = _2138 + 1968;
    float _2142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2144 = _1036 == 0.0;
    bool _2146 = !_2136;
    bool _2148 = _2144 && _2146;
    int _2150 = _2091 + 8;
    uint _2152 = uint(int(uint(_2150) >> uint(2)));
    uint _2154 = uint(int(uint(int(_2152)) >> uint(2)));
    int _2156 = int(_2152) & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    float _2160 = _2081 ? as_type<float>(_2122) : _2035;
    bool _2162 = _1168 == 0.0;
    bool _2164 = _2162 && _2148;
    float _2166 = as_type<float>(_2071);
    int _2168 = _2140;
    if (_2067)
    {
        float _2170 = _2041 ? _2087 : _2035;
        _2095 = _2170;
    }
    float _2172 = _2095;
    float _2174 = fma(_2160, _2077, -0.5);
    float _2176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2178 = _2140 + 8;
    uint _2180 = uint(int(uint(_2178) >> uint(2)));
    uint _2182 = uint(int(uint(int(_2180)) >> uint(2)));
    int _2184 = int(_2180) & 3;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[int(_2182)][_2184];
    float _2188 = -_642;
    float _2190 = fma(_634, _2174, _2188);
    float _2192 = _2045;
    if (!_2063)
    {
        _2166 = _2045;
    }
    float _2194 = _2166;
    float _2196 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2200 = exp2(_2051);
    uint _2202 = uint(int(uint(_2140) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    float _2218 = _2194;
    if (_2075)
    {
        float _2220 = -_2045;
        float _2222 = _2220 + 1.0;
        _2168 = as_type<int>(_2222);
    }
    int _2224 = _2168;
    float _2226 = -_2200;
    float _2228 = _2226 + 1.0;
    float _2230 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2232 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2234 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2236 = in.m_77.x;
    float _2238 = in.m_77.y;
    float _2240 = in.m_77.z;
    float _2242 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2244 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2246 = as_type<int>(_2186);
    if (_2063)
    {
        float _2248 = -_2045;
        float _2250 = _2248 + 1.0;
        _2246 = as_type<int>(_2250);
    }
    int _2252 = _2246;
    float _2254 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2256 = _2254;
    if (_2063)
    {
        float _2258 = _2103 ? as_type<float>(_2252) : _2045;
        _2218 = _2258;
    }
    float _2260 = _2218;
    float _2262 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2264 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2266 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2270 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2272 = _2236;
    float _2274 = _2238;
    float _2276 = _2240;
    if (!_2164)
    {
        float _2278 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2236);
        _2272 = _2278;
    }
    float _2280 = _2272;
    float _2282 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2284 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2075)
    {
        float _2286 = _2041 ? as_type<float>(_2224) : _2045;
        _2192 = _2286;
    }
    float _2288 = _2192;
    out.m_79.x = _2266;
    out.m_79.y = _2268;
    out.m_79.z = _2270;
    out.m_79.w = _2198;
    if (!_2164)
    {
        float _2290 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2238);
        _2274 = _2290;
    }
    float _2292 = _2274;
    if (!_2164)
    {
        float _2294 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2240);
        _2276 = _2294;
    }
    float _2296 = _2276;
    float _2298 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = fma(_2196, _2288, -0.5);
    float _2302 = _1266 * _2292;
    float _2304 = -_2292;
    float _2306 = _1258 * _2304;
    float _2308 = _1268 * _2292;
    float _2310 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = fma(_1282, _2280, _2302);
    float _2314 = fma(_1270, _2280, _2306);
    float _2316 = fma(_1286, _2280, _2308);
    bool _2318 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2320 = isnan(_1710);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2326 = _2322 || _2324;
    float _2328 = fma(_1290, _2296, _2312);
    float _2330 = _2282 * _2142;
    float _2332 = _2284 * _2176;
    float _2334 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2336 = fma(_632, _2300, _640);
    float _2338 = _2190 + 0.5;
    float _2340 = fma(_1272, _2296, _2314);
    out.m_81.x = _2332;
    out.m_81.y = _2330;
    float _2342 = _2336 + 0.5;
    float _2344 = _2328 * _346;
    float _2346 = _2328 * _342;
    float _2348 = _2328 * _350;
    float _2350 = fma(_1298, _2296, _2316);
    out.m_83.x = _2342;
    out.m_83.y = _2338;
    float _2352 = fma(_2340, _334, _2344);
    float _2354 = fma(_2340, _330, _2346);
    float _2356 = fma(_2340, _338, _2348);
    float _2358 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2334);
    float _2360 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2362 = fma(_2350, _358, _2352);
    float _2364 = fma(_2350, _354, _2354);
    float _2366 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2358);
    float _2368 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2360);
    float _2370 = fma(_2350, _362, _2356);
    float _2372 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2374 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2368);
    float _2376 = in.m_71.x;
    float _2378 = 1.0 / _2372;
    float _2380 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2382 = in.m_85.w;
    float _2384 = _2380 + _2372;
    out.m_87.x = _2298;
    out.m_87.y = _2310;
    out.m_87.z = _2254;
    float _2386 = in.m_85.y;
    float _2388 = in.m_85.z;
    float _2390 = _2384 * _2378;
    float _2392 = _2390 * 0.5;
    out.m_89.x = _2362;
    out.m_89.y = _2364;
    out.m_89.z = _2370;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2396 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2394);
    if (!_2326)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2398 = _2256;
    float _2400 = in.m_85.x;
    float _2402 = 1.0 / _2396;
    out.m_91.w = _2382;
    out.m_91.y = _2386;
    out.m_91.z = _2388;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2406 = _2402 * _2404;
    float _2408 = _2386;
    float _2410 = _2388;
    float _2412 = _2398;
    float _2414 = _2398;
    if (!_2326)
    {
        _2408 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2416 = _2408;
    float _2418 = abs(_2406);
    float _2420 = log2(_2418);
    out.m_91.x = _2400;
    float _2422 = _2416;
    float _2424 = _2416;
    if (!_2326)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2426 = _2410;
    bool _2428 = _2406 <= 8000.0;
    bool _2430 = isnan(_2406);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(8000.0);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2442 = exp2(_2440);
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = fma(_2446, -2.0, 3.0);
    float _2450 = _2446 * _2446;
    float _2452 = _2450 * _2448;
    float _2454 = -_2452;
    float _2456 = _2454 + 1.0;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2452);
    float _2460 = _2438 * _2458;
    float _2462 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2464 = -_1972;
    float _2466 = _2464 + 1.0;
    float _2468 = _2466 * _2462;
    float _2470 = precise::clamp(_2468, 0.0, 1.0);
    float _2472 = -_2470;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2476 = _2474 * _2376;
    float _2478 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2083);
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2482 = _2478 + _1960;
    out.gl_Position.x = _1990;
    out.gl_Position.y = _1992;
    out.gl_Position.z = _2478;
    out.gl_Position.w = _1960;
    out.m_93.x = _2480;
    float _2484 = _2230 * _2010;
    float _2486 = -_2230;
    float _2488 = _2486 + 1.0;
    float _2490 = _2021 * _2484;
    float _2492 = _2031 * _2484;
    float _2494 = _2021 * _2488;
    float _2496 = _2482;
    float _2498 = _2426;
    float _2500 = _2426;
    if (!_2326)
    {
        _2097 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2502 = _2097;
    float _2504 = fma(_2027, _2490, _2015);
    float _2506 = fma(_2029, _2490, _2017);
    float _2508 = _2482 * 0.5;
    float _2510 = fma(_2021, _2492, _2019);
    float _2512 = _2502;
    float _2514 = _2502;
    if (!_2326)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2516 = _2496;
    float _2518 = _2516;
    float _2520 = _2516;
    if (!_2326)
    {
        _2099 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2522 = _2099;
    out.m_95.z = _2508;
    out.m_95.w = _1960;
    out.m_97.x = _2504;
    out.m_97.y = _2506;
    out.m_97.z = _2510;
    out.m_97.w = _2494;
    bool _2524 = !_2326;
    float _2526 = _2522;
    float _2528 = _2522;
    if (!_2524)
    {
        bool _2530 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2532 = isnan(_1710);
        bool _2534 = _2530 || _2532;
        bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2538 = _2534 || _2536;
        if (!_2538)
        {
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2542 = _1710 + _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2546 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2544;
            float _2548 = 1.0 / _2546;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2570 = _2542 * _2548;
            float _2572 = precise::clamp(_2570, 0.0, 1.0);
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2578 = fma(_2572, _2552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2572, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2582 = fma(_2572, _2556, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2584 = fma(_2572, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2586 = fma(_2572, _2564, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2588 = fma(_2572, _2568, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2424 = _2578;
            _2514 = _2586;
            _2414 = _2580;
            _2520 = _2584;
            _2500 = _2582;
            _2528 = _2588;
            _2590 = true;
        }
        else
        {
            bool _2592 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2594 = isnan(_1710);
            bool _2596 = _2592 || _2594;
            bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2600 = _2596 || _2598;
            if (!_2600)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2602 = _2412;
            _2414 = _2602;
            if (!_2600)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2604 = _2422;
            _2424 = _2604;
            if (!_2600)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2606 = _2498;
            _2500 = _2606;
            if (!_2600)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2608 = _2518;
            _2520 = _2608;
            if (!_2600)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2610 = _2512;
            _2514 = _2610;
            if (!_2600)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2612 = _2526;
            bool _2614 = !_2600;
            _2528 = _2612;
            if (!_2614)
            {
                bool _2616 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2618 = isnan(_1710);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2624 = _2620 || _2622;
                if (!_2624)
                {
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2628 = _1710 + _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2632 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2630;
                    float _2634 = 1.0 / _2632;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2656 = _2628 * _2634;
                    float _2658 = precise::clamp(_2656, 0.0, 1.0);
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2664 = fma(_2658, _2638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2658, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2668 = fma(_2658, _2642, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2670 = fma(_2658, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2672 = fma(_2658, _2650, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2674 = fma(_2658, _2654, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2424 = _2664;
                    _2514 = _2672;
                    _2414 = _2666;
                    _2520 = _2670;
                    _2500 = _2668;
                    _2528 = _2674;
                    _2590 = true;
                }
                else
                {
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2590 = false;
    float _2676 = _2424;
    float _2678 = _2514;
    float _2680 = _2414;
    float _2682 = _2520;
    float _2684 = _2500;
    float _2686 = _2528;
    float _2688 = fma(_2364, -0.5, 0.5);
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    float _2696 = -_2680;
    float _2698 = _2696 + _2682;
    float _2700 = -_2684;
    float _2702 = _2700 + _2686;
    bool _2704 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2706 = fma(_2690, _2694, _2676);
    float _2708 = fma(_2690, _2698, _2680);
    float _2710 = fma(_2690, _2702, _2684);
    float _2712 = _2706 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2714 = fma(_2708, 0.298911988735198974609375, _2712);
    float _2716 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2718 = fma(_2710, 0.114477999508380889892578125, _2714);
    out.m_93.w = _2716;
    float _2720 = -_2718;
    float _2722 = _2708 + _2720;
    float _2724 = -_2718;
    float _2726 = _2706 + _2724;
    float _2728 = -_2718;
    float _2730 = _2710 + _2728;
    out.m_99.x = 0.0;
    float _2732 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2734 = fma(_2726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2736 = fma(_2730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    out.m_101.x = 0.0;
    out.m_103.x = _2732;
    out.m_103.y = _2734;
    out.m_103.z = _2736;
    if (!_2704)
    {
        return out;
    }
    float _2738 = -_1680;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2742 = -_1682;
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2746 = -_1684;
    float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2750 = _2740 * _2740;
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = fma(_2748, _2748, _2752);
    float _2756 = rsqrt(_2754);
    float _2758 = _2740 * _2756;
    float _2760 = _2744 * _2756;
    float _2762 = _2748 * _2756;
    float _2764 = sqrt(_2754);
    float _2766 = -_1716;
    float _2768 = _2766 + _2758;
    float _2770 = -_1712;
    float _2772 = _2770 + _2760;
    float _2774 = -_1714;
    float _2776 = _2774 + _2762;
    float _2778 = _2768 * _2768;
    float _2780 = fma(_2772, _2772, _2778);
    float _2782 = fma(_2776, _2776, _2780);
    float _2784 = -_2764;
    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2788 = rsqrt(_2782);
    float _2790 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2792 = precise::clamp(_2790, 0.0, 1.0);
    float _2794 = abs(_2792);
    float _2796 = log2(_2794);
    float _2798 = _2768 * _2788;
    float _2800 = _2772 * _2788;
    float _2802 = _2776 * _2788;
    float _2804 = _2364 * _2798;
    float _2806 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2808 = precise::clamp(_2806, 0.0, 1.0);
    float _2810 = _2364 * _2758;
    float _2812 = fma(_2362, _2800, _2804);
    float _2814 = _2808 * _2808;
    float _2816 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2818 = fma(_2362, _2760, _2810);
    float _2820 = fma(_2370, _2802, _2812);
    float _2822 = precise::clamp(_2820, 0.0, 1.0);
    float _2824 = _2814 + (-1.0);
    float _2826 = fma(_2370, _2762, _2818);
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = _2822 * _2822;
    float _2832 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2834 = exp2(_2816);
    float _2836 = fma(_2830, _2824, 1.0);
    float _2838 = -_2758;
    float _2840 = -_2832;
    float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2840);
    float _2844 = _2836 * _2836;
    float _2846 = -_2762;
    float _2848 = fma(_2846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2842);
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2852 = _2848 + _2850;
    float _2854 = 1.0 / _2844;
    float _2856 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2858 = precise::clamp(_2856, 0.0, 1.0);
    float _2860 = _2834 * _2858;
    float _2862 = _2828 * _2860;
    float _2864 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2866 = _2814 * _2854;
    float _2868 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2870 = _2862 * _2866;
    float _2872 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2874 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2876 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2878 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2864;
    out.m_99.y = _2868;
    out.m_99.z = _2872;
    out.m_101.x = _2874;
    out.m_101.y = _2876;
    out.m_101.z = _2878;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2590 = false;
    bool _384 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_48.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    float _130 = as_type<float>(_122);
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _128;
    if (!_126)
    {
        out.m_51.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2936 = as_type<float>(_138);
        out.gl_Position.z = _2936;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_53.w;
    float _144 = float(_122);
    float _146 = -_142;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_142);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    bool _160 = _148 >= _144;
    bool _162 = !_158;
    bool _164 = _160 || _162;
    float _166 = _148;
    if (_164)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _130;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _140 = as_type<int>(_170);
    }
    int _172 = _140;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3000 = as_type<float>(_172);
        out.gl_Position.z = _3000;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = 1.0 / _144;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = _148 * _180;
    float _204 = _174 * _174;
    float _206 = _176 * _176;
    float _208 = _178 * _178;
    float _210 = fma(_184, _184, _204);
    float _212 = fma(_186, _186, _206);
    float _214 = fma(_188, _188, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = _186 * _198;
    float _234 = fma(_184, _196, _232);
    float _236 = _216;
    float _238 = _222;
    if (_228)
    {
        float _240 = rsqrt(_216);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = 0.0;
    float _246 = 0.0;
    if (!_228)
    {
        _244 = 0.0;
        _246 = 0.0;
    }
    float _248 = _244;
    float _250 = _246;
    bool _252 = _226 > 0.0;
    float _254 = _176 * _198;
    float _256 = _192 * _198;
    float _258 = 0.0;
    float _260 = _250;
    float _262 = _248;
    if (!_228)
    {
        _258 = 0.0;
    }
    float _264 = _258;
    float _266 = fma(_188, _200, _234);
    float _268 = fma(_174, _196, _254);
    float _270 = 0.0;
    float _272 = _264;
    float _274 = _266;
    if (_230)
    {
        float _276 = rsqrt(_218);
        _270 = _276;
    }
    float _278 = _270;
    float _280 = fma(_190, _196, _256);
    float _282 = 0.0;
    float _284 = 0.0;
    if (!_230)
    {
        _282 = 0.0;
        _284 = 0.0;
    }
    float _286 = _282;
    float _288 = _284;
    float _290 = 0.0;
    float _292 = _286;
    float _294 = _288;
    if (!_230)
    {
        _290 = 0.0;
    }
    float _296 = _290;
    float _298 = fma(_178, _200, _268);
    float _300 = 0.0;
    float _302 = _296;
    float _304 = _298;
    if (!_252)
    {
        _300 = 0.0;
    }
    float _306 = _300;
    float _308 = 0.0;
    float _310 = _306;
    if (_252)
    {
        float _312 = rsqrt(_220);
        _308 = _312;
    }
    float _314 = _308;
    float _316 = 0.0;
    if (!_252)
    {
        _316 = 0.0;
    }
    float _318 = _316;
    float _320 = fma(_194, _200, _280);
    float _322 = _318;
    if (!_252)
    {
        _238 = 0.0;
    }
    float _324 = _238;
    float _326 = _324;
    if (_228)
    {
        float _328 = _242 * _174;
        _260 = _328;
    }
    float _330 = _260;
    if (_228)
    {
        float _332 = _242 * _184;
        _272 = _332;
    }
    float _334 = _272;
    if (_228)
    {
        float _336 = _242 * _190;
        _262 = _336;
    }
    float _338 = _262;
    if (_230)
    {
        float _340 = _278 * _176;
        _302 = _340;
    }
    float _342 = _302;
    if (_230)
    {
        float _344 = _278 * _186;
        _292 = _344;
    }
    float _346 = _292;
    if (_230)
    {
        float _348 = _278 * _192;
        _294 = _348;
    }
    float _350 = _294;
    if (_252)
    {
        float _352 = _314 * _178;
        _310 = _352;
    }
    float _354 = _310;
    if (_252)
    {
        float _356 = _314 * _188;
        _322 = _356;
    }
    float _358 = _322;
    if (_252)
    {
        float _360 = _314 * _194;
        _326 = _360;
    }
    float _362 = _326;
    bool _364 = !_182;
    float _382;
    if (!_364)
    {
        float _366 = in.m_63.x;
        float _368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _370 = _366 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _372 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _374 = _372 * _368;
        float _376 = floor(_374);
        float _378 = -_376;
        float _380 = _374 + _378;
        _382 = _380;
        _384 = true;
    }
    else
    {
        _382 = _202;
    }
    _384 = false;
    float _386 = _382;
    float _388 = in.m_48.x;
    float _390 = in.m_48.y;
    float _392 = in.m_48.z;
    float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _396 = -_202;
    float _398 = _396 + 1.0;
    float _400 = in.m_63.y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _402;
    float _406 = in.m_63.z;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = 1.0 / _404;
    float _414 = in.m_57.w;
    bool _416 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_386);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _202 * _394;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _398 * _394;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = 1.0 / _410;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _440 = _386 + _438;
    bool _442 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _444 = isnan(_386);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = in.m_59.w;
    float _456 = _186 * _390;
    float _458 = _192 * _390;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _460;
    float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _466 = in.m_63.x;
    float _468 = fma(_184, _388, _456);
    float _470 = fma(_190, _388, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _386 + _472;
    float _476 = precise::min(_430, _434);
    float _478 = fma(_188, _392, _468);
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    float _484 = fma(_194, _392, _470);
    float _486 = _400 + _406;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _498 = _496 != 0;
    float _500 = _440 * _436;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _504 = _502 != 0;
    float _506 = _474 * _412;
    float _508 = 1.0 / _462;
    float _510 = _486 + (-1.0);
    bool _512 = !_490;
    int _514 = _512 ? 0 : 1;
    float _516 = _478 + _414;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _524 = _522 != 0;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _528 = _526 != 0;
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _532 = _484 + _454;
    float _534 = _482 * _148;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _538 = _386 + _536;
    float _540 = _482;
    float _542 = _510;
    float _544 = _390;
    if (_504)
    {
        _540 = _466;
    }
    float _546 = _540;
    float _548 = exp2(_534);
    float _550 = _546;
    if (_504)
    {
        _542 = _400;
    }
    float _552 = _542;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _556 = 1.0 + _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _560 = _552;
    if (!_504)
    {
        _550 = _406;
    }
    float _562 = _550;
    float _564 = _466 + _406;
    if (!_504)
    {
        _560 = _466;
    }
    float _566 = _560;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _570 = _538 * _508;
    float _572 = _562 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _574 = 1.0 / _556;
    float _576 = _566 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _578 = _564 + (-1.0);
    float _580 = -_558;
    float _582 = fma(_572, 2.0, _580);
    float _584 = fma(_576, -2.0, _568);
    float _586 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _588 = -_548;
    float _590 = _588 + 1.0;
    bool _592 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _594 = isnan(1.0);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _600 = _596 || _598;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _604 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _612 = _608 || _610;
    float _614 = _400 * 2.0;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _620 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[88].z, _602);
    float _622 = _612 ? _590 : 0.0;
    float _624 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[88].w, _616);
    float _626 = fma(_618, _400, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _628 = floor(_614);
    float _630 = _466 + _400;
    float _632 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _620);
    float _634 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _624);
    float _636 = _626 * _148;
    float _638 = -_148;
    float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[86].x, _582);
    float _642 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _584);
    if (_600)
    {
        float _644 = _622 * _574;
        _166 = _644;
    }
    float _646 = _166;
    float _648 = _630 + (-1.0);
    float _650 = _406 * 2.0;
    float _652 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _658;
    bool _662 = !_494;
    int _664 = _662 ? 0 : 1;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _666;
    float _670 = floor(_650);
    float _672 = fma(_656, _506, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _674 = fma(_660, _506, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _676 = fma(_668, _506, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _678 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _680 = isnan(_386);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _466 * 2.0;
    bool _692 = _628 > 0.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _698 = _628 >= 0.0;
    bool _700 = isnan(_628);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _716 = _386 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _718 = isnan(_386);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_688;
    float _730 = _728 + 1.0;
    float _732 = floor(_690);
    float _734 = fma(_696, _500, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _736 = fma(_710, _500, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _738 = fma(_714, _500, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _740 = _726 * _730;
    float _742 = -_726;
    float _744 = _742 + 1.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _746;
    bool _750 = !_498;
    int _752 = _750 ? 0 : 1;
    float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _760;
    float _764 = _452 * _744;
    bool _766 = _670 > 0.0;
    float _768 = -_452;
    float _770 = _768 + 1.0;
    bool _772 = _670 >= 0.0;
    bool _774 = isnan(_670);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(_758, _570, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _784 = fma(_762, _570, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _786 = fma(_748, _570, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _788 = _426 * _770;
    int _790 = _780 ? 0 : 1;
    float _792 = -_426;
    float _794 = _792 + 1.0;
    bool _796 = _732 >= 0.0;
    bool _798 = isnan(_732);
    bool _800 = _796 || _798;
    bool _802 = isnan(0.0);
    bool _804 = _800 || _802;
    float _806 = _672 * _788;
    float _808 = _674 * _788;
    float _810 = _676 * _788;
    float _812 = _646 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    int _814 = ~_790;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].y, _808);
    bool _822 = !_528;
    int _824 = _822 ? 0 : 1;
    float _826 = _812 * _754;
    int _828 = _818;
    if (!_766)
    {
        int _830 = ~_790;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].z, _810);
    int _838 = _706 ? 0 : 1;
    float _840 = _646 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _842 = _804 ? 0 : 1;
    float _844 = fma(_736, _764, _820);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _856 = _854 != 0;
    float _858 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[143].x, _806);
    bool _860 = _732 > 0.0;
    float _862 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[203].x, _826);
    int _864 = ~_842;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    float _870 = fma(_734, _764, _858);
    bool _872 = !_852;
    int _874 = _872 ? 0 : 1;
    float _876 = floor(_862);
    float _878 = _840 * _464;
    float _880 = fma(_738, _764, _836);
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    bool _888 = !_848;
    int _890 = _888 ? 0 : 1;
    float _892 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[203].z, _878);
    int _894 = abs(_874);
    float _896 = _862 * 6.283185482025146484375;
    int _898 = _868;
    bool _900 = _848;
    if (!_860)
    {
        int _902 = ~_842;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    float _908 = floor(_892);
    float _910 = float(_834);
    float _912 = _862 + 0.25;
    int _914 = ~_838;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = fma(_782, _740, _870);
    int _922 = abs(_890);
    float _924 = fma(_466, 6.283185482025146484375, _636);
    int _926 = _918;
    if (!_692)
    {
        int _928 = ~_838;
        int _930 = _928 + 1;
        _926 = _930;
    }
    int _932 = _926;
    float _934 = floor(_912);
    float _936 = _896 * 0.15915493667125701904296875;
    float _938 = float(_906);
    float _940 = -_876;
    float _942 = _862 + _940;
    float _944 = float(_894);
    float _946 = fma(_784, _740, _844);
    float _948 = float(_922);
    float _950 = -_476;
    float _952 = _950 + 1.0;
    float _954 = _936 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _944 * _938;
    int _960 = abs(_664);
    float _962 = _948 * _910;
    bool _964 = _942 >= 0.5;
    bool _966 = isnan(_942);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.5);
    bool _972 = _968 || _970;
    float _974 = _892 + 0.25;
    float _976 = _958 * (-2.0);
    int _978 = abs(_514);
    float _980 = floor(_974);
    bool _982 = !_972;
    float _984 = _982 ? 0.5 : (-0.5);
    float _986 = fma(_530, _976, _530);
    float _988 = float(_960);
    float _990 = -_934;
    float _992 = _912 + _990;
    float _994 = fma(_976, _884, _884);
    float _996 = -_908;
    float _998 = _892 + _996;
    float _1000 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1002 = _1000 * 2.0;
    float _1004 = _892 * 6.283185482025146484375;
    float _1006 = _956 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1008 = _992 > 0.5;
    float _1010 = _988 * _1002;
    float _1012 = _1004 * 0.15915493667125701904296875;
    float _1014 = float(_978);
    float _1016 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].y, _946);
    float _1018 = -_980;
    float _1020 = _974 + _1018;
    int _1022 = abs(_752);
    float _1024 = _400 + (-0.5);
    float _1026 = fma(_1014, _1006, _1010);
    float _1028 = _1012 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    bool _1032 = !_524;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = in.m_67.x;
    bool _1038 = _998 >= 0.5;
    bool _1040 = isnan(_998);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.5);
    bool _1046 = _1042 || _1044;
    float _1048 = _992;
    float _1050 = _1020;
    if (_1008)
    {
        float _1052 = -_992;
        float _1054 = _1052 + 1.0;
        _1048 = _1054;
    }
    float _1056 = _1048;
    bool _1058 = !_520;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = fma(_786, _740, _880);
    int _1064 = abs(_1034);
    float _1066 = fma(_1056, 4.0, -1.0);
    float _1068 = float(_1022);
    bool _1070 = !_1046;
    float _1072 = _1070 ? 0.5 : (-0.5);
    float _1074 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1076 = abs(_1060);
    bool _1078 = _1020 > 0.5;
    float _1080 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = _1080 * 2.0;
    float _1084 = float(_1064);
    float _1086 = fma(_1068, _1074, _1026);
    float _1088 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _994);
    float _1090 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1092 = _1084 * _1082;
    float _1094 = float(_1076);
    float _1096 = fma(_986, _646, _1088);
    float _1098 = fma(_1086, 3.1415927410125732421875, _882);
    float _1100 = _962 * (-2.0);
    float _1102 = float(_932);
    float _1104 = fma(_1094, _1090, _1092);
    if (_1078)
    {
        float _1106 = -_1020;
        float _1108 = _1106 + 1.0;
        _1050 = _1108;
    }
    float _1110 = _1050;
    float _1112 = _924 * 0.15915493667125701904296875;
    float _1114 = _532 * _532;
    int _1116 = abs(_824);
    float _1118 = fma(_1110, 4.0, -1.0);
    bool _1120 = !_856;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = fma(_516, _516, _1114);
    float _1126 = float(_1116);
    float _1128 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1130 = abs(_1122);
    float _1132 = _466 + (-0.5);
    float _1134 = fma(_1098, _1100, _1098);
    float _1136 = fma(_1126, _1128, _1104);
    float _1138 = float(_1130);
    float _1140 = fma(_652, _1100, _652);
    float _1142 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1134);
    float _1144 = _1112 * 6.283185482025146484375;
    float _1146 = sin(_1144);
    float _1148 = in.m_67.y;
    float _1150 = _1138 * _1102;
    float _1152 = fma(_1136, 3.1415927410125732421875, _886);
    float _1154 = fma(_1140, _646, _1142);
    float _1156 = in.m_69.x;
    float _1158 = in.m_69.y;
    float _1160 = in.m_69.z;
    float _1162 = _1150 * (-2.0);
    float _1164 = _1096 * 0.15915493667125701904296875;
    float _1166 = _1154 * 0.15915493667125701904296875;
    float _1168 = in.m_67.z;
    float _1170 = fma(_586, _1162, _586);
    float _1172 = fma(_1152, _1162, _1152);
    float _1174 = _406 + (-0.5);
    float _1176 = _1164 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = in.m_71.y;
    float _1182 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1172);
    float _1184 = abs(_1146);
    float _1186 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1188 = fma(_1170, _646, _1182);
    float _1190 = _1164 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].x, _920);
    float _1196 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1186);
    float _1198 = _1188 * 0.15915493667125701904296875;
    float _1200 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1062);
    float _1202 = _690 + (-1.0);
    float _1204 = -_1196;
    float _1206 = _1204 + _1148;
    float _1208 = _1166 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1016 * _1158;
    float _1214 = _1194 * _1156;
    float _1216 = _1200 * _1160;
    float _1218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1036);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1206);
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1226 = sqrt(_1124);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1168);
    float _1230 = _1222 * _1218;
    float _1232 = _1224 * _1220;
    float _1234 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _390 + _1180;
    float _1238 = _1166 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _1210 * _1192;
    float _1244 = _1210 * _1178;
    float _1246 = _1234 * _1228;
    float _1248 = _1198 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1202 * _1226;
    float _1254 = _1252 * 0.75;
    float _1256 = _1198 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = _1240 * _1178;
    float _1262 = _1240 * _1192;
    float _1264 = _1254 * 0.15915493667125701904296875;
    float _1266 = _1210 * _1250;
    float _1268 = _1240 * _1250;
    float _1270 = _1192 * _1250;
    float _1272 = _1178 * _1250;
    float _1274 = _1266 * _1232;
    float _1276 = _1268 * _1232;
    float _1278 = _1264 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = fma(_1258, _1242, _1260);
    float _1284 = -_1244;
    float _1286 = fma(_1258, _1262, _1284);
    float _1288 = -_1262;
    float _1290 = fma(_1258, _1244, _1288);
    float _1292 = -_1232;
    float _1294 = _1258 * _1292;
    float _1296 = fma(_1282, _1230, _1274);
    float _1298 = fma(_1258, _1260, _1242);
    float _1300 = fma(_1286, _1230, _1276);
    float _1302 = fma(_1270, _1230, _1294);
    float _1304 = fma(_1290, _1246, _1296);
    float _1306 = _1264 * 6.283185482025146484375;
    float _1308 = cos(_1306);
    float _1310 = fma(_1272, _1246, _1302);
    float _1312 = _1304 * _346;
    float _1314 = fma(_1298, _1246, _1300);
    float _1316 = _1304 * _350;
    float _1318 = fma(_1310, _334, _1312);
    float _1320 = fma(_1310, _338, _1316);
    float _1322 = fma(_1314, _358, _1318);
    float _1324 = fma(_1314, _362, _1320);
    float _1326 = _1322 * _1280;
    float _1328 = _1322 * _1308;
    float _1330 = -_1326;
    float _1332 = fma(_1324, _1308, _1330);
    float _1334 = fma(_1324, _1280, _1328);
    float _1336 = _532 + _1332;
    float _1338 = _516 + _1334;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1342 = _1336 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1346 = _1338 + _1344;
    float _1348 = _1342 * _1342;
    float _1350 = fma(_1346, _1346, _1348);
    float _1352 = sqrt(_1350);
    bool _1354 = _1352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = _1352 + _1356;
    float _1360 = _1332;
    float _1362 = _1352;
    float _1364 = _1212;
    float _1366 = _1146;
    if (_1354)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1360 = _1368;
    }
    float _1370 = _1360;
    if (_1354)
    {
        float _1372 = _1358 * _1370;
        _1362 = _1372;
    }
    float _1374 = _1362;
    if (_1354)
    {
        float _1376 = _1374 * 0.15915493667125701904296875;
        _1364 = _1376;
    }
    float _1378 = _1364;
    float _1380 = _1304 * _342;
    float _1382 = _1370;
    float _1384 = _1380;
    if (_1354)
    {
        float _1386 = _1378 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        _1382 = _1388;
    }
    float _1390 = _1382;
    float _1392 = fma(_1310, _330, _1380);
    if (!_1354)
    {
        _1384 = _1338;
    }
    float _1394 = _1384;
    float _1396 = fma(_1314, _354, _1392);
    float _1398 = _1314;
    float _1400 = _1396;
    float _1402 = _1394;
    if (_1354)
    {
        float _1404 = rsqrt(_1350);
        _1398 = _1404;
    }
    float _1406 = _1398;
    float _1408 = _1236 + _1396;
    if (_1354)
    {
        float _1410 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _544 = _1410;
    }
    float _1412 = _544;
    float _1414 = _1412;
    if (_1354)
    {
        float _1416 = fma(_1390, _1412, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1400 = _1416;
    }
    float _1418 = _1400;
    if (!_1354)
    {
        _1414 = _1336;
    }
    float _1420 = _1414;
    float _1422 = _1406;
    float _1424 = _1420;
    if (_1354)
    {
        float _1426 = _1406 * _1418;
        _1422 = _1426;
    }
    float _1428 = _1422;
    float _1430 = _1428;
    if (_1354)
    {
        float _1432 = fma(_1346, _1428, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1402 = _1432;
    }
    float _1434 = _1402;
    float _1436 = _1434;
    if (_1354)
    {
        float _1438 = fma(_1342, _1428, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1424 = _1438;
    }
    float _1440 = _1424;
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1444 = _1434 + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1448 = _1440 + _1446;
    float _1450 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1452 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4878 = float2(_1450, _1452);
    float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4878, float2(0.0), isnan(_4878)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4878, float2(0.0), isnan(_4878)), level(0.0)).x;
    float _1456 = _1390;
    float _1458 = _1444;
    float _1460 = _1448;
    float _1462 = _1440;
    if (_1354)
    {
        float _1464 = _1378 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        _1456 = _1466;
    }
    float _1468 = _1456;
    if (!_1354)
    {
        _1458 = _1408;
    }
    float _1470 = _1458;
    float _1472 = -_516;
    float _1474 = _1472 + _1434;
    float _1476 = -_532;
    float _1478 = _1476 + _1440;
    bool _1480 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1482 = isnan(0.5);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1488 = _1484 || _1486;
    float _1490 = fma(_532, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1492 = _1470;
    if (_1354)
    {
        float _1494 = _1468 + (-1.0);
        _1430 = _1494;
    }
    float _1496 = _1430;
    if (_1354)
    {
        float _1498 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1460 = _1498;
    }
    float _1500 = _1460;
    if (_1354)
    {
        float _1502 = fma(_1408, _1468, _1500);
        _1492 = _1502;
    }
    float _1504 = _1492;
    float _1506 = -_1236;
    float _1508 = _1506 + _1504;
    float _1510 = fma(_516, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1512 = _1508 * _1508;
    float _1514 = floor(_1490);
    float _1516 = fma(_1474, _1474, _1512);
    float _1518 = fma(_1478, _1478, _1516);
    float _1520 = floor(_1510);
    float _1522 = sqrt(_1518);
    float _1524 = -_1520;
    float _1526 = _1510 + _1524;
    float _1528 = -_1514;
    float _1530 = _1490 + _1528;
    bool _1532 = _1522 > 0.0;
    float _1534 = _1522;
    float _1536 = _1504;
    if (!_1532)
    {
        _1534 = _1440;
    }
    float _1538 = _1534;
    float _1540 = fma(_1454, 100.0, _1504);
    float _1542 = fma(_1454, 100.0, _1236);
    float _1544 = _1538;
    float _1546 = _1454;
    if (!_1532)
    {
        _1536 = _1540;
    }
    float _1548 = _1536;
    bool _1550 = !_1532;
    float _1552 = _1548;
    if (!_1550)
    {
        float _1554 = _298 * _298;
        float _1556 = fma(_266, _266, _1554);
        float _1558 = rsqrt(_1518);
        float _1560 = fma(_320, _320, _1556);
        float _1562 = sqrt(_1560);
        float _1564 = _1474 * _1558;
        float _1566 = _1508 * _1558;
        float _1568 = _1478 * _1558;
        bool _1570 = _1562 > 0.0;
        float _1572 = _1562;
        float _1574 = _1558;
        _1366 = _1566;
        if (!_1570)
        {
            _1572 = _1540;
        }
        float _1576 = _1572;
        _1552 = _1576;
        if (!_1570)
        {
            _1574 = _1440;
        }
        float _1578 = _1574;
        bool _1580 = !_1570;
        _1544 = _1578;
        if (!_1580)
        {
            float _1582 = rsqrt(_1560);
            float _1584 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1586 = _298 * _1582;
            float _1588 = _266 * _1582;
            float _1590 = _1566 * _1586;
            float _1592 = _320 * _1582;
            float _1594 = fma(_1564, _1588, _1590);
            float _1596 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1598 = fma(_1568, _1592, _1594);
            float _1600 = _1598 * _1596;
            float _1602 = fma(_266, _1600, _1434);
            float _1604 = fma(_298, _1600, _1540);
            float _1606 = fma(_320, _1600, _1440);
            _1552 = _1604;
            _1544 = _1606;
            _1436 = _1602;
            _1546 = _1584;
        }
    }
    float _1608 = _1552;
    float _1610 = _1544;
    float _1612 = _1436;
    float _1614 = _1546;
    float _1616 = _1366;
    float _1618 = _1612;
    float _1620 = _1610;
    float _1622 = _1614;
    float _1624 = _1616;
    if (_1488)
    {
        _1462 = _1608;
    }
    float _1626 = _1462;
    float _1628 = _1626;
    if (!_1488)
    {
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1632 = _1542 + _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1636 = _516 + _1634;
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1640 = -_1542;
        float _1642 = _1640 + _1608;
        float _1644 = _1632 * _1632;
        float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1648 = _532 + _1646;
        float _1650 = -_532;
        float _1652 = _1650 + _1610;
        float _1654 = fma(_1636, _1636, _1644);
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1658 = fma(_1648, _1648, _1654);
        float _1660 = sqrt(_1658);
        float _1662 = _1638 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1664 = precise::min(_1660, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1666 = _1664 * _1656;
        float _1668 = -_516;
        float _1670 = _1668 + _1612;
        float _1672 = _1662 * _1666;
        float _1674 = fma(_1670, _1672, _516);
        float _1676 = fma(_1642, _1672, _1542);
        float _1678 = fma(_1652, _1672, _532);
        _1628 = _1676;
        _1618 = _1674;
        _1620 = _1678;
        _1622 = _1666;
        _274 = _1672;
    }
    float _1680 = _1628;
    float _1682 = _1618;
    float _1684 = _1620;
    float _1686 = _1622;
    float _1688 = _274;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1692 = _1680 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1696 = _1682 + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1700 = _1684 + _1698;
    float _1702 = _1692 * _1692;
    float _1704 = fma(_1696, _1696, _1702);
    float _1706 = fma(_1700, _1700, _1704);
    float _1708 = rsqrt(_1706);
    float _1710 = sqrt(_1706);
    float _1712 = _1696 * _1708;
    float _1714 = _1700 * _1708;
    float _1716 = _1692 * _1708;
    float _1718 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1718 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 + _1724;
    float _1728 = sqrt(_1726);
    bool _1730 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1728 + _1732;
    float _1736 = _1686;
    float _1738 = _1726;
    float _1740 = _1734;
    if (_1730)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1742;
    }
    float _1744 = _1736;
    if (_1730)
    {
        float _1746 = rsqrt(_1726);
        _1738 = _1746;
    }
    float _1748 = _1738;
    if (_1730)
    {
        float _1750 = _1734 * _1744;
        _1740 = _1750;
    }
    float _1752 = _1740;
    if (_1730)
    {
        float _1754 = _1752 * 0.15915493667125701904296875;
        _304 = _1754;
    }
    float _1756 = _304;
    float _1758 = _1688;
    float _1760 = _1756;
    if (_1730)
    {
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        _1758 = _1764;
    }
    float _1766 = _1758;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = precise::max(0.0, _1768);
    float _1772 = _1744;
    float _1774 = _1770;
    float _1776 = _1768;
    if (_1730)
    {
        float _1778 = _1756 * 6.283185482025146484375;
        float _1780 = cos(_1778);
        _1772 = _1780;
    }
    float _1782 = _1772;
    float _1784 = -_1716;
    float _1786 = -_1770;
    float _1788 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1786);
    if (_1730)
    {
        float _1790 = _1788 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1774 = _1790;
    }
    float _1792 = _1774;
    float _1794 = _1766;
    float _1796 = _1792;
    if (_1730)
    {
        float _1798 = fma(_1766, _1792, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1794 = _1798;
    }
    float _1800 = _1794;
    float _1802 = _1800;
    if (!_1730)
    {
        _1796 = _1788;
    }
    float _1804 = _1796;
    float _1806 = _1804;
    float _1808 = _1782;
    if (_1730)
    {
        float _1810 = _1782 + (-1.0);
        _1776 = _1810;
    }
    float _1812 = _1776;
    float _1814 = _1812;
    if (_1730)
    {
        float _1816 = _1748 * _1800;
        _1624 = _1816;
    }
    float _1818 = _1624;
    if (!_1730)
    {
        _1802 = _1718;
    }
    float _1820 = _1802;
    float _1822 = _1820;
    if (_1730)
    {
        float _1824 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1760 = _1824;
    }
    float _1826 = _1760;
    float _1828 = _1826;
    if (_1730)
    {
        float _1830 = _1718 * _1818;
        _1822 = _1830;
    }
    float _1832 = _1822;
    if (!_1730)
    {
        _1814 = _1720;
    }
    float _1834 = _1814;
    float _1836 = _1834;
    if (_1730)
    {
        float _1838 = _1720 * _1818;
        _1836 = _1838;
    }
    float _1840 = _1836;
    if (_1730)
    {
        float _1842 = fma(_1788, _1782, _1826);
        _1806 = _1842;
    }
    float _1844 = _1806;
    if (!_1730)
    {
        _1828 = _1722;
    }
    float _1846 = _1828;
    float _1848 = _1846;
    if (_1730)
    {
        float _1850 = _1832 * _1832;
        _1848 = _1850;
    }
    float _1852 = _1848;
    if (!_1730)
    {
        _1808 = _1724;
    }
    float _1854 = _1808;
    float _1856 = _1854;
    if (_1730)
    {
        float _1858 = _1840 * _1840;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1864 = fma(_1844, _1844, _1852);
    float _1866 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1862);
    float _1868 = _1864 + _1860;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1866);
    float _1878 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1880 = rsqrt(_1868);
    float _1882 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1886 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1888 = -_1874;
    float _1890 = _1888 + 1.0;
    float _1892 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1894 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1878);
    float _1896 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1886);
    float _1898 = abs(_1890);
    float _1900 = log2(_1898);
    float _1902 = -_1892;
    float _1904 = fma(_1902, _1884, 1.0);
    float _1906 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1908 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1896);
    float _1910 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1894);
    float _1912 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1906);
    float _1914 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1916 = _1880 * _1832;
    float _1918 = _1880 * _1844;
    float _1920 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1912);
    float _1922 = _1880 * _1840;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1926 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1928 = _1920 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1930 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = -_1924;
    float _1934 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1932);
    float _1936 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1938 = log2(_1904);
    float _1940 = _1918 + 1.0;
    float _1942 = -_1922;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1934);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1926);
    float _1948 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1950 = fma(_1944, -0.5, 0.5);
    float _1952 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1946);
    float _1954 = exp2(_1936);
    float _1956 = fma(_1944, 0.5, 0.5);
    float _1958 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1960 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1952);
    float _1962 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1948);
    float _1964 = fma(_1956, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = 1.0 / _1960;
    float _1968 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1958);
    float _1970 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1962);
    float2 _5716 = float2(_1526, _1530);
    float _1972 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5716, float2(0.0), isnan(_5716)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5716, float2(0.0), isnan(_5716)), level(0.0)).x;
    float _1974 = fma(_1956, _1964, -0.212114393711090087890625);
    float _1976 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1968);
    float _1978 = _1938 * 0.693147182464599609375;
    float _1980 = sqrt(_1950);
    float _1982 = fma(_1956, _1974, 1.570728778839111328125);
    float _1984 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1986 = -_1918;
    float _1988 = fma(_1954, _1940, _1986);
    float _1990 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1970);
    float _1992 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1976);
    float _1994 = _1990 * _1966;
    float _1996 = _1992 * _1966;
    float _1998 = _1980 * 0.636619746685028076171875;
    float _2000 = fma(_1988, 0.5, 0.5);
    float _2002 = fma(_1994, 0.5, 0.5);
    float _2004 = fma(_1996, -0.5, 0.5);
    float _2006 = -_1982;
    float _2008 = fma(_1998, _2006, 1.0);
    float3 _5783 = float3(_2002, _2004, _1984);
    float _2010 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5783, float3(0.0), isnan(_5783)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5783, float3(0.0), isnan(_5783)), level(0.0)).x;
    float3 _5794 = float3(_2002, _2004, _1984);
    float4 _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5794, float3(0.0), isnan(_5794)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5794, float3(0.0), isnan(_5794)), level(0.0)).xyzw;
    float _2015 = _2013.x;
    float _2017 = _2013.y;
    float _2019 = _2013.z;
    float _2021 = _2013.w;
    float2 _5810 = float2(_2008, _2000);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5810, float2(0.0), isnan(_5810)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5810, float2(0.0), isnan(_5810)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2035 = in.m_73.y;
    float _2037 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2041 = _400 > 0.5;
    float _2043 = _2033 * _466;
    float _2045 = in.m_73.x;
    float _2047 = _2037 * _466;
    bool _2049 = _406 > 0.5;
    float _2051 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2053 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2055 = trunc(_2043);
    int _2057 = int(_2055);
    out.m_75.x = _1682;
    out.m_75.y = _1680;
    out.m_75.z = _1684;
    float _2059 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2053);
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2063 = _2061 != 0;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2067 = _2065 != 0;
    float _2069 = trunc(_2047);
    int _2071 = int(_2069);
    int _2073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2075 = _2073 != 0;
    float _2077 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2081 = _2079 != 0;
    float _2083 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2059);
    float _2085 = -_2035;
    float _2087 = _2085 + 1.0;
    int _2089 = _2057 << 4;
    int _2091 = _2089 + 1712;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2095 = _2035;
    float _2097 = _1992;
    float _2099 = _1990;
    if (_2063)
    {
        bool _2101 = _466 > 0.5;
        _900 = _2101;
    }
    bool _2103 = _900;
    uint _2106 = uint(int(uint(_2091) >> uint(2)));
    uint _2108 = uint(int(uint(int(_2106)) >> uint(2)));
    int _2110 = int(_2106) & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = int(_2106) + 1;
    uint _2116 = uint(int(uint(_2114) >> uint(2)));
    int _2118 = _2114 & 3;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[int(_2116)][_2118];
    int _2122 = _2049 ? as_type<int>(_2087) : as_type<int>(_2035);
    float _2124 = -_1196;
    float _2126 = -_1148;
    bool _2128 = _2124 != _2126;
    bool _2130 = isnan(_2124);
    bool _2132 = _2128 || _2130;
    bool _2134 = isnan(_2126);
    bool _2136 = _2132 || _2134;
    int _2138 = _2071 << 4;
    int _2140 = _2138 + 1968;
    float _2142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2144 = _1036 == 0.0;
    bool _2146 = !_2136;
    bool _2148 = _2144 && _2146;
    int _2150 = _2091 + 8;
    uint _2152 = uint(int(uint(_2150) >> uint(2)));
    uint _2154 = uint(int(uint(int(_2152)) >> uint(2)));
    int _2156 = int(_2152) & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    float _2160 = _2081 ? as_type<float>(_2122) : _2035;
    bool _2162 = _1168 == 0.0;
    bool _2164 = _2162 && _2148;
    float _2166 = as_type<float>(_2071);
    int _2168 = _2140;
    if (_2067)
    {
        float _2170 = _2041 ? _2087 : _2035;
        _2095 = _2170;
    }
    float _2172 = _2095;
    float _2174 = fma(_2160, _2077, -0.5);
    float _2176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2178 = _2140 + 8;
    uint _2180 = uint(int(uint(_2178) >> uint(2)));
    uint _2182 = uint(int(uint(int(_2180)) >> uint(2)));
    int _2184 = int(_2180) & 3;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[int(_2182)][_2184];
    float _2188 = -_642;
    float _2190 = fma(_634, _2174, _2188);
    float _2192 = _2045;
    if (!_2063)
    {
        _2166 = _2045;
    }
    float _2194 = _2166;
    float _2196 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2200 = exp2(_2051);
    uint _2202 = uint(int(uint(_2140) >> uint(2)));
    uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
    int _2206 = int(_2202) & 3;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[int(_2204)][_2206];
    int _2210 = int(_2202) + 1;
    uint _2212 = uint(int(uint(_2210) >> uint(2)));
    int _2214 = _2210 & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    float _2218 = _2194;
    if (_2075)
    {
        float _2220 = -_2045;
        float _2222 = _2220 + 1.0;
        _2168 = as_type<int>(_2222);
    }
    int _2224 = _2168;
    float _2226 = -_2200;
    float _2228 = _2226 + 1.0;
    float _2230 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2232 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2234 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2236 = in.m_77.x;
    float _2238 = in.m_77.y;
    float _2240 = in.m_77.z;
    float _2242 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2244 = _2186 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2246 = as_type<int>(_2186);
    if (_2063)
    {
        float _2248 = -_2045;
        float _2250 = _2248 + 1.0;
        _2246 = as_type<int>(_2250);
    }
    int _2252 = _2246;
    float _2254 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2256 = _2254;
    if (_2063)
    {
        float _2258 = _2103 ? as_type<float>(_2252) : _2045;
        _2218 = _2258;
    }
    float _2260 = _2218;
    float _2262 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2264 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2266 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2270 = _2242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2272 = _2236;
    float _2274 = _2238;
    float _2276 = _2240;
    if (!_2164)
    {
        float _2278 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2236);
        _2272 = _2278;
    }
    float _2280 = _2272;
    float _2282 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2284 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2075)
    {
        float _2286 = _2041 ? as_type<float>(_2224) : _2045;
        _2192 = _2286;
    }
    float _2288 = _2192;
    out.m_79.x = _2266;
    out.m_79.y = _2268;
    out.m_79.z = _2270;
    out.m_79.w = _2198;
    if (!_2164)
    {
        float _2290 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2238);
        _2274 = _2290;
    }
    float _2292 = _2274;
    if (!_2164)
    {
        float _2294 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2240);
        _2276 = _2294;
    }
    float _2296 = _2276;
    float _2298 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2300 = fma(_2196, _2288, -0.5);
    float _2302 = _1266 * _2292;
    float _2304 = -_2292;
    float _2306 = _1258 * _2304;
    float _2308 = _1268 * _2292;
    float _2310 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = fma(_1282, _2280, _2302);
    float _2314 = fma(_1270, _2280, _2306);
    float _2316 = fma(_1286, _2280, _2308);
    bool _2318 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2320 = isnan(_1710);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2326 = _2322 || _2324;
    float _2328 = fma(_1290, _2296, _2312);
    float _2330 = _2282 * _2142;
    float _2332 = _2284 * _2176;
    float _2334 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2336 = fma(_632, _2300, _640);
    float _2338 = _2190 + 0.5;
    float _2340 = fma(_1272, _2296, _2314);
    out.m_81.x = _2332;
    out.m_81.y = _2330;
    float _2342 = _2336 + 0.5;
    float _2344 = _2328 * _346;
    float _2346 = _2328 * _342;
    float _2348 = _2328 * _350;
    float _2350 = fma(_1298, _2296, _2316);
    out.m_83.x = _2342;
    out.m_83.y = _2338;
    float _2352 = fma(_2340, _334, _2344);
    float _2354 = fma(_2340, _330, _2346);
    float _2356 = fma(_2340, _338, _2348);
    float _2358 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2334);
    float _2360 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2362 = fma(_2350, _358, _2352);
    float _2364 = fma(_2350, _354, _2354);
    float _2366 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2358);
    float _2368 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2360);
    float _2370 = fma(_2350, _362, _2356);
    float _2372 = _2366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2374 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2368);
    float _2376 = in.m_71.x;
    float _2378 = 1.0 / _2372;
    float _2380 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2382 = in.m_85.w;
    float _2384 = _2380 + _2372;
    out.m_87.x = _2298;
    out.m_87.y = _2310;
    out.m_87.z = _2254;
    float _2386 = in.m_85.y;
    float _2388 = in.m_85.z;
    float _2390 = _2384 * _2378;
    float _2392 = _2390 * 0.5;
    out.m_89.x = _2362;
    out.m_89.y = _2364;
    out.m_89.z = _2370;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2396 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2394);
    if (!_2326)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2398 = _2256;
    float _2400 = in.m_85.x;
    float _2402 = 1.0 / _2396;
    out.m_91.w = _2382;
    out.m_91.y = _2386;
    out.m_91.z = _2388;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2406 = _2402 * _2404;
    float _2408 = _2386;
    float _2410 = _2388;
    float _2412 = _2398;
    float _2414 = _2398;
    if (!_2326)
    {
        _2408 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2416 = _2408;
    float _2418 = abs(_2406);
    float _2420 = log2(_2418);
    out.m_91.x = _2400;
    float _2422 = _2416;
    float _2424 = _2416;
    if (!_2326)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2426 = _2410;
    bool _2428 = _2406 <= 8000.0;
    bool _2430 = isnan(_2406);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(8000.0);
    bool _2436 = _2432 || _2434;
    float _2438 = float(_2436);
    float _2440 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2442 = exp2(_2440);
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = fma(_2446, -2.0, 3.0);
    float _2450 = _2446 * _2446;
    float _2452 = _2450 * _2448;
    float _2454 = -_2452;
    float _2456 = _2454 + 1.0;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2452);
    float _2460 = _2438 * _2458;
    float _2462 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2464 = -_1972;
    float _2466 = _2464 + 1.0;
    float _2468 = _2466 * _2462;
    float _2470 = precise::clamp(_2468, 0.0, 1.0);
    float _2472 = -_2470;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2476 = _2474 * _2376;
    float _2478 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2083);
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2482 = _2478 + _1960;
    out.gl_Position.x = _1990;
    out.gl_Position.y = _1992;
    out.gl_Position.z = _2478;
    out.gl_Position.w = _1960;
    out.m_93.x = _2480;
    float _2484 = _2230 * _2010;
    float _2486 = -_2230;
    float _2488 = _2486 + 1.0;
    float _2490 = _2021 * _2484;
    float _2492 = _2031 * _2484;
    float _2494 = _2021 * _2488;
    float _2496 = _2482;
    float _2498 = _2426;
    float _2500 = _2426;
    if (!_2326)
    {
        _2097 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2502 = _2097;
    float _2504 = fma(_2027, _2490, _2015);
    float _2506 = fma(_2029, _2490, _2017);
    float _2508 = _2482 * 0.5;
    float _2510 = fma(_2021, _2492, _2019);
    float _2512 = _2502;
    float _2514 = _2502;
    if (!_2326)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2516 = _2496;
    float _2518 = _2516;
    float _2520 = _2516;
    if (!_2326)
    {
        _2099 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2522 = _2099;
    out.m_95.z = _2508;
    out.m_95.w = _1960;
    out.m_97.x = _2504;
    out.m_97.y = _2506;
    out.m_97.z = _2510;
    out.m_97.w = _2494;
    bool _2524 = !_2326;
    float _2526 = _2522;
    float _2528 = _2522;
    if (!_2524)
    {
        bool _2530 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2532 = isnan(_1710);
        bool _2534 = _2530 || _2532;
        bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2538 = _2534 || _2536;
        if (!_2538)
        {
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2542 = _1710 + _2540;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2546 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2544;
            float _2548 = 1.0 / _2546;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2570 = _2542 * _2548;
            float _2572 = precise::clamp(_2570, 0.0, 1.0);
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2578 = fma(_2572, _2552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2572, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2582 = fma(_2572, _2556, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2584 = fma(_2572, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2586 = fma(_2572, _2564, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2588 = fma(_2572, _2568, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2424 = _2578;
            _2514 = _2586;
            _2414 = _2580;
            _2520 = _2584;
            _2500 = _2582;
            _2528 = _2588;
            _2590 = true;
        }
        else
        {
            bool _2592 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2594 = isnan(_1710);
            bool _2596 = _2592 || _2594;
            bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2600 = _2596 || _2598;
            if (!_2600)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2602 = _2412;
            _2414 = _2602;
            if (!_2600)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2604 = _2422;
            _2424 = _2604;
            if (!_2600)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2606 = _2498;
            _2500 = _2606;
            if (!_2600)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2608 = _2518;
            _2520 = _2608;
            if (!_2600)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2610 = _2512;
            _2514 = _2610;
            if (!_2600)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2612 = _2526;
            bool _2614 = !_2600;
            _2528 = _2612;
            if (!_2614)
            {
                bool _2616 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2618 = isnan(_1710);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2624 = _2620 || _2622;
                if (!_2624)
                {
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2628 = _1710 + _2626;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2632 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2630;
                    float _2634 = 1.0 / _2632;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2656 = _2628 * _2634;
                    float _2658 = precise::clamp(_2656, 0.0, 1.0);
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2664 = fma(_2658, _2638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2658, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2668 = fma(_2658, _2642, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2670 = fma(_2658, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2672 = fma(_2658, _2650, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2674 = fma(_2658, _2654, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2424 = _2664;
                    _2514 = _2672;
                    _2414 = _2666;
                    _2520 = _2670;
                    _2500 = _2668;
                    _2528 = _2674;
                    _2590 = true;
                }
                else
                {
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2590 = false;
    float _2676 = _2424;
    float _2678 = _2514;
    float _2680 = _2414;
    float _2682 = _2520;
    float _2684 = _2500;
    float _2686 = _2528;
    float _2688 = fma(_2364, -0.5, 0.5);
    float _2690 = precise::clamp(_2688, 0.0, 1.0);
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    float _2696 = -_2680;
    float _2698 = _2696 + _2682;
    float _2700 = -_2684;
    float _2702 = _2700 + _2686;
    bool _2704 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2706 = fma(_2690, _2694, _2676);
    float _2708 = fma(_2690, _2698, _2680);
    float _2710 = fma(_2690, _2702, _2684);
    float _2712 = _2706 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2714 = fma(_2708, 0.298911988735198974609375, _2712);
    float _2716 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2718 = fma(_2710, 0.114477999508380889892578125, _2714);
    out.m_93.w = _2716;
    float _2720 = -_2718;
    float _2722 = _2708 + _2720;
    float _2724 = -_2718;
    float _2726 = _2706 + _2724;
    float _2728 = -_2718;
    float _2730 = _2710 + _2728;
    out.m_99.x = 0.0;
    float _2732 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2734 = fma(_2726, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2736 = fma(_2730, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    out.m_101.x = 0.0;
    out.m_103.x = _2732;
    out.m_103.y = _2734;
    out.m_103.z = _2736;
    if (!_2704)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2738 = -_1680;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2742 = -_1682;
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2746 = -_1684;
    float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2750 = _2740 * _2740;
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = fma(_2748, _2748, _2752);
    float _2756 = rsqrt(_2754);
    float _2758 = _2740 * _2756;
    float _2760 = _2744 * _2756;
    float _2762 = _2748 * _2756;
    float _2764 = sqrt(_2754);
    float _2766 = -_1716;
    float _2768 = _2766 + _2758;
    float _2770 = -_1712;
    float _2772 = _2770 + _2760;
    float _2774 = -_1714;
    float _2776 = _2774 + _2762;
    float _2778 = _2768 * _2768;
    float _2780 = fma(_2772, _2772, _2778);
    float _2782 = fma(_2776, _2776, _2780);
    float _2784 = -_2764;
    float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2788 = rsqrt(_2782);
    float _2790 = _2786 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2792 = precise::clamp(_2790, 0.0, 1.0);
    float _2794 = abs(_2792);
    float _2796 = log2(_2794);
    float _2798 = _2768 * _2788;
    float _2800 = _2772 * _2788;
    float _2802 = _2776 * _2788;
    float _2804 = _2364 * _2798;
    float _2806 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2808 = precise::clamp(_2806, 0.0, 1.0);
    float _2810 = _2364 * _2758;
    float _2812 = fma(_2362, _2800, _2804);
    float _2814 = _2808 * _2808;
    float _2816 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2818 = fma(_2362, _2760, _2810);
    float _2820 = fma(_2370, _2802, _2812);
    float _2822 = precise::clamp(_2820, 0.0, 1.0);
    float _2824 = _2814 + (-1.0);
    float _2826 = fma(_2370, _2762, _2818);
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = _2822 * _2822;
    float _2832 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2834 = exp2(_2816);
    float _2836 = fma(_2830, _2824, 1.0);
    float _2838 = -_2758;
    float _2840 = -_2832;
    float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2840);
    float _2844 = _2836 * _2836;
    float _2846 = -_2762;
    float _2848 = fma(_2846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2842);
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2852 = _2848 + _2850;
    float _2854 = 1.0 / _2844;
    float _2856 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2858 = precise::clamp(_2856, 0.0, 1.0);
    float _2860 = _2834 * _2858;
    float _2862 = _2828 * _2860;
    float _2864 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2866 = _2814 * _2854;
    float _2868 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2870 = _2862 * _2866;
    float _2872 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2874 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2876 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2878 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2864;
    out.m_99.y = _2868;
    out.m_99.z = _2872;
    out.m_101.x = _2874;
    out.m_101.y = _2876;
    out.m_101.z = _2878;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

