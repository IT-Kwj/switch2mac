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
    float4 m_83 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_107 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_105 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_103 [[user(locn14)]];
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
    float4 m_79 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
    float4 m_95 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2892 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3178 = as_type<float>(_142);
        out.gl_Position.z = _3178;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_53.w;
    float _148 = float(_126);
    float _150 = -_146;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_146);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    bool _164 = _152 >= _148;
    bool _166 = !_162;
    bool _168 = _164 || _166;
    float _170 = _152;
    if (_168)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _134;
    if (_168)
    {
        out.m_51.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3242 = as_type<float>(_176);
        out.gl_Position.z = _3242;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = 1.0 / _148;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = _152 * _184;
    float _202 = _178 * _178;
    float _204 = _180 * _180;
    float _206 = _182 * _182;
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = fma(_194, _194, _208);
    float _216 = fma(_196, _196, _210);
    float _218 = fma(_198, _198, _212);
    float _220 = sqrt(_214);
    float _222 = in.m_61.x;
    float _224 = in.m_61.y;
    float _226 = in.m_61.z;
    float _228 = sqrt(_216);
    float _230 = sqrt(_218);
    bool _232 = _220 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = _190 * _224;
    float _238 = fma(_188, _222, _236);
    float _240 = _220;
    float _242 = _214;
    float _244 = _194;
    if (_232)
    {
        float _246 = rsqrt(_214);
        _240 = _246;
    }
    float _248 = _240;
    float _250 = 0.0;
    float _252 = 0.0;
    if (!_232)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _254 = _250;
    float _256 = _252;
    bool _258 = _230 > 0.0;
    float _260 = _180 * _224;
    float _262 = _196 * _224;
    float _264 = 0.0;
    float _266 = _256;
    float _268 = _254;
    if (!_232)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = fma(_192, _226, _238);
    float _274 = fma(_178, _222, _260);
    float _276 = 0.0;
    float _278 = _270;
    if (_234)
    {
        float _280 = rsqrt(_216);
        _276 = _280;
    }
    float _282 = _276;
    float _284 = fma(_194, _222, _262);
    float _286 = 0.0;
    float _288 = 0.0;
    if (!_234)
    {
        _286 = 0.0;
        _288 = 0.0;
    }
    float _290 = _286;
    float _292 = _288;
    float _294 = 0.0;
    float _296 = _290;
    float _298 = _292;
    if (!_234)
    {
        _294 = 0.0;
    }
    float _300 = _294;
    float _302 = fma(_182, _226, _274);
    float _304 = 0.0;
    float _306 = _300;
    float _308 = _302;
    if (!_258)
    {
        _304 = 0.0;
    }
    float _310 = _304;
    float _312 = 0.0;
    float _314 = _310;
    if (_258)
    {
        float _316 = rsqrt(_218);
        _312 = _316;
    }
    float _318 = _312;
    float _320 = 0.0;
    if (!_258)
    {
        _320 = 0.0;
    }
    float _322 = _320;
    float _324 = _322;
    if (_232)
    {
        float _326 = _248 * _178;
        _266 = _326;
    }
    float _328 = _266;
    if (!_258)
    {
        _242 = 0.0;
    }
    float _330 = _242;
    float _332 = _330;
    if (_232)
    {
        float _334 = _248 * _188;
        _268 = _334;
    }
    float _336 = _268;
    if (_232)
    {
        float _338 = _248 * _194;
        _278 = _338;
    }
    float _340 = _278;
    if (_234)
    {
        float _342 = _282 * _180;
        _306 = _342;
    }
    float _344 = _306;
    float _346 = fma(_198, _226, _284);
    if (_234)
    {
        float _348 = _282 * _190;
        _296 = _348;
    }
    float _350 = _296;
    if (_234)
    {
        float _352 = _282 * _196;
        _298 = _352;
    }
    float _354 = _298;
    if (_258)
    {
        float _356 = _318 * _182;
        _314 = _356;
    }
    float _358 = _314;
    if (_258)
    {
        float _360 = _318 * _192;
        _324 = _360;
    }
    float _362 = _324;
    if (_258)
    {
        float _364 = _318 * _198;
        _332 = _364;
    }
    float _366 = _332;
    bool _368 = !_186;
    float _386;
    if (!_368)
    {
        float _370 = in.m_63.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        _386 = _200;
    }
    _388 = false;
    float _390 = _386;
    float _392 = in.m_48.x;
    float _394 = in.m_48.y;
    float _396 = in.m_48.z;
    float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _400 = -_200;
    float _402 = _400 + 1.0;
    float _404 = in.m_63.z;
    float _406 = in.m_63.w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _390 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _390 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _424;
    float _428 = 1.0 / _414;
    float _430 = in.m_57.w;
    float _432 = _200 * _398;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = _402 * _398;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = 1.0 / _418;
    float _442 = in.m_63.x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = _190 * _394;
    float _454 = in.m_63.y;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _458 = _456 != 0;
    float _460 = 1.0 / _426;
    float _462 = _404 * 2.0;
    float _464 = fma(_188, _392, _452);
    float _466 = _196 * _394;
    float _468 = _422 * _428;
    float _470 = fma(_192, _396, _464);
    float _472 = fma(_194, _392, _466);
    float _474 = floor(_462);
    float _476 = precise::min(_434, _438);
    float _478 = _410 * _440;
    float _480 = fma(_198, _396, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _484 = _390 + _482;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _490 = log2(_488);
    float _492 = _396;
    float _494 = _394;
    int _496 = as_type<int>(_404);
    if (_458)
    {
        _244 = _442;
    }
    float _498 = _244;
    float _500 = _484 * _460;
    float _502 = _498;
    if (!_458)
    {
        _502 = _404;
    }
    float _504 = _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _508 = 1.0 + _506;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_458)
    {
        _492 = _454;
    }
    float _512 = _492;
    float _514 = fma(_446, _468, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _516 = _474 > 0.0;
    float _518 = _504 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _520 = _474 >= 0.0;
    bool _522 = isnan(_474);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = 1.0 / _508;
    float _532 = _512;
    if (!_458)
    {
        _532 = _442;
    }
    float _534 = _532;
    float _536 = -_510;
    float _538 = fma(_518, 2.0, _536);
    int _540 = _528 ? 0 : 1;
    float _542 = fma(_450, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _544 = _490 * _152;
    float _546 = _534 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _548 = ~_540;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -_152;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[86].x, _538);
    float _558 = fma(_546, -2.0, _486);
    float _560 = exp2(_544);
    int _562 = _552;
    if (!_516)
    {
        int _564 = ~_540;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = _454 * 2.0;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _574 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _558);
    bool _576 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _578 = isnan(1.0);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _584 = _580 || _582;
    float _586 = floor(_570);
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _602 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[88].z, _572);
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _614 = _612 != 0;
    float _616 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[88].w, _598);
    float _618 = fma(_600, _454, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _620 = -_560;
    float _622 = _620 + 1.0;
    float _624 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _602);
    float _626 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _616);
    float _628 = _618 * _152;
    bool _630 = !_610;
    int _632 = _630 ? 0 : 1;
    float _634 = _454 + _404;
    float _636 = _596 ? _622 : 0.0;
    float _638 = _442 + _404;
    bool _640 = !_606;
    int _642 = _640 ? 0 : 1;
    float _644 = _634 + (-1.0);
    float _646 = _624;
    if (_584)
    {
        float _648 = _636 * _530;
        _170 = _648;
    }
    float _650 = _170;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _658 = _656 != 0;
    float _660 = _442 * 2.0;
    bool _662 = _586 >= 0.0;
    bool _664 = isnan(_586);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _674 = _442 + _454;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _686 = _684 != 0;
    float _688 = _638 + (-1.0);
    int _690 = _670 ? 0 : 1;
    float _692 = floor(_660);
    bool _694 = _586 > 0.0;
    float _696 = _674 + (-1.0);
    int _698 = ~_690;
    int _700 = _698 + 1;
    int _702 = _700 + 1;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _706 = !_614;
    int _708 = _706 ? 0 : 1;
    float _710 = _470 + _430;
    bool _712 = !_686;
    int _714 = _712 ? 0 : 1;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _718 = in.m_59.w;
    bool _720 = !_654;
    int _722 = _720 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _724;
    bool _728 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _730 = isnan(_390);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    int _744 = _702;
    if (!_694)
    {
        int _746 = ~_690;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _764 = _762 != 0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _770 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _772 = _692 >= 0.0;
    bool _774 = isnan(_692);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _792 = _780 ? 0 : 1;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _796 = fma(_786, _468, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _798 = fma(_742, _468, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _800 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _802 = _692 > 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _804;
    float _808 = fma(_790, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _810;
    float _814 = fma(_768, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _816 = fma(_806, _500, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _818 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _820 = isnan(_390);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = fma(_812, _500, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _832 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _834 = fma(_726, _500, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _836 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _838 = isnan(_390);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -_828;
    float _850 = _848 + 1.0;
    float _852 = _832 * _716;
    float _854 = -_738;
    float _856 = _854 + 1.0;
    float _858 = _480 + _718;
    float _860 = _738 * _850;
    float _862 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _852);
    bool _864 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _866 = isnan(_390);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = _770 * _752;
    float _878 = -_846;
    float _880 = _878 + 1.0;
    float _882 = floor(_862);
    float _884 = _846 * _856;
    float _886 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].y, _876);
    float _888 = _874 * _880;
    float _890 = _782 * _794;
    float _892 = -_874;
    float _894 = _892 + 1.0;
    bool _896 = !_756;
    int _898 = _896 ? 0 : 1;
    float _900 = _796 * _888;
    float _902 = _514 * _888;
    float _904 = _798 * _888;
    float _906 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].z, _890);
    int _908 = ~_792;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].x, _900);
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].y, _902);
    float _918 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].z, _904);
    int _920 = _912;
    if (!_802)
    {
        int _922 = ~_792;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = floor(_886);
    float _930 = -_882;
    float _932 = _862 + _930;
    float _934 = _886 + 0.25;
    float _936 = fma(_808, _884, _914);
    float _938 = fma(_542, _884, _916);
    float _940 = fma(_814, _884, _918);
    bool _942 = !_760;
    int _944 = _942 ? 0 : 1;
    float _946 = fma(_816, _860, _936);
    float _948 = floor(_906);
    bool _950 = _932 >= 0.5;
    bool _952 = isnan(_932);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.5);
    bool _958 = _954 || _956;
    float _960 = _862 + 0.25;
    int _962 = abs(_898);
    float _964 = _862 * 6.283185482025146484375;
    int _966 = abs(_944);
    float _968 = fma(_442, 6.283185482025146484375, _628);
    float _970 = floor(_934);
    float _972 = float(_568);
    float _974 = -_928;
    float _976 = _886 + _974;
    float _978 = float(_962);
    float _980 = _886 * 6.283185482025146484375;
    float _982 = _906 + 0.25;
    float _984 = _978 * _972;
    float _986 = float(_926);
    float _988 = -_948;
    float _990 = _906 + _988;
    float _992 = float(_966);
    float _994 = floor(_960);
    bool _996 = !_958;
    float _998 = _996 ? 0.5 : (-0.5);
    float _1000 = _906 * 6.283185482025146484375;
    bool _1002 = _976 >= 0.5;
    bool _1004 = isnan(_976);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    float _1012 = -_970;
    float _1014 = _934 + _1012;
    int _1016 = abs(_722);
    float _1018 = _992 * _986;
    int _1020 = abs(_632);
    float _1022 = floor(_982);
    bool _1024 = _990 >= 0.5;
    bool _1026 = isnan(_990);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.5);
    bool _1032 = _1028 || _1030;
    float _1034 = _1000 * 0.15915493667125701904296875;
    bool _1036 = !_1010;
    float _1038 = _1036 ? 0.5 : (-0.5);
    float _1040 = _984 * (-2.0);
    float _1042 = _964 * 0.15915493667125701904296875;
    float _1044 = _998 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1046 = _1044 * 2.0;
    float _1048 = float(_1016);
    float _1050 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1052 = _1050 * 2.0;
    float _1054 = -_994;
    float _1056 = _960 + _1054;
    bool _1058 = !_682;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _980 * 0.15915493667125701904296875;
    float _1064 = _1048 * _1052;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1068 = _1066 != 0;
    float _1070 = _1042 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = -_1022;
    float _1076 = _982 + _1074;
    int _1078 = abs(_642);
    float _1080 = _968 * 0.15915493667125701904296875;
    int _1082 = abs(_1060);
    float _1084 = _1018 * (-2.0);
    bool _1086 = !_1032;
    float _1088 = _1086 ? 0.5 : (-0.5);
    float _1090 = -_476;
    float _1092 = _1090 + 1.0;
    float _1094 = _1062 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = float(_1020);
    float _1100 = fma(_672, _1084, _672);
    bool _1102 = _1056 > 0.5;
    float _1104 = fma(_830, _860, _938);
    float _1106 = _1098 * _1046;
    bool _1108 = !_1068;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = in.m_65.x;
    float _1114 = in.m_65.y;
    float _1116 = in.m_65.z;
    float _1118 = float(_1082);
    float _1120 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1122 = _1120 * 2.0;
    float _1124 = float(_1078);
    float _1126 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1128 = abs(_1110);
    float _1130 = _1118 * _1122;
    int _1132 = abs(_708);
    float _1134 = fma(_1124, _1126, _1106);
    float _1136 = _1056;
    float _1138 = _1014;
    float _1140 = _1076;
    if (_1102)
    {
        float _1142 = -_1056;
        float _1144 = _1142 + 1.0;
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1150 = _1014 > 0.5;
    float _1152 = in.m_67.z;
    float _1154 = float(_1128);
    float _1156 = fma(_1146, 4.0, -1.0);
    float _1158 = float(_1132);
    float _1160 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].x, _946);
    bool _1162 = !_658;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = fma(_1154, _1148, _1064);
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1170 = _1034 * 6.283185482025146484375;
    float _1172 = sin(_1170);
    float _1174 = in.m_67.x;
    float _1176 = fma(_1158, _1168, _1134);
    int _1178 = abs(_1164);
    if (_1150)
    {
        float _1180 = -_1014;
        float _1182 = _1180 + 1.0;
        _1138 = _1182;
    }
    float _1184 = _1138;
    bool _1186 = !_678;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_1176, 3.1415927410125732421875, _1112);
    bool _1192 = _1076 > 0.5;
    float _1194 = fma(_1184, 4.0, -1.0);
    int _1196 = abs(_1188);
    float _1198 = fma(_800, _1040, _800);
    float _1200 = float(_1196);
    float _1202 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1204 = float(_1178);
    float _1206 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1208 = fma(_1190, _1040, _1190);
    float _1210 = _442 + (-0.5);
    float _1212 = fma(_1200, _1206, _1130);
    float _1214 = fma(_1204, _1202, _1166);
    bool _1216 = !_764;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1208);
    float _1222 = _858 * _858;
    if (_1192)
    {
        float _1224 = -_1076;
        float _1226 = _1224 + 1.0;
        _1140 = _1226;
    }
    float _1228 = _1140;
    int _1230 = abs(_714);
    float _1232 = fma(_1214, 3.1415927410125732421875, _1114);
    int _1234 = abs(_1218);
    float _1236 = fma(_1198, _650, _1220);
    float _1238 = fma(_710, _710, _1222);
    float _1240 = fma(_1228, 4.0, -1.0);
    float _1242 = _1080 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = float(_1230);
    float _1248 = _454 + (-0.5);
    float _1250 = float(_750);
    float _1252 = fma(_1232, _1084, _1232);
    float _1254 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1256 = _1236 * 0.15915493667125701904296875;
    float _1258 = sqrt(_1238);
    float _1260 = float(_1234);
    float _1262 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1252);
    float _1264 = fma(_1246, _1254, _1212);
    float _1266 = in.m_67.y;
    float _1268 = _1260 * _1250;
    float _1270 = fma(_1100, _650, _1262);
    float _1272 = fma(_1264, 3.1415927410125732421875, _1116);
    float _1274 = abs(_1244);
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1278 = _1268 * (-2.0);
    float _1280 = in.m_69.x;
    float _1282 = in.m_69.y;
    float _1284 = in.m_69.z;
    float _1286 = _1270 * 0.15915493667125701904296875;
    float _1288 = _1256 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = fma(_704, _1278, _704);
    float _1294 = fma(_1272, _1278, _1272);
    float _1296 = _404 + (-0.5);
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1294);
    float _1300 = fma(_834, _860, _940);
    float _1302 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1276);
    float _1304 = _1286 * 6.283185482025146484375;
    float _1306 = sin(_1304);
    float _1308 = fma(_1292, _650, _1298);
    float _1310 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1104);
    float _1312 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1300);
    float _1314 = _1308 * 0.15915493667125701904296875;
    float _1316 = -_1302;
    float _1318 = _1316 + _1266;
    float _1320 = _1286 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1318);
    float _1326 = _1160 * _1280;
    float _1328 = _1310 * _1282;
    float _1330 = _1312 * _1284;
    float _1332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1174);
    float _1334 = _1256 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1340 = _660 + (-1.0);
    float _1342 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1338 * _1332;
    float _1348 = _1290 * _1306;
    float _1350 = _1340 * _1258;
    float _1352 = _1314 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1290 * _1322;
    float _1358 = _1342 * _1324;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1362 = _1350 * 0.75;
    float _1364 = _1344 * _1360;
    float _1366 = _1314 * 6.283185482025146484375;
    float _1368 = sin(_1366);
    float _1370 = _1336 * _1306;
    float _1372 = _1336 * _1322;
    float _1374 = _1362 * 0.15915493667125701904296875;
    float _1376 = _1290 * _1354;
    float _1378 = _1336 * _1354;
    float _1380 = _1322 * _1354;
    float _1382 = _1306 * _1354;
    float _1384 = _1376 * _1358;
    float _1386 = _1378 * _1358;
    float _1388 = _1374 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = fma(_1368, _1356, _1370);
    float _1394 = -_1348;
    float _1396 = fma(_1368, _1372, _1394);
    float _1398 = -_1372;
    float _1400 = fma(_1368, _1348, _1398);
    float _1402 = -_1358;
    float _1404 = _1368 * _1402;
    float _1406 = fma(_1392, _1346, _1384);
    float _1408 = fma(_1396, _1346, _1386);
    float _1410 = fma(_1368, _1370, _1356);
    float _1412 = fma(_1380, _1346, _1404);
    float _1414 = fma(_1400, _1364, _1406);
    float _1416 = _1374 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = fma(_1410, _1364, _1408);
    float _1422 = fma(_1382, _1364, _1412);
    float _1424 = _1414 * _350;
    float _1426 = _1414 * _354;
    float _1428 = _1414 * _344;
    float _1430 = fma(_1422, _336, _1424);
    float _1432 = fma(_1422, _340, _1426);
    float _1434 = fma(_1422, _328, _1428);
    float _1436 = fma(_1420, _362, _1430);
    float _1438 = fma(_1420, _366, _1432);
    float _1440 = fma(_1420, _358, _1434);
    float _1442 = _1436 * _1390;
    float _1444 = _1436 * _1418;
    float _1446 = -_1442;
    float _1448 = fma(_1438, _1418, _1446);
    float _1450 = fma(_1438, _1390, _1444);
    float _1452 = in.m_71.y;
    float _1454 = _858 + _1448;
    float _1456 = _710 + _1450;
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1460 = _1454 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1464 = _1456 + _1462;
    float _1466 = _1460 * _1460;
    float _1468 = fma(_1464, _1464, _1466);
    float _1470 = sqrt(_1468);
    float _1472 = _394 + _1452;
    float _1474 = _1472 + _1440;
    bool _1476 = _1470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1470 + _1478;
    float _1482 = _1390;
    float _1484 = _1422;
    float _1486 = _1434;
    float _1488 = _1470;
    float _1490 = _1480;
    float _1492 = _1244;
    if (_1476)
    {
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1494;
    }
    float _1496 = _1482;
    if (_1476)
    {
        float _1498 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _494 = _1498;
    }
    float _1500 = _494;
    float _1502 = _1500;
    if (!_1476)
    {
        _1484 = _1456;
    }
    float _1504 = _1484;
    float _1506 = _1504;
    if (_1476)
    {
        float _1508 = rsqrt(_1468);
        _1486 = _1508;
    }
    float _1510 = _1486;
    if (_1476)
    {
        float _1512 = _1480 * _1496;
        _1488 = _1512;
    }
    float _1514 = _1488;
    if (_1476)
    {
        float _1516 = _1514 * 0.15915493667125701904296875;
        _1490 = _1516;
    }
    float _1518 = _1490;
    float _1520 = _1514;
    if (_1476)
    {
        float _1522 = _1518 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = _1526;
    if (_1476)
    {
        float _1530 = fma(_1526, _1500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1528 = _1530;
    }
    float _1532 = _1528;
    float _1534 = _1532;
    if (!_1476)
    {
        _1502 = _1454;
    }
    float _1536 = _1502;
    float _1538 = _1536;
    if (_1476)
    {
        float _1540 = _1510 * _1532;
        _1534 = _1540;
    }
    float _1542 = _1534;
    float _1544 = _1542;
    if (_1476)
    {
        float _1546 = fma(_1460, _1542, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1538 = _1546;
    }
    float _1548 = _1538;
    float _1550 = _1548;
    if (_1476)
    {
        float _1552 = fma(_1464, _1542, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1506 = _1552;
    }
    float _1554 = _1506;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1562 = _1554 + _1560;
    float _1564 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1566 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5264 = float2(_1566, _1564);
    float _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5264, float2(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5264, float2(0.0), isnan(_5264)), level(0.0)).x;
    float _1570 = _1440;
    float _1572 = _1562;
    float _1574 = _1554;
    if (_1476)
    {
        float _1576 = _1518 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1570 = _1578;
    }
    float _1580 = _1570;
    if (!_1476)
    {
        _1544 = _1474;
    }
    float _1582 = _1544;
    float _1584 = -_710;
    float _1586 = _1584 + _1554;
    float _1588 = -_858;
    float _1590 = _1588 + _1548;
    bool _1592 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1600 = _1596 || _1598;
    float _1602 = _1582;
    if (_1476)
    {
        float _1604 = _1580 + (-1.0);
        _1572 = _1604;
    }
    float _1606 = _1572;
    float _1608 = _1606;
    if (_1476)
    {
        float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_1476)
    {
        float _1614 = fma(_1474, _1580, _1612);
        _1602 = _1614;
    }
    float _1616 = _1602;
    float _1618 = -_1472;
    float _1620 = _1618 + _1616;
    float _1622 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1624 = _1620 * _1620;
    float _1626 = fma(_1586, _1586, _1624);
    float _1628 = fma(_1590, _1590, _1626);
    float _1630 = sqrt(_1628);
    float _1632 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1634 = floor(_1632);
    float _1636 = floor(_1622);
    bool _1638 = _1630 > 0.0;
    float _1640 = -_1634;
    float _1642 = _1632 + _1640;
    float _1644 = -_1636;
    float _1646 = _1622 + _1644;
    float _1648 = fma(_1568, 100.0, _1616);
    float _1650 = fma(_1568, 100.0, _1472);
    float _1652 = _1616;
    float _1654 = _1632;
    float _1656 = _1628;
    if (!_1638)
    {
        _1652 = _1548;
    }
    float _1658 = _1652;
    float _1660 = _1658;
    if (!_1638)
    {
        _1654 = _1648;
    }
    float _1662 = _1654;
    bool _1664 = !_1638;
    float _1666 = _1662;
    if (!_1664)
    {
        float _1668 = _302 * _302;
        float _1670 = fma(_272, _272, _1668);
        float _1672 = rsqrt(_1628);
        float _1674 = fma(_346, _346, _1670);
        float _1676 = sqrt(_1674);
        float _1678 = _1586 * _1672;
        float _1680 = _1620 * _1672;
        float _1682 = _1590 * _1672;
        bool _1684 = _1676 > 0.0;
        float _1686 = _1676;
        float _1688 = _1672;
        if (!_1684)
        {
            _1686 = _1648;
        }
        float _1690 = _1686;
        _1666 = _1690;
        if (!_1684)
        {
            _1688 = _1548;
        }
        float _1692 = _1688;
        bool _1694 = !_1684;
        _1660 = _1692;
        if (!_1694)
        {
            float _1696 = rsqrt(_1674);
            float _1698 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1700 = _302 * _1696;
            float _1702 = _272 * _1696;
            float _1704 = _346 * _1696;
            float _1706 = _1680 * _1700;
            float _1708 = fma(_1678, _1702, _1706);
            float _1710 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1712 = fma(_1682, _1704, _1708);
            float _1714 = _1712 * _1710;
            float _1716 = fma(_272, _1714, _1554);
            float _1718 = fma(_302, _1714, _1648);
            float _1720 = fma(_346, _1714, _1548);
            _1666 = _1718;
            _1574 = _1716;
            _1660 = _1720;
            _1656 = _1698;
        }
    }
    float _1722 = _1666;
    float _1724 = _1574;
    float _1726 = _1660;
    float _1728 = _1656;
    float _1730 = _1724;
    float _1732 = _1726;
    float _1734 = _1728;
    if (_1600)
    {
        _1550 = _1722;
    }
    float _1736 = _1550;
    float _1738 = _1736;
    if (!_1600)
    {
        float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1742 = _1650 + _1740;
        float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1746 = _710 + _1744;
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1750 = -_710;
        float _1752 = _1750 + _1724;
        float _1754 = _1742 * _1742;
        float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1758 = _858 + _1756;
        float _1760 = -_1650;
        float _1762 = _1760 + _1722;
        float _1764 = fma(_1746, _1746, _1754);
        float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1768 = fma(_1758, _1758, _1764);
        float _1770 = sqrt(_1768);
        float _1772 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1774 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1776 = _1774 * _1766;
        float _1778 = -_858;
        float _1780 = _1778 + _1726;
        float _1782 = _1772 * _1776;
        float _1784 = fma(_1752, _1782, _710);
        float _1786 = fma(_1762, _1782, _1650);
        float _1788 = fma(_1780, _1782, _858);
        _1738 = _1786;
        _1730 = _1784;
        _1732 = _1788;
        _1734 = _1782;
    }
    float _1790 = _1738;
    float _1792 = _1730;
    float _1794 = _1732;
    float _1796 = _1734;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1800 = _1790 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1792 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1808 = _1794 + _1806;
    float _1810 = _1800 * _1800;
    float _1812 = in.m_73.y;
    float _1814 = fma(_1804, _1804, _1810);
    float2 _5650 = float2(_1642, _1646);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5650, float2(0.0), isnan(_5650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5650, float2(0.0), isnan(_5650)), level(0.0)).x;
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1820 = _1818 != 0;
    float _1822 = in.m_73.x;
    float _1824 = fma(_1808, _1808, _1814);
    float _1826 = rsqrt(_1824);
    float _1828 = sqrt(_1824);
    float _1830 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1832 = _1804 * _1830;
    float _1834 = _1808 * _1830;
    float _1836 = _1832 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 + _1838;
    float _1842 = sqrt(_1840);
    bool _1844 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = _1842 + _1846;
    float _1850 = _1808;
    float _1852 = _1826;
    float _1854 = _1848;
    float _1856 = _1810;
    float _1858 = _1800;
    if (_1844)
    {
        float _1860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1850 = _1860;
    }
    float _1862 = _1850;
    if (_1844)
    {
        float _1864 = rsqrt(_1840);
        _1852 = _1864;
    }
    float _1866 = _1852;
    float _1868 = _1866;
    if (_1844)
    {
        float _1870 = _1848 * _1862;
        _1854 = _1870;
    }
    float _1872 = _1854;
    if (_1844)
    {
        float _1874 = _1872 * 0.15915493667125701904296875;
        _1856 = _1874;
    }
    float _1876 = _1856;
    float _1878 = _1862;
    float _1880 = _1876;
    if (_1844)
    {
        float _1882 = _1876 * 6.283185482025146484375;
        float _1884 = sin(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1890 = precise::max(0.0, _1888);
    float _1892 = _1796;
    float _1894 = _1890;
    if (_1844)
    {
        float _1896 = _1876 * 6.283185482025146484375;
        float _1898 = cos(_1896);
        _1892 = _1898;
    }
    float _1900 = _1892;
    float _1902 = -_1830;
    float _1904 = -_1890;
    float _1906 = fma(_1800, _1902, _1904);
    if (!_1844)
    {
        _1858 = _1834;
    }
    float _1908 = _1858;
    float _1910 = _1908;
    if (_1844)
    {
        float _1912 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1894 = _1912;
    }
    float _1914 = _1894;
    float _1916 = _1914;
    if (!_1844)
    {
        _1880 = _1836;
    }
    float _1918 = _1880;
    float _1920 = _1886;
    float _1922 = _1918;
    if (_1844)
    {
        float _1924 = fma(_1886, _1914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = _1926;
    if (_1844)
    {
        float _1930 = _1900 + (-1.0);
        _1916 = _1930;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1844)
    {
        float _1936 = _1866 * _1926;
        _1492 = _1936;
    }
    float _1938 = _1492;
    if (!_1844)
    {
        _1928 = _1832;
    }
    float _1940 = _1928;
    float _1942 = _1940;
    if (_1844)
    {
        float _1944 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _308 = _1944;
    }
    float _1946 = _308;
    if (_1844)
    {
        float _1948 = _1832 * _1938;
        _1942 = _1948;
    }
    float _1950 = _1942;
    if (!_1844)
    {
        _1868 = _1906;
    }
    float _1952 = _1868;
    float _1954 = _1952;
    if (_1844)
    {
        float _1956 = _1834 * _1938;
        _1910 = _1956;
    }
    float _1958 = _1910;
    if (_1844)
    {
        float _1960 = fma(_1906, _1900, _1946);
        _1954 = _1960;
    }
    float _1962 = _1954;
    if (_1844)
    {
        float _1964 = _1950 * _1950;
        _1922 = _1964;
    }
    float _1966 = _1922;
    if (!_1844)
    {
        _1934 = _1838;
    }
    float _1968 = _1934;
    float _1970 = _1968;
    if (_1844)
    {
        float _1972 = _1958 * _1958;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = fma(_1962, _1962, _1966);
    float _1978 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1980 = _1976 + _1974;
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1984 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1982);
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1990 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1978);
    float _1992 = rsqrt(_1980);
    float _1994 = -_1986;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1990);
    float _2000 = _1988 * _442;
    float _2002 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2004 = abs(_1996);
    float _2006 = log2(_2004);
    float _2008 = _1992 * _1950;
    float _2010 = _1992 * _1962;
    float _2012 = trunc(_2000);
    int _2014 = int(_2012);
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = _1992 * _1958;
    float _2020 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2022 = -_2016;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2022);
    float _2026 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2028 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = _2020 * _442;
    float _2032 = -_2018;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2024);
    float _2036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2038 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2040 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_2034, -0.5, 0.5);
    float _2044 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2026);
    float _2046 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2038);
    float _2048 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2050 = fma(_2034, 0.5, 0.5);
    float _2052 = sqrt(_2042);
    float _2054 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2056 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2044);
    int _2060 = _2014 << 4;
    int _2062 = _2060 + 1712;
    float _2064 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2066 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2068 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2070 = exp2(_2028);
    float _2072 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2074 = fma(_2050, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2076 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2072);
    float _2080 = _2010 + 1.0;
    float _2082 = -_2076;
    float _2084 = fma(_2082, _2036, 1.0);
    float _2086 = trunc(_2030);
    int _2088 = int(_2086);
    float _2090 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2078);
    float _2092 = fma(_2050, _2074, -0.212114393711090087890625);
    float _2094 = _2052 * 0.636619746685028076171875;
    float _2096 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2090);
    float _2098 = fma(_2050, _2092, 1.570728778839111328125);
    float _2100 = log2(_2084);
    float _2102 = -_2010;
    float _2104 = fma(_2070, _2080, _2102);
    float _2106 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2108 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2110 = -_2098;
    float _2112 = fma(_2094, _2110, 1.0);
    float _2114 = fma(_2104, 0.5, 0.5);
    float _2116 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2108);
    float _2118 = 1.0 / _2096;
    float _2120 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2106);
    int _2122 = _2088 << 4;
    int _2124 = _2122 + 1968;
    float _2126 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2116);
    float _2128 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2120);
    float _2130 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2126);
    float _2132 = _2100 * 0.693147182464599609375;
    float _2134 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2128);
    uint _2137 = uint(int(uint(_2124) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    float _2153 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2134 * _2118;
    float _2157 = _2130 * _2118;
    uint _2159 = uint(int(uint(_2062) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    float _2175 = fma(_2155, 0.5, 0.5);
    float _2177 = fma(_2157, -0.5, 0.5);
    float3 _6255 = float3(_2175, _2177, _2153);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6255, float3(0.0), isnan(_6255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6255, float3(0.0), isnan(_6255)), level(0.0)).x;
    float3 _6266 = float3(_2175, _2177, _2153);
    float4 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6266, float3(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6266, float3(0.0), isnan(_6266)), level(0.0)).xyzw;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = _2182.w;
    float2 _6282 = float2(_2112, _2114);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6282, float2(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6282, float2(0.0), isnan(_6282)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    int _2202 = _2062 + 8;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    float _2212 = 0.0;
    int _2214 = as_type<int>(_2175);
    float _2216 = _1812;
    float _2218 = as_type<float>(_2062);
    float _2220 = _2153;
    float _2222 = _2134;
    if (_1820)
    {
        float _2224 = in.m_63.z;
        _2212 = _2224;
    }
    float _2226 = _2212;
    int _2228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2230 = _2228 != 0;
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2234 = _406 > 0.5;
    float _2236 = -_1812;
    float _2238 = _2236 + 1.0;
    bool _2240 = _404 > 0.5;
    float _2242 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2244 = _2124 + 8;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    bool _2254 = _454 > 0.5;
    out.m_75.x = _1792;
    out.m_75.y = _1790;
    out.m_75.z = _1794;
    int _2256 = _2240 ? as_type<int>(_2238) : as_type<int>(_1812);
    float _2258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2262 = _2260 != 0;
    bool _2264 = _2262;
    float _2266 = _1822;
    if (_1820)
    {
        float _2268 = -_1822;
        float _2270 = _2268 + 1.0;
        _2214 = as_type<int>(_2270);
    }
    int _2272 = _2214;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2276 = _2274 != 0;
    int _2278 = _2254 ? as_type<int>(_2238) : as_type<int>(_1812);
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2282 = _2280 != 0;
    float _2284 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2286 = _2262 ? as_type<float>(_2256) : _1812;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2290 = _2276 ? as_type<float>(_2278) : _1812;
    bool _2292 = _2276;
    if (_2230)
    {
        float _2294 = _2234 ? _2238 : _1812;
        _2216 = _2294;
    }
    float _2296 = _2216;
    int _2298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2300 = _2298 != 0;
    float _2302 = fma(_2286, _2284, -0.5);
    if (_1820)
    {
        bool _2304 = _2226 > 0.5;
        _2292 = _2304;
    }
    bool _2306 = _2292;
    float _2308 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1820)
    {
        _2218 = _1822;
    }
    float _2310 = _2218;
    float _2312 = _2310;
    if (_2282)
    {
        float _2314 = -_1822;
        float _2316 = _2314 + 1.0;
        _496 = as_type<int>(_2316);
    }
    int _2318 = _496;
    if (_2282)
    {
        bool _2320 = _442 > 0.5;
        _2264 = _2320;
    }
    bool _2322 = _2264;
    float _2324 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1820)
    {
        float _2326 = _2306 ? as_type<float>(_2272) : _1822;
        _2312 = _2326;
    }
    float _2328 = _2312;
    float _2330 = -_574;
    float _2332 = fma(_626, _2302, _2330);
    float _2334 = _2332;
    if (!_2282)
    {
        _2220 = _1822;
    }
    float _2336 = _2220;
    float _2338 = _2165 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2340 = _2336;
    int _2342 = as_type<int>(_2165);
    if (_2282)
    {
        float _2344 = _2322 ? as_type<float>(_2318) : _1822;
        _2340 = _2344;
    }
    float _2346 = _2340;
    if (_2300)
    {
        float _2348 = -_1822;
        float _2350 = _2348 + 1.0;
        _2342 = as_type<int>(_2350);
    }
    int _2352 = _2342;
    float _2354 = in.m_77.x;
    float _2356 = in.m_77.y;
    float _2358 = in.m_77.z;
    float _2360 = -_1302;
    float _2362 = -_1266;
    bool _2364 = _2360 != _2362;
    bool _2366 = isnan(_2360);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(_2362);
    bool _2372 = _2368 || _2370;
    float _2374 = _2173 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2376 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2300)
    {
        float _2378 = _2254 ? as_type<float>(_2352) : _1822;
        _2266 = _2378;
    }
    float _2380 = _2266;
    float _2382 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2384 = _1174 == 0.0;
    bool _2386 = !_2372;
    bool _2388 = _2384 && _2386;
    float _2390 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2392 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2394 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2398 = fma(_2382, _2380, -0.5);
    bool _2400 = _1152 == 0.0;
    bool _2402 = _2400 && _2388;
    float _2404 = in.m_79.x;
    float _2406 = in.m_79.y;
    float _2408 = in.m_79.z;
    float _2410 = in.m_79.w;
    float _2412 = _2252 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2414 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2416 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2418 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2420 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2426 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2428 = fma(_624, _2398, _556);
    out.m_81.x = _2394;
    out.m_81.y = _2376;
    out.m_81.z = _2420;
    float _2430 = _2418;
    float _2432 = _2420;
    if (_2402)
    {
        _646 = _2354;
    }
    float _2434 = _646;
    float _2436 = _2434;
    if (!_2402)
    {
        float _2438 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2354);
        _2436 = _2438;
    }
    float _2440 = _2436;
    float _2442 = -_1816;
    float _2444 = _2442 + 1.0;
    out.m_83.x = _2414;
    out.m_83.y = _2392;
    out.m_83.z = _2416;
    out.m_83.w = _2422;
    float _2446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2448 = _2328 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2450 = _2428 + 0.5;
    float _2452 = exp2(_2242);
    float _2454 = _2418 * _2288;
    float _2456 = _2288;
    if (_2402)
    {
        _2456 = _2356;
    }
    float _2458 = _2456;
    float _2460 = _2448 * _2396;
    float _2462 = _2332 + 0.5;
    float _2464 = _2458;
    if (_2402)
    {
        _2334 = _2358;
    }
    float _2466 = _2334;
    float _2468 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2470 = _2466;
    if (_2402)
    {
        _2430 = _2458;
    }
    float _2472 = _2430;
    float _2474 = _2426 * _2424;
    float _2476 = _2472;
    if (!_2402)
    {
        _2464 = _2356;
    }
    float _2478 = _2464;
    float _2480 = _2468 * _2446;
    if (_2402)
    {
        _2432 = _2466;
    }
    float _2482 = _2432;
    out.m_85.x = _2450;
    out.m_85.y = _2462;
    float _2484 = _2482;
    if (!_2402)
    {
        _2470 = _2358;
    }
    float _2486 = _2470;
    if (!_2402)
    {
        float _2488 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2478);
        _2476 = _2488;
    }
    float _2490 = _2476;
    float _2492 = _2408 * _2354;
    float _2494 = _2404 * _2478;
    out.m_87.x = _2454;
    out.m_87.y = _2474;
    out.m_87.z = _2460;
    out.m_87.w = _2480;
    float _2496 = _2406 * _2486;
    float _2498 = -_2492;
    float _2500 = fma(_2404, _2486, _2498);
    if (!_2402)
    {
        float _2502 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2486);
        _2484 = _2502;
    }
    float _2504 = _2484;
    float _2506 = -_2494;
    float _2508 = fma(_2406, _2354, _2506);
    float _2510 = -_2496;
    float _2512 = fma(_2408, _2478, _2510);
    float _2514 = _2500 * _2410;
    float _2516 = -_2490;
    float _2518 = _1368 * _2516;
    float _2520 = _2508 * _2410;
    float _2522 = _2512 * _2410;
    float _2524 = _1376 * _2514;
    float _2526 = _1376 * _2406;
    float _2528 = _1378 * _2490;
    float _2530 = fma(_1380, _2440, _2518);
    float _2532 = _1376 * _2490;
    float _2534 = -_2514;
    float _2536 = _1368 * _2534;
    float _2538 = -_2406;
    float _2540 = _1368 * _2538;
    float _2542 = _1378 * _2514;
    float _2544 = fma(_1392, _2440, _2532);
    float _2546 = fma(_1380, _2522, _2536);
    float _2548 = fma(_1392, _2522, _2524);
    float _2550 = fma(_1380, _2404, _2540);
    float _2552 = fma(_1396, _2522, _2542);
    float _2554 = fma(_1392, _2404, _2526);
    float _2556 = fma(_1400, _2504, _2544);
    float _2558 = fma(_1396, _2440, _2528);
    float _2560 = _1378 * _2406;
    float _2562 = fma(_1382, _2504, _2530);
    float _2564 = fma(_1382, _2408, _2550);
    float _2566 = fma(_1400, _2408, _2554);
    float _2568 = _2556 * _350;
    float _2570 = fma(_1410, _2504, _2558);
    float _2572 = fma(_1400, _2520, _2548);
    float _2574 = _2556 * _344;
    float _2576 = fma(_1396, _2404, _2560);
    float _2578 = _2556 * _354;
    float _2580 = fma(_1382, _2520, _2546);
    float _2582 = _2566 * _350;
    float _2584 = _2566 * _344;
    float _2586 = fma(_2562, _336, _2568);
    float _2588 = _2572 * _350;
    float _2590 = _2572 * _344;
    float _2592 = fma(_2562, _328, _2574);
    float _2594 = _2572 * _354;
    float _2596 = _2566 * _354;
    float _2598 = fma(_2562, _340, _2578);
    float _2600 = fma(_1410, _2408, _2576);
    float _2602 = fma(_2564, _336, _2582);
    float _2604 = fma(_2570, _362, _2586);
    float _2606 = fma(_1410, _2520, _2552);
    float _2608 = fma(_2580, _336, _2588);
    float _2610 = fma(_2580, _328, _2590);
    float _2612 = fma(_2564, _328, _2584);
    float _2614 = fma(_2570, _358, _2592);
    float _2616 = fma(_2580, _340, _2594);
    float _2618 = fma(_2564, _340, _2596);
    float _2620 = fma(_2570, _366, _2598);
    float _2622 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2624 = fma(_2600, _362, _2602);
    float _2626 = fma(_2606, _362, _2608);
    float _2628 = fma(_2606, _358, _2610);
    float _2630 = fma(_2600, _358, _2612);
    float _2632 = fma(_2606, _366, _2616);
    float _2634 = fma(_2600, _366, _2618);
    float _2636 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2622);
    float _2638 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_89.x = _2604;
    out.m_89.y = _2614;
    out.m_89.z = _2620;
    bool _2640 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2642 = isnan(_1828);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2648 = _2644 || _2646;
    float _2650 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2636);
    float _2652 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2638);
    out.m_91.x = _2626;
    out.m_91.y = _2628;
    out.m_91.z = _2632;
    float _2654 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2656 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2652);
    out.m_93.x = _2624;
    out.m_93.y = _2630;
    out.m_93.z = _2634;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2660 = in.m_95.x;
    float _2662 = _2658 + _2654;
    float _2664 = 1.0 / _2654;
    float _2666 = in.m_71.x;
    float _2668 = in.m_95.y;
    float _2670 = in.m_95.w;
    float _2672 = _2662 * _2664;
    float _2674 = _2672 * 0.5;
    float _2676 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2678 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2676);
    out.m_97.x = _2660;
    float _2680 = 1.0 / _2678;
    out.m_97.y = _2668;
    out.m_97.w = _2670;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2684 = _2680 * _2682;
    float _2686 = abs(_2684);
    float _2688 = log2(_2686);
    bool _2690 = _2684 <= 8000.0;
    bool _2692 = isnan(_2684);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan(8000.0);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2704 = exp2(_2702);
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = fma(_2708, -2.0, 3.0);
    float _2712 = _2708 * _2708;
    float _2714 = in.m_95.z;
    float _2716 = _2712 * _2710;
    float _2718 = -_2716;
    float _2720 = _2718 + 1.0;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2716);
    float _2724 = _2700 * _2722;
    float _2726 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2728 = -_2452;
    float _2730 = _2728 + 1.0;
    float _2732 = _2444 * _2726;
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2738 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2740 = _2134 + _2096;
    float _2742 = -_2734;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2736);
    float _2748 = _2738 * _2179;
    float _2750 = _2096 * 0.5;
    float _2752 = _2744 * _2666;
    float _2754 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2746);
    float _2756 = _2190 * _2748;
    float _2758 = _2200 * _2748;
    float _2760 = -_2738;
    float _2762 = _2760 + 1.0;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2754);
    float _2766 = fma(_2196, _2756, _2184);
    float _2768 = fma(_2198, _2756, _2186);
    float _2770 = _2740 * 0.5;
    float _2772 = _2764 + _2096;
    float _2774 = fma(_2130, -0.5, _2750);
    float _2776 = _2190 * _2762;
    float _2778 = _2752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2780 = _2772 * 0.5;
    float _2782 = fma(_2190, _2758, _2188);
    out.m_97.z = _2714;
    float _2784 = _2738;
    float _2786 = _2762;
    float _2788 = _2750;
    float _2790 = _2740;
    float _2792 = _2714;
    if (!_2648)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2794 = _2784;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2648)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2800 = _2786;
    out.m_99.x = _2770;
    out.m_99.y = _2774;
    out.m_99.z = _2780;
    out.m_99.w = _2096;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2648)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2806 = _2788;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2648)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2812 = _2790;
    out.m_101.x = _2778;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2648)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2818 = _2792;
    out.m_103.x = _2766;
    out.m_103.y = _2768;
    out.m_103.z = _2782;
    out.m_103.w = _2776;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2130;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2096;
    float _2820 = _2818;
    float _2822 = _2818;
    if (!_2648)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2824 = _2222;
    bool _2826 = !_2648;
    float _2828 = _2824;
    float _2830 = _2824;
    if (!_2826)
    {
        bool _2832 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_1828);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _1828 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2846;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2854 = 1.0 / _2848;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2872 = _2844 * _2854;
            float _2874 = precise::clamp(_2872, 0.0, 1.0);
            float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2880 = fma(_2874, _2852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2798 = _2884;
            _2830 = _2888;
            _2822 = _2880;
            _2810 = _2886;
            _2804 = _2882;
            _2816 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_1828);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2820;
            _2822 = _2904;
            if (!_2902)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2796;
            _2798 = _2906;
            if (!_2902)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2802;
            _2804 = _2908;
            if (!_2902)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2808;
            _2810 = _2910;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2828;
            _2830 = _2912;
            if (!_2902)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2814;
            bool _2916 = !_2902;
            _2816 = _2914;
            if (!_2916)
            {
                bool _2918 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_1828);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _1828 + _2928;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2932;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2940 = 1.0 / _2934;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2958 = _2930 * _2940;
                    float _2960 = precise::clamp(_2958, 0.0, 1.0);
                    float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2966 = fma(_2960, _2938, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2968 = fma(_2960, _2964, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2970 = fma(_2960, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2972 = fma(_2960, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2974 = fma(_2960, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2976 = fma(_2960, _2956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2798 = _2970;
                    _2830 = _2974;
                    _2822 = _2966;
                    _2810 = _2972;
                    _2804 = _2968;
                    _2816 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2798;
    float _2980 = _2830;
    float _2982 = _2822;
    float _2984 = _2810;
    float _2986 = _2804;
    float _2988 = _2816;
    float _2990 = fma(_2614, -0.5, 0.5);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2978;
    float _2996 = _2994 + _2980;
    float _2998 = -_2982;
    float _3000 = _2998 + _2984;
    float _3002 = -_2986;
    float _3004 = _3002 + _2988;
    bool _3006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3008 = fma(_2992, _2996, _2978);
    float _3010 = fma(_2992, _3000, _2982);
    float _3012 = fma(_2992, _3004, _2986);
    float _3014 = _3008 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3016 = fma(_3010, 0.298911988735198974609375, _3014);
    float _3018 = fma(_3012, 0.114477999508380889892578125, _3016);
    out.m_105.x = 0.0;
    float _3020 = -_3018;
    float _3022 = _3010 + _3020;
    float _3024 = -_3018;
    float _3026 = _3008 + _3024;
    float _3028 = -_3018;
    float _3030 = _3012 + _3028;
    float _3032 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3034 = fma(_3022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    float _3036 = fma(_3026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    float _3038 = fma(_3030, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    out.m_101.w = _3032;
    out.m_107.x = _3034;
    out.m_107.y = _3036;
    out.m_107.z = _3038;
    if (!_3006)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3040 = -_1790;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1792;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1794;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3052 = _3042 * _3042;
    float _3054 = fma(_3046, _3046, _3052);
    float _3056 = fma(_3050, _3050, _3054);
    float _3058 = sqrt(_3056);
    float _3060 = rsqrt(_3056);
    float _3062 = -_3058;
    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3068 = precise::clamp(_3066, 0.0, 1.0);
    float _3070 = _3046 * _3060;
    float _3072 = _3042 * _3060;
    float _3074 = abs(_3068);
    float _3076 = log2(_3074);
    float _3078 = _3050 * _3060;
    float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3082 = _2614 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2604, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2620, _3078, _3090);
    float _3098 = precise::clamp(_3096, 0.0, 1.0);
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3102 = _3094 + _3100;
    float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = exp2(_3104);
    float _3112 = _3110 * _3108;
    float _3114 = _3098 * _3112;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_105.x = _3116;
    out.m_105.y = _3118;
    out.m_105.z = _3120;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2892 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3178 = as_type<float>(_142);
        out.gl_Position.z = _3178;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_53.w;
    float _148 = float(_126);
    float _150 = -_146;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_146);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    bool _164 = _152 >= _148;
    bool _166 = !_162;
    bool _168 = _164 || _166;
    float _170 = _152;
    if (_168)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _134;
    if (_168)
    {
        out.m_51.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3242 = as_type<float>(_176);
        out.gl_Position.z = _3242;
    }
    if (_168)
    {
        return out;
    }
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = 1.0 / _148;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = _152 * _184;
    float _202 = _178 * _178;
    float _204 = _180 * _180;
    float _206 = _182 * _182;
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = fma(_194, _194, _208);
    float _216 = fma(_196, _196, _210);
    float _218 = fma(_198, _198, _212);
    float _220 = sqrt(_214);
    float _222 = in.m_61.x;
    float _224 = in.m_61.y;
    float _226 = in.m_61.z;
    float _228 = sqrt(_216);
    float _230 = sqrt(_218);
    bool _232 = _220 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = _190 * _224;
    float _238 = fma(_188, _222, _236);
    float _240 = _220;
    float _242 = _214;
    float _244 = _194;
    if (_232)
    {
        float _246 = rsqrt(_214);
        _240 = _246;
    }
    float _248 = _240;
    float _250 = 0.0;
    float _252 = 0.0;
    if (!_232)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _254 = _250;
    float _256 = _252;
    bool _258 = _230 > 0.0;
    float _260 = _180 * _224;
    float _262 = _196 * _224;
    float _264 = 0.0;
    float _266 = _256;
    float _268 = _254;
    if (!_232)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = fma(_192, _226, _238);
    float _274 = fma(_178, _222, _260);
    float _276 = 0.0;
    float _278 = _270;
    if (_234)
    {
        float _280 = rsqrt(_216);
        _276 = _280;
    }
    float _282 = _276;
    float _284 = fma(_194, _222, _262);
    float _286 = 0.0;
    float _288 = 0.0;
    if (!_234)
    {
        _286 = 0.0;
        _288 = 0.0;
    }
    float _290 = _286;
    float _292 = _288;
    float _294 = 0.0;
    float _296 = _290;
    float _298 = _292;
    if (!_234)
    {
        _294 = 0.0;
    }
    float _300 = _294;
    float _302 = fma(_182, _226, _274);
    float _304 = 0.0;
    float _306 = _300;
    float _308 = _302;
    if (!_258)
    {
        _304 = 0.0;
    }
    float _310 = _304;
    float _312 = 0.0;
    float _314 = _310;
    if (_258)
    {
        float _316 = rsqrt(_218);
        _312 = _316;
    }
    float _318 = _312;
    float _320 = 0.0;
    if (!_258)
    {
        _320 = 0.0;
    }
    float _322 = _320;
    float _324 = _322;
    if (_232)
    {
        float _326 = _248 * _178;
        _266 = _326;
    }
    float _328 = _266;
    if (!_258)
    {
        _242 = 0.0;
    }
    float _330 = _242;
    float _332 = _330;
    if (_232)
    {
        float _334 = _248 * _188;
        _268 = _334;
    }
    float _336 = _268;
    if (_232)
    {
        float _338 = _248 * _194;
        _278 = _338;
    }
    float _340 = _278;
    if (_234)
    {
        float _342 = _282 * _180;
        _306 = _342;
    }
    float _344 = _306;
    float _346 = fma(_198, _226, _284);
    if (_234)
    {
        float _348 = _282 * _190;
        _296 = _348;
    }
    float _350 = _296;
    if (_234)
    {
        float _352 = _282 * _196;
        _298 = _352;
    }
    float _354 = _298;
    if (_258)
    {
        float _356 = _318 * _182;
        _314 = _356;
    }
    float _358 = _314;
    if (_258)
    {
        float _360 = _318 * _192;
        _324 = _360;
    }
    float _362 = _324;
    if (_258)
    {
        float _364 = _318 * _198;
        _332 = _364;
    }
    float _366 = _332;
    bool _368 = !_186;
    float _386;
    if (!_368)
    {
        float _370 = in.m_63.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        _386 = _200;
    }
    _388 = false;
    float _390 = _386;
    float _392 = in.m_48.x;
    float _394 = in.m_48.y;
    float _396 = in.m_48.z;
    float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _400 = -_200;
    float _402 = _400 + 1.0;
    float _404 = in.m_63.z;
    float _406 = in.m_63.w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _390 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _390 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _424;
    float _428 = 1.0 / _414;
    float _430 = in.m_57.w;
    float _432 = _200 * _398;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = _402 * _398;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = 1.0 / _418;
    float _442 = in.m_63.x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = _190 * _394;
    float _454 = in.m_63.y;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _458 = _456 != 0;
    float _460 = 1.0 / _426;
    float _462 = _404 * 2.0;
    float _464 = fma(_188, _392, _452);
    float _466 = _196 * _394;
    float _468 = _422 * _428;
    float _470 = fma(_192, _396, _464);
    float _472 = fma(_194, _392, _466);
    float _474 = floor(_462);
    float _476 = precise::min(_434, _438);
    float _478 = _410 * _440;
    float _480 = fma(_198, _396, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _484 = _390 + _482;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _490 = log2(_488);
    float _492 = _396;
    float _494 = _394;
    int _496 = as_type<int>(_404);
    if (_458)
    {
        _244 = _442;
    }
    float _498 = _244;
    float _500 = _484 * _460;
    float _502 = _498;
    if (!_458)
    {
        _502 = _404;
    }
    float _504 = _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _508 = 1.0 + _506;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_458)
    {
        _492 = _454;
    }
    float _512 = _492;
    float _514 = fma(_446, _468, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _516 = _474 > 0.0;
    float _518 = _504 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _520 = _474 >= 0.0;
    bool _522 = isnan(_474);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = 1.0 / _508;
    float _532 = _512;
    if (!_458)
    {
        _532 = _442;
    }
    float _534 = _532;
    float _536 = -_510;
    float _538 = fma(_518, 2.0, _536);
    int _540 = _528 ? 0 : 1;
    float _542 = fma(_450, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _544 = _490 * _152;
    float _546 = _534 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _548 = ~_540;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -_152;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[86].x, _538);
    float _558 = fma(_546, -2.0, _486);
    float _560 = exp2(_544);
    int _562 = _552;
    if (!_516)
    {
        int _564 = ~_540;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = _454 * 2.0;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _574 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _558);
    bool _576 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _578 = isnan(1.0);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _584 = _580 || _582;
    float _586 = floor(_570);
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _602 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[88].z, _572);
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _614 = _612 != 0;
    float _616 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[88].w, _598);
    float _618 = fma(_600, _454, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _620 = -_560;
    float _622 = _620 + 1.0;
    float _624 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _602);
    float _626 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _616);
    float _628 = _618 * _152;
    bool _630 = !_610;
    int _632 = _630 ? 0 : 1;
    float _634 = _454 + _404;
    float _636 = _596 ? _622 : 0.0;
    float _638 = _442 + _404;
    bool _640 = !_606;
    int _642 = _640 ? 0 : 1;
    float _644 = _634 + (-1.0);
    float _646 = _624;
    if (_584)
    {
        float _648 = _636 * _530;
        _170 = _648;
    }
    float _650 = _170;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _658 = _656 != 0;
    float _660 = _442 * 2.0;
    bool _662 = _586 >= 0.0;
    bool _664 = isnan(_586);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _674 = _442 + _454;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _686 = _684 != 0;
    float _688 = _638 + (-1.0);
    int _690 = _670 ? 0 : 1;
    float _692 = floor(_660);
    bool _694 = _586 > 0.0;
    float _696 = _674 + (-1.0);
    int _698 = ~_690;
    int _700 = _698 + 1;
    int _702 = _700 + 1;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _706 = !_614;
    int _708 = _706 ? 0 : 1;
    float _710 = _470 + _430;
    bool _712 = !_686;
    int _714 = _712 ? 0 : 1;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _718 = in.m_59.w;
    bool _720 = !_654;
    int _722 = _720 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _724;
    bool _728 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _730 = isnan(_390);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    int _744 = _702;
    if (!_694)
    {
        int _746 = ~_690;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _764 = _762 != 0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _770 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _772 = _692 >= 0.0;
    bool _774 = isnan(_692);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _792 = _780 ? 0 : 1;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _796 = fma(_786, _468, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _798 = fma(_742, _468, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _800 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _802 = _692 > 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _804;
    float _808 = fma(_790, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _810;
    float _814 = fma(_768, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _816 = fma(_806, _500, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _818 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _820 = isnan(_390);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = fma(_812, _500, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _832 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _834 = fma(_726, _500, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _836 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _838 = isnan(_390);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -_828;
    float _850 = _848 + 1.0;
    float _852 = _832 * _716;
    float _854 = -_738;
    float _856 = _854 + 1.0;
    float _858 = _480 + _718;
    float _860 = _738 * _850;
    float _862 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _852);
    bool _864 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _866 = isnan(_390);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = _770 * _752;
    float _878 = -_846;
    float _880 = _878 + 1.0;
    float _882 = floor(_862);
    float _884 = _846 * _856;
    float _886 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].y, _876);
    float _888 = _874 * _880;
    float _890 = _782 * _794;
    float _892 = -_874;
    float _894 = _892 + 1.0;
    bool _896 = !_756;
    int _898 = _896 ? 0 : 1;
    float _900 = _796 * _888;
    float _902 = _514 * _888;
    float _904 = _798 * _888;
    float _906 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].z, _890);
    int _908 = ~_792;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].x, _900);
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].y, _902);
    float _918 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].z, _904);
    int _920 = _912;
    if (!_802)
    {
        int _922 = ~_792;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = floor(_886);
    float _930 = -_882;
    float _932 = _862 + _930;
    float _934 = _886 + 0.25;
    float _936 = fma(_808, _884, _914);
    float _938 = fma(_542, _884, _916);
    float _940 = fma(_814, _884, _918);
    bool _942 = !_760;
    int _944 = _942 ? 0 : 1;
    float _946 = fma(_816, _860, _936);
    float _948 = floor(_906);
    bool _950 = _932 >= 0.5;
    bool _952 = isnan(_932);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.5);
    bool _958 = _954 || _956;
    float _960 = _862 + 0.25;
    int _962 = abs(_898);
    float _964 = _862 * 6.283185482025146484375;
    int _966 = abs(_944);
    float _968 = fma(_442, 6.283185482025146484375, _628);
    float _970 = floor(_934);
    float _972 = float(_568);
    float _974 = -_928;
    float _976 = _886 + _974;
    float _978 = float(_962);
    float _980 = _886 * 6.283185482025146484375;
    float _982 = _906 + 0.25;
    float _984 = _978 * _972;
    float _986 = float(_926);
    float _988 = -_948;
    float _990 = _906 + _988;
    float _992 = float(_966);
    float _994 = floor(_960);
    bool _996 = !_958;
    float _998 = _996 ? 0.5 : (-0.5);
    float _1000 = _906 * 6.283185482025146484375;
    bool _1002 = _976 >= 0.5;
    bool _1004 = isnan(_976);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    float _1012 = -_970;
    float _1014 = _934 + _1012;
    int _1016 = abs(_722);
    float _1018 = _992 * _986;
    int _1020 = abs(_632);
    float _1022 = floor(_982);
    bool _1024 = _990 >= 0.5;
    bool _1026 = isnan(_990);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.5);
    bool _1032 = _1028 || _1030;
    float _1034 = _1000 * 0.15915493667125701904296875;
    bool _1036 = !_1010;
    float _1038 = _1036 ? 0.5 : (-0.5);
    float _1040 = _984 * (-2.0);
    float _1042 = _964 * 0.15915493667125701904296875;
    float _1044 = _998 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1046 = _1044 * 2.0;
    float _1048 = float(_1016);
    float _1050 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1052 = _1050 * 2.0;
    float _1054 = -_994;
    float _1056 = _960 + _1054;
    bool _1058 = !_682;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _980 * 0.15915493667125701904296875;
    float _1064 = _1048 * _1052;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1068 = _1066 != 0;
    float _1070 = _1042 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = -_1022;
    float _1076 = _982 + _1074;
    int _1078 = abs(_642);
    float _1080 = _968 * 0.15915493667125701904296875;
    int _1082 = abs(_1060);
    float _1084 = _1018 * (-2.0);
    bool _1086 = !_1032;
    float _1088 = _1086 ? 0.5 : (-0.5);
    float _1090 = -_476;
    float _1092 = _1090 + 1.0;
    float _1094 = _1062 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = float(_1020);
    float _1100 = fma(_672, _1084, _672);
    bool _1102 = _1056 > 0.5;
    float _1104 = fma(_830, _860, _938);
    float _1106 = _1098 * _1046;
    bool _1108 = !_1068;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = in.m_65.x;
    float _1114 = in.m_65.y;
    float _1116 = in.m_65.z;
    float _1118 = float(_1082);
    float _1120 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1122 = _1120 * 2.0;
    float _1124 = float(_1078);
    float _1126 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1128 = abs(_1110);
    float _1130 = _1118 * _1122;
    int _1132 = abs(_708);
    float _1134 = fma(_1124, _1126, _1106);
    float _1136 = _1056;
    float _1138 = _1014;
    float _1140 = _1076;
    if (_1102)
    {
        float _1142 = -_1056;
        float _1144 = _1142 + 1.0;
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1150 = _1014 > 0.5;
    float _1152 = in.m_67.z;
    float _1154 = float(_1128);
    float _1156 = fma(_1146, 4.0, -1.0);
    float _1158 = float(_1132);
    float _1160 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].x, _946);
    bool _1162 = !_658;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = fma(_1154, _1148, _1064);
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1170 = _1034 * 6.283185482025146484375;
    float _1172 = sin(_1170);
    float _1174 = in.m_67.x;
    float _1176 = fma(_1158, _1168, _1134);
    int _1178 = abs(_1164);
    if (_1150)
    {
        float _1180 = -_1014;
        float _1182 = _1180 + 1.0;
        _1138 = _1182;
    }
    float _1184 = _1138;
    bool _1186 = !_678;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_1176, 3.1415927410125732421875, _1112);
    bool _1192 = _1076 > 0.5;
    float _1194 = fma(_1184, 4.0, -1.0);
    int _1196 = abs(_1188);
    float _1198 = fma(_800, _1040, _800);
    float _1200 = float(_1196);
    float _1202 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1204 = float(_1178);
    float _1206 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1208 = fma(_1190, _1040, _1190);
    float _1210 = _442 + (-0.5);
    float _1212 = fma(_1200, _1206, _1130);
    float _1214 = fma(_1204, _1202, _1166);
    bool _1216 = !_764;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1208);
    float _1222 = _858 * _858;
    if (_1192)
    {
        float _1224 = -_1076;
        float _1226 = _1224 + 1.0;
        _1140 = _1226;
    }
    float _1228 = _1140;
    int _1230 = abs(_714);
    float _1232 = fma(_1214, 3.1415927410125732421875, _1114);
    int _1234 = abs(_1218);
    float _1236 = fma(_1198, _650, _1220);
    float _1238 = fma(_710, _710, _1222);
    float _1240 = fma(_1228, 4.0, -1.0);
    float _1242 = _1080 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = float(_1230);
    float _1248 = _454 + (-0.5);
    float _1250 = float(_750);
    float _1252 = fma(_1232, _1084, _1232);
    float _1254 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1256 = _1236 * 0.15915493667125701904296875;
    float _1258 = sqrt(_1238);
    float _1260 = float(_1234);
    float _1262 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1252);
    float _1264 = fma(_1246, _1254, _1212);
    float _1266 = in.m_67.y;
    float _1268 = _1260 * _1250;
    float _1270 = fma(_1100, _650, _1262);
    float _1272 = fma(_1264, 3.1415927410125732421875, _1116);
    float _1274 = abs(_1244);
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1278 = _1268 * (-2.0);
    float _1280 = in.m_69.x;
    float _1282 = in.m_69.y;
    float _1284 = in.m_69.z;
    float _1286 = _1270 * 0.15915493667125701904296875;
    float _1288 = _1256 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = fma(_704, _1278, _704);
    float _1294 = fma(_1272, _1278, _1272);
    float _1296 = _404 + (-0.5);
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1294);
    float _1300 = fma(_834, _860, _940);
    float _1302 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1276);
    float _1304 = _1286 * 6.283185482025146484375;
    float _1306 = sin(_1304);
    float _1308 = fma(_1292, _650, _1298);
    float _1310 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1104);
    float _1312 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1300);
    float _1314 = _1308 * 0.15915493667125701904296875;
    float _1316 = -_1302;
    float _1318 = _1316 + _1266;
    float _1320 = _1286 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1318);
    float _1326 = _1160 * _1280;
    float _1328 = _1310 * _1282;
    float _1330 = _1312 * _1284;
    float _1332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1174);
    float _1334 = _1256 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1340 = _660 + (-1.0);
    float _1342 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1338 * _1332;
    float _1348 = _1290 * _1306;
    float _1350 = _1340 * _1258;
    float _1352 = _1314 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1290 * _1322;
    float _1358 = _1342 * _1324;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1362 = _1350 * 0.75;
    float _1364 = _1344 * _1360;
    float _1366 = _1314 * 6.283185482025146484375;
    float _1368 = sin(_1366);
    float _1370 = _1336 * _1306;
    float _1372 = _1336 * _1322;
    float _1374 = _1362 * 0.15915493667125701904296875;
    float _1376 = _1290 * _1354;
    float _1378 = _1336 * _1354;
    float _1380 = _1322 * _1354;
    float _1382 = _1306 * _1354;
    float _1384 = _1376 * _1358;
    float _1386 = _1378 * _1358;
    float _1388 = _1374 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = fma(_1368, _1356, _1370);
    float _1394 = -_1348;
    float _1396 = fma(_1368, _1372, _1394);
    float _1398 = -_1372;
    float _1400 = fma(_1368, _1348, _1398);
    float _1402 = -_1358;
    float _1404 = _1368 * _1402;
    float _1406 = fma(_1392, _1346, _1384);
    float _1408 = fma(_1396, _1346, _1386);
    float _1410 = fma(_1368, _1370, _1356);
    float _1412 = fma(_1380, _1346, _1404);
    float _1414 = fma(_1400, _1364, _1406);
    float _1416 = _1374 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = fma(_1410, _1364, _1408);
    float _1422 = fma(_1382, _1364, _1412);
    float _1424 = _1414 * _350;
    float _1426 = _1414 * _354;
    float _1428 = _1414 * _344;
    float _1430 = fma(_1422, _336, _1424);
    float _1432 = fma(_1422, _340, _1426);
    float _1434 = fma(_1422, _328, _1428);
    float _1436 = fma(_1420, _362, _1430);
    float _1438 = fma(_1420, _366, _1432);
    float _1440 = fma(_1420, _358, _1434);
    float _1442 = _1436 * _1390;
    float _1444 = _1436 * _1418;
    float _1446 = -_1442;
    float _1448 = fma(_1438, _1418, _1446);
    float _1450 = fma(_1438, _1390, _1444);
    float _1452 = in.m_71.y;
    float _1454 = _858 + _1448;
    float _1456 = _710 + _1450;
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1460 = _1454 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1464 = _1456 + _1462;
    float _1466 = _1460 * _1460;
    float _1468 = fma(_1464, _1464, _1466);
    float _1470 = sqrt(_1468);
    float _1472 = _394 + _1452;
    float _1474 = _1472 + _1440;
    bool _1476 = _1470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1470 + _1478;
    float _1482 = _1390;
    float _1484 = _1422;
    float _1486 = _1434;
    float _1488 = _1470;
    float _1490 = _1480;
    float _1492 = _1244;
    if (_1476)
    {
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1494;
    }
    float _1496 = _1482;
    if (_1476)
    {
        float _1498 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _494 = _1498;
    }
    float _1500 = _494;
    float _1502 = _1500;
    if (!_1476)
    {
        _1484 = _1456;
    }
    float _1504 = _1484;
    float _1506 = _1504;
    if (_1476)
    {
        float _1508 = rsqrt(_1468);
        _1486 = _1508;
    }
    float _1510 = _1486;
    if (_1476)
    {
        float _1512 = _1480 * _1496;
        _1488 = _1512;
    }
    float _1514 = _1488;
    if (_1476)
    {
        float _1516 = _1514 * 0.15915493667125701904296875;
        _1490 = _1516;
    }
    float _1518 = _1490;
    float _1520 = _1514;
    if (_1476)
    {
        float _1522 = _1518 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = _1526;
    if (_1476)
    {
        float _1530 = fma(_1526, _1500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1528 = _1530;
    }
    float _1532 = _1528;
    float _1534 = _1532;
    if (!_1476)
    {
        _1502 = _1454;
    }
    float _1536 = _1502;
    float _1538 = _1536;
    if (_1476)
    {
        float _1540 = _1510 * _1532;
        _1534 = _1540;
    }
    float _1542 = _1534;
    float _1544 = _1542;
    if (_1476)
    {
        float _1546 = fma(_1460, _1542, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1538 = _1546;
    }
    float _1548 = _1538;
    float _1550 = _1548;
    if (_1476)
    {
        float _1552 = fma(_1464, _1542, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1506 = _1552;
    }
    float _1554 = _1506;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1562 = _1554 + _1560;
    float _1564 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1566 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5264 = float2(_1566, _1564);
    float _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5264, float2(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5264, float2(0.0), isnan(_5264)), level(0.0)).x;
    float _1570 = _1440;
    float _1572 = _1562;
    float _1574 = _1554;
    if (_1476)
    {
        float _1576 = _1518 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1570 = _1578;
    }
    float _1580 = _1570;
    if (!_1476)
    {
        _1544 = _1474;
    }
    float _1582 = _1544;
    float _1584 = -_710;
    float _1586 = _1584 + _1554;
    float _1588 = -_858;
    float _1590 = _1588 + _1548;
    bool _1592 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1600 = _1596 || _1598;
    float _1602 = _1582;
    if (_1476)
    {
        float _1604 = _1580 + (-1.0);
        _1572 = _1604;
    }
    float _1606 = _1572;
    float _1608 = _1606;
    if (_1476)
    {
        float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_1476)
    {
        float _1614 = fma(_1474, _1580, _1612);
        _1602 = _1614;
    }
    float _1616 = _1602;
    float _1618 = -_1472;
    float _1620 = _1618 + _1616;
    float _1622 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1624 = _1620 * _1620;
    float _1626 = fma(_1586, _1586, _1624);
    float _1628 = fma(_1590, _1590, _1626);
    float _1630 = sqrt(_1628);
    float _1632 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1634 = floor(_1632);
    float _1636 = floor(_1622);
    bool _1638 = _1630 > 0.0;
    float _1640 = -_1634;
    float _1642 = _1632 + _1640;
    float _1644 = -_1636;
    float _1646 = _1622 + _1644;
    float _1648 = fma(_1568, 100.0, _1616);
    float _1650 = fma(_1568, 100.0, _1472);
    float _1652 = _1616;
    float _1654 = _1632;
    float _1656 = _1628;
    if (!_1638)
    {
        _1652 = _1548;
    }
    float _1658 = _1652;
    float _1660 = _1658;
    if (!_1638)
    {
        _1654 = _1648;
    }
    float _1662 = _1654;
    bool _1664 = !_1638;
    float _1666 = _1662;
    if (!_1664)
    {
        float _1668 = _302 * _302;
        float _1670 = fma(_272, _272, _1668);
        float _1672 = rsqrt(_1628);
        float _1674 = fma(_346, _346, _1670);
        float _1676 = sqrt(_1674);
        float _1678 = _1586 * _1672;
        float _1680 = _1620 * _1672;
        float _1682 = _1590 * _1672;
        bool _1684 = _1676 > 0.0;
        float _1686 = _1676;
        float _1688 = _1672;
        if (!_1684)
        {
            _1686 = _1648;
        }
        float _1690 = _1686;
        _1666 = _1690;
        if (!_1684)
        {
            _1688 = _1548;
        }
        float _1692 = _1688;
        bool _1694 = !_1684;
        _1660 = _1692;
        if (!_1694)
        {
            float _1696 = rsqrt(_1674);
            float _1698 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1700 = _302 * _1696;
            float _1702 = _272 * _1696;
            float _1704 = _346 * _1696;
            float _1706 = _1680 * _1700;
            float _1708 = fma(_1678, _1702, _1706);
            float _1710 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1712 = fma(_1682, _1704, _1708);
            float _1714 = _1712 * _1710;
            float _1716 = fma(_272, _1714, _1554);
            float _1718 = fma(_302, _1714, _1648);
            float _1720 = fma(_346, _1714, _1548);
            _1666 = _1718;
            _1574 = _1716;
            _1660 = _1720;
            _1656 = _1698;
        }
    }
    float _1722 = _1666;
    float _1724 = _1574;
    float _1726 = _1660;
    float _1728 = _1656;
    float _1730 = _1724;
    float _1732 = _1726;
    float _1734 = _1728;
    if (_1600)
    {
        _1550 = _1722;
    }
    float _1736 = _1550;
    float _1738 = _1736;
    if (!_1600)
    {
        float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1742 = _1650 + _1740;
        float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1746 = _710 + _1744;
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1750 = -_710;
        float _1752 = _1750 + _1724;
        float _1754 = _1742 * _1742;
        float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1758 = _858 + _1756;
        float _1760 = -_1650;
        float _1762 = _1760 + _1722;
        float _1764 = fma(_1746, _1746, _1754);
        float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1768 = fma(_1758, _1758, _1764);
        float _1770 = sqrt(_1768);
        float _1772 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1774 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1776 = _1774 * _1766;
        float _1778 = -_858;
        float _1780 = _1778 + _1726;
        float _1782 = _1772 * _1776;
        float _1784 = fma(_1752, _1782, _710);
        float _1786 = fma(_1762, _1782, _1650);
        float _1788 = fma(_1780, _1782, _858);
        _1738 = _1786;
        _1730 = _1784;
        _1732 = _1788;
        _1734 = _1782;
    }
    float _1790 = _1738;
    float _1792 = _1730;
    float _1794 = _1732;
    float _1796 = _1734;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1800 = _1790 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1792 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1808 = _1794 + _1806;
    float _1810 = _1800 * _1800;
    float _1812 = in.m_73.y;
    float _1814 = fma(_1804, _1804, _1810);
    float2 _5650 = float2(_1642, _1646);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5650, float2(0.0), isnan(_5650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5650, float2(0.0), isnan(_5650)), level(0.0)).x;
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1820 = _1818 != 0;
    float _1822 = in.m_73.x;
    float _1824 = fma(_1808, _1808, _1814);
    float _1826 = rsqrt(_1824);
    float _1828 = sqrt(_1824);
    float _1830 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1832 = _1804 * _1830;
    float _1834 = _1808 * _1830;
    float _1836 = _1832 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 + _1838;
    float _1842 = sqrt(_1840);
    bool _1844 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = _1842 + _1846;
    float _1850 = _1808;
    float _1852 = _1826;
    float _1854 = _1848;
    float _1856 = _1810;
    float _1858 = _1800;
    if (_1844)
    {
        float _1860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1850 = _1860;
    }
    float _1862 = _1850;
    if (_1844)
    {
        float _1864 = rsqrt(_1840);
        _1852 = _1864;
    }
    float _1866 = _1852;
    float _1868 = _1866;
    if (_1844)
    {
        float _1870 = _1848 * _1862;
        _1854 = _1870;
    }
    float _1872 = _1854;
    if (_1844)
    {
        float _1874 = _1872 * 0.15915493667125701904296875;
        _1856 = _1874;
    }
    float _1876 = _1856;
    float _1878 = _1862;
    float _1880 = _1876;
    if (_1844)
    {
        float _1882 = _1876 * 6.283185482025146484375;
        float _1884 = sin(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1890 = precise::max(0.0, _1888);
    float _1892 = _1796;
    float _1894 = _1890;
    if (_1844)
    {
        float _1896 = _1876 * 6.283185482025146484375;
        float _1898 = cos(_1896);
        _1892 = _1898;
    }
    float _1900 = _1892;
    float _1902 = -_1830;
    float _1904 = -_1890;
    float _1906 = fma(_1800, _1902, _1904);
    if (!_1844)
    {
        _1858 = _1834;
    }
    float _1908 = _1858;
    float _1910 = _1908;
    if (_1844)
    {
        float _1912 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1894 = _1912;
    }
    float _1914 = _1894;
    float _1916 = _1914;
    if (!_1844)
    {
        _1880 = _1836;
    }
    float _1918 = _1880;
    float _1920 = _1886;
    float _1922 = _1918;
    if (_1844)
    {
        float _1924 = fma(_1886, _1914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = _1926;
    if (_1844)
    {
        float _1930 = _1900 + (-1.0);
        _1916 = _1930;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1844)
    {
        float _1936 = _1866 * _1926;
        _1492 = _1936;
    }
    float _1938 = _1492;
    if (!_1844)
    {
        _1928 = _1832;
    }
    float _1940 = _1928;
    float _1942 = _1940;
    if (_1844)
    {
        float _1944 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _308 = _1944;
    }
    float _1946 = _308;
    if (_1844)
    {
        float _1948 = _1832 * _1938;
        _1942 = _1948;
    }
    float _1950 = _1942;
    if (!_1844)
    {
        _1868 = _1906;
    }
    float _1952 = _1868;
    float _1954 = _1952;
    if (_1844)
    {
        float _1956 = _1834 * _1938;
        _1910 = _1956;
    }
    float _1958 = _1910;
    if (_1844)
    {
        float _1960 = fma(_1906, _1900, _1946);
        _1954 = _1960;
    }
    float _1962 = _1954;
    if (_1844)
    {
        float _1964 = _1950 * _1950;
        _1922 = _1964;
    }
    float _1966 = _1922;
    if (!_1844)
    {
        _1934 = _1838;
    }
    float _1968 = _1934;
    float _1970 = _1968;
    if (_1844)
    {
        float _1972 = _1958 * _1958;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = fma(_1962, _1962, _1966);
    float _1978 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1980 = _1976 + _1974;
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1984 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1982);
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1990 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1978);
    float _1992 = rsqrt(_1980);
    float _1994 = -_1986;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1990);
    float _2000 = _1988 * _442;
    float _2002 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2004 = abs(_1996);
    float _2006 = log2(_2004);
    float _2008 = _1992 * _1950;
    float _2010 = _1992 * _1962;
    float _2012 = trunc(_2000);
    int _2014 = int(_2012);
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = _1992 * _1958;
    float _2020 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2022 = -_2016;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2022);
    float _2026 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2028 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = _2020 * _442;
    float _2032 = -_2018;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2024);
    float _2036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2038 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2040 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_2034, -0.5, 0.5);
    float _2044 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2026);
    float _2046 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2038);
    float _2048 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2050 = fma(_2034, 0.5, 0.5);
    float _2052 = sqrt(_2042);
    float _2054 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2056 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2044);
    int _2060 = _2014 << 4;
    int _2062 = _2060 + 1712;
    float _2064 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2066 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2068 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2070 = exp2(_2028);
    float _2072 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2074 = fma(_2050, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2076 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2072);
    float _2080 = _2010 + 1.0;
    float _2082 = -_2076;
    float _2084 = fma(_2082, _2036, 1.0);
    float _2086 = trunc(_2030);
    int _2088 = int(_2086);
    float _2090 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2078);
    float _2092 = fma(_2050, _2074, -0.212114393711090087890625);
    float _2094 = _2052 * 0.636619746685028076171875;
    float _2096 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2090);
    float _2098 = fma(_2050, _2092, 1.570728778839111328125);
    float _2100 = log2(_2084);
    float _2102 = -_2010;
    float _2104 = fma(_2070, _2080, _2102);
    float _2106 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2108 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2110 = -_2098;
    float _2112 = fma(_2094, _2110, 1.0);
    float _2114 = fma(_2104, 0.5, 0.5);
    float _2116 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2108);
    float _2118 = 1.0 / _2096;
    float _2120 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2106);
    int _2122 = _2088 << 4;
    int _2124 = _2122 + 1968;
    float _2126 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2116);
    float _2128 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2120);
    float _2130 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2126);
    float _2132 = _2100 * 0.693147182464599609375;
    float _2134 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2128);
    uint _2137 = uint(int(uint(_2124) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    float _2153 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2134 * _2118;
    float _2157 = _2130 * _2118;
    uint _2159 = uint(int(uint(_2062) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    float _2175 = fma(_2155, 0.5, 0.5);
    float _2177 = fma(_2157, -0.5, 0.5);
    float3 _6255 = float3(_2175, _2177, _2153);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6255, float3(0.0), isnan(_6255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6255, float3(0.0), isnan(_6255)), level(0.0)).x;
    float3 _6266 = float3(_2175, _2177, _2153);
    float4 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6266, float3(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6266, float3(0.0), isnan(_6266)), level(0.0)).xyzw;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = _2182.w;
    float2 _6282 = float2(_2112, _2114);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6282, float2(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6282, float2(0.0), isnan(_6282)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    int _2202 = _2062 + 8;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    float _2212 = 0.0;
    int _2214 = as_type<int>(_2175);
    float _2216 = _1812;
    float _2218 = as_type<float>(_2062);
    float _2220 = _2153;
    float _2222 = _2134;
    if (_1820)
    {
        float _2224 = in.m_63.z;
        _2212 = _2224;
    }
    float _2226 = _2212;
    int _2228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2230 = _2228 != 0;
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2234 = _406 > 0.5;
    float _2236 = -_1812;
    float _2238 = _2236 + 1.0;
    bool _2240 = _404 > 0.5;
    float _2242 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2244 = _2124 + 8;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    bool _2254 = _454 > 0.5;
    out.m_75.x = _1792;
    out.m_75.y = _1790;
    out.m_75.z = _1794;
    int _2256 = _2240 ? as_type<int>(_2238) : as_type<int>(_1812);
    float _2258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2262 = _2260 != 0;
    bool _2264 = _2262;
    float _2266 = _1822;
    if (_1820)
    {
        float _2268 = -_1822;
        float _2270 = _2268 + 1.0;
        _2214 = as_type<int>(_2270);
    }
    int _2272 = _2214;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2276 = _2274 != 0;
    int _2278 = _2254 ? as_type<int>(_2238) : as_type<int>(_1812);
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2282 = _2280 != 0;
    float _2284 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2286 = _2262 ? as_type<float>(_2256) : _1812;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2290 = _2276 ? as_type<float>(_2278) : _1812;
    bool _2292 = _2276;
    if (_2230)
    {
        float _2294 = _2234 ? _2238 : _1812;
        _2216 = _2294;
    }
    float _2296 = _2216;
    int _2298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2300 = _2298 != 0;
    float _2302 = fma(_2286, _2284, -0.5);
    if (_1820)
    {
        bool _2304 = _2226 > 0.5;
        _2292 = _2304;
    }
    bool _2306 = _2292;
    float _2308 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1820)
    {
        _2218 = _1822;
    }
    float _2310 = _2218;
    float _2312 = _2310;
    if (_2282)
    {
        float _2314 = -_1822;
        float _2316 = _2314 + 1.0;
        _496 = as_type<int>(_2316);
    }
    int _2318 = _496;
    if (_2282)
    {
        bool _2320 = _442 > 0.5;
        _2264 = _2320;
    }
    bool _2322 = _2264;
    float _2324 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1820)
    {
        float _2326 = _2306 ? as_type<float>(_2272) : _1822;
        _2312 = _2326;
    }
    float _2328 = _2312;
    float _2330 = -_574;
    float _2332 = fma(_626, _2302, _2330);
    float _2334 = _2332;
    if (!_2282)
    {
        _2220 = _1822;
    }
    float _2336 = _2220;
    float _2338 = _2165 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2340 = _2336;
    int _2342 = as_type<int>(_2165);
    if (_2282)
    {
        float _2344 = _2322 ? as_type<float>(_2318) : _1822;
        _2340 = _2344;
    }
    float _2346 = _2340;
    if (_2300)
    {
        float _2348 = -_1822;
        float _2350 = _2348 + 1.0;
        _2342 = as_type<int>(_2350);
    }
    int _2352 = _2342;
    float _2354 = in.m_77.x;
    float _2356 = in.m_77.y;
    float _2358 = in.m_77.z;
    float _2360 = -_1302;
    float _2362 = -_1266;
    bool _2364 = _2360 != _2362;
    bool _2366 = isnan(_2360);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(_2362);
    bool _2372 = _2368 || _2370;
    float _2374 = _2173 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2376 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2300)
    {
        float _2378 = _2254 ? as_type<float>(_2352) : _1822;
        _2266 = _2378;
    }
    float _2380 = _2266;
    float _2382 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2384 = _1174 == 0.0;
    bool _2386 = !_2372;
    bool _2388 = _2384 && _2386;
    float _2390 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2392 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2394 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2398 = fma(_2382, _2380, -0.5);
    bool _2400 = _1152 == 0.0;
    bool _2402 = _2400 && _2388;
    float _2404 = in.m_79.x;
    float _2406 = in.m_79.y;
    float _2408 = in.m_79.z;
    float _2410 = in.m_79.w;
    float _2412 = _2252 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2414 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2416 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2418 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2420 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2426 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2428 = fma(_624, _2398, _556);
    out.m_81.x = _2394;
    out.m_81.y = _2376;
    out.m_81.z = _2420;
    float _2430 = _2418;
    float _2432 = _2420;
    if (_2402)
    {
        _646 = _2354;
    }
    float _2434 = _646;
    float _2436 = _2434;
    if (!_2402)
    {
        float _2438 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2354);
        _2436 = _2438;
    }
    float _2440 = _2436;
    float _2442 = -_1816;
    float _2444 = _2442 + 1.0;
    out.m_83.x = _2414;
    out.m_83.y = _2392;
    out.m_83.z = _2416;
    out.m_83.w = _2422;
    float _2446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2448 = _2328 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2450 = _2428 + 0.5;
    float _2452 = exp2(_2242);
    float _2454 = _2418 * _2288;
    float _2456 = _2288;
    if (_2402)
    {
        _2456 = _2356;
    }
    float _2458 = _2456;
    float _2460 = _2448 * _2396;
    float _2462 = _2332 + 0.5;
    float _2464 = _2458;
    if (_2402)
    {
        _2334 = _2358;
    }
    float _2466 = _2334;
    float _2468 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2470 = _2466;
    if (_2402)
    {
        _2430 = _2458;
    }
    float _2472 = _2430;
    float _2474 = _2426 * _2424;
    float _2476 = _2472;
    if (!_2402)
    {
        _2464 = _2356;
    }
    float _2478 = _2464;
    float _2480 = _2468 * _2446;
    if (_2402)
    {
        _2432 = _2466;
    }
    float _2482 = _2432;
    out.m_85.x = _2450;
    out.m_85.y = _2462;
    float _2484 = _2482;
    if (!_2402)
    {
        _2470 = _2358;
    }
    float _2486 = _2470;
    if (!_2402)
    {
        float _2488 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2478);
        _2476 = _2488;
    }
    float _2490 = _2476;
    float _2492 = _2408 * _2354;
    float _2494 = _2404 * _2478;
    out.m_87.x = _2454;
    out.m_87.y = _2474;
    out.m_87.z = _2460;
    out.m_87.w = _2480;
    float _2496 = _2406 * _2486;
    float _2498 = -_2492;
    float _2500 = fma(_2404, _2486, _2498);
    if (!_2402)
    {
        float _2502 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2486);
        _2484 = _2502;
    }
    float _2504 = _2484;
    float _2506 = -_2494;
    float _2508 = fma(_2406, _2354, _2506);
    float _2510 = -_2496;
    float _2512 = fma(_2408, _2478, _2510);
    float _2514 = _2500 * _2410;
    float _2516 = -_2490;
    float _2518 = _1368 * _2516;
    float _2520 = _2508 * _2410;
    float _2522 = _2512 * _2410;
    float _2524 = _1376 * _2514;
    float _2526 = _1376 * _2406;
    float _2528 = _1378 * _2490;
    float _2530 = fma(_1380, _2440, _2518);
    float _2532 = _1376 * _2490;
    float _2534 = -_2514;
    float _2536 = _1368 * _2534;
    float _2538 = -_2406;
    float _2540 = _1368 * _2538;
    float _2542 = _1378 * _2514;
    float _2544 = fma(_1392, _2440, _2532);
    float _2546 = fma(_1380, _2522, _2536);
    float _2548 = fma(_1392, _2522, _2524);
    float _2550 = fma(_1380, _2404, _2540);
    float _2552 = fma(_1396, _2522, _2542);
    float _2554 = fma(_1392, _2404, _2526);
    float _2556 = fma(_1400, _2504, _2544);
    float _2558 = fma(_1396, _2440, _2528);
    float _2560 = _1378 * _2406;
    float _2562 = fma(_1382, _2504, _2530);
    float _2564 = fma(_1382, _2408, _2550);
    float _2566 = fma(_1400, _2408, _2554);
    float _2568 = _2556 * _350;
    float _2570 = fma(_1410, _2504, _2558);
    float _2572 = fma(_1400, _2520, _2548);
    float _2574 = _2556 * _344;
    float _2576 = fma(_1396, _2404, _2560);
    float _2578 = _2556 * _354;
    float _2580 = fma(_1382, _2520, _2546);
    float _2582 = _2566 * _350;
    float _2584 = _2566 * _344;
    float _2586 = fma(_2562, _336, _2568);
    float _2588 = _2572 * _350;
    float _2590 = _2572 * _344;
    float _2592 = fma(_2562, _328, _2574);
    float _2594 = _2572 * _354;
    float _2596 = _2566 * _354;
    float _2598 = fma(_2562, _340, _2578);
    float _2600 = fma(_1410, _2408, _2576);
    float _2602 = fma(_2564, _336, _2582);
    float _2604 = fma(_2570, _362, _2586);
    float _2606 = fma(_1410, _2520, _2552);
    float _2608 = fma(_2580, _336, _2588);
    float _2610 = fma(_2580, _328, _2590);
    float _2612 = fma(_2564, _328, _2584);
    float _2614 = fma(_2570, _358, _2592);
    float _2616 = fma(_2580, _340, _2594);
    float _2618 = fma(_2564, _340, _2596);
    float _2620 = fma(_2570, _366, _2598);
    float _2622 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2624 = fma(_2600, _362, _2602);
    float _2626 = fma(_2606, _362, _2608);
    float _2628 = fma(_2606, _358, _2610);
    float _2630 = fma(_2600, _358, _2612);
    float _2632 = fma(_2606, _366, _2616);
    float _2634 = fma(_2600, _366, _2618);
    float _2636 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2622);
    float _2638 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_89.x = _2604;
    out.m_89.y = _2614;
    out.m_89.z = _2620;
    bool _2640 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2642 = isnan(_1828);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2648 = _2644 || _2646;
    float _2650 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2636);
    float _2652 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2638);
    out.m_91.x = _2626;
    out.m_91.y = _2628;
    out.m_91.z = _2632;
    float _2654 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2656 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2652);
    out.m_93.x = _2624;
    out.m_93.y = _2630;
    out.m_93.z = _2634;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2660 = in.m_95.x;
    float _2662 = _2658 + _2654;
    float _2664 = 1.0 / _2654;
    float _2666 = in.m_71.x;
    float _2668 = in.m_95.y;
    float _2670 = in.m_95.w;
    float _2672 = _2662 * _2664;
    float _2674 = _2672 * 0.5;
    float _2676 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2678 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2676);
    out.m_97.x = _2660;
    float _2680 = 1.0 / _2678;
    out.m_97.y = _2668;
    out.m_97.w = _2670;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2684 = _2680 * _2682;
    float _2686 = abs(_2684);
    float _2688 = log2(_2686);
    bool _2690 = _2684 <= 8000.0;
    bool _2692 = isnan(_2684);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan(8000.0);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2704 = exp2(_2702);
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = fma(_2708, -2.0, 3.0);
    float _2712 = _2708 * _2708;
    float _2714 = in.m_95.z;
    float _2716 = _2712 * _2710;
    float _2718 = -_2716;
    float _2720 = _2718 + 1.0;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2716);
    float _2724 = _2700 * _2722;
    float _2726 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2728 = -_2452;
    float _2730 = _2728 + 1.0;
    float _2732 = _2444 * _2726;
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2738 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2740 = _2134 + _2096;
    float _2742 = -_2734;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2736);
    float _2748 = _2738 * _2179;
    float _2750 = _2096 * 0.5;
    float _2752 = _2744 * _2666;
    float _2754 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2746);
    float _2756 = _2190 * _2748;
    float _2758 = _2200 * _2748;
    float _2760 = -_2738;
    float _2762 = _2760 + 1.0;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2754);
    float _2766 = fma(_2196, _2756, _2184);
    float _2768 = fma(_2198, _2756, _2186);
    float _2770 = _2740 * 0.5;
    float _2772 = _2764 + _2096;
    float _2774 = fma(_2130, -0.5, _2750);
    float _2776 = _2190 * _2762;
    float _2778 = _2752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2780 = _2772 * 0.5;
    float _2782 = fma(_2190, _2758, _2188);
    out.m_97.z = _2714;
    float _2784 = _2738;
    float _2786 = _2762;
    float _2788 = _2750;
    float _2790 = _2740;
    float _2792 = _2714;
    if (!_2648)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2794 = _2784;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2648)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2800 = _2786;
    out.m_99.x = _2770;
    out.m_99.y = _2774;
    out.m_99.z = _2780;
    out.m_99.w = _2096;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2648)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2806 = _2788;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2648)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2812 = _2790;
    out.m_101.x = _2778;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2648)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2818 = _2792;
    out.m_103.x = _2766;
    out.m_103.y = _2768;
    out.m_103.z = _2782;
    out.m_103.w = _2776;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2130;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2096;
    float _2820 = _2818;
    float _2822 = _2818;
    if (!_2648)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2824 = _2222;
    bool _2826 = !_2648;
    float _2828 = _2824;
    float _2830 = _2824;
    if (!_2826)
    {
        bool _2832 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_1828);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _1828 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2846;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2854 = 1.0 / _2848;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2872 = _2844 * _2854;
            float _2874 = precise::clamp(_2872, 0.0, 1.0);
            float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2880 = fma(_2874, _2852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2798 = _2884;
            _2830 = _2888;
            _2822 = _2880;
            _2810 = _2886;
            _2804 = _2882;
            _2816 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_1828);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2820;
            _2822 = _2904;
            if (!_2902)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2796;
            _2798 = _2906;
            if (!_2902)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2802;
            _2804 = _2908;
            if (!_2902)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2808;
            _2810 = _2910;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2828;
            _2830 = _2912;
            if (!_2902)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2814;
            bool _2916 = !_2902;
            _2816 = _2914;
            if (!_2916)
            {
                bool _2918 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_1828);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _1828 + _2928;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2932;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2940 = 1.0 / _2934;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2958 = _2930 * _2940;
                    float _2960 = precise::clamp(_2958, 0.0, 1.0);
                    float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2966 = fma(_2960, _2938, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2968 = fma(_2960, _2964, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2970 = fma(_2960, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2972 = fma(_2960, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2974 = fma(_2960, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2976 = fma(_2960, _2956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2798 = _2970;
                    _2830 = _2974;
                    _2822 = _2966;
                    _2810 = _2972;
                    _2804 = _2968;
                    _2816 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2798;
    float _2980 = _2830;
    float _2982 = _2822;
    float _2984 = _2810;
    float _2986 = _2804;
    float _2988 = _2816;
    float _2990 = fma(_2614, -0.5, 0.5);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2978;
    float _2996 = _2994 + _2980;
    float _2998 = -_2982;
    float _3000 = _2998 + _2984;
    float _3002 = -_2986;
    float _3004 = _3002 + _2988;
    bool _3006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3008 = fma(_2992, _2996, _2978);
    float _3010 = fma(_2992, _3000, _2982);
    float _3012 = fma(_2992, _3004, _2986);
    float _3014 = _3008 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3016 = fma(_3010, 0.298911988735198974609375, _3014);
    float _3018 = fma(_3012, 0.114477999508380889892578125, _3016);
    out.m_105.x = 0.0;
    float _3020 = -_3018;
    float _3022 = _3010 + _3020;
    float _3024 = -_3018;
    float _3026 = _3008 + _3024;
    float _3028 = -_3018;
    float _3030 = _3012 + _3028;
    float _3032 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3034 = fma(_3022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    float _3036 = fma(_3026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    float _3038 = fma(_3030, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    out.m_101.w = _3032;
    out.m_107.x = _3034;
    out.m_107.y = _3036;
    out.m_107.z = _3038;
    if (!_3006)
    {
        return out;
    }
    float _3040 = -_1790;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1792;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1794;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3052 = _3042 * _3042;
    float _3054 = fma(_3046, _3046, _3052);
    float _3056 = fma(_3050, _3050, _3054);
    float _3058 = sqrt(_3056);
    float _3060 = rsqrt(_3056);
    float _3062 = -_3058;
    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3068 = precise::clamp(_3066, 0.0, 1.0);
    float _3070 = _3046 * _3060;
    float _3072 = _3042 * _3060;
    float _3074 = abs(_3068);
    float _3076 = log2(_3074);
    float _3078 = _3050 * _3060;
    float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3082 = _2614 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2604, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2620, _3078, _3090);
    float _3098 = precise::clamp(_3096, 0.0, 1.0);
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3102 = _3094 + _3100;
    float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = exp2(_3104);
    float _3112 = _3110 * _3108;
    float _3114 = _3098 * _3112;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_105.x = _3116;
    out.m_105.y = _3118;
    out.m_105.z = _3120;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2892 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3178 = as_type<float>(_142);
        out.gl_Position.z = _3178;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_53.w;
    float _148 = float(_126);
    float _150 = -_146;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_146);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    bool _164 = _152 >= _148;
    bool _166 = !_162;
    bool _168 = _164 || _166;
    float _170 = _152;
    if (_168)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _134;
    if (_168)
    {
        out.m_51.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3242 = as_type<float>(_176);
        out.gl_Position.z = _3242;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = 1.0 / _148;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = _152 * _184;
    float _202 = _178 * _178;
    float _204 = _180 * _180;
    float _206 = _182 * _182;
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = fma(_194, _194, _208);
    float _216 = fma(_196, _196, _210);
    float _218 = fma(_198, _198, _212);
    float _220 = sqrt(_214);
    float _222 = in.m_61.x;
    float _224 = in.m_61.y;
    float _226 = in.m_61.z;
    float _228 = sqrt(_216);
    float _230 = sqrt(_218);
    bool _232 = _220 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = _190 * _224;
    float _238 = fma(_188, _222, _236);
    float _240 = _220;
    float _242 = _214;
    float _244 = _194;
    if (_232)
    {
        float _246 = rsqrt(_214);
        _240 = _246;
    }
    float _248 = _240;
    float _250 = 0.0;
    float _252 = 0.0;
    if (!_232)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _254 = _250;
    float _256 = _252;
    bool _258 = _230 > 0.0;
    float _260 = _180 * _224;
    float _262 = _196 * _224;
    float _264 = 0.0;
    float _266 = _256;
    float _268 = _254;
    if (!_232)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = fma(_192, _226, _238);
    float _274 = fma(_178, _222, _260);
    float _276 = 0.0;
    float _278 = _270;
    if (_234)
    {
        float _280 = rsqrt(_216);
        _276 = _280;
    }
    float _282 = _276;
    float _284 = fma(_194, _222, _262);
    float _286 = 0.0;
    float _288 = 0.0;
    if (!_234)
    {
        _286 = 0.0;
        _288 = 0.0;
    }
    float _290 = _286;
    float _292 = _288;
    float _294 = 0.0;
    float _296 = _290;
    float _298 = _292;
    if (!_234)
    {
        _294 = 0.0;
    }
    float _300 = _294;
    float _302 = fma(_182, _226, _274);
    float _304 = 0.0;
    float _306 = _300;
    float _308 = _302;
    if (!_258)
    {
        _304 = 0.0;
    }
    float _310 = _304;
    float _312 = 0.0;
    float _314 = _310;
    if (_258)
    {
        float _316 = rsqrt(_218);
        _312 = _316;
    }
    float _318 = _312;
    float _320 = 0.0;
    if (!_258)
    {
        _320 = 0.0;
    }
    float _322 = _320;
    float _324 = _322;
    if (_232)
    {
        float _326 = _248 * _178;
        _266 = _326;
    }
    float _328 = _266;
    if (!_258)
    {
        _242 = 0.0;
    }
    float _330 = _242;
    float _332 = _330;
    if (_232)
    {
        float _334 = _248 * _188;
        _268 = _334;
    }
    float _336 = _268;
    if (_232)
    {
        float _338 = _248 * _194;
        _278 = _338;
    }
    float _340 = _278;
    if (_234)
    {
        float _342 = _282 * _180;
        _306 = _342;
    }
    float _344 = _306;
    float _346 = fma(_198, _226, _284);
    if (_234)
    {
        float _348 = _282 * _190;
        _296 = _348;
    }
    float _350 = _296;
    if (_234)
    {
        float _352 = _282 * _196;
        _298 = _352;
    }
    float _354 = _298;
    if (_258)
    {
        float _356 = _318 * _182;
        _314 = _356;
    }
    float _358 = _314;
    if (_258)
    {
        float _360 = _318 * _192;
        _324 = _360;
    }
    float _362 = _324;
    if (_258)
    {
        float _364 = _318 * _198;
        _332 = _364;
    }
    float _366 = _332;
    bool _368 = !_186;
    float _386;
    if (!_368)
    {
        float _370 = in.m_63.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        _386 = _200;
    }
    _388 = false;
    float _390 = _386;
    float _392 = in.m_48.x;
    float _394 = in.m_48.y;
    float _396 = in.m_48.z;
    float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _400 = -_200;
    float _402 = _400 + 1.0;
    float _404 = in.m_63.z;
    float _406 = in.m_63.w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _410 = _390 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _390 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _424;
    float _428 = 1.0 / _414;
    float _430 = in.m_57.w;
    float _432 = _200 * _398;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = _402 * _398;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = 1.0 / _418;
    float _442 = in.m_63.x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = _190 * _394;
    float _454 = in.m_63.y;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _458 = _456 != 0;
    float _460 = 1.0 / _426;
    float _462 = _404 * 2.0;
    float _464 = fma(_188, _392, _452);
    float _466 = _196 * _394;
    float _468 = _422 * _428;
    float _470 = fma(_192, _396, _464);
    float _472 = fma(_194, _392, _466);
    float _474 = floor(_462);
    float _476 = precise::min(_434, _438);
    float _478 = _410 * _440;
    float _480 = fma(_198, _396, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _484 = _390 + _482;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _490 = log2(_488);
    float _492 = _396;
    float _494 = _394;
    int _496 = as_type<int>(_404);
    if (_458)
    {
        _244 = _442;
    }
    float _498 = _244;
    float _500 = _484 * _460;
    float _502 = _498;
    if (!_458)
    {
        _502 = _404;
    }
    float _504 = _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _508 = 1.0 + _506;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_458)
    {
        _492 = _454;
    }
    float _512 = _492;
    float _514 = fma(_446, _468, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _516 = _474 > 0.0;
    float _518 = _504 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _520 = _474 >= 0.0;
    bool _522 = isnan(_474);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    float _530 = 1.0 / _508;
    float _532 = _512;
    if (!_458)
    {
        _532 = _442;
    }
    float _534 = _532;
    float _536 = -_510;
    float _538 = fma(_518, 2.0, _536);
    int _540 = _528 ? 0 : 1;
    float _542 = fma(_450, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _544 = _490 * _152;
    float _546 = _534 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _548 = ~_540;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -_152;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[86].x, _538);
    float _558 = fma(_546, -2.0, _486);
    float _560 = exp2(_544);
    int _562 = _552;
    if (!_516)
    {
        int _564 = ~_540;
        int _566 = _564 + 1;
        _562 = _566;
    }
    int _568 = _562;
    float _570 = _454 * 2.0;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _574 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _558);
    bool _576 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _578 = isnan(1.0);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _584 = _580 || _582;
    float _586 = floor(_570);
    bool _588 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _602 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[88].z, _572);
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _614 = _612 != 0;
    float _616 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[88].w, _598);
    float _618 = fma(_600, _454, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _620 = -_560;
    float _622 = _620 + 1.0;
    float _624 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _602);
    float _626 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _616);
    float _628 = _618 * _152;
    bool _630 = !_610;
    int _632 = _630 ? 0 : 1;
    float _634 = _454 + _404;
    float _636 = _596 ? _622 : 0.0;
    float _638 = _442 + _404;
    bool _640 = !_606;
    int _642 = _640 ? 0 : 1;
    float _644 = _634 + (-1.0);
    float _646 = _624;
    if (_584)
    {
        float _648 = _636 * _530;
        _170 = _648;
    }
    float _650 = _170;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _658 = _656 != 0;
    float _660 = _442 * 2.0;
    bool _662 = _586 >= 0.0;
    bool _664 = isnan(_586);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _674 = _442 + _454;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _686 = _684 != 0;
    float _688 = _638 + (-1.0);
    int _690 = _670 ? 0 : 1;
    float _692 = floor(_660);
    bool _694 = _586 > 0.0;
    float _696 = _674 + (-1.0);
    int _698 = ~_690;
    int _700 = _698 + 1;
    int _702 = _700 + 1;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _706 = !_614;
    int _708 = _706 ? 0 : 1;
    float _710 = _470 + _430;
    bool _712 = !_686;
    int _714 = _712 ? 0 : 1;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _718 = in.m_59.w;
    bool _720 = !_654;
    int _722 = _720 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _724;
    bool _728 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _730 = isnan(_390);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    int _744 = _702;
    if (!_694)
    {
        int _746 = ~_690;
        int _748 = _746 + 1;
        _744 = _748;
    }
    int _750 = _744;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _764 = _762 != 0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _770 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _772 = _692 >= 0.0;
    bool _774 = isnan(_692);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _792 = _780 ? 0 : 1;
    float _794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _796 = fma(_786, _468, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _798 = fma(_742, _468, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _800 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _802 = _692 > 0.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _804;
    float _808 = fma(_790, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _810;
    float _814 = fma(_768, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _816 = fma(_806, _500, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _818 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _820 = isnan(_390);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = fma(_812, _500, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _832 = _650 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _834 = fma(_726, _500, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _836 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _838 = isnan(_390);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -_828;
    float _850 = _848 + 1.0;
    float _852 = _832 * _716;
    float _854 = -_738;
    float _856 = _854 + 1.0;
    float _858 = _480 + _718;
    float _860 = _738 * _850;
    float _862 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _852);
    bool _864 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _866 = isnan(_390);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = _770 * _752;
    float _878 = -_846;
    float _880 = _878 + 1.0;
    float _882 = floor(_862);
    float _884 = _846 * _856;
    float _886 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].y, _876);
    float _888 = _874 * _880;
    float _890 = _782 * _794;
    float _892 = -_874;
    float _894 = _892 + 1.0;
    bool _896 = !_756;
    int _898 = _896 ? 0 : 1;
    float _900 = _796 * _888;
    float _902 = _514 * _888;
    float _904 = _798 * _888;
    float _906 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].z, _890);
    int _908 = ~_792;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].x, _900);
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].y, _902);
    float _918 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[143].z, _904);
    int _920 = _912;
    if (!_802)
    {
        int _922 = ~_792;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = floor(_886);
    float _930 = -_882;
    float _932 = _862 + _930;
    float _934 = _886 + 0.25;
    float _936 = fma(_808, _884, _914);
    float _938 = fma(_542, _884, _916);
    float _940 = fma(_814, _884, _918);
    bool _942 = !_760;
    int _944 = _942 ? 0 : 1;
    float _946 = fma(_816, _860, _936);
    float _948 = floor(_906);
    bool _950 = _932 >= 0.5;
    bool _952 = isnan(_932);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.5);
    bool _958 = _954 || _956;
    float _960 = _862 + 0.25;
    int _962 = abs(_898);
    float _964 = _862 * 6.283185482025146484375;
    int _966 = abs(_944);
    float _968 = fma(_442, 6.283185482025146484375, _628);
    float _970 = floor(_934);
    float _972 = float(_568);
    float _974 = -_928;
    float _976 = _886 + _974;
    float _978 = float(_962);
    float _980 = _886 * 6.283185482025146484375;
    float _982 = _906 + 0.25;
    float _984 = _978 * _972;
    float _986 = float(_926);
    float _988 = -_948;
    float _990 = _906 + _988;
    float _992 = float(_966);
    float _994 = floor(_960);
    bool _996 = !_958;
    float _998 = _996 ? 0.5 : (-0.5);
    float _1000 = _906 * 6.283185482025146484375;
    bool _1002 = _976 >= 0.5;
    bool _1004 = isnan(_976);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    float _1012 = -_970;
    float _1014 = _934 + _1012;
    int _1016 = abs(_722);
    float _1018 = _992 * _986;
    int _1020 = abs(_632);
    float _1022 = floor(_982);
    bool _1024 = _990 >= 0.5;
    bool _1026 = isnan(_990);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.5);
    bool _1032 = _1028 || _1030;
    float _1034 = _1000 * 0.15915493667125701904296875;
    bool _1036 = !_1010;
    float _1038 = _1036 ? 0.5 : (-0.5);
    float _1040 = _984 * (-2.0);
    float _1042 = _964 * 0.15915493667125701904296875;
    float _1044 = _998 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1046 = _1044 * 2.0;
    float _1048 = float(_1016);
    float _1050 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1052 = _1050 * 2.0;
    float _1054 = -_994;
    float _1056 = _960 + _1054;
    bool _1058 = !_682;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _980 * 0.15915493667125701904296875;
    float _1064 = _1048 * _1052;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1068 = _1066 != 0;
    float _1070 = _1042 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    float _1074 = -_1022;
    float _1076 = _982 + _1074;
    int _1078 = abs(_642);
    float _1080 = _968 * 0.15915493667125701904296875;
    int _1082 = abs(_1060);
    float _1084 = _1018 * (-2.0);
    bool _1086 = !_1032;
    float _1088 = _1086 ? 0.5 : (-0.5);
    float _1090 = -_476;
    float _1092 = _1090 + 1.0;
    float _1094 = _1062 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = float(_1020);
    float _1100 = fma(_672, _1084, _672);
    bool _1102 = _1056 > 0.5;
    float _1104 = fma(_830, _860, _938);
    float _1106 = _1098 * _1046;
    bool _1108 = !_1068;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = in.m_65.x;
    float _1114 = in.m_65.y;
    float _1116 = in.m_65.z;
    float _1118 = float(_1082);
    float _1120 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1122 = _1120 * 2.0;
    float _1124 = float(_1078);
    float _1126 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    int _1128 = abs(_1110);
    float _1130 = _1118 * _1122;
    int _1132 = abs(_708);
    float _1134 = fma(_1124, _1126, _1106);
    float _1136 = _1056;
    float _1138 = _1014;
    float _1140 = _1076;
    if (_1102)
    {
        float _1142 = -_1056;
        float _1144 = _1142 + 1.0;
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1150 = _1014 > 0.5;
    float _1152 = in.m_67.z;
    float _1154 = float(_1128);
    float _1156 = fma(_1146, 4.0, -1.0);
    float _1158 = float(_1132);
    float _1160 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].x, _946);
    bool _1162 = !_658;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = fma(_1154, _1148, _1064);
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1170 = _1034 * 6.283185482025146484375;
    float _1172 = sin(_1170);
    float _1174 = in.m_67.x;
    float _1176 = fma(_1158, _1168, _1134);
    int _1178 = abs(_1164);
    if (_1150)
    {
        float _1180 = -_1014;
        float _1182 = _1180 + 1.0;
        _1138 = _1182;
    }
    float _1184 = _1138;
    bool _1186 = !_678;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_1176, 3.1415927410125732421875, _1112);
    bool _1192 = _1076 > 0.5;
    float _1194 = fma(_1184, 4.0, -1.0);
    int _1196 = abs(_1188);
    float _1198 = fma(_800, _1040, _800);
    float _1200 = float(_1196);
    float _1202 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1204 = float(_1178);
    float _1206 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1208 = fma(_1190, _1040, _1190);
    float _1210 = _442 + (-0.5);
    float _1212 = fma(_1200, _1206, _1130);
    float _1214 = fma(_1204, _1202, _1166);
    bool _1216 = !_764;
    int _1218 = _1216 ? 0 : 1;
    float _1220 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1208);
    float _1222 = _858 * _858;
    if (_1192)
    {
        float _1224 = -_1076;
        float _1226 = _1224 + 1.0;
        _1140 = _1226;
    }
    float _1228 = _1140;
    int _1230 = abs(_714);
    float _1232 = fma(_1214, 3.1415927410125732421875, _1114);
    int _1234 = abs(_1218);
    float _1236 = fma(_1198, _650, _1220);
    float _1238 = fma(_710, _710, _1222);
    float _1240 = fma(_1228, 4.0, -1.0);
    float _1242 = _1080 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = float(_1230);
    float _1248 = _454 + (-0.5);
    float _1250 = float(_750);
    float _1252 = fma(_1232, _1084, _1232);
    float _1254 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1256 = _1236 * 0.15915493667125701904296875;
    float _1258 = sqrt(_1238);
    float _1260 = float(_1234);
    float _1262 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1252);
    float _1264 = fma(_1246, _1254, _1212);
    float _1266 = in.m_67.y;
    float _1268 = _1260 * _1250;
    float _1270 = fma(_1100, _650, _1262);
    float _1272 = fma(_1264, 3.1415927410125732421875, _1116);
    float _1274 = abs(_1244);
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1278 = _1268 * (-2.0);
    float _1280 = in.m_69.x;
    float _1282 = in.m_69.y;
    float _1284 = in.m_69.z;
    float _1286 = _1270 * 0.15915493667125701904296875;
    float _1288 = _1256 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = fma(_704, _1278, _704);
    float _1294 = fma(_1272, _1278, _1272);
    float _1296 = _404 + (-0.5);
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1294);
    float _1300 = fma(_834, _860, _940);
    float _1302 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1276);
    float _1304 = _1286 * 6.283185482025146484375;
    float _1306 = sin(_1304);
    float _1308 = fma(_1292, _650, _1298);
    float _1310 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1104);
    float _1312 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1300);
    float _1314 = _1308 * 0.15915493667125701904296875;
    float _1316 = -_1302;
    float _1318 = _1316 + _1266;
    float _1320 = _1286 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1318);
    float _1326 = _1160 * _1280;
    float _1328 = _1310 * _1282;
    float _1330 = _1312 * _1284;
    float _1332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1174);
    float _1334 = _1256 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1340 = _660 + (-1.0);
    float _1342 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1344 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1338 * _1332;
    float _1348 = _1290 * _1306;
    float _1350 = _1340 * _1258;
    float _1352 = _1314 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1290 * _1322;
    float _1358 = _1342 * _1324;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1362 = _1350 * 0.75;
    float _1364 = _1344 * _1360;
    float _1366 = _1314 * 6.283185482025146484375;
    float _1368 = sin(_1366);
    float _1370 = _1336 * _1306;
    float _1372 = _1336 * _1322;
    float _1374 = _1362 * 0.15915493667125701904296875;
    float _1376 = _1290 * _1354;
    float _1378 = _1336 * _1354;
    float _1380 = _1322 * _1354;
    float _1382 = _1306 * _1354;
    float _1384 = _1376 * _1358;
    float _1386 = _1378 * _1358;
    float _1388 = _1374 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = fma(_1368, _1356, _1370);
    float _1394 = -_1348;
    float _1396 = fma(_1368, _1372, _1394);
    float _1398 = -_1372;
    float _1400 = fma(_1368, _1348, _1398);
    float _1402 = -_1358;
    float _1404 = _1368 * _1402;
    float _1406 = fma(_1392, _1346, _1384);
    float _1408 = fma(_1396, _1346, _1386);
    float _1410 = fma(_1368, _1370, _1356);
    float _1412 = fma(_1380, _1346, _1404);
    float _1414 = fma(_1400, _1364, _1406);
    float _1416 = _1374 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = fma(_1410, _1364, _1408);
    float _1422 = fma(_1382, _1364, _1412);
    float _1424 = _1414 * _350;
    float _1426 = _1414 * _354;
    float _1428 = _1414 * _344;
    float _1430 = fma(_1422, _336, _1424);
    float _1432 = fma(_1422, _340, _1426);
    float _1434 = fma(_1422, _328, _1428);
    float _1436 = fma(_1420, _362, _1430);
    float _1438 = fma(_1420, _366, _1432);
    float _1440 = fma(_1420, _358, _1434);
    float _1442 = _1436 * _1390;
    float _1444 = _1436 * _1418;
    float _1446 = -_1442;
    float _1448 = fma(_1438, _1418, _1446);
    float _1450 = fma(_1438, _1390, _1444);
    float _1452 = in.m_71.y;
    float _1454 = _858 + _1448;
    float _1456 = _710 + _1450;
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1460 = _1454 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1464 = _1456 + _1462;
    float _1466 = _1460 * _1460;
    float _1468 = fma(_1464, _1464, _1466);
    float _1470 = sqrt(_1468);
    float _1472 = _394 + _1452;
    float _1474 = _1472 + _1440;
    bool _1476 = _1470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1470 + _1478;
    float _1482 = _1390;
    float _1484 = _1422;
    float _1486 = _1434;
    float _1488 = _1470;
    float _1490 = _1480;
    float _1492 = _1244;
    if (_1476)
    {
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1482 = _1494;
    }
    float _1496 = _1482;
    if (_1476)
    {
        float _1498 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _494 = _1498;
    }
    float _1500 = _494;
    float _1502 = _1500;
    if (!_1476)
    {
        _1484 = _1456;
    }
    float _1504 = _1484;
    float _1506 = _1504;
    if (_1476)
    {
        float _1508 = rsqrt(_1468);
        _1486 = _1508;
    }
    float _1510 = _1486;
    if (_1476)
    {
        float _1512 = _1480 * _1496;
        _1488 = _1512;
    }
    float _1514 = _1488;
    if (_1476)
    {
        float _1516 = _1514 * 0.15915493667125701904296875;
        _1490 = _1516;
    }
    float _1518 = _1490;
    float _1520 = _1514;
    if (_1476)
    {
        float _1522 = _1518 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = _1526;
    if (_1476)
    {
        float _1530 = fma(_1526, _1500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1528 = _1530;
    }
    float _1532 = _1528;
    float _1534 = _1532;
    if (!_1476)
    {
        _1502 = _1454;
    }
    float _1536 = _1502;
    float _1538 = _1536;
    if (_1476)
    {
        float _1540 = _1510 * _1532;
        _1534 = _1540;
    }
    float _1542 = _1534;
    float _1544 = _1542;
    if (_1476)
    {
        float _1546 = fma(_1460, _1542, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1538 = _1546;
    }
    float _1548 = _1538;
    float _1550 = _1548;
    if (_1476)
    {
        float _1552 = fma(_1464, _1542, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1506 = _1552;
    }
    float _1554 = _1506;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1562 = _1554 + _1560;
    float _1564 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1566 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5264 = float2(_1566, _1564);
    float _1568 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5264, float2(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5264, float2(0.0), isnan(_5264)), level(0.0)).x;
    float _1570 = _1440;
    float _1572 = _1562;
    float _1574 = _1554;
    if (_1476)
    {
        float _1576 = _1518 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1570 = _1578;
    }
    float _1580 = _1570;
    if (!_1476)
    {
        _1544 = _1474;
    }
    float _1582 = _1544;
    float _1584 = -_710;
    float _1586 = _1584 + _1554;
    float _1588 = -_858;
    float _1590 = _1588 + _1548;
    bool _1592 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1594 = isnan(0.5);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1600 = _1596 || _1598;
    float _1602 = _1582;
    if (_1476)
    {
        float _1604 = _1580 + (-1.0);
        _1572 = _1604;
    }
    float _1606 = _1572;
    float _1608 = _1606;
    if (_1476)
    {
        float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_1476)
    {
        float _1614 = fma(_1474, _1580, _1612);
        _1602 = _1614;
    }
    float _1616 = _1602;
    float _1618 = -_1472;
    float _1620 = _1618 + _1616;
    float _1622 = fma(_858, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1624 = _1620 * _1620;
    float _1626 = fma(_1586, _1586, _1624);
    float _1628 = fma(_1590, _1590, _1626);
    float _1630 = sqrt(_1628);
    float _1632 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1634 = floor(_1632);
    float _1636 = floor(_1622);
    bool _1638 = _1630 > 0.0;
    float _1640 = -_1634;
    float _1642 = _1632 + _1640;
    float _1644 = -_1636;
    float _1646 = _1622 + _1644;
    float _1648 = fma(_1568, 100.0, _1616);
    float _1650 = fma(_1568, 100.0, _1472);
    float _1652 = _1616;
    float _1654 = _1632;
    float _1656 = _1628;
    if (!_1638)
    {
        _1652 = _1548;
    }
    float _1658 = _1652;
    float _1660 = _1658;
    if (!_1638)
    {
        _1654 = _1648;
    }
    float _1662 = _1654;
    bool _1664 = !_1638;
    float _1666 = _1662;
    if (!_1664)
    {
        float _1668 = _302 * _302;
        float _1670 = fma(_272, _272, _1668);
        float _1672 = rsqrt(_1628);
        float _1674 = fma(_346, _346, _1670);
        float _1676 = sqrt(_1674);
        float _1678 = _1586 * _1672;
        float _1680 = _1620 * _1672;
        float _1682 = _1590 * _1672;
        bool _1684 = _1676 > 0.0;
        float _1686 = _1676;
        float _1688 = _1672;
        if (!_1684)
        {
            _1686 = _1648;
        }
        float _1690 = _1686;
        _1666 = _1690;
        if (!_1684)
        {
            _1688 = _1548;
        }
        float _1692 = _1688;
        bool _1694 = !_1684;
        _1660 = _1692;
        if (!_1694)
        {
            float _1696 = rsqrt(_1674);
            float _1698 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1700 = _302 * _1696;
            float _1702 = _272 * _1696;
            float _1704 = _346 * _1696;
            float _1706 = _1680 * _1700;
            float _1708 = fma(_1678, _1702, _1706);
            float _1710 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1712 = fma(_1682, _1704, _1708);
            float _1714 = _1712 * _1710;
            float _1716 = fma(_272, _1714, _1554);
            float _1718 = fma(_302, _1714, _1648);
            float _1720 = fma(_346, _1714, _1548);
            _1666 = _1718;
            _1574 = _1716;
            _1660 = _1720;
            _1656 = _1698;
        }
    }
    float _1722 = _1666;
    float _1724 = _1574;
    float _1726 = _1660;
    float _1728 = _1656;
    float _1730 = _1724;
    float _1732 = _1726;
    float _1734 = _1728;
    if (_1600)
    {
        _1550 = _1722;
    }
    float _1736 = _1550;
    float _1738 = _1736;
    if (!_1600)
    {
        float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1742 = _1650 + _1740;
        float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1746 = _710 + _1744;
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1750 = -_710;
        float _1752 = _1750 + _1724;
        float _1754 = _1742 * _1742;
        float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1758 = _858 + _1756;
        float _1760 = -_1650;
        float _1762 = _1760 + _1722;
        float _1764 = fma(_1746, _1746, _1754);
        float _1766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1768 = fma(_1758, _1758, _1764);
        float _1770 = sqrt(_1768);
        float _1772 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1774 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1776 = _1774 * _1766;
        float _1778 = -_858;
        float _1780 = _1778 + _1726;
        float _1782 = _1772 * _1776;
        float _1784 = fma(_1752, _1782, _710);
        float _1786 = fma(_1762, _1782, _1650);
        float _1788 = fma(_1780, _1782, _858);
        _1738 = _1786;
        _1730 = _1784;
        _1732 = _1788;
        _1734 = _1782;
    }
    float _1790 = _1738;
    float _1792 = _1730;
    float _1794 = _1732;
    float _1796 = _1734;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1800 = _1790 + _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1792 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1808 = _1794 + _1806;
    float _1810 = _1800 * _1800;
    float _1812 = in.m_73.y;
    float _1814 = fma(_1804, _1804, _1810);
    float2 _5650 = float2(_1642, _1646);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5650, float2(0.0), isnan(_5650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5650, float2(0.0), isnan(_5650)), level(0.0)).x;
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1820 = _1818 != 0;
    float _1822 = in.m_73.x;
    float _1824 = fma(_1808, _1808, _1814);
    float _1826 = rsqrt(_1824);
    float _1828 = sqrt(_1824);
    float _1830 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1832 = _1804 * _1830;
    float _1834 = _1808 * _1830;
    float _1836 = _1832 * _1832;
    float _1838 = _1834 * _1834;
    float _1840 = _1836 + _1838;
    float _1842 = sqrt(_1840);
    bool _1844 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1848 = _1842 + _1846;
    float _1850 = _1808;
    float _1852 = _1826;
    float _1854 = _1848;
    float _1856 = _1810;
    float _1858 = _1800;
    if (_1844)
    {
        float _1860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1850 = _1860;
    }
    float _1862 = _1850;
    if (_1844)
    {
        float _1864 = rsqrt(_1840);
        _1852 = _1864;
    }
    float _1866 = _1852;
    float _1868 = _1866;
    if (_1844)
    {
        float _1870 = _1848 * _1862;
        _1854 = _1870;
    }
    float _1872 = _1854;
    if (_1844)
    {
        float _1874 = _1872 * 0.15915493667125701904296875;
        _1856 = _1874;
    }
    float _1876 = _1856;
    float _1878 = _1862;
    float _1880 = _1876;
    if (_1844)
    {
        float _1882 = _1876 * 6.283185482025146484375;
        float _1884 = sin(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1890 = precise::max(0.0, _1888);
    float _1892 = _1796;
    float _1894 = _1890;
    if (_1844)
    {
        float _1896 = _1876 * 6.283185482025146484375;
        float _1898 = cos(_1896);
        _1892 = _1898;
    }
    float _1900 = _1892;
    float _1902 = -_1830;
    float _1904 = -_1890;
    float _1906 = fma(_1800, _1902, _1904);
    if (!_1844)
    {
        _1858 = _1834;
    }
    float _1908 = _1858;
    float _1910 = _1908;
    if (_1844)
    {
        float _1912 = _1906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1894 = _1912;
    }
    float _1914 = _1894;
    float _1916 = _1914;
    if (!_1844)
    {
        _1880 = _1836;
    }
    float _1918 = _1880;
    float _1920 = _1886;
    float _1922 = _1918;
    if (_1844)
    {
        float _1924 = fma(_1886, _1914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1920 = _1924;
    }
    float _1926 = _1920;
    float _1928 = _1926;
    if (_1844)
    {
        float _1930 = _1900 + (-1.0);
        _1916 = _1930;
    }
    float _1932 = _1916;
    float _1934 = _1932;
    if (_1844)
    {
        float _1936 = _1866 * _1926;
        _1492 = _1936;
    }
    float _1938 = _1492;
    if (!_1844)
    {
        _1928 = _1832;
    }
    float _1940 = _1928;
    float _1942 = _1940;
    if (_1844)
    {
        float _1944 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _308 = _1944;
    }
    float _1946 = _308;
    if (_1844)
    {
        float _1948 = _1832 * _1938;
        _1942 = _1948;
    }
    float _1950 = _1942;
    if (!_1844)
    {
        _1868 = _1906;
    }
    float _1952 = _1868;
    float _1954 = _1952;
    if (_1844)
    {
        float _1956 = _1834 * _1938;
        _1910 = _1956;
    }
    float _1958 = _1910;
    if (_1844)
    {
        float _1960 = fma(_1906, _1900, _1946);
        _1954 = _1960;
    }
    float _1962 = _1954;
    if (_1844)
    {
        float _1964 = _1950 * _1950;
        _1922 = _1964;
    }
    float _1966 = _1922;
    if (!_1844)
    {
        _1934 = _1838;
    }
    float _1968 = _1934;
    float _1970 = _1968;
    if (_1844)
    {
        float _1972 = _1958 * _1958;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = fma(_1962, _1962, _1966);
    float _1978 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1980 = _1976 + _1974;
    float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1984 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1982);
    float _1986 = precise::clamp(_1984, 0.0, 1.0);
    float _1988 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1990 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1978);
    float _1992 = rsqrt(_1980);
    float _1994 = -_1986;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1990);
    float _2000 = _1988 * _442;
    float _2002 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2004 = abs(_1996);
    float _2006 = log2(_2004);
    float _2008 = _1992 * _1950;
    float _2010 = _1992 * _1962;
    float _2012 = trunc(_2000);
    int _2014 = int(_2012);
    float _2016 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = _1992 * _1958;
    float _2020 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2022 = -_2016;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2022);
    float _2026 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2028 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = _2020 * _442;
    float _2032 = -_2018;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2024);
    float _2036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2038 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2040 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2042 = fma(_2034, -0.5, 0.5);
    float _2044 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2026);
    float _2046 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2038);
    float _2048 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2040);
    float _2050 = fma(_2034, 0.5, 0.5);
    float _2052 = sqrt(_2042);
    float _2054 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2056 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2048);
    float _2058 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2044);
    int _2060 = _2014 << 4;
    int _2062 = _2060 + 1712;
    float _2064 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2066 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2068 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2070 = exp2(_2028);
    float _2072 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2074 = fma(_2050, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2076 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2072);
    float _2080 = _2010 + 1.0;
    float _2082 = -_2076;
    float _2084 = fma(_2082, _2036, 1.0);
    float _2086 = trunc(_2030);
    int _2088 = int(_2086);
    float _2090 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2078);
    float _2092 = fma(_2050, _2074, -0.212114393711090087890625);
    float _2094 = _2052 * 0.636619746685028076171875;
    float _2096 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2090);
    float _2098 = fma(_2050, _2092, 1.570728778839111328125);
    float _2100 = log2(_2084);
    float _2102 = -_2010;
    float _2104 = fma(_2070, _2080, _2102);
    float _2106 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2108 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2110 = -_2098;
    float _2112 = fma(_2094, _2110, 1.0);
    float _2114 = fma(_2104, 0.5, 0.5);
    float _2116 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2108);
    float _2118 = 1.0 / _2096;
    float _2120 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2106);
    int _2122 = _2088 << 4;
    int _2124 = _2122 + 1968;
    float _2126 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2116);
    float _2128 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2120);
    float _2130 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2126);
    float _2132 = _2100 * 0.693147182464599609375;
    float _2134 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2128);
    uint _2137 = uint(int(uint(_2124) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    float _2153 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2155 = _2134 * _2118;
    float _2157 = _2130 * _2118;
    uint _2159 = uint(int(uint(_2062) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c9)._m0[int(_2169)][_2171];
    float _2175 = fma(_2155, 0.5, 0.5);
    float _2177 = fma(_2157, -0.5, 0.5);
    float3 _6255 = float3(_2175, _2177, _2153);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6255, float3(0.0), isnan(_6255)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6255, float3(0.0), isnan(_6255)), level(0.0)).x;
    float3 _6266 = float3(_2175, _2177, _2153);
    float4 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6266, float3(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6266, float3(0.0), isnan(_6266)), level(0.0)).xyzw;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = _2182.w;
    float2 _6282 = float2(_2112, _2114);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6282, float2(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6282, float2(0.0), isnan(_6282)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    int _2202 = _2062 + 8;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    float _2212 = 0.0;
    int _2214 = as_type<int>(_2175);
    float _2216 = _1812;
    float _2218 = as_type<float>(_2062);
    float _2220 = _2153;
    float _2222 = _2134;
    if (_1820)
    {
        float _2224 = in.m_63.z;
        _2212 = _2224;
    }
    float _2226 = _2212;
    int _2228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2230 = _2228 != 0;
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2234 = _406 > 0.5;
    float _2236 = -_1812;
    float _2238 = _2236 + 1.0;
    bool _2240 = _404 > 0.5;
    float _2242 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2244 = _2124 + 8;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[int(_2248)][_2250];
    bool _2254 = _454 > 0.5;
    out.m_75.x = _1792;
    out.m_75.y = _1790;
    out.m_75.z = _1794;
    int _2256 = _2240 ? as_type<int>(_2238) : as_type<int>(_1812);
    float _2258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2262 = _2260 != 0;
    bool _2264 = _2262;
    float _2266 = _1822;
    if (_1820)
    {
        float _2268 = -_1822;
        float _2270 = _2268 + 1.0;
        _2214 = as_type<int>(_2270);
    }
    int _2272 = _2214;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2276 = _2274 != 0;
    int _2278 = _2254 ? as_type<int>(_2238) : as_type<int>(_1812);
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2282 = _2280 != 0;
    float _2284 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2286 = _2262 ? as_type<float>(_2256) : _1812;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2290 = _2276 ? as_type<float>(_2278) : _1812;
    bool _2292 = _2276;
    if (_2230)
    {
        float _2294 = _2234 ? _2238 : _1812;
        _2216 = _2294;
    }
    float _2296 = _2216;
    int _2298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2300 = _2298 != 0;
    float _2302 = fma(_2286, _2284, -0.5);
    if (_1820)
    {
        bool _2304 = _2226 > 0.5;
        _2292 = _2304;
    }
    bool _2306 = _2292;
    float _2308 = _2143 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1820)
    {
        _2218 = _1822;
    }
    float _2310 = _2218;
    float _2312 = _2310;
    if (_2282)
    {
        float _2314 = -_1822;
        float _2316 = _2314 + 1.0;
        _496 = as_type<int>(_2316);
    }
    int _2318 = _496;
    if (_2282)
    {
        bool _2320 = _442 > 0.5;
        _2264 = _2320;
    }
    bool _2322 = _2264;
    float _2324 = _2151 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_1820)
    {
        float _2326 = _2306 ? as_type<float>(_2272) : _1822;
        _2312 = _2326;
    }
    float _2328 = _2312;
    float _2330 = -_574;
    float _2332 = fma(_626, _2302, _2330);
    float _2334 = _2332;
    if (!_2282)
    {
        _2220 = _1822;
    }
    float _2336 = _2220;
    float _2338 = _2165 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2340 = _2336;
    int _2342 = as_type<int>(_2165);
    if (_2282)
    {
        float _2344 = _2322 ? as_type<float>(_2318) : _1822;
        _2340 = _2344;
    }
    float _2346 = _2340;
    if (_2300)
    {
        float _2348 = -_1822;
        float _2350 = _2348 + 1.0;
        _2342 = as_type<int>(_2350);
    }
    int _2352 = _2342;
    float _2354 = in.m_77.x;
    float _2356 = in.m_77.y;
    float _2358 = in.m_77.z;
    float _2360 = -_1302;
    float _2362 = -_1266;
    bool _2364 = _2360 != _2362;
    bool _2366 = isnan(_2360);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(_2362);
    bool _2372 = _2368 || _2370;
    float _2374 = _2173 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2376 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2300)
    {
        float _2378 = _2254 ? as_type<float>(_2352) : _1822;
        _2266 = _2378;
    }
    float _2380 = _2266;
    float _2382 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2384 = _1174 == 0.0;
    bool _2386 = !_2372;
    bool _2388 = _2384 && _2386;
    float _2390 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2392 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2394 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2398 = fma(_2382, _2380, -0.5);
    bool _2400 = _1152 == 0.0;
    bool _2402 = _2400 && _2388;
    float _2404 = in.m_79.x;
    float _2406 = in.m_79.y;
    float _2408 = in.m_79.z;
    float _2410 = in.m_79.w;
    float _2412 = _2252 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2414 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2416 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2418 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2420 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2426 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2428 = fma(_624, _2398, _556);
    out.m_81.x = _2394;
    out.m_81.y = _2376;
    out.m_81.z = _2420;
    float _2430 = _2418;
    float _2432 = _2420;
    if (_2402)
    {
        _646 = _2354;
    }
    float _2434 = _646;
    float _2436 = _2434;
    if (!_2402)
    {
        float _2438 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2354);
        _2436 = _2438;
    }
    float _2440 = _2436;
    float _2442 = -_1816;
    float _2444 = _2442 + 1.0;
    out.m_83.x = _2414;
    out.m_83.y = _2392;
    out.m_83.z = _2416;
    out.m_83.w = _2422;
    float _2446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2448 = _2328 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2450 = _2428 + 0.5;
    float _2452 = exp2(_2242);
    float _2454 = _2418 * _2288;
    float _2456 = _2288;
    if (_2402)
    {
        _2456 = _2356;
    }
    float _2458 = _2456;
    float _2460 = _2448 * _2396;
    float _2462 = _2332 + 0.5;
    float _2464 = _2458;
    if (_2402)
    {
        _2334 = _2358;
    }
    float _2466 = _2334;
    float _2468 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2470 = _2466;
    if (_2402)
    {
        _2430 = _2458;
    }
    float _2472 = _2430;
    float _2474 = _2426 * _2424;
    float _2476 = _2472;
    if (!_2402)
    {
        _2464 = _2356;
    }
    float _2478 = _2464;
    float _2480 = _2468 * _2446;
    if (_2402)
    {
        _2432 = _2466;
    }
    float _2482 = _2432;
    out.m_85.x = _2450;
    out.m_85.y = _2462;
    float _2484 = _2482;
    if (!_2402)
    {
        _2470 = _2358;
    }
    float _2486 = _2470;
    if (!_2402)
    {
        float _2488 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2478);
        _2476 = _2488;
    }
    float _2490 = _2476;
    float _2492 = _2408 * _2354;
    float _2494 = _2404 * _2478;
    out.m_87.x = _2454;
    out.m_87.y = _2474;
    out.m_87.z = _2460;
    out.m_87.w = _2480;
    float _2496 = _2406 * _2486;
    float _2498 = -_2492;
    float _2500 = fma(_2404, _2486, _2498);
    if (!_2402)
    {
        float _2502 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2486);
        _2484 = _2502;
    }
    float _2504 = _2484;
    float _2506 = -_2494;
    float _2508 = fma(_2406, _2354, _2506);
    float _2510 = -_2496;
    float _2512 = fma(_2408, _2478, _2510);
    float _2514 = _2500 * _2410;
    float _2516 = -_2490;
    float _2518 = _1368 * _2516;
    float _2520 = _2508 * _2410;
    float _2522 = _2512 * _2410;
    float _2524 = _1376 * _2514;
    float _2526 = _1376 * _2406;
    float _2528 = _1378 * _2490;
    float _2530 = fma(_1380, _2440, _2518);
    float _2532 = _1376 * _2490;
    float _2534 = -_2514;
    float _2536 = _1368 * _2534;
    float _2538 = -_2406;
    float _2540 = _1368 * _2538;
    float _2542 = _1378 * _2514;
    float _2544 = fma(_1392, _2440, _2532);
    float _2546 = fma(_1380, _2522, _2536);
    float _2548 = fma(_1392, _2522, _2524);
    float _2550 = fma(_1380, _2404, _2540);
    float _2552 = fma(_1396, _2522, _2542);
    float _2554 = fma(_1392, _2404, _2526);
    float _2556 = fma(_1400, _2504, _2544);
    float _2558 = fma(_1396, _2440, _2528);
    float _2560 = _1378 * _2406;
    float _2562 = fma(_1382, _2504, _2530);
    float _2564 = fma(_1382, _2408, _2550);
    float _2566 = fma(_1400, _2408, _2554);
    float _2568 = _2556 * _350;
    float _2570 = fma(_1410, _2504, _2558);
    float _2572 = fma(_1400, _2520, _2548);
    float _2574 = _2556 * _344;
    float _2576 = fma(_1396, _2404, _2560);
    float _2578 = _2556 * _354;
    float _2580 = fma(_1382, _2520, _2546);
    float _2582 = _2566 * _350;
    float _2584 = _2566 * _344;
    float _2586 = fma(_2562, _336, _2568);
    float _2588 = _2572 * _350;
    float _2590 = _2572 * _344;
    float _2592 = fma(_2562, _328, _2574);
    float _2594 = _2572 * _354;
    float _2596 = _2566 * _354;
    float _2598 = fma(_2562, _340, _2578);
    float _2600 = fma(_1410, _2408, _2576);
    float _2602 = fma(_2564, _336, _2582);
    float _2604 = fma(_2570, _362, _2586);
    float _2606 = fma(_1410, _2520, _2552);
    float _2608 = fma(_2580, _336, _2588);
    float _2610 = fma(_2580, _328, _2590);
    float _2612 = fma(_2564, _328, _2584);
    float _2614 = fma(_2570, _358, _2592);
    float _2616 = fma(_2580, _340, _2594);
    float _2618 = fma(_2564, _340, _2596);
    float _2620 = fma(_2570, _366, _2598);
    float _2622 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2624 = fma(_2600, _362, _2602);
    float _2626 = fma(_2606, _362, _2608);
    float _2628 = fma(_2606, _358, _2610);
    float _2630 = fma(_2600, _358, _2612);
    float _2632 = fma(_2606, _366, _2616);
    float _2634 = fma(_2600, _366, _2618);
    float _2636 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2622);
    float _2638 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_89.x = _2604;
    out.m_89.y = _2614;
    out.m_89.z = _2620;
    bool _2640 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2642 = isnan(_1828);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2648 = _2644 || _2646;
    float _2650 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2636);
    float _2652 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2638);
    out.m_91.x = _2626;
    out.m_91.y = _2628;
    out.m_91.z = _2632;
    float _2654 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2656 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2652);
    out.m_93.x = _2624;
    out.m_93.y = _2630;
    out.m_93.z = _2634;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2660 = in.m_95.x;
    float _2662 = _2658 + _2654;
    float _2664 = 1.0 / _2654;
    float _2666 = in.m_71.x;
    float _2668 = in.m_95.y;
    float _2670 = in.m_95.w;
    float _2672 = _2662 * _2664;
    float _2674 = _2672 * 0.5;
    float _2676 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2678 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2676);
    out.m_97.x = _2660;
    float _2680 = 1.0 / _2678;
    out.m_97.y = _2668;
    out.m_97.w = _2670;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2684 = _2680 * _2682;
    float _2686 = abs(_2684);
    float _2688 = log2(_2686);
    bool _2690 = _2684 <= 8000.0;
    bool _2692 = isnan(_2684);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan(8000.0);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2704 = exp2(_2702);
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = fma(_2708, -2.0, 3.0);
    float _2712 = _2708 * _2708;
    float _2714 = in.m_95.z;
    float _2716 = _2712 * _2710;
    float _2718 = -_2716;
    float _2720 = _2718 + 1.0;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2716);
    float _2724 = _2700 * _2722;
    float _2726 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2728 = -_2452;
    float _2730 = _2728 + 1.0;
    float _2732 = _2444 * _2726;
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = _2064 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2738 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2740 = _2134 + _2096;
    float _2742 = -_2734;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2736);
    float _2748 = _2738 * _2179;
    float _2750 = _2096 * 0.5;
    float _2752 = _2744 * _2666;
    float _2754 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2746);
    float _2756 = _2190 * _2748;
    float _2758 = _2200 * _2748;
    float _2760 = -_2738;
    float _2762 = _2760 + 1.0;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2754);
    float _2766 = fma(_2196, _2756, _2184);
    float _2768 = fma(_2198, _2756, _2186);
    float _2770 = _2740 * 0.5;
    float _2772 = _2764 + _2096;
    float _2774 = fma(_2130, -0.5, _2750);
    float _2776 = _2190 * _2762;
    float _2778 = _2752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2780 = _2772 * 0.5;
    float _2782 = fma(_2190, _2758, _2188);
    out.m_97.z = _2714;
    float _2784 = _2738;
    float _2786 = _2762;
    float _2788 = _2750;
    float _2790 = _2740;
    float _2792 = _2714;
    if (!_2648)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2794 = _2784;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2648)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2800 = _2786;
    out.m_99.x = _2770;
    out.m_99.y = _2774;
    out.m_99.z = _2780;
    out.m_99.w = _2096;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2648)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2806 = _2788;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2648)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2812 = _2790;
    out.m_101.x = _2778;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2648)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2818 = _2792;
    out.m_103.x = _2766;
    out.m_103.y = _2768;
    out.m_103.z = _2782;
    out.m_103.w = _2776;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2130;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2096;
    float _2820 = _2818;
    float _2822 = _2818;
    if (!_2648)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2824 = _2222;
    bool _2826 = !_2648;
    float _2828 = _2824;
    float _2830 = _2824;
    if (!_2826)
    {
        bool _2832 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_1828);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _1828 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2848 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2846;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2854 = 1.0 / _2848;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2870 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2872 = _2844 * _2854;
            float _2874 = precise::clamp(_2872, 0.0, 1.0);
            float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2880 = fma(_2874, _2852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2882 = fma(_2874, _2878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2884 = fma(_2874, _2858, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2886 = fma(_2874, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2888 = fma(_2874, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2890 = fma(_2874, _2870, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2798 = _2884;
            _2830 = _2888;
            _2822 = _2880;
            _2810 = _2886;
            _2804 = _2882;
            _2816 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_1828);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2820;
            _2822 = _2904;
            if (!_2902)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2796;
            _2798 = _2906;
            if (!_2902)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2802;
            _2804 = _2908;
            if (!_2902)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2808;
            _2810 = _2910;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2828;
            _2830 = _2912;
            if (!_2902)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2814;
            bool _2916 = !_2902;
            _2816 = _2914;
            if (!_2916)
            {
                bool _2918 = _1828 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_1828);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _1828 + _2928;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2934 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2932;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2940 = 1.0 / _2934;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2958 = _2930 * _2940;
                    float _2960 = precise::clamp(_2958, 0.0, 1.0);
                    float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2966 = fma(_2960, _2938, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2968 = fma(_2960, _2964, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2970 = fma(_2960, _2944, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2972 = fma(_2960, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2974 = fma(_2960, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2976 = fma(_2960, _2956, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2798 = _2970;
                    _2830 = _2974;
                    _2822 = _2966;
                    _2810 = _2972;
                    _2804 = _2968;
                    _2816 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2798;
    float _2980 = _2830;
    float _2982 = _2822;
    float _2984 = _2810;
    float _2986 = _2804;
    float _2988 = _2816;
    float _2990 = fma(_2614, -0.5, 0.5);
    float _2992 = precise::clamp(_2990, 0.0, 1.0);
    float _2994 = -_2978;
    float _2996 = _2994 + _2980;
    float _2998 = -_2982;
    float _3000 = _2998 + _2984;
    float _3002 = -_2986;
    float _3004 = _3002 + _2988;
    bool _3006 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3008 = fma(_2992, _2996, _2978);
    float _3010 = fma(_2992, _3000, _2982);
    float _3012 = fma(_2992, _3004, _2986);
    float _3014 = _3008 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3016 = fma(_3010, 0.298911988735198974609375, _3014);
    float _3018 = fma(_3012, 0.114477999508380889892578125, _3016);
    out.m_105.x = 0.0;
    float _3020 = -_3018;
    float _3022 = _3010 + _3020;
    float _3024 = -_3018;
    float _3026 = _3008 + _3024;
    float _3028 = -_3018;
    float _3030 = _3012 + _3028;
    float _3032 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3034 = fma(_3022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    float _3036 = fma(_3026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    float _3038 = fma(_3030, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3018);
    out.m_101.w = _3032;
    out.m_107.x = _3034;
    out.m_107.y = _3036;
    out.m_107.z = _3038;
    if (!_3006)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3040 = -_1790;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1792;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1794;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3052 = _3042 * _3042;
    float _3054 = fma(_3046, _3046, _3052);
    float _3056 = fma(_3050, _3050, _3054);
    float _3058 = sqrt(_3056);
    float _3060 = rsqrt(_3056);
    float _3062 = -_3058;
    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3068 = precise::clamp(_3066, 0.0, 1.0);
    float _3070 = _3046 * _3060;
    float _3072 = _3042 * _3060;
    float _3074 = abs(_3068);
    float _3076 = log2(_3074);
    float _3078 = _3050 * _3060;
    float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3082 = _2614 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2604, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2620, _3078, _3090);
    float _3098 = precise::clamp(_3096, 0.0, 1.0);
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3102 = _3094 + _3100;
    float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3108 = precise::clamp(_3106, 0.0, 1.0);
    float _3110 = exp2(_3104);
    float _3112 = _3110 * _3108;
    float _3114 = _3098 * _3112;
    float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_105.x = _3116;
    out.m_105.y = _3118;
    out.m_105.z = _3120;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

