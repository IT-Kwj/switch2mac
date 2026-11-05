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
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2532 = false;
    bool _612 = false;
    bool _464 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_56.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_118);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_134);
        out.gl_Position.z = _2832;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_61.w;
    float _140 = float(_118);
    float _142 = -_138;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    bool _156 = _144 >= _140;
    bool _158 = !_154;
    bool _160 = _156 || _158;
    if (_160)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _126;
    if (_160)
    {
        out.m_59.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _136 = as_type<int>(_164);
    }
    int _166 = _136;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2895 = as_type<float>(_166);
        out.gl_Position.z = _2895;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = 1.0 / _140;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _144 * _168;
    bool _174 = !_170;
    float _192;
    if (!_174)
    {
        float _176 = in.m_63.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _172;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _196 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _196 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = 1.0 / _216;
    float _228 = 1.0 / _220;
    bool _230 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_196);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _224;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _248 = _196 + _246;
    float _250 = _248 * _226;
    bool _252 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _254 = isnan(_196);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _212;
    float _266 = _200 * _228;
    bool _268 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_196);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_262;
    float _282 = _280 + 1.0;
    bool _284 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_196);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = _240 * _282;
    float _298 = _204 * _244;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _304;
    float _308 = -_240;
    float _310 = _308 + 1.0;
    float _312 = fma(_302, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = fma(_306, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = _208 * _264;
    bool _318 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = isnan(_196);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = fma(_332, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _340 = -_328;
    float _342 = _340 + 1.0;
    float _344 = _328 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = _278 * _342;
    float _356 = -_278;
    float _358 = _356 + 1.0;
    float _360 = fma(_336, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_348, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_352, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = _294 * _358;
    float _368 = -_294;
    float _370 = _368 + 1.0;
    float _372 = _312 * _366;
    float _374 = _314 * _366;
    float _376 = _338 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _392;
    float _396 = fma(_380, _316, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _398 = fma(_360, _354, _382);
    float _400 = fma(_362, _354, _384);
    float _402 = fma(_364, _354, _386);
    float _404 = fma(_390, _316, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _406 = fma(_394, _316, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _420 = fma(_396, _344, _398);
    float _422 = fma(_410, _250, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _424 = fma(_414, _250, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _426 = fma(_418, _250, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _428 = fma(_404, _344, _400);
    float _430 = fma(_406, _344, _402);
    float _432 = fma(_422, _296, _420);
    float _434 = fma(_424, _296, _428);
    float _436 = fma(_426, _296, _430);
    float _438 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].x, _432);
    float _440 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].y, _434);
    float _442 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].z, _436);
    bool _444 = !_242;
    float _462;
    if (!_444)
    {
        float _446 = in.m_63.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _172;
    }
    _464 = false;
    float _466 = _462;
    float _468 = in.m_65.x;
    float _470 = in.m_65.y;
    float _472 = in.m_65.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _466 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_466);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _498 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _500 = isnan(_466);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    bool _514 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = isnan(_466);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = 1.0 / _480;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _466 + _532;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _538 = 1.0 / _496;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = _512 * _526;
    float _550 = -_492;
    float _552 = _550 + 1.0;
    float _554 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = fma(_548, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _508 * _552;
    float _562 = _442 * _472;
    float _564 = _440 * _470;
    float _566 = _530 * _538;
    float _568 = _558 * _560;
    float _570 = -_524;
    float _572 = _570 + 1.0;
    float _574 = -_508;
    float _576 = _574 + 1.0;
    float _578 = fma(_566, _534, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = _438 * _468;
    float _582 = _492 * _572;
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _568);
    float _586 = fma(_578, _582, _584);
    float _588 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[117].x, _586);
    float _590 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _592 = !_536;
    float _610;
    if (!_592)
    {
        float _594 = in.m_63.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        _610 = _172;
    }
    _612 = false;
    float _614 = _610;
    float _616 = in.m_56.x;
    float _618 = in.m_56.y;
    float _620 = in.m_56.z;
    float _622 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _624 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].x, _622);
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _630 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _626);
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _628);
    float _634 = _630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _636 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _638 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _640 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _642 = floor(_638);
    float _644 = floor(_640);
    float _646 = -_642;
    float _648 = _638 + _646;
    float _650 = -_644;
    float _652 = _640 + _650;
    float2 _3705 = float2(_648, _652);
    float _654 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3705, float2(0.0), isnan(_3705)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3705, float2(0.0), isnan(_3705)), level(0.0)).x;
    float _656 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _658 = in.m_67.x;
    float _660 = in.m_67.y;
    float _662 = in.m_67.z;
    float _664 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _666 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].x, _656);
    float _668 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _670 = in.m_69.y;
    float _672 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _666);
    float _674 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = _674 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _678 = _674 + _668;
    float _680 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[11].x, _676);
    float _682 = _678 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _686 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[11].z, _680);
    float _688 = _674 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _690 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[126].x, _682);
    float _692 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[127].x, _684);
    float _694 = _686 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _696 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[10].x, _688);
    float _698 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[126].z, _690);
    float _700 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[127].z, _692);
    float _702 = 1.0 / _694;
    float _704 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[10].z, _696);
    float _706 = _698 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _708 = _700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _710 = -_670;
    float _712 = _710 + 1.0;
    float _714 = _704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _716 = trunc(_706);
    int _718 = int(_716);
    float _720 = _714 + _694;
    float _722 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _724 = _720 * _702;
    float _726 = _724 * 0.5;
    float _728 = trunc(_708);
    int _730 = int(_728);
    float _732 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _722);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _734);
    int _738 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _740 = _718 + _738;
    int _742 = _740 + 1;
    float _744 = 1.0 / _736;
    float _746 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _732);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    bool _754 = _742 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _756 = _750 * _664;
    int _758 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _760 = _730 + _758;
    int _762 = _760 + 1;
    int _764 = _742 | _762;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _768 = _744 * _766;
    float _770 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _772 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _774 = _764 < 0;
    bool _776 = _774 || _754;
    float _778 = rsqrt(_746);
    bool _780 = _768 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _782 = _748 * _770;
    bool _784 = _768 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _786 = _752 * _772;
    bool _788 = !_780;
    int _790 = _788 ? 0 : 1;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _798 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    int _802 = 2;
    int _804 = _742;
    float _806 = _708;
    float _808 = _670;
    if (!_780)
    {
        _802 = 1;
    }
    int _810 = _802;
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _796);
    int _814 = _810;
    if (!_784)
    {
        _814 = _790;
    }
    int _816 = _814;
    float _818 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _820 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    bool _822 = _762 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _824 = _822 || _776;
    float _826 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].x, _798);
    int _828 = _816 << 6;
    float _830 = _818 * _818;
    float _832 = _820 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _834 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    int _836 = _828 + 96;
    uint _839 = uint(int(uint(_836) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.vp_c15)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[int(_849)][_851];
    float _855 = -_830;
    float _857 = fma(_855, _830, 1.0);
    float _859 = _812 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _861 = _636 + _832;
    bool _863 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _865 = isnan(0.5);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _871 = _867 || _869;
    float _873 = _712 * _857;
    float _875 = _634 + _859;
    float _877 = as_type<float>(_816);
    if (!_824)
    {
        int _879 = _762 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _881 = _879 + _742;
        _804 = _881;
    }
    int _883 = _804;
    int _885 = _828 + 104;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.vp_c15)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.vp_c15)._m0[int(_897)][_899];
    float _903 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _905 = _861 + _903;
    float _907 = _873 * 0.800000011920928955078125;
    float _909 = _172 + 0.20000000298023223876953125;
    float _911 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _913 = _875 + _911;
    float _915 = 0.0;
    int _917 = as_type<int>(_905);
    int _919 = as_type<int>(_913);
    if (!_824)
    {
        float _921 = floor(_706);
        _915 = _921;
    }
    float _923 = _915;
    float _925 = _905 * _907;
    if (!_824)
    {
        int _927 = _883 << 2;
        _917 = _927;
    }
    int _929 = _917;
    float _931 = _913 * _907;
    int _933 = _929;
    if (!_824)
    {
        uint _935 = uint(int(uint(_883) >> uint(2)));
        _919 = int(_935);
    }
    int _937 = _919;
    int _939 = _828 + 48;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    uint _943 = uint(int(uint(int(_941)) >> uint(2)));
    int _945 = int(_941) & 3;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[int(_943)][_945];
    int _949 = int(_941) + 1;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    int _953 = _949 & 3;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[int(_951)][_953];
    if (!_824)
    {
        int _957 = 12 & _929;
        _933 = _957;
    }
    int _959 = _933;
    float _961 = fma(_925, _909, _861);
    float _963 = fma(_931, _909, _875);
    float _965 = 0.0;
    float _967 = _961;
    int _969 = as_type<int>(_963);
    if (!_824)
    {
        float _971 = floor(_708);
        _965 = _971;
    }
    float _973 = _965;
    float _975 = 0.0;
    float _977 = _973;
    if (!_824)
    {
        int _979 = _937 << 4;
        int _981 = _979 + _959;
        _975 = as_type<float>(_981);
    }
    float _983 = _975;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _987 = _961 + _985;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _991 = _963 + _989;
    int _993 = _828 + 64;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    float _1011 = _987 * _987;
    float _1013 = fma(_991, _991, _1011);
    int _1015 = _828 + 56;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.vp_c15)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    float _1033 = sqrt(_1013);
    int _1035 = _828 + 72;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    uint _1039 = uint(int(uint(int(_1037)) >> uint(2)));
    int _1041 = int(_1037) & 3;
    float _1043 = (*spvDescriptorSet0.vp_c15)._m0[int(_1039)][_1041];
    int _1045 = int(_1037) + 1;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    int _1049 = _1045 & 3;
    float _1051 = (*spvDescriptorSet0.vp_c15)._m0[int(_1047)][_1049];
    float _1053 = _678 * _853;
    int _1055 = _828 + 80;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
    int _1061 = int(_1057) & 3;
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[int(_1059)][_1061];
    int _1065 = int(_1057) + 1;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    int _1069 = _1065 & 3;
    float _1071 = (*spvDescriptorSet0.vp_c15)._m0[int(_1067)][_1069];
    float _1073 = fma(_634, _845, _1053);
    bool _1075 = _1033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = fma(_636, _893, _1073);
    int _1079 = _828 + 88;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
    int _1085 = int(_1081) & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    int _1089 = int(_1081) + 1;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    int _1093 = _1089 & 3;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[int(_1091)][_1093];
    float _1097 = _1077 + _901;
    float _1099 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = _674 + _1099;
    float _1103 = _983;
    float _1105 = _1099;
    float _1107 = _901;
    float _1109 = _987;
    if (!_824)
    {
        int _1111 = as_type<int>(_983) + 400;
        uint _1113 = uint(int(uint(_1111) >> uint(2)));
        uint _1115 = uint(int(uint(int(_1113)) >> uint(2)));
        int _1117 = int(_1113) & 3;
        float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
        _1103 = _1119;
    }
    float _1121 = _1103;
    float _1123 = 1.0 / _1097;
    float _1125 = _678 * _955;
    if (!_1075)
    {
        _1105 = _963;
    }
    float _1127 = _1105;
    float _1129 = _1127;
    if (!_1075)
    {
        _1107 = _1101;
    }
    float _1131 = _1107;
    float _1133 = fma(_634, _947, _1125);
    float _1135 = _678 * _1009;
    float _1137 = fma(_634, _1001, _1135);
    bool _1139 = !_1075;
    float _1141 = _1131;
    float _1143 = _1121;
    if (!_1139)
    {
        float _1145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1149 = _1033 + _1147;
        float _1151 = _1101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1153 = rsqrt(_1013);
        float _1155 = _1149 * _1145;
        float _1157 = _1155 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1157 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = _1161 + (-1.0);
        float _1169 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = fma(_1165, _1151, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1173 = fma(_1101, _1161, _1169);
        float _1175 = _1153 * _1171;
        float _1177 = fma(_991, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1179 = fma(_987, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _967 = _1179;
        _1129 = _1177;
        _1141 = _1173;
    }
    float _1181 = _967;
    float _1183 = _1129;
    float _1185 = _1141;
    float _1187 = fma(_636, _1023, _1133);
    float _1189 = fma(_636, _1043, _1137);
    float _1191 = _1185;
    float _1193 = _1183;
    float _1195 = _1189;
    if (_871)
    {
        _1109 = _1181;
    }
    float _1197 = _1109;
    float _1199 = _1197;
    if (!_871)
    {
        float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1203 = _674 + _1201;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1207 = _634 + _1205;
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1211 = -_634;
        float _1213 = _1211 + _1183;
        float _1215 = _1203 * _1203;
        float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1219 = _636 + _1217;
        float _1221 = fma(_1207, _1207, _1215);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1225 = fma(_1219, _1219, _1221);
        float _1227 = sqrt(_1225);
        float _1229 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = precise::min(_1227, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1233 = _1231 * _1223;
        float _1235 = -_674;
        float _1237 = _1235 + _1185;
        float _1239 = _1229 * _1233;
        float _1241 = -_636;
        float _1243 = _1241 + _1181;
        float _1245 = fma(_1237, _1239, _674);
        float _1247 = fma(_1213, _1239, _634);
        float _1249 = fma(_1243, _1239, _636);
        _1191 = _1245;
        _1193 = _1247;
        _1199 = _1249;
    }
    float _1251 = _1191;
    float _1253 = _1193;
    float _1255 = _1199;
    float _1257 = _1187 + _1031;
    float _1259 = _1189 + _1051;
    float _1261 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1265 = _1257 * _1123;
    float _1267 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1263);
    float _1273 = _1259 * _1123;
    bool _1275 = _1265 >= 0.0;
    float _1277 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1269);
    float _1279 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1267);
    float _1281 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1283 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1271);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1287 = _1265 <= 1.0;
    bool _1289 = _1287 && _1275;
    float _1291 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1279);
    float _1293 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1281);
    float _1295 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1299 = _1273 >= 0.0;
    bool _1301 = _1299 && _1289;
    float _1303 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1297);
    bool _1309 = _1273 <= 1.0;
    bool _1311 = _1309 && _1301;
    float _1313 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = _678 * _1071;
    float _1323 = -_1315;
    float _1325 = fma(_1323, _1313, 1.0);
    if (!_824)
    {
        float _1327 = rint(_1121);
        float _1329 = precise::max(_1327, 0.0);
        uint _1331 = uint(_1329);
        uint _1333 = clamp(_1331, 0u, 65535u);
        _1195 = as_type<float>(_1333);
    }
    float _1335 = _1195;
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1339 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = fma(_634, _1063, _1321);
    if (!_824)
    {
        float _1345 = -_973;
        float _1347 = _708 + _1345;
        _977 = _1347;
    }
    float _1349 = _977;
    float _1351 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1355 = log2(_1325);
    float _1357 = _1353;
    float _1359 = _1349;
    if (_1311)
    {
        float _1361 = float(_816);
        _1143 = _1361;
    }
    float _1363 = _1143;
    float _1365 = fma(_636, _1087, _1343);
    float _1367 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1369 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1353);
    if (!_824)
    {
        float _1371 = -_923;
        float _1373 = _706 + _1371;
        _1357 = _1373;
    }
    float _1375 = _1357;
    float _1377 = _1365 + _1095;
    float _1379 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1367);
    float _1381 = 1.0 / _1337;
    float _1383 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1369);
    float _1385 = _1377 * _1123;
    float _1387 = _1363;
    float _1389 = _1383;
    if (_1311)
    {
        float _1391 = rint(_1363);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        uint _1397 = clamp(_1395, 0u, 65535u);
        _1387 = as_type<float>(_1397);
    }
    float _1399 = _1387;
    float _1401 = _1355 * 0.693147182464599609375;
    float _1403 = _923;
    if (!_824)
    {
        float3 _4987 = float3(_1375, _1349, float(as_type<int>(_1335)));
        float3 _4991 = select(_4987, float3(0.0), isnan(_4987));
        float _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4991.xy, uint(rint(_4991.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4991.xy, uint(rint(_4991.z)), level(0.0)).x;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1411 = _1379 * _1381;
    float _1413 = _1383 * _1381;
    float _1415 = fma(_1411, 0.5, 0.5);
    float _1417 = fma(_1413, -0.5, 0.5);
    float _1419 = _1273;
    if (_1311)
    {
        float3 _5021 = float3(_1265, _1273, float(as_type<int>(_1399)));
        float3 _5023 = select(_5021, float3(0.0), isnan(_5021));
        float _1421 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5023.xy, uint(rint(_5023.z)), _1385, level(0.0));
        _1419 = _1421;
    }
    float _1423 = _1419;
    float3 _5033 = float3(_1415, _1417, _1409);
    float _1425 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5033, float3(0.0), isnan(_5033)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5033, float3(0.0), isnan(_5033)), level(0.0)).x;
    float3 _5042 = float3(_1415, _1417, _1409);
    float4 _1428 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5042, float3(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5042, float3(0.0), isnan(_5042)), level(0.0)).xyzw;
    float _1430 = _1428.x;
    float _1432 = _1428.y;
    float _1434 = _1428.z;
    float _1436 = _1428.w;
    bool _1438 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1440 = isnan(0.5);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1446 = _1442 || _1444;
    if (_824)
    {
        _806 = 1.0;
    }
    float _1448 = _806;
    float _1450 = _1448;
    if (_1446)
    {
        _877 = 1.0;
    }
    float _1452 = _877;
    float _1454 = _1452;
    float _1456 = _1407;
    if (!_1446)
    {
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = _1458 * 0.15915493667125701904296875;
        float _1462 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1464 = _1460 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1462 * 0.15915493667125701904296875;
        float _1470 = _1460 * 6.283185482025146484375;
        float _1472 = sin(_1470);
        float _1474 = 1.0 / _1466;
        float _1476 = _1468 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = _1472 * _1474;
        float _1482 = _1468 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1478 * _1480;
        float _1488 = 1.0 / _1486;
        float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1492 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1490;
        float _1494 = 1.0 / _1492;
        float _1496 = _1484 * _1488;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1500 = fma(_768, _1496, _1498);
        float _1502 = _1500 * _1494;
        float _1504 = precise::clamp(_1502, 0.0, 1.0);
        _1359 = _1468;
        _1454 = _1504;
    }
    float _1506 = _1359;
    float _1508 = _1454;
    float _1510 = _1506;
    if (!_824)
    {
        int _1512 = _883 << 4;
        int _1514 = _1512 + 2048;
        uint _1516 = uint(int(uint(_1514) >> uint(2)));
        uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
        int _1520 = int(_1516) & 3;
        float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
        int _1524 = int(_1516) + 1;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        int _1528 = _1524 & 3;
        float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
        int _1532 = _1514 + 8;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
        int _1542 = int(_1534) + 1;
        uint _1544 = uint(int(uint(_1542) >> uint(2)));
        int _1546 = _1542 & 3;
        float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
        float _1550 = _678 * _1530;
        float _1552 = fma(_634, _1522, _1550);
        float _1554 = fma(_636, _1540, _1552);
        float _1556 = _1554 + _1548;
        float _1558 = precise::clamp(_1556, 0.0, 1.0);
        float _1560 = -_1558;
        float _1562 = _1560 + _1407;
        float _1564 = fma(_1562, 500.0, 1.5);
        float _1566 = exp2(_1564);
        float _1568 = 0.0 + _1566;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        _1450 = _1570;
    }
    float _1572 = _1450;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1251 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1580 = _1253 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _1255 + _1582;
    float _1586 = _1576 * _1576;
    float _1588 = fma(_1580, _1580, _1586);
    float _1590 = fma(_1584, _1584, _1588);
    float _1592 = rsqrt(_1590);
    float _1594 = sqrt(_1590);
    float _1596 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1598 = _1580 * _1596;
    float _1600 = _1584 * _1596;
    float _1602 = _1598 * _1598;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 + _1604;
    float _1608 = sqrt(_1606);
    bool _1610 = _1608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = _1608 + _1612;
    float _1616 = _1586;
    float _1618 = _1614;
    float _1620 = _1598;
    float _1622 = _1600;
    float _1624 = _1604;
    bool _1626 = _1610;
    if (_1610)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1628;
    }
    float _1630 = _1616;
    if (_1610)
    {
        float _1632 = rsqrt(_1606);
        _1456 = _1632;
    }
    float _1634 = _1456;
    float _1636 = _1634;
    if (_1610)
    {
        float _1638 = _1614 * _1630;
        _1618 = _1638;
    }
    float _1640 = _1618;
    if (_1610)
    {
        float _1642 = _1640 * 0.15915493667125701904296875;
        _1510 = _1642;
    }
    float _1644 = _1510;
    float _1646 = _636;
    float _1648 = _1644;
    if (_1610)
    {
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1646 = _1652;
    }
    float _1654 = _1646;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1630;
    float _1662 = _1658;
    if (_1610)
    {
        float _1664 = _1644 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1596;
    float _1672 = -_1658;
    float _1674 = fma(_1576, _1670, _1672);
    float _1676 = _1674;
    if (_1610)
    {
        float _1678 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1678;
    }
    float _1680 = _1662;
    float _1682 = _1654;
    float _1684 = _1680;
    if (_1610)
    {
        float _1686 = fma(_1654, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1682 = _1686;
    }
    float _1688 = _1682;
    float _1690 = _1688;
    if (_1610)
    {
        float _1692 = _1668 + (-1.0);
        _1684 = _1692;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (_1610)
    {
        float _1698 = _1634 * _1688;
        _1690 = _1698;
    }
    float _1700 = _1690;
    if (_1610)
    {
        float _1702 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1702;
    }
    float _1704 = _1636;
    if (_1610)
    {
        float _1706 = _1598 * _1700;
        _1620 = _1706;
    }
    float _1708 = _1620;
    if (!_1610)
    {
        _1696 = _1602;
    }
    float _1710 = _1696;
    float _1712 = _1710;
    if (_1610)
    {
        float _1714 = _1600 * _1700;
        _1622 = _1714;
    }
    float _1716 = _1622;
    if (_1610)
    {
        float _1718 = fma(_1674, _1668, _1704);
        _1676 = _1718;
    }
    float _1720 = _1676;
    if (_1610)
    {
        float _1722 = _1708 * _1708;
        _1712 = _1722;
    }
    float _1724 = _1712;
    if (_1610)
    {
        float _1726 = _1716 * _1716;
        _1624 = _1726;
    }
    float _1728 = _1624;
    float _1730 = fma(_1720, _1720, _1724);
    float _1732 = _1730 + _1728;
    float _1734 = rsqrt(_1732);
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1738 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1736);
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    float _1742 = -_1740;
    float _1744 = _1742 + 1.0;
    float _1746 = abs(_1744);
    float _1748 = log2(_1746);
    float _1750 = _1734 * _1708;
    float _1752 = _1734 * _1720;
    float _1754 = _1734 * _1716;
    float _1756 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = -_1756;
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = -_1754;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1766 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1764, -0.5, 0.5);
    float _1770 = exp2(_1766);
    float _1772 = fma(_1764, 0.5, 0.5);
    float _1774 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1776 = sqrt(_1768);
    float _1778 = fma(_1772, _1774, -0.212114393711090087890625);
    float _1780 = _1752 + 1.0;
    float _1782 = fma(_1772, _1778, 1.570728778839111328125);
    float _1784 = -_1752;
    float _1786 = fma(_1770, _1780, _1784);
    float _1788 = _1776 * 0.636619746685028076171875;
    float _1790 = -_1782;
    float _1792 = fma(_1788, _1790, 1.0);
    float _1794 = fma(_1786, 0.5, 0.5);
    float2 _5584 = float2(_1792, _1794);
    float3 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5584, float2(0.0), isnan(_5584)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5584, float2(0.0), isnan(_5584)), level(0.0)).xyz;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = in.m_71.x;
    float _1808 = in.m_71.y;
    float _1810 = in.m_71.z;
    float _1812 = in.m_71.w;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1816 = in.m_69.x;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = in.m_63.x;
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1832 = _1830 != 0;
    float _1834 = in.m_63.w;
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1838 = _1836 != 0;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1840;
    bool _1844 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1846 = isnan(_614);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1852 = _1848 || _1850;
    float _1854 = float(_1852);
    float _1856 = in.m_63.y;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1860 = _1858 != 0;
    float _1862 = 1.0 / _1820;
    float _1864 = in.m_63.z;
    float _1866 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _546;
    out.m_73.y = _554;
    out.m_73.z = _556;
    out.m_73.w = _590;
    float _1868 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1874 = as_type<int>(_1814);
    float _1876 = _1816;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1880 = _1872;
    if (_1824)
    {
        float _1882 = -_1816;
        float _1884 = _1882 + 1.0;
        _969 = as_type<int>(_1884);
    }
    int _1886 = _969;
    float _1888 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1868);
    if (!_1824)
    {
        _1648 = _1816;
    }
    float _1890 = _1648;
    float _1892 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1894 = _1890;
    if (_1824)
    {
        bool _1896 = _1826 > 0.5;
        _1626 = _1896;
    }
    bool _1898 = _1626;
    float _1900 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1902 = -_654;
    float _1904 = _1902 + 1.0;
    out.m_75.x = _1253;
    out.m_75.y = _1251;
    out.m_75.z = _1255;
    bool _1906 = _1834 > 0.5;
    float _1908 = _1842 * _1862;
    float _1910 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1916 = _1864;
    if (_1824)
    {
        float _1918 = _1898 ? as_type<float>(_1886) : _1816;
        _1894 = _1918;
    }
    float _1920 = _1894;
    float _1922 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    float _1924 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    int _1926 = _1906 ? as_type<int>(_712) : as_type<int>(_670);
    float _1928 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1888);
    float _1930 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1922);
    bool _1932 = _1856 > 0.5;
    float _1934 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1924);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1942 = _614 + _1940;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1946 = _1944 != 0;
    float _1948 = exp2(_1900);
    int _1950 = _1932 ? as_type<int>(_712) : as_type<int>(_670);
    out.m_77.x = _1930;
    out.m_77.y = _1934;
    out.m_77.z = _1928;
    float _1952 = _1838 ? as_type<float>(_1926) : _670;
    float _1954 = fma(_1908, _1942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1956 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1958 = isnan(_614);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = _1860 ? as_type<float>(_1950) : _670;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1972 = _1864 > 0.5;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1976 = _1974 != 0;
    float _1978 = -_1854;
    float _1980 = _1978 + 1.0;
    float _1982 = _1954;
    float _1984 = _1942;
    if (_1938)
    {
        float _1986 = _1972 ? _712 : _670;
        _808 = _1986;
    }
    float _1988 = _808;
    float _1990 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1992 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1970);
    float _1994 = _1966 * _1980;
    float _1996 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1998 = -_1966;
    float _2000 = _1998 + 1.0;
    int _2002 = as_type<int>(_1914);
    float _2004 = _1988;
    if (_1946)
    {
        float _2006 = -_1816;
        float _2008 = _2006 + 1.0;
        _2002 = as_type<int>(_2008);
    }
    int _2010 = _2002;
    float _2012 = _1954 * _1994;
    float _2014 = fma(_1952, _1990, -0.5);
    float _2016 = fma(_1996, _1988, -0.5);
    float _2018 = as_type<float>(_2010);
    if (!_1946)
    {
        _1982 = _1816;
    }
    float _2020 = _1982;
    float _2022 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2012);
    float _2024 = _2020;
    if (_1946)
    {
        float _2026 = _1972 ? as_type<float>(_2010) : _1816;
        _2024 = _2026;
    }
    float _2028 = _2024;
    float _2030 = in.m_79.x;
    float _2032 = in.m_79.y;
    float _2034 = in.m_79.z;
    bool _2036 = _660 != 0.0;
    bool _2038 = isnan(_660);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan(0.0);
    bool _2044 = _2040 || _2042;
    if (_1976)
    {
        float _2046 = -_1816;
        float _2048 = _2046 + 1.0;
        _1874 = as_type<int>(_2048);
    }
    int _2050 = _1874;
    if (!_1832)
    {
        _1984 = _1856;
    }
    float _2052 = _1984;
    float _2054 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2022);
    bool _2056 = _658 == 0.0;
    bool _2058 = !_2044;
    bool _2060 = _2056 && _2058;
    float _2062 = fma(_1892, _2028, -0.5);
    float _2064 = _2052;
    if (_1832)
    {
        _2064 = _1826;
    }
    float _2066 = _2064;
    float _2068 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2070 = _662 == 0.0;
    bool _2072 = _2070 && _2060;
    if (_1976)
    {
        float _2074 = _1932 ? as_type<float>(_2050) : _1816;
        _1876 = _2074;
    }
    float _2076 = _1876;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1870);
    if (_1832)
    {
        _1878 = _1826;
    }
    float _2080 = _1878;
    float _2082 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2084 = _2080;
    if (!_1832)
    {
        _2084 = _1864;
    }
    float _2086 = _2084;
    if (!_1832)
    {
        _2018 = _1864;
    }
    float _2088 = _2018;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2092 = _2088;
    if (_1832)
    {
        _1916 = _1856;
    }
    float _2094 = _1916;
    if (_1832)
    {
        _2092 = _1856;
    }
    float _2096 = _2092;
    float _2098 = -_2090;
    float _2100 = fma(_2082, 2.0, _2098);
    float _2102 = _2096;
    if (_1832)
    {
        _2004 = _1856;
    }
    float _2104 = _2004;
    float _2106 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1872);
    float _2108 = _2104;
    if (!_1832)
    {
        _2108 = _1826;
    }
    float _2110 = _2108;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2116 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2118 = _2112;
    float _2120 = _2030;
    if (_2072)
    {
        _1880 = _2030;
    }
    float _2122 = _1880;
    float _2124 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2112);
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2128 = _2122;
    if (_2072)
    {
        _2102 = _2032;
    }
    float _2130 = _2102;
    float _2132 = _2130;
    if (!_2072)
    {
        float _2134 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2132 = _2134;
    }
    float _2136 = _2132;
    if (_2072)
    {
        _2118 = _2122;
    }
    float _2138 = _2118;
    float _2140 = -_2126;
    float _2142 = fma(_2116, 2.0, _2140);
    float _2144 = _2138;
    if (!_2072)
    {
        _2128 = _2030;
    }
    float _2146 = _2128;
    float _2148 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2150 = _1808 * _2034;
    if (_2072)
    {
        _2120 = _2034;
    }
    float _2152 = _2120;
    float _2154 = _2152;
    if (!_2072)
    {
        float _2156 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2144 = _2156;
    }
    float _2158 = _2144;
    float _2160 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2106);
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2164 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2166 = -_144;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2142);
    if (!_2072)
    {
        float _2170 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2034);
        _2154 = _2170;
    }
    float _2172 = _2154;
    float _2174 = _1810 * _2146;
    float _2176 = fma(_2148, -2.0, _2162);
    float _2178 = _1806 * _2032;
    float _2180 = -_2150;
    float _2182 = fma(_1810, _2032, _2180);
    float _2184 = fma(_2164, _2076, -0.5);
    float _2186 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2078);
    float _2188 = -_144;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2100);
    float _2192 = fma(_2160, _2184, _2168);
    float _2194 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2196 = fma(_2186, _2062, _2190);
    float _2198 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2124);
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2202 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2176);
    float _2204 = -_2174;
    float _2206 = fma(_1806, _2034, _2204);
    float _2208 = -_2178;
    float _2210 = fma(_1808, _2146, _2208);
    float _2212 = fma(_2194, -2.0, _2200);
    float _2214 = -_2202;
    float _2216 = fma(_2198, _2014, _2214);
    float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2220 = _2054 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2222 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1992);
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2226 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2212);
    float _2228 = abs(_768);
    float _2230 = log2(_2228);
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2238 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2240 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2242 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = _2206 * _1812;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2248 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _2236;
    out.m_81.y = _2240;
    out.m_81.z = _2242;
    out.m_81.w = _2220;
    float _2252 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1866);
    float _2256 = _2182 * _1812;
    float _2258 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2260 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2262 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2254);
    float _2264 = _2210 * _1812;
    bool _2266 = _768 <= 8000.0;
    bool _2268 = isnan(_768);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan(8000.0);
    bool _2274 = _2270 || _2272;
    float _2276 = float(_2274);
    float _2278 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    float _2280 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2262);
    float _2282 = exp2(_2260);
    float _2284 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2250);
    float _2286 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2288 = _2068 * _2218;
    float _2290 = _2238 * _2246;
    float _2292 = _2196 + 0.5;
    float _2294 = _2216 + 0.5;
    float _2296 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1379;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _2280;
    out.gl_Position.w = _1337;
    float _2300 = -_2226;
    float _2302 = fma(_2222, _2016, _2300);
    float _2304 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2306 = _2192 + 0.5;
    out.m_83.x = _2290;
    out.m_83.y = _2288;
    out.m_83.z = _2292;
    out.m_83.w = _2294;
    float _2308 = _2302 + 0.5;
    float _2310 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2304);
    out.m_85.x = _2306;
    out.m_85.y = _2308;
    float _2312 = _2310;
    if (!_1311)
    {
        _1389 = 1.0;
    }
    float _2314 = _1389;
    float _2316 = _2314;
    if (_1311)
    {
        bool _2318 = _1423 >= _1385;
        bool _2320 = isnan(_1423);
        bool _2322 = _2318 || _2320;
        bool _2324 = isnan(_1385);
        bool _2326 = _2322 || _2324;
        float _2328 = float(_2326);
        _2316 = _2328;
    }
    float _2330 = _2316;
    float _2332 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2258);
    float _2334 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2298);
    float _2336 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2338 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2332);
    float _2340 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2342 = _2280 + _1337;
    float _2344 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2346 = precise::clamp(_2344, 0.0, 1.0);
    float _2348 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2278);
    float _2350 = _2342 * 0.5;
    float _2352 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2284);
    bool _2354 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2356 = isnan(_1594);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2362 = _2358 || _2360;
    float _2364 = _2330 * _1572;
    out.m_87.z = _2350;
    out.m_87.w = _1337;
    float _2366 = fma(_2346, -2.0, 3.0);
    float _2368 = _2346 * _2346;
    out.m_89.x = _2348;
    out.m_89.y = _2352;
    out.m_89.z = _2336;
    float _2370 = _2368 * _2366;
    out.m_91.x = _2310;
    out.m_91.y = _2338;
    out.m_91.z = _2340;
    float _2372 = -_2370;
    float _2374 = _2372 + 1.0;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2378 = _2276 * _2376;
    float _2380 = _2338;
    if (!_2362)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2382 = _2380;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2386 = -_1948;
    float _2388 = _2386 + 1.0;
    float _2390 = _2382;
    float _2392 = _2382;
    if (!_2362)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2394 = _2312;
    float _2396 = _1904 * _2384;
    float _2398 = precise::clamp(_2396, 0.0, 1.0);
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2402 = -_2398;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2406 = _2400 * _1425;
    float _2408 = -_2400;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2364;
    float _2414 = fma(_2412, _2404, 1.0);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = _1436 * _2406;
    float _2420 = _1436 * _2410;
    float _2422 = _2410;
    float _2424 = _2416;
    float _2426 = _2418;
    float _2428 = _2394;
    float _2430 = _2394;
    if (!_2362)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2432 = _2422;
    float _2434 = _2416 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2436 = _2434;
    float _2438 = _2432;
    float _2440 = _2432;
    if (!_2362)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2442 = _2424;
    out.m_93.x = _2434;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2362)
    {
        _2436 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2448 = _2436;
    float _2450 = _1804 * _2406;
    float _2452 = fma(_1800, _2418, _1430);
    float _2454 = fma(_1802, _2418, _1432);
    float _2456 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2458 = fma(_1436, _2450, _1434);
    float _2460 = _2448;
    float _2462 = _2448;
    if (!_2362)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2426;
    out.m_95.x = _2452;
    out.m_95.y = _2454;
    out.m_95.z = _2458;
    out.m_95.w = _2420;
    bool _2466 = !_2362;
    float _2468 = _2464;
    float _2470 = _2464;
    if (!_2466)
    {
        bool _2472 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2474 = isnan(_1594);
        bool _2476 = _2472 || _2474;
        bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2480 = _2476 || _2478;
        if (!_2480)
        {
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = _1594 + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2486;
            float _2490 = 1.0 / _2488;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2512 = _2484 * _2490;
            float _2514 = precise::clamp(_2512, 0.0, 1.0);
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2520 = fma(_2514, _2494, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2522 = fma(_2514, _2518, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2524 = fma(_2514, _2498, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2526 = fma(_2514, _2502, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2528 = fma(_2514, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2530 = fma(_2514, _2510, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2430 = _2522;
            _2446 = _2528;
            _2392 = _2520;
            _2440 = _2526;
            _2470 = _2524;
            _2462 = _2530;
            _2532 = true;
        }
        else
        {
            bool _2534 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2536 = isnan(_1594);
            bool _2538 = _2534 || _2536;
            bool _2540 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2542 = _2538 || _2540;
            if (!_2542)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2544 = _2390;
            _2392 = _2544;
            if (!_2542)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2546 = _2428;
            _2430 = _2546;
            if (!_2542)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2548 = _2468;
            _2470 = _2548;
            if (!_2542)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2550 = _2438;
            _2440 = _2550;
            if (!_2542)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2552 = _2444;
            _2446 = _2552;
            if (!_2542)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2554 = _2460;
            bool _2556 = !_2542;
            _2462 = _2554;
            if (!_2556)
            {
                bool _2558 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2560 = isnan(_1594);
                bool _2562 = _2558 || _2560;
                bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2566 = _2562 || _2564;
                if (!_2566)
                {
                    float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2570 = _1594 + _2568;
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2574 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2572;
                    float _2576 = 1.0 / _2574;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2598 = _2570 * _2576;
                    float _2600 = precise::clamp(_2598, 0.0, 1.0);
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2606 = fma(_2600, _2580, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2608 = fma(_2600, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2610 = fma(_2600, _2584, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2612 = fma(_2600, _2588, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2614 = fma(_2600, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2616 = fma(_2600, _2596, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2430 = _2608;
                    _2446 = _2614;
                    _2392 = _2606;
                    _2440 = _2612;
                    _2470 = _2610;
                    _2462 = _2616;
                    _2532 = true;
                }
                else
                {
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2532 = false;
    float _2618 = _2430;
    float _2620 = _2446;
    float _2622 = _2392;
    float _2624 = _2440;
    float _2626 = _2470;
    float _2628 = _2462;
    float _2630 = fma(_2352, -0.5, 0.5);
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = -_2618;
    float _2636 = _2634 + _2620;
    float _2638 = _2456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2640 = -_2622;
    float _2642 = _2640 + _2624;
    float _2644 = fma(_2632, _2636, _2618);
    out.m_97.x = 0.0;
    float _2646 = -_2626;
    float _2648 = _2646 + _2628;
    float _2650 = fma(_2632, _2642, _2622);
    float _2652 = _2644 * 0.586610972881317138671875;
    out.m_59.x = _2638;
    bool _2654 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2656 = fma(_2632, _2648, _2626);
    float _2658 = fma(_2650, 0.298911988735198974609375, _2652);
    bool _2660 = _1508 > 0.0;
    bool _2662 = isnan(_1508);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan(0.0);
    bool _2668 = _2664 || _2666;
    float _2670 = fma(_2656, 0.114477999508380889892578125, _2658);
    float _2672 = -_2670;
    float _2674 = _2650 + _2672;
    float _2676 = -_2670;
    float _2678 = _2644 + _2676;
    float _2680 = -_2670;
    float _2682 = _2656 + _2680;
    float _2684 = fma(_2674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    float _2688 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    bool _2690 = !_2654;
    if (!_2690)
    {
        float _2692 = -_1251;
        float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2696 = -_1253;
        float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2700 = -_1255;
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2704 = _2694 * _2694;
        float _2706 = fma(_2698, _2698, _2704);
        float _2708 = fma(_2702, _2702, _2706);
        float _2710 = sqrt(_2708);
        float _2712 = rsqrt(_2708);
        float _2714 = -_2710;
        float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = _2698 * _2712;
        float _2724 = _2694 * _2712;
        float _2726 = abs(_2720);
        float _2728 = log2(_2726);
        float _2730 = _2702 * _2712;
        float _2732 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2734 = _2352 * _2724;
        float _2736 = -_2724;
        float _2738 = -_2732;
        float _2740 = fma(_2736, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2738);
        float _2742 = fma(_2348, _2722, _2734);
        float _2744 = -_2730;
        float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2740);
        float _2748 = fma(_2336, _2730, _2742);
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2754 = _2746 + _2752;
        float _2756 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2760 = precise::clamp(_2758, 0.0, 1.0);
        float _2762 = exp2(_2756);
        float _2764 = _2762 * _2760;
        float _2766 = _2750 * _2764;
        float _2768 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2772 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2768;
        out.m_97.y = _2770;
        out.m_97.z = _2772;
    }
    out.m_99.x = _2684;
    out.m_99.y = _2686;
    out.m_99.z = _2688;
    if (_2668)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2774 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2774;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2532 = false;
    bool _612 = false;
    bool _464 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_56.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_118);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_134);
        out.gl_Position.z = _2832;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_61.w;
    float _140 = float(_118);
    float _142 = -_138;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    bool _156 = _144 >= _140;
    bool _158 = !_154;
    bool _160 = _156 || _158;
    if (_160)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _126;
    if (_160)
    {
        out.m_59.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _136 = as_type<int>(_164);
    }
    int _166 = _136;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2895 = as_type<float>(_166);
        out.gl_Position.z = _2895;
    }
    if (_160)
    {
        return out;
    }
    float _168 = 1.0 / _140;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _144 * _168;
    bool _174 = !_170;
    float _192;
    if (!_174)
    {
        float _176 = in.m_63.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _172;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _196 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _196 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = 1.0 / _216;
    float _228 = 1.0 / _220;
    bool _230 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_196);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _224;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _248 = _196 + _246;
    float _250 = _248 * _226;
    bool _252 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _254 = isnan(_196);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _212;
    float _266 = _200 * _228;
    bool _268 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_196);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_262;
    float _282 = _280 + 1.0;
    bool _284 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_196);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = _240 * _282;
    float _298 = _204 * _244;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _304;
    float _308 = -_240;
    float _310 = _308 + 1.0;
    float _312 = fma(_302, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = fma(_306, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = _208 * _264;
    bool _318 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = isnan(_196);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = fma(_332, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _340 = -_328;
    float _342 = _340 + 1.0;
    float _344 = _328 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = _278 * _342;
    float _356 = -_278;
    float _358 = _356 + 1.0;
    float _360 = fma(_336, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_348, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_352, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = _294 * _358;
    float _368 = -_294;
    float _370 = _368 + 1.0;
    float _372 = _312 * _366;
    float _374 = _314 * _366;
    float _376 = _338 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _392;
    float _396 = fma(_380, _316, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _398 = fma(_360, _354, _382);
    float _400 = fma(_362, _354, _384);
    float _402 = fma(_364, _354, _386);
    float _404 = fma(_390, _316, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _406 = fma(_394, _316, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _420 = fma(_396, _344, _398);
    float _422 = fma(_410, _250, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _424 = fma(_414, _250, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _426 = fma(_418, _250, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _428 = fma(_404, _344, _400);
    float _430 = fma(_406, _344, _402);
    float _432 = fma(_422, _296, _420);
    float _434 = fma(_424, _296, _428);
    float _436 = fma(_426, _296, _430);
    float _438 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].x, _432);
    float _440 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].y, _434);
    float _442 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].z, _436);
    bool _444 = !_242;
    float _462;
    if (!_444)
    {
        float _446 = in.m_63.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _172;
    }
    _464 = false;
    float _466 = _462;
    float _468 = in.m_65.x;
    float _470 = in.m_65.y;
    float _472 = in.m_65.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _466 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_466);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _498 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _500 = isnan(_466);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    bool _514 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = isnan(_466);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = 1.0 / _480;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _466 + _532;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _538 = 1.0 / _496;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = _512 * _526;
    float _550 = -_492;
    float _552 = _550 + 1.0;
    float _554 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = fma(_548, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _508 * _552;
    float _562 = _442 * _472;
    float _564 = _440 * _470;
    float _566 = _530 * _538;
    float _568 = _558 * _560;
    float _570 = -_524;
    float _572 = _570 + 1.0;
    float _574 = -_508;
    float _576 = _574 + 1.0;
    float _578 = fma(_566, _534, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = _438 * _468;
    float _582 = _492 * _572;
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _568);
    float _586 = fma(_578, _582, _584);
    float _588 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[117].x, _586);
    float _590 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _592 = !_536;
    float _610;
    if (!_592)
    {
        float _594 = in.m_63.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        _610 = _172;
    }
    _612 = false;
    float _614 = _610;
    float _616 = in.m_56.x;
    float _618 = in.m_56.y;
    float _620 = in.m_56.z;
    float _622 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _624 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].x, _622);
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _630 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _626);
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _628);
    float _634 = _630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _636 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _638 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _640 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _642 = floor(_638);
    float _644 = floor(_640);
    float _646 = -_642;
    float _648 = _638 + _646;
    float _650 = -_644;
    float _652 = _640 + _650;
    float2 _3705 = float2(_648, _652);
    float _654 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3705, float2(0.0), isnan(_3705)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3705, float2(0.0), isnan(_3705)), level(0.0)).x;
    float _656 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _658 = in.m_67.x;
    float _660 = in.m_67.y;
    float _662 = in.m_67.z;
    float _664 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _666 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].x, _656);
    float _668 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _670 = in.m_69.y;
    float _672 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _666);
    float _674 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = _674 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _678 = _674 + _668;
    float _680 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[11].x, _676);
    float _682 = _678 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _686 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[11].z, _680);
    float _688 = _674 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _690 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[126].x, _682);
    float _692 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[127].x, _684);
    float _694 = _686 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _696 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[10].x, _688);
    float _698 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[126].z, _690);
    float _700 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[127].z, _692);
    float _702 = 1.0 / _694;
    float _704 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[10].z, _696);
    float _706 = _698 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _708 = _700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _710 = -_670;
    float _712 = _710 + 1.0;
    float _714 = _704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _716 = trunc(_706);
    int _718 = int(_716);
    float _720 = _714 + _694;
    float _722 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _724 = _720 * _702;
    float _726 = _724 * 0.5;
    float _728 = trunc(_708);
    int _730 = int(_728);
    float _732 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _722);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _734);
    int _738 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _740 = _718 + _738;
    int _742 = _740 + 1;
    float _744 = 1.0 / _736;
    float _746 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _732);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    bool _754 = _742 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _756 = _750 * _664;
    int _758 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _760 = _730 + _758;
    int _762 = _760 + 1;
    int _764 = _742 | _762;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _768 = _744 * _766;
    float _770 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _772 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _774 = _764 < 0;
    bool _776 = _774 || _754;
    float _778 = rsqrt(_746);
    bool _780 = _768 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _782 = _748 * _770;
    bool _784 = _768 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _786 = _752 * _772;
    bool _788 = !_780;
    int _790 = _788 ? 0 : 1;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _798 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    int _802 = 2;
    int _804 = _742;
    float _806 = _708;
    float _808 = _670;
    if (!_780)
    {
        _802 = 1;
    }
    int _810 = _802;
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _796);
    int _814 = _810;
    if (!_784)
    {
        _814 = _790;
    }
    int _816 = _814;
    float _818 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _820 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    bool _822 = _762 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _824 = _822 || _776;
    float _826 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].x, _798);
    int _828 = _816 << 6;
    float _830 = _818 * _818;
    float _832 = _820 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _834 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    int _836 = _828 + 96;
    uint _839 = uint(int(uint(_836) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.vp_c15)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[int(_849)][_851];
    float _855 = -_830;
    float _857 = fma(_855, _830, 1.0);
    float _859 = _812 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _861 = _636 + _832;
    bool _863 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _865 = isnan(0.5);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _871 = _867 || _869;
    float _873 = _712 * _857;
    float _875 = _634 + _859;
    float _877 = as_type<float>(_816);
    if (!_824)
    {
        int _879 = _762 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _881 = _879 + _742;
        _804 = _881;
    }
    int _883 = _804;
    int _885 = _828 + 104;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.vp_c15)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.vp_c15)._m0[int(_897)][_899];
    float _903 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _905 = _861 + _903;
    float _907 = _873 * 0.800000011920928955078125;
    float _909 = _172 + 0.20000000298023223876953125;
    float _911 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _913 = _875 + _911;
    float _915 = 0.0;
    int _917 = as_type<int>(_905);
    int _919 = as_type<int>(_913);
    if (!_824)
    {
        float _921 = floor(_706);
        _915 = _921;
    }
    float _923 = _915;
    float _925 = _905 * _907;
    if (!_824)
    {
        int _927 = _883 << 2;
        _917 = _927;
    }
    int _929 = _917;
    float _931 = _913 * _907;
    int _933 = _929;
    if (!_824)
    {
        uint _935 = uint(int(uint(_883) >> uint(2)));
        _919 = int(_935);
    }
    int _937 = _919;
    int _939 = _828 + 48;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    uint _943 = uint(int(uint(int(_941)) >> uint(2)));
    int _945 = int(_941) & 3;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[int(_943)][_945];
    int _949 = int(_941) + 1;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    int _953 = _949 & 3;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[int(_951)][_953];
    if (!_824)
    {
        int _957 = 12 & _929;
        _933 = _957;
    }
    int _959 = _933;
    float _961 = fma(_925, _909, _861);
    float _963 = fma(_931, _909, _875);
    float _965 = 0.0;
    float _967 = _961;
    int _969 = as_type<int>(_963);
    if (!_824)
    {
        float _971 = floor(_708);
        _965 = _971;
    }
    float _973 = _965;
    float _975 = 0.0;
    float _977 = _973;
    if (!_824)
    {
        int _979 = _937 << 4;
        int _981 = _979 + _959;
        _975 = as_type<float>(_981);
    }
    float _983 = _975;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _987 = _961 + _985;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _991 = _963 + _989;
    int _993 = _828 + 64;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    float _1011 = _987 * _987;
    float _1013 = fma(_991, _991, _1011);
    int _1015 = _828 + 56;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.vp_c15)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    float _1033 = sqrt(_1013);
    int _1035 = _828 + 72;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    uint _1039 = uint(int(uint(int(_1037)) >> uint(2)));
    int _1041 = int(_1037) & 3;
    float _1043 = (*spvDescriptorSet0.vp_c15)._m0[int(_1039)][_1041];
    int _1045 = int(_1037) + 1;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    int _1049 = _1045 & 3;
    float _1051 = (*spvDescriptorSet0.vp_c15)._m0[int(_1047)][_1049];
    float _1053 = _678 * _853;
    int _1055 = _828 + 80;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
    int _1061 = int(_1057) & 3;
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[int(_1059)][_1061];
    int _1065 = int(_1057) + 1;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    int _1069 = _1065 & 3;
    float _1071 = (*spvDescriptorSet0.vp_c15)._m0[int(_1067)][_1069];
    float _1073 = fma(_634, _845, _1053);
    bool _1075 = _1033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = fma(_636, _893, _1073);
    int _1079 = _828 + 88;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
    int _1085 = int(_1081) & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    int _1089 = int(_1081) + 1;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    int _1093 = _1089 & 3;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[int(_1091)][_1093];
    float _1097 = _1077 + _901;
    float _1099 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = _674 + _1099;
    float _1103 = _983;
    float _1105 = _1099;
    float _1107 = _901;
    float _1109 = _987;
    if (!_824)
    {
        int _1111 = as_type<int>(_983) + 400;
        uint _1113 = uint(int(uint(_1111) >> uint(2)));
        uint _1115 = uint(int(uint(int(_1113)) >> uint(2)));
        int _1117 = int(_1113) & 3;
        float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
        _1103 = _1119;
    }
    float _1121 = _1103;
    float _1123 = 1.0 / _1097;
    float _1125 = _678 * _955;
    if (!_1075)
    {
        _1105 = _963;
    }
    float _1127 = _1105;
    float _1129 = _1127;
    if (!_1075)
    {
        _1107 = _1101;
    }
    float _1131 = _1107;
    float _1133 = fma(_634, _947, _1125);
    float _1135 = _678 * _1009;
    float _1137 = fma(_634, _1001, _1135);
    bool _1139 = !_1075;
    float _1141 = _1131;
    float _1143 = _1121;
    if (!_1139)
    {
        float _1145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1149 = _1033 + _1147;
        float _1151 = _1101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1153 = rsqrt(_1013);
        float _1155 = _1149 * _1145;
        float _1157 = _1155 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1157 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = _1161 + (-1.0);
        float _1169 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = fma(_1165, _1151, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1173 = fma(_1101, _1161, _1169);
        float _1175 = _1153 * _1171;
        float _1177 = fma(_991, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1179 = fma(_987, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _967 = _1179;
        _1129 = _1177;
        _1141 = _1173;
    }
    float _1181 = _967;
    float _1183 = _1129;
    float _1185 = _1141;
    float _1187 = fma(_636, _1023, _1133);
    float _1189 = fma(_636, _1043, _1137);
    float _1191 = _1185;
    float _1193 = _1183;
    float _1195 = _1189;
    if (_871)
    {
        _1109 = _1181;
    }
    float _1197 = _1109;
    float _1199 = _1197;
    if (!_871)
    {
        float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1203 = _674 + _1201;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1207 = _634 + _1205;
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1211 = -_634;
        float _1213 = _1211 + _1183;
        float _1215 = _1203 * _1203;
        float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1219 = _636 + _1217;
        float _1221 = fma(_1207, _1207, _1215);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1225 = fma(_1219, _1219, _1221);
        float _1227 = sqrt(_1225);
        float _1229 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = precise::min(_1227, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1233 = _1231 * _1223;
        float _1235 = -_674;
        float _1237 = _1235 + _1185;
        float _1239 = _1229 * _1233;
        float _1241 = -_636;
        float _1243 = _1241 + _1181;
        float _1245 = fma(_1237, _1239, _674);
        float _1247 = fma(_1213, _1239, _634);
        float _1249 = fma(_1243, _1239, _636);
        _1191 = _1245;
        _1193 = _1247;
        _1199 = _1249;
    }
    float _1251 = _1191;
    float _1253 = _1193;
    float _1255 = _1199;
    float _1257 = _1187 + _1031;
    float _1259 = _1189 + _1051;
    float _1261 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1265 = _1257 * _1123;
    float _1267 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1263);
    float _1273 = _1259 * _1123;
    bool _1275 = _1265 >= 0.0;
    float _1277 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1269);
    float _1279 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1267);
    float _1281 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1283 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1271);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1287 = _1265 <= 1.0;
    bool _1289 = _1287 && _1275;
    float _1291 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1279);
    float _1293 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1281);
    float _1295 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1299 = _1273 >= 0.0;
    bool _1301 = _1299 && _1289;
    float _1303 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1297);
    bool _1309 = _1273 <= 1.0;
    bool _1311 = _1309 && _1301;
    float _1313 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = _678 * _1071;
    float _1323 = -_1315;
    float _1325 = fma(_1323, _1313, 1.0);
    if (!_824)
    {
        float _1327 = rint(_1121);
        float _1329 = precise::max(_1327, 0.0);
        uint _1331 = uint(_1329);
        uint _1333 = clamp(_1331, 0u, 65535u);
        _1195 = as_type<float>(_1333);
    }
    float _1335 = _1195;
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1339 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = fma(_634, _1063, _1321);
    if (!_824)
    {
        float _1345 = -_973;
        float _1347 = _708 + _1345;
        _977 = _1347;
    }
    float _1349 = _977;
    float _1351 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1355 = log2(_1325);
    float _1357 = _1353;
    float _1359 = _1349;
    if (_1311)
    {
        float _1361 = float(_816);
        _1143 = _1361;
    }
    float _1363 = _1143;
    float _1365 = fma(_636, _1087, _1343);
    float _1367 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1369 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1353);
    if (!_824)
    {
        float _1371 = -_923;
        float _1373 = _706 + _1371;
        _1357 = _1373;
    }
    float _1375 = _1357;
    float _1377 = _1365 + _1095;
    float _1379 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1367);
    float _1381 = 1.0 / _1337;
    float _1383 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1369);
    float _1385 = _1377 * _1123;
    float _1387 = _1363;
    float _1389 = _1383;
    if (_1311)
    {
        float _1391 = rint(_1363);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        uint _1397 = clamp(_1395, 0u, 65535u);
        _1387 = as_type<float>(_1397);
    }
    float _1399 = _1387;
    float _1401 = _1355 * 0.693147182464599609375;
    float _1403 = _923;
    if (!_824)
    {
        float3 _4987 = float3(_1375, _1349, float(as_type<int>(_1335)));
        float3 _4991 = select(_4987, float3(0.0), isnan(_4987));
        float _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4991.xy, uint(rint(_4991.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4991.xy, uint(rint(_4991.z)), level(0.0)).x;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1411 = _1379 * _1381;
    float _1413 = _1383 * _1381;
    float _1415 = fma(_1411, 0.5, 0.5);
    float _1417 = fma(_1413, -0.5, 0.5);
    float _1419 = _1273;
    if (_1311)
    {
        float3 _5021 = float3(_1265, _1273, float(as_type<int>(_1399)));
        float3 _5023 = select(_5021, float3(0.0), isnan(_5021));
        float _1421 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5023.xy, uint(rint(_5023.z)), _1385, level(0.0));
        _1419 = _1421;
    }
    float _1423 = _1419;
    float3 _5033 = float3(_1415, _1417, _1409);
    float _1425 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5033, float3(0.0), isnan(_5033)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5033, float3(0.0), isnan(_5033)), level(0.0)).x;
    float3 _5042 = float3(_1415, _1417, _1409);
    float4 _1428 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5042, float3(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5042, float3(0.0), isnan(_5042)), level(0.0)).xyzw;
    float _1430 = _1428.x;
    float _1432 = _1428.y;
    float _1434 = _1428.z;
    float _1436 = _1428.w;
    bool _1438 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1440 = isnan(0.5);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1446 = _1442 || _1444;
    if (_824)
    {
        _806 = 1.0;
    }
    float _1448 = _806;
    float _1450 = _1448;
    if (_1446)
    {
        _877 = 1.0;
    }
    float _1452 = _877;
    float _1454 = _1452;
    float _1456 = _1407;
    if (!_1446)
    {
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = _1458 * 0.15915493667125701904296875;
        float _1462 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1464 = _1460 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1462 * 0.15915493667125701904296875;
        float _1470 = _1460 * 6.283185482025146484375;
        float _1472 = sin(_1470);
        float _1474 = 1.0 / _1466;
        float _1476 = _1468 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = _1472 * _1474;
        float _1482 = _1468 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1478 * _1480;
        float _1488 = 1.0 / _1486;
        float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1492 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1490;
        float _1494 = 1.0 / _1492;
        float _1496 = _1484 * _1488;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1500 = fma(_768, _1496, _1498);
        float _1502 = _1500 * _1494;
        float _1504 = precise::clamp(_1502, 0.0, 1.0);
        _1359 = _1468;
        _1454 = _1504;
    }
    float _1506 = _1359;
    float _1508 = _1454;
    float _1510 = _1506;
    if (!_824)
    {
        int _1512 = _883 << 4;
        int _1514 = _1512 + 2048;
        uint _1516 = uint(int(uint(_1514) >> uint(2)));
        uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
        int _1520 = int(_1516) & 3;
        float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
        int _1524 = int(_1516) + 1;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        int _1528 = _1524 & 3;
        float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
        int _1532 = _1514 + 8;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
        int _1542 = int(_1534) + 1;
        uint _1544 = uint(int(uint(_1542) >> uint(2)));
        int _1546 = _1542 & 3;
        float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
        float _1550 = _678 * _1530;
        float _1552 = fma(_634, _1522, _1550);
        float _1554 = fma(_636, _1540, _1552);
        float _1556 = _1554 + _1548;
        float _1558 = precise::clamp(_1556, 0.0, 1.0);
        float _1560 = -_1558;
        float _1562 = _1560 + _1407;
        float _1564 = fma(_1562, 500.0, 1.5);
        float _1566 = exp2(_1564);
        float _1568 = 0.0 + _1566;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        _1450 = _1570;
    }
    float _1572 = _1450;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1251 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1580 = _1253 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _1255 + _1582;
    float _1586 = _1576 * _1576;
    float _1588 = fma(_1580, _1580, _1586);
    float _1590 = fma(_1584, _1584, _1588);
    float _1592 = rsqrt(_1590);
    float _1594 = sqrt(_1590);
    float _1596 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1598 = _1580 * _1596;
    float _1600 = _1584 * _1596;
    float _1602 = _1598 * _1598;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 + _1604;
    float _1608 = sqrt(_1606);
    bool _1610 = _1608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = _1608 + _1612;
    float _1616 = _1586;
    float _1618 = _1614;
    float _1620 = _1598;
    float _1622 = _1600;
    float _1624 = _1604;
    bool _1626 = _1610;
    if (_1610)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1628;
    }
    float _1630 = _1616;
    if (_1610)
    {
        float _1632 = rsqrt(_1606);
        _1456 = _1632;
    }
    float _1634 = _1456;
    float _1636 = _1634;
    if (_1610)
    {
        float _1638 = _1614 * _1630;
        _1618 = _1638;
    }
    float _1640 = _1618;
    if (_1610)
    {
        float _1642 = _1640 * 0.15915493667125701904296875;
        _1510 = _1642;
    }
    float _1644 = _1510;
    float _1646 = _636;
    float _1648 = _1644;
    if (_1610)
    {
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1646 = _1652;
    }
    float _1654 = _1646;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1630;
    float _1662 = _1658;
    if (_1610)
    {
        float _1664 = _1644 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1596;
    float _1672 = -_1658;
    float _1674 = fma(_1576, _1670, _1672);
    float _1676 = _1674;
    if (_1610)
    {
        float _1678 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1678;
    }
    float _1680 = _1662;
    float _1682 = _1654;
    float _1684 = _1680;
    if (_1610)
    {
        float _1686 = fma(_1654, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1682 = _1686;
    }
    float _1688 = _1682;
    float _1690 = _1688;
    if (_1610)
    {
        float _1692 = _1668 + (-1.0);
        _1684 = _1692;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (_1610)
    {
        float _1698 = _1634 * _1688;
        _1690 = _1698;
    }
    float _1700 = _1690;
    if (_1610)
    {
        float _1702 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1702;
    }
    float _1704 = _1636;
    if (_1610)
    {
        float _1706 = _1598 * _1700;
        _1620 = _1706;
    }
    float _1708 = _1620;
    if (!_1610)
    {
        _1696 = _1602;
    }
    float _1710 = _1696;
    float _1712 = _1710;
    if (_1610)
    {
        float _1714 = _1600 * _1700;
        _1622 = _1714;
    }
    float _1716 = _1622;
    if (_1610)
    {
        float _1718 = fma(_1674, _1668, _1704);
        _1676 = _1718;
    }
    float _1720 = _1676;
    if (_1610)
    {
        float _1722 = _1708 * _1708;
        _1712 = _1722;
    }
    float _1724 = _1712;
    if (_1610)
    {
        float _1726 = _1716 * _1716;
        _1624 = _1726;
    }
    float _1728 = _1624;
    float _1730 = fma(_1720, _1720, _1724);
    float _1732 = _1730 + _1728;
    float _1734 = rsqrt(_1732);
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1738 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1736);
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    float _1742 = -_1740;
    float _1744 = _1742 + 1.0;
    float _1746 = abs(_1744);
    float _1748 = log2(_1746);
    float _1750 = _1734 * _1708;
    float _1752 = _1734 * _1720;
    float _1754 = _1734 * _1716;
    float _1756 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = -_1756;
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = -_1754;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1766 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1764, -0.5, 0.5);
    float _1770 = exp2(_1766);
    float _1772 = fma(_1764, 0.5, 0.5);
    float _1774 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1776 = sqrt(_1768);
    float _1778 = fma(_1772, _1774, -0.212114393711090087890625);
    float _1780 = _1752 + 1.0;
    float _1782 = fma(_1772, _1778, 1.570728778839111328125);
    float _1784 = -_1752;
    float _1786 = fma(_1770, _1780, _1784);
    float _1788 = _1776 * 0.636619746685028076171875;
    float _1790 = -_1782;
    float _1792 = fma(_1788, _1790, 1.0);
    float _1794 = fma(_1786, 0.5, 0.5);
    float2 _5584 = float2(_1792, _1794);
    float3 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5584, float2(0.0), isnan(_5584)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5584, float2(0.0), isnan(_5584)), level(0.0)).xyz;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = in.m_71.x;
    float _1808 = in.m_71.y;
    float _1810 = in.m_71.z;
    float _1812 = in.m_71.w;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1816 = in.m_69.x;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = in.m_63.x;
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1832 = _1830 != 0;
    float _1834 = in.m_63.w;
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1838 = _1836 != 0;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1840;
    bool _1844 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1846 = isnan(_614);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1852 = _1848 || _1850;
    float _1854 = float(_1852);
    float _1856 = in.m_63.y;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1860 = _1858 != 0;
    float _1862 = 1.0 / _1820;
    float _1864 = in.m_63.z;
    float _1866 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _546;
    out.m_73.y = _554;
    out.m_73.z = _556;
    out.m_73.w = _590;
    float _1868 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1874 = as_type<int>(_1814);
    float _1876 = _1816;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1880 = _1872;
    if (_1824)
    {
        float _1882 = -_1816;
        float _1884 = _1882 + 1.0;
        _969 = as_type<int>(_1884);
    }
    int _1886 = _969;
    float _1888 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1868);
    if (!_1824)
    {
        _1648 = _1816;
    }
    float _1890 = _1648;
    float _1892 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1894 = _1890;
    if (_1824)
    {
        bool _1896 = _1826 > 0.5;
        _1626 = _1896;
    }
    bool _1898 = _1626;
    float _1900 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1902 = -_654;
    float _1904 = _1902 + 1.0;
    out.m_75.x = _1253;
    out.m_75.y = _1251;
    out.m_75.z = _1255;
    bool _1906 = _1834 > 0.5;
    float _1908 = _1842 * _1862;
    float _1910 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1916 = _1864;
    if (_1824)
    {
        float _1918 = _1898 ? as_type<float>(_1886) : _1816;
        _1894 = _1918;
    }
    float _1920 = _1894;
    float _1922 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    float _1924 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    int _1926 = _1906 ? as_type<int>(_712) : as_type<int>(_670);
    float _1928 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1888);
    float _1930 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1922);
    bool _1932 = _1856 > 0.5;
    float _1934 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1924);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1942 = _614 + _1940;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1946 = _1944 != 0;
    float _1948 = exp2(_1900);
    int _1950 = _1932 ? as_type<int>(_712) : as_type<int>(_670);
    out.m_77.x = _1930;
    out.m_77.y = _1934;
    out.m_77.z = _1928;
    float _1952 = _1838 ? as_type<float>(_1926) : _670;
    float _1954 = fma(_1908, _1942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1956 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1958 = isnan(_614);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = _1860 ? as_type<float>(_1950) : _670;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1972 = _1864 > 0.5;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1976 = _1974 != 0;
    float _1978 = -_1854;
    float _1980 = _1978 + 1.0;
    float _1982 = _1954;
    float _1984 = _1942;
    if (_1938)
    {
        float _1986 = _1972 ? _712 : _670;
        _808 = _1986;
    }
    float _1988 = _808;
    float _1990 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1992 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1970);
    float _1994 = _1966 * _1980;
    float _1996 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1998 = -_1966;
    float _2000 = _1998 + 1.0;
    int _2002 = as_type<int>(_1914);
    float _2004 = _1988;
    if (_1946)
    {
        float _2006 = -_1816;
        float _2008 = _2006 + 1.0;
        _2002 = as_type<int>(_2008);
    }
    int _2010 = _2002;
    float _2012 = _1954 * _1994;
    float _2014 = fma(_1952, _1990, -0.5);
    float _2016 = fma(_1996, _1988, -0.5);
    float _2018 = as_type<float>(_2010);
    if (!_1946)
    {
        _1982 = _1816;
    }
    float _2020 = _1982;
    float _2022 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2012);
    float _2024 = _2020;
    if (_1946)
    {
        float _2026 = _1972 ? as_type<float>(_2010) : _1816;
        _2024 = _2026;
    }
    float _2028 = _2024;
    float _2030 = in.m_79.x;
    float _2032 = in.m_79.y;
    float _2034 = in.m_79.z;
    bool _2036 = _660 != 0.0;
    bool _2038 = isnan(_660);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan(0.0);
    bool _2044 = _2040 || _2042;
    if (_1976)
    {
        float _2046 = -_1816;
        float _2048 = _2046 + 1.0;
        _1874 = as_type<int>(_2048);
    }
    int _2050 = _1874;
    if (!_1832)
    {
        _1984 = _1856;
    }
    float _2052 = _1984;
    float _2054 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2022);
    bool _2056 = _658 == 0.0;
    bool _2058 = !_2044;
    bool _2060 = _2056 && _2058;
    float _2062 = fma(_1892, _2028, -0.5);
    float _2064 = _2052;
    if (_1832)
    {
        _2064 = _1826;
    }
    float _2066 = _2064;
    float _2068 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2070 = _662 == 0.0;
    bool _2072 = _2070 && _2060;
    if (_1976)
    {
        float _2074 = _1932 ? as_type<float>(_2050) : _1816;
        _1876 = _2074;
    }
    float _2076 = _1876;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1870);
    if (_1832)
    {
        _1878 = _1826;
    }
    float _2080 = _1878;
    float _2082 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2084 = _2080;
    if (!_1832)
    {
        _2084 = _1864;
    }
    float _2086 = _2084;
    if (!_1832)
    {
        _2018 = _1864;
    }
    float _2088 = _2018;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2092 = _2088;
    if (_1832)
    {
        _1916 = _1856;
    }
    float _2094 = _1916;
    if (_1832)
    {
        _2092 = _1856;
    }
    float _2096 = _2092;
    float _2098 = -_2090;
    float _2100 = fma(_2082, 2.0, _2098);
    float _2102 = _2096;
    if (_1832)
    {
        _2004 = _1856;
    }
    float _2104 = _2004;
    float _2106 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1872);
    float _2108 = _2104;
    if (!_1832)
    {
        _2108 = _1826;
    }
    float _2110 = _2108;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2116 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2118 = _2112;
    float _2120 = _2030;
    if (_2072)
    {
        _1880 = _2030;
    }
    float _2122 = _1880;
    float _2124 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2112);
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2128 = _2122;
    if (_2072)
    {
        _2102 = _2032;
    }
    float _2130 = _2102;
    float _2132 = _2130;
    if (!_2072)
    {
        float _2134 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2132 = _2134;
    }
    float _2136 = _2132;
    if (_2072)
    {
        _2118 = _2122;
    }
    float _2138 = _2118;
    float _2140 = -_2126;
    float _2142 = fma(_2116, 2.0, _2140);
    float _2144 = _2138;
    if (!_2072)
    {
        _2128 = _2030;
    }
    float _2146 = _2128;
    float _2148 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2150 = _1808 * _2034;
    if (_2072)
    {
        _2120 = _2034;
    }
    float _2152 = _2120;
    float _2154 = _2152;
    if (!_2072)
    {
        float _2156 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2144 = _2156;
    }
    float _2158 = _2144;
    float _2160 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2106);
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2164 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2166 = -_144;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2142);
    if (!_2072)
    {
        float _2170 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2034);
        _2154 = _2170;
    }
    float _2172 = _2154;
    float _2174 = _1810 * _2146;
    float _2176 = fma(_2148, -2.0, _2162);
    float _2178 = _1806 * _2032;
    float _2180 = -_2150;
    float _2182 = fma(_1810, _2032, _2180);
    float _2184 = fma(_2164, _2076, -0.5);
    float _2186 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2078);
    float _2188 = -_144;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2100);
    float _2192 = fma(_2160, _2184, _2168);
    float _2194 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2196 = fma(_2186, _2062, _2190);
    float _2198 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2124);
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2202 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2176);
    float _2204 = -_2174;
    float _2206 = fma(_1806, _2034, _2204);
    float _2208 = -_2178;
    float _2210 = fma(_1808, _2146, _2208);
    float _2212 = fma(_2194, -2.0, _2200);
    float _2214 = -_2202;
    float _2216 = fma(_2198, _2014, _2214);
    float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2220 = _2054 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2222 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1992);
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2226 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2212);
    float _2228 = abs(_768);
    float _2230 = log2(_2228);
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2238 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2240 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2242 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = _2206 * _1812;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2248 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _2236;
    out.m_81.y = _2240;
    out.m_81.z = _2242;
    out.m_81.w = _2220;
    float _2252 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1866);
    float _2256 = _2182 * _1812;
    float _2258 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2260 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2262 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2254);
    float _2264 = _2210 * _1812;
    bool _2266 = _768 <= 8000.0;
    bool _2268 = isnan(_768);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan(8000.0);
    bool _2274 = _2270 || _2272;
    float _2276 = float(_2274);
    float _2278 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    float _2280 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2262);
    float _2282 = exp2(_2260);
    float _2284 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2250);
    float _2286 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2288 = _2068 * _2218;
    float _2290 = _2238 * _2246;
    float _2292 = _2196 + 0.5;
    float _2294 = _2216 + 0.5;
    float _2296 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1379;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _2280;
    out.gl_Position.w = _1337;
    float _2300 = -_2226;
    float _2302 = fma(_2222, _2016, _2300);
    float _2304 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2306 = _2192 + 0.5;
    out.m_83.x = _2290;
    out.m_83.y = _2288;
    out.m_83.z = _2292;
    out.m_83.w = _2294;
    float _2308 = _2302 + 0.5;
    float _2310 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2304);
    out.m_85.x = _2306;
    out.m_85.y = _2308;
    float _2312 = _2310;
    if (!_1311)
    {
        _1389 = 1.0;
    }
    float _2314 = _1389;
    float _2316 = _2314;
    if (_1311)
    {
        bool _2318 = _1423 >= _1385;
        bool _2320 = isnan(_1423);
        bool _2322 = _2318 || _2320;
        bool _2324 = isnan(_1385);
        bool _2326 = _2322 || _2324;
        float _2328 = float(_2326);
        _2316 = _2328;
    }
    float _2330 = _2316;
    float _2332 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2258);
    float _2334 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2298);
    float _2336 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2338 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2332);
    float _2340 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2342 = _2280 + _1337;
    float _2344 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2346 = precise::clamp(_2344, 0.0, 1.0);
    float _2348 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2278);
    float _2350 = _2342 * 0.5;
    float _2352 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2284);
    bool _2354 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2356 = isnan(_1594);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2362 = _2358 || _2360;
    float _2364 = _2330 * _1572;
    out.m_87.z = _2350;
    out.m_87.w = _1337;
    float _2366 = fma(_2346, -2.0, 3.0);
    float _2368 = _2346 * _2346;
    out.m_89.x = _2348;
    out.m_89.y = _2352;
    out.m_89.z = _2336;
    float _2370 = _2368 * _2366;
    out.m_91.x = _2310;
    out.m_91.y = _2338;
    out.m_91.z = _2340;
    float _2372 = -_2370;
    float _2374 = _2372 + 1.0;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2378 = _2276 * _2376;
    float _2380 = _2338;
    if (!_2362)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2382 = _2380;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2386 = -_1948;
    float _2388 = _2386 + 1.0;
    float _2390 = _2382;
    float _2392 = _2382;
    if (!_2362)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2394 = _2312;
    float _2396 = _1904 * _2384;
    float _2398 = precise::clamp(_2396, 0.0, 1.0);
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2402 = -_2398;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2406 = _2400 * _1425;
    float _2408 = -_2400;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2364;
    float _2414 = fma(_2412, _2404, 1.0);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = _1436 * _2406;
    float _2420 = _1436 * _2410;
    float _2422 = _2410;
    float _2424 = _2416;
    float _2426 = _2418;
    float _2428 = _2394;
    float _2430 = _2394;
    if (!_2362)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2432 = _2422;
    float _2434 = _2416 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2436 = _2434;
    float _2438 = _2432;
    float _2440 = _2432;
    if (!_2362)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2442 = _2424;
    out.m_93.x = _2434;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2362)
    {
        _2436 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2448 = _2436;
    float _2450 = _1804 * _2406;
    float _2452 = fma(_1800, _2418, _1430);
    float _2454 = fma(_1802, _2418, _1432);
    float _2456 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2458 = fma(_1436, _2450, _1434);
    float _2460 = _2448;
    float _2462 = _2448;
    if (!_2362)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2426;
    out.m_95.x = _2452;
    out.m_95.y = _2454;
    out.m_95.z = _2458;
    out.m_95.w = _2420;
    bool _2466 = !_2362;
    float _2468 = _2464;
    float _2470 = _2464;
    if (!_2466)
    {
        bool _2472 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2474 = isnan(_1594);
        bool _2476 = _2472 || _2474;
        bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2480 = _2476 || _2478;
        if (!_2480)
        {
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = _1594 + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2486;
            float _2490 = 1.0 / _2488;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2512 = _2484 * _2490;
            float _2514 = precise::clamp(_2512, 0.0, 1.0);
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2520 = fma(_2514, _2494, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2522 = fma(_2514, _2518, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2524 = fma(_2514, _2498, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2526 = fma(_2514, _2502, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2528 = fma(_2514, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2530 = fma(_2514, _2510, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2430 = _2522;
            _2446 = _2528;
            _2392 = _2520;
            _2440 = _2526;
            _2470 = _2524;
            _2462 = _2530;
            _2532 = true;
        }
        else
        {
            bool _2534 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2536 = isnan(_1594);
            bool _2538 = _2534 || _2536;
            bool _2540 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2542 = _2538 || _2540;
            if (!_2542)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2544 = _2390;
            _2392 = _2544;
            if (!_2542)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2546 = _2428;
            _2430 = _2546;
            if (!_2542)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2548 = _2468;
            _2470 = _2548;
            if (!_2542)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2550 = _2438;
            _2440 = _2550;
            if (!_2542)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2552 = _2444;
            _2446 = _2552;
            if (!_2542)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2554 = _2460;
            bool _2556 = !_2542;
            _2462 = _2554;
            if (!_2556)
            {
                bool _2558 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2560 = isnan(_1594);
                bool _2562 = _2558 || _2560;
                bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2566 = _2562 || _2564;
                if (!_2566)
                {
                    float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2570 = _1594 + _2568;
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2574 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2572;
                    float _2576 = 1.0 / _2574;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2598 = _2570 * _2576;
                    float _2600 = precise::clamp(_2598, 0.0, 1.0);
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2606 = fma(_2600, _2580, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2608 = fma(_2600, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2610 = fma(_2600, _2584, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2612 = fma(_2600, _2588, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2614 = fma(_2600, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2616 = fma(_2600, _2596, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2430 = _2608;
                    _2446 = _2614;
                    _2392 = _2606;
                    _2440 = _2612;
                    _2470 = _2610;
                    _2462 = _2616;
                    _2532 = true;
                }
                else
                {
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2532 = false;
    float _2618 = _2430;
    float _2620 = _2446;
    float _2622 = _2392;
    float _2624 = _2440;
    float _2626 = _2470;
    float _2628 = _2462;
    float _2630 = fma(_2352, -0.5, 0.5);
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = -_2618;
    float _2636 = _2634 + _2620;
    float _2638 = _2456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2640 = -_2622;
    float _2642 = _2640 + _2624;
    float _2644 = fma(_2632, _2636, _2618);
    out.m_97.x = 0.0;
    float _2646 = -_2626;
    float _2648 = _2646 + _2628;
    float _2650 = fma(_2632, _2642, _2622);
    float _2652 = _2644 * 0.586610972881317138671875;
    out.m_59.x = _2638;
    bool _2654 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2656 = fma(_2632, _2648, _2626);
    float _2658 = fma(_2650, 0.298911988735198974609375, _2652);
    bool _2660 = _1508 > 0.0;
    bool _2662 = isnan(_1508);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan(0.0);
    bool _2668 = _2664 || _2666;
    float _2670 = fma(_2656, 0.114477999508380889892578125, _2658);
    float _2672 = -_2670;
    float _2674 = _2650 + _2672;
    float _2676 = -_2670;
    float _2678 = _2644 + _2676;
    float _2680 = -_2670;
    float _2682 = _2656 + _2680;
    float _2684 = fma(_2674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    float _2688 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    bool _2690 = !_2654;
    if (!_2690)
    {
        float _2692 = -_1251;
        float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2696 = -_1253;
        float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2700 = -_1255;
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2704 = _2694 * _2694;
        float _2706 = fma(_2698, _2698, _2704);
        float _2708 = fma(_2702, _2702, _2706);
        float _2710 = sqrt(_2708);
        float _2712 = rsqrt(_2708);
        float _2714 = -_2710;
        float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = _2698 * _2712;
        float _2724 = _2694 * _2712;
        float _2726 = abs(_2720);
        float _2728 = log2(_2726);
        float _2730 = _2702 * _2712;
        float _2732 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2734 = _2352 * _2724;
        float _2736 = -_2724;
        float _2738 = -_2732;
        float _2740 = fma(_2736, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2738);
        float _2742 = fma(_2348, _2722, _2734);
        float _2744 = -_2730;
        float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2740);
        float _2748 = fma(_2336, _2730, _2742);
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2754 = _2746 + _2752;
        float _2756 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2760 = precise::clamp(_2758, 0.0, 1.0);
        float _2762 = exp2(_2756);
        float _2764 = _2762 * _2760;
        float _2766 = _2750 * _2764;
        float _2768 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2772 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2768;
        out.m_97.y = _2770;
        out.m_97.z = _2772;
    }
    out.m_99.x = _2684;
    out.m_99.y = _2686;
    out.m_99.z = _2688;
    if (_2668)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2774 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2774;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2532 = false;
    bool _612 = false;
    bool _464 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_56.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_118);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_59.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2832 = as_type<float>(_134);
        out.gl_Position.z = _2832;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_61.w;
    float _140 = float(_118);
    float _142 = -_138;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_138);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    bool _156 = _144 >= _140;
    bool _158 = !_154;
    bool _160 = _156 || _158;
    if (_160)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _126;
    if (_160)
    {
        out.m_59.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _136 = as_type<int>(_164);
    }
    int _166 = _136;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2895 = as_type<float>(_166);
        out.gl_Position.z = _2895;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = 1.0 / _140;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _144 * _168;
    bool _174 = !_170;
    float _192;
    if (!_174)
    {
        float _176 = in.m_63.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _172;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _196 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _196 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = 1.0 / _216;
    float _228 = 1.0 / _220;
    bool _230 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _232 = isnan(_196);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _224;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _248 = _196 + _246;
    float _250 = _248 * _226;
    bool _252 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _254 = isnan(_196);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = 1.0 / _212;
    float _266 = _200 * _228;
    bool _268 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_196);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -_262;
    float _282 = _280 + 1.0;
    bool _284 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_196);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = _240 * _282;
    float _298 = _204 * _244;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _304;
    float _308 = -_240;
    float _310 = _308 + 1.0;
    float _312 = fma(_302, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = fma(_306, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = _208 * _264;
    bool _318 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = isnan(_196);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = fma(_332, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _340 = -_328;
    float _342 = _340 + 1.0;
    float _344 = _328 * _310;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = _278 * _342;
    float _356 = -_278;
    float _358 = _356 + 1.0;
    float _360 = fma(_336, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_348, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_352, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = _294 * _358;
    float _368 = -_294;
    float _370 = _368 + 1.0;
    float _372 = _312 * _366;
    float _374 = _314 * _366;
    float _376 = _338 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _378;
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _386 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _392;
    float _396 = fma(_380, _316, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _398 = fma(_360, _354, _382);
    float _400 = fma(_362, _354, _384);
    float _402 = fma(_364, _354, _386);
    float _404 = fma(_390, _316, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _406 = fma(_394, _316, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _420 = fma(_396, _344, _398);
    float _422 = fma(_410, _250, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _424 = fma(_414, _250, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _426 = fma(_418, _250, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _428 = fma(_404, _344, _400);
    float _430 = fma(_406, _344, _402);
    float _432 = fma(_422, _296, _420);
    float _434 = fma(_424, _296, _428);
    float _436 = fma(_426, _296, _430);
    float _438 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].x, _432);
    float _440 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].y, _434);
    float _442 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[147].z, _436);
    bool _444 = !_242;
    float _462;
    if (!_444)
    {
        float _446 = in.m_63.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _172;
    }
    _464 = false;
    float _466 = _462;
    float _468 = in.m_65.x;
    float _470 = in.m_65.y;
    float _472 = in.m_65.z;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _466 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_466);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _498 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _500 = isnan(_466);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    bool _514 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _516 = isnan(_466);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = 1.0 / _480;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _466 + _532;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _538 = 1.0 / _496;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _548 = _512 * _526;
    float _550 = -_492;
    float _552 = _550 + 1.0;
    float _554 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _558 = fma(_548, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _508 * _552;
    float _562 = _442 * _472;
    float _564 = _440 * _470;
    float _566 = _530 * _538;
    float _568 = _558 * _560;
    float _570 = -_524;
    float _572 = _570 + 1.0;
    float _574 = -_508;
    float _576 = _574 + 1.0;
    float _578 = fma(_566, _534, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = _438 * _468;
    float _582 = _492 * _572;
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _568);
    float _586 = fma(_578, _582, _584);
    float _588 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[117].x, _586);
    float _590 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _592 = !_536;
    float _610;
    if (!_592)
    {
        float _594 = in.m_63.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        _610 = _172;
    }
    _612 = false;
    float _614 = _610;
    float _616 = in.m_56.x;
    float _618 = in.m_56.y;
    float _620 = in.m_56.z;
    float _622 = _618 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _624 = _618 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[4].x, _622);
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _630 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[4].z, _626);
    float _632 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[6].z, _628);
    float _634 = _630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _636 = _632 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _638 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _640 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _642 = floor(_638);
    float _644 = floor(_640);
    float _646 = -_642;
    float _648 = _638 + _646;
    float _650 = -_644;
    float _652 = _640 + _650;
    float2 _3705 = float2(_648, _652);
    float _654 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3705, float2(0.0), isnan(_3705)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3705, float2(0.0), isnan(_3705)), level(0.0)).x;
    float _656 = _618 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _658 = in.m_67.x;
    float _660 = in.m_67.y;
    float _662 = in.m_67.z;
    float _664 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _666 = fma(_616, (*spvDescriptorSet0.vp_c10)._m0[5].x, _656);
    float _668 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _670 = in.m_69.y;
    float _672 = fma(_620, (*spvDescriptorSet0.vp_c10)._m0[5].z, _666);
    float _674 = _672 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _676 = _674 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _678 = _674 + _668;
    float _680 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[11].x, _676);
    float _682 = _678 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _686 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[11].z, _680);
    float _688 = _674 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _690 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[126].x, _682);
    float _692 = fma(_634, (*spvDescriptorSet0.vp_c15)._m0[127].x, _684);
    float _694 = _686 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _696 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[10].x, _688);
    float _698 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[126].z, _690);
    float _700 = fma(_636, (*spvDescriptorSet0.vp_c15)._m0[127].z, _692);
    float _702 = 1.0 / _694;
    float _704 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[10].z, _696);
    float _706 = _698 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _708 = _700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _710 = -_670;
    float _712 = _710 + 1.0;
    float _714 = _704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _716 = trunc(_706);
    int _718 = int(_716);
    float _720 = _714 + _694;
    float _722 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _724 = _720 * _702;
    float _726 = _724 * 0.5;
    float _728 = trunc(_708);
    int _730 = int(_728);
    float _732 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _722);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _734);
    int _738 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _740 = _718 + _738;
    int _742 = _740 + 1;
    float _744 = 1.0 / _736;
    float _746 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _732);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _660);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _662);
    bool _754 = _742 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _756 = _750 * _664;
    int _758 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _760 = _730 + _758;
    int _762 = _760 + 1;
    int _764 = _742 | _762;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _768 = _744 * _766;
    float _770 = _564 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _772 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _774 = _764 < 0;
    bool _776 = _774 || _754;
    float _778 = rsqrt(_746);
    bool _780 = _768 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _782 = _748 * _770;
    bool _784 = _768 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _786 = _752 * _772;
    bool _788 = !_780;
    int _790 = _788 ? 0 : 1;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _798 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    int _802 = 2;
    int _804 = _742;
    float _806 = _708;
    float _808 = _670;
    if (!_780)
    {
        _802 = 1;
    }
    int _810 = _802;
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _796);
    int _814 = _810;
    if (!_784)
    {
        _814 = _790;
    }
    int _816 = _814;
    float _818 = _778 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _820 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    bool _822 = _762 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _824 = _822 || _776;
    float _826 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].x, _798);
    int _828 = _816 << 6;
    float _830 = _818 * _818;
    float _832 = _820 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _834 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    int _836 = _828 + 96;
    uint _839 = uint(int(uint(_836) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.vp_c15)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[int(_849)][_851];
    float _855 = -_830;
    float _857 = fma(_855, _830, 1.0);
    float _859 = _812 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _861 = _636 + _832;
    bool _863 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _865 = isnan(0.5);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _871 = _867 || _869;
    float _873 = _712 * _857;
    float _875 = _634 + _859;
    float _877 = as_type<float>(_816);
    if (!_824)
    {
        int _879 = _762 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _881 = _879 + _742;
        _804 = _881;
    }
    int _883 = _804;
    int _885 = _828 + 104;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.vp_c15)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.vp_c15)._m0[int(_897)][_899];
    float _903 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _905 = _861 + _903;
    float _907 = _873 * 0.800000011920928955078125;
    float _909 = _172 + 0.20000000298023223876953125;
    float _911 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _913 = _875 + _911;
    float _915 = 0.0;
    int _917 = as_type<int>(_905);
    int _919 = as_type<int>(_913);
    if (!_824)
    {
        float _921 = floor(_706);
        _915 = _921;
    }
    float _923 = _915;
    float _925 = _905 * _907;
    if (!_824)
    {
        int _927 = _883 << 2;
        _917 = _927;
    }
    int _929 = _917;
    float _931 = _913 * _907;
    int _933 = _929;
    if (!_824)
    {
        uint _935 = uint(int(uint(_883) >> uint(2)));
        _919 = int(_935);
    }
    int _937 = _919;
    int _939 = _828 + 48;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    uint _943 = uint(int(uint(int(_941)) >> uint(2)));
    int _945 = int(_941) & 3;
    float _947 = (*spvDescriptorSet0.vp_c15)._m0[int(_943)][_945];
    int _949 = int(_941) + 1;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    int _953 = _949 & 3;
    float _955 = (*spvDescriptorSet0.vp_c15)._m0[int(_951)][_953];
    if (!_824)
    {
        int _957 = 12 & _929;
        _933 = _957;
    }
    int _959 = _933;
    float _961 = fma(_925, _909, _861);
    float _963 = fma(_931, _909, _875);
    float _965 = 0.0;
    float _967 = _961;
    int _969 = as_type<int>(_963);
    if (!_824)
    {
        float _971 = floor(_708);
        _965 = _971;
    }
    float _973 = _965;
    float _975 = 0.0;
    float _977 = _973;
    if (!_824)
    {
        int _979 = _937 << 4;
        int _981 = _979 + _959;
        _975 = as_type<float>(_981);
    }
    float _983 = _975;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _987 = _961 + _985;
    float _989 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _991 = _963 + _989;
    int _993 = _828 + 64;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    uint _997 = uint(int(uint(int(_995)) >> uint(2)));
    int _999 = int(_995) & 3;
    float _1001 = (*spvDescriptorSet0.vp_c15)._m0[int(_997)][_999];
    int _1003 = int(_995) + 1;
    uint _1005 = uint(int(uint(_1003) >> uint(2)));
    int _1007 = _1003 & 3;
    float _1009 = (*spvDescriptorSet0.vp_c15)._m0[int(_1005)][_1007];
    float _1011 = _987 * _987;
    float _1013 = fma(_991, _991, _1011);
    int _1015 = _828 + 56;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.vp_c15)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    float _1033 = sqrt(_1013);
    int _1035 = _828 + 72;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    uint _1039 = uint(int(uint(int(_1037)) >> uint(2)));
    int _1041 = int(_1037) & 3;
    float _1043 = (*spvDescriptorSet0.vp_c15)._m0[int(_1039)][_1041];
    int _1045 = int(_1037) + 1;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    int _1049 = _1045 & 3;
    float _1051 = (*spvDescriptorSet0.vp_c15)._m0[int(_1047)][_1049];
    float _1053 = _678 * _853;
    int _1055 = _828 + 80;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
    int _1061 = int(_1057) & 3;
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[int(_1059)][_1061];
    int _1065 = int(_1057) + 1;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    int _1069 = _1065 & 3;
    float _1071 = (*spvDescriptorSet0.vp_c15)._m0[int(_1067)][_1069];
    float _1073 = fma(_634, _845, _1053);
    bool _1075 = _1033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1077 = fma(_636, _893, _1073);
    int _1079 = _828 + 88;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
    int _1085 = int(_1081) & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    int _1089 = int(_1081) + 1;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    int _1093 = _1089 & 3;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[int(_1091)][_1093];
    float _1097 = _1077 + _901;
    float _1099 = _834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = _674 + _1099;
    float _1103 = _983;
    float _1105 = _1099;
    float _1107 = _901;
    float _1109 = _987;
    if (!_824)
    {
        int _1111 = as_type<int>(_983) + 400;
        uint _1113 = uint(int(uint(_1111) >> uint(2)));
        uint _1115 = uint(int(uint(int(_1113)) >> uint(2)));
        int _1117 = int(_1113) & 3;
        float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
        _1103 = _1119;
    }
    float _1121 = _1103;
    float _1123 = 1.0 / _1097;
    float _1125 = _678 * _955;
    if (!_1075)
    {
        _1105 = _963;
    }
    float _1127 = _1105;
    float _1129 = _1127;
    if (!_1075)
    {
        _1107 = _1101;
    }
    float _1131 = _1107;
    float _1133 = fma(_634, _947, _1125);
    float _1135 = _678 * _1009;
    float _1137 = fma(_634, _1001, _1135);
    bool _1139 = !_1075;
    float _1141 = _1131;
    float _1143 = _1121;
    if (!_1139)
    {
        float _1145 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1149 = _1033 + _1147;
        float _1151 = _1101 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1153 = rsqrt(_1013);
        float _1155 = _1149 * _1145;
        float _1157 = _1155 * 0.15915493667125701904296875;
        float _1159 = _1157 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1157 * 6.283185482025146484375;
        float _1165 = sin(_1163);
        float _1167 = _1161 + (-1.0);
        float _1169 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1171 = fma(_1165, _1151, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1173 = fma(_1101, _1161, _1169);
        float _1175 = _1153 * _1171;
        float _1177 = fma(_991, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1179 = fma(_987, _1175, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _967 = _1179;
        _1129 = _1177;
        _1141 = _1173;
    }
    float _1181 = _967;
    float _1183 = _1129;
    float _1185 = _1141;
    float _1187 = fma(_636, _1023, _1133);
    float _1189 = fma(_636, _1043, _1137);
    float _1191 = _1185;
    float _1193 = _1183;
    float _1195 = _1189;
    if (_871)
    {
        _1109 = _1181;
    }
    float _1197 = _1109;
    float _1199 = _1197;
    if (!_871)
    {
        float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1203 = _674 + _1201;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1207 = _634 + _1205;
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1211 = -_634;
        float _1213 = _1211 + _1183;
        float _1215 = _1203 * _1203;
        float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1219 = _636 + _1217;
        float _1221 = fma(_1207, _1207, _1215);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1225 = fma(_1219, _1219, _1221);
        float _1227 = sqrt(_1225);
        float _1229 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = precise::min(_1227, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1233 = _1231 * _1223;
        float _1235 = -_674;
        float _1237 = _1235 + _1185;
        float _1239 = _1229 * _1233;
        float _1241 = -_636;
        float _1243 = _1241 + _1181;
        float _1245 = fma(_1237, _1239, _674);
        float _1247 = fma(_1213, _1239, _634);
        float _1249 = fma(_1243, _1239, _636);
        _1191 = _1245;
        _1193 = _1247;
        _1199 = _1249;
    }
    float _1251 = _1191;
    float _1253 = _1193;
    float _1255 = _1199;
    float _1257 = _1187 + _1031;
    float _1259 = _1189 + _1051;
    float _1261 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1265 = _1257 * _1123;
    float _1267 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1271 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1263);
    float _1273 = _1259 * _1123;
    bool _1275 = _1265 >= 0.0;
    float _1277 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1269);
    float _1279 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1267);
    float _1281 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1283 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1271);
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1287 = _1265 <= 1.0;
    bool _1289 = _1287 && _1275;
    float _1291 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1279);
    float _1293 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1281);
    float _1295 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1297 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1299 = _1273 >= 0.0;
    bool _1301 = _1299 && _1289;
    float _1303 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1305 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1293);
    float _1307 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1297);
    bool _1309 = _1273 <= 1.0;
    bool _1311 = _1309 && _1301;
    float _1313 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1315 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1307);
    float _1321 = _678 * _1071;
    float _1323 = -_1315;
    float _1325 = fma(_1323, _1313, 1.0);
    if (!_824)
    {
        float _1327 = rint(_1121);
        float _1329 = precise::max(_1327, 0.0);
        uint _1331 = uint(_1329);
        uint _1333 = clamp(_1331, 0u, 65535u);
        _1195 = as_type<float>(_1333);
    }
    float _1335 = _1195;
    float _1337 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1319);
    float _1339 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1343 = fma(_634, _1063, _1321);
    if (!_824)
    {
        float _1345 = -_973;
        float _1347 = _708 + _1345;
        _977 = _1347;
    }
    float _1349 = _977;
    float _1351 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1341);
    float _1355 = log2(_1325);
    float _1357 = _1353;
    float _1359 = _1349;
    if (_1311)
    {
        float _1361 = float(_816);
        _1143 = _1361;
    }
    float _1363 = _1143;
    float _1365 = fma(_636, _1087, _1343);
    float _1367 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1369 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1353);
    if (!_824)
    {
        float _1371 = -_923;
        float _1373 = _706 + _1371;
        _1357 = _1373;
    }
    float _1375 = _1357;
    float _1377 = _1365 + _1095;
    float _1379 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1367);
    float _1381 = 1.0 / _1337;
    float _1383 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1369);
    float _1385 = _1377 * _1123;
    float _1387 = _1363;
    float _1389 = _1383;
    if (_1311)
    {
        float _1391 = rint(_1363);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        uint _1397 = clamp(_1395, 0u, 65535u);
        _1387 = as_type<float>(_1397);
    }
    float _1399 = _1387;
    float _1401 = _1355 * 0.693147182464599609375;
    float _1403 = _923;
    if (!_824)
    {
        float3 _4987 = float3(_1375, _1349, float(as_type<int>(_1335)));
        float3 _4991 = select(_4987, float3(0.0), isnan(_4987));
        float _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4991.xy, uint(rint(_4991.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4991.xy, uint(rint(_4991.z)), level(0.0)).x;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1411 = _1379 * _1381;
    float _1413 = _1383 * _1381;
    float _1415 = fma(_1411, 0.5, 0.5);
    float _1417 = fma(_1413, -0.5, 0.5);
    float _1419 = _1273;
    if (_1311)
    {
        float3 _5021 = float3(_1265, _1273, float(as_type<int>(_1399)));
        float3 _5023 = select(_5021, float3(0.0), isnan(_5021));
        float _1421 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5023.xy, uint(rint(_5023.z)), _1385, level(0.0));
        _1419 = _1421;
    }
    float _1423 = _1419;
    float3 _5033 = float3(_1415, _1417, _1409);
    float _1425 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5033, float3(0.0), isnan(_5033)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5033, float3(0.0), isnan(_5033)), level(0.0)).x;
    float3 _5042 = float3(_1415, _1417, _1409);
    float4 _1428 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5042, float3(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5042, float3(0.0), isnan(_5042)), level(0.0)).xyzw;
    float _1430 = _1428.x;
    float _1432 = _1428.y;
    float _1434 = _1428.z;
    float _1436 = _1428.w;
    bool _1438 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1440 = isnan(0.5);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1446 = _1442 || _1444;
    if (_824)
    {
        _806 = 1.0;
    }
    float _1448 = _806;
    float _1450 = _1448;
    if (_1446)
    {
        _877 = 1.0;
    }
    float _1452 = _877;
    float _1454 = _1452;
    float _1456 = _1407;
    if (!_1446)
    {
        float _1458 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1460 = _1458 * 0.15915493667125701904296875;
        float _1462 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1464 = _1460 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1462 * 0.15915493667125701904296875;
        float _1470 = _1460 * 6.283185482025146484375;
        float _1472 = sin(_1470);
        float _1474 = 1.0 / _1466;
        float _1476 = _1468 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = _1472 * _1474;
        float _1482 = _1468 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1478 * _1480;
        float _1488 = 1.0 / _1486;
        float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1492 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1490;
        float _1494 = 1.0 / _1492;
        float _1496 = _1484 * _1488;
        float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1500 = fma(_768, _1496, _1498);
        float _1502 = _1500 * _1494;
        float _1504 = precise::clamp(_1502, 0.0, 1.0);
        _1359 = _1468;
        _1454 = _1504;
    }
    float _1506 = _1359;
    float _1508 = _1454;
    float _1510 = _1506;
    if (!_824)
    {
        int _1512 = _883 << 4;
        int _1514 = _1512 + 2048;
        uint _1516 = uint(int(uint(_1514) >> uint(2)));
        uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
        int _1520 = int(_1516) & 3;
        float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
        int _1524 = int(_1516) + 1;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        int _1528 = _1524 & 3;
        float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
        int _1532 = _1514 + 8;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
        int _1538 = int(_1534) & 3;
        float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
        int _1542 = int(_1534) + 1;
        uint _1544 = uint(int(uint(_1542) >> uint(2)));
        int _1546 = _1542 & 3;
        float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
        float _1550 = _678 * _1530;
        float _1552 = fma(_634, _1522, _1550);
        float _1554 = fma(_636, _1540, _1552);
        float _1556 = _1554 + _1548;
        float _1558 = precise::clamp(_1556, 0.0, 1.0);
        float _1560 = -_1558;
        float _1562 = _1560 + _1407;
        float _1564 = fma(_1562, 500.0, 1.5);
        float _1566 = exp2(_1564);
        float _1568 = 0.0 + _1566;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        _1450 = _1570;
    }
    float _1572 = _1450;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1251 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1580 = _1253 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _1255 + _1582;
    float _1586 = _1576 * _1576;
    float _1588 = fma(_1580, _1580, _1586);
    float _1590 = fma(_1584, _1584, _1588);
    float _1592 = rsqrt(_1590);
    float _1594 = sqrt(_1590);
    float _1596 = _1592 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1598 = _1580 * _1596;
    float _1600 = _1584 * _1596;
    float _1602 = _1598 * _1598;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 + _1604;
    float _1608 = sqrt(_1606);
    bool _1610 = _1608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = _1608 + _1612;
    float _1616 = _1586;
    float _1618 = _1614;
    float _1620 = _1598;
    float _1622 = _1600;
    float _1624 = _1604;
    bool _1626 = _1610;
    if (_1610)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1628;
    }
    float _1630 = _1616;
    if (_1610)
    {
        float _1632 = rsqrt(_1606);
        _1456 = _1632;
    }
    float _1634 = _1456;
    float _1636 = _1634;
    if (_1610)
    {
        float _1638 = _1614 * _1630;
        _1618 = _1638;
    }
    float _1640 = _1618;
    if (_1610)
    {
        float _1642 = _1640 * 0.15915493667125701904296875;
        _1510 = _1642;
    }
    float _1644 = _1510;
    float _1646 = _636;
    float _1648 = _1644;
    if (_1610)
    {
        float _1650 = _1644 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1646 = _1652;
    }
    float _1654 = _1646;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1630;
    float _1662 = _1658;
    if (_1610)
    {
        float _1664 = _1644 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1596;
    float _1672 = -_1658;
    float _1674 = fma(_1576, _1670, _1672);
    float _1676 = _1674;
    if (_1610)
    {
        float _1678 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1678;
    }
    float _1680 = _1662;
    float _1682 = _1654;
    float _1684 = _1680;
    if (_1610)
    {
        float _1686 = fma(_1654, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1682 = _1686;
    }
    float _1688 = _1682;
    float _1690 = _1688;
    if (_1610)
    {
        float _1692 = _1668 + (-1.0);
        _1684 = _1692;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (_1610)
    {
        float _1698 = _1634 * _1688;
        _1690 = _1698;
    }
    float _1700 = _1690;
    if (_1610)
    {
        float _1702 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1702;
    }
    float _1704 = _1636;
    if (_1610)
    {
        float _1706 = _1598 * _1700;
        _1620 = _1706;
    }
    float _1708 = _1620;
    if (!_1610)
    {
        _1696 = _1602;
    }
    float _1710 = _1696;
    float _1712 = _1710;
    if (_1610)
    {
        float _1714 = _1600 * _1700;
        _1622 = _1714;
    }
    float _1716 = _1622;
    if (_1610)
    {
        float _1718 = fma(_1674, _1668, _1704);
        _1676 = _1718;
    }
    float _1720 = _1676;
    if (_1610)
    {
        float _1722 = _1708 * _1708;
        _1712 = _1722;
    }
    float _1724 = _1712;
    if (_1610)
    {
        float _1726 = _1716 * _1716;
        _1624 = _1726;
    }
    float _1728 = _1624;
    float _1730 = fma(_1720, _1720, _1724);
    float _1732 = _1730 + _1728;
    float _1734 = rsqrt(_1732);
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1738 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1736);
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    float _1742 = -_1740;
    float _1744 = _1742 + 1.0;
    float _1746 = abs(_1744);
    float _1748 = log2(_1746);
    float _1750 = _1734 * _1708;
    float _1752 = _1734 * _1720;
    float _1754 = _1734 * _1716;
    float _1756 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = -_1756;
    float _1760 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1758);
    float _1762 = -_1754;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1760);
    float _1766 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1764, -0.5, 0.5);
    float _1770 = exp2(_1766);
    float _1772 = fma(_1764, 0.5, 0.5);
    float _1774 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1776 = sqrt(_1768);
    float _1778 = fma(_1772, _1774, -0.212114393711090087890625);
    float _1780 = _1752 + 1.0;
    float _1782 = fma(_1772, _1778, 1.570728778839111328125);
    float _1784 = -_1752;
    float _1786 = fma(_1770, _1780, _1784);
    float _1788 = _1776 * 0.636619746685028076171875;
    float _1790 = -_1782;
    float _1792 = fma(_1788, _1790, 1.0);
    float _1794 = fma(_1786, 0.5, 0.5);
    float2 _5584 = float2(_1792, _1794);
    float3 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5584, float2(0.0), isnan(_5584)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5584, float2(0.0), isnan(_5584)), level(0.0)).xyz;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = in.m_71.x;
    float _1808 = in.m_71.y;
    float _1810 = in.m_71.z;
    float _1812 = in.m_71.w;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1816 = in.m_69.x;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = in.m_63.x;
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1832 = _1830 != 0;
    float _1834 = in.m_63.w;
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1838 = _1836 != 0;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1840;
    bool _1844 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1846 = isnan(_614);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1852 = _1848 || _1850;
    float _1854 = float(_1852);
    float _1856 = in.m_63.y;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1860 = _1858 != 0;
    float _1862 = 1.0 / _1820;
    float _1864 = in.m_63.z;
    float _1866 = _1285 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _546;
    out.m_73.y = _554;
    out.m_73.z = _556;
    out.m_73.w = _590;
    float _1868 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1874 = as_type<int>(_1814);
    float _1876 = _1816;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1880 = _1872;
    if (_1824)
    {
        float _1882 = -_1816;
        float _1884 = _1882 + 1.0;
        _969 = as_type<int>(_1884);
    }
    int _1886 = _969;
    float _1888 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1868);
    if (!_1824)
    {
        _1648 = _1816;
    }
    float _1890 = _1648;
    float _1892 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1894 = _1890;
    if (_1824)
    {
        bool _1896 = _1826 > 0.5;
        _1626 = _1896;
    }
    bool _1898 = _1626;
    float _1900 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1902 = -_654;
    float _1904 = _1902 + 1.0;
    out.m_75.x = _1253;
    out.m_75.y = _1251;
    out.m_75.z = _1255;
    bool _1906 = _1834 > 0.5;
    float _1908 = _1842 * _1862;
    float _1910 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1914 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1916 = _1864;
    if (_1824)
    {
        float _1918 = _1898 ? as_type<float>(_1886) : _1816;
        _1894 = _1918;
    }
    float _1920 = _1894;
    float _1922 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    float _1924 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    int _1926 = _1906 ? as_type<int>(_712) : as_type<int>(_670);
    float _1928 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1888);
    float _1930 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1922);
    bool _1932 = _1856 > 0.5;
    float _1934 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1924);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1938 = _1936 != 0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1942 = _614 + _1940;
    int _1944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1946 = _1944 != 0;
    float _1948 = exp2(_1900);
    int _1950 = _1932 ? as_type<int>(_712) : as_type<int>(_670);
    out.m_77.x = _1930;
    out.m_77.y = _1934;
    out.m_77.z = _1928;
    float _1952 = _1838 ? as_type<float>(_1926) : _670;
    float _1954 = fma(_1908, _1942, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1956 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1958 = isnan(_614);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = _1860 ? as_type<float>(_1950) : _670;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1972 = _1864 > 0.5;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1976 = _1974 != 0;
    float _1978 = -_1854;
    float _1980 = _1978 + 1.0;
    float _1982 = _1954;
    float _1984 = _1942;
    if (_1938)
    {
        float _1986 = _1972 ? _712 : _670;
        _808 = _1986;
    }
    float _1988 = _808;
    float _1990 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1992 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1970);
    float _1994 = _1966 * _1980;
    float _1996 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1998 = -_1966;
    float _2000 = _1998 + 1.0;
    int _2002 = as_type<int>(_1914);
    float _2004 = _1988;
    if (_1946)
    {
        float _2006 = -_1816;
        float _2008 = _2006 + 1.0;
        _2002 = as_type<int>(_2008);
    }
    int _2010 = _2002;
    float _2012 = _1954 * _1994;
    float _2014 = fma(_1952, _1990, -0.5);
    float _2016 = fma(_1996, _1988, -0.5);
    float _2018 = as_type<float>(_2010);
    if (!_1946)
    {
        _1982 = _1816;
    }
    float _2020 = _1982;
    float _2022 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2012);
    float _2024 = _2020;
    if (_1946)
    {
        float _2026 = _1972 ? as_type<float>(_2010) : _1816;
        _2024 = _2026;
    }
    float _2028 = _2024;
    float _2030 = in.m_79.x;
    float _2032 = in.m_79.y;
    float _2034 = in.m_79.z;
    bool _2036 = _660 != 0.0;
    bool _2038 = isnan(_660);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan(0.0);
    bool _2044 = _2040 || _2042;
    if (_1976)
    {
        float _2046 = -_1816;
        float _2048 = _2046 + 1.0;
        _1874 = as_type<int>(_2048);
    }
    int _2050 = _1874;
    if (!_1832)
    {
        _1984 = _1856;
    }
    float _2052 = _1984;
    float _2054 = fma(_1854, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2022);
    bool _2056 = _658 == 0.0;
    bool _2058 = !_2044;
    bool _2060 = _2056 && _2058;
    float _2062 = fma(_1892, _2028, -0.5);
    float _2064 = _2052;
    if (_1832)
    {
        _2064 = _1826;
    }
    float _2066 = _2064;
    float _2068 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2070 = _662 == 0.0;
    bool _2072 = _2070 && _2060;
    if (_1976)
    {
        float _2074 = _1932 ? as_type<float>(_2050) : _1816;
        _1876 = _2074;
    }
    float _2076 = _1876;
    float _2078 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1870);
    if (_1832)
    {
        _1878 = _1826;
    }
    float _2080 = _1878;
    float _2082 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2084 = _2080;
    if (!_1832)
    {
        _2084 = _1864;
    }
    float _2086 = _2084;
    if (!_1832)
    {
        _2018 = _1864;
    }
    float _2088 = _2018;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2092 = _2088;
    if (_1832)
    {
        _1916 = _1856;
    }
    float _2094 = _1916;
    if (_1832)
    {
        _2092 = _1856;
    }
    float _2096 = _2092;
    float _2098 = -_2090;
    float _2100 = fma(_2082, 2.0, _2098);
    float _2102 = _2096;
    if (_1832)
    {
        _2004 = _1856;
    }
    float _2104 = _2004;
    float _2106 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1872);
    float _2108 = _2104;
    if (!_1832)
    {
        _2108 = _1826;
    }
    float _2110 = _2108;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2116 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2118 = _2112;
    float _2120 = _2030;
    if (_2072)
    {
        _1880 = _2030;
    }
    float _2122 = _1880;
    float _2124 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2112);
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2128 = _2122;
    if (_2072)
    {
        _2102 = _2032;
    }
    float _2130 = _2102;
    float _2132 = _2130;
    if (!_2072)
    {
        float _2134 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2132 = _2134;
    }
    float _2136 = _2132;
    if (_2072)
    {
        _2118 = _2122;
    }
    float _2138 = _2118;
    float _2140 = -_2126;
    float _2142 = fma(_2116, 2.0, _2140);
    float _2144 = _2138;
    if (!_2072)
    {
        _2128 = _2030;
    }
    float _2146 = _2128;
    float _2148 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2150 = _1808 * _2034;
    if (_2072)
    {
        _2120 = _2034;
    }
    float _2152 = _2120;
    float _2154 = _2152;
    if (!_2072)
    {
        float _2156 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2144 = _2156;
    }
    float _2158 = _2144;
    float _2160 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2106);
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2164 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2166 = -_144;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2142);
    if (!_2072)
    {
        float _2170 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2034);
        _2154 = _2170;
    }
    float _2172 = _2154;
    float _2174 = _1810 * _2146;
    float _2176 = fma(_2148, -2.0, _2162);
    float _2178 = _1806 * _2032;
    float _2180 = -_2150;
    float _2182 = fma(_1810, _2032, _2180);
    float _2184 = fma(_2164, _2076, -0.5);
    float _2186 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2078);
    float _2188 = -_144;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2100);
    float _2192 = fma(_2160, _2184, _2168);
    float _2194 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2196 = fma(_2186, _2062, _2190);
    float _2198 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2124);
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2202 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2176);
    float _2204 = -_2174;
    float _2206 = fma(_1806, _2034, _2204);
    float _2208 = -_2178;
    float _2210 = fma(_1808, _2146, _2208);
    float _2212 = fma(_2194, -2.0, _2200);
    float _2214 = -_2202;
    float _2216 = fma(_2198, _2014, _2214);
    float _2218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2220 = _2054 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2222 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1992);
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2226 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2212);
    float _2228 = abs(_768);
    float _2230 = log2(_2228);
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2236 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2238 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2240 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2242 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = _2206 * _1812;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2248 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_81.x = _2236;
    out.m_81.y = _2240;
    out.m_81.z = _2242;
    out.m_81.w = _2220;
    float _2252 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1866);
    float _2256 = _2182 * _1812;
    float _2258 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2260 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2262 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2254);
    float _2264 = _2210 * _1812;
    bool _2266 = _768 <= 8000.0;
    bool _2268 = isnan(_768);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan(8000.0);
    bool _2274 = _2270 || _2272;
    float _2276 = float(_2274);
    float _2278 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    float _2280 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2262);
    float _2282 = exp2(_2260);
    float _2284 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2250);
    float _2286 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2288 = _2068 * _2218;
    float _2290 = _2238 * _2246;
    float _2292 = _2196 + 0.5;
    float _2294 = _2216 + 0.5;
    float _2296 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.gl_Position.x = _1379;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _2280;
    out.gl_Position.w = _1337;
    float _2300 = -_2226;
    float _2302 = fma(_2222, _2016, _2300);
    float _2304 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2306 = _2192 + 0.5;
    out.m_83.x = _2290;
    out.m_83.y = _2288;
    out.m_83.z = _2292;
    out.m_83.w = _2294;
    float _2308 = _2302 + 0.5;
    float _2310 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2304);
    out.m_85.x = _2306;
    out.m_85.y = _2308;
    float _2312 = _2310;
    if (!_1311)
    {
        _1389 = 1.0;
    }
    float _2314 = _1389;
    float _2316 = _2314;
    if (_1311)
    {
        bool _2318 = _1423 >= _1385;
        bool _2320 = isnan(_1423);
        bool _2322 = _2318 || _2320;
        bool _2324 = isnan(_1385);
        bool _2326 = _2322 || _2324;
        float _2328 = float(_2326);
        _2316 = _2328;
    }
    float _2330 = _2316;
    float _2332 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2258);
    float _2334 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2298);
    float _2336 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2286);
    float _2338 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2332);
    float _2340 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2342 = _2280 + _1337;
    float _2344 = fma(_2282, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2346 = precise::clamp(_2344, 0.0, 1.0);
    float _2348 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2278);
    float _2350 = _2342 * 0.5;
    float _2352 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2284);
    bool _2354 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2356 = isnan(_1594);
    bool _2358 = _2354 || _2356;
    bool _2360 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2362 = _2358 || _2360;
    float _2364 = _2330 * _1572;
    out.m_87.z = _2350;
    out.m_87.w = _1337;
    float _2366 = fma(_2346, -2.0, 3.0);
    float _2368 = _2346 * _2346;
    out.m_89.x = _2348;
    out.m_89.y = _2352;
    out.m_89.z = _2336;
    float _2370 = _2368 * _2366;
    out.m_91.x = _2310;
    out.m_91.y = _2338;
    out.m_91.z = _2340;
    float _2372 = -_2370;
    float _2374 = _2372 + 1.0;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2370);
    float _2378 = _2276 * _2376;
    float _2380 = _2338;
    if (!_2362)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2382 = _2380;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2386 = -_1948;
    float _2388 = _2386 + 1.0;
    float _2390 = _2382;
    float _2392 = _2382;
    if (!_2362)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2394 = _2312;
    float _2396 = _1904 * _2384;
    float _2398 = precise::clamp(_2396, 0.0, 1.0);
    float _2400 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2402 = -_2398;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2406 = _2400 * _1425;
    float _2408 = -_2400;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2364;
    float _2414 = fma(_2412, _2404, 1.0);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = _1436 * _2406;
    float _2420 = _1436 * _2410;
    float _2422 = _2410;
    float _2424 = _2416;
    float _2426 = _2418;
    float _2428 = _2394;
    float _2430 = _2394;
    if (!_2362)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2432 = _2422;
    float _2434 = _2416 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2436 = _2434;
    float _2438 = _2432;
    float _2440 = _2432;
    if (!_2362)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2442 = _2424;
    out.m_93.x = _2434;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2362)
    {
        _2436 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2448 = _2436;
    float _2450 = _1804 * _2406;
    float _2452 = fma(_1800, _2418, _1430);
    float _2454 = fma(_1802, _2418, _1432);
    float _2456 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2458 = fma(_1436, _2450, _1434);
    float _2460 = _2448;
    float _2462 = _2448;
    if (!_2362)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2426;
    out.m_95.x = _2452;
    out.m_95.y = _2454;
    out.m_95.z = _2458;
    out.m_95.w = _2420;
    bool _2466 = !_2362;
    float _2468 = _2464;
    float _2470 = _2464;
    if (!_2466)
    {
        bool _2472 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2474 = isnan(_1594);
        bool _2476 = _2472 || _2474;
        bool _2478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2480 = _2476 || _2478;
        if (!_2480)
        {
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = _1594 + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2486;
            float _2490 = 1.0 / _2488;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2512 = _2484 * _2490;
            float _2514 = precise::clamp(_2512, 0.0, 1.0);
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2520 = fma(_2514, _2494, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2522 = fma(_2514, _2518, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2524 = fma(_2514, _2498, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2526 = fma(_2514, _2502, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2528 = fma(_2514, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2530 = fma(_2514, _2510, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2430 = _2522;
            _2446 = _2528;
            _2392 = _2520;
            _2440 = _2526;
            _2470 = _2524;
            _2462 = _2530;
            _2532 = true;
        }
        else
        {
            bool _2534 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2536 = isnan(_1594);
            bool _2538 = _2534 || _2536;
            bool _2540 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2542 = _2538 || _2540;
            if (!_2542)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2544 = _2390;
            _2392 = _2544;
            if (!_2542)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2546 = _2428;
            _2430 = _2546;
            if (!_2542)
            {
                _2468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2548 = _2468;
            _2470 = _2548;
            if (!_2542)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2550 = _2438;
            _2440 = _2550;
            if (!_2542)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2552 = _2444;
            _2446 = _2552;
            if (!_2542)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2554 = _2460;
            bool _2556 = !_2542;
            _2462 = _2554;
            if (!_2556)
            {
                bool _2558 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2560 = isnan(_1594);
                bool _2562 = _2558 || _2560;
                bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2566 = _2562 || _2564;
                if (!_2566)
                {
                    float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2570 = _1594 + _2568;
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2574 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2572;
                    float _2576 = 1.0 / _2574;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2598 = _2570 * _2576;
                    float _2600 = precise::clamp(_2598, 0.0, 1.0);
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2606 = fma(_2600, _2580, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2608 = fma(_2600, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2610 = fma(_2600, _2584, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2612 = fma(_2600, _2588, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2614 = fma(_2600, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2616 = fma(_2600, _2596, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2430 = _2608;
                    _2446 = _2614;
                    _2392 = _2606;
                    _2440 = _2612;
                    _2470 = _2610;
                    _2462 = _2616;
                    _2532 = true;
                }
                else
                {
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2532 = false;
    float _2618 = _2430;
    float _2620 = _2446;
    float _2622 = _2392;
    float _2624 = _2440;
    float _2626 = _2470;
    float _2628 = _2462;
    float _2630 = fma(_2352, -0.5, 0.5);
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = -_2618;
    float _2636 = _2634 + _2620;
    float _2638 = _2456 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2640 = -_2622;
    float _2642 = _2640 + _2624;
    float _2644 = fma(_2632, _2636, _2618);
    out.m_97.x = 0.0;
    float _2646 = -_2626;
    float _2648 = _2646 + _2628;
    float _2650 = fma(_2632, _2642, _2622);
    float _2652 = _2644 * 0.586610972881317138671875;
    out.m_59.x = _2638;
    bool _2654 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2656 = fma(_2632, _2648, _2626);
    float _2658 = fma(_2650, 0.298911988735198974609375, _2652);
    bool _2660 = _1508 > 0.0;
    bool _2662 = isnan(_1508);
    bool _2664 = _2660 || _2662;
    bool _2666 = isnan(0.0);
    bool _2668 = _2664 || _2666;
    float _2670 = fma(_2656, 0.114477999508380889892578125, _2658);
    float _2672 = -_2670;
    float _2674 = _2650 + _2672;
    float _2676 = -_2670;
    float _2678 = _2644 + _2676;
    float _2680 = -_2670;
    float _2682 = _2656 + _2680;
    float _2684 = fma(_2674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    float _2688 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2670);
    bool _2690 = !_2654;
    if (!_2690)
    {
        float _2692 = -_1251;
        float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2696 = -_1253;
        float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2700 = -_1255;
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2704 = _2694 * _2694;
        float _2706 = fma(_2698, _2698, _2704);
        float _2708 = fma(_2702, _2702, _2706);
        float _2710 = sqrt(_2708);
        float _2712 = rsqrt(_2708);
        float _2714 = -_2710;
        float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2718 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = _2698 * _2712;
        float _2724 = _2694 * _2712;
        float _2726 = abs(_2720);
        float _2728 = log2(_2726);
        float _2730 = _2702 * _2712;
        float _2732 = _2722 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2734 = _2352 * _2724;
        float _2736 = -_2724;
        float _2738 = -_2732;
        float _2740 = fma(_2736, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2738);
        float _2742 = fma(_2348, _2722, _2734);
        float _2744 = -_2730;
        float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2740);
        float _2748 = fma(_2336, _2730, _2742);
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2754 = _2746 + _2752;
        float _2756 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2760 = precise::clamp(_2758, 0.0, 1.0);
        float _2762 = exp2(_2756);
        float _2764 = _2762 * _2760;
        float _2766 = _2750 * _2764;
        float _2768 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2772 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2768;
        out.m_97.y = _2770;
        out.m_97.z = _2772;
    }
    out.m_99.x = _2684;
    out.m_99.y = _2686;
    out.m_99.z = _2688;
    if (_2668)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2774 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2774;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

