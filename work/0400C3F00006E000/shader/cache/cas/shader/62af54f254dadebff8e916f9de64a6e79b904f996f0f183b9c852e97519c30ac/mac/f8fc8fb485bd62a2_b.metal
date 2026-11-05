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
    float4 m_81 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_107 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_105 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_99 [[user(locn14)]];
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
    float4 m_93 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _206 = fma(_188, _188, _202);
    float _208 = fma(_190, _190, _204);
    float _210 = fma(_194, _194, _206);
    float _212 = _182 * _182;
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_198, _198, _218);
    float _222 = in.m_61.x;
    float _224 = in.m_61.y;
    float _226 = in.m_61.z;
    float _228 = sqrt(_214);
    float _230 = sqrt(_220);
    bool _232 = _216 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = 0.0;
    float _238 = _194;
    if (_232)
    {
        float _240 = rsqrt(_210);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = _190 * _224;
    bool _246 = _230 > 0.0;
    float _248 = _180 * _224;
    float _250 = _196 * _224;
    float _252 = fma(_188, _222, _244);
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _222;
    if (!_232)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = fma(_178, _222, _248);
    float _266 = 0.0;
    float _268 = _260;
    float _270 = _262;
    if (_234)
    {
        float _272 = rsqrt(_214);
        _266 = _272;
    }
    float _274 = _266;
    float _276 = fma(_194, _222, _250);
    float _278 = 0.0;
    float _280 = 0.0;
    if (!_234)
    {
        _278 = 0.0;
        _280 = 0.0;
    }
    float _282 = _278;
    float _284 = _280;
    float _286 = 0.0;
    float _288 = _282;
    float _290 = _284;
    if (!_232)
    {
        _286 = 0.0;
    }
    float _292 = _286;
    float _294 = fma(_192, _226, _252);
    float _296 = 0.0;
    float _298 = _292;
    if (!_234)
    {
        _296 = 0.0;
    }
    float _300 = _296;
    float _302 = fma(_182, _226, _264);
    float _304 = 0.0;
    float _306 = _300;
    if (!_246)
    {
        _304 = 0.0;
    }
    float _308 = _304;
    float _310 = 0.0;
    float _312 = _308;
    if (_246)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    float _318 = 0.0;
    if (!_246)
    {
        _318 = 0.0;
    }
    float _320 = _318;
    float _322 = fma(_198, _226, _276);
    float _324 = _320;
    float _326 = _322;
    if (!_246)
    {
        _258 = 0.0;
    }
    float _328 = _258;
    float _330 = _328;
    if (_232)
    {
        float _332 = _242 * _178;
        _298 = _332;
    }
    float _334 = _298;
    if (_232)
    {
        float _336 = _242 * _188;
        _268 = _336;
    }
    float _338 = _268;
    if (_232)
    {
        float _340 = _242 * _194;
        _270 = _340;
    }
    float _342 = _270;
    if (_234)
    {
        float _344 = _274 * _180;
        _306 = _344;
    }
    float _346 = _306;
    if (_234)
    {
        float _348 = _274 * _190;
        _288 = _348;
    }
    float _350 = _288;
    if (_234)
    {
        float _352 = _274 * _196;
        _290 = _352;
    }
    float _354 = _290;
    if (_246)
    {
        float _356 = _316 * _182;
        _312 = _356;
    }
    float _358 = _312;
    if (_246)
    {
        float _360 = _316 * _192;
        _324 = _360;
    }
    float _362 = _324;
    if (_246)
    {
        float _364 = _316 * _198;
        _330 = _364;
    }
    float _366 = _330;
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
    float _416 = in.m_63.x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = 1.0 / _414;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _390 + _432;
    float _436 = in.m_57.w;
    float _438 = _200 * _398;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = _402 * _398;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = in.m_59.w;
    float _448 = 1.0 / _420;
    float _450 = in.m_63.y;
    float _452 = _190 * _394;
    float _454 = _196 * _394;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _456;
    float _460 = _404 * 2.0;
    float _462 = fma(_194, _392, _454);
    float _464 = fma(_188, _392, _452);
    float _466 = 1.0 / _428;
    float _468 = precise::min(_440, _444);
    float _470 = fma(_198, _396, _462);
    float _472 = fma(_192, _396, _464);
    float _474 = _396;
    int _476 = as_type<int>(_404);
    if (_424)
    {
        _238 = _416;
    }
    float _478 = _238;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _482 = _390 + _480;
    float _484 = _410 * _448;
    float _486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _488 = log2(_486);
    float _490 = _434 * _430;
    float _492 = _478;
    if (!_424)
    {
        _492 = _404;
    }
    float _494 = _492;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = floor(_460);
    if (_424)
    {
        _474 = _450;
    }
    float _506 = _474;
    float _508 = _494 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _510 = _506;
    if (!_424)
    {
        _510 = _416;
    }
    float _512 = _510;
    float _514 = _482 * _466;
    float _516 = -_496;
    float _518 = fma(_508, 2.0, _516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _522 = 1.0 + _520;
    float _524 = _488 * _152;
    float _526 = _512 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _528 = 1.0 / _522;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = fma(_526, -2.0, _498);
    float _542 = _450 * 2.0;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _546 = _504 > 0.0;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _550 = _504 >= 0.0;
    bool _552 = isnan(_504);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = exp2(_524);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _564 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[88].z, _544);
    int _566 = _558 ? 0 : 1;
    float _568 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[88].w, _548);
    float _570 = fma(_562, _450, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _572 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _564);
    int _574 = ~_566;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = floor(_542);
    float _582 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _568);
    int _584 = _578;
    float _586 = _572;
    if (!_546)
    {
        int _588 = ~_566;
        int _590 = _588 + 1;
        _584 = _590;
    }
    int _592 = _584;
    float _594 = _570 * _152;
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = -_152;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[86].x, _518);
    float _610 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _540);
    float _612 = _416 * 2.0;
    float _614 = -_560;
    float _616 = _614 + 1.0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _628 = _626 != 0;
    float _630 = _416 + _450;
    float _632 = floor(_612);
    float _634 = _472 + _436;
    float _636 = _604 ? _616 : 0.0;
    float _638 = _630 + (-1.0);
    bool _640 = !_624;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_416, 6.283185482025146484375, _594);
    bool _646 = !_620;
    int _648 = _646 ? 0 : 1;
    if (_538)
    {
        float _650 = _636 * _528;
        _170 = _650;
    }
    float _652 = _170;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _660 = _658 != 0;
    float _662 = _416 + _404;
    bool _664 = _580 >= 0.0;
    bool _666 = isnan(_580);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _676 = _662 + (-1.0);
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _688 = _686 != 0;
    float _690 = -_468;
    float _692 = _690 + 1.0;
    int _694 = _672 ? 0 : 1;
    float _696 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _698 = _580 > 0.0;
    float _700 = _450 + _404;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _704 = _700 + (-1.0);
    int _706 = ~_694;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _712;
    bool _716 = !_628;
    int _718 = _716 ? 0 : 1;
    float _720 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _722 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = fma(_714, _490, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _726 = _710;
    if (!_698)
    {
        int _728 = ~_694;
        int _730 = _728 + 1;
        _726 = _730;
    }
    int _732 = _726;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _734;
    bool _738 = !_688;
    int _740 = _738 ? 0 : 1;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _744 = !_656;
    int _746 = _744 ? 0 : 1;
    float _748 = fma(_736, _490, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _752 = _750 != 0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _760 = _758 != 0;
    float _762 = fma(_458, _490, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _764 = _632 >= 0.0;
    bool _766 = isnan(_632);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _782;
    int _786 = _772 ? 0 : 1;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _788;
    bool _792 = _632 > 0.0;
    float _794 = fma(_776, _484, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _796 = fma(_780, _484, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _798 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _800 = isnan(_390);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _812 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _814 = isnan(_390);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = fma(_784, _514, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _826 = fma(_502, _484, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _828 = fma(_790, _514, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _830 = -_808;
    float _832 = _830 + 1.0;
    float _834 = _810 * _674;
    bool _836 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _838 = isnan(_390);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _850 = -_822;
    float _852 = _850 + 1.0;
    float _854 = _822 * _832;
    float _856 = _848 * _702;
    bool _858 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _860 = isnan(_390);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = _846 * _852;
    float _872 = -_846;
    float _874 = _872 + 1.0;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _876;
    float _880 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].x, _834);
    float _882 = _470 + _446;
    float _884 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _886 = _868 * _874;
    float _888 = fma(_878, _514, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _890 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].y, _856);
    float _892 = floor(_880);
    float _894 = _884 * _742;
    float _896 = -_868;
    float _898 = _896 + 1.0;
    float _900 = _748 * _886;
    float _902 = _724 * _886;
    float _904 = _762 * _886;
    float _906 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].z, _894);
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].x, _900);
    float _910 = floor(_890);
    float _912 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].y, _902);
    bool _914 = !_752;
    int _916 = _914 ? 0 : 1;
    float _918 = fma(_794, _870, _908);
    int _920 = ~_786;
    int _922 = _920 + 1;
    int _924 = _922 + 1;
    float _926 = fma(_796, _870, _912);
    bool _928 = !_756;
    int _930 = _928 ? 0 : 1;
    float _932 = fma(_824, _854, _918);
    float _934 = floor(_906);
    int _936 = _924;
    if (!_792)
    {
        int _938 = ~_786;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = -_892;
    float _946 = _880 + _944;
    int _948 = abs(_930);
    float _950 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].z, _904);
    int _952 = abs(_916);
    float _954 = _880 + 0.25;
    float _956 = float(_942);
    float _958 = -_910;
    float _960 = _890 + _958;
    float _962 = float(_948);
    float _964 = floor(_954);
    float _966 = float(_592);
    float _968 = fma(_826, _870, _950);
    bool _970 = _946 >= 0.5;
    bool _972 = isnan(_946);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.5);
    bool _978 = _974 || _976;
    float _980 = _962 * _956;
    float _982 = -_934;
    float _984 = _906 + _982;
    float _986 = _906 + 0.25;
    float _988 = _890 + 0.25;
    bool _990 = !_978;
    float _992 = _990 ? 0.5 : (-0.5);
    float _994 = _880 * 6.283185482025146484375;
    bool _996 = _960 >= 0.5;
    bool _998 = isnan(_960);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.5);
    bool _1004 = _1000 || _1002;
    float _1006 = floor(_986);
    int _1008 = abs(_746);
    float _1010 = _890 * 6.283185482025146484375;
    int _1012 = abs(_642);
    float _1014 = -_964;
    float _1016 = _954 + _1014;
    bool _1018 = _984 >= 0.5;
    bool _1020 = isnan(_984);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.5);
    bool _1026 = _1022 || _1024;
    float _1028 = _980 * (-2.0);
    bool _1030 = !_1004;
    float _1032 = _1030 ? 0.5 : (-0.5);
    float _1034 = floor(_988);
    float _1036 = _994 * 0.15915493667125701904296875;
    float _1038 = _992 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1040 = _1038 * 2.0;
    float _1042 = float(_1008);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1046 = _1044 * 2.0;
    bool _1048 = _1016 > 0.5;
    float _1050 = -_1006;
    float _1052 = _986 + _1050;
    int _1054 = abs(_648);
    float _1056 = _1042 * _1046;
    bool _1058 = !_684;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _1036 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    bool _1066 = !_1026;
    float _1068 = _1066 ? 0.5 : (-0.5);
    float _1070 = fma(_828, _854, _926);
    float _1072 = float(_1012);
    float _1074 = -_1034;
    float _1076 = _988 + _1074;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1080 = _1078 != 0;
    float _1082 = _1010 * 0.15915493667125701904296875;
    float _1084 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1086 = _1084 * 2.0;
    int _1088 = abs(_1060);
    float _1090 = _1072 * _1040;
    bool _1092 = !_1080;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = in.m_65.x;
    float _1098 = in.m_65.y;
    float _1100 = in.m_65.z;
    float _1102 = float(_1054);
    float _1104 = _1082 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    int _1108 = abs(_718);
    float _1110 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1112 = _1016;
    float _1114 = _1076;
    float _1116 = _1052;
    if (_1048)
    {
        float _1118 = -_1016;
        float _1120 = _1118 + 1.0;
        _1112 = _1120;
    }
    float _1122 = _1112;
    int _1124 = abs(_1094);
    float _1126 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].x, _932);
    float _1128 = fma(_1102, _1110, _1090);
    float _1130 = float(_1108);
    float _1132 = fma(_1122, 4.0, -1.0);
    bool _1134 = _1076 > 0.5;
    float _1136 = in.m_67.z;
    float _1138 = float(_1124);
    float _1140 = _906 * 6.283185482025146484375;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1144 = !_660;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_888, _854, _968);
    float _1150 = _1140 * 0.15915493667125701904296875;
    float _1152 = fma(_1130, _1142, _1128);
    int _1154 = abs(_1146);
    float _1156 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1158 = _1150 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = float(_952);
    if (_1134)
    {
        float _1164 = -_1076;
        float _1166 = _1164 + 1.0;
        _1114 = _1166;
    }
    float _1168 = _1114;
    bool _1170 = _1052 > 0.5;
    float _1172 = fma(_1138, _1156, _1056);
    bool _1174 = !_680;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_1152, 3.1415927410125732421875, _1096);
    float _1180 = _1162 * _966;
    float _1182 = float(_1088);
    float _1184 = fma(_1168, 4.0, -1.0);
    int _1186 = abs(_1176);
    float _1188 = _1180 * (-2.0);
    float _1190 = float(_1154);
    float _1192 = _1182 * _1086;
    float _1194 = float(_1186);
    float _1196 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    if (_1170)
    {
        float _1200 = -_1052;
        float _1202 = _1200 + 1.0;
        _1116 = _1202;
    }
    float _1204 = _1116;
    float _1206 = fma(_1178, _1188, _1178);
    float _1208 = _416 + (-0.5);
    float _1210 = fma(_1194, _1196, _1192);
    float _1212 = fma(_1190, _1198, _1172);
    float _1214 = _644 * 0.15915493667125701904296875;
    int _1216 = abs(_740);
    float _1218 = fma(_1204, 4.0, -1.0);
    bool _1220 = !_760;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = fma(_722, _1188, _722);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    float _1228 = fma(_1212, 3.1415927410125732421875, _1098);
    float _1230 = float(_1216);
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1234 = abs(_1222);
    float _1236 = fma(_1224, _652, _1226);
    float _1238 = _450 + (-0.5);
    float _1240 = fma(_1228, _1028, _1228);
    float _1242 = float(_732);
    float _1244 = fma(_1230, _1232, _1210);
    float _1246 = float(_1234);
    float _1248 = fma(_720, _1028, _720);
    float _1250 = _1214 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1240);
    float _1256 = fma(_1244, 3.1415927410125732421875, _1100);
    float _1258 = _1246 * _1242;
    float _1260 = in.m_69.x;
    float _1262 = in.m_69.y;
    float _1264 = in.m_69.z;
    float _1266 = fma(_1248, _652, _1254);
    float _1268 = _882 * _882;
    float _1270 = _1258 * (-2.0);
    float _1272 = in.m_67.y;
    float _1274 = _1236 * 0.15915493667125701904296875;
    float _1276 = _1266 * 0.15915493667125701904296875;
    float _1278 = fma(_696, _1270, _696);
    float _1280 = fma(_1256, _1270, _1256);
    float _1282 = _404 + (-0.5);
    float _1284 = in.m_67.x;
    float _1286 = fma(_634, _634, _1268);
    float _1288 = abs(_1252);
    float _1290 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1280);
    float _1294 = _1274 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1148);
    float _1300 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1290);
    float _1302 = fma(_1278, _652, _1292);
    float _1304 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1070);
    float _1306 = _612 + (-1.0);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1136);
    float _1310 = _1302 * 0.15915493667125701904296875;
    float _1312 = _1276 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1304 * _1262;
    float _1318 = _1126 * _1260;
    float _1320 = _1298 * _1264;
    float _1322 = -_1300;
    float _1324 = _1322 + _1272;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = _1276 * 6.283185482025146484375;
    float _1330 = cos(_1328);
    float _1332 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1324);
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1340 = _1332 * _1334;
    float _1342 = _1336 * _1308;
    float _1344 = sqrt(_1286);
    float _1346 = _1326 * _1338;
    float _1348 = _1296 * _1314;
    float _1350 = _1274 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = _1296 * _1330;
    float _1356 = _1310 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = _1306 * _1344;
    float _1362 = _1360 * 0.75;
    float _1364 = _1310 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1352 * _1314;
    float _1370 = _1352 * _1330;
    float _1372 = _1362 * 0.15915493667125701904296875;
    float _1374 = _1296 * _1358;
    float _1376 = _1352 * _1358;
    float _1378 = _1330 * _1358;
    float _1380 = _1314 * _1358;
    float _1382 = _1374 * _1340;
    float _1384 = _1376 * _1340;
    float _1386 = _1372 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = fma(_1366, _1354, _1368);
    float _1392 = -_1348;
    float _1394 = fma(_1366, _1370, _1392);
    float _1396 = -_1370;
    float _1398 = fma(_1366, _1348, _1396);
    float _1400 = -_1340;
    float _1402 = _1366 * _1400;
    float _1404 = fma(_1390, _1346, _1382);
    float _1406 = fma(_1366, _1368, _1354);
    float _1408 = fma(_1394, _1346, _1384);
    float _1410 = fma(_1378, _1346, _1402);
    float _1412 = fma(_1398, _1342, _1404);
    float _1414 = _1372 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = fma(_1380, _1342, _1410);
    float _1420 = _1412 * _350;
    float _1422 = fma(_1406, _1342, _1408);
    float _1424 = _1412 * _354;
    float _1426 = fma(_1418, _338, _1420);
    float _1428 = fma(_1418, _342, _1424);
    float _1430 = fma(_1422, _362, _1426);
    float _1432 = fma(_1422, _366, _1428);
    float _1434 = _1430 * _1388;
    float _1436 = _1430 * _1416;
    float _1438 = -_1434;
    float _1440 = fma(_1432, _1416, _1438);
    float _1442 = fma(_1432, _1388, _1436);
    float _1444 = _882 + _1440;
    float _1446 = _634 + _1442;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1444 + _1448;
    float _1452 = in.m_71.y;
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1456 = _1446 + _1454;
    float _1458 = _1450 * _1450;
    float _1460 = fma(_1456, _1456, _1458);
    float _1462 = sqrt(_1460);
    float _1464 = _394 + _1452;
    bool _1466 = _1462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = _1462 + _1468;
    float _1472 = _1416;
    float _1474 = _1452;
    float _1476 = _1462;
    float _1478 = _1346;
    float _1480 = _1464;
    if (_1466)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1472 = _1482;
    }
    float _1484 = _1472;
    if (_1466)
    {
        float _1486 = rsqrt(_1460);
        _1474 = _1486;
    }
    float _1488 = _1474;
    float _1490 = _1488;
    if (_1466)
    {
        float _1492 = _1470 * _1484;
        _1476 = _1492;
    }
    float _1494 = _1476;
    if (_1466)
    {
        float _1496 = _1494 * 0.15915493667125701904296875;
        _1478 = _1496;
    }
    float _1498 = _1478;
    float _1500 = _1412 * _346;
    float _1502 = _1484;
    float _1504 = _1500;
    if (_1466)
    {
        float _1506 = _1498 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = fma(_1418, _334, _1500);
    float _1514 = _1512;
    if (!_1466)
    {
        _1504 = _1444;
    }
    float _1516 = _1504;
    float _1518 = fma(_1422, _358, _1512);
    float _1520 = _1464 + _1518;
    float _1522 = _1516;
    float _1524 = _1520;
    if (_1466)
    {
        float _1526 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1526;
    }
    float _1528 = _1514;
    float _1530 = _1528;
    float _1532 = _1510;
    if (_1466)
    {
        float _1534 = fma(_1510, _1528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1530 = _1534;
    }
    float _1536 = _1530;
    float _1538 = _1536;
    if (!_1466)
    {
        _1532 = _1446;
    }
    float _1540 = _1532;
    float _1542 = _1540;
    if (_1466)
    {
        float _1544 = _1488 * _1536;
        _1538 = _1544;
    }
    float _1546 = _1538;
    if (_1466)
    {
        float _1548 = fma(_1450, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1522 = _1548;
    }
    float _1550 = _1522;
    float _1552 = _1550;
    if (_1466)
    {
        float _1554 = fma(_1456, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1542 = _1554;
    }
    float _1556 = _1542;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1560 = _1550 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1564 = _1556 + _1562;
    float _1566 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1568 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5264 = float2(_1568, _1566);
    float _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5264, float2(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5264, float2(0.0), isnan(_5264)), level(0.0)).x;
    float _1572 = _1564;
    float _1574 = _1556;
    if (_1466)
    {
        float _1576 = _1498 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_634;
    float _1584 = _1582 + _1556;
    float _1586 = -_882;
    float _1588 = _1586 + _1550;
    bool _1590 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1592 = isnan(0.5);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1598 = _1594 || _1596;
    float _1600 = _1588;
    if (_1466)
    {
        float _1602 = _1580 + (-1.0);
        _1490 = _1602;
    }
    float _1604 = _1490;
    float _1606 = _1604;
    if (_1466)
    {
        float _1608 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1608;
    }
    float _1610 = _1606;
    if (_1466)
    {
        float _1612 = fma(_1520, _1580, _1610);
        _1524 = _1612;
    }
    float _1614 = _1524;
    float _1616 = -_1464;
    float _1618 = _1616 + _1614;
    float _1620 = fma(_882, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1622 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1624 = _1618 * _1618;
    float _1626 = floor(_1620);
    float _1628 = fma(_1584, _1584, _1624);
    float _1630 = fma(_1588, _1588, _1628);
    float _1632 = floor(_1622);
    float _1634 = -_1626;
    float _1636 = _1620 + _1634;
    float _1638 = sqrt(_1630);
    float _1640 = -_1632;
    float _1642 = _1622 + _1640;
    bool _1644 = _1638 > 0.0;
    float _1646 = _1632;
    float _1648 = _1614;
    if (!_1644)
    {
        _1646 = _1550;
    }
    float _1650 = _1646;
    float _1652 = fma(_1570, 100.0, _1614);
    float _1654 = fma(_1570, 100.0, _1464);
    float _1656 = _1650;
    float _1658 = _1650;
    if (!_1644)
    {
        _1648 = _1556;
    }
    float _1660 = _1648;
    float _1662 = _1660;
    if (!_1644)
    {
        _1480 = _1652;
    }
    float _1664 = _1480;
    bool _1666 = !_1644;
    float _1668 = _1664;
    if (!_1666)
    {
        float _1670 = _302 * _302;
        float _1672 = rsqrt(_1630);
        float _1674 = fma(_294, _294, _1670);
        float _1676 = fma(_322, _322, _1674);
        float _1678 = sqrt(_1676);
        float _1680 = _1584 * _1672;
        float _1682 = _1618 * _1672;
        float _1684 = _1588 * _1672;
        bool _1686 = _1678 > 0.0;
        float _1688 = _1678;
        float _1690 = _1672;
        _1600 = _1684;
        if (!_1686)
        {
            _1688 = _1556;
        }
        float _1692 = _1688;
        _1662 = _1692;
        if (!_1686)
        {
            _1690 = _1652;
        }
        float _1694 = _1690;
        _1668 = _1694;
        if (!_1686)
        {
            _1656 = _1550;
        }
        float _1696 = _1656;
        bool _1698 = !_1686;
        _1658 = _1696;
        if (!_1698)
        {
            float _1700 = rsqrt(_1676);
            float _1702 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1704 = _302 * _1700;
            float _1706 = _294 * _1700;
            float _1708 = _1682 * _1704;
            float _1710 = _322 * _1700;
            float _1712 = fma(_1680, _1706, _1708);
            float _1714 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1716 = fma(_1684, _1710, _1712);
            float _1718 = _1716 * _1714;
            float _1720 = fma(_294, _1718, _1556);
            float _1722 = fma(_302, _1718, _1652);
            float _1724 = fma(_322, _1718, _1550);
            _1662 = _1720;
            _1658 = _1724;
            _1668 = _1722;
        }
    }
    float _1726 = _1662;
    float _1728 = _1658;
    float _1730 = _1668;
    float _1732 = _1600;
    float _1734 = _1730;
    float _1736 = _1732;
    if (_1598)
    {
        _1552 = _1726;
    }
    float _1738 = _1552;
    float _1740 = _1738;
    if (_1598)
    {
        _1574 = _1728;
    }
    float _1742 = _1574;
    float _1744 = _1742;
    if (!_1598)
    {
        float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1748 = _1654 + _1746;
        float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1752 = _634 + _1750;
        float _1754 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1756 = -_882;
        float _1758 = _1756 + _1728;
        float _1760 = _1748 * _1748;
        float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1764 = _882 + _1762;
        float _1766 = fma(_1752, _1752, _1760);
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1770 = fma(_1764, _1764, _1766);
        float _1772 = sqrt(_1770);
        float _1774 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1776 = precise::min(_1772, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1778 = _1776 * _1768;
        float _1780 = -_634;
        float _1782 = _1780 + _1726;
        float _1784 = _1774 * _1778;
        float _1786 = -_1654;
        float _1788 = _1786 + _1730;
        float _1790 = fma(_1782, _1784, _634);
        float _1792 = fma(_1788, _1784, _1654);
        float _1794 = fma(_1758, _1784, _882);
        _1734 = _1792;
        _1740 = _1790;
        _1744 = _1794;
        _326 = _1768;
    }
    float _1796 = _1734;
    float _1798 = _1740;
    float _1800 = _1744;
    float _1802 = _326;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1806 = _1796 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1798 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1814 = _1800 + _1812;
    float _1816 = in.m_73.y;
    float _1818 = _1806 * _1806;
    float _1820 = fma(_1810, _1810, _1818);
    float2 _5662 = float2(_1642, _1636);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5662, float2(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5662, float2(0.0), isnan(_5662)), level(0.0)).x;
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1826 = _1824 != 0;
    float _1828 = fma(_1814, _1814, _1820);
    float _1830 = rsqrt(_1828);
    float _1832 = sqrt(_1828);
    float _1834 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1836 = _1810 * _1834;
    float _1838 = _1814 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 * _1838;
    float _1844 = _1840 + _1842;
    float _1846 = sqrt(_1844);
    bool _1848 = _1846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1852 = _1846 + _1850;
    float _1854 = _1814;
    float _1856 = _1852;
    float _1858 = _1802;
    float _1860 = _1806;
    if (_1848)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1854 = _1862;
    }
    float _1864 = _1854;
    if (_1848)
    {
        float _1866 = _1852 * _1864;
        _1856 = _1866;
    }
    float _1868 = _1856;
    if (_1848)
    {
        float _1870 = _1868 * 0.15915493667125701904296875;
        _1858 = _1870;
    }
    float _1872 = _1858;
    float _1874 = _1830;
    float _1876 = _1872;
    if (_1848)
    {
        float _1878 = _1872 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1874 = _1880;
    }
    float _1882 = _1874;
    float _1884 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1886 = precise::max(0.0, _1884);
    float _1888 = _1818;
    float _1890 = _1886;
    if (_1848)
    {
        float _1892 = _1872 * 6.283185482025146484375;
        float _1894 = cos(_1892);
        _1888 = _1894;
    }
    float _1896 = _1888;
    float _1898 = -_1834;
    float _1900 = -_1886;
    float _1902 = fma(_1806, _1898, _1900);
    float _1904 = _1884;
    if (_1848)
    {
        float _1906 = rsqrt(_1844);
        _1904 = _1906;
    }
    float _1908 = _1904;
    if (_1848)
    {
        float _1910 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1910;
    }
    float _1912 = _1890;
    float _1914 = _1912;
    float _1916 = _1882;
    if (_1848)
    {
        float _1918 = fma(_1882, _1912, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1914 = _1918;
    }
    float _1920 = _1914;
    float _1922 = _1920;
    if (!_1848)
    {
        _1916 = _1836;
    }
    float _1924 = _1916;
    float _1926 = _1924;
    float _1928 = _1896;
    if (_1848)
    {
        float _1930 = _1896 + (-1.0);
        _1860 = _1930;
    }
    float _1932 = _1860;
    float _1934 = _1932;
    if (_1848)
    {
        float _1936 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1936;
    }
    float _1938 = _1876;
    if (!_1848)
    {
        _1934 = _1838;
    }
    float _1940 = _1934;
    float _1942 = _1908;
    float _1944 = _1940;
    if (_1848)
    {
        float _1946 = _1908 * _1920;
        _1736 = _1946;
    }
    float _1948 = _1736;
    if (!_1848)
    {
        _1942 = _1902;
    }
    float _1950 = _1942;
    float _1952 = _1950;
    if (_1848)
    {
        float _1954 = fma(_1902, _1896, _1938);
        _1952 = _1954;
    }
    float _1956 = _1952;
    if (!_1848)
    {
        _1922 = _1840;
    }
    float _1958 = _1922;
    float _1960 = _1958;
    if (_1848)
    {
        float _1962 = _1836 * _1948;
        _1926 = _1962;
    }
    float _1964 = _1926;
    if (_1848)
    {
        float _1966 = _1838 * _1948;
        _1944 = _1966;
    }
    float _1968 = _1944;
    if (!_1848)
    {
        _1928 = _1842;
    }
    float _1970 = _1928;
    float _1972 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = _1970;
    if (_1848)
    {
        float _1976 = _1964 * _1964;
        _1960 = _1976;
    }
    float _1978 = _1960;
    if (_1848)
    {
        float _1980 = _1968 * _1968;
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1986 = fma(_1956, _1956, _1978);
    float _1988 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1990 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1984);
    float _1992 = _1986 + _1982;
    float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1996 = fma(_1832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1994);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1988);
    float _2002 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2004 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2006 = -_1998;
    float _2008 = _2006 + 1.0;
    float _2010 = rsqrt(_1992);
    float _2012 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2000);
    float _2014 = _2002 * _416;
    float _2016 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2018 = abs(_2008);
    float _2020 = log2(_2018);
    float _2022 = _2010 * _1964;
    float _2024 = _2010 * _1956;
    float _2026 = _2010 * _1968;
    float _2028 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2032 = trunc(_2014);
    int _2034 = int(_2032);
    float _2036 = -_2030;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2042 = _2028 * _416;
    float _2044 = -_2026;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2052 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = exp2(_2040);
    float _2058 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2050);
    float _2060 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2052);
    float _2062 = fma(_2046, 0.5, 0.5);
    int _2064 = _2034 << 4;
    int _2066 = _2064 + 1712;
    float _2068 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2058);
    float _2070 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2060);
    float _2072 = sqrt(_2054);
    float _2074 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2076 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2078 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2080 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2082 = -_2078;
    float _2084 = fma(_2082, _2048, 1.0);
    float _2086 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2088 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2080);
    float _2090 = fma(_2062, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2092 = _2024 + 1.0;
    float _2094 = log2(_2084);
    float _2096 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2088);
    float _2098 = fma(_2062, _2090, -0.212114393711090087890625);
    float _2100 = -_2024;
    float _2102 = fma(_2056, _2092, _2100);
    float _2104 = _2072 * 0.636619746685028076171875;
    float _2106 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2096);
    float _2108 = fma(_2062, _2098, 1.570728778839111328125);
    float _2110 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2112 = fma(_2102, 0.5, 0.5);
    float _2114 = 1.0 / _2106;
    float _2116 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2086);
    float _2118 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2110);
    float _2120 = -_2108;
    float _2122 = fma(_2104, _2120, 1.0);
    float _2124 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2116);
    float _2126 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2118);
    float _2128 = _2094 * 0.693147182464599609375;
    float _2130 = trunc(_2042);
    int _2132 = int(_2130);
    float _2134 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2126);
    float _2136 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2138 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2140 = _2134 * _2114;
    float _2142 = _2136 * _2114;
    float _2144 = fma(_2140, 0.5, 0.5);
    float _2146 = fma(_2142, -0.5, 0.5);
    int _2148 = _2132 << 4;
    int _2150 = _2148 + 1968;
    float3 _6210 = float3(_2144, _2146, _2138);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).x;
    float3 _6221 = float3(_2144, _2146, _2138);
    float4 _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6221, float3(0.0), isnan(_6221)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6221, float3(0.0), isnan(_6221)), level(0.0)).xyzw;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = _2155.w;
    float2 _6237 = float2(_2122, _2112);
    float3 _2167 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6237, float2(0.0), isnan(_6237)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6237, float2(0.0), isnan(_6237)), level(0.0)).xyz;
    float _2169 = _2167.x;
    float _2171 = _2167.y;
    float _2173 = _2167.z;
    uint _2176 = uint(int(uint(_2066) >> uint(2)));
    uint _2178 = uint(int(uint(int(_2176)) >> uint(2)));
    int _2180 = int(_2176) & 3;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[int(_2178)][_2180];
    int _2184 = int(_2176) + 1;
    uint _2186 = uint(int(uint(_2184) >> uint(2)));
    int _2188 = _2184 & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    float _2192 = in.m_73.x;
    int _2194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2196 = _2194 != 0;
    float _2198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2200 = _406 > 0.5;
    float _2202 = 0.0;
    int _2204 = as_type<int>(_2144);
    float _2206 = as_type<float>(_2066);
    float _2208 = _2138;
    float _2210 = _2136;
    if (_1826)
    {
        float _2212 = in.m_63.z;
        _2202 = _2212;
    }
    float _2214 = _2202;
    float _2216 = -_1816;
    float _2218 = _2216 + 1.0;
    bool _2220 = _404 > 0.5;
    uint _2222 = uint(int(uint(_2150) >> uint(2)));
    uint _2224 = uint(int(uint(int(_2222)) >> uint(2)));
    int _2226 = int(_2222) & 3;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[int(_2224)][_2226];
    int _2230 = int(_2222) + 1;
    uint _2232 = uint(int(uint(_2230) >> uint(2)));
    int _2234 = _2230 & 3;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[int(_2232)][_2234];
    bool _2238 = _450 > 0.5;
    float _2240 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2244 = _2242 != 0;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2250 = _2248 != 0;
    out.m_75.x = _1798;
    out.m_75.y = _1796;
    out.m_75.z = _1800;
    int _2252 = _2066 + 8;
    uint _2254 = uint(int(uint(_2252) >> uint(2)));
    uint _2256 = uint(int(uint(int(_2254)) >> uint(2)));
    int _2258 = int(_2254) & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    int _2262 = _2150 + 8;
    uint _2264 = uint(int(uint(_2262) >> uint(2)));
    uint _2266 = uint(int(uint(int(_2264)) >> uint(2)));
    int _2268 = int(_2264) & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    int _2272 = _2220 ? as_type<int>(_2218) : as_type<int>(_1816);
    float _2274 = _1816;
    bool _2276 = _2244;
    float _2278 = _2192;
    if (_1826)
    {
        float _2280 = -_2192;
        float _2282 = _2280 + 1.0;
        _2204 = as_type<int>(_2282);
    }
    int _2284 = _2204;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2288 = _2286 != 0;
    float _2290 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2292 = _2238 ? as_type<int>(_2218) : as_type<int>(_1816);
    bool _2294 = _2288;
    if (_2250)
    {
        float _2296 = -_2192;
        float _2298 = _2296 + 1.0;
        _476 = as_type<int>(_2298);
    }
    int _2300 = _476;
    float _2302 = _2244 ? as_type<float>(_2272) : _1816;
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2306 = _2288 ? as_type<float>(_2292) : _1816;
    if (_2196)
    {
        float _2308 = _2200 ? _2218 : _1816;
        _2274 = _2308;
    }
    float _2310 = _2274;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2314 = _2312 != 0;
    float _2316 = fma(_2302, _2290, -0.5);
    if (_1826)
    {
        bool _2318 = _2214 > 0.5;
        _2294 = _2318;
    }
    bool _2320 = _2294;
    float _2322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2250)
    {
        bool _2324 = _416 > 0.5;
        _2276 = _2324;
    }
    bool _2326 = _2276;
    float _2328 = -_610;
    float _2330 = fma(_582, _2316, _2328);
    float _2332 = _2330;
    if (!_1826)
    {
        _2206 = _2192;
    }
    float _2334 = _2206;
    float _2336 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2338 = _2334;
    if (_1826)
    {
        float _2340 = _2320 ? as_type<float>(_2284) : _2192;
        _2338 = _2340;
    }
    float _2342 = _2338;
    if (!_2250)
    {
        _2208 = _2192;
    }
    float _2344 = _2208;
    float _2346 = _2182 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2348 = _2344;
    int _2350 = as_type<int>(_2182);
    if (_2250)
    {
        float _2352 = _2326 ? as_type<float>(_2300) : _2192;
        _2348 = _2352;
    }
    float _2354 = _2348;
    if (_2314)
    {
        float _2356 = -_2192;
        float _2358 = _2356 + 1.0;
        _2350 = as_type<int>(_2358);
    }
    int _2360 = _2350;
    float _2362 = in.m_77.x;
    float _2364 = in.m_77.y;
    float _2366 = in.m_77.z;
    float _2368 = -_1300;
    float _2370 = -_1272;
    bool _2372 = _2368 != _2370;
    bool _2374 = isnan(_2368);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(_2370);
    bool _2380 = _2376 || _2378;
    float _2382 = _2190 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2384 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2314)
    {
        float _2386 = _2238 ? as_type<float>(_2360) : _2192;
        _2278 = _2386;
    }
    float _2388 = _2278;
    float _2390 = _2228 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2392 = _2236 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2394 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2396 = _1284 == 0.0;
    bool _2398 = !_2380;
    bool _2400 = _2396 && _2398;
    float _2402 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2404 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2408 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2410 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = fma(_2394, _2388, -0.5);
    bool _2414 = _1136 == 0.0;
    bool _2416 = _2414 && _2400;
    float _2418 = in.m_79.x;
    float _2420 = in.m_79.y;
    float _2422 = in.m_79.z;
    float _2424 = in.m_79.w;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2428 = _2408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2430 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2432 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2436 = fma(_572, _2412, _608);
    out.m_81.x = _2384;
    out.m_81.y = _2402;
    out.m_81.z = _2428;
    out.m_81.w = _2426;
    float _2438 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2440 = -_1822;
    float _2442 = _2440 + 1.0;
    float _2444 = _2304;
    float _2446 = _2430;
    float _2448 = _2438;
    if (_2416)
    {
        _586 = _2362;
    }
    float _2450 = _586;
    out.m_83.x = _2410;
    out.m_83.y = _2404;
    out.m_83.z = _2438;
    float _2452 = _2450;
    if (!_2416)
    {
        float _2454 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2362);
        _2452 = _2454;
    }
    float _2456 = _2452;
    float _2458 = exp2(_2240);
    float _2460 = _2430 * _2304;
    if (_2416)
    {
        _2444 = _2364;
    }
    float _2462 = _2444;
    float _2464 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2466 = _2336 * _2322;
    float _2468 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2470 = _2462;
    if (_2416)
    {
        _2446 = _2462;
    }
    float _2472 = _2446;
    float _2474 = _2464 * _2434;
    float _2476 = _2472;
    if (!_2416)
    {
        _2470 = _2364;
    }
    float _2478 = _2470;
    float _2480 = _2468 * _2406;
    float _2482 = _2330 + 0.5;
    if (_2416)
    {
        _2332 = _2366;
    }
    float _2484 = _2332;
    float _2486 = _2436 + 0.5;
    float _2488 = _2484;
    if (!_2416)
    {
        float _2490 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2478);
        _2476 = _2490;
    }
    float _2492 = _2476;
    float _2494 = _2422 * _2362;
    if (_2416)
    {
        _2448 = _2484;
    }
    float _2496 = _2448;
    out.m_85.x = _2460;
    out.m_85.y = _2466;
    out.m_85.z = _2480;
    out.m_85.w = _2474;
    float _2498 = _2496;
    if (!_2416)
    {
        _2488 = _2366;
    }
    float _2500 = _2488;
    float _2502 = _2418 * _2478;
    float _2504 = -_2458;
    float _2506 = _2504 + 1.0;
    out.m_87.x = _2486;
    out.m_87.y = _2482;
    float _2508 = _2420 * _2500;
    float _2510 = -_2494;
    float _2512 = fma(_2418, _2500, _2510);
    if (!_2416)
    {
        float _2514 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2500);
        _2498 = _2514;
    }
    float _2516 = _2498;
    float _2518 = -_2502;
    float _2520 = fma(_2420, _2362, _2518);
    float _2522 = -_2508;
    float _2524 = fma(_2422, _2478, _2522);
    float _2526 = _2512 * _2424;
    float _2528 = -_2492;
    float _2530 = _1366 * _2528;
    float _2532 = _2520 * _2424;
    float _2534 = -_2420;
    float _2536 = _1366 * _2534;
    float _2538 = _2524 * _2424;
    float _2540 = -_2526;
    float _2542 = _1366 * _2540;
    float _2544 = _1374 * _2420;
    float _2546 = _1374 * _2492;
    float _2548 = _1374 * _2526;
    float _2550 = fma(_1378, _2456, _2530);
    float _2552 = fma(_1378, _2418, _2536);
    float _2554 = fma(_1378, _2538, _2542);
    float _2556 = _1376 * _2420;
    float _2558 = _1376 * _2526;
    float _2560 = fma(_1390, _2456, _2546);
    float _2562 = fma(_1390, _2418, _2544);
    float _2564 = fma(_1390, _2538, _2548);
    float _2566 = fma(_1394, _2538, _2558);
    float _2568 = fma(_1398, _2516, _2560);
    float _2570 = fma(_1398, _2422, _2562);
    float _2572 = fma(_1398, _2532, _2564);
    float _2574 = fma(_1394, _2418, _2556);
    float _2576 = fma(_1380, _2516, _2550);
    float _2578 = fma(_1380, _2422, _2552);
    float _2580 = fma(_1380, _2532, _2554);
    float _2582 = _2568 * _350;
    float _2584 = _2570 * _350;
    float _2586 = _2572 * _350;
    float _2588 = _1376 * _2492;
    float _2590 = fma(_1406, _2422, _2574);
    float _2592 = _2572 * _346;
    float _2594 = _2568 * _346;
    float _2596 = _2568 * _354;
    float _2598 = _2570 * _346;
    float _2600 = _2572 * _354;
    float _2602 = _2570 * _354;
    float _2604 = fma(_2580, _338, _2586);
    float _2606 = fma(_1394, _2456, _2588);
    float _2608 = fma(_1406, _2532, _2566);
    float _2610 = fma(_2580, _334, _2592);
    float _2612 = fma(_2578, _338, _2584);
    float _2614 = fma(_2578, _334, _2598);
    float _2616 = fma(_2578, _342, _2602);
    float _2618 = fma(_1406, _2516, _2606);
    float _2620 = fma(_2608, _358, _2610);
    float _2622 = fma(_2576, _338, _2582);
    float _2624 = fma(_2576, _334, _2594);
    float _2626 = fma(_2580, _342, _2600);
    float _2628 = fma(_2590, _362, _2612);
    float _2630 = fma(_2576, _342, _2596);
    float _2632 = fma(_2590, _358, _2614);
    float _2634 = fma(_2590, _366, _2616);
    float _2636 = fma(_2608, _362, _2604);
    float _2638 = fma(_2618, _362, _2622);
    float _2640 = fma(_2618, _358, _2624);
    float _2642 = fma(_2608, _366, _2626);
    float _2644 = fma(_2618, _366, _2630);
    float _2646 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_89.x = _2628;
    out.m_89.y = _2632;
    out.m_89.z = _2634;
    bool _2648 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2650 = isnan(_1832);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2656 = _2652 || _2654;
    float _2658 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2646);
    float _2660 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_91.x = _2636;
    out.m_91.y = _2620;
    out.m_91.z = _2642;
    float _2662 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2658);
    float _2664 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2660);
    float _2666 = in.m_93.x;
    float _2668 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2670 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2664);
    float _2672 = in.m_93.y;
    float _2674 = 1.0 / _2668;
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2678 = in.m_93.z;
    float _2680 = _2676 + _2668;
    float _2682 = in.m_93.w;
    out.m_95.x = _2638;
    out.m_95.y = _2640;
    out.m_95.z = _2644;
    float _2684 = _2680 * _2674;
    float _2686 = _2684 * 0.5;
    out.m_97.x = _2666;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2688);
    out.m_97.y = _2672;
    float _2692 = 1.0 / _2690;
    out.m_97.z = _2678;
    out.m_97.w = _2682;
    float _2694 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2696 = -_2694;
    float _2698 = _2696 + 1.0;
    float _2700 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2702 = _2692 * _2700;
    float _2704 = abs(_2702);
    float _2706 = log2(_2704);
    bool _2708 = _2702 <= 8000.0;
    bool _2710 = isnan(_2702);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(8000.0);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2722 = exp2(_2720);
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = fma(_2726, -2.0, 3.0);
    float _2730 = _2726 * _2726;
    float _2732 = in.m_71.x;
    float _2734 = _2730 * _2728;
    float _2736 = -_2734;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2734);
    float _2742 = _2718 * _2740;
    float _2744 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2746 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2748 = _2694 * _2152;
    float _2750 = _2163 * _2698;
    float _2752 = _2442 * _2744;
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2746);
    float _2758 = _2163 * _2748;
    float _2760 = _2173 * _2748;
    float _2762 = -_2754;
    float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2766 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2756);
    float _2768 = fma(_2169, _2758, _2157);
    float _2770 = fma(_2171, _2758, _2159);
    float _2772 = _2764 * _2732;
    float _2774 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2766);
    float _2776 = fma(_2163, _2760, _2161);
    float _2778 = _2772 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2780 = _2774 + _2106;
    out.m_99.x = _2768;
    out.m_99.y = _2770;
    out.m_99.z = _2776;
    out.m_99.w = _2750;
    float _2782 = _2780 * 0.5;
    float _2784 = _2694;
    float _2786 = _2698;
    float _2788 = _2772;
    float _2790 = _2780;
    float _2792 = _2134;
    if (!_2656)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2794 = _2784;
    out.m_101.x = _2778;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2656)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2800 = _2786;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2656)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2806 = _2788;
    out.m_103.z = _2782;
    out.m_103.w = _2106;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2656)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2812 = _2790;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2136;
    out.gl_Position.z = _2774;
    out.gl_Position.w = _2106;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2656)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2818 = _2210;
    float _2820 = _2818;
    float _2822 = _2818;
    if (!_2656)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2824 = _2792;
    bool _2826 = !_2656;
    float _2828 = _2824;
    float _2830 = _2824;
    if (!_2826)
    {
        bool _2832 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_1832);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _1832 + _2842;
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
            _2804 = _2884;
            _2822 = _2888;
            _2798 = _2880;
            _2816 = _2886;
            _2810 = _2882;
            _2830 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_1832);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2796;
            _2798 = _2904;
            if (!_2902)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2802;
            _2804 = _2906;
            if (!_2902)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2808;
            _2810 = _2908;
            if (!_2902)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2814;
            _2816 = _2910;
            if (!_2902)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2820;
            _2822 = _2912;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2828;
            bool _2916 = !_2902;
            _2830 = _2914;
            if (!_2916)
            {
                bool _2918 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_1832);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _1832 + _2928;
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
                    _2804 = _2970;
                    _2822 = _2974;
                    _2798 = _2966;
                    _2816 = _2972;
                    _2810 = _2968;
                    _2830 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2804;
    float _2980 = _2822;
    float _2982 = _2798;
    float _2984 = _2816;
    float _2986 = _2810;
    float _2988 = _2830;
    float _2990 = fma(_2640, -0.5, 0.5);
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
    float _3040 = -_1796;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1798;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1800;
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
    float _3082 = _2640 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2638, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2644, _3078, _3090);
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _206 = fma(_188, _188, _202);
    float _208 = fma(_190, _190, _204);
    float _210 = fma(_194, _194, _206);
    float _212 = _182 * _182;
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_198, _198, _218);
    float _222 = in.m_61.x;
    float _224 = in.m_61.y;
    float _226 = in.m_61.z;
    float _228 = sqrt(_214);
    float _230 = sqrt(_220);
    bool _232 = _216 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = 0.0;
    float _238 = _194;
    if (_232)
    {
        float _240 = rsqrt(_210);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = _190 * _224;
    bool _246 = _230 > 0.0;
    float _248 = _180 * _224;
    float _250 = _196 * _224;
    float _252 = fma(_188, _222, _244);
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _222;
    if (!_232)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = fma(_178, _222, _248);
    float _266 = 0.0;
    float _268 = _260;
    float _270 = _262;
    if (_234)
    {
        float _272 = rsqrt(_214);
        _266 = _272;
    }
    float _274 = _266;
    float _276 = fma(_194, _222, _250);
    float _278 = 0.0;
    float _280 = 0.0;
    if (!_234)
    {
        _278 = 0.0;
        _280 = 0.0;
    }
    float _282 = _278;
    float _284 = _280;
    float _286 = 0.0;
    float _288 = _282;
    float _290 = _284;
    if (!_232)
    {
        _286 = 0.0;
    }
    float _292 = _286;
    float _294 = fma(_192, _226, _252);
    float _296 = 0.0;
    float _298 = _292;
    if (!_234)
    {
        _296 = 0.0;
    }
    float _300 = _296;
    float _302 = fma(_182, _226, _264);
    float _304 = 0.0;
    float _306 = _300;
    if (!_246)
    {
        _304 = 0.0;
    }
    float _308 = _304;
    float _310 = 0.0;
    float _312 = _308;
    if (_246)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    float _318 = 0.0;
    if (!_246)
    {
        _318 = 0.0;
    }
    float _320 = _318;
    float _322 = fma(_198, _226, _276);
    float _324 = _320;
    float _326 = _322;
    if (!_246)
    {
        _258 = 0.0;
    }
    float _328 = _258;
    float _330 = _328;
    if (_232)
    {
        float _332 = _242 * _178;
        _298 = _332;
    }
    float _334 = _298;
    if (_232)
    {
        float _336 = _242 * _188;
        _268 = _336;
    }
    float _338 = _268;
    if (_232)
    {
        float _340 = _242 * _194;
        _270 = _340;
    }
    float _342 = _270;
    if (_234)
    {
        float _344 = _274 * _180;
        _306 = _344;
    }
    float _346 = _306;
    if (_234)
    {
        float _348 = _274 * _190;
        _288 = _348;
    }
    float _350 = _288;
    if (_234)
    {
        float _352 = _274 * _196;
        _290 = _352;
    }
    float _354 = _290;
    if (_246)
    {
        float _356 = _316 * _182;
        _312 = _356;
    }
    float _358 = _312;
    if (_246)
    {
        float _360 = _316 * _192;
        _324 = _360;
    }
    float _362 = _324;
    if (_246)
    {
        float _364 = _316 * _198;
        _330 = _364;
    }
    float _366 = _330;
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
    float _416 = in.m_63.x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = 1.0 / _414;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _390 + _432;
    float _436 = in.m_57.w;
    float _438 = _200 * _398;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = _402 * _398;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = in.m_59.w;
    float _448 = 1.0 / _420;
    float _450 = in.m_63.y;
    float _452 = _190 * _394;
    float _454 = _196 * _394;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _456;
    float _460 = _404 * 2.0;
    float _462 = fma(_194, _392, _454);
    float _464 = fma(_188, _392, _452);
    float _466 = 1.0 / _428;
    float _468 = precise::min(_440, _444);
    float _470 = fma(_198, _396, _462);
    float _472 = fma(_192, _396, _464);
    float _474 = _396;
    int _476 = as_type<int>(_404);
    if (_424)
    {
        _238 = _416;
    }
    float _478 = _238;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _482 = _390 + _480;
    float _484 = _410 * _448;
    float _486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _488 = log2(_486);
    float _490 = _434 * _430;
    float _492 = _478;
    if (!_424)
    {
        _492 = _404;
    }
    float _494 = _492;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = floor(_460);
    if (_424)
    {
        _474 = _450;
    }
    float _506 = _474;
    float _508 = _494 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _510 = _506;
    if (!_424)
    {
        _510 = _416;
    }
    float _512 = _510;
    float _514 = _482 * _466;
    float _516 = -_496;
    float _518 = fma(_508, 2.0, _516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _522 = 1.0 + _520;
    float _524 = _488 * _152;
    float _526 = _512 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _528 = 1.0 / _522;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = fma(_526, -2.0, _498);
    float _542 = _450 * 2.0;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _546 = _504 > 0.0;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _550 = _504 >= 0.0;
    bool _552 = isnan(_504);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = exp2(_524);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _564 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[88].z, _544);
    int _566 = _558 ? 0 : 1;
    float _568 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[88].w, _548);
    float _570 = fma(_562, _450, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _572 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _564);
    int _574 = ~_566;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = floor(_542);
    float _582 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _568);
    int _584 = _578;
    float _586 = _572;
    if (!_546)
    {
        int _588 = ~_566;
        int _590 = _588 + 1;
        _584 = _590;
    }
    int _592 = _584;
    float _594 = _570 * _152;
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = -_152;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[86].x, _518);
    float _610 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _540);
    float _612 = _416 * 2.0;
    float _614 = -_560;
    float _616 = _614 + 1.0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _628 = _626 != 0;
    float _630 = _416 + _450;
    float _632 = floor(_612);
    float _634 = _472 + _436;
    float _636 = _604 ? _616 : 0.0;
    float _638 = _630 + (-1.0);
    bool _640 = !_624;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_416, 6.283185482025146484375, _594);
    bool _646 = !_620;
    int _648 = _646 ? 0 : 1;
    if (_538)
    {
        float _650 = _636 * _528;
        _170 = _650;
    }
    float _652 = _170;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _660 = _658 != 0;
    float _662 = _416 + _404;
    bool _664 = _580 >= 0.0;
    bool _666 = isnan(_580);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _676 = _662 + (-1.0);
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _688 = _686 != 0;
    float _690 = -_468;
    float _692 = _690 + 1.0;
    int _694 = _672 ? 0 : 1;
    float _696 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _698 = _580 > 0.0;
    float _700 = _450 + _404;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _704 = _700 + (-1.0);
    int _706 = ~_694;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _712;
    bool _716 = !_628;
    int _718 = _716 ? 0 : 1;
    float _720 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _722 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = fma(_714, _490, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _726 = _710;
    if (!_698)
    {
        int _728 = ~_694;
        int _730 = _728 + 1;
        _726 = _730;
    }
    int _732 = _726;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _734;
    bool _738 = !_688;
    int _740 = _738 ? 0 : 1;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _744 = !_656;
    int _746 = _744 ? 0 : 1;
    float _748 = fma(_736, _490, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _752 = _750 != 0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _760 = _758 != 0;
    float _762 = fma(_458, _490, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _764 = _632 >= 0.0;
    bool _766 = isnan(_632);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _782;
    int _786 = _772 ? 0 : 1;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _788;
    bool _792 = _632 > 0.0;
    float _794 = fma(_776, _484, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _796 = fma(_780, _484, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _798 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _800 = isnan(_390);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _812 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _814 = isnan(_390);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = fma(_784, _514, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _826 = fma(_502, _484, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _828 = fma(_790, _514, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _830 = -_808;
    float _832 = _830 + 1.0;
    float _834 = _810 * _674;
    bool _836 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _838 = isnan(_390);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _850 = -_822;
    float _852 = _850 + 1.0;
    float _854 = _822 * _832;
    float _856 = _848 * _702;
    bool _858 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _860 = isnan(_390);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = _846 * _852;
    float _872 = -_846;
    float _874 = _872 + 1.0;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _876;
    float _880 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].x, _834);
    float _882 = _470 + _446;
    float _884 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _886 = _868 * _874;
    float _888 = fma(_878, _514, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _890 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].y, _856);
    float _892 = floor(_880);
    float _894 = _884 * _742;
    float _896 = -_868;
    float _898 = _896 + 1.0;
    float _900 = _748 * _886;
    float _902 = _724 * _886;
    float _904 = _762 * _886;
    float _906 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].z, _894);
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].x, _900);
    float _910 = floor(_890);
    float _912 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].y, _902);
    bool _914 = !_752;
    int _916 = _914 ? 0 : 1;
    float _918 = fma(_794, _870, _908);
    int _920 = ~_786;
    int _922 = _920 + 1;
    int _924 = _922 + 1;
    float _926 = fma(_796, _870, _912);
    bool _928 = !_756;
    int _930 = _928 ? 0 : 1;
    float _932 = fma(_824, _854, _918);
    float _934 = floor(_906);
    int _936 = _924;
    if (!_792)
    {
        int _938 = ~_786;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = -_892;
    float _946 = _880 + _944;
    int _948 = abs(_930);
    float _950 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].z, _904);
    int _952 = abs(_916);
    float _954 = _880 + 0.25;
    float _956 = float(_942);
    float _958 = -_910;
    float _960 = _890 + _958;
    float _962 = float(_948);
    float _964 = floor(_954);
    float _966 = float(_592);
    float _968 = fma(_826, _870, _950);
    bool _970 = _946 >= 0.5;
    bool _972 = isnan(_946);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.5);
    bool _978 = _974 || _976;
    float _980 = _962 * _956;
    float _982 = -_934;
    float _984 = _906 + _982;
    float _986 = _906 + 0.25;
    float _988 = _890 + 0.25;
    bool _990 = !_978;
    float _992 = _990 ? 0.5 : (-0.5);
    float _994 = _880 * 6.283185482025146484375;
    bool _996 = _960 >= 0.5;
    bool _998 = isnan(_960);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.5);
    bool _1004 = _1000 || _1002;
    float _1006 = floor(_986);
    int _1008 = abs(_746);
    float _1010 = _890 * 6.283185482025146484375;
    int _1012 = abs(_642);
    float _1014 = -_964;
    float _1016 = _954 + _1014;
    bool _1018 = _984 >= 0.5;
    bool _1020 = isnan(_984);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.5);
    bool _1026 = _1022 || _1024;
    float _1028 = _980 * (-2.0);
    bool _1030 = !_1004;
    float _1032 = _1030 ? 0.5 : (-0.5);
    float _1034 = floor(_988);
    float _1036 = _994 * 0.15915493667125701904296875;
    float _1038 = _992 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1040 = _1038 * 2.0;
    float _1042 = float(_1008);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1046 = _1044 * 2.0;
    bool _1048 = _1016 > 0.5;
    float _1050 = -_1006;
    float _1052 = _986 + _1050;
    int _1054 = abs(_648);
    float _1056 = _1042 * _1046;
    bool _1058 = !_684;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _1036 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    bool _1066 = !_1026;
    float _1068 = _1066 ? 0.5 : (-0.5);
    float _1070 = fma(_828, _854, _926);
    float _1072 = float(_1012);
    float _1074 = -_1034;
    float _1076 = _988 + _1074;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1080 = _1078 != 0;
    float _1082 = _1010 * 0.15915493667125701904296875;
    float _1084 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1086 = _1084 * 2.0;
    int _1088 = abs(_1060);
    float _1090 = _1072 * _1040;
    bool _1092 = !_1080;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = in.m_65.x;
    float _1098 = in.m_65.y;
    float _1100 = in.m_65.z;
    float _1102 = float(_1054);
    float _1104 = _1082 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    int _1108 = abs(_718);
    float _1110 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1112 = _1016;
    float _1114 = _1076;
    float _1116 = _1052;
    if (_1048)
    {
        float _1118 = -_1016;
        float _1120 = _1118 + 1.0;
        _1112 = _1120;
    }
    float _1122 = _1112;
    int _1124 = abs(_1094);
    float _1126 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].x, _932);
    float _1128 = fma(_1102, _1110, _1090);
    float _1130 = float(_1108);
    float _1132 = fma(_1122, 4.0, -1.0);
    bool _1134 = _1076 > 0.5;
    float _1136 = in.m_67.z;
    float _1138 = float(_1124);
    float _1140 = _906 * 6.283185482025146484375;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1144 = !_660;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_888, _854, _968);
    float _1150 = _1140 * 0.15915493667125701904296875;
    float _1152 = fma(_1130, _1142, _1128);
    int _1154 = abs(_1146);
    float _1156 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1158 = _1150 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = float(_952);
    if (_1134)
    {
        float _1164 = -_1076;
        float _1166 = _1164 + 1.0;
        _1114 = _1166;
    }
    float _1168 = _1114;
    bool _1170 = _1052 > 0.5;
    float _1172 = fma(_1138, _1156, _1056);
    bool _1174 = !_680;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_1152, 3.1415927410125732421875, _1096);
    float _1180 = _1162 * _966;
    float _1182 = float(_1088);
    float _1184 = fma(_1168, 4.0, -1.0);
    int _1186 = abs(_1176);
    float _1188 = _1180 * (-2.0);
    float _1190 = float(_1154);
    float _1192 = _1182 * _1086;
    float _1194 = float(_1186);
    float _1196 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    if (_1170)
    {
        float _1200 = -_1052;
        float _1202 = _1200 + 1.0;
        _1116 = _1202;
    }
    float _1204 = _1116;
    float _1206 = fma(_1178, _1188, _1178);
    float _1208 = _416 + (-0.5);
    float _1210 = fma(_1194, _1196, _1192);
    float _1212 = fma(_1190, _1198, _1172);
    float _1214 = _644 * 0.15915493667125701904296875;
    int _1216 = abs(_740);
    float _1218 = fma(_1204, 4.0, -1.0);
    bool _1220 = !_760;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = fma(_722, _1188, _722);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    float _1228 = fma(_1212, 3.1415927410125732421875, _1098);
    float _1230 = float(_1216);
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1234 = abs(_1222);
    float _1236 = fma(_1224, _652, _1226);
    float _1238 = _450 + (-0.5);
    float _1240 = fma(_1228, _1028, _1228);
    float _1242 = float(_732);
    float _1244 = fma(_1230, _1232, _1210);
    float _1246 = float(_1234);
    float _1248 = fma(_720, _1028, _720);
    float _1250 = _1214 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1240);
    float _1256 = fma(_1244, 3.1415927410125732421875, _1100);
    float _1258 = _1246 * _1242;
    float _1260 = in.m_69.x;
    float _1262 = in.m_69.y;
    float _1264 = in.m_69.z;
    float _1266 = fma(_1248, _652, _1254);
    float _1268 = _882 * _882;
    float _1270 = _1258 * (-2.0);
    float _1272 = in.m_67.y;
    float _1274 = _1236 * 0.15915493667125701904296875;
    float _1276 = _1266 * 0.15915493667125701904296875;
    float _1278 = fma(_696, _1270, _696);
    float _1280 = fma(_1256, _1270, _1256);
    float _1282 = _404 + (-0.5);
    float _1284 = in.m_67.x;
    float _1286 = fma(_634, _634, _1268);
    float _1288 = abs(_1252);
    float _1290 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1280);
    float _1294 = _1274 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1148);
    float _1300 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1290);
    float _1302 = fma(_1278, _652, _1292);
    float _1304 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1070);
    float _1306 = _612 + (-1.0);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1136);
    float _1310 = _1302 * 0.15915493667125701904296875;
    float _1312 = _1276 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1304 * _1262;
    float _1318 = _1126 * _1260;
    float _1320 = _1298 * _1264;
    float _1322 = -_1300;
    float _1324 = _1322 + _1272;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = _1276 * 6.283185482025146484375;
    float _1330 = cos(_1328);
    float _1332 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1324);
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1340 = _1332 * _1334;
    float _1342 = _1336 * _1308;
    float _1344 = sqrt(_1286);
    float _1346 = _1326 * _1338;
    float _1348 = _1296 * _1314;
    float _1350 = _1274 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = _1296 * _1330;
    float _1356 = _1310 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = _1306 * _1344;
    float _1362 = _1360 * 0.75;
    float _1364 = _1310 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1352 * _1314;
    float _1370 = _1352 * _1330;
    float _1372 = _1362 * 0.15915493667125701904296875;
    float _1374 = _1296 * _1358;
    float _1376 = _1352 * _1358;
    float _1378 = _1330 * _1358;
    float _1380 = _1314 * _1358;
    float _1382 = _1374 * _1340;
    float _1384 = _1376 * _1340;
    float _1386 = _1372 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = fma(_1366, _1354, _1368);
    float _1392 = -_1348;
    float _1394 = fma(_1366, _1370, _1392);
    float _1396 = -_1370;
    float _1398 = fma(_1366, _1348, _1396);
    float _1400 = -_1340;
    float _1402 = _1366 * _1400;
    float _1404 = fma(_1390, _1346, _1382);
    float _1406 = fma(_1366, _1368, _1354);
    float _1408 = fma(_1394, _1346, _1384);
    float _1410 = fma(_1378, _1346, _1402);
    float _1412 = fma(_1398, _1342, _1404);
    float _1414 = _1372 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = fma(_1380, _1342, _1410);
    float _1420 = _1412 * _350;
    float _1422 = fma(_1406, _1342, _1408);
    float _1424 = _1412 * _354;
    float _1426 = fma(_1418, _338, _1420);
    float _1428 = fma(_1418, _342, _1424);
    float _1430 = fma(_1422, _362, _1426);
    float _1432 = fma(_1422, _366, _1428);
    float _1434 = _1430 * _1388;
    float _1436 = _1430 * _1416;
    float _1438 = -_1434;
    float _1440 = fma(_1432, _1416, _1438);
    float _1442 = fma(_1432, _1388, _1436);
    float _1444 = _882 + _1440;
    float _1446 = _634 + _1442;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1444 + _1448;
    float _1452 = in.m_71.y;
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1456 = _1446 + _1454;
    float _1458 = _1450 * _1450;
    float _1460 = fma(_1456, _1456, _1458);
    float _1462 = sqrt(_1460);
    float _1464 = _394 + _1452;
    bool _1466 = _1462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = _1462 + _1468;
    float _1472 = _1416;
    float _1474 = _1452;
    float _1476 = _1462;
    float _1478 = _1346;
    float _1480 = _1464;
    if (_1466)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1472 = _1482;
    }
    float _1484 = _1472;
    if (_1466)
    {
        float _1486 = rsqrt(_1460);
        _1474 = _1486;
    }
    float _1488 = _1474;
    float _1490 = _1488;
    if (_1466)
    {
        float _1492 = _1470 * _1484;
        _1476 = _1492;
    }
    float _1494 = _1476;
    if (_1466)
    {
        float _1496 = _1494 * 0.15915493667125701904296875;
        _1478 = _1496;
    }
    float _1498 = _1478;
    float _1500 = _1412 * _346;
    float _1502 = _1484;
    float _1504 = _1500;
    if (_1466)
    {
        float _1506 = _1498 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = fma(_1418, _334, _1500);
    float _1514 = _1512;
    if (!_1466)
    {
        _1504 = _1444;
    }
    float _1516 = _1504;
    float _1518 = fma(_1422, _358, _1512);
    float _1520 = _1464 + _1518;
    float _1522 = _1516;
    float _1524 = _1520;
    if (_1466)
    {
        float _1526 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1526;
    }
    float _1528 = _1514;
    float _1530 = _1528;
    float _1532 = _1510;
    if (_1466)
    {
        float _1534 = fma(_1510, _1528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1530 = _1534;
    }
    float _1536 = _1530;
    float _1538 = _1536;
    if (!_1466)
    {
        _1532 = _1446;
    }
    float _1540 = _1532;
    float _1542 = _1540;
    if (_1466)
    {
        float _1544 = _1488 * _1536;
        _1538 = _1544;
    }
    float _1546 = _1538;
    if (_1466)
    {
        float _1548 = fma(_1450, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1522 = _1548;
    }
    float _1550 = _1522;
    float _1552 = _1550;
    if (_1466)
    {
        float _1554 = fma(_1456, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1542 = _1554;
    }
    float _1556 = _1542;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1560 = _1550 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1564 = _1556 + _1562;
    float _1566 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1568 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5264 = float2(_1568, _1566);
    float _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5264, float2(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5264, float2(0.0), isnan(_5264)), level(0.0)).x;
    float _1572 = _1564;
    float _1574 = _1556;
    if (_1466)
    {
        float _1576 = _1498 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_634;
    float _1584 = _1582 + _1556;
    float _1586 = -_882;
    float _1588 = _1586 + _1550;
    bool _1590 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1592 = isnan(0.5);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1598 = _1594 || _1596;
    float _1600 = _1588;
    if (_1466)
    {
        float _1602 = _1580 + (-1.0);
        _1490 = _1602;
    }
    float _1604 = _1490;
    float _1606 = _1604;
    if (_1466)
    {
        float _1608 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1608;
    }
    float _1610 = _1606;
    if (_1466)
    {
        float _1612 = fma(_1520, _1580, _1610);
        _1524 = _1612;
    }
    float _1614 = _1524;
    float _1616 = -_1464;
    float _1618 = _1616 + _1614;
    float _1620 = fma(_882, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1622 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1624 = _1618 * _1618;
    float _1626 = floor(_1620);
    float _1628 = fma(_1584, _1584, _1624);
    float _1630 = fma(_1588, _1588, _1628);
    float _1632 = floor(_1622);
    float _1634 = -_1626;
    float _1636 = _1620 + _1634;
    float _1638 = sqrt(_1630);
    float _1640 = -_1632;
    float _1642 = _1622 + _1640;
    bool _1644 = _1638 > 0.0;
    float _1646 = _1632;
    float _1648 = _1614;
    if (!_1644)
    {
        _1646 = _1550;
    }
    float _1650 = _1646;
    float _1652 = fma(_1570, 100.0, _1614);
    float _1654 = fma(_1570, 100.0, _1464);
    float _1656 = _1650;
    float _1658 = _1650;
    if (!_1644)
    {
        _1648 = _1556;
    }
    float _1660 = _1648;
    float _1662 = _1660;
    if (!_1644)
    {
        _1480 = _1652;
    }
    float _1664 = _1480;
    bool _1666 = !_1644;
    float _1668 = _1664;
    if (!_1666)
    {
        float _1670 = _302 * _302;
        float _1672 = rsqrt(_1630);
        float _1674 = fma(_294, _294, _1670);
        float _1676 = fma(_322, _322, _1674);
        float _1678 = sqrt(_1676);
        float _1680 = _1584 * _1672;
        float _1682 = _1618 * _1672;
        float _1684 = _1588 * _1672;
        bool _1686 = _1678 > 0.0;
        float _1688 = _1678;
        float _1690 = _1672;
        _1600 = _1684;
        if (!_1686)
        {
            _1688 = _1556;
        }
        float _1692 = _1688;
        _1662 = _1692;
        if (!_1686)
        {
            _1690 = _1652;
        }
        float _1694 = _1690;
        _1668 = _1694;
        if (!_1686)
        {
            _1656 = _1550;
        }
        float _1696 = _1656;
        bool _1698 = !_1686;
        _1658 = _1696;
        if (!_1698)
        {
            float _1700 = rsqrt(_1676);
            float _1702 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1704 = _302 * _1700;
            float _1706 = _294 * _1700;
            float _1708 = _1682 * _1704;
            float _1710 = _322 * _1700;
            float _1712 = fma(_1680, _1706, _1708);
            float _1714 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1716 = fma(_1684, _1710, _1712);
            float _1718 = _1716 * _1714;
            float _1720 = fma(_294, _1718, _1556);
            float _1722 = fma(_302, _1718, _1652);
            float _1724 = fma(_322, _1718, _1550);
            _1662 = _1720;
            _1658 = _1724;
            _1668 = _1722;
        }
    }
    float _1726 = _1662;
    float _1728 = _1658;
    float _1730 = _1668;
    float _1732 = _1600;
    float _1734 = _1730;
    float _1736 = _1732;
    if (_1598)
    {
        _1552 = _1726;
    }
    float _1738 = _1552;
    float _1740 = _1738;
    if (_1598)
    {
        _1574 = _1728;
    }
    float _1742 = _1574;
    float _1744 = _1742;
    if (!_1598)
    {
        float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1748 = _1654 + _1746;
        float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1752 = _634 + _1750;
        float _1754 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1756 = -_882;
        float _1758 = _1756 + _1728;
        float _1760 = _1748 * _1748;
        float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1764 = _882 + _1762;
        float _1766 = fma(_1752, _1752, _1760);
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1770 = fma(_1764, _1764, _1766);
        float _1772 = sqrt(_1770);
        float _1774 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1776 = precise::min(_1772, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1778 = _1776 * _1768;
        float _1780 = -_634;
        float _1782 = _1780 + _1726;
        float _1784 = _1774 * _1778;
        float _1786 = -_1654;
        float _1788 = _1786 + _1730;
        float _1790 = fma(_1782, _1784, _634);
        float _1792 = fma(_1788, _1784, _1654);
        float _1794 = fma(_1758, _1784, _882);
        _1734 = _1792;
        _1740 = _1790;
        _1744 = _1794;
        _326 = _1768;
    }
    float _1796 = _1734;
    float _1798 = _1740;
    float _1800 = _1744;
    float _1802 = _326;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1806 = _1796 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1798 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1814 = _1800 + _1812;
    float _1816 = in.m_73.y;
    float _1818 = _1806 * _1806;
    float _1820 = fma(_1810, _1810, _1818);
    float2 _5662 = float2(_1642, _1636);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5662, float2(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5662, float2(0.0), isnan(_5662)), level(0.0)).x;
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1826 = _1824 != 0;
    float _1828 = fma(_1814, _1814, _1820);
    float _1830 = rsqrt(_1828);
    float _1832 = sqrt(_1828);
    float _1834 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1836 = _1810 * _1834;
    float _1838 = _1814 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 * _1838;
    float _1844 = _1840 + _1842;
    float _1846 = sqrt(_1844);
    bool _1848 = _1846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1852 = _1846 + _1850;
    float _1854 = _1814;
    float _1856 = _1852;
    float _1858 = _1802;
    float _1860 = _1806;
    if (_1848)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1854 = _1862;
    }
    float _1864 = _1854;
    if (_1848)
    {
        float _1866 = _1852 * _1864;
        _1856 = _1866;
    }
    float _1868 = _1856;
    if (_1848)
    {
        float _1870 = _1868 * 0.15915493667125701904296875;
        _1858 = _1870;
    }
    float _1872 = _1858;
    float _1874 = _1830;
    float _1876 = _1872;
    if (_1848)
    {
        float _1878 = _1872 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1874 = _1880;
    }
    float _1882 = _1874;
    float _1884 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1886 = precise::max(0.0, _1884);
    float _1888 = _1818;
    float _1890 = _1886;
    if (_1848)
    {
        float _1892 = _1872 * 6.283185482025146484375;
        float _1894 = cos(_1892);
        _1888 = _1894;
    }
    float _1896 = _1888;
    float _1898 = -_1834;
    float _1900 = -_1886;
    float _1902 = fma(_1806, _1898, _1900);
    float _1904 = _1884;
    if (_1848)
    {
        float _1906 = rsqrt(_1844);
        _1904 = _1906;
    }
    float _1908 = _1904;
    if (_1848)
    {
        float _1910 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1910;
    }
    float _1912 = _1890;
    float _1914 = _1912;
    float _1916 = _1882;
    if (_1848)
    {
        float _1918 = fma(_1882, _1912, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1914 = _1918;
    }
    float _1920 = _1914;
    float _1922 = _1920;
    if (!_1848)
    {
        _1916 = _1836;
    }
    float _1924 = _1916;
    float _1926 = _1924;
    float _1928 = _1896;
    if (_1848)
    {
        float _1930 = _1896 + (-1.0);
        _1860 = _1930;
    }
    float _1932 = _1860;
    float _1934 = _1932;
    if (_1848)
    {
        float _1936 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1936;
    }
    float _1938 = _1876;
    if (!_1848)
    {
        _1934 = _1838;
    }
    float _1940 = _1934;
    float _1942 = _1908;
    float _1944 = _1940;
    if (_1848)
    {
        float _1946 = _1908 * _1920;
        _1736 = _1946;
    }
    float _1948 = _1736;
    if (!_1848)
    {
        _1942 = _1902;
    }
    float _1950 = _1942;
    float _1952 = _1950;
    if (_1848)
    {
        float _1954 = fma(_1902, _1896, _1938);
        _1952 = _1954;
    }
    float _1956 = _1952;
    if (!_1848)
    {
        _1922 = _1840;
    }
    float _1958 = _1922;
    float _1960 = _1958;
    if (_1848)
    {
        float _1962 = _1836 * _1948;
        _1926 = _1962;
    }
    float _1964 = _1926;
    if (_1848)
    {
        float _1966 = _1838 * _1948;
        _1944 = _1966;
    }
    float _1968 = _1944;
    if (!_1848)
    {
        _1928 = _1842;
    }
    float _1970 = _1928;
    float _1972 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = _1970;
    if (_1848)
    {
        float _1976 = _1964 * _1964;
        _1960 = _1976;
    }
    float _1978 = _1960;
    if (_1848)
    {
        float _1980 = _1968 * _1968;
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1986 = fma(_1956, _1956, _1978);
    float _1988 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1990 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1984);
    float _1992 = _1986 + _1982;
    float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1996 = fma(_1832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1994);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1988);
    float _2002 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2004 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2006 = -_1998;
    float _2008 = _2006 + 1.0;
    float _2010 = rsqrt(_1992);
    float _2012 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2000);
    float _2014 = _2002 * _416;
    float _2016 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2018 = abs(_2008);
    float _2020 = log2(_2018);
    float _2022 = _2010 * _1964;
    float _2024 = _2010 * _1956;
    float _2026 = _2010 * _1968;
    float _2028 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2032 = trunc(_2014);
    int _2034 = int(_2032);
    float _2036 = -_2030;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2042 = _2028 * _416;
    float _2044 = -_2026;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2052 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = exp2(_2040);
    float _2058 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2050);
    float _2060 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2052);
    float _2062 = fma(_2046, 0.5, 0.5);
    int _2064 = _2034 << 4;
    int _2066 = _2064 + 1712;
    float _2068 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2058);
    float _2070 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2060);
    float _2072 = sqrt(_2054);
    float _2074 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2076 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2078 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2080 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2082 = -_2078;
    float _2084 = fma(_2082, _2048, 1.0);
    float _2086 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2088 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2080);
    float _2090 = fma(_2062, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2092 = _2024 + 1.0;
    float _2094 = log2(_2084);
    float _2096 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2088);
    float _2098 = fma(_2062, _2090, -0.212114393711090087890625);
    float _2100 = -_2024;
    float _2102 = fma(_2056, _2092, _2100);
    float _2104 = _2072 * 0.636619746685028076171875;
    float _2106 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2096);
    float _2108 = fma(_2062, _2098, 1.570728778839111328125);
    float _2110 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2112 = fma(_2102, 0.5, 0.5);
    float _2114 = 1.0 / _2106;
    float _2116 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2086);
    float _2118 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2110);
    float _2120 = -_2108;
    float _2122 = fma(_2104, _2120, 1.0);
    float _2124 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2116);
    float _2126 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2118);
    float _2128 = _2094 * 0.693147182464599609375;
    float _2130 = trunc(_2042);
    int _2132 = int(_2130);
    float _2134 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2126);
    float _2136 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2138 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2140 = _2134 * _2114;
    float _2142 = _2136 * _2114;
    float _2144 = fma(_2140, 0.5, 0.5);
    float _2146 = fma(_2142, -0.5, 0.5);
    int _2148 = _2132 << 4;
    int _2150 = _2148 + 1968;
    float3 _6210 = float3(_2144, _2146, _2138);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).x;
    float3 _6221 = float3(_2144, _2146, _2138);
    float4 _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6221, float3(0.0), isnan(_6221)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6221, float3(0.0), isnan(_6221)), level(0.0)).xyzw;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = _2155.w;
    float2 _6237 = float2(_2122, _2112);
    float3 _2167 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6237, float2(0.0), isnan(_6237)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6237, float2(0.0), isnan(_6237)), level(0.0)).xyz;
    float _2169 = _2167.x;
    float _2171 = _2167.y;
    float _2173 = _2167.z;
    uint _2176 = uint(int(uint(_2066) >> uint(2)));
    uint _2178 = uint(int(uint(int(_2176)) >> uint(2)));
    int _2180 = int(_2176) & 3;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[int(_2178)][_2180];
    int _2184 = int(_2176) + 1;
    uint _2186 = uint(int(uint(_2184) >> uint(2)));
    int _2188 = _2184 & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    float _2192 = in.m_73.x;
    int _2194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2196 = _2194 != 0;
    float _2198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2200 = _406 > 0.5;
    float _2202 = 0.0;
    int _2204 = as_type<int>(_2144);
    float _2206 = as_type<float>(_2066);
    float _2208 = _2138;
    float _2210 = _2136;
    if (_1826)
    {
        float _2212 = in.m_63.z;
        _2202 = _2212;
    }
    float _2214 = _2202;
    float _2216 = -_1816;
    float _2218 = _2216 + 1.0;
    bool _2220 = _404 > 0.5;
    uint _2222 = uint(int(uint(_2150) >> uint(2)));
    uint _2224 = uint(int(uint(int(_2222)) >> uint(2)));
    int _2226 = int(_2222) & 3;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[int(_2224)][_2226];
    int _2230 = int(_2222) + 1;
    uint _2232 = uint(int(uint(_2230) >> uint(2)));
    int _2234 = _2230 & 3;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[int(_2232)][_2234];
    bool _2238 = _450 > 0.5;
    float _2240 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2244 = _2242 != 0;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2250 = _2248 != 0;
    out.m_75.x = _1798;
    out.m_75.y = _1796;
    out.m_75.z = _1800;
    int _2252 = _2066 + 8;
    uint _2254 = uint(int(uint(_2252) >> uint(2)));
    uint _2256 = uint(int(uint(int(_2254)) >> uint(2)));
    int _2258 = int(_2254) & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    int _2262 = _2150 + 8;
    uint _2264 = uint(int(uint(_2262) >> uint(2)));
    uint _2266 = uint(int(uint(int(_2264)) >> uint(2)));
    int _2268 = int(_2264) & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    int _2272 = _2220 ? as_type<int>(_2218) : as_type<int>(_1816);
    float _2274 = _1816;
    bool _2276 = _2244;
    float _2278 = _2192;
    if (_1826)
    {
        float _2280 = -_2192;
        float _2282 = _2280 + 1.0;
        _2204 = as_type<int>(_2282);
    }
    int _2284 = _2204;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2288 = _2286 != 0;
    float _2290 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2292 = _2238 ? as_type<int>(_2218) : as_type<int>(_1816);
    bool _2294 = _2288;
    if (_2250)
    {
        float _2296 = -_2192;
        float _2298 = _2296 + 1.0;
        _476 = as_type<int>(_2298);
    }
    int _2300 = _476;
    float _2302 = _2244 ? as_type<float>(_2272) : _1816;
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2306 = _2288 ? as_type<float>(_2292) : _1816;
    if (_2196)
    {
        float _2308 = _2200 ? _2218 : _1816;
        _2274 = _2308;
    }
    float _2310 = _2274;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2314 = _2312 != 0;
    float _2316 = fma(_2302, _2290, -0.5);
    if (_1826)
    {
        bool _2318 = _2214 > 0.5;
        _2294 = _2318;
    }
    bool _2320 = _2294;
    float _2322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2250)
    {
        bool _2324 = _416 > 0.5;
        _2276 = _2324;
    }
    bool _2326 = _2276;
    float _2328 = -_610;
    float _2330 = fma(_582, _2316, _2328);
    float _2332 = _2330;
    if (!_1826)
    {
        _2206 = _2192;
    }
    float _2334 = _2206;
    float _2336 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2338 = _2334;
    if (_1826)
    {
        float _2340 = _2320 ? as_type<float>(_2284) : _2192;
        _2338 = _2340;
    }
    float _2342 = _2338;
    if (!_2250)
    {
        _2208 = _2192;
    }
    float _2344 = _2208;
    float _2346 = _2182 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2348 = _2344;
    int _2350 = as_type<int>(_2182);
    if (_2250)
    {
        float _2352 = _2326 ? as_type<float>(_2300) : _2192;
        _2348 = _2352;
    }
    float _2354 = _2348;
    if (_2314)
    {
        float _2356 = -_2192;
        float _2358 = _2356 + 1.0;
        _2350 = as_type<int>(_2358);
    }
    int _2360 = _2350;
    float _2362 = in.m_77.x;
    float _2364 = in.m_77.y;
    float _2366 = in.m_77.z;
    float _2368 = -_1300;
    float _2370 = -_1272;
    bool _2372 = _2368 != _2370;
    bool _2374 = isnan(_2368);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(_2370);
    bool _2380 = _2376 || _2378;
    float _2382 = _2190 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2384 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2314)
    {
        float _2386 = _2238 ? as_type<float>(_2360) : _2192;
        _2278 = _2386;
    }
    float _2388 = _2278;
    float _2390 = _2228 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2392 = _2236 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2394 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2396 = _1284 == 0.0;
    bool _2398 = !_2380;
    bool _2400 = _2396 && _2398;
    float _2402 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2404 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2408 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2410 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = fma(_2394, _2388, -0.5);
    bool _2414 = _1136 == 0.0;
    bool _2416 = _2414 && _2400;
    float _2418 = in.m_79.x;
    float _2420 = in.m_79.y;
    float _2422 = in.m_79.z;
    float _2424 = in.m_79.w;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2428 = _2408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2430 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2432 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2436 = fma(_572, _2412, _608);
    out.m_81.x = _2384;
    out.m_81.y = _2402;
    out.m_81.z = _2428;
    out.m_81.w = _2426;
    float _2438 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2440 = -_1822;
    float _2442 = _2440 + 1.0;
    float _2444 = _2304;
    float _2446 = _2430;
    float _2448 = _2438;
    if (_2416)
    {
        _586 = _2362;
    }
    float _2450 = _586;
    out.m_83.x = _2410;
    out.m_83.y = _2404;
    out.m_83.z = _2438;
    float _2452 = _2450;
    if (!_2416)
    {
        float _2454 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2362);
        _2452 = _2454;
    }
    float _2456 = _2452;
    float _2458 = exp2(_2240);
    float _2460 = _2430 * _2304;
    if (_2416)
    {
        _2444 = _2364;
    }
    float _2462 = _2444;
    float _2464 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2466 = _2336 * _2322;
    float _2468 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2470 = _2462;
    if (_2416)
    {
        _2446 = _2462;
    }
    float _2472 = _2446;
    float _2474 = _2464 * _2434;
    float _2476 = _2472;
    if (!_2416)
    {
        _2470 = _2364;
    }
    float _2478 = _2470;
    float _2480 = _2468 * _2406;
    float _2482 = _2330 + 0.5;
    if (_2416)
    {
        _2332 = _2366;
    }
    float _2484 = _2332;
    float _2486 = _2436 + 0.5;
    float _2488 = _2484;
    if (!_2416)
    {
        float _2490 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2478);
        _2476 = _2490;
    }
    float _2492 = _2476;
    float _2494 = _2422 * _2362;
    if (_2416)
    {
        _2448 = _2484;
    }
    float _2496 = _2448;
    out.m_85.x = _2460;
    out.m_85.y = _2466;
    out.m_85.z = _2480;
    out.m_85.w = _2474;
    float _2498 = _2496;
    if (!_2416)
    {
        _2488 = _2366;
    }
    float _2500 = _2488;
    float _2502 = _2418 * _2478;
    float _2504 = -_2458;
    float _2506 = _2504 + 1.0;
    out.m_87.x = _2486;
    out.m_87.y = _2482;
    float _2508 = _2420 * _2500;
    float _2510 = -_2494;
    float _2512 = fma(_2418, _2500, _2510);
    if (!_2416)
    {
        float _2514 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2500);
        _2498 = _2514;
    }
    float _2516 = _2498;
    float _2518 = -_2502;
    float _2520 = fma(_2420, _2362, _2518);
    float _2522 = -_2508;
    float _2524 = fma(_2422, _2478, _2522);
    float _2526 = _2512 * _2424;
    float _2528 = -_2492;
    float _2530 = _1366 * _2528;
    float _2532 = _2520 * _2424;
    float _2534 = -_2420;
    float _2536 = _1366 * _2534;
    float _2538 = _2524 * _2424;
    float _2540 = -_2526;
    float _2542 = _1366 * _2540;
    float _2544 = _1374 * _2420;
    float _2546 = _1374 * _2492;
    float _2548 = _1374 * _2526;
    float _2550 = fma(_1378, _2456, _2530);
    float _2552 = fma(_1378, _2418, _2536);
    float _2554 = fma(_1378, _2538, _2542);
    float _2556 = _1376 * _2420;
    float _2558 = _1376 * _2526;
    float _2560 = fma(_1390, _2456, _2546);
    float _2562 = fma(_1390, _2418, _2544);
    float _2564 = fma(_1390, _2538, _2548);
    float _2566 = fma(_1394, _2538, _2558);
    float _2568 = fma(_1398, _2516, _2560);
    float _2570 = fma(_1398, _2422, _2562);
    float _2572 = fma(_1398, _2532, _2564);
    float _2574 = fma(_1394, _2418, _2556);
    float _2576 = fma(_1380, _2516, _2550);
    float _2578 = fma(_1380, _2422, _2552);
    float _2580 = fma(_1380, _2532, _2554);
    float _2582 = _2568 * _350;
    float _2584 = _2570 * _350;
    float _2586 = _2572 * _350;
    float _2588 = _1376 * _2492;
    float _2590 = fma(_1406, _2422, _2574);
    float _2592 = _2572 * _346;
    float _2594 = _2568 * _346;
    float _2596 = _2568 * _354;
    float _2598 = _2570 * _346;
    float _2600 = _2572 * _354;
    float _2602 = _2570 * _354;
    float _2604 = fma(_2580, _338, _2586);
    float _2606 = fma(_1394, _2456, _2588);
    float _2608 = fma(_1406, _2532, _2566);
    float _2610 = fma(_2580, _334, _2592);
    float _2612 = fma(_2578, _338, _2584);
    float _2614 = fma(_2578, _334, _2598);
    float _2616 = fma(_2578, _342, _2602);
    float _2618 = fma(_1406, _2516, _2606);
    float _2620 = fma(_2608, _358, _2610);
    float _2622 = fma(_2576, _338, _2582);
    float _2624 = fma(_2576, _334, _2594);
    float _2626 = fma(_2580, _342, _2600);
    float _2628 = fma(_2590, _362, _2612);
    float _2630 = fma(_2576, _342, _2596);
    float _2632 = fma(_2590, _358, _2614);
    float _2634 = fma(_2590, _366, _2616);
    float _2636 = fma(_2608, _362, _2604);
    float _2638 = fma(_2618, _362, _2622);
    float _2640 = fma(_2618, _358, _2624);
    float _2642 = fma(_2608, _366, _2626);
    float _2644 = fma(_2618, _366, _2630);
    float _2646 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_89.x = _2628;
    out.m_89.y = _2632;
    out.m_89.z = _2634;
    bool _2648 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2650 = isnan(_1832);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2656 = _2652 || _2654;
    float _2658 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2646);
    float _2660 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_91.x = _2636;
    out.m_91.y = _2620;
    out.m_91.z = _2642;
    float _2662 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2658);
    float _2664 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2660);
    float _2666 = in.m_93.x;
    float _2668 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2670 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2664);
    float _2672 = in.m_93.y;
    float _2674 = 1.0 / _2668;
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2678 = in.m_93.z;
    float _2680 = _2676 + _2668;
    float _2682 = in.m_93.w;
    out.m_95.x = _2638;
    out.m_95.y = _2640;
    out.m_95.z = _2644;
    float _2684 = _2680 * _2674;
    float _2686 = _2684 * 0.5;
    out.m_97.x = _2666;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2688);
    out.m_97.y = _2672;
    float _2692 = 1.0 / _2690;
    out.m_97.z = _2678;
    out.m_97.w = _2682;
    float _2694 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2696 = -_2694;
    float _2698 = _2696 + 1.0;
    float _2700 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2702 = _2692 * _2700;
    float _2704 = abs(_2702);
    float _2706 = log2(_2704);
    bool _2708 = _2702 <= 8000.0;
    bool _2710 = isnan(_2702);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(8000.0);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2722 = exp2(_2720);
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = fma(_2726, -2.0, 3.0);
    float _2730 = _2726 * _2726;
    float _2732 = in.m_71.x;
    float _2734 = _2730 * _2728;
    float _2736 = -_2734;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2734);
    float _2742 = _2718 * _2740;
    float _2744 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2746 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2748 = _2694 * _2152;
    float _2750 = _2163 * _2698;
    float _2752 = _2442 * _2744;
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2746);
    float _2758 = _2163 * _2748;
    float _2760 = _2173 * _2748;
    float _2762 = -_2754;
    float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2766 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2756);
    float _2768 = fma(_2169, _2758, _2157);
    float _2770 = fma(_2171, _2758, _2159);
    float _2772 = _2764 * _2732;
    float _2774 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2766);
    float _2776 = fma(_2163, _2760, _2161);
    float _2778 = _2772 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2780 = _2774 + _2106;
    out.m_99.x = _2768;
    out.m_99.y = _2770;
    out.m_99.z = _2776;
    out.m_99.w = _2750;
    float _2782 = _2780 * 0.5;
    float _2784 = _2694;
    float _2786 = _2698;
    float _2788 = _2772;
    float _2790 = _2780;
    float _2792 = _2134;
    if (!_2656)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2794 = _2784;
    out.m_101.x = _2778;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2656)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2800 = _2786;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2656)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2806 = _2788;
    out.m_103.z = _2782;
    out.m_103.w = _2106;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2656)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2812 = _2790;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2136;
    out.gl_Position.z = _2774;
    out.gl_Position.w = _2106;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2656)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2818 = _2210;
    float _2820 = _2818;
    float _2822 = _2818;
    if (!_2656)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2824 = _2792;
    bool _2826 = !_2656;
    float _2828 = _2824;
    float _2830 = _2824;
    if (!_2826)
    {
        bool _2832 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_1832);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _1832 + _2842;
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
            _2804 = _2884;
            _2822 = _2888;
            _2798 = _2880;
            _2816 = _2886;
            _2810 = _2882;
            _2830 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_1832);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2796;
            _2798 = _2904;
            if (!_2902)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2802;
            _2804 = _2906;
            if (!_2902)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2808;
            _2810 = _2908;
            if (!_2902)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2814;
            _2816 = _2910;
            if (!_2902)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2820;
            _2822 = _2912;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2828;
            bool _2916 = !_2902;
            _2830 = _2914;
            if (!_2916)
            {
                bool _2918 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_1832);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _1832 + _2928;
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
                    _2804 = _2970;
                    _2822 = _2974;
                    _2798 = _2966;
                    _2816 = _2972;
                    _2810 = _2968;
                    _2830 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2804;
    float _2980 = _2822;
    float _2982 = _2798;
    float _2984 = _2816;
    float _2986 = _2810;
    float _2988 = _2830;
    float _2990 = fma(_2640, -0.5, 0.5);
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
    float _3040 = -_1796;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1798;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1800;
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
    float _3082 = _2640 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2638, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2644, _3078, _3090);
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _206 = fma(_188, _188, _202);
    float _208 = fma(_190, _190, _204);
    float _210 = fma(_194, _194, _206);
    float _212 = _182 * _182;
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_198, _198, _218);
    float _222 = in.m_61.x;
    float _224 = in.m_61.y;
    float _226 = in.m_61.z;
    float _228 = sqrt(_214);
    float _230 = sqrt(_220);
    bool _232 = _216 > 0.0;
    bool _234 = _228 > 0.0;
    float _236 = 0.0;
    float _238 = _194;
    if (_232)
    {
        float _240 = rsqrt(_210);
        _236 = _240;
    }
    float _242 = _236;
    float _244 = _190 * _224;
    bool _246 = _230 > 0.0;
    float _248 = _180 * _224;
    float _250 = _196 * _224;
    float _252 = fma(_188, _222, _244);
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _222;
    if (!_232)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = fma(_178, _222, _248);
    float _266 = 0.0;
    float _268 = _260;
    float _270 = _262;
    if (_234)
    {
        float _272 = rsqrt(_214);
        _266 = _272;
    }
    float _274 = _266;
    float _276 = fma(_194, _222, _250);
    float _278 = 0.0;
    float _280 = 0.0;
    if (!_234)
    {
        _278 = 0.0;
        _280 = 0.0;
    }
    float _282 = _278;
    float _284 = _280;
    float _286 = 0.0;
    float _288 = _282;
    float _290 = _284;
    if (!_232)
    {
        _286 = 0.0;
    }
    float _292 = _286;
    float _294 = fma(_192, _226, _252);
    float _296 = 0.0;
    float _298 = _292;
    if (!_234)
    {
        _296 = 0.0;
    }
    float _300 = _296;
    float _302 = fma(_182, _226, _264);
    float _304 = 0.0;
    float _306 = _300;
    if (!_246)
    {
        _304 = 0.0;
    }
    float _308 = _304;
    float _310 = 0.0;
    float _312 = _308;
    if (_246)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    float _318 = 0.0;
    if (!_246)
    {
        _318 = 0.0;
    }
    float _320 = _318;
    float _322 = fma(_198, _226, _276);
    float _324 = _320;
    float _326 = _322;
    if (!_246)
    {
        _258 = 0.0;
    }
    float _328 = _258;
    float _330 = _328;
    if (_232)
    {
        float _332 = _242 * _178;
        _298 = _332;
    }
    float _334 = _298;
    if (_232)
    {
        float _336 = _242 * _188;
        _268 = _336;
    }
    float _338 = _268;
    if (_232)
    {
        float _340 = _242 * _194;
        _270 = _340;
    }
    float _342 = _270;
    if (_234)
    {
        float _344 = _274 * _180;
        _306 = _344;
    }
    float _346 = _306;
    if (_234)
    {
        float _348 = _274 * _190;
        _288 = _348;
    }
    float _350 = _288;
    if (_234)
    {
        float _352 = _274 * _196;
        _290 = _352;
    }
    float _354 = _290;
    if (_246)
    {
        float _356 = _316 * _182;
        _312 = _356;
    }
    float _358 = _312;
    if (_246)
    {
        float _360 = _316 * _192;
        _324 = _360;
    }
    float _362 = _324;
    if (_246)
    {
        float _364 = _316 * _198;
        _330 = _364;
    }
    float _366 = _330;
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
    float _416 = in.m_63.x;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _424 = _422 != 0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = 1.0 / _414;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _434 = _390 + _432;
    float _436 = in.m_57.w;
    float _438 = _200 * _398;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = _402 * _398;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = in.m_59.w;
    float _448 = 1.0 / _420;
    float _450 = in.m_63.y;
    float _452 = _190 * _394;
    float _454 = _196 * _394;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _456;
    float _460 = _404 * 2.0;
    float _462 = fma(_194, _392, _454);
    float _464 = fma(_188, _392, _452);
    float _466 = 1.0 / _428;
    float _468 = precise::min(_440, _444);
    float _470 = fma(_198, _396, _462);
    float _472 = fma(_192, _396, _464);
    float _474 = _396;
    int _476 = as_type<int>(_404);
    if (_424)
    {
        _238 = _416;
    }
    float _478 = _238;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _482 = _390 + _480;
    float _484 = _410 * _448;
    float _486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _488 = log2(_486);
    float _490 = _434 * _430;
    float _492 = _478;
    if (!_424)
    {
        _492 = _404;
    }
    float _494 = _492;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = floor(_460);
    if (_424)
    {
        _474 = _450;
    }
    float _506 = _474;
    float _508 = _494 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _510 = _506;
    if (!_424)
    {
        _510 = _416;
    }
    float _512 = _510;
    float _514 = _482 * _466;
    float _516 = -_496;
    float _518 = fma(_508, 2.0, _516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _522 = 1.0 + _520;
    float _524 = _488 * _152;
    float _526 = _512 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _528 = 1.0 / _522;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = fma(_526, -2.0, _498);
    float _542 = _450 * 2.0;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _546 = _504 > 0.0;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _550 = _504 >= 0.0;
    bool _552 = isnan(_504);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = exp2(_524);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _564 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[88].z, _544);
    int _566 = _558 ? 0 : 1;
    float _568 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[88].w, _548);
    float _570 = fma(_562, _450, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _572 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].z, _564);
    int _574 = ~_566;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = floor(_542);
    float _582 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[87].w, _568);
    int _584 = _578;
    float _586 = _572;
    if (!_546)
    {
        int _588 = ~_566;
        int _590 = _588 + 1;
        _584 = _590;
    }
    int _592 = _584;
    float _594 = _570 * _152;
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = -_152;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[86].x, _518);
    float _610 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[86].y, _540);
    float _612 = _416 * 2.0;
    float _614 = -_560;
    float _616 = _614 + 1.0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _628 = _626 != 0;
    float _630 = _416 + _450;
    float _632 = floor(_612);
    float _634 = _472 + _436;
    float _636 = _604 ? _616 : 0.0;
    float _638 = _630 + (-1.0);
    bool _640 = !_624;
    int _642 = _640 ? 0 : 1;
    float _644 = fma(_416, 6.283185482025146484375, _594);
    bool _646 = !_620;
    int _648 = _646 ? 0 : 1;
    if (_538)
    {
        float _650 = _636 * _528;
        _170 = _650;
    }
    float _652 = _170;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _660 = _658 != 0;
    float _662 = _416 + _404;
    bool _664 = _580 >= 0.0;
    bool _666 = isnan(_580);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _676 = _662 + (-1.0);
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _688 = _686 != 0;
    float _690 = -_468;
    float _692 = _690 + 1.0;
    int _694 = _672 ? 0 : 1;
    float _696 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _698 = _580 > 0.0;
    float _700 = _450 + _404;
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _704 = _700 + (-1.0);
    int _706 = ~_694;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _712;
    bool _716 = !_628;
    int _718 = _716 ? 0 : 1;
    float _720 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _722 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = fma(_714, _490, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _726 = _710;
    if (!_698)
    {
        int _728 = ~_694;
        int _730 = _728 + 1;
        _726 = _730;
    }
    int _732 = _726;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _734;
    bool _738 = !_688;
    int _740 = _738 ? 0 : 1;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _744 = !_656;
    int _746 = _744 ? 0 : 1;
    float _748 = fma(_736, _490, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _752 = _750 != 0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _760 = _758 != 0;
    float _762 = fma(_458, _490, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _764 = _632 >= 0.0;
    bool _766 = isnan(_632);
    bool _768 = _764 || _766;
    bool _770 = isnan(0.0);
    bool _772 = _768 || _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _782;
    int _786 = _772 ? 0 : 1;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _788;
    bool _792 = _632 > 0.0;
    float _794 = fma(_776, _484, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _796 = fma(_780, _484, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _798 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _800 = isnan(_390);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _812 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _814 = isnan(_390);
    bool _816 = _812 || _814;
    bool _818 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _820 = _816 || _818;
    float _822 = float(_820);
    float _824 = fma(_784, _514, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _826 = fma(_502, _484, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _828 = fma(_790, _514, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _830 = -_808;
    float _832 = _830 + 1.0;
    float _834 = _810 * _674;
    bool _836 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _838 = isnan(_390);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _850 = -_822;
    float _852 = _850 + 1.0;
    float _854 = _822 * _832;
    float _856 = _848 * _702;
    bool _858 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _860 = isnan(_390);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = _846 * _852;
    float _872 = -_846;
    float _874 = _872 + 1.0;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _876;
    float _880 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].x, _834);
    float _882 = _470 + _446;
    float _884 = _652 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _886 = _868 * _874;
    float _888 = fma(_878, _514, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _890 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].y, _856);
    float _892 = floor(_880);
    float _894 = _884 * _742;
    float _896 = -_868;
    float _898 = _896 + 1.0;
    float _900 = _748 * _886;
    float _902 = _724 * _886;
    float _904 = _762 * _886;
    float _906 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[203].z, _894);
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].x, _900);
    float _910 = floor(_890);
    float _912 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].y, _902);
    bool _914 = !_752;
    int _916 = _914 ? 0 : 1;
    float _918 = fma(_794, _870, _908);
    int _920 = ~_786;
    int _922 = _920 + 1;
    int _924 = _922 + 1;
    float _926 = fma(_796, _870, _912);
    bool _928 = !_756;
    int _930 = _928 ? 0 : 1;
    float _932 = fma(_824, _854, _918);
    float _934 = floor(_906);
    int _936 = _924;
    if (!_792)
    {
        int _938 = ~_786;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = -_892;
    float _946 = _880 + _944;
    int _948 = abs(_930);
    float _950 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[143].z, _904);
    int _952 = abs(_916);
    float _954 = _880 + 0.25;
    float _956 = float(_942);
    float _958 = -_910;
    float _960 = _890 + _958;
    float _962 = float(_948);
    float _964 = floor(_954);
    float _966 = float(_592);
    float _968 = fma(_826, _870, _950);
    bool _970 = _946 >= 0.5;
    bool _972 = isnan(_946);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.5);
    bool _978 = _974 || _976;
    float _980 = _962 * _956;
    float _982 = -_934;
    float _984 = _906 + _982;
    float _986 = _906 + 0.25;
    float _988 = _890 + 0.25;
    bool _990 = !_978;
    float _992 = _990 ? 0.5 : (-0.5);
    float _994 = _880 * 6.283185482025146484375;
    bool _996 = _960 >= 0.5;
    bool _998 = isnan(_960);
    bool _1000 = _996 || _998;
    bool _1002 = isnan(0.5);
    bool _1004 = _1000 || _1002;
    float _1006 = floor(_986);
    int _1008 = abs(_746);
    float _1010 = _890 * 6.283185482025146484375;
    int _1012 = abs(_642);
    float _1014 = -_964;
    float _1016 = _954 + _1014;
    bool _1018 = _984 >= 0.5;
    bool _1020 = isnan(_984);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.5);
    bool _1026 = _1022 || _1024;
    float _1028 = _980 * (-2.0);
    bool _1030 = !_1004;
    float _1032 = _1030 ? 0.5 : (-0.5);
    float _1034 = floor(_988);
    float _1036 = _994 * 0.15915493667125701904296875;
    float _1038 = _992 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1040 = _1038 * 2.0;
    float _1042 = float(_1008);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1046 = _1044 * 2.0;
    bool _1048 = _1016 > 0.5;
    float _1050 = -_1006;
    float _1052 = _986 + _1050;
    int _1054 = abs(_648);
    float _1056 = _1042 * _1046;
    bool _1058 = !_684;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = _1036 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    bool _1066 = !_1026;
    float _1068 = _1066 ? 0.5 : (-0.5);
    float _1070 = fma(_828, _854, _926);
    float _1072 = float(_1012);
    float _1074 = -_1034;
    float _1076 = _988 + _1074;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1080 = _1078 != 0;
    float _1082 = _1010 * 0.15915493667125701904296875;
    float _1084 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1086 = _1084 * 2.0;
    int _1088 = abs(_1060);
    float _1090 = _1072 * _1040;
    bool _1092 = !_1080;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = in.m_65.x;
    float _1098 = in.m_65.y;
    float _1100 = in.m_65.z;
    float _1102 = float(_1054);
    float _1104 = _1082 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    int _1108 = abs(_718);
    float _1110 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1112 = _1016;
    float _1114 = _1076;
    float _1116 = _1052;
    if (_1048)
    {
        float _1118 = -_1016;
        float _1120 = _1118 + 1.0;
        _1112 = _1120;
    }
    float _1122 = _1112;
    int _1124 = abs(_1094);
    float _1126 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].x, _932);
    float _1128 = fma(_1102, _1110, _1090);
    float _1130 = float(_1108);
    float _1132 = fma(_1122, 4.0, -1.0);
    bool _1134 = _1076 > 0.5;
    float _1136 = in.m_67.z;
    float _1138 = float(_1124);
    float _1140 = _906 * 6.283185482025146484375;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    bool _1144 = !_660;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = fma(_888, _854, _968);
    float _1150 = _1140 * 0.15915493667125701904296875;
    float _1152 = fma(_1130, _1142, _1128);
    int _1154 = abs(_1146);
    float _1156 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1158 = _1150 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = float(_952);
    if (_1134)
    {
        float _1164 = -_1076;
        float _1166 = _1164 + 1.0;
        _1114 = _1166;
    }
    float _1168 = _1114;
    bool _1170 = _1052 > 0.5;
    float _1172 = fma(_1138, _1156, _1056);
    bool _1174 = !_680;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_1152, 3.1415927410125732421875, _1096);
    float _1180 = _1162 * _966;
    float _1182 = float(_1088);
    float _1184 = fma(_1168, 4.0, -1.0);
    int _1186 = abs(_1176);
    float _1188 = _1180 * (-2.0);
    float _1190 = float(_1154);
    float _1192 = _1182 * _1086;
    float _1194 = float(_1186);
    float _1196 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    if (_1170)
    {
        float _1200 = -_1052;
        float _1202 = _1200 + 1.0;
        _1116 = _1202;
    }
    float _1204 = _1116;
    float _1206 = fma(_1178, _1188, _1178);
    float _1208 = _416 + (-0.5);
    float _1210 = fma(_1194, _1196, _1192);
    float _1212 = fma(_1190, _1198, _1172);
    float _1214 = _644 * 0.15915493667125701904296875;
    int _1216 = abs(_740);
    float _1218 = fma(_1204, 4.0, -1.0);
    bool _1220 = !_760;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = fma(_722, _1188, _722);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    float _1228 = fma(_1212, 3.1415927410125732421875, _1098);
    float _1230 = float(_1216);
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    int _1234 = abs(_1222);
    float _1236 = fma(_1224, _652, _1226);
    float _1238 = _450 + (-0.5);
    float _1240 = fma(_1228, _1028, _1228);
    float _1242 = float(_732);
    float _1244 = fma(_1230, _1232, _1210);
    float _1246 = float(_1234);
    float _1248 = fma(_720, _1028, _720);
    float _1250 = _1214 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1240);
    float _1256 = fma(_1244, 3.1415927410125732421875, _1100);
    float _1258 = _1246 * _1242;
    float _1260 = in.m_69.x;
    float _1262 = in.m_69.y;
    float _1264 = in.m_69.z;
    float _1266 = fma(_1248, _652, _1254);
    float _1268 = _882 * _882;
    float _1270 = _1258 * (-2.0);
    float _1272 = in.m_67.y;
    float _1274 = _1236 * 0.15915493667125701904296875;
    float _1276 = _1266 * 0.15915493667125701904296875;
    float _1278 = fma(_696, _1270, _696);
    float _1280 = fma(_1256, _1270, _1256);
    float _1282 = _404 + (-0.5);
    float _1284 = in.m_67.x;
    float _1286 = fma(_634, _634, _1268);
    float _1288 = abs(_1252);
    float _1290 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1280);
    float _1294 = _1274 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1148);
    float _1300 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1290);
    float _1302 = fma(_1278, _652, _1292);
    float _1304 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1070);
    float _1306 = _612 + (-1.0);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1136);
    float _1310 = _1302 * 0.15915493667125701904296875;
    float _1312 = _1276 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1304 * _1262;
    float _1318 = _1126 * _1260;
    float _1320 = _1298 * _1264;
    float _1322 = -_1300;
    float _1324 = _1322 + _1272;
    float _1326 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1328 = _1276 * 6.283185482025146484375;
    float _1330 = cos(_1328);
    float _1332 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1324);
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1340 = _1332 * _1334;
    float _1342 = _1336 * _1308;
    float _1344 = sqrt(_1286);
    float _1346 = _1326 * _1338;
    float _1348 = _1296 * _1314;
    float _1350 = _1274 * 6.283185482025146484375;
    float _1352 = sin(_1350);
    float _1354 = _1296 * _1330;
    float _1356 = _1310 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = _1306 * _1344;
    float _1362 = _1360 * 0.75;
    float _1364 = _1310 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1352 * _1314;
    float _1370 = _1352 * _1330;
    float _1372 = _1362 * 0.15915493667125701904296875;
    float _1374 = _1296 * _1358;
    float _1376 = _1352 * _1358;
    float _1378 = _1330 * _1358;
    float _1380 = _1314 * _1358;
    float _1382 = _1374 * _1340;
    float _1384 = _1376 * _1340;
    float _1386 = _1372 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = fma(_1366, _1354, _1368);
    float _1392 = -_1348;
    float _1394 = fma(_1366, _1370, _1392);
    float _1396 = -_1370;
    float _1398 = fma(_1366, _1348, _1396);
    float _1400 = -_1340;
    float _1402 = _1366 * _1400;
    float _1404 = fma(_1390, _1346, _1382);
    float _1406 = fma(_1366, _1368, _1354);
    float _1408 = fma(_1394, _1346, _1384);
    float _1410 = fma(_1378, _1346, _1402);
    float _1412 = fma(_1398, _1342, _1404);
    float _1414 = _1372 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = fma(_1380, _1342, _1410);
    float _1420 = _1412 * _350;
    float _1422 = fma(_1406, _1342, _1408);
    float _1424 = _1412 * _354;
    float _1426 = fma(_1418, _338, _1420);
    float _1428 = fma(_1418, _342, _1424);
    float _1430 = fma(_1422, _362, _1426);
    float _1432 = fma(_1422, _366, _1428);
    float _1434 = _1430 * _1388;
    float _1436 = _1430 * _1416;
    float _1438 = -_1434;
    float _1440 = fma(_1432, _1416, _1438);
    float _1442 = fma(_1432, _1388, _1436);
    float _1444 = _882 + _1440;
    float _1446 = _634 + _1442;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1444 + _1448;
    float _1452 = in.m_71.y;
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1456 = _1446 + _1454;
    float _1458 = _1450 * _1450;
    float _1460 = fma(_1456, _1456, _1458);
    float _1462 = sqrt(_1460);
    float _1464 = _394 + _1452;
    bool _1466 = _1462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1470 = _1462 + _1468;
    float _1472 = _1416;
    float _1474 = _1452;
    float _1476 = _1462;
    float _1478 = _1346;
    float _1480 = _1464;
    if (_1466)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1472 = _1482;
    }
    float _1484 = _1472;
    if (_1466)
    {
        float _1486 = rsqrt(_1460);
        _1474 = _1486;
    }
    float _1488 = _1474;
    float _1490 = _1488;
    if (_1466)
    {
        float _1492 = _1470 * _1484;
        _1476 = _1492;
    }
    float _1494 = _1476;
    if (_1466)
    {
        float _1496 = _1494 * 0.15915493667125701904296875;
        _1478 = _1496;
    }
    float _1498 = _1478;
    float _1500 = _1412 * _346;
    float _1502 = _1484;
    float _1504 = _1500;
    if (_1466)
    {
        float _1506 = _1498 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = fma(_1418, _334, _1500);
    float _1514 = _1512;
    if (!_1466)
    {
        _1504 = _1444;
    }
    float _1516 = _1504;
    float _1518 = fma(_1422, _358, _1512);
    float _1520 = _1464 + _1518;
    float _1522 = _1516;
    float _1524 = _1520;
    if (_1466)
    {
        float _1526 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1526;
    }
    float _1528 = _1514;
    float _1530 = _1528;
    float _1532 = _1510;
    if (_1466)
    {
        float _1534 = fma(_1510, _1528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1530 = _1534;
    }
    float _1536 = _1530;
    float _1538 = _1536;
    if (!_1466)
    {
        _1532 = _1446;
    }
    float _1540 = _1532;
    float _1542 = _1540;
    if (_1466)
    {
        float _1544 = _1488 * _1536;
        _1538 = _1544;
    }
    float _1546 = _1538;
    if (_1466)
    {
        float _1548 = fma(_1450, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1522 = _1548;
    }
    float _1550 = _1522;
    float _1552 = _1550;
    if (_1466)
    {
        float _1554 = fma(_1456, _1546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1542 = _1554;
    }
    float _1556 = _1542;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1560 = _1550 + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1564 = _1556 + _1562;
    float _1566 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1568 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5264 = float2(_1568, _1566);
    float _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5264, float2(0.0), isnan(_5264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5264, float2(0.0), isnan(_5264)), level(0.0)).x;
    float _1572 = _1564;
    float _1574 = _1556;
    if (_1466)
    {
        float _1576 = _1498 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_634;
    float _1584 = _1582 + _1556;
    float _1586 = -_882;
    float _1588 = _1586 + _1550;
    bool _1590 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1592 = isnan(0.5);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1598 = _1594 || _1596;
    float _1600 = _1588;
    if (_1466)
    {
        float _1602 = _1580 + (-1.0);
        _1490 = _1602;
    }
    float _1604 = _1490;
    float _1606 = _1604;
    if (_1466)
    {
        float _1608 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1608;
    }
    float _1610 = _1606;
    if (_1466)
    {
        float _1612 = fma(_1520, _1580, _1610);
        _1524 = _1612;
    }
    float _1614 = _1524;
    float _1616 = -_1464;
    float _1618 = _1616 + _1614;
    float _1620 = fma(_882, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1622 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1624 = _1618 * _1618;
    float _1626 = floor(_1620);
    float _1628 = fma(_1584, _1584, _1624);
    float _1630 = fma(_1588, _1588, _1628);
    float _1632 = floor(_1622);
    float _1634 = -_1626;
    float _1636 = _1620 + _1634;
    float _1638 = sqrt(_1630);
    float _1640 = -_1632;
    float _1642 = _1622 + _1640;
    bool _1644 = _1638 > 0.0;
    float _1646 = _1632;
    float _1648 = _1614;
    if (!_1644)
    {
        _1646 = _1550;
    }
    float _1650 = _1646;
    float _1652 = fma(_1570, 100.0, _1614);
    float _1654 = fma(_1570, 100.0, _1464);
    float _1656 = _1650;
    float _1658 = _1650;
    if (!_1644)
    {
        _1648 = _1556;
    }
    float _1660 = _1648;
    float _1662 = _1660;
    if (!_1644)
    {
        _1480 = _1652;
    }
    float _1664 = _1480;
    bool _1666 = !_1644;
    float _1668 = _1664;
    if (!_1666)
    {
        float _1670 = _302 * _302;
        float _1672 = rsqrt(_1630);
        float _1674 = fma(_294, _294, _1670);
        float _1676 = fma(_322, _322, _1674);
        float _1678 = sqrt(_1676);
        float _1680 = _1584 * _1672;
        float _1682 = _1618 * _1672;
        float _1684 = _1588 * _1672;
        bool _1686 = _1678 > 0.0;
        float _1688 = _1678;
        float _1690 = _1672;
        _1600 = _1684;
        if (!_1686)
        {
            _1688 = _1556;
        }
        float _1692 = _1688;
        _1662 = _1692;
        if (!_1686)
        {
            _1690 = _1652;
        }
        float _1694 = _1690;
        _1668 = _1694;
        if (!_1686)
        {
            _1656 = _1550;
        }
        float _1696 = _1656;
        bool _1698 = !_1686;
        _1658 = _1696;
        if (!_1698)
        {
            float _1700 = rsqrt(_1676);
            float _1702 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1704 = _302 * _1700;
            float _1706 = _294 * _1700;
            float _1708 = _1682 * _1704;
            float _1710 = _322 * _1700;
            float _1712 = fma(_1680, _1706, _1708);
            float _1714 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1716 = fma(_1684, _1710, _1712);
            float _1718 = _1716 * _1714;
            float _1720 = fma(_294, _1718, _1556);
            float _1722 = fma(_302, _1718, _1652);
            float _1724 = fma(_322, _1718, _1550);
            _1662 = _1720;
            _1658 = _1724;
            _1668 = _1722;
        }
    }
    float _1726 = _1662;
    float _1728 = _1658;
    float _1730 = _1668;
    float _1732 = _1600;
    float _1734 = _1730;
    float _1736 = _1732;
    if (_1598)
    {
        _1552 = _1726;
    }
    float _1738 = _1552;
    float _1740 = _1738;
    if (_1598)
    {
        _1574 = _1728;
    }
    float _1742 = _1574;
    float _1744 = _1742;
    if (!_1598)
    {
        float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1748 = _1654 + _1746;
        float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1752 = _634 + _1750;
        float _1754 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1756 = -_882;
        float _1758 = _1756 + _1728;
        float _1760 = _1748 * _1748;
        float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1764 = _882 + _1762;
        float _1766 = fma(_1752, _1752, _1760);
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1770 = fma(_1764, _1764, _1766);
        float _1772 = sqrt(_1770);
        float _1774 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1776 = precise::min(_1772, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1778 = _1776 * _1768;
        float _1780 = -_634;
        float _1782 = _1780 + _1726;
        float _1784 = _1774 * _1778;
        float _1786 = -_1654;
        float _1788 = _1786 + _1730;
        float _1790 = fma(_1782, _1784, _634);
        float _1792 = fma(_1788, _1784, _1654);
        float _1794 = fma(_1758, _1784, _882);
        _1734 = _1792;
        _1740 = _1790;
        _1744 = _1794;
        _326 = _1768;
    }
    float _1796 = _1734;
    float _1798 = _1740;
    float _1800 = _1744;
    float _1802 = _326;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1806 = _1796 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1798 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1814 = _1800 + _1812;
    float _1816 = in.m_73.y;
    float _1818 = _1806 * _1806;
    float _1820 = fma(_1810, _1810, _1818);
    float2 _5662 = float2(_1642, _1636);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5662, float2(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5662, float2(0.0), isnan(_5662)), level(0.0)).x;
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1826 = _1824 != 0;
    float _1828 = fma(_1814, _1814, _1820);
    float _1830 = rsqrt(_1828);
    float _1832 = sqrt(_1828);
    float _1834 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1836 = _1810 * _1834;
    float _1838 = _1814 * _1834;
    float _1840 = _1836 * _1836;
    float _1842 = _1838 * _1838;
    float _1844 = _1840 + _1842;
    float _1846 = sqrt(_1844);
    bool _1848 = _1846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1852 = _1846 + _1850;
    float _1854 = _1814;
    float _1856 = _1852;
    float _1858 = _1802;
    float _1860 = _1806;
    if (_1848)
    {
        float _1862 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1854 = _1862;
    }
    float _1864 = _1854;
    if (_1848)
    {
        float _1866 = _1852 * _1864;
        _1856 = _1866;
    }
    float _1868 = _1856;
    if (_1848)
    {
        float _1870 = _1868 * 0.15915493667125701904296875;
        _1858 = _1870;
    }
    float _1872 = _1858;
    float _1874 = _1830;
    float _1876 = _1872;
    if (_1848)
    {
        float _1878 = _1872 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        _1874 = _1880;
    }
    float _1882 = _1874;
    float _1884 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1886 = precise::max(0.0, _1884);
    float _1888 = _1818;
    float _1890 = _1886;
    if (_1848)
    {
        float _1892 = _1872 * 6.283185482025146484375;
        float _1894 = cos(_1892);
        _1888 = _1894;
    }
    float _1896 = _1888;
    float _1898 = -_1834;
    float _1900 = -_1886;
    float _1902 = fma(_1806, _1898, _1900);
    float _1904 = _1884;
    if (_1848)
    {
        float _1906 = rsqrt(_1844);
        _1904 = _1906;
    }
    float _1908 = _1904;
    if (_1848)
    {
        float _1910 = _1902 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1890 = _1910;
    }
    float _1912 = _1890;
    float _1914 = _1912;
    float _1916 = _1882;
    if (_1848)
    {
        float _1918 = fma(_1882, _1912, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1914 = _1918;
    }
    float _1920 = _1914;
    float _1922 = _1920;
    if (!_1848)
    {
        _1916 = _1836;
    }
    float _1924 = _1916;
    float _1926 = _1924;
    float _1928 = _1896;
    if (_1848)
    {
        float _1930 = _1896 + (-1.0);
        _1860 = _1930;
    }
    float _1932 = _1860;
    float _1934 = _1932;
    if (_1848)
    {
        float _1936 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1936;
    }
    float _1938 = _1876;
    if (!_1848)
    {
        _1934 = _1838;
    }
    float _1940 = _1934;
    float _1942 = _1908;
    float _1944 = _1940;
    if (_1848)
    {
        float _1946 = _1908 * _1920;
        _1736 = _1946;
    }
    float _1948 = _1736;
    if (!_1848)
    {
        _1942 = _1902;
    }
    float _1950 = _1942;
    float _1952 = _1950;
    if (_1848)
    {
        float _1954 = fma(_1902, _1896, _1938);
        _1952 = _1954;
    }
    float _1956 = _1952;
    if (!_1848)
    {
        _1922 = _1840;
    }
    float _1958 = _1922;
    float _1960 = _1958;
    if (_1848)
    {
        float _1962 = _1836 * _1948;
        _1926 = _1962;
    }
    float _1964 = _1926;
    if (_1848)
    {
        float _1966 = _1838 * _1948;
        _1944 = _1966;
    }
    float _1968 = _1944;
    if (!_1848)
    {
        _1928 = _1842;
    }
    float _1970 = _1928;
    float _1972 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = _1970;
    if (_1848)
    {
        float _1976 = _1964 * _1964;
        _1960 = _1976;
    }
    float _1978 = _1960;
    if (_1848)
    {
        float _1980 = _1968 * _1968;
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1986 = fma(_1956, _1956, _1978);
    float _1988 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1990 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1984);
    float _1992 = _1986 + _1982;
    float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1996 = fma(_1832, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1994);
    float _1998 = precise::clamp(_1996, 0.0, 1.0);
    float _2000 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1988);
    float _2002 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2004 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2006 = -_1998;
    float _2008 = _2006 + 1.0;
    float _2010 = rsqrt(_1992);
    float _2012 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2000);
    float _2014 = _2002 * _416;
    float _2016 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2018 = abs(_2008);
    float _2020 = log2(_2018);
    float _2022 = _2010 * _1964;
    float _2024 = _2010 * _1956;
    float _2026 = _2010 * _1968;
    float _2028 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2030 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2032 = trunc(_2014);
    int _2034 = int(_2032);
    float _2036 = -_2030;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2036);
    float _2040 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2042 = _2028 * _416;
    float _2044 = -_2026;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2038);
    float _2048 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2050 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2052 = _1796 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2054 = fma(_2046, -0.5, 0.5);
    float _2056 = exp2(_2040);
    float _2058 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2050);
    float _2060 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2052);
    float _2062 = fma(_2046, 0.5, 0.5);
    int _2064 = _2034 << 4;
    int _2066 = _2064 + 1712;
    float _2068 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2058);
    float _2070 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2060);
    float _2072 = sqrt(_2054);
    float _2074 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2076 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2078 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2080 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2082 = -_2078;
    float _2084 = fma(_2082, _2048, 1.0);
    float _2086 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2088 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2080);
    float _2090 = fma(_2062, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2092 = _2024 + 1.0;
    float _2094 = log2(_2084);
    float _2096 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2088);
    float _2098 = fma(_2062, _2090, -0.212114393711090087890625);
    float _2100 = -_2024;
    float _2102 = fma(_2056, _2092, _2100);
    float _2104 = _2072 * 0.636619746685028076171875;
    float _2106 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2096);
    float _2108 = fma(_2062, _2098, 1.570728778839111328125);
    float _2110 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2112 = fma(_2102, 0.5, 0.5);
    float _2114 = 1.0 / _2106;
    float _2116 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2086);
    float _2118 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2110);
    float _2120 = -_2108;
    float _2122 = fma(_2104, _2120, 1.0);
    float _2124 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2116);
    float _2126 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2118);
    float _2128 = _2094 * 0.693147182464599609375;
    float _2130 = trunc(_2042);
    int _2132 = int(_2130);
    float _2134 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2126);
    float _2136 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2138 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2140 = _2134 * _2114;
    float _2142 = _2136 * _2114;
    float _2144 = fma(_2140, 0.5, 0.5);
    float _2146 = fma(_2142, -0.5, 0.5);
    int _2148 = _2132 << 4;
    int _2150 = _2148 + 1968;
    float3 _6210 = float3(_2144, _2146, _2138);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).x;
    float3 _6221 = float3(_2144, _2146, _2138);
    float4 _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6221, float3(0.0), isnan(_6221)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6221, float3(0.0), isnan(_6221)), level(0.0)).xyzw;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = _2155.w;
    float2 _6237 = float2(_2122, _2112);
    float3 _2167 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6237, float2(0.0), isnan(_6237)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6237, float2(0.0), isnan(_6237)), level(0.0)).xyz;
    float _2169 = _2167.x;
    float _2171 = _2167.y;
    float _2173 = _2167.z;
    uint _2176 = uint(int(uint(_2066) >> uint(2)));
    uint _2178 = uint(int(uint(int(_2176)) >> uint(2)));
    int _2180 = int(_2176) & 3;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[int(_2178)][_2180];
    int _2184 = int(_2176) + 1;
    uint _2186 = uint(int(uint(_2184) >> uint(2)));
    int _2188 = _2184 & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    float _2192 = in.m_73.x;
    int _2194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2196 = _2194 != 0;
    float _2198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2200 = _406 > 0.5;
    float _2202 = 0.0;
    int _2204 = as_type<int>(_2144);
    float _2206 = as_type<float>(_2066);
    float _2208 = _2138;
    float _2210 = _2136;
    if (_1826)
    {
        float _2212 = in.m_63.z;
        _2202 = _2212;
    }
    float _2214 = _2202;
    float _2216 = -_1816;
    float _2218 = _2216 + 1.0;
    bool _2220 = _404 > 0.5;
    uint _2222 = uint(int(uint(_2150) >> uint(2)));
    uint _2224 = uint(int(uint(int(_2222)) >> uint(2)));
    int _2226 = int(_2222) & 3;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[int(_2224)][_2226];
    int _2230 = int(_2222) + 1;
    uint _2232 = uint(int(uint(_2230) >> uint(2)));
    int _2234 = _2230 & 3;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[int(_2232)][_2234];
    bool _2238 = _450 > 0.5;
    float _2240 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2244 = _2242 != 0;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2250 = _2248 != 0;
    out.m_75.x = _1798;
    out.m_75.y = _1796;
    out.m_75.z = _1800;
    int _2252 = _2066 + 8;
    uint _2254 = uint(int(uint(_2252) >> uint(2)));
    uint _2256 = uint(int(uint(int(_2254)) >> uint(2)));
    int _2258 = int(_2254) & 3;
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[int(_2256)][_2258];
    int _2262 = _2150 + 8;
    uint _2264 = uint(int(uint(_2262) >> uint(2)));
    uint _2266 = uint(int(uint(int(_2264)) >> uint(2)));
    int _2268 = int(_2264) & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    int _2272 = _2220 ? as_type<int>(_2218) : as_type<int>(_1816);
    float _2274 = _1816;
    bool _2276 = _2244;
    float _2278 = _2192;
    if (_1826)
    {
        float _2280 = -_2192;
        float _2282 = _2280 + 1.0;
        _2204 = as_type<int>(_2282);
    }
    int _2284 = _2204;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2288 = _2286 != 0;
    float _2290 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2292 = _2238 ? as_type<int>(_2218) : as_type<int>(_1816);
    bool _2294 = _2288;
    if (_2250)
    {
        float _2296 = -_2192;
        float _2298 = _2296 + 1.0;
        _476 = as_type<int>(_2298);
    }
    int _2300 = _476;
    float _2302 = _2244 ? as_type<float>(_2272) : _1816;
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2306 = _2288 ? as_type<float>(_2292) : _1816;
    if (_2196)
    {
        float _2308 = _2200 ? _2218 : _1816;
        _2274 = _2308;
    }
    float _2310 = _2274;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2314 = _2312 != 0;
    float _2316 = fma(_2302, _2290, -0.5);
    if (_1826)
    {
        bool _2318 = _2214 > 0.5;
        _2294 = _2318;
    }
    bool _2320 = _2294;
    float _2322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2250)
    {
        bool _2324 = _416 > 0.5;
        _2276 = _2324;
    }
    bool _2326 = _2276;
    float _2328 = -_610;
    float _2330 = fma(_582, _2316, _2328);
    float _2332 = _2330;
    if (!_1826)
    {
        _2206 = _2192;
    }
    float _2334 = _2206;
    float _2336 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2338 = _2334;
    if (_1826)
    {
        float _2340 = _2320 ? as_type<float>(_2284) : _2192;
        _2338 = _2340;
    }
    float _2342 = _2338;
    if (!_2250)
    {
        _2208 = _2192;
    }
    float _2344 = _2208;
    float _2346 = _2182 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2348 = _2344;
    int _2350 = as_type<int>(_2182);
    if (_2250)
    {
        float _2352 = _2326 ? as_type<float>(_2300) : _2192;
        _2348 = _2352;
    }
    float _2354 = _2348;
    if (_2314)
    {
        float _2356 = -_2192;
        float _2358 = _2356 + 1.0;
        _2350 = as_type<int>(_2358);
    }
    int _2360 = _2350;
    float _2362 = in.m_77.x;
    float _2364 = in.m_77.y;
    float _2366 = in.m_77.z;
    float _2368 = -_1300;
    float _2370 = -_1272;
    bool _2372 = _2368 != _2370;
    bool _2374 = isnan(_2368);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(_2370);
    bool _2380 = _2376 || _2378;
    float _2382 = _2190 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2384 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2314)
    {
        float _2386 = _2238 ? as_type<float>(_2360) : _2192;
        _2278 = _2386;
    }
    float _2388 = _2278;
    float _2390 = _2228 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2392 = _2236 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2394 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2396 = _1284 == 0.0;
    bool _2398 = !_2380;
    bool _2400 = _2396 && _2398;
    float _2402 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2404 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2408 = _2260 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2410 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = fma(_2394, _2388, -0.5);
    bool _2414 = _1136 == 0.0;
    bool _2416 = _2414 && _2400;
    float _2418 = in.m_79.x;
    float _2420 = in.m_79.y;
    float _2422 = in.m_79.z;
    float _2424 = in.m_79.w;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2428 = _2408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2430 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2432 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2436 = fma(_572, _2412, _608);
    out.m_81.x = _2384;
    out.m_81.y = _2402;
    out.m_81.z = _2428;
    out.m_81.w = _2426;
    float _2438 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2440 = -_1822;
    float _2442 = _2440 + 1.0;
    float _2444 = _2304;
    float _2446 = _2430;
    float _2448 = _2438;
    if (_2416)
    {
        _586 = _2362;
    }
    float _2450 = _586;
    out.m_83.x = _2410;
    out.m_83.y = _2404;
    out.m_83.z = _2438;
    float _2452 = _2450;
    if (!_2416)
    {
        float _2454 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2362);
        _2452 = _2454;
    }
    float _2456 = _2452;
    float _2458 = exp2(_2240);
    float _2460 = _2430 * _2304;
    if (_2416)
    {
        _2444 = _2364;
    }
    float _2462 = _2444;
    float _2464 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2466 = _2336 * _2322;
    float _2468 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2470 = _2462;
    if (_2416)
    {
        _2446 = _2462;
    }
    float _2472 = _2446;
    float _2474 = _2464 * _2434;
    float _2476 = _2472;
    if (!_2416)
    {
        _2470 = _2364;
    }
    float _2478 = _2470;
    float _2480 = _2468 * _2406;
    float _2482 = _2330 + 0.5;
    if (_2416)
    {
        _2332 = _2366;
    }
    float _2484 = _2332;
    float _2486 = _2436 + 0.5;
    float _2488 = _2484;
    if (!_2416)
    {
        float _2490 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2478);
        _2476 = _2490;
    }
    float _2492 = _2476;
    float _2494 = _2422 * _2362;
    if (_2416)
    {
        _2448 = _2484;
    }
    float _2496 = _2448;
    out.m_85.x = _2460;
    out.m_85.y = _2466;
    out.m_85.z = _2480;
    out.m_85.w = _2474;
    float _2498 = _2496;
    if (!_2416)
    {
        _2488 = _2366;
    }
    float _2500 = _2488;
    float _2502 = _2418 * _2478;
    float _2504 = -_2458;
    float _2506 = _2504 + 1.0;
    out.m_87.x = _2486;
    out.m_87.y = _2482;
    float _2508 = _2420 * _2500;
    float _2510 = -_2494;
    float _2512 = fma(_2418, _2500, _2510);
    if (!_2416)
    {
        float _2514 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2500);
        _2498 = _2514;
    }
    float _2516 = _2498;
    float _2518 = -_2502;
    float _2520 = fma(_2420, _2362, _2518);
    float _2522 = -_2508;
    float _2524 = fma(_2422, _2478, _2522);
    float _2526 = _2512 * _2424;
    float _2528 = -_2492;
    float _2530 = _1366 * _2528;
    float _2532 = _2520 * _2424;
    float _2534 = -_2420;
    float _2536 = _1366 * _2534;
    float _2538 = _2524 * _2424;
    float _2540 = -_2526;
    float _2542 = _1366 * _2540;
    float _2544 = _1374 * _2420;
    float _2546 = _1374 * _2492;
    float _2548 = _1374 * _2526;
    float _2550 = fma(_1378, _2456, _2530);
    float _2552 = fma(_1378, _2418, _2536);
    float _2554 = fma(_1378, _2538, _2542);
    float _2556 = _1376 * _2420;
    float _2558 = _1376 * _2526;
    float _2560 = fma(_1390, _2456, _2546);
    float _2562 = fma(_1390, _2418, _2544);
    float _2564 = fma(_1390, _2538, _2548);
    float _2566 = fma(_1394, _2538, _2558);
    float _2568 = fma(_1398, _2516, _2560);
    float _2570 = fma(_1398, _2422, _2562);
    float _2572 = fma(_1398, _2532, _2564);
    float _2574 = fma(_1394, _2418, _2556);
    float _2576 = fma(_1380, _2516, _2550);
    float _2578 = fma(_1380, _2422, _2552);
    float _2580 = fma(_1380, _2532, _2554);
    float _2582 = _2568 * _350;
    float _2584 = _2570 * _350;
    float _2586 = _2572 * _350;
    float _2588 = _1376 * _2492;
    float _2590 = fma(_1406, _2422, _2574);
    float _2592 = _2572 * _346;
    float _2594 = _2568 * _346;
    float _2596 = _2568 * _354;
    float _2598 = _2570 * _346;
    float _2600 = _2572 * _354;
    float _2602 = _2570 * _354;
    float _2604 = fma(_2580, _338, _2586);
    float _2606 = fma(_1394, _2456, _2588);
    float _2608 = fma(_1406, _2532, _2566);
    float _2610 = fma(_2580, _334, _2592);
    float _2612 = fma(_2578, _338, _2584);
    float _2614 = fma(_2578, _334, _2598);
    float _2616 = fma(_2578, _342, _2602);
    float _2618 = fma(_1406, _2516, _2606);
    float _2620 = fma(_2608, _358, _2610);
    float _2622 = fma(_2576, _338, _2582);
    float _2624 = fma(_2576, _334, _2594);
    float _2626 = fma(_2580, _342, _2600);
    float _2628 = fma(_2590, _362, _2612);
    float _2630 = fma(_2576, _342, _2596);
    float _2632 = fma(_2590, _358, _2614);
    float _2634 = fma(_2590, _366, _2616);
    float _2636 = fma(_2608, _362, _2604);
    float _2638 = fma(_2618, _362, _2622);
    float _2640 = fma(_2618, _358, _2624);
    float _2642 = fma(_2608, _366, _2626);
    float _2644 = fma(_2618, _366, _2630);
    float _2646 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_89.x = _2628;
    out.m_89.y = _2632;
    out.m_89.z = _2634;
    bool _2648 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2650 = isnan(_1832);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2656 = _2652 || _2654;
    float _2658 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2646);
    float _2660 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_91.x = _2636;
    out.m_91.y = _2620;
    out.m_91.z = _2642;
    float _2662 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2658);
    float _2664 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2660);
    float _2666 = in.m_93.x;
    float _2668 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2670 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2664);
    float _2672 = in.m_93.y;
    float _2674 = 1.0 / _2668;
    float _2676 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2678 = in.m_93.z;
    float _2680 = _2676 + _2668;
    float _2682 = in.m_93.w;
    out.m_95.x = _2638;
    out.m_95.y = _2640;
    out.m_95.z = _2644;
    float _2684 = _2680 * _2674;
    float _2686 = _2684 * 0.5;
    out.m_97.x = _2666;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2690 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2688);
    out.m_97.y = _2672;
    float _2692 = 1.0 / _2690;
    out.m_97.z = _2678;
    out.m_97.w = _2682;
    float _2694 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2696 = -_2694;
    float _2698 = _2696 + 1.0;
    float _2700 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2702 = _2692 * _2700;
    float _2704 = abs(_2702);
    float _2706 = log2(_2704);
    bool _2708 = _2702 <= 8000.0;
    bool _2710 = isnan(_2702);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(8000.0);
    bool _2716 = _2712 || _2714;
    float _2718 = float(_2716);
    float _2720 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2722 = exp2(_2720);
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = fma(_2726, -2.0, 3.0);
    float _2730 = _2726 * _2726;
    float _2732 = in.m_71.x;
    float _2734 = _2730 * _2728;
    float _2736 = -_2734;
    float _2738 = _2736 + 1.0;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2734);
    float _2742 = _2718 * _2740;
    float _2744 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2746 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2748 = _2694 * _2152;
    float _2750 = _2163 * _2698;
    float _2752 = _2442 * _2744;
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2746);
    float _2758 = _2163 * _2748;
    float _2760 = _2173 * _2748;
    float _2762 = -_2754;
    float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2766 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2756);
    float _2768 = fma(_2169, _2758, _2157);
    float _2770 = fma(_2171, _2758, _2159);
    float _2772 = _2764 * _2732;
    float _2774 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2766);
    float _2776 = fma(_2163, _2760, _2161);
    float _2778 = _2772 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2780 = _2774 + _2106;
    out.m_99.x = _2768;
    out.m_99.y = _2770;
    out.m_99.z = _2776;
    out.m_99.w = _2750;
    float _2782 = _2780 * 0.5;
    float _2784 = _2694;
    float _2786 = _2698;
    float _2788 = _2772;
    float _2790 = _2780;
    float _2792 = _2134;
    if (!_2656)
    {
        _2784 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2794 = _2784;
    out.m_101.x = _2778;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2656)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2800 = _2786;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2656)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2806 = _2788;
    out.m_103.z = _2782;
    out.m_103.w = _2106;
    float _2808 = _2806;
    float _2810 = _2806;
    if (!_2656)
    {
        _2790 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2812 = _2790;
    out.gl_Position.x = _2134;
    out.gl_Position.y = _2136;
    out.gl_Position.z = _2774;
    out.gl_Position.w = _2106;
    float _2814 = _2812;
    float _2816 = _2812;
    if (!_2656)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2818 = _2210;
    float _2820 = _2818;
    float _2822 = _2818;
    if (!_2656)
    {
        _2792 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2824 = _2792;
    bool _2826 = !_2656;
    float _2828 = _2824;
    float _2830 = _2824;
    if (!_2826)
    {
        bool _2832 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2834 = isnan(_1832);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = _1832 + _2842;
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
            _2804 = _2884;
            _2822 = _2888;
            _2798 = _2880;
            _2816 = _2886;
            _2810 = _2882;
            _2830 = _2890;
            _2892 = true;
        }
        else
        {
            bool _2894 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2896 = isnan(_1832);
            bool _2898 = _2894 || _2896;
            bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2902 = _2898 || _2900;
            if (!_2902)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2904 = _2796;
            _2798 = _2904;
            if (!_2902)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2906 = _2802;
            _2804 = _2906;
            if (!_2902)
            {
                _2808 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2908 = _2808;
            _2810 = _2908;
            if (!_2902)
            {
                _2814 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2910 = _2814;
            _2816 = _2910;
            if (!_2902)
            {
                _2820 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2912 = _2820;
            _2822 = _2912;
            if (!_2902)
            {
                _2828 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2914 = _2828;
            bool _2916 = !_2902;
            _2830 = _2914;
            if (!_2916)
            {
                bool _2918 = _1832 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2920 = isnan(_1832);
                bool _2922 = _2918 || _2920;
                bool _2924 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2926 = _2922 || _2924;
                if (!_2926)
                {
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = _1832 + _2928;
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
                    _2804 = _2970;
                    _2822 = _2974;
                    _2798 = _2966;
                    _2816 = _2972;
                    _2810 = _2968;
                    _2830 = _2976;
                    _2892 = true;
                }
                else
                {
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2822 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2816 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2810 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2830 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2892 = false;
    float _2978 = _2804;
    float _2980 = _2822;
    float _2982 = _2798;
    float _2984 = _2816;
    float _2986 = _2810;
    float _2988 = _2830;
    float _2990 = fma(_2640, -0.5, 0.5);
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3040 = -_1796;
    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3044 = -_1798;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3048 = -_1800;
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
    float _3082 = _2640 * _3072;
    float _3084 = -_3072;
    float _3086 = -_3080;
    float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
    float _3090 = fma(_2638, _3070, _3082);
    float _3092 = -_3078;
    float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
    float _3096 = fma(_2644, _3078, _3090);
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
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

