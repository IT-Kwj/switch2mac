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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_89 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_101 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad2 [[user(locn2)]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_85 [[attribute(11)]];
    float4 m_77 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad2 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_56.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2839 = as_type<float>(_138);
        out.gl_Position.z = _2839;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2908 = as_type<float>(_176);
        out.gl_Position.z = _2908;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_63.x;
    float _180 = in.m_63.y;
    float _182 = in.m_63.z;
    float _184 = in.m_65.x;
    float _186 = in.m_65.y;
    float _188 = in.m_65.z;
    float _190 = in.m_67.x;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = 0.0;
    float _226 = _216;
    float _228 = _214;
    float _230 = _210;
    float _232 = _212;
    if (_220)
    {
        float _234 = rsqrt(_208);
        _224 = _234;
    }
    float _236 = _224;
    float _238 = 0.0;
    if (!_220)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _218 > 0.0;
    float _244 = _218;
    float _246 = _240;
    if (!_220)
    {
        _244 = 0.0;
        _226 = 0.0;
    }
    float _248 = _244;
    float _250 = _226;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _248;
    if (!_222)
    {
        _252 = 0.0;
        _254 = 0.0;
    }
    float _260 = _252;
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    float _268 = _260;
    if (_222)
    {
        float _270 = rsqrt(_210);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_222)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_212);
        _278 = _282;
    }
    float _284 = _278;
    if (_220)
    {
        float _286 = _236 * _184;
        _246 = _286;
    }
    float _288 = _246;
    if (_220)
    {
        float _290 = _236 * _178;
        _256 = _290;
    }
    float _292 = _256;
    if (_220)
    {
        float _294 = _236 * _190;
        _258 = _294;
    }
    float _296 = _258;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_242)
    {
        _228 = 0.0;
    }
    float _300 = _228;
    float _302 = _300;
    if (_222)
    {
        float _304 = _272 * _186;
        _280 = _304;
    }
    float _306 = _280;
    if (!_242)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _308 = _230;
    float _310 = _232;
    float _312 = _308;
    float _314 = _310;
    if (_222)
    {
        float _316 = _272 * _180;
        _266 = _316;
    }
    float _318 = _266;
    if (_222)
    {
        float _320 = _272 * _192;
        _268 = _320;
    }
    float _322 = _268;
    if (_242)
    {
        float _324 = _284 * _188;
        _312 = _324;
    }
    float _326 = _312;
    if (_242)
    {
        float _328 = _284 * _182;
        _314 = _328;
    }
    float _330 = _314;
    if (_242)
    {
        float _332 = _284 * _194;
        _302 = _332;
    }
    float _334 = _302;
    bool _336 = !_298;
    float _354;
    if (!_336)
    {
        float _338 = in.m_69.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_122);
        float _360 = 1.0 / _358;
        float _362 = _156 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_56.x;
    float _368 = in.m_56.y;
    float _370 = in.m_56.z;
    float _372 = in.m_65.w;
    float _374 = in.m_67.w;
    float _376 = _186 * _368;
    float _378 = _192 * _368;
    float _380 = fma(_184, _366, _376);
    float _382 = fma(_190, _366, _378);
    float _384 = fma(_188, _370, _380);
    float _386 = fma(_194, _370, _382);
    float _388 = _384 + _372;
    float _390 = _386 + _374;
    float _392 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _394 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _396 = floor(_392);
    float _398 = floor(_394);
    float _400 = -_396;
    float _402 = _392 + _400;
    float _404 = -_398;
    float _406 = _394 + _404;
    float2 _3232 = float2(_402, _406);
    float _408 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3232, float2(0.0), isnan(_3232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3232, float2(0.0), isnan(_3232)), level(0.0)).x;
    float _410 = in.m_69.x;
    float _412 = _180 * _368;
    float _414 = in.m_69.y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _420;
    float _424 = in.m_69.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = 1.0 / _418;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _436 = fma(_178, _366, _412);
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _440 = _438 != 0;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _444 = _442 != 0;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _448 = _446 != 0;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _452 = 1.0 / _422;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _456 = _364 + _454;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _460 = fma(_182, _370, _436);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _464 = _364 + _462;
    float _466 = in.m_63.w;
    float _468 = 1.0 / _428;
    float _470 = _410 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _472 = _414 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _474 = _456 * _430;
    float _476 = -_450;
    float _478 = fma(_470, 2.0, _476);
    float _480 = _414 + _424;
    float _482 = fma(_472, -2.0, _458);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _486 = _364 + _484;
    float _488 = _480 + (-1.0);
    float _490 = 1.0 / _434;
    float _492 = _486 * _452;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _496 = _364 + _494;
    float _498 = _424 * 2.0;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _502 = _410 + _424;
    float _504 = _496 * _468;
    float _506 = _410 + _414;
    float _508 = floor(_498);
    float _510 = _410 * 2.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = _414 * 2.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _522 = fma(_514, _492, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = _464 * _490;
    float _526 = _502 + (-1.0);
    float _528 = _506 + (-1.0);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _530;
    float _534 = floor(_510);
    float _536 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _538 = fma(_532, _492, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _540 = _508 >= 0.0;
    bool _542 = isnan(_508);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _552 = _508 > 0.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    float _558 = floor(_516);
    int _560 = _548 ? 0 : 1;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _562;
    float _566 = fma(_556, _492, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    bool _588 = _534 >= 0.0;
    bool _590 = isnan(_534);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _602 = _534 > 0.0;
    float _604 = fma(_574, _524, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _606 = _596 ? 0 : 1;
    float _608 = fma(_578, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _610 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _612 = isnan(_364);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = fma(_520, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _624 = _558 > 0.0;
    float _626 = fma(_582, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _628 = _558 >= 0.0;
    bool _630 = isnan(_558);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _640 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _642 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _644 = isnan(_364);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _586 * _156;
    bool _656 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _658 = isnan(_364);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _676 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _678 = isnan(_364);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_620;
    float _690 = _688 + 1.0;
    float _692 = exp2(_654);
    float _694 = fma(_674, _524, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _696 = fma(_600, _524, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _698 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _700 = isnan(_364);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_670, _504, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _712 = -_156;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _716 = -_708;
    float _718 = _716 + 1.0;
    float _720 = _708 * _690;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    int _726 = _636 ? 0 : 1;
    float _728 = _686 * _718;
    bool _730 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _738 = _734 || _736;
    float _740 = -_686;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _724;
    float _746 = -_692;
    float _748 = _746 + 1.0;
    float _750 = _666 * _742;
    float _752 = -_666;
    float _754 = _752 + 1.0;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _758 = _738 ? _748 : 0.0;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = _652 * _754;
    float _774 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[78].z, _756);
    float _776 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[78].w, _760);
    float _778 = -_652;
    float _780 = _778 + 1.0;
    float _782 = _522 * _772;
    float _784 = _566 * _772;
    float _786 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _774);
    float _788 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _776);
    float _790 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _482);
    float _792 = _538 * _772;
    float _794 = _460 + _466;
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].x, _784);
    float _798 = _790;
    if (_770)
    {
        float _800 = _758 * _744;
        _160 = _800;
    }
    float _802 = _160;
    float _804 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].y, _782);
    bool _806 = !_444;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].z, _792);
    int _812 = ~_726;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_608, _750, _796);
    int _820 = abs(_808);
    float _822 = fma(_622, _750, _804);
    int _824 = _816;
    if (!_624)
    {
        int _826 = ~_726;
        int _828 = _826 + 1;
        _824 = _828;
    }
    int _830 = _824;
    float _832 = fma(_626, _750, _810);
    float _834 = _794 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _836 = ~_606;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = in.m_71.x;
    float _844 = in.m_71.y;
    float _846 = in.m_71.z;
    int _848 = _840;
    if (!_602)
    {
        int _850 = ~_606;
        int _852 = _850 + 1;
        _848 = _852;
    }
    int _854 = _848;
    float _856 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[11].x, _834);
    float _858 = fma(_638, _728, _818);
    float _860 = float(_820);
    float _862 = _794 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _864 = float(_854);
    float _866 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _856);
    float _868 = fma(_710, _728, _822);
    float _870 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[10].x, _862);
    float _872 = fma(_640, _728, _832);
    float _874 = _860 * _864;
    float _876 = _866 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _878 = !_440;
    int _880 = _878 ? 0 : 1;
    float _882 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _870);
    bool _884 = !_448;
    int _886 = _884 ? 0 : 1;
    float _888 = 1.0 / _876;
    int _890 = ~_560;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = _874 * (-2.0);
    int _898 = _894;
    if (!_552)
    {
        int _900 = ~_560;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = _882 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _908 = abs(_880);
    float _910 = fma(_500, _896, _500);
    int _912 = abs(_886);
    float _914 = fma(_896, _844, _844);
    float _916 = float(_908);
    float _918 = _414 + (-0.5);
    float _920 = float(_904);
    float _922 = _906 + _876;
    float _924 = float(_912);
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[196].y, _914);
    float _928 = float(_830);
    float _930 = _916 * _920;
    float _932 = _922 * _888;
    float _934 = _932 * 0.5;
    float _936 = fma(_910, _802, _926);
    float _938 = _924 * _928;
    float _940 = _930 * (-2.0);
    float _942 = in.m_73.x;
    float _944 = in.m_73.y;
    float _946 = in.m_73.z;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _950 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _948);
    float _952 = _410 + (-0.5);
    float _954 = fma(_940, _842, _842);
    float _956 = in.m_75.x;
    float _958 = in.m_75.y;
    float _960 = in.m_75.z;
    float _962 = fma(_550, _940, _550);
    float _964 = _938 * (-2.0);
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].x, _954);
    float _968 = fma(_604, _720, _858);
    float _970 = 1.0 / _950;
    float _972 = fma(_694, _720, _868);
    float _974 = fma(_962, _802, _966);
    float _976 = fma(_964, _846, _846);
    float _978 = _424 + (-0.5);
    float _980 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].x, _968);
    float _982 = fma(_536, _964, _536);
    float _984 = fma(_696, _720, _872);
    float _986 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _976);
    float _988 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].y, _972);
    float _990 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].z, _984);
    float _992 = fma(_982, _802, _986);
    float _994 = _936 * 0.15915493667125701904296875;
    float _996 = _974 * 0.15915493667125701904296875;
    float _998 = _980 * _942;
    float _1000 = _990 * _946;
    float _1002 = _992 * 0.15915493667125701904296875;
    float _1004 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _956);
    float _1008 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = _988 * _944;
    float _1012 = _994 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _958);
    float _1018 = _1006 * _1008;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1022 = _970 * _1020;
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = _794 + _1004;
    float _1028 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _960);
    float _1032 = _994 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    bool _1036 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1038 = _1016 * _1024;
    bool _1040 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1042 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1044 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1046 = _1030 * _1028;
    float _1048 = _1002 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1042);
    bool _1054 = !_1036;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1044);
    int _1060 = 2;
    if (!_1036)
    {
        _1060 = 1;
    }
    int _1062 = _1060;
    float _1064 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1058);
    float _1066 = _1002 * 6.283185482025146484375;
    float _1068 = cos(_1066);
    int _1070 = _1062;
    if (!_1040)
    {
        _1070 = _1056;
    }
    int _1072 = _1070;
    float _1074 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1076 = _1072 << 6;
    float _1078 = _996 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _1014 * _1050;
    float _1084 = _1034 * _1050;
    float _1086 = _996 * 6.283185482025146484375;
    float _1088 = sin(_1086);
    float _1090 = _1034 * _1068;
    float _1092 = _1014 * _1068;
    float _1094 = _1068 * _1080;
    float _1096 = _1050 * _1080;
    float _1098 = _1014 * _1080;
    float _1100 = _1034 * _1080;
    float _1102 = _1094 * _1038;
    float _1104 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1052);
    float _1106 = trunc(_1074);
    int _1108 = int(_1106);
    float _1110 = fma(_1088, _1082, _1090);
    float _1112 = fma(_1088, _1090, _1082);
    float _1114 = -_1092;
    float _1116 = fma(_1088, _1084, _1114);
    int _1118 = _1076 + 96;
    uint _1121 = uint(int(uint(_1118) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.vp_c15)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.vp_c15)._m0[int(_1131)][_1133];
    float _1137 = -_1084;
    float _1139 = fma(_1088, _1092, _1137);
    float _1141 = fma(_1096, _1018, _1102);
    float _1143 = _1112 * _1038;
    float _1145 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1147 = _1139 * _1038;
    float _1149 = -_1088;
    float _1151 = fma(_1149, _1046, _1141);
    float _1153 = fma(_1116, _1018, _1143);
    int _1155 = _1076 + 104;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[int(_1167)][_1169];
    float _1173 = fma(_1110, _1018, _1147);
    float _1175 = trunc(_1145);
    int _1177 = int(_1175);
    float _1179 = _1151 * _306;
    float _1181 = fma(_1100, _1046, _1153);
    float _1183 = fma(_1098, _1046, _1173);
    float _1185 = _1151 * _322;
    float _1187 = _1151 * _318;
    int _1189 = _1076 + 48;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    uint _1193 = uint(int(uint(int(_1191)) >> uint(2)));
    int _1195 = int(_1191) & 3;
    float _1197 = (*spvDescriptorSet0.vp_c15)._m0[int(_1193)][_1195];
    int _1199 = int(_1191) + 1;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    int _1203 = _1199 & 3;
    float _1205 = (*spvDescriptorSet0.vp_c15)._m0[int(_1201)][_1203];
    float _1207 = fma(_1183, _288, _1179);
    float _1209 = fma(_1183, _296, _1185);
    int _1211 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1213 = _1108 + _1211;
    int _1215 = _1213 + 1;
    float _1217 = fma(_1181, _326, _1207);
    float _1219 = fma(_1181, _334, _1209);
    bool _1221 = _1215 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1223 = _1076 + 64;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
    float _1241 = _388 + _1217;
    float _1243 = _390 + _1219;
    int _1245 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1247 = _1177 + _1245;
    int _1249 = _1247 + 1;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1253 = _1241 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1257 = _1243 + _1255;
    int _1259 = _1215 | _1249;
    int _1261 = _1076 + 56;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
    float _1279 = _1257 * _1257;
    bool _1281 = _1259 < 0;
    bool _1283 = _1281 || _1221;
    float _1285 = fma(_1253, _1253, _1279);
    bool _1287 = _1249 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1289 = _1287 || _1283;
    int _1291 = _1076 + 72;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.vp_c15)._m0[int(_1303)][_1305];
    float _1309 = sqrt(_1285);
    int _1311 = _1076 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = _1026 * _1135;
    int _1331 = as_type<int>(_1151);
    float _1333 = _1187;
    if (!_1289)
    {
        int _1335 = _1249 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1337 = _1335 + _1215;
        _1331 = _1337;
    }
    int _1339 = _1331;
    float _1341 = fma(_388, _1127, _1329);
    float _1343 = fma(_1183, _292, _1187);
    float _1345 = _1183;
    if (!_1289)
    {
        float _1347 = floor(_1074);
        _1345 = _1347;
    }
    float _1349 = _1345;
    float _1351 = fma(_390, _1163, _1341);
    bool _1353 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1355 = _1351 + _1171;
    float _1357 = _1026 * _1205;
    float _1359 = 1.0 / _1355;
    float _1361 = fma(_388, _1197, _1357);
    float _1363 = fma(_1181, _330, _1343);
    float _1365 = _1026 * _1239;
    int _1367 = as_type<int>(_1239);
    int _1369 = as_type<int>(_1231);
    float _1371 = _1361;
    float _1373 = _1365;
    if (!_1289)
    {
        int _1375 = _1339 << 2;
        _1367 = _1375;
    }
    int _1377 = _1367;
    float _1379 = _794 + _1363;
    float _1381 = fma(_388, _1231, _1365);
    int _1383 = _1377;
    float _1385 = _1379;
    if (!_1289)
    {
        uint _1387 = uint(int(uint(_1339) >> uint(2)));
        _1369 = int(_1387);
    }
    int _1389 = _1369;
    int _1391 = _1389;
    if (!_1289)
    {
        int _1393 = 12 & _1377;
        _1383 = _1393;
    }
    int _1395 = _1383;
    float _1397 = fma(_390, _1269, _1361);
    if (!_1353)
    {
        _1371 = _1241;
    }
    float _1399 = _1371;
    float _1401 = _1399;
    if (!_1289)
    {
        int _1403 = _1389 << 4;
        int _1405 = _1403 + _1395;
        _1391 = _1405;
    }
    int _1407 = _1391;
    float _1409 = _1397 + _1277;
    if (!_1353)
    {
        _1373 = _1243;
    }
    float _1411 = _1373;
    float _1413 = fma(_390, _1299, _1381);
    float _1415 = _1413 + _1307;
    bool _1417 = !_1353;
    float _1419 = _1411;
    if (!_1417)
    {
        float _1421 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1425 = _1309 + _1423;
        float _1427 = _1379 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1429 = rsqrt(_1285);
        float _1431 = _1425 * _1421;
        float _1433 = _1431 * 0.15915493667125701904296875;
        float _1435 = _1433 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1433 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = _1437 + (-1.0);
        float _1445 = fma(_1441, _1427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1447 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = _1429 * _1445;
        float _1451 = fma(_1379, _1437, _1447);
        float _1453 = fma(_1253, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1455 = fma(_1257, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1385 = _1451;
        _1401 = _1453;
        _1419 = _1455;
    }
    float _1457 = _1385;
    float _1459 = _1401;
    float _1461 = _1419;
    int _1463 = _1076 + 88;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    float _1481 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1483 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1485 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1487 = _1409 * _1359;
    float _1489 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1481);
    float _1491 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1483);
    float _1493 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1485);
    float _1495 = _1257;
    if (!_1289)
    {
        int _1497 = _1407 + 400;
        uint _1499 = uint(int(uint(_1497) >> uint(2)));
        uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
        int _1503 = int(_1499) & 3;
        float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
        _1495 = _1505;
    }
    float _1507 = _1495;
    float _1509 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1489);
    bool _1511 = _1487 >= 0.0;
    float _1513 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1491);
    float _1515 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1517 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = _1415 * _1359;
    bool _1523 = _1487 <= 1.0;
    bool _1525 = _1523 && _1511;
    float _1527 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1529 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1515);
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1535 = _1521 >= 0.0;
    bool _1537 = _1535 && _1525;
    float _1539 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1541 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1543 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1529);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1533);
    bool _1547 = _1521 <= 1.0;
    bool _1549 = _1547 && _1537;
    float _1551 = -_1541;
    float _1553 = fma(_1551, _1539, 1.0);
    float _1555 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1557 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1559 = _1026 * _1327;
    float _1561 = _1243;
    float _1563 = _1513;
    if (!_1289)
    {
        float _1565 = floor(_1145);
        _1561 = _1565;
    }
    float _1567 = _1561;
    float _1569 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1571 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1557);
    float _1573 = fma(_388, _1319, _1559);
    float _1575 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1577 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1569);
    float _1579 = log2(_1553);
    if (_1549)
    {
        float _1581 = float(_1072);
        _1563 = _1581;
    }
    float _1583 = _1563;
    float _1585 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1575);
    float _1587 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1577);
    float _1589 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1585);
    float _1591 = 1.0 / _1571;
    float _1593 = fma(_390, _1471, _1573);
    float _1595 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1587);
    float _1597 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1599 = _1567;
    float _1601 = _1585;
    if (!_1289)
    {
        float _1603 = -_1567;
        float _1605 = _1145 + _1603;
        _1599 = _1605;
    }
    float _1607 = _1599;
    float _1609 = _1593 + _1479;
    float _1611 = _1569;
    if (_1549)
    {
        float _1613 = rint(_1583);
        float _1615 = precise::max(_1613, 0.0);
        uint _1617 = uint(_1615);
        uint _1619 = clamp(_1617, 0u, 65535u);
        _1611 = as_type<float>(_1619);
    }
    float _1621 = _1611;
    float _1623 = _1609 * _1359;
    float _1625 = _1579 * 0.693147182464599609375;
    float _1627 = _1625 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1629 = _1625;
    if (!_1289)
    {
        float _1631 = -_1349;
        float _1633 = _1074 + _1631;
        _1629 = _1633;
    }
    float _1635 = _1629;
    float _1637 = _1609;
    if (!_1289)
    {
        float _1639 = rint(_1507);
        float _1641 = precise::max(_1639, 0.0);
        uint _1643 = uint(_1641);
        uint _1645 = clamp(_1643, 0u, 65535u);
        _1637 = as_type<float>(_1645);
    }
    float _1647 = _1637;
    float _1649 = _1595 * _1591;
    float _1651 = _1597 * _1591;
    float _1653 = fma(_1649, 0.5, 0.5);
    float _1655 = fma(_1651, -0.5, 0.5);
    float _1657 = _1521;
    if (_1549)
    {
        float3 _5261 = float3(_1487, _1521, float(as_type<int>(_1621)));
        float3 _5265 = select(_5261, float3(0.0), isnan(_5261));
        float _1659 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5265.xy, uint(rint(_5265.z)), _1623, level(0.0));
        _1657 = _1659;
    }
    float _1661 = _1657;
    float3 _5275 = float3(_1653, _1655, _1627);
    float _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5275, float3(0.0), isnan(_5275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5275, float3(0.0), isnan(_5275)), level(0.0)).x;
    float3 _5284 = float3(_1653, _1655, _1627);
    float4 _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).xyzw;
    float _1668 = _1666.x;
    float _1670 = _1666.y;
    float _1672 = _1666.z;
    float _1674 = _1666.w;
    float _1676 = _1607;
    if (!_1289)
    {
        float3 _5307 = float3(_1635, _1607, float(as_type<int>(_1647)));
        float3 _5309 = select(_5307, float3(0.0), isnan(_5307));
        float _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5309.xy, uint(rint(_5309.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5309.xy, uint(rint(_5309.z)), level(0.0)).x;
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (_1289)
    {
        _1601 = 1.0;
    }
    float _1682 = _1601;
    float _1684 = _1682;
    float _1686 = _1680;
    if (!_1289)
    {
        int _1688 = _1339 << 4;
        int _1690 = _1688 + 2048;
        uint _1692 = uint(int(uint(_1690) >> uint(2)));
        uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
        int _1696 = int(_1692) & 3;
        float _1698 = (*spvDescriptorSet0.vp_c15)._m0[int(_1694)][_1696];
        int _1700 = int(_1692) + 1;
        uint _1702 = uint(int(uint(_1700) >> uint(2)));
        int _1704 = _1700 & 3;
        float _1706 = (*spvDescriptorSet0.vp_c15)._m0[int(_1702)][_1704];
        int _1708 = _1690 + 8;
        uint _1710 = uint(int(uint(_1708) >> uint(2)));
        uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
        int _1714 = int(_1710) & 3;
        float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
        int _1718 = int(_1710) + 1;
        uint _1720 = uint(int(uint(_1718) >> uint(2)));
        int _1722 = _1718 & 3;
        float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
        float _1726 = _1026 * _1706;
        float _1728 = fma(_388, _1698, _1726);
        float _1730 = fma(_390, _1716, _1728);
        float _1732 = _1730 + _1724;
        float _1734 = precise::clamp(_1732, 0.0, 1.0);
        float _1736 = -_1734;
        float _1738 = _1736 + _1680;
        float _1740 = fma(_1738, 500.0, 1.5);
        float _1742 = exp2(_1740);
        float _1744 = 0.0 + _1742;
        float _1746 = precise::clamp(_1744, 0.0, 1.0);
        _1684 = _1746;
    }
    float _1748 = _1684;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1457 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1756 = _1459 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1760 = _1461 + _1758;
    float _1762 = _1752 * _1752;
    float _1764 = fma(_1756, _1756, _1762);
    float _1766 = fma(_1760, _1760, _1764);
    float _1768 = rsqrt(_1766);
    float _1770 = sqrt(_1766);
    float _1772 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1774 = _1756 * _1772;
    float _1776 = _1760 * _1772;
    float _1778 = _1774 * _1774;
    float _1780 = _1776 * _1776;
    float _1782 = _1778 + _1780;
    float _1784 = sqrt(_1782);
    bool _1786 = _1784 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1790 = _1784 + _1788;
    float _1792 = _390;
    float _1794 = _1790;
    float _1796 = _1772;
    float _1798 = _1774;
    float _1800 = _1776;
    float _1802 = _1778;
    float _1804 = _1780;
    if (_1786)
    {
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1806;
    }
    float _1808 = _1792;
    if (_1786)
    {
        float _1810 = _1790 * _1808;
        _1794 = _1810;
    }
    float _1812 = _1794;
    if (_1786)
    {
        float _1814 = _1812 * 0.15915493667125701904296875;
        _1686 = _1814;
    }
    float _1816 = _1686;
    float _1818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1820 = _388;
    if (_1786)
    {
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1820 = _1824;
    }
    float _1826 = _1820;
    float _1828 = precise::max(0.0, _1818);
    float _1830 = _1812;
    float _1832 = _1828;
    if (_1786)
    {
        float _1834 = _1816 * 6.283185482025146484375;
        float _1836 = cos(_1834);
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = -_1772;
    float _1842 = -_1828;
    float _1844 = fma(_1752, _1840, _1842);
    float _1846 = _1844;
    if (_1786)
    {
        float _1848 = _1844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1848;
    }
    float _1850 = _1796;
    float _1852 = _1818;
    float _1854 = _1850;
    if (_1786)
    {
        float _1856 = rsqrt(_1782);
        _1852 = _1856;
    }
    float _1858 = _1852;
    if (_1786)
    {
        float _1860 = fma(_1826, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1832 = _1860;
    }
    float _1862 = _1832;
    float _1864 = _1862;
    if (_1786)
    {
        float _1866 = _1838 + (-1.0);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1858;
    if (_1786)
    {
        float _1872 = _1858 * _1862;
        _1864 = _1872;
    }
    float _1874 = _1864;
    if (_1786)
    {
        float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1876;
    }
    float _1878 = _1870;
    if (_1786)
    {
        float _1880 = _1774 * _1874;
        _1798 = _1880;
    }
    float _1882 = _1798;
    if (_1786)
    {
        float _1884 = fma(_1844, _1838, _1878);
        _1846 = _1884;
    }
    float _1886 = _1846;
    if (_1786)
    {
        float _1888 = _1776 * _1874;
        _1800 = _1888;
    }
    float _1890 = _1800;
    if (_1786)
    {
        float _1892 = _1882 * _1882;
        _1802 = _1892;
    }
    float _1894 = _1802;
    if (_1786)
    {
        float _1896 = _1890 * _1890;
        _1804 = _1896;
    }
    float _1898 = _1804;
    float _1900 = fma(_1886, _1886, _1894);
    float _1902 = _1900 + _1898;
    float _1904 = rsqrt(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1908 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1906);
    float _1910 = precise::clamp(_1908, 0.0, 1.0);
    float _1912 = -_1910;
    float _1914 = _1912 + 1.0;
    float _1916 = abs(_1914);
    float _1918 = log2(_1916);
    float _1920 = _1904 * _1882;
    float _1922 = _1904 * _1886;
    float _1924 = _1904 * _1890;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = -_1926;
    float _1930 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1928);
    float _1932 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1934 = -_1924;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1930);
    float _1938 = fma(_1936, -0.5, 0.5);
    float _1940 = exp2(_1932);
    float _1942 = fma(_1936, 0.5, 0.5);
    float _1944 = fma(_1942, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1946 = sqrt(_1938);
    float _1948 = fma(_1942, _1944, -0.212114393711090087890625);
    float _1950 = _1922 + 1.0;
    float _1952 = fma(_1942, _1948, 1.570728778839111328125);
    float _1954 = -_1922;
    float _1956 = fma(_1940, _1950, _1954);
    float _1958 = fma(_1956, 0.5, 0.5);
    float _1960 = _1946 * 0.636619746685028076171875;
    float _1962 = -_1952;
    float _1964 = fma(_1960, _1962, 1.0);
    float2 _5750 = float2(_1964, _1958);
    float3 _1968 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5750, float2(0.0), isnan(_5750)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5750, float2(0.0), isnan(_5750)), level(0.0)).xyz;
    float _1970 = _1968.x;
    float _1972 = _1968.y;
    float _1974 = _1968.z;
    float _1976 = in.m_77.y;
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1980 = _414 > 0.5;
    float _1982 = in.m_69.w;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    float _1988 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    float _1994 = in.m_77.x;
    int _1996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1998 = _1996 != 0;
    float _2000 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2004 = _2002 != 0;
    float _2006 = exp2(_1988);
    float _2008 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2000);
    float _2010 = -_408;
    float _2012 = _2010 + 1.0;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2024 = -_1976;
    float _2026 = _2024 + 1.0;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2030 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2020;
    bool _2032 = _1982 > 0.5;
    float _2034 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2008);
    out.m_81.x = _1459;
    out.m_81.y = _1457;
    out.m_81.z = _1461;
    int _2036 = _2032 ? as_type<int>(_2026) : as_type<int>(_1976);
    float _2038 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2034);
    bool _2040 = _2032;
    bool _2042 = _2004;
    float _2044 = _1976;
    int _2046 = as_type<int>(_2022);
    if (_1992)
    {
        bool _2048 = _410 > 0.5;
        _2040 = _2048;
    }
    bool _2050 = _2040;
    float _2052 = _2004 ? as_type<float>(_2036) : _1976;
    if (_1986)
    {
        bool _2054 = _424 > 0.5;
        _2042 = _2054;
    }
    bool _2056 = _2042;
    out.gl_Position.x = _1595;
    out.gl_Position.y = _1597;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1571;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1998)
    {
        float _2060 = _1980 ? _2026 : _1976;
        _2044 = _2060;
    }
    float _2062 = _2044;
    float _2064 = in.m_83.x;
    float _2066 = in.m_83.y;
    float _2068 = in.m_83.z;
    bool _2070 = _958 != 0.0;
    bool _2072 = isnan(_958);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = _956 == 0.0;
    bool _2082 = !_2078;
    bool _2084 = _2080 && _2082;
    float _2086 = _1994;
    if (!_1992)
    {
        _1333 = _1994;
    }
    float _2088 = _1333;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2092 = _960 == 0.0;
    bool _2094 = _2092 && _2084;
    float _2096 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2100 = in.m_85.x;
    float _2102 = in.m_85.y;
    float _2104 = in.m_85.z;
    float _2106 = in.m_85.w;
    float _2108 = fma(_2098, _2062, -0.5);
    int _2110 = as_type<int>(_2098);
    float _2112 = _2088;
    float _2114 = _2108;
    float _2116 = _2096;
    if (_1992)
    {
        float _2118 = -_1994;
        float _2120 = _2118 + 1.0;
        _2110 = as_type<int>(_2120);
    }
    int _2122 = _2110;
    out.m_87.x = _2096;
    out.m_87.y = _2022;
    out.m_87.z = _2030;
    out.m_87.w = _2028;
    float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2126 = -_790;
    float _2128 = fma(_788, _2108, _2126);
    if (_1992)
    {
        float _2130 = _2050 ? as_type<float>(_2122) : _1994;
        _2112 = _2130;
    }
    float _2132 = _2112;
    if (_2094)
    {
        _2114 = _2066;
    }
    float _2134 = _2114;
    float _2136 = _2134;
    if (_2094)
    {
        _798 = _2064;
    }
    float _2138 = _798;
    float _2140 = fma(_2018, _2132, -0.5);
    float _2142 = _2138;
    if (!_2094)
    {
        float _2144 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2064);
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = fma(_786, _2140, _714);
    if (_1986)
    {
        float _2150 = -_1994;
        float _2152 = _2150 + 1.0;
        _2046 = as_type<int>(_2152);
    }
    int _2154 = _2046;
    float _2156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2158 = as_type<float>(_2154);
    if (_2094)
    {
        _2116 = _2068;
    }
    float _2160 = _2116;
    float _2162 = _2160;
    if (!_2094)
    {
        float _2164 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2068);
        _2162 = _2164;
    }
    float _2166 = _2162;
    float _2168 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1986)
    {
        float _2170 = _2056 ? as_type<float>(_2154) : _1994;
        _2086 = _2170;
    }
    float _2172 = _2086;
    float _2174 = _2104 * _2064;
    if (_2094)
    {
        _2158 = _2134;
    }
    float _2176 = _2158;
    float _2178 = _2148 + 0.5;
    float _2180 = _2176;
    if (!_2094)
    {
        _2136 = _2066;
    }
    float _2182 = _2136;
    float _2184 = -_2174;
    float _2186 = fma(_2100, _2068, _2184);
    float _2188 = abs(_1022);
    float _2190 = log2(_2188);
    float _2192 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2194 = _1094 * _2102;
    if (!_2094)
    {
        float _2196 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2182);
        _2180 = _2196;
    }
    float _2198 = _2180;
    float _2200 = _2102 * _2068;
    float _2202 = _2100 * _2182;
    float _2204 = _2168 * _2156;
    float _2206 = fma(_1096, _2100, _2194);
    float _2208 = -_2200;
    float _2210 = fma(_2104, _2182, _2208);
    float _2212 = -_2202;
    float _2214 = fma(_2102, _2064, _2212);
    float _2216 = _2192 * _2124;
    float _2218 = _2128 + 0.5;
    float _2220 = _2210 * _2106;
    float _2222 = _2214 * _2106;
    float _2224 = _1112 * _2198;
    float _2226 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2228 = _2186 * _2106;
    float _2230 = _1094 * _2198;
    out.m_89.x = _2178;
    out.m_89.y = _2218;
    out.m_89.z = _2216;
    out.m_89.w = _2204;
    float _2232 = fma(_1116, _2146, _2224);
    float _2234 = _1094 * _2228;
    float _2236 = exp2(_2226);
    float _2238 = fma(_1096, _2146, _2230);
    float _2240 = _1139 * _2198;
    float _2242 = fma(_1096, _2220, _2234);
    float _2244 = _1139 * _2102;
    float _2246 = _1112 * _2102;
    float _2248 = _1139 * _2228;
    float _2250 = _1112 * _2228;
    float _2252 = fma(_1110, _2146, _2240);
    float _2254 = fma(_1110, _2100, _2244);
    float _2256 = fma(_1116, _2100, _2246);
    float _2258 = -_1088;
    float _2260 = fma(_2258, _2104, _2206);
    float _2262 = fma(_1110, _2220, _2248);
    float _2264 = fma(_1116, _2220, _2250);
    float _2266 = -_1088;
    float _2268 = fma(_2266, _2166, _2238);
    float _2270 = -_1088;
    float _2272 = fma(_2270, _2222, _2242);
    float _2274 = fma(_1098, _2166, _2252);
    float _2276 = fma(_1100, _2166, _2232);
    float _2278 = fma(_1098, _2104, _2254);
    float _2280 = fma(_1100, _2104, _2256);
    float _2282 = _2260 * _306;
    float _2284 = _2260 * _318;
    float _2286 = fma(_1098, _2222, _2262);
    float _2288 = fma(_1100, _2222, _2264);
    float _2290 = _2260 * _322;
    float _2292 = _2268 * _306;
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    float _2298 = _2272 * _306;
    float _2300 = _2272 * _318;
    float _2302 = _2272 * _322;
    float _2304 = _2268 * _318;
    float _2306 = fma(_2278, _288, _2282);
    float _2308 = fma(_2278, _292, _2284);
    float _2310 = fma(_2278, _296, _2290);
    float _2312 = fma(_2274, _288, _2292);
    float _2314 = fma(_2286, _288, _2298);
    float _2316 = fma(_2286, _292, _2300);
    float _2318 = fma(_2274, _292, _2304);
    float _2320 = _2268 * _322;
    float _2322 = fma(_2286, _296, _2302);
    float _2324 = fma(_2280, _330, _2308);
    float _2326 = fma(_2280, _334, _2310);
    float _2328 = fma(_2296, -2.0, 3.0);
    float _2330 = _2296 * _2296;
    float _2332 = fma(_2274, _296, _2320);
    float _2334 = fma(_2288, _334, _2322);
    bool _2336 = _1022 <= 8000.0;
    bool _2338 = isnan(_1022);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    float _2348 = _2330 * _2328;
    float _2350 = fma(_2276, _334, _2332);
    float _2352 = fma(_2288, _330, _2316);
    float _2354 = fma(_2280, _326, _2306);
    float _2356 = -_2348;
    float _2358 = _2356 + 1.0;
    float _2360 = fma(_2288, _326, _2314);
    float _2362 = fma(_2276, _326, _2312);
    float _2364 = fma(_2276, _330, _2318);
    float _2366 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2348);
    float _2368 = _2358;
    if (!_1549)
    {
        _2368 = 1.0;
    }
    float _2370 = _2368;
    out.m_91.x = _2354;
    out.m_91.y = _2324;
    out.m_91.z = _2326;
    float _2372 = _2370;
    if (_1549)
    {
        bool _2374 = _1661 >= _1623;
        bool _2376 = isnan(_1661);
        bool _2378 = _2374 || _2376;
        bool _2380 = isnan(_1623);
        bool _2382 = _2378 || _2380;
        float _2384 = float(_2382);
        _2372 = _2384;
    }
    float _2386 = _2372;
    float _2388 = _2346 * _2366;
    bool _2390 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2392 = isnan(_1770);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2398 = _2394 || _2396;
    out.m_93.x = _2360;
    out.m_93.y = _2352;
    out.m_93.z = _2334;
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2402 = -_2006;
    float _2404 = _2402 + 1.0;
    float _2406 = _2386 * _1748;
    out.m_95.x = _2362;
    out.m_95.y = _2364;
    out.m_95.z = _2350;
    float _2408 = _2012 * _2400;
    float _2410 = precise::clamp(_2408, 0.0, 1.0);
    float _2412 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2414 = -_2410;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2418 = _2412 * _1663;
    float _2420 = -_2412;
    float _2422 = _2420 + 1.0;
    float _2424 = _2412;
    float _2426 = _2400;
    float _2428 = _2406;
    float _2430 = _2422;
    if (!_2398)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2432 = _2424;
    float _2434 = -_2406;
    float _2436 = fma(_2434, _2416, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _1674 * _2418;
    float _2442 = _1674 * _2422;
    float _2444 = _2438;
    float _2446 = _2440;
    float _2448 = _2432;
    float _2450 = _2432;
    if (!_2398)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2452 = _2426;
    float _2454 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2398)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2460 = _2428;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2398)
    {
        _2430 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2466 = _2430;
    out.m_97.x = _2454;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2398)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2472 = _2444;
    float _2474 = _1974 * _2418;
    float _2476 = fma(_1970, _2440, _1668);
    float _2478 = fma(_1972, _2440, _1670);
    float _2480 = _2472;
    float _2482 = _2472;
    if (!_2398)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2446;
    float _2486 = fma(_1674, _2474, _1672);
    out.m_99.x = _2476;
    out.m_99.y = _2478;
    out.m_99.z = _2486;
    out.m_99.w = _2442;
    bool _2488 = !_2398;
    float _2490 = _2484;
    float _2492 = _2484;
    if (!_2488)
    {
        bool _2494 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1770);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1770 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = 1.0 / _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2512;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2542 = fma(_2536, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2450 = _2542;
            _2470 = _2550;
            _2492 = _2544;
            _2464 = _2548;
            _2458 = _2546;
            _2482 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1770);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2490;
            _2492 = _2566;
            if (!_2564)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2448;
            _2450 = _2568;
            if (!_2564)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2456;
            _2458 = _2570;
            if (!_2564)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2462;
            _2464 = _2572;
            if (!_2564)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2468;
            _2470 = _2574;
            if (!_2564)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2480;
            bool _2578 = !_2564;
            _2482 = _2576;
            if (!_2578)
            {
                bool _2580 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1770);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1770 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = 1.0 / _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2598;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2628 = fma(_2622, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2450 = _2628;
                    _2470 = _2636;
                    _2492 = _2630;
                    _2464 = _2634;
                    _2458 = _2632;
                    _2482 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2450;
    float _2642 = _2470;
    float _2644 = _2492;
    float _2646 = _2464;
    float _2648 = _2458;
    float _2650 = _2482;
    float _2652 = fma(_2364, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = -_2644;
    float _2662 = _2660 + _2646;
    float _2664 = -_2648;
    float _2666 = _2664 + _2650;
    bool _2668 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2670 = fma(_2654, _2658, _2640);
    float _2672 = fma(_2654, _2662, _2644);
    float _2674 = fma(_2654, _2666, _2648);
    float _2676 = _2670 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2678 = fma(_2672, 0.298911988735198974609375, _2676);
    float _2680 = fma(_2674, 0.114477999508380889892578125, _2678);
    out.m_101.x = 0.0;
    float _2682 = -_2680;
    float _2684 = _2672 + _2682;
    float _2686 = -_2680;
    float _2688 = _2670 + _2686;
    float _2690 = -_2680;
    float _2692 = _2674 + _2690;
    float _2694 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2696 = fma(_2684, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    out.m_97.w = _2694;
    out.m_103.x = _2696;
    out.m_103.y = _2698;
    out.m_103.z = _2700;
    if (!_2668)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2702 = -_1457;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2706 = -_1459;
    float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2710 = -_1461;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2714 = _2704 * _2704;
    float _2716 = fma(_2708, _2708, _2714);
    float _2718 = fma(_2712, _2712, _2716);
    float _2720 = sqrt(_2718);
    float _2722 = rsqrt(_2718);
    float _2724 = -_2720;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2728 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    float _2732 = _2708 * _2722;
    float _2734 = _2704 * _2722;
    float _2736 = abs(_2730);
    float _2738 = log2(_2736);
    float _2740 = _2712 * _2722;
    float _2742 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2744 = _2364 * _2734;
    float _2746 = -_2734;
    float _2748 = -_2742;
    float _2750 = fma(_2746, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2748);
    float _2752 = fma(_2362, _2732, _2744);
    float _2754 = -_2740;
    float _2756 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2750);
    float _2758 = fma(_2350, _2740, _2752);
    float _2760 = precise::clamp(_2758, 0.0, 1.0);
    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2764 = _2756 + _2762;
    float _2766 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2768 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2770 = precise::clamp(_2768, 0.0, 1.0);
    float _2772 = exp2(_2766);
    float _2774 = _2772 * _2770;
    float _2776 = _2760 * _2774;
    float _2778 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2780 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2782 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2778;
    out.m_101.y = _2780;
    out.m_101.z = _2782;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad2 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_56.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2839 = as_type<float>(_138);
        out.gl_Position.z = _2839;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2908 = as_type<float>(_176);
        out.gl_Position.z = _2908;
    }
    if (_170)
    {
        return out;
    }
    float _178 = in.m_63.x;
    float _180 = in.m_63.y;
    float _182 = in.m_63.z;
    float _184 = in.m_65.x;
    float _186 = in.m_65.y;
    float _188 = in.m_65.z;
    float _190 = in.m_67.x;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = 0.0;
    float _226 = _216;
    float _228 = _214;
    float _230 = _210;
    float _232 = _212;
    if (_220)
    {
        float _234 = rsqrt(_208);
        _224 = _234;
    }
    float _236 = _224;
    float _238 = 0.0;
    if (!_220)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _218 > 0.0;
    float _244 = _218;
    float _246 = _240;
    if (!_220)
    {
        _244 = 0.0;
        _226 = 0.0;
    }
    float _248 = _244;
    float _250 = _226;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _248;
    if (!_222)
    {
        _252 = 0.0;
        _254 = 0.0;
    }
    float _260 = _252;
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    float _268 = _260;
    if (_222)
    {
        float _270 = rsqrt(_210);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_222)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_212);
        _278 = _282;
    }
    float _284 = _278;
    if (_220)
    {
        float _286 = _236 * _184;
        _246 = _286;
    }
    float _288 = _246;
    if (_220)
    {
        float _290 = _236 * _178;
        _256 = _290;
    }
    float _292 = _256;
    if (_220)
    {
        float _294 = _236 * _190;
        _258 = _294;
    }
    float _296 = _258;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_242)
    {
        _228 = 0.0;
    }
    float _300 = _228;
    float _302 = _300;
    if (_222)
    {
        float _304 = _272 * _186;
        _280 = _304;
    }
    float _306 = _280;
    if (!_242)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _308 = _230;
    float _310 = _232;
    float _312 = _308;
    float _314 = _310;
    if (_222)
    {
        float _316 = _272 * _180;
        _266 = _316;
    }
    float _318 = _266;
    if (_222)
    {
        float _320 = _272 * _192;
        _268 = _320;
    }
    float _322 = _268;
    if (_242)
    {
        float _324 = _284 * _188;
        _312 = _324;
    }
    float _326 = _312;
    if (_242)
    {
        float _328 = _284 * _182;
        _314 = _328;
    }
    float _330 = _314;
    if (_242)
    {
        float _332 = _284 * _194;
        _302 = _332;
    }
    float _334 = _302;
    bool _336 = !_298;
    float _354;
    if (!_336)
    {
        float _338 = in.m_69.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_122);
        float _360 = 1.0 / _358;
        float _362 = _156 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_56.x;
    float _368 = in.m_56.y;
    float _370 = in.m_56.z;
    float _372 = in.m_65.w;
    float _374 = in.m_67.w;
    float _376 = _186 * _368;
    float _378 = _192 * _368;
    float _380 = fma(_184, _366, _376);
    float _382 = fma(_190, _366, _378);
    float _384 = fma(_188, _370, _380);
    float _386 = fma(_194, _370, _382);
    float _388 = _384 + _372;
    float _390 = _386 + _374;
    float _392 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _394 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _396 = floor(_392);
    float _398 = floor(_394);
    float _400 = -_396;
    float _402 = _392 + _400;
    float _404 = -_398;
    float _406 = _394 + _404;
    float2 _3232 = float2(_402, _406);
    float _408 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3232, float2(0.0), isnan(_3232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3232, float2(0.0), isnan(_3232)), level(0.0)).x;
    float _410 = in.m_69.x;
    float _412 = _180 * _368;
    float _414 = in.m_69.y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _420;
    float _424 = in.m_69.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = 1.0 / _418;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _436 = fma(_178, _366, _412);
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _440 = _438 != 0;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _444 = _442 != 0;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _448 = _446 != 0;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _452 = 1.0 / _422;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _456 = _364 + _454;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _460 = fma(_182, _370, _436);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _464 = _364 + _462;
    float _466 = in.m_63.w;
    float _468 = 1.0 / _428;
    float _470 = _410 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _472 = _414 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _474 = _456 * _430;
    float _476 = -_450;
    float _478 = fma(_470, 2.0, _476);
    float _480 = _414 + _424;
    float _482 = fma(_472, -2.0, _458);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _486 = _364 + _484;
    float _488 = _480 + (-1.0);
    float _490 = 1.0 / _434;
    float _492 = _486 * _452;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _496 = _364 + _494;
    float _498 = _424 * 2.0;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _502 = _410 + _424;
    float _504 = _496 * _468;
    float _506 = _410 + _414;
    float _508 = floor(_498);
    float _510 = _410 * 2.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = _414 * 2.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _522 = fma(_514, _492, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = _464 * _490;
    float _526 = _502 + (-1.0);
    float _528 = _506 + (-1.0);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _530;
    float _534 = floor(_510);
    float _536 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _538 = fma(_532, _492, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _540 = _508 >= 0.0;
    bool _542 = isnan(_508);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _552 = _508 > 0.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    float _558 = floor(_516);
    int _560 = _548 ? 0 : 1;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _562;
    float _566 = fma(_556, _492, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    bool _588 = _534 >= 0.0;
    bool _590 = isnan(_534);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _602 = _534 > 0.0;
    float _604 = fma(_574, _524, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _606 = _596 ? 0 : 1;
    float _608 = fma(_578, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _610 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _612 = isnan(_364);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = fma(_520, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _624 = _558 > 0.0;
    float _626 = fma(_582, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _628 = _558 >= 0.0;
    bool _630 = isnan(_558);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _640 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _642 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _644 = isnan(_364);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _586 * _156;
    bool _656 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _658 = isnan(_364);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _676 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _678 = isnan(_364);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_620;
    float _690 = _688 + 1.0;
    float _692 = exp2(_654);
    float _694 = fma(_674, _524, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _696 = fma(_600, _524, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _698 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _700 = isnan(_364);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_670, _504, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _712 = -_156;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _716 = -_708;
    float _718 = _716 + 1.0;
    float _720 = _708 * _690;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    int _726 = _636 ? 0 : 1;
    float _728 = _686 * _718;
    bool _730 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _738 = _734 || _736;
    float _740 = -_686;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _724;
    float _746 = -_692;
    float _748 = _746 + 1.0;
    float _750 = _666 * _742;
    float _752 = -_666;
    float _754 = _752 + 1.0;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _758 = _738 ? _748 : 0.0;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = _652 * _754;
    float _774 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[78].z, _756);
    float _776 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[78].w, _760);
    float _778 = -_652;
    float _780 = _778 + 1.0;
    float _782 = _522 * _772;
    float _784 = _566 * _772;
    float _786 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _774);
    float _788 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _776);
    float _790 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _482);
    float _792 = _538 * _772;
    float _794 = _460 + _466;
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].x, _784);
    float _798 = _790;
    if (_770)
    {
        float _800 = _758 * _744;
        _160 = _800;
    }
    float _802 = _160;
    float _804 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].y, _782);
    bool _806 = !_444;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].z, _792);
    int _812 = ~_726;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_608, _750, _796);
    int _820 = abs(_808);
    float _822 = fma(_622, _750, _804);
    int _824 = _816;
    if (!_624)
    {
        int _826 = ~_726;
        int _828 = _826 + 1;
        _824 = _828;
    }
    int _830 = _824;
    float _832 = fma(_626, _750, _810);
    float _834 = _794 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _836 = ~_606;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = in.m_71.x;
    float _844 = in.m_71.y;
    float _846 = in.m_71.z;
    int _848 = _840;
    if (!_602)
    {
        int _850 = ~_606;
        int _852 = _850 + 1;
        _848 = _852;
    }
    int _854 = _848;
    float _856 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[11].x, _834);
    float _858 = fma(_638, _728, _818);
    float _860 = float(_820);
    float _862 = _794 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _864 = float(_854);
    float _866 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _856);
    float _868 = fma(_710, _728, _822);
    float _870 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[10].x, _862);
    float _872 = fma(_640, _728, _832);
    float _874 = _860 * _864;
    float _876 = _866 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _878 = !_440;
    int _880 = _878 ? 0 : 1;
    float _882 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _870);
    bool _884 = !_448;
    int _886 = _884 ? 0 : 1;
    float _888 = 1.0 / _876;
    int _890 = ~_560;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = _874 * (-2.0);
    int _898 = _894;
    if (!_552)
    {
        int _900 = ~_560;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = _882 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _908 = abs(_880);
    float _910 = fma(_500, _896, _500);
    int _912 = abs(_886);
    float _914 = fma(_896, _844, _844);
    float _916 = float(_908);
    float _918 = _414 + (-0.5);
    float _920 = float(_904);
    float _922 = _906 + _876;
    float _924 = float(_912);
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[196].y, _914);
    float _928 = float(_830);
    float _930 = _916 * _920;
    float _932 = _922 * _888;
    float _934 = _932 * 0.5;
    float _936 = fma(_910, _802, _926);
    float _938 = _924 * _928;
    float _940 = _930 * (-2.0);
    float _942 = in.m_73.x;
    float _944 = in.m_73.y;
    float _946 = in.m_73.z;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _950 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _948);
    float _952 = _410 + (-0.5);
    float _954 = fma(_940, _842, _842);
    float _956 = in.m_75.x;
    float _958 = in.m_75.y;
    float _960 = in.m_75.z;
    float _962 = fma(_550, _940, _550);
    float _964 = _938 * (-2.0);
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].x, _954);
    float _968 = fma(_604, _720, _858);
    float _970 = 1.0 / _950;
    float _972 = fma(_694, _720, _868);
    float _974 = fma(_962, _802, _966);
    float _976 = fma(_964, _846, _846);
    float _978 = _424 + (-0.5);
    float _980 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].x, _968);
    float _982 = fma(_536, _964, _536);
    float _984 = fma(_696, _720, _872);
    float _986 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _976);
    float _988 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].y, _972);
    float _990 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].z, _984);
    float _992 = fma(_982, _802, _986);
    float _994 = _936 * 0.15915493667125701904296875;
    float _996 = _974 * 0.15915493667125701904296875;
    float _998 = _980 * _942;
    float _1000 = _990 * _946;
    float _1002 = _992 * 0.15915493667125701904296875;
    float _1004 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _956);
    float _1008 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = _988 * _944;
    float _1012 = _994 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _958);
    float _1018 = _1006 * _1008;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1022 = _970 * _1020;
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = _794 + _1004;
    float _1028 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _960);
    float _1032 = _994 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    bool _1036 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1038 = _1016 * _1024;
    bool _1040 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1042 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1044 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1046 = _1030 * _1028;
    float _1048 = _1002 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1042);
    bool _1054 = !_1036;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1044);
    int _1060 = 2;
    if (!_1036)
    {
        _1060 = 1;
    }
    int _1062 = _1060;
    float _1064 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1058);
    float _1066 = _1002 * 6.283185482025146484375;
    float _1068 = cos(_1066);
    int _1070 = _1062;
    if (!_1040)
    {
        _1070 = _1056;
    }
    int _1072 = _1070;
    float _1074 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1076 = _1072 << 6;
    float _1078 = _996 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _1014 * _1050;
    float _1084 = _1034 * _1050;
    float _1086 = _996 * 6.283185482025146484375;
    float _1088 = sin(_1086);
    float _1090 = _1034 * _1068;
    float _1092 = _1014 * _1068;
    float _1094 = _1068 * _1080;
    float _1096 = _1050 * _1080;
    float _1098 = _1014 * _1080;
    float _1100 = _1034 * _1080;
    float _1102 = _1094 * _1038;
    float _1104 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1052);
    float _1106 = trunc(_1074);
    int _1108 = int(_1106);
    float _1110 = fma(_1088, _1082, _1090);
    float _1112 = fma(_1088, _1090, _1082);
    float _1114 = -_1092;
    float _1116 = fma(_1088, _1084, _1114);
    int _1118 = _1076 + 96;
    uint _1121 = uint(int(uint(_1118) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.vp_c15)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.vp_c15)._m0[int(_1131)][_1133];
    float _1137 = -_1084;
    float _1139 = fma(_1088, _1092, _1137);
    float _1141 = fma(_1096, _1018, _1102);
    float _1143 = _1112 * _1038;
    float _1145 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1147 = _1139 * _1038;
    float _1149 = -_1088;
    float _1151 = fma(_1149, _1046, _1141);
    float _1153 = fma(_1116, _1018, _1143);
    int _1155 = _1076 + 104;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[int(_1167)][_1169];
    float _1173 = fma(_1110, _1018, _1147);
    float _1175 = trunc(_1145);
    int _1177 = int(_1175);
    float _1179 = _1151 * _306;
    float _1181 = fma(_1100, _1046, _1153);
    float _1183 = fma(_1098, _1046, _1173);
    float _1185 = _1151 * _322;
    float _1187 = _1151 * _318;
    int _1189 = _1076 + 48;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    uint _1193 = uint(int(uint(int(_1191)) >> uint(2)));
    int _1195 = int(_1191) & 3;
    float _1197 = (*spvDescriptorSet0.vp_c15)._m0[int(_1193)][_1195];
    int _1199 = int(_1191) + 1;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    int _1203 = _1199 & 3;
    float _1205 = (*spvDescriptorSet0.vp_c15)._m0[int(_1201)][_1203];
    float _1207 = fma(_1183, _288, _1179);
    float _1209 = fma(_1183, _296, _1185);
    int _1211 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1213 = _1108 + _1211;
    int _1215 = _1213 + 1;
    float _1217 = fma(_1181, _326, _1207);
    float _1219 = fma(_1181, _334, _1209);
    bool _1221 = _1215 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1223 = _1076 + 64;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
    float _1241 = _388 + _1217;
    float _1243 = _390 + _1219;
    int _1245 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1247 = _1177 + _1245;
    int _1249 = _1247 + 1;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1253 = _1241 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1257 = _1243 + _1255;
    int _1259 = _1215 | _1249;
    int _1261 = _1076 + 56;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
    float _1279 = _1257 * _1257;
    bool _1281 = _1259 < 0;
    bool _1283 = _1281 || _1221;
    float _1285 = fma(_1253, _1253, _1279);
    bool _1287 = _1249 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1289 = _1287 || _1283;
    int _1291 = _1076 + 72;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.vp_c15)._m0[int(_1303)][_1305];
    float _1309 = sqrt(_1285);
    int _1311 = _1076 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = _1026 * _1135;
    int _1331 = as_type<int>(_1151);
    float _1333 = _1187;
    if (!_1289)
    {
        int _1335 = _1249 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1337 = _1335 + _1215;
        _1331 = _1337;
    }
    int _1339 = _1331;
    float _1341 = fma(_388, _1127, _1329);
    float _1343 = fma(_1183, _292, _1187);
    float _1345 = _1183;
    if (!_1289)
    {
        float _1347 = floor(_1074);
        _1345 = _1347;
    }
    float _1349 = _1345;
    float _1351 = fma(_390, _1163, _1341);
    bool _1353 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1355 = _1351 + _1171;
    float _1357 = _1026 * _1205;
    float _1359 = 1.0 / _1355;
    float _1361 = fma(_388, _1197, _1357);
    float _1363 = fma(_1181, _330, _1343);
    float _1365 = _1026 * _1239;
    int _1367 = as_type<int>(_1239);
    int _1369 = as_type<int>(_1231);
    float _1371 = _1361;
    float _1373 = _1365;
    if (!_1289)
    {
        int _1375 = _1339 << 2;
        _1367 = _1375;
    }
    int _1377 = _1367;
    float _1379 = _794 + _1363;
    float _1381 = fma(_388, _1231, _1365);
    int _1383 = _1377;
    float _1385 = _1379;
    if (!_1289)
    {
        uint _1387 = uint(int(uint(_1339) >> uint(2)));
        _1369 = int(_1387);
    }
    int _1389 = _1369;
    int _1391 = _1389;
    if (!_1289)
    {
        int _1393 = 12 & _1377;
        _1383 = _1393;
    }
    int _1395 = _1383;
    float _1397 = fma(_390, _1269, _1361);
    if (!_1353)
    {
        _1371 = _1241;
    }
    float _1399 = _1371;
    float _1401 = _1399;
    if (!_1289)
    {
        int _1403 = _1389 << 4;
        int _1405 = _1403 + _1395;
        _1391 = _1405;
    }
    int _1407 = _1391;
    float _1409 = _1397 + _1277;
    if (!_1353)
    {
        _1373 = _1243;
    }
    float _1411 = _1373;
    float _1413 = fma(_390, _1299, _1381);
    float _1415 = _1413 + _1307;
    bool _1417 = !_1353;
    float _1419 = _1411;
    if (!_1417)
    {
        float _1421 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1425 = _1309 + _1423;
        float _1427 = _1379 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1429 = rsqrt(_1285);
        float _1431 = _1425 * _1421;
        float _1433 = _1431 * 0.15915493667125701904296875;
        float _1435 = _1433 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1433 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = _1437 + (-1.0);
        float _1445 = fma(_1441, _1427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1447 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = _1429 * _1445;
        float _1451 = fma(_1379, _1437, _1447);
        float _1453 = fma(_1253, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1455 = fma(_1257, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1385 = _1451;
        _1401 = _1453;
        _1419 = _1455;
    }
    float _1457 = _1385;
    float _1459 = _1401;
    float _1461 = _1419;
    int _1463 = _1076 + 88;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    float _1481 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1483 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1485 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1487 = _1409 * _1359;
    float _1489 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1481);
    float _1491 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1483);
    float _1493 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1485);
    float _1495 = _1257;
    if (!_1289)
    {
        int _1497 = _1407 + 400;
        uint _1499 = uint(int(uint(_1497) >> uint(2)));
        uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
        int _1503 = int(_1499) & 3;
        float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
        _1495 = _1505;
    }
    float _1507 = _1495;
    float _1509 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1489);
    bool _1511 = _1487 >= 0.0;
    float _1513 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1491);
    float _1515 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1517 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = _1415 * _1359;
    bool _1523 = _1487 <= 1.0;
    bool _1525 = _1523 && _1511;
    float _1527 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1529 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1515);
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1535 = _1521 >= 0.0;
    bool _1537 = _1535 && _1525;
    float _1539 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1541 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1543 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1529);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1533);
    bool _1547 = _1521 <= 1.0;
    bool _1549 = _1547 && _1537;
    float _1551 = -_1541;
    float _1553 = fma(_1551, _1539, 1.0);
    float _1555 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1557 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1559 = _1026 * _1327;
    float _1561 = _1243;
    float _1563 = _1513;
    if (!_1289)
    {
        float _1565 = floor(_1145);
        _1561 = _1565;
    }
    float _1567 = _1561;
    float _1569 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1571 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1557);
    float _1573 = fma(_388, _1319, _1559);
    float _1575 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1577 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1569);
    float _1579 = log2(_1553);
    if (_1549)
    {
        float _1581 = float(_1072);
        _1563 = _1581;
    }
    float _1583 = _1563;
    float _1585 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1575);
    float _1587 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1577);
    float _1589 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1585);
    float _1591 = 1.0 / _1571;
    float _1593 = fma(_390, _1471, _1573);
    float _1595 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1587);
    float _1597 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1599 = _1567;
    float _1601 = _1585;
    if (!_1289)
    {
        float _1603 = -_1567;
        float _1605 = _1145 + _1603;
        _1599 = _1605;
    }
    float _1607 = _1599;
    float _1609 = _1593 + _1479;
    float _1611 = _1569;
    if (_1549)
    {
        float _1613 = rint(_1583);
        float _1615 = precise::max(_1613, 0.0);
        uint _1617 = uint(_1615);
        uint _1619 = clamp(_1617, 0u, 65535u);
        _1611 = as_type<float>(_1619);
    }
    float _1621 = _1611;
    float _1623 = _1609 * _1359;
    float _1625 = _1579 * 0.693147182464599609375;
    float _1627 = _1625 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1629 = _1625;
    if (!_1289)
    {
        float _1631 = -_1349;
        float _1633 = _1074 + _1631;
        _1629 = _1633;
    }
    float _1635 = _1629;
    float _1637 = _1609;
    if (!_1289)
    {
        float _1639 = rint(_1507);
        float _1641 = precise::max(_1639, 0.0);
        uint _1643 = uint(_1641);
        uint _1645 = clamp(_1643, 0u, 65535u);
        _1637 = as_type<float>(_1645);
    }
    float _1647 = _1637;
    float _1649 = _1595 * _1591;
    float _1651 = _1597 * _1591;
    float _1653 = fma(_1649, 0.5, 0.5);
    float _1655 = fma(_1651, -0.5, 0.5);
    float _1657 = _1521;
    if (_1549)
    {
        float3 _5261 = float3(_1487, _1521, float(as_type<int>(_1621)));
        float3 _5265 = select(_5261, float3(0.0), isnan(_5261));
        float _1659 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5265.xy, uint(rint(_5265.z)), _1623, level(0.0));
        _1657 = _1659;
    }
    float _1661 = _1657;
    float3 _5275 = float3(_1653, _1655, _1627);
    float _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5275, float3(0.0), isnan(_5275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5275, float3(0.0), isnan(_5275)), level(0.0)).x;
    float3 _5284 = float3(_1653, _1655, _1627);
    float4 _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).xyzw;
    float _1668 = _1666.x;
    float _1670 = _1666.y;
    float _1672 = _1666.z;
    float _1674 = _1666.w;
    float _1676 = _1607;
    if (!_1289)
    {
        float3 _5307 = float3(_1635, _1607, float(as_type<int>(_1647)));
        float3 _5309 = select(_5307, float3(0.0), isnan(_5307));
        float _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5309.xy, uint(rint(_5309.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5309.xy, uint(rint(_5309.z)), level(0.0)).x;
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (_1289)
    {
        _1601 = 1.0;
    }
    float _1682 = _1601;
    float _1684 = _1682;
    float _1686 = _1680;
    if (!_1289)
    {
        int _1688 = _1339 << 4;
        int _1690 = _1688 + 2048;
        uint _1692 = uint(int(uint(_1690) >> uint(2)));
        uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
        int _1696 = int(_1692) & 3;
        float _1698 = (*spvDescriptorSet0.vp_c15)._m0[int(_1694)][_1696];
        int _1700 = int(_1692) + 1;
        uint _1702 = uint(int(uint(_1700) >> uint(2)));
        int _1704 = _1700 & 3;
        float _1706 = (*spvDescriptorSet0.vp_c15)._m0[int(_1702)][_1704];
        int _1708 = _1690 + 8;
        uint _1710 = uint(int(uint(_1708) >> uint(2)));
        uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
        int _1714 = int(_1710) & 3;
        float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
        int _1718 = int(_1710) + 1;
        uint _1720 = uint(int(uint(_1718) >> uint(2)));
        int _1722 = _1718 & 3;
        float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
        float _1726 = _1026 * _1706;
        float _1728 = fma(_388, _1698, _1726);
        float _1730 = fma(_390, _1716, _1728);
        float _1732 = _1730 + _1724;
        float _1734 = precise::clamp(_1732, 0.0, 1.0);
        float _1736 = -_1734;
        float _1738 = _1736 + _1680;
        float _1740 = fma(_1738, 500.0, 1.5);
        float _1742 = exp2(_1740);
        float _1744 = 0.0 + _1742;
        float _1746 = precise::clamp(_1744, 0.0, 1.0);
        _1684 = _1746;
    }
    float _1748 = _1684;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1457 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1756 = _1459 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1760 = _1461 + _1758;
    float _1762 = _1752 * _1752;
    float _1764 = fma(_1756, _1756, _1762);
    float _1766 = fma(_1760, _1760, _1764);
    float _1768 = rsqrt(_1766);
    float _1770 = sqrt(_1766);
    float _1772 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1774 = _1756 * _1772;
    float _1776 = _1760 * _1772;
    float _1778 = _1774 * _1774;
    float _1780 = _1776 * _1776;
    float _1782 = _1778 + _1780;
    float _1784 = sqrt(_1782);
    bool _1786 = _1784 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1790 = _1784 + _1788;
    float _1792 = _390;
    float _1794 = _1790;
    float _1796 = _1772;
    float _1798 = _1774;
    float _1800 = _1776;
    float _1802 = _1778;
    float _1804 = _1780;
    if (_1786)
    {
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1806;
    }
    float _1808 = _1792;
    if (_1786)
    {
        float _1810 = _1790 * _1808;
        _1794 = _1810;
    }
    float _1812 = _1794;
    if (_1786)
    {
        float _1814 = _1812 * 0.15915493667125701904296875;
        _1686 = _1814;
    }
    float _1816 = _1686;
    float _1818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1820 = _388;
    if (_1786)
    {
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1820 = _1824;
    }
    float _1826 = _1820;
    float _1828 = precise::max(0.0, _1818);
    float _1830 = _1812;
    float _1832 = _1828;
    if (_1786)
    {
        float _1834 = _1816 * 6.283185482025146484375;
        float _1836 = cos(_1834);
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = -_1772;
    float _1842 = -_1828;
    float _1844 = fma(_1752, _1840, _1842);
    float _1846 = _1844;
    if (_1786)
    {
        float _1848 = _1844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1848;
    }
    float _1850 = _1796;
    float _1852 = _1818;
    float _1854 = _1850;
    if (_1786)
    {
        float _1856 = rsqrt(_1782);
        _1852 = _1856;
    }
    float _1858 = _1852;
    if (_1786)
    {
        float _1860 = fma(_1826, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1832 = _1860;
    }
    float _1862 = _1832;
    float _1864 = _1862;
    if (_1786)
    {
        float _1866 = _1838 + (-1.0);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1858;
    if (_1786)
    {
        float _1872 = _1858 * _1862;
        _1864 = _1872;
    }
    float _1874 = _1864;
    if (_1786)
    {
        float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1876;
    }
    float _1878 = _1870;
    if (_1786)
    {
        float _1880 = _1774 * _1874;
        _1798 = _1880;
    }
    float _1882 = _1798;
    if (_1786)
    {
        float _1884 = fma(_1844, _1838, _1878);
        _1846 = _1884;
    }
    float _1886 = _1846;
    if (_1786)
    {
        float _1888 = _1776 * _1874;
        _1800 = _1888;
    }
    float _1890 = _1800;
    if (_1786)
    {
        float _1892 = _1882 * _1882;
        _1802 = _1892;
    }
    float _1894 = _1802;
    if (_1786)
    {
        float _1896 = _1890 * _1890;
        _1804 = _1896;
    }
    float _1898 = _1804;
    float _1900 = fma(_1886, _1886, _1894);
    float _1902 = _1900 + _1898;
    float _1904 = rsqrt(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1908 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1906);
    float _1910 = precise::clamp(_1908, 0.0, 1.0);
    float _1912 = -_1910;
    float _1914 = _1912 + 1.0;
    float _1916 = abs(_1914);
    float _1918 = log2(_1916);
    float _1920 = _1904 * _1882;
    float _1922 = _1904 * _1886;
    float _1924 = _1904 * _1890;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = -_1926;
    float _1930 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1928);
    float _1932 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1934 = -_1924;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1930);
    float _1938 = fma(_1936, -0.5, 0.5);
    float _1940 = exp2(_1932);
    float _1942 = fma(_1936, 0.5, 0.5);
    float _1944 = fma(_1942, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1946 = sqrt(_1938);
    float _1948 = fma(_1942, _1944, -0.212114393711090087890625);
    float _1950 = _1922 + 1.0;
    float _1952 = fma(_1942, _1948, 1.570728778839111328125);
    float _1954 = -_1922;
    float _1956 = fma(_1940, _1950, _1954);
    float _1958 = fma(_1956, 0.5, 0.5);
    float _1960 = _1946 * 0.636619746685028076171875;
    float _1962 = -_1952;
    float _1964 = fma(_1960, _1962, 1.0);
    float2 _5750 = float2(_1964, _1958);
    float3 _1968 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5750, float2(0.0), isnan(_5750)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5750, float2(0.0), isnan(_5750)), level(0.0)).xyz;
    float _1970 = _1968.x;
    float _1972 = _1968.y;
    float _1974 = _1968.z;
    float _1976 = in.m_77.y;
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1980 = _414 > 0.5;
    float _1982 = in.m_69.w;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    float _1988 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    float _1994 = in.m_77.x;
    int _1996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1998 = _1996 != 0;
    float _2000 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2004 = _2002 != 0;
    float _2006 = exp2(_1988);
    float _2008 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2000);
    float _2010 = -_408;
    float _2012 = _2010 + 1.0;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2024 = -_1976;
    float _2026 = _2024 + 1.0;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2030 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2020;
    bool _2032 = _1982 > 0.5;
    float _2034 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2008);
    out.m_81.x = _1459;
    out.m_81.y = _1457;
    out.m_81.z = _1461;
    int _2036 = _2032 ? as_type<int>(_2026) : as_type<int>(_1976);
    float _2038 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2034);
    bool _2040 = _2032;
    bool _2042 = _2004;
    float _2044 = _1976;
    int _2046 = as_type<int>(_2022);
    if (_1992)
    {
        bool _2048 = _410 > 0.5;
        _2040 = _2048;
    }
    bool _2050 = _2040;
    float _2052 = _2004 ? as_type<float>(_2036) : _1976;
    if (_1986)
    {
        bool _2054 = _424 > 0.5;
        _2042 = _2054;
    }
    bool _2056 = _2042;
    out.gl_Position.x = _1595;
    out.gl_Position.y = _1597;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1571;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1998)
    {
        float _2060 = _1980 ? _2026 : _1976;
        _2044 = _2060;
    }
    float _2062 = _2044;
    float _2064 = in.m_83.x;
    float _2066 = in.m_83.y;
    float _2068 = in.m_83.z;
    bool _2070 = _958 != 0.0;
    bool _2072 = isnan(_958);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = _956 == 0.0;
    bool _2082 = !_2078;
    bool _2084 = _2080 && _2082;
    float _2086 = _1994;
    if (!_1992)
    {
        _1333 = _1994;
    }
    float _2088 = _1333;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2092 = _960 == 0.0;
    bool _2094 = _2092 && _2084;
    float _2096 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2100 = in.m_85.x;
    float _2102 = in.m_85.y;
    float _2104 = in.m_85.z;
    float _2106 = in.m_85.w;
    float _2108 = fma(_2098, _2062, -0.5);
    int _2110 = as_type<int>(_2098);
    float _2112 = _2088;
    float _2114 = _2108;
    float _2116 = _2096;
    if (_1992)
    {
        float _2118 = -_1994;
        float _2120 = _2118 + 1.0;
        _2110 = as_type<int>(_2120);
    }
    int _2122 = _2110;
    out.m_87.x = _2096;
    out.m_87.y = _2022;
    out.m_87.z = _2030;
    out.m_87.w = _2028;
    float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2126 = -_790;
    float _2128 = fma(_788, _2108, _2126);
    if (_1992)
    {
        float _2130 = _2050 ? as_type<float>(_2122) : _1994;
        _2112 = _2130;
    }
    float _2132 = _2112;
    if (_2094)
    {
        _2114 = _2066;
    }
    float _2134 = _2114;
    float _2136 = _2134;
    if (_2094)
    {
        _798 = _2064;
    }
    float _2138 = _798;
    float _2140 = fma(_2018, _2132, -0.5);
    float _2142 = _2138;
    if (!_2094)
    {
        float _2144 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2064);
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = fma(_786, _2140, _714);
    if (_1986)
    {
        float _2150 = -_1994;
        float _2152 = _2150 + 1.0;
        _2046 = as_type<int>(_2152);
    }
    int _2154 = _2046;
    float _2156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2158 = as_type<float>(_2154);
    if (_2094)
    {
        _2116 = _2068;
    }
    float _2160 = _2116;
    float _2162 = _2160;
    if (!_2094)
    {
        float _2164 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2068);
        _2162 = _2164;
    }
    float _2166 = _2162;
    float _2168 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1986)
    {
        float _2170 = _2056 ? as_type<float>(_2154) : _1994;
        _2086 = _2170;
    }
    float _2172 = _2086;
    float _2174 = _2104 * _2064;
    if (_2094)
    {
        _2158 = _2134;
    }
    float _2176 = _2158;
    float _2178 = _2148 + 0.5;
    float _2180 = _2176;
    if (!_2094)
    {
        _2136 = _2066;
    }
    float _2182 = _2136;
    float _2184 = -_2174;
    float _2186 = fma(_2100, _2068, _2184);
    float _2188 = abs(_1022);
    float _2190 = log2(_2188);
    float _2192 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2194 = _1094 * _2102;
    if (!_2094)
    {
        float _2196 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2182);
        _2180 = _2196;
    }
    float _2198 = _2180;
    float _2200 = _2102 * _2068;
    float _2202 = _2100 * _2182;
    float _2204 = _2168 * _2156;
    float _2206 = fma(_1096, _2100, _2194);
    float _2208 = -_2200;
    float _2210 = fma(_2104, _2182, _2208);
    float _2212 = -_2202;
    float _2214 = fma(_2102, _2064, _2212);
    float _2216 = _2192 * _2124;
    float _2218 = _2128 + 0.5;
    float _2220 = _2210 * _2106;
    float _2222 = _2214 * _2106;
    float _2224 = _1112 * _2198;
    float _2226 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2228 = _2186 * _2106;
    float _2230 = _1094 * _2198;
    out.m_89.x = _2178;
    out.m_89.y = _2218;
    out.m_89.z = _2216;
    out.m_89.w = _2204;
    float _2232 = fma(_1116, _2146, _2224);
    float _2234 = _1094 * _2228;
    float _2236 = exp2(_2226);
    float _2238 = fma(_1096, _2146, _2230);
    float _2240 = _1139 * _2198;
    float _2242 = fma(_1096, _2220, _2234);
    float _2244 = _1139 * _2102;
    float _2246 = _1112 * _2102;
    float _2248 = _1139 * _2228;
    float _2250 = _1112 * _2228;
    float _2252 = fma(_1110, _2146, _2240);
    float _2254 = fma(_1110, _2100, _2244);
    float _2256 = fma(_1116, _2100, _2246);
    float _2258 = -_1088;
    float _2260 = fma(_2258, _2104, _2206);
    float _2262 = fma(_1110, _2220, _2248);
    float _2264 = fma(_1116, _2220, _2250);
    float _2266 = -_1088;
    float _2268 = fma(_2266, _2166, _2238);
    float _2270 = -_1088;
    float _2272 = fma(_2270, _2222, _2242);
    float _2274 = fma(_1098, _2166, _2252);
    float _2276 = fma(_1100, _2166, _2232);
    float _2278 = fma(_1098, _2104, _2254);
    float _2280 = fma(_1100, _2104, _2256);
    float _2282 = _2260 * _306;
    float _2284 = _2260 * _318;
    float _2286 = fma(_1098, _2222, _2262);
    float _2288 = fma(_1100, _2222, _2264);
    float _2290 = _2260 * _322;
    float _2292 = _2268 * _306;
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    float _2298 = _2272 * _306;
    float _2300 = _2272 * _318;
    float _2302 = _2272 * _322;
    float _2304 = _2268 * _318;
    float _2306 = fma(_2278, _288, _2282);
    float _2308 = fma(_2278, _292, _2284);
    float _2310 = fma(_2278, _296, _2290);
    float _2312 = fma(_2274, _288, _2292);
    float _2314 = fma(_2286, _288, _2298);
    float _2316 = fma(_2286, _292, _2300);
    float _2318 = fma(_2274, _292, _2304);
    float _2320 = _2268 * _322;
    float _2322 = fma(_2286, _296, _2302);
    float _2324 = fma(_2280, _330, _2308);
    float _2326 = fma(_2280, _334, _2310);
    float _2328 = fma(_2296, -2.0, 3.0);
    float _2330 = _2296 * _2296;
    float _2332 = fma(_2274, _296, _2320);
    float _2334 = fma(_2288, _334, _2322);
    bool _2336 = _1022 <= 8000.0;
    bool _2338 = isnan(_1022);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    float _2348 = _2330 * _2328;
    float _2350 = fma(_2276, _334, _2332);
    float _2352 = fma(_2288, _330, _2316);
    float _2354 = fma(_2280, _326, _2306);
    float _2356 = -_2348;
    float _2358 = _2356 + 1.0;
    float _2360 = fma(_2288, _326, _2314);
    float _2362 = fma(_2276, _326, _2312);
    float _2364 = fma(_2276, _330, _2318);
    float _2366 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2348);
    float _2368 = _2358;
    if (!_1549)
    {
        _2368 = 1.0;
    }
    float _2370 = _2368;
    out.m_91.x = _2354;
    out.m_91.y = _2324;
    out.m_91.z = _2326;
    float _2372 = _2370;
    if (_1549)
    {
        bool _2374 = _1661 >= _1623;
        bool _2376 = isnan(_1661);
        bool _2378 = _2374 || _2376;
        bool _2380 = isnan(_1623);
        bool _2382 = _2378 || _2380;
        float _2384 = float(_2382);
        _2372 = _2384;
    }
    float _2386 = _2372;
    float _2388 = _2346 * _2366;
    bool _2390 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2392 = isnan(_1770);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2398 = _2394 || _2396;
    out.m_93.x = _2360;
    out.m_93.y = _2352;
    out.m_93.z = _2334;
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2402 = -_2006;
    float _2404 = _2402 + 1.0;
    float _2406 = _2386 * _1748;
    out.m_95.x = _2362;
    out.m_95.y = _2364;
    out.m_95.z = _2350;
    float _2408 = _2012 * _2400;
    float _2410 = precise::clamp(_2408, 0.0, 1.0);
    float _2412 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2414 = -_2410;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2418 = _2412 * _1663;
    float _2420 = -_2412;
    float _2422 = _2420 + 1.0;
    float _2424 = _2412;
    float _2426 = _2400;
    float _2428 = _2406;
    float _2430 = _2422;
    if (!_2398)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2432 = _2424;
    float _2434 = -_2406;
    float _2436 = fma(_2434, _2416, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _1674 * _2418;
    float _2442 = _1674 * _2422;
    float _2444 = _2438;
    float _2446 = _2440;
    float _2448 = _2432;
    float _2450 = _2432;
    if (!_2398)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2452 = _2426;
    float _2454 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2398)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2460 = _2428;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2398)
    {
        _2430 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2466 = _2430;
    out.m_97.x = _2454;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2398)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2472 = _2444;
    float _2474 = _1974 * _2418;
    float _2476 = fma(_1970, _2440, _1668);
    float _2478 = fma(_1972, _2440, _1670);
    float _2480 = _2472;
    float _2482 = _2472;
    if (!_2398)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2446;
    float _2486 = fma(_1674, _2474, _1672);
    out.m_99.x = _2476;
    out.m_99.y = _2478;
    out.m_99.z = _2486;
    out.m_99.w = _2442;
    bool _2488 = !_2398;
    float _2490 = _2484;
    float _2492 = _2484;
    if (!_2488)
    {
        bool _2494 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1770);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1770 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = 1.0 / _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2512;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2542 = fma(_2536, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2450 = _2542;
            _2470 = _2550;
            _2492 = _2544;
            _2464 = _2548;
            _2458 = _2546;
            _2482 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1770);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2490;
            _2492 = _2566;
            if (!_2564)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2448;
            _2450 = _2568;
            if (!_2564)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2456;
            _2458 = _2570;
            if (!_2564)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2462;
            _2464 = _2572;
            if (!_2564)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2468;
            _2470 = _2574;
            if (!_2564)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2480;
            bool _2578 = !_2564;
            _2482 = _2576;
            if (!_2578)
            {
                bool _2580 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1770);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1770 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = 1.0 / _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2598;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2628 = fma(_2622, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2450 = _2628;
                    _2470 = _2636;
                    _2492 = _2630;
                    _2464 = _2634;
                    _2458 = _2632;
                    _2482 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2450;
    float _2642 = _2470;
    float _2644 = _2492;
    float _2646 = _2464;
    float _2648 = _2458;
    float _2650 = _2482;
    float _2652 = fma(_2364, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = -_2644;
    float _2662 = _2660 + _2646;
    float _2664 = -_2648;
    float _2666 = _2664 + _2650;
    bool _2668 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2670 = fma(_2654, _2658, _2640);
    float _2672 = fma(_2654, _2662, _2644);
    float _2674 = fma(_2654, _2666, _2648);
    float _2676 = _2670 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2678 = fma(_2672, 0.298911988735198974609375, _2676);
    float _2680 = fma(_2674, 0.114477999508380889892578125, _2678);
    out.m_101.x = 0.0;
    float _2682 = -_2680;
    float _2684 = _2672 + _2682;
    float _2686 = -_2680;
    float _2688 = _2670 + _2686;
    float _2690 = -_2680;
    float _2692 = _2674 + _2690;
    float _2694 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2696 = fma(_2684, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    out.m_97.w = _2694;
    out.m_103.x = _2696;
    out.m_103.y = _2698;
    out.m_103.z = _2700;
    if (!_2668)
    {
        return out;
    }
    float _2702 = -_1457;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2706 = -_1459;
    float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2710 = -_1461;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2714 = _2704 * _2704;
    float _2716 = fma(_2708, _2708, _2714);
    float _2718 = fma(_2712, _2712, _2716);
    float _2720 = sqrt(_2718);
    float _2722 = rsqrt(_2718);
    float _2724 = -_2720;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2728 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    float _2732 = _2708 * _2722;
    float _2734 = _2704 * _2722;
    float _2736 = abs(_2730);
    float _2738 = log2(_2736);
    float _2740 = _2712 * _2722;
    float _2742 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2744 = _2364 * _2734;
    float _2746 = -_2734;
    float _2748 = -_2742;
    float _2750 = fma(_2746, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2748);
    float _2752 = fma(_2362, _2732, _2744);
    float _2754 = -_2740;
    float _2756 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2750);
    float _2758 = fma(_2350, _2740, _2752);
    float _2760 = precise::clamp(_2758, 0.0, 1.0);
    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2764 = _2756 + _2762;
    float _2766 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2768 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2770 = precise::clamp(_2768, 0.0, 1.0);
    float _2772 = exp2(_2766);
    float _2774 = _2772 * _2770;
    float _2776 = _2760 * _2774;
    float _2778 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2780 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2782 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2778;
    out.m_101.y = _2780;
    out.m_101.z = _2782;
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
    out.dm_pad2 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_56.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2839 = as_type<float>(_138);
        out.gl_Position.z = _2839;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2908 = as_type<float>(_176);
        out.gl_Position.z = _2908;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_63.x;
    float _180 = in.m_63.y;
    float _182 = in.m_63.z;
    float _184 = in.m_65.x;
    float _186 = in.m_65.y;
    float _188 = in.m_65.z;
    float _190 = in.m_67.x;
    float _192 = in.m_67.y;
    float _194 = in.m_67.z;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    bool _222 = _216 > 0.0;
    float _224 = 0.0;
    float _226 = _216;
    float _228 = _214;
    float _230 = _210;
    float _232 = _212;
    if (_220)
    {
        float _234 = rsqrt(_208);
        _224 = _234;
    }
    float _236 = _224;
    float _238 = 0.0;
    if (!_220)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _218 > 0.0;
    float _244 = _218;
    float _246 = _240;
    if (!_220)
    {
        _244 = 0.0;
        _226 = 0.0;
    }
    float _248 = _244;
    float _250 = _226;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _248;
    if (!_222)
    {
        _252 = 0.0;
        _254 = 0.0;
    }
    float _260 = _252;
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    float _268 = _260;
    if (_222)
    {
        float _270 = rsqrt(_210);
        _264 = _270;
    }
    float _272 = _264;
    float _274 = 0.0;
    if (!_222)
    {
        _274 = 0.0;
    }
    float _276 = _274;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_212);
        _278 = _282;
    }
    float _284 = _278;
    if (_220)
    {
        float _286 = _236 * _184;
        _246 = _286;
    }
    float _288 = _246;
    if (_220)
    {
        float _290 = _236 * _178;
        _256 = _290;
    }
    float _292 = _256;
    if (_220)
    {
        float _294 = _236 * _190;
        _258 = _294;
    }
    float _296 = _258;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_242)
    {
        _228 = 0.0;
    }
    float _300 = _228;
    float _302 = _300;
    if (_222)
    {
        float _304 = _272 * _186;
        _280 = _304;
    }
    float _306 = _280;
    if (!_242)
    {
        _230 = 0.0;
        _232 = 0.0;
    }
    float _308 = _230;
    float _310 = _232;
    float _312 = _308;
    float _314 = _310;
    if (_222)
    {
        float _316 = _272 * _180;
        _266 = _316;
    }
    float _318 = _266;
    if (_222)
    {
        float _320 = _272 * _192;
        _268 = _320;
    }
    float _322 = _268;
    if (_242)
    {
        float _324 = _284 * _188;
        _312 = _324;
    }
    float _326 = _312;
    if (_242)
    {
        float _328 = _284 * _182;
        _314 = _328;
    }
    float _330 = _314;
    if (_242)
    {
        float _332 = _284 * _194;
        _302 = _332;
    }
    float _334 = _302;
    bool _336 = !_298;
    float _354;
    if (!_336)
    {
        float _338 = in.m_69.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_122);
        float _360 = 1.0 / _358;
        float _362 = _156 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_56.x;
    float _368 = in.m_56.y;
    float _370 = in.m_56.z;
    float _372 = in.m_65.w;
    float _374 = in.m_67.w;
    float _376 = _186 * _368;
    float _378 = _192 * _368;
    float _380 = fma(_184, _366, _376);
    float _382 = fma(_190, _366, _378);
    float _384 = fma(_188, _370, _380);
    float _386 = fma(_194, _370, _382);
    float _388 = _384 + _372;
    float _390 = _386 + _374;
    float _392 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _394 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _396 = floor(_392);
    float _398 = floor(_394);
    float _400 = -_396;
    float _402 = _392 + _400;
    float _404 = -_398;
    float _406 = _394 + _404;
    float2 _3232 = float2(_402, _406);
    float _408 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3232, float2(0.0), isnan(_3232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3232, float2(0.0), isnan(_3232)), level(0.0)).x;
    float _410 = in.m_69.x;
    float _412 = _180 * _368;
    float _414 = in.m_69.y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _420;
    float _424 = in.m_69.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = 1.0 / _418;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _436 = fma(_178, _366, _412);
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _440 = _438 != 0;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _444 = _442 != 0;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _448 = _446 != 0;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _452 = 1.0 / _422;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _456 = _364 + _454;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _460 = fma(_182, _370, _436);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _464 = _364 + _462;
    float _466 = in.m_63.w;
    float _468 = 1.0 / _428;
    float _470 = _410 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _472 = _414 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _474 = _456 * _430;
    float _476 = -_450;
    float _478 = fma(_470, 2.0, _476);
    float _480 = _414 + _424;
    float _482 = fma(_472, -2.0, _458);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _486 = _364 + _484;
    float _488 = _480 + (-1.0);
    float _490 = 1.0 / _434;
    float _492 = _486 * _452;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _496 = _364 + _494;
    float _498 = _424 * 2.0;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _502 = _410 + _424;
    float _504 = _496 * _468;
    float _506 = _410 + _414;
    float _508 = floor(_498);
    float _510 = _410 * 2.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _512;
    float _516 = _414 * 2.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _522 = fma(_514, _492, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _524 = _464 * _490;
    float _526 = _502 + (-1.0);
    float _528 = _506 + (-1.0);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _530;
    float _534 = floor(_510);
    float _536 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _538 = fma(_532, _492, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _540 = _508 >= 0.0;
    bool _542 = isnan(_508);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _552 = _508 > 0.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    float _558 = floor(_516);
    int _560 = _548 ? 0 : 1;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _562;
    float _566 = fma(_556, _492, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _586 = log2(_584);
    bool _588 = _534 >= 0.0;
    bool _590 = isnan(_534);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _602 = _534 > 0.0;
    float _604 = fma(_574, _524, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _606 = _596 ? 0 : 1;
    float _608 = fma(_578, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _610 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _612 = isnan(_364);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = fma(_520, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _624 = _558 > 0.0;
    float _626 = fma(_582, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _628 = _558 >= 0.0;
    bool _630 = isnan(_558);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = fma(_564, _504, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _640 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _642 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _644 = isnan(_364);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _586 * _156;
    bool _656 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _658 = isnan(_364);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _676 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _678 = isnan(_364);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_620;
    float _690 = _688 + 1.0;
    float _692 = exp2(_654);
    float _694 = fma(_674, _524, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _696 = fma(_600, _524, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _698 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _700 = isnan(_364);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_670, _504, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _712 = -_156;
    float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _478);
    float _716 = -_708;
    float _718 = _716 + 1.0;
    float _720 = _708 * _690;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    int _726 = _636 ? 0 : 1;
    float _728 = _686 * _718;
    bool _730 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _738 = _734 || _736;
    float _740 = -_686;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _724;
    float _746 = -_692;
    float _748 = _746 + 1.0;
    float _750 = _666 * _742;
    float _752 = -_666;
    float _754 = _752 + 1.0;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _758 = _738 ? _748 : 0.0;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _762 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _764 = isnan(1.0);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _770 = _766 || _768;
    float _772 = _652 * _754;
    float _774 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[78].z, _756);
    float _776 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[78].w, _760);
    float _778 = -_652;
    float _780 = _778 + 1.0;
    float _782 = _522 * _772;
    float _784 = _566 * _772;
    float _786 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _774);
    float _788 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _776);
    float _790 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _482);
    float _792 = _538 * _772;
    float _794 = _460 + _466;
    float _796 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].x, _784);
    float _798 = _790;
    if (_770)
    {
        float _800 = _758 * _744;
        _160 = _800;
    }
    float _802 = _160;
    float _804 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].y, _782);
    bool _806 = !_444;
    int _808 = _806 ? 0 : 1;
    float _810 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[143].z, _792);
    int _812 = ~_726;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_608, _750, _796);
    int _820 = abs(_808);
    float _822 = fma(_622, _750, _804);
    int _824 = _816;
    if (!_624)
    {
        int _826 = ~_726;
        int _828 = _826 + 1;
        _824 = _828;
    }
    int _830 = _824;
    float _832 = fma(_626, _750, _810);
    float _834 = _794 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _836 = ~_606;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = in.m_71.x;
    float _844 = in.m_71.y;
    float _846 = in.m_71.z;
    int _848 = _840;
    if (!_602)
    {
        int _850 = ~_606;
        int _852 = _850 + 1;
        _848 = _852;
    }
    int _854 = _848;
    float _856 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[11].x, _834);
    float _858 = fma(_638, _728, _818);
    float _860 = float(_820);
    float _862 = _794 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _864 = float(_854);
    float _866 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _856);
    float _868 = fma(_710, _728, _822);
    float _870 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[10].x, _862);
    float _872 = fma(_640, _728, _832);
    float _874 = _860 * _864;
    float _876 = _866 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _878 = !_440;
    int _880 = _878 ? 0 : 1;
    float _882 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _870);
    bool _884 = !_448;
    int _886 = _884 ? 0 : 1;
    float _888 = 1.0 / _876;
    int _890 = ~_560;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = _874 * (-2.0);
    int _898 = _894;
    if (!_552)
    {
        int _900 = ~_560;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = _882 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _908 = abs(_880);
    float _910 = fma(_500, _896, _500);
    int _912 = abs(_886);
    float _914 = fma(_896, _844, _844);
    float _916 = float(_908);
    float _918 = _414 + (-0.5);
    float _920 = float(_904);
    float _922 = _906 + _876;
    float _924 = float(_912);
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[196].y, _914);
    float _928 = float(_830);
    float _930 = _916 * _920;
    float _932 = _922 * _888;
    float _934 = _932 * 0.5;
    float _936 = fma(_910, _802, _926);
    float _938 = _924 * _928;
    float _940 = _930 * (-2.0);
    float _942 = in.m_73.x;
    float _944 = in.m_73.y;
    float _946 = in.m_73.z;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _950 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[30].w, _948);
    float _952 = _410 + (-0.5);
    float _954 = fma(_940, _842, _842);
    float _956 = in.m_75.x;
    float _958 = in.m_75.y;
    float _960 = in.m_75.z;
    float _962 = fma(_550, _940, _550);
    float _964 = _938 * (-2.0);
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].x, _954);
    float _968 = fma(_604, _720, _858);
    float _970 = 1.0 / _950;
    float _972 = fma(_694, _720, _868);
    float _974 = fma(_962, _802, _966);
    float _976 = fma(_964, _846, _846);
    float _978 = _424 + (-0.5);
    float _980 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].x, _968);
    float _982 = fma(_536, _964, _536);
    float _984 = fma(_696, _720, _872);
    float _986 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].z, _976);
    float _988 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].y, _972);
    float _990 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].z, _984);
    float _992 = fma(_982, _802, _986);
    float _994 = _936 * 0.15915493667125701904296875;
    float _996 = _974 * 0.15915493667125701904296875;
    float _998 = _980 * _942;
    float _1000 = _990 * _946;
    float _1002 = _992 * 0.15915493667125701904296875;
    float _1004 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _956);
    float _1008 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1010 = _988 * _944;
    float _1012 = _994 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _958);
    float _1018 = _1006 * _1008;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1022 = _970 * _1020;
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = _794 + _1004;
    float _1028 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _960);
    float _1032 = _994 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    bool _1036 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1038 = _1016 * _1024;
    bool _1040 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1042 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1044 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1046 = _1030 * _1028;
    float _1048 = _1002 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1042);
    bool _1054 = !_1036;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1044);
    int _1060 = 2;
    if (!_1036)
    {
        _1060 = 1;
    }
    int _1062 = _1060;
    float _1064 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1058);
    float _1066 = _1002 * 6.283185482025146484375;
    float _1068 = cos(_1066);
    int _1070 = _1062;
    if (!_1040)
    {
        _1070 = _1056;
    }
    int _1072 = _1070;
    float _1074 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1076 = _1072 << 6;
    float _1078 = _996 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _1014 * _1050;
    float _1084 = _1034 * _1050;
    float _1086 = _996 * 6.283185482025146484375;
    float _1088 = sin(_1086);
    float _1090 = _1034 * _1068;
    float _1092 = _1014 * _1068;
    float _1094 = _1068 * _1080;
    float _1096 = _1050 * _1080;
    float _1098 = _1014 * _1080;
    float _1100 = _1034 * _1080;
    float _1102 = _1094 * _1038;
    float _1104 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1052);
    float _1106 = trunc(_1074);
    int _1108 = int(_1106);
    float _1110 = fma(_1088, _1082, _1090);
    float _1112 = fma(_1088, _1090, _1082);
    float _1114 = -_1092;
    float _1116 = fma(_1088, _1084, _1114);
    int _1118 = _1076 + 96;
    uint _1121 = uint(int(uint(_1118) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.vp_c15)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.vp_c15)._m0[int(_1131)][_1133];
    float _1137 = -_1084;
    float _1139 = fma(_1088, _1092, _1137);
    float _1141 = fma(_1096, _1018, _1102);
    float _1143 = _1112 * _1038;
    float _1145 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1147 = _1139 * _1038;
    float _1149 = -_1088;
    float _1151 = fma(_1149, _1046, _1141);
    float _1153 = fma(_1116, _1018, _1143);
    int _1155 = _1076 + 104;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[int(_1167)][_1169];
    float _1173 = fma(_1110, _1018, _1147);
    float _1175 = trunc(_1145);
    int _1177 = int(_1175);
    float _1179 = _1151 * _306;
    float _1181 = fma(_1100, _1046, _1153);
    float _1183 = fma(_1098, _1046, _1173);
    float _1185 = _1151 * _322;
    float _1187 = _1151 * _318;
    int _1189 = _1076 + 48;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    uint _1193 = uint(int(uint(int(_1191)) >> uint(2)));
    int _1195 = int(_1191) & 3;
    float _1197 = (*spvDescriptorSet0.vp_c15)._m0[int(_1193)][_1195];
    int _1199 = int(_1191) + 1;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    int _1203 = _1199 & 3;
    float _1205 = (*spvDescriptorSet0.vp_c15)._m0[int(_1201)][_1203];
    float _1207 = fma(_1183, _288, _1179);
    float _1209 = fma(_1183, _296, _1185);
    int _1211 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1213 = _1108 + _1211;
    int _1215 = _1213 + 1;
    float _1217 = fma(_1181, _326, _1207);
    float _1219 = fma(_1181, _334, _1209);
    bool _1221 = _1215 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1223 = _1076 + 64;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c15)._m0[int(_1235)][_1237];
    float _1241 = _388 + _1217;
    float _1243 = _390 + _1219;
    int _1245 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1247 = _1177 + _1245;
    int _1249 = _1247 + 1;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1253 = _1241 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1257 = _1243 + _1255;
    int _1259 = _1215 | _1249;
    int _1261 = _1076 + 56;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.vp_c15)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.vp_c15)._m0[int(_1273)][_1275];
    float _1279 = _1257 * _1257;
    bool _1281 = _1259 < 0;
    bool _1283 = _1281 || _1221;
    float _1285 = fma(_1253, _1253, _1279);
    bool _1287 = _1249 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1289 = _1287 || _1283;
    int _1291 = _1076 + 72;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    uint _1295 = uint(int(uint(int(_1293)) >> uint(2)));
    int _1297 = int(_1293) & 3;
    float _1299 = (*spvDescriptorSet0.vp_c15)._m0[int(_1295)][_1297];
    int _1301 = int(_1293) + 1;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    int _1305 = _1301 & 3;
    float _1307 = (*spvDescriptorSet0.vp_c15)._m0[int(_1303)][_1305];
    float _1309 = sqrt(_1285);
    int _1311 = _1076 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = _1026 * _1135;
    int _1331 = as_type<int>(_1151);
    float _1333 = _1187;
    if (!_1289)
    {
        int _1335 = _1249 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1337 = _1335 + _1215;
        _1331 = _1337;
    }
    int _1339 = _1331;
    float _1341 = fma(_388, _1127, _1329);
    float _1343 = fma(_1183, _292, _1187);
    float _1345 = _1183;
    if (!_1289)
    {
        float _1347 = floor(_1074);
        _1345 = _1347;
    }
    float _1349 = _1345;
    float _1351 = fma(_390, _1163, _1341);
    bool _1353 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1355 = _1351 + _1171;
    float _1357 = _1026 * _1205;
    float _1359 = 1.0 / _1355;
    float _1361 = fma(_388, _1197, _1357);
    float _1363 = fma(_1181, _330, _1343);
    float _1365 = _1026 * _1239;
    int _1367 = as_type<int>(_1239);
    int _1369 = as_type<int>(_1231);
    float _1371 = _1361;
    float _1373 = _1365;
    if (!_1289)
    {
        int _1375 = _1339 << 2;
        _1367 = _1375;
    }
    int _1377 = _1367;
    float _1379 = _794 + _1363;
    float _1381 = fma(_388, _1231, _1365);
    int _1383 = _1377;
    float _1385 = _1379;
    if (!_1289)
    {
        uint _1387 = uint(int(uint(_1339) >> uint(2)));
        _1369 = int(_1387);
    }
    int _1389 = _1369;
    int _1391 = _1389;
    if (!_1289)
    {
        int _1393 = 12 & _1377;
        _1383 = _1393;
    }
    int _1395 = _1383;
    float _1397 = fma(_390, _1269, _1361);
    if (!_1353)
    {
        _1371 = _1241;
    }
    float _1399 = _1371;
    float _1401 = _1399;
    if (!_1289)
    {
        int _1403 = _1389 << 4;
        int _1405 = _1403 + _1395;
        _1391 = _1405;
    }
    int _1407 = _1391;
    float _1409 = _1397 + _1277;
    if (!_1353)
    {
        _1373 = _1243;
    }
    float _1411 = _1373;
    float _1413 = fma(_390, _1299, _1381);
    float _1415 = _1413 + _1307;
    bool _1417 = !_1353;
    float _1419 = _1411;
    if (!_1417)
    {
        float _1421 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1425 = _1309 + _1423;
        float _1427 = _1379 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1429 = rsqrt(_1285);
        float _1431 = _1425 * _1421;
        float _1433 = _1431 * 0.15915493667125701904296875;
        float _1435 = _1433 * 6.283185482025146484375;
        float _1437 = cos(_1435);
        float _1439 = _1433 * 6.283185482025146484375;
        float _1441 = sin(_1439);
        float _1443 = _1437 + (-1.0);
        float _1445 = fma(_1441, _1427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1447 = _1443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = _1429 * _1445;
        float _1451 = fma(_1379, _1437, _1447);
        float _1453 = fma(_1253, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1455 = fma(_1257, _1449, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1385 = _1451;
        _1401 = _1453;
        _1419 = _1455;
    }
    float _1457 = _1385;
    float _1459 = _1401;
    float _1461 = _1419;
    int _1463 = _1076 + 88;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    float _1481 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1483 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1485 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1487 = _1409 * _1359;
    float _1489 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1481);
    float _1491 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1483);
    float _1493 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1485);
    float _1495 = _1257;
    if (!_1289)
    {
        int _1497 = _1407 + 400;
        uint _1499 = uint(int(uint(_1497) >> uint(2)));
        uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
        int _1503 = int(_1499) & 3;
        float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
        _1495 = _1505;
    }
    float _1507 = _1495;
    float _1509 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1489);
    bool _1511 = _1487 >= 0.0;
    float _1513 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1491);
    float _1515 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1517 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1493);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1521 = _1415 * _1359;
    bool _1523 = _1487 <= 1.0;
    bool _1525 = _1523 && _1511;
    float _1527 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1529 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1515);
    float _1531 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1535 = _1521 >= 0.0;
    bool _1537 = _1535 && _1525;
    float _1539 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1541 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1543 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1529);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1533);
    bool _1547 = _1521 <= 1.0;
    bool _1549 = _1547 && _1537;
    float _1551 = -_1541;
    float _1553 = fma(_1551, _1539, 1.0);
    float _1555 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1557 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1545);
    float _1559 = _1026 * _1327;
    float _1561 = _1243;
    float _1563 = _1513;
    if (!_1289)
    {
        float _1565 = floor(_1145);
        _1561 = _1565;
    }
    float _1567 = _1561;
    float _1569 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1571 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1557);
    float _1573 = fma(_388, _1319, _1559);
    float _1575 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1577 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1569);
    float _1579 = log2(_1553);
    if (_1549)
    {
        float _1581 = float(_1072);
        _1563 = _1581;
    }
    float _1583 = _1563;
    float _1585 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1575);
    float _1587 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1577);
    float _1589 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1585);
    float _1591 = 1.0 / _1571;
    float _1593 = fma(_390, _1471, _1573);
    float _1595 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1587);
    float _1597 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1599 = _1567;
    float _1601 = _1585;
    if (!_1289)
    {
        float _1603 = -_1567;
        float _1605 = _1145 + _1603;
        _1599 = _1605;
    }
    float _1607 = _1599;
    float _1609 = _1593 + _1479;
    float _1611 = _1569;
    if (_1549)
    {
        float _1613 = rint(_1583);
        float _1615 = precise::max(_1613, 0.0);
        uint _1617 = uint(_1615);
        uint _1619 = clamp(_1617, 0u, 65535u);
        _1611 = as_type<float>(_1619);
    }
    float _1621 = _1611;
    float _1623 = _1609 * _1359;
    float _1625 = _1579 * 0.693147182464599609375;
    float _1627 = _1625 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1629 = _1625;
    if (!_1289)
    {
        float _1631 = -_1349;
        float _1633 = _1074 + _1631;
        _1629 = _1633;
    }
    float _1635 = _1629;
    float _1637 = _1609;
    if (!_1289)
    {
        float _1639 = rint(_1507);
        float _1641 = precise::max(_1639, 0.0);
        uint _1643 = uint(_1641);
        uint _1645 = clamp(_1643, 0u, 65535u);
        _1637 = as_type<float>(_1645);
    }
    float _1647 = _1637;
    float _1649 = _1595 * _1591;
    float _1651 = _1597 * _1591;
    float _1653 = fma(_1649, 0.5, 0.5);
    float _1655 = fma(_1651, -0.5, 0.5);
    float _1657 = _1521;
    if (_1549)
    {
        float3 _5261 = float3(_1487, _1521, float(as_type<int>(_1621)));
        float3 _5265 = select(_5261, float3(0.0), isnan(_5261));
        float _1659 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5265.xy, uint(rint(_5265.z)), _1623, level(0.0));
        _1657 = _1659;
    }
    float _1661 = _1657;
    float3 _5275 = float3(_1653, _1655, _1627);
    float _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5275, float3(0.0), isnan(_5275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5275, float3(0.0), isnan(_5275)), level(0.0)).x;
    float3 _5284 = float3(_1653, _1655, _1627);
    float4 _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).xyzw;
    float _1668 = _1666.x;
    float _1670 = _1666.y;
    float _1672 = _1666.z;
    float _1674 = _1666.w;
    float _1676 = _1607;
    if (!_1289)
    {
        float3 _5307 = float3(_1635, _1607, float(as_type<int>(_1647)));
        float3 _5309 = select(_5307, float3(0.0), isnan(_5307));
        float _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5309.xy, uint(rint(_5309.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5309.xy, uint(rint(_5309.z)), level(0.0)).x;
        _1676 = _1678;
    }
    float _1680 = _1676;
    if (_1289)
    {
        _1601 = 1.0;
    }
    float _1682 = _1601;
    float _1684 = _1682;
    float _1686 = _1680;
    if (!_1289)
    {
        int _1688 = _1339 << 4;
        int _1690 = _1688 + 2048;
        uint _1692 = uint(int(uint(_1690) >> uint(2)));
        uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
        int _1696 = int(_1692) & 3;
        float _1698 = (*spvDescriptorSet0.vp_c15)._m0[int(_1694)][_1696];
        int _1700 = int(_1692) + 1;
        uint _1702 = uint(int(uint(_1700) >> uint(2)));
        int _1704 = _1700 & 3;
        float _1706 = (*spvDescriptorSet0.vp_c15)._m0[int(_1702)][_1704];
        int _1708 = _1690 + 8;
        uint _1710 = uint(int(uint(_1708) >> uint(2)));
        uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
        int _1714 = int(_1710) & 3;
        float _1716 = (*spvDescriptorSet0.vp_c15)._m0[int(_1712)][_1714];
        int _1718 = int(_1710) + 1;
        uint _1720 = uint(int(uint(_1718) >> uint(2)));
        int _1722 = _1718 & 3;
        float _1724 = (*spvDescriptorSet0.vp_c15)._m0[int(_1720)][_1722];
        float _1726 = _1026 * _1706;
        float _1728 = fma(_388, _1698, _1726);
        float _1730 = fma(_390, _1716, _1728);
        float _1732 = _1730 + _1724;
        float _1734 = precise::clamp(_1732, 0.0, 1.0);
        float _1736 = -_1734;
        float _1738 = _1736 + _1680;
        float _1740 = fma(_1738, 500.0, 1.5);
        float _1742 = exp2(_1740);
        float _1744 = 0.0 + _1742;
        float _1746 = precise::clamp(_1744, 0.0, 1.0);
        _1684 = _1746;
    }
    float _1748 = _1684;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1457 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1756 = _1459 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1760 = _1461 + _1758;
    float _1762 = _1752 * _1752;
    float _1764 = fma(_1756, _1756, _1762);
    float _1766 = fma(_1760, _1760, _1764);
    float _1768 = rsqrt(_1766);
    float _1770 = sqrt(_1766);
    float _1772 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1774 = _1756 * _1772;
    float _1776 = _1760 * _1772;
    float _1778 = _1774 * _1774;
    float _1780 = _1776 * _1776;
    float _1782 = _1778 + _1780;
    float _1784 = sqrt(_1782);
    bool _1786 = _1784 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1790 = _1784 + _1788;
    float _1792 = _390;
    float _1794 = _1790;
    float _1796 = _1772;
    float _1798 = _1774;
    float _1800 = _1776;
    float _1802 = _1778;
    float _1804 = _1780;
    if (_1786)
    {
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1806;
    }
    float _1808 = _1792;
    if (_1786)
    {
        float _1810 = _1790 * _1808;
        _1794 = _1810;
    }
    float _1812 = _1794;
    if (_1786)
    {
        float _1814 = _1812 * 0.15915493667125701904296875;
        _1686 = _1814;
    }
    float _1816 = _1686;
    float _1818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1820 = _388;
    if (_1786)
    {
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1820 = _1824;
    }
    float _1826 = _1820;
    float _1828 = precise::max(0.0, _1818);
    float _1830 = _1812;
    float _1832 = _1828;
    if (_1786)
    {
        float _1834 = _1816 * 6.283185482025146484375;
        float _1836 = cos(_1834);
        _1830 = _1836;
    }
    float _1838 = _1830;
    float _1840 = -_1772;
    float _1842 = -_1828;
    float _1844 = fma(_1752, _1840, _1842);
    float _1846 = _1844;
    if (_1786)
    {
        float _1848 = _1844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1848;
    }
    float _1850 = _1796;
    float _1852 = _1818;
    float _1854 = _1850;
    if (_1786)
    {
        float _1856 = rsqrt(_1782);
        _1852 = _1856;
    }
    float _1858 = _1852;
    if (_1786)
    {
        float _1860 = fma(_1826, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1832 = _1860;
    }
    float _1862 = _1832;
    float _1864 = _1862;
    if (_1786)
    {
        float _1866 = _1838 + (-1.0);
        _1854 = _1866;
    }
    float _1868 = _1854;
    float _1870 = _1858;
    if (_1786)
    {
        float _1872 = _1858 * _1862;
        _1864 = _1872;
    }
    float _1874 = _1864;
    if (_1786)
    {
        float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1876;
    }
    float _1878 = _1870;
    if (_1786)
    {
        float _1880 = _1774 * _1874;
        _1798 = _1880;
    }
    float _1882 = _1798;
    if (_1786)
    {
        float _1884 = fma(_1844, _1838, _1878);
        _1846 = _1884;
    }
    float _1886 = _1846;
    if (_1786)
    {
        float _1888 = _1776 * _1874;
        _1800 = _1888;
    }
    float _1890 = _1800;
    if (_1786)
    {
        float _1892 = _1882 * _1882;
        _1802 = _1892;
    }
    float _1894 = _1802;
    if (_1786)
    {
        float _1896 = _1890 * _1890;
        _1804 = _1896;
    }
    float _1898 = _1804;
    float _1900 = fma(_1886, _1886, _1894);
    float _1902 = _1900 + _1898;
    float _1904 = rsqrt(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1908 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1906);
    float _1910 = precise::clamp(_1908, 0.0, 1.0);
    float _1912 = -_1910;
    float _1914 = _1912 + 1.0;
    float _1916 = abs(_1914);
    float _1918 = log2(_1916);
    float _1920 = _1904 * _1882;
    float _1922 = _1904 * _1886;
    float _1924 = _1904 * _1890;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = -_1926;
    float _1930 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1928);
    float _1932 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1934 = -_1924;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1930);
    float _1938 = fma(_1936, -0.5, 0.5);
    float _1940 = exp2(_1932);
    float _1942 = fma(_1936, 0.5, 0.5);
    float _1944 = fma(_1942, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1946 = sqrt(_1938);
    float _1948 = fma(_1942, _1944, -0.212114393711090087890625);
    float _1950 = _1922 + 1.0;
    float _1952 = fma(_1942, _1948, 1.570728778839111328125);
    float _1954 = -_1922;
    float _1956 = fma(_1940, _1950, _1954);
    float _1958 = fma(_1956, 0.5, 0.5);
    float _1960 = _1946 * 0.636619746685028076171875;
    float _1962 = -_1952;
    float _1964 = fma(_1960, _1962, 1.0);
    float2 _5750 = float2(_1964, _1958);
    float3 _1968 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5750, float2(0.0), isnan(_5750)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5750, float2(0.0), isnan(_5750)), level(0.0)).xyz;
    float _1970 = _1968.x;
    float _1972 = _1968.y;
    float _1974 = _1968.z;
    float _1976 = in.m_77.y;
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1980 = _414 > 0.5;
    float _1982 = in.m_69.w;
    int _1984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1986 = _1984 != 0;
    float _1988 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1992 = _1990 != 0;
    float _1994 = in.m_77.x;
    int _1996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1998 = _1996 != 0;
    float _2000 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2004 = _2002 != 0;
    float _2006 = exp2(_1988);
    float _2008 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2000);
    float _2010 = -_408;
    float _2012 = _2010 + 1.0;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2024 = -_1976;
    float _2026 = _2024 + 1.0;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2030 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2020;
    bool _2032 = _1982 > 0.5;
    float _2034 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2008);
    out.m_81.x = _1459;
    out.m_81.y = _1457;
    out.m_81.z = _1461;
    int _2036 = _2032 ? as_type<int>(_2026) : as_type<int>(_1976);
    float _2038 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2034);
    bool _2040 = _2032;
    bool _2042 = _2004;
    float _2044 = _1976;
    int _2046 = as_type<int>(_2022);
    if (_1992)
    {
        bool _2048 = _410 > 0.5;
        _2040 = _2048;
    }
    bool _2050 = _2040;
    float _2052 = _2004 ? as_type<float>(_2036) : _1976;
    if (_1986)
    {
        bool _2054 = _424 > 0.5;
        _2042 = _2054;
    }
    bool _2056 = _2042;
    out.gl_Position.x = _1595;
    out.gl_Position.y = _1597;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1571;
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1998)
    {
        float _2060 = _1980 ? _2026 : _1976;
        _2044 = _2060;
    }
    float _2062 = _2044;
    float _2064 = in.m_83.x;
    float _2066 = in.m_83.y;
    float _2068 = in.m_83.z;
    bool _2070 = _958 != 0.0;
    bool _2072 = isnan(_958);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = _956 == 0.0;
    bool _2082 = !_2078;
    bool _2084 = _2080 && _2082;
    float _2086 = _1994;
    if (!_1992)
    {
        _1333 = _1994;
    }
    float _2088 = _1333;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2092 = _960 == 0.0;
    bool _2094 = _2092 && _2084;
    float _2096 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2100 = in.m_85.x;
    float _2102 = in.m_85.y;
    float _2104 = in.m_85.z;
    float _2106 = in.m_85.w;
    float _2108 = fma(_2098, _2062, -0.5);
    int _2110 = as_type<int>(_2098);
    float _2112 = _2088;
    float _2114 = _2108;
    float _2116 = _2096;
    if (_1992)
    {
        float _2118 = -_1994;
        float _2120 = _2118 + 1.0;
        _2110 = as_type<int>(_2120);
    }
    int _2122 = _2110;
    out.m_87.x = _2096;
    out.m_87.y = _2022;
    out.m_87.z = _2030;
    out.m_87.w = _2028;
    float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2126 = -_790;
    float _2128 = fma(_788, _2108, _2126);
    if (_1992)
    {
        float _2130 = _2050 ? as_type<float>(_2122) : _1994;
        _2112 = _2130;
    }
    float _2132 = _2112;
    if (_2094)
    {
        _2114 = _2066;
    }
    float _2134 = _2114;
    float _2136 = _2134;
    if (_2094)
    {
        _798 = _2064;
    }
    float _2138 = _798;
    float _2140 = fma(_2018, _2132, -0.5);
    float _2142 = _2138;
    if (!_2094)
    {
        float _2144 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2064);
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = fma(_786, _2140, _714);
    if (_1986)
    {
        float _2150 = -_1994;
        float _2152 = _2150 + 1.0;
        _2046 = as_type<int>(_2152);
    }
    int _2154 = _2046;
    float _2156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2158 = as_type<float>(_2154);
    if (_2094)
    {
        _2116 = _2068;
    }
    float _2160 = _2116;
    float _2162 = _2160;
    if (!_2094)
    {
        float _2164 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2068);
        _2162 = _2164;
    }
    float _2166 = _2162;
    float _2168 = _2052 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1986)
    {
        float _2170 = _2056 ? as_type<float>(_2154) : _1994;
        _2086 = _2170;
    }
    float _2172 = _2086;
    float _2174 = _2104 * _2064;
    if (_2094)
    {
        _2158 = _2134;
    }
    float _2176 = _2158;
    float _2178 = _2148 + 0.5;
    float _2180 = _2176;
    if (!_2094)
    {
        _2136 = _2066;
    }
    float _2182 = _2136;
    float _2184 = -_2174;
    float _2186 = fma(_2100, _2068, _2184);
    float _2188 = abs(_1022);
    float _2190 = log2(_2188);
    float _2192 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2194 = _1094 * _2102;
    if (!_2094)
    {
        float _2196 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2182);
        _2180 = _2196;
    }
    float _2198 = _2180;
    float _2200 = _2102 * _2068;
    float _2202 = _2100 * _2182;
    float _2204 = _2168 * _2156;
    float _2206 = fma(_1096, _2100, _2194);
    float _2208 = -_2200;
    float _2210 = fma(_2104, _2182, _2208);
    float _2212 = -_2202;
    float _2214 = fma(_2102, _2064, _2212);
    float _2216 = _2192 * _2124;
    float _2218 = _2128 + 0.5;
    float _2220 = _2210 * _2106;
    float _2222 = _2214 * _2106;
    float _2224 = _1112 * _2198;
    float _2226 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2228 = _2186 * _2106;
    float _2230 = _1094 * _2198;
    out.m_89.x = _2178;
    out.m_89.y = _2218;
    out.m_89.z = _2216;
    out.m_89.w = _2204;
    float _2232 = fma(_1116, _2146, _2224);
    float _2234 = _1094 * _2228;
    float _2236 = exp2(_2226);
    float _2238 = fma(_1096, _2146, _2230);
    float _2240 = _1139 * _2198;
    float _2242 = fma(_1096, _2220, _2234);
    float _2244 = _1139 * _2102;
    float _2246 = _1112 * _2102;
    float _2248 = _1139 * _2228;
    float _2250 = _1112 * _2228;
    float _2252 = fma(_1110, _2146, _2240);
    float _2254 = fma(_1110, _2100, _2244);
    float _2256 = fma(_1116, _2100, _2246);
    float _2258 = -_1088;
    float _2260 = fma(_2258, _2104, _2206);
    float _2262 = fma(_1110, _2220, _2248);
    float _2264 = fma(_1116, _2220, _2250);
    float _2266 = -_1088;
    float _2268 = fma(_2266, _2166, _2238);
    float _2270 = -_1088;
    float _2272 = fma(_2270, _2222, _2242);
    float _2274 = fma(_1098, _2166, _2252);
    float _2276 = fma(_1100, _2166, _2232);
    float _2278 = fma(_1098, _2104, _2254);
    float _2280 = fma(_1100, _2104, _2256);
    float _2282 = _2260 * _306;
    float _2284 = _2260 * _318;
    float _2286 = fma(_1098, _2222, _2262);
    float _2288 = fma(_1100, _2222, _2264);
    float _2290 = _2260 * _322;
    float _2292 = _2268 * _306;
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    float _2298 = _2272 * _306;
    float _2300 = _2272 * _318;
    float _2302 = _2272 * _322;
    float _2304 = _2268 * _318;
    float _2306 = fma(_2278, _288, _2282);
    float _2308 = fma(_2278, _292, _2284);
    float _2310 = fma(_2278, _296, _2290);
    float _2312 = fma(_2274, _288, _2292);
    float _2314 = fma(_2286, _288, _2298);
    float _2316 = fma(_2286, _292, _2300);
    float _2318 = fma(_2274, _292, _2304);
    float _2320 = _2268 * _322;
    float _2322 = fma(_2286, _296, _2302);
    float _2324 = fma(_2280, _330, _2308);
    float _2326 = fma(_2280, _334, _2310);
    float _2328 = fma(_2296, -2.0, 3.0);
    float _2330 = _2296 * _2296;
    float _2332 = fma(_2274, _296, _2320);
    float _2334 = fma(_2288, _334, _2322);
    bool _2336 = _1022 <= 8000.0;
    bool _2338 = isnan(_1022);
    bool _2340 = _2336 || _2338;
    bool _2342 = isnan(8000.0);
    bool _2344 = _2340 || _2342;
    float _2346 = float(_2344);
    float _2348 = _2330 * _2328;
    float _2350 = fma(_2276, _334, _2332);
    float _2352 = fma(_2288, _330, _2316);
    float _2354 = fma(_2280, _326, _2306);
    float _2356 = -_2348;
    float _2358 = _2356 + 1.0;
    float _2360 = fma(_2288, _326, _2314);
    float _2362 = fma(_2276, _326, _2312);
    float _2364 = fma(_2276, _330, _2318);
    float _2366 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2348);
    float _2368 = _2358;
    if (!_1549)
    {
        _2368 = 1.0;
    }
    float _2370 = _2368;
    out.m_91.x = _2354;
    out.m_91.y = _2324;
    out.m_91.z = _2326;
    float _2372 = _2370;
    if (_1549)
    {
        bool _2374 = _1661 >= _1623;
        bool _2376 = isnan(_1661);
        bool _2378 = _2374 || _2376;
        bool _2380 = isnan(_1623);
        bool _2382 = _2378 || _2380;
        float _2384 = float(_2382);
        _2372 = _2384;
    }
    float _2386 = _2372;
    float _2388 = _2346 * _2366;
    bool _2390 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2392 = isnan(_1770);
    bool _2394 = _2390 || _2392;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2398 = _2394 || _2396;
    out.m_93.x = _2360;
    out.m_93.y = _2352;
    out.m_93.z = _2334;
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2402 = -_2006;
    float _2404 = _2402 + 1.0;
    float _2406 = _2386 * _1748;
    out.m_95.x = _2362;
    out.m_95.y = _2364;
    out.m_95.z = _2350;
    float _2408 = _2012 * _2400;
    float _2410 = precise::clamp(_2408, 0.0, 1.0);
    float _2412 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2414 = -_2410;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2418 = _2412 * _1663;
    float _2420 = -_2412;
    float _2422 = _2420 + 1.0;
    float _2424 = _2412;
    float _2426 = _2400;
    float _2428 = _2406;
    float _2430 = _2422;
    if (!_2398)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2432 = _2424;
    float _2434 = -_2406;
    float _2436 = fma(_2434, _2416, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _1674 * _2418;
    float _2442 = _1674 * _2422;
    float _2444 = _2438;
    float _2446 = _2440;
    float _2448 = _2432;
    float _2450 = _2432;
    if (!_2398)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2452 = _2426;
    float _2454 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2398)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2460 = _2428;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2398)
    {
        _2430 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2466 = _2430;
    out.m_97.x = _2454;
    float _2468 = _2466;
    float _2470 = _2466;
    if (!_2398)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2472 = _2444;
    float _2474 = _1974 * _2418;
    float _2476 = fma(_1970, _2440, _1668);
    float _2478 = fma(_1972, _2440, _1670);
    float _2480 = _2472;
    float _2482 = _2472;
    if (!_2398)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2484 = _2446;
    float _2486 = fma(_1674, _2474, _1672);
    out.m_99.x = _2476;
    out.m_99.y = _2478;
    out.m_99.z = _2486;
    out.m_99.w = _2442;
    bool _2488 = !_2398;
    float _2490 = _2484;
    float _2492 = _2484;
    if (!_2488)
    {
        bool _2494 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1770);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1770 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = 1.0 / _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2512;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2542 = fma(_2536, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2450 = _2542;
            _2470 = _2550;
            _2492 = _2544;
            _2464 = _2548;
            _2458 = _2546;
            _2482 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1770);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2490;
            _2492 = _2566;
            if (!_2564)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2448;
            _2450 = _2568;
            if (!_2564)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2456;
            _2458 = _2570;
            if (!_2564)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2462;
            _2464 = _2572;
            if (!_2564)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2468;
            _2470 = _2574;
            if (!_2564)
            {
                _2480 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2480;
            bool _2578 = !_2564;
            _2482 = _2576;
            if (!_2578)
            {
                bool _2580 = _1770 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1770);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1770 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = 1.0 / _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2598;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2628 = fma(_2622, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2450 = _2628;
                    _2470 = _2636;
                    _2492 = _2630;
                    _2464 = _2634;
                    _2458 = _2632;
                    _2482 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2482 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2450;
    float _2642 = _2470;
    float _2644 = _2492;
    float _2646 = _2464;
    float _2648 = _2458;
    float _2650 = _2482;
    float _2652 = fma(_2364, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = -_2644;
    float _2662 = _2660 + _2646;
    float _2664 = -_2648;
    float _2666 = _2664 + _2650;
    bool _2668 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2670 = fma(_2654, _2658, _2640);
    float _2672 = fma(_2654, _2662, _2644);
    float _2674 = fma(_2654, _2666, _2648);
    float _2676 = _2670 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2678 = fma(_2672, 0.298911988735198974609375, _2676);
    float _2680 = fma(_2674, 0.114477999508380889892578125, _2678);
    out.m_101.x = 0.0;
    float _2682 = -_2680;
    float _2684 = _2672 + _2682;
    float _2686 = -_2680;
    float _2688 = _2670 + _2686;
    float _2690 = -_2680;
    float _2692 = _2674 + _2690;
    float _2694 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2696 = fma(_2684, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2680);
    out.m_97.w = _2694;
    out.m_103.x = _2696;
    out.m_103.y = _2698;
    out.m_103.z = _2700;
    if (!_2668)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2702 = -_1457;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2706 = -_1459;
    float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2710 = -_1461;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2714 = _2704 * _2704;
    float _2716 = fma(_2708, _2708, _2714);
    float _2718 = fma(_2712, _2712, _2716);
    float _2720 = sqrt(_2718);
    float _2722 = rsqrt(_2718);
    float _2724 = -_2720;
    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2728 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    float _2732 = _2708 * _2722;
    float _2734 = _2704 * _2722;
    float _2736 = abs(_2730);
    float _2738 = log2(_2736);
    float _2740 = _2712 * _2722;
    float _2742 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2744 = _2364 * _2734;
    float _2746 = -_2734;
    float _2748 = -_2742;
    float _2750 = fma(_2746, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2748);
    float _2752 = fma(_2362, _2732, _2744);
    float _2754 = -_2740;
    float _2756 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2750);
    float _2758 = fma(_2350, _2740, _2752);
    float _2760 = precise::clamp(_2758, 0.0, 1.0);
    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2764 = _2756 + _2762;
    float _2766 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2768 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2770 = precise::clamp(_2768, 0.0, 1.0);
    float _2772 = exp2(_2766);
    float _2774 = _2772 * _2770;
    float _2776 = _2760 * _2774;
    float _2778 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2780 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2782 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2778;
    out.m_101.y = _2780;
    out.m_101.z = _2782;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.dm_pad2.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.dm_pad2.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.dm_pad2.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.dm_pad2.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

