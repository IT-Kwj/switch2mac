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
    float4 m_109 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_101 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_107 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_105 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_69 [[attribute(3)]];
    float4 m_85 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_77 [[attribute(10)]];
    float4 m_87 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _1528 = false;
    bool _1516 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_58.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_61.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_144);
        out.gl_Position.z = _3269;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_63.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = 0.0;
    float _166 = _162;
    if (_158)
    {
        float _168 = float(_128);
        _164 = _168;
    }
    float _170 = _164;
    bool _172 = _162 >= _170;
    bool _174 = !_158;
    bool _176 = _172 || _174;
    if (_176)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _138;
    if (_176)
    {
        out.m_61.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3338 = as_type<float>(_182);
        out.gl_Position.z = _3338;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_65.x;
    float _186 = in.m_65.y;
    float _188 = in.m_65.z;
    float _190 = in.m_67.x;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = in.m_69.x;
    float _198 = in.m_69.y;
    float _200 = in.m_69.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    int _232 = as_type<int>(_184);
    if (_226)
    {
        float _234 = rsqrt(_214);
        _230 = _234;
    }
    float _236 = _230;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_226)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _242 = _238;
    float _244 = _240;
    bool _246 = _224 > 0.0;
    float _248 = 0.0;
    float _250 = _242;
    float _252 = _244;
    if (!_226)
    {
        _248 = 0.0;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = _254;
    if (!_228)
    {
        _256 = 0.0;
    }
    float _260 = _256;
    float _262 = _224;
    float _264 = _260;
    if (_228)
    {
        float _266 = rsqrt(_216);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = _272;
    if (!_246)
    {
        _274 = 0.0;
        _276 = 0.0;
    }
    float _280 = _274;
    float _282 = _276;
    float _284 = 0.0;
    float _286 = _280;
    float _288 = _282;
    if (_246)
    {
        float _290 = rsqrt(_218);
        _284 = _290;
    }
    float _292 = _284;
    float _294 = _236;
    if (_226)
    {
        float _296 = _236 * _190;
        _250 = _296;
    }
    float _298 = _250;
    if (_226)
    {
        float _300 = _236 * _184;
        _252 = _300;
    }
    float _302 = _252;
    if (_226)
    {
        float _304 = _236 * _196;
        _258 = _304;
    }
    float _306 = _258;
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_228)
    {
        _294 = 0.0;
    }
    float _310 = _294;
    float _312 = 0.0;
    float _314 = _310;
    if (!_246)
    {
        _312 = 0.0;
    }
    float _316 = _312;
    float _318 = _316;
    if (_228)
    {
        float _320 = _268 * _192;
        _314 = _320;
    }
    float _322 = _314;
    if (_228)
    {
        float _324 = _268 * _186;
        _264 = _324;
    }
    float _326 = _264;
    if (_228)
    {
        float _328 = _268 * _198;
        _278 = _328;
    }
    float _330 = _278;
    if (_246)
    {
        float _332 = _292 * _194;
        _286 = _332;
    }
    float _334 = _286;
    if (_246)
    {
        float _336 = _292 * _188;
        _288 = _336;
    }
    float _338 = _288;
    if (_246)
    {
        float _340 = _292 * _200;
        _318 = _340;
    }
    float _342 = _318;
    bool _344 = !_308;
    float _362;
    if (!_344)
    {
        float _346 = in.m_71.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_128);
        float _368 = 1.0 / _366;
        float _370 = _162 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_58.x;
    float _376 = in.m_58.y;
    float _378 = in.m_58.z;
    float _380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _382 = log2(_380);
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _386 = _384 != 0;
    float _388 = in.m_73.x;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _392 = _390 != 0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _396 = 1.0 + _394;
    float _398 = in.m_71.x;
    float _400 = in.m_71.y;
    float _402 = in.m_71.z;
    float _404 = in.m_71.w;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _408 = _406 != 0;
    float _410 = in.m_73.y;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = 1.0 / _396;
    float _418 = 0.0;
    int _420 = 1065353216;
    float _422 = 1.0;
    float _424 = _410;
    if (_386)
    {
        float _426 = in.m_71.x;
        _418 = _426;
    }
    float _428 = _418;
    float _430 = _382 * _162;
    float _432 = 0.0;
    if (_392)
    {
        float _434 = in.m_71.z;
        _432 = _434;
    }
    float _436 = _432;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _444 = _192 * _376;
    float _446 = _186 * _376;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _448 = _198 * _376;
    float _450 = fma(_190, _374, _444);
    float _452 = fma(_184, _374, _446);
    if (_392)
    {
        float _454 = -_388;
        float _456 = _454 + 1.0;
        _232 = as_type<int>(_456);
    }
    int _458 = _232;
    float _460 = fma(_194, _378, _450);
    bool _462 = _404 > 0.5;
    float _464 = fma(_196, _374, _448);
    float _466 = fma(_188, _378, _452);
    float _468 = _404;
    if (!_386)
    {
        _468 = _388;
    }
    float _470 = _468;
    float _472 = _470;
    if (_386)
    {
        float _474 = -_388;
        float _476 = _474 + 1.0;
        _420 = as_type<int>(_476);
    }
    int _478 = _420;
    if (!_392)
    {
        _422 = _388;
    }
    float _480 = _422;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _484 = false;
    float _486 = _480;
    if (_386)
    {
        bool _488 = _428 > 0.5;
        _484 = _488;
    }
    bool _490 = _484;
    float _492 = fma(_200, _378, _464);
    float _494 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[79].z, _482);
    bool _496 = false;
    float _498 = _492;
    if (_392)
    {
        bool _500 = _436 > 0.5;
        _496 = _500;
    }
    bool _502 = _496;
    float _504 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_386)
    {
        float _506 = _490 ? as_type<float>(_478) : _388;
        _472 = _506;
    }
    float _508 = _472;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_392)
    {
        float _512 = _502 ? as_type<float>(_458) : _388;
        _486 = _512;
    }
    float _514 = _486;
    float _516 = _398 + _402;
    float _518 = _400 + _398;
    float _520 = _398 * 2.0;
    float _522 = _400 + _402;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _538 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _442);
    bool _540 = _400 > 0.5;
    float _542 = _400 * 2.0;
    float _544 = 1.0 / _440;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _548 = _398 + (-0.5);
    float _550 = _402 + (-0.5);
    float _552 = _402 * 2.0;
    float _554 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].z, _546);
    float _556 = _400 + (-0.5);
    float _558 = -_510;
    float _560 = fma(_504, 2.0, _558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _572 = exp2(_430);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _582 = in.m_77.x;
    float _584 = in.m_77.y;
    float _586 = in.m_77.z;
    float _588 = _522 + (-1.0);
    float _590 = _578 * _544;
    float _592 = 1.0 / _568;
    float _594 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[79].x, _494);
    float _596 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _554);
    float _598 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _538);
    float _600 = _518 + (-1.0);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _604 = 1.0 / _564;
    float _606 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = -_572;
    float _614 = _612 + 1.0;
    float _616 = fma(_536, -2.0, _602);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = floor(_552);
    float _624 = -_410;
    float _626 = _624 + 1.0;
    out.m_79.x = _606;
    out.m_79.y = _608;
    out.m_79.z = _610;
    float _628 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _630 = _582 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _632 = _586 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _634 = _584 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = floor(_542);
    int _642 = _462 ? as_type<int>(_626) : as_type<int>(_410);
    float _644 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _646 = _620 * _592;
    float _648 = _638 * _604;
    float _650 = _408 ? as_type<float>(_642) : _410;
    float _652 = _516 + (-1.0);
    float _654 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_414)
    {
        float _656 = _540 ? _626 : _410;
        _424 = _656;
    }
    float _658 = _424;
    float _660 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _616);
    bool _662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(1.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _674 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = in.m_81.x;
    float _686 = in.m_81.y;
    float _688 = in.m_81.z;
    bool _690 = _622 > 0.0;
    float _692 = floor(_520);
    float _694 = _682 ? _614 : 0.0;
    float _696 = in.m_65.w;
    bool _698 = _622 >= 0.0;
    bool _700 = isnan(_622);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -_162;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _560);
    float _712 = in.m_69.w;
    int _714 = _706 ? 0 : 1;
    if (_670)
    {
        float _716 = _694 * _416;
        _166 = _716;
    }
    float _718 = _166;
    float _720 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _722 = in.m_67.w;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _372 + _724;
    int _728 = ~_714;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _736 = _732;
    if (!_690)
    {
        int _738 = ~_714;
        int _740 = _738 + 1;
        _736 = _740;
    }
    int _742 = _736;
    float _744 = fma(_590, _726, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _746 = _640 > 0.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _750 = _372 + _748;
    bool _752 = _640 >= 0.0;
    bool _754 = isnan(_640);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _372 + _764;
    bool _768 = _692 > 0.0;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _686);
    bool _772 = _692 >= 0.0;
    bool _774 = isnan(_692);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _688);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _684);
    float _786 = _770 * _644;
    float _788 = fma(_646, _750, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _790 = fma(_648, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _792 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _794 = isnan(_372);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = in.m_83.x;
    float _806 = in.m_83.y;
    float _808 = in.m_83.z;
    float _810 = _782 * _762;
    float _812 = _784 * _720;
    float _814 = _780 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _816 = -_802;
    float _818 = _816 + 1.0;
    bool _820 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _822 = isnan(_372);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _460 + _722;
    bool _834 = _686 != 0.0;
    bool _836 = isnan(_686);
    bool _838 = _834 || _836;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    float _844 = _594 * (-0.15915493667125701904296875);
    bool _846 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_372);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_830;
    float _860 = _858 + 1.0;
    bool _862 = _684 == 0.0;
    bool _864 = !_842;
    bool _866 = _862 && _864;
    float _868 = _830 * _818;
    bool _870 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _872 = isnan(_372);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _856 * _860;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _886 = _688 == 0.0;
    bool _888 = _886 && _866;
    float _890 = -_856;
    float _892 = _890 + 1.0;
    float _894 = _734 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _896 = ~as_type<int>(_814);
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    float _902 = _466 + _696;
    float _904 = _880 * _892;
    float _906 = -_880;
    float _908 = _906 + 1.0;
    float _910 = _844 * 6.283185482025146484375;
    float _912 = sin(_910);
    int _914 = _900;
    float _916 = _814;
    float _918 = _908;
    if (!_768)
    {
        int _920 = ~as_type<int>(_814);
        int _922 = _920 + 1;
        _914 = _922;
    }
    int _924 = _914;
    float _926 = _744 * _904;
    float _928 = _760 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _930 = _902 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _932 = _492 + _712;
    float _934 = _926;
    float _936 = _928;
    if (_888)
    {
        _916 = _808;
    }
    float _938 = _916;
    float _940 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[115].x, _926);
    float _942 = _844 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _938;
    if (_888)
    {
        _918 = _804;
    }
    float _948 = _918;
    float _950 = _884 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _952 = ~as_type<int>(_928);
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = fma(_894, _658, -0.5);
    float _960 = _884;
    int _962 = _956;
    float _964 = _948;
    if (_888)
    {
        _960 = _938;
    }
    float _966 = _960;
    float _968 = _832 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _970 = _966;
    if (!_746)
    {
        int _972 = ~as_type<int>(_928);
        int _974 = _972 + 1;
        _962 = _974;
    }
    int _976 = _962;
    float _978 = _932 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    if (_888)
    {
        _934 = _806;
    }
    float _980 = _934;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = _980;
    if (!_888)
    {
        _946 = _808;
    }
    float _986 = _946;
    float _988 = _650 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_888)
    {
        _936 = _948;
    }
    float _990 = _936;
    float _992 = _514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _994 = _990;
    if (!_888)
    {
        _964 = _804;
    }
    float _996 = _964;
    float _998 = fma(_788, _882, _940);
    if (_888)
    {
        _498 = _980;
    }
    float _1000 = _498;
    float _1002 = _1000;
    if (!_888)
    {
        float _1004 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[17].y, _986);
        _970 = _1004;
    }
    float _1006 = _970;
    if (!_888)
    {
        _984 = _806;
    }
    float _1008 = _984;
    float _1010 = fma(_950, _508, -0.5);
    float _1012 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1014 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    if (!_888)
    {
        float _1016 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[17].y, _996);
        _994 = _1016;
    }
    float _1018 = _994;
    float _1020 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1022 = !_526;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _912 * _958;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    if (!_888)
    {
        float _1030 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1008);
        _1002 = _1030;
    }
    float _1032 = _1002;
    float _1034 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1020);
    float _1036 = _944 * _958;
    float _1038 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1012);
    int _1040 = abs(_1024);
    float _1042 = fma(_790, _868, _998);
    float _1044 = -_1026;
    float _1046 = fma(_944, _1010, _1044);
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1050 = in.m_85.x;
    float _1052 = in.m_85.y;
    float _1054 = in.m_85.z;
    float _1056 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1014);
    float _1058 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1038);
    float _1060 = float(_1040);
    float _1062 = fma(_912, _1010, _1036);
    float _1064 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1056);
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1070 = float(_742);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    bool _1074 = !_530;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = _1066 * _1028;
    float _1080 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1034);
    float _1082 = _1060 * _1070;
    int _1084 = abs(_1076);
    float _1086 = _1072 * _1048;
    float _1088 = fma(_1078, 0.5, 0.5);
    float _1090 = float(_924);
    float _1092 = in.m_87.x;
    float _1094 = in.m_87.y;
    float _1096 = in.m_87.z;
    float _1098 = in.m_87.w;
    float _1100 = float(_1084);
    float _1102 = _1080 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1104 = _1082 * (-2.0);
    float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1108 = -_660;
    float _1110 = fma(_598, _1062, _1108);
    float _1112 = _1100 * _1090;
    float _1114 = _1102 * _1068;
    float _1116 = fma(_1104, _1050, _1050);
    bool _1118 = !_534;
    int _1120 = _1118 ? 0 : 1;
    float _1122 = _1112 * (-2.0);
    float _1124 = fma(_1086, 0.5, 0.5);
    float _1126 = fma(_628, _1104, _628);
    int _1128 = abs(_1120);
    float _1130 = fma(_654, _1122, _654);
    float _1132 = fma(_1122, _1052, _1052);
    float _1134 = float(_976);
    float _1136 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1116);
    float _1138 = float(_1128);
    float _1140 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1132);
    float _1142 = fma(_596, _1046, _710);
    float _1144 = fma(_1126, _718, _1136);
    float _1146 = floor(_1124);
    float _1148 = _1138 * _1134;
    float _1150 = fma(_1130, _718, _1140);
    float _1152 = _1094 * _986;
    float _1154 = _1092 * _1008;
    float _1156 = _1148 * (-2.0);
    float _1158 = _1096 * _996;
    float _1160 = -_1152;
    float _1162 = fma(_1096, _1008, _1160);
    float _1164 = -_1154;
    float _1166 = fma(_1094, _996, _1164);
    float _1168 = fma(_1156, _1054, _1054);
    float _1170 = fma(_672, _1156, _672);
    float _1172 = _1144 * 0.15915493667125701904296875;
    float _1174 = _1150 * 0.15915493667125701904296875;
    float _1176 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1168);
    float _1178 = -_1158;
    float _1180 = fma(_1092, _986, _1178);
    float _1182 = _1172 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = fma(_1170, _718, _1176);
    float _1188 = _988 * _1106;
    float _1190 = _992 * _982;
    float _1192 = _1186 * 0.15915493667125701904296875;
    float _1194 = _1174 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1180 * _1098;
    float _1200 = _1142 + 0.5;
    float _1202 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1042);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1212 = _1174 * 6.283185482025146484375;
    float _1214 = cos(_1212);
    float _1216 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = -_1146;
    float _1224 = _1124 + _1222;
    float _1226 = _1162 * _1098;
    float _1228 = _1166 * _1098;
    float _1230 = fma(_1114, 0.5, 0.5);
    float _1232 = _1172 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _1184 * _1196;
    out.m_89.x = _1216;
    out.m_89.y = _1218;
    out.m_89.z = _1220;
    out.m_89.w = _1210;
    bool _1238 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1240 = isnan(1.0);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1246 = _1242 || _1244;
    float _1248 = _1192 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1110 + 0.5;
    float _1254 = _1184 * _1214;
    out.m_91.x = _1200;
    out.m_91.y = _1252;
    out.m_91.z = _1190;
    out.m_91.w = _1188;
    float _1256 = _1192 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = _1234 * _1214;
    float _1262 = floor(_1088);
    float _1264 = _1184 * _1250;
    float _1266 = _1234 * _1196;
    float _1268 = _1234 * _1250;
    float _1270 = _1214 * _1250;
    float _1272 = _1196 * _1250;
    float _1274 = _1264 * _1032;
    float _1276 = _1268 * _1094;
    float _1278 = fma(_1258, _1254, _1266);
    float _1280 = fma(_1258, _1266, _1254);
    float _1282 = -_1236;
    float _1284 = fma(_1258, _1260, _1282);
    float _1286 = -_1260;
    float _1288 = fma(_1258, _1236, _1286);
    float _1290 = -_1094;
    float _1292 = _1258 * _1290;
    float _1294 = _1264 * _1094;
    float _1296 = -_1032;
    float _1298 = _1258 * _1296;
    float _1300 = -_786;
    float _1302 = _1258 * _1300;
    float _1304 = -_1198;
    float _1306 = _1258 * _1304;
    float _1308 = _1264 * _786;
    float _1310 = _1268 * _1032;
    float _1312 = _1268 * _786;
    float _1314 = _1268 * _1198;
    float _1316 = fma(_1278, _1018, _1274);
    float _1318 = -_1262;
    float _1320 = _1088 + _1318;
    float _1322 = fma(_1224, 2.0, -1.0);
    float _1324 = fma(_1270, _1018, _1298);
    float _1326 = fma(_1284, _1018, _1310);
    float _1328 = fma(_1270, _1092, _1292);
    float _1330 = _1264 * _1198;
    float _1332 = fma(_1278, _1092, _1294);
    float _1334 = fma(_1284, _1092, _1276);
    float _1336 = fma(_1320, 2.0, -1.0);
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1340 = fma(_1278, _812, _1308);
    float _1342 = fma(_1270, _812, _1302);
    float _1344 = fma(_1270, _1226, _1306);
    float _1346 = fma(_1284, _812, _1312);
    float _1348 = fma(_1278, _1226, _1330);
    float _1350 = fma(_1284, _1226, _1314);
    float _1352 = _1336 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1356 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1358 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1360 = fma(_1272, _1006, _1324);
    float _1362 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1354);
    float _1364 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1356);
    float _1366 = fma(_1288, _1096, _1332);
    float _1368 = fma(_1288, _1006, _1316);
    float _1370 = fma(_1280, _1006, _1326);
    float _1372 = fma(_1288, _810, _1340);
    float _1374 = fma(_1272, _810, _1342);
    float _1376 = fma(_1272, _1096, _1328);
    float _1378 = _1366 * _322;
    float _1380 = fma(_1280, _810, _1346);
    float _1382 = fma(_1288, _1228, _1348);
    float _1384 = floor(_1230);
    float _1386 = fma(_1280, _1096, _1334);
    float _1388 = _1366 * _326;
    float _1390 = fma(_1280, _1228, _1350);
    float _1392 = fma(_1376, _298, _1378);
    float _1394 = fma(_1272, _1228, _1344);
    float _1396 = _1366 * _330;
    float _1398 = _1368 * _322;
    float _1400 = _1368 * _326;
    float _1402 = _1368 * _330;
    float _1404 = _1382 * _322;
    float _1406 = _1382 * _326;
    float _1408 = _1382 * _330;
    float _1410 = fma(_1376, _302, _1388);
    float _1412 = fma(_1376, _306, _1396);
    float _1414 = fma(_1360, _298, _1398);
    float _1416 = fma(_1360, _306, _1402);
    float _1418 = fma(_1360, _302, _1400);
    float _1420 = fma(_1394, _298, _1404);
    float _1422 = fma(_1394, _302, _1406);
    float _1424 = fma(_1394, _306, _1408);
    float _1426 = fma(_1386, _334, _1392);
    float _1428 = fma(_1386, _338, _1410);
    float _1430 = fma(_1386, _342, _1412);
    float _1432 = fma(_1370, _334, _1414);
    float _1434 = fma(_1370, _342, _1416);
    float _1436 = fma(_1370, _338, _1418);
    float _1438 = fma(_1390, _334, _1420);
    float _1440 = fma(_1390, _338, _1422);
    float _1442 = fma(_1390, _342, _1424);
    float _1444 = -_1384;
    float _1446 = _1230 + _1444;
    out.m_93.x = _1426;
    out.m_93.y = _1428;
    out.m_93.z = _1430;
    float _1448 = _1372 * _322;
    float _1450 = _1372 * _326;
    float _1452 = fma(_1446, 2.0, -1.0);
    out.m_95.x = _1438;
    out.m_95.y = _1440;
    out.m_95.z = _1442;
    float _1454 = _1372 * _330;
    float _1456 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1358);
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    out.m_97.x = _1432;
    out.m_97.y = _1436;
    out.m_97.z = _1434;
    float _1460 = fma(_1374, _306, _1454);
    float _1462 = fma(_1374, _298, _1448);
    float _1464 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1362);
    float _1466 = fma(_1374, _302, _1450);
    float _1468 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1364);
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1456);
    float _1472 = fma(_1380, _342, _1460);
    float _1474 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1476 = fma(_1380, _334, _1462);
    float _1478 = fma(_1380, _338, _1466);
    float _1480 = _1468 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1482 = _1470 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1484 = _1476 + _1474;
    float _1486 = _1478 + _1480;
    float _1488 = _1472 + _1482;
    float _1490 = _1420;
    float _1492 = _1370;
    float _1494 = _1430;
    float _1496 = _1430;
    float _1498 = _1470;
    float _1500 = _1336;
    float _1502 = _1322;
    float _1504 = _1426;
    float _1506 = _1452;
    float _1508 = _1462;
    float _1510 = _1482;
    float _1520;
    float _1522;
    float _1524;
    float _1526;
    if (!_1246)
    {
        bool _1512 = _1480 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1514 = !_1512;
        _1516 = _1514;
        if (!_1516)
        {
            float _1518 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1520 = _1518;
            _1522 = 0.0;
            _1524 = 0.0;
            _1526 = 0.0;
            _1528 = true;
        }
    }
    if ((!_1528) || _1516)
    {
        bool _1566;
        if (!_1516)
        {
            bool _1530 = _1480 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1532 = isnan(_1480);
            bool _1534 = _1530 || _1532;
            bool _1536 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1538 = _1534 || _1536;
            bool _1540 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1542 = !_1538;
            bool _1544 = _1540 && _1542;
            bool _1546 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1548 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1544)
            {
                _1490 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1550 = _1490;
            float _1552 = _1550;
            if (_1544)
            {
                _1492 = 0.0;
            }
            float _1554 = _1492;
            _1522 = _1554;
            if (_1544)
            {
                _1494 = 0.0;
            }
            float _1556 = _1494;
            _1496 = _1556;
            _1524 = _1556;
            if (_1544)
            {
                float _1558 = _1550 * 5.0;
                _1552 = _1558;
            }
            float _1560 = _1552;
            _1520 = _1560;
            if (_1544)
            {
                _1548 = 0.0;
            }
            float _1562 = _1548;
            bool _1564 = !_1538;
            _1566 = _1564 && _1546;
            _1498 = _1562;
            _1526 = _1562;
        }
        if ((!_1566) || _1516)
        {
            _1516 = false;
            float _1568 = _1496;
            float _1570 = _1498;
            bool _1572 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1574 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1576 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1578 = _1568;
            float _1580 = _1570;
            _1520 = _1488;
            _1522 = _1484;
            if (_1572)
            {
                float _1582 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1578 = _1582;
            }
            float _1584 = _1578;
            if (_1572)
            {
                float _1586 = abs(_1336);
                float _1588 = -_1586;
                float _1590 = _1588 + 1.0;
                _1500 = _1590;
            }
            float _1592 = _1500;
            if (_1574)
            {
                float _1594 = abs(_1322);
                float _1596 = -_1594;
                float _1598 = _1596 + 1.0;
                _1502 = _1598;
            }
            float _1600 = _1502;
            if (!_1572)
            {
                _1504 = 1.0;
            }
            float _1602 = _1504;
            float _1604 = _1602;
            if (_1576)
            {
                float _1606 = abs(_1452);
                float _1608 = -_1606;
                float _1610 = _1608 + 1.0;
                _1506 = _1610;
            }
            float _1612 = _1506;
            if (!_1574)
            {
                _1508 = 1.0;
            }
            float _1614 = _1508;
            float _1616 = _1614;
            if (!_1576)
            {
                _1580 = 1.0;
            }
            float _1618 = _1580;
            float _1620 = _1428;
            float _1622 = _1618;
            if (_1574)
            {
                float _1624 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1620 = _1624;
            }
            float _1626 = _1620;
            float _1628 = _1438;
            if (_1576)
            {
                float _1630 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1628 = _1630;
            }
            float _1632 = _1628;
            if (_1572)
            {
                float _1634 = _1592 * _1584;
                float _1636 = precise::clamp(_1634, 0.0, 1.0);
                _1604 = _1636;
            }
            float _1638 = _1604;
            _1524 = _1486;
            if (_1574)
            {
                float _1640 = _1600 * _1626;
                float _1642 = precise::clamp(_1640, 0.0, 1.0);
                _1616 = _1642;
            }
            float _1644 = _1616;
            float _1646 = _1638 * _1644;
            if (_1576)
            {
                float _1648 = _1612 * _1632;
                float _1650 = precise::clamp(_1648, 0.0, 1.0);
                _1622 = _1650;
            }
            float _1652 = _1622;
            float _1654 = _1646 * _1652;
            _1526 = _1654;
        }
    }
    _1528 = false;
    float _1656 = _1520;
    float _1658 = _1522;
    float _1660 = _1524;
    float _1662 = _1526;
    float _1664 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1666 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1668 = floor(_1664);
    float _1670 = floor(_1666);
    float _1672 = -_1668;
    float _1674 = _1664 + _1672;
    float _1676 = -_1670;
    float _1678 = _1666 + _1676;
    float2 _5685 = float2(_1674, _1678);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5685, float2(0.0), isnan(_5685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5685, float2(0.0), isnan(_5685)), level(0.0)).x;
    float _1682 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1684 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1686 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1682);
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1690 = _1656 + _1688;
    float _1692 = _1480 + _1684;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1696 = _1658 + _1694;
    float _1698 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1686);
    float _1700 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1704 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1706 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1700);
    float _1708 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1702);
    bool _1710 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1712 = isnan(0.5);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1718 = _1714 || _1716;
    float _1720 = 1.0 / _1704;
    float _1722 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1706);
    float _1724 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1708);
    float _1726 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1728 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1730 = _1726 + _1704;
    float _1732 = _1730 * _1720;
    float _1734 = _1732 * 0.5;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1738 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1736);
    float _1740 = 1.0 / _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1744 = _1740 * _1742;
    float _1746 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1748 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1750 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1746);
    bool _1752 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1754 = !_1748;
    int _1756 = _1754 ? 0 : 1;
    float _1758 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1750);
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1762 = 2;
    float _1764 = _1658;
    float _1766 = _1656;
    float _1768 = _1660;
    float _1770 = _1760;
    float _1772 = _1662;
    if (!_1748)
    {
        _1762 = 1;
    }
    int _1774 = _1762;
    float _1776 = trunc(_1760);
    int _1778 = int(_1776);
    int _1780 = _1774;
    if (!_1752)
    {
        _1780 = _1756;
    }
    int _1782 = _1780;
    int _1784 = _1782 << 6;
    float _1786 = trunc(_1728);
    int _1788 = int(_1786);
    int _1790 = _1784 + 96;
    uint _1793 = uint(int(uint(_1790) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    int _1809 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1811 = _1778 + _1809;
    int _1813 = _1811 + 1;
    int _1815 = _1784 + 104;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1690 * _1690;
    float _1835 = fma(_1696, _1696, _1833);
    int _1837 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1839 = _1788 + _1837;
    int _1841 = _1839 + 1;
    int _1843 = _1784 + 48;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
    int _1849 = int(_1845) & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    int _1853 = int(_1845) + 1;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    int _1857 = _1853 & 3;
    float _1859 = (*spvDescriptorSet0.vp_c15)._m0[int(_1855)][_1857];
    float _1861 = sqrt(_1835);
    bool _1863 = _1841 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1865 = _1841 | _1813;
    int _1867 = _1784 + 64;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    bool _1885 = _1865 < 0;
    bool _1887 = _1885 || _1863;
    bool _1889 = _1813 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1891 = _1889 || _1887;
    int _1893 = _1784 + 56;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    bool _1911 = _1861 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1913 = _1784 + 72;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    float _1931 = as_type<float>(_1865);
    float _1933 = as_type<float>(_1813);
    if (!_1891)
    {
        float _1935 = floor(_1728);
        _1931 = _1935;
    }
    float _1937 = _1931;
    int _1939 = _1784 + 80;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c15)._m0[int(_1951)][_1953];
    float _1957 = _1692 * _1807;
    float _1959 = fma(_1474, _1799, _1957);
    float _1961 = fma(_1482, _1823, _1959);
    float _1963 = _1961 + _1831;
    int _1965 = as_type<int>(_1961);
    int _1967 = as_type<int>(_1807);
    if (!_1891)
    {
        int _1969 = _1813 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1971 = _1969 + _1841;
        _1965 = _1971;
    }
    int _1973 = _1965;
    float _1975 = _1692 * _1859;
    float _1977 = _1859;
    int _1979 = as_type<int>(_1875);
    float _1981 = _1851;
    if (!_1911)
    {
        _1977 = _1660;
    }
    float _1983 = _1977;
    float _1985 = 1.0 / _1963;
    float _1987 = fma(_1474, _1851, _1975);
    float _1989 = _1692 * _1883;
    float _1991 = fma(_1474, _1875, _1989);
    bool _1993 = !_1911;
    float _1995 = _1983;
    float _1997 = _1937;
    float _1999 = _1985;
    if (!_1993)
    {
        float _2001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2005 = _1861 + _2003;
        float _2007 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2009 = rsqrt(_1835);
        float _2011 = _2005 * _2001;
        float _2013 = _2011 * 0.15915493667125701904296875;
        float _2015 = _2013 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2013 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2017 + (-1.0);
        float _2025 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2027 = fma(_2021, _2007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2029 = fma(_2017, _1660, _2025);
        float _2031 = _2009 * _2027;
        float _2033 = fma(_1696, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2035 = fma(_1690, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1764 = _2033;
        _1766 = _2035;
        _1995 = _2029;
        _1979 = as_type<int>(_2025);
        _1981 = _2021;
    }
    float _2037 = _1764;
    float _2039 = _1766;
    float _2041 = _1995;
    int _2043 = _1979;
    float _2045 = _1981;
    float _2047 = _2045;
    int _2049 = _2043;
    float _2051 = _2041;
    float _2053 = _2041;
    int _2055 = as_type<int>(_2037);
    if (!_1891)
    {
        int _2057 = _1973 << 2;
        _1967 = _2057;
    }
    int _2059 = _1967;
    float _2061 = fma(_1482, _1901, _1987);
    float _2063 = fma(_1482, _1921, _1991);
    int _2065 = _2059;
    if (_1718)
    {
        _2047 = _2037;
    }
    float _2067 = _2047;
    float _2069 = _2067;
    if (!_1891)
    {
        uint _2071 = uint(int(uint(_1973) >> uint(2)));
        _2049 = int(_2071);
    }
    int _2073 = _2049;
    if (!_1891)
    {
        int _2075 = 12 & _2059;
        _2065 = _2075;
    }
    int _2077 = _2065;
    if (_1718)
    {
        _1768 = _2039;
    }
    float _2079 = _1768;
    float _2081 = _2079;
    if (!_1718)
    {
        float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2085 = _1480 + _2083;
        float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2089 = _1474 + _2087;
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2093 = -_1474;
        float _2095 = _2093 + _2037;
        float _2097 = _2085 * _2085;
        float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2101 = _1482 + _2099;
        float _2103 = -_1480;
        float _2105 = _2103 + _2041;
        float _2107 = -_1482;
        float _2109 = _2107 + _2039;
        float _2111 = fma(_2089, _2089, _2097);
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2115 = fma(_2101, _2101, _2111);
        float _2117 = sqrt(_2115);
        float _2119 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _2121 = _2117 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2123 = isnan(_2117);
        bool _2125 = _2121 || _2123;
        bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2129 = _2125 || _2127;
        float _2131 = precise::min(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2133 = _2131 * _2091;
        float _2135 = _2119 * _2133;
        float _2137 = _1696;
        float _2139 = _2131;
        float _2141 = _2135;
        float _2143 = _2119;
        _2055 = as_type<int>(_2095);
        if (_2129)
        {
            float _2145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2137 = _2145;
        }
        float _2147 = _2137;
        if (_2129)
        {
            float _2149 = precise::max(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2139 = _2149;
        }
        float _2151 = _2139;
        float _2153 = fma(_2105, _2135, _1480);
        float _2155 = fma(_2109, _2135, _1482);
        if (_2129)
        {
            float _2157 = _2151 * _2147;
            _2051 = _2157;
        }
        float _2159 = _2051;
        float _2161 = fma(_2095, _2135, _1474);
        float _2163 = _2159;
        float _2165 = _2161;
        if (_2129)
        {
            float _2167 = _2119 * _2159;
            _2141 = _2167;
        }
        float _2169 = _2141;
        if (!_2129)
        {
            _2163 = _2153;
        }
        float _2171 = _2163;
        float _2173 = _2171;
        if (!_2129)
        {
            _2143 = _2161;
        }
        float _2175 = _2143;
        float _2177 = _2175;
        if (_2129)
        {
            float _2179 = fma(_2105, _2169, _1480);
            _2173 = _2179;
        }
        float _2181 = _2173;
        _2053 = _2181;
        if (!_2129)
        {
            _2165 = _2155;
        }
        float _2183 = _2165;
        _2081 = _2183;
        if (_2129)
        {
            float _2185 = fma(_2095, _2169, _1474);
            _2177 = _2185;
        }
        float _2187 = _2177;
        _2069 = _2187;
        if (_2129)
        {
            float _2189 = fma(_2109, _2169, _1482);
            _2081 = _2189;
        }
    }
    float _2191 = _2053;
    float _2193 = _2069;
    int _2195 = _2055;
    float _2197 = _2081;
    int _2199 = _2195;
    if (!_1891)
    {
        int _2201 = _2073 << 4;
        int _2203 = _2201 + _2077;
        _2199 = _2203;
    }
    int _2205 = _2199;
    float _2207 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2209 = _1784 + 88;
    uint _2211 = uint(int(uint(_2209) >> uint(2)));
    uint _2213 = uint(int(uint(int(_2211)) >> uint(2)));
    int _2215 = int(_2211) & 3;
    float _2217 = (*spvDescriptorSet0.vp_c15)._m0[int(_2213)][_2215];
    int _2219 = int(_2211) + 1;
    uint _2221 = uint(int(uint(_2219) >> uint(2)));
    int _2223 = _2219 & 3;
    float _2225 = (*spvDescriptorSet0.vp_c15)._m0[int(_2221)][_2223];
    float _2227 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2229 = _2061 + _1909;
    float _2231 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2207);
    float _2233 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2235 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2227);
    float _2237 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2239 = _2229 * _1985;
    float _2241 = _2207;
    float _2243 = as_type<float>(_2205);
    if (!_1891)
    {
        int _2245 = _2205 + 400;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
        int _2251 = int(_2247) & 3;
        float _2253 = (*spvDescriptorSet0.vp_c15)._m0[int(_2249)][_2251];
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2233);
    float _2259 = _2063 + _1929;
    float _2261 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2237);
    bool _2263 = _2239 >= 0.0;
    float _2265 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2257);
    float _2267 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2235);
    float _2269 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2261);
    float _2271 = _2259 * _1985;
    float _2273 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2275 = _2239 <= 1.0;
    bool _2277 = _2275 && _2263;
    float _2279 = _2269 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2281 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2285 = _2271 >= 0.0;
    bool _2287 = _2285 && _2277;
    float _2289 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2293 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2231);
    float _2295 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2283);
    bool _2297 = _2271 <= 1.0;
    bool _2299 = _2297 && _2287;
    float _2301 = -_2291;
    float _2303 = fma(_2301, _2289, 1.0);
    float _2305 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2307 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2295);
    float _2309 = _1929;
    if (!_1891)
    {
        float _2311 = floor(_1760);
        _2309 = _2311;
    }
    float _2313 = _2309;
    float _2315 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2317 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2307);
    float _2321 = _1692 * _1955;
    float _2323 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2315);
    float _2325 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2317);
    if (!_1891)
    {
        float _2327 = -_1937;
        float _2329 = _1728 + _2327;
        _1997 = _2329;
    }
    float _2331 = _1997;
    float _2333 = log2(_2303);
    if (_2299)
    {
        float _2335 = float(_1782);
        _2243 = _2335;
    }
    float _2337 = _2243;
    float _2339 = fma(_1474, _1947, _2321);
    float _2341 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2323);
    float _2343 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2325);
    float _2345 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2341);
    float _2347 = 1.0 / _2319;
    float _2349 = fma(_1482, _2217, _2339);
    if (!_1891)
    {
        float _2351 = -_2313;
        float _2353 = _1760 + _2351;
        _1770 = _2353;
    }
    float _2355 = _1770;
    float _2357 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2343);
    float _2359 = _2349 + _2225;
    float _2361 = _2337;
    if (_2299)
    {
        float _2363 = rint(_2337);
        float _2365 = precise::max(_2363, 0.0);
        uint _2367 = uint(_2365);
        uint _2369 = clamp(_2367, 0u, 65535u);
        _2361 = as_type<float>(_2369);
    }
    float _2371 = _2361;
    float _2373 = _2333 * 0.693147182464599609375;
    float _2375 = _2359 * _1985;
    float _2377 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2379 = _2339;
    if (!_1891)
    {
        float _2381 = rint(_2255);
        float _2383 = precise::max(_2381, 0.0);
        uint _2385 = uint(_2383);
        uint _2387 = clamp(_2385, 0u, 65535u);
        _2379 = as_type<float>(_2387);
    }
    float _2389 = _2379;
    float _2391 = _2345 * _2347;
    float _2393 = _2357 * _2347;
    float _2395 = fma(_2391, 0.5, 0.5);
    float _2397 = fma(_2393, -0.5, 0.5);
    float _2399 = _2371;
    if (_2299)
    {
        float3 _6886 = float3(_2239, _2271, float(as_type<int>(_2371)));
        float3 _6890 = select(_6886, float3(0.0), isnan(_6886));
        float _2401 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6890.xy, uint(rint(_6890.z)), _2375, level(0.0));
        _2399 = _2401;
    }
    float _2403 = _2399;
    float3 _6900 = float3(_2395, _2397, _2377);
    float _2405 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6900, float3(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6900, float3(0.0), isnan(_6900)), level(0.0)).x;
    float3 _6909 = float3(_2395, _2397, _2377);
    float4 _2408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6909, float3(0.0), isnan(_6909)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6909, float3(0.0), isnan(_6909)), level(0.0)).xyzw;
    float _2410 = _2408.x;
    float _2412 = _2408.y;
    float _2414 = _2408.z;
    float _2416 = _2408.w;
    float _2418 = _2331;
    if (!_1891)
    {
        float3 _6932 = float3(_2331, _2355, float(as_type<int>(_2389)));
        float3 _6934 = select(_6932, float3(0.0), isnan(_6932));
        float _2420 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6934.xy, uint(rint(_6934.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6934.xy, uint(rint(_6934.z)), level(0.0)).x;
        _2418 = _2420;
    }
    float _2422 = _2418;
    if (_1891)
    {
        _1999 = 1.0;
    }
    float _2424 = _1999;
    float _2426 = _2424;
    float _2428 = _2412;
    float _2430 = _2410;
    if (!_1891)
    {
        int _2432 = _1973 << 4;
        int _2434 = _2432 + 2048;
        uint _2436 = uint(int(uint(_2434) >> uint(2)));
        uint _2438 = uint(int(uint(int(_2436)) >> uint(2)));
        int _2440 = int(_2436) & 3;
        float _2442 = (*spvDescriptorSet0.vp_c15)._m0[int(_2438)][_2440];
        int _2444 = int(_2436) + 1;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        int _2448 = _2444 & 3;
        float _2450 = (*spvDescriptorSet0.vp_c15)._m0[int(_2446)][_2448];
        int _2452 = _2434 + 8;
        uint _2454 = uint(int(uint(_2452) >> uint(2)));
        uint _2456 = uint(int(uint(int(_2454)) >> uint(2)));
        int _2458 = int(_2454) & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        int _2462 = int(_2454) + 1;
        uint _2464 = uint(int(uint(_2462) >> uint(2)));
        int _2466 = _2462 & 3;
        float _2468 = (*spvDescriptorSet0.vp_c15)._m0[int(_2464)][_2466];
        float _2470 = _1692 * _2450;
        float _2472 = fma(_1474, _2442, _2470);
        float _2474 = fma(_1482, _2460, _2472);
        float _2476 = _2474 + _2468;
        float _2478 = precise::clamp(_2476, 0.0, 1.0);
        float _2480 = -_2478;
        float _2482 = _2480 + _2422;
        float _2484 = fma(_2482, 500.0, 1.5);
        float _2486 = exp2(_2484);
        float _2488 = 0.0 + _2486;
        float _2490 = precise::clamp(_2488, 0.0, 1.0);
        _2426 = _2490;
    }
    float _2492 = _2426;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2496 = _2191 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2500 = _2193 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2504 = _2197 + _2502;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = rsqrt(_2510);
    float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2516 = _2500 * _2514;
    float _2518 = _2504 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 * _2518;
    float _2524 = _2520 + _2522;
    float _2526 = sqrt(_2524);
    bool _2528 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2526 + _2530;
    float _2534 = _2512;
    float _2536 = _2532;
    float _2538 = _2496;
    float _2540 = _2514;
    if (_2528)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2542;
    }
    float _2544 = _2534;
    if (_2528)
    {
        float _2546 = _2532 * _2544;
        _2536 = _2546;
    }
    float _2548 = _2536;
    if (_2528)
    {
        float _2550 = _2548 * 0.15915493667125701904296875;
        _1510 = _2550;
    }
    float _2552 = _1510;
    float _2554 = _2504;
    float _2556 = _2552;
    if (_2528)
    {
        float _2558 = _2552 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2554 = _2560;
    }
    float _2562 = _2554;
    float _2564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2566 = precise::max(0.0, _2564);
    float _2568 = _2355;
    float _2570 = _2566;
    if (_2528)
    {
        float _2572 = _2552 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2568 = _2574;
    }
    float _2576 = _2568;
    float _2578 = -_2514;
    float _2580 = -_2566;
    float _2582 = fma(_2496, _2578, _2580);
    float _2584 = _2564;
    if (_2528)
    {
        float _2586 = rsqrt(_2524);
        _2584 = _2586;
    }
    float _2588 = _2584;
    if (_2528)
    {
        float _2590 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2570 = _2590;
    }
    float _2592 = _2570;
    float _2594 = _2592;
    if (!_2528)
    {
        _2556 = _2520;
    }
    float _2596 = _2556;
    float _2598 = _2562;
    float _2600 = _2596;
    if (_2528)
    {
        float _2602 = fma(_2562, _2592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2594 = _2602;
    }
    float _2604 = _2594;
    float _2606 = _2604;
    if (!_2528)
    {
        _2598 = _2518;
    }
    float _2608 = _2598;
    float _2610 = _2608;
    float _2612 = _2576;
    if (_2528)
    {
        float _2614 = _2576 + (-1.0);
        _2538 = _2614;
    }
    float _2616 = _2538;
    if (_2528)
    {
        float _2618 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2618;
    }
    float _2620 = _2540;
    float _2622 = sqrt(_2510);
    float _2624 = _2588;
    if (_2528)
    {
        float _2626 = _2588 * _2604;
        _1933 = _2626;
    }
    float _2628 = _1933;
    if (!_2528)
    {
        _2606 = _2516;
    }
    float _2630 = _2606;
    float _2632 = _2630;
    if (!_2528)
    {
        _2624 = _2582;
    }
    float _2634 = _2624;
    float _2636 = _2634;
    if (_2528)
    {
        float _2638 = _2516 * _2628;
        _2632 = _2638;
    }
    float _2640 = _2632;
    if (_2528)
    {
        float _2642 = fma(_2582, _2576, _2620);
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (_2528)
    {
        float _2646 = _2518 * _2628;
        _2610 = _2646;
    }
    float _2648 = _2610;
    if (!_2528)
    {
        _2612 = _2522;
    }
    float _2650 = _2612;
    float _2652 = _2650;
    if (_2528)
    {
        float _2654 = _2640 * _2640;
        _2600 = _2654;
    }
    float _2656 = _2600;
    if (_2528)
    {
        float _2658 = _2648 * _2648;
        _2652 = _2658;
    }
    float _2660 = _2652;
    float _2662 = fma(_2644, _2644, _2656);
    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2666 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2664);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = _2662 + _2660;
    float _2672 = -_2668;
    float _2674 = _2672 + 1.0;
    float _2676 = rsqrt(_2670);
    float _2678 = _2676 * _2644;
    float _2680 = _2676 * _2640;
    float _2682 = abs(_2674);
    float _2684 = log2(_2682);
    float _2686 = _2676 * _2648;
    float _2688 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2690 = -_2688;
    float _2692 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2690);
    float _2694 = -_2686;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2692);
    float _2698 = fma(_2696, -0.5, 0.5);
    float _2700 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2702 = fma(_2696, 0.5, 0.5);
    float _2704 = exp2(_2700);
    float _2706 = fma(_2702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2708 = fma(_2702, _2706, -0.212114393711090087890625);
    float _2710 = _2678 + 1.0;
    float _2712 = sqrt(_2698);
    float _2714 = fma(_2702, _2708, 1.570728778839111328125);
    float _2716 = -_2678;
    float _2718 = fma(_2704, _2710, _2716);
    float _2720 = _2712 * 0.636619746685028076171875;
    float _2722 = fma(_2718, 0.5, 0.5);
    float _2724 = -_2714;
    float _2726 = fma(_2720, _2724, 1.0);
    float2 _7408 = float2(_2726, _2722);
    float3 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7408, float2(0.0), isnan(_7408)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7408, float2(0.0), isnan(_7408)), level(0.0)).xyz;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = abs(_1744);
    float _2740 = log2(_2738);
    float _2742 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2744 = -_1680;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2742);
    float _2750 = _2319 * 0.5;
    out.m_99.x = _2193;
    out.m_99.y = _2191;
    out.m_99.z = _2197;
    bool _2752 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2754 = isnan(_2622);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2760 = _2756 || _2758;
    float _2762 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2748);
    float _2764 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2766 = _1744 <= 8000.0;
    bool _2768 = isnan(_1744);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(8000.0);
    bool _2774 = _2770 || _2772;
    float _2776 = float(_2774);
    float _2778 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2762);
    float _2780 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2782 = exp2(_2764);
    out.gl_Position.x = _2345;
    out.gl_Position.y = _2357;
    out.gl_Position.z = _2778;
    out.gl_Position.w = _2319;
    float _2784 = exp2(_2780);
    float _2786 = -_2782;
    float _2788 = _2786 + 1.0;
    float _2790 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2792 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = _2345 + _2319;
    float _2798 = _2790 * _2405;
    float _2800 = -_2790;
    float _2802 = _2800 + 1.0;
    float _2804 = fma(_2794, -2.0, 3.0);
    float _2806 = _2794 * _2794;
    float _2808 = _2796 * 0.5;
    float _2810 = _2806 * _2804;
    float _2812 = -_2810;
    float _2814 = _2812 + 1.0;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2810);
    float _2818 = _2778 + _2319;
    float _2820 = fma(_2357, -0.5, _2750);
    float _2822 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2824 = _2776 * _2816;
    float _2826 = _2776;
    float _2828 = _2802;
    if (!_2299)
    {
        _2826 = 1.0;
    }
    float _2830 = _2826;
    float _2832 = _2818 * 0.5;
    float _2834 = _2830;
    if (_2299)
    {
        bool _2836 = _2403 >= _2375;
        bool _2838 = isnan(_2403);
        bool _2840 = _2836 || _2838;
        bool _2842 = isnan(_2375);
        bool _2844 = _2840 || _2842;
        float _2846 = float(_2844);
        _2834 = _2846;
    }
    float _2848 = _2834;
    float _2850 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2760)
    {
        _1772 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2852 = _1772;
    out.m_101.x = _2808;
    out.m_101.y = _2820;
    out.m_101.z = _2832;
    out.m_101.w = _2319;
    float _2854 = _2746 * _2850;
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = _2848 * _2492;
    float _2860 = -_2856;
    float _2862 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2864 = _2856;
    float _2866 = _2852;
    float _2868 = _2852;
    if (!_2760)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2870 = _2864;
    float _2872 = -_2858;
    float _2874 = fma(_2872, _2862, 1.0);
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = _2876 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2880 = _2416 * _2798;
    float _2882 = _2416 * _2802;
    float _2884 = _2876;
    float _2886 = _2870;
    float _2888 = _2870;
    if (!_2760)
    {
        _2828 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2890 = _2828;
    out.m_103.x = _2878;
    float _2892 = _2890;
    float _2894 = _2890;
    if (!_2760)
    {
        _2884 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2896 = _2884;
    float _2898 = _2736 * _2798;
    float _2900 = fma(_2732, _2880, _2410);
    float _2902 = fma(_2734, _2880, _2412);
    float _2904 = _2896;
    float _2906 = _2896;
    if (!_2760)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2908 = _2428;
    float _2910 = fma(_2416, _2898, _2414);
    float _2912 = _2908;
    float _2914 = _2908;
    if (!_2760)
    {
        _2430 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2916 = _2430;
    out.m_105.x = _2900;
    out.m_105.y = _2902;
    out.m_105.z = _2910;
    out.m_105.w = _2882;
    bool _2918 = !_2760;
    float _2920 = _2916;
    float _2922 = _2916;
    if (!_2918)
    {
        bool _2924 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2926 = isnan(_2622);
        bool _2928 = _2924 || _2926;
        bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2932 = _2928 || _2930;
        if (!_2932)
        {
            float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2936 = _2622 + _2934;
            float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2938;
            float _2942 = 1.0 / _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2964 = _2936 * _2942;
            float _2966 = precise::clamp(_2964, 0.0, 1.0);
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2972 = fma(_2966, _2946, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2974 = fma(_2966, _2970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2976 = fma(_2966, _2950, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2978 = fma(_2966, _2954, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2980 = fma(_2966, _2958, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2982 = fma(_2966, _2962, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2894 = _2974;
            _2868 = _2980;
            _2888 = _2972;
            _2922 = _2978;
            _2914 = _2976;
            _2906 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2988 = isnan(_2622);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                _2886 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2996 = _2886;
            _2888 = _2996;
            if (!_2994)
            {
                _2892 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2998 = _2892;
            _2894 = _2998;
            if (!_2994)
            {
                _2912 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3000 = _2912;
            _2914 = _3000;
            if (!_2994)
            {
                _2920 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3002 = _2920;
            _2922 = _3002;
            if (!_2994)
            {
                _2866 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3004 = _2866;
            _2868 = _3004;
            if (!_2994)
            {
                _2904 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3006 = _2904;
            bool _3008 = !_2994;
            _2906 = _3006;
            if (!_3008)
            {
                bool _3010 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3012 = isnan(_2622);
                bool _3014 = _3010 || _3012;
                bool _3016 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3018 = _3014 || _3016;
                if (!_3018)
                {
                    float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3022 = _2622 + _3020;
                    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3024;
                    float _3028 = 1.0 / _3026;
                    float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3050 = _3022 * _3028;
                    float _3052 = precise::clamp(_3050, 0.0, 1.0);
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3058 = fma(_3052, _3032, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3060 = fma(_3052, _3056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3062 = fma(_3052, _3036, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3064 = fma(_3052, _3040, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3066 = fma(_3052, _3044, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3068 = fma(_3052, _3048, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2894 = _3060;
                    _2868 = _3066;
                    _2888 = _3058;
                    _2922 = _3064;
                    _2914 = _3062;
                    _2906 = _3068;
                    _2984 = true;
                }
                else
                {
                    _2894 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2868 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2888 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2922 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2914 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2906 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2984 = false;
    float _3070 = _2894;
    float _3072 = _2868;
    float _3074 = _2888;
    float _3076 = _2922;
    float _3078 = _2914;
    float _3080 = _2906;
    float _3082 = fma(_1436, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3070;
    float _3088 = _3086 + _3072;
    float _3090 = -_3074;
    float _3092 = _3090 + _3076;
    float _3094 = -_3078;
    float _3096 = _3094 + _3080;
    bool _3098 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3100 = fma(_3084, _3088, _3070);
    float _3102 = fma(_3084, _3092, _3074);
    float _3104 = fma(_3084, _3096, _3078);
    float _3106 = _2822 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3108 = _3100 * 0.586610972881317138671875;
    out.m_107.x = 0.0;
    float _3110 = fma(_3102, 0.298911988735198974609375, _3108);
    out.m_61.x = _3106;
    float _3112 = fma(_3104, 0.114477999508380889892578125, _3110);
    float _3114 = -_3112;
    float _3116 = _3102 + _3114;
    float _3118 = -_3112;
    float _3120 = _3100 + _3118;
    float _3122 = -_3112;
    float _3124 = _3104 + _3122;
    float _3126 = fma(_3116, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    float _3128 = fma(_3120, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    float _3130 = fma(_3124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    out.m_109.x = _3126;
    out.m_109.y = _3128;
    out.m_109.z = _3130;
    if (!_3098)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3132 = -_2191;
    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3136 = -_2193;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3140 = -_2197;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3144 = _3134 * _3134;
    float _3146 = fma(_3138, _3138, _3144);
    float _3148 = fma(_3142, _3142, _3146);
    float _3150 = sqrt(_3148);
    float _3152 = rsqrt(_3148);
    float _3154 = -_3150;
    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3158 = _3156 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3160 = precise::clamp(_3158, 0.0, 1.0);
    float _3162 = _3138 * _3152;
    float _3164 = _3134 * _3152;
    float _3166 = abs(_3160);
    float _3168 = log2(_3166);
    float _3170 = _3142 * _3152;
    float _3172 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3174 = _1436 * _3164;
    float _3176 = -_3164;
    float _3178 = -_3172;
    float _3180 = fma(_3176, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3178);
    float _3182 = fma(_1432, _3162, _3174);
    float _3184 = -_3170;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3180);
    float _3188 = fma(_1434, _3170, _3182);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3194 = _3186 + _3192;
    float _3196 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3198 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = exp2(_3196);
    float _3204 = _3202 * _3200;
    float _3206 = _3190 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _3208;
    out.m_107.y = _3210;
    out.m_107.z = _3212;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _1528 = false;
    bool _1516 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_58.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_61.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_144);
        out.gl_Position.z = _3269;
    }
    if (!_132)
    {
        return out;
    }
    float _148 = in.m_63.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = 0.0;
    float _166 = _162;
    if (_158)
    {
        float _168 = float(_128);
        _164 = _168;
    }
    float _170 = _164;
    bool _172 = _162 >= _170;
    bool _174 = !_158;
    bool _176 = _172 || _174;
    if (_176)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _138;
    if (_176)
    {
        out.m_61.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3338 = as_type<float>(_182);
        out.gl_Position.z = _3338;
    }
    if (_176)
    {
        return out;
    }
    float _184 = in.m_65.x;
    float _186 = in.m_65.y;
    float _188 = in.m_65.z;
    float _190 = in.m_67.x;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = in.m_69.x;
    float _198 = in.m_69.y;
    float _200 = in.m_69.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    int _232 = as_type<int>(_184);
    if (_226)
    {
        float _234 = rsqrt(_214);
        _230 = _234;
    }
    float _236 = _230;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_226)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _242 = _238;
    float _244 = _240;
    bool _246 = _224 > 0.0;
    float _248 = 0.0;
    float _250 = _242;
    float _252 = _244;
    if (!_226)
    {
        _248 = 0.0;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = _254;
    if (!_228)
    {
        _256 = 0.0;
    }
    float _260 = _256;
    float _262 = _224;
    float _264 = _260;
    if (_228)
    {
        float _266 = rsqrt(_216);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = _272;
    if (!_246)
    {
        _274 = 0.0;
        _276 = 0.0;
    }
    float _280 = _274;
    float _282 = _276;
    float _284 = 0.0;
    float _286 = _280;
    float _288 = _282;
    if (_246)
    {
        float _290 = rsqrt(_218);
        _284 = _290;
    }
    float _292 = _284;
    float _294 = _236;
    if (_226)
    {
        float _296 = _236 * _190;
        _250 = _296;
    }
    float _298 = _250;
    if (_226)
    {
        float _300 = _236 * _184;
        _252 = _300;
    }
    float _302 = _252;
    if (_226)
    {
        float _304 = _236 * _196;
        _258 = _304;
    }
    float _306 = _258;
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_228)
    {
        _294 = 0.0;
    }
    float _310 = _294;
    float _312 = 0.0;
    float _314 = _310;
    if (!_246)
    {
        _312 = 0.0;
    }
    float _316 = _312;
    float _318 = _316;
    if (_228)
    {
        float _320 = _268 * _192;
        _314 = _320;
    }
    float _322 = _314;
    if (_228)
    {
        float _324 = _268 * _186;
        _264 = _324;
    }
    float _326 = _264;
    if (_228)
    {
        float _328 = _268 * _198;
        _278 = _328;
    }
    float _330 = _278;
    if (_246)
    {
        float _332 = _292 * _194;
        _286 = _332;
    }
    float _334 = _286;
    if (_246)
    {
        float _336 = _292 * _188;
        _288 = _336;
    }
    float _338 = _288;
    if (_246)
    {
        float _340 = _292 * _200;
        _318 = _340;
    }
    float _342 = _318;
    bool _344 = !_308;
    float _362;
    if (!_344)
    {
        float _346 = in.m_71.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_128);
        float _368 = 1.0 / _366;
        float _370 = _162 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_58.x;
    float _376 = in.m_58.y;
    float _378 = in.m_58.z;
    float _380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _382 = log2(_380);
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _386 = _384 != 0;
    float _388 = in.m_73.x;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _392 = _390 != 0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _396 = 1.0 + _394;
    float _398 = in.m_71.x;
    float _400 = in.m_71.y;
    float _402 = in.m_71.z;
    float _404 = in.m_71.w;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _408 = _406 != 0;
    float _410 = in.m_73.y;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = 1.0 / _396;
    float _418 = 0.0;
    int _420 = 1065353216;
    float _422 = 1.0;
    float _424 = _410;
    if (_386)
    {
        float _426 = in.m_71.x;
        _418 = _426;
    }
    float _428 = _418;
    float _430 = _382 * _162;
    float _432 = 0.0;
    if (_392)
    {
        float _434 = in.m_71.z;
        _432 = _434;
    }
    float _436 = _432;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _444 = _192 * _376;
    float _446 = _186 * _376;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _448 = _198 * _376;
    float _450 = fma(_190, _374, _444);
    float _452 = fma(_184, _374, _446);
    if (_392)
    {
        float _454 = -_388;
        float _456 = _454 + 1.0;
        _232 = as_type<int>(_456);
    }
    int _458 = _232;
    float _460 = fma(_194, _378, _450);
    bool _462 = _404 > 0.5;
    float _464 = fma(_196, _374, _448);
    float _466 = fma(_188, _378, _452);
    float _468 = _404;
    if (!_386)
    {
        _468 = _388;
    }
    float _470 = _468;
    float _472 = _470;
    if (_386)
    {
        float _474 = -_388;
        float _476 = _474 + 1.0;
        _420 = as_type<int>(_476);
    }
    int _478 = _420;
    if (!_392)
    {
        _422 = _388;
    }
    float _480 = _422;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _484 = false;
    float _486 = _480;
    if (_386)
    {
        bool _488 = _428 > 0.5;
        _484 = _488;
    }
    bool _490 = _484;
    float _492 = fma(_200, _378, _464);
    float _494 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[79].z, _482);
    bool _496 = false;
    float _498 = _492;
    if (_392)
    {
        bool _500 = _436 > 0.5;
        _496 = _500;
    }
    bool _502 = _496;
    float _504 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_386)
    {
        float _506 = _490 ? as_type<float>(_478) : _388;
        _472 = _506;
    }
    float _508 = _472;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_392)
    {
        float _512 = _502 ? as_type<float>(_458) : _388;
        _486 = _512;
    }
    float _514 = _486;
    float _516 = _398 + _402;
    float _518 = _400 + _398;
    float _520 = _398 * 2.0;
    float _522 = _400 + _402;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _538 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _442);
    bool _540 = _400 > 0.5;
    float _542 = _400 * 2.0;
    float _544 = 1.0 / _440;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _548 = _398 + (-0.5);
    float _550 = _402 + (-0.5);
    float _552 = _402 * 2.0;
    float _554 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].z, _546);
    float _556 = _400 + (-0.5);
    float _558 = -_510;
    float _560 = fma(_504, 2.0, _558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _572 = exp2(_430);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _582 = in.m_77.x;
    float _584 = in.m_77.y;
    float _586 = in.m_77.z;
    float _588 = _522 + (-1.0);
    float _590 = _578 * _544;
    float _592 = 1.0 / _568;
    float _594 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[79].x, _494);
    float _596 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _554);
    float _598 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _538);
    float _600 = _518 + (-1.0);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _604 = 1.0 / _564;
    float _606 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = -_572;
    float _614 = _612 + 1.0;
    float _616 = fma(_536, -2.0, _602);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = floor(_552);
    float _624 = -_410;
    float _626 = _624 + 1.0;
    out.m_79.x = _606;
    out.m_79.y = _608;
    out.m_79.z = _610;
    float _628 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _630 = _582 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _632 = _586 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _634 = _584 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = floor(_542);
    int _642 = _462 ? as_type<int>(_626) : as_type<int>(_410);
    float _644 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _646 = _620 * _592;
    float _648 = _638 * _604;
    float _650 = _408 ? as_type<float>(_642) : _410;
    float _652 = _516 + (-1.0);
    float _654 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_414)
    {
        float _656 = _540 ? _626 : _410;
        _424 = _656;
    }
    float _658 = _424;
    float _660 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _616);
    bool _662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(1.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _674 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = in.m_81.x;
    float _686 = in.m_81.y;
    float _688 = in.m_81.z;
    bool _690 = _622 > 0.0;
    float _692 = floor(_520);
    float _694 = _682 ? _614 : 0.0;
    float _696 = in.m_65.w;
    bool _698 = _622 >= 0.0;
    bool _700 = isnan(_622);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -_162;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _560);
    float _712 = in.m_69.w;
    int _714 = _706 ? 0 : 1;
    if (_670)
    {
        float _716 = _694 * _416;
        _166 = _716;
    }
    float _718 = _166;
    float _720 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _722 = in.m_67.w;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _372 + _724;
    int _728 = ~_714;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _736 = _732;
    if (!_690)
    {
        int _738 = ~_714;
        int _740 = _738 + 1;
        _736 = _740;
    }
    int _742 = _736;
    float _744 = fma(_590, _726, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _746 = _640 > 0.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _750 = _372 + _748;
    bool _752 = _640 >= 0.0;
    bool _754 = isnan(_640);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _372 + _764;
    bool _768 = _692 > 0.0;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _686);
    bool _772 = _692 >= 0.0;
    bool _774 = isnan(_692);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _688);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _684);
    float _786 = _770 * _644;
    float _788 = fma(_646, _750, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _790 = fma(_648, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _792 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _794 = isnan(_372);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = in.m_83.x;
    float _806 = in.m_83.y;
    float _808 = in.m_83.z;
    float _810 = _782 * _762;
    float _812 = _784 * _720;
    float _814 = _780 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _816 = -_802;
    float _818 = _816 + 1.0;
    bool _820 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _822 = isnan(_372);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _460 + _722;
    bool _834 = _686 != 0.0;
    bool _836 = isnan(_686);
    bool _838 = _834 || _836;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    float _844 = _594 * (-0.15915493667125701904296875);
    bool _846 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_372);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_830;
    float _860 = _858 + 1.0;
    bool _862 = _684 == 0.0;
    bool _864 = !_842;
    bool _866 = _862 && _864;
    float _868 = _830 * _818;
    bool _870 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _872 = isnan(_372);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _856 * _860;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _886 = _688 == 0.0;
    bool _888 = _886 && _866;
    float _890 = -_856;
    float _892 = _890 + 1.0;
    float _894 = _734 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _896 = ~as_type<int>(_814);
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    float _902 = _466 + _696;
    float _904 = _880 * _892;
    float _906 = -_880;
    float _908 = _906 + 1.0;
    float _910 = _844 * 6.283185482025146484375;
    float _912 = sin(_910);
    int _914 = _900;
    float _916 = _814;
    float _918 = _908;
    if (!_768)
    {
        int _920 = ~as_type<int>(_814);
        int _922 = _920 + 1;
        _914 = _922;
    }
    int _924 = _914;
    float _926 = _744 * _904;
    float _928 = _760 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _930 = _902 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _932 = _492 + _712;
    float _934 = _926;
    float _936 = _928;
    if (_888)
    {
        _916 = _808;
    }
    float _938 = _916;
    float _940 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[115].x, _926);
    float _942 = _844 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _938;
    if (_888)
    {
        _918 = _804;
    }
    float _948 = _918;
    float _950 = _884 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _952 = ~as_type<int>(_928);
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = fma(_894, _658, -0.5);
    float _960 = _884;
    int _962 = _956;
    float _964 = _948;
    if (_888)
    {
        _960 = _938;
    }
    float _966 = _960;
    float _968 = _832 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _970 = _966;
    if (!_746)
    {
        int _972 = ~as_type<int>(_928);
        int _974 = _972 + 1;
        _962 = _974;
    }
    int _976 = _962;
    float _978 = _932 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    if (_888)
    {
        _934 = _806;
    }
    float _980 = _934;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = _980;
    if (!_888)
    {
        _946 = _808;
    }
    float _986 = _946;
    float _988 = _650 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_888)
    {
        _936 = _948;
    }
    float _990 = _936;
    float _992 = _514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _994 = _990;
    if (!_888)
    {
        _964 = _804;
    }
    float _996 = _964;
    float _998 = fma(_788, _882, _940);
    if (_888)
    {
        _498 = _980;
    }
    float _1000 = _498;
    float _1002 = _1000;
    if (!_888)
    {
        float _1004 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[17].y, _986);
        _970 = _1004;
    }
    float _1006 = _970;
    if (!_888)
    {
        _984 = _806;
    }
    float _1008 = _984;
    float _1010 = fma(_950, _508, -0.5);
    float _1012 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1014 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    if (!_888)
    {
        float _1016 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[17].y, _996);
        _994 = _1016;
    }
    float _1018 = _994;
    float _1020 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1022 = !_526;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _912 * _958;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    if (!_888)
    {
        float _1030 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1008);
        _1002 = _1030;
    }
    float _1032 = _1002;
    float _1034 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1020);
    float _1036 = _944 * _958;
    float _1038 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1012);
    int _1040 = abs(_1024);
    float _1042 = fma(_790, _868, _998);
    float _1044 = -_1026;
    float _1046 = fma(_944, _1010, _1044);
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1050 = in.m_85.x;
    float _1052 = in.m_85.y;
    float _1054 = in.m_85.z;
    float _1056 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1014);
    float _1058 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1038);
    float _1060 = float(_1040);
    float _1062 = fma(_912, _1010, _1036);
    float _1064 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1056);
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1070 = float(_742);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    bool _1074 = !_530;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = _1066 * _1028;
    float _1080 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1034);
    float _1082 = _1060 * _1070;
    int _1084 = abs(_1076);
    float _1086 = _1072 * _1048;
    float _1088 = fma(_1078, 0.5, 0.5);
    float _1090 = float(_924);
    float _1092 = in.m_87.x;
    float _1094 = in.m_87.y;
    float _1096 = in.m_87.z;
    float _1098 = in.m_87.w;
    float _1100 = float(_1084);
    float _1102 = _1080 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1104 = _1082 * (-2.0);
    float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1108 = -_660;
    float _1110 = fma(_598, _1062, _1108);
    float _1112 = _1100 * _1090;
    float _1114 = _1102 * _1068;
    float _1116 = fma(_1104, _1050, _1050);
    bool _1118 = !_534;
    int _1120 = _1118 ? 0 : 1;
    float _1122 = _1112 * (-2.0);
    float _1124 = fma(_1086, 0.5, 0.5);
    float _1126 = fma(_628, _1104, _628);
    int _1128 = abs(_1120);
    float _1130 = fma(_654, _1122, _654);
    float _1132 = fma(_1122, _1052, _1052);
    float _1134 = float(_976);
    float _1136 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1116);
    float _1138 = float(_1128);
    float _1140 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1132);
    float _1142 = fma(_596, _1046, _710);
    float _1144 = fma(_1126, _718, _1136);
    float _1146 = floor(_1124);
    float _1148 = _1138 * _1134;
    float _1150 = fma(_1130, _718, _1140);
    float _1152 = _1094 * _986;
    float _1154 = _1092 * _1008;
    float _1156 = _1148 * (-2.0);
    float _1158 = _1096 * _996;
    float _1160 = -_1152;
    float _1162 = fma(_1096, _1008, _1160);
    float _1164 = -_1154;
    float _1166 = fma(_1094, _996, _1164);
    float _1168 = fma(_1156, _1054, _1054);
    float _1170 = fma(_672, _1156, _672);
    float _1172 = _1144 * 0.15915493667125701904296875;
    float _1174 = _1150 * 0.15915493667125701904296875;
    float _1176 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1168);
    float _1178 = -_1158;
    float _1180 = fma(_1092, _986, _1178);
    float _1182 = _1172 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = fma(_1170, _718, _1176);
    float _1188 = _988 * _1106;
    float _1190 = _992 * _982;
    float _1192 = _1186 * 0.15915493667125701904296875;
    float _1194 = _1174 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1180 * _1098;
    float _1200 = _1142 + 0.5;
    float _1202 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1042);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1212 = _1174 * 6.283185482025146484375;
    float _1214 = cos(_1212);
    float _1216 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = -_1146;
    float _1224 = _1124 + _1222;
    float _1226 = _1162 * _1098;
    float _1228 = _1166 * _1098;
    float _1230 = fma(_1114, 0.5, 0.5);
    float _1232 = _1172 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _1184 * _1196;
    out.m_89.x = _1216;
    out.m_89.y = _1218;
    out.m_89.z = _1220;
    out.m_89.w = _1210;
    bool _1238 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1240 = isnan(1.0);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1246 = _1242 || _1244;
    float _1248 = _1192 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1110 + 0.5;
    float _1254 = _1184 * _1214;
    out.m_91.x = _1200;
    out.m_91.y = _1252;
    out.m_91.z = _1190;
    out.m_91.w = _1188;
    float _1256 = _1192 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = _1234 * _1214;
    float _1262 = floor(_1088);
    float _1264 = _1184 * _1250;
    float _1266 = _1234 * _1196;
    float _1268 = _1234 * _1250;
    float _1270 = _1214 * _1250;
    float _1272 = _1196 * _1250;
    float _1274 = _1264 * _1032;
    float _1276 = _1268 * _1094;
    float _1278 = fma(_1258, _1254, _1266);
    float _1280 = fma(_1258, _1266, _1254);
    float _1282 = -_1236;
    float _1284 = fma(_1258, _1260, _1282);
    float _1286 = -_1260;
    float _1288 = fma(_1258, _1236, _1286);
    float _1290 = -_1094;
    float _1292 = _1258 * _1290;
    float _1294 = _1264 * _1094;
    float _1296 = -_1032;
    float _1298 = _1258 * _1296;
    float _1300 = -_786;
    float _1302 = _1258 * _1300;
    float _1304 = -_1198;
    float _1306 = _1258 * _1304;
    float _1308 = _1264 * _786;
    float _1310 = _1268 * _1032;
    float _1312 = _1268 * _786;
    float _1314 = _1268 * _1198;
    float _1316 = fma(_1278, _1018, _1274);
    float _1318 = -_1262;
    float _1320 = _1088 + _1318;
    float _1322 = fma(_1224, 2.0, -1.0);
    float _1324 = fma(_1270, _1018, _1298);
    float _1326 = fma(_1284, _1018, _1310);
    float _1328 = fma(_1270, _1092, _1292);
    float _1330 = _1264 * _1198;
    float _1332 = fma(_1278, _1092, _1294);
    float _1334 = fma(_1284, _1092, _1276);
    float _1336 = fma(_1320, 2.0, -1.0);
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1340 = fma(_1278, _812, _1308);
    float _1342 = fma(_1270, _812, _1302);
    float _1344 = fma(_1270, _1226, _1306);
    float _1346 = fma(_1284, _812, _1312);
    float _1348 = fma(_1278, _1226, _1330);
    float _1350 = fma(_1284, _1226, _1314);
    float _1352 = _1336 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1356 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1358 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1360 = fma(_1272, _1006, _1324);
    float _1362 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1354);
    float _1364 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1356);
    float _1366 = fma(_1288, _1096, _1332);
    float _1368 = fma(_1288, _1006, _1316);
    float _1370 = fma(_1280, _1006, _1326);
    float _1372 = fma(_1288, _810, _1340);
    float _1374 = fma(_1272, _810, _1342);
    float _1376 = fma(_1272, _1096, _1328);
    float _1378 = _1366 * _322;
    float _1380 = fma(_1280, _810, _1346);
    float _1382 = fma(_1288, _1228, _1348);
    float _1384 = floor(_1230);
    float _1386 = fma(_1280, _1096, _1334);
    float _1388 = _1366 * _326;
    float _1390 = fma(_1280, _1228, _1350);
    float _1392 = fma(_1376, _298, _1378);
    float _1394 = fma(_1272, _1228, _1344);
    float _1396 = _1366 * _330;
    float _1398 = _1368 * _322;
    float _1400 = _1368 * _326;
    float _1402 = _1368 * _330;
    float _1404 = _1382 * _322;
    float _1406 = _1382 * _326;
    float _1408 = _1382 * _330;
    float _1410 = fma(_1376, _302, _1388);
    float _1412 = fma(_1376, _306, _1396);
    float _1414 = fma(_1360, _298, _1398);
    float _1416 = fma(_1360, _306, _1402);
    float _1418 = fma(_1360, _302, _1400);
    float _1420 = fma(_1394, _298, _1404);
    float _1422 = fma(_1394, _302, _1406);
    float _1424 = fma(_1394, _306, _1408);
    float _1426 = fma(_1386, _334, _1392);
    float _1428 = fma(_1386, _338, _1410);
    float _1430 = fma(_1386, _342, _1412);
    float _1432 = fma(_1370, _334, _1414);
    float _1434 = fma(_1370, _342, _1416);
    float _1436 = fma(_1370, _338, _1418);
    float _1438 = fma(_1390, _334, _1420);
    float _1440 = fma(_1390, _338, _1422);
    float _1442 = fma(_1390, _342, _1424);
    float _1444 = -_1384;
    float _1446 = _1230 + _1444;
    out.m_93.x = _1426;
    out.m_93.y = _1428;
    out.m_93.z = _1430;
    float _1448 = _1372 * _322;
    float _1450 = _1372 * _326;
    float _1452 = fma(_1446, 2.0, -1.0);
    out.m_95.x = _1438;
    out.m_95.y = _1440;
    out.m_95.z = _1442;
    float _1454 = _1372 * _330;
    float _1456 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1358);
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    out.m_97.x = _1432;
    out.m_97.y = _1436;
    out.m_97.z = _1434;
    float _1460 = fma(_1374, _306, _1454);
    float _1462 = fma(_1374, _298, _1448);
    float _1464 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1362);
    float _1466 = fma(_1374, _302, _1450);
    float _1468 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1364);
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1456);
    float _1472 = fma(_1380, _342, _1460);
    float _1474 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1476 = fma(_1380, _334, _1462);
    float _1478 = fma(_1380, _338, _1466);
    float _1480 = _1468 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1482 = _1470 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1484 = _1476 + _1474;
    float _1486 = _1478 + _1480;
    float _1488 = _1472 + _1482;
    float _1490 = _1420;
    float _1492 = _1370;
    float _1494 = _1430;
    float _1496 = _1430;
    float _1498 = _1470;
    float _1500 = _1336;
    float _1502 = _1322;
    float _1504 = _1426;
    float _1506 = _1452;
    float _1508 = _1462;
    float _1510 = _1482;
    float _1520;
    float _1522;
    float _1524;
    float _1526;
    if (!_1246)
    {
        bool _1512 = _1480 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1514 = !_1512;
        _1516 = _1514;
        if (!_1516)
        {
            float _1518 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1520 = _1518;
            _1522 = 0.0;
            _1524 = 0.0;
            _1526 = 0.0;
            _1528 = true;
        }
    }
    if ((!_1528) || _1516)
    {
        bool _1566;
        if (!_1516)
        {
            bool _1530 = _1480 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1532 = isnan(_1480);
            bool _1534 = _1530 || _1532;
            bool _1536 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1538 = _1534 || _1536;
            bool _1540 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1542 = !_1538;
            bool _1544 = _1540 && _1542;
            bool _1546 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1548 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1544)
            {
                _1490 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1550 = _1490;
            float _1552 = _1550;
            if (_1544)
            {
                _1492 = 0.0;
            }
            float _1554 = _1492;
            _1522 = _1554;
            if (_1544)
            {
                _1494 = 0.0;
            }
            float _1556 = _1494;
            _1496 = _1556;
            _1524 = _1556;
            if (_1544)
            {
                float _1558 = _1550 * 5.0;
                _1552 = _1558;
            }
            float _1560 = _1552;
            _1520 = _1560;
            if (_1544)
            {
                _1548 = 0.0;
            }
            float _1562 = _1548;
            bool _1564 = !_1538;
            _1566 = _1564 && _1546;
            _1498 = _1562;
            _1526 = _1562;
        }
        if ((!_1566) || _1516)
        {
            _1516 = false;
            float _1568 = _1496;
            float _1570 = _1498;
            bool _1572 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1574 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1576 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1578 = _1568;
            float _1580 = _1570;
            _1520 = _1488;
            _1522 = _1484;
            if (_1572)
            {
                float _1582 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1578 = _1582;
            }
            float _1584 = _1578;
            if (_1572)
            {
                float _1586 = abs(_1336);
                float _1588 = -_1586;
                float _1590 = _1588 + 1.0;
                _1500 = _1590;
            }
            float _1592 = _1500;
            if (_1574)
            {
                float _1594 = abs(_1322);
                float _1596 = -_1594;
                float _1598 = _1596 + 1.0;
                _1502 = _1598;
            }
            float _1600 = _1502;
            if (!_1572)
            {
                _1504 = 1.0;
            }
            float _1602 = _1504;
            float _1604 = _1602;
            if (_1576)
            {
                float _1606 = abs(_1452);
                float _1608 = -_1606;
                float _1610 = _1608 + 1.0;
                _1506 = _1610;
            }
            float _1612 = _1506;
            if (!_1574)
            {
                _1508 = 1.0;
            }
            float _1614 = _1508;
            float _1616 = _1614;
            if (!_1576)
            {
                _1580 = 1.0;
            }
            float _1618 = _1580;
            float _1620 = _1428;
            float _1622 = _1618;
            if (_1574)
            {
                float _1624 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1620 = _1624;
            }
            float _1626 = _1620;
            float _1628 = _1438;
            if (_1576)
            {
                float _1630 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1628 = _1630;
            }
            float _1632 = _1628;
            if (_1572)
            {
                float _1634 = _1592 * _1584;
                float _1636 = precise::clamp(_1634, 0.0, 1.0);
                _1604 = _1636;
            }
            float _1638 = _1604;
            _1524 = _1486;
            if (_1574)
            {
                float _1640 = _1600 * _1626;
                float _1642 = precise::clamp(_1640, 0.0, 1.0);
                _1616 = _1642;
            }
            float _1644 = _1616;
            float _1646 = _1638 * _1644;
            if (_1576)
            {
                float _1648 = _1612 * _1632;
                float _1650 = precise::clamp(_1648, 0.0, 1.0);
                _1622 = _1650;
            }
            float _1652 = _1622;
            float _1654 = _1646 * _1652;
            _1526 = _1654;
        }
    }
    _1528 = false;
    float _1656 = _1520;
    float _1658 = _1522;
    float _1660 = _1524;
    float _1662 = _1526;
    float _1664 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1666 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1668 = floor(_1664);
    float _1670 = floor(_1666);
    float _1672 = -_1668;
    float _1674 = _1664 + _1672;
    float _1676 = -_1670;
    float _1678 = _1666 + _1676;
    float2 _5685 = float2(_1674, _1678);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5685, float2(0.0), isnan(_5685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5685, float2(0.0), isnan(_5685)), level(0.0)).x;
    float _1682 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1684 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1686 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1682);
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1690 = _1656 + _1688;
    float _1692 = _1480 + _1684;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1696 = _1658 + _1694;
    float _1698 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1686);
    float _1700 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1704 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1706 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1700);
    float _1708 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1702);
    bool _1710 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1712 = isnan(0.5);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1718 = _1714 || _1716;
    float _1720 = 1.0 / _1704;
    float _1722 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1706);
    float _1724 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1708);
    float _1726 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1728 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1730 = _1726 + _1704;
    float _1732 = _1730 * _1720;
    float _1734 = _1732 * 0.5;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1738 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1736);
    float _1740 = 1.0 / _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1744 = _1740 * _1742;
    float _1746 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1748 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1750 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1746);
    bool _1752 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1754 = !_1748;
    int _1756 = _1754 ? 0 : 1;
    float _1758 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1750);
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1762 = 2;
    float _1764 = _1658;
    float _1766 = _1656;
    float _1768 = _1660;
    float _1770 = _1760;
    float _1772 = _1662;
    if (!_1748)
    {
        _1762 = 1;
    }
    int _1774 = _1762;
    float _1776 = trunc(_1760);
    int _1778 = int(_1776);
    int _1780 = _1774;
    if (!_1752)
    {
        _1780 = _1756;
    }
    int _1782 = _1780;
    int _1784 = _1782 << 6;
    float _1786 = trunc(_1728);
    int _1788 = int(_1786);
    int _1790 = _1784 + 96;
    uint _1793 = uint(int(uint(_1790) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    int _1809 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1811 = _1778 + _1809;
    int _1813 = _1811 + 1;
    int _1815 = _1784 + 104;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1690 * _1690;
    float _1835 = fma(_1696, _1696, _1833);
    int _1837 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1839 = _1788 + _1837;
    int _1841 = _1839 + 1;
    int _1843 = _1784 + 48;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
    int _1849 = int(_1845) & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    int _1853 = int(_1845) + 1;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    int _1857 = _1853 & 3;
    float _1859 = (*spvDescriptorSet0.vp_c15)._m0[int(_1855)][_1857];
    float _1861 = sqrt(_1835);
    bool _1863 = _1841 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1865 = _1841 | _1813;
    int _1867 = _1784 + 64;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    bool _1885 = _1865 < 0;
    bool _1887 = _1885 || _1863;
    bool _1889 = _1813 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1891 = _1889 || _1887;
    int _1893 = _1784 + 56;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    bool _1911 = _1861 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1913 = _1784 + 72;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    float _1931 = as_type<float>(_1865);
    float _1933 = as_type<float>(_1813);
    if (!_1891)
    {
        float _1935 = floor(_1728);
        _1931 = _1935;
    }
    float _1937 = _1931;
    int _1939 = _1784 + 80;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c15)._m0[int(_1951)][_1953];
    float _1957 = _1692 * _1807;
    float _1959 = fma(_1474, _1799, _1957);
    float _1961 = fma(_1482, _1823, _1959);
    float _1963 = _1961 + _1831;
    int _1965 = as_type<int>(_1961);
    int _1967 = as_type<int>(_1807);
    if (!_1891)
    {
        int _1969 = _1813 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1971 = _1969 + _1841;
        _1965 = _1971;
    }
    int _1973 = _1965;
    float _1975 = _1692 * _1859;
    float _1977 = _1859;
    int _1979 = as_type<int>(_1875);
    float _1981 = _1851;
    if (!_1911)
    {
        _1977 = _1660;
    }
    float _1983 = _1977;
    float _1985 = 1.0 / _1963;
    float _1987 = fma(_1474, _1851, _1975);
    float _1989 = _1692 * _1883;
    float _1991 = fma(_1474, _1875, _1989);
    bool _1993 = !_1911;
    float _1995 = _1983;
    float _1997 = _1937;
    float _1999 = _1985;
    if (!_1993)
    {
        float _2001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2005 = _1861 + _2003;
        float _2007 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2009 = rsqrt(_1835);
        float _2011 = _2005 * _2001;
        float _2013 = _2011 * 0.15915493667125701904296875;
        float _2015 = _2013 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2013 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2017 + (-1.0);
        float _2025 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2027 = fma(_2021, _2007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2029 = fma(_2017, _1660, _2025);
        float _2031 = _2009 * _2027;
        float _2033 = fma(_1696, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2035 = fma(_1690, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1764 = _2033;
        _1766 = _2035;
        _1995 = _2029;
        _1979 = as_type<int>(_2025);
        _1981 = _2021;
    }
    float _2037 = _1764;
    float _2039 = _1766;
    float _2041 = _1995;
    int _2043 = _1979;
    float _2045 = _1981;
    float _2047 = _2045;
    int _2049 = _2043;
    float _2051 = _2041;
    float _2053 = _2041;
    int _2055 = as_type<int>(_2037);
    if (!_1891)
    {
        int _2057 = _1973 << 2;
        _1967 = _2057;
    }
    int _2059 = _1967;
    float _2061 = fma(_1482, _1901, _1987);
    float _2063 = fma(_1482, _1921, _1991);
    int _2065 = _2059;
    if (_1718)
    {
        _2047 = _2037;
    }
    float _2067 = _2047;
    float _2069 = _2067;
    if (!_1891)
    {
        uint _2071 = uint(int(uint(_1973) >> uint(2)));
        _2049 = int(_2071);
    }
    int _2073 = _2049;
    if (!_1891)
    {
        int _2075 = 12 & _2059;
        _2065 = _2075;
    }
    int _2077 = _2065;
    if (_1718)
    {
        _1768 = _2039;
    }
    float _2079 = _1768;
    float _2081 = _2079;
    if (!_1718)
    {
        float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2085 = _1480 + _2083;
        float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2089 = _1474 + _2087;
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2093 = -_1474;
        float _2095 = _2093 + _2037;
        float _2097 = _2085 * _2085;
        float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2101 = _1482 + _2099;
        float _2103 = -_1480;
        float _2105 = _2103 + _2041;
        float _2107 = -_1482;
        float _2109 = _2107 + _2039;
        float _2111 = fma(_2089, _2089, _2097);
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2115 = fma(_2101, _2101, _2111);
        float _2117 = sqrt(_2115);
        float _2119 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _2121 = _2117 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2123 = isnan(_2117);
        bool _2125 = _2121 || _2123;
        bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2129 = _2125 || _2127;
        float _2131 = precise::min(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2133 = _2131 * _2091;
        float _2135 = _2119 * _2133;
        float _2137 = _1696;
        float _2139 = _2131;
        float _2141 = _2135;
        float _2143 = _2119;
        _2055 = as_type<int>(_2095);
        if (_2129)
        {
            float _2145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2137 = _2145;
        }
        float _2147 = _2137;
        if (_2129)
        {
            float _2149 = precise::max(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2139 = _2149;
        }
        float _2151 = _2139;
        float _2153 = fma(_2105, _2135, _1480);
        float _2155 = fma(_2109, _2135, _1482);
        if (_2129)
        {
            float _2157 = _2151 * _2147;
            _2051 = _2157;
        }
        float _2159 = _2051;
        float _2161 = fma(_2095, _2135, _1474);
        float _2163 = _2159;
        float _2165 = _2161;
        if (_2129)
        {
            float _2167 = _2119 * _2159;
            _2141 = _2167;
        }
        float _2169 = _2141;
        if (!_2129)
        {
            _2163 = _2153;
        }
        float _2171 = _2163;
        float _2173 = _2171;
        if (!_2129)
        {
            _2143 = _2161;
        }
        float _2175 = _2143;
        float _2177 = _2175;
        if (_2129)
        {
            float _2179 = fma(_2105, _2169, _1480);
            _2173 = _2179;
        }
        float _2181 = _2173;
        _2053 = _2181;
        if (!_2129)
        {
            _2165 = _2155;
        }
        float _2183 = _2165;
        _2081 = _2183;
        if (_2129)
        {
            float _2185 = fma(_2095, _2169, _1474);
            _2177 = _2185;
        }
        float _2187 = _2177;
        _2069 = _2187;
        if (_2129)
        {
            float _2189 = fma(_2109, _2169, _1482);
            _2081 = _2189;
        }
    }
    float _2191 = _2053;
    float _2193 = _2069;
    int _2195 = _2055;
    float _2197 = _2081;
    int _2199 = _2195;
    if (!_1891)
    {
        int _2201 = _2073 << 4;
        int _2203 = _2201 + _2077;
        _2199 = _2203;
    }
    int _2205 = _2199;
    float _2207 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2209 = _1784 + 88;
    uint _2211 = uint(int(uint(_2209) >> uint(2)));
    uint _2213 = uint(int(uint(int(_2211)) >> uint(2)));
    int _2215 = int(_2211) & 3;
    float _2217 = (*spvDescriptorSet0.vp_c15)._m0[int(_2213)][_2215];
    int _2219 = int(_2211) + 1;
    uint _2221 = uint(int(uint(_2219) >> uint(2)));
    int _2223 = _2219 & 3;
    float _2225 = (*spvDescriptorSet0.vp_c15)._m0[int(_2221)][_2223];
    float _2227 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2229 = _2061 + _1909;
    float _2231 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2207);
    float _2233 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2235 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2227);
    float _2237 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2239 = _2229 * _1985;
    float _2241 = _2207;
    float _2243 = as_type<float>(_2205);
    if (!_1891)
    {
        int _2245 = _2205 + 400;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
        int _2251 = int(_2247) & 3;
        float _2253 = (*spvDescriptorSet0.vp_c15)._m0[int(_2249)][_2251];
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2233);
    float _2259 = _2063 + _1929;
    float _2261 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2237);
    bool _2263 = _2239 >= 0.0;
    float _2265 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2257);
    float _2267 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2235);
    float _2269 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2261);
    float _2271 = _2259 * _1985;
    float _2273 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2275 = _2239 <= 1.0;
    bool _2277 = _2275 && _2263;
    float _2279 = _2269 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2281 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2285 = _2271 >= 0.0;
    bool _2287 = _2285 && _2277;
    float _2289 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2293 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2231);
    float _2295 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2283);
    bool _2297 = _2271 <= 1.0;
    bool _2299 = _2297 && _2287;
    float _2301 = -_2291;
    float _2303 = fma(_2301, _2289, 1.0);
    float _2305 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2307 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2295);
    float _2309 = _1929;
    if (!_1891)
    {
        float _2311 = floor(_1760);
        _2309 = _2311;
    }
    float _2313 = _2309;
    float _2315 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2317 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2307);
    float _2321 = _1692 * _1955;
    float _2323 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2315);
    float _2325 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2317);
    if (!_1891)
    {
        float _2327 = -_1937;
        float _2329 = _1728 + _2327;
        _1997 = _2329;
    }
    float _2331 = _1997;
    float _2333 = log2(_2303);
    if (_2299)
    {
        float _2335 = float(_1782);
        _2243 = _2335;
    }
    float _2337 = _2243;
    float _2339 = fma(_1474, _1947, _2321);
    float _2341 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2323);
    float _2343 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2325);
    float _2345 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2341);
    float _2347 = 1.0 / _2319;
    float _2349 = fma(_1482, _2217, _2339);
    if (!_1891)
    {
        float _2351 = -_2313;
        float _2353 = _1760 + _2351;
        _1770 = _2353;
    }
    float _2355 = _1770;
    float _2357 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2343);
    float _2359 = _2349 + _2225;
    float _2361 = _2337;
    if (_2299)
    {
        float _2363 = rint(_2337);
        float _2365 = precise::max(_2363, 0.0);
        uint _2367 = uint(_2365);
        uint _2369 = clamp(_2367, 0u, 65535u);
        _2361 = as_type<float>(_2369);
    }
    float _2371 = _2361;
    float _2373 = _2333 * 0.693147182464599609375;
    float _2375 = _2359 * _1985;
    float _2377 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2379 = _2339;
    if (!_1891)
    {
        float _2381 = rint(_2255);
        float _2383 = precise::max(_2381, 0.0);
        uint _2385 = uint(_2383);
        uint _2387 = clamp(_2385, 0u, 65535u);
        _2379 = as_type<float>(_2387);
    }
    float _2389 = _2379;
    float _2391 = _2345 * _2347;
    float _2393 = _2357 * _2347;
    float _2395 = fma(_2391, 0.5, 0.5);
    float _2397 = fma(_2393, -0.5, 0.5);
    float _2399 = _2371;
    if (_2299)
    {
        float3 _6886 = float3(_2239, _2271, float(as_type<int>(_2371)));
        float3 _6890 = select(_6886, float3(0.0), isnan(_6886));
        float _2401 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6890.xy, uint(rint(_6890.z)), _2375, level(0.0));
        _2399 = _2401;
    }
    float _2403 = _2399;
    float3 _6900 = float3(_2395, _2397, _2377);
    float _2405 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6900, float3(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6900, float3(0.0), isnan(_6900)), level(0.0)).x;
    float3 _6909 = float3(_2395, _2397, _2377);
    float4 _2408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6909, float3(0.0), isnan(_6909)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6909, float3(0.0), isnan(_6909)), level(0.0)).xyzw;
    float _2410 = _2408.x;
    float _2412 = _2408.y;
    float _2414 = _2408.z;
    float _2416 = _2408.w;
    float _2418 = _2331;
    if (!_1891)
    {
        float3 _6932 = float3(_2331, _2355, float(as_type<int>(_2389)));
        float3 _6934 = select(_6932, float3(0.0), isnan(_6932));
        float _2420 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6934.xy, uint(rint(_6934.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6934.xy, uint(rint(_6934.z)), level(0.0)).x;
        _2418 = _2420;
    }
    float _2422 = _2418;
    if (_1891)
    {
        _1999 = 1.0;
    }
    float _2424 = _1999;
    float _2426 = _2424;
    float _2428 = _2412;
    float _2430 = _2410;
    if (!_1891)
    {
        int _2432 = _1973 << 4;
        int _2434 = _2432 + 2048;
        uint _2436 = uint(int(uint(_2434) >> uint(2)));
        uint _2438 = uint(int(uint(int(_2436)) >> uint(2)));
        int _2440 = int(_2436) & 3;
        float _2442 = (*spvDescriptorSet0.vp_c15)._m0[int(_2438)][_2440];
        int _2444 = int(_2436) + 1;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        int _2448 = _2444 & 3;
        float _2450 = (*spvDescriptorSet0.vp_c15)._m0[int(_2446)][_2448];
        int _2452 = _2434 + 8;
        uint _2454 = uint(int(uint(_2452) >> uint(2)));
        uint _2456 = uint(int(uint(int(_2454)) >> uint(2)));
        int _2458 = int(_2454) & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        int _2462 = int(_2454) + 1;
        uint _2464 = uint(int(uint(_2462) >> uint(2)));
        int _2466 = _2462 & 3;
        float _2468 = (*spvDescriptorSet0.vp_c15)._m0[int(_2464)][_2466];
        float _2470 = _1692 * _2450;
        float _2472 = fma(_1474, _2442, _2470);
        float _2474 = fma(_1482, _2460, _2472);
        float _2476 = _2474 + _2468;
        float _2478 = precise::clamp(_2476, 0.0, 1.0);
        float _2480 = -_2478;
        float _2482 = _2480 + _2422;
        float _2484 = fma(_2482, 500.0, 1.5);
        float _2486 = exp2(_2484);
        float _2488 = 0.0 + _2486;
        float _2490 = precise::clamp(_2488, 0.0, 1.0);
        _2426 = _2490;
    }
    float _2492 = _2426;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2496 = _2191 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2500 = _2193 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2504 = _2197 + _2502;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = rsqrt(_2510);
    float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2516 = _2500 * _2514;
    float _2518 = _2504 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 * _2518;
    float _2524 = _2520 + _2522;
    float _2526 = sqrt(_2524);
    bool _2528 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2526 + _2530;
    float _2534 = _2512;
    float _2536 = _2532;
    float _2538 = _2496;
    float _2540 = _2514;
    if (_2528)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2542;
    }
    float _2544 = _2534;
    if (_2528)
    {
        float _2546 = _2532 * _2544;
        _2536 = _2546;
    }
    float _2548 = _2536;
    if (_2528)
    {
        float _2550 = _2548 * 0.15915493667125701904296875;
        _1510 = _2550;
    }
    float _2552 = _1510;
    float _2554 = _2504;
    float _2556 = _2552;
    if (_2528)
    {
        float _2558 = _2552 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2554 = _2560;
    }
    float _2562 = _2554;
    float _2564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2566 = precise::max(0.0, _2564);
    float _2568 = _2355;
    float _2570 = _2566;
    if (_2528)
    {
        float _2572 = _2552 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2568 = _2574;
    }
    float _2576 = _2568;
    float _2578 = -_2514;
    float _2580 = -_2566;
    float _2582 = fma(_2496, _2578, _2580);
    float _2584 = _2564;
    if (_2528)
    {
        float _2586 = rsqrt(_2524);
        _2584 = _2586;
    }
    float _2588 = _2584;
    if (_2528)
    {
        float _2590 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2570 = _2590;
    }
    float _2592 = _2570;
    float _2594 = _2592;
    if (!_2528)
    {
        _2556 = _2520;
    }
    float _2596 = _2556;
    float _2598 = _2562;
    float _2600 = _2596;
    if (_2528)
    {
        float _2602 = fma(_2562, _2592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2594 = _2602;
    }
    float _2604 = _2594;
    float _2606 = _2604;
    if (!_2528)
    {
        _2598 = _2518;
    }
    float _2608 = _2598;
    float _2610 = _2608;
    float _2612 = _2576;
    if (_2528)
    {
        float _2614 = _2576 + (-1.0);
        _2538 = _2614;
    }
    float _2616 = _2538;
    if (_2528)
    {
        float _2618 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2618;
    }
    float _2620 = _2540;
    float _2622 = sqrt(_2510);
    float _2624 = _2588;
    if (_2528)
    {
        float _2626 = _2588 * _2604;
        _1933 = _2626;
    }
    float _2628 = _1933;
    if (!_2528)
    {
        _2606 = _2516;
    }
    float _2630 = _2606;
    float _2632 = _2630;
    if (!_2528)
    {
        _2624 = _2582;
    }
    float _2634 = _2624;
    float _2636 = _2634;
    if (_2528)
    {
        float _2638 = _2516 * _2628;
        _2632 = _2638;
    }
    float _2640 = _2632;
    if (_2528)
    {
        float _2642 = fma(_2582, _2576, _2620);
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (_2528)
    {
        float _2646 = _2518 * _2628;
        _2610 = _2646;
    }
    float _2648 = _2610;
    if (!_2528)
    {
        _2612 = _2522;
    }
    float _2650 = _2612;
    float _2652 = _2650;
    if (_2528)
    {
        float _2654 = _2640 * _2640;
        _2600 = _2654;
    }
    float _2656 = _2600;
    if (_2528)
    {
        float _2658 = _2648 * _2648;
        _2652 = _2658;
    }
    float _2660 = _2652;
    float _2662 = fma(_2644, _2644, _2656);
    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2666 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2664);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = _2662 + _2660;
    float _2672 = -_2668;
    float _2674 = _2672 + 1.0;
    float _2676 = rsqrt(_2670);
    float _2678 = _2676 * _2644;
    float _2680 = _2676 * _2640;
    float _2682 = abs(_2674);
    float _2684 = log2(_2682);
    float _2686 = _2676 * _2648;
    float _2688 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2690 = -_2688;
    float _2692 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2690);
    float _2694 = -_2686;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2692);
    float _2698 = fma(_2696, -0.5, 0.5);
    float _2700 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2702 = fma(_2696, 0.5, 0.5);
    float _2704 = exp2(_2700);
    float _2706 = fma(_2702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2708 = fma(_2702, _2706, -0.212114393711090087890625);
    float _2710 = _2678 + 1.0;
    float _2712 = sqrt(_2698);
    float _2714 = fma(_2702, _2708, 1.570728778839111328125);
    float _2716 = -_2678;
    float _2718 = fma(_2704, _2710, _2716);
    float _2720 = _2712 * 0.636619746685028076171875;
    float _2722 = fma(_2718, 0.5, 0.5);
    float _2724 = -_2714;
    float _2726 = fma(_2720, _2724, 1.0);
    float2 _7408 = float2(_2726, _2722);
    float3 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7408, float2(0.0), isnan(_7408)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7408, float2(0.0), isnan(_7408)), level(0.0)).xyz;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = abs(_1744);
    float _2740 = log2(_2738);
    float _2742 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2744 = -_1680;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2742);
    float _2750 = _2319 * 0.5;
    out.m_99.x = _2193;
    out.m_99.y = _2191;
    out.m_99.z = _2197;
    bool _2752 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2754 = isnan(_2622);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2760 = _2756 || _2758;
    float _2762 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2748);
    float _2764 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2766 = _1744 <= 8000.0;
    bool _2768 = isnan(_1744);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(8000.0);
    bool _2774 = _2770 || _2772;
    float _2776 = float(_2774);
    float _2778 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2762);
    float _2780 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2782 = exp2(_2764);
    out.gl_Position.x = _2345;
    out.gl_Position.y = _2357;
    out.gl_Position.z = _2778;
    out.gl_Position.w = _2319;
    float _2784 = exp2(_2780);
    float _2786 = -_2782;
    float _2788 = _2786 + 1.0;
    float _2790 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2792 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = _2345 + _2319;
    float _2798 = _2790 * _2405;
    float _2800 = -_2790;
    float _2802 = _2800 + 1.0;
    float _2804 = fma(_2794, -2.0, 3.0);
    float _2806 = _2794 * _2794;
    float _2808 = _2796 * 0.5;
    float _2810 = _2806 * _2804;
    float _2812 = -_2810;
    float _2814 = _2812 + 1.0;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2810);
    float _2818 = _2778 + _2319;
    float _2820 = fma(_2357, -0.5, _2750);
    float _2822 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2824 = _2776 * _2816;
    float _2826 = _2776;
    float _2828 = _2802;
    if (!_2299)
    {
        _2826 = 1.0;
    }
    float _2830 = _2826;
    float _2832 = _2818 * 0.5;
    float _2834 = _2830;
    if (_2299)
    {
        bool _2836 = _2403 >= _2375;
        bool _2838 = isnan(_2403);
        bool _2840 = _2836 || _2838;
        bool _2842 = isnan(_2375);
        bool _2844 = _2840 || _2842;
        float _2846 = float(_2844);
        _2834 = _2846;
    }
    float _2848 = _2834;
    float _2850 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2760)
    {
        _1772 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2852 = _1772;
    out.m_101.x = _2808;
    out.m_101.y = _2820;
    out.m_101.z = _2832;
    out.m_101.w = _2319;
    float _2854 = _2746 * _2850;
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = _2848 * _2492;
    float _2860 = -_2856;
    float _2862 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2864 = _2856;
    float _2866 = _2852;
    float _2868 = _2852;
    if (!_2760)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2870 = _2864;
    float _2872 = -_2858;
    float _2874 = fma(_2872, _2862, 1.0);
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = _2876 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2880 = _2416 * _2798;
    float _2882 = _2416 * _2802;
    float _2884 = _2876;
    float _2886 = _2870;
    float _2888 = _2870;
    if (!_2760)
    {
        _2828 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2890 = _2828;
    out.m_103.x = _2878;
    float _2892 = _2890;
    float _2894 = _2890;
    if (!_2760)
    {
        _2884 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2896 = _2884;
    float _2898 = _2736 * _2798;
    float _2900 = fma(_2732, _2880, _2410);
    float _2902 = fma(_2734, _2880, _2412);
    float _2904 = _2896;
    float _2906 = _2896;
    if (!_2760)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2908 = _2428;
    float _2910 = fma(_2416, _2898, _2414);
    float _2912 = _2908;
    float _2914 = _2908;
    if (!_2760)
    {
        _2430 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2916 = _2430;
    out.m_105.x = _2900;
    out.m_105.y = _2902;
    out.m_105.z = _2910;
    out.m_105.w = _2882;
    bool _2918 = !_2760;
    float _2920 = _2916;
    float _2922 = _2916;
    if (!_2918)
    {
        bool _2924 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2926 = isnan(_2622);
        bool _2928 = _2924 || _2926;
        bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2932 = _2928 || _2930;
        if (!_2932)
        {
            float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2936 = _2622 + _2934;
            float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2938;
            float _2942 = 1.0 / _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2964 = _2936 * _2942;
            float _2966 = precise::clamp(_2964, 0.0, 1.0);
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2972 = fma(_2966, _2946, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2974 = fma(_2966, _2970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2976 = fma(_2966, _2950, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2978 = fma(_2966, _2954, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2980 = fma(_2966, _2958, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2982 = fma(_2966, _2962, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2894 = _2974;
            _2868 = _2980;
            _2888 = _2972;
            _2922 = _2978;
            _2914 = _2976;
            _2906 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2988 = isnan(_2622);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                _2886 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2996 = _2886;
            _2888 = _2996;
            if (!_2994)
            {
                _2892 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2998 = _2892;
            _2894 = _2998;
            if (!_2994)
            {
                _2912 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3000 = _2912;
            _2914 = _3000;
            if (!_2994)
            {
                _2920 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3002 = _2920;
            _2922 = _3002;
            if (!_2994)
            {
                _2866 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3004 = _2866;
            _2868 = _3004;
            if (!_2994)
            {
                _2904 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3006 = _2904;
            bool _3008 = !_2994;
            _2906 = _3006;
            if (!_3008)
            {
                bool _3010 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3012 = isnan(_2622);
                bool _3014 = _3010 || _3012;
                bool _3016 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3018 = _3014 || _3016;
                if (!_3018)
                {
                    float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3022 = _2622 + _3020;
                    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3024;
                    float _3028 = 1.0 / _3026;
                    float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3050 = _3022 * _3028;
                    float _3052 = precise::clamp(_3050, 0.0, 1.0);
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3058 = fma(_3052, _3032, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3060 = fma(_3052, _3056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3062 = fma(_3052, _3036, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3064 = fma(_3052, _3040, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3066 = fma(_3052, _3044, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3068 = fma(_3052, _3048, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2894 = _3060;
                    _2868 = _3066;
                    _2888 = _3058;
                    _2922 = _3064;
                    _2914 = _3062;
                    _2906 = _3068;
                    _2984 = true;
                }
                else
                {
                    _2894 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2868 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2888 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2922 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2914 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2906 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2984 = false;
    float _3070 = _2894;
    float _3072 = _2868;
    float _3074 = _2888;
    float _3076 = _2922;
    float _3078 = _2914;
    float _3080 = _2906;
    float _3082 = fma(_1436, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3070;
    float _3088 = _3086 + _3072;
    float _3090 = -_3074;
    float _3092 = _3090 + _3076;
    float _3094 = -_3078;
    float _3096 = _3094 + _3080;
    bool _3098 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3100 = fma(_3084, _3088, _3070);
    float _3102 = fma(_3084, _3092, _3074);
    float _3104 = fma(_3084, _3096, _3078);
    float _3106 = _2822 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3108 = _3100 * 0.586610972881317138671875;
    out.m_107.x = 0.0;
    float _3110 = fma(_3102, 0.298911988735198974609375, _3108);
    out.m_61.x = _3106;
    float _3112 = fma(_3104, 0.114477999508380889892578125, _3110);
    float _3114 = -_3112;
    float _3116 = _3102 + _3114;
    float _3118 = -_3112;
    float _3120 = _3100 + _3118;
    float _3122 = -_3112;
    float _3124 = _3104 + _3122;
    float _3126 = fma(_3116, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    float _3128 = fma(_3120, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    float _3130 = fma(_3124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    out.m_109.x = _3126;
    out.m_109.y = _3128;
    out.m_109.z = _3130;
    if (!_3098)
    {
        return out;
    }
    float _3132 = -_2191;
    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3136 = -_2193;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3140 = -_2197;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3144 = _3134 * _3134;
    float _3146 = fma(_3138, _3138, _3144);
    float _3148 = fma(_3142, _3142, _3146);
    float _3150 = sqrt(_3148);
    float _3152 = rsqrt(_3148);
    float _3154 = -_3150;
    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3158 = _3156 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3160 = precise::clamp(_3158, 0.0, 1.0);
    float _3162 = _3138 * _3152;
    float _3164 = _3134 * _3152;
    float _3166 = abs(_3160);
    float _3168 = log2(_3166);
    float _3170 = _3142 * _3152;
    float _3172 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3174 = _1436 * _3164;
    float _3176 = -_3164;
    float _3178 = -_3172;
    float _3180 = fma(_3176, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3178);
    float _3182 = fma(_1432, _3162, _3174);
    float _3184 = -_3170;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3180);
    float _3188 = fma(_1434, _3170, _3182);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3194 = _3186 + _3192;
    float _3196 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3198 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = exp2(_3196);
    float _3204 = _3202 * _3200;
    float _3206 = _3190 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _3208;
    out.m_107.y = _3210;
    out.m_107.z = _3212;
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
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _1528 = false;
    bool _1516 = false;
    bool _364 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_58.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_61.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3269 = as_type<float>(_144);
        out.gl_Position.z = _3269;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_63.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = 0.0;
    float _166 = _162;
    if (_158)
    {
        float _168 = float(_128);
        _164 = _168;
    }
    float _170 = _164;
    bool _172 = _162 >= _170;
    bool _174 = !_158;
    bool _176 = _172 || _174;
    if (_176)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _138;
    if (_176)
    {
        out.m_61.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3338 = as_type<float>(_182);
        out.gl_Position.z = _3338;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_65.x;
    float _186 = in.m_65.y;
    float _188 = in.m_65.z;
    float _190 = in.m_67.x;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = in.m_69.x;
    float _198 = in.m_69.y;
    float _200 = in.m_69.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    int _232 = as_type<int>(_184);
    if (_226)
    {
        float _234 = rsqrt(_214);
        _230 = _234;
    }
    float _236 = _230;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_226)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _242 = _238;
    float _244 = _240;
    bool _246 = _224 > 0.0;
    float _248 = 0.0;
    float _250 = _242;
    float _252 = _244;
    if (!_226)
    {
        _248 = 0.0;
    }
    float _254 = _248;
    float _256 = 0.0;
    float _258 = _254;
    if (!_228)
    {
        _256 = 0.0;
    }
    float _260 = _256;
    float _262 = _224;
    float _264 = _260;
    if (_228)
    {
        float _266 = rsqrt(_216);
        _262 = _266;
    }
    float _268 = _262;
    float _270 = 0.0;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = _272;
    if (!_246)
    {
        _274 = 0.0;
        _276 = 0.0;
    }
    float _280 = _274;
    float _282 = _276;
    float _284 = 0.0;
    float _286 = _280;
    float _288 = _282;
    if (_246)
    {
        float _290 = rsqrt(_218);
        _284 = _290;
    }
    float _292 = _284;
    float _294 = _236;
    if (_226)
    {
        float _296 = _236 * _190;
        _250 = _296;
    }
    float _298 = _250;
    if (_226)
    {
        float _300 = _236 * _184;
        _252 = _300;
    }
    float _302 = _252;
    if (_226)
    {
        float _304 = _236 * _196;
        _258 = _304;
    }
    float _306 = _258;
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_228)
    {
        _294 = 0.0;
    }
    float _310 = _294;
    float _312 = 0.0;
    float _314 = _310;
    if (!_246)
    {
        _312 = 0.0;
    }
    float _316 = _312;
    float _318 = _316;
    if (_228)
    {
        float _320 = _268 * _192;
        _314 = _320;
    }
    float _322 = _314;
    if (_228)
    {
        float _324 = _268 * _186;
        _264 = _324;
    }
    float _326 = _264;
    if (_228)
    {
        float _328 = _268 * _198;
        _278 = _328;
    }
    float _330 = _278;
    if (_246)
    {
        float _332 = _292 * _194;
        _286 = _332;
    }
    float _334 = _286;
    if (_246)
    {
        float _336 = _292 * _188;
        _288 = _336;
    }
    float _338 = _288;
    if (_246)
    {
        float _340 = _292 * _200;
        _318 = _340;
    }
    float _342 = _318;
    bool _344 = !_308;
    float _362;
    if (!_344)
    {
        float _346 = in.m_71.x;
        float _348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _350 = _346 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _352 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _354 = _352 * _348;
        float _356 = floor(_354);
        float _358 = -_356;
        float _360 = _354 + _358;
        _362 = _360;
        _364 = true;
    }
    else
    {
        float _366 = float(_128);
        float _368 = 1.0 / _366;
        float _370 = _162 * _368;
        _362 = _370;
    }
    _364 = false;
    float _372 = _362;
    float _374 = in.m_58.x;
    float _376 = in.m_58.y;
    float _378 = in.m_58.z;
    float _380 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _382 = log2(_380);
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _386 = _384 != 0;
    float _388 = in.m_73.x;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _392 = _390 != 0;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _396 = 1.0 + _394;
    float _398 = in.m_71.x;
    float _400 = in.m_71.y;
    float _402 = in.m_71.z;
    float _404 = in.m_71.w;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _408 = _406 != 0;
    float _410 = in.m_73.y;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = 1.0 / _396;
    float _418 = 0.0;
    int _420 = 1065353216;
    float _422 = 1.0;
    float _424 = _410;
    if (_386)
    {
        float _426 = in.m_71.x;
        _418 = _426;
    }
    float _428 = _418;
    float _430 = _382 * _162;
    float _432 = 0.0;
    if (_392)
    {
        float _434 = in.m_71.z;
        _432 = _434;
    }
    float _436 = _432;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _444 = _192 * _376;
    float _446 = _186 * _376;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _448 = _198 * _376;
    float _450 = fma(_190, _374, _444);
    float _452 = fma(_184, _374, _446);
    if (_392)
    {
        float _454 = -_388;
        float _456 = _454 + 1.0;
        _232 = as_type<int>(_456);
    }
    int _458 = _232;
    float _460 = fma(_194, _378, _450);
    bool _462 = _404 > 0.5;
    float _464 = fma(_196, _374, _448);
    float _466 = fma(_188, _378, _452);
    float _468 = _404;
    if (!_386)
    {
        _468 = _388;
    }
    float _470 = _468;
    float _472 = _470;
    if (_386)
    {
        float _474 = -_388;
        float _476 = _474 + 1.0;
        _420 = as_type<int>(_476);
    }
    int _478 = _420;
    if (!_392)
    {
        _422 = _388;
    }
    float _480 = _422;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _484 = false;
    float _486 = _480;
    if (_386)
    {
        bool _488 = _428 > 0.5;
        _484 = _488;
    }
    bool _490 = _484;
    float _492 = fma(_200, _378, _464);
    float _494 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[79].z, _482);
    bool _496 = false;
    float _498 = _492;
    if (_392)
    {
        bool _500 = _436 > 0.5;
        _496 = _500;
    }
    bool _502 = _496;
    float _504 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_386)
    {
        float _506 = _490 ? as_type<float>(_478) : _388;
        _472 = _506;
    }
    float _508 = _472;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_392)
    {
        float _512 = _502 ? as_type<float>(_458) : _388;
        _486 = _512;
    }
    float _514 = _486;
    float _516 = _398 + _402;
    float _518 = _400 + _398;
    float _520 = _398 * 2.0;
    float _522 = _400 + _402;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _538 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _442);
    bool _540 = _400 > 0.5;
    float _542 = _400 * 2.0;
    float _544 = 1.0 / _440;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _548 = _398 + (-0.5);
    float _550 = _402 + (-0.5);
    float _552 = _402 * 2.0;
    float _554 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].z, _546);
    float _556 = _400 + (-0.5);
    float _558 = -_510;
    float _560 = fma(_504, 2.0, _558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _572 = exp2(_430);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _582 = in.m_77.x;
    float _584 = in.m_77.y;
    float _586 = in.m_77.z;
    float _588 = _522 + (-1.0);
    float _590 = _578 * _544;
    float _592 = 1.0 / _568;
    float _594 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[79].x, _494);
    float _596 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _554);
    float _598 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _538);
    float _600 = _518 + (-1.0);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _604 = 1.0 / _564;
    float _606 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = -_572;
    float _614 = _612 + 1.0;
    float _616 = fma(_536, -2.0, _602);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = floor(_552);
    float _624 = -_410;
    float _626 = _624 + 1.0;
    out.m_79.x = _606;
    out.m_79.y = _608;
    out.m_79.z = _610;
    float _628 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _630 = _582 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _632 = _586 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _634 = _584 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = floor(_542);
    int _642 = _462 ? as_type<int>(_626) : as_type<int>(_410);
    float _644 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _646 = _620 * _592;
    float _648 = _638 * _604;
    float _650 = _408 ? as_type<float>(_642) : _410;
    float _652 = _516 + (-1.0);
    float _654 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_414)
    {
        float _656 = _540 ? _626 : _410;
        _424 = _656;
    }
    float _658 = _424;
    float _660 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _616);
    bool _662 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _664 = isnan(1.0);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _670 = _666 || _668;
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _674 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(0.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = in.m_81.x;
    float _686 = in.m_81.y;
    float _688 = in.m_81.z;
    bool _690 = _622 > 0.0;
    float _692 = floor(_520);
    float _694 = _682 ? _614 : 0.0;
    float _696 = in.m_65.w;
    bool _698 = _622 >= 0.0;
    bool _700 = isnan(_622);
    bool _702 = _698 || _700;
    bool _704 = isnan(0.0);
    bool _706 = _702 || _704;
    float _708 = -_162;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _560);
    float _712 = in.m_69.w;
    int _714 = _706 ? 0 : 1;
    if (_670)
    {
        float _716 = _694 * _416;
        _166 = _716;
    }
    float _718 = _166;
    float _720 = _630 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _722 = in.m_67.w;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _372 + _724;
    int _728 = ~_714;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _736 = _732;
    if (!_690)
    {
        int _738 = ~_714;
        int _740 = _738 + 1;
        _736 = _740;
    }
    int _742 = _736;
    float _744 = fma(_590, _726, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _746 = _640 > 0.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _750 = _372 + _748;
    bool _752 = _640 >= 0.0;
    bool _754 = isnan(_640);
    bool _756 = _752 || _754;
    bool _758 = isnan(0.0);
    bool _760 = _756 || _758;
    float _762 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _372 + _764;
    bool _768 = _692 > 0.0;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _686);
    bool _772 = _692 >= 0.0;
    bool _774 = isnan(_692);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _688);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _684);
    float _786 = _770 * _644;
    float _788 = fma(_646, _750, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _790 = fma(_648, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _792 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _794 = isnan(_372);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = in.m_83.x;
    float _806 = in.m_83.y;
    float _808 = in.m_83.z;
    float _810 = _782 * _762;
    float _812 = _784 * _720;
    float _814 = _780 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _816 = -_802;
    float _818 = _816 + 1.0;
    bool _820 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _822 = isnan(_372);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _460 + _722;
    bool _834 = _686 != 0.0;
    bool _836 = isnan(_686);
    bool _838 = _834 || _836;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    float _844 = _594 * (-0.15915493667125701904296875);
    bool _846 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_372);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_830;
    float _860 = _858 + 1.0;
    bool _862 = _684 == 0.0;
    bool _864 = !_842;
    bool _866 = _862 && _864;
    float _868 = _830 * _818;
    bool _870 = _372 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _872 = isnan(_372);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _856 * _860;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _886 = _688 == 0.0;
    bool _888 = _886 && _866;
    float _890 = -_856;
    float _892 = _890 + 1.0;
    float _894 = _734 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _896 = ~as_type<int>(_814);
    int _898 = _896 + 1;
    int _900 = _898 + 1;
    float _902 = _466 + _696;
    float _904 = _880 * _892;
    float _906 = -_880;
    float _908 = _906 + 1.0;
    float _910 = _844 * 6.283185482025146484375;
    float _912 = sin(_910);
    int _914 = _900;
    float _916 = _814;
    float _918 = _908;
    if (!_768)
    {
        int _920 = ~as_type<int>(_814);
        int _922 = _920 + 1;
        _914 = _922;
    }
    int _924 = _914;
    float _926 = _744 * _904;
    float _928 = _760 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _930 = _902 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _932 = _492 + _712;
    float _934 = _926;
    float _936 = _928;
    if (_888)
    {
        _916 = _808;
    }
    float _938 = _916;
    float _940 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[115].x, _926);
    float _942 = _844 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _938;
    if (_888)
    {
        _918 = _804;
    }
    float _948 = _918;
    float _950 = _884 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _952 = ~as_type<int>(_928);
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = fma(_894, _658, -0.5);
    float _960 = _884;
    int _962 = _956;
    float _964 = _948;
    if (_888)
    {
        _960 = _938;
    }
    float _966 = _960;
    float _968 = _832 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _970 = _966;
    if (!_746)
    {
        int _972 = ~as_type<int>(_928);
        int _974 = _972 + 1;
        _962 = _974;
    }
    int _976 = _962;
    float _978 = _932 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    if (_888)
    {
        _934 = _806;
    }
    float _980 = _934;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = _980;
    if (!_888)
    {
        _946 = _808;
    }
    float _986 = _946;
    float _988 = _650 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_888)
    {
        _936 = _948;
    }
    float _990 = _936;
    float _992 = _514 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _994 = _990;
    if (!_888)
    {
        _964 = _804;
    }
    float _996 = _964;
    float _998 = fma(_788, _882, _940);
    if (_888)
    {
        _498 = _980;
    }
    float _1000 = _498;
    float _1002 = _1000;
    if (!_888)
    {
        float _1004 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[17].y, _986);
        _970 = _1004;
    }
    float _1006 = _970;
    if (!_888)
    {
        _984 = _806;
    }
    float _1008 = _984;
    float _1010 = fma(_950, _508, -0.5);
    float _1012 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1014 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    if (!_888)
    {
        float _1016 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[17].y, _996);
        _994 = _1016;
    }
    float _1018 = _994;
    float _1020 = _930 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    bool _1022 = !_526;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _912 * _958;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    if (!_888)
    {
        float _1030 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1008);
        _1002 = _1030;
    }
    float _1032 = _1002;
    float _1034 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1020);
    float _1036 = _944 * _958;
    float _1038 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1012);
    int _1040 = abs(_1024);
    float _1042 = fma(_790, _868, _998);
    float _1044 = -_1026;
    float _1046 = fma(_944, _1010, _1044);
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1050 = in.m_85.x;
    float _1052 = in.m_85.y;
    float _1054 = in.m_85.z;
    float _1056 = fma(_968, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1014);
    float _1058 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1038);
    float _1060 = float(_1040);
    float _1062 = fma(_912, _1010, _1036);
    float _1064 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1056);
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1068 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1070 = float(_742);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    bool _1074 = !_530;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = _1066 * _1028;
    float _1080 = fma(_978, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1034);
    float _1082 = _1060 * _1070;
    int _1084 = abs(_1076);
    float _1086 = _1072 * _1048;
    float _1088 = fma(_1078, 0.5, 0.5);
    float _1090 = float(_924);
    float _1092 = in.m_87.x;
    float _1094 = in.m_87.y;
    float _1096 = in.m_87.z;
    float _1098 = in.m_87.w;
    float _1100 = float(_1084);
    float _1102 = _1080 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1104 = _1082 * (-2.0);
    float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1108 = -_660;
    float _1110 = fma(_598, _1062, _1108);
    float _1112 = _1100 * _1090;
    float _1114 = _1102 * _1068;
    float _1116 = fma(_1104, _1050, _1050);
    bool _1118 = !_534;
    int _1120 = _1118 ? 0 : 1;
    float _1122 = _1112 * (-2.0);
    float _1124 = fma(_1086, 0.5, 0.5);
    float _1126 = fma(_628, _1104, _628);
    int _1128 = abs(_1120);
    float _1130 = fma(_654, _1122, _654);
    float _1132 = fma(_1122, _1052, _1052);
    float _1134 = float(_976);
    float _1136 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1116);
    float _1138 = float(_1128);
    float _1140 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1132);
    float _1142 = fma(_596, _1046, _710);
    float _1144 = fma(_1126, _718, _1136);
    float _1146 = floor(_1124);
    float _1148 = _1138 * _1134;
    float _1150 = fma(_1130, _718, _1140);
    float _1152 = _1094 * _986;
    float _1154 = _1092 * _1008;
    float _1156 = _1148 * (-2.0);
    float _1158 = _1096 * _996;
    float _1160 = -_1152;
    float _1162 = fma(_1096, _1008, _1160);
    float _1164 = -_1154;
    float _1166 = fma(_1094, _996, _1164);
    float _1168 = fma(_1156, _1054, _1054);
    float _1170 = fma(_672, _1156, _672);
    float _1172 = _1144 * 0.15915493667125701904296875;
    float _1174 = _1150 * 0.15915493667125701904296875;
    float _1176 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1168);
    float _1178 = -_1158;
    float _1180 = fma(_1092, _986, _1178);
    float _1182 = _1172 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = fma(_1170, _718, _1176);
    float _1188 = _988 * _1106;
    float _1190 = _992 * _982;
    float _1192 = _1186 * 0.15915493667125701904296875;
    float _1194 = _1174 * 6.283185482025146484375;
    float _1196 = sin(_1194);
    float _1198 = _1180 * _1098;
    float _1200 = _1142 + 0.5;
    float _1202 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1042);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1212 = _1174 * 6.283185482025146484375;
    float _1214 = cos(_1212);
    float _1216 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = -_1146;
    float _1224 = _1124 + _1222;
    float _1226 = _1162 * _1098;
    float _1228 = _1166 * _1098;
    float _1230 = fma(_1114, 0.5, 0.5);
    float _1232 = _1172 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _1184 * _1196;
    out.m_89.x = _1216;
    out.m_89.y = _1218;
    out.m_89.z = _1220;
    out.m_89.w = _1210;
    bool _1238 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _1240 = isnan(1.0);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1246 = _1242 || _1244;
    float _1248 = _1192 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1110 + 0.5;
    float _1254 = _1184 * _1214;
    out.m_91.x = _1200;
    out.m_91.y = _1252;
    out.m_91.z = _1190;
    out.m_91.w = _1188;
    float _1256 = _1192 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = _1234 * _1214;
    float _1262 = floor(_1088);
    float _1264 = _1184 * _1250;
    float _1266 = _1234 * _1196;
    float _1268 = _1234 * _1250;
    float _1270 = _1214 * _1250;
    float _1272 = _1196 * _1250;
    float _1274 = _1264 * _1032;
    float _1276 = _1268 * _1094;
    float _1278 = fma(_1258, _1254, _1266);
    float _1280 = fma(_1258, _1266, _1254);
    float _1282 = -_1236;
    float _1284 = fma(_1258, _1260, _1282);
    float _1286 = -_1260;
    float _1288 = fma(_1258, _1236, _1286);
    float _1290 = -_1094;
    float _1292 = _1258 * _1290;
    float _1294 = _1264 * _1094;
    float _1296 = -_1032;
    float _1298 = _1258 * _1296;
    float _1300 = -_786;
    float _1302 = _1258 * _1300;
    float _1304 = -_1198;
    float _1306 = _1258 * _1304;
    float _1308 = _1264 * _786;
    float _1310 = _1268 * _1032;
    float _1312 = _1268 * _786;
    float _1314 = _1268 * _1198;
    float _1316 = fma(_1278, _1018, _1274);
    float _1318 = -_1262;
    float _1320 = _1088 + _1318;
    float _1322 = fma(_1224, 2.0, -1.0);
    float _1324 = fma(_1270, _1018, _1298);
    float _1326 = fma(_1284, _1018, _1310);
    float _1328 = fma(_1270, _1092, _1292);
    float _1330 = _1264 * _1198;
    float _1332 = fma(_1278, _1092, _1294);
    float _1334 = fma(_1284, _1092, _1276);
    float _1336 = fma(_1320, 2.0, -1.0);
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1340 = fma(_1278, _812, _1308);
    float _1342 = fma(_1270, _812, _1302);
    float _1344 = fma(_1270, _1226, _1306);
    float _1346 = fma(_1284, _812, _1312);
    float _1348 = fma(_1278, _1226, _1330);
    float _1350 = fma(_1284, _1226, _1314);
    float _1352 = _1336 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1354 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1356 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1358 = _1338 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1360 = fma(_1272, _1006, _1324);
    float _1362 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1354);
    float _1364 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1356);
    float _1366 = fma(_1288, _1096, _1332);
    float _1368 = fma(_1288, _1006, _1316);
    float _1370 = fma(_1280, _1006, _1326);
    float _1372 = fma(_1288, _810, _1340);
    float _1374 = fma(_1272, _810, _1342);
    float _1376 = fma(_1272, _1096, _1328);
    float _1378 = _1366 * _322;
    float _1380 = fma(_1280, _810, _1346);
    float _1382 = fma(_1288, _1228, _1348);
    float _1384 = floor(_1230);
    float _1386 = fma(_1280, _1096, _1334);
    float _1388 = _1366 * _326;
    float _1390 = fma(_1280, _1228, _1350);
    float _1392 = fma(_1376, _298, _1378);
    float _1394 = fma(_1272, _1228, _1344);
    float _1396 = _1366 * _330;
    float _1398 = _1368 * _322;
    float _1400 = _1368 * _326;
    float _1402 = _1368 * _330;
    float _1404 = _1382 * _322;
    float _1406 = _1382 * _326;
    float _1408 = _1382 * _330;
    float _1410 = fma(_1376, _302, _1388);
    float _1412 = fma(_1376, _306, _1396);
    float _1414 = fma(_1360, _298, _1398);
    float _1416 = fma(_1360, _306, _1402);
    float _1418 = fma(_1360, _302, _1400);
    float _1420 = fma(_1394, _298, _1404);
    float _1422 = fma(_1394, _302, _1406);
    float _1424 = fma(_1394, _306, _1408);
    float _1426 = fma(_1386, _334, _1392);
    float _1428 = fma(_1386, _338, _1410);
    float _1430 = fma(_1386, _342, _1412);
    float _1432 = fma(_1370, _334, _1414);
    float _1434 = fma(_1370, _342, _1416);
    float _1436 = fma(_1370, _338, _1418);
    float _1438 = fma(_1390, _334, _1420);
    float _1440 = fma(_1390, _338, _1422);
    float _1442 = fma(_1390, _342, _1424);
    float _1444 = -_1384;
    float _1446 = _1230 + _1444;
    out.m_93.x = _1426;
    out.m_93.y = _1428;
    out.m_93.z = _1430;
    float _1448 = _1372 * _322;
    float _1450 = _1372 * _326;
    float _1452 = fma(_1446, 2.0, -1.0);
    out.m_95.x = _1438;
    out.m_95.y = _1440;
    out.m_95.z = _1442;
    float _1454 = _1372 * _330;
    float _1456 = fma(_1352, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1358);
    float _1458 = _1452 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    out.m_97.x = _1432;
    out.m_97.y = _1436;
    out.m_97.z = _1434;
    float _1460 = fma(_1374, _306, _1454);
    float _1462 = fma(_1374, _298, _1448);
    float _1464 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1362);
    float _1466 = fma(_1374, _302, _1450);
    float _1468 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1364);
    float _1470 = fma(_1458, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1456);
    float _1472 = fma(_1380, _342, _1460);
    float _1474 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1476 = fma(_1380, _334, _1462);
    float _1478 = fma(_1380, _338, _1466);
    float _1480 = _1468 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1482 = _1470 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1484 = _1476 + _1474;
    float _1486 = _1478 + _1480;
    float _1488 = _1472 + _1482;
    float _1490 = _1420;
    float _1492 = _1370;
    float _1494 = _1430;
    float _1496 = _1430;
    float _1498 = _1470;
    float _1500 = _1336;
    float _1502 = _1322;
    float _1504 = _1426;
    float _1506 = _1452;
    float _1508 = _1462;
    float _1510 = _1482;
    float _1520;
    float _1522;
    float _1524;
    float _1526;
    if (!_1246)
    {
        bool _1512 = _1480 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1514 = !_1512;
        _1516 = _1514;
        if (!_1516)
        {
            float _1518 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _1520 = _1518;
            _1522 = 0.0;
            _1524 = 0.0;
            _1526 = 0.0;
            _1528 = true;
        }
    }
    if ((!_1528) || _1516)
    {
        bool _1566;
        if (!_1516)
        {
            bool _1530 = _1480 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1532 = isnan(_1480);
            bool _1534 = _1530 || _1532;
            bool _1536 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1538 = _1534 || _1536;
            bool _1540 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1542 = !_1538;
            bool _1544 = _1540 && _1542;
            bool _1546 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _1548 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_1544)
            {
                _1490 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1550 = _1490;
            float _1552 = _1550;
            if (_1544)
            {
                _1492 = 0.0;
            }
            float _1554 = _1492;
            _1522 = _1554;
            if (_1544)
            {
                _1494 = 0.0;
            }
            float _1556 = _1494;
            _1496 = _1556;
            _1524 = _1556;
            if (_1544)
            {
                float _1558 = _1550 * 5.0;
                _1552 = _1558;
            }
            float _1560 = _1552;
            _1520 = _1560;
            if (_1544)
            {
                _1548 = 0.0;
            }
            float _1562 = _1548;
            bool _1564 = !_1538;
            _1566 = _1564 && _1546;
            _1498 = _1562;
            _1526 = _1562;
        }
        if ((!_1566) || _1516)
        {
            _1516 = false;
            float _1568 = _1496;
            float _1570 = _1498;
            bool _1572 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1574 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1576 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1578 = _1568;
            float _1580 = _1570;
            _1520 = _1488;
            _1522 = _1484;
            if (_1572)
            {
                float _1582 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1578 = _1582;
            }
            float _1584 = _1578;
            if (_1572)
            {
                float _1586 = abs(_1336);
                float _1588 = -_1586;
                float _1590 = _1588 + 1.0;
                _1500 = _1590;
            }
            float _1592 = _1500;
            if (_1574)
            {
                float _1594 = abs(_1322);
                float _1596 = -_1594;
                float _1598 = _1596 + 1.0;
                _1502 = _1598;
            }
            float _1600 = _1502;
            if (!_1572)
            {
                _1504 = 1.0;
            }
            float _1602 = _1504;
            float _1604 = _1602;
            if (_1576)
            {
                float _1606 = abs(_1452);
                float _1608 = -_1606;
                float _1610 = _1608 + 1.0;
                _1506 = _1610;
            }
            float _1612 = _1506;
            if (!_1574)
            {
                _1508 = 1.0;
            }
            float _1614 = _1508;
            float _1616 = _1614;
            if (!_1576)
            {
                _1580 = 1.0;
            }
            float _1618 = _1580;
            float _1620 = _1428;
            float _1622 = _1618;
            if (_1574)
            {
                float _1624 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1620 = _1624;
            }
            float _1626 = _1620;
            float _1628 = _1438;
            if (_1576)
            {
                float _1630 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1628 = _1630;
            }
            float _1632 = _1628;
            if (_1572)
            {
                float _1634 = _1592 * _1584;
                float _1636 = precise::clamp(_1634, 0.0, 1.0);
                _1604 = _1636;
            }
            float _1638 = _1604;
            _1524 = _1486;
            if (_1574)
            {
                float _1640 = _1600 * _1626;
                float _1642 = precise::clamp(_1640, 0.0, 1.0);
                _1616 = _1642;
            }
            float _1644 = _1616;
            float _1646 = _1638 * _1644;
            if (_1576)
            {
                float _1648 = _1612 * _1632;
                float _1650 = precise::clamp(_1648, 0.0, 1.0);
                _1622 = _1650;
            }
            float _1652 = _1622;
            float _1654 = _1646 * _1652;
            _1526 = _1654;
        }
    }
    _1528 = false;
    float _1656 = _1520;
    float _1658 = _1522;
    float _1660 = _1524;
    float _1662 = _1526;
    float _1664 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1666 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1668 = floor(_1664);
    float _1670 = floor(_1666);
    float _1672 = -_1668;
    float _1674 = _1664 + _1672;
    float _1676 = -_1670;
    float _1678 = _1666 + _1676;
    float2 _5685 = float2(_1674, _1678);
    float _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5685, float2(0.0), isnan(_5685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5685, float2(0.0), isnan(_5685)), level(0.0)).x;
    float _1682 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1684 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1686 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1682);
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1690 = _1656 + _1688;
    float _1692 = _1480 + _1684;
    float _1694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1696 = _1658 + _1694;
    float _1698 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1686);
    float _1700 = _1480 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1704 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1706 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1700);
    float _1708 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1702);
    bool _1710 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1712 = isnan(0.5);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1718 = _1714 || _1716;
    float _1720 = 1.0 / _1704;
    float _1722 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1706);
    float _1724 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1708);
    float _1726 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1728 = _1724 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1730 = _1726 + _1704;
    float _1732 = _1730 * _1720;
    float _1734 = _1732 * 0.5;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1738 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1736);
    float _1740 = 1.0 / _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1744 = _1740 * _1742;
    float _1746 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1748 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1750 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1746);
    bool _1752 = _1744 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1754 = !_1748;
    int _1756 = _1754 ? 0 : 1;
    float _1758 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1750);
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1762 = 2;
    float _1764 = _1658;
    float _1766 = _1656;
    float _1768 = _1660;
    float _1770 = _1760;
    float _1772 = _1662;
    if (!_1748)
    {
        _1762 = 1;
    }
    int _1774 = _1762;
    float _1776 = trunc(_1760);
    int _1778 = int(_1776);
    int _1780 = _1774;
    if (!_1752)
    {
        _1780 = _1756;
    }
    int _1782 = _1780;
    int _1784 = _1782 << 6;
    float _1786 = trunc(_1728);
    int _1788 = int(_1786);
    int _1790 = _1784 + 96;
    uint _1793 = uint(int(uint(_1790) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    int _1809 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1811 = _1778 + _1809;
    int _1813 = _1811 + 1;
    int _1815 = _1784 + 104;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1690 * _1690;
    float _1835 = fma(_1696, _1696, _1833);
    int _1837 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1839 = _1788 + _1837;
    int _1841 = _1839 + 1;
    int _1843 = _1784 + 48;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
    int _1849 = int(_1845) & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    int _1853 = int(_1845) + 1;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    int _1857 = _1853 & 3;
    float _1859 = (*spvDescriptorSet0.vp_c15)._m0[int(_1855)][_1857];
    float _1861 = sqrt(_1835);
    bool _1863 = _1841 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1865 = _1841 | _1813;
    int _1867 = _1784 + 64;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    bool _1885 = _1865 < 0;
    bool _1887 = _1885 || _1863;
    bool _1889 = _1813 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1891 = _1889 || _1887;
    int _1893 = _1784 + 56;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    bool _1911 = _1861 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1913 = _1784 + 72;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    uint _1917 = uint(int(uint(int(_1915)) >> uint(2)));
    int _1919 = int(_1915) & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    int _1923 = int(_1915) + 1;
    uint _1925 = uint(int(uint(_1923) >> uint(2)));
    int _1927 = _1923 & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    float _1931 = as_type<float>(_1865);
    float _1933 = as_type<float>(_1813);
    if (!_1891)
    {
        float _1935 = floor(_1728);
        _1931 = _1935;
    }
    float _1937 = _1931;
    int _1939 = _1784 + 80;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c15)._m0[int(_1951)][_1953];
    float _1957 = _1692 * _1807;
    float _1959 = fma(_1474, _1799, _1957);
    float _1961 = fma(_1482, _1823, _1959);
    float _1963 = _1961 + _1831;
    int _1965 = as_type<int>(_1961);
    int _1967 = as_type<int>(_1807);
    if (!_1891)
    {
        int _1969 = _1813 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1971 = _1969 + _1841;
        _1965 = _1971;
    }
    int _1973 = _1965;
    float _1975 = _1692 * _1859;
    float _1977 = _1859;
    int _1979 = as_type<int>(_1875);
    float _1981 = _1851;
    if (!_1911)
    {
        _1977 = _1660;
    }
    float _1983 = _1977;
    float _1985 = 1.0 / _1963;
    float _1987 = fma(_1474, _1851, _1975);
    float _1989 = _1692 * _1883;
    float _1991 = fma(_1474, _1875, _1989);
    bool _1993 = !_1911;
    float _1995 = _1983;
    float _1997 = _1937;
    float _1999 = _1985;
    if (!_1993)
    {
        float _2001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2005 = _1861 + _2003;
        float _2007 = _1660 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2009 = rsqrt(_1835);
        float _2011 = _2005 * _2001;
        float _2013 = _2011 * 0.15915493667125701904296875;
        float _2015 = _2013 * 6.283185482025146484375;
        float _2017 = cos(_2015);
        float _2019 = _2013 * 6.283185482025146484375;
        float _2021 = sin(_2019);
        float _2023 = _2017 + (-1.0);
        float _2025 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2027 = fma(_2021, _2007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2029 = fma(_2017, _1660, _2025);
        float _2031 = _2009 * _2027;
        float _2033 = fma(_1696, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2035 = fma(_1690, _2031, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1764 = _2033;
        _1766 = _2035;
        _1995 = _2029;
        _1979 = as_type<int>(_2025);
        _1981 = _2021;
    }
    float _2037 = _1764;
    float _2039 = _1766;
    float _2041 = _1995;
    int _2043 = _1979;
    float _2045 = _1981;
    float _2047 = _2045;
    int _2049 = _2043;
    float _2051 = _2041;
    float _2053 = _2041;
    int _2055 = as_type<int>(_2037);
    if (!_1891)
    {
        int _2057 = _1973 << 2;
        _1967 = _2057;
    }
    int _2059 = _1967;
    float _2061 = fma(_1482, _1901, _1987);
    float _2063 = fma(_1482, _1921, _1991);
    int _2065 = _2059;
    if (_1718)
    {
        _2047 = _2037;
    }
    float _2067 = _2047;
    float _2069 = _2067;
    if (!_1891)
    {
        uint _2071 = uint(int(uint(_1973) >> uint(2)));
        _2049 = int(_2071);
    }
    int _2073 = _2049;
    if (!_1891)
    {
        int _2075 = 12 & _2059;
        _2065 = _2075;
    }
    int _2077 = _2065;
    if (_1718)
    {
        _1768 = _2039;
    }
    float _2079 = _1768;
    float _2081 = _2079;
    if (!_1718)
    {
        float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2085 = _1480 + _2083;
        float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2089 = _1474 + _2087;
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2093 = -_1474;
        float _2095 = _2093 + _2037;
        float _2097 = _2085 * _2085;
        float _2099 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2101 = _1482 + _2099;
        float _2103 = -_1480;
        float _2105 = _2103 + _2041;
        float _2107 = -_1482;
        float _2109 = _2107 + _2039;
        float _2111 = fma(_2089, _2089, _2097);
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2115 = fma(_2101, _2101, _2111);
        float _2117 = sqrt(_2115);
        float _2119 = _2113 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _2121 = _2117 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2123 = isnan(_2117);
        bool _2125 = _2121 || _2123;
        bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2129 = _2125 || _2127;
        float _2131 = precise::min(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2133 = _2131 * _2091;
        float _2135 = _2119 * _2133;
        float _2137 = _1696;
        float _2139 = _2131;
        float _2141 = _2135;
        float _2143 = _2119;
        _2055 = as_type<int>(_2095);
        if (_2129)
        {
            float _2145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2137 = _2145;
        }
        float _2147 = _2137;
        if (_2129)
        {
            float _2149 = precise::max(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2139 = _2149;
        }
        float _2151 = _2139;
        float _2153 = fma(_2105, _2135, _1480);
        float _2155 = fma(_2109, _2135, _1482);
        if (_2129)
        {
            float _2157 = _2151 * _2147;
            _2051 = _2157;
        }
        float _2159 = _2051;
        float _2161 = fma(_2095, _2135, _1474);
        float _2163 = _2159;
        float _2165 = _2161;
        if (_2129)
        {
            float _2167 = _2119 * _2159;
            _2141 = _2167;
        }
        float _2169 = _2141;
        if (!_2129)
        {
            _2163 = _2153;
        }
        float _2171 = _2163;
        float _2173 = _2171;
        if (!_2129)
        {
            _2143 = _2161;
        }
        float _2175 = _2143;
        float _2177 = _2175;
        if (_2129)
        {
            float _2179 = fma(_2105, _2169, _1480);
            _2173 = _2179;
        }
        float _2181 = _2173;
        _2053 = _2181;
        if (!_2129)
        {
            _2165 = _2155;
        }
        float _2183 = _2165;
        _2081 = _2183;
        if (_2129)
        {
            float _2185 = fma(_2095, _2169, _1474);
            _2177 = _2185;
        }
        float _2187 = _2177;
        _2069 = _2187;
        if (_2129)
        {
            float _2189 = fma(_2109, _2169, _1482);
            _2081 = _2189;
        }
    }
    float _2191 = _2053;
    float _2193 = _2069;
    int _2195 = _2055;
    float _2197 = _2081;
    int _2199 = _2195;
    if (!_1891)
    {
        int _2201 = _2073 << 4;
        int _2203 = _2201 + _2077;
        _2199 = _2203;
    }
    int _2205 = _2199;
    float _2207 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _2209 = _1784 + 88;
    uint _2211 = uint(int(uint(_2209) >> uint(2)));
    uint _2213 = uint(int(uint(int(_2211)) >> uint(2)));
    int _2215 = int(_2211) & 3;
    float _2217 = (*spvDescriptorSet0.vp_c15)._m0[int(_2213)][_2215];
    int _2219 = int(_2211) + 1;
    uint _2221 = uint(int(uint(_2219) >> uint(2)));
    int _2223 = _2219 & 3;
    float _2225 = (*spvDescriptorSet0.vp_c15)._m0[int(_2221)][_2223];
    float _2227 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2229 = _2061 + _1909;
    float _2231 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2207);
    float _2233 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2235 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2227);
    float _2237 = _2191 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2239 = _2229 * _1985;
    float _2241 = _2207;
    float _2243 = as_type<float>(_2205);
    if (!_1891)
    {
        int _2245 = _2205 + 400;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
        int _2251 = int(_2247) & 3;
        float _2253 = (*spvDescriptorSet0.vp_c15)._m0[int(_2249)][_2251];
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2233);
    float _2259 = _2063 + _1929;
    float _2261 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2237);
    bool _2263 = _2239 >= 0.0;
    float _2265 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2257);
    float _2267 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2235);
    float _2269 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2261);
    float _2271 = _2259 * _1985;
    float _2273 = _2265 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2275 = _2239 <= 1.0;
    bool _2277 = _2275 && _2263;
    float _2279 = _2269 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2281 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2285 = _2271 >= 0.0;
    bool _2287 = _2285 && _2277;
    float _2289 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2293 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2231);
    float _2295 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2283);
    bool _2297 = _2271 <= 1.0;
    bool _2299 = _2297 && _2287;
    float _2301 = -_2291;
    float _2303 = fma(_2301, _2289, 1.0);
    float _2305 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2307 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2295);
    float _2309 = _1929;
    if (!_1891)
    {
        float _2311 = floor(_1760);
        _2309 = _2311;
    }
    float _2313 = _2309;
    float _2315 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2317 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2307);
    float _2321 = _1692 * _1955;
    float _2323 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2315);
    float _2325 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2317);
    if (!_1891)
    {
        float _2327 = -_1937;
        float _2329 = _1728 + _2327;
        _1997 = _2329;
    }
    float _2331 = _1997;
    float _2333 = log2(_2303);
    if (_2299)
    {
        float _2335 = float(_1782);
        _2243 = _2335;
    }
    float _2337 = _2243;
    float _2339 = fma(_1474, _1947, _2321);
    float _2341 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2323);
    float _2343 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2325);
    float _2345 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2341);
    float _2347 = 1.0 / _2319;
    float _2349 = fma(_1482, _2217, _2339);
    if (!_1891)
    {
        float _2351 = -_2313;
        float _2353 = _1760 + _2351;
        _1770 = _2353;
    }
    float _2355 = _1770;
    float _2357 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2343);
    float _2359 = _2349 + _2225;
    float _2361 = _2337;
    if (_2299)
    {
        float _2363 = rint(_2337);
        float _2365 = precise::max(_2363, 0.0);
        uint _2367 = uint(_2365);
        uint _2369 = clamp(_2367, 0u, 65535u);
        _2361 = as_type<float>(_2369);
    }
    float _2371 = _2361;
    float _2373 = _2333 * 0.693147182464599609375;
    float _2375 = _2359 * _1985;
    float _2377 = _2373 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2379 = _2339;
    if (!_1891)
    {
        float _2381 = rint(_2255);
        float _2383 = precise::max(_2381, 0.0);
        uint _2385 = uint(_2383);
        uint _2387 = clamp(_2385, 0u, 65535u);
        _2379 = as_type<float>(_2387);
    }
    float _2389 = _2379;
    float _2391 = _2345 * _2347;
    float _2393 = _2357 * _2347;
    float _2395 = fma(_2391, 0.5, 0.5);
    float _2397 = fma(_2393, -0.5, 0.5);
    float _2399 = _2371;
    if (_2299)
    {
        float3 _6886 = float3(_2239, _2271, float(as_type<int>(_2371)));
        float3 _6890 = select(_6886, float3(0.0), isnan(_6886));
        float _2401 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6890.xy, uint(rint(_6890.z)), _2375, level(0.0));
        _2399 = _2401;
    }
    float _2403 = _2399;
    float3 _6900 = float3(_2395, _2397, _2377);
    float _2405 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6900, float3(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6900, float3(0.0), isnan(_6900)), level(0.0)).x;
    float3 _6909 = float3(_2395, _2397, _2377);
    float4 _2408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6909, float3(0.0), isnan(_6909)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6909, float3(0.0), isnan(_6909)), level(0.0)).xyzw;
    float _2410 = _2408.x;
    float _2412 = _2408.y;
    float _2414 = _2408.z;
    float _2416 = _2408.w;
    float _2418 = _2331;
    if (!_1891)
    {
        float3 _6932 = float3(_2331, _2355, float(as_type<int>(_2389)));
        float3 _6934 = select(_6932, float3(0.0), isnan(_6932));
        float _2420 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6934.xy, uint(rint(_6934.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6934.xy, uint(rint(_6934.z)), level(0.0)).x;
        _2418 = _2420;
    }
    float _2422 = _2418;
    if (_1891)
    {
        _1999 = 1.0;
    }
    float _2424 = _1999;
    float _2426 = _2424;
    float _2428 = _2412;
    float _2430 = _2410;
    if (!_1891)
    {
        int _2432 = _1973 << 4;
        int _2434 = _2432 + 2048;
        uint _2436 = uint(int(uint(_2434) >> uint(2)));
        uint _2438 = uint(int(uint(int(_2436)) >> uint(2)));
        int _2440 = int(_2436) & 3;
        float _2442 = (*spvDescriptorSet0.vp_c15)._m0[int(_2438)][_2440];
        int _2444 = int(_2436) + 1;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        int _2448 = _2444 & 3;
        float _2450 = (*spvDescriptorSet0.vp_c15)._m0[int(_2446)][_2448];
        int _2452 = _2434 + 8;
        uint _2454 = uint(int(uint(_2452) >> uint(2)));
        uint _2456 = uint(int(uint(int(_2454)) >> uint(2)));
        int _2458 = int(_2454) & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        int _2462 = int(_2454) + 1;
        uint _2464 = uint(int(uint(_2462) >> uint(2)));
        int _2466 = _2462 & 3;
        float _2468 = (*spvDescriptorSet0.vp_c15)._m0[int(_2464)][_2466];
        float _2470 = _1692 * _2450;
        float _2472 = fma(_1474, _2442, _2470);
        float _2474 = fma(_1482, _2460, _2472);
        float _2476 = _2474 + _2468;
        float _2478 = precise::clamp(_2476, 0.0, 1.0);
        float _2480 = -_2478;
        float _2482 = _2480 + _2422;
        float _2484 = fma(_2482, 500.0, 1.5);
        float _2486 = exp2(_2484);
        float _2488 = 0.0 + _2486;
        float _2490 = precise::clamp(_2488, 0.0, 1.0);
        _2426 = _2490;
    }
    float _2492 = _2426;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2496 = _2191 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2500 = _2193 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2504 = _2197 + _2502;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = rsqrt(_2510);
    float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2516 = _2500 * _2514;
    float _2518 = _2504 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 * _2518;
    float _2524 = _2520 + _2522;
    float _2526 = sqrt(_2524);
    bool _2528 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2526 + _2530;
    float _2534 = _2512;
    float _2536 = _2532;
    float _2538 = _2496;
    float _2540 = _2514;
    if (_2528)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2542;
    }
    float _2544 = _2534;
    if (_2528)
    {
        float _2546 = _2532 * _2544;
        _2536 = _2546;
    }
    float _2548 = _2536;
    if (_2528)
    {
        float _2550 = _2548 * 0.15915493667125701904296875;
        _1510 = _2550;
    }
    float _2552 = _1510;
    float _2554 = _2504;
    float _2556 = _2552;
    if (_2528)
    {
        float _2558 = _2552 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2554 = _2560;
    }
    float _2562 = _2554;
    float _2564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2566 = precise::max(0.0, _2564);
    float _2568 = _2355;
    float _2570 = _2566;
    if (_2528)
    {
        float _2572 = _2552 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2568 = _2574;
    }
    float _2576 = _2568;
    float _2578 = -_2514;
    float _2580 = -_2566;
    float _2582 = fma(_2496, _2578, _2580);
    float _2584 = _2564;
    if (_2528)
    {
        float _2586 = rsqrt(_2524);
        _2584 = _2586;
    }
    float _2588 = _2584;
    if (_2528)
    {
        float _2590 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2570 = _2590;
    }
    float _2592 = _2570;
    float _2594 = _2592;
    if (!_2528)
    {
        _2556 = _2520;
    }
    float _2596 = _2556;
    float _2598 = _2562;
    float _2600 = _2596;
    if (_2528)
    {
        float _2602 = fma(_2562, _2592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2594 = _2602;
    }
    float _2604 = _2594;
    float _2606 = _2604;
    if (!_2528)
    {
        _2598 = _2518;
    }
    float _2608 = _2598;
    float _2610 = _2608;
    float _2612 = _2576;
    if (_2528)
    {
        float _2614 = _2576 + (-1.0);
        _2538 = _2614;
    }
    float _2616 = _2538;
    if (_2528)
    {
        float _2618 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2618;
    }
    float _2620 = _2540;
    float _2622 = sqrt(_2510);
    float _2624 = _2588;
    if (_2528)
    {
        float _2626 = _2588 * _2604;
        _1933 = _2626;
    }
    float _2628 = _1933;
    if (!_2528)
    {
        _2606 = _2516;
    }
    float _2630 = _2606;
    float _2632 = _2630;
    if (!_2528)
    {
        _2624 = _2582;
    }
    float _2634 = _2624;
    float _2636 = _2634;
    if (_2528)
    {
        float _2638 = _2516 * _2628;
        _2632 = _2638;
    }
    float _2640 = _2632;
    if (_2528)
    {
        float _2642 = fma(_2582, _2576, _2620);
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (_2528)
    {
        float _2646 = _2518 * _2628;
        _2610 = _2646;
    }
    float _2648 = _2610;
    if (!_2528)
    {
        _2612 = _2522;
    }
    float _2650 = _2612;
    float _2652 = _2650;
    if (_2528)
    {
        float _2654 = _2640 * _2640;
        _2600 = _2654;
    }
    float _2656 = _2600;
    if (_2528)
    {
        float _2658 = _2648 * _2648;
        _2652 = _2658;
    }
    float _2660 = _2652;
    float _2662 = fma(_2644, _2644, _2656);
    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2666 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2664);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = _2662 + _2660;
    float _2672 = -_2668;
    float _2674 = _2672 + 1.0;
    float _2676 = rsqrt(_2670);
    float _2678 = _2676 * _2644;
    float _2680 = _2676 * _2640;
    float _2682 = abs(_2674);
    float _2684 = log2(_2682);
    float _2686 = _2676 * _2648;
    float _2688 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2690 = -_2688;
    float _2692 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2690);
    float _2694 = -_2686;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2692);
    float _2698 = fma(_2696, -0.5, 0.5);
    float _2700 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2702 = fma(_2696, 0.5, 0.5);
    float _2704 = exp2(_2700);
    float _2706 = fma(_2702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2708 = fma(_2702, _2706, -0.212114393711090087890625);
    float _2710 = _2678 + 1.0;
    float _2712 = sqrt(_2698);
    float _2714 = fma(_2702, _2708, 1.570728778839111328125);
    float _2716 = -_2678;
    float _2718 = fma(_2704, _2710, _2716);
    float _2720 = _2712 * 0.636619746685028076171875;
    float _2722 = fma(_2718, 0.5, 0.5);
    float _2724 = -_2714;
    float _2726 = fma(_2720, _2724, 1.0);
    float2 _7408 = float2(_2726, _2722);
    float3 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7408, float2(0.0), isnan(_7408)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7408, float2(0.0), isnan(_7408)), level(0.0)).xyz;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = abs(_1744);
    float _2740 = log2(_2738);
    float _2742 = _2273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2744 = -_1680;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2742);
    float _2750 = _2319 * 0.5;
    out.m_99.x = _2193;
    out.m_99.y = _2191;
    out.m_99.z = _2197;
    bool _2752 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2754 = isnan(_2622);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2760 = _2756 || _2758;
    float _2762 = fma(_2281, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2748);
    float _2764 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2766 = _1744 <= 8000.0;
    bool _2768 = isnan(_1744);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(8000.0);
    bool _2774 = _2770 || _2772;
    float _2776 = float(_2774);
    float _2778 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2762);
    float _2780 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2782 = exp2(_2764);
    out.gl_Position.x = _2345;
    out.gl_Position.y = _2357;
    out.gl_Position.z = _2778;
    out.gl_Position.w = _2319;
    float _2784 = exp2(_2780);
    float _2786 = -_2782;
    float _2788 = _2786 + 1.0;
    float _2790 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2792 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = _2345 + _2319;
    float _2798 = _2790 * _2405;
    float _2800 = -_2790;
    float _2802 = _2800 + 1.0;
    float _2804 = fma(_2794, -2.0, 3.0);
    float _2806 = _2794 * _2794;
    float _2808 = _2796 * 0.5;
    float _2810 = _2806 * _2804;
    float _2812 = -_2810;
    float _2814 = _2812 + 1.0;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2810);
    float _2818 = _2778 + _2319;
    float _2820 = fma(_2357, -0.5, _2750);
    float _2822 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2824 = _2776 * _2816;
    float _2826 = _2776;
    float _2828 = _2802;
    if (!_2299)
    {
        _2826 = 1.0;
    }
    float _2830 = _2826;
    float _2832 = _2818 * 0.5;
    float _2834 = _2830;
    if (_2299)
    {
        bool _2836 = _2403 >= _2375;
        bool _2838 = isnan(_2403);
        bool _2840 = _2836 || _2838;
        bool _2842 = isnan(_2375);
        bool _2844 = _2840 || _2842;
        float _2846 = float(_2844);
        _2834 = _2846;
    }
    float _2848 = _2834;
    float _2850 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2760)
    {
        _1772 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2852 = _1772;
    out.m_101.x = _2808;
    out.m_101.y = _2820;
    out.m_101.z = _2832;
    out.m_101.w = _2319;
    float _2854 = _2746 * _2850;
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = _2848 * _2492;
    float _2860 = -_2856;
    float _2862 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2864 = _2856;
    float _2866 = _2852;
    float _2868 = _2852;
    if (!_2760)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2870 = _2864;
    float _2872 = -_2858;
    float _2874 = fma(_2872, _2862, 1.0);
    float _2876 = precise::clamp(_2874, 0.0, 1.0);
    float _2878 = _2876 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2880 = _2416 * _2798;
    float _2882 = _2416 * _2802;
    float _2884 = _2876;
    float _2886 = _2870;
    float _2888 = _2870;
    if (!_2760)
    {
        _2828 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2890 = _2828;
    out.m_103.x = _2878;
    float _2892 = _2890;
    float _2894 = _2890;
    if (!_2760)
    {
        _2884 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2896 = _2884;
    float _2898 = _2736 * _2798;
    float _2900 = fma(_2732, _2880, _2410);
    float _2902 = fma(_2734, _2880, _2412);
    float _2904 = _2896;
    float _2906 = _2896;
    if (!_2760)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2908 = _2428;
    float _2910 = fma(_2416, _2898, _2414);
    float _2912 = _2908;
    float _2914 = _2908;
    if (!_2760)
    {
        _2430 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2916 = _2430;
    out.m_105.x = _2900;
    out.m_105.y = _2902;
    out.m_105.z = _2910;
    out.m_105.w = _2882;
    bool _2918 = !_2760;
    float _2920 = _2916;
    float _2922 = _2916;
    if (!_2918)
    {
        bool _2924 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2926 = isnan(_2622);
        bool _2928 = _2924 || _2926;
        bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2932 = _2928 || _2930;
        if (!_2932)
        {
            float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2936 = _2622 + _2934;
            float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2938;
            float _2942 = 1.0 / _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2962 = _2960 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2964 = _2936 * _2942;
            float _2966 = precise::clamp(_2964, 0.0, 1.0);
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2972 = fma(_2966, _2946, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2974 = fma(_2966, _2970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2976 = fma(_2966, _2950, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2978 = fma(_2966, _2954, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2980 = fma(_2966, _2958, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2982 = fma(_2966, _2962, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2894 = _2974;
            _2868 = _2980;
            _2888 = _2972;
            _2922 = _2978;
            _2914 = _2976;
            _2906 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2988 = isnan(_2622);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                _2886 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2996 = _2886;
            _2888 = _2996;
            if (!_2994)
            {
                _2892 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2998 = _2892;
            _2894 = _2998;
            if (!_2994)
            {
                _2912 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3000 = _2912;
            _2914 = _3000;
            if (!_2994)
            {
                _2920 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3002 = _2920;
            _2922 = _3002;
            if (!_2994)
            {
                _2866 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3004 = _2866;
            _2868 = _3004;
            if (!_2994)
            {
                _2904 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3006 = _2904;
            bool _3008 = !_2994;
            _2906 = _3006;
            if (!_3008)
            {
                bool _3010 = _2622 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3012 = isnan(_2622);
                bool _3014 = _3010 || _3012;
                bool _3016 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3018 = _3014 || _3016;
                if (!_3018)
                {
                    float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3022 = _2622 + _3020;
                    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3024;
                    float _3028 = 1.0 / _3026;
                    float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3048 = _3046 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3050 = _3022 * _3028;
                    float _3052 = precise::clamp(_3050, 0.0, 1.0);
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3058 = fma(_3052, _3032, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3060 = fma(_3052, _3056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3062 = fma(_3052, _3036, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3064 = fma(_3052, _3040, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3066 = fma(_3052, _3044, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3068 = fma(_3052, _3048, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2894 = _3060;
                    _2868 = _3066;
                    _2888 = _3058;
                    _2922 = _3064;
                    _2914 = _3062;
                    _2906 = _3068;
                    _2984 = true;
                }
                else
                {
                    _2894 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2868 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2888 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2922 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2914 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2906 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2984 = false;
    float _3070 = _2894;
    float _3072 = _2868;
    float _3074 = _2888;
    float _3076 = _2922;
    float _3078 = _2914;
    float _3080 = _2906;
    float _3082 = fma(_1436, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3070;
    float _3088 = _3086 + _3072;
    float _3090 = -_3074;
    float _3092 = _3090 + _3076;
    float _3094 = -_3078;
    float _3096 = _3094 + _3080;
    bool _3098 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3100 = fma(_3084, _3088, _3070);
    float _3102 = fma(_3084, _3092, _3074);
    float _3104 = fma(_3084, _3096, _3078);
    float _3106 = _2822 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3108 = _3100 * 0.586610972881317138671875;
    out.m_107.x = 0.0;
    float _3110 = fma(_3102, 0.298911988735198974609375, _3108);
    out.m_61.x = _3106;
    float _3112 = fma(_3104, 0.114477999508380889892578125, _3110);
    float _3114 = -_3112;
    float _3116 = _3102 + _3114;
    float _3118 = -_3112;
    float _3120 = _3100 + _3118;
    float _3122 = -_3112;
    float _3124 = _3104 + _3122;
    float _3126 = fma(_3116, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    float _3128 = fma(_3120, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    float _3130 = fma(_3124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3112);
    out.m_109.x = _3126;
    out.m_109.y = _3128;
    out.m_109.z = _3130;
    if (!_3098)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3132 = -_2191;
    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3136 = -_2193;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3140 = -_2197;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3144 = _3134 * _3134;
    float _3146 = fma(_3138, _3138, _3144);
    float _3148 = fma(_3142, _3142, _3146);
    float _3150 = sqrt(_3148);
    float _3152 = rsqrt(_3148);
    float _3154 = -_3150;
    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3158 = _3156 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3160 = precise::clamp(_3158, 0.0, 1.0);
    float _3162 = _3138 * _3152;
    float _3164 = _3134 * _3152;
    float _3166 = abs(_3160);
    float _3168 = log2(_3166);
    float _3170 = _3142 * _3152;
    float _3172 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3174 = _1436 * _3164;
    float _3176 = -_3164;
    float _3178 = -_3172;
    float _3180 = fma(_3176, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3178);
    float _3182 = fma(_1432, _3162, _3174);
    float _3184 = -_3170;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3180);
    float _3188 = fma(_1434, _3170, _3182);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3194 = _3186 + _3192;
    float _3196 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3198 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = exp2(_3196);
    float _3204 = _3202 * _3200;
    float _3206 = _3190 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _3208;
    out.m_107.y = _3210;
    out.m_107.z = _3212;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

