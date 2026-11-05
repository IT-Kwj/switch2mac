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
    bool _2792 = false;
    bool _1343 = false;
    bool _1331 = false;
    bool _370 = false;
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
        float _3077 = as_type<float>(_136);
        out.gl_Position.z = _3077;
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
        float _3146 = as_type<float>(_174);
        out.gl_Position.z = _3146;
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
    float _330 = _328;
    if (_222)
    {
        float _332 = _268 * _190;
        _314 = _332;
    }
    float _334 = _314;
    if (_240)
    {
        float _336 = _286 * _186;
        _282 = _336;
    }
    float _338 = _282;
    if (_240)
    {
        float _340 = _286 * _180;
        _310 = _340;
    }
    float _342 = _310;
    if (_240)
    {
        float _344 = _286 * _192;
        _324 = _344;
    }
    float _346 = _324;
    int _348 = _308 << 4;
    int _350 = _348 + 1712;
    bool _352 = !_300;
    float _368;
    if (!_352)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _356 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _360 = _358 * _354;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = true;
    }
    else
    {
        float _372 = float(_120);
        float _374 = 1.0 / _372;
        float _376 = _154 * _374;
        _368 = _376;
    }
    _370 = false;
    float _378 = _368;
    float _380 = in.m_58.x;
    float _382 = in.m_58.y;
    float _384 = in.m_58.z;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = in.m_73.x;
    float _392 = in.m_73.y;
    float _394 = in.m_73.z;
    float _396 = in.m_75.y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _400 = _398 != 0;
    float _402 = in.m_71.y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _410 = _388 * _154;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _422 = _420 != 0;
    float _424 = in.m_75.x;
    bool _426 = _194 > 0.5;
    bool _428 = _426 && _406;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _430;
    float _434 = _184 * _382;
    float _436 = _178 * _382;
    float _438 = _190 * _382;
    float _440 = in.m_71.z;
    float _442 = fma(_182, _380, _434);
    float _444 = fma(_176, _380, _436);
    float _446 = fma(_188, _380, _438);
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = -_396;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _456 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _462 = _402 > 0.5;
    float _464 = _194 * 2.0;
    float _466 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _468 = _396;
    if (_400)
    {
        float _470 = _462 ? _452 : _396;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = 1.0 / _460;
    float _476 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _478 = -_408;
    float _480 = fma(_456, 2.0, _478);
    float _482 = fma(_192, _384, _446);
    float _484 = floor(_464);
    float _486 = _424;
    if (_406)
    {
        _232 = _424;
    }
    float _488 = _232;
    float _490 = fma(_186, _384, _442);
    float _492 = _454 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = _488;
    if (_428)
    {
        float _500 = -_488;
        float _502 = _500 + 1.0;
        _498 = _502;
    }
    float _504 = _498;
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    float _516 = exp2(_410);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _532 = _432 * _474;
    float _534 = _194 + _440;
    float _536 = 1.0 / _520;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _534 + (-1.0);
    if (_406)
    {
        _486 = _504;
    }
    float _546 = _486;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _550 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _552 = 1.0 / _524;
    float _554 = fma(_180, _384, _444);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _558 = 1.0 + _556;
    out.m_79.x = _538;
    out.m_79.y = _540;
    out.m_79.z = _542;
    float _560 = fma(_492, _472, -0.5);
    float _562 = -_516;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _558;
    float _568 = _496 * _536;
    float _570 = _440 * 2.0;
    bool _572 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_550, -2.0, _548);
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _590 = _194 + _402;
    float _592 = in.m_81.x;
    float _594 = in.m_81.y;
    float _596 = in.m_81.z;
    float _598 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[79].z, _582);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _602 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    float _604 = _580 ? _564 : 0.0;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _606;
    float _610 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _600);
    bool _612 = _484 > 0.0;
    float _614 = floor(_570);
    bool _616 = _484 >= 0.0;
    bool _618 = isnan(_484);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = _402 + _440;
    float _628 = _590 + (-1.0);
    float _630 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _610);
    float _632 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[79].x, _598);
    float _634 = -_154;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[76].x, _480);
    float _638 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _602);
    float _640 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _586);
    float _642 = _608 * _552;
    if (_514)
    {
        float _644 = _604 * _566;
        _158 = _644;
    }
    float _646 = _158;
    float _648 = in.m_67.w;
    float _650 = _626 + (-1.0);
    float _652 = _402 * 2.0;
    float _654 = in.m_65.w;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _658 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = in.m_69.w;
    float _662 = floor(_652);
    bool _664 = _614 > 0.0;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _592);
    bool _668 = _614 >= 0.0;
    bool _670 = isnan(_614);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _594);
    float _680 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _682 = _658 * _666;
    float _684 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _686 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _688 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_378);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _680 * _678;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _378 + _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    bool _708 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _710 = isnan(_378);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_698;
    float _722 = _720 + 1.0;
    float _724 = fma(_532, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _726 = _624 ? 0 : 1;
    float _728 = _686 * _706;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _378 + _730;
    bool _734 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_378);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    bool _750 = _662 > 0.0;
    float _752 = _490 + _648;
    bool _754 = !_418;
    int _756 = _754 ? 0 : 1;
    float _758 = _554 + _654;
    float _760 = _482 + _660;
    bool _762 = _662 >= 0.0;
    bool _764 = isnan(_662);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = in.m_83.x;
    float _774 = in.m_83.y;
    float _776 = in.m_83.z;
    float _778 = _718 * _722;
    float _780 = fma(_568, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _784 = _378 + _782;
    bool _786 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _788 = isnan(_378);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _744 * _748;
    float _800 = -_744;
    float _802 = _800 + 1.0;
    int _804 = abs(_756);
    float _806 = fma(_642, _784, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _808 = ~_726;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _796 * _802;
    int _816 = _812;
    if (!_612)
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
    float _872 = _402 + (-0.5);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].x, _864);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].z, _862);
    float _878 = fma(_870, _774, _774);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].y, _858);
    float _882 = _874 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _886 = _676 ? 0 : 1;
    float _888 = fma(_656, _870, _656);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = _632 * (-0.15915493667125701904296875);
    float _894 = _882 * _846;
    bool _896 = !_414;
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
    int _926 = _350 + 8;
    uint _929 = uint(int(uint(_926) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    float _937 = -_796;
    float _939 = _937 + 1.0;
    float _941 = _902 * _884;
    bool _943 = !_422;
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
    uint _967 = uint(int(uint(_350) >> uint(2)));
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
    float _993 = _440 + (-0.5);
    float _995 = _963 * _985;
    bool _997 = _594 != 0.0;
    bool _999 = isnan(_594);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_991, _772, _772);
    float _1009 = fma(_684, _991, _684);
    float _1011 = _995 * (-2.0);
    float _1013 = _953 * 0.15915493667125701904296875;
    float _1015 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1007);
    bool _1017 = _592 == 0.0;
    bool _1019 = !_1005;
    bool _1021 = _1017 && _1019;
    float _1023 = fma(_1011, _776, _776);
    float _1025 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1027 = fma(_1009, _646, _1015);
    float _1029 = fma(_588, _1011, _588);
    float _1031 = in.m_85.x;
    float _1033 = in.m_85.y;
    float _1035 = in.m_85.z;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1023);
    float _1039 = fma(_1025, _546, -0.5);
    float _1041 = _912 * _560;
    float _1043 = _949 * _560;
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
    bool _1065 = _596 == 0.0;
    bool _1067 = _1065 && _1021;
    float _1069 = fma(_630, _1051, _636);
    float _1071 = -_640;
    float _1073 = fma(_638, _1053, _1071);
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
        float _1103 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1031);
        _1097 = _1103;
    }
    float _1105 = _1097;
    if (!_1067)
    {
        float _1107 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1099 = _1107;
    }
    float _1109 = _1099;
    float _1111 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1067)
    {
        float _1115 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
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
    float _1229 = fma(_1187, _1117, _1213);
    float _1231 = floor(_1091);
    float _1233 = fma(_1167, _1117, _1199);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1223);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1225);
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1227);
    float _1241 = fma(_1187, _728, _1217);
    float _1243 = _1229 * _318;
    float _1245 = _1229 * _328;
    float _1247 = _1229 * _334;
    float _1249 = fma(_1171, _1117, _1215);
    float _1251 = fma(_1233, _290, _1243);
    float _1253 = fma(_1233, _294, _1245);
    float _1255 = fma(_1233, _298, _1247);
    float _1257 = fma(_1171, _728, _1211);
    float _1259 = fma(_1249, _338, _1251);
    float _1261 = fma(_1249, _342, _1253);
    float _1263 = fma(_1249, _346, _1255);
    float _1265 = -_1231;
    float _1267 = _1091 + _1265;
    float _1269 = _1241 * _318;
    float _1271 = _1241 * _328;
    float _1273 = _1241 * _334;
    out.m_91.x = _1259;
    out.m_91.y = _1261;
    out.m_91.z = _1263;
    float _1275 = fma(_1267, 2.0, -1.0);
    float _1277 = fma(_1219, _290, _1269);
    float _1279 = fma(_1219, _294, _1271);
    float _1281 = fma(_1219, _298, _1273);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1285 = fma(_1257, _338, _1277);
    float _1287 = fma(_1257, _342, _1279);
    float _1289 = fma(_1257, _346, _1281);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1235);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1237);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1239);
    float _1297 = _1291 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1299 = _1293 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1301 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1303 = _1285 + _1297;
    float _1305 = _1287 + _1299;
    float _1307 = _1289 + _1301;
    float _1309 = _1285;
    float _1311 = _1287;
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
                _330 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1363 = _330;
            float _1365 = _1363;
            if (_1359)
            {
                _1309 = 0.0;
            }
            float _1367 = _1309;
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
            float _1391 = _1279;
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
            float _1435 = _290;
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
    float2 _5187 = float2(_1489, _1493);
    float _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5187, float2(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5187, float2(0.0), isnan(_5187)), level(0.0)).x;
    float _1497 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1501 = _1471 + _1499;
    float _1503 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1507 = _1473 + _1505;
    bool _1509 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1511 = isnan(0.5);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1517 = _1513 || _1515;
    float _1519 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1503);
    float _1521 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1523 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1521);
    float _1527 = 1.0 / _1523;
    float _1529 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = _1531 + _1523;
    float _1535 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1537 = _1299 + _1535;
    float _1539 = _1533 * _1527;
    float _1541 = _1539 * 0.5;
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1545 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1543);
    float _1547 = 1.0 / _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1551 = _1547 * _1549;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1555 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1557 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1553);
    bool _1559 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1561 = !_1555;
    int _1563 = _1561 ? 0 : 1;
    float _1565 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1557);
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1569 = 2;
    float _1571 = _1473;
    float _1573 = _1475;
    float _1575 = _1471;
    int _1577 = as_type<int>(_1501);
    float _1579 = _1477;
    if (!_1555)
    {
        _1569 = 1;
    }
    int _1581 = _1569;
    float _1583 = trunc(_1567);
    int _1585 = int(_1583);
    int _1587 = _1581;
    if (!_1559)
    {
        _1587 = _1563;
    }
    int _1589 = _1587;
    float _1591 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1593 = _1589 << 6;
    float _1595 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1591);
    int _1597 = _1593 + 96;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    uint _1601 = uint(int(uint(int(_1599)) >> uint(2)));
    int _1603 = int(_1599) & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    int _1607 = int(_1599) + 1;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    int _1611 = _1607 & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    float _1615 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1595);
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1619 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1621 = _1585 + _1619;
    int _1623 = _1621 + 1;
    int _1625 = _1593 + 104;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
    int _1631 = int(_1627) & 3;
    float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
    int _1635 = int(_1627) + 1;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    int _1639 = _1635 & 3;
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
    float _1643 = trunc(_1617);
    int _1645 = int(_1643);
    float _1647 = _1501 * _1501;
    float _1649 = fma(_1507, _1507, _1647);
    int _1651 = _1593 + 48;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    uint _1655 = uint(int(uint(int(_1653)) >> uint(2)));
    int _1657 = int(_1653) & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    int _1661 = int(_1653) + 1;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    int _1665 = _1661 & 3;
    float _1667 = (*spvDescriptorSet0.vp_c15)._m0[int(_1663)][_1665];
    float _1669 = sqrt(_1649);
    int _1671 = _1593 + 64;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    int _1689 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1691 = _1645 + _1689;
    int _1693 = _1691 + 1;
    bool _1695 = _1693 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1697 = _1693 | _1623;
    int _1699 = _1593 + 56;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.vp_c15)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[int(_1711)][_1713];
    bool _1717 = _1669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1719 = _1697 < 0;
    bool _1721 = _1719 || _1695;
    int _1723 = _1593 + 72;
    uint _1725 = uint(int(uint(_1723) >> uint(2)));
    uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
    int _1729 = int(_1725) & 3;
    float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
    int _1733 = int(_1725) + 1;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    int _1737 = _1733 & 3;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
    bool _1741 = _1623 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1743 = _1741 || _1721;
    int _1745 = _1593 + 80;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    uint _1749 = uint(int(uint(int(_1747)) >> uint(2)));
    int _1751 = int(_1747) & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    int _1755 = int(_1747) + 1;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    int _1759 = _1755 & 3;
    float _1761 = (*spvDescriptorSet0.vp_c15)._m0[int(_1757)][_1759];
    float _1763 = _1537 * _1613;
    float _1765 = fma(_1297, _1605, _1763);
    float _1767 = _1647;
    float _1769 = _1669;
    float _1771 = as_type<float>(_1589);
    if (!_1743)
    {
        float _1773 = floor(_1617);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = fma(_1301, _1633, _1765);
    float _1779 = _1777 + _1641;
    int _1781 = as_type<int>(_1641);
    if (!_1743)
    {
        int _1783 = _1623 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1785 = _1783 + _1693;
        _1781 = _1785;
    }
    int _1787 = _1781;
    float _1789 = _1537 * _1667;
    float _1791 = 1.0 / _1779;
    float _1793 = fma(_1297, _1659, _1789);
    float _1795 = _1789;
    int _1797 = as_type<int>(_1679);
    if (!_1717)
    {
        _1795 = _1473;
    }
    float _1799 = _1795;
    float _1801 = _1799;
    if (!_1717)
    {
        _1571 = _1471;
    }
    float _1803 = _1571;
    float _1805 = _1537 * _1687;
    float _1807 = fma(_1297, _1679, _1805);
    bool _1809 = !_1717;
    float _1811 = _1803;
    float _1813 = _1775;
    if (!_1809)
    {
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1819 = _1669 + _1817;
        float _1821 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1823 = rsqrt(_1649);
        float _1825 = _1819 * _1815;
        float _1827 = _1825 * 0.15915493667125701904296875;
        float _1829 = _1827 * 6.283185482025146484375;
        float _1831 = sin(_1829);
        float _1833 = _1827 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        float _1837 = fma(_1831, _1821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1839 = _1823 * _1837;
        float _1841 = _1835 + (-1.0);
        float _1843 = fma(_1507, _1839, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1845 = fma(_1501, _1839, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1847 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1849 = fma(_1835, _1475, _1847);
        _1573 = _1849;
        _1801 = _1843;
        _1811 = _1845;
        _1575 = _1827;
        _1797 = as_type<int>(_1821);
        _1769 = _1819;
    }
    float _1851 = _1573;
    float _1853 = _1801;
    float _1855 = _1811;
    float _1857 = _1575;
    int _1859 = _1797;
    float _1861 = _1769;
    float _1863 = _1857;
    int _1865 = _1859;
    float _1867 = _1853;
    float _1869 = _1855;
    if (!_1743)
    {
        int _1871 = _1787 << 2;
        _1577 = _1871;
    }
    int _1873 = _1577;
    float _1875 = fma(_1301, _1707, _1793);
    float _1877 = fma(_1301, _1731, _1807);
    int _1879 = _1873;
    if (_1517)
    {
        _1863 = _1851;
    }
    float _1881 = _1863;
    float _1883 = _1881;
    if (!_1743)
    {
        uint _1885 = uint(int(uint(_1787) >> uint(2)));
        _1865 = int(_1885);
    }
    int _1887 = _1865;
    int _1889 = _1887;
    if (!_1743)
    {
        int _1891 = 12 & _1873;
        _1879 = _1891;
    }
    int _1893 = _1879;
    if (!_1517)
    {
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1897 = _1299 + _1895;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1901 = _1297 + _1899;
        float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1905 = -_1299;
        float _1907 = _1905 + _1851;
        float _1909 = _1897 * _1897;
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1913 = _1301 + _1911;
        float _1915 = -_1297;
        float _1917 = _1915 + _1853;
        float _1919 = -_1301;
        float _1921 = _1919 + _1855;
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
        float _1949 = _1881;
        float _1951 = _1943;
        float _1953 = _1929;
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
        float _1963 = fma(_1917, _1947, _1297);
        float _1965 = fma(_1921, _1947, _1301);
        float _1967 = _1963;
        _1869 = _1965;
        if (_1941)
        {
            float _1969 = _1961 * _1957;
            _1953 = _1969;
        }
        float _1971 = _1953;
        float _1973 = fma(_1907, _1947, _1299);
        float _1975 = _1971;
        float _1977 = _1973;
        if (_1941)
        {
            float _1979 = _1931 * _1971;
            _1975 = _1979;
        }
        float _1981 = _1975;
        if (_1941)
        {
            float _1983 = fma(_1907, _1981, _1299);
            _1977 = _1983;
        }
        float _1985 = _1977;
        _1883 = _1985;
        if (_1941)
        {
            float _1987 = fma(_1917, _1981, _1297);
            _1967 = _1987;
        }
        float _1989 = _1967;
        _1867 = _1989;
        if (_1941)
        {
            float _1991 = fma(_1921, _1981, _1301);
            _1869 = _1991;
        }
    }
    float _1993 = _1883;
    float _1995 = _1867;
    float _1997 = _1869;
    if (!_1743)
    {
        int _1999 = _1887 << 4;
        int _2001 = _1999 + _1893;
        _1889 = _2001;
    }
    int _2003 = _1889;
    float _2005 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2007 = _1593 + 88;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    uint _2011 = uint(int(uint(int(_2009)) >> uint(2)));
    int _2013 = int(_2009) & 3;
    float _2015 = (*spvDescriptorSet0.vp_c15)._m0[int(_2011)][_2013];
    int _2017 = int(_2009) + 1;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    int _2021 = _2017 & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    float _2025 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2027 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2029 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2005);
    float _2031 = _1875 + _1715;
    float _2033 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2025);
    float _2035 = _1877 + _1739;
    float _2037 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2029);
    float _2039 = _1861;
    if (!_1743)
    {
        int _2041 = _2003 + 400;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
        int _2047 = int(_2043) & 3;
        float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
        _2039 = _2049;
    }
    float _2051 = _2039;
    float _2053 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2055 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2027);
    float _2057 = _2031 * _1791;
    float _2059 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2061 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2063 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2053);
    float _2065 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2067 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2069 = _2057 >= 0.0;
    float _2071 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2073 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2063);
    float _2075 = _2035 * _1791;
    bool _2077 = _2057 <= 1.0;
    bool _2079 = _2077 && _2069;
    float _2081 = -_2071;
    float _2083 = fma(_2081, _2065, 1.0);
    float _2085 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2087 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2089 = _2075 >= 0.0;
    bool _2091 = _2089 && _2079;
    float _2093 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2055);
    float _2095 = _1715;
    float _2097 = _2057;
    if (!_1743)
    {
        float _2099 = floor(_1567);
        _2095 = _2099;
    }
    float _2101 = _2095;
    float _2103 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2087);
    bool _2105 = _2075 <= 1.0;
    bool _2107 = _2105 && _2091;
    float _2109 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = _1537 * _1761;
    float _2113 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2115 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2117 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2119 = log2(_2083);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    float _2123 = fma(_1297, _1753, _2111);
    float _2125 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2115);
    float _2127 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2117);
    if (_2107)
    {
        float _2129 = float(_1589);
        _1771 = _2129;
    }
    float _2131 = _1771;
    float _2133 = 1.0 / _2121;
    float _2135 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2125);
    float _2137 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2127);
    float _2139 = fma(_1301, _2015, _2123);
    float _2141 = _2015;
    if (!_1743)
    {
        float _2143 = -_2101;
        float _2145 = _1567 + _2143;
        _2141 = _2145;
    }
    float _2147 = _2141;
    float _2149 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2135);
    float _2151 = _2119 * 0.693147182464599609375;
    float _2153 = _2111;
    if (_2107)
    {
        float _2155 = rint(_2131);
        float _2157 = precise::max(_2155, 0.0);
        uint _2159 = uint(_2157);
        uint _2161 = clamp(_2159, 0u, 65535u);
        _2153 = as_type<float>(_2161);
    }
    float _2163 = _2153;
    float _2165 = _2139 + _2023;
    float _2167 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2137);
    float _2169 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2171 = _2165 * _1791;
    float _2173 = _2149 * _2133;
    float _2175 = _2151;
    float _2177 = _2133;
    if (!_1743)
    {
        float _2179 = rint(_2051);
        float _2181 = precise::max(_2179, 0.0);
        uint _2183 = uint(_2181);
        uint _2185 = clamp(_2183, 0u, 65535u);
        _2175 = as_type<float>(_2185);
    }
    float _2187 = _2175;
    float _2189 = _2167 * _2133;
    if (!_1743)
    {
        float _2191 = -_1775;
        float _2193 = _1617 + _2191;
        _2177 = _2193;
    }
    float _2195 = _2177;
    float _2197 = fma(_2173, 0.5, 0.5);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = _2075;
    float _2203 = _2163;
    if (_2107)
    {
        float3 _6365 = float3(_2057, _2075, float(as_type<int>(_2163)));
        float3 _6369 = select(_6365, float3(0.0), isnan(_6365));
        float _2205 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6369.xy, uint(rint(_6369.z)), _2171, level(0.0));
        _2201 = _2205;
    }
    float _2207 = _2201;
    float3 _6379 = float3(_2197, _2199, _2169);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6379, float3(0.0), isnan(_6379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6379, float3(0.0), isnan(_6379)), level(0.0)).x;
    float3 _6388 = float3(_2197, _2199, _2169);
    float4 _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6388, float3(0.0), isnan(_6388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6388, float3(0.0), isnan(_6388)), level(0.0)).xyzw;
    float _2214 = _2212.x;
    float _2216 = _2212.y;
    float _2218 = _2212.z;
    float _2220 = _2212.w;
    float _2222 = _2195;
    float _2224 = _2187;
    if (!_1743)
    {
        float3 _6412 = float3(_2195, _2147, float(as_type<int>(_2187)));
        float3 _6414 = select(_6412, float3(0.0), isnan(_6412));
        float _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6414.xy, uint(rint(_6414.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6414.xy, uint(rint(_6414.z)), level(0.0)).x;
        _2222 = _2226;
    }
    float _2228 = _2222;
    if (_1743)
    {
        _1813 = 1.0;
    }
    float _2230 = _1813;
    float _2232 = _2230;
    float _2234 = _2216;
    float _2236 = _2214;
    if (!_1743)
    {
        int _2238 = _1787 << 4;
        int _2240 = _2238 + 2048;
        uint _2242 = uint(int(uint(_2240) >> uint(2)));
        uint _2244 = uint(int(uint(int(_2242)) >> uint(2)));
        int _2246 = int(_2242) & 3;
        float _2248 = (*spvDescriptorSet0.vp_c15)._m0[int(_2244)][_2246];
        int _2250 = int(_2242) + 1;
        uint _2252 = uint(int(uint(_2250) >> uint(2)));
        int _2254 = _2250 & 3;
        float _2256 = (*spvDescriptorSet0.vp_c15)._m0[int(_2252)][_2254];
        int _2258 = _2240 + 8;
        uint _2260 = uint(int(uint(_2258) >> uint(2)));
        uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
        int _2264 = int(_2260) & 3;
        float _2266 = (*spvDescriptorSet0.vp_c15)._m0[int(_2262)][_2264];
        int _2268 = int(_2260) + 1;
        uint _2270 = uint(int(uint(_2268) >> uint(2)));
        int _2272 = _2268 & 3;
        float _2274 = (*spvDescriptorSet0.vp_c15)._m0[int(_2270)][_2272];
        float _2276 = _1537 * _2256;
        float _2278 = fma(_1297, _2248, _2276);
        float _2280 = fma(_1301, _2266, _2278);
        float _2282 = _2280 + _2274;
        float _2284 = precise::clamp(_2282, 0.0, 1.0);
        float _2286 = -_2284;
        float _2288 = _2286 + _2228;
        float _2290 = fma(_2288, 500.0, 1.5);
        float _2292 = exp2(_2290);
        float _2294 = 0.0 + _2292;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        _2097 = _2256;
        _2203 = _2248;
        _2232 = _2296;
    }
    float _2298 = _2097;
    float _2300 = _2203;
    float _2302 = _2232;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2306 = _1993 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2310 = _1995 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2314 = _1997 + _2312;
    float _2316 = _2306 * _2306;
    float _2318 = fma(_2310, _2310, _2316);
    float _2320 = fma(_2314, _2314, _2318);
    float _2322 = rsqrt(_2320);
    float _2324 = sqrt(_2320);
    float _2326 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2328 = _2310 * _2326;
    float _2330 = _2314 * _2326;
    float _2332 = _2328 * _2328;
    float _2334 = _2330 * _2330;
    float _2336 = _2332 + _2334;
    float _2338 = sqrt(_2336);
    bool _2340 = _2338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2344 = _2338 + _2342;
    float _2346 = _2322;
    float _2348 = _2344;
    float _2350 = _2298;
    float _2352 = _2306;
    if (_2340)
    {
        float _2354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2346 = _2354;
    }
    float _2356 = _2346;
    float _2358 = _2356;
    if (_2340)
    {
        float _2360 = _2344 * _2356;
        _2348 = _2360;
    }
    float _2362 = _2348;
    if (_2340)
    {
        float _2364 = rsqrt(_2336);
        _2358 = _2364;
    }
    float _2366 = _2358;
    float _2368 = _2366;
    if (_2340)
    {
        float _2370 = _2362 * 0.15915493667125701904296875;
        _2350 = _2370;
    }
    float _2372 = _2350;
    float _2374 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2376 = _2314;
    float _2378 = _2372;
    if (_2340)
    {
        float _2380 = _2372 * 6.283185482025146484375;
        float _2382 = sin(_2380);
        _2376 = _2382;
    }
    float _2384 = _2376;
    float _2386 = precise::max(0.0, _2374);
    float _2388 = _2300;
    if (_2340)
    {
        float _2390 = _2372 * 6.283185482025146484375;
        float _2392 = cos(_2390);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = -_2326;
    float _2398 = -_2386;
    float _2400 = fma(_2306, _2396, _2398);
    float _2402 = _2400;
    if (_2340)
    {
        float _2404 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2404;
    }
    float _2406 = _2352;
    float _2408 = _2384;
    float _2410 = _2406;
    if (_2340)
    {
        float _2412 = fma(_2384, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2408 = _2412;
    }
    float _2414 = _2408;
    float _2416 = _2414;
    if (_2340)
    {
        float _2418 = _2366 * _2414;
        _2224 = _2418;
    }
    float _2420 = _2224;
    if (!_2340)
    {
        _2416 = _2328;
    }
    float _2422 = _2416;
    float _2424 = _2422;
    float _2426 = _2394;
    if (_2340)
    {
        float _2428 = _2394 + (-1.0);
        _2410 = _2428;
    }
    float _2430 = _2410;
    float _2432 = _2430;
    if (_2340)
    {
        float _2434 = _2328 * _2420;
        _2424 = _2434;
    }
    float _2436 = _2424;
    if (!_2340)
    {
        _2368 = _2332;
    }
    float _2438 = _2368;
    float _2440 = _2438;
    if (_2340)
    {
        float _2442 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2378 = _2442;
    }
    float _2444 = _2378;
    if (!_2340)
    {
        _2432 = _2330;
    }
    float _2446 = _2432;
    float _2448 = _2446;
    if (_2340)
    {
        float _2450 = _2330 * _2420;
        _2448 = _2450;
    }
    float _2452 = _2448;
    if (_2340)
    {
        float _2454 = _2436 * _2436;
        _2440 = _2454;
    }
    float _2456 = _2440;
    if (_2340)
    {
        float _2458 = fma(_2400, _2394, _2444);
        _2402 = _2458;
    }
    float _2460 = _2402;
    if (!_2340)
    {
        _2426 = _2334;
    }
    float _2462 = _2426;
    float _2464 = _2462;
    if (_2340)
    {
        float _2466 = _2452 * _2452;
        _2464 = _2466;
    }
    float _2468 = _2464;
    float _2470 = fma(_2460, _2460, _2456);
    float _2472 = _2470 + _2468;
    float _2474 = rsqrt(_2472);
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2478 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2476);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = -_2480;
    float _2484 = _2482 + 1.0;
    float _2486 = _2474 * _2460;
    float _2488 = _2474 * _2436;
    float _2490 = abs(_2484);
    float _2492 = log2(_2490);
    float _2494 = _2474 * _2452;
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = -_2496;
    float _2500 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2498);
    float _2502 = -_2494;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2500);
    float _2506 = fma(_2504, -0.5, 0.5);
    float _2508 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2510 = fma(_2504, 0.5, 0.5);
    float _2512 = sqrt(_2506);
    float _2514 = fma(_2510, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2516 = fma(_2510, _2514, -0.212114393711090087890625);
    float _2518 = _2486 + 1.0;
    float _2520 = exp2(_2508);
    float _2522 = fma(_2510, _2516, 1.570728778839111328125);
    float _2524 = _2512 * 0.636619746685028076171875;
    float _2526 = -_2522;
    float _2528 = fma(_2524, _2526, 1.0);
    float _2530 = -_2486;
    float _2532 = fma(_2520, _2518, _2530);
    float _2534 = fma(_2532, 0.5, 0.5);
    float2 _6886 = float2(_2528, _2534);
    float3 _2538 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6886, float2(0.0), isnan(_6886)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6886, float2(0.0), isnan(_6886)), level(0.0)).xyz;
    float _2540 = _2538.x;
    float _2542 = _2538.y;
    float _2544 = _2538.z;
    float _2546 = abs(_1551);
    float _2548 = log2(_2546);
    float _2550 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2552 = -_1495;
    float _2554 = _2552 + 1.0;
    float _2556 = _2149 + _2121;
    bool _2558 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2560 = isnan(_2324);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2566 = _2562 || _2564;
    float _2568 = exp2(_2550);
    bool _2570 = _1551 <= 8000.0;
    bool _2572 = isnan(_1551);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(8000.0);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    float _2582 = _2556 * 0.5;
    float _2584 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2586 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2588 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2586);
    float _2590 = exp2(_2584);
    float _2592 = -_2568;
    float _2594 = _2592 + 1.0;
    float _2596 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2588);
    float _2598 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2600 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2596);
    float _2602 = _2598 * _2209;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2167;
    out.gl_Position.z = _2600;
    out.gl_Position.w = _2121;
    float _2604 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2606 = precise::clamp(_2604, 0.0, 1.0);
    float _2608 = _2600 + _2121;
    float _2610 = fma(_2606, -2.0, 3.0);
    float _2612 = _2606 * _2606;
    float _2614 = _2608 * 0.5;
    float _2616 = _2612 * _2610;
    float _2618 = -_2598;
    float _2620 = _2618 + 1.0;
    float _2622 = -_2616;
    float _2624 = _2622 + 1.0;
    float _2626 = _2220 * _2620;
    float _2628 = _2620;
    if (!_2566)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2630 = _2628;
    float _2632 = fma(_2624, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2616);
    float _2634 = _2121 * 0.5;
    float _2636 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2638 = _2580 * _2632;
    float _2640 = fma(_2167, -0.5, _2634);
    float _2642 = _2634;
    float _2644 = _2630;
    float _2646 = _2630;
    if (!_2107)
    {
        _2642 = 1.0;
    }
    float _2648 = _2642;
    float _2650 = _2220 * _2602;
    float _2652 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2654 = _2648;
    float _2656 = _2650;
    if (_2107)
    {
        bool _2658 = _2207 >= _2171;
        bool _2660 = isnan(_2207);
        bool _2662 = _2658 || _2660;
        bool _2664 = isnan(_2171);
        bool _2666 = _2662 || _2664;
        float _2668 = float(_2666);
        _2654 = _2668;
    }
    float _2670 = _2654;
    out.m_93.x = _2582;
    out.m_93.y = _2640;
    out.m_93.z = _2614;
    out.m_93.w = _2121;
    if (!_2566)
    {
        _1579 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2672 = _1579;
    float _2674 = _2554 * _2652;
    float _2676 = precise::clamp(_2674, 0.0, 1.0);
    float _2678 = _2670 * _2302;
    float _2680 = -_2676;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2684 = -_2678;
    float _2686 = fma(_2684, _2682, 1.0);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2692 = _2688;
    float _2694 = _2672;
    float _2696 = _2672;
    if (!_2566)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2698 = _2692;
    out.m_95.x = _2690;
    float _2700 = _2544 * _2602;
    float _2702 = fma(_2540, _2650, _2214);
    float _2704 = fma(_2542, _2650, _2216);
    float _2706 = _2698;
    float _2708 = _2698;
    if (!_2566)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2710 = _2656;
    float _2712 = fma(_2220, _2700, _2218);
    float _2714 = _2710;
    float _2716 = _2710;
    if (!_2566)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2234;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2566)
    {
        _2236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2236;
    out.m_97.x = _2702;
    out.m_97.y = _2704;
    out.m_97.z = _2712;
    out.m_97.w = _2626;
    bool _2726 = !_2566;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2726)
    {
        bool _2732 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2734 = isnan(_2324);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2740 = _2736 || _2738;
        if (!_2740)
        {
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2744 = _2324 + _2742;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2746;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2754 = 1.0 / _2748;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2772 = _2744 * _2754;
            float _2774 = precise::clamp(_2772, 0.0, 1.0);
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2780 = fma(_2774, _2752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2716 = _2780;
            _2730 = _2788;
            _2646 = _2784;
            _2722 = _2786;
            _2696 = _2782;
            _2708 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2796 = isnan(_2324);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2804 = _2644;
            _2646 = _2804;
            if (!_2802)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2806 = _2714;
            _2716 = _2806;
            if (!_2802)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2808 = _2694;
            _2696 = _2808;
            if (!_2802)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2810 = _2720;
            _2722 = _2810;
            if (!_2802)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2812 = _2728;
            _2730 = _2812;
            if (!_2802)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2814 = _2706;
            bool _2816 = !_2802;
            _2708 = _2814;
            if (!_2816)
            {
                bool _2818 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2820 = isnan(_2324);
                bool _2822 = _2818 || _2820;
                bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2826 = _2822 || _2824;
                if (!_2826)
                {
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2830 = _2324 + _2828;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2832;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2840 = 1.0 / _2834;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2858 = _2830 * _2840;
                    float _2860 = precise::clamp(_2858, 0.0, 1.0);
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2866 = fma(_2860, _2838, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2868 = fma(_2860, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2870 = fma(_2860, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2872 = fma(_2860, _2848, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2874 = fma(_2860, _2852, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2876 = fma(_2860, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2716 = _2866;
                    _2730 = _2874;
                    _2646 = _2870;
                    _2722 = _2872;
                    _2696 = _2868;
                    _2708 = _2876;
                    _2792 = true;
                }
                else
                {
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2792 = false;
    float _2878 = _2716;
    float _2880 = _2730;
    float _2882 = _2646;
    float _2884 = _2722;
    float _2886 = _2696;
    float _2888 = _2708;
    float _2890 = fma(_1261, -0.5, 0.5);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -_2878;
    float _2896 = _2894 + _2880;
    float _2898 = -_2882;
    float _2900 = _2898 + _2884;
    float _2902 = -_2886;
    float _2904 = _2902 + _2888;
    bool _2906 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2908 = fma(_2892, _2896, _2878);
    float _2910 = fma(_2892, _2900, _2882);
    float _2912 = fma(_2892, _2904, _2886);
    float _2914 = _2636 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2916 = _2908 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _2918 = fma(_2910, 0.298911988735198974609375, _2916);
    out.m_61.x = _2914;
    float _2920 = fma(_2912, 0.114477999508380889892578125, _2918);
    float _2922 = -_2920;
    float _2924 = _2910 + _2922;
    float _2926 = -_2920;
    float _2928 = _2908 + _2926;
    float _2930 = -_2920;
    float _2932 = _2912 + _2930;
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    float _2938 = fma(_2932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    out.m_101.x = _2934;
    out.m_101.y = _2936;
    out.m_101.z = _2938;
    if (!_2906)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2940 = -_1993;
    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2944 = -_1995;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2948 = -_1997;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = fma(_2950, _2950, _2954);
    float _2958 = sqrt(_2956);
    float _2960 = rsqrt(_2956);
    float _2962 = -_2958;
    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = _2946 * _2960;
    float _2972 = _2942 * _2960;
    float _2974 = abs(_2968);
    float _2976 = log2(_2974);
    float _2978 = _2950 * _2960;
    float _2980 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2982 = _1261 * _2972;
    float _2984 = -_2972;
    float _2986 = -_2980;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2986);
    float _2990 = fma(_1259, _2970, _2982);
    float _2992 = -_2978;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2988);
    float _2996 = fma(_1263, _2978, _2990);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3002 = _2994 + _3000;
    float _3004 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3008 = precise::clamp(_3006, 0.0, 1.0);
    float _3010 = exp2(_3004);
    float _3012 = _3010 * _3008;
    float _3014 = _2998 * _3012;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _3016;
    out.m_99.y = _3018;
    out.m_99.z = _3020;
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
    bool _2792 = false;
    bool _1343 = false;
    bool _1331 = false;
    bool _370 = false;
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
        float _3077 = as_type<float>(_136);
        out.gl_Position.z = _3077;
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
        float _3146 = as_type<float>(_174);
        out.gl_Position.z = _3146;
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
    float _330 = _328;
    if (_222)
    {
        float _332 = _268 * _190;
        _314 = _332;
    }
    float _334 = _314;
    if (_240)
    {
        float _336 = _286 * _186;
        _282 = _336;
    }
    float _338 = _282;
    if (_240)
    {
        float _340 = _286 * _180;
        _310 = _340;
    }
    float _342 = _310;
    if (_240)
    {
        float _344 = _286 * _192;
        _324 = _344;
    }
    float _346 = _324;
    int _348 = _308 << 4;
    int _350 = _348 + 1712;
    bool _352 = !_300;
    float _368;
    if (!_352)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _356 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _360 = _358 * _354;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = true;
    }
    else
    {
        float _372 = float(_120);
        float _374 = 1.0 / _372;
        float _376 = _154 * _374;
        _368 = _376;
    }
    _370 = false;
    float _378 = _368;
    float _380 = in.m_58.x;
    float _382 = in.m_58.y;
    float _384 = in.m_58.z;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = in.m_73.x;
    float _392 = in.m_73.y;
    float _394 = in.m_73.z;
    float _396 = in.m_75.y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _400 = _398 != 0;
    float _402 = in.m_71.y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _410 = _388 * _154;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _422 = _420 != 0;
    float _424 = in.m_75.x;
    bool _426 = _194 > 0.5;
    bool _428 = _426 && _406;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _430;
    float _434 = _184 * _382;
    float _436 = _178 * _382;
    float _438 = _190 * _382;
    float _440 = in.m_71.z;
    float _442 = fma(_182, _380, _434);
    float _444 = fma(_176, _380, _436);
    float _446 = fma(_188, _380, _438);
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = -_396;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _456 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _462 = _402 > 0.5;
    float _464 = _194 * 2.0;
    float _466 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _468 = _396;
    if (_400)
    {
        float _470 = _462 ? _452 : _396;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = 1.0 / _460;
    float _476 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _478 = -_408;
    float _480 = fma(_456, 2.0, _478);
    float _482 = fma(_192, _384, _446);
    float _484 = floor(_464);
    float _486 = _424;
    if (_406)
    {
        _232 = _424;
    }
    float _488 = _232;
    float _490 = fma(_186, _384, _442);
    float _492 = _454 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = _488;
    if (_428)
    {
        float _500 = -_488;
        float _502 = _500 + 1.0;
        _498 = _502;
    }
    float _504 = _498;
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    float _516 = exp2(_410);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _532 = _432 * _474;
    float _534 = _194 + _440;
    float _536 = 1.0 / _520;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _534 + (-1.0);
    if (_406)
    {
        _486 = _504;
    }
    float _546 = _486;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _550 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _552 = 1.0 / _524;
    float _554 = fma(_180, _384, _444);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _558 = 1.0 + _556;
    out.m_79.x = _538;
    out.m_79.y = _540;
    out.m_79.z = _542;
    float _560 = fma(_492, _472, -0.5);
    float _562 = -_516;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _558;
    float _568 = _496 * _536;
    float _570 = _440 * 2.0;
    bool _572 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_550, -2.0, _548);
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _590 = _194 + _402;
    float _592 = in.m_81.x;
    float _594 = in.m_81.y;
    float _596 = in.m_81.z;
    float _598 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[79].z, _582);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _602 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    float _604 = _580 ? _564 : 0.0;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _606;
    float _610 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _600);
    bool _612 = _484 > 0.0;
    float _614 = floor(_570);
    bool _616 = _484 >= 0.0;
    bool _618 = isnan(_484);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = _402 + _440;
    float _628 = _590 + (-1.0);
    float _630 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _610);
    float _632 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[79].x, _598);
    float _634 = -_154;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[76].x, _480);
    float _638 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _602);
    float _640 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _586);
    float _642 = _608 * _552;
    if (_514)
    {
        float _644 = _604 * _566;
        _158 = _644;
    }
    float _646 = _158;
    float _648 = in.m_67.w;
    float _650 = _626 + (-1.0);
    float _652 = _402 * 2.0;
    float _654 = in.m_65.w;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _658 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = in.m_69.w;
    float _662 = floor(_652);
    bool _664 = _614 > 0.0;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _592);
    bool _668 = _614 >= 0.0;
    bool _670 = isnan(_614);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _594);
    float _680 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _682 = _658 * _666;
    float _684 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _686 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _688 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_378);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _680 * _678;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _378 + _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    bool _708 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _710 = isnan(_378);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_698;
    float _722 = _720 + 1.0;
    float _724 = fma(_532, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _726 = _624 ? 0 : 1;
    float _728 = _686 * _706;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _378 + _730;
    bool _734 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_378);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    bool _750 = _662 > 0.0;
    float _752 = _490 + _648;
    bool _754 = !_418;
    int _756 = _754 ? 0 : 1;
    float _758 = _554 + _654;
    float _760 = _482 + _660;
    bool _762 = _662 >= 0.0;
    bool _764 = isnan(_662);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = in.m_83.x;
    float _774 = in.m_83.y;
    float _776 = in.m_83.z;
    float _778 = _718 * _722;
    float _780 = fma(_568, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _784 = _378 + _782;
    bool _786 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _788 = isnan(_378);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _744 * _748;
    float _800 = -_744;
    float _802 = _800 + 1.0;
    int _804 = abs(_756);
    float _806 = fma(_642, _784, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _808 = ~_726;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _796 * _802;
    int _816 = _812;
    if (!_612)
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
    float _872 = _402 + (-0.5);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].x, _864);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].z, _862);
    float _878 = fma(_870, _774, _774);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].y, _858);
    float _882 = _874 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _886 = _676 ? 0 : 1;
    float _888 = fma(_656, _870, _656);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = _632 * (-0.15915493667125701904296875);
    float _894 = _882 * _846;
    bool _896 = !_414;
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
    int _926 = _350 + 8;
    uint _929 = uint(int(uint(_926) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    float _937 = -_796;
    float _939 = _937 + 1.0;
    float _941 = _902 * _884;
    bool _943 = !_422;
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
    uint _967 = uint(int(uint(_350) >> uint(2)));
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
    float _993 = _440 + (-0.5);
    float _995 = _963 * _985;
    bool _997 = _594 != 0.0;
    bool _999 = isnan(_594);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_991, _772, _772);
    float _1009 = fma(_684, _991, _684);
    float _1011 = _995 * (-2.0);
    float _1013 = _953 * 0.15915493667125701904296875;
    float _1015 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1007);
    bool _1017 = _592 == 0.0;
    bool _1019 = !_1005;
    bool _1021 = _1017 && _1019;
    float _1023 = fma(_1011, _776, _776);
    float _1025 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1027 = fma(_1009, _646, _1015);
    float _1029 = fma(_588, _1011, _588);
    float _1031 = in.m_85.x;
    float _1033 = in.m_85.y;
    float _1035 = in.m_85.z;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1023);
    float _1039 = fma(_1025, _546, -0.5);
    float _1041 = _912 * _560;
    float _1043 = _949 * _560;
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
    bool _1065 = _596 == 0.0;
    bool _1067 = _1065 && _1021;
    float _1069 = fma(_630, _1051, _636);
    float _1071 = -_640;
    float _1073 = fma(_638, _1053, _1071);
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
        float _1103 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1031);
        _1097 = _1103;
    }
    float _1105 = _1097;
    if (!_1067)
    {
        float _1107 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1099 = _1107;
    }
    float _1109 = _1099;
    float _1111 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1067)
    {
        float _1115 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
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
    float _1229 = fma(_1187, _1117, _1213);
    float _1231 = floor(_1091);
    float _1233 = fma(_1167, _1117, _1199);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1223);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1225);
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1227);
    float _1241 = fma(_1187, _728, _1217);
    float _1243 = _1229 * _318;
    float _1245 = _1229 * _328;
    float _1247 = _1229 * _334;
    float _1249 = fma(_1171, _1117, _1215);
    float _1251 = fma(_1233, _290, _1243);
    float _1253 = fma(_1233, _294, _1245);
    float _1255 = fma(_1233, _298, _1247);
    float _1257 = fma(_1171, _728, _1211);
    float _1259 = fma(_1249, _338, _1251);
    float _1261 = fma(_1249, _342, _1253);
    float _1263 = fma(_1249, _346, _1255);
    float _1265 = -_1231;
    float _1267 = _1091 + _1265;
    float _1269 = _1241 * _318;
    float _1271 = _1241 * _328;
    float _1273 = _1241 * _334;
    out.m_91.x = _1259;
    out.m_91.y = _1261;
    out.m_91.z = _1263;
    float _1275 = fma(_1267, 2.0, -1.0);
    float _1277 = fma(_1219, _290, _1269);
    float _1279 = fma(_1219, _294, _1271);
    float _1281 = fma(_1219, _298, _1273);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1285 = fma(_1257, _338, _1277);
    float _1287 = fma(_1257, _342, _1279);
    float _1289 = fma(_1257, _346, _1281);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1235);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1237);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1239);
    float _1297 = _1291 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1299 = _1293 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1301 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1303 = _1285 + _1297;
    float _1305 = _1287 + _1299;
    float _1307 = _1289 + _1301;
    float _1309 = _1285;
    float _1311 = _1287;
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
                _330 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1363 = _330;
            float _1365 = _1363;
            if (_1359)
            {
                _1309 = 0.0;
            }
            float _1367 = _1309;
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
            float _1391 = _1279;
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
            float _1435 = _290;
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
    float2 _5187 = float2(_1489, _1493);
    float _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5187, float2(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5187, float2(0.0), isnan(_5187)), level(0.0)).x;
    float _1497 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1501 = _1471 + _1499;
    float _1503 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1507 = _1473 + _1505;
    bool _1509 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1511 = isnan(0.5);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1517 = _1513 || _1515;
    float _1519 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1503);
    float _1521 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1523 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1521);
    float _1527 = 1.0 / _1523;
    float _1529 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = _1531 + _1523;
    float _1535 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1537 = _1299 + _1535;
    float _1539 = _1533 * _1527;
    float _1541 = _1539 * 0.5;
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1545 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1543);
    float _1547 = 1.0 / _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1551 = _1547 * _1549;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1555 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1557 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1553);
    bool _1559 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1561 = !_1555;
    int _1563 = _1561 ? 0 : 1;
    float _1565 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1557);
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1569 = 2;
    float _1571 = _1473;
    float _1573 = _1475;
    float _1575 = _1471;
    int _1577 = as_type<int>(_1501);
    float _1579 = _1477;
    if (!_1555)
    {
        _1569 = 1;
    }
    int _1581 = _1569;
    float _1583 = trunc(_1567);
    int _1585 = int(_1583);
    int _1587 = _1581;
    if (!_1559)
    {
        _1587 = _1563;
    }
    int _1589 = _1587;
    float _1591 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1593 = _1589 << 6;
    float _1595 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1591);
    int _1597 = _1593 + 96;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    uint _1601 = uint(int(uint(int(_1599)) >> uint(2)));
    int _1603 = int(_1599) & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    int _1607 = int(_1599) + 1;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    int _1611 = _1607 & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    float _1615 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1595);
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1619 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1621 = _1585 + _1619;
    int _1623 = _1621 + 1;
    int _1625 = _1593 + 104;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
    int _1631 = int(_1627) & 3;
    float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
    int _1635 = int(_1627) + 1;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    int _1639 = _1635 & 3;
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
    float _1643 = trunc(_1617);
    int _1645 = int(_1643);
    float _1647 = _1501 * _1501;
    float _1649 = fma(_1507, _1507, _1647);
    int _1651 = _1593 + 48;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    uint _1655 = uint(int(uint(int(_1653)) >> uint(2)));
    int _1657 = int(_1653) & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    int _1661 = int(_1653) + 1;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    int _1665 = _1661 & 3;
    float _1667 = (*spvDescriptorSet0.vp_c15)._m0[int(_1663)][_1665];
    float _1669 = sqrt(_1649);
    int _1671 = _1593 + 64;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    int _1689 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1691 = _1645 + _1689;
    int _1693 = _1691 + 1;
    bool _1695 = _1693 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1697 = _1693 | _1623;
    int _1699 = _1593 + 56;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.vp_c15)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[int(_1711)][_1713];
    bool _1717 = _1669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1719 = _1697 < 0;
    bool _1721 = _1719 || _1695;
    int _1723 = _1593 + 72;
    uint _1725 = uint(int(uint(_1723) >> uint(2)));
    uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
    int _1729 = int(_1725) & 3;
    float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
    int _1733 = int(_1725) + 1;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    int _1737 = _1733 & 3;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
    bool _1741 = _1623 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1743 = _1741 || _1721;
    int _1745 = _1593 + 80;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    uint _1749 = uint(int(uint(int(_1747)) >> uint(2)));
    int _1751 = int(_1747) & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    int _1755 = int(_1747) + 1;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    int _1759 = _1755 & 3;
    float _1761 = (*spvDescriptorSet0.vp_c15)._m0[int(_1757)][_1759];
    float _1763 = _1537 * _1613;
    float _1765 = fma(_1297, _1605, _1763);
    float _1767 = _1647;
    float _1769 = _1669;
    float _1771 = as_type<float>(_1589);
    if (!_1743)
    {
        float _1773 = floor(_1617);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = fma(_1301, _1633, _1765);
    float _1779 = _1777 + _1641;
    int _1781 = as_type<int>(_1641);
    if (!_1743)
    {
        int _1783 = _1623 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1785 = _1783 + _1693;
        _1781 = _1785;
    }
    int _1787 = _1781;
    float _1789 = _1537 * _1667;
    float _1791 = 1.0 / _1779;
    float _1793 = fma(_1297, _1659, _1789);
    float _1795 = _1789;
    int _1797 = as_type<int>(_1679);
    if (!_1717)
    {
        _1795 = _1473;
    }
    float _1799 = _1795;
    float _1801 = _1799;
    if (!_1717)
    {
        _1571 = _1471;
    }
    float _1803 = _1571;
    float _1805 = _1537 * _1687;
    float _1807 = fma(_1297, _1679, _1805);
    bool _1809 = !_1717;
    float _1811 = _1803;
    float _1813 = _1775;
    if (!_1809)
    {
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1819 = _1669 + _1817;
        float _1821 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1823 = rsqrt(_1649);
        float _1825 = _1819 * _1815;
        float _1827 = _1825 * 0.15915493667125701904296875;
        float _1829 = _1827 * 6.283185482025146484375;
        float _1831 = sin(_1829);
        float _1833 = _1827 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        float _1837 = fma(_1831, _1821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1839 = _1823 * _1837;
        float _1841 = _1835 + (-1.0);
        float _1843 = fma(_1507, _1839, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1845 = fma(_1501, _1839, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1847 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1849 = fma(_1835, _1475, _1847);
        _1573 = _1849;
        _1801 = _1843;
        _1811 = _1845;
        _1575 = _1827;
        _1797 = as_type<int>(_1821);
        _1769 = _1819;
    }
    float _1851 = _1573;
    float _1853 = _1801;
    float _1855 = _1811;
    float _1857 = _1575;
    int _1859 = _1797;
    float _1861 = _1769;
    float _1863 = _1857;
    int _1865 = _1859;
    float _1867 = _1853;
    float _1869 = _1855;
    if (!_1743)
    {
        int _1871 = _1787 << 2;
        _1577 = _1871;
    }
    int _1873 = _1577;
    float _1875 = fma(_1301, _1707, _1793);
    float _1877 = fma(_1301, _1731, _1807);
    int _1879 = _1873;
    if (_1517)
    {
        _1863 = _1851;
    }
    float _1881 = _1863;
    float _1883 = _1881;
    if (!_1743)
    {
        uint _1885 = uint(int(uint(_1787) >> uint(2)));
        _1865 = int(_1885);
    }
    int _1887 = _1865;
    int _1889 = _1887;
    if (!_1743)
    {
        int _1891 = 12 & _1873;
        _1879 = _1891;
    }
    int _1893 = _1879;
    if (!_1517)
    {
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1897 = _1299 + _1895;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1901 = _1297 + _1899;
        float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1905 = -_1299;
        float _1907 = _1905 + _1851;
        float _1909 = _1897 * _1897;
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1913 = _1301 + _1911;
        float _1915 = -_1297;
        float _1917 = _1915 + _1853;
        float _1919 = -_1301;
        float _1921 = _1919 + _1855;
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
        float _1949 = _1881;
        float _1951 = _1943;
        float _1953 = _1929;
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
        float _1963 = fma(_1917, _1947, _1297);
        float _1965 = fma(_1921, _1947, _1301);
        float _1967 = _1963;
        _1869 = _1965;
        if (_1941)
        {
            float _1969 = _1961 * _1957;
            _1953 = _1969;
        }
        float _1971 = _1953;
        float _1973 = fma(_1907, _1947, _1299);
        float _1975 = _1971;
        float _1977 = _1973;
        if (_1941)
        {
            float _1979 = _1931 * _1971;
            _1975 = _1979;
        }
        float _1981 = _1975;
        if (_1941)
        {
            float _1983 = fma(_1907, _1981, _1299);
            _1977 = _1983;
        }
        float _1985 = _1977;
        _1883 = _1985;
        if (_1941)
        {
            float _1987 = fma(_1917, _1981, _1297);
            _1967 = _1987;
        }
        float _1989 = _1967;
        _1867 = _1989;
        if (_1941)
        {
            float _1991 = fma(_1921, _1981, _1301);
            _1869 = _1991;
        }
    }
    float _1993 = _1883;
    float _1995 = _1867;
    float _1997 = _1869;
    if (!_1743)
    {
        int _1999 = _1887 << 4;
        int _2001 = _1999 + _1893;
        _1889 = _2001;
    }
    int _2003 = _1889;
    float _2005 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2007 = _1593 + 88;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    uint _2011 = uint(int(uint(int(_2009)) >> uint(2)));
    int _2013 = int(_2009) & 3;
    float _2015 = (*spvDescriptorSet0.vp_c15)._m0[int(_2011)][_2013];
    int _2017 = int(_2009) + 1;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    int _2021 = _2017 & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    float _2025 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2027 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2029 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2005);
    float _2031 = _1875 + _1715;
    float _2033 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2025);
    float _2035 = _1877 + _1739;
    float _2037 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2029);
    float _2039 = _1861;
    if (!_1743)
    {
        int _2041 = _2003 + 400;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
        int _2047 = int(_2043) & 3;
        float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
        _2039 = _2049;
    }
    float _2051 = _2039;
    float _2053 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2055 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2027);
    float _2057 = _2031 * _1791;
    float _2059 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2061 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2063 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2053);
    float _2065 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2067 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2069 = _2057 >= 0.0;
    float _2071 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2073 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2063);
    float _2075 = _2035 * _1791;
    bool _2077 = _2057 <= 1.0;
    bool _2079 = _2077 && _2069;
    float _2081 = -_2071;
    float _2083 = fma(_2081, _2065, 1.0);
    float _2085 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2087 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2089 = _2075 >= 0.0;
    bool _2091 = _2089 && _2079;
    float _2093 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2055);
    float _2095 = _1715;
    float _2097 = _2057;
    if (!_1743)
    {
        float _2099 = floor(_1567);
        _2095 = _2099;
    }
    float _2101 = _2095;
    float _2103 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2087);
    bool _2105 = _2075 <= 1.0;
    bool _2107 = _2105 && _2091;
    float _2109 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = _1537 * _1761;
    float _2113 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2115 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2117 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2119 = log2(_2083);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    float _2123 = fma(_1297, _1753, _2111);
    float _2125 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2115);
    float _2127 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2117);
    if (_2107)
    {
        float _2129 = float(_1589);
        _1771 = _2129;
    }
    float _2131 = _1771;
    float _2133 = 1.0 / _2121;
    float _2135 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2125);
    float _2137 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2127);
    float _2139 = fma(_1301, _2015, _2123);
    float _2141 = _2015;
    if (!_1743)
    {
        float _2143 = -_2101;
        float _2145 = _1567 + _2143;
        _2141 = _2145;
    }
    float _2147 = _2141;
    float _2149 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2135);
    float _2151 = _2119 * 0.693147182464599609375;
    float _2153 = _2111;
    if (_2107)
    {
        float _2155 = rint(_2131);
        float _2157 = precise::max(_2155, 0.0);
        uint _2159 = uint(_2157);
        uint _2161 = clamp(_2159, 0u, 65535u);
        _2153 = as_type<float>(_2161);
    }
    float _2163 = _2153;
    float _2165 = _2139 + _2023;
    float _2167 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2137);
    float _2169 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2171 = _2165 * _1791;
    float _2173 = _2149 * _2133;
    float _2175 = _2151;
    float _2177 = _2133;
    if (!_1743)
    {
        float _2179 = rint(_2051);
        float _2181 = precise::max(_2179, 0.0);
        uint _2183 = uint(_2181);
        uint _2185 = clamp(_2183, 0u, 65535u);
        _2175 = as_type<float>(_2185);
    }
    float _2187 = _2175;
    float _2189 = _2167 * _2133;
    if (!_1743)
    {
        float _2191 = -_1775;
        float _2193 = _1617 + _2191;
        _2177 = _2193;
    }
    float _2195 = _2177;
    float _2197 = fma(_2173, 0.5, 0.5);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = _2075;
    float _2203 = _2163;
    if (_2107)
    {
        float3 _6365 = float3(_2057, _2075, float(as_type<int>(_2163)));
        float3 _6369 = select(_6365, float3(0.0), isnan(_6365));
        float _2205 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6369.xy, uint(rint(_6369.z)), _2171, level(0.0));
        _2201 = _2205;
    }
    float _2207 = _2201;
    float3 _6379 = float3(_2197, _2199, _2169);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6379, float3(0.0), isnan(_6379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6379, float3(0.0), isnan(_6379)), level(0.0)).x;
    float3 _6388 = float3(_2197, _2199, _2169);
    float4 _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6388, float3(0.0), isnan(_6388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6388, float3(0.0), isnan(_6388)), level(0.0)).xyzw;
    float _2214 = _2212.x;
    float _2216 = _2212.y;
    float _2218 = _2212.z;
    float _2220 = _2212.w;
    float _2222 = _2195;
    float _2224 = _2187;
    if (!_1743)
    {
        float3 _6412 = float3(_2195, _2147, float(as_type<int>(_2187)));
        float3 _6414 = select(_6412, float3(0.0), isnan(_6412));
        float _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6414.xy, uint(rint(_6414.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6414.xy, uint(rint(_6414.z)), level(0.0)).x;
        _2222 = _2226;
    }
    float _2228 = _2222;
    if (_1743)
    {
        _1813 = 1.0;
    }
    float _2230 = _1813;
    float _2232 = _2230;
    float _2234 = _2216;
    float _2236 = _2214;
    if (!_1743)
    {
        int _2238 = _1787 << 4;
        int _2240 = _2238 + 2048;
        uint _2242 = uint(int(uint(_2240) >> uint(2)));
        uint _2244 = uint(int(uint(int(_2242)) >> uint(2)));
        int _2246 = int(_2242) & 3;
        float _2248 = (*spvDescriptorSet0.vp_c15)._m0[int(_2244)][_2246];
        int _2250 = int(_2242) + 1;
        uint _2252 = uint(int(uint(_2250) >> uint(2)));
        int _2254 = _2250 & 3;
        float _2256 = (*spvDescriptorSet0.vp_c15)._m0[int(_2252)][_2254];
        int _2258 = _2240 + 8;
        uint _2260 = uint(int(uint(_2258) >> uint(2)));
        uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
        int _2264 = int(_2260) & 3;
        float _2266 = (*spvDescriptorSet0.vp_c15)._m0[int(_2262)][_2264];
        int _2268 = int(_2260) + 1;
        uint _2270 = uint(int(uint(_2268) >> uint(2)));
        int _2272 = _2268 & 3;
        float _2274 = (*spvDescriptorSet0.vp_c15)._m0[int(_2270)][_2272];
        float _2276 = _1537 * _2256;
        float _2278 = fma(_1297, _2248, _2276);
        float _2280 = fma(_1301, _2266, _2278);
        float _2282 = _2280 + _2274;
        float _2284 = precise::clamp(_2282, 0.0, 1.0);
        float _2286 = -_2284;
        float _2288 = _2286 + _2228;
        float _2290 = fma(_2288, 500.0, 1.5);
        float _2292 = exp2(_2290);
        float _2294 = 0.0 + _2292;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        _2097 = _2256;
        _2203 = _2248;
        _2232 = _2296;
    }
    float _2298 = _2097;
    float _2300 = _2203;
    float _2302 = _2232;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2306 = _1993 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2310 = _1995 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2314 = _1997 + _2312;
    float _2316 = _2306 * _2306;
    float _2318 = fma(_2310, _2310, _2316);
    float _2320 = fma(_2314, _2314, _2318);
    float _2322 = rsqrt(_2320);
    float _2324 = sqrt(_2320);
    float _2326 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2328 = _2310 * _2326;
    float _2330 = _2314 * _2326;
    float _2332 = _2328 * _2328;
    float _2334 = _2330 * _2330;
    float _2336 = _2332 + _2334;
    float _2338 = sqrt(_2336);
    bool _2340 = _2338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2344 = _2338 + _2342;
    float _2346 = _2322;
    float _2348 = _2344;
    float _2350 = _2298;
    float _2352 = _2306;
    if (_2340)
    {
        float _2354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2346 = _2354;
    }
    float _2356 = _2346;
    float _2358 = _2356;
    if (_2340)
    {
        float _2360 = _2344 * _2356;
        _2348 = _2360;
    }
    float _2362 = _2348;
    if (_2340)
    {
        float _2364 = rsqrt(_2336);
        _2358 = _2364;
    }
    float _2366 = _2358;
    float _2368 = _2366;
    if (_2340)
    {
        float _2370 = _2362 * 0.15915493667125701904296875;
        _2350 = _2370;
    }
    float _2372 = _2350;
    float _2374 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2376 = _2314;
    float _2378 = _2372;
    if (_2340)
    {
        float _2380 = _2372 * 6.283185482025146484375;
        float _2382 = sin(_2380);
        _2376 = _2382;
    }
    float _2384 = _2376;
    float _2386 = precise::max(0.0, _2374);
    float _2388 = _2300;
    if (_2340)
    {
        float _2390 = _2372 * 6.283185482025146484375;
        float _2392 = cos(_2390);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = -_2326;
    float _2398 = -_2386;
    float _2400 = fma(_2306, _2396, _2398);
    float _2402 = _2400;
    if (_2340)
    {
        float _2404 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2404;
    }
    float _2406 = _2352;
    float _2408 = _2384;
    float _2410 = _2406;
    if (_2340)
    {
        float _2412 = fma(_2384, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2408 = _2412;
    }
    float _2414 = _2408;
    float _2416 = _2414;
    if (_2340)
    {
        float _2418 = _2366 * _2414;
        _2224 = _2418;
    }
    float _2420 = _2224;
    if (!_2340)
    {
        _2416 = _2328;
    }
    float _2422 = _2416;
    float _2424 = _2422;
    float _2426 = _2394;
    if (_2340)
    {
        float _2428 = _2394 + (-1.0);
        _2410 = _2428;
    }
    float _2430 = _2410;
    float _2432 = _2430;
    if (_2340)
    {
        float _2434 = _2328 * _2420;
        _2424 = _2434;
    }
    float _2436 = _2424;
    if (!_2340)
    {
        _2368 = _2332;
    }
    float _2438 = _2368;
    float _2440 = _2438;
    if (_2340)
    {
        float _2442 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2378 = _2442;
    }
    float _2444 = _2378;
    if (!_2340)
    {
        _2432 = _2330;
    }
    float _2446 = _2432;
    float _2448 = _2446;
    if (_2340)
    {
        float _2450 = _2330 * _2420;
        _2448 = _2450;
    }
    float _2452 = _2448;
    if (_2340)
    {
        float _2454 = _2436 * _2436;
        _2440 = _2454;
    }
    float _2456 = _2440;
    if (_2340)
    {
        float _2458 = fma(_2400, _2394, _2444);
        _2402 = _2458;
    }
    float _2460 = _2402;
    if (!_2340)
    {
        _2426 = _2334;
    }
    float _2462 = _2426;
    float _2464 = _2462;
    if (_2340)
    {
        float _2466 = _2452 * _2452;
        _2464 = _2466;
    }
    float _2468 = _2464;
    float _2470 = fma(_2460, _2460, _2456);
    float _2472 = _2470 + _2468;
    float _2474 = rsqrt(_2472);
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2478 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2476);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = -_2480;
    float _2484 = _2482 + 1.0;
    float _2486 = _2474 * _2460;
    float _2488 = _2474 * _2436;
    float _2490 = abs(_2484);
    float _2492 = log2(_2490);
    float _2494 = _2474 * _2452;
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = -_2496;
    float _2500 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2498);
    float _2502 = -_2494;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2500);
    float _2506 = fma(_2504, -0.5, 0.5);
    float _2508 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2510 = fma(_2504, 0.5, 0.5);
    float _2512 = sqrt(_2506);
    float _2514 = fma(_2510, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2516 = fma(_2510, _2514, -0.212114393711090087890625);
    float _2518 = _2486 + 1.0;
    float _2520 = exp2(_2508);
    float _2522 = fma(_2510, _2516, 1.570728778839111328125);
    float _2524 = _2512 * 0.636619746685028076171875;
    float _2526 = -_2522;
    float _2528 = fma(_2524, _2526, 1.0);
    float _2530 = -_2486;
    float _2532 = fma(_2520, _2518, _2530);
    float _2534 = fma(_2532, 0.5, 0.5);
    float2 _6886 = float2(_2528, _2534);
    float3 _2538 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6886, float2(0.0), isnan(_6886)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6886, float2(0.0), isnan(_6886)), level(0.0)).xyz;
    float _2540 = _2538.x;
    float _2542 = _2538.y;
    float _2544 = _2538.z;
    float _2546 = abs(_1551);
    float _2548 = log2(_2546);
    float _2550 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2552 = -_1495;
    float _2554 = _2552 + 1.0;
    float _2556 = _2149 + _2121;
    bool _2558 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2560 = isnan(_2324);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2566 = _2562 || _2564;
    float _2568 = exp2(_2550);
    bool _2570 = _1551 <= 8000.0;
    bool _2572 = isnan(_1551);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(8000.0);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    float _2582 = _2556 * 0.5;
    float _2584 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2586 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2588 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2586);
    float _2590 = exp2(_2584);
    float _2592 = -_2568;
    float _2594 = _2592 + 1.0;
    float _2596 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2588);
    float _2598 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2600 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2596);
    float _2602 = _2598 * _2209;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2167;
    out.gl_Position.z = _2600;
    out.gl_Position.w = _2121;
    float _2604 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2606 = precise::clamp(_2604, 0.0, 1.0);
    float _2608 = _2600 + _2121;
    float _2610 = fma(_2606, -2.0, 3.0);
    float _2612 = _2606 * _2606;
    float _2614 = _2608 * 0.5;
    float _2616 = _2612 * _2610;
    float _2618 = -_2598;
    float _2620 = _2618 + 1.0;
    float _2622 = -_2616;
    float _2624 = _2622 + 1.0;
    float _2626 = _2220 * _2620;
    float _2628 = _2620;
    if (!_2566)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2630 = _2628;
    float _2632 = fma(_2624, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2616);
    float _2634 = _2121 * 0.5;
    float _2636 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2638 = _2580 * _2632;
    float _2640 = fma(_2167, -0.5, _2634);
    float _2642 = _2634;
    float _2644 = _2630;
    float _2646 = _2630;
    if (!_2107)
    {
        _2642 = 1.0;
    }
    float _2648 = _2642;
    float _2650 = _2220 * _2602;
    float _2652 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2654 = _2648;
    float _2656 = _2650;
    if (_2107)
    {
        bool _2658 = _2207 >= _2171;
        bool _2660 = isnan(_2207);
        bool _2662 = _2658 || _2660;
        bool _2664 = isnan(_2171);
        bool _2666 = _2662 || _2664;
        float _2668 = float(_2666);
        _2654 = _2668;
    }
    float _2670 = _2654;
    out.m_93.x = _2582;
    out.m_93.y = _2640;
    out.m_93.z = _2614;
    out.m_93.w = _2121;
    if (!_2566)
    {
        _1579 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2672 = _1579;
    float _2674 = _2554 * _2652;
    float _2676 = precise::clamp(_2674, 0.0, 1.0);
    float _2678 = _2670 * _2302;
    float _2680 = -_2676;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2684 = -_2678;
    float _2686 = fma(_2684, _2682, 1.0);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2692 = _2688;
    float _2694 = _2672;
    float _2696 = _2672;
    if (!_2566)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2698 = _2692;
    out.m_95.x = _2690;
    float _2700 = _2544 * _2602;
    float _2702 = fma(_2540, _2650, _2214);
    float _2704 = fma(_2542, _2650, _2216);
    float _2706 = _2698;
    float _2708 = _2698;
    if (!_2566)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2710 = _2656;
    float _2712 = fma(_2220, _2700, _2218);
    float _2714 = _2710;
    float _2716 = _2710;
    if (!_2566)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2234;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2566)
    {
        _2236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2236;
    out.m_97.x = _2702;
    out.m_97.y = _2704;
    out.m_97.z = _2712;
    out.m_97.w = _2626;
    bool _2726 = !_2566;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2726)
    {
        bool _2732 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2734 = isnan(_2324);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2740 = _2736 || _2738;
        if (!_2740)
        {
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2744 = _2324 + _2742;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2746;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2754 = 1.0 / _2748;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2772 = _2744 * _2754;
            float _2774 = precise::clamp(_2772, 0.0, 1.0);
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2780 = fma(_2774, _2752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2716 = _2780;
            _2730 = _2788;
            _2646 = _2784;
            _2722 = _2786;
            _2696 = _2782;
            _2708 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2796 = isnan(_2324);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2804 = _2644;
            _2646 = _2804;
            if (!_2802)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2806 = _2714;
            _2716 = _2806;
            if (!_2802)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2808 = _2694;
            _2696 = _2808;
            if (!_2802)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2810 = _2720;
            _2722 = _2810;
            if (!_2802)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2812 = _2728;
            _2730 = _2812;
            if (!_2802)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2814 = _2706;
            bool _2816 = !_2802;
            _2708 = _2814;
            if (!_2816)
            {
                bool _2818 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2820 = isnan(_2324);
                bool _2822 = _2818 || _2820;
                bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2826 = _2822 || _2824;
                if (!_2826)
                {
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2830 = _2324 + _2828;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2832;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2840 = 1.0 / _2834;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2858 = _2830 * _2840;
                    float _2860 = precise::clamp(_2858, 0.0, 1.0);
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2866 = fma(_2860, _2838, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2868 = fma(_2860, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2870 = fma(_2860, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2872 = fma(_2860, _2848, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2874 = fma(_2860, _2852, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2876 = fma(_2860, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2716 = _2866;
                    _2730 = _2874;
                    _2646 = _2870;
                    _2722 = _2872;
                    _2696 = _2868;
                    _2708 = _2876;
                    _2792 = true;
                }
                else
                {
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2792 = false;
    float _2878 = _2716;
    float _2880 = _2730;
    float _2882 = _2646;
    float _2884 = _2722;
    float _2886 = _2696;
    float _2888 = _2708;
    float _2890 = fma(_1261, -0.5, 0.5);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -_2878;
    float _2896 = _2894 + _2880;
    float _2898 = -_2882;
    float _2900 = _2898 + _2884;
    float _2902 = -_2886;
    float _2904 = _2902 + _2888;
    bool _2906 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2908 = fma(_2892, _2896, _2878);
    float _2910 = fma(_2892, _2900, _2882);
    float _2912 = fma(_2892, _2904, _2886);
    float _2914 = _2636 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2916 = _2908 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _2918 = fma(_2910, 0.298911988735198974609375, _2916);
    out.m_61.x = _2914;
    float _2920 = fma(_2912, 0.114477999508380889892578125, _2918);
    float _2922 = -_2920;
    float _2924 = _2910 + _2922;
    float _2926 = -_2920;
    float _2928 = _2908 + _2926;
    float _2930 = -_2920;
    float _2932 = _2912 + _2930;
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    float _2938 = fma(_2932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    out.m_101.x = _2934;
    out.m_101.y = _2936;
    out.m_101.z = _2938;
    if (!_2906)
    {
        return out;
    }
    float _2940 = -_1993;
    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2944 = -_1995;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2948 = -_1997;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = fma(_2950, _2950, _2954);
    float _2958 = sqrt(_2956);
    float _2960 = rsqrt(_2956);
    float _2962 = -_2958;
    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = _2946 * _2960;
    float _2972 = _2942 * _2960;
    float _2974 = abs(_2968);
    float _2976 = log2(_2974);
    float _2978 = _2950 * _2960;
    float _2980 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2982 = _1261 * _2972;
    float _2984 = -_2972;
    float _2986 = -_2980;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2986);
    float _2990 = fma(_1259, _2970, _2982);
    float _2992 = -_2978;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2988);
    float _2996 = fma(_1263, _2978, _2990);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3002 = _2994 + _3000;
    float _3004 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3008 = precise::clamp(_3006, 0.0, 1.0);
    float _3010 = exp2(_3004);
    float _3012 = _3010 * _3008;
    float _3014 = _2998 * _3012;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _3016;
    out.m_99.y = _3018;
    out.m_99.z = _3020;
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
    bool _2792 = false;
    bool _1343 = false;
    bool _1331 = false;
    bool _370 = false;
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
        float _3077 = as_type<float>(_136);
        out.gl_Position.z = _3077;
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
        float _3146 = as_type<float>(_174);
        out.gl_Position.z = _3146;
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
    float _330 = _328;
    if (_222)
    {
        float _332 = _268 * _190;
        _314 = _332;
    }
    float _334 = _314;
    if (_240)
    {
        float _336 = _286 * _186;
        _282 = _336;
    }
    float _338 = _282;
    if (_240)
    {
        float _340 = _286 * _180;
        _310 = _340;
    }
    float _342 = _310;
    if (_240)
    {
        float _344 = _286 * _192;
        _324 = _344;
    }
    float _346 = _324;
    int _348 = _308 << 4;
    int _350 = _348 + 1712;
    bool _352 = !_300;
    float _368;
    if (!_352)
    {
        float _354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _356 = _194 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _360 = _358 * _354;
        float _362 = floor(_360);
        float _364 = -_362;
        float _366 = _360 + _364;
        _368 = _366;
        _370 = true;
    }
    else
    {
        float _372 = float(_120);
        float _374 = 1.0 / _372;
        float _376 = _154 * _374;
        _368 = _376;
    }
    _370 = false;
    float _378 = _368;
    float _380 = in.m_58.x;
    float _382 = in.m_58.y;
    float _384 = in.m_58.z;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = in.m_73.x;
    float _392 = in.m_73.y;
    float _394 = in.m_73.z;
    float _396 = in.m_75.y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _400 = _398 != 0;
    float _402 = in.m_71.y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _410 = _388 * _154;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _422 = _420 != 0;
    float _424 = in.m_75.x;
    bool _426 = _194 > 0.5;
    bool _428 = _426 && _406;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _430;
    float _434 = _184 * _382;
    float _436 = _178 * _382;
    float _438 = _190 * _382;
    float _440 = in.m_71.z;
    float _442 = fma(_182, _380, _434);
    float _444 = fma(_176, _380, _436);
    float _446 = fma(_188, _380, _438);
    float _448 = _392 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = -_396;
    float _452 = _450 + 1.0;
    float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _456 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _462 = _402 > 0.5;
    float _464 = _194 * 2.0;
    float _466 = _390 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _468 = _396;
    if (_400)
    {
        float _470 = _462 ? _452 : _396;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = 1.0 / _460;
    float _476 = _394 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _478 = -_408;
    float _480 = fma(_456, 2.0, _478);
    float _482 = fma(_192, _384, _446);
    float _484 = floor(_464);
    float _486 = _424;
    if (_406)
    {
        _232 = _424;
    }
    float _488 = _232;
    float _490 = fma(_186, _384, _442);
    float _492 = _454 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = _488;
    if (_428)
    {
        float _500 = -_488;
        float _502 = _500 + 1.0;
        _498 = _502;
    }
    float _504 = _498;
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    float _516 = exp2(_410);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _532 = _432 * _474;
    float _534 = _194 + _440;
    float _536 = 1.0 / _520;
    float _538 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _534 + (-1.0);
    if (_406)
    {
        _486 = _504;
    }
    float _546 = _486;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _550 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _552 = 1.0 / _524;
    float _554 = fma(_180, _384, _444);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _558 = 1.0 + _556;
    out.m_79.x = _538;
    out.m_79.y = _540;
    out.m_79.z = _542;
    float _560 = fma(_492, _472, -0.5);
    float _562 = -_516;
    float _564 = _562 + 1.0;
    float _566 = 1.0 / _558;
    float _568 = _496 * _536;
    float _570 = _440 * 2.0;
    bool _572 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_550, -2.0, _548);
    float _588 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _590 = _194 + _402;
    float _592 = in.m_81.x;
    float _594 = in.m_81.y;
    float _596 = in.m_81.z;
    float _598 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[79].z, _582);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _602 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    float _604 = _580 ? _564 : 0.0;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _606;
    float _610 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _600);
    bool _612 = _484 > 0.0;
    float _614 = floor(_570);
    bool _616 = _484 >= 0.0;
    bool _618 = isnan(_484);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = _402 + _440;
    float _628 = _590 + (-1.0);
    float _630 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _610);
    float _632 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[79].x, _598);
    float _634 = -_154;
    float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[76].x, _480);
    float _638 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _602);
    float _640 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _586);
    float _642 = _608 * _552;
    if (_514)
    {
        float _644 = _604 * _566;
        _158 = _644;
    }
    float _646 = _158;
    float _648 = in.m_67.w;
    float _650 = _626 + (-1.0);
    float _652 = _402 * 2.0;
    float _654 = in.m_65.w;
    float _656 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _658 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _660 = in.m_69.w;
    float _662 = floor(_652);
    bool _664 = _614 > 0.0;
    float _666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _592);
    bool _668 = _614 >= 0.0;
    bool _670 = isnan(_614);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _594);
    float _680 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _682 = _658 * _666;
    float _684 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _686 = _476 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _688 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_378);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _680 * _678;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _378 + _702;
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    bool _708 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _710 = isnan(_378);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_698;
    float _722 = _720 + 1.0;
    float _724 = fma(_532, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _726 = _624 ? 0 : 1;
    float _728 = _686 * _706;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _378 + _730;
    bool _734 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_378);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_718;
    float _748 = _746 + 1.0;
    bool _750 = _662 > 0.0;
    float _752 = _490 + _648;
    bool _754 = !_418;
    int _756 = _754 ? 0 : 1;
    float _758 = _554 + _654;
    float _760 = _482 + _660;
    bool _762 = _662 >= 0.0;
    bool _764 = isnan(_662);
    bool _766 = _762 || _764;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    float _772 = in.m_83.x;
    float _774 = in.m_83.y;
    float _776 = in.m_83.z;
    float _778 = _718 * _722;
    float _780 = fma(_568, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _784 = _378 + _782;
    bool _786 = _378 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _788 = isnan(_378);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = _744 * _748;
    float _800 = -_744;
    float _802 = _800 + 1.0;
    int _804 = abs(_756);
    float _806 = fma(_642, _784, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _808 = ~_726;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    float _814 = _796 * _802;
    int _816 = _812;
    if (!_612)
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
    float _872 = _402 + (-0.5);
    float _874 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].x, _864);
    float _876 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].z, _862);
    float _878 = fma(_870, _774, _774);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c12)._m0[8].y, _858);
    float _882 = _874 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _884 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _886 = _676 ? 0 : 1;
    float _888 = fma(_656, _870, _656);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _892 = _632 * (-0.15915493667125701904296875);
    float _894 = _882 * _846;
    bool _896 = !_414;
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
    int _926 = _350 + 8;
    uint _929 = uint(int(uint(_926) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    float _937 = -_796;
    float _939 = _937 + 1.0;
    float _941 = _902 * _884;
    bool _943 = !_422;
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
    uint _967 = uint(int(uint(_350) >> uint(2)));
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
    float _993 = _440 + (-0.5);
    float _995 = _963 * _985;
    bool _997 = _594 != 0.0;
    bool _999 = isnan(_594);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_991, _772, _772);
    float _1009 = fma(_684, _991, _684);
    float _1011 = _995 * (-2.0);
    float _1013 = _953 * 0.15915493667125701904296875;
    float _1015 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1007);
    bool _1017 = _592 == 0.0;
    bool _1019 = !_1005;
    bool _1021 = _1017 && _1019;
    float _1023 = fma(_1011, _776, _776);
    float _1025 = _965 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1027 = fma(_1009, _646, _1015);
    float _1029 = fma(_588, _1011, _588);
    float _1031 = in.m_85.x;
    float _1033 = in.m_85.y;
    float _1035 = in.m_85.z;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1023);
    float _1039 = fma(_1025, _546, -0.5);
    float _1041 = _912 * _560;
    float _1043 = _949 * _560;
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
    bool _1065 = _596 == 0.0;
    bool _1067 = _1065 && _1021;
    float _1069 = fma(_630, _1051, _636);
    float _1071 = -_640;
    float _1073 = fma(_638, _1053, _1071);
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
        float _1103 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1031);
        _1097 = _1103;
    }
    float _1105 = _1097;
    if (!_1067)
    {
        float _1107 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1033);
        _1099 = _1107;
    }
    float _1109 = _1099;
    float _1111 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1067)
    {
        float _1115 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1035);
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
    float _1229 = fma(_1187, _1117, _1213);
    float _1231 = floor(_1091);
    float _1233 = fma(_1167, _1117, _1199);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1223);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1225);
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1227);
    float _1241 = fma(_1187, _728, _1217);
    float _1243 = _1229 * _318;
    float _1245 = _1229 * _328;
    float _1247 = _1229 * _334;
    float _1249 = fma(_1171, _1117, _1215);
    float _1251 = fma(_1233, _290, _1243);
    float _1253 = fma(_1233, _294, _1245);
    float _1255 = fma(_1233, _298, _1247);
    float _1257 = fma(_1171, _728, _1211);
    float _1259 = fma(_1249, _338, _1251);
    float _1261 = fma(_1249, _342, _1253);
    float _1263 = fma(_1249, _346, _1255);
    float _1265 = -_1231;
    float _1267 = _1091 + _1265;
    float _1269 = _1241 * _318;
    float _1271 = _1241 * _328;
    float _1273 = _1241 * _334;
    out.m_91.x = _1259;
    out.m_91.y = _1261;
    out.m_91.z = _1263;
    float _1275 = fma(_1267, 2.0, -1.0);
    float _1277 = fma(_1219, _290, _1269);
    float _1279 = fma(_1219, _294, _1271);
    float _1281 = fma(_1219, _298, _1273);
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1285 = fma(_1257, _338, _1277);
    float _1287 = fma(_1257, _342, _1279);
    float _1289 = fma(_1257, _346, _1281);
    float _1291 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1235);
    float _1293 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1237);
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1239);
    float _1297 = _1291 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1299 = _1293 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1301 = _1295 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1303 = _1285 + _1297;
    float _1305 = _1287 + _1299;
    float _1307 = _1289 + _1301;
    float _1309 = _1285;
    float _1311 = _1287;
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
                _330 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _1363 = _330;
            float _1365 = _1363;
            if (_1359)
            {
                _1309 = 0.0;
            }
            float _1367 = _1309;
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
            float _1391 = _1279;
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
            float _1435 = _290;
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
    float2 _5187 = float2(_1489, _1493);
    float _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5187, float2(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5187, float2(0.0), isnan(_5187)), level(0.0)).x;
    float _1497 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1501 = _1471 + _1499;
    float _1503 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1507 = _1473 + _1505;
    bool _1509 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1511 = isnan(0.5);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1517 = _1513 || _1515;
    float _1519 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1503);
    float _1521 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1523 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1525 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1521);
    float _1527 = 1.0 / _1523;
    float _1529 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    float _1531 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = _1531 + _1523;
    float _1535 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1537 = _1299 + _1535;
    float _1539 = _1533 * _1527;
    float _1541 = _1539 * 0.5;
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1545 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1543);
    float _1547 = 1.0 / _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1551 = _1547 * _1549;
    float _1553 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1555 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1557 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1553);
    bool _1559 = _1551 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1561 = !_1555;
    int _1563 = _1561 ? 0 : 1;
    float _1565 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1557);
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1569 = 2;
    float _1571 = _1473;
    float _1573 = _1475;
    float _1575 = _1471;
    int _1577 = as_type<int>(_1501);
    float _1579 = _1477;
    if (!_1555)
    {
        _1569 = 1;
    }
    int _1581 = _1569;
    float _1583 = trunc(_1567);
    int _1585 = int(_1583);
    int _1587 = _1581;
    if (!_1559)
    {
        _1587 = _1563;
    }
    int _1589 = _1587;
    float _1591 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _1593 = _1589 << 6;
    float _1595 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1591);
    int _1597 = _1593 + 96;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    uint _1601 = uint(int(uint(int(_1599)) >> uint(2)));
    int _1603 = int(_1599) & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    int _1607 = int(_1599) + 1;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    int _1611 = _1607 & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    float _1615 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1595);
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1619 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1621 = _1585 + _1619;
    int _1623 = _1621 + 1;
    int _1625 = _1593 + 104;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
    int _1631 = int(_1627) & 3;
    float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
    int _1635 = int(_1627) + 1;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    int _1639 = _1635 & 3;
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
    float _1643 = trunc(_1617);
    int _1645 = int(_1643);
    float _1647 = _1501 * _1501;
    float _1649 = fma(_1507, _1507, _1647);
    int _1651 = _1593 + 48;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    uint _1655 = uint(int(uint(int(_1653)) >> uint(2)));
    int _1657 = int(_1653) & 3;
    float _1659 = (*spvDescriptorSet0.vp_c15)._m0[int(_1655)][_1657];
    int _1661 = int(_1653) + 1;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    int _1665 = _1661 & 3;
    float _1667 = (*spvDescriptorSet0.vp_c15)._m0[int(_1663)][_1665];
    float _1669 = sqrt(_1649);
    int _1671 = _1593 + 64;
    uint _1673 = uint(int(uint(_1671) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[int(_1683)][_1685];
    int _1689 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1691 = _1645 + _1689;
    int _1693 = _1691 + 1;
    bool _1695 = _1693 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1697 = _1693 | _1623;
    int _1699 = _1593 + 56;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.vp_c15)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[int(_1711)][_1713];
    bool _1717 = _1669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1719 = _1697 < 0;
    bool _1721 = _1719 || _1695;
    int _1723 = _1593 + 72;
    uint _1725 = uint(int(uint(_1723) >> uint(2)));
    uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
    int _1729 = int(_1725) & 3;
    float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
    int _1733 = int(_1725) + 1;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    int _1737 = _1733 & 3;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
    bool _1741 = _1623 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1743 = _1741 || _1721;
    int _1745 = _1593 + 80;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    uint _1749 = uint(int(uint(int(_1747)) >> uint(2)));
    int _1751 = int(_1747) & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    int _1755 = int(_1747) + 1;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    int _1759 = _1755 & 3;
    float _1761 = (*spvDescriptorSet0.vp_c15)._m0[int(_1757)][_1759];
    float _1763 = _1537 * _1613;
    float _1765 = fma(_1297, _1605, _1763);
    float _1767 = _1647;
    float _1769 = _1669;
    float _1771 = as_type<float>(_1589);
    if (!_1743)
    {
        float _1773 = floor(_1617);
        _1767 = _1773;
    }
    float _1775 = _1767;
    float _1777 = fma(_1301, _1633, _1765);
    float _1779 = _1777 + _1641;
    int _1781 = as_type<int>(_1641);
    if (!_1743)
    {
        int _1783 = _1623 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1785 = _1783 + _1693;
        _1781 = _1785;
    }
    int _1787 = _1781;
    float _1789 = _1537 * _1667;
    float _1791 = 1.0 / _1779;
    float _1793 = fma(_1297, _1659, _1789);
    float _1795 = _1789;
    int _1797 = as_type<int>(_1679);
    if (!_1717)
    {
        _1795 = _1473;
    }
    float _1799 = _1795;
    float _1801 = _1799;
    if (!_1717)
    {
        _1571 = _1471;
    }
    float _1803 = _1571;
    float _1805 = _1537 * _1687;
    float _1807 = fma(_1297, _1679, _1805);
    bool _1809 = !_1717;
    float _1811 = _1803;
    float _1813 = _1775;
    if (!_1809)
    {
        float _1815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1819 = _1669 + _1817;
        float _1821 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1823 = rsqrt(_1649);
        float _1825 = _1819 * _1815;
        float _1827 = _1825 * 0.15915493667125701904296875;
        float _1829 = _1827 * 6.283185482025146484375;
        float _1831 = sin(_1829);
        float _1833 = _1827 * 6.283185482025146484375;
        float _1835 = cos(_1833);
        float _1837 = fma(_1831, _1821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1839 = _1823 * _1837;
        float _1841 = _1835 + (-1.0);
        float _1843 = fma(_1507, _1839, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1845 = fma(_1501, _1839, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1847 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1849 = fma(_1835, _1475, _1847);
        _1573 = _1849;
        _1801 = _1843;
        _1811 = _1845;
        _1575 = _1827;
        _1797 = as_type<int>(_1821);
        _1769 = _1819;
    }
    float _1851 = _1573;
    float _1853 = _1801;
    float _1855 = _1811;
    float _1857 = _1575;
    int _1859 = _1797;
    float _1861 = _1769;
    float _1863 = _1857;
    int _1865 = _1859;
    float _1867 = _1853;
    float _1869 = _1855;
    if (!_1743)
    {
        int _1871 = _1787 << 2;
        _1577 = _1871;
    }
    int _1873 = _1577;
    float _1875 = fma(_1301, _1707, _1793);
    float _1877 = fma(_1301, _1731, _1807);
    int _1879 = _1873;
    if (_1517)
    {
        _1863 = _1851;
    }
    float _1881 = _1863;
    float _1883 = _1881;
    if (!_1743)
    {
        uint _1885 = uint(int(uint(_1787) >> uint(2)));
        _1865 = int(_1885);
    }
    int _1887 = _1865;
    int _1889 = _1887;
    if (!_1743)
    {
        int _1891 = 12 & _1873;
        _1879 = _1891;
    }
    int _1893 = _1879;
    if (!_1517)
    {
        float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1897 = _1299 + _1895;
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1901 = _1297 + _1899;
        float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1905 = -_1299;
        float _1907 = _1905 + _1851;
        float _1909 = _1897 * _1897;
        float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1913 = _1301 + _1911;
        float _1915 = -_1297;
        float _1917 = _1915 + _1853;
        float _1919 = -_1301;
        float _1921 = _1919 + _1855;
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
        float _1949 = _1881;
        float _1951 = _1943;
        float _1953 = _1929;
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
        float _1963 = fma(_1917, _1947, _1297);
        float _1965 = fma(_1921, _1947, _1301);
        float _1967 = _1963;
        _1869 = _1965;
        if (_1941)
        {
            float _1969 = _1961 * _1957;
            _1953 = _1969;
        }
        float _1971 = _1953;
        float _1973 = fma(_1907, _1947, _1299);
        float _1975 = _1971;
        float _1977 = _1973;
        if (_1941)
        {
            float _1979 = _1931 * _1971;
            _1975 = _1979;
        }
        float _1981 = _1975;
        if (_1941)
        {
            float _1983 = fma(_1907, _1981, _1299);
            _1977 = _1983;
        }
        float _1985 = _1977;
        _1883 = _1985;
        if (_1941)
        {
            float _1987 = fma(_1917, _1981, _1297);
            _1967 = _1987;
        }
        float _1989 = _1967;
        _1867 = _1989;
        if (_1941)
        {
            float _1991 = fma(_1921, _1981, _1301);
            _1869 = _1991;
        }
    }
    float _1993 = _1883;
    float _1995 = _1867;
    float _1997 = _1869;
    if (!_1743)
    {
        int _1999 = _1887 << 4;
        int _2001 = _1999 + _1893;
        _1889 = _2001;
    }
    int _2003 = _1889;
    float _2005 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _2007 = _1593 + 88;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    uint _2011 = uint(int(uint(int(_2009)) >> uint(2)));
    int _2013 = int(_2009) & 3;
    float _2015 = (*spvDescriptorSet0.vp_c15)._m0[int(_2011)][_2013];
    int _2017 = int(_2009) + 1;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    int _2021 = _2017 & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    float _2025 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2027 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2029 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2005);
    float _2031 = _1875 + _1715;
    float _2033 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2025);
    float _2035 = _1877 + _1739;
    float _2037 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2029);
    float _2039 = _1861;
    if (!_1743)
    {
        int _2041 = _2003 + 400;
        uint _2043 = uint(int(uint(_2041) >> uint(2)));
        uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
        int _2047 = int(_2043) & 3;
        float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
        _2039 = _2049;
    }
    float _2051 = _2039;
    float _2053 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2055 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2027);
    float _2057 = _2031 * _1791;
    float _2059 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2033);
    float _2061 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2063 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2053);
    float _2065 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2067 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2069 = _2057 >= 0.0;
    float _2071 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2073 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2063);
    float _2075 = _2035 * _1791;
    bool _2077 = _2057 <= 1.0;
    bool _2079 = _2077 && _2069;
    float _2081 = -_2071;
    float _2083 = fma(_2081, _2065, 1.0);
    float _2085 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2087 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2089 = _2075 >= 0.0;
    bool _2091 = _2089 && _2079;
    float _2093 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2055);
    float _2095 = _1715;
    float _2097 = _2057;
    if (!_1743)
    {
        float _2099 = floor(_1567);
        _2095 = _2099;
    }
    float _2101 = _2095;
    float _2103 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2087);
    bool _2105 = _2075 <= 1.0;
    bool _2107 = _2105 && _2091;
    float _2109 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = _1537 * _1761;
    float _2113 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2115 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2117 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2119 = log2(_2083);
    float _2121 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2113);
    float _2123 = fma(_1297, _1753, _2111);
    float _2125 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2115);
    float _2127 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2117);
    if (_2107)
    {
        float _2129 = float(_1589);
        _1771 = _2129;
    }
    float _2131 = _1771;
    float _2133 = 1.0 / _2121;
    float _2135 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2125);
    float _2137 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2127);
    float _2139 = fma(_1301, _2015, _2123);
    float _2141 = _2015;
    if (!_1743)
    {
        float _2143 = -_2101;
        float _2145 = _1567 + _2143;
        _2141 = _2145;
    }
    float _2147 = _2141;
    float _2149 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2135);
    float _2151 = _2119 * 0.693147182464599609375;
    float _2153 = _2111;
    if (_2107)
    {
        float _2155 = rint(_2131);
        float _2157 = precise::max(_2155, 0.0);
        uint _2159 = uint(_2157);
        uint _2161 = clamp(_2159, 0u, 65535u);
        _2153 = as_type<float>(_2161);
    }
    float _2163 = _2153;
    float _2165 = _2139 + _2023;
    float _2167 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2137);
    float _2169 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2171 = _2165 * _1791;
    float _2173 = _2149 * _2133;
    float _2175 = _2151;
    float _2177 = _2133;
    if (!_1743)
    {
        float _2179 = rint(_2051);
        float _2181 = precise::max(_2179, 0.0);
        uint _2183 = uint(_2181);
        uint _2185 = clamp(_2183, 0u, 65535u);
        _2175 = as_type<float>(_2185);
    }
    float _2187 = _2175;
    float _2189 = _2167 * _2133;
    if (!_1743)
    {
        float _2191 = -_1775;
        float _2193 = _1617 + _2191;
        _2177 = _2193;
    }
    float _2195 = _2177;
    float _2197 = fma(_2173, 0.5, 0.5);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = _2075;
    float _2203 = _2163;
    if (_2107)
    {
        float3 _6365 = float3(_2057, _2075, float(as_type<int>(_2163)));
        float3 _6369 = select(_6365, float3(0.0), isnan(_6365));
        float _2205 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6369.xy, uint(rint(_6369.z)), _2171, level(0.0));
        _2201 = _2205;
    }
    float _2207 = _2201;
    float3 _6379 = float3(_2197, _2199, _2169);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6379, float3(0.0), isnan(_6379)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6379, float3(0.0), isnan(_6379)), level(0.0)).x;
    float3 _6388 = float3(_2197, _2199, _2169);
    float4 _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6388, float3(0.0), isnan(_6388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6388, float3(0.0), isnan(_6388)), level(0.0)).xyzw;
    float _2214 = _2212.x;
    float _2216 = _2212.y;
    float _2218 = _2212.z;
    float _2220 = _2212.w;
    float _2222 = _2195;
    float _2224 = _2187;
    if (!_1743)
    {
        float3 _6412 = float3(_2195, _2147, float(as_type<int>(_2187)));
        float3 _6414 = select(_6412, float3(0.0), isnan(_6412));
        float _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6414.xy, uint(rint(_6414.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6414.xy, uint(rint(_6414.z)), level(0.0)).x;
        _2222 = _2226;
    }
    float _2228 = _2222;
    if (_1743)
    {
        _1813 = 1.0;
    }
    float _2230 = _1813;
    float _2232 = _2230;
    float _2234 = _2216;
    float _2236 = _2214;
    if (!_1743)
    {
        int _2238 = _1787 << 4;
        int _2240 = _2238 + 2048;
        uint _2242 = uint(int(uint(_2240) >> uint(2)));
        uint _2244 = uint(int(uint(int(_2242)) >> uint(2)));
        int _2246 = int(_2242) & 3;
        float _2248 = (*spvDescriptorSet0.vp_c15)._m0[int(_2244)][_2246];
        int _2250 = int(_2242) + 1;
        uint _2252 = uint(int(uint(_2250) >> uint(2)));
        int _2254 = _2250 & 3;
        float _2256 = (*spvDescriptorSet0.vp_c15)._m0[int(_2252)][_2254];
        int _2258 = _2240 + 8;
        uint _2260 = uint(int(uint(_2258) >> uint(2)));
        uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
        int _2264 = int(_2260) & 3;
        float _2266 = (*spvDescriptorSet0.vp_c15)._m0[int(_2262)][_2264];
        int _2268 = int(_2260) + 1;
        uint _2270 = uint(int(uint(_2268) >> uint(2)));
        int _2272 = _2268 & 3;
        float _2274 = (*spvDescriptorSet0.vp_c15)._m0[int(_2270)][_2272];
        float _2276 = _1537 * _2256;
        float _2278 = fma(_1297, _2248, _2276);
        float _2280 = fma(_1301, _2266, _2278);
        float _2282 = _2280 + _2274;
        float _2284 = precise::clamp(_2282, 0.0, 1.0);
        float _2286 = -_2284;
        float _2288 = _2286 + _2228;
        float _2290 = fma(_2288, 500.0, 1.5);
        float _2292 = exp2(_2290);
        float _2294 = 0.0 + _2292;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        _2097 = _2256;
        _2203 = _2248;
        _2232 = _2296;
    }
    float _2298 = _2097;
    float _2300 = _2203;
    float _2302 = _2232;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2306 = _1993 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2310 = _1995 + _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2314 = _1997 + _2312;
    float _2316 = _2306 * _2306;
    float _2318 = fma(_2310, _2310, _2316);
    float _2320 = fma(_2314, _2314, _2318);
    float _2322 = rsqrt(_2320);
    float _2324 = sqrt(_2320);
    float _2326 = _2322 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2328 = _2310 * _2326;
    float _2330 = _2314 * _2326;
    float _2332 = _2328 * _2328;
    float _2334 = _2330 * _2330;
    float _2336 = _2332 + _2334;
    float _2338 = sqrt(_2336);
    bool _2340 = _2338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2344 = _2338 + _2342;
    float _2346 = _2322;
    float _2348 = _2344;
    float _2350 = _2298;
    float _2352 = _2306;
    if (_2340)
    {
        float _2354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2346 = _2354;
    }
    float _2356 = _2346;
    float _2358 = _2356;
    if (_2340)
    {
        float _2360 = _2344 * _2356;
        _2348 = _2360;
    }
    float _2362 = _2348;
    if (_2340)
    {
        float _2364 = rsqrt(_2336);
        _2358 = _2364;
    }
    float _2366 = _2358;
    float _2368 = _2366;
    if (_2340)
    {
        float _2370 = _2362 * 0.15915493667125701904296875;
        _2350 = _2370;
    }
    float _2372 = _2350;
    float _2374 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2376 = _2314;
    float _2378 = _2372;
    if (_2340)
    {
        float _2380 = _2372 * 6.283185482025146484375;
        float _2382 = sin(_2380);
        _2376 = _2382;
    }
    float _2384 = _2376;
    float _2386 = precise::max(0.0, _2374);
    float _2388 = _2300;
    if (_2340)
    {
        float _2390 = _2372 * 6.283185482025146484375;
        float _2392 = cos(_2390);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = -_2326;
    float _2398 = -_2386;
    float _2400 = fma(_2306, _2396, _2398);
    float _2402 = _2400;
    if (_2340)
    {
        float _2404 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2404;
    }
    float _2406 = _2352;
    float _2408 = _2384;
    float _2410 = _2406;
    if (_2340)
    {
        float _2412 = fma(_2384, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2408 = _2412;
    }
    float _2414 = _2408;
    float _2416 = _2414;
    if (_2340)
    {
        float _2418 = _2366 * _2414;
        _2224 = _2418;
    }
    float _2420 = _2224;
    if (!_2340)
    {
        _2416 = _2328;
    }
    float _2422 = _2416;
    float _2424 = _2422;
    float _2426 = _2394;
    if (_2340)
    {
        float _2428 = _2394 + (-1.0);
        _2410 = _2428;
    }
    float _2430 = _2410;
    float _2432 = _2430;
    if (_2340)
    {
        float _2434 = _2328 * _2420;
        _2424 = _2434;
    }
    float _2436 = _2424;
    if (!_2340)
    {
        _2368 = _2332;
    }
    float _2438 = _2368;
    float _2440 = _2438;
    if (_2340)
    {
        float _2442 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2378 = _2442;
    }
    float _2444 = _2378;
    if (!_2340)
    {
        _2432 = _2330;
    }
    float _2446 = _2432;
    float _2448 = _2446;
    if (_2340)
    {
        float _2450 = _2330 * _2420;
        _2448 = _2450;
    }
    float _2452 = _2448;
    if (_2340)
    {
        float _2454 = _2436 * _2436;
        _2440 = _2454;
    }
    float _2456 = _2440;
    if (_2340)
    {
        float _2458 = fma(_2400, _2394, _2444);
        _2402 = _2458;
    }
    float _2460 = _2402;
    if (!_2340)
    {
        _2426 = _2334;
    }
    float _2462 = _2426;
    float _2464 = _2462;
    if (_2340)
    {
        float _2466 = _2452 * _2452;
        _2464 = _2466;
    }
    float _2468 = _2464;
    float _2470 = fma(_2460, _2460, _2456);
    float _2472 = _2470 + _2468;
    float _2474 = rsqrt(_2472);
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2478 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2476);
    float _2480 = precise::clamp(_2478, 0.0, 1.0);
    float _2482 = -_2480;
    float _2484 = _2482 + 1.0;
    float _2486 = _2474 * _2460;
    float _2488 = _2474 * _2436;
    float _2490 = abs(_2484);
    float _2492 = log2(_2490);
    float _2494 = _2474 * _2452;
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = -_2496;
    float _2500 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2498);
    float _2502 = -_2494;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2500);
    float _2506 = fma(_2504, -0.5, 0.5);
    float _2508 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2510 = fma(_2504, 0.5, 0.5);
    float _2512 = sqrt(_2506);
    float _2514 = fma(_2510, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2516 = fma(_2510, _2514, -0.212114393711090087890625);
    float _2518 = _2486 + 1.0;
    float _2520 = exp2(_2508);
    float _2522 = fma(_2510, _2516, 1.570728778839111328125);
    float _2524 = _2512 * 0.636619746685028076171875;
    float _2526 = -_2522;
    float _2528 = fma(_2524, _2526, 1.0);
    float _2530 = -_2486;
    float _2532 = fma(_2520, _2518, _2530);
    float _2534 = fma(_2532, 0.5, 0.5);
    float2 _6886 = float2(_2528, _2534);
    float3 _2538 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6886, float2(0.0), isnan(_6886)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6886, float2(0.0), isnan(_6886)), level(0.0)).xyz;
    float _2540 = _2538.x;
    float _2542 = _2538.y;
    float _2544 = _2538.z;
    float _2546 = abs(_1551);
    float _2548 = log2(_2546);
    float _2550 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2552 = -_1495;
    float _2554 = _2552 + 1.0;
    float _2556 = _2149 + _2121;
    bool _2558 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2560 = isnan(_2324);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2566 = _2562 || _2564;
    float _2568 = exp2(_2550);
    bool _2570 = _1551 <= 8000.0;
    bool _2572 = isnan(_1551);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(8000.0);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    float _2582 = _2556 * 0.5;
    float _2584 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2586 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2588 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2586);
    float _2590 = exp2(_2584);
    float _2592 = -_2568;
    float _2594 = _2592 + 1.0;
    float _2596 = fma(_2061, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2588);
    float _2598 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2600 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2596);
    float _2602 = _2598 * _2209;
    out.gl_Position.x = _2149;
    out.gl_Position.y = _2167;
    out.gl_Position.z = _2600;
    out.gl_Position.w = _2121;
    float _2604 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2606 = precise::clamp(_2604, 0.0, 1.0);
    float _2608 = _2600 + _2121;
    float _2610 = fma(_2606, -2.0, 3.0);
    float _2612 = _2606 * _2606;
    float _2614 = _2608 * 0.5;
    float _2616 = _2612 * _2610;
    float _2618 = -_2598;
    float _2620 = _2618 + 1.0;
    float _2622 = -_2616;
    float _2624 = _2622 + 1.0;
    float _2626 = _2220 * _2620;
    float _2628 = _2620;
    if (!_2566)
    {
        _2628 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2630 = _2628;
    float _2632 = fma(_2624, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2616);
    float _2634 = _2121 * 0.5;
    float _2636 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2638 = _2580 * _2632;
    float _2640 = fma(_2167, -0.5, _2634);
    float _2642 = _2634;
    float _2644 = _2630;
    float _2646 = _2630;
    if (!_2107)
    {
        _2642 = 1.0;
    }
    float _2648 = _2642;
    float _2650 = _2220 * _2602;
    float _2652 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2654 = _2648;
    float _2656 = _2650;
    if (_2107)
    {
        bool _2658 = _2207 >= _2171;
        bool _2660 = isnan(_2207);
        bool _2662 = _2658 || _2660;
        bool _2664 = isnan(_2171);
        bool _2666 = _2662 || _2664;
        float _2668 = float(_2666);
        _2654 = _2668;
    }
    float _2670 = _2654;
    out.m_93.x = _2582;
    out.m_93.y = _2640;
    out.m_93.z = _2614;
    out.m_93.w = _2121;
    if (!_2566)
    {
        _1579 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2672 = _1579;
    float _2674 = _2554 * _2652;
    float _2676 = precise::clamp(_2674, 0.0, 1.0);
    float _2678 = _2670 * _2302;
    float _2680 = -_2676;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2684 = -_2678;
    float _2686 = fma(_2684, _2682, 1.0);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2692 = _2688;
    float _2694 = _2672;
    float _2696 = _2672;
    if (!_2566)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2698 = _2692;
    out.m_95.x = _2690;
    float _2700 = _2544 * _2602;
    float _2702 = fma(_2540, _2650, _2214);
    float _2704 = fma(_2542, _2650, _2216);
    float _2706 = _2698;
    float _2708 = _2698;
    if (!_2566)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2710 = _2656;
    float _2712 = fma(_2220, _2700, _2218);
    float _2714 = _2710;
    float _2716 = _2710;
    if (!_2566)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2718 = _2234;
    float _2720 = _2718;
    float _2722 = _2718;
    if (!_2566)
    {
        _2236 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2236;
    out.m_97.x = _2702;
    out.m_97.y = _2704;
    out.m_97.z = _2712;
    out.m_97.w = _2626;
    bool _2726 = !_2566;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2726)
    {
        bool _2732 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2734 = isnan(_2324);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2740 = _2736 || _2738;
        if (!_2740)
        {
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2744 = _2324 + _2742;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2746;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2754 = 1.0 / _2748;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2772 = _2744 * _2754;
            float _2774 = precise::clamp(_2772, 0.0, 1.0);
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2780 = fma(_2774, _2752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2716 = _2780;
            _2730 = _2788;
            _2646 = _2784;
            _2722 = _2786;
            _2696 = _2782;
            _2708 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2796 = isnan(_2324);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2804 = _2644;
            _2646 = _2804;
            if (!_2802)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2806 = _2714;
            _2716 = _2806;
            if (!_2802)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2808 = _2694;
            _2696 = _2808;
            if (!_2802)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2810 = _2720;
            _2722 = _2810;
            if (!_2802)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2812 = _2728;
            _2730 = _2812;
            if (!_2802)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2814 = _2706;
            bool _2816 = !_2802;
            _2708 = _2814;
            if (!_2816)
            {
                bool _2818 = _2324 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2820 = isnan(_2324);
                bool _2822 = _2818 || _2820;
                bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2826 = _2822 || _2824;
                if (!_2826)
                {
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2830 = _2324 + _2828;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2832;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2840 = 1.0 / _2834;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2858 = _2830 * _2840;
                    float _2860 = precise::clamp(_2858, 0.0, 1.0);
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2866 = fma(_2860, _2838, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2868 = fma(_2860, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2870 = fma(_2860, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2872 = fma(_2860, _2848, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2874 = fma(_2860, _2852, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2876 = fma(_2860, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2716 = _2866;
                    _2730 = _2874;
                    _2646 = _2870;
                    _2722 = _2872;
                    _2696 = _2868;
                    _2708 = _2876;
                    _2792 = true;
                }
                else
                {
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2792 = false;
    float _2878 = _2716;
    float _2880 = _2730;
    float _2882 = _2646;
    float _2884 = _2722;
    float _2886 = _2696;
    float _2888 = _2708;
    float _2890 = fma(_1261, -0.5, 0.5);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -_2878;
    float _2896 = _2894 + _2880;
    float _2898 = -_2882;
    float _2900 = _2898 + _2884;
    float _2902 = -_2886;
    float _2904 = _2902 + _2888;
    bool _2906 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2908 = fma(_2892, _2896, _2878);
    float _2910 = fma(_2892, _2900, _2882);
    float _2912 = fma(_2892, _2904, _2886);
    float _2914 = _2636 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2916 = _2908 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _2918 = fma(_2910, 0.298911988735198974609375, _2916);
    out.m_61.x = _2914;
    float _2920 = fma(_2912, 0.114477999508380889892578125, _2918);
    float _2922 = -_2920;
    float _2924 = _2910 + _2922;
    float _2926 = -_2920;
    float _2928 = _2908 + _2926;
    float _2930 = -_2920;
    float _2932 = _2912 + _2930;
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    float _2938 = fma(_2932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2920);
    out.m_101.x = _2934;
    out.m_101.y = _2936;
    out.m_101.z = _2938;
    if (!_2906)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2940 = -_1993;
    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2944 = -_1995;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2948 = -_1997;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = fma(_2950, _2950, _2954);
    float _2958 = sqrt(_2956);
    float _2960 = rsqrt(_2956);
    float _2962 = -_2958;
    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = _2946 * _2960;
    float _2972 = _2942 * _2960;
    float _2974 = abs(_2968);
    float _2976 = log2(_2974);
    float _2978 = _2950 * _2960;
    float _2980 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2982 = _1261 * _2972;
    float _2984 = -_2972;
    float _2986 = -_2980;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2986);
    float _2990 = fma(_1259, _2970, _2982);
    float _2992 = -_2978;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2988);
    float _2996 = fma(_1263, _2978, _2990);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3002 = _2994 + _3000;
    float _3004 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3008 = precise::clamp(_3006, 0.0, 1.0);
    float _3010 = exp2(_3004);
    float _3012 = _3010 * _3008;
    float _3014 = _2998 * _3012;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _3016;
    out.m_99.y = _3018;
    out.m_99.z = _3020;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

