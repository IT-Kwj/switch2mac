#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_89 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_107 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_105 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
    float4 m_85 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2744 = false;
    bool _1484 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_58.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_61.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3049 = as_type<float>(_142);
        out.gl_Position.z = _3049;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_63.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3119 = as_type<float>(_180);
        out.gl_Position.z = _3119;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_65.x;
    float _184 = in.m_65.y;
    float _186 = in.m_65.z;
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    bool _224 = _218 > 0.0;
    bool _226 = _220 > 0.0;
    float _228 = _220;
    float _230 = _212;
    if (_224)
    {
        float _232 = rsqrt(_212);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    if (!_224)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _240 = _236;
    float _242 = _238;
    bool _244 = _222 > 0.0;
    float _246 = 0.0;
    float _248 = _242;
    float _250 = _240;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _252 = _246;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _252;
    if (!_226)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = _222;
    float _266 = _262;
    float _268 = _260;
    if (_226)
    {
        float _270 = rsqrt(_214);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_226)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (!_244)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = 0.0;
    float _286 = _282;
    if (_244)
    {
        float _288 = rsqrt(_216);
        _284 = _288;
    }
    float _290 = _284;
    if (_224)
    {
        float _292 = _234 * _188;
        _258 = _292;
    }
    float _294 = _258;
    if (_224)
    {
        float _296 = _234 * _182;
        _248 = _296;
    }
    float _298 = _248;
    if (_224)
    {
        float _300 = _234 * _194;
        _250 = _300;
    }
    float _302 = _250;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _306 = 0.0;
    if (!_244)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = _308;
    if (!_244)
    {
        _230 = 0.0;
    }
    float _312 = _230;
    float _314 = _312;
    if (_226)
    {
        float _316 = _272 * _190;
        _280 = _316;
    }
    float _318 = _280;
    if (_226)
    {
        float _320 = _272 * _184;
        _266 = _320;
    }
    float _322 = _266;
    if (_226)
    {
        float _324 = _272 * _196;
        _268 = _324;
    }
    float _326 = _268;
    float _328 = _326;
    if (_244)
    {
        float _330 = _290 * _192;
        _286 = _330;
    }
    float _332 = _286;
    if (_244)
    {
        float _334 = _290 * _186;
        _310 = _334;
    }
    float _336 = _310;
    if (_244)
    {
        float _338 = _290 * _198;
        _314 = _338;
    }
    float _340 = _314;
    bool _342 = !_304;
    float _344 = _340;
    float _362;
    if (!_342)
    {
        float _346 = in.m_71.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_126);
        float _368 = 1.0 / _366;
        float _370 = _160 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_71.z;
    float _376 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _378 = log2(_376);
    float _380 = in.m_71.w;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _384 = _382 != 0;
    float _386 = in.m_58.x;
    float _388 = in.m_58.y;
    float _390 = in.m_58.z;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _398 = _396 != 0;
    float _400 = in.m_73.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_71.y;
    float _408 = _378 * _160;
    float _410 = in.m_73.x;
    float _412 = exp2(_408);
    float _414 = _374 * 2.0;
    float _416 = in.m_67.w;
    bool _418 = _380 > 0.5;
    float _420 = in.m_65.w;
    float _422 = floor(_414);
    float _424 = _190 * _388;
    float _426 = _184 * _388;
    float _428 = _196 * _388;
    float _430 = -_400;
    float _432 = _430 + 1.0;
    float _434 = in.m_75.x;
    float _436 = in.m_75.y;
    float _438 = in.m_75.z;
    float _440 = fma(_182, _386, _426);
    float _442 = _406 * 2.0;
    int _444 = _418 ? as_type<int>(_432) : as_type<int>(_400);
    float _446 = in.m_71.x;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _458 = _456 != 0;
    float _460 = fma(_188, _386, _424);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = _398 ? as_type<float>(_444) : _400;
    float _468 = -_412;
    float _470 = _468 + 1.0;
    bool _472 = _406 > 0.5;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    float _478 = 1.0 / _464;
    float _480 = fma(_194, _386, _428);
    float _482 = _400;
    if (_404)
    {
        float _484 = _472 ? _432 : _400;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = fma(_192, _390, _460);
    bool _490 = _422 >= 0.0;
    bool _492 = isnan(_422);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_186, _390, _440);
    bool _502 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _510 = _506 || _508;
    float _512 = _488 + _416;
    float _514 = 1.0 / _476;
    int _516 = _498 ? 0 : 1;
    float _518 = _436 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _522 = isnan(1.0);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _528 = _524 || _526;
    float _530 = fma(_198, _390, _480);
    float _532 = _510 ? _470 : 0.0;
    float _534 = _406 + _374;
    bool _536 = _422 > 0.0;
    float _538 = floor(_442);
    float _540 = _534 + (-1.0);
    int _542 = ~_516;
    int _544 = _542 + 1;
    int _546 = _544 + 1;
    float _548 = _446 * 2.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _552 = _546;
    if (_528)
    {
        float _554 = _532 * _514;
        _162 = _554;
    }
    float _556 = _162;
    float _558 = _446 + _374;
    float _560 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    out.m_77.w = _550;
    if (!_536)
    {
        int _562 = ~_516;
        int _564 = _562 + 1;
        _552 = _564;
    }
    int _566 = _552;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _568;
    float _572 = floor(_548);
    float _574 = in.m_79.x;
    float _576 = in.m_79.y;
    float _578 = in.m_79.z;
    bool _580 = _538 > 0.0;
    float _582 = _570 * _478;
    bool _584 = _538 >= 0.0;
    bool _586 = isnan(_538);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = _446 + _406;
    float _596 = _558 + (-1.0);
    int _598 = _592 ? 0 : 1;
    float _600 = _594 + (-1.0);
    float _602 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _604 = ~_598;
    int _606 = _604 + 1;
    int _608 = _606 + 1;
    float _610 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _614 = _608;
    float _616 = _610;
    if (!_580)
    {
        int _618 = ~_598;
        int _620 = _618 + 1;
        _614 = _620;
    }
    int _622 = _614;
    float _624 = _438 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _628 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _630 = _572 >= 0.0;
    bool _632 = isnan(_572);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = _556 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    if (!_384)
    {
        _616 = _410;
    }
    float _644 = _616;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _574);
    bool _648 = !_450;
    int _650 = _648 ? 0 : 1;
    float _652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _576);
    bool _654 = !_454;
    int _656 = _654 ? 0 : 1;
    float _658 = _646 * _640;
    bool _660 = !_458;
    int _662 = _660 ? 0 : 1;
    float _664 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _578);
    float _680 = _642 * _626;
    float _682 = _626;
    float _684 = _644;
    bool _686 = _638;
    bool _688 = _668;
    if (!_384)
    {
        _682 = _644;
    }
    float _690 = _682;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _372 + _692;
    float _696 = _690;
    if (_384)
    {
        _684 = _410;
    }
    float _698 = _684;
    float _700 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[203].x, _680);
    float _702 = _678 * _664;
    bool _704 = !_668;
    int _706 = _704 ? 0 : 1;
    float _708 = _652 * _628;
    float _710 = floor(_700);
    bool _712 = !_676;
    int _714 = _712 ? 0 : 1;
    float _716 = fma(_582, _694, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _718 = abs(_706);
    float _720 = _700 + 0.25;
    int _722 = abs(_714);
    float _724 = in.m_81.x;
    float _726 = in.m_81.y;
    float _728 = in.m_81.z;
    bool _730 = _572 > 0.0;
    float _732 = floor(_720);
    int _734 = _638 ? 0 : 1;
    float _736 = _500 + _420;
    float _738 = float(_566);
    float _740 = _406 + (-0.5);
    float _742 = float(_718);
    float _744 = float(_622);
    float _746 = -_710;
    float _748 = _700 + _746;
    float _750 = _700 * 6.283185482025146484375;
    bool _752 = !_672;
    int _754 = _752 ? 0 : 1;
    float _756 = _742 * _738;
    int _758 = abs(_656);
    float _760 = _750 * 0.15915493667125701904296875;
    int _762 = ~_734;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = _756 * (-2.0);
    float _770 = float(_722);
    float _772 = -_732;
    float _774 = _720 + _772;
    int _776 = _766;
    float _778 = _774;
    if (!_730)
    {
        int _780 = ~_734;
        int _782 = _780 + 1;
        _776 = _782;
    }
    int _784 = _776;
    float _786 = _760 * 6.283185482025146484375;
    float _788 = sin(_786);
    bool _790 = _748 >= 0.5;
    bool _792 = isnan(_748);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    float _800 = _770 * _744;
    int _802 = abs(_754);
    float _804 = _800 * (-2.0);
    bool _806 = !_798;
    int _808 = _806 ? 1056964608 : (-1090519040);
    float _810 = fma(_602, _804, _602);
    bool _812 = _774 > 0.5;
    float _814 = fma(_804, _728, _728);
    float _816 = float(_784);
    int _818 = _784;
    int _820 = _808;
    if (_394)
    {
        float _822 = -_698;
        float _824 = _822 + 1.0;
        _818 = as_type<int>(_824);
    }
    int _826 = _818;
    float _828 = float(_802);
    int _830 = abs(_650);
    if (_394)
    {
        bool _832 = _374 > 0.5;
        _686 = _832;
    }
    bool _834 = _686;
    float _836 = _828 * _816;
    float _838 = float(_758);
    float _840 = as_type<float>(_808) * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _842 = _840 * 2.0;
    float _844 = _374 + (-0.5);
    int _846 = abs(_662);
    if (_812)
    {
        float _848 = -_774;
        float _850 = _848 + 1.0;
        _778 = _850;
    }
    float _852 = _778;
    float _854 = float(_830);
    float _856 = _838 * _842;
    float _858 = _788 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _860 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].z, _814);
    float _862 = fma(_852, 4.0, -1.0);
    float _864 = _836 * (-2.0);
    float _866 = fma(_854, _858, _856);
    float _868 = float(_846);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _872 = fma(_864, _726, _726);
    float _874 = fma(_560, _864, _560);
    float _876 = fma(_810, _556, _860);
    float _878 = fma(_868, _870, _866);
    float _880 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[196].y, _872);
    float _882 = in.m_69.w;
    if (_384)
    {
        bool _884 = _446 > 0.5;
        _688 = _884;
    }
    bool _886 = _688;
    float _888 = fma(_878, 3.1415927410125732421875, _724);
    float _890 = fma(_874, _556, _880);
    float _892 = fma(_612, _768, _612);
    bool _894 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_372);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = fma(_888, _768, _888);
    bool _908 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _910 = isnan(_372);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = in.m_83.x;
    float _922 = in.m_83.y;
    float _924 = in.m_83.z;
    float _926 = _446 + (-0.5);
    float _928 = -_904;
    float _930 = _928 + 1.0;
    bool _932 = _576 != 0.0;
    bool _934 = isnan(_576);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    float _942 = _930;
    if (_384)
    {
        float _944 = -_698;
        float _946 = _944 + 1.0;
        _820 = as_type<int>(_946);
    }
    int _948 = _820;
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].x, _906);
    float _952 = _918 * _930;
    bool _954 = _574 == 0.0;
    bool _956 = !_940;
    bool _958 = _954 && _956;
    float _960 = _876 * 0.15915493667125701904296875;
    float _962 = fma(_892, _556, _950);
    float _964 = _716 * _952;
    bool _966 = _578 == 0.0;
    bool _968 = _966 && _958;
    float _970 = in.m_85.x;
    float _972 = in.m_85.y;
    float _974 = in.m_85.z;
    float _976 = in.m_85.w;
    float _978 = -_918;
    float _980 = _978 + 1.0;
    float _982 = _962 * 0.15915493667125701904296875;
    float _984 = _964;
    float _986 = _962;
    float _988 = _980;
    if (!_394)
    {
        _942 = _698;
    }
    float _990 = _942;
    float _992 = _890 * 0.15915493667125701904296875;
    float _994 = _990;
    if (_384)
    {
        float _996 = _886 ? as_type<float>(_948) : _698;
        _696 = _996;
    }
    float _998 = _696;
    float _1000 = _960 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    if (_394)
    {
        float _1004 = _834 ? as_type<float>(_826) : _698;
        _994 = _1004;
    }
    float _1006 = _994;
    float _1008 = _530 + _882;
    float _1010 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[115].x, _964);
    float _1012 = _882;
    float _1014 = _920;
    if (_968)
    {
        _1012 = _922;
    }
    float _1016 = _1012;
    float _1018 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1010);
    float _1020 = _960 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _1016;
    if (_968)
    {
        _984 = _920;
    }
    float _1026 = _984;
    float _1028 = _1026;
    if (_968)
    {
        _986 = _1016;
    }
    float _1030 = _986;
    float _1032 = _1030;
    if (_968)
    {
        _988 = _1026;
    }
    float _1034 = _988;
    float _1036 = _1034;
    if (!_968)
    {
        _1024 = _922;
    }
    float _1038 = _1024;
    float _1040 = _982 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    if (!_968)
    {
        _1028 = _920;
    }
    float _1044 = _1028;
    if (_968)
    {
        _1014 = _924;
    }
    float _1046 = _1014;
    float _1048 = _1046;
    if (!_968)
    {
        float _1050 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1032 = _1050;
    }
    float _1052 = _1032;
    float _1054 = _972 * _924;
    float _1056 = _974 * _1044;
    if (!_968)
    {
        float _1058 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1044);
        _1036 = _1058;
    }
    float _1060 = _1036;
    float _1062 = _982 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = _970 * _1038;
    if (!_968)
    {
        float _1068 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _924);
        _1048 = _1068;
    }
    float _1070 = _1048;
    float _1072 = -_1056;
    float _1074 = fma(_970, _924, _1072);
    float _1076 = -_1054;
    float _1078 = fma(_974, _1038, _1076);
    float _1080 = -_1066;
    float _1082 = fma(_972, _1044, _1080);
    float _1084 = _992 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = _1042 * _1002;
    float _1090 = _992 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1064 * _1022;
    float _1096 = _1064 * _1002;
    float _1098 = _1002 * _1086;
    float _1100 = _1042 * _1022;
    float _1102 = _1022 * _1086;
    float _1104 = _1042 * _1086;
    float _1106 = _1064 * _1086;
    float _1108 = _1104 * _708;
    float _1110 = fma(_1092, _1088, _1094);
    float _1112 = -_1096;
    float _1114 = fma(_1092, _1100, _1112);
    float _1116 = -_1100;
    float _1118 = fma(_1092, _1096, _1116);
    float _1120 = fma(_1092, _1094, _1088);
    float _1122 = _1110 * _708;
    float _1124 = _1114 * _708;
    float _1126 = -_1092;
    float _1128 = fma(_1126, _658, _1108);
    float _1130 = _1074 * _976;
    float _1132 = fma(_1098, _658, _1122);
    float _1134 = fma(_1102, _658, _1124);
    float _1136 = _1078 * _976;
    float _1138 = _1082 * _976;
    float _1140 = fma(_1118, _702, _1132);
    float _1142 = fma(_1120, _702, _1134);
    float _1144 = fma(_1106, _702, _1128);
    float _1146 = _1104 * _1052;
    float _1148 = _1140 * _318;
    float _1150 = _1140 * _326;
    float _1152 = _1104 * _972;
    float _1154 = _1104 * _1130;
    float _1156 = fma(_1142, _294, _1148);
    float _1158 = fma(_1142, _302, _1150);
    float _1160 = _1110 * _1052;
    float _1162 = _1114 * _972;
    float _1164 = fma(_1144, _332, _1156);
    float _1166 = fma(_1144, _340, _1158);
    float _1168 = _1110 * _972;
    float _1170 = _1114 * _1130;
    float _1172 = _512 + _1164;
    float _1174 = _1008 + _1166;
    float _1176 = _1114 * _1052;
    float _1178 = _1110 * _1130;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1182 = _1172 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1174 + _1184;
    float _1188 = -_1092;
    float _1190 = fma(_1188, _1060, _1146);
    float _1192 = fma(_1102, _1060, _1176);
    float _1194 = _1182 * _1182;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1098, _1060, _1160);
    float _1200 = -_1092;
    float _1202 = fma(_1200, _970, _1152);
    float _1204 = -_1092;
    float _1206 = fma(_1204, _1136, _1154);
    float _1208 = _1194 + _1196;
    float _1210 = fma(_1102, _1136, _1170);
    float _1212 = fma(_1098, _970, _1168);
    float _1214 = fma(_1098, _1136, _1178);
    float _1216 = sqrt(_1208);
    float _1218 = _1140 * _322;
    float _1220 = fma(_1102, _970, _1162);
    float _1222 = fma(_1106, _1070, _1190);
    float _1224 = fma(_1120, _1070, _1192);
    float _1226 = fma(_1118, _1070, _1198);
    float _1228 = fma(_1106, _1138, _1206);
    float _1230 = fma(_1120, _1138, _1210);
    float _1232 = fma(_1118, _974, _1212);
    float _1234 = fma(_1118, _1138, _1214);
    float _1236 = fma(_1106, _974, _1202);
    float _1238 = fma(_1120, _974, _1220);
    float _1240 = fma(_1142, _298, _1218);
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1244 = _1232 * _318;
    float _1246 = _1226 * _318;
    bool _1248 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = fma(_1144, _336, _1240);
    float _1252 = _1234 * _318;
    float _1254 = fma(_1238, _294, _1244);
    float _1256 = _1232 * _322;
    float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1260 = _736 + _1250;
    float _1262 = _1232 * _326;
    float _1264 = _1226 * _322;
    float _1266 = _1234 * _322;
    float _1268 = _1226 * _326;
    float _1270 = _1234 * _326;
    float _1272 = fma(_1238, _298, _1256);
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1276 = fma(_1238, _302, _1262);
    float _1278 = _1144;
    float _1280 = _1250;
    float _1282 = _1194;
    float _1284 = _1196;
    float _1286 = _1256;
    int _1288 = as_type<int>(_1214);
    int _1290 = as_type<int>(_1146);
    if (!_1248)
    {
        _328 = _1172;
    }
    float _1292 = _328;
    float _1294 = _1292;
    if (!_1248)
    {
        _1278 = _1174;
    }
    float _1296 = _1278;
    float _1298 = _1296;
    if (!_1248)
    {
        _1280 = _1260;
    }
    float _1300 = _1280;
    bool _1302 = !_1248;
    float _1304 = _1300;
    if (!_1302)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1310 = _1216 + _1308;
        float _1312 = rsqrt(_1208);
        float _1314 = _1310 * _1306;
        float _1316 = _1260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = _1314 * 0.15915493667125701904296875;
        float _1320 = _1318 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = fma(_1322, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1330 = _1312 * _1328;
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1182, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1336 = fma(_1186, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1338 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1342 = _1334 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1346 = _1336 + _1344;
        float _1348 = fma(_1260, _1326, _1338);
        float _1350 = _1342 * _1342;
        float _1352 = _1346 * _1346;
        _1304 = _1348;
        _1282 = _1350;
        _1284 = _1352;
        _1294 = _1334;
        _1298 = _1336;
    }
    float _1354 = _1304;
    float _1356 = _1282;
    float _1358 = _1284;
    float _1360 = _1294;
    float _1362 = _1298;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1366 = _1354 + _1364;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1370 = fma(_1224, _294, _1246);
    float _1372 = fma(_1230, _294, _1252);
    float _1374 = fma(_1366, _1366, _1356);
    float _1376 = fma(_1224, _298, _1264);
    float _1378 = fma(_1230, _298, _1266);
    float _1380 = _998 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = _1374 + _1358;
    float _1384 = _486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1386 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1388 = sqrt(_1382);
    float _1390 = fma(_1224, _302, _1268);
    float _1392 = fma(_1230, _302, _1270);
    float _1394 = _466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1402 = _1384 * _1258;
    float _1404 = _1380 * _1242;
    float _1406 = _1386 * _1368;
    float _1408 = fma(_1236, _332, _1254);
    float _1410 = fma(_1236, _336, _1272);
    float _1412 = fma(_1222, _332, _1370);
    float _1414 = fma(_1228, _332, _1372);
    float _1416 = fma(_1222, _336, _1376);
    float _1418 = _1394 * _1274;
    float _1420 = fma(_1236, _340, _1276);
    float _1422 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1430 = fma(_1228, _336, _1378);
    float _1432 = fma(_1228, _340, _1392);
    float _1434 = fma(_1222, _340, _1390);
    out.m_87.x = _1404;
    out.m_87.y = _1402;
    out.m_87.z = _1406;
    out.m_87.w = _1418;
    bool _1436 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1388);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_89.x = _1422;
    out.m_89.y = _1424;
    out.m_89.z = _1426;
    out.m_89.w = _1428;
    out.m_91.x = _1408;
    out.m_91.y = _1410;
    out.m_91.z = _1420;
    out.m_93.x = _1414;
    out.m_93.y = _1430;
    out.m_93.z = _1432;
    float _1446 = _1394;
    float _1448 = _1360;
    if (!_1444)
    {
        _344 = 1.0;
    }
    float _1450 = _344;
    out.m_95.x = _1412;
    out.m_95.y = _1416;
    out.m_95.z = _1434;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1388);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1388 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1388);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1388 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = _736 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1520 = _1354 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1524 = _1360 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1528 = _1362 + _1526;
    float _1530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1516);
    float _1532 = fma(_1520, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1534 = fma(_1524, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1536 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1538 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1530);
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1542 = _1532 + _1540;
    float _1544 = _736 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1552 = _1542 * _1542;
    float _1554 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1544);
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1536 + _1556;
    float _1560 = 1.0 / _1550;
    float _1562 = fma(_1548, _1548, _1552);
    float _1564 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1554);
    float _1566 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1568 = fma(_1558, _1558, _1562);
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1572 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1566);
    float _1574 = rsqrt(_1568);
    float _1576 = _1570 + _1550;
    float _1578 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1580 = _736 + _1578;
    float _1582 = _1576 * _1560;
    float _1584 = _1582 * 0.5;
    float _1586 = sqrt(_1568);
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1592 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1590);
    float _1594 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1588);
    float _1596 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1598 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1600 = 1.0 / _1592;
    float _1602 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1594);
    float _1604 = _1548 * _1598;
    float _1606 = _1558 * _1598;
    float _1608 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1610 = _1604 * _1604;
    float _1612 = _1606 * _1606;
    float _1614 = trunc(_1608);
    int _1616 = int(_1614);
    float _1618 = _1610 + _1612;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1622 = _1600 * _1620;
    float _1624 = sqrt(_1618);
    float _1626 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1628 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1630 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1626);
    bool _1632 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1634 = floor(_1596);
    float _1636 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1630);
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1640 = !_1628;
    int _1642 = _1640 ? 0 : 1;
    bool _1644 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = trunc(_1638);
    int _1648 = int(_1646);
    int _1650 = 2;
    int _1652 = as_type<int>(_1542);
    float _1654 = _1604;
    float _1656 = _1606;
    float _1658 = _1610;
    float _1660 = _1572;
    float _1662 = _1580;
    if (!_1628)
    {
        _1650 = 1;
    }
    int _1664 = _1650;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1624 + _1666;
    int _1670 = _1664;
    float _1672 = _1668;
    if (!_1632)
    {
        _1670 = _1642;
    }
    int _1674 = _1670;
    int _1676 = _1674 << 6;
    float _1678 = -_1634;
    float _1680 = _1596 + _1678;
    int _1682 = _1676 + 96;
    uint _1685 = uint(int(uint(_1682) >> uint(2)));
    uint _1687 = uint(int(uint(int(_1685)) >> uint(2)));
    int _1689 = int(_1685) & 3;
    float _1691 = (*spvDescriptorSet0.vp_c15)._m0[int(_1687)][_1689];
    int _1693 = int(_1685) + 1;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    int _1697 = _1693 & 3;
    float _1699 = (*spvDescriptorSet0.vp_c15)._m0[int(_1695)][_1697];
    float _1701 = _1428;
    float _1703 = as_type<float>(_1674);
    if (_1644)
    {
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1705;
    }
    float _1707 = _1701;
    if (!_1644)
    {
        _1286 = _1612;
    }
    float _1709 = _1286;
    int _1711 = _1676 + 104;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    uint _1715 = uint(int(uint(int(_1713)) >> uint(2)));
    int _1717 = int(_1713) & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    int _1721 = int(_1713) + 1;
    uint _1723 = uint(int(uint(_1721) >> uint(2)));
    int _1725 = _1721 & 3;
    float _1727 = (*spvDescriptorSet0.vp_c15)._m0[int(_1723)][_1725];
    float _1729 = _1709;
    if (_1644)
    {
        float _1731 = _1668 * _1707;
        _1672 = _1731;
    }
    float _1733 = _1672;
    int _1735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1737 = _1616 + _1735;
    int _1739 = _1737 + 1;
    float _1741 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1644)
    {
        float _1743 = _1733 * 0.15915493667125701904296875;
        _1446 = _1743;
    }
    float _1745 = _1446;
    int _1747 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1749 = _1648 + _1747;
    int _1751 = _1749 + 1;
    float _1753 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    if (_1644)
    {
        float _1755 = _1745 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        _1448 = _1757;
    }
    float _1759 = _1448;
    bool _1761 = _1751 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1763 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    int _1765 = _1751 | _1739;
    float _1767 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1769 = _1765 < 0;
    bool _1771 = _1769 || _1761;
    float _1773 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1775 = _1432;
    if (_1644)
    {
        float _1777 = _1745 * 6.283185482025146484375;
        float _1779 = cos(_1777);
        _1775 = _1779;
    }
    float _1781 = _1775;
    float _1783 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1785 = _1739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1787 = _1785 || _1771;
    float _1789 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = precise::max(0.0, _1773);
    float _1793 = -_1789;
    float _1795 = fma(_1793, _1783, 1.0);
    float _1797 = _1763;
    float _1799 = _1783;
    if (_1644)
    {
        float _1801 = rsqrt(_1618);
        _1797 = _1801;
    }
    float _1803 = _1797;
    float _1805 = -_1598;
    float _1807 = -_1791;
    float _1809 = fma(_1542, _1805, _1807);
    float _1811 = _1809;
    if (_1644)
    {
        float _1813 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1813;
    }
    float _1815 = _1799;
    float _1817 = _1580 * _1699;
    float _1819 = _1699;
    float _1821 = _1815;
    if (!_1787)
    {
        int _1823 = _1739 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1825 = _1823 + _1751;
        _1652 = _1825;
    }
    int _1827 = _1652;
    float _1829 = as_type<float>(_1827);
    if (_1644)
    {
        float _1831 = _1781 + (-1.0);
        _1819 = _1831;
    }
    float _1833 = _1819;
    float _1835 = _1833;
    if (_1644)
    {
        float _1837 = fma(_1759, _1815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1821 = _1837;
    }
    float _1839 = _1821;
    int _1841 = _1676 + 48;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    float _1859 = fma(_512, _1691, _1817);
    if (_1644)
    {
        float _1861 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1835 = _1861;
    }
    float _1863 = _1835;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1867 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1865);
    float _1869 = precise::clamp(_1867, 0.0, 1.0);
    if (!_1787)
    {
        int _1871 = _1827 << 2;
        _1288 = _1871;
    }
    int _1873 = _1288;
    float _1875 = fma(_1008, _1719, _1859);
    float _1877 = _1803;
    int _1879 = _1873;
    if (_1644)
    {
        float _1881 = _1803 * _1839;
        _1877 = _1881;
    }
    float _1883 = _1877;
    if (_1644)
    {
        float _1885 = fma(_1809, _1781, _1863);
        _1811 = _1885;
    }
    float _1887 = _1811;
    int _1889 = _1676 + 64;
    uint _1891 = uint(int(uint(_1889) >> uint(2)));
    uint _1893 = uint(int(uint(int(_1891)) >> uint(2)));
    int _1895 = int(_1891) & 3;
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[int(_1893)][_1895];
    int _1899 = int(_1891) + 1;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    int _1903 = _1899 & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    if (_1644)
    {
        float _1907 = _1604 * _1883;
        _1654 = _1907;
    }
    float _1909 = _1654;
    if (_1644)
    {
        float _1911 = _1606 * _1883;
        _1656 = _1911;
    }
    float _1913 = _1656;
    float _1915 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1644)
    {
        float _1919 = _1909 * _1909;
        _1658 = _1919;
    }
    float _1921 = _1658;
    float _1923 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1925 = _1676 + 56;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    uint _1929 = uint(int(uint(int(_1927)) >> uint(2)));
    int _1931 = int(_1927) & 3;
    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[int(_1929)][_1931];
    int _1935 = int(_1927) + 1;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    int _1939 = _1935 & 3;
    float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
    if (_1644)
    {
        float _1943 = _1913 * _1913;
        _1729 = _1943;
    }
    float _1945 = _1729;
    float _1947 = fma(_1887, _1887, _1921);
    float _1949 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1915);
    float _1951 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1917);
    float _1953 = -_1869;
    float _1955 = _1953 + 1.0;
    float _1957 = _1947 + _1945;
    float _1959 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1949);
    int _1961 = _1676 + 72;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    uint _1965 = uint(int(uint(int(_1963)) >> uint(2)));
    int _1967 = int(_1963) & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    int _1971 = int(_1963) + 1;
    uint _1973 = uint(int(uint(_1971) >> uint(2)));
    int _1975 = _1971 & 3;
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[int(_1973)][_1975];
    float _1979 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1951);
    if (!_1787)
    {
        uint _1981 = uint(int(uint(_1827) >> uint(2)));
        _1290 = int(_1981);
    }
    int _1983 = _1290;
    float _1985 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1787)
    {
        int _1987 = 12 & _1873;
        _1879 = _1987;
    }
    int _1989 = _1879;
    float _1991 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1993 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1572);
    float _1995 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1997 = _1676 + 80;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c15)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
    float _2015 = _1875 + _1727;
    if (!_1787)
    {
        int _2017 = _1983 << 4;
        int _2019 = _2017 + _1989;
        _1660 = as_type<float>(_2019);
    }
    float _2021 = _1660;
    float _2023 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1995);
    float _2025 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2027 = rsqrt(_1957);
    float _2029 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    int _2031 = _1676 + 88;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    uint _2035 = uint(int(uint(int(_2033)) >> uint(2)));
    int _2037 = int(_2033) & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    int _2041 = int(_2033) + 1;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    int _2045 = _2041 & 3;
    float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
    float _2049 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2029);
    float _2051 = 1.0 / _2015;
    float _2053 = _1580 * _1857;
    float _2055 = _2021;
    if (!_1787)
    {
        int _2057 = as_type<int>(_2021) + 400;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
        int _2063 = int(_2059) & 3;
        float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
        _2055 = _2065;
    }
    float _2067 = _2055;
    float _2069 = fma(_512, _1849, _2053);
    float _2071 = _2027 * _1909;
    float _2073 = abs(_1955);
    float _2075 = log2(_2073);
    float _2077 = _2027 * _1887;
    float _2079 = _1580 * _1905;
    float _2081 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2083 = _2027 * _1913;
    float _2085 = fma(_512, _1897, _2079);
    float _2087 = 1.0 / _2049;
    float _2089 = fma(_1008, _1933, _2069);
    float _2091 = _2089 + _1941;
    float _2093 = -_2081;
    float _2095 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2093);
    float _2097 = _1941;
    float _2099 = _2071;
    if (!_1787)
    {
        float _2101 = floor(_1608);
        _2097 = _2101;
    }
    float _2103 = _2097;
    float _2105 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2107 = fma(_1008, _1969, _2085);
    float _2109 = _2091 * _2051;
    float _2111 = -_2083;
    float _2113 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2095);
    float _2115 = _2107 + _1977;
    bool _2117 = _2109 >= 0.0;
    float _2119 = fma(_2113, -0.5, 0.5);
    float _2121 = _2115 * _2051;
    float _2123 = _1580 * _2013;
    bool _2125 = _2109 <= 1.0;
    bool _2127 = _2125 && _2117;
    float _2129 = fma(_2113, 0.5, 0.5);
    float _2131 = fma(_512, _2005, _2123);
    bool _2133 = _2121 >= 0.0;
    bool _2135 = _2133 && _2127;
    float _2137 = exp2(_2105);
    if (!_1787)
    {
        float _2139 = -_2103;
        float _2141 = _1608 + _2139;
        _2099 = _2141;
    }
    float _2143 = _2099;
    float _2145 = fma(_1008, _2039, _2131);
    bool _2147 = _2121 <= 1.0;
    bool _2149 = _2147 && _2135;
    float _2151 = fma(_2129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2153 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2155 = _2145 + _2047;
    float _2157 = fma(_2129, _2151, -0.212114393711090087890625);
    float _2159 = sqrt(_2119);
    float _2161 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2163 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2153);
    float _2165 = fma(_2129, _2157, 1.570728778839111328125);
    float _2167 = _2077 + 1.0;
    float _2169 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2161);
    float _2171 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2163);
    float _2173 = _2165;
    if (_2149)
    {
        float _2175 = float(_1674);
        _1703 = _2175;
    }
    float _2177 = _1703;
    float _2179 = log2(_1795);
    float _2181 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2169);
    float _2183 = -_2077;
    float _2185 = fma(_2137, _2167, _2183);
    float _2187 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2171);
    float _2189 = _2155 * _2051;
    float _2191 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2181);
    float _2193 = _2187 * _2087;
    float _2195 = floor(_1923);
    float _2197 = _2159 * 0.636619746685028076171875;
    float _2199 = _2191 * _2087;
    float _2201 = fma(_2193, 0.5, 0.5);
    float _2203 = -_2165;
    float _2205 = fma(_2197, _2203, 1.0);
    float _2207 = _2083;
    float _2209 = _2187;
    float _2211 = _2191;
    if (!_1787)
    {
        float _2213 = floor(_1638);
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = _2179 * 0.693147182464599609375;
    float _2219 = _2039;
    if (!_1787)
    {
        float _2221 = rint(_2067);
        float _2223 = precise::max(_2221, 0.0);
        uint _2225 = uint(_2223);
        uint _2227 = clamp(_2225, 0u, 65535u);
        _2219 = as_type<float>(_2227);
    }
    float _2229 = _2219;
    float _2231 = -_2195;
    float _2233 = _1923 + _2231;
    float _2235 = fma(_2199, -0.5, 0.5);
    float _2237 = fma(_2185, 0.5, 0.5);
    float _2239 = _2169;
    if (_2149)
    {
        float _2241 = rint(_2177);
        float _2243 = precise::max(_2241, 0.0);
        uint _2245 = uint(_2243);
        uint _2247 = clamp(_2245, 0u, 65535u);
        _2239 = as_type<float>(_2247);
    }
    float _2249 = _2239;
    if (!_1787)
    {
        float _2251 = -_2215;
        float _2253 = _1638 + _2251;
        _2173 = _2253;
    }
    float _2255 = _2173;
    float _2257 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6391 = float2(_2233, _1680);
    float _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6391, float2(0.0), isnan(_6391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6391, float2(0.0), isnan(_6391)), level(0.0)).x;
    float _2261 = _2217;
    if (!_1787)
    {
        float3 _6408 = float3(_2255, _2143, float(as_type<int>(_2229)));
        float3 _6412 = select(_6408, float3(0.0), isnan(_6408));
        float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6412.xy, uint(rint(_6412.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6412.xy, uint(rint(_6412.z)), level(0.0)).x;
        _2261 = _2263;
    }
    float _2265 = _2261;
    float _2267 = _2121;
    if (_2149)
    {
        float3 _6427 = float3(_2109, _2121, float(as_type<int>(_2249)));
        float3 _6429 = select(_6427, float3(0.0), isnan(_6427));
        float _2269 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6429.xy, uint(rint(_6429.z)), _2189, level(0.0));
        _2267 = _2269;
    }
    float _2271 = _2267;
    float3 _6439 = float3(_2201, _2235, _2257);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6439, float3(0.0), isnan(_6439)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6439, float3(0.0), isnan(_6439)), level(0.0)).x;
    float3 _6448 = float3(_2201, _2235, _2257);
    float4 _2276 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6448, float3(0.0), isnan(_6448)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6448, float3(0.0), isnan(_6448)), level(0.0)).xyzw;
    float _2278 = _2276.x;
    float _2280 = _2276.y;
    float _2282 = _2276.z;
    float _2284 = _2276.w;
    float2 _6464 = float2(_2205, _2237);
    float3 _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6464, float2(0.0), isnan(_6464)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6464, float2(0.0), isnan(_6464)), level(0.0)).xyz;
    float _2290 = _2288.x;
    float _2292 = _2288.y;
    float _2294 = _2288.z;
    float _2296 = abs(_1622);
    float _2298 = log2(_2296);
    float _2300 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2302 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2304 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2300);
    float _2306 = _2187 + _2049;
    float _2308 = exp2(_2302);
    float _2310 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2312 = _2049 * 0.5;
    float _2314 = _2306 * 0.5;
    float _2316 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2310);
    float _2318 = fma(_2191, -0.5, _2312);
    float _2320 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2322 = _2316 + _2049;
    out.gl_Position.x = _2187;
    out.gl_Position.y = _2191;
    out.gl_Position.z = _2316;
    out.gl_Position.w = _2049;
    float _2324 = _2322 * 0.5;
    float _2326 = exp2(_2320);
    bool _2328 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(0.5);
    bool _2336 = _2332 || _2334;
    out.m_97.x = _2314;
    out.m_97.y = _2318;
    out.m_97.z = _2324;
    out.m_97.w = _2049;
    if (_2336)
    {
        _2209 = 1.0;
    }
    float _2338 = _2209;
    float _2340 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = _2338;
    if (_2336)
    {
        _2211 = 1.0;
    }
    float _2346 = _2211;
    float _2348 = fma(_2342, -2.0, 3.0);
    float _2350 = _2342 * _2342;
    float _2352 = _2350 * _2348;
    bool _2354 = _1622 <= 8000.0;
    bool _2356 = isnan(_1622);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(8000.0);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    float _2366 = -_2352;
    float _2368 = _2366 + 1.0;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2352);
    float _2372 = _2364 * _2370;
    float _2374 = _2346;
    float _2376 = _2372;
    if (!_2336)
    {
        float _2378 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2382 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2380;
        float _2384 = _2378 * 0.15915493667125701904296875;
        float _2386 = _2384 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        float _2390 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2392 = _2390 * 0.15915493667125701904296875;
        float _2394 = _2384 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = 1.0 / _2388;
        float _2400 = _2392 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        float _2404 = _2396 * _2398;
        float _2406 = _2392 * 6.283185482025146484375;
        float _2408 = sin(_2406);
        float _2410 = _2402 * _2404;
        float _2412 = 1.0 / _2382;
        float _2414 = 1.0 / _2410;
        float _2416 = _2408 * _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2420 = fma(_1622, _2416, _2418);
        float _2422 = _2420 * _2412;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        _2374 = _2424;
    }
    float _2426 = _2374;
    if (!_2336)
    {
        float _2428 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2430 * 6.283185482025146484375;
        float _2434 = cos(_2432);
        float _2436 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2438 = _2436 * 0.15915493667125701904296875;
        float _2440 = _2430 * 6.283185482025146484375;
        float _2442 = sin(_2440);
        float _2444 = 1.0 / _2434;
        float _2446 = _2438 * 6.283185482025146484375;
        float _2448 = cos(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = _2438 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = _2448 * _2450;
        float _2458 = 1.0 / _2456;
        float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2462 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2460;
        float _2464 = 1.0 / _2462;
        float _2466 = _2454 * _2458;
        float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2470 = fma(_1622, _2466, _2468);
        float _2472 = _2470 * _2464;
        float _2474 = precise::clamp(_2472, 0.0, 1.0);
        float _2476 = -_2474;
        float _2478 = _2476 + 1.0;
        _2344 = _2478;
    }
    float _2480 = _2344;
    float _2482 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2484 = -_2259;
    float _2486 = _2484 + 1.0;
    float _2488 = -_2308;
    float _2490 = _2488 + 1.0;
    float _2492 = _2482;
    if (!_2149)
    {
        _2376 = 1.0;
    }
    float _2494 = _2376;
    float _2496 = _2486 * _2482;
    float _2498 = precise::clamp(_2496, 0.0, 1.0);
    float _2500 = _2494;
    if (_2149)
    {
        bool _2502 = _2271 >= _2189;
        bool _2504 = isnan(_2271);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan(_2189);
        bool _2510 = _2506 || _2508;
        float _2512 = float(_2510);
        _2500 = _2512;
    }
    float _2514 = _2500;
    float _2516 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2518 = _2516;
    if (_1787)
    {
        _2492 = 1.0;
    }
    float _2520 = _2492;
    float _2522 = _2520;
    if (!_1787)
    {
        int _2524 = _1827 << 4;
        int _2526 = _2524 + 2048;
        uint _2528 = uint(int(uint(_2526) >> uint(2)));
        uint _2530 = uint(int(uint(int(_2528)) >> uint(2)));
        int _2532 = int(_2528) & 3;
        float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
        int _2536 = int(_2528) + 1;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        int _2540 = _2536 & 3;
        float _2542 = (*spvDescriptorSet0.vp_c15)._m0[int(_2538)][_2540];
        int _2544 = _2526 + 8;
        uint _2546 = uint(int(uint(_2544) >> uint(2)));
        uint _2548 = uint(int(uint(int(_2546)) >> uint(2)));
        int _2550 = int(_2546) & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        int _2554 = int(_2546) + 1;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        int _2558 = _2554 & 3;
        float _2560 = (*spvDescriptorSet0.vp_c15)._m0[int(_2556)][_2558];
        float _2562 = _1580 * _2542;
        float _2564 = fma(_512, _2534, _2562);
        float _2566 = fma(_1008, _2552, _2564);
        float _2568 = _2566 + _2560;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = -_2570;
        float _2574 = _2572 + _2265;
        float _2576 = fma(_2574, 500.0, 1.5);
        float _2578 = exp2(_2576);
        float _2580 = 0.0 + _2578;
        float _2582 = precise::clamp(_2580, 0.0, 1.0);
        _2522 = _2582;
        _1829 = as_type<float>(_2526);
        _1662 = _2578;
    }
    float _2584 = _2522;
    float _2586 = _1829;
    float _2588 = _1662;
    float _2590 = _2514 * _2584;
    float _2592 = _2516 * _2273;
    float _2594 = -_2498;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2598 = -_2516;
    float _2600 = _2598 + 1.0;
    out.m_99.x = _1534;
    out.m_99.y = _1532;
    out.m_99.z = _1536;
    float _2602 = _2284 * _2592;
    float _2604 = -_2590;
    float _2606 = fma(_2604, _2596, 1.0);
    float _2608 = precise::clamp(_2606, 0.0, 1.0);
    float _2610 = _2294 * _2592;
    float _2612 = _2284 * _2600;
    float _2614 = fma(_2290, _2602, _2278);
    float _2616 = fma(_2292, _2602, _2280);
    float _2618 = _2608 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2620 = fma(_2284, _2610, _2282);
    bool _2622 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2624 = isnan(_1586);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2630 = _2626 || _2628;
    float _2632 = _2426 * _2480;
    out.m_101.x = _2618;
    float _2634 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2614;
    out.m_103.y = _2616;
    out.m_103.z = _2620;
    out.m_103.w = _2612;
    float _2636 = _2586;
    float _2638 = _2588;
    float _2640 = _2600;
    float _2642 = _2608;
    float _2644 = _2602;
    if (!_2630)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2646 = _2518;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2630)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2652 = _2636;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2630)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2658 = _2638;
    float _2660 = _2658;
    float _2662 = _2658;
    if (!_2630)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2664 = _2640;
    float _2666 = _2664;
    float _2668 = _2664;
    if (!_2630)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2670 = _2642;
    float _2672 = _2670;
    float _2674 = _2670;
    if (!_2630)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2676 = _2644;
    bool _2678 = !_2630;
    float _2680 = _2676;
    float _2682 = _2676;
    if (!_2678)
    {
        bool _2684 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2686 = isnan(_1586);
        bool _2688 = _2684 || _2686;
        bool _2690 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2692 = _2688 || _2690;
        if (!_2692)
        {
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = _1586 + _2694;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2700 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2698;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2706 = 1.0 / _2700;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2724 = _2696 * _2706;
            float _2726 = precise::clamp(_2724, 0.0, 1.0);
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2732 = fma(_2726, _2704, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2734 = fma(_2726, _2730, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2736 = fma(_2726, _2710, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2738 = fma(_2726, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2740 = fma(_2726, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2742 = fma(_2726, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2656 = _2732;
            _2674 = _2740;
            _2650 = _2736;
            _2668 = _2738;
            _2662 = _2734;
            _2682 = _2742;
            _2744 = true;
        }
        else
        {
            bool _2746 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2748 = isnan(_1586);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2754 = _2750 || _2752;
            if (!_2754)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2756 = _2648;
            _2650 = _2756;
            if (!_2754)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2758 = _2654;
            _2656 = _2758;
            if (!_2754)
            {
                _2660 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2760 = _2660;
            _2662 = _2760;
            if (!_2754)
            {
                _2666 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2762 = _2666;
            _2668 = _2762;
            if (!_2754)
            {
                _2672 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2764 = _2672;
            _2674 = _2764;
            if (!_2754)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2766 = _2680;
            bool _2768 = !_2754;
            _2682 = _2766;
            if (!_2768)
            {
                bool _2770 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2772 = isnan(_1586);
                bool _2774 = _2770 || _2772;
                bool _2776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2778 = _2774 || _2776;
                if (!_2778)
                {
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = _1586 + _2780;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2786 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2784;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2792 = 1.0 / _2786;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2810 = _2782 * _2792;
                    float _2812 = precise::clamp(_2810, 0.0, 1.0);
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2818 = fma(_2812, _2790, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2820 = fma(_2812, _2816, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2822 = fma(_2812, _2796, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2824 = fma(_2812, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2826 = fma(_2812, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2828 = fma(_2812, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2656 = _2818;
                    _2674 = _2826;
                    _2650 = _2822;
                    _2668 = _2824;
                    _2662 = _2820;
                    _2682 = _2828;
                    _2744 = true;
                }
                else
                {
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2674 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2668 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2662 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2744 = false;
    float _2830 = _2656;
    float _2832 = _2674;
    float _2834 = _2650;
    float _2836 = _2668;
    float _2838 = _2662;
    float _2840 = _2682;
    float _2842 = fma(_1416, -0.5, 0.5);
    float _2844 = precise::clamp(_2842, 0.0, 1.0);
    float _2846 = -_2830;
    float _2848 = _2846 + _2832;
    float _2850 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2852 = -_2834;
    float _2854 = _2852 + _2836;
    out.m_105.x = 0.0;
    float _2856 = fma(_2844, _2848, _2830);
    float _2858 = fma(_2844, _2854, _2834);
    out.m_61.x = _2850;
    float _2860 = -_2838;
    float _2862 = _2860 + _2840;
    float _2864 = _2856 * 0.586610972881317138671875;
    bool _2866 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2868 = fma(_2844, _2862, _2838);
    float _2870 = fma(_2858, 0.298911988735198974609375, _2864);
    bool _2872 = _2426 > 0.0;
    bool _2874 = isnan(_2426);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan(0.0);
    bool _2880 = _2876 || _2878;
    float _2882 = fma(_2868, 0.114477999508380889892578125, _2870);
    bool _2884 = _2480 <= 0.0;
    bool _2886 = !_2880;
    bool _2888 = _2884 || _2886;
    float _2890 = -_2882;
    float _2892 = _2858 + _2890;
    float _2894 = -_2882;
    float _2896 = _2856 + _2894;
    float _2898 = -_2882;
    float _2900 = _2868 + _2898;
    float _2902 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    float _2904 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    float _2906 = fma(_2900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    bool _2908 = !_2866;
    if (!_2908)
    {
        float _2910 = -_1532;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2914 = -_1534;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2918 = -_1536;
        float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2922 = _2912 * _2912;
        float _2924 = fma(_2916, _2916, _2922);
        float _2926 = fma(_2920, _2920, _2924);
        float _2928 = sqrt(_2926);
        float _2930 = rsqrt(_2926);
        float _2932 = -_2928;
        float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2936 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2938 = precise::clamp(_2936, 0.0, 1.0);
        float _2940 = _2916 * _2930;
        float _2942 = _2912 * _2930;
        float _2944 = abs(_2938);
        float _2946 = log2(_2944);
        float _2948 = _2920 * _2930;
        float _2950 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2952 = _1416 * _2942;
        float _2954 = -_2942;
        float _2956 = -_2950;
        float _2958 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2956);
        float _2960 = fma(_1412, _2940, _2952);
        float _2962 = -_2948;
        float _2964 = fma(_2962, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2958);
        float _2966 = fma(_1434, _2948, _2960);
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2972 = _2964 + _2970;
        float _2974 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2976 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2978 = precise::clamp(_2976, 0.0, 1.0);
        float _2980 = exp2(_2974);
        float _2982 = _2980 * _2978;
        float _2984 = _2968 * _2982;
        float _2986 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2988 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2990 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2986;
        out.m_105.y = _2988;
        out.m_105.z = _2990;
    }
    out.m_107.x = _2902;
    out.m_107.y = _2904;
    out.m_107.z = _2906;
    if (!_2888)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2992 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2992;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2744 = false;
    bool _1484 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_58.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_61.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3049 = as_type<float>(_142);
        out.gl_Position.z = _3049;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_63.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3119 = as_type<float>(_180);
        out.gl_Position.z = _3119;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_65.x;
    float _184 = in.m_65.y;
    float _186 = in.m_65.z;
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    bool _224 = _218 > 0.0;
    bool _226 = _220 > 0.0;
    float _228 = _220;
    float _230 = _212;
    if (_224)
    {
        float _232 = rsqrt(_212);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    if (!_224)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _240 = _236;
    float _242 = _238;
    bool _244 = _222 > 0.0;
    float _246 = 0.0;
    float _248 = _242;
    float _250 = _240;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _252 = _246;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _252;
    if (!_226)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = _222;
    float _266 = _262;
    float _268 = _260;
    if (_226)
    {
        float _270 = rsqrt(_214);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_226)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (!_244)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = 0.0;
    float _286 = _282;
    if (_244)
    {
        float _288 = rsqrt(_216);
        _284 = _288;
    }
    float _290 = _284;
    if (_224)
    {
        float _292 = _234 * _188;
        _258 = _292;
    }
    float _294 = _258;
    if (_224)
    {
        float _296 = _234 * _182;
        _248 = _296;
    }
    float _298 = _248;
    if (_224)
    {
        float _300 = _234 * _194;
        _250 = _300;
    }
    float _302 = _250;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _306 = 0.0;
    if (!_244)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = _308;
    if (!_244)
    {
        _230 = 0.0;
    }
    float _312 = _230;
    float _314 = _312;
    if (_226)
    {
        float _316 = _272 * _190;
        _280 = _316;
    }
    float _318 = _280;
    if (_226)
    {
        float _320 = _272 * _184;
        _266 = _320;
    }
    float _322 = _266;
    if (_226)
    {
        float _324 = _272 * _196;
        _268 = _324;
    }
    float _326 = _268;
    float _328 = _326;
    if (_244)
    {
        float _330 = _290 * _192;
        _286 = _330;
    }
    float _332 = _286;
    if (_244)
    {
        float _334 = _290 * _186;
        _310 = _334;
    }
    float _336 = _310;
    if (_244)
    {
        float _338 = _290 * _198;
        _314 = _338;
    }
    float _340 = _314;
    bool _342 = !_304;
    float _344 = _340;
    float _362;
    if (!_342)
    {
        float _346 = in.m_71.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_126);
        float _368 = 1.0 / _366;
        float _370 = _160 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_71.z;
    float _376 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _378 = log2(_376);
    float _380 = in.m_71.w;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _384 = _382 != 0;
    float _386 = in.m_58.x;
    float _388 = in.m_58.y;
    float _390 = in.m_58.z;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _398 = _396 != 0;
    float _400 = in.m_73.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_71.y;
    float _408 = _378 * _160;
    float _410 = in.m_73.x;
    float _412 = exp2(_408);
    float _414 = _374 * 2.0;
    float _416 = in.m_67.w;
    bool _418 = _380 > 0.5;
    float _420 = in.m_65.w;
    float _422 = floor(_414);
    float _424 = _190 * _388;
    float _426 = _184 * _388;
    float _428 = _196 * _388;
    float _430 = -_400;
    float _432 = _430 + 1.0;
    float _434 = in.m_75.x;
    float _436 = in.m_75.y;
    float _438 = in.m_75.z;
    float _440 = fma(_182, _386, _426);
    float _442 = _406 * 2.0;
    int _444 = _418 ? as_type<int>(_432) : as_type<int>(_400);
    float _446 = in.m_71.x;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _458 = _456 != 0;
    float _460 = fma(_188, _386, _424);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = _398 ? as_type<float>(_444) : _400;
    float _468 = -_412;
    float _470 = _468 + 1.0;
    bool _472 = _406 > 0.5;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    float _478 = 1.0 / _464;
    float _480 = fma(_194, _386, _428);
    float _482 = _400;
    if (_404)
    {
        float _484 = _472 ? _432 : _400;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = fma(_192, _390, _460);
    bool _490 = _422 >= 0.0;
    bool _492 = isnan(_422);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_186, _390, _440);
    bool _502 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _510 = _506 || _508;
    float _512 = _488 + _416;
    float _514 = 1.0 / _476;
    int _516 = _498 ? 0 : 1;
    float _518 = _436 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _522 = isnan(1.0);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _528 = _524 || _526;
    float _530 = fma(_198, _390, _480);
    float _532 = _510 ? _470 : 0.0;
    float _534 = _406 + _374;
    bool _536 = _422 > 0.0;
    float _538 = floor(_442);
    float _540 = _534 + (-1.0);
    int _542 = ~_516;
    int _544 = _542 + 1;
    int _546 = _544 + 1;
    float _548 = _446 * 2.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _552 = _546;
    if (_528)
    {
        float _554 = _532 * _514;
        _162 = _554;
    }
    float _556 = _162;
    float _558 = _446 + _374;
    float _560 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    out.m_77.w = _550;
    if (!_536)
    {
        int _562 = ~_516;
        int _564 = _562 + 1;
        _552 = _564;
    }
    int _566 = _552;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _568;
    float _572 = floor(_548);
    float _574 = in.m_79.x;
    float _576 = in.m_79.y;
    float _578 = in.m_79.z;
    bool _580 = _538 > 0.0;
    float _582 = _570 * _478;
    bool _584 = _538 >= 0.0;
    bool _586 = isnan(_538);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = _446 + _406;
    float _596 = _558 + (-1.0);
    int _598 = _592 ? 0 : 1;
    float _600 = _594 + (-1.0);
    float _602 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _604 = ~_598;
    int _606 = _604 + 1;
    int _608 = _606 + 1;
    float _610 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _614 = _608;
    float _616 = _610;
    if (!_580)
    {
        int _618 = ~_598;
        int _620 = _618 + 1;
        _614 = _620;
    }
    int _622 = _614;
    float _624 = _438 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _628 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _630 = _572 >= 0.0;
    bool _632 = isnan(_572);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = _556 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    if (!_384)
    {
        _616 = _410;
    }
    float _644 = _616;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _574);
    bool _648 = !_450;
    int _650 = _648 ? 0 : 1;
    float _652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _576);
    bool _654 = !_454;
    int _656 = _654 ? 0 : 1;
    float _658 = _646 * _640;
    bool _660 = !_458;
    int _662 = _660 ? 0 : 1;
    float _664 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _578);
    float _680 = _642 * _626;
    float _682 = _626;
    float _684 = _644;
    bool _686 = _638;
    bool _688 = _668;
    if (!_384)
    {
        _682 = _644;
    }
    float _690 = _682;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _372 + _692;
    float _696 = _690;
    if (_384)
    {
        _684 = _410;
    }
    float _698 = _684;
    float _700 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[203].x, _680);
    float _702 = _678 * _664;
    bool _704 = !_668;
    int _706 = _704 ? 0 : 1;
    float _708 = _652 * _628;
    float _710 = floor(_700);
    bool _712 = !_676;
    int _714 = _712 ? 0 : 1;
    float _716 = fma(_582, _694, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _718 = abs(_706);
    float _720 = _700 + 0.25;
    int _722 = abs(_714);
    float _724 = in.m_81.x;
    float _726 = in.m_81.y;
    float _728 = in.m_81.z;
    bool _730 = _572 > 0.0;
    float _732 = floor(_720);
    int _734 = _638 ? 0 : 1;
    float _736 = _500 + _420;
    float _738 = float(_566);
    float _740 = _406 + (-0.5);
    float _742 = float(_718);
    float _744 = float(_622);
    float _746 = -_710;
    float _748 = _700 + _746;
    float _750 = _700 * 6.283185482025146484375;
    bool _752 = !_672;
    int _754 = _752 ? 0 : 1;
    float _756 = _742 * _738;
    int _758 = abs(_656);
    float _760 = _750 * 0.15915493667125701904296875;
    int _762 = ~_734;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = _756 * (-2.0);
    float _770 = float(_722);
    float _772 = -_732;
    float _774 = _720 + _772;
    int _776 = _766;
    float _778 = _774;
    if (!_730)
    {
        int _780 = ~_734;
        int _782 = _780 + 1;
        _776 = _782;
    }
    int _784 = _776;
    float _786 = _760 * 6.283185482025146484375;
    float _788 = sin(_786);
    bool _790 = _748 >= 0.5;
    bool _792 = isnan(_748);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    float _800 = _770 * _744;
    int _802 = abs(_754);
    float _804 = _800 * (-2.0);
    bool _806 = !_798;
    int _808 = _806 ? 1056964608 : (-1090519040);
    float _810 = fma(_602, _804, _602);
    bool _812 = _774 > 0.5;
    float _814 = fma(_804, _728, _728);
    float _816 = float(_784);
    int _818 = _784;
    int _820 = _808;
    if (_394)
    {
        float _822 = -_698;
        float _824 = _822 + 1.0;
        _818 = as_type<int>(_824);
    }
    int _826 = _818;
    float _828 = float(_802);
    int _830 = abs(_650);
    if (_394)
    {
        bool _832 = _374 > 0.5;
        _686 = _832;
    }
    bool _834 = _686;
    float _836 = _828 * _816;
    float _838 = float(_758);
    float _840 = as_type<float>(_808) * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _842 = _840 * 2.0;
    float _844 = _374 + (-0.5);
    int _846 = abs(_662);
    if (_812)
    {
        float _848 = -_774;
        float _850 = _848 + 1.0;
        _778 = _850;
    }
    float _852 = _778;
    float _854 = float(_830);
    float _856 = _838 * _842;
    float _858 = _788 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _860 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].z, _814);
    float _862 = fma(_852, 4.0, -1.0);
    float _864 = _836 * (-2.0);
    float _866 = fma(_854, _858, _856);
    float _868 = float(_846);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _872 = fma(_864, _726, _726);
    float _874 = fma(_560, _864, _560);
    float _876 = fma(_810, _556, _860);
    float _878 = fma(_868, _870, _866);
    float _880 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[196].y, _872);
    float _882 = in.m_69.w;
    if (_384)
    {
        bool _884 = _446 > 0.5;
        _688 = _884;
    }
    bool _886 = _688;
    float _888 = fma(_878, 3.1415927410125732421875, _724);
    float _890 = fma(_874, _556, _880);
    float _892 = fma(_612, _768, _612);
    bool _894 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_372);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = fma(_888, _768, _888);
    bool _908 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _910 = isnan(_372);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = in.m_83.x;
    float _922 = in.m_83.y;
    float _924 = in.m_83.z;
    float _926 = _446 + (-0.5);
    float _928 = -_904;
    float _930 = _928 + 1.0;
    bool _932 = _576 != 0.0;
    bool _934 = isnan(_576);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    float _942 = _930;
    if (_384)
    {
        float _944 = -_698;
        float _946 = _944 + 1.0;
        _820 = as_type<int>(_946);
    }
    int _948 = _820;
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].x, _906);
    float _952 = _918 * _930;
    bool _954 = _574 == 0.0;
    bool _956 = !_940;
    bool _958 = _954 && _956;
    float _960 = _876 * 0.15915493667125701904296875;
    float _962 = fma(_892, _556, _950);
    float _964 = _716 * _952;
    bool _966 = _578 == 0.0;
    bool _968 = _966 && _958;
    float _970 = in.m_85.x;
    float _972 = in.m_85.y;
    float _974 = in.m_85.z;
    float _976 = in.m_85.w;
    float _978 = -_918;
    float _980 = _978 + 1.0;
    float _982 = _962 * 0.15915493667125701904296875;
    float _984 = _964;
    float _986 = _962;
    float _988 = _980;
    if (!_394)
    {
        _942 = _698;
    }
    float _990 = _942;
    float _992 = _890 * 0.15915493667125701904296875;
    float _994 = _990;
    if (_384)
    {
        float _996 = _886 ? as_type<float>(_948) : _698;
        _696 = _996;
    }
    float _998 = _696;
    float _1000 = _960 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    if (_394)
    {
        float _1004 = _834 ? as_type<float>(_826) : _698;
        _994 = _1004;
    }
    float _1006 = _994;
    float _1008 = _530 + _882;
    float _1010 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[115].x, _964);
    float _1012 = _882;
    float _1014 = _920;
    if (_968)
    {
        _1012 = _922;
    }
    float _1016 = _1012;
    float _1018 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1010);
    float _1020 = _960 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _1016;
    if (_968)
    {
        _984 = _920;
    }
    float _1026 = _984;
    float _1028 = _1026;
    if (_968)
    {
        _986 = _1016;
    }
    float _1030 = _986;
    float _1032 = _1030;
    if (_968)
    {
        _988 = _1026;
    }
    float _1034 = _988;
    float _1036 = _1034;
    if (!_968)
    {
        _1024 = _922;
    }
    float _1038 = _1024;
    float _1040 = _982 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    if (!_968)
    {
        _1028 = _920;
    }
    float _1044 = _1028;
    if (_968)
    {
        _1014 = _924;
    }
    float _1046 = _1014;
    float _1048 = _1046;
    if (!_968)
    {
        float _1050 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1032 = _1050;
    }
    float _1052 = _1032;
    float _1054 = _972 * _924;
    float _1056 = _974 * _1044;
    if (!_968)
    {
        float _1058 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1044);
        _1036 = _1058;
    }
    float _1060 = _1036;
    float _1062 = _982 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = _970 * _1038;
    if (!_968)
    {
        float _1068 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _924);
        _1048 = _1068;
    }
    float _1070 = _1048;
    float _1072 = -_1056;
    float _1074 = fma(_970, _924, _1072);
    float _1076 = -_1054;
    float _1078 = fma(_974, _1038, _1076);
    float _1080 = -_1066;
    float _1082 = fma(_972, _1044, _1080);
    float _1084 = _992 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = _1042 * _1002;
    float _1090 = _992 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1064 * _1022;
    float _1096 = _1064 * _1002;
    float _1098 = _1002 * _1086;
    float _1100 = _1042 * _1022;
    float _1102 = _1022 * _1086;
    float _1104 = _1042 * _1086;
    float _1106 = _1064 * _1086;
    float _1108 = _1104 * _708;
    float _1110 = fma(_1092, _1088, _1094);
    float _1112 = -_1096;
    float _1114 = fma(_1092, _1100, _1112);
    float _1116 = -_1100;
    float _1118 = fma(_1092, _1096, _1116);
    float _1120 = fma(_1092, _1094, _1088);
    float _1122 = _1110 * _708;
    float _1124 = _1114 * _708;
    float _1126 = -_1092;
    float _1128 = fma(_1126, _658, _1108);
    float _1130 = _1074 * _976;
    float _1132 = fma(_1098, _658, _1122);
    float _1134 = fma(_1102, _658, _1124);
    float _1136 = _1078 * _976;
    float _1138 = _1082 * _976;
    float _1140 = fma(_1118, _702, _1132);
    float _1142 = fma(_1120, _702, _1134);
    float _1144 = fma(_1106, _702, _1128);
    float _1146 = _1104 * _1052;
    float _1148 = _1140 * _318;
    float _1150 = _1140 * _326;
    float _1152 = _1104 * _972;
    float _1154 = _1104 * _1130;
    float _1156 = fma(_1142, _294, _1148);
    float _1158 = fma(_1142, _302, _1150);
    float _1160 = _1110 * _1052;
    float _1162 = _1114 * _972;
    float _1164 = fma(_1144, _332, _1156);
    float _1166 = fma(_1144, _340, _1158);
    float _1168 = _1110 * _972;
    float _1170 = _1114 * _1130;
    float _1172 = _512 + _1164;
    float _1174 = _1008 + _1166;
    float _1176 = _1114 * _1052;
    float _1178 = _1110 * _1130;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1182 = _1172 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1174 + _1184;
    float _1188 = -_1092;
    float _1190 = fma(_1188, _1060, _1146);
    float _1192 = fma(_1102, _1060, _1176);
    float _1194 = _1182 * _1182;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1098, _1060, _1160);
    float _1200 = -_1092;
    float _1202 = fma(_1200, _970, _1152);
    float _1204 = -_1092;
    float _1206 = fma(_1204, _1136, _1154);
    float _1208 = _1194 + _1196;
    float _1210 = fma(_1102, _1136, _1170);
    float _1212 = fma(_1098, _970, _1168);
    float _1214 = fma(_1098, _1136, _1178);
    float _1216 = sqrt(_1208);
    float _1218 = _1140 * _322;
    float _1220 = fma(_1102, _970, _1162);
    float _1222 = fma(_1106, _1070, _1190);
    float _1224 = fma(_1120, _1070, _1192);
    float _1226 = fma(_1118, _1070, _1198);
    float _1228 = fma(_1106, _1138, _1206);
    float _1230 = fma(_1120, _1138, _1210);
    float _1232 = fma(_1118, _974, _1212);
    float _1234 = fma(_1118, _1138, _1214);
    float _1236 = fma(_1106, _974, _1202);
    float _1238 = fma(_1120, _974, _1220);
    float _1240 = fma(_1142, _298, _1218);
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1244 = _1232 * _318;
    float _1246 = _1226 * _318;
    bool _1248 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = fma(_1144, _336, _1240);
    float _1252 = _1234 * _318;
    float _1254 = fma(_1238, _294, _1244);
    float _1256 = _1232 * _322;
    float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1260 = _736 + _1250;
    float _1262 = _1232 * _326;
    float _1264 = _1226 * _322;
    float _1266 = _1234 * _322;
    float _1268 = _1226 * _326;
    float _1270 = _1234 * _326;
    float _1272 = fma(_1238, _298, _1256);
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1276 = fma(_1238, _302, _1262);
    float _1278 = _1144;
    float _1280 = _1250;
    float _1282 = _1194;
    float _1284 = _1196;
    float _1286 = _1256;
    int _1288 = as_type<int>(_1214);
    int _1290 = as_type<int>(_1146);
    if (!_1248)
    {
        _328 = _1172;
    }
    float _1292 = _328;
    float _1294 = _1292;
    if (!_1248)
    {
        _1278 = _1174;
    }
    float _1296 = _1278;
    float _1298 = _1296;
    if (!_1248)
    {
        _1280 = _1260;
    }
    float _1300 = _1280;
    bool _1302 = !_1248;
    float _1304 = _1300;
    if (!_1302)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1310 = _1216 + _1308;
        float _1312 = rsqrt(_1208);
        float _1314 = _1310 * _1306;
        float _1316 = _1260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = _1314 * 0.15915493667125701904296875;
        float _1320 = _1318 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = fma(_1322, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1330 = _1312 * _1328;
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1182, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1336 = fma(_1186, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1338 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1342 = _1334 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1346 = _1336 + _1344;
        float _1348 = fma(_1260, _1326, _1338);
        float _1350 = _1342 * _1342;
        float _1352 = _1346 * _1346;
        _1304 = _1348;
        _1282 = _1350;
        _1284 = _1352;
        _1294 = _1334;
        _1298 = _1336;
    }
    float _1354 = _1304;
    float _1356 = _1282;
    float _1358 = _1284;
    float _1360 = _1294;
    float _1362 = _1298;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1366 = _1354 + _1364;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1370 = fma(_1224, _294, _1246);
    float _1372 = fma(_1230, _294, _1252);
    float _1374 = fma(_1366, _1366, _1356);
    float _1376 = fma(_1224, _298, _1264);
    float _1378 = fma(_1230, _298, _1266);
    float _1380 = _998 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = _1374 + _1358;
    float _1384 = _486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1386 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1388 = sqrt(_1382);
    float _1390 = fma(_1224, _302, _1268);
    float _1392 = fma(_1230, _302, _1270);
    float _1394 = _466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1402 = _1384 * _1258;
    float _1404 = _1380 * _1242;
    float _1406 = _1386 * _1368;
    float _1408 = fma(_1236, _332, _1254);
    float _1410 = fma(_1236, _336, _1272);
    float _1412 = fma(_1222, _332, _1370);
    float _1414 = fma(_1228, _332, _1372);
    float _1416 = fma(_1222, _336, _1376);
    float _1418 = _1394 * _1274;
    float _1420 = fma(_1236, _340, _1276);
    float _1422 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1430 = fma(_1228, _336, _1378);
    float _1432 = fma(_1228, _340, _1392);
    float _1434 = fma(_1222, _340, _1390);
    out.m_87.x = _1404;
    out.m_87.y = _1402;
    out.m_87.z = _1406;
    out.m_87.w = _1418;
    bool _1436 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1388);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_89.x = _1422;
    out.m_89.y = _1424;
    out.m_89.z = _1426;
    out.m_89.w = _1428;
    out.m_91.x = _1408;
    out.m_91.y = _1410;
    out.m_91.z = _1420;
    out.m_93.x = _1414;
    out.m_93.y = _1430;
    out.m_93.z = _1432;
    float _1446 = _1394;
    float _1448 = _1360;
    if (!_1444)
    {
        _344 = 1.0;
    }
    float _1450 = _344;
    out.m_95.x = _1412;
    out.m_95.y = _1416;
    out.m_95.z = _1434;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1388);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1388 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1388);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1388 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = _736 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1520 = _1354 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1524 = _1360 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1528 = _1362 + _1526;
    float _1530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1516);
    float _1532 = fma(_1520, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1534 = fma(_1524, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1536 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1538 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1530);
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1542 = _1532 + _1540;
    float _1544 = _736 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1552 = _1542 * _1542;
    float _1554 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1544);
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1536 + _1556;
    float _1560 = 1.0 / _1550;
    float _1562 = fma(_1548, _1548, _1552);
    float _1564 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1554);
    float _1566 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1568 = fma(_1558, _1558, _1562);
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1572 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1566);
    float _1574 = rsqrt(_1568);
    float _1576 = _1570 + _1550;
    float _1578 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1580 = _736 + _1578;
    float _1582 = _1576 * _1560;
    float _1584 = _1582 * 0.5;
    float _1586 = sqrt(_1568);
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1592 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1590);
    float _1594 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1588);
    float _1596 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1598 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1600 = 1.0 / _1592;
    float _1602 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1594);
    float _1604 = _1548 * _1598;
    float _1606 = _1558 * _1598;
    float _1608 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1610 = _1604 * _1604;
    float _1612 = _1606 * _1606;
    float _1614 = trunc(_1608);
    int _1616 = int(_1614);
    float _1618 = _1610 + _1612;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1622 = _1600 * _1620;
    float _1624 = sqrt(_1618);
    float _1626 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1628 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1630 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1626);
    bool _1632 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1634 = floor(_1596);
    float _1636 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1630);
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1640 = !_1628;
    int _1642 = _1640 ? 0 : 1;
    bool _1644 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = trunc(_1638);
    int _1648 = int(_1646);
    int _1650 = 2;
    int _1652 = as_type<int>(_1542);
    float _1654 = _1604;
    float _1656 = _1606;
    float _1658 = _1610;
    float _1660 = _1572;
    float _1662 = _1580;
    if (!_1628)
    {
        _1650 = 1;
    }
    int _1664 = _1650;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1624 + _1666;
    int _1670 = _1664;
    float _1672 = _1668;
    if (!_1632)
    {
        _1670 = _1642;
    }
    int _1674 = _1670;
    int _1676 = _1674 << 6;
    float _1678 = -_1634;
    float _1680 = _1596 + _1678;
    int _1682 = _1676 + 96;
    uint _1685 = uint(int(uint(_1682) >> uint(2)));
    uint _1687 = uint(int(uint(int(_1685)) >> uint(2)));
    int _1689 = int(_1685) & 3;
    float _1691 = (*spvDescriptorSet0.vp_c15)._m0[int(_1687)][_1689];
    int _1693 = int(_1685) + 1;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    int _1697 = _1693 & 3;
    float _1699 = (*spvDescriptorSet0.vp_c15)._m0[int(_1695)][_1697];
    float _1701 = _1428;
    float _1703 = as_type<float>(_1674);
    if (_1644)
    {
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1705;
    }
    float _1707 = _1701;
    if (!_1644)
    {
        _1286 = _1612;
    }
    float _1709 = _1286;
    int _1711 = _1676 + 104;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    uint _1715 = uint(int(uint(int(_1713)) >> uint(2)));
    int _1717 = int(_1713) & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    int _1721 = int(_1713) + 1;
    uint _1723 = uint(int(uint(_1721) >> uint(2)));
    int _1725 = _1721 & 3;
    float _1727 = (*spvDescriptorSet0.vp_c15)._m0[int(_1723)][_1725];
    float _1729 = _1709;
    if (_1644)
    {
        float _1731 = _1668 * _1707;
        _1672 = _1731;
    }
    float _1733 = _1672;
    int _1735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1737 = _1616 + _1735;
    int _1739 = _1737 + 1;
    float _1741 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1644)
    {
        float _1743 = _1733 * 0.15915493667125701904296875;
        _1446 = _1743;
    }
    float _1745 = _1446;
    int _1747 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1749 = _1648 + _1747;
    int _1751 = _1749 + 1;
    float _1753 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    if (_1644)
    {
        float _1755 = _1745 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        _1448 = _1757;
    }
    float _1759 = _1448;
    bool _1761 = _1751 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1763 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    int _1765 = _1751 | _1739;
    float _1767 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1769 = _1765 < 0;
    bool _1771 = _1769 || _1761;
    float _1773 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1775 = _1432;
    if (_1644)
    {
        float _1777 = _1745 * 6.283185482025146484375;
        float _1779 = cos(_1777);
        _1775 = _1779;
    }
    float _1781 = _1775;
    float _1783 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1785 = _1739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1787 = _1785 || _1771;
    float _1789 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = precise::max(0.0, _1773);
    float _1793 = -_1789;
    float _1795 = fma(_1793, _1783, 1.0);
    float _1797 = _1763;
    float _1799 = _1783;
    if (_1644)
    {
        float _1801 = rsqrt(_1618);
        _1797 = _1801;
    }
    float _1803 = _1797;
    float _1805 = -_1598;
    float _1807 = -_1791;
    float _1809 = fma(_1542, _1805, _1807);
    float _1811 = _1809;
    if (_1644)
    {
        float _1813 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1813;
    }
    float _1815 = _1799;
    float _1817 = _1580 * _1699;
    float _1819 = _1699;
    float _1821 = _1815;
    if (!_1787)
    {
        int _1823 = _1739 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1825 = _1823 + _1751;
        _1652 = _1825;
    }
    int _1827 = _1652;
    float _1829 = as_type<float>(_1827);
    if (_1644)
    {
        float _1831 = _1781 + (-1.0);
        _1819 = _1831;
    }
    float _1833 = _1819;
    float _1835 = _1833;
    if (_1644)
    {
        float _1837 = fma(_1759, _1815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1821 = _1837;
    }
    float _1839 = _1821;
    int _1841 = _1676 + 48;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    float _1859 = fma(_512, _1691, _1817);
    if (_1644)
    {
        float _1861 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1835 = _1861;
    }
    float _1863 = _1835;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1867 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1865);
    float _1869 = precise::clamp(_1867, 0.0, 1.0);
    if (!_1787)
    {
        int _1871 = _1827 << 2;
        _1288 = _1871;
    }
    int _1873 = _1288;
    float _1875 = fma(_1008, _1719, _1859);
    float _1877 = _1803;
    int _1879 = _1873;
    if (_1644)
    {
        float _1881 = _1803 * _1839;
        _1877 = _1881;
    }
    float _1883 = _1877;
    if (_1644)
    {
        float _1885 = fma(_1809, _1781, _1863);
        _1811 = _1885;
    }
    float _1887 = _1811;
    int _1889 = _1676 + 64;
    uint _1891 = uint(int(uint(_1889) >> uint(2)));
    uint _1893 = uint(int(uint(int(_1891)) >> uint(2)));
    int _1895 = int(_1891) & 3;
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[int(_1893)][_1895];
    int _1899 = int(_1891) + 1;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    int _1903 = _1899 & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    if (_1644)
    {
        float _1907 = _1604 * _1883;
        _1654 = _1907;
    }
    float _1909 = _1654;
    if (_1644)
    {
        float _1911 = _1606 * _1883;
        _1656 = _1911;
    }
    float _1913 = _1656;
    float _1915 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1644)
    {
        float _1919 = _1909 * _1909;
        _1658 = _1919;
    }
    float _1921 = _1658;
    float _1923 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1925 = _1676 + 56;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    uint _1929 = uint(int(uint(int(_1927)) >> uint(2)));
    int _1931 = int(_1927) & 3;
    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[int(_1929)][_1931];
    int _1935 = int(_1927) + 1;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    int _1939 = _1935 & 3;
    float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
    if (_1644)
    {
        float _1943 = _1913 * _1913;
        _1729 = _1943;
    }
    float _1945 = _1729;
    float _1947 = fma(_1887, _1887, _1921);
    float _1949 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1915);
    float _1951 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1917);
    float _1953 = -_1869;
    float _1955 = _1953 + 1.0;
    float _1957 = _1947 + _1945;
    float _1959 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1949);
    int _1961 = _1676 + 72;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    uint _1965 = uint(int(uint(int(_1963)) >> uint(2)));
    int _1967 = int(_1963) & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    int _1971 = int(_1963) + 1;
    uint _1973 = uint(int(uint(_1971) >> uint(2)));
    int _1975 = _1971 & 3;
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[int(_1973)][_1975];
    float _1979 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1951);
    if (!_1787)
    {
        uint _1981 = uint(int(uint(_1827) >> uint(2)));
        _1290 = int(_1981);
    }
    int _1983 = _1290;
    float _1985 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1787)
    {
        int _1987 = 12 & _1873;
        _1879 = _1987;
    }
    int _1989 = _1879;
    float _1991 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1993 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1572);
    float _1995 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1997 = _1676 + 80;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c15)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
    float _2015 = _1875 + _1727;
    if (!_1787)
    {
        int _2017 = _1983 << 4;
        int _2019 = _2017 + _1989;
        _1660 = as_type<float>(_2019);
    }
    float _2021 = _1660;
    float _2023 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1995);
    float _2025 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2027 = rsqrt(_1957);
    float _2029 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    int _2031 = _1676 + 88;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    uint _2035 = uint(int(uint(int(_2033)) >> uint(2)));
    int _2037 = int(_2033) & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    int _2041 = int(_2033) + 1;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    int _2045 = _2041 & 3;
    float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
    float _2049 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2029);
    float _2051 = 1.0 / _2015;
    float _2053 = _1580 * _1857;
    float _2055 = _2021;
    if (!_1787)
    {
        int _2057 = as_type<int>(_2021) + 400;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
        int _2063 = int(_2059) & 3;
        float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
        _2055 = _2065;
    }
    float _2067 = _2055;
    float _2069 = fma(_512, _1849, _2053);
    float _2071 = _2027 * _1909;
    float _2073 = abs(_1955);
    float _2075 = log2(_2073);
    float _2077 = _2027 * _1887;
    float _2079 = _1580 * _1905;
    float _2081 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2083 = _2027 * _1913;
    float _2085 = fma(_512, _1897, _2079);
    float _2087 = 1.0 / _2049;
    float _2089 = fma(_1008, _1933, _2069);
    float _2091 = _2089 + _1941;
    float _2093 = -_2081;
    float _2095 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2093);
    float _2097 = _1941;
    float _2099 = _2071;
    if (!_1787)
    {
        float _2101 = floor(_1608);
        _2097 = _2101;
    }
    float _2103 = _2097;
    float _2105 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2107 = fma(_1008, _1969, _2085);
    float _2109 = _2091 * _2051;
    float _2111 = -_2083;
    float _2113 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2095);
    float _2115 = _2107 + _1977;
    bool _2117 = _2109 >= 0.0;
    float _2119 = fma(_2113, -0.5, 0.5);
    float _2121 = _2115 * _2051;
    float _2123 = _1580 * _2013;
    bool _2125 = _2109 <= 1.0;
    bool _2127 = _2125 && _2117;
    float _2129 = fma(_2113, 0.5, 0.5);
    float _2131 = fma(_512, _2005, _2123);
    bool _2133 = _2121 >= 0.0;
    bool _2135 = _2133 && _2127;
    float _2137 = exp2(_2105);
    if (!_1787)
    {
        float _2139 = -_2103;
        float _2141 = _1608 + _2139;
        _2099 = _2141;
    }
    float _2143 = _2099;
    float _2145 = fma(_1008, _2039, _2131);
    bool _2147 = _2121 <= 1.0;
    bool _2149 = _2147 && _2135;
    float _2151 = fma(_2129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2153 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2155 = _2145 + _2047;
    float _2157 = fma(_2129, _2151, -0.212114393711090087890625);
    float _2159 = sqrt(_2119);
    float _2161 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2163 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2153);
    float _2165 = fma(_2129, _2157, 1.570728778839111328125);
    float _2167 = _2077 + 1.0;
    float _2169 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2161);
    float _2171 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2163);
    float _2173 = _2165;
    if (_2149)
    {
        float _2175 = float(_1674);
        _1703 = _2175;
    }
    float _2177 = _1703;
    float _2179 = log2(_1795);
    float _2181 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2169);
    float _2183 = -_2077;
    float _2185 = fma(_2137, _2167, _2183);
    float _2187 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2171);
    float _2189 = _2155 * _2051;
    float _2191 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2181);
    float _2193 = _2187 * _2087;
    float _2195 = floor(_1923);
    float _2197 = _2159 * 0.636619746685028076171875;
    float _2199 = _2191 * _2087;
    float _2201 = fma(_2193, 0.5, 0.5);
    float _2203 = -_2165;
    float _2205 = fma(_2197, _2203, 1.0);
    float _2207 = _2083;
    float _2209 = _2187;
    float _2211 = _2191;
    if (!_1787)
    {
        float _2213 = floor(_1638);
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = _2179 * 0.693147182464599609375;
    float _2219 = _2039;
    if (!_1787)
    {
        float _2221 = rint(_2067);
        float _2223 = precise::max(_2221, 0.0);
        uint _2225 = uint(_2223);
        uint _2227 = clamp(_2225, 0u, 65535u);
        _2219 = as_type<float>(_2227);
    }
    float _2229 = _2219;
    float _2231 = -_2195;
    float _2233 = _1923 + _2231;
    float _2235 = fma(_2199, -0.5, 0.5);
    float _2237 = fma(_2185, 0.5, 0.5);
    float _2239 = _2169;
    if (_2149)
    {
        float _2241 = rint(_2177);
        float _2243 = precise::max(_2241, 0.0);
        uint _2245 = uint(_2243);
        uint _2247 = clamp(_2245, 0u, 65535u);
        _2239 = as_type<float>(_2247);
    }
    float _2249 = _2239;
    if (!_1787)
    {
        float _2251 = -_2215;
        float _2253 = _1638 + _2251;
        _2173 = _2253;
    }
    float _2255 = _2173;
    float _2257 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6391 = float2(_2233, _1680);
    float _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6391, float2(0.0), isnan(_6391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6391, float2(0.0), isnan(_6391)), level(0.0)).x;
    float _2261 = _2217;
    if (!_1787)
    {
        float3 _6408 = float3(_2255, _2143, float(as_type<int>(_2229)));
        float3 _6412 = select(_6408, float3(0.0), isnan(_6408));
        float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6412.xy, uint(rint(_6412.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6412.xy, uint(rint(_6412.z)), level(0.0)).x;
        _2261 = _2263;
    }
    float _2265 = _2261;
    float _2267 = _2121;
    if (_2149)
    {
        float3 _6427 = float3(_2109, _2121, float(as_type<int>(_2249)));
        float3 _6429 = select(_6427, float3(0.0), isnan(_6427));
        float _2269 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6429.xy, uint(rint(_6429.z)), _2189, level(0.0));
        _2267 = _2269;
    }
    float _2271 = _2267;
    float3 _6439 = float3(_2201, _2235, _2257);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6439, float3(0.0), isnan(_6439)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6439, float3(0.0), isnan(_6439)), level(0.0)).x;
    float3 _6448 = float3(_2201, _2235, _2257);
    float4 _2276 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6448, float3(0.0), isnan(_6448)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6448, float3(0.0), isnan(_6448)), level(0.0)).xyzw;
    float _2278 = _2276.x;
    float _2280 = _2276.y;
    float _2282 = _2276.z;
    float _2284 = _2276.w;
    float2 _6464 = float2(_2205, _2237);
    float3 _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6464, float2(0.0), isnan(_6464)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6464, float2(0.0), isnan(_6464)), level(0.0)).xyz;
    float _2290 = _2288.x;
    float _2292 = _2288.y;
    float _2294 = _2288.z;
    float _2296 = abs(_1622);
    float _2298 = log2(_2296);
    float _2300 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2302 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2304 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2300);
    float _2306 = _2187 + _2049;
    float _2308 = exp2(_2302);
    float _2310 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2312 = _2049 * 0.5;
    float _2314 = _2306 * 0.5;
    float _2316 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2310);
    float _2318 = fma(_2191, -0.5, _2312);
    float _2320 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2322 = _2316 + _2049;
    out.gl_Position.x = _2187;
    out.gl_Position.y = _2191;
    out.gl_Position.z = _2316;
    out.gl_Position.w = _2049;
    float _2324 = _2322 * 0.5;
    float _2326 = exp2(_2320);
    bool _2328 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(0.5);
    bool _2336 = _2332 || _2334;
    out.m_97.x = _2314;
    out.m_97.y = _2318;
    out.m_97.z = _2324;
    out.m_97.w = _2049;
    if (_2336)
    {
        _2209 = 1.0;
    }
    float _2338 = _2209;
    float _2340 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = _2338;
    if (_2336)
    {
        _2211 = 1.0;
    }
    float _2346 = _2211;
    float _2348 = fma(_2342, -2.0, 3.0);
    float _2350 = _2342 * _2342;
    float _2352 = _2350 * _2348;
    bool _2354 = _1622 <= 8000.0;
    bool _2356 = isnan(_1622);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(8000.0);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    float _2366 = -_2352;
    float _2368 = _2366 + 1.0;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2352);
    float _2372 = _2364 * _2370;
    float _2374 = _2346;
    float _2376 = _2372;
    if (!_2336)
    {
        float _2378 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2382 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2380;
        float _2384 = _2378 * 0.15915493667125701904296875;
        float _2386 = _2384 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        float _2390 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2392 = _2390 * 0.15915493667125701904296875;
        float _2394 = _2384 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = 1.0 / _2388;
        float _2400 = _2392 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        float _2404 = _2396 * _2398;
        float _2406 = _2392 * 6.283185482025146484375;
        float _2408 = sin(_2406);
        float _2410 = _2402 * _2404;
        float _2412 = 1.0 / _2382;
        float _2414 = 1.0 / _2410;
        float _2416 = _2408 * _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2420 = fma(_1622, _2416, _2418);
        float _2422 = _2420 * _2412;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        _2374 = _2424;
    }
    float _2426 = _2374;
    if (!_2336)
    {
        float _2428 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2430 * 6.283185482025146484375;
        float _2434 = cos(_2432);
        float _2436 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2438 = _2436 * 0.15915493667125701904296875;
        float _2440 = _2430 * 6.283185482025146484375;
        float _2442 = sin(_2440);
        float _2444 = 1.0 / _2434;
        float _2446 = _2438 * 6.283185482025146484375;
        float _2448 = cos(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = _2438 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = _2448 * _2450;
        float _2458 = 1.0 / _2456;
        float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2462 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2460;
        float _2464 = 1.0 / _2462;
        float _2466 = _2454 * _2458;
        float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2470 = fma(_1622, _2466, _2468);
        float _2472 = _2470 * _2464;
        float _2474 = precise::clamp(_2472, 0.0, 1.0);
        float _2476 = -_2474;
        float _2478 = _2476 + 1.0;
        _2344 = _2478;
    }
    float _2480 = _2344;
    float _2482 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2484 = -_2259;
    float _2486 = _2484 + 1.0;
    float _2488 = -_2308;
    float _2490 = _2488 + 1.0;
    float _2492 = _2482;
    if (!_2149)
    {
        _2376 = 1.0;
    }
    float _2494 = _2376;
    float _2496 = _2486 * _2482;
    float _2498 = precise::clamp(_2496, 0.0, 1.0);
    float _2500 = _2494;
    if (_2149)
    {
        bool _2502 = _2271 >= _2189;
        bool _2504 = isnan(_2271);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan(_2189);
        bool _2510 = _2506 || _2508;
        float _2512 = float(_2510);
        _2500 = _2512;
    }
    float _2514 = _2500;
    float _2516 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2518 = _2516;
    if (_1787)
    {
        _2492 = 1.0;
    }
    float _2520 = _2492;
    float _2522 = _2520;
    if (!_1787)
    {
        int _2524 = _1827 << 4;
        int _2526 = _2524 + 2048;
        uint _2528 = uint(int(uint(_2526) >> uint(2)));
        uint _2530 = uint(int(uint(int(_2528)) >> uint(2)));
        int _2532 = int(_2528) & 3;
        float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
        int _2536 = int(_2528) + 1;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        int _2540 = _2536 & 3;
        float _2542 = (*spvDescriptorSet0.vp_c15)._m0[int(_2538)][_2540];
        int _2544 = _2526 + 8;
        uint _2546 = uint(int(uint(_2544) >> uint(2)));
        uint _2548 = uint(int(uint(int(_2546)) >> uint(2)));
        int _2550 = int(_2546) & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        int _2554 = int(_2546) + 1;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        int _2558 = _2554 & 3;
        float _2560 = (*spvDescriptorSet0.vp_c15)._m0[int(_2556)][_2558];
        float _2562 = _1580 * _2542;
        float _2564 = fma(_512, _2534, _2562);
        float _2566 = fma(_1008, _2552, _2564);
        float _2568 = _2566 + _2560;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = -_2570;
        float _2574 = _2572 + _2265;
        float _2576 = fma(_2574, 500.0, 1.5);
        float _2578 = exp2(_2576);
        float _2580 = 0.0 + _2578;
        float _2582 = precise::clamp(_2580, 0.0, 1.0);
        _2522 = _2582;
        _1829 = as_type<float>(_2526);
        _1662 = _2578;
    }
    float _2584 = _2522;
    float _2586 = _1829;
    float _2588 = _1662;
    float _2590 = _2514 * _2584;
    float _2592 = _2516 * _2273;
    float _2594 = -_2498;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2598 = -_2516;
    float _2600 = _2598 + 1.0;
    out.m_99.x = _1534;
    out.m_99.y = _1532;
    out.m_99.z = _1536;
    float _2602 = _2284 * _2592;
    float _2604 = -_2590;
    float _2606 = fma(_2604, _2596, 1.0);
    float _2608 = precise::clamp(_2606, 0.0, 1.0);
    float _2610 = _2294 * _2592;
    float _2612 = _2284 * _2600;
    float _2614 = fma(_2290, _2602, _2278);
    float _2616 = fma(_2292, _2602, _2280);
    float _2618 = _2608 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2620 = fma(_2284, _2610, _2282);
    bool _2622 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2624 = isnan(_1586);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2630 = _2626 || _2628;
    float _2632 = _2426 * _2480;
    out.m_101.x = _2618;
    float _2634 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2614;
    out.m_103.y = _2616;
    out.m_103.z = _2620;
    out.m_103.w = _2612;
    float _2636 = _2586;
    float _2638 = _2588;
    float _2640 = _2600;
    float _2642 = _2608;
    float _2644 = _2602;
    if (!_2630)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2646 = _2518;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2630)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2652 = _2636;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2630)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2658 = _2638;
    float _2660 = _2658;
    float _2662 = _2658;
    if (!_2630)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2664 = _2640;
    float _2666 = _2664;
    float _2668 = _2664;
    if (!_2630)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2670 = _2642;
    float _2672 = _2670;
    float _2674 = _2670;
    if (!_2630)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2676 = _2644;
    bool _2678 = !_2630;
    float _2680 = _2676;
    float _2682 = _2676;
    if (!_2678)
    {
        bool _2684 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2686 = isnan(_1586);
        bool _2688 = _2684 || _2686;
        bool _2690 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2692 = _2688 || _2690;
        if (!_2692)
        {
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = _1586 + _2694;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2700 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2698;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2706 = 1.0 / _2700;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2724 = _2696 * _2706;
            float _2726 = precise::clamp(_2724, 0.0, 1.0);
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2732 = fma(_2726, _2704, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2734 = fma(_2726, _2730, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2736 = fma(_2726, _2710, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2738 = fma(_2726, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2740 = fma(_2726, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2742 = fma(_2726, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2656 = _2732;
            _2674 = _2740;
            _2650 = _2736;
            _2668 = _2738;
            _2662 = _2734;
            _2682 = _2742;
            _2744 = true;
        }
        else
        {
            bool _2746 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2748 = isnan(_1586);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2754 = _2750 || _2752;
            if (!_2754)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2756 = _2648;
            _2650 = _2756;
            if (!_2754)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2758 = _2654;
            _2656 = _2758;
            if (!_2754)
            {
                _2660 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2760 = _2660;
            _2662 = _2760;
            if (!_2754)
            {
                _2666 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2762 = _2666;
            _2668 = _2762;
            if (!_2754)
            {
                _2672 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2764 = _2672;
            _2674 = _2764;
            if (!_2754)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2766 = _2680;
            bool _2768 = !_2754;
            _2682 = _2766;
            if (!_2768)
            {
                bool _2770 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2772 = isnan(_1586);
                bool _2774 = _2770 || _2772;
                bool _2776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2778 = _2774 || _2776;
                if (!_2778)
                {
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = _1586 + _2780;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2786 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2784;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2792 = 1.0 / _2786;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2810 = _2782 * _2792;
                    float _2812 = precise::clamp(_2810, 0.0, 1.0);
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2818 = fma(_2812, _2790, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2820 = fma(_2812, _2816, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2822 = fma(_2812, _2796, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2824 = fma(_2812, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2826 = fma(_2812, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2828 = fma(_2812, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2656 = _2818;
                    _2674 = _2826;
                    _2650 = _2822;
                    _2668 = _2824;
                    _2662 = _2820;
                    _2682 = _2828;
                    _2744 = true;
                }
                else
                {
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2674 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2668 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2662 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2744 = false;
    float _2830 = _2656;
    float _2832 = _2674;
    float _2834 = _2650;
    float _2836 = _2668;
    float _2838 = _2662;
    float _2840 = _2682;
    float _2842 = fma(_1416, -0.5, 0.5);
    float _2844 = precise::clamp(_2842, 0.0, 1.0);
    float _2846 = -_2830;
    float _2848 = _2846 + _2832;
    float _2850 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2852 = -_2834;
    float _2854 = _2852 + _2836;
    out.m_105.x = 0.0;
    float _2856 = fma(_2844, _2848, _2830);
    float _2858 = fma(_2844, _2854, _2834);
    out.m_61.x = _2850;
    float _2860 = -_2838;
    float _2862 = _2860 + _2840;
    float _2864 = _2856 * 0.586610972881317138671875;
    bool _2866 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2868 = fma(_2844, _2862, _2838);
    float _2870 = fma(_2858, 0.298911988735198974609375, _2864);
    bool _2872 = _2426 > 0.0;
    bool _2874 = isnan(_2426);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan(0.0);
    bool _2880 = _2876 || _2878;
    float _2882 = fma(_2868, 0.114477999508380889892578125, _2870);
    bool _2884 = _2480 <= 0.0;
    bool _2886 = !_2880;
    bool _2888 = _2884 || _2886;
    float _2890 = -_2882;
    float _2892 = _2858 + _2890;
    float _2894 = -_2882;
    float _2896 = _2856 + _2894;
    float _2898 = -_2882;
    float _2900 = _2868 + _2898;
    float _2902 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    float _2904 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    float _2906 = fma(_2900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    bool _2908 = !_2866;
    if (!_2908)
    {
        float _2910 = -_1532;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2914 = -_1534;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2918 = -_1536;
        float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2922 = _2912 * _2912;
        float _2924 = fma(_2916, _2916, _2922);
        float _2926 = fma(_2920, _2920, _2924);
        float _2928 = sqrt(_2926);
        float _2930 = rsqrt(_2926);
        float _2932 = -_2928;
        float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2936 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2938 = precise::clamp(_2936, 0.0, 1.0);
        float _2940 = _2916 * _2930;
        float _2942 = _2912 * _2930;
        float _2944 = abs(_2938);
        float _2946 = log2(_2944);
        float _2948 = _2920 * _2930;
        float _2950 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2952 = _1416 * _2942;
        float _2954 = -_2942;
        float _2956 = -_2950;
        float _2958 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2956);
        float _2960 = fma(_1412, _2940, _2952);
        float _2962 = -_2948;
        float _2964 = fma(_2962, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2958);
        float _2966 = fma(_1434, _2948, _2960);
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2972 = _2964 + _2970;
        float _2974 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2976 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2978 = precise::clamp(_2976, 0.0, 1.0);
        float _2980 = exp2(_2974);
        float _2982 = _2980 * _2978;
        float _2984 = _2968 * _2982;
        float _2986 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2988 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2990 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2986;
        out.m_105.y = _2988;
        out.m_105.z = _2990;
    }
    out.m_107.x = _2902;
    out.m_107.y = _2904;
    out.m_107.z = _2906;
    if (!_2888)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2992 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2992;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2744 = false;
    bool _1484 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_58.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_61.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3049 = as_type<float>(_142);
        out.gl_Position.z = _3049;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_63.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3119 = as_type<float>(_180);
        out.gl_Position.z = _3119;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_65.x;
    float _184 = in.m_65.y;
    float _186 = in.m_65.z;
    float _188 = in.m_67.x;
    float _190 = in.m_67.y;
    float _192 = in.m_67.z;
    float _194 = in.m_69.x;
    float _196 = in.m_69.y;
    float _198 = in.m_69.z;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    bool _224 = _218 > 0.0;
    bool _226 = _220 > 0.0;
    float _228 = _220;
    float _230 = _212;
    if (_224)
    {
        float _232 = rsqrt(_212);
        _228 = _232;
    }
    float _234 = _228;
    float _236 = 0.0;
    float _238 = 0.0;
    if (!_224)
    {
        _236 = 0.0;
        _238 = 0.0;
    }
    float _240 = _236;
    float _242 = _238;
    bool _244 = _222 > 0.0;
    float _246 = 0.0;
    float _248 = _242;
    float _250 = _240;
    if (!_224)
    {
        _246 = 0.0;
    }
    float _252 = _246;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = _252;
    if (!_226)
    {
        _254 = 0.0;
        _256 = 0.0;
    }
    float _260 = _254;
    float _262 = _256;
    float _264 = _222;
    float _266 = _262;
    float _268 = _260;
    if (_226)
    {
        float _270 = rsqrt(_214);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_226)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (!_244)
    {
        _278 = 0.0;
    }
    float _282 = _278;
    float _284 = 0.0;
    float _286 = _282;
    if (_244)
    {
        float _288 = rsqrt(_216);
        _284 = _288;
    }
    float _290 = _284;
    if (_224)
    {
        float _292 = _234 * _188;
        _258 = _292;
    }
    float _294 = _258;
    if (_224)
    {
        float _296 = _234 * _182;
        _248 = _296;
    }
    float _298 = _248;
    if (_224)
    {
        float _300 = _234 * _194;
        _250 = _300;
    }
    float _302 = _250;
    bool _304 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _306 = 0.0;
    if (!_244)
    {
        _306 = 0.0;
    }
    float _308 = _306;
    float _310 = _308;
    if (!_244)
    {
        _230 = 0.0;
    }
    float _312 = _230;
    float _314 = _312;
    if (_226)
    {
        float _316 = _272 * _190;
        _280 = _316;
    }
    float _318 = _280;
    if (_226)
    {
        float _320 = _272 * _184;
        _266 = _320;
    }
    float _322 = _266;
    if (_226)
    {
        float _324 = _272 * _196;
        _268 = _324;
    }
    float _326 = _268;
    float _328 = _326;
    if (_244)
    {
        float _330 = _290 * _192;
        _286 = _330;
    }
    float _332 = _286;
    if (_244)
    {
        float _334 = _290 * _186;
        _310 = _334;
    }
    float _336 = _310;
    if (_244)
    {
        float _338 = _290 * _198;
        _314 = _338;
    }
    float _340 = _314;
    bool _342 = !_304;
    float _344 = _340;
    float _362;
    if (!_342)
    {
        float _346 = in.m_71.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_126);
        float _368 = 1.0 / _366;
        float _370 = _160 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_71.z;
    float _376 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _378 = log2(_376);
    float _380 = in.m_71.w;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _384 = _382 != 0;
    float _386 = in.m_58.x;
    float _388 = in.m_58.y;
    float _390 = in.m_58.z;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _398 = _396 != 0;
    float _400 = in.m_73.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_71.y;
    float _408 = _378 * _160;
    float _410 = in.m_73.x;
    float _412 = exp2(_408);
    float _414 = _374 * 2.0;
    float _416 = in.m_67.w;
    bool _418 = _380 > 0.5;
    float _420 = in.m_65.w;
    float _422 = floor(_414);
    float _424 = _190 * _388;
    float _426 = _184 * _388;
    float _428 = _196 * _388;
    float _430 = -_400;
    float _432 = _430 + 1.0;
    float _434 = in.m_75.x;
    float _436 = in.m_75.y;
    float _438 = in.m_75.z;
    float _440 = fma(_182, _386, _426);
    float _442 = _406 * 2.0;
    int _444 = _418 ? as_type<int>(_432) : as_type<int>(_400);
    float _446 = in.m_71.x;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _458 = _456 != 0;
    float _460 = fma(_188, _386, _424);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = _398 ? as_type<float>(_444) : _400;
    float _468 = -_412;
    float _470 = _468 + 1.0;
    bool _472 = _406 > 0.5;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _476 = 1.0 + _474;
    float _478 = 1.0 / _464;
    float _480 = fma(_194, _386, _428);
    float _482 = _400;
    if (_404)
    {
        float _484 = _472 ? _432 : _400;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = fma(_192, _390, _460);
    bool _490 = _422 >= 0.0;
    bool _492 = isnan(_422);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_186, _390, _440);
    bool _502 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _510 = _506 || _508;
    float _512 = _488 + _416;
    float _514 = 1.0 / _476;
    int _516 = _498 ? 0 : 1;
    float _518 = _436 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _522 = isnan(1.0);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _528 = _524 || _526;
    float _530 = fma(_198, _390, _480);
    float _532 = _510 ? _470 : 0.0;
    float _534 = _406 + _374;
    bool _536 = _422 > 0.0;
    float _538 = floor(_442);
    float _540 = _534 + (-1.0);
    int _542 = ~_516;
    int _544 = _542 + 1;
    int _546 = _544 + 1;
    float _548 = _446 * 2.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _552 = _546;
    if (_528)
    {
        float _554 = _532 * _514;
        _162 = _554;
    }
    float _556 = _162;
    float _558 = _446 + _374;
    float _560 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    out.m_77.w = _550;
    if (!_536)
    {
        int _562 = ~_516;
        int _564 = _562 + 1;
        _552 = _564;
    }
    int _566 = _552;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _568;
    float _572 = floor(_548);
    float _574 = in.m_79.x;
    float _576 = in.m_79.y;
    float _578 = in.m_79.z;
    bool _580 = _538 > 0.0;
    float _582 = _570 * _478;
    bool _584 = _538 >= 0.0;
    bool _586 = isnan(_538);
    bool _588 = _584 || _586;
    bool _590 = isnan(0.0);
    bool _592 = _588 || _590;
    float _594 = _446 + _406;
    float _596 = _558 + (-1.0);
    int _598 = _592 ? 0 : 1;
    float _600 = _594 + (-1.0);
    float _602 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _604 = ~_598;
    int _606 = _604 + 1;
    int _608 = _606 + 1;
    float _610 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _614 = _608;
    float _616 = _610;
    if (!_580)
    {
        int _618 = ~_598;
        int _620 = _618 + 1;
        _614 = _620;
    }
    int _622 = _614;
    float _624 = _438 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _628 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _630 = _572 >= 0.0;
    bool _632 = isnan(_572);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _642 = _556 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    if (!_384)
    {
        _616 = _410;
    }
    float _644 = _616;
    float _646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _574);
    bool _648 = !_450;
    int _650 = _648 ? 0 : 1;
    float _652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _576);
    bool _654 = !_454;
    int _656 = _654 ? 0 : 1;
    float _658 = _646 * _640;
    bool _660 = !_458;
    int _662 = _660 ? 0 : 1;
    float _664 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _676 = _674 != 0;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _578);
    float _680 = _642 * _626;
    float _682 = _626;
    float _684 = _644;
    bool _686 = _638;
    bool _688 = _668;
    if (!_384)
    {
        _682 = _644;
    }
    float _690 = _682;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _372 + _692;
    float _696 = _690;
    if (_384)
    {
        _684 = _410;
    }
    float _698 = _684;
    float _700 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[203].x, _680);
    float _702 = _678 * _664;
    bool _704 = !_668;
    int _706 = _704 ? 0 : 1;
    float _708 = _652 * _628;
    float _710 = floor(_700);
    bool _712 = !_676;
    int _714 = _712 ? 0 : 1;
    float _716 = fma(_582, _694, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _718 = abs(_706);
    float _720 = _700 + 0.25;
    int _722 = abs(_714);
    float _724 = in.m_81.x;
    float _726 = in.m_81.y;
    float _728 = in.m_81.z;
    bool _730 = _572 > 0.0;
    float _732 = floor(_720);
    int _734 = _638 ? 0 : 1;
    float _736 = _500 + _420;
    float _738 = float(_566);
    float _740 = _406 + (-0.5);
    float _742 = float(_718);
    float _744 = float(_622);
    float _746 = -_710;
    float _748 = _700 + _746;
    float _750 = _700 * 6.283185482025146484375;
    bool _752 = !_672;
    int _754 = _752 ? 0 : 1;
    float _756 = _742 * _738;
    int _758 = abs(_656);
    float _760 = _750 * 0.15915493667125701904296875;
    int _762 = ~_734;
    int _764 = _762 + 1;
    int _766 = _764 + 1;
    float _768 = _756 * (-2.0);
    float _770 = float(_722);
    float _772 = -_732;
    float _774 = _720 + _772;
    int _776 = _766;
    float _778 = _774;
    if (!_730)
    {
        int _780 = ~_734;
        int _782 = _780 + 1;
        _776 = _782;
    }
    int _784 = _776;
    float _786 = _760 * 6.283185482025146484375;
    float _788 = sin(_786);
    bool _790 = _748 >= 0.5;
    bool _792 = isnan(_748);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    float _800 = _770 * _744;
    int _802 = abs(_754);
    float _804 = _800 * (-2.0);
    bool _806 = !_798;
    int _808 = _806 ? 1056964608 : (-1090519040);
    float _810 = fma(_602, _804, _602);
    bool _812 = _774 > 0.5;
    float _814 = fma(_804, _728, _728);
    float _816 = float(_784);
    int _818 = _784;
    int _820 = _808;
    if (_394)
    {
        float _822 = -_698;
        float _824 = _822 + 1.0;
        _818 = as_type<int>(_824);
    }
    int _826 = _818;
    float _828 = float(_802);
    int _830 = abs(_650);
    if (_394)
    {
        bool _832 = _374 > 0.5;
        _686 = _832;
    }
    bool _834 = _686;
    float _836 = _828 * _816;
    float _838 = float(_758);
    float _840 = as_type<float>(_808) * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _842 = _840 * 2.0;
    float _844 = _374 + (-0.5);
    int _846 = abs(_662);
    if (_812)
    {
        float _848 = -_774;
        float _850 = _848 + 1.0;
        _778 = _850;
    }
    float _852 = _778;
    float _854 = float(_830);
    float _856 = _838 * _842;
    float _858 = _788 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _860 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].z, _814);
    float _862 = fma(_852, 4.0, -1.0);
    float _864 = _836 * (-2.0);
    float _866 = fma(_854, _858, _856);
    float _868 = float(_846);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _872 = fma(_864, _726, _726);
    float _874 = fma(_560, _864, _560);
    float _876 = fma(_810, _556, _860);
    float _878 = fma(_868, _870, _866);
    float _880 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[196].y, _872);
    float _882 = in.m_69.w;
    if (_384)
    {
        bool _884 = _446 > 0.5;
        _688 = _884;
    }
    bool _886 = _688;
    float _888 = fma(_878, 3.1415927410125732421875, _724);
    float _890 = fma(_874, _556, _880);
    float _892 = fma(_612, _768, _612);
    bool _894 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_372);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = fma(_888, _768, _888);
    bool _908 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _910 = isnan(_372);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = in.m_83.x;
    float _922 = in.m_83.y;
    float _924 = in.m_83.z;
    float _926 = _446 + (-0.5);
    float _928 = -_904;
    float _930 = _928 + 1.0;
    bool _932 = _576 != 0.0;
    bool _934 = isnan(_576);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    float _942 = _930;
    if (_384)
    {
        float _944 = -_698;
        float _946 = _944 + 1.0;
        _820 = as_type<int>(_946);
    }
    int _948 = _820;
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[196].x, _906);
    float _952 = _918 * _930;
    bool _954 = _574 == 0.0;
    bool _956 = !_940;
    bool _958 = _954 && _956;
    float _960 = _876 * 0.15915493667125701904296875;
    float _962 = fma(_892, _556, _950);
    float _964 = _716 * _952;
    bool _966 = _578 == 0.0;
    bool _968 = _966 && _958;
    float _970 = in.m_85.x;
    float _972 = in.m_85.y;
    float _974 = in.m_85.z;
    float _976 = in.m_85.w;
    float _978 = -_918;
    float _980 = _978 + 1.0;
    float _982 = _962 * 0.15915493667125701904296875;
    float _984 = _964;
    float _986 = _962;
    float _988 = _980;
    if (!_394)
    {
        _942 = _698;
    }
    float _990 = _942;
    float _992 = _890 * 0.15915493667125701904296875;
    float _994 = _990;
    if (_384)
    {
        float _996 = _886 ? as_type<float>(_948) : _698;
        _696 = _996;
    }
    float _998 = _696;
    float _1000 = _960 * 6.283185482025146484375;
    float _1002 = sin(_1000);
    if (_394)
    {
        float _1004 = _834 ? as_type<float>(_826) : _698;
        _994 = _1004;
    }
    float _1006 = _994;
    float _1008 = _530 + _882;
    float _1010 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[115].x, _964);
    float _1012 = _882;
    float _1014 = _920;
    if (_968)
    {
        _1012 = _922;
    }
    float _1016 = _1012;
    float _1018 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1010);
    float _1020 = _960 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _1016;
    if (_968)
    {
        _984 = _920;
    }
    float _1026 = _984;
    float _1028 = _1026;
    if (_968)
    {
        _986 = _1016;
    }
    float _1030 = _986;
    float _1032 = _1030;
    if (_968)
    {
        _988 = _1026;
    }
    float _1034 = _988;
    float _1036 = _1034;
    if (!_968)
    {
        _1024 = _922;
    }
    float _1038 = _1024;
    float _1040 = _982 * 6.283185482025146484375;
    float _1042 = sin(_1040);
    if (!_968)
    {
        _1028 = _920;
    }
    float _1044 = _1028;
    if (_968)
    {
        _1014 = _924;
    }
    float _1046 = _1014;
    float _1048 = _1046;
    if (!_968)
    {
        float _1050 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1032 = _1050;
    }
    float _1052 = _1032;
    float _1054 = _972 * _924;
    float _1056 = _974 * _1044;
    if (!_968)
    {
        float _1058 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1044);
        _1036 = _1058;
    }
    float _1060 = _1036;
    float _1062 = _982 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = _970 * _1038;
    if (!_968)
    {
        float _1068 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[17].y, _924);
        _1048 = _1068;
    }
    float _1070 = _1048;
    float _1072 = -_1056;
    float _1074 = fma(_970, _924, _1072);
    float _1076 = -_1054;
    float _1078 = fma(_974, _1038, _1076);
    float _1080 = -_1066;
    float _1082 = fma(_972, _1044, _1080);
    float _1084 = _992 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = _1042 * _1002;
    float _1090 = _992 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = _1064 * _1022;
    float _1096 = _1064 * _1002;
    float _1098 = _1002 * _1086;
    float _1100 = _1042 * _1022;
    float _1102 = _1022 * _1086;
    float _1104 = _1042 * _1086;
    float _1106 = _1064 * _1086;
    float _1108 = _1104 * _708;
    float _1110 = fma(_1092, _1088, _1094);
    float _1112 = -_1096;
    float _1114 = fma(_1092, _1100, _1112);
    float _1116 = -_1100;
    float _1118 = fma(_1092, _1096, _1116);
    float _1120 = fma(_1092, _1094, _1088);
    float _1122 = _1110 * _708;
    float _1124 = _1114 * _708;
    float _1126 = -_1092;
    float _1128 = fma(_1126, _658, _1108);
    float _1130 = _1074 * _976;
    float _1132 = fma(_1098, _658, _1122);
    float _1134 = fma(_1102, _658, _1124);
    float _1136 = _1078 * _976;
    float _1138 = _1082 * _976;
    float _1140 = fma(_1118, _702, _1132);
    float _1142 = fma(_1120, _702, _1134);
    float _1144 = fma(_1106, _702, _1128);
    float _1146 = _1104 * _1052;
    float _1148 = _1140 * _318;
    float _1150 = _1140 * _326;
    float _1152 = _1104 * _972;
    float _1154 = _1104 * _1130;
    float _1156 = fma(_1142, _294, _1148);
    float _1158 = fma(_1142, _302, _1150);
    float _1160 = _1110 * _1052;
    float _1162 = _1114 * _972;
    float _1164 = fma(_1144, _332, _1156);
    float _1166 = fma(_1144, _340, _1158);
    float _1168 = _1110 * _972;
    float _1170 = _1114 * _1130;
    float _1172 = _512 + _1164;
    float _1174 = _1008 + _1166;
    float _1176 = _1114 * _1052;
    float _1178 = _1110 * _1130;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1182 = _1172 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1174 + _1184;
    float _1188 = -_1092;
    float _1190 = fma(_1188, _1060, _1146);
    float _1192 = fma(_1102, _1060, _1176);
    float _1194 = _1182 * _1182;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1098, _1060, _1160);
    float _1200 = -_1092;
    float _1202 = fma(_1200, _970, _1152);
    float _1204 = -_1092;
    float _1206 = fma(_1204, _1136, _1154);
    float _1208 = _1194 + _1196;
    float _1210 = fma(_1102, _1136, _1170);
    float _1212 = fma(_1098, _970, _1168);
    float _1214 = fma(_1098, _1136, _1178);
    float _1216 = sqrt(_1208);
    float _1218 = _1140 * _322;
    float _1220 = fma(_1102, _970, _1162);
    float _1222 = fma(_1106, _1070, _1190);
    float _1224 = fma(_1120, _1070, _1192);
    float _1226 = fma(_1118, _1070, _1198);
    float _1228 = fma(_1106, _1138, _1206);
    float _1230 = fma(_1120, _1138, _1210);
    float _1232 = fma(_1118, _974, _1212);
    float _1234 = fma(_1118, _1138, _1214);
    float _1236 = fma(_1106, _974, _1202);
    float _1238 = fma(_1120, _974, _1220);
    float _1240 = fma(_1142, _298, _1218);
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1244 = _1232 * _318;
    float _1246 = _1226 * _318;
    bool _1248 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = fma(_1144, _336, _1240);
    float _1252 = _1234 * _318;
    float _1254 = fma(_1238, _294, _1244);
    float _1256 = _1232 * _322;
    float _1258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1260 = _736 + _1250;
    float _1262 = _1232 * _326;
    float _1264 = _1226 * _322;
    float _1266 = _1234 * _322;
    float _1268 = _1226 * _326;
    float _1270 = _1234 * _326;
    float _1272 = fma(_1238, _298, _1256);
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1276 = fma(_1238, _302, _1262);
    float _1278 = _1144;
    float _1280 = _1250;
    float _1282 = _1194;
    float _1284 = _1196;
    float _1286 = _1256;
    int _1288 = as_type<int>(_1214);
    int _1290 = as_type<int>(_1146);
    if (!_1248)
    {
        _328 = _1172;
    }
    float _1292 = _328;
    float _1294 = _1292;
    if (!_1248)
    {
        _1278 = _1174;
    }
    float _1296 = _1278;
    float _1298 = _1296;
    if (!_1248)
    {
        _1280 = _1260;
    }
    float _1300 = _1280;
    bool _1302 = !_1248;
    float _1304 = _1300;
    if (!_1302)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1310 = _1216 + _1308;
        float _1312 = rsqrt(_1208);
        float _1314 = _1310 * _1306;
        float _1316 = _1260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = _1314 * 0.15915493667125701904296875;
        float _1320 = _1318 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = fma(_1322, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1330 = _1312 * _1328;
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1182, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1336 = fma(_1186, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1338 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1342 = _1334 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1346 = _1336 + _1344;
        float _1348 = fma(_1260, _1326, _1338);
        float _1350 = _1342 * _1342;
        float _1352 = _1346 * _1346;
        _1304 = _1348;
        _1282 = _1350;
        _1284 = _1352;
        _1294 = _1334;
        _1298 = _1336;
    }
    float _1354 = _1304;
    float _1356 = _1282;
    float _1358 = _1284;
    float _1360 = _1294;
    float _1362 = _1298;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1366 = _1354 + _1364;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1370 = fma(_1224, _294, _1246);
    float _1372 = fma(_1230, _294, _1252);
    float _1374 = fma(_1366, _1366, _1356);
    float _1376 = fma(_1224, _298, _1264);
    float _1378 = fma(_1230, _298, _1266);
    float _1380 = _998 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1382 = _1374 + _1358;
    float _1384 = _486 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1386 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1388 = sqrt(_1382);
    float _1390 = fma(_1224, _302, _1268);
    float _1392 = fma(_1230, _302, _1270);
    float _1394 = _466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1402 = _1384 * _1258;
    float _1404 = _1380 * _1242;
    float _1406 = _1386 * _1368;
    float _1408 = fma(_1236, _332, _1254);
    float _1410 = fma(_1236, _336, _1272);
    float _1412 = fma(_1222, _332, _1370);
    float _1414 = fma(_1228, _332, _1372);
    float _1416 = fma(_1222, _336, _1376);
    float _1418 = _1394 * _1274;
    float _1420 = fma(_1236, _340, _1276);
    float _1422 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1430 = fma(_1228, _336, _1378);
    float _1432 = fma(_1228, _340, _1392);
    float _1434 = fma(_1222, _340, _1390);
    out.m_87.x = _1404;
    out.m_87.y = _1402;
    out.m_87.z = _1406;
    out.m_87.w = _1418;
    bool _1436 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1388);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_89.x = _1422;
    out.m_89.y = _1424;
    out.m_89.z = _1426;
    out.m_89.w = _1428;
    out.m_91.x = _1408;
    out.m_91.y = _1410;
    out.m_91.z = _1420;
    out.m_93.x = _1414;
    out.m_93.y = _1430;
    out.m_93.z = _1432;
    float _1446 = _1394;
    float _1448 = _1360;
    if (!_1444)
    {
        _344 = 1.0;
    }
    float _1450 = _344;
    out.m_95.x = _1412;
    out.m_95.y = _1416;
    out.m_95.z = _1434;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1388);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1388 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1388);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1388 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = _736 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1520 = _1354 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1524 = _1360 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1528 = _1362 + _1526;
    float _1530 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1516);
    float _1532 = fma(_1520, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1534 = fma(_1524, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1536 = fma(_1528, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1538 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1530);
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1542 = _1532 + _1540;
    float _1544 = _736 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1534 + _1546;
    float _1550 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1552 = _1542 * _1542;
    float _1554 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1544);
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1536 + _1556;
    float _1560 = 1.0 / _1550;
    float _1562 = fma(_1548, _1548, _1552);
    float _1564 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1554);
    float _1566 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1568 = fma(_1558, _1558, _1562);
    float _1570 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1572 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1566);
    float _1574 = rsqrt(_1568);
    float _1576 = _1570 + _1550;
    float _1578 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1580 = _736 + _1578;
    float _1582 = _1576 * _1560;
    float _1584 = _1582 * 0.5;
    float _1586 = sqrt(_1568);
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1592 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1590);
    float _1594 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1588);
    float _1596 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1598 = _1574 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1600 = 1.0 / _1592;
    float _1602 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1594);
    float _1604 = _1548 * _1598;
    float _1606 = _1558 * _1598;
    float _1608 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1610 = _1604 * _1604;
    float _1612 = _1606 * _1606;
    float _1614 = trunc(_1608);
    int _1616 = int(_1614);
    float _1618 = _1610 + _1612;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1622 = _1600 * _1620;
    float _1624 = sqrt(_1618);
    float _1626 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1628 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1630 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1626);
    bool _1632 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1634 = floor(_1596);
    float _1636 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1630);
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1640 = !_1628;
    int _1642 = _1640 ? 0 : 1;
    bool _1644 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = trunc(_1638);
    int _1648 = int(_1646);
    int _1650 = 2;
    int _1652 = as_type<int>(_1542);
    float _1654 = _1604;
    float _1656 = _1606;
    float _1658 = _1610;
    float _1660 = _1572;
    float _1662 = _1580;
    if (!_1628)
    {
        _1650 = 1;
    }
    int _1664 = _1650;
    float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1624 + _1666;
    int _1670 = _1664;
    float _1672 = _1668;
    if (!_1632)
    {
        _1670 = _1642;
    }
    int _1674 = _1670;
    int _1676 = _1674 << 6;
    float _1678 = -_1634;
    float _1680 = _1596 + _1678;
    int _1682 = _1676 + 96;
    uint _1685 = uint(int(uint(_1682) >> uint(2)));
    uint _1687 = uint(int(uint(int(_1685)) >> uint(2)));
    int _1689 = int(_1685) & 3;
    float _1691 = (*spvDescriptorSet0.vp_c15)._m0[int(_1687)][_1689];
    int _1693 = int(_1685) + 1;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    int _1697 = _1693 & 3;
    float _1699 = (*spvDescriptorSet0.vp_c15)._m0[int(_1695)][_1697];
    float _1701 = _1428;
    float _1703 = as_type<float>(_1674);
    if (_1644)
    {
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1705;
    }
    float _1707 = _1701;
    if (!_1644)
    {
        _1286 = _1612;
    }
    float _1709 = _1286;
    int _1711 = _1676 + 104;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    uint _1715 = uint(int(uint(int(_1713)) >> uint(2)));
    int _1717 = int(_1713) & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    int _1721 = int(_1713) + 1;
    uint _1723 = uint(int(uint(_1721) >> uint(2)));
    int _1725 = _1721 & 3;
    float _1727 = (*spvDescriptorSet0.vp_c15)._m0[int(_1723)][_1725];
    float _1729 = _1709;
    if (_1644)
    {
        float _1731 = _1668 * _1707;
        _1672 = _1731;
    }
    float _1733 = _1672;
    int _1735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1737 = _1616 + _1735;
    int _1739 = _1737 + 1;
    float _1741 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1644)
    {
        float _1743 = _1733 * 0.15915493667125701904296875;
        _1446 = _1743;
    }
    float _1745 = _1446;
    int _1747 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1749 = _1648 + _1747;
    int _1751 = _1749 + 1;
    float _1753 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    if (_1644)
    {
        float _1755 = _1745 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        _1448 = _1757;
    }
    float _1759 = _1448;
    bool _1761 = _1751 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1763 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    int _1765 = _1751 | _1739;
    float _1767 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1769 = _1765 < 0;
    bool _1771 = _1769 || _1761;
    float _1773 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1775 = _1432;
    if (_1644)
    {
        float _1777 = _1745 * 6.283185482025146484375;
        float _1779 = cos(_1777);
        _1775 = _1779;
    }
    float _1781 = _1775;
    float _1783 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1785 = _1739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1787 = _1785 || _1771;
    float _1789 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1791 = precise::max(0.0, _1773);
    float _1793 = -_1789;
    float _1795 = fma(_1793, _1783, 1.0);
    float _1797 = _1763;
    float _1799 = _1783;
    if (_1644)
    {
        float _1801 = rsqrt(_1618);
        _1797 = _1801;
    }
    float _1803 = _1797;
    float _1805 = -_1598;
    float _1807 = -_1791;
    float _1809 = fma(_1542, _1805, _1807);
    float _1811 = _1809;
    if (_1644)
    {
        float _1813 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1813;
    }
    float _1815 = _1799;
    float _1817 = _1580 * _1699;
    float _1819 = _1699;
    float _1821 = _1815;
    if (!_1787)
    {
        int _1823 = _1739 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1825 = _1823 + _1751;
        _1652 = _1825;
    }
    int _1827 = _1652;
    float _1829 = as_type<float>(_1827);
    if (_1644)
    {
        float _1831 = _1781 + (-1.0);
        _1819 = _1831;
    }
    float _1833 = _1819;
    float _1835 = _1833;
    if (_1644)
    {
        float _1837 = fma(_1759, _1815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1821 = _1837;
    }
    float _1839 = _1821;
    int _1841 = _1676 + 48;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    float _1859 = fma(_512, _1691, _1817);
    if (_1644)
    {
        float _1861 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1835 = _1861;
    }
    float _1863 = _1835;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1867 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1865);
    float _1869 = precise::clamp(_1867, 0.0, 1.0);
    if (!_1787)
    {
        int _1871 = _1827 << 2;
        _1288 = _1871;
    }
    int _1873 = _1288;
    float _1875 = fma(_1008, _1719, _1859);
    float _1877 = _1803;
    int _1879 = _1873;
    if (_1644)
    {
        float _1881 = _1803 * _1839;
        _1877 = _1881;
    }
    float _1883 = _1877;
    if (_1644)
    {
        float _1885 = fma(_1809, _1781, _1863);
        _1811 = _1885;
    }
    float _1887 = _1811;
    int _1889 = _1676 + 64;
    uint _1891 = uint(int(uint(_1889) >> uint(2)));
    uint _1893 = uint(int(uint(int(_1891)) >> uint(2)));
    int _1895 = int(_1891) & 3;
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[int(_1893)][_1895];
    int _1899 = int(_1891) + 1;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    int _1903 = _1899 & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    if (_1644)
    {
        float _1907 = _1604 * _1883;
        _1654 = _1907;
    }
    float _1909 = _1654;
    if (_1644)
    {
        float _1911 = _1606 * _1883;
        _1656 = _1911;
    }
    float _1913 = _1656;
    float _1915 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1644)
    {
        float _1919 = _1909 * _1909;
        _1658 = _1919;
    }
    float _1921 = _1658;
    float _1923 = fma(_512, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1925 = _1676 + 56;
    uint _1927 = uint(int(uint(_1925) >> uint(2)));
    uint _1929 = uint(int(uint(int(_1927)) >> uint(2)));
    int _1931 = int(_1927) & 3;
    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[int(_1929)][_1931];
    int _1935 = int(_1927) + 1;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    int _1939 = _1935 & 3;
    float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
    if (_1644)
    {
        float _1943 = _1913 * _1913;
        _1729 = _1943;
    }
    float _1945 = _1729;
    float _1947 = fma(_1887, _1887, _1921);
    float _1949 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1915);
    float _1951 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1917);
    float _1953 = -_1869;
    float _1955 = _1953 + 1.0;
    float _1957 = _1947 + _1945;
    float _1959 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1949);
    int _1961 = _1676 + 72;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    uint _1965 = uint(int(uint(int(_1963)) >> uint(2)));
    int _1967 = int(_1963) & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    int _1971 = int(_1963) + 1;
    uint _1973 = uint(int(uint(_1971) >> uint(2)));
    int _1975 = _1971 & 3;
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[int(_1973)][_1975];
    float _1979 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1951);
    if (!_1787)
    {
        uint _1981 = uint(int(uint(_1827) >> uint(2)));
        _1290 = int(_1981);
    }
    int _1983 = _1290;
    float _1985 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    if (!_1787)
    {
        int _1987 = 12 & _1873;
        _1879 = _1987;
    }
    int _1989 = _1879;
    float _1991 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1993 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1572);
    float _1995 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    int _1997 = _1676 + 80;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c15)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
    float _2015 = _1875 + _1727;
    if (!_1787)
    {
        int _2017 = _1983 << 4;
        int _2019 = _2017 + _1989;
        _1660 = as_type<float>(_2019);
    }
    float _2021 = _1660;
    float _2023 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1995);
    float _2025 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2027 = rsqrt(_1957);
    float _2029 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    int _2031 = _1676 + 88;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    uint _2035 = uint(int(uint(int(_2033)) >> uint(2)));
    int _2037 = int(_2033) & 3;
    float _2039 = (*spvDescriptorSet0.vp_c15)._m0[int(_2035)][_2037];
    int _2041 = int(_2033) + 1;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    int _2045 = _2041 & 3;
    float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
    float _2049 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2029);
    float _2051 = 1.0 / _2015;
    float _2053 = _1580 * _1857;
    float _2055 = _2021;
    if (!_1787)
    {
        int _2057 = as_type<int>(_2021) + 400;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
        int _2063 = int(_2059) & 3;
        float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
        _2055 = _2065;
    }
    float _2067 = _2055;
    float _2069 = fma(_512, _1849, _2053);
    float _2071 = _2027 * _1909;
    float _2073 = abs(_1955);
    float _2075 = log2(_2073);
    float _2077 = _2027 * _1887;
    float _2079 = _1580 * _1905;
    float _2081 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2083 = _2027 * _1913;
    float _2085 = fma(_512, _1897, _2079);
    float _2087 = 1.0 / _2049;
    float _2089 = fma(_1008, _1933, _2069);
    float _2091 = _2089 + _1941;
    float _2093 = -_2081;
    float _2095 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2093);
    float _2097 = _1941;
    float _2099 = _2071;
    if (!_1787)
    {
        float _2101 = floor(_1608);
        _2097 = _2101;
    }
    float _2103 = _2097;
    float _2105 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2107 = fma(_1008, _1969, _2085);
    float _2109 = _2091 * _2051;
    float _2111 = -_2083;
    float _2113 = fma(_2111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2095);
    float _2115 = _2107 + _1977;
    bool _2117 = _2109 >= 0.0;
    float _2119 = fma(_2113, -0.5, 0.5);
    float _2121 = _2115 * _2051;
    float _2123 = _1580 * _2013;
    bool _2125 = _2109 <= 1.0;
    bool _2127 = _2125 && _2117;
    float _2129 = fma(_2113, 0.5, 0.5);
    float _2131 = fma(_512, _2005, _2123);
    bool _2133 = _2121 >= 0.0;
    bool _2135 = _2133 && _2127;
    float _2137 = exp2(_2105);
    if (!_1787)
    {
        float _2139 = -_2103;
        float _2141 = _1608 + _2139;
        _2099 = _2141;
    }
    float _2143 = _2099;
    float _2145 = fma(_1008, _2039, _2131);
    bool _2147 = _2121 <= 1.0;
    bool _2149 = _2147 && _2135;
    float _2151 = fma(_2129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2153 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2155 = _2145 + _2047;
    float _2157 = fma(_2129, _2151, -0.212114393711090087890625);
    float _2159 = sqrt(_2119);
    float _2161 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2163 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2153);
    float _2165 = fma(_2129, _2157, 1.570728778839111328125);
    float _2167 = _2077 + 1.0;
    float _2169 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2161);
    float _2171 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2163);
    float _2173 = _2165;
    if (_2149)
    {
        float _2175 = float(_1674);
        _1703 = _2175;
    }
    float _2177 = _1703;
    float _2179 = log2(_1795);
    float _2181 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2169);
    float _2183 = -_2077;
    float _2185 = fma(_2137, _2167, _2183);
    float _2187 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2171);
    float _2189 = _2155 * _2051;
    float _2191 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2181);
    float _2193 = _2187 * _2087;
    float _2195 = floor(_1923);
    float _2197 = _2159 * 0.636619746685028076171875;
    float _2199 = _2191 * _2087;
    float _2201 = fma(_2193, 0.5, 0.5);
    float _2203 = -_2165;
    float _2205 = fma(_2197, _2203, 1.0);
    float _2207 = _2083;
    float _2209 = _2187;
    float _2211 = _2191;
    if (!_1787)
    {
        float _2213 = floor(_1638);
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = _2179 * 0.693147182464599609375;
    float _2219 = _2039;
    if (!_1787)
    {
        float _2221 = rint(_2067);
        float _2223 = precise::max(_2221, 0.0);
        uint _2225 = uint(_2223);
        uint _2227 = clamp(_2225, 0u, 65535u);
        _2219 = as_type<float>(_2227);
    }
    float _2229 = _2219;
    float _2231 = -_2195;
    float _2233 = _1923 + _2231;
    float _2235 = fma(_2199, -0.5, 0.5);
    float _2237 = fma(_2185, 0.5, 0.5);
    float _2239 = _2169;
    if (_2149)
    {
        float _2241 = rint(_2177);
        float _2243 = precise::max(_2241, 0.0);
        uint _2245 = uint(_2243);
        uint _2247 = clamp(_2245, 0u, 65535u);
        _2239 = as_type<float>(_2247);
    }
    float _2249 = _2239;
    if (!_1787)
    {
        float _2251 = -_2215;
        float _2253 = _1638 + _2251;
        _2173 = _2253;
    }
    float _2255 = _2173;
    float _2257 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _6391 = float2(_2233, _1680);
    float _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6391, float2(0.0), isnan(_6391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6391, float2(0.0), isnan(_6391)), level(0.0)).x;
    float _2261 = _2217;
    if (!_1787)
    {
        float3 _6408 = float3(_2255, _2143, float(as_type<int>(_2229)));
        float3 _6412 = select(_6408, float3(0.0), isnan(_6408));
        float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6412.xy, uint(rint(_6412.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6412.xy, uint(rint(_6412.z)), level(0.0)).x;
        _2261 = _2263;
    }
    float _2265 = _2261;
    float _2267 = _2121;
    if (_2149)
    {
        float3 _6427 = float3(_2109, _2121, float(as_type<int>(_2249)));
        float3 _6429 = select(_6427, float3(0.0), isnan(_6427));
        float _2269 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6429.xy, uint(rint(_6429.z)), _2189, level(0.0));
        _2267 = _2269;
    }
    float _2271 = _2267;
    float3 _6439 = float3(_2201, _2235, _2257);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6439, float3(0.0), isnan(_6439)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6439, float3(0.0), isnan(_6439)), level(0.0)).x;
    float3 _6448 = float3(_2201, _2235, _2257);
    float4 _2276 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6448, float3(0.0), isnan(_6448)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6448, float3(0.0), isnan(_6448)), level(0.0)).xyzw;
    float _2278 = _2276.x;
    float _2280 = _2276.y;
    float _2282 = _2276.z;
    float _2284 = _2276.w;
    float2 _6464 = float2(_2205, _2237);
    float3 _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6464, float2(0.0), isnan(_6464)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6464, float2(0.0), isnan(_6464)), level(0.0)).xyz;
    float _2290 = _2288.x;
    float _2292 = _2288.y;
    float _2294 = _2288.z;
    float _2296 = abs(_1622);
    float _2298 = log2(_2296);
    float _2300 = _1985 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2302 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2304 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2300);
    float _2306 = _2187 + _2049;
    float _2308 = exp2(_2302);
    float _2310 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2312 = _2049 * 0.5;
    float _2314 = _2306 * 0.5;
    float _2316 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2310);
    float _2318 = fma(_2191, -0.5, _2312);
    float _2320 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2322 = _2316 + _2049;
    out.gl_Position.x = _2187;
    out.gl_Position.y = _2191;
    out.gl_Position.z = _2316;
    out.gl_Position.w = _2049;
    float _2324 = _2322 * 0.5;
    float _2326 = exp2(_2320);
    bool _2328 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan(0.5);
    bool _2336 = _2332 || _2334;
    out.m_97.x = _2314;
    out.m_97.y = _2318;
    out.m_97.z = _2324;
    out.m_97.w = _2049;
    if (_2336)
    {
        _2209 = 1.0;
    }
    float _2338 = _2209;
    float _2340 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = _2338;
    if (_2336)
    {
        _2211 = 1.0;
    }
    float _2346 = _2211;
    float _2348 = fma(_2342, -2.0, 3.0);
    float _2350 = _2342 * _2342;
    float _2352 = _2350 * _2348;
    bool _2354 = _1622 <= 8000.0;
    bool _2356 = isnan(_1622);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan(8000.0);
    bool _2362 = _2358 || _2360;
    float _2364 = float(_2362);
    float _2366 = -_2352;
    float _2368 = _2366 + 1.0;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2352);
    float _2372 = _2364 * _2370;
    float _2374 = _2346;
    float _2376 = _2372;
    if (!_2336)
    {
        float _2378 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2382 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2380;
        float _2384 = _2378 * 0.15915493667125701904296875;
        float _2386 = _2384 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        float _2390 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2392 = _2390 * 0.15915493667125701904296875;
        float _2394 = _2384 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = 1.0 / _2388;
        float _2400 = _2392 * 6.283185482025146484375;
        float _2402 = cos(_2400);
        float _2404 = _2396 * _2398;
        float _2406 = _2392 * 6.283185482025146484375;
        float _2408 = sin(_2406);
        float _2410 = _2402 * _2404;
        float _2412 = 1.0 / _2382;
        float _2414 = 1.0 / _2410;
        float _2416 = _2408 * _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2420 = fma(_1622, _2416, _2418);
        float _2422 = _2420 * _2412;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        _2374 = _2424;
    }
    float _2426 = _2374;
    if (!_2336)
    {
        float _2428 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2430 * 6.283185482025146484375;
        float _2434 = cos(_2432);
        float _2436 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2438 = _2436 * 0.15915493667125701904296875;
        float _2440 = _2430 * 6.283185482025146484375;
        float _2442 = sin(_2440);
        float _2444 = 1.0 / _2434;
        float _2446 = _2438 * 6.283185482025146484375;
        float _2448 = cos(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = _2438 * 6.283185482025146484375;
        float _2454 = sin(_2452);
        float _2456 = _2448 * _2450;
        float _2458 = 1.0 / _2456;
        float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2462 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2460;
        float _2464 = 1.0 / _2462;
        float _2466 = _2454 * _2458;
        float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2470 = fma(_1622, _2466, _2468);
        float _2472 = _2470 * _2464;
        float _2474 = precise::clamp(_2472, 0.0, 1.0);
        float _2476 = -_2474;
        float _2478 = _2476 + 1.0;
        _2344 = _2478;
    }
    float _2480 = _2344;
    float _2482 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2484 = -_2259;
    float _2486 = _2484 + 1.0;
    float _2488 = -_2308;
    float _2490 = _2488 + 1.0;
    float _2492 = _2482;
    if (!_2149)
    {
        _2376 = 1.0;
    }
    float _2494 = _2376;
    float _2496 = _2486 * _2482;
    float _2498 = precise::clamp(_2496, 0.0, 1.0);
    float _2500 = _2494;
    if (_2149)
    {
        bool _2502 = _2271 >= _2189;
        bool _2504 = isnan(_2271);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan(_2189);
        bool _2510 = _2506 || _2508;
        float _2512 = float(_2510);
        _2500 = _2512;
    }
    float _2514 = _2500;
    float _2516 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2518 = _2516;
    if (_1787)
    {
        _2492 = 1.0;
    }
    float _2520 = _2492;
    float _2522 = _2520;
    if (!_1787)
    {
        int _2524 = _1827 << 4;
        int _2526 = _2524 + 2048;
        uint _2528 = uint(int(uint(_2526) >> uint(2)));
        uint _2530 = uint(int(uint(int(_2528)) >> uint(2)));
        int _2532 = int(_2528) & 3;
        float _2534 = (*spvDescriptorSet0.vp_c15)._m0[int(_2530)][_2532];
        int _2536 = int(_2528) + 1;
        uint _2538 = uint(int(uint(_2536) >> uint(2)));
        int _2540 = _2536 & 3;
        float _2542 = (*spvDescriptorSet0.vp_c15)._m0[int(_2538)][_2540];
        int _2544 = _2526 + 8;
        uint _2546 = uint(int(uint(_2544) >> uint(2)));
        uint _2548 = uint(int(uint(int(_2546)) >> uint(2)));
        int _2550 = int(_2546) & 3;
        float _2552 = (*spvDescriptorSet0.vp_c15)._m0[int(_2548)][_2550];
        int _2554 = int(_2546) + 1;
        uint _2556 = uint(int(uint(_2554) >> uint(2)));
        int _2558 = _2554 & 3;
        float _2560 = (*spvDescriptorSet0.vp_c15)._m0[int(_2556)][_2558];
        float _2562 = _1580 * _2542;
        float _2564 = fma(_512, _2534, _2562);
        float _2566 = fma(_1008, _2552, _2564);
        float _2568 = _2566 + _2560;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = -_2570;
        float _2574 = _2572 + _2265;
        float _2576 = fma(_2574, 500.0, 1.5);
        float _2578 = exp2(_2576);
        float _2580 = 0.0 + _2578;
        float _2582 = precise::clamp(_2580, 0.0, 1.0);
        _2522 = _2582;
        _1829 = as_type<float>(_2526);
        _1662 = _2578;
    }
    float _2584 = _2522;
    float _2586 = _1829;
    float _2588 = _1662;
    float _2590 = _2514 * _2584;
    float _2592 = _2516 * _2273;
    float _2594 = -_2498;
    float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2598 = -_2516;
    float _2600 = _2598 + 1.0;
    out.m_99.x = _1534;
    out.m_99.y = _1532;
    out.m_99.z = _1536;
    float _2602 = _2284 * _2592;
    float _2604 = -_2590;
    float _2606 = fma(_2604, _2596, 1.0);
    float _2608 = precise::clamp(_2606, 0.0, 1.0);
    float _2610 = _2294 * _2592;
    float _2612 = _2284 * _2600;
    float _2614 = fma(_2290, _2602, _2278);
    float _2616 = fma(_2292, _2602, _2280);
    float _2618 = _2608 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2620 = fma(_2284, _2610, _2282);
    bool _2622 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2624 = isnan(_1586);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2630 = _2626 || _2628;
    float _2632 = _2426 * _2480;
    out.m_101.x = _2618;
    float _2634 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2614;
    out.m_103.y = _2616;
    out.m_103.z = _2620;
    out.m_103.w = _2612;
    float _2636 = _2586;
    float _2638 = _2588;
    float _2640 = _2600;
    float _2642 = _2608;
    float _2644 = _2602;
    if (!_2630)
    {
        _2518 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2646 = _2518;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2630)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2652 = _2636;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2630)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2658 = _2638;
    float _2660 = _2658;
    float _2662 = _2658;
    if (!_2630)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2664 = _2640;
    float _2666 = _2664;
    float _2668 = _2664;
    if (!_2630)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2670 = _2642;
    float _2672 = _2670;
    float _2674 = _2670;
    if (!_2630)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2676 = _2644;
    bool _2678 = !_2630;
    float _2680 = _2676;
    float _2682 = _2676;
    if (!_2678)
    {
        bool _2684 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2686 = isnan(_1586);
        bool _2688 = _2684 || _2686;
        bool _2690 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2692 = _2688 || _2690;
        if (!_2692)
        {
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2696 = _1586 + _2694;
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2700 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2698;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2706 = 1.0 / _2700;
            float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2724 = _2696 * _2706;
            float _2726 = precise::clamp(_2724, 0.0, 1.0);
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2732 = fma(_2726, _2704, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2734 = fma(_2726, _2730, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2736 = fma(_2726, _2710, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2738 = fma(_2726, _2714, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2740 = fma(_2726, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2742 = fma(_2726, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2656 = _2732;
            _2674 = _2740;
            _2650 = _2736;
            _2668 = _2738;
            _2662 = _2734;
            _2682 = _2742;
            _2744 = true;
        }
        else
        {
            bool _2746 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2748 = isnan(_1586);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2754 = _2750 || _2752;
            if (!_2754)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2756 = _2648;
            _2650 = _2756;
            if (!_2754)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2758 = _2654;
            _2656 = _2758;
            if (!_2754)
            {
                _2660 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2760 = _2660;
            _2662 = _2760;
            if (!_2754)
            {
                _2666 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2762 = _2666;
            _2668 = _2762;
            if (!_2754)
            {
                _2672 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2764 = _2672;
            _2674 = _2764;
            if (!_2754)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2766 = _2680;
            bool _2768 = !_2754;
            _2682 = _2766;
            if (!_2768)
            {
                bool _2770 = _1586 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2772 = isnan(_1586);
                bool _2774 = _2770 || _2772;
                bool _2776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2778 = _2774 || _2776;
                if (!_2778)
                {
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2782 = _1586 + _2780;
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2786 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2784;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2792 = 1.0 / _2786;
                    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2810 = _2782 * _2792;
                    float _2812 = precise::clamp(_2810, 0.0, 1.0);
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2818 = fma(_2812, _2790, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2820 = fma(_2812, _2816, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2822 = fma(_2812, _2796, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2824 = fma(_2812, _2800, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2826 = fma(_2812, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2828 = fma(_2812, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2656 = _2818;
                    _2674 = _2826;
                    _2650 = _2822;
                    _2668 = _2824;
                    _2662 = _2820;
                    _2682 = _2828;
                    _2744 = true;
                }
                else
                {
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2674 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2668 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2662 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2744 = false;
    float _2830 = _2656;
    float _2832 = _2674;
    float _2834 = _2650;
    float _2836 = _2668;
    float _2838 = _2662;
    float _2840 = _2682;
    float _2842 = fma(_1416, -0.5, 0.5);
    float _2844 = precise::clamp(_2842, 0.0, 1.0);
    float _2846 = -_2830;
    float _2848 = _2846 + _2832;
    float _2850 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2852 = -_2834;
    float _2854 = _2852 + _2836;
    out.m_105.x = 0.0;
    float _2856 = fma(_2844, _2848, _2830);
    float _2858 = fma(_2844, _2854, _2834);
    out.m_61.x = _2850;
    float _2860 = -_2838;
    float _2862 = _2860 + _2840;
    float _2864 = _2856 * 0.586610972881317138671875;
    bool _2866 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2868 = fma(_2844, _2862, _2838);
    float _2870 = fma(_2858, 0.298911988735198974609375, _2864);
    bool _2872 = _2426 > 0.0;
    bool _2874 = isnan(_2426);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan(0.0);
    bool _2880 = _2876 || _2878;
    float _2882 = fma(_2868, 0.114477999508380889892578125, _2870);
    bool _2884 = _2480 <= 0.0;
    bool _2886 = !_2880;
    bool _2888 = _2884 || _2886;
    float _2890 = -_2882;
    float _2892 = _2858 + _2890;
    float _2894 = -_2882;
    float _2896 = _2856 + _2894;
    float _2898 = -_2882;
    float _2900 = _2868 + _2898;
    float _2902 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    float _2904 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    float _2906 = fma(_2900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2882);
    bool _2908 = !_2866;
    if (!_2908)
    {
        float _2910 = -_1532;
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2914 = -_1534;
        float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2918 = -_1536;
        float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2922 = _2912 * _2912;
        float _2924 = fma(_2916, _2916, _2922);
        float _2926 = fma(_2920, _2920, _2924);
        float _2928 = sqrt(_2926);
        float _2930 = rsqrt(_2926);
        float _2932 = -_2928;
        float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2936 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2938 = precise::clamp(_2936, 0.0, 1.0);
        float _2940 = _2916 * _2930;
        float _2942 = _2912 * _2930;
        float _2944 = abs(_2938);
        float _2946 = log2(_2944);
        float _2948 = _2920 * _2930;
        float _2950 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2952 = _1416 * _2942;
        float _2954 = -_2942;
        float _2956 = -_2950;
        float _2958 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2956);
        float _2960 = fma(_1412, _2940, _2952);
        float _2962 = -_2948;
        float _2964 = fma(_2962, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2958);
        float _2966 = fma(_1434, _2948, _2960);
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2972 = _2964 + _2970;
        float _2974 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2976 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2978 = precise::clamp(_2976, 0.0, 1.0);
        float _2980 = exp2(_2974);
        float _2982 = _2980 * _2978;
        float _2984 = _2968 * _2982;
        float _2986 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2988 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2990 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2986;
        out.m_105.y = _2988;
        out.m_105.z = _2990;
    }
    out.m_107.x = _2902;
    out.m_107.y = _2904;
    out.m_107.z = _2906;
    if (!_2888)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2992 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2992;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

