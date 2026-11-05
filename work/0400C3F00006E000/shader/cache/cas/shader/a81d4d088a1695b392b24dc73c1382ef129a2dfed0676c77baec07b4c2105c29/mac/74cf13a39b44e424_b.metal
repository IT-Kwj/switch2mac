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
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_85 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
    bool _1430 = false;
    bool _372 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_61.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2841 = as_type<float>(_140);
        out.gl_Position.z = _2841;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_178);
        out.gl_Position.z = _2910;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_65.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _158 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _210 + _212;
    bool _216 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _218 = isnan(_210);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _224 = _220 || _222;
    int _226 = _224 ? 1065353216 : 0;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _210 + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = 1.0 / _234;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _238;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _214 * _240;
    bool _252 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_210);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -as_type<float>(_226);
    float _266 = _264 + 1.0;
    bool _268 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_210);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = fma(_248, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _278 * _266;
    float _284 = -_278;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = _230 * _244;
    float _298 = _262 * _286;
    float _300 = fma(_290, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _304 = -_262;
    float _306 = _304 + 1.0;
    float _308 = _280 * _298;
    float _310 = _300 * _298;
    float _312 = _302 * _298;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _330 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _332 = fma(_320, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _334 = fma(_324, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _336 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _338 = fma(_330, _282, _326);
    float _340 = fma(_332, _282, _328);
    float _342 = fma(_334, _282, _336);
    float _344 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].x, _338);
    float _346 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].y, _340);
    float _348 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].z, _342);
    bool _350 = !_242;
    int _352 = _226;
    float _370;
    if (!_350)
    {
        float _354 = in.m_65.x;
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _358 = _354 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_124);
        float _376 = 1.0 / _374;
        float _378 = _158 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    float _382 = in.m_65.z;
    float _384 = in.m_65.w;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = in.m_67.y;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _398 = _396 != 0;
    float _400 = in.m_65.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _404 = _402 != 0;
    float _406 = in.m_65.x;
    float _408 = in.m_67.x;
    float _410 = _388 * _158;
    float _412 = in.m_69.w;
    float _414 = _382 * 2.0;
    bool _416 = _382 > 0.5;
    float _418 = exp2(_410);
    bool _420 = _384 > 0.5;
    float _422 = -_390;
    float _424 = _422 + 1.0;
    int _426 = _416 ? as_type<int>(_424) : as_type<int>(_390);
    float _428 = floor(_414);
    bool _430 = _400 > 0.5;
    float _432 = _406 * 2.0;
    float _434 = _398 ? as_type<float>(_426) : _390;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _438 = _436 != 0;
    float _440 = _384;
    float _442 = _390;
    bool _444 = _394;
    float _446 = _400;
    float _448 = _408;
    if (_404)
    {
        float _450 = -_408;
        float _452 = _450 + 1.0;
        _352 = as_type<int>(_452);
    }
    int _454 = _352;
    int _456 = _430 ? as_type<int>(_424) : as_type<int>(_390);
    float _458 = floor(_432);
    if (!_404)
    {
        _440 = _408;
    }
    float _460 = _440;
    out.m_71.w = _412;
    float _462 = _438 ? as_type<float>(_456) : _390;
    float _464 = -_418;
    float _466 = _464 + 1.0;
    float _468 = _460;
    if (_394)
    {
        float _470 = _420 ? _424 : _390;
        _442 = _470;
    }
    float _472 = _442;
    float _474 = in.m_58.x;
    float _476 = in.m_58.y;
    float _478 = in.m_58.z;
    bool _480 = _428 > 0.0;
    bool _482 = _428 >= 0.0;
    bool _484 = isnan(_428);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _492;
    float _496 = in.m_73.x;
    float _498 = in.m_73.y;
    float _500 = in.m_73.z;
    if (_404)
    {
        bool _502 = _406 > 0.5;
        _444 = _502;
    }
    bool _504 = _444;
    int _506 = _490 ? 0 : 1;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _514 = _512 != 0;
    int _516 = ~_506;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    int _522 = _520;
    if (_404)
    {
        float _524 = _504 ? as_type<float>(_454) : _408;
        _468 = _524;
    }
    float _526 = _468;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _538 = _536 != 0;
    if (!_480)
    {
        int _540 = ~_506;
        int _542 = _540 + 1;
        _522 = _542;
    }
    int _544 = _522;
    float _546 = 0.0;
    if (_510)
    {
        float _548 = in.m_65.z;
        _546 = _548;
    }
    float _550 = _546;
    bool _552 = _458 >= 0.0;
    bool _554 = isnan(_458);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _568 = _560 ? 0 : 1;
    float _570 = _348 * _500;
    bool _572 = _458 > 0.0;
    float _574 = _346 * _498;
    float _576 = _344 * _496;
    float _578 = 1.0 / _566;
    float _580 = in.m_75.x;
    float _582 = in.m_75.y;
    float _584 = in.m_75.z;
    float _586 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _590 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].x, _562);
    int _592 = ~_568;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _602 = _596;
    bool _604 = _572;
    if (!_572)
    {
        int _606 = ~_568;
        int _608 = _606 + 1;
        _602 = _608;
    }
    int _610 = _602;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _614 = _400 * 2.0;
    float _616 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _624 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].x, _588);
    float _626 = floor(_614);
    float _628 = _494 * _578;
    float _630 = _400 + _382;
    out.m_77.x = _616;
    out.m_77.y = _618;
    out.m_77.z = _620;
    float _632 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _630 + (-1.0);
    if (_510)
    {
        bool _636 = _550 > 0.5;
        _604 = _636;
    }
    bool _638 = _604;
    float _640 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _642 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _622);
    bool _644 = !_530;
    int _646 = _644 ? 0 : 1;
    int _648 = 0;
    if (_510)
    {
        float _650 = -_408;
        float _652 = _650 + 1.0;
        _648 = as_type<int>(_652);
    }
    int _654 = _648;
    bool _656 = !_538;
    int _658 = _656 ? 0 : 1;
    float _660 = _406 + _382;
    float _662 = _406 + _400;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _580);
    bool _666 = _626 > 0.0;
    float _668 = _660 + (-1.0);
    float _670 = _662 + (-1.0);
    float _672 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _674 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _676 = !_534;
    int _678 = _676 ? 0 : 1;
    float _680 = _664 * _632;
    bool _682 = _626 >= 0.0;
    bool _684 = isnan(_626);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.0);
    bool _690 = _686 || _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    bool _696 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _582);
    float _708 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = 1.0 / _694;
    float _714 = _704 ? _466 : 0.0;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _584);
    float _718 = _706 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _722 = _380 + _720;
    bool _724 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(1.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = _716 * _640;
    float _736 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _590);
    float _738 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _624);
    float _740 = fma(_628, _722, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _742 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _744 = isnan(_380);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = in.m_79.x;
    float _756 = in.m_79.y;
    float _758 = in.m_79.z;
    int _760 = abs(_678);
    float _762 = _406 + (-0.5);
    bool _764 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _766 = isnan(_380);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_752;
    float _778 = _776 + 1.0;
    float _780 = float(_760);
    float _782 = _382 + (-0.5);
    float _784 = _782;
    if (_732)
    {
        float _786 = _714 * _712;
        _162 = _786;
    }
    float _788 = _162;
    int _790 = abs(_646);
    float _792 = _774 * _778;
    float _794 = float(_610);
    float _796 = -_774;
    float _798 = _796 + 1.0;
    int _800 = abs(_658);
    float _802 = _736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _804 = float(_790);
    float _806 = _780 * _794;
    float _808 = float(_544);
    float _810 = _740 * _792;
    int _812 = _690 ? 0 : 1;
    float _814 = _400 + (-0.5);
    float _816 = _806 * (-2.0);
    int _818 = ~_812;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = _804 * _808;
    int _826 = _822;
    int _828 = as_type<int>(_816);
    float _830 = _810;
    if (!_666)
    {
        int _832 = ~_812;
        int _834 = _832 + 1;
        _826 = _834;
    }
    int _836 = _826;
    float _838 = fma(_816, _756, _756);
    float _840 = float(_800);
    float _842 = fma(_672, _816, _672);
    float _844 = float(_836);
    float _846 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _848 = _824 * (-2.0);
    if (!_510)
    {
        _446 = _408;
    }
    float _850 = _446;
    float _852 = _850;
    if (_514)
    {
        float _854 = -_408;
        float _856 = _854 + 1.0;
        _828 = as_type<int>(_856);
    }
    int _858 = _828;
    float _860 = _840 * _844;
    float _862 = fma(_842, _788, _846);
    float _864 = fma(_710, _848, _710);
    float _866 = fma(_848, _754, _754);
    float _868 = in.m_81.x;
    float _870 = in.m_81.y;
    float _872 = in.m_81.z;
    if (_510)
    {
        float _874 = _638 ? as_type<float>(_654) : _408;
        _852 = _874;
    }
    float _876 = _852;
    float _878 = _860 * (-2.0);
    bool _880 = _582 != 0.0;
    bool _882 = isnan(_582);
    bool _884 = _880 || _882;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    float _890 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _866);
    float _892 = _862 * 0.15915493667125701904296875;
    float _894 = fma(_674, _878, _674);
    bool _896 = _580 == 0.0;
    bool _898 = !_888;
    bool _900 = _896 && _898;
    float _902 = fma(_878, _758, _758);
    float _904 = fma(_864, _788, _890);
    float _906 = _892 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = in.m_83.x;
    float _912 = in.m_83.y;
    float _914 = in.m_83.z;
    float _916 = in.m_83.w;
    bool _918 = _584 == 0.0;
    bool _920 = _918 && _900;
    float _922 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[196].z, _902);
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _922;
    if (!_514)
    {
        _784 = _408;
    }
    float _928 = _784;
    float _930 = fma(_894, _788, _922);
    float _932 = _892 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[115].x, _810);
    float _938 = _928;
    float _940 = _930;
    if (_514)
    {
        float _942 = _430 ? as_type<float>(_858) : _408;
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[116].x, _936);
    float _948 = _868;
    if (_920)
    {
        _926 = _868;
    }
    float _950 = _926;
    float _952 = _924 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _930 * 0.15915493667125701904296875;
    float _958 = _950;
    if (_920)
    {
        _940 = _870;
    }
    float _960 = _940;
    float _962 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _964 = _960;
    if (_920)
    {
        _448 = _950;
    }
    float _966 = _448;
    float _968 = _966;
    if (_920)
    {
        _830 = _960;
    }
    float _970 = _830;
    float _972 = _956 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _970;
    if (!_920)
    {
        _964 = _870;
    }
    float _978 = _964;
    if (!_920)
    {
        _958 = _868;
    }
    float _980 = _958;
    if (_920)
    {
        _948 = _872;
    }
    float _982 = _948;
    float _984 = _910 * _978;
    float _986 = _982;
    if (!_920)
    {
        float _988 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, _978);
        _976 = _988;
    }
    float _990 = _976;
    float _992 = _924 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = _914 * _980;
    if (!_920)
    {
        float _998 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _980);
        _968 = _998;
    }
    float _1000 = _968;
    float _1002 = -_984;
    float _1004 = fma(_912, _980, _1002);
    float _1006 = _954 * _934;
    float _1008 = _954 * _908;
    float _1010 = -_996;
    float _1012 = fma(_910, _872, _1010);
    float _1014 = _912 * _872;
    float _1016 = _956 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _954 * _974;
    float _1022 = _934 * _974;
    if (!_920)
    {
        float _1024 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[17].y, _872);
        _986 = _1024;
    }
    float _1026 = _986;
    float _1028 = -_1014;
    float _1030 = fma(_914, _978, _1028);
    float _1032 = _1020 * _718;
    float _1034 = _1004 * _916;
    float _1036 = _994 * _908;
    float _1038 = _994 * _934;
    float _1040 = _994 * _974;
    float _1042 = _908 * _974;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1046 = _1040 * _718;
    float _1048 = fma(_1018, _1006, _1036);
    float _1050 = -_1008;
    float _1052 = fma(_1018, _1038, _1050);
    float _1054 = -_1038;
    float _1056 = fma(_1018, _1008, _1054);
    float _1058 = -_718;
    float _1060 = _1018 * _1058;
    float _1062 = fma(_1048, _680, _1032);
    float _1064 = fma(_1018, _1036, _1006);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = fma(_1022, _680, _1060);
    float _1070 = fma(_1056, _734, _1062);
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1074 = fma(_1052, _680, _1046);
    float _1076 = fma(_1042, _734, _1068);
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1080 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1082 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1090 = fma(_1064, _734, _1074);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1078);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1080);
    out.m_85.x = _1082;
    out.m_85.y = _1084;
    out.m_85.z = _1086;
    out.m_85.w = _962;
    float _1096 = _738 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1098 = _1012 * _916;
    float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1094);
    float _1102 = _1030 * _916;
    float _1104 = -_990;
    float _1106 = _1018 * _1104;
    float _1108 = -_912;
    float _1110 = _1018 * _1108;
    float _1112 = _1096 + _1100;
    float _1114 = -_1098;
    float _1116 = _1018 * _1114;
    float _1118 = _1020 * _912;
    float _1120 = _1040 * _912;
    float _1122 = _1020 * _990;
    float _1124 = fma(_1022, _1102, _1116);
    float _1126 = _1020 * _1098;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1092);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1112 + _1130;
    float _1134 = fma(_1022, _910, _1110);
    float _1136 = fma(_1052, _910, _1120);
    float _1138 = _1088 + _1128;
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1022, _1000, _1106);
    float _1144 = _1040 * _990;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1138 + _1146;
    float _1150 = _1040 * _1098;
    float _1152 = fma(_1048, _1000, _1122);
    float _1154 = fma(_1052, _1000, _1144);
    float _1156 = _1148 * _1148;
    float _1158 = fma(_1048, _910, _1118);
    float _1160 = fma(_1048, _1102, _1126);
    float _1162 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1164 = _1156 + _1140;
    float _1166 = fma(_1052, _1102, _1150);
    float _1168 = fma(_1042, _1026, _1142);
    float _1170 = fma(_1056, _1026, _1152);
    float _1172 = sqrt(_1164);
    float _1174 = fma(_1064, _1026, _1154);
    float _1176 = fma(_1042, _914, _1134);
    float _1178 = fma(_1056, _914, _1158);
    float _1180 = fma(_1064, _914, _1136);
    float _1182 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1162);
    float _1184 = fma(_1042, _1034, _1124);
    float _1186 = fma(_1056, _1034, _1160);
    float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1190 = fma(_1064, _1034, _1166);
    float _1192 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1194 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1196 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1198 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1200 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1192);
    float _1202 = _802 + _1194;
    bool _1204 = _1172 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1196);
    float _1210 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1198);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1214 = _1198;
    float _1216 = _1196;
    float _1218 = _1156;
    float _1220 = _1140;
    float _1222 = _1138;
    float _1224 = _1160;
    float _1226 = _1124;
    float _1228 = _1120;
    float _1230 = _1136;
    float _1232 = _1088;
    if (!_1204)
    {
        _1214 = _1112;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    if (!_1204)
    {
        _1216 = _1202;
    }
    float _1238 = _1216;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _1242 = !_1204;
    float _1244 = _1238;
    float _1246 = _1212;
    if (!_1242)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1252 = _1172 + _1250;
        float _1254 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = rsqrt(_1164);
        float _1258 = _1252 * _1248;
        float _1260 = _1258 * 0.15915493667125701904296875;
        float _1262 = _1260 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1260 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = fma(_1264, _1254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1272 = _1256 * _1270;
        float _1274 = fma(_1148, _1272, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = _1268 + (-1.0);
        float _1278 = fma(_1132, _1272, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1282 = _1274 + _1280;
        float _1284 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1288 = _1278 + _1286;
        float _1290 = _1282 * _1282;
        float _1292 = fma(_1202, _1268, _1284);
        float _1294 = _1288 * _1288;
        _1244 = _1292;
        _1218 = _1290;
        _1220 = _1294;
        _1222 = _1274;
        _1236 = _1278;
    }
    float _1296 = _1244;
    float _1298 = _1218;
    float _1300 = _1220;
    float _1302 = _1222;
    float _1304 = _1236;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1308 = _1296 + _1306;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1312 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1314 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1316 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1318 = fma(_1308, _1308, _1298);
    float _1320 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1312);
    float _1322 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1314);
    float _1324 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1316);
    float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1328 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1330 = _1318 + _1300;
    float _1332 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1334 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1336 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1328);
    float _1338 = _472 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1340 = _944 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1342 = _462 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1344 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1320);
    float _1346 = _526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1348 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1350 = sqrt(_1330);
    float _1352 = _434 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1354 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1332);
    float _1356 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1334);
    float _1358 = _1340 * _1240;
    float _1360 = _1342 * _1206;
    float _1362 = _1346 * _1188;
    float _1364 = _1348 * _1212;
    float _1366 = _1352 * _1310;
    float _1368 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1336);
    float _1370 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1354);
    float _1372 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1208);
    float _1374 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1376 = _1338 * _1326;
    float _1378 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1322);
    float _1380 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1356);
    float _1384 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1210);
    out.m_87.x = _1362;
    out.m_87.y = _1360;
    out.m_87.z = _1364;
    out.m_87.w = _1376;
    bool _1386 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1388 = isnan(_1350);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1394 = _1390 || _1392;
    out.m_89.x = _1358;
    out.m_89.y = _1366;
    out.m_91.x = _1344;
    out.m_91.y = _1378;
    out.m_91.z = _1380;
    out.m_93.x = _1368;
    out.m_93.y = _1370;
    out.m_93.z = _1382;
    if (!_1394)
    {
        _1246 = 1.0;
    }
    float _1396 = _1246;
    out.m_95.x = _1372;
    out.m_95.y = _1374;
    out.m_95.z = _1384;
    bool _1398 = !_1394;
    float _1400 = _1396;
    if (!_1398)
    {
        bool _1402 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1404 = isnan(_1350);
        bool _1406 = _1402 || _1404;
        bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1410 = _1406 || _1408;
        if (!_1410)
        {
            float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1414 = _1350 + _1412;
            float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1418 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1416;
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1424 = 1.0 / _1418;
            float _1426 = _1414 * _1424;
            float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1400 = _1428;
            _1430 = true;
        }
        else
        {
            bool _1432 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1434 = isnan(_1350);
            bool _1436 = _1432 || _1434;
            bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1440 = _1436 || _1438;
            if (!_1440)
            {
                float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1444 = _1350 + _1442;
                float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1448 = _1446 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1454 = 1.0 / _1448;
                float _1456 = _1444 * _1454;
                float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1400 = _1458;
                _1430 = true;
            }
            else
            {
                _1400 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1430 = false;
    float _1460 = _1400;
    float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1464 = _1296 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1468 = _1302 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1472 = _1304 + _1470;
    float _1474 = _802 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1476 = fma(_1464, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1478 = fma(_1468, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1480 = fma(_1472, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1482 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1474);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1486 = _1476 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1490 = _1478 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1480 + _1492;
    float _1496 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1482);
    float _1498 = _1486 * _1486;
    float _1500 = _802 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1502 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = fma(_1490, _1490, _1498);
    float _1506 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1500);
    float _1508 = 1.0 / _1502;
    float _1510 = fma(_1494, _1494, _1504);
    float _1512 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1506);
    float _1514 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1516 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1518 = rsqrt(_1510);
    float _1520 = _802 + _1514;
    float _1522 = _1516 + _1502;
    float _1524 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1528 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1530 = _1522 * _1508;
    float _1532 = _1530 * 0.5;
    float _1534 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1526);
    float _1536 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1528);
    float _1538 = floor(_1524);
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1542 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1540);
    float _1544 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1534);
    float _1546 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1536);
    float _1548 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1544 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1552 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1554 = 1.0 / _1542;
    float _1556 = _1490 * _1548;
    float _1558 = _1494 * _1548;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = trunc(_1550);
    int _1566 = int(_1564);
    float _1568 = -_1538;
    float _1570 = _1524 + _1568;
    float _1572 = _1560 + _1562;
    float _1574 = sqrt(_1572);
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1578 = _1554 * _1576;
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1582 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1584 = trunc(_1552);
    int _1586 = int(_1584);
    int _1588 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1590 = _1566 + _1588;
    int _1592 = _1590 + 1;
    bool _1594 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1574 + _1596;
    float _1600 = sqrt(_1510);
    int _1602 = 2;
    float _1604 = _1572;
    float _1606 = _1598;
    float _1608 = _1548;
    float _1610 = _1556;
    float _1612 = _1560;
    if (!_1580)
    {
        _1602 = 1;
    }
    int _1614 = _1602;
    int _1616 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1618 = _1586 + _1616;
    int _1620 = _1618 + 1;
    float _1622 = _1502;
    int _1624 = _1614;
    if (_1594)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1626;
    }
    float _1628 = _1622;
    if (_1594)
    {
        float _1630 = rsqrt(_1572);
        _1604 = _1630;
    }
    float _1632 = _1604;
    float _1634 = _1632;
    if (_1594)
    {
        float _1636 = _1598 * _1628;
        _1606 = _1636;
    }
    float _1638 = _1606;
    if (_1594)
    {
        float _1640 = _1638 * 0.15915493667125701904296875;
        _1224 = _1640;
    }
    float _1642 = _1224;
    bool _1644 = !_1580;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1544;
    if (_1594)
    {
        float _1652 = _1642 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    if (!_1582)
    {
        _1624 = _1646;
    }
    int _1658 = _1624;
    float _1660 = precise::max(0.0, _1648);
    int _1662 = _1658 << 6;
    bool _1664 = _1592 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1666 = -_1548;
    float _1668 = -_1660;
    float _1670 = fma(_1486, _1666, _1668);
    int _1672 = _1662 + 96;
    uint _1675 = uint(int(uint(_1672) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
    int _1691 = _1592 | _1620;
    float _1693 = _1642;
    float _1695 = as_type<float>(_1691);
    float _1697 = _1670;
    if (_1594)
    {
        float _1699 = _1642 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        _1693 = _1701;
    }
    float _1703 = _1693;
    if (_1594)
    {
        float _1705 = _1670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1705;
    }
    float _1707 = _1608;
    bool _1709 = _1691 < 0;
    bool _1711 = _1709 || _1664;
    if (_1594)
    {
        float _1713 = fma(_1656, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1695 = _1713;
    }
    float _1715 = _1695;
    int _1717 = _1662 + 48;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    float _1735 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1594)
    {
        float _1739 = _1632 * _1715;
        _1226 = _1739;
    }
    float _1741 = _1226;
    bool _1743 = _1620 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1745 = _1743 || _1711;
    float _1747 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1749 = floor(_1737);
    if (_1594)
    {
        float _1751 = _1556 * _1741;
        _1610 = _1751;
    }
    float _1753 = _1610;
    int _1755 = _1662 + 104;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
    int _1761 = int(_1757) & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = int(_1757) + 1;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    int _1769 = _1765 & 3;
    float _1771 = (*spvDescriptorSet0.vp_c15)._m0[int(_1767)][_1769];
    float _1773 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1775 = _1703;
    if (_1594)
    {
        float _1777 = _1703 + (-1.0);
        _1634 = _1777;
    }
    float _1779 = _1634;
    float _1781 = _1779;
    if (_1594)
    {
        float _1783 = _1753 * _1753;
        _1612 = _1783;
    }
    float _1785 = _1612;
    if (_1594)
    {
        float _1787 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1787;
    }
    float _1789 = _1228;
    if (!_1594)
    {
        _1781 = _1558;
    }
    float _1791 = _1781;
    int _1793 = _1662 + 64;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    int _1803 = int(_1795) + 1;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    int _1807 = _1803 & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    float _1811 = _1791;
    if (_1594)
    {
        float _1813 = _1558 * _1741;
        _1811 = _1813;
    }
    float _1815 = _1811;
    if (_1594)
    {
        float _1817 = fma(_1670, _1703, _1789);
        _1697 = _1817;
    }
    float _1819 = _1697;
    float _1821 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1594)
    {
        _1775 = _1562;
    }
    float _1823 = _1775;
    float _1825 = _1823;
    if (_1594)
    {
        float _1827 = _1815 * _1815;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = fma(_1819, _1819, _1785);
    float _1833 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1835 = _1662 + 80;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    uint _1839 = uint(int(uint(int(_1837)) >> uint(2)));
    int _1841 = int(_1837) & 3;
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[int(_1839)][_1841];
    int _1845 = int(_1837) + 1;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    int _1849 = _1845 & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    float _1853 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1855 = _1831 + _1829;
    int _1857 = as_type<int>(_1853);
    if (!_1745)
    {
        float _1859 = floor(_1552);
        _1230 = _1859;
    }
    float _1861 = _1230;
    float _1863 = -_1749;
    float _1865 = _1737 + _1863;
    float _1867 = -_1853;
    float _1869 = fma(_1867, _1833, 1.0);
    if (!_1745)
    {
        int _1871 = _1620 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1873 = _1871 + _1592;
        _1857 = _1873;
    }
    int _1875 = _1857;
    int _1877 = _1662 + 56;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = log2(_1869);
    int _1897 = _1662 + 88;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
    int _1903 = int(_1899) & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    int _1907 = int(_1899) + 1;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    int _1911 = _1907 & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    float _1915 = _1520 * _1689;
    float _1917 = fma(_1088, _1681, _1915);
    int _1919 = _1662 + 72;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    uint _1923 = uint(int(uint(int(_1921)) >> uint(2)));
    int _1925 = int(_1921) & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    int _1929 = int(_1921) + 1;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    int _1933 = _1929 & 3;
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[int(_1931)][_1933];
    float _1937 = _1520 * _1733;
    float _1939 = rsqrt(_1855);
    float _1941 = _1895 * 0.693147182464599609375;
    float _1943 = fma(_1088, _1725, _1937);
    int _1945 = as_type<int>(_1937);
    int _1947 = as_type<int>(_1681);
    if (!_1745)
    {
        int _1949 = _1875 << 2;
        _1945 = _1949;
    }
    int _1951 = _1945;
    float _1953 = fma(_1096, _1763, _1917);
    int _1955 = _1951;
    float _1957 = _1809;
    int _1959 = as_type<int>(_1851);
    if (!_1745)
    {
        int _1961 = 12 & _1951;
        _1955 = _1961;
    }
    int _1963 = _1955;
    float _1965 = _1953 + _1771;
    float2 _5848 = float2(_1570, _1865);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5848, float2(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5848, float2(0.0), isnan(_5848)), level(0.0)).x;
    float _1969 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1971 = _1520 * _1809;
    if (!_1745)
    {
        float _1973 = -_1861;
        float _1975 = _1552 + _1973;
        _1957 = _1975;
    }
    float _1977 = _1957;
    float _1979 = 1.0 / _1965;
    float _1981 = _1939 * _1753;
    float _1983 = fma(_1088, _1801, _1971);
    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1987 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1985);
    float _1989 = precise::clamp(_1987, 0.0, 1.0);
    float _1991 = _1939 * _1819;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1995 = _1520 * _1851;
    if (!_1745)
    {
        uint _1997 = uint(int(uint(_1875) >> uint(2)));
        _1959 = int(_1997);
    }
    int _1999 = _1959;
    float _2001 = _1939 * _1815;
    float _2003 = fma(_1088, _1843, _1995);
    float _2005 = -_1989;
    float _2007 = _2005 + 1.0;
    if (!_1745)
    {
        int _2009 = _1999 << 4;
        int _2011 = _2009 + _1963;
        _1947 = _2011;
    }
    int _2013 = _1947;
    float _2015 = fma(_1096, _1885, _1943);
    float _2017 = abs(_2007);
    float _2019 = log2(_2017);
    float _2021 = _2015 + _1893;
    float _2023 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = fma(_1096, _1905, _2003);
    float _2027 = -_1993;
    float _2029 = fma(_1991, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2027);
    float _2031 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2023);
    float _2035 = -_2001;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2029);
    float _2039 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2041 = _2021 * _1979;
    float _2043 = fma(_1096, _1927, _1983);
    float _2045 = fma(_2037, -0.5, 0.5);
    float _2047 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2039);
    float _2049 = fma(_2037, 0.5, 0.5);
    float _2051 = _2043 + _1935;
    float _2053 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2055 = _2041 >= 0.0;
    float _2057 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2059 = _2051 * _1979;
    float _2061 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2053);
    bool _2063 = _2041 <= 1.0;
    bool _2065 = _2063 && _2055;
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2071 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2061);
    bool _2073 = _2059 >= 0.0;
    bool _2075 = _2073 && _2065;
    float _2077 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2079 = exp2(_2069);
    float _2081 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2083 = _2059 <= 1.0;
    bool _2085 = _2083 && _2075;
    float _2087 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2089 = _1983;
    float _2091 = as_type<float>(_2013);
    if (!_1745)
    {
        int _2093 = _2013 + 400;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        _2089 = _2101;
    }
    float _2103 = _2089;
    float _2105 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2077);
    float _2107 = _2025 + _1913;
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = sqrt(_2045);
    float _2113 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2105);
    float _2115 = _1991 + 1.0;
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = _2107 * _1979;
    float _2121 = fma(_2049, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2123 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    float _2125 = _2123;
    if (_2085)
    {
        float _2127 = float(_1658);
        _2091 = _2127;
    }
    float _2129 = _2091;
    float _2131 = -_1991;
    float _2133 = fma(_2079, _2115, _2131);
    float _2135 = fma(_2049, _2121, -0.212114393711090087890625);
    float _2137 = 1.0 / _2123;
    float _2139 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2141 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2143 = fma(_2049, _2135, 1.570728778839111328125);
    float _2145 = fma(_2133, 0.5, 0.5);
    float _2147 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2139);
    float _2149 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2141);
    float _2151 = _2111 * 0.636619746685028076171875;
    float _2153 = _2129;
    float _2155 = _2147;
    if (_2085)
    {
        float _2157 = rint(_2129);
        float _2159 = precise::max(_2157, 0.0);
        uint _2161 = uint(_2159);
        uint _2163 = clamp(_2161, 0u, 65535u);
        _2153 = as_type<float>(_2163);
    }
    float _2165 = _2153;
    float _2167 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2147);
    float _2169 = -_2143;
    float _2171 = fma(_2151, _2169, 1.0);
    float _2173 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2175 = _2047;
    float _2177 = _2173;
    if (!_1745)
    {
        float _2179 = floor(_1550);
        _2175 = _2179;
    }
    float _2181 = _2175;
    float _2183 = _2149 * _2137;
    float _2185 = _2173 * _2137;
    float _2187 = fma(_2183, 0.5, 0.5);
    float _2189 = fma(_2185, -0.5, 0.5);
    float _2191 = _2165;
    if (_2085)
    {
        float3 _6238 = float3(_2041, _2059, float(as_type<int>(_2165)));
        float3 _6242 = select(_6238, float3(0.0), isnan(_6238));
        float _2193 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6242.xy, uint(rint(_6242.z)), _2119, level(0.0));
        _2191 = _2193;
    }
    float _2195 = _2191;
    float3 _6252 = float3(_2187, _2189, _1969);
    float _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6252, float3(0.0), isnan(_6252)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6252, float3(0.0), isnan(_6252)), level(0.0)).x;
    if (!_1745)
    {
        float _2199 = -_2181;
        float _2201 = _1550 + _2199;
        _2155 = _2201;
    }
    float _2203 = _2155;
    float _2205 = _2185;
    float _2207 = _2203;
    if (!_1745)
    {
        float _2209 = rint(_2103);
        float _2211 = precise::max(_2209, 0.0);
        uint _2213 = uint(_2211);
        uint _2215 = clamp(_2213, 0u, 65535u);
        _2205 = as_type<float>(_2215);
    }
    float _2217 = _2205;
    float3 _6289 = float3(_2187, _2189, _1969);
    float4 _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6289, float3(0.0), isnan(_6289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6289, float3(0.0), isnan(_6289)), level(0.0)).xyzw;
    float _2222 = _2220.x;
    float _2224 = _2220.y;
    float _2226 = _2220.z;
    float _2228 = _2220.w;
    float2 _6305 = float2(_2171, _2145);
    float3 _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6305, float2(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6305, float2(0.0), isnan(_6305)), level(0.0)).xyz;
    float _2234 = _2232.x;
    float _2236 = _2232.y;
    float _2238 = _2232.z;
    float _2240 = _2217;
    if (!_1745)
    {
        float3 _6326 = float3(_2203, _1977, float(as_type<int>(_2217)));
        float3 _6328 = select(_6326, float3(0.0), isnan(_6326));
        float _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6328.xy, uint(rint(_6328.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6328.xy, uint(rint(_6328.z)), level(0.0)).x;
        _2240 = _2242;
    }
    float _2244 = _2240;
    float _2246 = abs(_1578);
    float _2248 = log2(_2246);
    float _2250 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2252 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2250);
    float _2254 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2252);
    float _2256 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2258 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2254);
    bool _2260 = _1578 <= 8000.0;
    bool _2262 = isnan(_1578);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan(8000.0);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2274 = _2258 + _2123;
    float _2276 = exp2(_2256);
    if (!_2085)
    {
        _2207 = 1.0;
    }
    float _2278 = _2207;
    float _2280 = _2274 * 0.5;
    float _2282 = exp2(_2272);
    out.m_97.z = _2280;
    out.m_97.w = _2123;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2286 = precise::clamp(_2284, 0.0, 1.0);
    float _2288 = fma(_2286, -2.0, 3.0);
    float _2290 = _2286 * _2286;
    float _2292 = _2290 * _2288;
    float _2294 = -_2292;
    float _2296 = _2294 + 1.0;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2258;
    out.gl_Position.w = _2123;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2292);
    float _2300 = _2270 * _2298;
    float _2302 = -_2276;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2310 = _2149;
    float _2312 = _2278;
    float _2314 = _2306;
    if (_1745)
    {
        _2310 = 1.0;
    }
    float _2316 = _2310;
    float _2318 = -_1967;
    float _2320 = _2318 + 1.0;
    float _2322 = _2320 * _2306;
    float _2324 = precise::clamp(_2322, 0.0, 1.0);
    float _2326 = _2316;
    if (_2085)
    {
        bool _2328 = _2195 >= _2119;
        bool _2330 = isnan(_2195);
        bool _2332 = _2328 || _2330;
        bool _2334 = isnan(_2119);
        bool _2336 = _2332 || _2334;
        float _2338 = float(_2336);
        _2312 = _2338;
    }
    float _2340 = _2312;
    if (!_1745)
    {
        int _2342 = _1875 << 4;
        int _2344 = _2342 + 2048;
        uint _2346 = uint(int(uint(_2344) >> uint(2)));
        uint _2348 = uint(int(uint(int(_2346)) >> uint(2)));
        int _2350 = int(_2346) & 3;
        float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
        int _2354 = int(_2346) + 1;
        uint _2356 = uint(int(uint(_2354) >> uint(2)));
        int _2358 = _2354 & 3;
        float _2360 = (*spvDescriptorSet0.vp_c15)._m0[int(_2356)][_2358];
        int _2362 = _2344 + 8;
        uint _2364 = uint(int(uint(_2362) >> uint(2)));
        uint _2366 = uint(int(uint(int(_2364)) >> uint(2)));
        int _2368 = int(_2364) & 3;
        float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
        int _2372 = int(_2364) + 1;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        int _2376 = _2372 & 3;
        float _2378 = (*spvDescriptorSet0.vp_c15)._m0[int(_2374)][_2376];
        float _2380 = _1520 * _2360;
        float _2382 = fma(_1088, _2352, _2380);
        float _2384 = fma(_1096, _2370, _2382);
        float _2386 = _2384 + _2378;
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = -_2388;
        float _2392 = _2390 + _2244;
        float _2394 = fma(_2392, 500.0, 1.5);
        float _2396 = exp2(_2394);
        float _2398 = 0.0 + _2396;
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        _2326 = _2400;
        _2177 = _2396;
        _2125 = _2378;
    }
    float _2402 = _2326;
    float _2404 = _2177;
    float _2406 = _2125;
    float _2408 = _2308 * _2197;
    float _2410 = _2340 * _2402;
    float _2412 = -_2324;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2416 = -_2308;
    float _2418 = _2416 + 1.0;
    float _2420 = _2228 * _2408;
    float _2422 = _2238 * _2408;
    float _2424 = -_2410;
    float _2426 = fma(_2424, _2414, 1.0);
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = _2228 * _2418;
    float _2432 = fma(_2234, _2420, _2222);
    float _2434 = fma(_2236, _2420, _2224);
    float _2436 = _2428 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2438 = fma(_2228, _2422, _2226);
    bool _2440 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2442 = isnan(_1600);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2448 = _2444 || _2446;
    out.m_99.x = _2436;
    out.m_101.x = _2432;
    out.m_101.y = _2434;
    out.m_101.z = _2438;
    out.m_101.w = _2430;
    float _2450 = _2406;
    float _2452 = _2418;
    float _2454 = _2404;
    float _2456 = _2428;
    if (!_2448)
    {
        _1232 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2458 = _1232;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2448)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2464 = _2314;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2448)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2470 = _2450;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2448)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2476 = _2452;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2448)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2454;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2448)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2456;
    bool _2490 = !_2448;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_1600);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _1600 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2518 = 1.0 / _2512;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2518;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = fma(_2538, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2468 = _2548;
            _2486 = _2552;
            _2462 = _2544;
            _2480 = _2550;
            _2474 = _2546;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_1600);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2460;
            _2462 = _2568;
            if (!_2566)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2466;
            _2468 = _2570;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2472;
            _2474 = _2572;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2478;
            _2480 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_1600);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _1600 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2604 = 1.0 / _2598;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2604;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2630 = fma(_2624, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2468 = _2634;
                    _2486 = _2638;
                    _2462 = _2630;
                    _2480 = _2636;
                    _2474 = _2632;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2468;
    float _2644 = _2486;
    float _2646 = _2462;
    float _2648 = _2480;
    float _2650 = _2474;
    float _2652 = _2494;
    float _2654 = fma(_1374, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_103.x = 0.0;
    float _2684 = -_2682;
    float _2686 = _2674 + _2684;
    float _2688 = -_2682;
    float _2690 = _2672 + _2688;
    float _2692 = -_2682;
    float _2694 = _2676 + _2692;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2700 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2702 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    out.m_99.w = _2696;
    out.m_105.x = _2698;
    out.m_105.y = _2700;
    out.m_105.z = _2702;
    if (!_2670)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2704 = -_1476;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1478;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1480;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _1374 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_1372, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_1384, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2780;
    out.m_103.y = _2782;
    out.m_103.z = _2784;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
    bool _1430 = false;
    bool _372 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_61.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2841 = as_type<float>(_140);
        out.gl_Position.z = _2841;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_178);
        out.gl_Position.z = _2910;
    }
    if (_172)
    {
        return out;
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_65.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _158 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _210 + _212;
    bool _216 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _218 = isnan(_210);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _224 = _220 || _222;
    int _226 = _224 ? 1065353216 : 0;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _210 + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = 1.0 / _234;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _238;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _214 * _240;
    bool _252 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_210);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -as_type<float>(_226);
    float _266 = _264 + 1.0;
    bool _268 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_210);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = fma(_248, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _278 * _266;
    float _284 = -_278;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = _230 * _244;
    float _298 = _262 * _286;
    float _300 = fma(_290, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _304 = -_262;
    float _306 = _304 + 1.0;
    float _308 = _280 * _298;
    float _310 = _300 * _298;
    float _312 = _302 * _298;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _330 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _332 = fma(_320, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _334 = fma(_324, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _336 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _338 = fma(_330, _282, _326);
    float _340 = fma(_332, _282, _328);
    float _342 = fma(_334, _282, _336);
    float _344 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].x, _338);
    float _346 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].y, _340);
    float _348 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].z, _342);
    bool _350 = !_242;
    int _352 = _226;
    float _370;
    if (!_350)
    {
        float _354 = in.m_65.x;
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _358 = _354 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_124);
        float _376 = 1.0 / _374;
        float _378 = _158 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    float _382 = in.m_65.z;
    float _384 = in.m_65.w;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = in.m_67.y;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _398 = _396 != 0;
    float _400 = in.m_65.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _404 = _402 != 0;
    float _406 = in.m_65.x;
    float _408 = in.m_67.x;
    float _410 = _388 * _158;
    float _412 = in.m_69.w;
    float _414 = _382 * 2.0;
    bool _416 = _382 > 0.5;
    float _418 = exp2(_410);
    bool _420 = _384 > 0.5;
    float _422 = -_390;
    float _424 = _422 + 1.0;
    int _426 = _416 ? as_type<int>(_424) : as_type<int>(_390);
    float _428 = floor(_414);
    bool _430 = _400 > 0.5;
    float _432 = _406 * 2.0;
    float _434 = _398 ? as_type<float>(_426) : _390;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _438 = _436 != 0;
    float _440 = _384;
    float _442 = _390;
    bool _444 = _394;
    float _446 = _400;
    float _448 = _408;
    if (_404)
    {
        float _450 = -_408;
        float _452 = _450 + 1.0;
        _352 = as_type<int>(_452);
    }
    int _454 = _352;
    int _456 = _430 ? as_type<int>(_424) : as_type<int>(_390);
    float _458 = floor(_432);
    if (!_404)
    {
        _440 = _408;
    }
    float _460 = _440;
    out.m_71.w = _412;
    float _462 = _438 ? as_type<float>(_456) : _390;
    float _464 = -_418;
    float _466 = _464 + 1.0;
    float _468 = _460;
    if (_394)
    {
        float _470 = _420 ? _424 : _390;
        _442 = _470;
    }
    float _472 = _442;
    float _474 = in.m_58.x;
    float _476 = in.m_58.y;
    float _478 = in.m_58.z;
    bool _480 = _428 > 0.0;
    bool _482 = _428 >= 0.0;
    bool _484 = isnan(_428);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _492;
    float _496 = in.m_73.x;
    float _498 = in.m_73.y;
    float _500 = in.m_73.z;
    if (_404)
    {
        bool _502 = _406 > 0.5;
        _444 = _502;
    }
    bool _504 = _444;
    int _506 = _490 ? 0 : 1;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _514 = _512 != 0;
    int _516 = ~_506;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    int _522 = _520;
    if (_404)
    {
        float _524 = _504 ? as_type<float>(_454) : _408;
        _468 = _524;
    }
    float _526 = _468;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _538 = _536 != 0;
    if (!_480)
    {
        int _540 = ~_506;
        int _542 = _540 + 1;
        _522 = _542;
    }
    int _544 = _522;
    float _546 = 0.0;
    if (_510)
    {
        float _548 = in.m_65.z;
        _546 = _548;
    }
    float _550 = _546;
    bool _552 = _458 >= 0.0;
    bool _554 = isnan(_458);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _568 = _560 ? 0 : 1;
    float _570 = _348 * _500;
    bool _572 = _458 > 0.0;
    float _574 = _346 * _498;
    float _576 = _344 * _496;
    float _578 = 1.0 / _566;
    float _580 = in.m_75.x;
    float _582 = in.m_75.y;
    float _584 = in.m_75.z;
    float _586 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _590 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].x, _562);
    int _592 = ~_568;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _602 = _596;
    bool _604 = _572;
    if (!_572)
    {
        int _606 = ~_568;
        int _608 = _606 + 1;
        _602 = _608;
    }
    int _610 = _602;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _614 = _400 * 2.0;
    float _616 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _624 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].x, _588);
    float _626 = floor(_614);
    float _628 = _494 * _578;
    float _630 = _400 + _382;
    out.m_77.x = _616;
    out.m_77.y = _618;
    out.m_77.z = _620;
    float _632 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _630 + (-1.0);
    if (_510)
    {
        bool _636 = _550 > 0.5;
        _604 = _636;
    }
    bool _638 = _604;
    float _640 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _642 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _622);
    bool _644 = !_530;
    int _646 = _644 ? 0 : 1;
    int _648 = 0;
    if (_510)
    {
        float _650 = -_408;
        float _652 = _650 + 1.0;
        _648 = as_type<int>(_652);
    }
    int _654 = _648;
    bool _656 = !_538;
    int _658 = _656 ? 0 : 1;
    float _660 = _406 + _382;
    float _662 = _406 + _400;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _580);
    bool _666 = _626 > 0.0;
    float _668 = _660 + (-1.0);
    float _670 = _662 + (-1.0);
    float _672 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _674 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _676 = !_534;
    int _678 = _676 ? 0 : 1;
    float _680 = _664 * _632;
    bool _682 = _626 >= 0.0;
    bool _684 = isnan(_626);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.0);
    bool _690 = _686 || _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    bool _696 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _582);
    float _708 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = 1.0 / _694;
    float _714 = _704 ? _466 : 0.0;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _584);
    float _718 = _706 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _722 = _380 + _720;
    bool _724 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(1.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = _716 * _640;
    float _736 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _590);
    float _738 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _624);
    float _740 = fma(_628, _722, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _742 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _744 = isnan(_380);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = in.m_79.x;
    float _756 = in.m_79.y;
    float _758 = in.m_79.z;
    int _760 = abs(_678);
    float _762 = _406 + (-0.5);
    bool _764 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _766 = isnan(_380);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_752;
    float _778 = _776 + 1.0;
    float _780 = float(_760);
    float _782 = _382 + (-0.5);
    float _784 = _782;
    if (_732)
    {
        float _786 = _714 * _712;
        _162 = _786;
    }
    float _788 = _162;
    int _790 = abs(_646);
    float _792 = _774 * _778;
    float _794 = float(_610);
    float _796 = -_774;
    float _798 = _796 + 1.0;
    int _800 = abs(_658);
    float _802 = _736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _804 = float(_790);
    float _806 = _780 * _794;
    float _808 = float(_544);
    float _810 = _740 * _792;
    int _812 = _690 ? 0 : 1;
    float _814 = _400 + (-0.5);
    float _816 = _806 * (-2.0);
    int _818 = ~_812;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = _804 * _808;
    int _826 = _822;
    int _828 = as_type<int>(_816);
    float _830 = _810;
    if (!_666)
    {
        int _832 = ~_812;
        int _834 = _832 + 1;
        _826 = _834;
    }
    int _836 = _826;
    float _838 = fma(_816, _756, _756);
    float _840 = float(_800);
    float _842 = fma(_672, _816, _672);
    float _844 = float(_836);
    float _846 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _848 = _824 * (-2.0);
    if (!_510)
    {
        _446 = _408;
    }
    float _850 = _446;
    float _852 = _850;
    if (_514)
    {
        float _854 = -_408;
        float _856 = _854 + 1.0;
        _828 = as_type<int>(_856);
    }
    int _858 = _828;
    float _860 = _840 * _844;
    float _862 = fma(_842, _788, _846);
    float _864 = fma(_710, _848, _710);
    float _866 = fma(_848, _754, _754);
    float _868 = in.m_81.x;
    float _870 = in.m_81.y;
    float _872 = in.m_81.z;
    if (_510)
    {
        float _874 = _638 ? as_type<float>(_654) : _408;
        _852 = _874;
    }
    float _876 = _852;
    float _878 = _860 * (-2.0);
    bool _880 = _582 != 0.0;
    bool _882 = isnan(_582);
    bool _884 = _880 || _882;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    float _890 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _866);
    float _892 = _862 * 0.15915493667125701904296875;
    float _894 = fma(_674, _878, _674);
    bool _896 = _580 == 0.0;
    bool _898 = !_888;
    bool _900 = _896 && _898;
    float _902 = fma(_878, _758, _758);
    float _904 = fma(_864, _788, _890);
    float _906 = _892 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = in.m_83.x;
    float _912 = in.m_83.y;
    float _914 = in.m_83.z;
    float _916 = in.m_83.w;
    bool _918 = _584 == 0.0;
    bool _920 = _918 && _900;
    float _922 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[196].z, _902);
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _922;
    if (!_514)
    {
        _784 = _408;
    }
    float _928 = _784;
    float _930 = fma(_894, _788, _922);
    float _932 = _892 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[115].x, _810);
    float _938 = _928;
    float _940 = _930;
    if (_514)
    {
        float _942 = _430 ? as_type<float>(_858) : _408;
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[116].x, _936);
    float _948 = _868;
    if (_920)
    {
        _926 = _868;
    }
    float _950 = _926;
    float _952 = _924 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _930 * 0.15915493667125701904296875;
    float _958 = _950;
    if (_920)
    {
        _940 = _870;
    }
    float _960 = _940;
    float _962 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _964 = _960;
    if (_920)
    {
        _448 = _950;
    }
    float _966 = _448;
    float _968 = _966;
    if (_920)
    {
        _830 = _960;
    }
    float _970 = _830;
    float _972 = _956 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _970;
    if (!_920)
    {
        _964 = _870;
    }
    float _978 = _964;
    if (!_920)
    {
        _958 = _868;
    }
    float _980 = _958;
    if (_920)
    {
        _948 = _872;
    }
    float _982 = _948;
    float _984 = _910 * _978;
    float _986 = _982;
    if (!_920)
    {
        float _988 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, _978);
        _976 = _988;
    }
    float _990 = _976;
    float _992 = _924 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = _914 * _980;
    if (!_920)
    {
        float _998 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _980);
        _968 = _998;
    }
    float _1000 = _968;
    float _1002 = -_984;
    float _1004 = fma(_912, _980, _1002);
    float _1006 = _954 * _934;
    float _1008 = _954 * _908;
    float _1010 = -_996;
    float _1012 = fma(_910, _872, _1010);
    float _1014 = _912 * _872;
    float _1016 = _956 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _954 * _974;
    float _1022 = _934 * _974;
    if (!_920)
    {
        float _1024 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[17].y, _872);
        _986 = _1024;
    }
    float _1026 = _986;
    float _1028 = -_1014;
    float _1030 = fma(_914, _978, _1028);
    float _1032 = _1020 * _718;
    float _1034 = _1004 * _916;
    float _1036 = _994 * _908;
    float _1038 = _994 * _934;
    float _1040 = _994 * _974;
    float _1042 = _908 * _974;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1046 = _1040 * _718;
    float _1048 = fma(_1018, _1006, _1036);
    float _1050 = -_1008;
    float _1052 = fma(_1018, _1038, _1050);
    float _1054 = -_1038;
    float _1056 = fma(_1018, _1008, _1054);
    float _1058 = -_718;
    float _1060 = _1018 * _1058;
    float _1062 = fma(_1048, _680, _1032);
    float _1064 = fma(_1018, _1036, _1006);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = fma(_1022, _680, _1060);
    float _1070 = fma(_1056, _734, _1062);
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1074 = fma(_1052, _680, _1046);
    float _1076 = fma(_1042, _734, _1068);
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1080 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1082 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1090 = fma(_1064, _734, _1074);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1078);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1080);
    out.m_85.x = _1082;
    out.m_85.y = _1084;
    out.m_85.z = _1086;
    out.m_85.w = _962;
    float _1096 = _738 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1098 = _1012 * _916;
    float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1094);
    float _1102 = _1030 * _916;
    float _1104 = -_990;
    float _1106 = _1018 * _1104;
    float _1108 = -_912;
    float _1110 = _1018 * _1108;
    float _1112 = _1096 + _1100;
    float _1114 = -_1098;
    float _1116 = _1018 * _1114;
    float _1118 = _1020 * _912;
    float _1120 = _1040 * _912;
    float _1122 = _1020 * _990;
    float _1124 = fma(_1022, _1102, _1116);
    float _1126 = _1020 * _1098;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1092);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1112 + _1130;
    float _1134 = fma(_1022, _910, _1110);
    float _1136 = fma(_1052, _910, _1120);
    float _1138 = _1088 + _1128;
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1022, _1000, _1106);
    float _1144 = _1040 * _990;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1138 + _1146;
    float _1150 = _1040 * _1098;
    float _1152 = fma(_1048, _1000, _1122);
    float _1154 = fma(_1052, _1000, _1144);
    float _1156 = _1148 * _1148;
    float _1158 = fma(_1048, _910, _1118);
    float _1160 = fma(_1048, _1102, _1126);
    float _1162 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1164 = _1156 + _1140;
    float _1166 = fma(_1052, _1102, _1150);
    float _1168 = fma(_1042, _1026, _1142);
    float _1170 = fma(_1056, _1026, _1152);
    float _1172 = sqrt(_1164);
    float _1174 = fma(_1064, _1026, _1154);
    float _1176 = fma(_1042, _914, _1134);
    float _1178 = fma(_1056, _914, _1158);
    float _1180 = fma(_1064, _914, _1136);
    float _1182 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1162);
    float _1184 = fma(_1042, _1034, _1124);
    float _1186 = fma(_1056, _1034, _1160);
    float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1190 = fma(_1064, _1034, _1166);
    float _1192 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1194 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1196 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1198 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1200 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1192);
    float _1202 = _802 + _1194;
    bool _1204 = _1172 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1196);
    float _1210 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1198);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1214 = _1198;
    float _1216 = _1196;
    float _1218 = _1156;
    float _1220 = _1140;
    float _1222 = _1138;
    float _1224 = _1160;
    float _1226 = _1124;
    float _1228 = _1120;
    float _1230 = _1136;
    float _1232 = _1088;
    if (!_1204)
    {
        _1214 = _1112;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    if (!_1204)
    {
        _1216 = _1202;
    }
    float _1238 = _1216;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _1242 = !_1204;
    float _1244 = _1238;
    float _1246 = _1212;
    if (!_1242)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1252 = _1172 + _1250;
        float _1254 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = rsqrt(_1164);
        float _1258 = _1252 * _1248;
        float _1260 = _1258 * 0.15915493667125701904296875;
        float _1262 = _1260 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1260 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = fma(_1264, _1254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1272 = _1256 * _1270;
        float _1274 = fma(_1148, _1272, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = _1268 + (-1.0);
        float _1278 = fma(_1132, _1272, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1282 = _1274 + _1280;
        float _1284 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1288 = _1278 + _1286;
        float _1290 = _1282 * _1282;
        float _1292 = fma(_1202, _1268, _1284);
        float _1294 = _1288 * _1288;
        _1244 = _1292;
        _1218 = _1290;
        _1220 = _1294;
        _1222 = _1274;
        _1236 = _1278;
    }
    float _1296 = _1244;
    float _1298 = _1218;
    float _1300 = _1220;
    float _1302 = _1222;
    float _1304 = _1236;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1308 = _1296 + _1306;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1312 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1314 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1316 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1318 = fma(_1308, _1308, _1298);
    float _1320 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1312);
    float _1322 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1314);
    float _1324 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1316);
    float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1328 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1330 = _1318 + _1300;
    float _1332 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1334 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1336 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1328);
    float _1338 = _472 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1340 = _944 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1342 = _462 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1344 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1320);
    float _1346 = _526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1348 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1350 = sqrt(_1330);
    float _1352 = _434 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1354 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1332);
    float _1356 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1334);
    float _1358 = _1340 * _1240;
    float _1360 = _1342 * _1206;
    float _1362 = _1346 * _1188;
    float _1364 = _1348 * _1212;
    float _1366 = _1352 * _1310;
    float _1368 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1336);
    float _1370 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1354);
    float _1372 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1208);
    float _1374 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1376 = _1338 * _1326;
    float _1378 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1322);
    float _1380 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1356);
    float _1384 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1210);
    out.m_87.x = _1362;
    out.m_87.y = _1360;
    out.m_87.z = _1364;
    out.m_87.w = _1376;
    bool _1386 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1388 = isnan(_1350);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1394 = _1390 || _1392;
    out.m_89.x = _1358;
    out.m_89.y = _1366;
    out.m_91.x = _1344;
    out.m_91.y = _1378;
    out.m_91.z = _1380;
    out.m_93.x = _1368;
    out.m_93.y = _1370;
    out.m_93.z = _1382;
    if (!_1394)
    {
        _1246 = 1.0;
    }
    float _1396 = _1246;
    out.m_95.x = _1372;
    out.m_95.y = _1374;
    out.m_95.z = _1384;
    bool _1398 = !_1394;
    float _1400 = _1396;
    if (!_1398)
    {
        bool _1402 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1404 = isnan(_1350);
        bool _1406 = _1402 || _1404;
        bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1410 = _1406 || _1408;
        if (!_1410)
        {
            float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1414 = _1350 + _1412;
            float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1418 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1416;
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1424 = 1.0 / _1418;
            float _1426 = _1414 * _1424;
            float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1400 = _1428;
            _1430 = true;
        }
        else
        {
            bool _1432 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1434 = isnan(_1350);
            bool _1436 = _1432 || _1434;
            bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1440 = _1436 || _1438;
            if (!_1440)
            {
                float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1444 = _1350 + _1442;
                float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1448 = _1446 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1454 = 1.0 / _1448;
                float _1456 = _1444 * _1454;
                float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1400 = _1458;
                _1430 = true;
            }
            else
            {
                _1400 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1430 = false;
    float _1460 = _1400;
    float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1464 = _1296 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1468 = _1302 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1472 = _1304 + _1470;
    float _1474 = _802 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1476 = fma(_1464, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1478 = fma(_1468, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1480 = fma(_1472, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1482 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1474);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1486 = _1476 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1490 = _1478 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1480 + _1492;
    float _1496 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1482);
    float _1498 = _1486 * _1486;
    float _1500 = _802 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1502 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = fma(_1490, _1490, _1498);
    float _1506 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1500);
    float _1508 = 1.0 / _1502;
    float _1510 = fma(_1494, _1494, _1504);
    float _1512 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1506);
    float _1514 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1516 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1518 = rsqrt(_1510);
    float _1520 = _802 + _1514;
    float _1522 = _1516 + _1502;
    float _1524 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1528 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1530 = _1522 * _1508;
    float _1532 = _1530 * 0.5;
    float _1534 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1526);
    float _1536 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1528);
    float _1538 = floor(_1524);
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1542 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1540);
    float _1544 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1534);
    float _1546 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1536);
    float _1548 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1544 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1552 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1554 = 1.0 / _1542;
    float _1556 = _1490 * _1548;
    float _1558 = _1494 * _1548;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = trunc(_1550);
    int _1566 = int(_1564);
    float _1568 = -_1538;
    float _1570 = _1524 + _1568;
    float _1572 = _1560 + _1562;
    float _1574 = sqrt(_1572);
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1578 = _1554 * _1576;
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1582 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1584 = trunc(_1552);
    int _1586 = int(_1584);
    int _1588 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1590 = _1566 + _1588;
    int _1592 = _1590 + 1;
    bool _1594 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1574 + _1596;
    float _1600 = sqrt(_1510);
    int _1602 = 2;
    float _1604 = _1572;
    float _1606 = _1598;
    float _1608 = _1548;
    float _1610 = _1556;
    float _1612 = _1560;
    if (!_1580)
    {
        _1602 = 1;
    }
    int _1614 = _1602;
    int _1616 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1618 = _1586 + _1616;
    int _1620 = _1618 + 1;
    float _1622 = _1502;
    int _1624 = _1614;
    if (_1594)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1626;
    }
    float _1628 = _1622;
    if (_1594)
    {
        float _1630 = rsqrt(_1572);
        _1604 = _1630;
    }
    float _1632 = _1604;
    float _1634 = _1632;
    if (_1594)
    {
        float _1636 = _1598 * _1628;
        _1606 = _1636;
    }
    float _1638 = _1606;
    if (_1594)
    {
        float _1640 = _1638 * 0.15915493667125701904296875;
        _1224 = _1640;
    }
    float _1642 = _1224;
    bool _1644 = !_1580;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1544;
    if (_1594)
    {
        float _1652 = _1642 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    if (!_1582)
    {
        _1624 = _1646;
    }
    int _1658 = _1624;
    float _1660 = precise::max(0.0, _1648);
    int _1662 = _1658 << 6;
    bool _1664 = _1592 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1666 = -_1548;
    float _1668 = -_1660;
    float _1670 = fma(_1486, _1666, _1668);
    int _1672 = _1662 + 96;
    uint _1675 = uint(int(uint(_1672) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
    int _1691 = _1592 | _1620;
    float _1693 = _1642;
    float _1695 = as_type<float>(_1691);
    float _1697 = _1670;
    if (_1594)
    {
        float _1699 = _1642 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        _1693 = _1701;
    }
    float _1703 = _1693;
    if (_1594)
    {
        float _1705 = _1670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1705;
    }
    float _1707 = _1608;
    bool _1709 = _1691 < 0;
    bool _1711 = _1709 || _1664;
    if (_1594)
    {
        float _1713 = fma(_1656, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1695 = _1713;
    }
    float _1715 = _1695;
    int _1717 = _1662 + 48;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    float _1735 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1594)
    {
        float _1739 = _1632 * _1715;
        _1226 = _1739;
    }
    float _1741 = _1226;
    bool _1743 = _1620 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1745 = _1743 || _1711;
    float _1747 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1749 = floor(_1737);
    if (_1594)
    {
        float _1751 = _1556 * _1741;
        _1610 = _1751;
    }
    float _1753 = _1610;
    int _1755 = _1662 + 104;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
    int _1761 = int(_1757) & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = int(_1757) + 1;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    int _1769 = _1765 & 3;
    float _1771 = (*spvDescriptorSet0.vp_c15)._m0[int(_1767)][_1769];
    float _1773 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1775 = _1703;
    if (_1594)
    {
        float _1777 = _1703 + (-1.0);
        _1634 = _1777;
    }
    float _1779 = _1634;
    float _1781 = _1779;
    if (_1594)
    {
        float _1783 = _1753 * _1753;
        _1612 = _1783;
    }
    float _1785 = _1612;
    if (_1594)
    {
        float _1787 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1787;
    }
    float _1789 = _1228;
    if (!_1594)
    {
        _1781 = _1558;
    }
    float _1791 = _1781;
    int _1793 = _1662 + 64;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    int _1803 = int(_1795) + 1;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    int _1807 = _1803 & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    float _1811 = _1791;
    if (_1594)
    {
        float _1813 = _1558 * _1741;
        _1811 = _1813;
    }
    float _1815 = _1811;
    if (_1594)
    {
        float _1817 = fma(_1670, _1703, _1789);
        _1697 = _1817;
    }
    float _1819 = _1697;
    float _1821 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1594)
    {
        _1775 = _1562;
    }
    float _1823 = _1775;
    float _1825 = _1823;
    if (_1594)
    {
        float _1827 = _1815 * _1815;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = fma(_1819, _1819, _1785);
    float _1833 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1835 = _1662 + 80;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    uint _1839 = uint(int(uint(int(_1837)) >> uint(2)));
    int _1841 = int(_1837) & 3;
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[int(_1839)][_1841];
    int _1845 = int(_1837) + 1;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    int _1849 = _1845 & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    float _1853 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1855 = _1831 + _1829;
    int _1857 = as_type<int>(_1853);
    if (!_1745)
    {
        float _1859 = floor(_1552);
        _1230 = _1859;
    }
    float _1861 = _1230;
    float _1863 = -_1749;
    float _1865 = _1737 + _1863;
    float _1867 = -_1853;
    float _1869 = fma(_1867, _1833, 1.0);
    if (!_1745)
    {
        int _1871 = _1620 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1873 = _1871 + _1592;
        _1857 = _1873;
    }
    int _1875 = _1857;
    int _1877 = _1662 + 56;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = log2(_1869);
    int _1897 = _1662 + 88;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
    int _1903 = int(_1899) & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    int _1907 = int(_1899) + 1;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    int _1911 = _1907 & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    float _1915 = _1520 * _1689;
    float _1917 = fma(_1088, _1681, _1915);
    int _1919 = _1662 + 72;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    uint _1923 = uint(int(uint(int(_1921)) >> uint(2)));
    int _1925 = int(_1921) & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    int _1929 = int(_1921) + 1;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    int _1933 = _1929 & 3;
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[int(_1931)][_1933];
    float _1937 = _1520 * _1733;
    float _1939 = rsqrt(_1855);
    float _1941 = _1895 * 0.693147182464599609375;
    float _1943 = fma(_1088, _1725, _1937);
    int _1945 = as_type<int>(_1937);
    int _1947 = as_type<int>(_1681);
    if (!_1745)
    {
        int _1949 = _1875 << 2;
        _1945 = _1949;
    }
    int _1951 = _1945;
    float _1953 = fma(_1096, _1763, _1917);
    int _1955 = _1951;
    float _1957 = _1809;
    int _1959 = as_type<int>(_1851);
    if (!_1745)
    {
        int _1961 = 12 & _1951;
        _1955 = _1961;
    }
    int _1963 = _1955;
    float _1965 = _1953 + _1771;
    float2 _5848 = float2(_1570, _1865);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5848, float2(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5848, float2(0.0), isnan(_5848)), level(0.0)).x;
    float _1969 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1971 = _1520 * _1809;
    if (!_1745)
    {
        float _1973 = -_1861;
        float _1975 = _1552 + _1973;
        _1957 = _1975;
    }
    float _1977 = _1957;
    float _1979 = 1.0 / _1965;
    float _1981 = _1939 * _1753;
    float _1983 = fma(_1088, _1801, _1971);
    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1987 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1985);
    float _1989 = precise::clamp(_1987, 0.0, 1.0);
    float _1991 = _1939 * _1819;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1995 = _1520 * _1851;
    if (!_1745)
    {
        uint _1997 = uint(int(uint(_1875) >> uint(2)));
        _1959 = int(_1997);
    }
    int _1999 = _1959;
    float _2001 = _1939 * _1815;
    float _2003 = fma(_1088, _1843, _1995);
    float _2005 = -_1989;
    float _2007 = _2005 + 1.0;
    if (!_1745)
    {
        int _2009 = _1999 << 4;
        int _2011 = _2009 + _1963;
        _1947 = _2011;
    }
    int _2013 = _1947;
    float _2015 = fma(_1096, _1885, _1943);
    float _2017 = abs(_2007);
    float _2019 = log2(_2017);
    float _2021 = _2015 + _1893;
    float _2023 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = fma(_1096, _1905, _2003);
    float _2027 = -_1993;
    float _2029 = fma(_1991, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2027);
    float _2031 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2023);
    float _2035 = -_2001;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2029);
    float _2039 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2041 = _2021 * _1979;
    float _2043 = fma(_1096, _1927, _1983);
    float _2045 = fma(_2037, -0.5, 0.5);
    float _2047 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2039);
    float _2049 = fma(_2037, 0.5, 0.5);
    float _2051 = _2043 + _1935;
    float _2053 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2055 = _2041 >= 0.0;
    float _2057 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2059 = _2051 * _1979;
    float _2061 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2053);
    bool _2063 = _2041 <= 1.0;
    bool _2065 = _2063 && _2055;
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2071 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2061);
    bool _2073 = _2059 >= 0.0;
    bool _2075 = _2073 && _2065;
    float _2077 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2079 = exp2(_2069);
    float _2081 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2083 = _2059 <= 1.0;
    bool _2085 = _2083 && _2075;
    float _2087 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2089 = _1983;
    float _2091 = as_type<float>(_2013);
    if (!_1745)
    {
        int _2093 = _2013 + 400;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        _2089 = _2101;
    }
    float _2103 = _2089;
    float _2105 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2077);
    float _2107 = _2025 + _1913;
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = sqrt(_2045);
    float _2113 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2105);
    float _2115 = _1991 + 1.0;
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = _2107 * _1979;
    float _2121 = fma(_2049, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2123 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    float _2125 = _2123;
    if (_2085)
    {
        float _2127 = float(_1658);
        _2091 = _2127;
    }
    float _2129 = _2091;
    float _2131 = -_1991;
    float _2133 = fma(_2079, _2115, _2131);
    float _2135 = fma(_2049, _2121, -0.212114393711090087890625);
    float _2137 = 1.0 / _2123;
    float _2139 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2141 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2143 = fma(_2049, _2135, 1.570728778839111328125);
    float _2145 = fma(_2133, 0.5, 0.5);
    float _2147 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2139);
    float _2149 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2141);
    float _2151 = _2111 * 0.636619746685028076171875;
    float _2153 = _2129;
    float _2155 = _2147;
    if (_2085)
    {
        float _2157 = rint(_2129);
        float _2159 = precise::max(_2157, 0.0);
        uint _2161 = uint(_2159);
        uint _2163 = clamp(_2161, 0u, 65535u);
        _2153 = as_type<float>(_2163);
    }
    float _2165 = _2153;
    float _2167 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2147);
    float _2169 = -_2143;
    float _2171 = fma(_2151, _2169, 1.0);
    float _2173 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2175 = _2047;
    float _2177 = _2173;
    if (!_1745)
    {
        float _2179 = floor(_1550);
        _2175 = _2179;
    }
    float _2181 = _2175;
    float _2183 = _2149 * _2137;
    float _2185 = _2173 * _2137;
    float _2187 = fma(_2183, 0.5, 0.5);
    float _2189 = fma(_2185, -0.5, 0.5);
    float _2191 = _2165;
    if (_2085)
    {
        float3 _6238 = float3(_2041, _2059, float(as_type<int>(_2165)));
        float3 _6242 = select(_6238, float3(0.0), isnan(_6238));
        float _2193 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6242.xy, uint(rint(_6242.z)), _2119, level(0.0));
        _2191 = _2193;
    }
    float _2195 = _2191;
    float3 _6252 = float3(_2187, _2189, _1969);
    float _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6252, float3(0.0), isnan(_6252)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6252, float3(0.0), isnan(_6252)), level(0.0)).x;
    if (!_1745)
    {
        float _2199 = -_2181;
        float _2201 = _1550 + _2199;
        _2155 = _2201;
    }
    float _2203 = _2155;
    float _2205 = _2185;
    float _2207 = _2203;
    if (!_1745)
    {
        float _2209 = rint(_2103);
        float _2211 = precise::max(_2209, 0.0);
        uint _2213 = uint(_2211);
        uint _2215 = clamp(_2213, 0u, 65535u);
        _2205 = as_type<float>(_2215);
    }
    float _2217 = _2205;
    float3 _6289 = float3(_2187, _2189, _1969);
    float4 _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6289, float3(0.0), isnan(_6289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6289, float3(0.0), isnan(_6289)), level(0.0)).xyzw;
    float _2222 = _2220.x;
    float _2224 = _2220.y;
    float _2226 = _2220.z;
    float _2228 = _2220.w;
    float2 _6305 = float2(_2171, _2145);
    float3 _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6305, float2(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6305, float2(0.0), isnan(_6305)), level(0.0)).xyz;
    float _2234 = _2232.x;
    float _2236 = _2232.y;
    float _2238 = _2232.z;
    float _2240 = _2217;
    if (!_1745)
    {
        float3 _6326 = float3(_2203, _1977, float(as_type<int>(_2217)));
        float3 _6328 = select(_6326, float3(0.0), isnan(_6326));
        float _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6328.xy, uint(rint(_6328.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6328.xy, uint(rint(_6328.z)), level(0.0)).x;
        _2240 = _2242;
    }
    float _2244 = _2240;
    float _2246 = abs(_1578);
    float _2248 = log2(_2246);
    float _2250 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2252 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2250);
    float _2254 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2252);
    float _2256 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2258 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2254);
    bool _2260 = _1578 <= 8000.0;
    bool _2262 = isnan(_1578);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan(8000.0);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2274 = _2258 + _2123;
    float _2276 = exp2(_2256);
    if (!_2085)
    {
        _2207 = 1.0;
    }
    float _2278 = _2207;
    float _2280 = _2274 * 0.5;
    float _2282 = exp2(_2272);
    out.m_97.z = _2280;
    out.m_97.w = _2123;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2286 = precise::clamp(_2284, 0.0, 1.0);
    float _2288 = fma(_2286, -2.0, 3.0);
    float _2290 = _2286 * _2286;
    float _2292 = _2290 * _2288;
    float _2294 = -_2292;
    float _2296 = _2294 + 1.0;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2258;
    out.gl_Position.w = _2123;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2292);
    float _2300 = _2270 * _2298;
    float _2302 = -_2276;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2310 = _2149;
    float _2312 = _2278;
    float _2314 = _2306;
    if (_1745)
    {
        _2310 = 1.0;
    }
    float _2316 = _2310;
    float _2318 = -_1967;
    float _2320 = _2318 + 1.0;
    float _2322 = _2320 * _2306;
    float _2324 = precise::clamp(_2322, 0.0, 1.0);
    float _2326 = _2316;
    if (_2085)
    {
        bool _2328 = _2195 >= _2119;
        bool _2330 = isnan(_2195);
        bool _2332 = _2328 || _2330;
        bool _2334 = isnan(_2119);
        bool _2336 = _2332 || _2334;
        float _2338 = float(_2336);
        _2312 = _2338;
    }
    float _2340 = _2312;
    if (!_1745)
    {
        int _2342 = _1875 << 4;
        int _2344 = _2342 + 2048;
        uint _2346 = uint(int(uint(_2344) >> uint(2)));
        uint _2348 = uint(int(uint(int(_2346)) >> uint(2)));
        int _2350 = int(_2346) & 3;
        float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
        int _2354 = int(_2346) + 1;
        uint _2356 = uint(int(uint(_2354) >> uint(2)));
        int _2358 = _2354 & 3;
        float _2360 = (*spvDescriptorSet0.vp_c15)._m0[int(_2356)][_2358];
        int _2362 = _2344 + 8;
        uint _2364 = uint(int(uint(_2362) >> uint(2)));
        uint _2366 = uint(int(uint(int(_2364)) >> uint(2)));
        int _2368 = int(_2364) & 3;
        float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
        int _2372 = int(_2364) + 1;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        int _2376 = _2372 & 3;
        float _2378 = (*spvDescriptorSet0.vp_c15)._m0[int(_2374)][_2376];
        float _2380 = _1520 * _2360;
        float _2382 = fma(_1088, _2352, _2380);
        float _2384 = fma(_1096, _2370, _2382);
        float _2386 = _2384 + _2378;
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = -_2388;
        float _2392 = _2390 + _2244;
        float _2394 = fma(_2392, 500.0, 1.5);
        float _2396 = exp2(_2394);
        float _2398 = 0.0 + _2396;
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        _2326 = _2400;
        _2177 = _2396;
        _2125 = _2378;
    }
    float _2402 = _2326;
    float _2404 = _2177;
    float _2406 = _2125;
    float _2408 = _2308 * _2197;
    float _2410 = _2340 * _2402;
    float _2412 = -_2324;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2416 = -_2308;
    float _2418 = _2416 + 1.0;
    float _2420 = _2228 * _2408;
    float _2422 = _2238 * _2408;
    float _2424 = -_2410;
    float _2426 = fma(_2424, _2414, 1.0);
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = _2228 * _2418;
    float _2432 = fma(_2234, _2420, _2222);
    float _2434 = fma(_2236, _2420, _2224);
    float _2436 = _2428 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2438 = fma(_2228, _2422, _2226);
    bool _2440 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2442 = isnan(_1600);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2448 = _2444 || _2446;
    out.m_99.x = _2436;
    out.m_101.x = _2432;
    out.m_101.y = _2434;
    out.m_101.z = _2438;
    out.m_101.w = _2430;
    float _2450 = _2406;
    float _2452 = _2418;
    float _2454 = _2404;
    float _2456 = _2428;
    if (!_2448)
    {
        _1232 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2458 = _1232;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2448)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2464 = _2314;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2448)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2470 = _2450;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2448)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2476 = _2452;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2448)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2454;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2448)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2456;
    bool _2490 = !_2448;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_1600);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _1600 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2518 = 1.0 / _2512;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2518;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = fma(_2538, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2468 = _2548;
            _2486 = _2552;
            _2462 = _2544;
            _2480 = _2550;
            _2474 = _2546;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_1600);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2460;
            _2462 = _2568;
            if (!_2566)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2466;
            _2468 = _2570;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2472;
            _2474 = _2572;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2478;
            _2480 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_1600);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _1600 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2604 = 1.0 / _2598;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2604;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2630 = fma(_2624, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2468 = _2634;
                    _2486 = _2638;
                    _2462 = _2630;
                    _2480 = _2636;
                    _2474 = _2632;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2468;
    float _2644 = _2486;
    float _2646 = _2462;
    float _2648 = _2480;
    float _2650 = _2474;
    float _2652 = _2494;
    float _2654 = fma(_1374, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_103.x = 0.0;
    float _2684 = -_2682;
    float _2686 = _2674 + _2684;
    float _2688 = -_2682;
    float _2690 = _2672 + _2688;
    float _2692 = -_2682;
    float _2694 = _2676 + _2692;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2700 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2702 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    out.m_99.w = _2696;
    out.m_105.x = _2698;
    out.m_105.y = _2700;
    out.m_105.z = _2702;
    if (!_2670)
    {
        return out;
    }
    float _2704 = -_1476;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1478;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1480;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _1374 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_1372, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_1384, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2780;
    out.m_103.y = _2782;
    out.m_103.z = _2784;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
    bool _1430 = false;
    bool _372 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_61.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2841 = as_type<float>(_140);
        out.gl_Position.z = _2841;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_178);
        out.gl_Position.z = _2910;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_65.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _158 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _210 + _212;
    bool _216 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _218 = isnan(_210);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _224 = _220 || _222;
    int _226 = _224 ? 1065353216 : 0;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _210 + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = 1.0 / _234;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _238;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _214 * _240;
    bool _252 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_210);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -as_type<float>(_226);
    float _266 = _264 + 1.0;
    bool _268 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_210);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = fma(_248, _250, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _278 * _266;
    float _284 = -_278;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = _230 * _244;
    float _298 = _262 * _286;
    float _300 = fma(_290, _250, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _302 = fma(_294, _250, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _304 = -_262;
    float _306 = _304 + 1.0;
    float _308 = _280 * _298;
    float _310 = _300 * _298;
    float _312 = _302 * _298;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _308);
    float _330 = fma(_316, _296, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _332 = fma(_320, _296, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _334 = fma(_324, _296, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _336 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _338 = fma(_330, _282, _326);
    float _340 = fma(_332, _282, _328);
    float _342 = fma(_334, _282, _336);
    float _344 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].x, _338);
    float _346 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].y, _340);
    float _348 = fma(as_type<float>(_226), (*spvDescriptorSet0.vp_c9)._m0[145].z, _342);
    bool _350 = !_242;
    int _352 = _226;
    float _370;
    if (!_350)
    {
        float _354 = in.m_65.x;
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _358 = _354 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_124);
        float _376 = 1.0 / _374;
        float _378 = _158 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    float _382 = in.m_65.z;
    float _384 = in.m_65.w;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = in.m_67.y;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _398 = _396 != 0;
    float _400 = in.m_65.y;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _404 = _402 != 0;
    float _406 = in.m_65.x;
    float _408 = in.m_67.x;
    float _410 = _388 * _158;
    float _412 = in.m_69.w;
    float _414 = _382 * 2.0;
    bool _416 = _382 > 0.5;
    float _418 = exp2(_410);
    bool _420 = _384 > 0.5;
    float _422 = -_390;
    float _424 = _422 + 1.0;
    int _426 = _416 ? as_type<int>(_424) : as_type<int>(_390);
    float _428 = floor(_414);
    bool _430 = _400 > 0.5;
    float _432 = _406 * 2.0;
    float _434 = _398 ? as_type<float>(_426) : _390;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _438 = _436 != 0;
    float _440 = _384;
    float _442 = _390;
    bool _444 = _394;
    float _446 = _400;
    float _448 = _408;
    if (_404)
    {
        float _450 = -_408;
        float _452 = _450 + 1.0;
        _352 = as_type<int>(_452);
    }
    int _454 = _352;
    int _456 = _430 ? as_type<int>(_424) : as_type<int>(_390);
    float _458 = floor(_432);
    if (!_404)
    {
        _440 = _408;
    }
    float _460 = _440;
    out.m_71.w = _412;
    float _462 = _438 ? as_type<float>(_456) : _390;
    float _464 = -_418;
    float _466 = _464 + 1.0;
    float _468 = _460;
    if (_394)
    {
        float _470 = _420 ? _424 : _390;
        _442 = _470;
    }
    float _472 = _442;
    float _474 = in.m_58.x;
    float _476 = in.m_58.y;
    float _478 = in.m_58.z;
    bool _480 = _428 > 0.0;
    bool _482 = _428 >= 0.0;
    bool _484 = isnan(_428);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _492;
    float _496 = in.m_73.x;
    float _498 = in.m_73.y;
    float _500 = in.m_73.z;
    if (_404)
    {
        bool _502 = _406 > 0.5;
        _444 = _502;
    }
    bool _504 = _444;
    int _506 = _490 ? 0 : 1;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _514 = _512 != 0;
    int _516 = ~_506;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    int _522 = _520;
    if (_404)
    {
        float _524 = _504 ? as_type<float>(_454) : _408;
        _468 = _524;
    }
    float _526 = _468;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _538 = _536 != 0;
    if (!_480)
    {
        int _540 = ~_506;
        int _542 = _540 + 1;
        _522 = _542;
    }
    int _544 = _522;
    float _546 = 0.0;
    if (_510)
    {
        float _548 = in.m_65.z;
        _546 = _548;
    }
    float _550 = _546;
    bool _552 = _458 >= 0.0;
    bool _554 = isnan(_458);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _568 = _560 ? 0 : 1;
    float _570 = _348 * _500;
    bool _572 = _458 > 0.0;
    float _574 = _346 * _498;
    float _576 = _344 * _496;
    float _578 = 1.0 / _566;
    float _580 = in.m_75.x;
    float _582 = in.m_75.y;
    float _584 = in.m_75.z;
    float _586 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _590 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].x, _562);
    int _592 = ~_568;
    int _594 = _592 + 1;
    int _596 = _594 + 1;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _602 = _596;
    bool _604 = _572;
    if (!_572)
    {
        int _606 = ~_568;
        int _608 = _606 + 1;
        _602 = _608;
    }
    int _610 = _602;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _614 = _400 * 2.0;
    float _616 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _624 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].x, _588);
    float _626 = floor(_614);
    float _628 = _494 * _578;
    float _630 = _400 + _382;
    out.m_77.x = _616;
    out.m_77.y = _618;
    out.m_77.z = _620;
    float _632 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _630 + (-1.0);
    if (_510)
    {
        bool _636 = _550 > 0.5;
        _604 = _636;
    }
    bool _638 = _604;
    float _640 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _642 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _622);
    bool _644 = !_530;
    int _646 = _644 ? 0 : 1;
    int _648 = 0;
    if (_510)
    {
        float _650 = -_408;
        float _652 = _650 + 1.0;
        _648 = as_type<int>(_652);
    }
    int _654 = _648;
    bool _656 = !_538;
    int _658 = _656 ? 0 : 1;
    float _660 = _406 + _382;
    float _662 = _406 + _400;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _580);
    bool _666 = _626 > 0.0;
    float _668 = _660 + (-1.0);
    float _670 = _662 + (-1.0);
    float _672 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _674 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _676 = !_534;
    int _678 = _676 ? 0 : 1;
    float _680 = _664 * _632;
    bool _682 = _626 >= 0.0;
    bool _684 = isnan(_626);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.0);
    bool _690 = _686 || _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    bool _696 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _582);
    float _708 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _710 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _712 = 1.0 / _694;
    float _714 = _704 ? _466 : 0.0;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _584);
    float _718 = _706 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _722 = _380 + _720;
    bool _724 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(1.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = _716 * _640;
    float _736 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _590);
    float _738 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _624);
    float _740 = fma(_628, _722, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _742 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _744 = isnan(_380);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = in.m_79.x;
    float _756 = in.m_79.y;
    float _758 = in.m_79.z;
    int _760 = abs(_678);
    float _762 = _406 + (-0.5);
    bool _764 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _766 = isnan(_380);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -_752;
    float _778 = _776 + 1.0;
    float _780 = float(_760);
    float _782 = _382 + (-0.5);
    float _784 = _782;
    if (_732)
    {
        float _786 = _714 * _712;
        _162 = _786;
    }
    float _788 = _162;
    int _790 = abs(_646);
    float _792 = _774 * _778;
    float _794 = float(_610);
    float _796 = -_774;
    float _798 = _796 + 1.0;
    int _800 = abs(_658);
    float _802 = _736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _804 = float(_790);
    float _806 = _780 * _794;
    float _808 = float(_544);
    float _810 = _740 * _792;
    int _812 = _690 ? 0 : 1;
    float _814 = _400 + (-0.5);
    float _816 = _806 * (-2.0);
    int _818 = ~_812;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = _804 * _808;
    int _826 = _822;
    int _828 = as_type<int>(_816);
    float _830 = _810;
    if (!_666)
    {
        int _832 = ~_812;
        int _834 = _832 + 1;
        _826 = _834;
    }
    int _836 = _826;
    float _838 = fma(_816, _756, _756);
    float _840 = float(_800);
    float _842 = fma(_672, _816, _672);
    float _844 = float(_836);
    float _846 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _848 = _824 * (-2.0);
    if (!_510)
    {
        _446 = _408;
    }
    float _850 = _446;
    float _852 = _850;
    if (_514)
    {
        float _854 = -_408;
        float _856 = _854 + 1.0;
        _828 = as_type<int>(_856);
    }
    int _858 = _828;
    float _860 = _840 * _844;
    float _862 = fma(_842, _788, _846);
    float _864 = fma(_710, _848, _710);
    float _866 = fma(_848, _754, _754);
    float _868 = in.m_81.x;
    float _870 = in.m_81.y;
    float _872 = in.m_81.z;
    if (_510)
    {
        float _874 = _638 ? as_type<float>(_654) : _408;
        _852 = _874;
    }
    float _876 = _852;
    float _878 = _860 * (-2.0);
    bool _880 = _582 != 0.0;
    bool _882 = isnan(_582);
    bool _884 = _880 || _882;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    float _890 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _866);
    float _892 = _862 * 0.15915493667125701904296875;
    float _894 = fma(_674, _878, _674);
    bool _896 = _580 == 0.0;
    bool _898 = !_888;
    bool _900 = _896 && _898;
    float _902 = fma(_878, _758, _758);
    float _904 = fma(_864, _788, _890);
    float _906 = _892 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = in.m_83.x;
    float _912 = in.m_83.y;
    float _914 = in.m_83.z;
    float _916 = in.m_83.w;
    bool _918 = _584 == 0.0;
    bool _920 = _918 && _900;
    float _922 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[196].z, _902);
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _922;
    if (!_514)
    {
        _784 = _408;
    }
    float _928 = _784;
    float _930 = fma(_894, _788, _922);
    float _932 = _892 * 6.283185482025146484375;
    float _934 = cos(_932);
    float _936 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[115].x, _810);
    float _938 = _928;
    float _940 = _930;
    if (_514)
    {
        float _942 = _430 ? as_type<float>(_858) : _408;
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[116].x, _936);
    float _948 = _868;
    if (_920)
    {
        _926 = _868;
    }
    float _950 = _926;
    float _952 = _924 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _930 * 0.15915493667125701904296875;
    float _958 = _950;
    if (_920)
    {
        _940 = _870;
    }
    float _960 = _940;
    float _962 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _964 = _960;
    if (_920)
    {
        _448 = _950;
    }
    float _966 = _448;
    float _968 = _966;
    if (_920)
    {
        _830 = _960;
    }
    float _970 = _830;
    float _972 = _956 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _970;
    if (!_920)
    {
        _964 = _870;
    }
    float _978 = _964;
    if (!_920)
    {
        _958 = _868;
    }
    float _980 = _958;
    if (_920)
    {
        _948 = _872;
    }
    float _982 = _948;
    float _984 = _910 * _978;
    float _986 = _982;
    if (!_920)
    {
        float _988 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[17].y, _978);
        _976 = _988;
    }
    float _990 = _976;
    float _992 = _924 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = _914 * _980;
    if (!_920)
    {
        float _998 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[17].y, _980);
        _968 = _998;
    }
    float _1000 = _968;
    float _1002 = -_984;
    float _1004 = fma(_912, _980, _1002);
    float _1006 = _954 * _934;
    float _1008 = _954 * _908;
    float _1010 = -_996;
    float _1012 = fma(_910, _872, _1010);
    float _1014 = _912 * _872;
    float _1016 = _956 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _954 * _974;
    float _1022 = _934 * _974;
    if (!_920)
    {
        float _1024 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[17].y, _872);
        _986 = _1024;
    }
    float _1026 = _986;
    float _1028 = -_1014;
    float _1030 = fma(_914, _978, _1028);
    float _1032 = _1020 * _718;
    float _1034 = _1004 * _916;
    float _1036 = _994 * _908;
    float _1038 = _994 * _934;
    float _1040 = _994 * _974;
    float _1042 = _908 * _974;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1046 = _1040 * _718;
    float _1048 = fma(_1018, _1006, _1036);
    float _1050 = -_1008;
    float _1052 = fma(_1018, _1038, _1050);
    float _1054 = -_1038;
    float _1056 = fma(_1018, _1008, _1054);
    float _1058 = -_718;
    float _1060 = _1018 * _1058;
    float _1062 = fma(_1048, _680, _1032);
    float _1064 = fma(_1018, _1036, _1006);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = fma(_1022, _680, _1060);
    float _1070 = fma(_1056, _734, _1062);
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1074 = fma(_1052, _680, _1046);
    float _1076 = fma(_1042, _734, _1068);
    float _1078 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1080 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1082 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _642 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1090 = fma(_1064, _734, _1074);
    float _1092 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1078);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1080);
    out.m_85.x = _1082;
    out.m_85.y = _1084;
    out.m_85.z = _1086;
    out.m_85.w = _962;
    float _1096 = _738 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1098 = _1012 * _916;
    float _1100 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1094);
    float _1102 = _1030 * _916;
    float _1104 = -_990;
    float _1106 = _1018 * _1104;
    float _1108 = -_912;
    float _1110 = _1018 * _1108;
    float _1112 = _1096 + _1100;
    float _1114 = -_1098;
    float _1116 = _1018 * _1114;
    float _1118 = _1020 * _912;
    float _1120 = _1040 * _912;
    float _1122 = _1020 * _990;
    float _1124 = fma(_1022, _1102, _1116);
    float _1126 = _1020 * _1098;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1092);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1112 + _1130;
    float _1134 = fma(_1022, _910, _1110);
    float _1136 = fma(_1052, _910, _1120);
    float _1138 = _1088 + _1128;
    float _1140 = _1132 * _1132;
    float _1142 = fma(_1022, _1000, _1106);
    float _1144 = _1040 * _990;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1138 + _1146;
    float _1150 = _1040 * _1098;
    float _1152 = fma(_1048, _1000, _1122);
    float _1154 = fma(_1052, _1000, _1144);
    float _1156 = _1148 * _1148;
    float _1158 = fma(_1048, _910, _1118);
    float _1160 = fma(_1048, _1102, _1126);
    float _1162 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1164 = _1156 + _1140;
    float _1166 = fma(_1052, _1102, _1150);
    float _1168 = fma(_1042, _1026, _1142);
    float _1170 = fma(_1056, _1026, _1152);
    float _1172 = sqrt(_1164);
    float _1174 = fma(_1064, _1026, _1154);
    float _1176 = fma(_1042, _914, _1134);
    float _1178 = fma(_1056, _914, _1158);
    float _1180 = fma(_1064, _914, _1136);
    float _1182 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1162);
    float _1184 = fma(_1042, _1034, _1124);
    float _1186 = fma(_1056, _1034, _1160);
    float _1188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1190 = fma(_1064, _1034, _1166);
    float _1192 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1194 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1196 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1198 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1200 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1192);
    float _1202 = _802 + _1194;
    bool _1204 = _1172 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1196);
    float _1210 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1198);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1214 = _1198;
    float _1216 = _1196;
    float _1218 = _1156;
    float _1220 = _1140;
    float _1222 = _1138;
    float _1224 = _1160;
    float _1226 = _1124;
    float _1228 = _1120;
    float _1230 = _1136;
    float _1232 = _1088;
    if (!_1204)
    {
        _1214 = _1112;
    }
    float _1234 = _1214;
    float _1236 = _1234;
    if (!_1204)
    {
        _1216 = _1202;
    }
    float _1238 = _1216;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _1242 = !_1204;
    float _1244 = _1238;
    float _1246 = _1212;
    if (!_1242)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1252 = _1172 + _1250;
        float _1254 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = rsqrt(_1164);
        float _1258 = _1252 * _1248;
        float _1260 = _1258 * 0.15915493667125701904296875;
        float _1262 = _1260 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1260 * 6.283185482025146484375;
        float _1268 = cos(_1266);
        float _1270 = fma(_1264, _1254, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1272 = _1256 * _1270;
        float _1274 = fma(_1148, _1272, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = _1268 + (-1.0);
        float _1278 = fma(_1132, _1272, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1282 = _1274 + _1280;
        float _1284 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1288 = _1278 + _1286;
        float _1290 = _1282 * _1282;
        float _1292 = fma(_1202, _1268, _1284);
        float _1294 = _1288 * _1288;
        _1244 = _1292;
        _1218 = _1290;
        _1220 = _1294;
        _1222 = _1274;
        _1236 = _1278;
    }
    float _1296 = _1244;
    float _1298 = _1218;
    float _1300 = _1220;
    float _1302 = _1222;
    float _1304 = _1236;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1308 = _1296 + _1306;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1312 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1314 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1316 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1318 = fma(_1308, _1308, _1298);
    float _1320 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1312);
    float _1322 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1314);
    float _1324 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1316);
    float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1328 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1330 = _1318 + _1300;
    float _1332 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1334 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1336 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1328);
    float _1338 = _472 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1340 = _944 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1342 = _462 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1344 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1320);
    float _1346 = _526 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1348 = _876 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1350 = sqrt(_1330);
    float _1352 = _434 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1354 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1332);
    float _1356 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1334);
    float _1358 = _1340 * _1240;
    float _1360 = _1342 * _1206;
    float _1362 = _1346 * _1188;
    float _1364 = _1348 * _1212;
    float _1366 = _1352 * _1310;
    float _1368 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1336);
    float _1370 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1354);
    float _1372 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1208);
    float _1374 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1200);
    float _1376 = _1338 * _1326;
    float _1378 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1322);
    float _1380 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1324);
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1356);
    float _1384 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1210);
    out.m_87.x = _1362;
    out.m_87.y = _1360;
    out.m_87.z = _1364;
    out.m_87.w = _1376;
    bool _1386 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1388 = isnan(_1350);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1394 = _1390 || _1392;
    out.m_89.x = _1358;
    out.m_89.y = _1366;
    out.m_91.x = _1344;
    out.m_91.y = _1378;
    out.m_91.z = _1380;
    out.m_93.x = _1368;
    out.m_93.y = _1370;
    out.m_93.z = _1382;
    if (!_1394)
    {
        _1246 = 1.0;
    }
    float _1396 = _1246;
    out.m_95.x = _1372;
    out.m_95.y = _1374;
    out.m_95.z = _1384;
    bool _1398 = !_1394;
    float _1400 = _1396;
    if (!_1398)
    {
        bool _1402 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1404 = isnan(_1350);
        bool _1406 = _1402 || _1404;
        bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1410 = _1406 || _1408;
        if (!_1410)
        {
            float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1414 = _1350 + _1412;
            float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1418 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1416;
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1424 = 1.0 / _1418;
            float _1426 = _1414 * _1424;
            float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1400 = _1428;
            _1430 = true;
        }
        else
        {
            bool _1432 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1434 = isnan(_1350);
            bool _1436 = _1432 || _1434;
            bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1440 = _1436 || _1438;
            if (!_1440)
            {
                float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1444 = _1350 + _1442;
                float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1448 = _1446 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1454 = 1.0 / _1448;
                float _1456 = _1444 * _1454;
                float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1400 = _1458;
                _1430 = true;
            }
            else
            {
                _1400 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1430 = false;
    float _1460 = _1400;
    float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1464 = _1296 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1468 = _1302 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1472 = _1304 + _1470;
    float _1474 = _802 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1476 = fma(_1464, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1478 = fma(_1468, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1480 = fma(_1472, _1460, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1482 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1474);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1486 = _1476 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1490 = _1478 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1494 = _1480 + _1492;
    float _1496 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1482);
    float _1498 = _1486 * _1486;
    float _1500 = _802 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1502 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = fma(_1490, _1490, _1498);
    float _1506 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1500);
    float _1508 = 1.0 / _1502;
    float _1510 = fma(_1494, _1494, _1504);
    float _1512 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1506);
    float _1514 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1516 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1518 = rsqrt(_1510);
    float _1520 = _802 + _1514;
    float _1522 = _1516 + _1502;
    float _1524 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1528 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1530 = _1522 * _1508;
    float _1532 = _1530 * 0.5;
    float _1534 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1526);
    float _1536 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1528);
    float _1538 = floor(_1524);
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1542 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1540);
    float _1544 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1534);
    float _1546 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1536);
    float _1548 = _1518 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1544 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1552 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1554 = 1.0 / _1542;
    float _1556 = _1490 * _1548;
    float _1558 = _1494 * _1548;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = trunc(_1550);
    int _1566 = int(_1564);
    float _1568 = -_1538;
    float _1570 = _1524 + _1568;
    float _1572 = _1560 + _1562;
    float _1574 = sqrt(_1572);
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1578 = _1554 * _1576;
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1582 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1584 = trunc(_1552);
    int _1586 = int(_1584);
    int _1588 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1590 = _1566 + _1588;
    int _1592 = _1590 + 1;
    bool _1594 = _1574 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1574 + _1596;
    float _1600 = sqrt(_1510);
    int _1602 = 2;
    float _1604 = _1572;
    float _1606 = _1598;
    float _1608 = _1548;
    float _1610 = _1556;
    float _1612 = _1560;
    if (!_1580)
    {
        _1602 = 1;
    }
    int _1614 = _1602;
    int _1616 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1618 = _1586 + _1616;
    int _1620 = _1618 + 1;
    float _1622 = _1502;
    int _1624 = _1614;
    if (_1594)
    {
        float _1626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1626;
    }
    float _1628 = _1622;
    if (_1594)
    {
        float _1630 = rsqrt(_1572);
        _1604 = _1630;
    }
    float _1632 = _1604;
    float _1634 = _1632;
    if (_1594)
    {
        float _1636 = _1598 * _1628;
        _1606 = _1636;
    }
    float _1638 = _1606;
    if (_1594)
    {
        float _1640 = _1638 * 0.15915493667125701904296875;
        _1224 = _1640;
    }
    float _1642 = _1224;
    bool _1644 = !_1580;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1544;
    if (_1594)
    {
        float _1652 = _1642 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    if (!_1582)
    {
        _1624 = _1646;
    }
    int _1658 = _1624;
    float _1660 = precise::max(0.0, _1648);
    int _1662 = _1658 << 6;
    bool _1664 = _1592 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1666 = -_1548;
    float _1668 = -_1660;
    float _1670 = fma(_1486, _1666, _1668);
    int _1672 = _1662 + 96;
    uint _1675 = uint(int(uint(_1672) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.vp_c15)._m0[int(_1685)][_1687];
    int _1691 = _1592 | _1620;
    float _1693 = _1642;
    float _1695 = as_type<float>(_1691);
    float _1697 = _1670;
    if (_1594)
    {
        float _1699 = _1642 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        _1693 = _1701;
    }
    float _1703 = _1693;
    if (_1594)
    {
        float _1705 = _1670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1705;
    }
    float _1707 = _1608;
    bool _1709 = _1691 < 0;
    bool _1711 = _1709 || _1664;
    if (_1594)
    {
        float _1713 = fma(_1656, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1695 = _1713;
    }
    float _1715 = _1695;
    int _1717 = _1662 + 48;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    float _1735 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1737 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_1594)
    {
        float _1739 = _1632 * _1715;
        _1226 = _1739;
    }
    float _1741 = _1226;
    bool _1743 = _1620 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1745 = _1743 || _1711;
    float _1747 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1735);
    float _1749 = floor(_1737);
    if (_1594)
    {
        float _1751 = _1556 * _1741;
        _1610 = _1751;
    }
    float _1753 = _1610;
    int _1755 = _1662 + 104;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
    int _1761 = int(_1757) & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = int(_1757) + 1;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    int _1769 = _1765 & 3;
    float _1771 = (*spvDescriptorSet0.vp_c15)._m0[int(_1767)][_1769];
    float _1773 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1775 = _1703;
    if (_1594)
    {
        float _1777 = _1703 + (-1.0);
        _1634 = _1777;
    }
    float _1779 = _1634;
    float _1781 = _1779;
    if (_1594)
    {
        float _1783 = _1753 * _1753;
        _1612 = _1783;
    }
    float _1785 = _1612;
    if (_1594)
    {
        float _1787 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1787;
    }
    float _1789 = _1228;
    if (!_1594)
    {
        _1781 = _1558;
    }
    float _1791 = _1781;
    int _1793 = _1662 + 64;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    uint _1797 = uint(int(uint(int(_1795)) >> uint(2)));
    int _1799 = int(_1795) & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    int _1803 = int(_1795) + 1;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    int _1807 = _1803 & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    float _1811 = _1791;
    if (_1594)
    {
        float _1813 = _1558 * _1741;
        _1811 = _1813;
    }
    float _1815 = _1811;
    if (_1594)
    {
        float _1817 = fma(_1670, _1703, _1789);
        _1697 = _1817;
    }
    float _1819 = _1697;
    float _1821 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1594)
    {
        _1775 = _1562;
    }
    float _1823 = _1775;
    float _1825 = _1823;
    if (_1594)
    {
        float _1827 = _1815 * _1815;
        _1825 = _1827;
    }
    float _1829 = _1825;
    float _1831 = fma(_1819, _1819, _1785);
    float _1833 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1835 = _1662 + 80;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    uint _1839 = uint(int(uint(int(_1837)) >> uint(2)));
    int _1841 = int(_1837) & 3;
    float _1843 = (*spvDescriptorSet0.vp_c15)._m0[int(_1839)][_1841];
    int _1845 = int(_1837) + 1;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    int _1849 = _1845 & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    float _1853 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1855 = _1831 + _1829;
    int _1857 = as_type<int>(_1853);
    if (!_1745)
    {
        float _1859 = floor(_1552);
        _1230 = _1859;
    }
    float _1861 = _1230;
    float _1863 = -_1749;
    float _1865 = _1737 + _1863;
    float _1867 = -_1853;
    float _1869 = fma(_1867, _1833, 1.0);
    if (!_1745)
    {
        int _1871 = _1620 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1873 = _1871 + _1592;
        _1857 = _1873;
    }
    int _1875 = _1857;
    int _1877 = _1662 + 56;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = log2(_1869);
    int _1897 = _1662 + 88;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    uint _1901 = uint(int(uint(int(_1899)) >> uint(2)));
    int _1903 = int(_1899) & 3;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[int(_1901)][_1903];
    int _1907 = int(_1899) + 1;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    int _1911 = _1907 & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    float _1915 = _1520 * _1689;
    float _1917 = fma(_1088, _1681, _1915);
    int _1919 = _1662 + 72;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    uint _1923 = uint(int(uint(int(_1921)) >> uint(2)));
    int _1925 = int(_1921) & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    int _1929 = int(_1921) + 1;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    int _1933 = _1929 & 3;
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[int(_1931)][_1933];
    float _1937 = _1520 * _1733;
    float _1939 = rsqrt(_1855);
    float _1941 = _1895 * 0.693147182464599609375;
    float _1943 = fma(_1088, _1725, _1937);
    int _1945 = as_type<int>(_1937);
    int _1947 = as_type<int>(_1681);
    if (!_1745)
    {
        int _1949 = _1875 << 2;
        _1945 = _1949;
    }
    int _1951 = _1945;
    float _1953 = fma(_1096, _1763, _1917);
    int _1955 = _1951;
    float _1957 = _1809;
    int _1959 = as_type<int>(_1851);
    if (!_1745)
    {
        int _1961 = 12 & _1951;
        _1955 = _1961;
    }
    int _1963 = _1955;
    float _1965 = _1953 + _1771;
    float2 _5848 = float2(_1570, _1865);
    float _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5848, float2(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5848, float2(0.0), isnan(_5848)), level(0.0)).x;
    float _1969 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1971 = _1520 * _1809;
    if (!_1745)
    {
        float _1973 = -_1861;
        float _1975 = _1552 + _1973;
        _1957 = _1975;
    }
    float _1977 = _1957;
    float _1979 = 1.0 / _1965;
    float _1981 = _1939 * _1753;
    float _1983 = fma(_1088, _1801, _1971);
    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1987 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1985);
    float _1989 = precise::clamp(_1987, 0.0, 1.0);
    float _1991 = _1939 * _1819;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1995 = _1520 * _1851;
    if (!_1745)
    {
        uint _1997 = uint(int(uint(_1875) >> uint(2)));
        _1959 = int(_1997);
    }
    int _1999 = _1959;
    float _2001 = _1939 * _1815;
    float _2003 = fma(_1088, _1843, _1995);
    float _2005 = -_1989;
    float _2007 = _2005 + 1.0;
    if (!_1745)
    {
        int _2009 = _1999 << 4;
        int _2011 = _2009 + _1963;
        _1947 = _2011;
    }
    int _2013 = _1947;
    float _2015 = fma(_1096, _1885, _1943);
    float _2017 = abs(_2007);
    float _2019 = log2(_2017);
    float _2021 = _2015 + _1893;
    float _2023 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = fma(_1096, _1905, _2003);
    float _2027 = -_1993;
    float _2029 = fma(_1991, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2027);
    float _2031 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2033 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2023);
    float _2035 = -_2001;
    float _2037 = fma(_2035, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2029);
    float _2039 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2031);
    float _2041 = _2021 * _1979;
    float _2043 = fma(_1096, _1927, _1983);
    float _2045 = fma(_2037, -0.5, 0.5);
    float _2047 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2039);
    float _2049 = fma(_2037, 0.5, 0.5);
    float _2051 = _2043 + _1935;
    float _2053 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2055 = _2041 >= 0.0;
    float _2057 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2059 = _2051 * _1979;
    float _2061 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2053);
    bool _2063 = _2041 <= 1.0;
    bool _2065 = _2063 && _2055;
    float _2067 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2071 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2061);
    bool _2073 = _2059 >= 0.0;
    bool _2075 = _2073 && _2065;
    float _2077 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2079 = exp2(_2069);
    float _2081 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2083 = _2059 <= 1.0;
    bool _2085 = _2083 && _2075;
    float _2087 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2089 = _1983;
    float _2091 = as_type<float>(_2013);
    if (!_1745)
    {
        int _2093 = _2013 + 400;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
        _2089 = _2101;
    }
    float _2103 = _2089;
    float _2105 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2077);
    float _2107 = _2025 + _1913;
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = sqrt(_2045);
    float _2113 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2105);
    float _2115 = _1991 + 1.0;
    float _2117 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2119 = _2107 * _1979;
    float _2121 = fma(_2049, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2123 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    float _2125 = _2123;
    if (_2085)
    {
        float _2127 = float(_1658);
        _2091 = _2127;
    }
    float _2129 = _2091;
    float _2131 = -_1991;
    float _2133 = fma(_2079, _2115, _2131);
    float _2135 = fma(_2049, _2121, -0.212114393711090087890625);
    float _2137 = 1.0 / _2123;
    float _2139 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2141 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2117);
    float _2143 = fma(_2049, _2135, 1.570728778839111328125);
    float _2145 = fma(_2133, 0.5, 0.5);
    float _2147 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2139);
    float _2149 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2141);
    float _2151 = _2111 * 0.636619746685028076171875;
    float _2153 = _2129;
    float _2155 = _2147;
    if (_2085)
    {
        float _2157 = rint(_2129);
        float _2159 = precise::max(_2157, 0.0);
        uint _2161 = uint(_2159);
        uint _2163 = clamp(_2161, 0u, 65535u);
        _2153 = as_type<float>(_2163);
    }
    float _2165 = _2153;
    float _2167 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2147);
    float _2169 = -_2143;
    float _2171 = fma(_2151, _2169, 1.0);
    float _2173 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2175 = _2047;
    float _2177 = _2173;
    if (!_1745)
    {
        float _2179 = floor(_1550);
        _2175 = _2179;
    }
    float _2181 = _2175;
    float _2183 = _2149 * _2137;
    float _2185 = _2173 * _2137;
    float _2187 = fma(_2183, 0.5, 0.5);
    float _2189 = fma(_2185, -0.5, 0.5);
    float _2191 = _2165;
    if (_2085)
    {
        float3 _6238 = float3(_2041, _2059, float(as_type<int>(_2165)));
        float3 _6242 = select(_6238, float3(0.0), isnan(_6238));
        float _2193 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6242.xy, uint(rint(_6242.z)), _2119, level(0.0));
        _2191 = _2193;
    }
    float _2195 = _2191;
    float3 _6252 = float3(_2187, _2189, _1969);
    float _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6252, float3(0.0), isnan(_6252)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6252, float3(0.0), isnan(_6252)), level(0.0)).x;
    if (!_1745)
    {
        float _2199 = -_2181;
        float _2201 = _1550 + _2199;
        _2155 = _2201;
    }
    float _2203 = _2155;
    float _2205 = _2185;
    float _2207 = _2203;
    if (!_1745)
    {
        float _2209 = rint(_2103);
        float _2211 = precise::max(_2209, 0.0);
        uint _2213 = uint(_2211);
        uint _2215 = clamp(_2213, 0u, 65535u);
        _2205 = as_type<float>(_2215);
    }
    float _2217 = _2205;
    float3 _6289 = float3(_2187, _2189, _1969);
    float4 _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6289, float3(0.0), isnan(_6289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6289, float3(0.0), isnan(_6289)), level(0.0)).xyzw;
    float _2222 = _2220.x;
    float _2224 = _2220.y;
    float _2226 = _2220.z;
    float _2228 = _2220.w;
    float2 _6305 = float2(_2171, _2145);
    float3 _2232 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6305, float2(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6305, float2(0.0), isnan(_6305)), level(0.0)).xyz;
    float _2234 = _2232.x;
    float _2236 = _2232.y;
    float _2238 = _2232.z;
    float _2240 = _2217;
    if (!_1745)
    {
        float3 _6326 = float3(_2203, _1977, float(as_type<int>(_2217)));
        float3 _6328 = select(_6326, float3(0.0), isnan(_6326));
        float _2242 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6328.xy, uint(rint(_6328.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6328.xy, uint(rint(_6328.z)), level(0.0)).x;
        _2240 = _2242;
    }
    float _2244 = _2240;
    float _2246 = abs(_1578);
    float _2248 = log2(_2246);
    float _2250 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2252 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2250);
    float _2254 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2252);
    float _2256 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2258 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2254);
    bool _2260 = _1578 <= 8000.0;
    bool _2262 = isnan(_1578);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan(8000.0);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2274 = _2258 + _2123;
    float _2276 = exp2(_2256);
    if (!_2085)
    {
        _2207 = 1.0;
    }
    float _2278 = _2207;
    float _2280 = _2274 * 0.5;
    float _2282 = exp2(_2272);
    out.m_97.z = _2280;
    out.m_97.w = _2123;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2286 = precise::clamp(_2284, 0.0, 1.0);
    float _2288 = fma(_2286, -2.0, 3.0);
    float _2290 = _2286 * _2286;
    float _2292 = _2290 * _2288;
    float _2294 = -_2292;
    float _2296 = _2294 + 1.0;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2258;
    out.gl_Position.w = _2123;
    float _2298 = fma(_2296, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2292);
    float _2300 = _2270 * _2298;
    float _2302 = -_2276;
    float _2304 = _2302 + 1.0;
    float _2306 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2308 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2310 = _2149;
    float _2312 = _2278;
    float _2314 = _2306;
    if (_1745)
    {
        _2310 = 1.0;
    }
    float _2316 = _2310;
    float _2318 = -_1967;
    float _2320 = _2318 + 1.0;
    float _2322 = _2320 * _2306;
    float _2324 = precise::clamp(_2322, 0.0, 1.0);
    float _2326 = _2316;
    if (_2085)
    {
        bool _2328 = _2195 >= _2119;
        bool _2330 = isnan(_2195);
        bool _2332 = _2328 || _2330;
        bool _2334 = isnan(_2119);
        bool _2336 = _2332 || _2334;
        float _2338 = float(_2336);
        _2312 = _2338;
    }
    float _2340 = _2312;
    if (!_1745)
    {
        int _2342 = _1875 << 4;
        int _2344 = _2342 + 2048;
        uint _2346 = uint(int(uint(_2344) >> uint(2)));
        uint _2348 = uint(int(uint(int(_2346)) >> uint(2)));
        int _2350 = int(_2346) & 3;
        float _2352 = (*spvDescriptorSet0.vp_c15)._m0[int(_2348)][_2350];
        int _2354 = int(_2346) + 1;
        uint _2356 = uint(int(uint(_2354) >> uint(2)));
        int _2358 = _2354 & 3;
        float _2360 = (*spvDescriptorSet0.vp_c15)._m0[int(_2356)][_2358];
        int _2362 = _2344 + 8;
        uint _2364 = uint(int(uint(_2362) >> uint(2)));
        uint _2366 = uint(int(uint(int(_2364)) >> uint(2)));
        int _2368 = int(_2364) & 3;
        float _2370 = (*spvDescriptorSet0.vp_c15)._m0[int(_2366)][_2368];
        int _2372 = int(_2364) + 1;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        int _2376 = _2372 & 3;
        float _2378 = (*spvDescriptorSet0.vp_c15)._m0[int(_2374)][_2376];
        float _2380 = _1520 * _2360;
        float _2382 = fma(_1088, _2352, _2380);
        float _2384 = fma(_1096, _2370, _2382);
        float _2386 = _2384 + _2378;
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = -_2388;
        float _2392 = _2390 + _2244;
        float _2394 = fma(_2392, 500.0, 1.5);
        float _2396 = exp2(_2394);
        float _2398 = 0.0 + _2396;
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        _2326 = _2400;
        _2177 = _2396;
        _2125 = _2378;
    }
    float _2402 = _2326;
    float _2404 = _2177;
    float _2406 = _2125;
    float _2408 = _2308 * _2197;
    float _2410 = _2340 * _2402;
    float _2412 = -_2324;
    float _2414 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2416 = -_2308;
    float _2418 = _2416 + 1.0;
    float _2420 = _2228 * _2408;
    float _2422 = _2238 * _2408;
    float _2424 = -_2410;
    float _2426 = fma(_2424, _2414, 1.0);
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    float _2430 = _2228 * _2418;
    float _2432 = fma(_2234, _2420, _2222);
    float _2434 = fma(_2236, _2420, _2224);
    float _2436 = _2428 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2438 = fma(_2228, _2422, _2226);
    bool _2440 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2442 = isnan(_1600);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2448 = _2444 || _2446;
    out.m_99.x = _2436;
    out.m_101.x = _2432;
    out.m_101.y = _2434;
    out.m_101.z = _2438;
    out.m_101.w = _2430;
    float _2450 = _2406;
    float _2452 = _2418;
    float _2454 = _2404;
    float _2456 = _2428;
    if (!_2448)
    {
        _1232 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2458 = _1232;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2448)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2464 = _2314;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2448)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2470 = _2450;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2448)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2476 = _2452;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2448)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2454;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2448)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2456;
    bool _2490 = !_2448;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_1600);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _1600 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2518 = 1.0 / _2512;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2518;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = fma(_2538, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2468 = _2548;
            _2486 = _2552;
            _2462 = _2544;
            _2480 = _2550;
            _2474 = _2546;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_1600);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2460;
            _2462 = _2568;
            if (!_2566)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2466;
            _2468 = _2570;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2472;
            _2474 = _2572;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2478;
            _2480 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _1600 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_1600);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _1600 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2604 = 1.0 / _2598;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2604;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2630 = fma(_2624, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2468 = _2634;
                    _2486 = _2638;
                    _2462 = _2630;
                    _2480 = _2636;
                    _2474 = _2632;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2468;
    float _2644 = _2486;
    float _2646 = _2462;
    float _2648 = _2480;
    float _2650 = _2474;
    float _2652 = _2494;
    float _2654 = fma(_1374, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_103.x = 0.0;
    float _2684 = -_2682;
    float _2686 = _2674 + _2684;
    float _2688 = -_2682;
    float _2690 = _2672 + _2688;
    float _2692 = -_2682;
    float _2694 = _2676 + _2692;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2700 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2702 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    out.m_99.w = _2696;
    out.m_105.x = _2698;
    out.m_105.y = _2700;
    out.m_105.z = _2702;
    if (!_2670)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2704 = -_1476;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1478;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1480;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _1374 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_1372, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_1384, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2780;
    out.m_103.y = _2782;
    out.m_103.z = _2784;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

