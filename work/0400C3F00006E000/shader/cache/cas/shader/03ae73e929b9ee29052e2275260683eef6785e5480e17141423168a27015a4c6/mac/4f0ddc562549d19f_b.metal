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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c12 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_89 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_85 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_75 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2738 = false;
    bool _1343 = false;
    bool _1331 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2971 = as_type<float>(_136);
        out.gl_Position.z = _2971;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_174);
        out.gl_Position.z = _3040;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_65.x;
    float _178 = in.m_65.y;
    float _180 = in.m_65.z;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    float _188 = in.m_69.x;
    float _190 = in.m_69.y;
    float _192 = in.m_69.z;
    float _194 = in.m_71.x;
    float _196 = _176 * _176;
    float _198 = _178 * _178;
    float _200 = _180 * _180;
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _226 = _208;
    float _228 = _224;
    float _230 = _212;
    float _232 = _192;
    if (_220)
    {
        float _234 = rsqrt(_208);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = _224 * _194;
    bool _240 = _218 > 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    float _246 = _218;
    if (!_220)
    {
        _242 = 0.0;
        _244 = 0.0;
    }
    float _248 = _242;
    float _250 = _244;
    float _252 = _248;
    float _254 = _250;
    if (!_220)
    {
        _246 = 0.0;
    }
    float _256 = _246;
    float _258 = _256;
    if (!_222)
    {
        _228 = 0.0;
    }
    float _260 = _228;
    float _262 = 0.0;
    float _264 = _260;
    if (_222)
    {
        float _266 = rsqrt(_210);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    if (!_222)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = _272;
    if (!_240)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    if (_220)
    {
        float _288 = _236 * _182;
        _258 = _288;
    }
    float _290 = _258;
    if (_220)
    {
        float _292 = _236 * _176;
        _252 = _292;
    }
    float _294 = _252;
    if (_220)
    {
        float _296 = _236 * _188;
        _254 = _296;
    }
    float _298 = _254;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 0.0;
    if (!_240)
    {
        _302 = 0.0;
    }
    float _304 = _302;
    float _306 = trunc(_238);
    int _308 = int(_306);
    float _310 = _304;
    if (!_222)
    {
        _230 = 0.0;
    }
    float _312 = _230;
    float _314 = _312;
    if (_222)
    {
        float _316 = _268 * _184;
        _264 = _316;
    }
    float _318 = _264;
    float _320 = 0.0;
    if (!_240)
    {
        _320 = 0.0;
    }
    float _322 = _320;
    float _324 = _322;
    if (_222)
    {
        float _326 = _268 * _178;
        _276 = _326;
    }
    float _328 = _276;
    if (_222)
    {
        float _330 = _268 * _190;
        _314 = _330;
    }
    float _332 = _314;
    if (_240)
    {
        float _334 = _286 * _186;
        _282 = _334;
    }
    float _336 = _282;
    if (_240)
    {
        float _338 = _286 * _180;
        _310 = _338;
    }
    float _340 = _310;
    if (_240)
    {
        float _342 = _286 * _192;
        _324 = _342;
    }
    float _344 = _324;
    int _346 = _308 << 4;
    int _348 = _346 + 1712;
    bool _350 = !_300;
    float _366;
    if (!_350)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_120);
        float _372 = 1.0 / _370;
        float _374 = _154 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_58.x;
    float _380 = in.m_58.y;
    float _382 = in.m_58.z;
    float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _386 = log2(_384);
    float _388 = in.m_73.x;
    float _390 = in.m_73.y;
    float _392 = in.m_73.z;
    float _394 = in.m_75.y;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _398 = _396 != 0;
    float _400 = in.m_71.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _404 = _402 != 0;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _408 = _386 * _154;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _420 = _418 != 0;
    float _422 = in.m_75.x;
    bool _424 = _194 > 0.5;
    bool _426 = _424 && _404;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _428;
    float _432 = _184 * _380;
    float _434 = _178 * _380;
    float _436 = _190 * _380;
    float _438 = in.m_71.z;
    float _440 = fma(_182, _378, _432);
    float _442 = fma(_176, _378, _434);
    float _444 = fma(_188, _378, _436);
    float _446 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _448 = -_394;
    float _450 = _448 + 1.0;
    float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _454 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _400 > 0.5;
    float _462 = _194 * 2.0;
    float _464 = _388 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _466 = _394;
    if (_398)
    {
        float _468 = _460 ? _450 : _394;
        _466 = _468;
    }
    float _470 = _466;
    float _472 = 1.0 / _458;
    float _474 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _476 = -_406;
    float _478 = fma(_454, 2.0, _476);
    float _480 = fma(_192, _382, _444);
    float _482 = floor(_462);
    float _484 = _422;
    if (_404)
    {
        _232 = _422;
    }
    float _486 = _232;
    float _488 = fma(_186, _382, _440);
    float _490 = _452 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _496 = _486;
    if (_426)
    {
        float _498 = -_486;
        float _500 = _498 + 1.0;
        _496 = _500;
    }
    float _502 = _496;
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = exp2(_408);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _530 = _430 * _472;
    float _532 = _194 + _438;
    float _534 = 1.0 / _518;
    float _536 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _532 + (-1.0);
    if (_404)
    {
        _484 = _502;
    }
    float _544 = _484;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _550 = 1.0 / _522;
    float _552 = fma(_180, _382, _442);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _556 = 1.0 + _554;
    out.m_79.x = _536;
    out.m_79.y = _538;
    out.m_79.z = _540;
    float _558 = fma(_490, _470, -0.5);
    float _560 = -_514;
    float _562 = _560 + 1.0;
    float _564 = 1.0 / _556;
    float _566 = _494 * _534;
    float _568 = _438 * 2.0;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _584 = fma(_548, -2.0, _546);
    float _586 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _588 = _194 + _400;
    float _590 = in.m_81.x;
    float _592 = in.m_81.y;
    float _594 = in.m_81.z;
    float _596 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[79].z, _580);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _582);
    float _602 = _578 ? _562 : 0.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    bool _610 = _482 > 0.0;
    float _612 = floor(_568);
    bool _614 = _482 >= 0.0;
    bool _616 = isnan(_482);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = _400 + _438;
    float _626 = _588 + (-1.0);
    float _628 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _630 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[79].x, _596);
    float _632 = -_154;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _636 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _600);
    float _638 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _584);
    float _640 = _606 * _550;
    float _642 = _636;
    if (_512)
    {
        float _644 = _602 * _564;
        _158 = _644;
    }
    float _646 = _158;
    float _648 = in.m_67.w;
    float _650 = _624 + (-1.0);
    float _652 = _400 * 2.0;
    float _654 = in.m_65.w;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _658 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = in.m_69.w;
    float _662 = floor(_652);
    bool _664 = _612 > 0.0;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _590);
    bool _668 = _612 >= 0.0;
    bool _670 = isnan(_612);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _592);
    float _680 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _682 = _658 * _666;
    float _684 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _686 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _688 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_376);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _680 * _678;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _376 + _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _594);
    bool _708 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _710 = isnan(_376);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_698;
    float _722 = _720 + 1.0;
    float _724 = fma(_530, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _726 = _622 ? 0 : 1;
    float _728 = _686 * _706;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _376 + _730;
    bool _734 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_376);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    bool _750 = _662 > 0.0;
    float _752 = _488 + _648;
    bool _754 = !_416;
    int _756 = _754 ? 0 : 1;
    float _758 = _552 + _654;
    float _760 = _480 + _660;
    bool _762 = _662 >= 0.0;
    bool _764 = isnan(_662);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = in.m_83.x;
    float _774 = in.m_83.y;
    float _776 = in.m_83.z;
    float _778 = _718 * _722;
    float _780 = fma(_566, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _784 = _376 + _782;
    bool _786 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _788 = isnan(_376);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _744 * _748;
    float _800 = -_744;
    float _802 = _800 + 1.0;
    int _804 = abs(_756);
    float _806 = fma(_640, _784, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _808 = ~_726;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _796 * _802;
    int _816 = _812;
    if (!_610)
    {
        int _818 = ~_726;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = _758 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _826 = _770 ? 0 : 1;
    float _828 = _724 * _814;
    float _830 = _752 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _832 = ~_826;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _840 = float(_804);
    float _842 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _844 = float(_822);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _848 = _836;
    if (!_750)
    {
        int _850 = ~_826;
        int _852 = _850 + 1;
        _848 = _852;
    }
    int _854 = _848;
    float _856 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _858 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].y, _838);
    float _860 = _840 * _844;
    float _862 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].z, _842);
    float _864 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].x, _856);
    float _866 = _760 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _868 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _870 = _860 * (-2.0);
    float _872 = _400 + (-0.5);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].x, _864);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].z, _862);
    float _878 = fma(_870, _774, _774);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].y, _858);
    float _882 = _874 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _886 = _676 ? 0 : 1;
    float _888 = fma(_656, _870, _656);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = _630 * (-0.15915493667125701904296875);
    float _894 = _882 * _846;
    bool _896 = !_412;
    int _898 = _896 ? 0 : 1;
    float _900 = _876 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _902 = _880 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    int _904 = ~_886;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = _892 * 6.283185482025146484375;
    float _912 = sin(_910);
    int _914 = _908;
    if (!_664)
    {
        int _916 = ~_886;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = _900 * _868;
    int _924 = abs(_898);
    int _926 = _348 + 8;
    uint _929 = uint(int(uint(_926) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    float _937 = -_796;
    float _939 = _937 + 1.0;
    float _941 = _902 * _884;
    bool _943 = !_420;
    int _945 = _943 ? 0 : 1;
    float _947 = _892 * 6.283185482025146484375;
    float _949 = cos(_947);
    float _951 = float(_924);
    float _953 = fma(_888, _646, _890);
    int _955 = abs(_945);
    float _957 = fma(_941, 0.5, 0.5);
    float _959 = float(_920);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[115].x, _828);
    float _963 = float(_955);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _967 = uint(int(uint(_348) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[int(_977)][_979];
    float _983 = _951 * _959;
    float _985 = float(_854);
    float _987 = _194 + (-0.5);
    float _989 = fma(_780, _798, _961);
    float _991 = _983 * (-2.0);
    float _993 = _438 + (-0.5);
    float _995 = _963 * _985;
    bool _997 = _592 != 0.0;
    bool _999 = isnan(_592);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_991, _772, _772);
    float _1009 = fma(_684, _991, _684);
    float _1011 = _995 * (-2.0);
    float _1013 = _953 * 0.15915493667125701904296875;
    float _1015 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1007);
    bool _1017 = _590 == 0.0;
    bool _1019 = !_1005;
    bool _1021 = _1017 && _1019;
    float _1023 = fma(_1011, _776, _776);
    float _1025 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1027 = fma(_1009, _646, _1015);
    float _1029 = fma(_586, _1011, _586);
    float _1031 = in.m_85.x;
    float _1033 = in.m_85.y;
    float _1035 = in.m_85.z;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1023);
    float _1039 = fma(_1025, _544, -0.5);
    float _1041 = _912 * _558;
    float _1043 = _949 * _558;
    float _1045 = _1027 * 0.15915493667125701904296875;
    float _1047 = fma(_1029, _646, _1037);
    float _1049 = -_1041;
    float _1051 = fma(_949, _1039, _1049);
    float _1053 = fma(_912, _1039, _1043);
    float _1055 = fma(_806, _778, _989);
    float _1057 = _1013 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = _1047 * 0.15915493667125701904296875;
    float _1063 = fma(_894, 0.5, 0.5);
    bool _1065 = _594 == 0.0;
    bool _1067 = _1065 && _1021;
    float _1069 = fma(_628, _1051, _634);
    float _1071 = -_638;
    float _1073 = fma(_636, _1053, _1071);
    float _1075 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1055);
    float _1077 = _935 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1079 = _1013 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    float _1083 = _1069 + 0.5;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1073 + 0.5;
    float _1091 = fma(_922, 0.5, 0.5);
    float _1093 = _1045 * 6.283185482025146484375;
    float _1095 = sin(_1093);
    float _1097 = _1031;
    float _1099 = _1033;
    float _1101 = _1035;
    if (!_1067)
    {
        float _1103 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1031);
        _1097 = _1103;
    }
    float _1105 = _1097;
    if (!_1067)
    {
        float _1107 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1099 = _1107;
    }
    float _1109 = _1099;
    float _1111 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1067)
    {
        float _1115 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
        _1101 = _1115;
    }
    float _1117 = _1101;
    out.m_87.x = _1083;
    out.m_87.y = _1089;
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1045 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    float _1125 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1127 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1129 = isnan(1.0);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1135 = _1131 || _1133;
    out.m_89.x = _1119;
    out.m_89.y = _1125;
    out.m_89.z = _1087;
    out.m_89.w = _1085;
    float _1137 = floor(_957);
    float _1139 = _1095 * _1059;
    float _1141 = _1061 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1123 * _1081;
    float _1147 = _1061 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = -_1137;
    float _1153 = _957 + _1151;
    float _1155 = _1095 * _1081;
    float _1157 = floor(_1063);
    float _1159 = _1095 * _1143;
    float _1161 = _1123 * _1059;
    float _1163 = _1081 * _1143;
    float _1165 = _1123 * _1143;
    float _1167 = _1059 * _1143;
    float _1169 = fma(_1149, _1145, _1139);
    float _1171 = fma(_1149, _1139, _1145);
    float _1173 = -_700;
    float _1175 = _1149 * _1173;
    float _1177 = -_1109;
    float _1179 = _1149 * _1177;
    float _1181 = -_1161;
    float _1183 = fma(_1149, _1155, _1181);
    float _1185 = -_1155;
    float _1187 = fma(_1149, _1161, _1185);
    float _1189 = fma(_1163, _682, _1175);
    float _1191 = _1165 * _700;
    float _1193 = -_1157;
    float _1195 = _1063 + _1193;
    float _1197 = fma(_1153, 2.0, -1.0);
    float _1199 = fma(_1163, _1105, _1179);
    float _1201 = _1159 * _700;
    float _1203 = _1165 * _1109;
    float _1205 = _1159 * _1109;
    float _1207 = fma(_1195, 2.0, -1.0);
    float _1209 = _1197 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1211 = fma(_1183, _682, _1201);
    float _1213 = fma(_1169, _1105, _1203);
    float _1215 = fma(_1183, _1105, _1205);
    float _1217 = fma(_1169, _682, _1191);
    float _1219 = fma(_1167, _728, _1189);
    float _1221 = _1207 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1223 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1225 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1229 = floor(_1091);
    float _1231 = fma(_1187, _1117, _1213);
    float _1233 = fma(_1167, _1117, _1199);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1223);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1225);
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1227);
    float _1241 = fma(_1187, _728, _1217);
    float _1243 = _1231 * _318;
    float _1245 = _1231 * _328;
    float _1247 = _1231 * _332;
    float _1249 = fma(_1171, _1117, _1215);
    float _1251 = fma(_1233, _290, _1243);
    float _1253 = fma(_1233, _294, _1245);
    float _1255 = fma(_1233, _298, _1247);
    float _1257 = fma(_1171, _728, _1211);
    float _1259 = fma(_1249, _336, _1251);
    float _1261 = fma(_1249, _340, _1253);
    float _1263 = fma(_1249, _344, _1255);
    float _1265 = -_1229;
    float _1267 = _1091 + _1265;
    float _1269 = _1241 * _318;
    float _1271 = _1241 * _328;
    float _1273 = _1241 * _332;
    out.m_91.x = _1259;
    out.m_91.y = _1261;
    out.m_91.z = _1263;
    float _1275 = fma(_1267, 2.0, -1.0);
    float _1277 = fma(_1219, _290, _1269);
    float _1279 = fma(_1219, _294, _1271);
    float _1281 = fma(_1219, _298, _1273);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1285 = fma(_1257, _336, _1277);
    float _1287 = fma(_1257, _340, _1279);
    float _1289 = fma(_1257, _344, _1281);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1235);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1237);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1239);
    float _1297 = _1291 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1299 = _1293 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1301 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1303 = _1285 + _1297;
    float _1305 = _1287 + _1299;
    float _1307 = _1289 + _1301;
    float _1309 = _1239;
    float _1311 = _1257;
    float _1313 = _1273;
    float _1315 = _1277;
    float _1317 = _1273;
    float _1319 = _1207;
    float _1321 = _1197;
    float _1323 = _1289;
    float _1325 = _1275;
    float _1335;
    float _1337;
    float _1339;
    float _1341;
    if (!_1135)
    {
        bool _1327 = _1299 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1329 = !_1327;
        _1331 = _1329;
        if (!_1331)
        {
            float _1333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1335 = _1333;
            _1337 = 0.0;
            _1339 = 0.0;
            _1341 = 0.0;
            _1343 = true;
        }
    }
    if ((!_1343) || _1331)
    {
        bool _1379;
        if (!_1331)
        {
            bool _1345 = _1299 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1347 = isnan(_1299);
            bool _1349 = _1345 || _1347;
            bool _1351 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1353 = _1349 || _1351;
            bool _1355 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1357 = !_1353;
            bool _1359 = _1355 && _1357;
            bool _1361 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1315 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1359)
            {
                _1309 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1363 = _1309;
            float _1365 = _1363;
            if (_1359)
            {
                _642 = 0.0;
            }
            float _1367 = _642;
            _1337 = _1367;
            if (_1359)
            {
                _1311 = 0.0;
            }
            float _1369 = _1311;
            _1339 = _1369;
            if (_1359)
            {
                float _1371 = _1363 * 5.0;
                _1365 = _1371;
            }
            float _1373 = _1365;
            _1335 = _1373;
            if (_1359)
            {
                _1313 = 0.0;
            }
            float _1375 = _1313;
            bool _1377 = !_1353;
            _1379 = _1377 && _1361;
            _1317 = _1375;
            _1341 = _1375;
        }
        if ((!_1379) || _1331)
        {
            _1331 = false;
            float _1381 = _1315;
            float _1383 = _1317;
            bool _1385 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1387 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1389 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1391 = _1287;
            float _1393 = _1381;
            float _1395 = _1383;
            _1335 = _1307;
            _1337 = _1303;
            _1339 = _1305;
            if (_1385)
            {
                float _1397 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1391 = _1397;
            }
            float _1399 = _1391;
            if (_1385)
            {
                float _1401 = abs(_1207);
                float _1403 = -_1401;
                float _1405 = _1403 + 1.0;
                _1319 = _1405;
            }
            float _1407 = _1319;
            if (_1387)
            {
                float _1409 = abs(_1197);
                float _1411 = -_1409;
                float _1413 = _1411 + 1.0;
                _1321 = _1413;
            }
            float _1415 = _1321;
            if (!_1385)
            {
                _1323 = 1.0;
            }
            float _1417 = _1323;
            float _1419 = _1417;
            if (_1389)
            {
                float _1421 = abs(_1275);
                float _1423 = -_1421;
                float _1425 = _1423 + 1.0;
                _1325 = _1425;
            }
            float _1427 = _1325;
            if (!_1387)
            {
                _1393 = 1.0;
            }
            float _1429 = _1393;
            float _1431 = _1429;
            if (!_1389)
            {
                _1395 = 1.0;
            }
            float _1433 = _1395;
            float _1435 = _1251;
            float _1437 = _1433;
            if (_1387)
            {
                float _1439 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1435 = _1439;
            }
            float _1441 = _1435;
            float _1443 = _1283;
            if (_1389)
            {
                float _1445 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1443 = _1445;
            }
            float _1447 = _1443;
            if (_1385)
            {
                float _1449 = _1407 * _1399;
                float _1451 = precise::clamp(_1449, 0.0, 1.0);
                _1419 = _1451;
            }
            float _1453 = _1419;
            if (_1387)
            {
                float _1455 = _1415 * _1441;
                float _1457 = precise::clamp(_1455, 0.0, 1.0);
                _1431 = _1457;
            }
            float _1459 = _1431;
            float _1461 = _1453 * _1459;
            if (_1389)
            {
                float _1463 = _1427 * _1447;
                float _1465 = precise::clamp(_1463, 0.0, 1.0);
                _1437 = _1465;
            }
            float _1467 = _1437;
            float _1469 = _1461 * _1467;
            _1341 = _1469;
        }
    }
    _1343 = false;
    float _1471 = _1335;
    float _1473 = _1337;
    float _1475 = _1339;
    float _1477 = _1341;
    float _1479 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1481 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1483 = floor(_1479);
    float _1485 = floor(_1481);
    float _1487 = -_1483;
    float _1489 = _1479 + _1487;
    float _1491 = -_1485;
    float _1493 = _1481 + _1491;
    float2 _5081 = float2(_1489, _1493);
    float _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5081, float2(0.0), isnan(_5081)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5081, float2(0.0), isnan(_5081)), level(0.0)).x;
    float _1497 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1501 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1505 = _1471 + _1503;
    float _1507 = _1299 + _1499;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1511 = _1473 + _1509;
    float _1513 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1501);
    float _1515 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1519 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1521 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1515);
    float _1523 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1517);
    bool _1525 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1527 = isnan(0.5);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1533 = _1529 || _1531;
    float _1535 = 1.0 / _1519;
    float _1537 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1521);
    float _1539 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1523);
    float _1541 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1543 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1545 = _1541 + _1519;
    float _1547 = _1545 * _1535;
    float _1549 = _1547 * 0.5;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1553 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1551);
    float _1555 = 1.0 / _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1559 = _1555 * _1557;
    float _1561 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1563 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1565 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1561);
    bool _1567 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1569 = !_1563;
    int _1571 = _1569 ? 0 : 1;
    float _1573 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1565);
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1577 = 2;
    float _1579 = _1473;
    float _1581 = _1471;
    float _1583 = _1475;
    int _1585 = as_type<int>(_1511);
    if (!_1563)
    {
        _1577 = 1;
    }
    int _1587 = _1577;
    float _1589 = trunc(_1575);
    int _1591 = int(_1589);
    int _1593 = _1587;
    if (!_1567)
    {
        _1593 = _1571;
    }
    int _1595 = _1593;
    int _1597 = _1595 << 6;
    float _1599 = trunc(_1543);
    int _1601 = int(_1599);
    int _1603 = _1597 + 96;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c15)._m0[int(_1615)][_1617];
    int _1621 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1623 = _1591 + _1621;
    int _1625 = _1623 + 1;
    int _1627 = _1597 + 104;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    float _1645 = _1505 * _1505;
    float _1647 = fma(_1511, _1511, _1645);
    int _1649 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1651 = _1601 + _1649;
    int _1653 = _1651 + 1;
    int _1655 = _1597 + 64;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    float _1673 = sqrt(_1647);
    bool _1675 = _1653 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1677 = _1653 | _1625;
    int _1679 = _1597 + 48;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    uint _1683 = uint(int(uint(int(_1681)) >> uint(2)));
    int _1685 = int(_1681) & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    int _1689 = int(_1681) + 1;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    int _1693 = _1689 & 3;
    float _1695 = (*spvDescriptorSet0.vp_c15)._m0[int(_1691)][_1693];
    bool _1697 = _1677 < 0;
    bool _1699 = _1697 || _1675;
    bool _1701 = _1625 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1703 = _1701 || _1699;
    int _1705 = _1597 + 56;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
    int _1711 = int(_1707) & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    int _1715 = int(_1707) + 1;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    int _1719 = _1715 & 3;
    float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
    bool _1723 = _1673 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1725 = _1597 + 72;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    float _1743 = as_type<float>(_1677);
    if (!_1703)
    {
        float _1745 = floor(_1543);
        _1743 = _1745;
    }
    float _1747 = _1743;
    int _1749 = _1597 + 80;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.vp_c15)._m0[int(_1761)][_1763];
    float _1767 = _1507 * _1619;
    float _1769 = fma(_1297, _1611, _1767);
    float _1771 = fma(_1301, _1635, _1769);
    float _1773 = _1771 + _1643;
    int _1775 = as_type<int>(_1771);
    float _1777 = _1611;
    if (!_1703)
    {
        int _1779 = _1625 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1781 = _1779 + _1653;
        _1775 = _1781;
    }
    int _1783 = _1775;
    float _1785 = _1507 * _1671;
    float _1787 = 1.0 / _1773;
    float _1789 = fma(_1297, _1663, _1785);
    float _1791 = _1663;
    int _1793 = as_type<int>(_1687);
    float _1795 = _1785;
    int _1797 = as_type<int>(_1789);
    if (!_1723)
    {
        _1791 = _1475;
    }
    float _1799 = _1791;
    float _1801 = _1507 * _1695;
    float _1803 = fma(_1297, _1687, _1801);
    bool _1805 = !_1723;
    float _1807 = _1799;
    float _1809 = _1765;
    float _1811 = _1747;
    if (!_1805)
    {
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1817 = _1673 + _1815;
        float _1819 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = rsqrt(_1647);
        float _1823 = _1817 * _1813;
        float _1825 = _1823 * 0.15915493667125701904296875;
        float _1827 = _1825 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = _1825 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1829 + (-1.0);
        float _1837 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1839 = fma(_1833, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1841 = fma(_1829, _1475, _1837);
        float _1843 = _1821 * _1839;
        float _1845 = fma(_1511, _1843, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1847 = fma(_1505, _1843, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1579 = _1845;
        _1581 = _1847;
        _1807 = _1841;
        _1793 = as_type<int>(_1833);
        _1795 = _1843;
        _1777 = _1825;
    }
    float _1849 = _1579;
    float _1851 = _1581;
    float _1853 = _1807;
    int _1855 = _1793;
    float _1857 = _1795;
    float _1859 = _1777;
    float _1861 = fma(_1301, _1733, _1789);
    int _1863 = _1855;
    float _1865 = _1857;
    float _1867 = _1853;
    float _1869 = _1859;
    if (!_1703)
    {
        int _1871 = _1783 << 2;
        _1797 = _1871;
    }
    int _1873 = _1797;
    float _1875 = fma(_1301, _1713, _1803);
    int _1877 = _1873;
    if (_1533)
    {
        _1583 = _1849;
    }
    float _1879 = _1583;
    float _1881 = _1879;
    if (!_1703)
    {
        uint _1883 = uint(int(uint(_1783) >> uint(2)));
        _1863 = int(_1883);
    }
    int _1885 = _1863;
    if (!_1703)
    {
        int _1887 = 12 & _1873;
        _1877 = _1887;
    }
    int _1889 = _1877;
    if (_1533)
    {
        _1865 = _1851;
    }
    float _1891 = _1865;
    float _1893 = _1891;
    if (!_1533)
    {
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1897 = _1299 + _1895;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1901 = _1297 + _1899;
        float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1905 = -_1299;
        float _1907 = _1905 + _1853;
        float _1909 = _1897 * _1897;
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1913 = _1301 + _1911;
        float _1915 = -_1297;
        float _1917 = _1915 + _1849;
        float _1919 = -_1301;
        float _1921 = _1919 + _1851;
        float _1923 = fma(_1901, _1901, _1909);
        float _1925 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1927 = fma(_1913, _1913, _1923);
        float _1929 = sqrt(_1927);
        float _1931 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1933 = _1929 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1935 = isnan(_1929);
        bool _1937 = _1933 || _1935;
        bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1941 = _1937 || _1939;
        float _1943 = precise::min(_1929, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1945 = _1943 * _1903;
        float _1947 = _1931 * _1945;
        float _1949 = _1619;
        float _1951 = _1943;
        float _1953 = _1929;
        _1869 = _1907;
        if (_1941)
        {
            float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1949 = _1955;
        }
        float _1957 = _1949;
        if (_1941)
        {
            float _1959 = precise::max(_1929, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1951 = _1959;
        }
        float _1961 = _1951;
        float _1963 = fma(_1907, _1947, _1299);
        float _1965 = _1963;
        if (_1941)
        {
            float _1967 = _1961 * _1957;
            _1953 = _1967;
        }
        float _1969 = _1953;
        float _1971 = fma(_1917, _1947, _1297);
        float _1973 = fma(_1921, _1947, _1301);
        float _1975 = _1969;
        float _1977 = _1971;
        _1893 = _1973;
        if (_1941)
        {
            float _1979 = _1931 * _1969;
            _1975 = _1979;
        }
        float _1981 = _1975;
        if (_1941)
        {
            float _1983 = fma(_1907, _1981, _1299);
            _1965 = _1983;
        }
        float _1985 = _1965;
        _1867 = _1985;
        if (_1941)
        {
            float _1987 = fma(_1917, _1981, _1297);
            _1977 = _1987;
        }
        float _1989 = _1977;
        _1881 = _1989;
        if (_1941)
        {
            float _1991 = fma(_1921, _1981, _1301);
            _1893 = _1991;
        }
    }
    float _1993 = _1867;
    float _1995 = _1881;
    float _1997 = _1893;
    float _1999 = _1869;
    if (!_1703)
    {
        int _2001 = _1885 << 4;
        int _2003 = _2001 + _1889;
        _1585 = _2003;
    }
    int _2005 = _1585;
    float _2007 = _1861 + _1741;
    float _2009 = _1875 + _1721;
    float _2011 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2013 = _1597 + 88;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2033 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2035 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2011);
    float _2037 = _2009 * _1787;
    float _2039 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2031);
    float _2041 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2033);
    float _2043 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2045 = _2009;
    float _2047 = as_type<float>(_2005);
    if (!_1703)
    {
        int _2049 = _2005 + 400;
        uint _2051 = uint(int(uint(_2049) >> uint(2)));
        uint _2053 = uint(int(uint(int(_2051)) >> uint(2)));
        int _2055 = int(_2051) & 3;
        float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
        _2045 = _2057;
    }
    float _2059 = _2045;
    float _2061 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2039);
    float _2063 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2041);
    bool _2065 = _2037 >= 0.0;
    float _2067 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2043);
    float _2069 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2071 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2073 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2075 = _2007 * _1787;
    bool _2077 = _2037 <= 1.0;
    bool _2079 = _2077 && _2065;
    float _2081 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2083 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2085 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    bool _2087 = _2075 >= 0.0;
    bool _2089 = _2087 && _2079;
    float _2091 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2093 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2083);
    float _2095 = _1999;
    if (!_1703)
    {
        float _2097 = floor(_1575);
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = _2075 <= 1.0;
    bool _2103 = _2101 && _2089;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2109 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2093);
    float _2111 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2113 = -_2105;
    float _2115 = fma(_2113, _2091, 1.0);
    float _2117 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2109);
    float _2121 = _1507 * _1765;
    float _2123 = log2(_2115);
    float _2125 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2111);
    float _2127 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2117);
    float _2129 = fma(_1297, _1757, _2121);
    float _2131 = _2129;
    if (_2103)
    {
        float _2133 = float(_1595);
        _1809 = _2133;
    }
    float _2135 = _1809;
    if (!_1703)
    {
        float _2137 = -_1747;
        float _2139 = _1543 + _2137;
        _2047 = _2139;
    }
    float _2141 = _2047;
    float _2143 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2145 = 1.0 / _2119;
    float _2147 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    float _2149 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2143);
    float _2151 = fma(_1301, _2021, _2129);
    if (!_1703)
    {
        float _2153 = -_2099;
        float _2155 = _1575 + _2153;
        _2131 = _2155;
    }
    float _2157 = _2131;
    float _2159 = _2121;
    if (_2103)
    {
        float _2161 = rint(_2135);
        float _2163 = precise::max(_2161, 0.0);
        uint _2165 = uint(_2163);
        uint _2167 = clamp(_2165, 0u, 65535u);
        _2159 = as_type<float>(_2167);
    }
    float _2169 = _2159;
    float _2171 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2147);
    float _2173 = _2151 + _2029;
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = _2173 * _1787;
    float _2179 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2181 = _2147;
    float _2183 = _2179;
    if (!_1703)
    {
        float _2185 = rint(_2059);
        float _2187 = precise::max(_2185, 0.0);
        uint _2189 = uint(_2187);
        uint _2191 = clamp(_2189, 0u, 65535u);
        _2181 = as_type<float>(_2191);
    }
    float _2193 = _2181;
    float _2195 = _2149 * _2145;
    float _2197 = _2171 * _2145;
    float _2199 = fma(_2195, 0.5, 0.5);
    float _2201 = fma(_2197, -0.5, 0.5);
    float _2203 = _2075;
    if (_2103)
    {
        float3 _6261 = float3(_2037, _2075, float(as_type<int>(_2169)));
        float3 _6265 = select(_6261, float3(0.0), isnan(_6261));
        float _2205 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6265.xy, uint(rint(_6265.z)), _2177, level(0.0));
        _2203 = _2205;
    }
    float _2207 = _2203;
    float3 _6275 = float3(_2199, _2201, _2179);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6275, float3(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6275, float3(0.0), isnan(_6275)), level(0.0)).x;
    float3 _6284 = float3(_2199, _2201, _2179);
    float4 _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6284, float3(0.0), isnan(_6284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6284, float3(0.0), isnan(_6284)), level(0.0)).xyzw;
    float _2214 = _2212.x;
    float _2216 = _2212.y;
    float _2218 = _2212.z;
    float _2220 = _2212.w;
    float _2222 = _2141;
    if (!_1703)
    {
        float3 _6307 = float3(_2141, _2157, float(as_type<int>(_2193)));
        float3 _6309 = select(_6307, float3(0.0), isnan(_6307));
        float _2224 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6309.xy, uint(rint(_6309.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6309.xy, uint(rint(_6309.z)), level(0.0)).x;
        _2222 = _2224;
    }
    float _2226 = _2222;
    if (_1703)
    {
        _1811 = 1.0;
    }
    float _2228 = _1811;
    float _2230 = _2228;
    float _2232 = _2214;
    if (!_1703)
    {
        int _2234 = _1783 << 4;
        int _2236 = _2234 + 2048;
        uint _2238 = uint(int(uint(_2236) >> uint(2)));
        uint _2240 = uint(int(uint(int(_2238)) >> uint(2)));
        int _2242 = int(_2238) & 3;
        float _2244 = (*spvDescriptorSet0.vp_c15)._m0[int(_2240)][_2242];
        int _2246 = int(_2238) + 1;
        uint _2248 = uint(int(uint(_2246) >> uint(2)));
        int _2250 = _2246 & 3;
        float _2252 = (*spvDescriptorSet0.vp_c15)._m0[int(_2248)][_2250];
        int _2254 = _2236 + 8;
        uint _2256 = uint(int(uint(_2254) >> uint(2)));
        uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
        int _2260 = int(_2256) & 3;
        float _2262 = (*spvDescriptorSet0.vp_c15)._m0[int(_2258)][_2260];
        int _2264 = int(_2256) + 1;
        uint _2266 = uint(int(uint(_2264) >> uint(2)));
        int _2268 = _2264 & 3;
        float _2270 = (*spvDescriptorSet0.vp_c15)._m0[int(_2266)][_2268];
        float _2272 = _1507 * _2252;
        float _2274 = fma(_1297, _2244, _2272);
        float _2276 = fma(_1301, _2262, _2274);
        float _2278 = _2276 + _2270;
        float _2280 = precise::clamp(_2278, 0.0, 1.0);
        float _2282 = -_2280;
        float _2284 = _2282 + _2226;
        float _2286 = fma(_2284, 500.0, 1.5);
        float _2288 = exp2(_2286);
        float _2290 = 0.0 + _2288;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        _2230 = _2292;
    }
    float _2294 = _2230;
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2298 = _1993 + _2296;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2302 = _1995 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2306 = _1997 + _2304;
    float _2308 = _2298 * _2298;
    float _2310 = fma(_2302, _2302, _2308);
    float _2312 = fma(_2306, _2306, _2310);
    float _2314 = rsqrt(_2312);
    float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2318 = _2302 * _2316;
    float _2320 = _2306 * _2316;
    float _2322 = _2318 * _2318;
    float _2324 = _2320 * _2320;
    float _2326 = _2322 + _2324;
    float _2328 = sqrt(_2326);
    bool _2330 = _2328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2334 = _2328 + _2332;
    float _2336 = _2306;
    float _2338 = _2314;
    float _2340 = _2334;
    float _2342 = _2308;
    float _2344 = _2298;
    float _2346 = _2322;
    if (_2330)
    {
        float _2348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2336 = _2348;
    }
    float _2350 = _2336;
    if (_2330)
    {
        float _2352 = rsqrt(_2326);
        _2338 = _2352;
    }
    float _2354 = _2338;
    float _2356 = _2354;
    if (_2330)
    {
        float _2358 = _2334 * _2350;
        _2340 = _2358;
    }
    float _2360 = _2340;
    if (_2330)
    {
        float _2362 = _2360 * 0.15915493667125701904296875;
        _2342 = _2362;
    }
    float _2364 = _2342;
    float _2366 = _2350;
    float _2368 = _2364;
    if (_2330)
    {
        float _2370 = _2364 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        _2366 = _2372;
    }
    float _2374 = _2366;
    float _2376 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2378 = precise::max(0.0, _2376);
    float _2380 = _1787;
    float _2382 = _2378;
    if (_2330)
    {
        float _2384 = _2364 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        _2380 = _2386;
    }
    float _2388 = _2380;
    float _2390 = -_2316;
    float _2392 = -_2378;
    float _2394 = fma(_2298, _2390, _2392);
    if (_2330)
    {
        float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2396;
    }
    float _2398 = _2382;
    float _2400 = _2398;
    if (!_2330)
    {
        _2368 = _2318;
    }
    float _2402 = _2368;
    float _2404 = _2374;
    float _2406 = _2402;
    if (_2330)
    {
        float _2408 = fma(_2374, _2398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2404 = _2408;
    }
    float _2410 = _2404;
    float _2412 = _2410;
    if (_2330)
    {
        float _2414 = _2388 + (-1.0);
        _2400 = _2414;
    }
    float _2416 = _2400;
    float _2418 = _2416;
    if (_2330)
    {
        float _2420 = _2354 * _2410;
        _2183 = _2420;
    }
    float _2422 = _2183;
    if (!_2330)
    {
        _2356 = _2394;
    }
    float _2424 = _2356;
    float _2426 = _2424;
    if (_2330)
    {
        float _2428 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2344 = _2428;
    }
    float _2430 = _2344;
    if (_2330)
    {
        float _2432 = _2318 * _2422;
        _2406 = _2432;
    }
    float _2434 = _2406;
    if (!_2330)
    {
        _2412 = _2320;
    }
    float _2436 = _2412;
    float _2438 = _2436;
    if (_2330)
    {
        float _2440 = _2320 * _2422;
        _2438 = _2440;
    }
    float _2442 = _2438;
    if (_2330)
    {
        float _2444 = fma(_2394, _2388, _2430);
        _2426 = _2444;
    }
    float _2446 = _2426;
    if (_2330)
    {
        float _2448 = _2434 * _2434;
        _2346 = _2448;
    }
    float _2450 = _2346;
    float _2452 = sqrt(_2312);
    if (!_2330)
    {
        _2418 = _2324;
    }
    float _2454 = _2418;
    float _2456 = _2454;
    if (_2330)
    {
        float _2458 = _2442 * _2442;
        _2456 = _2458;
    }
    float _2460 = _2456;
    float _2462 = fma(_2446, _2446, _2450);
    float _2464 = _2462 + _2460;
    float _2466 = rsqrt(_2464);
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2470 = fma(_2452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2468);
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -_2472;
    float _2476 = _2474 + 1.0;
    float _2478 = abs(_2476);
    float _2480 = log2(_2478);
    float _2482 = _2466 * _2434;
    float _2484 = _2466 * _2446;
    float _2486 = _2466 * _2442;
    float _2488 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2490 = -_2488;
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2490);
    float _2494 = -_2486;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2492);
    float _2498 = _2484 + 1.0;
    float _2500 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2502 = fma(_2496, -0.5, 0.5);
    float _2504 = fma(_2496, 0.5, 0.5);
    float _2506 = exp2(_2500);
    float _2508 = fma(_2504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2510 = fma(_2504, _2508, -0.212114393711090087890625);
    float _2512 = sqrt(_2502);
    float _2514 = fma(_2504, _2510, 1.570728778839111328125);
    float _2516 = -_2484;
    float _2518 = fma(_2506, _2498, _2516);
    float _2520 = fma(_2518, 0.5, 0.5);
    float _2522 = _2512 * 0.636619746685028076171875;
    float _2524 = -_2514;
    float _2526 = fma(_2522, _2524, 1.0);
    float2 _6776 = float2(_2526, _2520);
    float3 _2530 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6776, float2(0.0), isnan(_6776)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6776, float2(0.0), isnan(_6776)), level(0.0)).xyz;
    float _2532 = _2530.x;
    float _2534 = _2530.y;
    float _2536 = _2530.z;
    float _2538 = abs(_1559);
    float _2540 = log2(_2538);
    float _2542 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2544 = -_1495;
    float _2546 = _2544 + 1.0;
    bool _2548 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2550 = isnan(_2452);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2556 = _2552 || _2554;
    float _2558 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2542);
    float _2560 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2562 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2564 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2558);
    float _2566 = exp2(_2560);
    float _2568 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2564);
    float _2570 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2572 = exp2(_2570);
    float _2574 = -_2566;
    float _2576 = _2574 + 1.0;
    float _2578 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2580 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = fma(_2582, -2.0, 3.0);
    float _2586 = _2582 * _2582;
    float _2588 = _2586 * _2584;
    float _2590 = -_2588;
    float _2592 = _2590 + 1.0;
    float _2594 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2588);
    bool _2596 = _1559 <= 8000.0;
    bool _2598 = isnan(_1559);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(8000.0);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    float _2608 = _2568 + _2119;
    float _2610 = _2606 * _2594;
    float _2612 = _2608 * 0.5;
    float _2614 = _2608;
    if (!_2103)
    {
        _2614 = 1.0;
    }
    float _2616 = _2614;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2171;
    out.gl_Position.z = _2568;
    out.gl_Position.w = _2119;
    float _2618 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2620 = _2616;
    if (_2103)
    {
        bool _2622 = _2207 >= _2177;
        bool _2624 = isnan(_2207);
        bool _2626 = _2622 || _2624;
        bool _2628 = isnan(_2177);
        bool _2630 = _2626 || _2628;
        float _2632 = float(_2630);
        _2620 = _2632;
    }
    float _2634 = _2620;
    float _2636 = _2578 * _2209;
    float _2638 = -_2578;
    float _2640 = _2638 + 1.0;
    float _2642 = _2546 * _2618;
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    out.m_93.z = _2612;
    out.m_93.w = _2119;
    float _2646 = _2634 * _2294;
    float _2648 = -_2644;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = -_2646;
    float _2654 = fma(_2652, _2650, 1.0);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = _2220 * _2636;
    float _2660 = _2220 * _2640;
    float _2662 = _2536 * _2636;
    float _2664 = fma(_2532, _2658, _2214);
    float _2666 = fma(_2534, _2658, _2216);
    float _2668 = _2656 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = fma(_2220, _2662, _2218);
    float _2672 = _2662;
    float _2674 = _2656;
    if (!_2556)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2676 = _2232;
    float _2678 = _2676;
    float _2680 = _2676;
    if (!_2556)
    {
        _2672 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2682 = _2672;
    out.m_95.x = _2668;
    float _2684 = _2682;
    float _2686 = _2682;
    if (!_2556)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2688 = _2674;
    out.m_97.x = _2664;
    out.m_97.y = _2666;
    out.m_97.z = _2670;
    out.m_97.w = _2660;
    bool _2690 = !_2556;
    float _2692 = _2688;
    float _2694 = _2688;
    if (!_2690)
    {
        bool _2696 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2698 = isnan(_2452);
        bool _2700 = _2696 || _2698;
        bool _2702 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2704 = _2700 || _2702;
        if (!_2704)
        {
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2708 = _2452 + _2706;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2712 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = 1.0 / _2712;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = _2708 * _2722;
            float _2730 = precise::clamp(_2728, 0.0, 1.0);
            float _2732 = fma(_2730, _2716, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2734 = fma(_2730, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2736 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2686 = _2734;
            _2680 = _2732;
            _2694 = _2736;
            _2738 = true;
        }
        else
        {
            bool _2740 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2742 = isnan(_2452);
            bool _2744 = _2740 || _2742;
            bool _2746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2748 = _2744 || _2746;
            if (!_2748)
            {
                _2678 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2750 = _2678;
            _2680 = _2750;
            if (!_2748)
            {
                _2684 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2752 = _2684;
            _2686 = _2752;
            if (!_2748)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2754 = _2692;
            bool _2756 = !_2748;
            _2694 = _2754;
            if (!_2756)
            {
                bool _2758 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2760 = isnan(_2452);
                bool _2762 = _2758 || _2760;
                bool _2764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2766 = _2762 || _2764;
                if (!_2766)
                {
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2770 = _2452 + _2768;
                    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2774 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2772;
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2784 = 1.0 / _2774;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2790 = _2770 * _2784;
                    float _2792 = precise::clamp(_2790, 0.0, 1.0);
                    float _2794 = fma(_2792, _2778, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2796 = fma(_2792, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2798 = fma(_2792, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2686 = _2796;
                    _2680 = _2794;
                    _2694 = _2798;
                    _2738 = true;
                }
                else
                {
                    _2686 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2680 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2738 = false;
    float _2800 = _2686;
    float _2802 = _2680;
    float _2804 = _2694;
    float _2806 = _2800 * 0.586610972881317138671875;
    bool _2808 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2810 = _2562 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _2812 = fma(_2802, 0.298911988735198974609375, _2806);
    out.m_61.x = _2810;
    float _2814 = fma(_2804, 0.114477999508380889892578125, _2812);
    float _2816 = -_2814;
    float _2818 = _2816 + _2802;
    float _2820 = -_2814;
    float _2822 = _2820 + _2800;
    float _2824 = -_2814;
    float _2826 = _2824 + _2804;
    float _2828 = fma(_2818, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    float _2830 = fma(_2822, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    float _2832 = fma(_2826, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    out.m_101.x = _2828;
    out.m_101.y = _2830;
    out.m_101.z = _2832;
    if (!_2808)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2834 = -_1993;
    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2838 = -_1995;
    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2842 = -_1997;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2846 = _2836 * _2836;
    float _2848 = fma(_2840, _2840, _2846);
    float _2850 = fma(_2844, _2844, _2848);
    float _2852 = sqrt(_2850);
    float _2854 = rsqrt(_2850);
    float _2856 = -_2852;
    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2862 = precise::clamp(_2860, 0.0, 1.0);
    float _2864 = _2840 * _2854;
    float _2866 = _2836 * _2854;
    float _2868 = abs(_2862);
    float _2870 = log2(_2868);
    float _2872 = _2844 * _2854;
    float _2874 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2876 = _1261 * _2866;
    float _2878 = -_2866;
    float _2880 = -_2874;
    float _2882 = fma(_2878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2880);
    float _2884 = fma(_1259, _2864, _2876);
    float _2886 = -_2872;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2882);
    float _2890 = fma(_1263, _2872, _2884);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2896 = _2888 + _2894;
    float _2898 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2902 = precise::clamp(_2900, 0.0, 1.0);
    float _2904 = exp2(_2898);
    float _2906 = _2904 * _2902;
    float _2908 = _2892 * _2906;
    float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2914 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2910;
    out.m_99.y = _2912;
    out.m_99.z = _2914;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2738 = false;
    bool _1343 = false;
    bool _1331 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2971 = as_type<float>(_136);
        out.gl_Position.z = _2971;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_174);
        out.gl_Position.z = _3040;
    }
    if (_168)
    {
        return out;
    }
    float _176 = in.m_65.x;
    float _178 = in.m_65.y;
    float _180 = in.m_65.z;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    float _188 = in.m_69.x;
    float _190 = in.m_69.y;
    float _192 = in.m_69.z;
    float _194 = in.m_71.x;
    float _196 = _176 * _176;
    float _198 = _178 * _178;
    float _200 = _180 * _180;
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _226 = _208;
    float _228 = _224;
    float _230 = _212;
    float _232 = _192;
    if (_220)
    {
        float _234 = rsqrt(_208);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = _224 * _194;
    bool _240 = _218 > 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    float _246 = _218;
    if (!_220)
    {
        _242 = 0.0;
        _244 = 0.0;
    }
    float _248 = _242;
    float _250 = _244;
    float _252 = _248;
    float _254 = _250;
    if (!_220)
    {
        _246 = 0.0;
    }
    float _256 = _246;
    float _258 = _256;
    if (!_222)
    {
        _228 = 0.0;
    }
    float _260 = _228;
    float _262 = 0.0;
    float _264 = _260;
    if (_222)
    {
        float _266 = rsqrt(_210);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    if (!_222)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = _272;
    if (!_240)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    if (_220)
    {
        float _288 = _236 * _182;
        _258 = _288;
    }
    float _290 = _258;
    if (_220)
    {
        float _292 = _236 * _176;
        _252 = _292;
    }
    float _294 = _252;
    if (_220)
    {
        float _296 = _236 * _188;
        _254 = _296;
    }
    float _298 = _254;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 0.0;
    if (!_240)
    {
        _302 = 0.0;
    }
    float _304 = _302;
    float _306 = trunc(_238);
    int _308 = int(_306);
    float _310 = _304;
    if (!_222)
    {
        _230 = 0.0;
    }
    float _312 = _230;
    float _314 = _312;
    if (_222)
    {
        float _316 = _268 * _184;
        _264 = _316;
    }
    float _318 = _264;
    float _320 = 0.0;
    if (!_240)
    {
        _320 = 0.0;
    }
    float _322 = _320;
    float _324 = _322;
    if (_222)
    {
        float _326 = _268 * _178;
        _276 = _326;
    }
    float _328 = _276;
    if (_222)
    {
        float _330 = _268 * _190;
        _314 = _330;
    }
    float _332 = _314;
    if (_240)
    {
        float _334 = _286 * _186;
        _282 = _334;
    }
    float _336 = _282;
    if (_240)
    {
        float _338 = _286 * _180;
        _310 = _338;
    }
    float _340 = _310;
    if (_240)
    {
        float _342 = _286 * _192;
        _324 = _342;
    }
    float _344 = _324;
    int _346 = _308 << 4;
    int _348 = _346 + 1712;
    bool _350 = !_300;
    float _366;
    if (!_350)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_120);
        float _372 = 1.0 / _370;
        float _374 = _154 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_58.x;
    float _380 = in.m_58.y;
    float _382 = in.m_58.z;
    float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _386 = log2(_384);
    float _388 = in.m_73.x;
    float _390 = in.m_73.y;
    float _392 = in.m_73.z;
    float _394 = in.m_75.y;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _398 = _396 != 0;
    float _400 = in.m_71.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _404 = _402 != 0;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _408 = _386 * _154;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _420 = _418 != 0;
    float _422 = in.m_75.x;
    bool _424 = _194 > 0.5;
    bool _426 = _424 && _404;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _428;
    float _432 = _184 * _380;
    float _434 = _178 * _380;
    float _436 = _190 * _380;
    float _438 = in.m_71.z;
    float _440 = fma(_182, _378, _432);
    float _442 = fma(_176, _378, _434);
    float _444 = fma(_188, _378, _436);
    float _446 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _448 = -_394;
    float _450 = _448 + 1.0;
    float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _454 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _400 > 0.5;
    float _462 = _194 * 2.0;
    float _464 = _388 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _466 = _394;
    if (_398)
    {
        float _468 = _460 ? _450 : _394;
        _466 = _468;
    }
    float _470 = _466;
    float _472 = 1.0 / _458;
    float _474 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _476 = -_406;
    float _478 = fma(_454, 2.0, _476);
    float _480 = fma(_192, _382, _444);
    float _482 = floor(_462);
    float _484 = _422;
    if (_404)
    {
        _232 = _422;
    }
    float _486 = _232;
    float _488 = fma(_186, _382, _440);
    float _490 = _452 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _496 = _486;
    if (_426)
    {
        float _498 = -_486;
        float _500 = _498 + 1.0;
        _496 = _500;
    }
    float _502 = _496;
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = exp2(_408);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _530 = _430 * _472;
    float _532 = _194 + _438;
    float _534 = 1.0 / _518;
    float _536 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _532 + (-1.0);
    if (_404)
    {
        _484 = _502;
    }
    float _544 = _484;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _550 = 1.0 / _522;
    float _552 = fma(_180, _382, _442);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _556 = 1.0 + _554;
    out.m_79.x = _536;
    out.m_79.y = _538;
    out.m_79.z = _540;
    float _558 = fma(_490, _470, -0.5);
    float _560 = -_514;
    float _562 = _560 + 1.0;
    float _564 = 1.0 / _556;
    float _566 = _494 * _534;
    float _568 = _438 * 2.0;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _584 = fma(_548, -2.0, _546);
    float _586 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _588 = _194 + _400;
    float _590 = in.m_81.x;
    float _592 = in.m_81.y;
    float _594 = in.m_81.z;
    float _596 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[79].z, _580);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _582);
    float _602 = _578 ? _562 : 0.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    bool _610 = _482 > 0.0;
    float _612 = floor(_568);
    bool _614 = _482 >= 0.0;
    bool _616 = isnan(_482);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = _400 + _438;
    float _626 = _588 + (-1.0);
    float _628 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _630 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[79].x, _596);
    float _632 = -_154;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _636 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _600);
    float _638 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _584);
    float _640 = _606 * _550;
    float _642 = _636;
    if (_512)
    {
        float _644 = _602 * _564;
        _158 = _644;
    }
    float _646 = _158;
    float _648 = in.m_67.w;
    float _650 = _624 + (-1.0);
    float _652 = _400 * 2.0;
    float _654 = in.m_65.w;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _658 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = in.m_69.w;
    float _662 = floor(_652);
    bool _664 = _612 > 0.0;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _590);
    bool _668 = _612 >= 0.0;
    bool _670 = isnan(_612);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _592);
    float _680 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _682 = _658 * _666;
    float _684 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _686 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _688 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_376);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _680 * _678;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _376 + _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _594);
    bool _708 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _710 = isnan(_376);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_698;
    float _722 = _720 + 1.0;
    float _724 = fma(_530, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _726 = _622 ? 0 : 1;
    float _728 = _686 * _706;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _376 + _730;
    bool _734 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_376);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    bool _750 = _662 > 0.0;
    float _752 = _488 + _648;
    bool _754 = !_416;
    int _756 = _754 ? 0 : 1;
    float _758 = _552 + _654;
    float _760 = _480 + _660;
    bool _762 = _662 >= 0.0;
    bool _764 = isnan(_662);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = in.m_83.x;
    float _774 = in.m_83.y;
    float _776 = in.m_83.z;
    float _778 = _718 * _722;
    float _780 = fma(_566, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _784 = _376 + _782;
    bool _786 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _788 = isnan(_376);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _744 * _748;
    float _800 = -_744;
    float _802 = _800 + 1.0;
    int _804 = abs(_756);
    float _806 = fma(_640, _784, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _808 = ~_726;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _796 * _802;
    int _816 = _812;
    if (!_610)
    {
        int _818 = ~_726;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = _758 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _826 = _770 ? 0 : 1;
    float _828 = _724 * _814;
    float _830 = _752 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _832 = ~_826;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _840 = float(_804);
    float _842 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _844 = float(_822);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _848 = _836;
    if (!_750)
    {
        int _850 = ~_826;
        int _852 = _850 + 1;
        _848 = _852;
    }
    int _854 = _848;
    float _856 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _858 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].y, _838);
    float _860 = _840 * _844;
    float _862 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].z, _842);
    float _864 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].x, _856);
    float _866 = _760 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _868 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _870 = _860 * (-2.0);
    float _872 = _400 + (-0.5);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].x, _864);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].z, _862);
    float _878 = fma(_870, _774, _774);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].y, _858);
    float _882 = _874 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _886 = _676 ? 0 : 1;
    float _888 = fma(_656, _870, _656);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = _630 * (-0.15915493667125701904296875);
    float _894 = _882 * _846;
    bool _896 = !_412;
    int _898 = _896 ? 0 : 1;
    float _900 = _876 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _902 = _880 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    int _904 = ~_886;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = _892 * 6.283185482025146484375;
    float _912 = sin(_910);
    int _914 = _908;
    if (!_664)
    {
        int _916 = ~_886;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = _900 * _868;
    int _924 = abs(_898);
    int _926 = _348 + 8;
    uint _929 = uint(int(uint(_926) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    float _937 = -_796;
    float _939 = _937 + 1.0;
    float _941 = _902 * _884;
    bool _943 = !_420;
    int _945 = _943 ? 0 : 1;
    float _947 = _892 * 6.283185482025146484375;
    float _949 = cos(_947);
    float _951 = float(_924);
    float _953 = fma(_888, _646, _890);
    int _955 = abs(_945);
    float _957 = fma(_941, 0.5, 0.5);
    float _959 = float(_920);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[115].x, _828);
    float _963 = float(_955);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _967 = uint(int(uint(_348) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[int(_977)][_979];
    float _983 = _951 * _959;
    float _985 = float(_854);
    float _987 = _194 + (-0.5);
    float _989 = fma(_780, _798, _961);
    float _991 = _983 * (-2.0);
    float _993 = _438 + (-0.5);
    float _995 = _963 * _985;
    bool _997 = _592 != 0.0;
    bool _999 = isnan(_592);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_991, _772, _772);
    float _1009 = fma(_684, _991, _684);
    float _1011 = _995 * (-2.0);
    float _1013 = _953 * 0.15915493667125701904296875;
    float _1015 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1007);
    bool _1017 = _590 == 0.0;
    bool _1019 = !_1005;
    bool _1021 = _1017 && _1019;
    float _1023 = fma(_1011, _776, _776);
    float _1025 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1027 = fma(_1009, _646, _1015);
    float _1029 = fma(_586, _1011, _586);
    float _1031 = in.m_85.x;
    float _1033 = in.m_85.y;
    float _1035 = in.m_85.z;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1023);
    float _1039 = fma(_1025, _544, -0.5);
    float _1041 = _912 * _558;
    float _1043 = _949 * _558;
    float _1045 = _1027 * 0.15915493667125701904296875;
    float _1047 = fma(_1029, _646, _1037);
    float _1049 = -_1041;
    float _1051 = fma(_949, _1039, _1049);
    float _1053 = fma(_912, _1039, _1043);
    float _1055 = fma(_806, _778, _989);
    float _1057 = _1013 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = _1047 * 0.15915493667125701904296875;
    float _1063 = fma(_894, 0.5, 0.5);
    bool _1065 = _594 == 0.0;
    bool _1067 = _1065 && _1021;
    float _1069 = fma(_628, _1051, _634);
    float _1071 = -_638;
    float _1073 = fma(_636, _1053, _1071);
    float _1075 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1055);
    float _1077 = _935 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1079 = _1013 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    float _1083 = _1069 + 0.5;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1073 + 0.5;
    float _1091 = fma(_922, 0.5, 0.5);
    float _1093 = _1045 * 6.283185482025146484375;
    float _1095 = sin(_1093);
    float _1097 = _1031;
    float _1099 = _1033;
    float _1101 = _1035;
    if (!_1067)
    {
        float _1103 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1031);
        _1097 = _1103;
    }
    float _1105 = _1097;
    if (!_1067)
    {
        float _1107 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1099 = _1107;
    }
    float _1109 = _1099;
    float _1111 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1067)
    {
        float _1115 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
        _1101 = _1115;
    }
    float _1117 = _1101;
    out.m_87.x = _1083;
    out.m_87.y = _1089;
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1045 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    float _1125 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1127 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1129 = isnan(1.0);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1135 = _1131 || _1133;
    out.m_89.x = _1119;
    out.m_89.y = _1125;
    out.m_89.z = _1087;
    out.m_89.w = _1085;
    float _1137 = floor(_957);
    float _1139 = _1095 * _1059;
    float _1141 = _1061 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1123 * _1081;
    float _1147 = _1061 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = -_1137;
    float _1153 = _957 + _1151;
    float _1155 = _1095 * _1081;
    float _1157 = floor(_1063);
    float _1159 = _1095 * _1143;
    float _1161 = _1123 * _1059;
    float _1163 = _1081 * _1143;
    float _1165 = _1123 * _1143;
    float _1167 = _1059 * _1143;
    float _1169 = fma(_1149, _1145, _1139);
    float _1171 = fma(_1149, _1139, _1145);
    float _1173 = -_700;
    float _1175 = _1149 * _1173;
    float _1177 = -_1109;
    float _1179 = _1149 * _1177;
    float _1181 = -_1161;
    float _1183 = fma(_1149, _1155, _1181);
    float _1185 = -_1155;
    float _1187 = fma(_1149, _1161, _1185);
    float _1189 = fma(_1163, _682, _1175);
    float _1191 = _1165 * _700;
    float _1193 = -_1157;
    float _1195 = _1063 + _1193;
    float _1197 = fma(_1153, 2.0, -1.0);
    float _1199 = fma(_1163, _1105, _1179);
    float _1201 = _1159 * _700;
    float _1203 = _1165 * _1109;
    float _1205 = _1159 * _1109;
    float _1207 = fma(_1195, 2.0, -1.0);
    float _1209 = _1197 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1211 = fma(_1183, _682, _1201);
    float _1213 = fma(_1169, _1105, _1203);
    float _1215 = fma(_1183, _1105, _1205);
    float _1217 = fma(_1169, _682, _1191);
    float _1219 = fma(_1167, _728, _1189);
    float _1221 = _1207 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1223 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1225 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1229 = floor(_1091);
    float _1231 = fma(_1187, _1117, _1213);
    float _1233 = fma(_1167, _1117, _1199);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1223);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1225);
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1227);
    float _1241 = fma(_1187, _728, _1217);
    float _1243 = _1231 * _318;
    float _1245 = _1231 * _328;
    float _1247 = _1231 * _332;
    float _1249 = fma(_1171, _1117, _1215);
    float _1251 = fma(_1233, _290, _1243);
    float _1253 = fma(_1233, _294, _1245);
    float _1255 = fma(_1233, _298, _1247);
    float _1257 = fma(_1171, _728, _1211);
    float _1259 = fma(_1249, _336, _1251);
    float _1261 = fma(_1249, _340, _1253);
    float _1263 = fma(_1249, _344, _1255);
    float _1265 = -_1229;
    float _1267 = _1091 + _1265;
    float _1269 = _1241 * _318;
    float _1271 = _1241 * _328;
    float _1273 = _1241 * _332;
    out.m_91.x = _1259;
    out.m_91.y = _1261;
    out.m_91.z = _1263;
    float _1275 = fma(_1267, 2.0, -1.0);
    float _1277 = fma(_1219, _290, _1269);
    float _1279 = fma(_1219, _294, _1271);
    float _1281 = fma(_1219, _298, _1273);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1285 = fma(_1257, _336, _1277);
    float _1287 = fma(_1257, _340, _1279);
    float _1289 = fma(_1257, _344, _1281);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1235);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1237);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1239);
    float _1297 = _1291 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1299 = _1293 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1301 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1303 = _1285 + _1297;
    float _1305 = _1287 + _1299;
    float _1307 = _1289 + _1301;
    float _1309 = _1239;
    float _1311 = _1257;
    float _1313 = _1273;
    float _1315 = _1277;
    float _1317 = _1273;
    float _1319 = _1207;
    float _1321 = _1197;
    float _1323 = _1289;
    float _1325 = _1275;
    float _1335;
    float _1337;
    float _1339;
    float _1341;
    if (!_1135)
    {
        bool _1327 = _1299 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1329 = !_1327;
        _1331 = _1329;
        if (!_1331)
        {
            float _1333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1335 = _1333;
            _1337 = 0.0;
            _1339 = 0.0;
            _1341 = 0.0;
            _1343 = true;
        }
    }
    if ((!_1343) || _1331)
    {
        bool _1379;
        if (!_1331)
        {
            bool _1345 = _1299 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1347 = isnan(_1299);
            bool _1349 = _1345 || _1347;
            bool _1351 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1353 = _1349 || _1351;
            bool _1355 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1357 = !_1353;
            bool _1359 = _1355 && _1357;
            bool _1361 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1315 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1359)
            {
                _1309 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1363 = _1309;
            float _1365 = _1363;
            if (_1359)
            {
                _642 = 0.0;
            }
            float _1367 = _642;
            _1337 = _1367;
            if (_1359)
            {
                _1311 = 0.0;
            }
            float _1369 = _1311;
            _1339 = _1369;
            if (_1359)
            {
                float _1371 = _1363 * 5.0;
                _1365 = _1371;
            }
            float _1373 = _1365;
            _1335 = _1373;
            if (_1359)
            {
                _1313 = 0.0;
            }
            float _1375 = _1313;
            bool _1377 = !_1353;
            _1379 = _1377 && _1361;
            _1317 = _1375;
            _1341 = _1375;
        }
        if ((!_1379) || _1331)
        {
            _1331 = false;
            float _1381 = _1315;
            float _1383 = _1317;
            bool _1385 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1387 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1389 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1391 = _1287;
            float _1393 = _1381;
            float _1395 = _1383;
            _1335 = _1307;
            _1337 = _1303;
            _1339 = _1305;
            if (_1385)
            {
                float _1397 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1391 = _1397;
            }
            float _1399 = _1391;
            if (_1385)
            {
                float _1401 = abs(_1207);
                float _1403 = -_1401;
                float _1405 = _1403 + 1.0;
                _1319 = _1405;
            }
            float _1407 = _1319;
            if (_1387)
            {
                float _1409 = abs(_1197);
                float _1411 = -_1409;
                float _1413 = _1411 + 1.0;
                _1321 = _1413;
            }
            float _1415 = _1321;
            if (!_1385)
            {
                _1323 = 1.0;
            }
            float _1417 = _1323;
            float _1419 = _1417;
            if (_1389)
            {
                float _1421 = abs(_1275);
                float _1423 = -_1421;
                float _1425 = _1423 + 1.0;
                _1325 = _1425;
            }
            float _1427 = _1325;
            if (!_1387)
            {
                _1393 = 1.0;
            }
            float _1429 = _1393;
            float _1431 = _1429;
            if (!_1389)
            {
                _1395 = 1.0;
            }
            float _1433 = _1395;
            float _1435 = _1251;
            float _1437 = _1433;
            if (_1387)
            {
                float _1439 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1435 = _1439;
            }
            float _1441 = _1435;
            float _1443 = _1283;
            if (_1389)
            {
                float _1445 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1443 = _1445;
            }
            float _1447 = _1443;
            if (_1385)
            {
                float _1449 = _1407 * _1399;
                float _1451 = precise::clamp(_1449, 0.0, 1.0);
                _1419 = _1451;
            }
            float _1453 = _1419;
            if (_1387)
            {
                float _1455 = _1415 * _1441;
                float _1457 = precise::clamp(_1455, 0.0, 1.0);
                _1431 = _1457;
            }
            float _1459 = _1431;
            float _1461 = _1453 * _1459;
            if (_1389)
            {
                float _1463 = _1427 * _1447;
                float _1465 = precise::clamp(_1463, 0.0, 1.0);
                _1437 = _1465;
            }
            float _1467 = _1437;
            float _1469 = _1461 * _1467;
            _1341 = _1469;
        }
    }
    _1343 = false;
    float _1471 = _1335;
    float _1473 = _1337;
    float _1475 = _1339;
    float _1477 = _1341;
    float _1479 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1481 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1483 = floor(_1479);
    float _1485 = floor(_1481);
    float _1487 = -_1483;
    float _1489 = _1479 + _1487;
    float _1491 = -_1485;
    float _1493 = _1481 + _1491;
    float2 _5081 = float2(_1489, _1493);
    float _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5081, float2(0.0), isnan(_5081)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5081, float2(0.0), isnan(_5081)), level(0.0)).x;
    float _1497 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1501 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1505 = _1471 + _1503;
    float _1507 = _1299 + _1499;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1511 = _1473 + _1509;
    float _1513 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1501);
    float _1515 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1519 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1521 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1515);
    float _1523 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1517);
    bool _1525 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1527 = isnan(0.5);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1533 = _1529 || _1531;
    float _1535 = 1.0 / _1519;
    float _1537 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1521);
    float _1539 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1523);
    float _1541 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1543 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1545 = _1541 + _1519;
    float _1547 = _1545 * _1535;
    float _1549 = _1547 * 0.5;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1553 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1551);
    float _1555 = 1.0 / _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1559 = _1555 * _1557;
    float _1561 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1563 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1565 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1561);
    bool _1567 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1569 = !_1563;
    int _1571 = _1569 ? 0 : 1;
    float _1573 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1565);
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1577 = 2;
    float _1579 = _1473;
    float _1581 = _1471;
    float _1583 = _1475;
    int _1585 = as_type<int>(_1511);
    if (!_1563)
    {
        _1577 = 1;
    }
    int _1587 = _1577;
    float _1589 = trunc(_1575);
    int _1591 = int(_1589);
    int _1593 = _1587;
    if (!_1567)
    {
        _1593 = _1571;
    }
    int _1595 = _1593;
    int _1597 = _1595 << 6;
    float _1599 = trunc(_1543);
    int _1601 = int(_1599);
    int _1603 = _1597 + 96;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c15)._m0[int(_1615)][_1617];
    int _1621 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1623 = _1591 + _1621;
    int _1625 = _1623 + 1;
    int _1627 = _1597 + 104;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    float _1645 = _1505 * _1505;
    float _1647 = fma(_1511, _1511, _1645);
    int _1649 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1651 = _1601 + _1649;
    int _1653 = _1651 + 1;
    int _1655 = _1597 + 64;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    float _1673 = sqrt(_1647);
    bool _1675 = _1653 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1677 = _1653 | _1625;
    int _1679 = _1597 + 48;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    uint _1683 = uint(int(uint(int(_1681)) >> uint(2)));
    int _1685 = int(_1681) & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    int _1689 = int(_1681) + 1;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    int _1693 = _1689 & 3;
    float _1695 = (*spvDescriptorSet0.vp_c15)._m0[int(_1691)][_1693];
    bool _1697 = _1677 < 0;
    bool _1699 = _1697 || _1675;
    bool _1701 = _1625 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1703 = _1701 || _1699;
    int _1705 = _1597 + 56;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
    int _1711 = int(_1707) & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    int _1715 = int(_1707) + 1;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    int _1719 = _1715 & 3;
    float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
    bool _1723 = _1673 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1725 = _1597 + 72;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    float _1743 = as_type<float>(_1677);
    if (!_1703)
    {
        float _1745 = floor(_1543);
        _1743 = _1745;
    }
    float _1747 = _1743;
    int _1749 = _1597 + 80;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.vp_c15)._m0[int(_1761)][_1763];
    float _1767 = _1507 * _1619;
    float _1769 = fma(_1297, _1611, _1767);
    float _1771 = fma(_1301, _1635, _1769);
    float _1773 = _1771 + _1643;
    int _1775 = as_type<int>(_1771);
    float _1777 = _1611;
    if (!_1703)
    {
        int _1779 = _1625 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1781 = _1779 + _1653;
        _1775 = _1781;
    }
    int _1783 = _1775;
    float _1785 = _1507 * _1671;
    float _1787 = 1.0 / _1773;
    float _1789 = fma(_1297, _1663, _1785);
    float _1791 = _1663;
    int _1793 = as_type<int>(_1687);
    float _1795 = _1785;
    int _1797 = as_type<int>(_1789);
    if (!_1723)
    {
        _1791 = _1475;
    }
    float _1799 = _1791;
    float _1801 = _1507 * _1695;
    float _1803 = fma(_1297, _1687, _1801);
    bool _1805 = !_1723;
    float _1807 = _1799;
    float _1809 = _1765;
    float _1811 = _1747;
    if (!_1805)
    {
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1817 = _1673 + _1815;
        float _1819 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = rsqrt(_1647);
        float _1823 = _1817 * _1813;
        float _1825 = _1823 * 0.15915493667125701904296875;
        float _1827 = _1825 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = _1825 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1829 + (-1.0);
        float _1837 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1839 = fma(_1833, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1841 = fma(_1829, _1475, _1837);
        float _1843 = _1821 * _1839;
        float _1845 = fma(_1511, _1843, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1847 = fma(_1505, _1843, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1579 = _1845;
        _1581 = _1847;
        _1807 = _1841;
        _1793 = as_type<int>(_1833);
        _1795 = _1843;
        _1777 = _1825;
    }
    float _1849 = _1579;
    float _1851 = _1581;
    float _1853 = _1807;
    int _1855 = _1793;
    float _1857 = _1795;
    float _1859 = _1777;
    float _1861 = fma(_1301, _1733, _1789);
    int _1863 = _1855;
    float _1865 = _1857;
    float _1867 = _1853;
    float _1869 = _1859;
    if (!_1703)
    {
        int _1871 = _1783 << 2;
        _1797 = _1871;
    }
    int _1873 = _1797;
    float _1875 = fma(_1301, _1713, _1803);
    int _1877 = _1873;
    if (_1533)
    {
        _1583 = _1849;
    }
    float _1879 = _1583;
    float _1881 = _1879;
    if (!_1703)
    {
        uint _1883 = uint(int(uint(_1783) >> uint(2)));
        _1863 = int(_1883);
    }
    int _1885 = _1863;
    if (!_1703)
    {
        int _1887 = 12 & _1873;
        _1877 = _1887;
    }
    int _1889 = _1877;
    if (_1533)
    {
        _1865 = _1851;
    }
    float _1891 = _1865;
    float _1893 = _1891;
    if (!_1533)
    {
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1897 = _1299 + _1895;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1901 = _1297 + _1899;
        float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1905 = -_1299;
        float _1907 = _1905 + _1853;
        float _1909 = _1897 * _1897;
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1913 = _1301 + _1911;
        float _1915 = -_1297;
        float _1917 = _1915 + _1849;
        float _1919 = -_1301;
        float _1921 = _1919 + _1851;
        float _1923 = fma(_1901, _1901, _1909);
        float _1925 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1927 = fma(_1913, _1913, _1923);
        float _1929 = sqrt(_1927);
        float _1931 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1933 = _1929 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1935 = isnan(_1929);
        bool _1937 = _1933 || _1935;
        bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1941 = _1937 || _1939;
        float _1943 = precise::min(_1929, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1945 = _1943 * _1903;
        float _1947 = _1931 * _1945;
        float _1949 = _1619;
        float _1951 = _1943;
        float _1953 = _1929;
        _1869 = _1907;
        if (_1941)
        {
            float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1949 = _1955;
        }
        float _1957 = _1949;
        if (_1941)
        {
            float _1959 = precise::max(_1929, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1951 = _1959;
        }
        float _1961 = _1951;
        float _1963 = fma(_1907, _1947, _1299);
        float _1965 = _1963;
        if (_1941)
        {
            float _1967 = _1961 * _1957;
            _1953 = _1967;
        }
        float _1969 = _1953;
        float _1971 = fma(_1917, _1947, _1297);
        float _1973 = fma(_1921, _1947, _1301);
        float _1975 = _1969;
        float _1977 = _1971;
        _1893 = _1973;
        if (_1941)
        {
            float _1979 = _1931 * _1969;
            _1975 = _1979;
        }
        float _1981 = _1975;
        if (_1941)
        {
            float _1983 = fma(_1907, _1981, _1299);
            _1965 = _1983;
        }
        float _1985 = _1965;
        _1867 = _1985;
        if (_1941)
        {
            float _1987 = fma(_1917, _1981, _1297);
            _1977 = _1987;
        }
        float _1989 = _1977;
        _1881 = _1989;
        if (_1941)
        {
            float _1991 = fma(_1921, _1981, _1301);
            _1893 = _1991;
        }
    }
    float _1993 = _1867;
    float _1995 = _1881;
    float _1997 = _1893;
    float _1999 = _1869;
    if (!_1703)
    {
        int _2001 = _1885 << 4;
        int _2003 = _2001 + _1889;
        _1585 = _2003;
    }
    int _2005 = _1585;
    float _2007 = _1861 + _1741;
    float _2009 = _1875 + _1721;
    float _2011 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2013 = _1597 + 88;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2033 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2035 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2011);
    float _2037 = _2009 * _1787;
    float _2039 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2031);
    float _2041 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2033);
    float _2043 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2045 = _2009;
    float _2047 = as_type<float>(_2005);
    if (!_1703)
    {
        int _2049 = _2005 + 400;
        uint _2051 = uint(int(uint(_2049) >> uint(2)));
        uint _2053 = uint(int(uint(int(_2051)) >> uint(2)));
        int _2055 = int(_2051) & 3;
        float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
        _2045 = _2057;
    }
    float _2059 = _2045;
    float _2061 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2039);
    float _2063 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2041);
    bool _2065 = _2037 >= 0.0;
    float _2067 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2043);
    float _2069 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2071 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2073 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2075 = _2007 * _1787;
    bool _2077 = _2037 <= 1.0;
    bool _2079 = _2077 && _2065;
    float _2081 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2083 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2085 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    bool _2087 = _2075 >= 0.0;
    bool _2089 = _2087 && _2079;
    float _2091 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2093 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2083);
    float _2095 = _1999;
    if (!_1703)
    {
        float _2097 = floor(_1575);
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = _2075 <= 1.0;
    bool _2103 = _2101 && _2089;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2109 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2093);
    float _2111 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2113 = -_2105;
    float _2115 = fma(_2113, _2091, 1.0);
    float _2117 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2109);
    float _2121 = _1507 * _1765;
    float _2123 = log2(_2115);
    float _2125 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2111);
    float _2127 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2117);
    float _2129 = fma(_1297, _1757, _2121);
    float _2131 = _2129;
    if (_2103)
    {
        float _2133 = float(_1595);
        _1809 = _2133;
    }
    float _2135 = _1809;
    if (!_1703)
    {
        float _2137 = -_1747;
        float _2139 = _1543 + _2137;
        _2047 = _2139;
    }
    float _2141 = _2047;
    float _2143 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2145 = 1.0 / _2119;
    float _2147 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    float _2149 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2143);
    float _2151 = fma(_1301, _2021, _2129);
    if (!_1703)
    {
        float _2153 = -_2099;
        float _2155 = _1575 + _2153;
        _2131 = _2155;
    }
    float _2157 = _2131;
    float _2159 = _2121;
    if (_2103)
    {
        float _2161 = rint(_2135);
        float _2163 = precise::max(_2161, 0.0);
        uint _2165 = uint(_2163);
        uint _2167 = clamp(_2165, 0u, 65535u);
        _2159 = as_type<float>(_2167);
    }
    float _2169 = _2159;
    float _2171 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2147);
    float _2173 = _2151 + _2029;
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = _2173 * _1787;
    float _2179 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2181 = _2147;
    float _2183 = _2179;
    if (!_1703)
    {
        float _2185 = rint(_2059);
        float _2187 = precise::max(_2185, 0.0);
        uint _2189 = uint(_2187);
        uint _2191 = clamp(_2189, 0u, 65535u);
        _2181 = as_type<float>(_2191);
    }
    float _2193 = _2181;
    float _2195 = _2149 * _2145;
    float _2197 = _2171 * _2145;
    float _2199 = fma(_2195, 0.5, 0.5);
    float _2201 = fma(_2197, -0.5, 0.5);
    float _2203 = _2075;
    if (_2103)
    {
        float3 _6261 = float3(_2037, _2075, float(as_type<int>(_2169)));
        float3 _6265 = select(_6261, float3(0.0), isnan(_6261));
        float _2205 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6265.xy, uint(rint(_6265.z)), _2177, level(0.0));
        _2203 = _2205;
    }
    float _2207 = _2203;
    float3 _6275 = float3(_2199, _2201, _2179);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6275, float3(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6275, float3(0.0), isnan(_6275)), level(0.0)).x;
    float3 _6284 = float3(_2199, _2201, _2179);
    float4 _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6284, float3(0.0), isnan(_6284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6284, float3(0.0), isnan(_6284)), level(0.0)).xyzw;
    float _2214 = _2212.x;
    float _2216 = _2212.y;
    float _2218 = _2212.z;
    float _2220 = _2212.w;
    float _2222 = _2141;
    if (!_1703)
    {
        float3 _6307 = float3(_2141, _2157, float(as_type<int>(_2193)));
        float3 _6309 = select(_6307, float3(0.0), isnan(_6307));
        float _2224 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6309.xy, uint(rint(_6309.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6309.xy, uint(rint(_6309.z)), level(0.0)).x;
        _2222 = _2224;
    }
    float _2226 = _2222;
    if (_1703)
    {
        _1811 = 1.0;
    }
    float _2228 = _1811;
    float _2230 = _2228;
    float _2232 = _2214;
    if (!_1703)
    {
        int _2234 = _1783 << 4;
        int _2236 = _2234 + 2048;
        uint _2238 = uint(int(uint(_2236) >> uint(2)));
        uint _2240 = uint(int(uint(int(_2238)) >> uint(2)));
        int _2242 = int(_2238) & 3;
        float _2244 = (*spvDescriptorSet0.vp_c15)._m0[int(_2240)][_2242];
        int _2246 = int(_2238) + 1;
        uint _2248 = uint(int(uint(_2246) >> uint(2)));
        int _2250 = _2246 & 3;
        float _2252 = (*spvDescriptorSet0.vp_c15)._m0[int(_2248)][_2250];
        int _2254 = _2236 + 8;
        uint _2256 = uint(int(uint(_2254) >> uint(2)));
        uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
        int _2260 = int(_2256) & 3;
        float _2262 = (*spvDescriptorSet0.vp_c15)._m0[int(_2258)][_2260];
        int _2264 = int(_2256) + 1;
        uint _2266 = uint(int(uint(_2264) >> uint(2)));
        int _2268 = _2264 & 3;
        float _2270 = (*spvDescriptorSet0.vp_c15)._m0[int(_2266)][_2268];
        float _2272 = _1507 * _2252;
        float _2274 = fma(_1297, _2244, _2272);
        float _2276 = fma(_1301, _2262, _2274);
        float _2278 = _2276 + _2270;
        float _2280 = precise::clamp(_2278, 0.0, 1.0);
        float _2282 = -_2280;
        float _2284 = _2282 + _2226;
        float _2286 = fma(_2284, 500.0, 1.5);
        float _2288 = exp2(_2286);
        float _2290 = 0.0 + _2288;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        _2230 = _2292;
    }
    float _2294 = _2230;
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2298 = _1993 + _2296;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2302 = _1995 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2306 = _1997 + _2304;
    float _2308 = _2298 * _2298;
    float _2310 = fma(_2302, _2302, _2308);
    float _2312 = fma(_2306, _2306, _2310);
    float _2314 = rsqrt(_2312);
    float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2318 = _2302 * _2316;
    float _2320 = _2306 * _2316;
    float _2322 = _2318 * _2318;
    float _2324 = _2320 * _2320;
    float _2326 = _2322 + _2324;
    float _2328 = sqrt(_2326);
    bool _2330 = _2328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2334 = _2328 + _2332;
    float _2336 = _2306;
    float _2338 = _2314;
    float _2340 = _2334;
    float _2342 = _2308;
    float _2344 = _2298;
    float _2346 = _2322;
    if (_2330)
    {
        float _2348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2336 = _2348;
    }
    float _2350 = _2336;
    if (_2330)
    {
        float _2352 = rsqrt(_2326);
        _2338 = _2352;
    }
    float _2354 = _2338;
    float _2356 = _2354;
    if (_2330)
    {
        float _2358 = _2334 * _2350;
        _2340 = _2358;
    }
    float _2360 = _2340;
    if (_2330)
    {
        float _2362 = _2360 * 0.15915493667125701904296875;
        _2342 = _2362;
    }
    float _2364 = _2342;
    float _2366 = _2350;
    float _2368 = _2364;
    if (_2330)
    {
        float _2370 = _2364 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        _2366 = _2372;
    }
    float _2374 = _2366;
    float _2376 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2378 = precise::max(0.0, _2376);
    float _2380 = _1787;
    float _2382 = _2378;
    if (_2330)
    {
        float _2384 = _2364 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        _2380 = _2386;
    }
    float _2388 = _2380;
    float _2390 = -_2316;
    float _2392 = -_2378;
    float _2394 = fma(_2298, _2390, _2392);
    if (_2330)
    {
        float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2396;
    }
    float _2398 = _2382;
    float _2400 = _2398;
    if (!_2330)
    {
        _2368 = _2318;
    }
    float _2402 = _2368;
    float _2404 = _2374;
    float _2406 = _2402;
    if (_2330)
    {
        float _2408 = fma(_2374, _2398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2404 = _2408;
    }
    float _2410 = _2404;
    float _2412 = _2410;
    if (_2330)
    {
        float _2414 = _2388 + (-1.0);
        _2400 = _2414;
    }
    float _2416 = _2400;
    float _2418 = _2416;
    if (_2330)
    {
        float _2420 = _2354 * _2410;
        _2183 = _2420;
    }
    float _2422 = _2183;
    if (!_2330)
    {
        _2356 = _2394;
    }
    float _2424 = _2356;
    float _2426 = _2424;
    if (_2330)
    {
        float _2428 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2344 = _2428;
    }
    float _2430 = _2344;
    if (_2330)
    {
        float _2432 = _2318 * _2422;
        _2406 = _2432;
    }
    float _2434 = _2406;
    if (!_2330)
    {
        _2412 = _2320;
    }
    float _2436 = _2412;
    float _2438 = _2436;
    if (_2330)
    {
        float _2440 = _2320 * _2422;
        _2438 = _2440;
    }
    float _2442 = _2438;
    if (_2330)
    {
        float _2444 = fma(_2394, _2388, _2430);
        _2426 = _2444;
    }
    float _2446 = _2426;
    if (_2330)
    {
        float _2448 = _2434 * _2434;
        _2346 = _2448;
    }
    float _2450 = _2346;
    float _2452 = sqrt(_2312);
    if (!_2330)
    {
        _2418 = _2324;
    }
    float _2454 = _2418;
    float _2456 = _2454;
    if (_2330)
    {
        float _2458 = _2442 * _2442;
        _2456 = _2458;
    }
    float _2460 = _2456;
    float _2462 = fma(_2446, _2446, _2450);
    float _2464 = _2462 + _2460;
    float _2466 = rsqrt(_2464);
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2470 = fma(_2452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2468);
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -_2472;
    float _2476 = _2474 + 1.0;
    float _2478 = abs(_2476);
    float _2480 = log2(_2478);
    float _2482 = _2466 * _2434;
    float _2484 = _2466 * _2446;
    float _2486 = _2466 * _2442;
    float _2488 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2490 = -_2488;
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2490);
    float _2494 = -_2486;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2492);
    float _2498 = _2484 + 1.0;
    float _2500 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2502 = fma(_2496, -0.5, 0.5);
    float _2504 = fma(_2496, 0.5, 0.5);
    float _2506 = exp2(_2500);
    float _2508 = fma(_2504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2510 = fma(_2504, _2508, -0.212114393711090087890625);
    float _2512 = sqrt(_2502);
    float _2514 = fma(_2504, _2510, 1.570728778839111328125);
    float _2516 = -_2484;
    float _2518 = fma(_2506, _2498, _2516);
    float _2520 = fma(_2518, 0.5, 0.5);
    float _2522 = _2512 * 0.636619746685028076171875;
    float _2524 = -_2514;
    float _2526 = fma(_2522, _2524, 1.0);
    float2 _6776 = float2(_2526, _2520);
    float3 _2530 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6776, float2(0.0), isnan(_6776)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6776, float2(0.0), isnan(_6776)), level(0.0)).xyz;
    float _2532 = _2530.x;
    float _2534 = _2530.y;
    float _2536 = _2530.z;
    float _2538 = abs(_1559);
    float _2540 = log2(_2538);
    float _2542 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2544 = -_1495;
    float _2546 = _2544 + 1.0;
    bool _2548 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2550 = isnan(_2452);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2556 = _2552 || _2554;
    float _2558 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2542);
    float _2560 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2562 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2564 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2558);
    float _2566 = exp2(_2560);
    float _2568 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2564);
    float _2570 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2572 = exp2(_2570);
    float _2574 = -_2566;
    float _2576 = _2574 + 1.0;
    float _2578 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2580 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = fma(_2582, -2.0, 3.0);
    float _2586 = _2582 * _2582;
    float _2588 = _2586 * _2584;
    float _2590 = -_2588;
    float _2592 = _2590 + 1.0;
    float _2594 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2588);
    bool _2596 = _1559 <= 8000.0;
    bool _2598 = isnan(_1559);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(8000.0);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    float _2608 = _2568 + _2119;
    float _2610 = _2606 * _2594;
    float _2612 = _2608 * 0.5;
    float _2614 = _2608;
    if (!_2103)
    {
        _2614 = 1.0;
    }
    float _2616 = _2614;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2171;
    out.gl_Position.z = _2568;
    out.gl_Position.w = _2119;
    float _2618 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2620 = _2616;
    if (_2103)
    {
        bool _2622 = _2207 >= _2177;
        bool _2624 = isnan(_2207);
        bool _2626 = _2622 || _2624;
        bool _2628 = isnan(_2177);
        bool _2630 = _2626 || _2628;
        float _2632 = float(_2630);
        _2620 = _2632;
    }
    float _2634 = _2620;
    float _2636 = _2578 * _2209;
    float _2638 = -_2578;
    float _2640 = _2638 + 1.0;
    float _2642 = _2546 * _2618;
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    out.m_93.z = _2612;
    out.m_93.w = _2119;
    float _2646 = _2634 * _2294;
    float _2648 = -_2644;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = -_2646;
    float _2654 = fma(_2652, _2650, 1.0);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = _2220 * _2636;
    float _2660 = _2220 * _2640;
    float _2662 = _2536 * _2636;
    float _2664 = fma(_2532, _2658, _2214);
    float _2666 = fma(_2534, _2658, _2216);
    float _2668 = _2656 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = fma(_2220, _2662, _2218);
    float _2672 = _2662;
    float _2674 = _2656;
    if (!_2556)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2676 = _2232;
    float _2678 = _2676;
    float _2680 = _2676;
    if (!_2556)
    {
        _2672 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2682 = _2672;
    out.m_95.x = _2668;
    float _2684 = _2682;
    float _2686 = _2682;
    if (!_2556)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2688 = _2674;
    out.m_97.x = _2664;
    out.m_97.y = _2666;
    out.m_97.z = _2670;
    out.m_97.w = _2660;
    bool _2690 = !_2556;
    float _2692 = _2688;
    float _2694 = _2688;
    if (!_2690)
    {
        bool _2696 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2698 = isnan(_2452);
        bool _2700 = _2696 || _2698;
        bool _2702 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2704 = _2700 || _2702;
        if (!_2704)
        {
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2708 = _2452 + _2706;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2712 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = 1.0 / _2712;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = _2708 * _2722;
            float _2730 = precise::clamp(_2728, 0.0, 1.0);
            float _2732 = fma(_2730, _2716, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2734 = fma(_2730, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2736 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2686 = _2734;
            _2680 = _2732;
            _2694 = _2736;
            _2738 = true;
        }
        else
        {
            bool _2740 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2742 = isnan(_2452);
            bool _2744 = _2740 || _2742;
            bool _2746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2748 = _2744 || _2746;
            if (!_2748)
            {
                _2678 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2750 = _2678;
            _2680 = _2750;
            if (!_2748)
            {
                _2684 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2752 = _2684;
            _2686 = _2752;
            if (!_2748)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2754 = _2692;
            bool _2756 = !_2748;
            _2694 = _2754;
            if (!_2756)
            {
                bool _2758 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2760 = isnan(_2452);
                bool _2762 = _2758 || _2760;
                bool _2764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2766 = _2762 || _2764;
                if (!_2766)
                {
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2770 = _2452 + _2768;
                    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2774 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2772;
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2784 = 1.0 / _2774;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2790 = _2770 * _2784;
                    float _2792 = precise::clamp(_2790, 0.0, 1.0);
                    float _2794 = fma(_2792, _2778, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2796 = fma(_2792, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2798 = fma(_2792, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2686 = _2796;
                    _2680 = _2794;
                    _2694 = _2798;
                    _2738 = true;
                }
                else
                {
                    _2686 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2680 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2738 = false;
    float _2800 = _2686;
    float _2802 = _2680;
    float _2804 = _2694;
    float _2806 = _2800 * 0.586610972881317138671875;
    bool _2808 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2810 = _2562 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _2812 = fma(_2802, 0.298911988735198974609375, _2806);
    out.m_61.x = _2810;
    float _2814 = fma(_2804, 0.114477999508380889892578125, _2812);
    float _2816 = -_2814;
    float _2818 = _2816 + _2802;
    float _2820 = -_2814;
    float _2822 = _2820 + _2800;
    float _2824 = -_2814;
    float _2826 = _2824 + _2804;
    float _2828 = fma(_2818, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    float _2830 = fma(_2822, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    float _2832 = fma(_2826, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    out.m_101.x = _2828;
    out.m_101.y = _2830;
    out.m_101.z = _2832;
    if (!_2808)
    {
        return out;
    }
    float _2834 = -_1993;
    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2838 = -_1995;
    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2842 = -_1997;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2846 = _2836 * _2836;
    float _2848 = fma(_2840, _2840, _2846);
    float _2850 = fma(_2844, _2844, _2848);
    float _2852 = sqrt(_2850);
    float _2854 = rsqrt(_2850);
    float _2856 = -_2852;
    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2862 = precise::clamp(_2860, 0.0, 1.0);
    float _2864 = _2840 * _2854;
    float _2866 = _2836 * _2854;
    float _2868 = abs(_2862);
    float _2870 = log2(_2868);
    float _2872 = _2844 * _2854;
    float _2874 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2876 = _1261 * _2866;
    float _2878 = -_2866;
    float _2880 = -_2874;
    float _2882 = fma(_2878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2880);
    float _2884 = fma(_1259, _2864, _2876);
    float _2886 = -_2872;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2882);
    float _2890 = fma(_1263, _2872, _2884);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2896 = _2888 + _2894;
    float _2898 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2902 = precise::clamp(_2900, 0.0, 1.0);
    float _2904 = exp2(_2898);
    float _2906 = _2904 * _2902;
    float _2908 = _2892 * _2906;
    float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2914 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2910;
    out.m_99.y = _2912;
    out.m_99.z = _2914;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2738 = false;
    bool _1343 = false;
    bool _1331 = false;
    bool _368 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2971 = as_type<float>(_136);
        out.gl_Position.z = _2971;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_174);
        out.gl_Position.z = _3040;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_65.x;
    float _178 = in.m_65.y;
    float _180 = in.m_65.z;
    float _182 = in.m_67.x;
    float _184 = in.m_67.y;
    float _186 = in.m_67.z;
    float _188 = in.m_69.x;
    float _190 = in.m_69.y;
    float _192 = in.m_69.z;
    float _194 = in.m_71.x;
    float _196 = _176 * _176;
    float _198 = _178 * _178;
    float _200 = _180 * _180;
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = fma(_188, _188, _202);
    float _210 = fma(_190, _190, _204);
    float _212 = fma(_192, _192, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _226 = _208;
    float _228 = _224;
    float _230 = _212;
    float _232 = _192;
    if (_220)
    {
        float _234 = rsqrt(_208);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = _224 * _194;
    bool _240 = _218 > 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    float _246 = _218;
    if (!_220)
    {
        _242 = 0.0;
        _244 = 0.0;
    }
    float _248 = _242;
    float _250 = _244;
    float _252 = _248;
    float _254 = _250;
    if (!_220)
    {
        _246 = 0.0;
    }
    float _256 = _246;
    float _258 = _256;
    if (!_222)
    {
        _228 = 0.0;
    }
    float _260 = _228;
    float _262 = 0.0;
    float _264 = _260;
    if (_222)
    {
        float _266 = rsqrt(_210);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    if (!_222)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = _272;
    if (!_240)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (_240)
    {
        float _284 = rsqrt(_212);
        _280 = _284;
    }
    float _286 = _280;
    if (_220)
    {
        float _288 = _236 * _182;
        _258 = _288;
    }
    float _290 = _258;
    if (_220)
    {
        float _292 = _236 * _176;
        _252 = _292;
    }
    float _294 = _252;
    if (_220)
    {
        float _296 = _236 * _188;
        _254 = _296;
    }
    float _298 = _254;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 0.0;
    if (!_240)
    {
        _302 = 0.0;
    }
    float _304 = _302;
    float _306 = trunc(_238);
    int _308 = int(_306);
    float _310 = _304;
    if (!_222)
    {
        _230 = 0.0;
    }
    float _312 = _230;
    float _314 = _312;
    if (_222)
    {
        float _316 = _268 * _184;
        _264 = _316;
    }
    float _318 = _264;
    float _320 = 0.0;
    if (!_240)
    {
        _320 = 0.0;
    }
    float _322 = _320;
    float _324 = _322;
    if (_222)
    {
        float _326 = _268 * _178;
        _276 = _326;
    }
    float _328 = _276;
    if (_222)
    {
        float _330 = _268 * _190;
        _314 = _330;
    }
    float _332 = _314;
    if (_240)
    {
        float _334 = _286 * _186;
        _282 = _334;
    }
    float _336 = _282;
    if (_240)
    {
        float _338 = _286 * _180;
        _310 = _338;
    }
    float _340 = _310;
    if (_240)
    {
        float _342 = _286 * _192;
        _324 = _342;
    }
    float _344 = _324;
    int _346 = _308 << 4;
    int _348 = _346 + 1712;
    bool _350 = !_300;
    float _366;
    if (!_350)
    {
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _354 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _356 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _358 = _356 * _352;
        float _360 = floor(_358);
        float _362 = -_360;
        float _364 = _358 + _362;
        _366 = _364;
        _368 = true;
    }
    else
    {
        float _370 = float(_120);
        float _372 = 1.0 / _370;
        float _374 = _154 * _372;
        _366 = _374;
    }
    _368 = false;
    float _376 = _366;
    float _378 = in.m_58.x;
    float _380 = in.m_58.y;
    float _382 = in.m_58.z;
    float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _386 = log2(_384);
    float _388 = in.m_73.x;
    float _390 = in.m_73.y;
    float _392 = in.m_73.z;
    float _394 = in.m_75.y;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _398 = _396 != 0;
    float _400 = in.m_71.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _404 = _402 != 0;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _408 = _386 * _154;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _420 = _418 != 0;
    float _422 = in.m_75.x;
    bool _424 = _194 > 0.5;
    bool _426 = _424 && _404;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _428;
    float _432 = _184 * _380;
    float _434 = _178 * _380;
    float _436 = _190 * _380;
    float _438 = in.m_71.z;
    float _440 = fma(_182, _378, _432);
    float _442 = fma(_176, _378, _434);
    float _444 = fma(_188, _378, _436);
    float _446 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _448 = -_394;
    float _450 = _448 + 1.0;
    float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _454 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _400 > 0.5;
    float _462 = _194 * 2.0;
    float _464 = _388 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _466 = _394;
    if (_398)
    {
        float _468 = _460 ? _450 : _394;
        _466 = _468;
    }
    float _470 = _466;
    float _472 = 1.0 / _458;
    float _474 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _476 = -_406;
    float _478 = fma(_454, 2.0, _476);
    float _480 = fma(_192, _382, _444);
    float _482 = floor(_462);
    float _484 = _422;
    if (_404)
    {
        _232 = _422;
    }
    float _486 = _232;
    float _488 = fma(_186, _382, _440);
    float _490 = _452 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _496 = _486;
    if (_426)
    {
        float _498 = -_486;
        float _500 = _498 + 1.0;
        _496 = _500;
    }
    float _502 = _496;
    bool _504 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(1.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = exp2(_408);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _530 = _430 * _472;
    float _532 = _194 + _438;
    float _534 = 1.0 / _518;
    float _536 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _532 + (-1.0);
    if (_404)
    {
        _484 = _502;
    }
    float _544 = _484;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _548 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _550 = 1.0 / _522;
    float _552 = fma(_180, _382, _442);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _556 = 1.0 + _554;
    out.m_79.x = _536;
    out.m_79.y = _538;
    out.m_79.z = _540;
    float _558 = fma(_490, _470, -0.5);
    float _560 = -_514;
    float _562 = _560 + 1.0;
    float _564 = 1.0 / _556;
    float _566 = _494 * _534;
    float _568 = _438 * 2.0;
    bool _570 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _578 = _574 || _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _584 = fma(_548, -2.0, _546);
    float _586 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _588 = _194 + _400;
    float _590 = in.m_81.x;
    float _592 = in.m_81.y;
    float _594 = in.m_81.z;
    float _596 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[79].z, _580);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _582);
    float _602 = _578 ? _562 : 0.0;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _604;
    float _608 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    bool _610 = _482 > 0.0;
    float _612 = floor(_568);
    bool _614 = _482 >= 0.0;
    bool _616 = isnan(_482);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = _400 + _438;
    float _626 = _588 + (-1.0);
    float _628 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _630 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[79].x, _596);
    float _632 = -_154;
    float _634 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _636 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _600);
    float _638 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _584);
    float _640 = _606 * _550;
    float _642 = _636;
    if (_512)
    {
        float _644 = _602 * _564;
        _158 = _644;
    }
    float _646 = _158;
    float _648 = in.m_67.w;
    float _650 = _624 + (-1.0);
    float _652 = _400 * 2.0;
    float _654 = in.m_65.w;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _658 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = in.m_69.w;
    float _662 = floor(_652);
    bool _664 = _612 > 0.0;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _590);
    bool _668 = _612 >= 0.0;
    bool _670 = isnan(_612);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _592);
    float _680 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _682 = _658 * _666;
    float _684 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _686 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _688 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_376);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _680 * _678;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _376 + _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _594);
    bool _708 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _710 = isnan(_376);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_698;
    float _722 = _720 + 1.0;
    float _724 = fma(_530, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _726 = _622 ? 0 : 1;
    float _728 = _686 * _706;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _376 + _730;
    bool _734 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_376);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    bool _750 = _662 > 0.0;
    float _752 = _488 + _648;
    bool _754 = !_416;
    int _756 = _754 ? 0 : 1;
    float _758 = _552 + _654;
    float _760 = _480 + _660;
    bool _762 = _662 >= 0.0;
    bool _764 = isnan(_662);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = in.m_83.x;
    float _774 = in.m_83.y;
    float _776 = in.m_83.z;
    float _778 = _718 * _722;
    float _780 = fma(_566, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _784 = _376 + _782;
    bool _786 = _376 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _788 = isnan(_376);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _744 * _748;
    float _800 = -_744;
    float _802 = _800 + 1.0;
    int _804 = abs(_756);
    float _806 = fma(_640, _784, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _808 = ~_726;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _796 * _802;
    int _816 = _812;
    if (!_610)
    {
        int _818 = ~_726;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = _758 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _826 = _770 ? 0 : 1;
    float _828 = _724 * _814;
    float _830 = _752 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    int _832 = ~_826;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _840 = float(_804);
    float _842 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _844 = float(_822);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _848 = _836;
    if (!_750)
    {
        int _850 = ~_826;
        int _852 = _850 + 1;
        _848 = _852;
    }
    int _854 = _848;
    float _856 = _824 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _858 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].y, _838);
    float _860 = _840 * _844;
    float _862 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].z, _842);
    float _864 = fma(_830, (*spvDescriptorSet0.vp_c12)._m0[6].x, _856);
    float _866 = _760 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _868 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _870 = _860 * (-2.0);
    float _872 = _400 + (-0.5);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].x, _864);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].z, _862);
    float _878 = fma(_870, _774, _774);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].y, _858);
    float _882 = _874 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _886 = _676 ? 0 : 1;
    float _888 = fma(_656, _870, _656);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = _630 * (-0.15915493667125701904296875);
    float _894 = _882 * _846;
    bool _896 = !_412;
    int _898 = _896 ? 0 : 1;
    float _900 = _876 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _902 = _880 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    int _904 = ~_886;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    float _910 = _892 * 6.283185482025146484375;
    float _912 = sin(_910);
    int _914 = _908;
    if (!_664)
    {
        int _916 = ~_886;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = _900 * _868;
    int _924 = abs(_898);
    int _926 = _348 + 8;
    uint _929 = uint(int(uint(_926) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    float _937 = -_796;
    float _939 = _937 + 1.0;
    float _941 = _902 * _884;
    bool _943 = !_420;
    int _945 = _943 ? 0 : 1;
    float _947 = _892 * 6.283185482025146484375;
    float _949 = cos(_947);
    float _951 = float(_924);
    float _953 = fma(_888, _646, _890);
    int _955 = abs(_945);
    float _957 = fma(_941, 0.5, 0.5);
    float _959 = float(_920);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[115].x, _828);
    float _963 = float(_955);
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _967 = uint(int(uint(_348) >> uint(2)));
    uint _969 = uint(int(uint(int(_967)) >> uint(2)));
    int _971 = int(_967) & 3;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[int(_969)][_971];
    int _975 = int(_967) + 1;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    int _979 = _975 & 3;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[int(_977)][_979];
    float _983 = _951 * _959;
    float _985 = float(_854);
    float _987 = _194 + (-0.5);
    float _989 = fma(_780, _798, _961);
    float _991 = _983 * (-2.0);
    float _993 = _438 + (-0.5);
    float _995 = _963 * _985;
    bool _997 = _592 != 0.0;
    bool _999 = isnan(_592);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_991, _772, _772);
    float _1009 = fma(_684, _991, _684);
    float _1011 = _995 * (-2.0);
    float _1013 = _953 * 0.15915493667125701904296875;
    float _1015 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1007);
    bool _1017 = _590 == 0.0;
    bool _1019 = !_1005;
    bool _1021 = _1017 && _1019;
    float _1023 = fma(_1011, _776, _776);
    float _1025 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1027 = fma(_1009, _646, _1015);
    float _1029 = fma(_586, _1011, _586);
    float _1031 = in.m_85.x;
    float _1033 = in.m_85.y;
    float _1035 = in.m_85.z;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1023);
    float _1039 = fma(_1025, _544, -0.5);
    float _1041 = _912 * _558;
    float _1043 = _949 * _558;
    float _1045 = _1027 * 0.15915493667125701904296875;
    float _1047 = fma(_1029, _646, _1037);
    float _1049 = -_1041;
    float _1051 = fma(_949, _1039, _1049);
    float _1053 = fma(_912, _1039, _1043);
    float _1055 = fma(_806, _778, _989);
    float _1057 = _1013 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = _1047 * 0.15915493667125701904296875;
    float _1063 = fma(_894, 0.5, 0.5);
    bool _1065 = _594 == 0.0;
    bool _1067 = _1065 && _1021;
    float _1069 = fma(_628, _1051, _634);
    float _1071 = -_638;
    float _1073 = fma(_636, _1053, _1071);
    float _1075 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1055);
    float _1077 = _935 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1079 = _1013 * 6.283185482025146484375;
    float _1081 = cos(_1079);
    float _1083 = _1069 + 0.5;
    float _1085 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1073 + 0.5;
    float _1091 = fma(_922, 0.5, 0.5);
    float _1093 = _1045 * 6.283185482025146484375;
    float _1095 = sin(_1093);
    float _1097 = _1031;
    float _1099 = _1033;
    float _1101 = _1035;
    if (!_1067)
    {
        float _1103 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1031);
        _1097 = _1103;
    }
    float _1105 = _1097;
    if (!_1067)
    {
        float _1107 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1099 = _1107;
    }
    float _1109 = _1099;
    float _1111 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1067)
    {
        float _1115 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
        _1101 = _1115;
    }
    float _1117 = _1101;
    out.m_87.x = _1083;
    out.m_87.y = _1089;
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1045 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    float _1125 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1127 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1129 = isnan(1.0);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1135 = _1131 || _1133;
    out.m_89.x = _1119;
    out.m_89.y = _1125;
    out.m_89.z = _1087;
    out.m_89.w = _1085;
    float _1137 = floor(_957);
    float _1139 = _1095 * _1059;
    float _1141 = _1061 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1123 * _1081;
    float _1147 = _1061 * 6.283185482025146484375;
    float _1149 = sin(_1147);
    float _1151 = -_1137;
    float _1153 = _957 + _1151;
    float _1155 = _1095 * _1081;
    float _1157 = floor(_1063);
    float _1159 = _1095 * _1143;
    float _1161 = _1123 * _1059;
    float _1163 = _1081 * _1143;
    float _1165 = _1123 * _1143;
    float _1167 = _1059 * _1143;
    float _1169 = fma(_1149, _1145, _1139);
    float _1171 = fma(_1149, _1139, _1145);
    float _1173 = -_700;
    float _1175 = _1149 * _1173;
    float _1177 = -_1109;
    float _1179 = _1149 * _1177;
    float _1181 = -_1161;
    float _1183 = fma(_1149, _1155, _1181);
    float _1185 = -_1155;
    float _1187 = fma(_1149, _1161, _1185);
    float _1189 = fma(_1163, _682, _1175);
    float _1191 = _1165 * _700;
    float _1193 = -_1157;
    float _1195 = _1063 + _1193;
    float _1197 = fma(_1153, 2.0, -1.0);
    float _1199 = fma(_1163, _1105, _1179);
    float _1201 = _1159 * _700;
    float _1203 = _1165 * _1109;
    float _1205 = _1159 * _1109;
    float _1207 = fma(_1195, 2.0, -1.0);
    float _1209 = _1197 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1211 = fma(_1183, _682, _1201);
    float _1213 = fma(_1169, _1105, _1203);
    float _1215 = fma(_1183, _1105, _1205);
    float _1217 = fma(_1169, _682, _1191);
    float _1219 = fma(_1167, _728, _1189);
    float _1221 = _1207 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1223 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1225 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1229 = floor(_1091);
    float _1231 = fma(_1187, _1117, _1213);
    float _1233 = fma(_1167, _1117, _1199);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1223);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1225);
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1227);
    float _1241 = fma(_1187, _728, _1217);
    float _1243 = _1231 * _318;
    float _1245 = _1231 * _328;
    float _1247 = _1231 * _332;
    float _1249 = fma(_1171, _1117, _1215);
    float _1251 = fma(_1233, _290, _1243);
    float _1253 = fma(_1233, _294, _1245);
    float _1255 = fma(_1233, _298, _1247);
    float _1257 = fma(_1171, _728, _1211);
    float _1259 = fma(_1249, _336, _1251);
    float _1261 = fma(_1249, _340, _1253);
    float _1263 = fma(_1249, _344, _1255);
    float _1265 = -_1229;
    float _1267 = _1091 + _1265;
    float _1269 = _1241 * _318;
    float _1271 = _1241 * _328;
    float _1273 = _1241 * _332;
    out.m_91.x = _1259;
    out.m_91.y = _1261;
    out.m_91.z = _1263;
    float _1275 = fma(_1267, 2.0, -1.0);
    float _1277 = fma(_1219, _290, _1269);
    float _1279 = fma(_1219, _294, _1271);
    float _1281 = fma(_1219, _298, _1273);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1285 = fma(_1257, _336, _1277);
    float _1287 = fma(_1257, _340, _1279);
    float _1289 = fma(_1257, _344, _1281);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1235);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1237);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1239);
    float _1297 = _1291 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1299 = _1293 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1301 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1303 = _1285 + _1297;
    float _1305 = _1287 + _1299;
    float _1307 = _1289 + _1301;
    float _1309 = _1239;
    float _1311 = _1257;
    float _1313 = _1273;
    float _1315 = _1277;
    float _1317 = _1273;
    float _1319 = _1207;
    float _1321 = _1197;
    float _1323 = _1289;
    float _1325 = _1275;
    float _1335;
    float _1337;
    float _1339;
    float _1341;
    if (!_1135)
    {
        bool _1327 = _1299 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1329 = !_1327;
        _1331 = _1329;
        if (!_1331)
        {
            float _1333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1335 = _1333;
            _1337 = 0.0;
            _1339 = 0.0;
            _1341 = 0.0;
            _1343 = true;
        }
    }
    if ((!_1343) || _1331)
    {
        bool _1379;
        if (!_1331)
        {
            bool _1345 = _1299 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1347 = isnan(_1299);
            bool _1349 = _1345 || _1347;
            bool _1351 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1353 = _1349 || _1351;
            bool _1355 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1357 = !_1353;
            bool _1359 = _1355 && _1357;
            bool _1361 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _1315 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1359)
            {
                _1309 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1363 = _1309;
            float _1365 = _1363;
            if (_1359)
            {
                _642 = 0.0;
            }
            float _1367 = _642;
            _1337 = _1367;
            if (_1359)
            {
                _1311 = 0.0;
            }
            float _1369 = _1311;
            _1339 = _1369;
            if (_1359)
            {
                float _1371 = _1363 * 5.0;
                _1365 = _1371;
            }
            float _1373 = _1365;
            _1335 = _1373;
            if (_1359)
            {
                _1313 = 0.0;
            }
            float _1375 = _1313;
            bool _1377 = !_1353;
            _1379 = _1377 && _1361;
            _1317 = _1375;
            _1341 = _1375;
        }
        if ((!_1379) || _1331)
        {
            _1331 = false;
            float _1381 = _1315;
            float _1383 = _1317;
            bool _1385 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1387 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1389 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1391 = _1287;
            float _1393 = _1381;
            float _1395 = _1383;
            _1335 = _1307;
            _1337 = _1303;
            _1339 = _1305;
            if (_1385)
            {
                float _1397 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1391 = _1397;
            }
            float _1399 = _1391;
            if (_1385)
            {
                float _1401 = abs(_1207);
                float _1403 = -_1401;
                float _1405 = _1403 + 1.0;
                _1319 = _1405;
            }
            float _1407 = _1319;
            if (_1387)
            {
                float _1409 = abs(_1197);
                float _1411 = -_1409;
                float _1413 = _1411 + 1.0;
                _1321 = _1413;
            }
            float _1415 = _1321;
            if (!_1385)
            {
                _1323 = 1.0;
            }
            float _1417 = _1323;
            float _1419 = _1417;
            if (_1389)
            {
                float _1421 = abs(_1275);
                float _1423 = -_1421;
                float _1425 = _1423 + 1.0;
                _1325 = _1425;
            }
            float _1427 = _1325;
            if (!_1387)
            {
                _1393 = 1.0;
            }
            float _1429 = _1393;
            float _1431 = _1429;
            if (!_1389)
            {
                _1395 = 1.0;
            }
            float _1433 = _1395;
            float _1435 = _1251;
            float _1437 = _1433;
            if (_1387)
            {
                float _1439 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1435 = _1439;
            }
            float _1441 = _1435;
            float _1443 = _1283;
            if (_1389)
            {
                float _1445 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1443 = _1445;
            }
            float _1447 = _1443;
            if (_1385)
            {
                float _1449 = _1407 * _1399;
                float _1451 = precise::clamp(_1449, 0.0, 1.0);
                _1419 = _1451;
            }
            float _1453 = _1419;
            if (_1387)
            {
                float _1455 = _1415 * _1441;
                float _1457 = precise::clamp(_1455, 0.0, 1.0);
                _1431 = _1457;
            }
            float _1459 = _1431;
            float _1461 = _1453 * _1459;
            if (_1389)
            {
                float _1463 = _1427 * _1447;
                float _1465 = precise::clamp(_1463, 0.0, 1.0);
                _1437 = _1465;
            }
            float _1467 = _1437;
            float _1469 = _1461 * _1467;
            _1341 = _1469;
        }
    }
    _1343 = false;
    float _1471 = _1335;
    float _1473 = _1337;
    float _1475 = _1339;
    float _1477 = _1341;
    float _1479 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1481 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1483 = floor(_1479);
    float _1485 = floor(_1481);
    float _1487 = -_1483;
    float _1489 = _1479 + _1487;
    float _1491 = -_1485;
    float _1493 = _1481 + _1491;
    float2 _5081 = float2(_1489, _1493);
    float _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5081, float2(0.0), isnan(_5081)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5081, float2(0.0), isnan(_5081)), level(0.0)).x;
    float _1497 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1501 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1505 = _1471 + _1503;
    float _1507 = _1299 + _1499;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1511 = _1473 + _1509;
    float _1513 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1501);
    float _1515 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1519 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1521 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1515);
    float _1523 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1517);
    bool _1525 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1527 = isnan(0.5);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1533 = _1529 || _1531;
    float _1535 = 1.0 / _1519;
    float _1537 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1521);
    float _1539 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1523);
    float _1541 = _1537 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1543 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1545 = _1541 + _1519;
    float _1547 = _1545 * _1535;
    float _1549 = _1547 * 0.5;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1553 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1551);
    float _1555 = 1.0 / _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1559 = _1555 * _1557;
    float _1561 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1563 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1565 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1561);
    bool _1567 = _1559 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1569 = !_1563;
    int _1571 = _1569 ? 0 : 1;
    float _1573 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1565);
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1577 = 2;
    float _1579 = _1473;
    float _1581 = _1471;
    float _1583 = _1475;
    int _1585 = as_type<int>(_1511);
    if (!_1563)
    {
        _1577 = 1;
    }
    int _1587 = _1577;
    float _1589 = trunc(_1575);
    int _1591 = int(_1589);
    int _1593 = _1587;
    if (!_1567)
    {
        _1593 = _1571;
    }
    int _1595 = _1593;
    int _1597 = _1595 << 6;
    float _1599 = trunc(_1543);
    int _1601 = int(_1599);
    int _1603 = _1597 + 96;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.vp_c15)._m0[int(_1615)][_1617];
    int _1621 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1623 = _1591 + _1621;
    int _1625 = _1623 + 1;
    int _1627 = _1597 + 104;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    float _1645 = _1505 * _1505;
    float _1647 = fma(_1511, _1511, _1645);
    int _1649 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1651 = _1601 + _1649;
    int _1653 = _1651 + 1;
    int _1655 = _1597 + 64;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    float _1673 = sqrt(_1647);
    bool _1675 = _1653 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1677 = _1653 | _1625;
    int _1679 = _1597 + 48;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    uint _1683 = uint(int(uint(int(_1681)) >> uint(2)));
    int _1685 = int(_1681) & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    int _1689 = int(_1681) + 1;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    int _1693 = _1689 & 3;
    float _1695 = (*spvDescriptorSet0.vp_c15)._m0[int(_1691)][_1693];
    bool _1697 = _1677 < 0;
    bool _1699 = _1697 || _1675;
    bool _1701 = _1625 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1703 = _1701 || _1699;
    int _1705 = _1597 + 56;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
    int _1711 = int(_1707) & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    int _1715 = int(_1707) + 1;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    int _1719 = _1715 & 3;
    float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
    bool _1723 = _1673 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1725 = _1597 + 72;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    float _1743 = as_type<float>(_1677);
    if (!_1703)
    {
        float _1745 = floor(_1543);
        _1743 = _1745;
    }
    float _1747 = _1743;
    int _1749 = _1597 + 80;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    uint _1753 = uint(int(uint(int(_1751)) >> uint(2)));
    int _1755 = int(_1751) & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    int _1759 = int(_1751) + 1;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    int _1763 = _1759 & 3;
    float _1765 = (*spvDescriptorSet0.vp_c15)._m0[int(_1761)][_1763];
    float _1767 = _1507 * _1619;
    float _1769 = fma(_1297, _1611, _1767);
    float _1771 = fma(_1301, _1635, _1769);
    float _1773 = _1771 + _1643;
    int _1775 = as_type<int>(_1771);
    float _1777 = _1611;
    if (!_1703)
    {
        int _1779 = _1625 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1781 = _1779 + _1653;
        _1775 = _1781;
    }
    int _1783 = _1775;
    float _1785 = _1507 * _1671;
    float _1787 = 1.0 / _1773;
    float _1789 = fma(_1297, _1663, _1785);
    float _1791 = _1663;
    int _1793 = as_type<int>(_1687);
    float _1795 = _1785;
    int _1797 = as_type<int>(_1789);
    if (!_1723)
    {
        _1791 = _1475;
    }
    float _1799 = _1791;
    float _1801 = _1507 * _1695;
    float _1803 = fma(_1297, _1687, _1801);
    bool _1805 = !_1723;
    float _1807 = _1799;
    float _1809 = _1765;
    float _1811 = _1747;
    if (!_1805)
    {
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1817 = _1673 + _1815;
        float _1819 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = rsqrt(_1647);
        float _1823 = _1817 * _1813;
        float _1825 = _1823 * 0.15915493667125701904296875;
        float _1827 = _1825 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        float _1831 = _1825 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1829 + (-1.0);
        float _1837 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1839 = fma(_1833, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1841 = fma(_1829, _1475, _1837);
        float _1843 = _1821 * _1839;
        float _1845 = fma(_1511, _1843, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1847 = fma(_1505, _1843, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1579 = _1845;
        _1581 = _1847;
        _1807 = _1841;
        _1793 = as_type<int>(_1833);
        _1795 = _1843;
        _1777 = _1825;
    }
    float _1849 = _1579;
    float _1851 = _1581;
    float _1853 = _1807;
    int _1855 = _1793;
    float _1857 = _1795;
    float _1859 = _1777;
    float _1861 = fma(_1301, _1733, _1789);
    int _1863 = _1855;
    float _1865 = _1857;
    float _1867 = _1853;
    float _1869 = _1859;
    if (!_1703)
    {
        int _1871 = _1783 << 2;
        _1797 = _1871;
    }
    int _1873 = _1797;
    float _1875 = fma(_1301, _1713, _1803);
    int _1877 = _1873;
    if (_1533)
    {
        _1583 = _1849;
    }
    float _1879 = _1583;
    float _1881 = _1879;
    if (!_1703)
    {
        uint _1883 = uint(int(uint(_1783) >> uint(2)));
        _1863 = int(_1883);
    }
    int _1885 = _1863;
    if (!_1703)
    {
        int _1887 = 12 & _1873;
        _1877 = _1887;
    }
    int _1889 = _1877;
    if (_1533)
    {
        _1865 = _1851;
    }
    float _1891 = _1865;
    float _1893 = _1891;
    if (!_1533)
    {
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1897 = _1299 + _1895;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1901 = _1297 + _1899;
        float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1905 = -_1299;
        float _1907 = _1905 + _1853;
        float _1909 = _1897 * _1897;
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1913 = _1301 + _1911;
        float _1915 = -_1297;
        float _1917 = _1915 + _1849;
        float _1919 = -_1301;
        float _1921 = _1919 + _1851;
        float _1923 = fma(_1901, _1901, _1909);
        float _1925 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1927 = fma(_1913, _1913, _1923);
        float _1929 = sqrt(_1927);
        float _1931 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1933 = _1929 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1935 = isnan(_1929);
        bool _1937 = _1933 || _1935;
        bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1941 = _1937 || _1939;
        float _1943 = precise::min(_1929, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1945 = _1943 * _1903;
        float _1947 = _1931 * _1945;
        float _1949 = _1619;
        float _1951 = _1943;
        float _1953 = _1929;
        _1869 = _1907;
        if (_1941)
        {
            float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1949 = _1955;
        }
        float _1957 = _1949;
        if (_1941)
        {
            float _1959 = precise::max(_1929, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1951 = _1959;
        }
        float _1961 = _1951;
        float _1963 = fma(_1907, _1947, _1299);
        float _1965 = _1963;
        if (_1941)
        {
            float _1967 = _1961 * _1957;
            _1953 = _1967;
        }
        float _1969 = _1953;
        float _1971 = fma(_1917, _1947, _1297);
        float _1973 = fma(_1921, _1947, _1301);
        float _1975 = _1969;
        float _1977 = _1971;
        _1893 = _1973;
        if (_1941)
        {
            float _1979 = _1931 * _1969;
            _1975 = _1979;
        }
        float _1981 = _1975;
        if (_1941)
        {
            float _1983 = fma(_1907, _1981, _1299);
            _1965 = _1983;
        }
        float _1985 = _1965;
        _1867 = _1985;
        if (_1941)
        {
            float _1987 = fma(_1917, _1981, _1297);
            _1977 = _1987;
        }
        float _1989 = _1977;
        _1881 = _1989;
        if (_1941)
        {
            float _1991 = fma(_1921, _1981, _1301);
            _1893 = _1991;
        }
    }
    float _1993 = _1867;
    float _1995 = _1881;
    float _1997 = _1893;
    float _1999 = _1869;
    if (!_1703)
    {
        int _2001 = _1885 << 4;
        int _2003 = _2001 + _1889;
        _1585 = _2003;
    }
    int _2005 = _1585;
    float _2007 = _1861 + _1741;
    float _2009 = _1875 + _1721;
    float _2011 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2013 = _1597 + 88;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2033 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2035 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2011);
    float _2037 = _2009 * _1787;
    float _2039 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2031);
    float _2041 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2033);
    float _2043 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2045 = _2009;
    float _2047 = as_type<float>(_2005);
    if (!_1703)
    {
        int _2049 = _2005 + 400;
        uint _2051 = uint(int(uint(_2049) >> uint(2)));
        uint _2053 = uint(int(uint(int(_2051)) >> uint(2)));
        int _2055 = int(_2051) & 3;
        float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
        _2045 = _2057;
    }
    float _2059 = _2045;
    float _2061 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2039);
    float _2063 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2041);
    bool _2065 = _2037 >= 0.0;
    float _2067 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2043);
    float _2069 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2035);
    float _2071 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2073 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2075 = _2007 * _1787;
    bool _2077 = _2037 <= 1.0;
    bool _2079 = _2077 && _2065;
    float _2081 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2083 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2085 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    bool _2087 = _2075 >= 0.0;
    bool _2089 = _2087 && _2079;
    float _2091 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2093 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2083);
    float _2095 = _1999;
    if (!_1703)
    {
        float _2097 = floor(_1575);
        _2095 = _2097;
    }
    float _2099 = _2095;
    bool _2101 = _2075 <= 1.0;
    bool _2103 = _2101 && _2089;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2109 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2093);
    float _2111 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2113 = -_2105;
    float _2115 = fma(_2113, _2091, 1.0);
    float _2117 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2109);
    float _2121 = _1507 * _1765;
    float _2123 = log2(_2115);
    float _2125 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2111);
    float _2127 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2117);
    float _2129 = fma(_1297, _1757, _2121);
    float _2131 = _2129;
    if (_2103)
    {
        float _2133 = float(_1595);
        _1809 = _2133;
    }
    float _2135 = _1809;
    if (!_1703)
    {
        float _2137 = -_1747;
        float _2139 = _1543 + _2137;
        _2047 = _2139;
    }
    float _2141 = _2047;
    float _2143 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2145 = 1.0 / _2119;
    float _2147 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    float _2149 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2143);
    float _2151 = fma(_1301, _2021, _2129);
    if (!_1703)
    {
        float _2153 = -_2099;
        float _2155 = _1575 + _2153;
        _2131 = _2155;
    }
    float _2157 = _2131;
    float _2159 = _2121;
    if (_2103)
    {
        float _2161 = rint(_2135);
        float _2163 = precise::max(_2161, 0.0);
        uint _2165 = uint(_2163);
        uint _2167 = clamp(_2165, 0u, 65535u);
        _2159 = as_type<float>(_2167);
    }
    float _2169 = _2159;
    float _2171 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2147);
    float _2173 = _2151 + _2029;
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = _2173 * _1787;
    float _2179 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2181 = _2147;
    float _2183 = _2179;
    if (!_1703)
    {
        float _2185 = rint(_2059);
        float _2187 = precise::max(_2185, 0.0);
        uint _2189 = uint(_2187);
        uint _2191 = clamp(_2189, 0u, 65535u);
        _2181 = as_type<float>(_2191);
    }
    float _2193 = _2181;
    float _2195 = _2149 * _2145;
    float _2197 = _2171 * _2145;
    float _2199 = fma(_2195, 0.5, 0.5);
    float _2201 = fma(_2197, -0.5, 0.5);
    float _2203 = _2075;
    if (_2103)
    {
        float3 _6261 = float3(_2037, _2075, float(as_type<int>(_2169)));
        float3 _6265 = select(_6261, float3(0.0), isnan(_6261));
        float _2205 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6265.xy, uint(rint(_6265.z)), _2177, level(0.0));
        _2203 = _2205;
    }
    float _2207 = _2203;
    float3 _6275 = float3(_2199, _2201, _2179);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6275, float3(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6275, float3(0.0), isnan(_6275)), level(0.0)).x;
    float3 _6284 = float3(_2199, _2201, _2179);
    float4 _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6284, float3(0.0), isnan(_6284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6284, float3(0.0), isnan(_6284)), level(0.0)).xyzw;
    float _2214 = _2212.x;
    float _2216 = _2212.y;
    float _2218 = _2212.z;
    float _2220 = _2212.w;
    float _2222 = _2141;
    if (!_1703)
    {
        float3 _6307 = float3(_2141, _2157, float(as_type<int>(_2193)));
        float3 _6309 = select(_6307, float3(0.0), isnan(_6307));
        float _2224 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6309.xy, uint(rint(_6309.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6309.xy, uint(rint(_6309.z)), level(0.0)).x;
        _2222 = _2224;
    }
    float _2226 = _2222;
    if (_1703)
    {
        _1811 = 1.0;
    }
    float _2228 = _1811;
    float _2230 = _2228;
    float _2232 = _2214;
    if (!_1703)
    {
        int _2234 = _1783 << 4;
        int _2236 = _2234 + 2048;
        uint _2238 = uint(int(uint(_2236) >> uint(2)));
        uint _2240 = uint(int(uint(int(_2238)) >> uint(2)));
        int _2242 = int(_2238) & 3;
        float _2244 = (*spvDescriptorSet0.vp_c15)._m0[int(_2240)][_2242];
        int _2246 = int(_2238) + 1;
        uint _2248 = uint(int(uint(_2246) >> uint(2)));
        int _2250 = _2246 & 3;
        float _2252 = (*spvDescriptorSet0.vp_c15)._m0[int(_2248)][_2250];
        int _2254 = _2236 + 8;
        uint _2256 = uint(int(uint(_2254) >> uint(2)));
        uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
        int _2260 = int(_2256) & 3;
        float _2262 = (*spvDescriptorSet0.vp_c15)._m0[int(_2258)][_2260];
        int _2264 = int(_2256) + 1;
        uint _2266 = uint(int(uint(_2264) >> uint(2)));
        int _2268 = _2264 & 3;
        float _2270 = (*spvDescriptorSet0.vp_c15)._m0[int(_2266)][_2268];
        float _2272 = _1507 * _2252;
        float _2274 = fma(_1297, _2244, _2272);
        float _2276 = fma(_1301, _2262, _2274);
        float _2278 = _2276 + _2270;
        float _2280 = precise::clamp(_2278, 0.0, 1.0);
        float _2282 = -_2280;
        float _2284 = _2282 + _2226;
        float _2286 = fma(_2284, 500.0, 1.5);
        float _2288 = exp2(_2286);
        float _2290 = 0.0 + _2288;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        _2230 = _2292;
    }
    float _2294 = _2230;
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2298 = _1993 + _2296;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2302 = _1995 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2306 = _1997 + _2304;
    float _2308 = _2298 * _2298;
    float _2310 = fma(_2302, _2302, _2308);
    float _2312 = fma(_2306, _2306, _2310);
    float _2314 = rsqrt(_2312);
    float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2318 = _2302 * _2316;
    float _2320 = _2306 * _2316;
    float _2322 = _2318 * _2318;
    float _2324 = _2320 * _2320;
    float _2326 = _2322 + _2324;
    float _2328 = sqrt(_2326);
    bool _2330 = _2328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2334 = _2328 + _2332;
    float _2336 = _2306;
    float _2338 = _2314;
    float _2340 = _2334;
    float _2342 = _2308;
    float _2344 = _2298;
    float _2346 = _2322;
    if (_2330)
    {
        float _2348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2336 = _2348;
    }
    float _2350 = _2336;
    if (_2330)
    {
        float _2352 = rsqrt(_2326);
        _2338 = _2352;
    }
    float _2354 = _2338;
    float _2356 = _2354;
    if (_2330)
    {
        float _2358 = _2334 * _2350;
        _2340 = _2358;
    }
    float _2360 = _2340;
    if (_2330)
    {
        float _2362 = _2360 * 0.15915493667125701904296875;
        _2342 = _2362;
    }
    float _2364 = _2342;
    float _2366 = _2350;
    float _2368 = _2364;
    if (_2330)
    {
        float _2370 = _2364 * 6.283185482025146484375;
        float _2372 = sin(_2370);
        _2366 = _2372;
    }
    float _2374 = _2366;
    float _2376 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2378 = precise::max(0.0, _2376);
    float _2380 = _1787;
    float _2382 = _2378;
    if (_2330)
    {
        float _2384 = _2364 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        _2380 = _2386;
    }
    float _2388 = _2380;
    float _2390 = -_2316;
    float _2392 = -_2378;
    float _2394 = fma(_2298, _2390, _2392);
    if (_2330)
    {
        float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2382 = _2396;
    }
    float _2398 = _2382;
    float _2400 = _2398;
    if (!_2330)
    {
        _2368 = _2318;
    }
    float _2402 = _2368;
    float _2404 = _2374;
    float _2406 = _2402;
    if (_2330)
    {
        float _2408 = fma(_2374, _2398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2404 = _2408;
    }
    float _2410 = _2404;
    float _2412 = _2410;
    if (_2330)
    {
        float _2414 = _2388 + (-1.0);
        _2400 = _2414;
    }
    float _2416 = _2400;
    float _2418 = _2416;
    if (_2330)
    {
        float _2420 = _2354 * _2410;
        _2183 = _2420;
    }
    float _2422 = _2183;
    if (!_2330)
    {
        _2356 = _2394;
    }
    float _2424 = _2356;
    float _2426 = _2424;
    if (_2330)
    {
        float _2428 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2344 = _2428;
    }
    float _2430 = _2344;
    if (_2330)
    {
        float _2432 = _2318 * _2422;
        _2406 = _2432;
    }
    float _2434 = _2406;
    if (!_2330)
    {
        _2412 = _2320;
    }
    float _2436 = _2412;
    float _2438 = _2436;
    if (_2330)
    {
        float _2440 = _2320 * _2422;
        _2438 = _2440;
    }
    float _2442 = _2438;
    if (_2330)
    {
        float _2444 = fma(_2394, _2388, _2430);
        _2426 = _2444;
    }
    float _2446 = _2426;
    if (_2330)
    {
        float _2448 = _2434 * _2434;
        _2346 = _2448;
    }
    float _2450 = _2346;
    float _2452 = sqrt(_2312);
    if (!_2330)
    {
        _2418 = _2324;
    }
    float _2454 = _2418;
    float _2456 = _2454;
    if (_2330)
    {
        float _2458 = _2442 * _2442;
        _2456 = _2458;
    }
    float _2460 = _2456;
    float _2462 = fma(_2446, _2446, _2450);
    float _2464 = _2462 + _2460;
    float _2466 = rsqrt(_2464);
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2470 = fma(_2452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2468);
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    float _2474 = -_2472;
    float _2476 = _2474 + 1.0;
    float _2478 = abs(_2476);
    float _2480 = log2(_2478);
    float _2482 = _2466 * _2434;
    float _2484 = _2466 * _2446;
    float _2486 = _2466 * _2442;
    float _2488 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2490 = -_2488;
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2490);
    float _2494 = -_2486;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2492);
    float _2498 = _2484 + 1.0;
    float _2500 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2502 = fma(_2496, -0.5, 0.5);
    float _2504 = fma(_2496, 0.5, 0.5);
    float _2506 = exp2(_2500);
    float _2508 = fma(_2504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2510 = fma(_2504, _2508, -0.212114393711090087890625);
    float _2512 = sqrt(_2502);
    float _2514 = fma(_2504, _2510, 1.570728778839111328125);
    float _2516 = -_2484;
    float _2518 = fma(_2506, _2498, _2516);
    float _2520 = fma(_2518, 0.5, 0.5);
    float _2522 = _2512 * 0.636619746685028076171875;
    float _2524 = -_2514;
    float _2526 = fma(_2522, _2524, 1.0);
    float2 _6776 = float2(_2526, _2520);
    float3 _2530 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6776, float2(0.0), isnan(_6776)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6776, float2(0.0), isnan(_6776)), level(0.0)).xyz;
    float _2532 = _2530.x;
    float _2534 = _2530.y;
    float _2536 = _2530.z;
    float _2538 = abs(_1559);
    float _2540 = log2(_2538);
    float _2542 = _2073 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2544 = -_1495;
    float _2546 = _2544 + 1.0;
    bool _2548 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2550 = isnan(_2452);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2556 = _2552 || _2554;
    float _2558 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2542);
    float _2560 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2562 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2564 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2558);
    float _2566 = exp2(_2560);
    float _2568 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2564);
    float _2570 = _2540 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2572 = exp2(_2570);
    float _2574 = -_2566;
    float _2576 = _2574 + 1.0;
    float _2578 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2580 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = fma(_2582, -2.0, 3.0);
    float _2586 = _2582 * _2582;
    float _2588 = _2586 * _2584;
    float _2590 = -_2588;
    float _2592 = _2590 + 1.0;
    float _2594 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2588);
    bool _2596 = _1559 <= 8000.0;
    bool _2598 = isnan(_1559);
    bool _2600 = _2596 || _2598;
    bool _2602 = isnan(8000.0);
    bool _2604 = _2600 || _2602;
    float _2606 = float(_2604);
    float _2608 = _2568 + _2119;
    float _2610 = _2606 * _2594;
    float _2612 = _2608 * 0.5;
    float _2614 = _2608;
    if (!_2103)
    {
        _2614 = 1.0;
    }
    float _2616 = _2614;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2171;
    out.gl_Position.z = _2568;
    out.gl_Position.w = _2119;
    float _2618 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2620 = _2616;
    if (_2103)
    {
        bool _2622 = _2207 >= _2177;
        bool _2624 = isnan(_2207);
        bool _2626 = _2622 || _2624;
        bool _2628 = isnan(_2177);
        bool _2630 = _2626 || _2628;
        float _2632 = float(_2630);
        _2620 = _2632;
    }
    float _2634 = _2620;
    float _2636 = _2578 * _2209;
    float _2638 = -_2578;
    float _2640 = _2638 + 1.0;
    float _2642 = _2546 * _2618;
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    out.m_93.z = _2612;
    out.m_93.w = _2119;
    float _2646 = _2634 * _2294;
    float _2648 = -_2644;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = -_2646;
    float _2654 = fma(_2652, _2650, 1.0);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = _2220 * _2636;
    float _2660 = _2220 * _2640;
    float _2662 = _2536 * _2636;
    float _2664 = fma(_2532, _2658, _2214);
    float _2666 = fma(_2534, _2658, _2216);
    float _2668 = _2656 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = fma(_2220, _2662, _2218);
    float _2672 = _2662;
    float _2674 = _2656;
    if (!_2556)
    {
        _2232 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2676 = _2232;
    float _2678 = _2676;
    float _2680 = _2676;
    if (!_2556)
    {
        _2672 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2682 = _2672;
    out.m_95.x = _2668;
    float _2684 = _2682;
    float _2686 = _2682;
    if (!_2556)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2688 = _2674;
    out.m_97.x = _2664;
    out.m_97.y = _2666;
    out.m_97.z = _2670;
    out.m_97.w = _2660;
    bool _2690 = !_2556;
    float _2692 = _2688;
    float _2694 = _2688;
    if (!_2690)
    {
        bool _2696 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2698 = isnan(_2452);
        bool _2700 = _2696 || _2698;
        bool _2702 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2704 = _2700 || _2702;
        if (!_2704)
        {
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2708 = _2452 + _2706;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2712 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2722 = 1.0 / _2712;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = _2708 * _2722;
            float _2730 = precise::clamp(_2728, 0.0, 1.0);
            float _2732 = fma(_2730, _2716, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2734 = fma(_2730, _2720, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2736 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2686 = _2734;
            _2680 = _2732;
            _2694 = _2736;
            _2738 = true;
        }
        else
        {
            bool _2740 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2742 = isnan(_2452);
            bool _2744 = _2740 || _2742;
            bool _2746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2748 = _2744 || _2746;
            if (!_2748)
            {
                _2678 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2750 = _2678;
            _2680 = _2750;
            if (!_2748)
            {
                _2684 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2752 = _2684;
            _2686 = _2752;
            if (!_2748)
            {
                _2692 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2754 = _2692;
            bool _2756 = !_2748;
            _2694 = _2754;
            if (!_2756)
            {
                bool _2758 = _2452 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2760 = isnan(_2452);
                bool _2762 = _2758 || _2760;
                bool _2764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2766 = _2762 || _2764;
                if (!_2766)
                {
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2770 = _2452 + _2768;
                    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2774 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2772;
                    float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2784 = 1.0 / _2774;
                    float _2786 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2790 = _2770 * _2784;
                    float _2792 = precise::clamp(_2790, 0.0, 1.0);
                    float _2794 = fma(_2792, _2778, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2796 = fma(_2792, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2798 = fma(_2792, _2788, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2686 = _2796;
                    _2680 = _2794;
                    _2694 = _2798;
                    _2738 = true;
                }
                else
                {
                    _2686 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2680 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2694 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2738 = false;
    float _2800 = _2686;
    float _2802 = _2680;
    float _2804 = _2694;
    float _2806 = _2800 * 0.586610972881317138671875;
    bool _2808 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2810 = _2562 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _2812 = fma(_2802, 0.298911988735198974609375, _2806);
    out.m_61.x = _2810;
    float _2814 = fma(_2804, 0.114477999508380889892578125, _2812);
    float _2816 = -_2814;
    float _2818 = _2816 + _2802;
    float _2820 = -_2814;
    float _2822 = _2820 + _2800;
    float _2824 = -_2814;
    float _2826 = _2824 + _2804;
    float _2828 = fma(_2818, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    float _2830 = fma(_2822, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    float _2832 = fma(_2826, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2814);
    out.m_101.x = _2828;
    out.m_101.y = _2830;
    out.m_101.z = _2832;
    if (!_2808)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2834 = -_1993;
    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2838 = -_1995;
    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2842 = -_1997;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2846 = _2836 * _2836;
    float _2848 = fma(_2840, _2840, _2846);
    float _2850 = fma(_2844, _2844, _2848);
    float _2852 = sqrt(_2850);
    float _2854 = rsqrt(_2850);
    float _2856 = -_2852;
    float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2862 = precise::clamp(_2860, 0.0, 1.0);
    float _2864 = _2840 * _2854;
    float _2866 = _2836 * _2854;
    float _2868 = abs(_2862);
    float _2870 = log2(_2868);
    float _2872 = _2844 * _2854;
    float _2874 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2876 = _1261 * _2866;
    float _2878 = -_2866;
    float _2880 = -_2874;
    float _2882 = fma(_2878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2880);
    float _2884 = fma(_1259, _2864, _2876);
    float _2886 = -_2872;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2882);
    float _2890 = fma(_1263, _2872, _2884);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2896 = _2888 + _2894;
    float _2898 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2902 = precise::clamp(_2900, 0.0, 1.0);
    float _2904 = exp2(_2898);
    float _2906 = _2904 * _2902;
    float _2908 = _2892 * _2906;
    float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2912 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2914 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2910;
    out.m_99.y = _2912;
    out.m_99.z = _2914;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

