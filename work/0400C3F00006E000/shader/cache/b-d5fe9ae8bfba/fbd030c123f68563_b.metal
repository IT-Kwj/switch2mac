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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5350 = false;
    bool _4167 = false;
    bool _614 = false;
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
        float _5583 = as_type<float>(_140);
        out.gl_Position.z = _5583;
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
        float _5652 = as_type<float>(_178);
        out.gl_Position.z = _5652;
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
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _224 = 1.0 / _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = 1.0 / _218;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _238 = 1.0 / _234;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _250 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _252 = isnan(_210);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = 1.0 / _242;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _266 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _268 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _210 + _270;
    float _274 = 1.0 / _222;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = _210 + _276;
    float _280 = _272 * _224;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _210 + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _288 = _278 * _238;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _290;
    float _294 = _284 * _230;
    float _296 = 1.0 / _228;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _300 = fma(_292, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _306 = _210 + _304;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _312 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _314 = _306 * _262;
    float _316 = _308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _318 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _320 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _322 = isnan(_210);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _210 + _332;
    bool _336 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _338 = isnan(_210);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_260;
    float _350 = _348 + 1.0;
    out.m_67.x = _316;
    out.m_67.y = _312;
    out.m_67.z = _318;
    out.m_67.w = _236;
    float _352 = _334 * _296;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _356 = _210 + _354;
    out.m_69.x = _302;
    out.m_69.y = _266;
    out.m_69.z = _268;
    out.m_69.w = _264;
    float _358 = _356 * _274;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = fma(_362, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _366 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _368 = isnan(_210);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_330;
    float _380 = _378 + 1.0;
    float _382 = _346 * _350;
    float _384 = _376 * _380;
    float _386 = -_346;
    float _388 = _386 + 1.0;
    bool _390 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_210);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    bool _406 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _408 = isnan(_210);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _330 * _388;
    bool _420 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _422 = isnan(_210);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -_376;
    float _438 = _436 + 1.0;
    float _440 = fma(_404, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = -_430;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = _400 * _438;
    float _456 = -_400;
    float _458 = _456 + 1.0;
    float _460 = _416 * _448;
    float _462 = -_416;
    float _464 = _462 + 1.0;
    float _466 = fma(_434, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = _440 * _460;
    float _470 = _364 * _460;
    float _472 = fma(_444, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = fma(_452, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = _300 * _460;
    float _478 = _430 * _458;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _492;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _498;
    float _502 = fma(_482, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _504 = fma(_494, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = fma(_466, _478, _488);
    float _512 = fma(_472, _478, _490);
    float _514 = fma(_474, _478, _496);
    float _516 = fma(_500, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_486, _358, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_508, _358, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_502, _454, _510);
    float _528 = fma(_504, _454, _512);
    float _530 = fma(_520, _358, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _536;
    float _540 = fma(_516, _454, _514);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _542;
    float _546 = fma(_522, _384, _526);
    float _548 = fma(_524, _384, _528);
    float _550 = fma(_534, _288, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _552 = fma(_538, _288, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _554 = fma(_530, _384, _540);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _564 = fma(_544, _288, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _570 = fma(_550, _418, _546);
    float _572 = fma(_558, _314, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _574 = fma(_562, _314, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _576 = fma(_552, _418, _548);
    float _578 = fma(_568, _314, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _580 = fma(_564, _418, _554);
    float _582 = fma(_572, _382, _570);
    float _584 = fma(_574, _382, _576);
    float _586 = fma(_578, _382, _580);
    float _588 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].x, _582);
    float _590 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].y, _584);
    float _592 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].z, _586);
    bool _594 = !_286;
    float _612;
    if (!_594)
    {
        float _596 = in.m_65.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_124);
        float _618 = 1.0 / _616;
        float _620 = _158 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _626 = int(_624);
    float _628 = in.m_65.x;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _632 = _622 + _630;
    float _634 = in.m_65.y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _640 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _642 = int(_640);
    float _644 = in.m_71.x;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _650 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _652 = int(_650);
    float _654 = float(_626);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _672;
    float _676 = 1.0 / _654;
    float _678 = float(_642);
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _682 = int(_680);
    float _684 = float(uint(_652));
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _688 = ~_652;
    int _690 = _688 + 1;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _694 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _696 = isnan(_622);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _678;
    float _708 = _676 * _158;
    bool _710 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _712 = isnan(_622);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _724 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _726 = isnan(_622);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = float(uint(_682));
    float _738 = 1.0 / _684;
    int _740 = ~_682;
    int _742 = _740 + 1;
    float _744 = _706 * _158;
    float _746 = trunc(_708);
    int _748 = int(_746);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _756 = int(_754);
    int _758 = as_type<int>(_738) + (-2);
    float _760 = 1.0 / _736;
    float _762 = float(uint(_748));
    float _764 = trunc(_744);
    int _766 = int(_764);
    float _768 = float(_756);
    int _770 = as_type<int>(_760) + (-2);
    float _772 = as_type<float>(_758) * _762;
    float _774 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _776 = int(_774);
    float _778 = _762;
    float _780 = _772;
    float _782 = _768;
    bool _784 = _752;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_752)
    {
        _778 = 1.0;
    }
    float _788 = _778;
    float _790 = _788;
    if (!_752)
    {
        _790 = 7.345489978790283203125;
    }
    float _792 = _790;
    float _794 = float(uint(_766));
    float _796 = trunc(_772);
    float _798 = precise::max(_796, 0.0);
    uint _801 = uint(_798);
    float _803 = _792 * _628;
    float _805 = as_type<float>(_770) * _794;
    float _807 = in.m_65.z;
    float _809 = float(uint(_776));
    float _811 = trunc(_805);
    float _813 = precise::max(_811, 0.0);
    uint _815 = uint(_813);
    float _817 = _809;
    float _819 = _803;
    if (_752)
    {
        _780 = _628;
    }
    float _821 = _780;
    int _823 = ~_776;
    int _825 = _823 + 1;
    int _827 = _690 * int(_801);
    int _829 = _827 + _748;
    float _831 = 1.0 / _768;
    float _833 = in.m_65.w;
    float _835 = float(uint(_829));
    float _837 = as_type<float>(_829);
    float _839 = _821;
    int _841 = int(_801);
    if (_752)
    {
        _837 = 1.0;
    }
    float _843 = _837;
    float _845 = 1.0 / _809;
    float _847 = _843;
    if (_752)
    {
        _782 = 1.0;
    }
    float _849 = _782;
    float _851 = as_type<float>(_758) * _835;
    float _853 = _849;
    if (!_752)
    {
        _853 = 1.2345600128173828125;
    }
    float _855 = _853;
    int _857 = _742 * int(_815);
    int _859 = _857 + _766;
    float _861 = as_type<float>(_859);
    if (!_752)
    {
        _839 = _807;
    }
    float _863 = _839;
    float _865 = _628 + _807;
    if (!_752)
    {
        _847 = 5.839270114898681640625;
    }
    float _867 = _847;
    float _869 = trunc(_851);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    int _875 = as_type<int>(_867);
    if (_752)
    {
        _817 = _628;
    }
    float _877 = _817;
    float _879 = _831 * _158;
    float _881 = _877;
    if (!_752)
    {
        _881 = _634;
    }
    float _883 = _881;
    float _885 = _863 * _867;
    float _887 = float(uint(_859));
    float _889 = _865 + (-1.0);
    bool _891 = _807 > 0.5;
    float _893 = _883 * _855;
    float _895 = floor(_885);
    float _897 = as_type<float>(_770) * _887;
    bool _899 = _833 > 0.5;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    int _907 = int(_801) + int(_873);
    float _909 = floor(_893);
    float _911 = float(_124);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = trunc(_879);
    int _919 = int(_917);
    float _921 = _833;
    if (!_905)
    {
        _861 = _644;
    }
    float _923 = _861;
    float _925 = -_895;
    float _927 = _885 + _925;
    float _929 = _923;
    if (_905)
    {
        bool _931 = _628 > 0.5;
        _784 = _931;
    }
    bool _933 = _784;
    if (!_905)
    {
        _921 = _923;
    }
    float _935 = _921;
    float _937 = _935;
    if (_905)
    {
        _929 = _644;
    }
    float _939 = _929;
    float _941 = floor(_803);
    int _943 = ~_652;
    int _945 = _943 + 1;
    float _947 = float(_682);
    float _949 = _939;
    if (_905)
    {
        float _951 = -_939;
        float _953 = _951 + 1.0;
        _875 = as_type<int>(_953);
    }
    int _955 = _875;
    float _957 = -_909;
    float _959 = _893 + _957;
    int _961 = ~_682;
    int _963 = _961 + 1;
    float _965 = trunc(_897);
    float _967 = precise::max(_965, 0.0);
    uint _969 = uint(_967);
    if (_905)
    {
        float _971 = _933 ? as_type<float>(_955) : _939;
        _937 = _971;
    }
    float _973 = _937;
    int _975 = _945 * _907;
    int _977 = _975 + _748;
    int _979 = as_type<int>(_845) + (-2);
    if (_915)
    {
        float _981 = -_939;
        float _983 = _981 + 1.0;
        _841 = as_type<int>(_983);
    }
    int _985 = _841;
    float _987 = float(uint(_919));
    float _989 = float(_652);
    float _991 = 1.0 / _911;
    float _993 = -_941;
    float _995 = _803 + _993;
    float _997 = float(_748);
    float _999 = float(_776);
    float _1001 = _995 * _989;
    bool _1003 = _997 >= _989;
    bool _1005 = isnan(_997);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(_989);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _989 * _158;
    int _1017 = int(_815) + int(_969);
    float _1019 = as_type<float>(_979) * _987;
    float _1021 = float(_766);
    float _1023 = 1.0 / _638;
    bool _1025 = uint(_977) >= uint(_652);
    if (!_915)
    {
        _819 = _939;
    }
    float _1027 = _819;
    float _1029 = _1015 * _991;
    float _1031 = _991 * _158;
    bool _1033 = _1021 >= _947;
    bool _1035 = isnan(_1021);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_947);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = trunc(_1019);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = float(_919);
    float _1053 = _947 * _959;
    float _1055 = _1027;
    if (_915)
    {
        float _1057 = _891 ? as_type<float>(_985) : _939;
        _1055 = _1057;
    }
    float _1059 = _1055;
    float _1061 = _947 * _1031;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1065 = _1063 != 0;
    float _1067 = trunc(_1013);
    int _1069 = int(_1067);
    bool _1071 = _1051 >= _999;
    bool _1073 = isnan(_1051);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_999);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _999 * _927;
    int _1085 = _963 * _1017;
    int _1087 = _1085 + _766;
    float _1089 = trunc(_1001);
    int _1091 = int(_1089);
    float _1093 = _999 * _1031;
    bool _1095 = uint(_1087) >= uint(_682);
    bool _1097 = !_1025;
    int _1099 = _1097 ? 0 : (-1);
    int _1101 = _825 * int(_1049);
    int _1103 = _1101 + _919;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1107 = _1105 != 0;
    float _1109 = trunc(_1053);
    int _1111 = int(_1109);
    bool _1113 = !_1095;
    int _1115 = _1113 ? 0 : (-1);
    float _1117 = float(uint(_1103));
    bool _1119 = !_1107;
    int _1121 = _1119 ? 0 : 1;
    int _1123 = ~_1017;
    int _1125 = _1123 + _1115;
    int _1127 = _1125 + 1;
    float _1129 = trunc(_1043);
    int _1131 = int(_1129);
    float _1133 = as_type<float>(_979) * _1117;
    int _1135 = abs(_1121);
    int _1137 = ~_907;
    int _1139 = _1137 + _1099;
    int _1141 = _1139 + 1;
    int _1143 = _682 * _1127;
    int _1145 = _1143 + _766;
    bool _1147 = !_1065;
    int _1149 = _1147 ? 0 : 1;
    int _1151 = _1091 * _1135;
    int _1153 = _1151 + _748;
    float _1155 = trunc(_1133);
    float _1157 = precise::max(_1155, 0.0);
    uint _1159 = uint(_1157);
    int _1161 = abs(_1149);
    int _1163 = _652 * _1141;
    int _1165 = _1163 + _748;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1169 = _1167 != 0;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1177 = _1175 != 0;
    float _1179 = in.m_71.y;
    bool _1181 = _652 == 0;
    int _1183 = _1111 * _1161;
    int _1185 = _1183 + _766;
    bool _1187 = _682 == 0;
    float _1189 = trunc(_1029);
    int _1191 = int(_1189);
    int _1193 = ~_1069;
    int _1195 = _1193 + 1;
    int _1197 = _1195 + 1;
    bool _1199 = !_1181;
    int _1201 = _1199 ? _1165 : (-1);
    bool _1203 = !_1173;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = ~_1131;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    int _1213 = _1201 * _1197;
    bool _1215 = !_1187;
    int _1217 = _1215 ? _1145 : (-1);
    float _1219 = trunc(_1081);
    int _1221 = int(_1219);
    int _1223 = abs(_1205);
    int _1225 = _682 + (-1);
    int _1227 = _1211 * _1217;
    int _1229 = int(_1049) + int(_1159);
    int _1231 = _652 + (-1);
    int _1233 = _1131 * _1225;
    int _1235 = _1233 + _1227;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1239 = _1237 != 0;
    float _1241 = trunc(_1083);
    int _1243 = int(_1241);
    bool _1245 = !_1169;
    int _1247 = _1245 ? 0 : 1;
    int _1249 = _1069 * _1231;
    int _1251 = _1249 + _1213;
    bool _1253 = !_1239;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = -_1179;
    float _1259 = _1257 + 1.0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1267 = _1265 != 0;
    int _1269 = _1251 * _1223;
    bool _1271 = !_1177;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = 1.0 / _648;
    int _1277 = abs(_1247);
    bool _1279 = !_1267;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = ~_776;
    int _1285 = _1283 + 1;
    int _1287 = _1191 * _1277;
    int _1289 = _1287 + _1269;
    int _1291 = abs(_1281);
    int _1293 = abs(_1273);
    int _1295 = _1285 * _1229;
    int _1297 = _1295 + _919;
    bool _1299 = _634 > 0.5;
    float _1301 = trunc(_1061);
    int _1303 = int(_1301);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1307 = _1305 != 0;
    int _1309 = _1235 * _1291;
    int _1311 = _899 ? as_type<int>(_1259) : as_type<int>(_1179);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1319 = _1317 != 0;
    int _1321 = _1153 * _1293;
    int _1323 = _1321 + _1289;
    int _1325 = abs(_1255);
    int _1327 = _1299 ? as_type<int>(_1259) : as_type<int>(_1179);
    bool _1329 = !_1263;
    int _1331 = _1329 ? 0 : 1;
    int _1333 = _1091 * _1325;
    int _1335 = _1333 + _1323;
    bool _1337 = uint(_1297) >= uint(_776);
    float _1339 = _1307 ? as_type<float>(_1327) : _1179;
    bool _1341 = !_1319;
    int _1343 = _1341 ? 0 : 1;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1347 = _1345 != 0;
    bool _1349 = !_1337;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = abs(_1331);
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1357 = _1355 != 0;
    int _1359 = abs(_1343);
    int _1361 = _1303 * _1353;
    int _1363 = _1361 + _1309;
    bool _1365 = !_1315;
    int _1367 = _1365 ? 0 : 1;
    bool _1369 = !_1347;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1229;
    int _1375 = _1373 + _1351;
    int _1377 = _1375 + 1;
    float _1379 = float(uint(_1335));
    float _1381 = _1357 ? as_type<float>(_1311) : _1179;
    int _1383 = abs(_1367);
    float _1385 = as_type<float>(_758) * _1379;
    int _1387 = abs(_1371);
    int _1389 = _776 * _1377;
    int _1391 = _1389 + _919;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1395 = _1393 != 0;
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1399 = _1397 != 0;
    int _1401 = _1185 * _1383;
    int _1403 = _1401 + _1363;
    bool _1405 = _776 == 0;
    int _1407 = _1243 * _1387;
    int _1409 = _1407 + _919;
    float _1411 = trunc(_1385);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    int _1417 = ~_1221;
    int _1419 = _1417 + 1;
    int _1421 = _1419 + 1;
    bool _1423 = !_1405;
    int _1425 = _1423 ? _1391 : (-1);
    int _1427 = _1111 * _1359;
    int _1429 = _1427 + _1403;
    int _1431 = _776 + (-1);
    int _1433 = ~_652;
    int _1435 = _1433 + 1;
    int _1437 = _1421 * _1425;
    bool _1439 = !_1399;
    int _1441 = _1439 ? 0 : 1;
    float _1443 = trunc(_1093);
    int _1445 = int(_1443);
    bool _1447 = !_1395;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1221 * _1431;
    int _1453 = _1451 + _1437;
    int _1455 = abs(_1441);
    float _1457 = float(uint(_1429));
    int _1459 = _1435 * int(_1415);
    int _1461 = _1459 + _1335;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1465 = _1463 != 0;
    int _1467 = _1453 * _1455;
    int _1469 = abs(_1449);
    float _1471 = as_type<float>(_770) * _1457;
    bool _1473 = !_1465;
    int _1475 = _1473 ? 0 : 1;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1479 = _1477 != 0;
    float _1481 = float(uint(_1461));
    float _1483 = trunc(_1471);
    float _1485 = precise::max(_1483, 0.0);
    uint _1487 = uint(_1485);
    bool _1489 = !_1479;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1445 * _1469;
    int _1495 = _1493 + _1467;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1499 = _1497 != 0;
    float _1501 = as_type<float>(_758) * _1481;
    float _1503 = float(uint(_1153));
    int _1505 = abs(_1475);
    int _1507 = abs(_1491);
    float _1509 = as_type<float>(_758) * _1503;
    float _1511 = trunc(_1501);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = _1409 * _1505;
    int _1519 = _1517 + _1495;
    int _1521 = ~_682;
    int _1523 = _1521 + 1;
    bool _1525 = _807 > 0.5;
    int _1527 = _1243 * _1507;
    int _1529 = _1527 + _1519;
    int _1531 = ~_652;
    int _1533 = _1531 + 1;
    float _1535 = trunc(_1509);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    float _1541 = _1179;
    int _1543 = _1533;
    if (_1499)
    {
        float _1545 = _1525 ? _1259 : _1179;
        _1541 = _1545;
    }
    float _1547 = _1541;
    int _1549 = _1523 * int(_1487);
    int _1551 = _1549 + _1429;
    float _1553 = float(uint(_1529));
    int _1555 = ~_776;
    int _1557 = _1555 + 1;
    float _1559 = float(uint(_1551));
    float _1561 = as_type<float>(_979) * _1553;
    int _1563 = int(_1415) + int(_1515);
    float _1565 = as_type<float>(_770) * _1559;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1569 = _1567 != 0;
    float _1571 = trunc(_1561);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    bool _1577 = _652 == 0;
    int _1579 = _1533 * int(_1539);
    int _1581 = _1579 + _1153;
    bool _1583 = _682 == 0;
    float _1585 = float(uint(_1581));
    float _1587 = trunc(_1565);
    float _1589 = precise::max(_1587, 0.0);
    uint _1591 = uint(_1589);
    int _1593 = _1533 * _1563;
    int _1595 = _1593 + _1335;
    float _1597 = as_type<float>(_758) * _1585;
    if (_1569)
    {
        float _1599 = -_939;
        float _1601 = _1599 + 1.0;
        _1543 = as_type<int>(_1601);
    }
    int _1603 = _1543;
    bool _1605 = uint(_1595) >= uint(_652);
    float _1607 = float(uint(_1185));
    float _1609 = trunc(_1597);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    bool _1615 = !_1605;
    int _1617 = _1615 ? 0 : (-1);
    if (_1569)
    {
        float _1619 = _1299 ? as_type<float>(_1603) : _939;
        _949 = _1619;
    }
    float _1621 = _949;
    int _1623 = ~_1563;
    int _1625 = _1623 + _1617;
    int _1627 = _1625 + 1;
    int _1629 = int(_1487) + int(_1591);
    float _1631 = as_type<float>(_770) * _1607;
    int _1633 = _1557 * int(_1575);
    int _1635 = _1633 + _1529;
    int _1637 = ~_682;
    int _1639 = _1637 + 1;
    int _1641 = _652 * _1627;
    int _1643 = _1641 + _1335;
    float _1645 = trunc(_1631);
    float _1647 = precise::max(_1645, 0.0);
    uint _1649 = uint(_1647);
    int _1651 = ~_682;
    int _1653 = _1651 + 1;
    float _1655 = float(uint(_1635));
    bool _1657 = !_1577;
    int _1659 = _1657 ? _1643 : (-1);
    float _1661 = as_type<float>(_979) * _1655;
    float _1663 = float(uint(_1409));
    int _1665 = int(_1539) + int(_1613);
    int _1667 = _1653 * _1629;
    int _1669 = _1667 + _1429;
    float _1671 = as_type<float>(_979) * _1663;
    int _1673 = _1659 & 3;
    bool _1675 = _1673 != 0;
    float _1677 = trunc(_1661);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    int _1683 = _1659 & 3;
    bool _1685 = _1683 != 0;
    int _1687 = _1639 * int(_1649);
    int _1689 = _1687 + _1185;
    bool _1691 = uint(_1673) > 1u;
    int _1693 = _1685 ? 0 : 1;
    bool _1695 = uint(_1669) >= uint(_682);
    float _1697 = trunc(_1671);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    float _1703 = float(uint(_1689));
    bool _1705 = !_1695;
    int _1707 = _1705 ? 0 : (-1);
    int _1709 = ~_776;
    int _1711 = _1709 + 1;
    float _1713 = as_type<float>(_770) * _1703;
    int _1715 = ~_1629;
    int _1717 = _1715 + _1707;
    int _1719 = _1717 + 1;
    bool _1721 = _1673 != 3;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = _682 * _1719;
    int _1731 = _1729 + _1429;
    float _1733 = trunc(_1713);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    int _1739 = _1727;
    if (!_1691)
    {
        int _1741 = ~_1693;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = _1435 * _1665;
    int _1749 = _1747 + _1153;
    bool _1751 = uint(_1673) >= 2u;
    int _1753 = _1711 * int(_1701);
    int _1755 = _1753 + _1409;
    int _1757 = int(_1575) + int(_1681);
    int _1759 = _1751 ? 0 : 1;
    bool _1761 = !_1583;
    int _1763 = _1761 ? _1731 : (-1);
    bool _1765 = uint(_1749) >= uint(_652);
    int _1767 = ~_1759;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = float(uint(_1755));
    int _1775 = _1711 * _1757;
    int _1777 = _1775 + _1529;
    int _1779 = _1771;
    if (_1721)
    {
        int _1781 = ~_1759;
        int _1783 = _1781 + 1;
        _1779 = _1783;
    }
    int _1785 = _1779;
    int _1787 = _1763 & 3;
    bool _1789 = _1787 != 0;
    float _1791 = as_type<float>(_979) * _1773;
    int _1793 = ~_682;
    int _1795 = _1793 + 1;
    int _1797 = _1789 ? 0 : 1;
    bool _1799 = uint(_1777) >= uint(_776);
    float _1801 = trunc(_1791);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    int _1807 = int(_1649) + int(_1737);
    bool _1809 = !_1799;
    int _1811 = _1809 ? 0 : (-1);
    bool _1813 = uint(_1787) > 1u;
    bool _1815 = !_1765;
    int _1817 = _1815 ? 0 : (-1);
    bool _1819 = uint(_1787) >= 2u;
    int _1821 = ~_1757;
    int _1823 = _1821 + _1811;
    int _1825 = _1823 + 1;
    int _1827 = _1795 * _1807;
    int _1829 = _1827 + _1185;
    int _1831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1833 = _1831 != 0;
    int _1835 = _1819 ? 0 : 1;
    int _1837 = _776 * _1825;
    int _1839 = _1837 + _1529;
    bool _1841 = _1787 != 3;
    float _1843 = _628 * 2.0;
    int _1845 = ~_1797;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    float _1851 = _634 * 2.0;
    int _1853 = _1849;
    if (!_1813)
    {
        int _1855 = ~_1797;
        int _1857 = _1855 + 1;
        _1853 = _1857;
    }
    int _1859 = _1853;
    bool _1861 = uint(_1829) >= uint(_682);
    float _1863 = floor(_1843);
    bool _1865 = !_1405;
    int _1867 = _1865 ? _1839 : (-1);
    bool _1869 = !_1861;
    int _1871 = _1869 ? 0 : (-1);
    bool _1873 = !_1675;
    int _1875 = _1873 ? 0 : 1;
    int _1877 = _1763 & 3;
    bool _1879 = _1877 != 0;
    float _1881 = floor(_1851);
    if (_1833)
    {
        _786 = 0;
    }
    int _1883 = _786;
    int _1885 = _1867 & 3;
    bool _1887 = _1885 != 0;
    int _1889 = _1883;
    if (!_1833)
    {
        _1889 = 1;
    }
    int _1891 = _1889;
    int _1893 = int(_1701) + int(_1805);
    int _1895 = ~_1835;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    bool _1901 = !_1879;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1899;
    int _1907 = _1891;
    if (_1841)
    {
        int _1909 = ~_1835;
        int _1911 = _1909 + 1;
        _1905 = _1911;
    }
    int _1913 = _1905;
    bool _1915 = _1885 != 3;
    bool _1917 = _1891 != 1;
    if (_1833)
    {
        _1907 = 0;
    }
    int _1919 = _1907;
    int _1921 = _1919;
    if (!_1833)
    {
        _1921 = 2;
    }
    int _1923 = _1921;
    int _1925 = ~_776;
    int _1927 = _1925 + 1;
    bool _1929 = uint(_1885) >= 2u;
    bool _1931 = uint(_1885) > 1u;
    int _1933 = _1887 ? 0 : 1;
    int _1935 = _1929 ? 0 : 1;
    bool _1937 = _1923 != 2;
    int _1939 = _1927 * _1893;
    int _1941 = _1939 + _1409;
    int _1943 = ~_1935;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    int _1949 = _1947;
    float _1951 = as_type<float>(_1927);
    if (_1915)
    {
        int _1953 = ~_1935;
        int _1955 = _1953 + 1;
        _1949 = _1955;
    }
    int _1957 = _1949;
    bool _1959 = uint(_1941) >= uint(_776);
    float _1961 = 0.0;
    if (!_1917)
    {
        _1961 = _634;
    }
    float _1963 = _1961;
    int _1965 = ~_1933;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1969;
    float _1973 = _1963;
    if (!_1931)
    {
        int _1975 = ~_1933;
        int _1977 = _1975 + 1;
        _1971 = _1977;
    }
    int _1979 = _1971;
    bool _1981 = !_1959;
    int _1983 = _1981 ? 0 : (-1);
    float _1985 = 0.0;
    if (!_1917)
    {
        _1985 = _1963;
    }
    float _1987 = _1985;
    bool _1989 = _1863 > 0.0;
    bool _1991 = _1863 >= 0.0;
    bool _1993 = isnan(_1863);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.0);
    bool _1999 = _1995 || _1997;
    float _2001 = _1987;
    if (_1917)
    {
        _1973 = _634;
    }
    float _2003 = _1973;
    float _2005 = in.m_73.x;
    float _2007 = in.m_73.y;
    float _2009 = in.m_73.z;
    float _2011 = _2003;
    if (!_1917)
    {
        _1951 = _1987;
    }
    float _2013 = _1951;
    float _2015 = 0.0;
    float _2017 = _2013;
    if (!_1917)
    {
        _2015 = _807;
    }
    float _2019 = _2015;
    float _2021 = 0.0;
    float _2023 = _2019;
    if (!_1917)
    {
        _2021 = _807;
    }
    float _2025 = _2021;
    float _2027 = _2025;
    if (_1917)
    {
        _2017 = _628;
    }
    float _2029 = _2017;
    if (_1917)
    {
        _2001 = _628;
    }
    float _2031 = _2001;
    if (_1917)
    {
        _2023 = _2003;
    }
    float _2033 = _2023;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1917)
    {
        _2027 = _2003;
    }
    float _2037 = _2027;
    bool _2039 = _1881 > 0.0;
    float _2041 = -_686;
    float _2043 = fma(_2035, 2.0, _2041);
    int _2045 = _1999 ? 0 : 1;
    float _2047 = 0.0;
    if (_1937)
    {
        _2047 = _628;
    }
    float _2049 = _2047;
    float _2051 = _2049;
    if (!_1937)
    {
        _2051 = _807;
    }
    float _2053 = _2051;
    if (!_1937)
    {
        _2011 = _628;
    }
    float _2055 = _2011;
    float _2057 = _592 * _2009;
    bool _2059 = _1881 >= 0.0;
    bool _2061 = isnan(_1881);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan(0.0);
    bool _2067 = _2063 || _2065;
    float _2069 = _588 * _2005;
    int _2071 = _1867 & 3;
    bool _2073 = _2071 != 0;
    float _2075 = _634 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2077 = ~_2045;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2085 = _2081;
    if (!_1989)
    {
        int _2087 = ~_2045;
        int _2089 = _2087 + 1;
        _2085 = _2089;
    }
    int _2091 = _2085;
    float _2093 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _2095 = !_2073;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = fma(_2083, -2.0, _722);
    bool _2101 = _1673 != 3;
    float _2103 = _2069 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2105 = _2067 ? 0 : 1;
    float _2107 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2099);
    bool _2109 = _1787 != 3;
    bool _2111 = _1885 != 3;
    float _2113 = _590 * _2007;
    bool _2115 = !_2101;
    int _2117 = _2115 ? 0 : (-1);
    int _2119 = ~_2105;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    bool _2125 = !_2109;
    int _2127 = _2125 ? 0 : (-1);
    bool _2129 = !_2111;
    int _2131 = _2129 ? 0 : (-1);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2143 = _2141 != 0;
    int _2145 = _2123;
    if (!_2039)
    {
        int _2147 = ~_2105;
        int _2149 = _2147 + 1;
        _2145 = _2149;
    }
    int _2151 = _2145;
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2155 = _2153 != 0;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2159 = _2157 != 0;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2163 = _2161 != 0;
    float _2165 = in.m_58.x;
    float _2167 = in.m_58.y;
    float _2169 = in.m_58.z;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2177 = _2175 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2179 = !_2135;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2185 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2187 = 1.0 / _2177;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2191 = !_2139;
    int _2193 = _2191 ? 0 : 1;
    float _2195 = fma(_2075, -2.0, _2189);
    bool _2197 = !_2143;
    int _2199 = _2197 ? 0 : 1;
    float _2201 = 1.0 / _2173;
    float _2203 = -_2183;
    float _2205 = fma(_2185, 2.0, _2203);
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2209 = _2207 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2211 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2213 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2215 = abs(_2193);
    float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2219 = _2217 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2221 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2229 = _2227 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2231 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2213);
    float _2233 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2221);
    float _2235 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2211);
    float _2237 = 1.0 / _2209;
    float _2239 = _2225 * _1023;
    float _2241 = _2229 * _1275;
    float _2243 = _662 * _2201;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2247 = _2245 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2249 = _658 * _2187;
    float _2251 = _628 + _634;
    float _2253 = _807 * 2.0;
    float _2255 = 1.0 / _2219;
    float _2257 = in.m_75.x;
    float _2259 = in.m_75.y;
    float _2261 = in.m_75.z;
    float _2263 = _2251 + (-1.0);
    float _2265 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2233);
    float _2267 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2235);
    float _2269 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2231);
    float _2271 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2273 = _622 + _2271;
    float _2275 = 1.0 / _2247;
    float _2277 = _666 * _2237;
    float _2279 = fma(_2243, _2273, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2281 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2285 = _670 * _2255;
    float _2287 = _634 + _807;
    float _2289 = floor(_2253);
    float _2291 = -_2283;
    float _2293 = fma(_2281, 2.0, _2291);
    float _2295 = _2287 + (-1.0);
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2299 = _674 * _2275;
    float _2301 = fma(_2263, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2303 = fma(_2295, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2259);
    float _2307 = _2113 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2309 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2297);
    float _2311 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2313 = -_704;
    float _2315 = _2313 + 1.0;
    float _2317 = _2305 * _2307;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2321 = _622 + _2319;
    float _2323 = fma(_2311, -2.0, _692);
    bool _2325 = _2289 >= 0.0;
    bool _2327 = isnan(_2289);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(0.0);
    bool _2333 = _2329 || _2331;
    float _2335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2261);
    float _2337 = fma(_2239, _2321, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2341 = _622 + _2339;
    int _2343 = _2333 ? 0 : 1;
    float _2345 = _2335 * _2093;
    bool _2347 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2349 = isnan(_622);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2355 = _2351 || _2353;
    float _2357 = float(_2355);
    float _2359 = fma(_2249, _2341, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2361 = _2289 > 0.0;
    float _2363 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2365 = log2(_2363);
    float _2367 = _2357 * _2315;
    float _2369 = -_2357;
    float _2371 = _2369 + 1.0;
    int _2373 = ~_2343;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2383 = _622 + _2381;
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2387 = 1.0 + _2385;
    float _2389 = _720 * _2371;
    float _2391 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2379);
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2395 = _2377;
    float _2397 = _2337;
    float _2399 = as_type<float>(_2215);
    float _2401 = as_type<float>(_2151);
    if (!_2361)
    {
        int _2403 = ~_2343;
        int _2405 = _2403 + 1;
        _2395 = _2405;
    }
    int _2407 = _2395;
    float _2409 = 1.0 / _2387;
    bool _2411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2419 = _2415 || _2417;
    float _2421 = _2365 * _158;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2425 = fma(_2241, _2383, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2429 = _622 + _2427;
    float _2431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2257);
    float _2433 = exp2(_2421);
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2437 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2439 = isnan(_622);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2393);
    float _2451 = fma(_2277, _2429, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2453 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2435);
    float _2455 = -_720;
    float _2457 = _2455 + 1.0;
    float _2459 = _2431 * _2103;
    float _2461 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2309);
    float _2463 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2453);
    float _2465 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2449);
    float _2467 = -_158;
    float _2469 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2293);
    float _2471 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2391);
    float _2473 = -_158;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2043);
    float _2477 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2323);
    float _2479 = _2447 * _2457;
    float _2481 = -_2433;
    float _2483 = _2481 + 1.0;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2487 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2195);
    bool _2489 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2491 = isnan(_622);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    float _2501 = _2419 ? _2483 : 0.0;
    float _2503 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2485);
    bool _2505 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2507 = isnan(1.0);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2513 = _2509 || _2511;
    float _2515 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2423);
    float _2517 = -_158;
    float _2519 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2205);
    float _2521 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2503);
    float _2523 = -_2447;
    float _2525 = _2523 + 1.0;
    float _2527 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2515);
    bool _2529 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2531 = isnan(_622);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2537 = _2533 || _2535;
    float _2539 = float(_2537);
    float _2541 = -_2499;
    float _2543 = _2541 + 1.0;
    bool _2545 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2547 = isnan(_622);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = _634 + (-0.5);
    float _2559 = float(_2407);
    float _2561 = _2539 * _2525;
    float _2563 = -_2539;
    float _2565 = _2563 + 1.0;
    float _2567 = _2557;
    if (_2513)
    {
        float _2569 = _2501 * _2409;
        _162 = _2569;
    }
    float _2571 = _162;
    bool _2573 = _2259 != 0.0;
    bool _2575 = isnan(_2259);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(0.0);
    bool _2581 = _2577 || _2579;
    float _2583 = in.m_77.x;
    float _2585 = in.m_77.y;
    float _2587 = in.m_77.z;
    float _2589 = _2499 * _2565;
    int _2591 = abs(_2181);
    float _2593 = _2555 * _2543;
    bool _2595 = _2257 == 0.0;
    bool _2597 = !_2581;
    bool _2599 = _2595 && _2597;
    float _2601 = in.m_79.x;
    float _2603 = in.m_79.y;
    float _2605 = in.m_79.z;
    float _2607 = -_2555;
    float _2609 = _2607 + 1.0;
    float _2611 = float(_2591);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2615 = _622 + _2613;
    bool _2617 = _2261 == 0.0;
    bool _2619 = _2617 && _2599;
    float _2621 = _734 * _2609;
    float _2623 = fma(_2285, _632, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2625 = float(_2091);
    float _2627 = _2611 * _2559;
    float _2629 = _2337 * _2621;
    float _2631 = float(_2215);
    float _2633 = -_734;
    float _2635 = _2633 + 1.0;
    float _2637 = _2627 * (-2.0);
    float _2639 = float(_2151);
    float _2641 = fma(_2299, _2615, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2643 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2629);
    int _2645 = ~_1807;
    int _2647 = _2645 + _1871;
    int _2649 = _2647 + 1;
    int _2651 = ~_1893;
    int _2653 = _2651 + _1983;
    int _2655 = _2653 + 1;
    float _2657 = fma(_2425, _2593, _2643);
    if (_2619)
    {
        _2397 = _2583;
    }
    float _2659 = _2397;
    int _2661 = _682 * _2649;
    int _2663 = _2661 + _1185;
    int _2665 = abs(_1875);
    float _2667 = fma(_2359, _2589, _2657);
    float _2669 = _2659;
    if (_2619)
    {
        _2399 = _2659;
    }
    float _2671 = _2399;
    float _2673 = _807 + (-0.5);
    float _2675 = _2671;
    if (!_2619)
    {
        _2669 = _2583;
    }
    float _2677 = _2669;
    float _2679 = _2631 * _2625;
    float _2681 = _2267 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2683 = fma(_2301, _2637, _2301);
    float _2685 = fma(_2637, _2601, _2601);
    float _2687 = _2265 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2689 = -_2681;
    float _2691 = _2689 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _628 + (-0.5);
    float _2695 = _2269 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2697 = -_2687;
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2701 = _2691 * _2691;
    float _2703 = fma(_2693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2685);
    int _2705 = abs(_2199);
    float _2707 = -_2695;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2711 = fma(_2699, _2699, _2701);
    float _2713 = fma(_2683, _2571, _2703);
    float _2715 = fma(_2279, _2561, _2667);
    float _2717 = fma(_2709, _2709, _2711);
    float _2719 = as_type<float>(_2705);
    if (_2619)
    {
        _2719 = _2585;
    }
    float _2721 = _2719;
    float _2723 = _2679 * (-2.0);
    float _2725 = float(_2705);
    float _2727 = _2713 * 0.15915493667125701904296875;
    float _2729 = _2721;
    float _2731 = _2725;
    if (_2619)
    {
        _2401 = _2721;
    }
    float _2733 = _2401;
    float _2735 = rsqrt(_2717);
    float _2737 = _2733;
    if (!_2619)
    {
        _2729 = _2585;
    }
    float _2739 = _2729;
    float _2741 = fma(_2723, _2603, _2603);
    float _2743 = _2725 * _2639;
    float _2745 = fma(_2303, _2723, _2303);
    if (_2619)
    {
        _2731 = _2587;
    }
    float _2747 = _2731;
    float _2749 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2741);
    float _2751 = _2743 * (-2.0);
    float _2753 = _2727 * 6.283185482025146484375;
    float _2755 = sin(_2753);
    float _2757 = _2747;
    if (_2619)
    {
        _2567 = _2747;
    }
    float _2759 = _2567;
    float _2761 = fma(_2745, _2571, _2749);
    float _2763 = fma(_2751, _2605, _2605);
    float _2765 = fma(_901, _2751, _901);
    float _2767 = _2759;
    if (!_2619)
    {
        _2757 = _2587;
    }
    float _2769 = _2757;
    float _2771 = _2761 * 0.15915493667125701904296875;
    float _2773 = fma(_2673, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2763);
    float _2775 = _2699 * _2735;
    float _2777 = _2709 * _2735;
    float _2779 = in.m_81.x;
    float _2781 = in.m_81.y;
    float _2783 = in.m_81.z;
    float _2785 = in.m_81.w;
    float _2787 = _2691 * _2735;
    float _2789 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2791 = _2775 * _2789;
    float _2793 = fma(_2765, _2571, _2773);
    float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2797 = _2777 * _2795;
    float _2799 = _2727 * 6.283185482025146484375;
    float _2801 = cos(_2799);
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2805 = -_2791;
    float _2807 = fma(_2777, _2803, _2805);
    float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2811 = _2787 * _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2815 = -_2797;
    float _2817 = fma(_2787, _2813, _2815);
    if (!_2619)
    {
        float _2819 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2677);
        _2675 = _2819;
    }
    float _2821 = _2675;
    float _2823 = fma(_2451, _2479, _2715);
    float _2825 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2827 = -_2811;
    float _2829 = fma(_2775, _2825, _2827);
    float _2831 = _2793 * 0.15915493667125701904296875;
    float _2833 = _2771 * 6.283185482025146484375;
    float _2835 = sin(_2833);
    float _2837 = _2807 * _2807;
    float _2839 = fma(_2623, _2389, _2823);
    if (!_2619)
    {
        float _2841 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2739);
        _2737 = _2841;
    }
    float _2843 = _2737;
    if (!_2619)
    {
        float _2845 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2769);
        _2767 = _2845;
    }
    float _2847 = _2767;
    float _2849 = fma(_2817, _2817, _2837);
    float _2851 = fma(_2641, _2367, _2839);
    int _2853 = _776 * _2655;
    int _2855 = _2853 + _1409;
    float _2857 = _2771 * 6.283185482025146484375;
    float _2859 = cos(_2857);
    float _2861 = fma(_2829, _2829, _2849);
    int _2863 = abs(_2131);
    float _2865 = _2781 * _2769;
    float _2867 = _2783 * _2677;
    float _2869 = _2779 * _2739;
    bool _2871 = _652 == 0;
    float _2873 = _2831 * 6.283185482025146484375;
    float _2875 = cos(_2873);
    float _2877 = -_2865;
    float _2879 = fma(_2783, _2739, _2877);
    float _2881 = -_2867;
    float _2883 = fma(_2779, _2769, _2881);
    float _2885 = -_2869;
    float _2887 = fma(_2781, _2677, _2885);
    float _2889 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2851);
    float _2891 = _2879 * _2785;
    float _2893 = _2883 * _2785;
    float _2895 = _2887 * _2785;
    float _2897 = _2831 * 6.283185482025146484375;
    float _2899 = sin(_2897);
    out.m_83.x = _2889;
    float _2901 = _2801 * _2859;
    float _2903 = _2755 * _2835;
    float _2905 = _2801 * _2835;
    float _2907 = _2755 * _2859;
    bool _2909 = _682 == 0;
    float _2911 = rsqrt(_2861);
    float _2913 = _2859 * _2875;
    float _2915 = _2801 * _2875;
    float _2917 = _2755 * _2875;
    int _2919 = _1763 >> 31;
    float _2921 = _2835 * _2875;
    int _2923 = _1867 >> 31;
    float _2925 = -_2317;
    float _2927 = _2899 * _2925;
    float _2929 = -_2905;
    float _2931 = fma(_2899, _2907, _2929);
    int _2933 = _2919 & 3;
    float _2935 = -_2907;
    float _2937 = fma(_2899, _2905, _2935);
    int _2939 = _2923 & 3;
    int _2941 = _1763 + _2933;
    float _2943 = _2817 * _2911;
    float _2945 = _2807 * _2911;
    float _2947 = _2829 * _2911;
    float _2949 = fma(_2899, _2901, _2903);
    float _2951 = fma(_2899, _2903, _2901);
    float _2953 = fma(_2913, _2459, _2927);
    float _2955 = _2915 * _2317;
    int _2957 = _1659 >> 31;
    float _2959 = _2917 * _2317;
    float _2961 = fma(_2921, _2345, _2953);
    float _2963 = fma(_2949, _2459, _2955);
    int _2965 = _2957 & 3;
    float _2967 = fma(_2931, _2459, _2959);
    int _2969 = _1867 + _2939;
    float _2971 = fma(_2937, _2345, _2963);
    int _2973 = _1659 + _2965;
    float _2975 = fma(_2951, _2345, _2967);
    int _2977 = _2941 >> 2;
    float _2979 = _2777 * _2945;
    int _2981 = _2973 >> 2;
    float _2983 = _2775 * _2947;
    int _2985 = _2977 << 4;
    int _2987 = _2985 + 512;
    float _2989 = _2787 * _2943;
    int _2991 = _2981 << 4;
    int _2993 = _2991 + 368;
    float _2995 = -_2983;
    float _2997 = fma(_2777, _2943, _2995);
    uint _2999 = uint(int(uint(_2987) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    int _3015 = _2969 >> 2;
    float _3017 = -_2989;
    float _3019 = fma(_2775, _2945, _3017);
    int _3021 = ~_1665;
    int _3023 = _3021 + _1817;
    int _3025 = _3023 + 1;
    float _3027 = -_2979;
    float _3029 = fma(_2787, _2947, _3027);
    int _3031 = _3015 << 4;
    int _3033 = _3031 + 656;
    float _3035 = _2949 * _2997;
    float _3037 = _2949 * _3019;
    uint _3039 = uint(int(uint(_2993) >> uint(2)));
    uint _3041 = uint(int(uint(int(_3039)) >> uint(2)));
    int _3043 = int(_3039) & 3;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[int(_3041)][_3043];
    int _3047 = int(_3039) + 1;
    uint _3049 = uint(int(uint(_3047) >> uint(2)));
    int _3051 = _3047 & 3;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[int(_3049)][_3051];
    float _3055 = _2949 * _3029;
    float _3057 = fma(_2913, _2945, _3035);
    float _3059 = _2915 * _3029;
    float _3061 = _2915 * _2997;
    float _3063 = fma(_2913, _2943, _3055);
    float _3065 = _2915 * _3019;
    float _3067 = fma(_2913, _2947, _3037);
    uint _3069 = uint(int(uint(_3033) >> uint(2)));
    uint _3071 = uint(int(uint(int(_3069)) >> uint(2)));
    int _3073 = int(_3069) & 3;
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[int(_3071)][_3073];
    int _3077 = int(_3069) + 1;
    uint _3079 = uint(int(uint(_3077) >> uint(2)));
    int _3081 = _3077 & 3;
    float _3083 = (*spvDescriptorSet0.vp_c9)._m0[int(_3079)][_3081];
    float _3085 = _2937 * _3029;
    float _3087 = _2937 * _2997;
    float _3089 = _2937 * _3019;
    float _3091 = -_2899;
    float _3093 = fma(_3091, _2943, _3059);
    float _3095 = -_2899;
    float _3097 = fma(_3095, _2945, _3061);
    float _3099 = -_2899;
    float _3101 = fma(_3099, _2947, _3065);
    float _3103 = fma(_2921, _2943, _3085);
    float _3105 = fma(_2921, _2945, _3087);
    float _3107 = fma(_2921, _2947, _3089);
    float _3109 = _3029 * _2971;
    float _3111 = _2997 * _2971;
    float _3113 = _3019 * _2971;
    int _3115 = abs(_1745);
    int _3117 = _2993 + 8;
    uint _3119 = uint(int(uint(_3117) >> uint(2)));
    uint _3121 = uint(int(uint(int(_3119)) >> uint(2)));
    int _3123 = int(_3119) & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    int _3127 = int(_3119) + 1;
    uint _3129 = uint(int(uint(_3127) >> uint(2)));
    int _3131 = _3127 & 3;
    float _3133 = (*spvDescriptorSet0.vp_c9)._m0[int(_3129)][_3131];
    int _3135 = abs(_1859);
    int _3137 = _652 * _3025;
    int _3139 = _3137 + _1153;
    int _3141 = abs(_1979);
    float _3143 = fma(_2943, _2961, _3109);
    float _3145 = fma(_2945, _2961, _3111);
    int _3147 = _2987 + 8;
    uint _3149 = uint(int(uint(_3147) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    int _3165 = ~_3115;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = fma(_2947, _2961, _3113);
    int _3173 = ~_3135;
    int _3175 = _3173 + 1;
    int _3177 = _3175 + 1;
    float _3179 = fma(_2917, _2777, _3101);
    float _3181 = fma(_2931, _2775, _3063);
    bool _3183 = !_2909;
    int _3185 = _3183 ? _2663 : (-1);
    int _3187 = _3033 + 8;
    uint _3189 = uint(int(uint(_3187) >> uint(2)));
    uint _3191 = uint(int(uint(int(_3189)) >> uint(2)));
    int _3193 = int(_3189) & 3;
    float _3195 = (*spvDescriptorSet0.vp_c9)._m0[int(_3191)][_3193];
    int _3197 = int(_3189) + 1;
    uint _3199 = uint(int(uint(_3197) >> uint(2)));
    int _3201 = _3197 & 3;
    float _3203 = (*spvDescriptorSet0.vp_c9)._m0[int(_3199)][_3201];
    int _3205 = ~_3141;
    int _3207 = _3205 + 1;
    int _3209 = _3207 + 1;
    int _3211 = _3177 * as_type<int>(_3013);
    int _3213 = abs(_2097);
    float _3215 = fma(_2917, _2775, _3093);
    int _3217 = abs(_1785);
    float _3219 = fma(_2931, _2787, _3057);
    bool _3221 = !_1405;
    int _3223 = _3221 ? _2855 : (-1);
    float _3225 = fma(_2777, _2975, _3171);
    int _3227 = ~_3217;
    int _3229 = _3227 + 1;
    int _3231 = _3229 + 1;
    int _3233 = _3169 * as_type<int>(_3053);
    int _3235 = abs(_1903);
    float _3237 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3239 = int(_3237);
    int _3241 = ~_3235;
    int _3243 = _3241 + 1;
    int _3245 = _3243 + 1;
    int _3247 = _3209 * as_type<int>(_3083);
    int _3249 = ~_3213;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    float _3255 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3257 = int(_3255);
    int _3259 = ~_2665;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    int _3265 = _3245 * as_type<int>(_3005);
    int _3267 = _3265 + _3211;
    int _3269 = abs(_2117);
    int _3271 = _3253 * as_type<int>(_3075);
    int _3273 = _3271 + _3247;
    int _3275 = abs(_1913);
    int _3277 = _3263 * as_type<int>(_3045);
    int _3279 = _3277 + _3233;
    int _3281 = abs(_2127);
    float _3283 = _2695 + _3225;
    int _3285 = ~_3275;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    float _3291 = _2893 * _3215;
    int _3293 = ~_3281;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    int _3299 = _3231 * as_type<int>(_3125);
    int _3301 = _3299 + _3279;
    int _3303 = abs(_1957);
    float _3305 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3307 = int(_3305);
    float _3309 = float(uint(_3239));
    int _3311 = ~_3303;
    int _3313 = _3311 + 1;
    int _3315 = _3313 + 1;
    int _3317 = ~_3269;
    int _3319 = _3317 + 1;
    int _3321 = _3319 + 1;
    int _3323 = _3289 * as_type<int>(_3155);
    int _3325 = _3323 + _3267;
    bool _3327 = !_2871;
    int _3329 = _3327 ? _3139 : (-1);
    float _3331 = 1.0 / _3309;
    int _3333 = ~_3239;
    int _3335 = _3333 + 1;
    int _3337 = _3297 * as_type<int>(_3163);
    int _3339 = _3337 + _3325;
    bool _3341 = !_2155;
    int _3343 = _3341 ? 0 : 1;
    int _3345 = _3321 * as_type<int>(_3133);
    int _3347 = _3345 + _3301;
    bool _3349 = !_2159;
    int _3351 = _3349 ? 0 : 1;
    int _3353 = _3315 * as_type<int>(_3195);
    int _3355 = _3353 + _3273;
    int _3357 = abs(_3343);
    float _3359 = _3179 * _2843;
    int _3361 = ~_3357;
    int _3363 = _3361 + 1;
    int _3365 = _3363 + 1;
    float _3367 = float(uint(_3257));
    int _3369 = ~_2863;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    int _3375 = _3347 * _3365;
    int _3377 = abs(_3351);
    float _3379 = fma(_2775, _2975, _3143);
    int _3381 = abs(_3257);
    float _3383 = 1.0 / _3367;
    float _3385 = float(uint(_3307));
    int _3387 = _3373 * as_type<int>(_3203);
    int _3389 = _3387 + _3355;
    bool _3391 = !_2163;
    int _3393 = _3391 ? 0 : 1;
    int _3395 = _3329 * _3357;
    int _3397 = _3395 + _3375;
    int _3399 = abs(_3239);
    float _3401 = fma(_2931, _2777, _3067);
    float _3403 = 1.0 / _3385;
    int _3405 = ~_3377;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    float _3411 = _2687 + _3379;
    int _3413 = abs(_3393);
    float _3415 = fma(_2951, _2775, _3103);
    float _3417 = float(uint(_3399));
    int _3419 = _3409 * _3339;
    int _3421 = ~_3413;
    int _3423 = _3421 + 1;
    int _3425 = _3423 + 1;
    float _3427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3429 = _3283 + _3427;
    float _3431 = float(uint(_3381));
    int _3433 = _3185 * _3377;
    int _3435 = _3433 + _3419;
    int _3437 = as_type<int>(_3331) + (-2);
    float _3439 = 1.0 / _3417;
    float _3441 = float(uint(_3397));
    int _3443 = _3425 * _3389;
    int _3445 = abs(_3307);
    float _3447 = _3429 * _3429;
    int _3449 = as_type<int>(_3383) + (-2);
    float _3451 = as_type<float>(_3437) * _3441;
    int _3453 = _3223 * _3413;
    int _3455 = _3453 + _3443;
    float _3457 = 1.0 / _3431;
    float _3459 = float(uint(_3435));
    float _3461 = fma(_2917, _2787, _3097);
    float _3463 = float(uint(_3445));
    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3467 = _3411 + _3465;
    int _3469 = as_type<int>(_3403) + (-2);
    float _3471 = as_type<float>(_3449) * _3459;
    float _3473 = float(uint(_3455));
    float _3475 = trunc(_3451);
    float _3477 = precise::max(_3475, 0.0);
    uint _3479 = uint(_3477);
    int _3481 = as_type<int>(_3439) + (-2);
    float _3483 = _3467 * _3467;
    int _3485 = abs(_3397);
    float _3487 = fma(_2787, _2975, _3145);
    int _3489 = abs(_3435);
    float _3491 = _3483 + _3447;
    int _3493 = ~_3257;
    int _3495 = _3493 + 1;
    float _3497 = 1.0 / _3463;
    float _3499 = as_type<float>(_3469) * _3473;
    float _3501 = float(uint(_3485));
    float _3503 = fma(_2951, _2777, _3107);
    int _3505 = as_type<int>(_3457) + (-2);
    float _3507 = fma(_2951, _2787, _3105);
    float _3509 = float(uint(_3489));
    float _3511 = as_type<float>(_3481) * _3501;
    float _3513 = trunc(_3471);
    float _3515 = precise::max(_3513, 0.0);
    uint _3517 = uint(_3515);
    int _3519 = abs(_3455);
    int _3521 = _3335 * int(_3479);
    int _3523 = _3521 + _3397;
    float _3525 = as_type<float>(_3505) * _3509;
    int _3527 = ~_3307;
    int _3529 = _3527 + 1;
    float _3531 = _3461 * _2843;
    float _3533 = float(uint(_3519));
    float _3535 = _2893 * _3461;
    float _3537 = trunc(_3499);
    float _3539 = precise::max(_3537, 0.0);
    uint _3541 = uint(_3539);
    int _3543 = as_type<int>(_3497) + (-2);
    int _3545 = ~_3381;
    int _3547 = _3545 + 1;
    int _3549 = ~_3445;
    int _3551 = _3549 + 1;
    float _3553 = as_type<float>(_3543) * _3533;
    float _3555 = float(uint(_3523));
    float _3557 = trunc(_3511);
    float _3559 = precise::max(_3557, 0.0);
    uint _3561 = uint(_3559);
    int _3563 = _3495 * int(_3517);
    int _3565 = _3563 + _3435;
    float _3567 = as_type<float>(_3437) * _3555;
    float _3569 = float(uint(_3565));
    float _3571 = _3461 * _2781;
    float _3573 = trunc(_3525);
    float _3575 = precise::max(_3573, 0.0);
    uint _3577 = uint(_3575);
    int _3579 = _3529 * int(_3541);
    int _3581 = _3579 + _3455;
    float _3583 = as_type<float>(_3449) * _3569;
    int _3585 = ~_3399;
    int _3587 = _3585 + 1;
    float _3589 = fma(_3219, _2779, _3571);
    float _3591 = float(uint(_3581));
    float _3593 = _3179 * _2781;
    float _3595 = trunc(_3553);
    float _3597 = precise::max(_3595, 0.0);
    uint _3599 = uint(_3597);
    float _3601 = _2893 * _3179;
    float _3603 = as_type<float>(_3469) * _3591;
    float _3605 = _3215 * _2781;
    int _3607 = _3587 * int(_3561);
    int _3609 = _3607 + _3485;
    float _3611 = fma(_3401, _2779, _3593);
    float _3613 = sqrt(_3491);
    int _3615 = _3547 * int(_3577);
    int _3617 = _3615 + _3489;
    float _3619 = _3215 * _2843;
    float _3621 = float(uint(_3609));
    float _3623 = fma(_3181, _2779, _3605);
    float _3625 = float(uint(_3617));
    float _3627 = as_type<float>(_3481) * _3621;
    float _3629 = trunc(_3567);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = _3551 * int(_3599);
    int _3637 = _3635 + _3519;
    float _3639 = fma(_3181, _2821, _3619);
    float _3641 = as_type<float>(_3505) * _3625;
    float _3643 = fma(_2891, _3181, _3291);
    float _3645 = fma(_2891, _3219, _3535);
    float _3647 = float(uint(_3637));
    float _3649 = fma(_3219, _2821, _3531);
    bool _3651 = _3613 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3653 = trunc(_3583);
    float _3655 = precise::max(_3653, 0.0);
    uint _3657 = uint(_3655);
    float _3659 = fma(_3401, _2821, _3359);
    float _3661 = as_type<float>(_3543) * _3647;
    float _3663 = _2681 + _3487;
    float _3665 = trunc(_3603);
    float _3667 = precise::max(_3665, 0.0);
    uint _3669 = uint(_3667);
    float _3671 = _2779;
    float _3673 = _3483;
    float _3675 = _3283;
    float _3677 = _3447;
    float _3679 = _3411;
    float _3681 = as_type<float>(_3455);
    if (!_3651)
    {
        _3671 = _3483;
    }
    float _3683 = _3671;
    float _3685 = _3683;
    if (!_3651)
    {
        _3673 = _3283;
    }
    float _3687 = _3673;
    float _3689 = trunc(_3627);
    float _3691 = precise::max(_3689, 0.0);
    uint _3693 = uint(_3691);
    float _3695 = _3687;
    if (!_3651)
    {
        _3675 = _3663;
    }
    float _3697 = _3675;
    float _3699 = trunc(_3641);
    float _3701 = precise::max(_3699, 0.0);
    uint _3703 = uint(_3701);
    bool _3705 = !_3651;
    float _3707 = _3697;
    if (!_3705)
    {
        float _3709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3713 = _3613 + _3711;
        float _3715 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3717 = rsqrt(_3491);
        float _3719 = _3713 * _3709;
        float _3721 = _3719 * 0.15915493667125701904296875;
        float _3723 = _3721 * 6.283185482025146484375;
        float _3725 = sin(_3723);
        float _3727 = _3721 * 6.283185482025146484375;
        float _3729 = cos(_3727);
        float _3731 = fma(_3725, _3715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3733 = _3717 * _3731;
        float _3735 = _3729 + (-1.0);
        float _3737 = fma(_3467, _3733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3739 = fma(_3429, _3733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3741 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3745 = _3737 + _3743;
        float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3749 = _3739 + _3747;
        float _3751 = fma(_3663, _3729, _3741);
        float _3753 = _3745 * _3745;
        float _3755 = _3749 * _3749;
        _3707 = _3751;
        _3685 = _3753;
        _3677 = _3755;
        _3679 = _3737;
        _3695 = _3739;
    }
    float _3757 = _3707;
    float _3759 = _3685;
    float _3761 = _3677;
    float _3763 = _3679;
    float _3765 = _3695;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3769 = _3757 + _3767;
    int _3771 = int(_3479) + int(_3633);
    float _3773 = fma(_2891, _3401, _3601);
    int _3775 = ~_3239;
    int _3777 = _3775 + 1;
    float _3779 = fma(_3769, _3769, _3759);
    int _3781 = int(_3517) + int(_3657);
    float _3783 = trunc(_3661);
    float _3785 = precise::max(_3783, 0.0);
    uint _3787 = uint(_3785);
    int _3789 = int(_3541) + int(_3669);
    float _3791 = _3779 + _3761;
    int _3793 = int(_3577) + int(_3703);
    int _3795 = _3777 * _3771;
    int _3797 = _3795 + _3397;
    int _3799 = ~_3257;
    int _3801 = _3799 + 1;
    float _3803 = fma(_3415, _2783, _3623);
    int _3805 = ~_3307;
    int _3807 = _3805 + 1;
    float _3809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3811 = ~_3381;
    int _3813 = _3811 + 1;
    int _3815 = _3801 * _3781;
    int _3817 = _3815 + _3435;
    int _3819 = int(_3561) + int(_3693);
    int _3821 = _3807 * _3789;
    int _3823 = _3821 + _3455;
    int _3825 = ~_3399;
    int _3827 = _3825 + 1;
    int _3829 = _3813 * _3793;
    int _3831 = _3829 + _3489;
    bool _3833 = uint(_3797) >= uint(_3239);
    float _3835 = sqrt(_3791);
    bool _3837 = uint(_3817) >= uint(_3257);
    int _3839 = _3827 * _3819;
    int _3841 = _3839 + _3485;
    bool _3843 = uint(_3823) >= uint(_3307);
    float _3845 = fma(_3507, _2783, _3589);
    bool _3847 = uint(_3831) >= uint(_3381);
    float _3849 = fma(_3503, _2783, _3611);
    bool _3851 = !_3833;
    int _3853 = _3851 ? 0 : (-1);
    float _3855 = _3809 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3857 = uint(_3841) >= uint(_3399);
    bool _3859 = !_3837;
    int _3861 = _3859 ? 0 : (-1);
    float _3863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3865 = !_3843;
    int _3867 = _3865 ? 0 : (-1);
    float _3869 = fma(_3855, _973, -0.5);
    int _3871 = ~_3771;
    int _3873 = _3871 + _3853;
    int _3875 = _3873 + 1;
    out.m_85.x = _3803;
    out.m_85.y = _3845;
    out.m_85.z = _3849;
    int _3877 = int(_3599) + int(_3787);
    int _3879 = ~_3445;
    int _3881 = _3879 + 1;
    float _3883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3885 = ~_3781;
    int _3887 = _3885 + _3861;
    int _3889 = _3887 + 1;
    int _3891 = ~_3789;
    int _3893 = _3891 + _3867;
    int _3895 = _3893 + 1;
    int _3897 = _3881 * _3877;
    int _3899 = _3897 + _3519;
    bool _3901 = _3239 == 0;
    bool _3903 = _3239 == 0;
    int _3905 = _3307 * _3895;
    int _3907 = _3905 + _3455;
    int _3909 = _3397 ^ _3239;
    int _3911 = _3239 * _3875;
    int _3913 = _3911 + _3397;
    bool _3915 = !_3857;
    int _3917 = _3915 ? 0 : (-1);
    float _3919 = _3863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3921 = _3257 == 0;
    bool _3923 = _3257 == 0;
    float _3925 = fma(_1339, _3919, -0.5);
    int _3927 = _3435 ^ _3257;
    int _3929 = _3257 * _3889;
    int _3931 = _3929 + _3435;
    bool _3933 = !_3901;
    int _3935 = _3933 ? _3913 : (-1);
    float _3937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3939 = !_3847;
    int _3941 = _3939 ? 0 : (-1);
    bool _3943 = uint(_3899) >= uint(_3445);
    bool _3945 = _3307 == 0;
    bool _3947 = _3307 == 0;
    float _3949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3951 = _3455 ^ _3307;
    float _3953 = float(_3935);
    float _3955 = _3883 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3957 = ~_3917;
    int _3959 = _3819 + _3957;
    int _3961 = _3959 + 1;
    bool _3963 = !_3943;
    int _3965 = _3963 ? 0 : (-1);
    float _3967 = fma(_3855, _3953, _2519);
    uint _3969 = uint(int(uint(_3927) >> uint(31)));
    float _3971 = _3937 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3973 = uint(int(uint(_3909) >> uint(31)));
    float _3975 = fma(_3955, _1059, -0.5);
    uint _3977 = uint(int(uint(_3951) >> uint(31)));
    float _3979 = fma(_3971, _1621, -0.5);
    bool _3981 = !_3921;
    int _3983 = _3981 ? _3931 : (-1);
    float _3985 = fma(_2465, _3869, _3967);
    bool _3987 = !_3945;
    int _3989 = _3987 ? _3907 : (-1);
    int _3991 = ~_3941;
    int _3993 = _3793 + _3991;
    int _3995 = _3993 + 1;
    int _3997 = ~int(_3969);
    int _3999 = _3997 + 1;
    int _4001 = ~_3965;
    int _4003 = _3877 + _4001;
    int _4005 = _4003 + 1;
    int _4007 = ~int(_3973);
    int _4009 = _4007 + 1;
    float _4011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4013 = ~int(_3977);
    int _4015 = _4013 + 1;
    float _4017 = float(_3983);
    float _4019 = float(_3989);
    int _4021 = _3995 ^ _3999;
    float _4023 = fma(_3955, _4017, _2475);
    int _4025 = _3961 ^ _4009;
    float _4027 = fma(_3971, _4019, _2469);
    int _4029 = _4005 ^ _4015;
    float _4031 = fma(_2471, _3975, _4023);
    int _4033 = ~_3999;
    int _4035 = _4033 + _4021;
    int _4037 = _4035 + 1;
    float _4039 = _3949 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4041 = ~_4009;
    int _4043 = _4041 + _4025;
    int _4045 = _4043 + 1;
    float _4047 = _4011 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4049 = ~_4015;
    int _4051 = _4049 + _4029;
    int _4053 = _4051 + 1;
    float _4055 = fma(_1381, _4039, -0.5);
    bool _4057 = !_3923;
    int _4059 = _4057 ? _4037 : (-1);
    float _4061 = fma(_2463, _3979, _4027);
    bool _4063 = !_3903;
    int _4065 = _4063 ? _4045 : (-1);
    float _4067 = _4031 + 0.5;
    bool _4069 = !_3947;
    int _4071 = _4069 ? _4053 : (-1);
    float _4073 = _4061 + 0.5;
    float _4075 = float(_4059);
    float _4077 = fma(_2895, _3503, _3773);
    float _4079 = float(_4065);
    float _4081 = float(_4071);
    float _4083 = -_2477;
    float _4085 = fma(_4039, _4075, _4083);
    float _4087 = fma(_4047, _1547, -0.5);
    float _4089 = -_2487;
    float _4091 = fma(_3919, _4079, _4089);
    float _4093 = fma(_3415, _2847, _3639);
    float _4095 = -_2107;
    float _4097 = fma(_4047, _4081, _4095);
    float _4099 = fma(_2461, _4055, _4085);
    float _4101 = fma(_2521, _3925, _4091);
    float _4103 = fma(_2895, _3415, _3643);
    float _4105 = fma(_2527, _4087, _4097);
    float _4107 = fma(_3507, _2847, _3649);
    float _4109 = fma(_2895, _3507, _3645);
    float _4111 = _3985 + 0.5;
    float _4113 = _4101 + 0.5;
    float _4115 = _4099 + 0.5;
    float _4117 = _4105 + 0.5;
    float _4119 = fma(_3503, _2847, _3659);
    out.m_87.x = _4103;
    out.m_87.y = _4109;
    out.m_87.z = _4077;
    bool _4121 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4123 = isnan(_3835);
    bool _4125 = _4121 || _4123;
    bool _4127 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4129 = _4125 || _4127;
    out.m_89.x = _4111;
    out.m_89.y = _4113;
    out.m_89.z = _4067;
    out.m_89.w = _4115;
    out.m_91.x = _4073;
    out.m_91.y = _4117;
    out.m_93.x = _4093;
    out.m_93.y = _4107;
    out.m_93.z = _4119;
    int _4131 = as_type<int>(_3757);
    if (!_4129)
    {
        _3681 = 1.0;
    }
    float _4133 = _3681;
    bool _4135 = !_4129;
    float _4137 = _4133;
    if (!_4135)
    {
        bool _4139 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4141 = isnan(_3835);
        bool _4143 = _4139 || _4141;
        bool _4145 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4147 = _4143 || _4145;
        if (!_4147)
        {
            float _4149 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4151 = _3835 + _4149;
            float _4153 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4155 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4153;
            float _4157 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4159 = _4157 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4161 = 1.0 / _4155;
            float _4163 = _4151 * _4161;
            float _4165 = fma(_4163, _4159, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4137 = _4165;
            _4167 = true;
        }
        else
        {
            bool _4169 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4171 = isnan(_3835);
            bool _4173 = _4169 || _4171;
            bool _4175 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4177 = _4173 || _4175;
            if (!_4177)
            {
                float _4179 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4181 = _3835 + _4179;
                float _4183 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4185 = _4183 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4187 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4189 = _4187 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4191 = 1.0 / _4185;
                float _4193 = _4181 * _4191;
                float _4195 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4137 = _4195;
                _4167 = true;
            }
            else
            {
                _4137 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4167 = false;
    float _4197 = _4137;
    float _4199 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4201 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4203 = floor(_4199);
    float _4205 = floor(_4201);
    float _4207 = -_4203;
    float _4209 = _4199 + _4207;
    float _4211 = -_4205;
    float _4213 = _4201 + _4211;
    float2 _11630 = float2(_4209, _4213);
    float _4215 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11630, float2(0.0), isnan(_11630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11630, float2(0.0), isnan(_11630)), level(0.0)).x;
    float _4217 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4219 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4221 = _3763 + _4219;
    float _4223 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4217);
    float _4225 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4227 = _3765 + _4225;
    float _4229 = fma(_4221, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4231 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4223);
    float _4233 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4235 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4237 = fma(_4227, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4239 = _4231 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4241 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4233);
    float _4243 = _2681 + _4235;
    float _4245 = 1.0 / _4239;
    float _4247 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4241);
    float _4249 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4251 = _4247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4253 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4249);
    float _4255 = _4251 + _4239;
    float _4257 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4253);
    float _4259 = _4257 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4261 = _4255 * _4245;
    float _4263 = _4261 * 0.5;
    bool _4265 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4267 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4269 = _4265 || _4267;
    bool _4271 = isnan(0.5);
    bool _4273 = _4269 || _4271;
    float _4275 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4277 = fma(_4263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4275);
    float _4279 = 1.0 / _4277;
    float _4281 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    int _4283 = 2;
    if (_4273)
    {
        _4281 = _4237;
    }
    float _4285 = _4281;
    float _4287 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4289 = _4279 * _4287;
    float _4291 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _4293 = _4289 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4295 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4291);
    bool _4297 = _4289 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4299 = !_4293;
    int _4301 = _4299 ? 0 : 1;
    float _4303 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4295);
    float _4305 = _4303 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4307 = _4285;
    if (!_4293)
    {
        _4283 = 1;
    }
    int _4309 = _4283;
    float _4311 = trunc(_4305);
    int _4313 = int(_4311);
    int _4315 = _4309;
    if (!_4297)
    {
        _4315 = _4301;
    }
    int _4317 = _4315;
    int _4319 = _4317 << 6;
    float _4321 = trunc(_4259);
    int _4323 = int(_4321);
    int _4325 = _4319 + 48;
    uint _4327 = uint(int(uint(_4325) >> uint(2)));
    uint _4329 = uint(int(uint(int(_4327)) >> uint(2)));
    int _4331 = int(_4327) & 3;
    float _4333 = (*spvDescriptorSet0.vp_c15)._m0[int(_4329)][_4331];
    int _4335 = int(_4327) + 1;
    uint _4337 = uint(int(uint(_4335) >> uint(2)));
    int _4339 = _4335 & 3;
    float _4341 = (*spvDescriptorSet0.vp_c15)._m0[int(_4337)][_4339];
    int _4343 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4345 = _4313 + _4343;
    int _4347 = _4345 + 1;
    int _4349 = _4319 + 56;
    uint _4351 = uint(int(uint(_4349) >> uint(2)));
    uint _4353 = uint(int(uint(int(_4351)) >> uint(2)));
    int _4355 = int(_4351) & 3;
    float _4357 = (*spvDescriptorSet0.vp_c15)._m0[int(_4353)][_4355];
    int _4359 = int(_4351) + 1;
    uint _4361 = uint(int(uint(_4359) >> uint(2)));
    int _4363 = _4359 & 3;
    float _4365 = (*spvDescriptorSet0.vp_c15)._m0[int(_4361)][_4363];
    int _4367 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4369 = _4323 + _4367;
    int _4371 = _4369 + 1;
    int _4373 = _4319 + 64;
    uint _4375 = uint(int(uint(_4373) >> uint(2)));
    uint _4377 = uint(int(uint(int(_4375)) >> uint(2)));
    int _4379 = int(_4375) & 3;
    float _4381 = (*spvDescriptorSet0.vp_c15)._m0[int(_4377)][_4379];
    int _4383 = int(_4375) + 1;
    uint _4385 = uint(int(uint(_4383) >> uint(2)));
    int _4387 = _4383 & 3;
    float _4389 = (*spvDescriptorSet0.vp_c15)._m0[int(_4385)][_4387];
    bool _4391 = _4371 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4393 = _4371 | _4347;
    int _4395 = _4319 + 72;
    uint _4397 = uint(int(uint(_4395) >> uint(2)));
    uint _4399 = uint(int(uint(int(_4397)) >> uint(2)));
    int _4401 = int(_4397) & 3;
    float _4403 = (*spvDescriptorSet0.vp_c15)._m0[int(_4399)][_4401];
    int _4405 = int(_4397) + 1;
    uint _4407 = uint(int(uint(_4405) >> uint(2)));
    int _4409 = _4405 & 3;
    float _4411 = (*spvDescriptorSet0.vp_c15)._m0[int(_4407)][_4409];
    bool _4413 = _4393 < 0;
    bool _4415 = _4413 || _4391;
    float _4417 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4419 = _3757 + _4417;
    bool _4421 = _4347 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4423 = _4421 || _4415;
    float _4425 = fma(_4419, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4427 = _4419;
    float _4429 = as_type<float>(_4323);
    int _4431 = _4347;
    float _4433 = as_type<float>(_4317);
    if (_4273)
    {
        _4427 = _4229;
    }
    float _4435 = _4427;
    int _4437 = _4319 + 96;
    uint _4439 = uint(int(uint(_4437) >> uint(2)));
    uint _4441 = uint(int(uint(int(_4439)) >> uint(2)));
    int _4443 = int(_4439) & 3;
    float _4445 = (*spvDescriptorSet0.vp_c15)._m0[int(_4441)][_4443];
    int _4447 = int(_4439) + 1;
    uint _4449 = uint(int(uint(_4447) >> uint(2)));
    int _4451 = _4447 & 3;
    float _4453 = (*spvDescriptorSet0.vp_c15)._m0[int(_4449)][_4451];
    float _4455 = _4435;
    if (_4273)
    {
        _4429 = _4425;
    }
    float _4457 = _4429;
    int _4459 = _4319 + 104;
    uint _4461 = uint(int(uint(_4459) >> uint(2)));
    uint _4463 = uint(int(uint(int(_4461)) >> uint(2)));
    int _4465 = int(_4461) & 3;
    float _4467 = (*spvDescriptorSet0.vp_c15)._m0[int(_4463)][_4465];
    int _4469 = int(_4461) + 1;
    uint _4471 = uint(int(uint(_4469) >> uint(2)));
    int _4473 = _4469 & 3;
    float _4475 = (*spvDescriptorSet0.vp_c15)._m0[int(_4471)][_4473];
    float _4477 = _4457;
    int _4479 = as_type<int>(_4475);
    if (!_4273)
    {
        float _4481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4483 = _2681 + _4481;
        float _4485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4487 = _2687 + _4485;
        float _4489 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4491 = _4483 * _4483;
        float _4493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4495 = _2695 + _4493;
        float _4497 = fma(_4487, _4487, _4491);
        float _4499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4501 = fma(_4495, _4495, _4497);
        float _4503 = sqrt(_4501);
        float _4505 = _4489 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4507 = -_2681;
        float _4509 = _4507 + _4425;
        float _4511 = precise::min(_4503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4513 = _4511 * _4499;
        float _4515 = -_2695;
        float _4517 = _4515 + _4237;
        float _4519 = _4505 * _4513;
        float _4521 = -_2687;
        float _4523 = _4521 + _4229;
        float _4525 = fma(_4509, _4519, _2681);
        float _4527 = fma(_4523, _4519, _2687);
        float _4529 = fma(_4517, _4519, _2695);
        _4477 = _4525;
        _4131 = as_type<int>(_4519);
        _4455 = _4527;
        _4307 = _4529;
    }
    float _4531 = _4477;
    int _4533 = _4131;
    float _4535 = _4455;
    float _4537 = _4307;
    float _4539 = _4243 * _4453;
    float _4541 = _4243 * _4341;
    int _4543 = _4533;
    if (!_4423)
    {
        int _4545 = _4347 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4547 = _4545 + _4371;
        _4543 = _4547;
    }
    int _4549 = _4543;
    float _4551 = _4243 * _4389;
    float _4553 = fma(_2687, _4445, _4539);
    float _4555 = fma(_2687, _4333, _4541);
    float _4557 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4559 = _4319 + 80;
    uint _4561 = uint(int(uint(_4559) >> uint(2)));
    uint _4563 = uint(int(uint(int(_4561)) >> uint(2)));
    int _4565 = int(_4561) & 3;
    float _4567 = (*spvDescriptorSet0.vp_c15)._m0[int(_4563)][_4565];
    int _4569 = int(_4561) + 1;
    uint _4571 = uint(int(uint(_4569) >> uint(2)));
    int _4573 = _4569 & 3;
    float _4575 = (*spvDescriptorSet0.vp_c15)._m0[int(_4571)][_4573];
    float _4577 = fma(_2695, _4467, _4553);
    if (!_4423)
    {
        int _4579 = _4549 << 2;
        _4431 = _4579;
    }
    int _4581 = _4431;
    float _4583 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4557);
    float _4585 = fma(_2687, _4381, _4551);
    float _4587 = _4577 + _4475;
    int _4589 = _4581;
    if (!_4423)
    {
        uint _4591 = uint(int(uint(_4549) >> uint(2)));
        _4479 = int(_4591);
    }
    int _4593 = _4479;
    float _4595 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4583);
    if (!_4423)
    {
        int _4597 = 12 & _4581;
        _4589 = _4597;
    }
    int _4599 = _4589;
    int _4601 = _4319 + 88;
    uint _4603 = uint(int(uint(_4601) >> uint(2)));
    uint _4605 = uint(int(uint(int(_4603)) >> uint(2)));
    int _4607 = int(_4603) & 3;
    float _4609 = (*spvDescriptorSet0.vp_c15)._m0[int(_4605)][_4607];
    int _4611 = int(_4603) + 1;
    uint _4613 = uint(int(uint(_4611) >> uint(2)));
    int _4615 = _4611 & 3;
    float _4617 = (*spvDescriptorSet0.vp_c15)._m0[int(_4613)][_4615];
    float _4619 = 1.0 / _4587;
    float _4621 = _4595 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4623 = as_type<float>(_4599);
    if (!_4423)
    {
        int _4625 = _4593 << 4;
        int _4627 = _4625 + _4599;
        _4623 = as_type<float>(_4627);
    }
    float _4629 = _4623;
    float _4631 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4633 = fma(_2695, _4357, _4555);
    float _4635 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4637 = fma(_2695, _4403, _4585);
    float _4639 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4641 = _4629;
    if (!_4423)
    {
        int _4643 = as_type<int>(_4629) + 400;
        uint _4645 = uint(int(uint(_4643) >> uint(2)));
        uint _4647 = uint(int(uint(int(_4645)) >> uint(2)));
        int _4649 = int(_4645) & 3;
        float _4651 = (*spvDescriptorSet0.vp_c15)._m0[int(_4647)][_4649];
        _4641 = _4651;
    }
    float _4653 = _4641;
    float _4655 = -_4635;
    float _4657 = fma(_4655, _4631, 1.0);
    float _4659 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4661 = _4633 + _4365;
    float _4663 = _4637 + _4411;
    float _4665 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4667 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4639);
    float _4669 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4659);
    float _4671 = _4661 * _4619;
    float _4673 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4665);
    float _4675 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4667);
    float _4677 = _4663 * _4619;
    float _4679 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4669);
    bool _4681 = _4671 >= 0.0;
    float _4683 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4673);
    float _4685 = _4675 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4687 = _4453;
    float _4689 = _4619;
    if (!_4423)
    {
        float _4691 = floor(_4305);
        _4687 = _4691;
    }
    float _4693 = _4687;
    bool _4695 = _4671 <= 1.0;
    bool _4697 = _4695 && _4681;
    float _4699 = _4683 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4701 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4703 = _4679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _4705 = _4677 >= 0.0;
    bool _4707 = _4705 && _4697;
    float _4709 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4711 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4701);
    float _4713 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _4715 = _4677 <= 1.0;
    bool _4717 = _4715 && _4707;
    float _4719 = as_type<float>(_4319);
    if (!_4423)
    {
        float _4721 = floor(_4259);
        _4719 = _4721;
    }
    float _4723 = _4719;
    float _4725 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4711);
    float _4727 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4709);
    float _4729 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4713);
    float _4731 = _4243 * _4575;
    float _4733 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4725);
    float _4735 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4727);
    float _4737 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4729);
    float _4739 = fma(_2687, _4567, _4731);
    float _4741 = log2(_4657);
    float _4743 = _4693;
    if (!_4423)
    {
        float _4745 = -_4693;
        float _4747 = _4305 + _4745;
        _4743 = _4747;
    }
    float _4749 = _4743;
    float _4751 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4735);
    if (_4717)
    {
        float _4753 = float(_4317);
        _4433 = _4753;
    }
    float _4755 = _4433;
    float _4757 = fma(_2695, _4609, _4739);
    float _4759 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4737);
    float _4761 = 1.0 / _4733;
    float _4763 = _4757 + _4617;
    float _4765 = _4763 * _4619;
    float _4767 = _4755;
    if (!_4423)
    {
        float _4769 = -_4723;
        float _4771 = _4259 + _4769;
        _4689 = _4771;
    }
    float _4773 = _4689;
    float _4775 = _4731;
    if (_4717)
    {
        float _4777 = rint(_4755);
        float _4779 = precise::max(_4777, 0.0);
        uint _4781 = uint(_4779);
        uint _4783 = clamp(_4781, 0u, 65535u);
        _4775 = as_type<float>(_4783);
    }
    float _4785 = _4775;
    float _4787 = _4741 * 0.693147182464599609375;
    float _4789 = _4723;
    float _4791 = _4653;
    if (!_4423)
    {
        float _4793 = rint(_4653);
        float _4795 = precise::max(_4793, 0.0);
        uint _4797 = uint(_4795);
        uint _4799 = clamp(_4797, 0u, 65535u);
        _4789 = as_type<float>(_4799);
    }
    float _4801 = _4789;
    float _4803 = _4751 * _4761;
    float _4805 = _4759 * _4761;
    float _4807 = _4787 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4809 = fma(_4803, 0.5, 0.5);
    float _4811 = fma(_4805, -0.5, 0.5);
    float _4813 = _4785;
    if (_4717)
    {
        float3 _12655 = float3(_4671, _4677, float(as_type<int>(_4785)));
        float3 _12659 = select(_12655, float3(0.0), isnan(_12655));
        float _4815 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12659.xy, uint(rint(_12659.z)), _4765, level(0.0));
        _4813 = _4815;
    }
    float _4817 = _4813;
    float3 _12669 = float3(_4809, _4811, _4807);
    float _4819 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12669, float3(0.0), isnan(_12669)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12669, float3(0.0), isnan(_12669)), level(0.0)).x;
    float3 _12678 = float3(_4809, _4811, _4807);
    float4 _4822 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12678, float3(0.0), isnan(_12678)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12678, float3(0.0), isnan(_12678)), level(0.0)).xyzw;
    float _4824 = _4822.x;
    float _4826 = _4822.y;
    float _4828 = _4822.z;
    float _4830 = _4822.w;
    float _4832 = _4749;
    if (!_4423)
    {
        float3 _12701 = float3(_4773, _4749, float(as_type<int>(_4801)));
        float3 _12703 = select(_12701, float3(0.0), isnan(_12701));
        float _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12703.xy, uint(rint(_12703.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12703.xy, uint(rint(_12703.z)), level(0.0)).x;
        _4832 = _4834;
    }
    float _4836 = _4832;
    if (_4423)
    {
        _4767 = 1.0;
    }
    float _4838 = _4767;
    float _4840 = _4838;
    if (!_4423)
    {
        int _4842 = _4549 << 4;
        int _4844 = _4842 + 2048;
        uint _4846 = uint(int(uint(_4844) >> uint(2)));
        uint _4848 = uint(int(uint(int(_4846)) >> uint(2)));
        int _4850 = int(_4846) & 3;
        float _4852 = (*spvDescriptorSet0.vp_c15)._m0[int(_4848)][_4850];
        int _4854 = int(_4846) + 1;
        uint _4856 = uint(int(uint(_4854) >> uint(2)));
        int _4858 = _4854 & 3;
        float _4860 = (*spvDescriptorSet0.vp_c15)._m0[int(_4856)][_4858];
        int _4862 = _4844 + 8;
        uint _4864 = uint(int(uint(_4862) >> uint(2)));
        uint _4866 = uint(int(uint(int(_4864)) >> uint(2)));
        int _4868 = int(_4864) & 3;
        float _4870 = (*spvDescriptorSet0.vp_c15)._m0[int(_4866)][_4868];
        int _4872 = int(_4864) + 1;
        uint _4874 = uint(int(uint(_4872) >> uint(2)));
        int _4876 = _4872 & 3;
        float _4878 = (*spvDescriptorSet0.vp_c15)._m0[int(_4874)][_4876];
        float _4880 = _4243 * _4860;
        float _4882 = fma(_2687, _4852, _4880);
        float _4884 = fma(_2695, _4870, _4882);
        float _4886 = _4884 + _4878;
        float _4888 = precise::clamp(_4886, 0.0, 1.0);
        float _4890 = -_4888;
        float _4892 = _4890 + _4836;
        float _4894 = fma(_4892, 500.0, 1.5);
        float _4896 = exp2(_4894);
        float _4898 = 0.0 + _4896;
        float _4900 = precise::clamp(_4898, 0.0, 1.0);
        _4791 = _4870;
        _4840 = _4900;
    }
    float _4902 = _4791;
    float _4904 = _4840;
    float _4906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4908 = _4531 + _4906;
    float _4910 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4912 = _4535 + _4910;
    float _4914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4916 = _4537 + _4914;
    float _4918 = _4908 * _4908;
    float _4920 = fma(_4912, _4912, _4918);
    float _4922 = fma(_4916, _4916, _4920);
    float _4924 = rsqrt(_4922);
    float _4926 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4928 = _4912 * _4926;
    float _4930 = _4916 * _4926;
    float _4932 = _4928 * _4928;
    float _4934 = _4930 * _4930;
    float _4936 = _4932 + _4934;
    float _4938 = sqrt(_4936);
    bool _4940 = _4938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4944 = _4938 + _4942;
    float _4946 = _4916;
    float _4948 = _4936;
    float _4950 = _4944;
    float _4952 = _4902;
    float _4954 = _4908;
    float _4956 = _4926;
    if (_4940)
    {
        float _4958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4946 = _4958;
    }
    float _4960 = _4946;
    if (_4940)
    {
        float _4962 = rsqrt(_4936);
        _4948 = _4962;
    }
    float _4964 = _4948;
    float _4966 = _4964;
    if (_4940)
    {
        float _4968 = _4944 * _4960;
        _4950 = _4968;
    }
    float _4970 = _4950;
    if (_4940)
    {
        float _4972 = _4970 * 0.15915493667125701904296875;
        _4952 = _4972;
    }
    float _4974 = _4952;
    float _4976 = _4924;
    if (_4940)
    {
        float _4978 = _4974 * 6.283185482025146484375;
        float _4980 = sin(_4978);
        _4976 = _4980;
    }
    float _4982 = _4976;
    float _4984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4986 = precise::max(0.0, _4984);
    float _4988 = _4836;
    float _4990 = _4984;
    if (_4940)
    {
        float _4992 = _4974 * 6.283185482025146484375;
        float _4994 = cos(_4992);
        _4988 = _4994;
    }
    float _4996 = _4988;
    float _4998 = -_4926;
    float _5000 = -_4986;
    float _5002 = fma(_4908, _4998, _5000);
    float _5004 = _5002;
    if (!_4940)
    {
        _4954 = _4930;
    }
    float _5006 = _4954;
    float _5008 = _5006;
    if (_4940)
    {
        float _5010 = _5002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4990 = _5010;
    }
    float _5012 = _4990;
    float _5014 = _4982;
    float _5016 = _5012;
    if (_4940)
    {
        float _5018 = fma(_4982, _5012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5014 = _5018;
    }
    float _5020 = _5014;
    float _5022 = _5020;
    float _5024 = _4996;
    if (_4940)
    {
        float _5026 = _4996 + (-1.0);
        _5016 = _5026;
    }
    float _5028 = _5016;
    float _5030 = _5028;
    if (_4940)
    {
        float _5032 = _4964 * _5020;
        _4956 = _5032;
    }
    float _5034 = _4956;
    if (!_4940)
    {
        _5022 = _4928;
    }
    float _5036 = _5022;
    float _5038 = _5036;
    if (_4940)
    {
        float _5040 = _5028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5030 = _5040;
    }
    float _5042 = _5030;
    if (_4940)
    {
        float _5044 = _4928 * _5034;
        _5038 = _5044;
    }
    float _5046 = _5038;
    if (!_4940)
    {
        _4966 = _4932;
    }
    float _5048 = _4966;
    float _5050 = _5048;
    if (_4940)
    {
        float _5052 = _4930 * _5034;
        _5008 = _5052;
    }
    float _5054 = _5008;
    if (_4940)
    {
        float _5056 = fma(_5002, _4996, _5042);
        _5004 = _5056;
    }
    float _5058 = _5004;
    if (_4940)
    {
        float _5060 = _5046 * _5046;
        _5050 = _5060;
    }
    float _5062 = _5050;
    float _5064 = sqrt(_4922);
    if (!_4940)
    {
        _5024 = _4934;
    }
    float _5066 = _5024;
    float _5068 = _5066;
    if (_4940)
    {
        float _5070 = _5054 * _5054;
        _5068 = _5070;
    }
    float _5072 = _5068;
    float _5074 = fma(_5058, _5058, _5062);
    float _5076 = _5074 + _5072;
    float _5078 = rsqrt(_5076);
    float _5080 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5082 = fma(_5064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5080);
    float _5084 = precise::clamp(_5082, 0.0, 1.0);
    float _5086 = -_5084;
    float _5088 = _5086 + 1.0;
    float _5090 = abs(_5088);
    float _5092 = log2(_5090);
    float _5094 = _5078 * _5046;
    float _5096 = _5078 * _5058;
    float _5098 = _5078 * _5054;
    float _5100 = _5094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5102 = -_5100;
    float _5104 = fma(_5096, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5102);
    float _5106 = -_5098;
    float _5108 = fma(_5106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5104);
    float _5110 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5112 = fma(_5108, -0.5, 0.5);
    float _5114 = fma(_5108, 0.5, 0.5);
    float _5116 = _5096 + 1.0;
    float _5118 = exp2(_5110);
    float _5120 = fma(_5114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5122 = fma(_5114, _5120, -0.212114393711090087890625);
    float _5124 = sqrt(_5112);
    float _5126 = fma(_5114, _5122, 1.570728778839111328125);
    float _5128 = -_5096;
    float _5130 = fma(_5118, _5116, _5128);
    float _5132 = fma(_5130, 0.5, 0.5);
    float _5134 = _5124 * 0.636619746685028076171875;
    float _5136 = -_5126;
    float _5138 = fma(_5134, _5136, 1.0);
    float2 _13171 = float2(_5138, _5132);
    float3 _5142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13171, float2(0.0), isnan(_13171)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13171, float2(0.0), isnan(_13171)), level(0.0)).xyz;
    float _5144 = _5142.x;
    float _5146 = _5142.y;
    float _5148 = _5142.z;
    float _5150 = abs(_4289);
    float _5152 = log2(_5150);
    float _5154 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5156 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5158 = -_4215;
    float _5160 = _5158 + 1.0;
    float _5162 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5154);
    out.m_95.x = _4535;
    out.m_95.y = _4531;
    out.m_95.z = _4537;
    bool _5164 = _4289 <= 8000.0;
    bool _5166 = isnan(_4289);
    bool _5168 = _5164 || _5166;
    bool _5170 = isnan(8000.0);
    bool _5172 = _5168 || _5170;
    float _5174 = float(_5172);
    float _5176 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5162);
    float _5178 = exp2(_5156);
    float _5180 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5176);
    float _5182 = _5152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5184 = exp2(_5182);
    float _5186 = -_5178;
    float _5188 = _5186 + 1.0;
    float _5190 = fma(_5184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5192 = precise::clamp(_5190, 0.0, 1.0);
    float _5194 = _5180 + _4733;
    float _5196 = fma(_5192, -2.0, 3.0);
    float _5198 = _5192 * _5192;
    float _5200 = _5198 * _5196;
    float _5202 = -_5200;
    float _5204 = _5202 + 1.0;
    float _5206 = fma(_5204, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5200);
    float _5208 = _5194 * 0.5;
    float _5210 = _5194;
    float _5212 = _4751;
    if (!_4717)
    {
        _5210 = 1.0;
    }
    float _5214 = _5210;
    float _5216 = _5174 * _5206;
    float _5218 = _5214;
    if (_4717)
    {
        bool _5220 = _4817 >= _4765;
        bool _5222 = isnan(_4817);
        bool _5224 = _5220 || _5222;
        bool _5226 = isnan(_4765);
        bool _5228 = _5224 || _5226;
        float _5230 = float(_5228);
        _5218 = _5230;
    }
    float _5232 = _5218;
    float _5234 = _5188 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4751;
    out.gl_Position.y = _4759;
    out.gl_Position.z = _5180;
    out.gl_Position.w = _4733;
    float _5236 = _5216 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5238 = _5232 * _4904;
    bool _5240 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5242 = isnan(_5064);
    bool _5244 = _5240 || _5242;
    bool _5246 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5248 = _5244 || _5246;
    float _5250 = _5160 * _5236;
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5234 * _4819;
    float _5256 = -_5234;
    float _5258 = _5256 + 1.0;
    out.m_97.z = _5208;
    out.m_97.w = _4733;
    float _5260 = -_5252;
    float _5262 = fma(_5260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5264 = _4830 * _5254;
    float _5266 = _4830 * _5258;
    float _5268 = -_5238;
    float _5270 = fma(_5268, _5262, 1.0);
    float _5272 = precise::clamp(_5270, 0.0, 1.0);
    float _5274 = _5272 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5276 = _5272;
    float _5278 = _5264;
    if (!_5248)
    {
        _5212 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5280 = _5212;
    float _5282 = _5280;
    float _5284 = _5280;
    if (!_5248)
    {
        _5276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5286 = _5276;
    out.m_99.x = _5274;
    float _5288 = _5148 * _5254;
    float _5290 = fma(_5144, _5264, _4824);
    float _5292 = fma(_5146, _5264, _4826);
    float _5294 = _5286;
    float _5296 = _5286;
    if (!_5248)
    {
        _5278 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5298 = _5278;
    float _5300 = fma(_4830, _5288, _4828);
    out.m_101.x = _5290;
    out.m_101.y = _5292;
    out.m_101.z = _5300;
    out.m_101.w = _5266;
    bool _5302 = !_5248;
    float _5304 = _5298;
    float _5306 = _5298;
    if (!_5302)
    {
        bool _5308 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5310 = isnan(_5064);
        bool _5312 = _5308 || _5310;
        bool _5314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5316 = _5312 || _5314;
        if (!_5316)
        {
            float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5320 = _5064 + _5318;
            float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5324 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5322;
            float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5332 = _5330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5334 = 1.0 / _5324;
            float _5336 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5338 = _5336 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5340 = _5320 * _5334;
            float _5342 = precise::clamp(_5340, 0.0, 1.0);
            float _5344 = fma(_5342, _5328, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5346 = fma(_5342, _5332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5348 = fma(_5342, _5338, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5306 = _5346;
            _5284 = _5344;
            _5296 = _5348;
            _5350 = true;
        }
        else
        {
            bool _5352 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5354 = isnan(_5064);
            bool _5356 = _5352 || _5354;
            bool _5358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5360 = _5356 || _5358;
            if (!_5360)
            {
                _5282 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5362 = _5282;
            _5284 = _5362;
            if (!_5360)
            {
                _5304 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5364 = _5304;
            _5306 = _5364;
            if (!_5360)
            {
                _5294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5366 = _5294;
            bool _5368 = !_5360;
            _5296 = _5366;
            if (!_5368)
            {
                bool _5370 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5372 = isnan(_5064);
                bool _5374 = _5370 || _5372;
                bool _5376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5378 = _5374 || _5376;
                if (!_5378)
                {
                    float _5380 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5382 = _5064 + _5380;
                    float _5384 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5386 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5384;
                    float _5388 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5390 = _5388 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5392 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5394 = _5392 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5396 = 1.0 / _5386;
                    float _5398 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5400 = _5398 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5402 = _5382 * _5396;
                    float _5404 = precise::clamp(_5402, 0.0, 1.0);
                    float _5406 = fma(_5404, _5390, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5408 = fma(_5404, _5394, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5410 = fma(_5404, _5400, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5306 = _5408;
                    _5284 = _5406;
                    _5296 = _5410;
                    _5350 = true;
                }
                else
                {
                    _5306 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5284 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5350 = false;
    float _5412 = _5306;
    float _5414 = _5284;
    float _5416 = _5296;
    float _5418 = _5412 * 0.586610972881317138671875;
    bool _5420 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _5422 = fma(_5414, 0.298911988735198974609375, _5418);
    out.m_103.x = 0.0;
    float _5424 = fma(_5416, 0.114477999508380889892578125, _5422);
    float _5426 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5428 = -_5424;
    float _5430 = _5428 + _5414;
    float _5432 = -_5424;
    float _5434 = _5432 + _5412;
    float _5436 = -_5424;
    float _5438 = _5436 + _5416;
    out.m_99.w = _5426;
    float _5440 = fma(_5430, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    float _5442 = fma(_5434, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    float _5444 = fma(_5438, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    out.m_105.x = _5440;
    out.m_105.y = _5442;
    out.m_105.z = _5444;
    if (!_5420)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5446 = -_4531;
    float _5448 = _5446 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5450 = -_4535;
    float _5452 = _5450 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5454 = -_4537;
    float _5456 = _5454 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5458 = _5448 * _5448;
    float _5460 = fma(_5452, _5452, _5458);
    float _5462 = fma(_5456, _5456, _5460);
    float _5464 = sqrt(_5462);
    float _5466 = rsqrt(_5462);
    float _5468 = -_5464;
    float _5470 = _5468 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5472 = _5470 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5474 = precise::clamp(_5472, 0.0, 1.0);
    float _5476 = _5452 * _5466;
    float _5478 = _5448 * _5466;
    float _5480 = abs(_5474);
    float _5482 = log2(_5480);
    float _5484 = _5456 * _5466;
    float _5486 = _5476 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5488 = _4107 * _5478;
    float _5490 = -_5478;
    float _5492 = -_5486;
    float _5494 = fma(_5490, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5492);
    float _5496 = fma(_4093, _5476, _5488);
    float _5498 = -_5484;
    float _5500 = fma(_5498, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5494);
    float _5502 = fma(_4119, _5484, _5496);
    float _5504 = precise::clamp(_5502, 0.0, 1.0);
    float _5506 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5508 = _5500 + _5506;
    float _5510 = _5482 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5512 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5514 = precise::clamp(_5512, 0.0, 1.0);
    float _5516 = exp2(_5510);
    float _5518 = _5516 * _5514;
    float _5520 = _5504 * _5518;
    float _5522 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5524 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5526 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _5522;
    out.m_103.y = _5524;
    out.m_103.z = _5526;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5350 = false;
    bool _4167 = false;
    bool _614 = false;
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
        float _5583 = as_type<float>(_140);
        out.gl_Position.z = _5583;
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
        float _5652 = as_type<float>(_178);
        out.gl_Position.z = _5652;
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
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _224 = 1.0 / _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = 1.0 / _218;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _238 = 1.0 / _234;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _250 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _252 = isnan(_210);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = 1.0 / _242;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _266 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _268 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _210 + _270;
    float _274 = 1.0 / _222;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = _210 + _276;
    float _280 = _272 * _224;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _210 + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _288 = _278 * _238;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _290;
    float _294 = _284 * _230;
    float _296 = 1.0 / _228;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _300 = fma(_292, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _306 = _210 + _304;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _312 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _314 = _306 * _262;
    float _316 = _308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _318 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _320 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _322 = isnan(_210);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _210 + _332;
    bool _336 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _338 = isnan(_210);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_260;
    float _350 = _348 + 1.0;
    out.m_67.x = _316;
    out.m_67.y = _312;
    out.m_67.z = _318;
    out.m_67.w = _236;
    float _352 = _334 * _296;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _356 = _210 + _354;
    out.m_69.x = _302;
    out.m_69.y = _266;
    out.m_69.z = _268;
    out.m_69.w = _264;
    float _358 = _356 * _274;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = fma(_362, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _366 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _368 = isnan(_210);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_330;
    float _380 = _378 + 1.0;
    float _382 = _346 * _350;
    float _384 = _376 * _380;
    float _386 = -_346;
    float _388 = _386 + 1.0;
    bool _390 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_210);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    bool _406 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _408 = isnan(_210);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _330 * _388;
    bool _420 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _422 = isnan(_210);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -_376;
    float _438 = _436 + 1.0;
    float _440 = fma(_404, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = -_430;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = _400 * _438;
    float _456 = -_400;
    float _458 = _456 + 1.0;
    float _460 = _416 * _448;
    float _462 = -_416;
    float _464 = _462 + 1.0;
    float _466 = fma(_434, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = _440 * _460;
    float _470 = _364 * _460;
    float _472 = fma(_444, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = fma(_452, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = _300 * _460;
    float _478 = _430 * _458;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _492;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _498;
    float _502 = fma(_482, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _504 = fma(_494, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = fma(_466, _478, _488);
    float _512 = fma(_472, _478, _490);
    float _514 = fma(_474, _478, _496);
    float _516 = fma(_500, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_486, _358, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_508, _358, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_502, _454, _510);
    float _528 = fma(_504, _454, _512);
    float _530 = fma(_520, _358, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _536;
    float _540 = fma(_516, _454, _514);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _542;
    float _546 = fma(_522, _384, _526);
    float _548 = fma(_524, _384, _528);
    float _550 = fma(_534, _288, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _552 = fma(_538, _288, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _554 = fma(_530, _384, _540);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _564 = fma(_544, _288, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _570 = fma(_550, _418, _546);
    float _572 = fma(_558, _314, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _574 = fma(_562, _314, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _576 = fma(_552, _418, _548);
    float _578 = fma(_568, _314, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _580 = fma(_564, _418, _554);
    float _582 = fma(_572, _382, _570);
    float _584 = fma(_574, _382, _576);
    float _586 = fma(_578, _382, _580);
    float _588 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].x, _582);
    float _590 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].y, _584);
    float _592 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].z, _586);
    bool _594 = !_286;
    float _612;
    if (!_594)
    {
        float _596 = in.m_65.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_124);
        float _618 = 1.0 / _616;
        float _620 = _158 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _626 = int(_624);
    float _628 = in.m_65.x;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _632 = _622 + _630;
    float _634 = in.m_65.y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _640 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _642 = int(_640);
    float _644 = in.m_71.x;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _650 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _652 = int(_650);
    float _654 = float(_626);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _672;
    float _676 = 1.0 / _654;
    float _678 = float(_642);
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _682 = int(_680);
    float _684 = float(uint(_652));
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _688 = ~_652;
    int _690 = _688 + 1;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _694 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _696 = isnan(_622);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _678;
    float _708 = _676 * _158;
    bool _710 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _712 = isnan(_622);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _724 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _726 = isnan(_622);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = float(uint(_682));
    float _738 = 1.0 / _684;
    int _740 = ~_682;
    int _742 = _740 + 1;
    float _744 = _706 * _158;
    float _746 = trunc(_708);
    int _748 = int(_746);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _756 = int(_754);
    int _758 = as_type<int>(_738) + (-2);
    float _760 = 1.0 / _736;
    float _762 = float(uint(_748));
    float _764 = trunc(_744);
    int _766 = int(_764);
    float _768 = float(_756);
    int _770 = as_type<int>(_760) + (-2);
    float _772 = as_type<float>(_758) * _762;
    float _774 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _776 = int(_774);
    float _778 = _762;
    float _780 = _772;
    float _782 = _768;
    bool _784 = _752;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_752)
    {
        _778 = 1.0;
    }
    float _788 = _778;
    float _790 = _788;
    if (!_752)
    {
        _790 = 7.345489978790283203125;
    }
    float _792 = _790;
    float _794 = float(uint(_766));
    float _796 = trunc(_772);
    float _798 = precise::max(_796, 0.0);
    uint _801 = uint(_798);
    float _803 = _792 * _628;
    float _805 = as_type<float>(_770) * _794;
    float _807 = in.m_65.z;
    float _809 = float(uint(_776));
    float _811 = trunc(_805);
    float _813 = precise::max(_811, 0.0);
    uint _815 = uint(_813);
    float _817 = _809;
    float _819 = _803;
    if (_752)
    {
        _780 = _628;
    }
    float _821 = _780;
    int _823 = ~_776;
    int _825 = _823 + 1;
    int _827 = _690 * int(_801);
    int _829 = _827 + _748;
    float _831 = 1.0 / _768;
    float _833 = in.m_65.w;
    float _835 = float(uint(_829));
    float _837 = as_type<float>(_829);
    float _839 = _821;
    int _841 = int(_801);
    if (_752)
    {
        _837 = 1.0;
    }
    float _843 = _837;
    float _845 = 1.0 / _809;
    float _847 = _843;
    if (_752)
    {
        _782 = 1.0;
    }
    float _849 = _782;
    float _851 = as_type<float>(_758) * _835;
    float _853 = _849;
    if (!_752)
    {
        _853 = 1.2345600128173828125;
    }
    float _855 = _853;
    int _857 = _742 * int(_815);
    int _859 = _857 + _766;
    float _861 = as_type<float>(_859);
    if (!_752)
    {
        _839 = _807;
    }
    float _863 = _839;
    float _865 = _628 + _807;
    if (!_752)
    {
        _847 = 5.839270114898681640625;
    }
    float _867 = _847;
    float _869 = trunc(_851);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    int _875 = as_type<int>(_867);
    if (_752)
    {
        _817 = _628;
    }
    float _877 = _817;
    float _879 = _831 * _158;
    float _881 = _877;
    if (!_752)
    {
        _881 = _634;
    }
    float _883 = _881;
    float _885 = _863 * _867;
    float _887 = float(uint(_859));
    float _889 = _865 + (-1.0);
    bool _891 = _807 > 0.5;
    float _893 = _883 * _855;
    float _895 = floor(_885);
    float _897 = as_type<float>(_770) * _887;
    bool _899 = _833 > 0.5;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    int _907 = int(_801) + int(_873);
    float _909 = floor(_893);
    float _911 = float(_124);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = trunc(_879);
    int _919 = int(_917);
    float _921 = _833;
    if (!_905)
    {
        _861 = _644;
    }
    float _923 = _861;
    float _925 = -_895;
    float _927 = _885 + _925;
    float _929 = _923;
    if (_905)
    {
        bool _931 = _628 > 0.5;
        _784 = _931;
    }
    bool _933 = _784;
    if (!_905)
    {
        _921 = _923;
    }
    float _935 = _921;
    float _937 = _935;
    if (_905)
    {
        _929 = _644;
    }
    float _939 = _929;
    float _941 = floor(_803);
    int _943 = ~_652;
    int _945 = _943 + 1;
    float _947 = float(_682);
    float _949 = _939;
    if (_905)
    {
        float _951 = -_939;
        float _953 = _951 + 1.0;
        _875 = as_type<int>(_953);
    }
    int _955 = _875;
    float _957 = -_909;
    float _959 = _893 + _957;
    int _961 = ~_682;
    int _963 = _961 + 1;
    float _965 = trunc(_897);
    float _967 = precise::max(_965, 0.0);
    uint _969 = uint(_967);
    if (_905)
    {
        float _971 = _933 ? as_type<float>(_955) : _939;
        _937 = _971;
    }
    float _973 = _937;
    int _975 = _945 * _907;
    int _977 = _975 + _748;
    int _979 = as_type<int>(_845) + (-2);
    if (_915)
    {
        float _981 = -_939;
        float _983 = _981 + 1.0;
        _841 = as_type<int>(_983);
    }
    int _985 = _841;
    float _987 = float(uint(_919));
    float _989 = float(_652);
    float _991 = 1.0 / _911;
    float _993 = -_941;
    float _995 = _803 + _993;
    float _997 = float(_748);
    float _999 = float(_776);
    float _1001 = _995 * _989;
    bool _1003 = _997 >= _989;
    bool _1005 = isnan(_997);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(_989);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _989 * _158;
    int _1017 = int(_815) + int(_969);
    float _1019 = as_type<float>(_979) * _987;
    float _1021 = float(_766);
    float _1023 = 1.0 / _638;
    bool _1025 = uint(_977) >= uint(_652);
    if (!_915)
    {
        _819 = _939;
    }
    float _1027 = _819;
    float _1029 = _1015 * _991;
    float _1031 = _991 * _158;
    bool _1033 = _1021 >= _947;
    bool _1035 = isnan(_1021);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_947);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = trunc(_1019);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = float(_919);
    float _1053 = _947 * _959;
    float _1055 = _1027;
    if (_915)
    {
        float _1057 = _891 ? as_type<float>(_985) : _939;
        _1055 = _1057;
    }
    float _1059 = _1055;
    float _1061 = _947 * _1031;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1065 = _1063 != 0;
    float _1067 = trunc(_1013);
    int _1069 = int(_1067);
    bool _1071 = _1051 >= _999;
    bool _1073 = isnan(_1051);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_999);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _999 * _927;
    int _1085 = _963 * _1017;
    int _1087 = _1085 + _766;
    float _1089 = trunc(_1001);
    int _1091 = int(_1089);
    float _1093 = _999 * _1031;
    bool _1095 = uint(_1087) >= uint(_682);
    bool _1097 = !_1025;
    int _1099 = _1097 ? 0 : (-1);
    int _1101 = _825 * int(_1049);
    int _1103 = _1101 + _919;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1107 = _1105 != 0;
    float _1109 = trunc(_1053);
    int _1111 = int(_1109);
    bool _1113 = !_1095;
    int _1115 = _1113 ? 0 : (-1);
    float _1117 = float(uint(_1103));
    bool _1119 = !_1107;
    int _1121 = _1119 ? 0 : 1;
    int _1123 = ~_1017;
    int _1125 = _1123 + _1115;
    int _1127 = _1125 + 1;
    float _1129 = trunc(_1043);
    int _1131 = int(_1129);
    float _1133 = as_type<float>(_979) * _1117;
    int _1135 = abs(_1121);
    int _1137 = ~_907;
    int _1139 = _1137 + _1099;
    int _1141 = _1139 + 1;
    int _1143 = _682 * _1127;
    int _1145 = _1143 + _766;
    bool _1147 = !_1065;
    int _1149 = _1147 ? 0 : 1;
    int _1151 = _1091 * _1135;
    int _1153 = _1151 + _748;
    float _1155 = trunc(_1133);
    float _1157 = precise::max(_1155, 0.0);
    uint _1159 = uint(_1157);
    int _1161 = abs(_1149);
    int _1163 = _652 * _1141;
    int _1165 = _1163 + _748;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1169 = _1167 != 0;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1177 = _1175 != 0;
    float _1179 = in.m_71.y;
    bool _1181 = _652 == 0;
    int _1183 = _1111 * _1161;
    int _1185 = _1183 + _766;
    bool _1187 = _682 == 0;
    float _1189 = trunc(_1029);
    int _1191 = int(_1189);
    int _1193 = ~_1069;
    int _1195 = _1193 + 1;
    int _1197 = _1195 + 1;
    bool _1199 = !_1181;
    int _1201 = _1199 ? _1165 : (-1);
    bool _1203 = !_1173;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = ~_1131;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    int _1213 = _1201 * _1197;
    bool _1215 = !_1187;
    int _1217 = _1215 ? _1145 : (-1);
    float _1219 = trunc(_1081);
    int _1221 = int(_1219);
    int _1223 = abs(_1205);
    int _1225 = _682 + (-1);
    int _1227 = _1211 * _1217;
    int _1229 = int(_1049) + int(_1159);
    int _1231 = _652 + (-1);
    int _1233 = _1131 * _1225;
    int _1235 = _1233 + _1227;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1239 = _1237 != 0;
    float _1241 = trunc(_1083);
    int _1243 = int(_1241);
    bool _1245 = !_1169;
    int _1247 = _1245 ? 0 : 1;
    int _1249 = _1069 * _1231;
    int _1251 = _1249 + _1213;
    bool _1253 = !_1239;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = -_1179;
    float _1259 = _1257 + 1.0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1267 = _1265 != 0;
    int _1269 = _1251 * _1223;
    bool _1271 = !_1177;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = 1.0 / _648;
    int _1277 = abs(_1247);
    bool _1279 = !_1267;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = ~_776;
    int _1285 = _1283 + 1;
    int _1287 = _1191 * _1277;
    int _1289 = _1287 + _1269;
    int _1291 = abs(_1281);
    int _1293 = abs(_1273);
    int _1295 = _1285 * _1229;
    int _1297 = _1295 + _919;
    bool _1299 = _634 > 0.5;
    float _1301 = trunc(_1061);
    int _1303 = int(_1301);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1307 = _1305 != 0;
    int _1309 = _1235 * _1291;
    int _1311 = _899 ? as_type<int>(_1259) : as_type<int>(_1179);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1319 = _1317 != 0;
    int _1321 = _1153 * _1293;
    int _1323 = _1321 + _1289;
    int _1325 = abs(_1255);
    int _1327 = _1299 ? as_type<int>(_1259) : as_type<int>(_1179);
    bool _1329 = !_1263;
    int _1331 = _1329 ? 0 : 1;
    int _1333 = _1091 * _1325;
    int _1335 = _1333 + _1323;
    bool _1337 = uint(_1297) >= uint(_776);
    float _1339 = _1307 ? as_type<float>(_1327) : _1179;
    bool _1341 = !_1319;
    int _1343 = _1341 ? 0 : 1;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1347 = _1345 != 0;
    bool _1349 = !_1337;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = abs(_1331);
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1357 = _1355 != 0;
    int _1359 = abs(_1343);
    int _1361 = _1303 * _1353;
    int _1363 = _1361 + _1309;
    bool _1365 = !_1315;
    int _1367 = _1365 ? 0 : 1;
    bool _1369 = !_1347;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1229;
    int _1375 = _1373 + _1351;
    int _1377 = _1375 + 1;
    float _1379 = float(uint(_1335));
    float _1381 = _1357 ? as_type<float>(_1311) : _1179;
    int _1383 = abs(_1367);
    float _1385 = as_type<float>(_758) * _1379;
    int _1387 = abs(_1371);
    int _1389 = _776 * _1377;
    int _1391 = _1389 + _919;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1395 = _1393 != 0;
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1399 = _1397 != 0;
    int _1401 = _1185 * _1383;
    int _1403 = _1401 + _1363;
    bool _1405 = _776 == 0;
    int _1407 = _1243 * _1387;
    int _1409 = _1407 + _919;
    float _1411 = trunc(_1385);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    int _1417 = ~_1221;
    int _1419 = _1417 + 1;
    int _1421 = _1419 + 1;
    bool _1423 = !_1405;
    int _1425 = _1423 ? _1391 : (-1);
    int _1427 = _1111 * _1359;
    int _1429 = _1427 + _1403;
    int _1431 = _776 + (-1);
    int _1433 = ~_652;
    int _1435 = _1433 + 1;
    int _1437 = _1421 * _1425;
    bool _1439 = !_1399;
    int _1441 = _1439 ? 0 : 1;
    float _1443 = trunc(_1093);
    int _1445 = int(_1443);
    bool _1447 = !_1395;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1221 * _1431;
    int _1453 = _1451 + _1437;
    int _1455 = abs(_1441);
    float _1457 = float(uint(_1429));
    int _1459 = _1435 * int(_1415);
    int _1461 = _1459 + _1335;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1465 = _1463 != 0;
    int _1467 = _1453 * _1455;
    int _1469 = abs(_1449);
    float _1471 = as_type<float>(_770) * _1457;
    bool _1473 = !_1465;
    int _1475 = _1473 ? 0 : 1;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1479 = _1477 != 0;
    float _1481 = float(uint(_1461));
    float _1483 = trunc(_1471);
    float _1485 = precise::max(_1483, 0.0);
    uint _1487 = uint(_1485);
    bool _1489 = !_1479;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1445 * _1469;
    int _1495 = _1493 + _1467;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1499 = _1497 != 0;
    float _1501 = as_type<float>(_758) * _1481;
    float _1503 = float(uint(_1153));
    int _1505 = abs(_1475);
    int _1507 = abs(_1491);
    float _1509 = as_type<float>(_758) * _1503;
    float _1511 = trunc(_1501);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = _1409 * _1505;
    int _1519 = _1517 + _1495;
    int _1521 = ~_682;
    int _1523 = _1521 + 1;
    bool _1525 = _807 > 0.5;
    int _1527 = _1243 * _1507;
    int _1529 = _1527 + _1519;
    int _1531 = ~_652;
    int _1533 = _1531 + 1;
    float _1535 = trunc(_1509);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    float _1541 = _1179;
    int _1543 = _1533;
    if (_1499)
    {
        float _1545 = _1525 ? _1259 : _1179;
        _1541 = _1545;
    }
    float _1547 = _1541;
    int _1549 = _1523 * int(_1487);
    int _1551 = _1549 + _1429;
    float _1553 = float(uint(_1529));
    int _1555 = ~_776;
    int _1557 = _1555 + 1;
    float _1559 = float(uint(_1551));
    float _1561 = as_type<float>(_979) * _1553;
    int _1563 = int(_1415) + int(_1515);
    float _1565 = as_type<float>(_770) * _1559;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1569 = _1567 != 0;
    float _1571 = trunc(_1561);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    bool _1577 = _652 == 0;
    int _1579 = _1533 * int(_1539);
    int _1581 = _1579 + _1153;
    bool _1583 = _682 == 0;
    float _1585 = float(uint(_1581));
    float _1587 = trunc(_1565);
    float _1589 = precise::max(_1587, 0.0);
    uint _1591 = uint(_1589);
    int _1593 = _1533 * _1563;
    int _1595 = _1593 + _1335;
    float _1597 = as_type<float>(_758) * _1585;
    if (_1569)
    {
        float _1599 = -_939;
        float _1601 = _1599 + 1.0;
        _1543 = as_type<int>(_1601);
    }
    int _1603 = _1543;
    bool _1605 = uint(_1595) >= uint(_652);
    float _1607 = float(uint(_1185));
    float _1609 = trunc(_1597);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    bool _1615 = !_1605;
    int _1617 = _1615 ? 0 : (-1);
    if (_1569)
    {
        float _1619 = _1299 ? as_type<float>(_1603) : _939;
        _949 = _1619;
    }
    float _1621 = _949;
    int _1623 = ~_1563;
    int _1625 = _1623 + _1617;
    int _1627 = _1625 + 1;
    int _1629 = int(_1487) + int(_1591);
    float _1631 = as_type<float>(_770) * _1607;
    int _1633 = _1557 * int(_1575);
    int _1635 = _1633 + _1529;
    int _1637 = ~_682;
    int _1639 = _1637 + 1;
    int _1641 = _652 * _1627;
    int _1643 = _1641 + _1335;
    float _1645 = trunc(_1631);
    float _1647 = precise::max(_1645, 0.0);
    uint _1649 = uint(_1647);
    int _1651 = ~_682;
    int _1653 = _1651 + 1;
    float _1655 = float(uint(_1635));
    bool _1657 = !_1577;
    int _1659 = _1657 ? _1643 : (-1);
    float _1661 = as_type<float>(_979) * _1655;
    float _1663 = float(uint(_1409));
    int _1665 = int(_1539) + int(_1613);
    int _1667 = _1653 * _1629;
    int _1669 = _1667 + _1429;
    float _1671 = as_type<float>(_979) * _1663;
    int _1673 = _1659 & 3;
    bool _1675 = _1673 != 0;
    float _1677 = trunc(_1661);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    int _1683 = _1659 & 3;
    bool _1685 = _1683 != 0;
    int _1687 = _1639 * int(_1649);
    int _1689 = _1687 + _1185;
    bool _1691 = uint(_1673) > 1u;
    int _1693 = _1685 ? 0 : 1;
    bool _1695 = uint(_1669) >= uint(_682);
    float _1697 = trunc(_1671);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    float _1703 = float(uint(_1689));
    bool _1705 = !_1695;
    int _1707 = _1705 ? 0 : (-1);
    int _1709 = ~_776;
    int _1711 = _1709 + 1;
    float _1713 = as_type<float>(_770) * _1703;
    int _1715 = ~_1629;
    int _1717 = _1715 + _1707;
    int _1719 = _1717 + 1;
    bool _1721 = _1673 != 3;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = _682 * _1719;
    int _1731 = _1729 + _1429;
    float _1733 = trunc(_1713);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    int _1739 = _1727;
    if (!_1691)
    {
        int _1741 = ~_1693;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = _1435 * _1665;
    int _1749 = _1747 + _1153;
    bool _1751 = uint(_1673) >= 2u;
    int _1753 = _1711 * int(_1701);
    int _1755 = _1753 + _1409;
    int _1757 = int(_1575) + int(_1681);
    int _1759 = _1751 ? 0 : 1;
    bool _1761 = !_1583;
    int _1763 = _1761 ? _1731 : (-1);
    bool _1765 = uint(_1749) >= uint(_652);
    int _1767 = ~_1759;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = float(uint(_1755));
    int _1775 = _1711 * _1757;
    int _1777 = _1775 + _1529;
    int _1779 = _1771;
    if (_1721)
    {
        int _1781 = ~_1759;
        int _1783 = _1781 + 1;
        _1779 = _1783;
    }
    int _1785 = _1779;
    int _1787 = _1763 & 3;
    bool _1789 = _1787 != 0;
    float _1791 = as_type<float>(_979) * _1773;
    int _1793 = ~_682;
    int _1795 = _1793 + 1;
    int _1797 = _1789 ? 0 : 1;
    bool _1799 = uint(_1777) >= uint(_776);
    float _1801 = trunc(_1791);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    int _1807 = int(_1649) + int(_1737);
    bool _1809 = !_1799;
    int _1811 = _1809 ? 0 : (-1);
    bool _1813 = uint(_1787) > 1u;
    bool _1815 = !_1765;
    int _1817 = _1815 ? 0 : (-1);
    bool _1819 = uint(_1787) >= 2u;
    int _1821 = ~_1757;
    int _1823 = _1821 + _1811;
    int _1825 = _1823 + 1;
    int _1827 = _1795 * _1807;
    int _1829 = _1827 + _1185;
    int _1831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1833 = _1831 != 0;
    int _1835 = _1819 ? 0 : 1;
    int _1837 = _776 * _1825;
    int _1839 = _1837 + _1529;
    bool _1841 = _1787 != 3;
    float _1843 = _628 * 2.0;
    int _1845 = ~_1797;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    float _1851 = _634 * 2.0;
    int _1853 = _1849;
    if (!_1813)
    {
        int _1855 = ~_1797;
        int _1857 = _1855 + 1;
        _1853 = _1857;
    }
    int _1859 = _1853;
    bool _1861 = uint(_1829) >= uint(_682);
    float _1863 = floor(_1843);
    bool _1865 = !_1405;
    int _1867 = _1865 ? _1839 : (-1);
    bool _1869 = !_1861;
    int _1871 = _1869 ? 0 : (-1);
    bool _1873 = !_1675;
    int _1875 = _1873 ? 0 : 1;
    int _1877 = _1763 & 3;
    bool _1879 = _1877 != 0;
    float _1881 = floor(_1851);
    if (_1833)
    {
        _786 = 0;
    }
    int _1883 = _786;
    int _1885 = _1867 & 3;
    bool _1887 = _1885 != 0;
    int _1889 = _1883;
    if (!_1833)
    {
        _1889 = 1;
    }
    int _1891 = _1889;
    int _1893 = int(_1701) + int(_1805);
    int _1895 = ~_1835;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    bool _1901 = !_1879;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1899;
    int _1907 = _1891;
    if (_1841)
    {
        int _1909 = ~_1835;
        int _1911 = _1909 + 1;
        _1905 = _1911;
    }
    int _1913 = _1905;
    bool _1915 = _1885 != 3;
    bool _1917 = _1891 != 1;
    if (_1833)
    {
        _1907 = 0;
    }
    int _1919 = _1907;
    int _1921 = _1919;
    if (!_1833)
    {
        _1921 = 2;
    }
    int _1923 = _1921;
    int _1925 = ~_776;
    int _1927 = _1925 + 1;
    bool _1929 = uint(_1885) >= 2u;
    bool _1931 = uint(_1885) > 1u;
    int _1933 = _1887 ? 0 : 1;
    int _1935 = _1929 ? 0 : 1;
    bool _1937 = _1923 != 2;
    int _1939 = _1927 * _1893;
    int _1941 = _1939 + _1409;
    int _1943 = ~_1935;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    int _1949 = _1947;
    float _1951 = as_type<float>(_1927);
    if (_1915)
    {
        int _1953 = ~_1935;
        int _1955 = _1953 + 1;
        _1949 = _1955;
    }
    int _1957 = _1949;
    bool _1959 = uint(_1941) >= uint(_776);
    float _1961 = 0.0;
    if (!_1917)
    {
        _1961 = _634;
    }
    float _1963 = _1961;
    int _1965 = ~_1933;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1969;
    float _1973 = _1963;
    if (!_1931)
    {
        int _1975 = ~_1933;
        int _1977 = _1975 + 1;
        _1971 = _1977;
    }
    int _1979 = _1971;
    bool _1981 = !_1959;
    int _1983 = _1981 ? 0 : (-1);
    float _1985 = 0.0;
    if (!_1917)
    {
        _1985 = _1963;
    }
    float _1987 = _1985;
    bool _1989 = _1863 > 0.0;
    bool _1991 = _1863 >= 0.0;
    bool _1993 = isnan(_1863);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.0);
    bool _1999 = _1995 || _1997;
    float _2001 = _1987;
    if (_1917)
    {
        _1973 = _634;
    }
    float _2003 = _1973;
    float _2005 = in.m_73.x;
    float _2007 = in.m_73.y;
    float _2009 = in.m_73.z;
    float _2011 = _2003;
    if (!_1917)
    {
        _1951 = _1987;
    }
    float _2013 = _1951;
    float _2015 = 0.0;
    float _2017 = _2013;
    if (!_1917)
    {
        _2015 = _807;
    }
    float _2019 = _2015;
    float _2021 = 0.0;
    float _2023 = _2019;
    if (!_1917)
    {
        _2021 = _807;
    }
    float _2025 = _2021;
    float _2027 = _2025;
    if (_1917)
    {
        _2017 = _628;
    }
    float _2029 = _2017;
    if (_1917)
    {
        _2001 = _628;
    }
    float _2031 = _2001;
    if (_1917)
    {
        _2023 = _2003;
    }
    float _2033 = _2023;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1917)
    {
        _2027 = _2003;
    }
    float _2037 = _2027;
    bool _2039 = _1881 > 0.0;
    float _2041 = -_686;
    float _2043 = fma(_2035, 2.0, _2041);
    int _2045 = _1999 ? 0 : 1;
    float _2047 = 0.0;
    if (_1937)
    {
        _2047 = _628;
    }
    float _2049 = _2047;
    float _2051 = _2049;
    if (!_1937)
    {
        _2051 = _807;
    }
    float _2053 = _2051;
    if (!_1937)
    {
        _2011 = _628;
    }
    float _2055 = _2011;
    float _2057 = _592 * _2009;
    bool _2059 = _1881 >= 0.0;
    bool _2061 = isnan(_1881);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan(0.0);
    bool _2067 = _2063 || _2065;
    float _2069 = _588 * _2005;
    int _2071 = _1867 & 3;
    bool _2073 = _2071 != 0;
    float _2075 = _634 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2077 = ~_2045;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2085 = _2081;
    if (!_1989)
    {
        int _2087 = ~_2045;
        int _2089 = _2087 + 1;
        _2085 = _2089;
    }
    int _2091 = _2085;
    float _2093 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _2095 = !_2073;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = fma(_2083, -2.0, _722);
    bool _2101 = _1673 != 3;
    float _2103 = _2069 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2105 = _2067 ? 0 : 1;
    float _2107 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2099);
    bool _2109 = _1787 != 3;
    bool _2111 = _1885 != 3;
    float _2113 = _590 * _2007;
    bool _2115 = !_2101;
    int _2117 = _2115 ? 0 : (-1);
    int _2119 = ~_2105;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    bool _2125 = !_2109;
    int _2127 = _2125 ? 0 : (-1);
    bool _2129 = !_2111;
    int _2131 = _2129 ? 0 : (-1);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2143 = _2141 != 0;
    int _2145 = _2123;
    if (!_2039)
    {
        int _2147 = ~_2105;
        int _2149 = _2147 + 1;
        _2145 = _2149;
    }
    int _2151 = _2145;
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2155 = _2153 != 0;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2159 = _2157 != 0;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2163 = _2161 != 0;
    float _2165 = in.m_58.x;
    float _2167 = in.m_58.y;
    float _2169 = in.m_58.z;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2177 = _2175 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2179 = !_2135;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2185 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2187 = 1.0 / _2177;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2191 = !_2139;
    int _2193 = _2191 ? 0 : 1;
    float _2195 = fma(_2075, -2.0, _2189);
    bool _2197 = !_2143;
    int _2199 = _2197 ? 0 : 1;
    float _2201 = 1.0 / _2173;
    float _2203 = -_2183;
    float _2205 = fma(_2185, 2.0, _2203);
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2209 = _2207 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2211 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2213 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2215 = abs(_2193);
    float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2219 = _2217 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2221 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2229 = _2227 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2231 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2213);
    float _2233 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2221);
    float _2235 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2211);
    float _2237 = 1.0 / _2209;
    float _2239 = _2225 * _1023;
    float _2241 = _2229 * _1275;
    float _2243 = _662 * _2201;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2247 = _2245 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2249 = _658 * _2187;
    float _2251 = _628 + _634;
    float _2253 = _807 * 2.0;
    float _2255 = 1.0 / _2219;
    float _2257 = in.m_75.x;
    float _2259 = in.m_75.y;
    float _2261 = in.m_75.z;
    float _2263 = _2251 + (-1.0);
    float _2265 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2233);
    float _2267 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2235);
    float _2269 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2231);
    float _2271 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2273 = _622 + _2271;
    float _2275 = 1.0 / _2247;
    float _2277 = _666 * _2237;
    float _2279 = fma(_2243, _2273, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2281 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2285 = _670 * _2255;
    float _2287 = _634 + _807;
    float _2289 = floor(_2253);
    float _2291 = -_2283;
    float _2293 = fma(_2281, 2.0, _2291);
    float _2295 = _2287 + (-1.0);
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2299 = _674 * _2275;
    float _2301 = fma(_2263, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2303 = fma(_2295, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2259);
    float _2307 = _2113 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2309 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2297);
    float _2311 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2313 = -_704;
    float _2315 = _2313 + 1.0;
    float _2317 = _2305 * _2307;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2321 = _622 + _2319;
    float _2323 = fma(_2311, -2.0, _692);
    bool _2325 = _2289 >= 0.0;
    bool _2327 = isnan(_2289);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(0.0);
    bool _2333 = _2329 || _2331;
    float _2335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2261);
    float _2337 = fma(_2239, _2321, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2341 = _622 + _2339;
    int _2343 = _2333 ? 0 : 1;
    float _2345 = _2335 * _2093;
    bool _2347 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2349 = isnan(_622);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2355 = _2351 || _2353;
    float _2357 = float(_2355);
    float _2359 = fma(_2249, _2341, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2361 = _2289 > 0.0;
    float _2363 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2365 = log2(_2363);
    float _2367 = _2357 * _2315;
    float _2369 = -_2357;
    float _2371 = _2369 + 1.0;
    int _2373 = ~_2343;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2383 = _622 + _2381;
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2387 = 1.0 + _2385;
    float _2389 = _720 * _2371;
    float _2391 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2379);
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2395 = _2377;
    float _2397 = _2337;
    float _2399 = as_type<float>(_2215);
    float _2401 = as_type<float>(_2151);
    if (!_2361)
    {
        int _2403 = ~_2343;
        int _2405 = _2403 + 1;
        _2395 = _2405;
    }
    int _2407 = _2395;
    float _2409 = 1.0 / _2387;
    bool _2411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2419 = _2415 || _2417;
    float _2421 = _2365 * _158;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2425 = fma(_2241, _2383, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2429 = _622 + _2427;
    float _2431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2257);
    float _2433 = exp2(_2421);
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2437 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2439 = isnan(_622);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2393);
    float _2451 = fma(_2277, _2429, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2453 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2435);
    float _2455 = -_720;
    float _2457 = _2455 + 1.0;
    float _2459 = _2431 * _2103;
    float _2461 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2309);
    float _2463 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2453);
    float _2465 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2449);
    float _2467 = -_158;
    float _2469 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2293);
    float _2471 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2391);
    float _2473 = -_158;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2043);
    float _2477 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2323);
    float _2479 = _2447 * _2457;
    float _2481 = -_2433;
    float _2483 = _2481 + 1.0;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2487 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2195);
    bool _2489 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2491 = isnan(_622);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    float _2501 = _2419 ? _2483 : 0.0;
    float _2503 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2485);
    bool _2505 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2507 = isnan(1.0);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2513 = _2509 || _2511;
    float _2515 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2423);
    float _2517 = -_158;
    float _2519 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2205);
    float _2521 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2503);
    float _2523 = -_2447;
    float _2525 = _2523 + 1.0;
    float _2527 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2515);
    bool _2529 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2531 = isnan(_622);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2537 = _2533 || _2535;
    float _2539 = float(_2537);
    float _2541 = -_2499;
    float _2543 = _2541 + 1.0;
    bool _2545 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2547 = isnan(_622);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = _634 + (-0.5);
    float _2559 = float(_2407);
    float _2561 = _2539 * _2525;
    float _2563 = -_2539;
    float _2565 = _2563 + 1.0;
    float _2567 = _2557;
    if (_2513)
    {
        float _2569 = _2501 * _2409;
        _162 = _2569;
    }
    float _2571 = _162;
    bool _2573 = _2259 != 0.0;
    bool _2575 = isnan(_2259);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(0.0);
    bool _2581 = _2577 || _2579;
    float _2583 = in.m_77.x;
    float _2585 = in.m_77.y;
    float _2587 = in.m_77.z;
    float _2589 = _2499 * _2565;
    int _2591 = abs(_2181);
    float _2593 = _2555 * _2543;
    bool _2595 = _2257 == 0.0;
    bool _2597 = !_2581;
    bool _2599 = _2595 && _2597;
    float _2601 = in.m_79.x;
    float _2603 = in.m_79.y;
    float _2605 = in.m_79.z;
    float _2607 = -_2555;
    float _2609 = _2607 + 1.0;
    float _2611 = float(_2591);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2615 = _622 + _2613;
    bool _2617 = _2261 == 0.0;
    bool _2619 = _2617 && _2599;
    float _2621 = _734 * _2609;
    float _2623 = fma(_2285, _632, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2625 = float(_2091);
    float _2627 = _2611 * _2559;
    float _2629 = _2337 * _2621;
    float _2631 = float(_2215);
    float _2633 = -_734;
    float _2635 = _2633 + 1.0;
    float _2637 = _2627 * (-2.0);
    float _2639 = float(_2151);
    float _2641 = fma(_2299, _2615, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2643 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2629);
    int _2645 = ~_1807;
    int _2647 = _2645 + _1871;
    int _2649 = _2647 + 1;
    int _2651 = ~_1893;
    int _2653 = _2651 + _1983;
    int _2655 = _2653 + 1;
    float _2657 = fma(_2425, _2593, _2643);
    if (_2619)
    {
        _2397 = _2583;
    }
    float _2659 = _2397;
    int _2661 = _682 * _2649;
    int _2663 = _2661 + _1185;
    int _2665 = abs(_1875);
    float _2667 = fma(_2359, _2589, _2657);
    float _2669 = _2659;
    if (_2619)
    {
        _2399 = _2659;
    }
    float _2671 = _2399;
    float _2673 = _807 + (-0.5);
    float _2675 = _2671;
    if (!_2619)
    {
        _2669 = _2583;
    }
    float _2677 = _2669;
    float _2679 = _2631 * _2625;
    float _2681 = _2267 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2683 = fma(_2301, _2637, _2301);
    float _2685 = fma(_2637, _2601, _2601);
    float _2687 = _2265 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2689 = -_2681;
    float _2691 = _2689 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _628 + (-0.5);
    float _2695 = _2269 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2697 = -_2687;
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2701 = _2691 * _2691;
    float _2703 = fma(_2693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2685);
    int _2705 = abs(_2199);
    float _2707 = -_2695;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2711 = fma(_2699, _2699, _2701);
    float _2713 = fma(_2683, _2571, _2703);
    float _2715 = fma(_2279, _2561, _2667);
    float _2717 = fma(_2709, _2709, _2711);
    float _2719 = as_type<float>(_2705);
    if (_2619)
    {
        _2719 = _2585;
    }
    float _2721 = _2719;
    float _2723 = _2679 * (-2.0);
    float _2725 = float(_2705);
    float _2727 = _2713 * 0.15915493667125701904296875;
    float _2729 = _2721;
    float _2731 = _2725;
    if (_2619)
    {
        _2401 = _2721;
    }
    float _2733 = _2401;
    float _2735 = rsqrt(_2717);
    float _2737 = _2733;
    if (!_2619)
    {
        _2729 = _2585;
    }
    float _2739 = _2729;
    float _2741 = fma(_2723, _2603, _2603);
    float _2743 = _2725 * _2639;
    float _2745 = fma(_2303, _2723, _2303);
    if (_2619)
    {
        _2731 = _2587;
    }
    float _2747 = _2731;
    float _2749 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2741);
    float _2751 = _2743 * (-2.0);
    float _2753 = _2727 * 6.283185482025146484375;
    float _2755 = sin(_2753);
    float _2757 = _2747;
    if (_2619)
    {
        _2567 = _2747;
    }
    float _2759 = _2567;
    float _2761 = fma(_2745, _2571, _2749);
    float _2763 = fma(_2751, _2605, _2605);
    float _2765 = fma(_901, _2751, _901);
    float _2767 = _2759;
    if (!_2619)
    {
        _2757 = _2587;
    }
    float _2769 = _2757;
    float _2771 = _2761 * 0.15915493667125701904296875;
    float _2773 = fma(_2673, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2763);
    float _2775 = _2699 * _2735;
    float _2777 = _2709 * _2735;
    float _2779 = in.m_81.x;
    float _2781 = in.m_81.y;
    float _2783 = in.m_81.z;
    float _2785 = in.m_81.w;
    float _2787 = _2691 * _2735;
    float _2789 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2791 = _2775 * _2789;
    float _2793 = fma(_2765, _2571, _2773);
    float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2797 = _2777 * _2795;
    float _2799 = _2727 * 6.283185482025146484375;
    float _2801 = cos(_2799);
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2805 = -_2791;
    float _2807 = fma(_2777, _2803, _2805);
    float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2811 = _2787 * _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2815 = -_2797;
    float _2817 = fma(_2787, _2813, _2815);
    if (!_2619)
    {
        float _2819 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2677);
        _2675 = _2819;
    }
    float _2821 = _2675;
    float _2823 = fma(_2451, _2479, _2715);
    float _2825 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2827 = -_2811;
    float _2829 = fma(_2775, _2825, _2827);
    float _2831 = _2793 * 0.15915493667125701904296875;
    float _2833 = _2771 * 6.283185482025146484375;
    float _2835 = sin(_2833);
    float _2837 = _2807 * _2807;
    float _2839 = fma(_2623, _2389, _2823);
    if (!_2619)
    {
        float _2841 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2739);
        _2737 = _2841;
    }
    float _2843 = _2737;
    if (!_2619)
    {
        float _2845 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2769);
        _2767 = _2845;
    }
    float _2847 = _2767;
    float _2849 = fma(_2817, _2817, _2837);
    float _2851 = fma(_2641, _2367, _2839);
    int _2853 = _776 * _2655;
    int _2855 = _2853 + _1409;
    float _2857 = _2771 * 6.283185482025146484375;
    float _2859 = cos(_2857);
    float _2861 = fma(_2829, _2829, _2849);
    int _2863 = abs(_2131);
    float _2865 = _2781 * _2769;
    float _2867 = _2783 * _2677;
    float _2869 = _2779 * _2739;
    bool _2871 = _652 == 0;
    float _2873 = _2831 * 6.283185482025146484375;
    float _2875 = cos(_2873);
    float _2877 = -_2865;
    float _2879 = fma(_2783, _2739, _2877);
    float _2881 = -_2867;
    float _2883 = fma(_2779, _2769, _2881);
    float _2885 = -_2869;
    float _2887 = fma(_2781, _2677, _2885);
    float _2889 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2851);
    float _2891 = _2879 * _2785;
    float _2893 = _2883 * _2785;
    float _2895 = _2887 * _2785;
    float _2897 = _2831 * 6.283185482025146484375;
    float _2899 = sin(_2897);
    out.m_83.x = _2889;
    float _2901 = _2801 * _2859;
    float _2903 = _2755 * _2835;
    float _2905 = _2801 * _2835;
    float _2907 = _2755 * _2859;
    bool _2909 = _682 == 0;
    float _2911 = rsqrt(_2861);
    float _2913 = _2859 * _2875;
    float _2915 = _2801 * _2875;
    float _2917 = _2755 * _2875;
    int _2919 = _1763 >> 31;
    float _2921 = _2835 * _2875;
    int _2923 = _1867 >> 31;
    float _2925 = -_2317;
    float _2927 = _2899 * _2925;
    float _2929 = -_2905;
    float _2931 = fma(_2899, _2907, _2929);
    int _2933 = _2919 & 3;
    float _2935 = -_2907;
    float _2937 = fma(_2899, _2905, _2935);
    int _2939 = _2923 & 3;
    int _2941 = _1763 + _2933;
    float _2943 = _2817 * _2911;
    float _2945 = _2807 * _2911;
    float _2947 = _2829 * _2911;
    float _2949 = fma(_2899, _2901, _2903);
    float _2951 = fma(_2899, _2903, _2901);
    float _2953 = fma(_2913, _2459, _2927);
    float _2955 = _2915 * _2317;
    int _2957 = _1659 >> 31;
    float _2959 = _2917 * _2317;
    float _2961 = fma(_2921, _2345, _2953);
    float _2963 = fma(_2949, _2459, _2955);
    int _2965 = _2957 & 3;
    float _2967 = fma(_2931, _2459, _2959);
    int _2969 = _1867 + _2939;
    float _2971 = fma(_2937, _2345, _2963);
    int _2973 = _1659 + _2965;
    float _2975 = fma(_2951, _2345, _2967);
    int _2977 = _2941 >> 2;
    float _2979 = _2777 * _2945;
    int _2981 = _2973 >> 2;
    float _2983 = _2775 * _2947;
    int _2985 = _2977 << 4;
    int _2987 = _2985 + 512;
    float _2989 = _2787 * _2943;
    int _2991 = _2981 << 4;
    int _2993 = _2991 + 368;
    float _2995 = -_2983;
    float _2997 = fma(_2777, _2943, _2995);
    uint _2999 = uint(int(uint(_2987) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    int _3015 = _2969 >> 2;
    float _3017 = -_2989;
    float _3019 = fma(_2775, _2945, _3017);
    int _3021 = ~_1665;
    int _3023 = _3021 + _1817;
    int _3025 = _3023 + 1;
    float _3027 = -_2979;
    float _3029 = fma(_2787, _2947, _3027);
    int _3031 = _3015 << 4;
    int _3033 = _3031 + 656;
    float _3035 = _2949 * _2997;
    float _3037 = _2949 * _3019;
    uint _3039 = uint(int(uint(_2993) >> uint(2)));
    uint _3041 = uint(int(uint(int(_3039)) >> uint(2)));
    int _3043 = int(_3039) & 3;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[int(_3041)][_3043];
    int _3047 = int(_3039) + 1;
    uint _3049 = uint(int(uint(_3047) >> uint(2)));
    int _3051 = _3047 & 3;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[int(_3049)][_3051];
    float _3055 = _2949 * _3029;
    float _3057 = fma(_2913, _2945, _3035);
    float _3059 = _2915 * _3029;
    float _3061 = _2915 * _2997;
    float _3063 = fma(_2913, _2943, _3055);
    float _3065 = _2915 * _3019;
    float _3067 = fma(_2913, _2947, _3037);
    uint _3069 = uint(int(uint(_3033) >> uint(2)));
    uint _3071 = uint(int(uint(int(_3069)) >> uint(2)));
    int _3073 = int(_3069) & 3;
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[int(_3071)][_3073];
    int _3077 = int(_3069) + 1;
    uint _3079 = uint(int(uint(_3077) >> uint(2)));
    int _3081 = _3077 & 3;
    float _3083 = (*spvDescriptorSet0.vp_c9)._m0[int(_3079)][_3081];
    float _3085 = _2937 * _3029;
    float _3087 = _2937 * _2997;
    float _3089 = _2937 * _3019;
    float _3091 = -_2899;
    float _3093 = fma(_3091, _2943, _3059);
    float _3095 = -_2899;
    float _3097 = fma(_3095, _2945, _3061);
    float _3099 = -_2899;
    float _3101 = fma(_3099, _2947, _3065);
    float _3103 = fma(_2921, _2943, _3085);
    float _3105 = fma(_2921, _2945, _3087);
    float _3107 = fma(_2921, _2947, _3089);
    float _3109 = _3029 * _2971;
    float _3111 = _2997 * _2971;
    float _3113 = _3019 * _2971;
    int _3115 = abs(_1745);
    int _3117 = _2993 + 8;
    uint _3119 = uint(int(uint(_3117) >> uint(2)));
    uint _3121 = uint(int(uint(int(_3119)) >> uint(2)));
    int _3123 = int(_3119) & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    int _3127 = int(_3119) + 1;
    uint _3129 = uint(int(uint(_3127) >> uint(2)));
    int _3131 = _3127 & 3;
    float _3133 = (*spvDescriptorSet0.vp_c9)._m0[int(_3129)][_3131];
    int _3135 = abs(_1859);
    int _3137 = _652 * _3025;
    int _3139 = _3137 + _1153;
    int _3141 = abs(_1979);
    float _3143 = fma(_2943, _2961, _3109);
    float _3145 = fma(_2945, _2961, _3111);
    int _3147 = _2987 + 8;
    uint _3149 = uint(int(uint(_3147) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    int _3165 = ~_3115;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = fma(_2947, _2961, _3113);
    int _3173 = ~_3135;
    int _3175 = _3173 + 1;
    int _3177 = _3175 + 1;
    float _3179 = fma(_2917, _2777, _3101);
    float _3181 = fma(_2931, _2775, _3063);
    bool _3183 = !_2909;
    int _3185 = _3183 ? _2663 : (-1);
    int _3187 = _3033 + 8;
    uint _3189 = uint(int(uint(_3187) >> uint(2)));
    uint _3191 = uint(int(uint(int(_3189)) >> uint(2)));
    int _3193 = int(_3189) & 3;
    float _3195 = (*spvDescriptorSet0.vp_c9)._m0[int(_3191)][_3193];
    int _3197 = int(_3189) + 1;
    uint _3199 = uint(int(uint(_3197) >> uint(2)));
    int _3201 = _3197 & 3;
    float _3203 = (*spvDescriptorSet0.vp_c9)._m0[int(_3199)][_3201];
    int _3205 = ~_3141;
    int _3207 = _3205 + 1;
    int _3209 = _3207 + 1;
    int _3211 = _3177 * as_type<int>(_3013);
    int _3213 = abs(_2097);
    float _3215 = fma(_2917, _2775, _3093);
    int _3217 = abs(_1785);
    float _3219 = fma(_2931, _2787, _3057);
    bool _3221 = !_1405;
    int _3223 = _3221 ? _2855 : (-1);
    float _3225 = fma(_2777, _2975, _3171);
    int _3227 = ~_3217;
    int _3229 = _3227 + 1;
    int _3231 = _3229 + 1;
    int _3233 = _3169 * as_type<int>(_3053);
    int _3235 = abs(_1903);
    float _3237 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3239 = int(_3237);
    int _3241 = ~_3235;
    int _3243 = _3241 + 1;
    int _3245 = _3243 + 1;
    int _3247 = _3209 * as_type<int>(_3083);
    int _3249 = ~_3213;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    float _3255 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3257 = int(_3255);
    int _3259 = ~_2665;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    int _3265 = _3245 * as_type<int>(_3005);
    int _3267 = _3265 + _3211;
    int _3269 = abs(_2117);
    int _3271 = _3253 * as_type<int>(_3075);
    int _3273 = _3271 + _3247;
    int _3275 = abs(_1913);
    int _3277 = _3263 * as_type<int>(_3045);
    int _3279 = _3277 + _3233;
    int _3281 = abs(_2127);
    float _3283 = _2695 + _3225;
    int _3285 = ~_3275;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    float _3291 = _2893 * _3215;
    int _3293 = ~_3281;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    int _3299 = _3231 * as_type<int>(_3125);
    int _3301 = _3299 + _3279;
    int _3303 = abs(_1957);
    float _3305 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3307 = int(_3305);
    float _3309 = float(uint(_3239));
    int _3311 = ~_3303;
    int _3313 = _3311 + 1;
    int _3315 = _3313 + 1;
    int _3317 = ~_3269;
    int _3319 = _3317 + 1;
    int _3321 = _3319 + 1;
    int _3323 = _3289 * as_type<int>(_3155);
    int _3325 = _3323 + _3267;
    bool _3327 = !_2871;
    int _3329 = _3327 ? _3139 : (-1);
    float _3331 = 1.0 / _3309;
    int _3333 = ~_3239;
    int _3335 = _3333 + 1;
    int _3337 = _3297 * as_type<int>(_3163);
    int _3339 = _3337 + _3325;
    bool _3341 = !_2155;
    int _3343 = _3341 ? 0 : 1;
    int _3345 = _3321 * as_type<int>(_3133);
    int _3347 = _3345 + _3301;
    bool _3349 = !_2159;
    int _3351 = _3349 ? 0 : 1;
    int _3353 = _3315 * as_type<int>(_3195);
    int _3355 = _3353 + _3273;
    int _3357 = abs(_3343);
    float _3359 = _3179 * _2843;
    int _3361 = ~_3357;
    int _3363 = _3361 + 1;
    int _3365 = _3363 + 1;
    float _3367 = float(uint(_3257));
    int _3369 = ~_2863;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    int _3375 = _3347 * _3365;
    int _3377 = abs(_3351);
    float _3379 = fma(_2775, _2975, _3143);
    int _3381 = abs(_3257);
    float _3383 = 1.0 / _3367;
    float _3385 = float(uint(_3307));
    int _3387 = _3373 * as_type<int>(_3203);
    int _3389 = _3387 + _3355;
    bool _3391 = !_2163;
    int _3393 = _3391 ? 0 : 1;
    int _3395 = _3329 * _3357;
    int _3397 = _3395 + _3375;
    int _3399 = abs(_3239);
    float _3401 = fma(_2931, _2777, _3067);
    float _3403 = 1.0 / _3385;
    int _3405 = ~_3377;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    float _3411 = _2687 + _3379;
    int _3413 = abs(_3393);
    float _3415 = fma(_2951, _2775, _3103);
    float _3417 = float(uint(_3399));
    int _3419 = _3409 * _3339;
    int _3421 = ~_3413;
    int _3423 = _3421 + 1;
    int _3425 = _3423 + 1;
    float _3427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3429 = _3283 + _3427;
    float _3431 = float(uint(_3381));
    int _3433 = _3185 * _3377;
    int _3435 = _3433 + _3419;
    int _3437 = as_type<int>(_3331) + (-2);
    float _3439 = 1.0 / _3417;
    float _3441 = float(uint(_3397));
    int _3443 = _3425 * _3389;
    int _3445 = abs(_3307);
    float _3447 = _3429 * _3429;
    int _3449 = as_type<int>(_3383) + (-2);
    float _3451 = as_type<float>(_3437) * _3441;
    int _3453 = _3223 * _3413;
    int _3455 = _3453 + _3443;
    float _3457 = 1.0 / _3431;
    float _3459 = float(uint(_3435));
    float _3461 = fma(_2917, _2787, _3097);
    float _3463 = float(uint(_3445));
    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3467 = _3411 + _3465;
    int _3469 = as_type<int>(_3403) + (-2);
    float _3471 = as_type<float>(_3449) * _3459;
    float _3473 = float(uint(_3455));
    float _3475 = trunc(_3451);
    float _3477 = precise::max(_3475, 0.0);
    uint _3479 = uint(_3477);
    int _3481 = as_type<int>(_3439) + (-2);
    float _3483 = _3467 * _3467;
    int _3485 = abs(_3397);
    float _3487 = fma(_2787, _2975, _3145);
    int _3489 = abs(_3435);
    float _3491 = _3483 + _3447;
    int _3493 = ~_3257;
    int _3495 = _3493 + 1;
    float _3497 = 1.0 / _3463;
    float _3499 = as_type<float>(_3469) * _3473;
    float _3501 = float(uint(_3485));
    float _3503 = fma(_2951, _2777, _3107);
    int _3505 = as_type<int>(_3457) + (-2);
    float _3507 = fma(_2951, _2787, _3105);
    float _3509 = float(uint(_3489));
    float _3511 = as_type<float>(_3481) * _3501;
    float _3513 = trunc(_3471);
    float _3515 = precise::max(_3513, 0.0);
    uint _3517 = uint(_3515);
    int _3519 = abs(_3455);
    int _3521 = _3335 * int(_3479);
    int _3523 = _3521 + _3397;
    float _3525 = as_type<float>(_3505) * _3509;
    int _3527 = ~_3307;
    int _3529 = _3527 + 1;
    float _3531 = _3461 * _2843;
    float _3533 = float(uint(_3519));
    float _3535 = _2893 * _3461;
    float _3537 = trunc(_3499);
    float _3539 = precise::max(_3537, 0.0);
    uint _3541 = uint(_3539);
    int _3543 = as_type<int>(_3497) + (-2);
    int _3545 = ~_3381;
    int _3547 = _3545 + 1;
    int _3549 = ~_3445;
    int _3551 = _3549 + 1;
    float _3553 = as_type<float>(_3543) * _3533;
    float _3555 = float(uint(_3523));
    float _3557 = trunc(_3511);
    float _3559 = precise::max(_3557, 0.0);
    uint _3561 = uint(_3559);
    int _3563 = _3495 * int(_3517);
    int _3565 = _3563 + _3435;
    float _3567 = as_type<float>(_3437) * _3555;
    float _3569 = float(uint(_3565));
    float _3571 = _3461 * _2781;
    float _3573 = trunc(_3525);
    float _3575 = precise::max(_3573, 0.0);
    uint _3577 = uint(_3575);
    int _3579 = _3529 * int(_3541);
    int _3581 = _3579 + _3455;
    float _3583 = as_type<float>(_3449) * _3569;
    int _3585 = ~_3399;
    int _3587 = _3585 + 1;
    float _3589 = fma(_3219, _2779, _3571);
    float _3591 = float(uint(_3581));
    float _3593 = _3179 * _2781;
    float _3595 = trunc(_3553);
    float _3597 = precise::max(_3595, 0.0);
    uint _3599 = uint(_3597);
    float _3601 = _2893 * _3179;
    float _3603 = as_type<float>(_3469) * _3591;
    float _3605 = _3215 * _2781;
    int _3607 = _3587 * int(_3561);
    int _3609 = _3607 + _3485;
    float _3611 = fma(_3401, _2779, _3593);
    float _3613 = sqrt(_3491);
    int _3615 = _3547 * int(_3577);
    int _3617 = _3615 + _3489;
    float _3619 = _3215 * _2843;
    float _3621 = float(uint(_3609));
    float _3623 = fma(_3181, _2779, _3605);
    float _3625 = float(uint(_3617));
    float _3627 = as_type<float>(_3481) * _3621;
    float _3629 = trunc(_3567);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = _3551 * int(_3599);
    int _3637 = _3635 + _3519;
    float _3639 = fma(_3181, _2821, _3619);
    float _3641 = as_type<float>(_3505) * _3625;
    float _3643 = fma(_2891, _3181, _3291);
    float _3645 = fma(_2891, _3219, _3535);
    float _3647 = float(uint(_3637));
    float _3649 = fma(_3219, _2821, _3531);
    bool _3651 = _3613 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3653 = trunc(_3583);
    float _3655 = precise::max(_3653, 0.0);
    uint _3657 = uint(_3655);
    float _3659 = fma(_3401, _2821, _3359);
    float _3661 = as_type<float>(_3543) * _3647;
    float _3663 = _2681 + _3487;
    float _3665 = trunc(_3603);
    float _3667 = precise::max(_3665, 0.0);
    uint _3669 = uint(_3667);
    float _3671 = _2779;
    float _3673 = _3483;
    float _3675 = _3283;
    float _3677 = _3447;
    float _3679 = _3411;
    float _3681 = as_type<float>(_3455);
    if (!_3651)
    {
        _3671 = _3483;
    }
    float _3683 = _3671;
    float _3685 = _3683;
    if (!_3651)
    {
        _3673 = _3283;
    }
    float _3687 = _3673;
    float _3689 = trunc(_3627);
    float _3691 = precise::max(_3689, 0.0);
    uint _3693 = uint(_3691);
    float _3695 = _3687;
    if (!_3651)
    {
        _3675 = _3663;
    }
    float _3697 = _3675;
    float _3699 = trunc(_3641);
    float _3701 = precise::max(_3699, 0.0);
    uint _3703 = uint(_3701);
    bool _3705 = !_3651;
    float _3707 = _3697;
    if (!_3705)
    {
        float _3709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3713 = _3613 + _3711;
        float _3715 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3717 = rsqrt(_3491);
        float _3719 = _3713 * _3709;
        float _3721 = _3719 * 0.15915493667125701904296875;
        float _3723 = _3721 * 6.283185482025146484375;
        float _3725 = sin(_3723);
        float _3727 = _3721 * 6.283185482025146484375;
        float _3729 = cos(_3727);
        float _3731 = fma(_3725, _3715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3733 = _3717 * _3731;
        float _3735 = _3729 + (-1.0);
        float _3737 = fma(_3467, _3733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3739 = fma(_3429, _3733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3741 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3745 = _3737 + _3743;
        float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3749 = _3739 + _3747;
        float _3751 = fma(_3663, _3729, _3741);
        float _3753 = _3745 * _3745;
        float _3755 = _3749 * _3749;
        _3707 = _3751;
        _3685 = _3753;
        _3677 = _3755;
        _3679 = _3737;
        _3695 = _3739;
    }
    float _3757 = _3707;
    float _3759 = _3685;
    float _3761 = _3677;
    float _3763 = _3679;
    float _3765 = _3695;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3769 = _3757 + _3767;
    int _3771 = int(_3479) + int(_3633);
    float _3773 = fma(_2891, _3401, _3601);
    int _3775 = ~_3239;
    int _3777 = _3775 + 1;
    float _3779 = fma(_3769, _3769, _3759);
    int _3781 = int(_3517) + int(_3657);
    float _3783 = trunc(_3661);
    float _3785 = precise::max(_3783, 0.0);
    uint _3787 = uint(_3785);
    int _3789 = int(_3541) + int(_3669);
    float _3791 = _3779 + _3761;
    int _3793 = int(_3577) + int(_3703);
    int _3795 = _3777 * _3771;
    int _3797 = _3795 + _3397;
    int _3799 = ~_3257;
    int _3801 = _3799 + 1;
    float _3803 = fma(_3415, _2783, _3623);
    int _3805 = ~_3307;
    int _3807 = _3805 + 1;
    float _3809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3811 = ~_3381;
    int _3813 = _3811 + 1;
    int _3815 = _3801 * _3781;
    int _3817 = _3815 + _3435;
    int _3819 = int(_3561) + int(_3693);
    int _3821 = _3807 * _3789;
    int _3823 = _3821 + _3455;
    int _3825 = ~_3399;
    int _3827 = _3825 + 1;
    int _3829 = _3813 * _3793;
    int _3831 = _3829 + _3489;
    bool _3833 = uint(_3797) >= uint(_3239);
    float _3835 = sqrt(_3791);
    bool _3837 = uint(_3817) >= uint(_3257);
    int _3839 = _3827 * _3819;
    int _3841 = _3839 + _3485;
    bool _3843 = uint(_3823) >= uint(_3307);
    float _3845 = fma(_3507, _2783, _3589);
    bool _3847 = uint(_3831) >= uint(_3381);
    float _3849 = fma(_3503, _2783, _3611);
    bool _3851 = !_3833;
    int _3853 = _3851 ? 0 : (-1);
    float _3855 = _3809 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3857 = uint(_3841) >= uint(_3399);
    bool _3859 = !_3837;
    int _3861 = _3859 ? 0 : (-1);
    float _3863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3865 = !_3843;
    int _3867 = _3865 ? 0 : (-1);
    float _3869 = fma(_3855, _973, -0.5);
    int _3871 = ~_3771;
    int _3873 = _3871 + _3853;
    int _3875 = _3873 + 1;
    out.m_85.x = _3803;
    out.m_85.y = _3845;
    out.m_85.z = _3849;
    int _3877 = int(_3599) + int(_3787);
    int _3879 = ~_3445;
    int _3881 = _3879 + 1;
    float _3883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3885 = ~_3781;
    int _3887 = _3885 + _3861;
    int _3889 = _3887 + 1;
    int _3891 = ~_3789;
    int _3893 = _3891 + _3867;
    int _3895 = _3893 + 1;
    int _3897 = _3881 * _3877;
    int _3899 = _3897 + _3519;
    bool _3901 = _3239 == 0;
    bool _3903 = _3239 == 0;
    int _3905 = _3307 * _3895;
    int _3907 = _3905 + _3455;
    int _3909 = _3397 ^ _3239;
    int _3911 = _3239 * _3875;
    int _3913 = _3911 + _3397;
    bool _3915 = !_3857;
    int _3917 = _3915 ? 0 : (-1);
    float _3919 = _3863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3921 = _3257 == 0;
    bool _3923 = _3257 == 0;
    float _3925 = fma(_1339, _3919, -0.5);
    int _3927 = _3435 ^ _3257;
    int _3929 = _3257 * _3889;
    int _3931 = _3929 + _3435;
    bool _3933 = !_3901;
    int _3935 = _3933 ? _3913 : (-1);
    float _3937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3939 = !_3847;
    int _3941 = _3939 ? 0 : (-1);
    bool _3943 = uint(_3899) >= uint(_3445);
    bool _3945 = _3307 == 0;
    bool _3947 = _3307 == 0;
    float _3949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3951 = _3455 ^ _3307;
    float _3953 = float(_3935);
    float _3955 = _3883 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3957 = ~_3917;
    int _3959 = _3819 + _3957;
    int _3961 = _3959 + 1;
    bool _3963 = !_3943;
    int _3965 = _3963 ? 0 : (-1);
    float _3967 = fma(_3855, _3953, _2519);
    uint _3969 = uint(int(uint(_3927) >> uint(31)));
    float _3971 = _3937 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3973 = uint(int(uint(_3909) >> uint(31)));
    float _3975 = fma(_3955, _1059, -0.5);
    uint _3977 = uint(int(uint(_3951) >> uint(31)));
    float _3979 = fma(_3971, _1621, -0.5);
    bool _3981 = !_3921;
    int _3983 = _3981 ? _3931 : (-1);
    float _3985 = fma(_2465, _3869, _3967);
    bool _3987 = !_3945;
    int _3989 = _3987 ? _3907 : (-1);
    int _3991 = ~_3941;
    int _3993 = _3793 + _3991;
    int _3995 = _3993 + 1;
    int _3997 = ~int(_3969);
    int _3999 = _3997 + 1;
    int _4001 = ~_3965;
    int _4003 = _3877 + _4001;
    int _4005 = _4003 + 1;
    int _4007 = ~int(_3973);
    int _4009 = _4007 + 1;
    float _4011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4013 = ~int(_3977);
    int _4015 = _4013 + 1;
    float _4017 = float(_3983);
    float _4019 = float(_3989);
    int _4021 = _3995 ^ _3999;
    float _4023 = fma(_3955, _4017, _2475);
    int _4025 = _3961 ^ _4009;
    float _4027 = fma(_3971, _4019, _2469);
    int _4029 = _4005 ^ _4015;
    float _4031 = fma(_2471, _3975, _4023);
    int _4033 = ~_3999;
    int _4035 = _4033 + _4021;
    int _4037 = _4035 + 1;
    float _4039 = _3949 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4041 = ~_4009;
    int _4043 = _4041 + _4025;
    int _4045 = _4043 + 1;
    float _4047 = _4011 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4049 = ~_4015;
    int _4051 = _4049 + _4029;
    int _4053 = _4051 + 1;
    float _4055 = fma(_1381, _4039, -0.5);
    bool _4057 = !_3923;
    int _4059 = _4057 ? _4037 : (-1);
    float _4061 = fma(_2463, _3979, _4027);
    bool _4063 = !_3903;
    int _4065 = _4063 ? _4045 : (-1);
    float _4067 = _4031 + 0.5;
    bool _4069 = !_3947;
    int _4071 = _4069 ? _4053 : (-1);
    float _4073 = _4061 + 0.5;
    float _4075 = float(_4059);
    float _4077 = fma(_2895, _3503, _3773);
    float _4079 = float(_4065);
    float _4081 = float(_4071);
    float _4083 = -_2477;
    float _4085 = fma(_4039, _4075, _4083);
    float _4087 = fma(_4047, _1547, -0.5);
    float _4089 = -_2487;
    float _4091 = fma(_3919, _4079, _4089);
    float _4093 = fma(_3415, _2847, _3639);
    float _4095 = -_2107;
    float _4097 = fma(_4047, _4081, _4095);
    float _4099 = fma(_2461, _4055, _4085);
    float _4101 = fma(_2521, _3925, _4091);
    float _4103 = fma(_2895, _3415, _3643);
    float _4105 = fma(_2527, _4087, _4097);
    float _4107 = fma(_3507, _2847, _3649);
    float _4109 = fma(_2895, _3507, _3645);
    float _4111 = _3985 + 0.5;
    float _4113 = _4101 + 0.5;
    float _4115 = _4099 + 0.5;
    float _4117 = _4105 + 0.5;
    float _4119 = fma(_3503, _2847, _3659);
    out.m_87.x = _4103;
    out.m_87.y = _4109;
    out.m_87.z = _4077;
    bool _4121 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4123 = isnan(_3835);
    bool _4125 = _4121 || _4123;
    bool _4127 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4129 = _4125 || _4127;
    out.m_89.x = _4111;
    out.m_89.y = _4113;
    out.m_89.z = _4067;
    out.m_89.w = _4115;
    out.m_91.x = _4073;
    out.m_91.y = _4117;
    out.m_93.x = _4093;
    out.m_93.y = _4107;
    out.m_93.z = _4119;
    int _4131 = as_type<int>(_3757);
    if (!_4129)
    {
        _3681 = 1.0;
    }
    float _4133 = _3681;
    bool _4135 = !_4129;
    float _4137 = _4133;
    if (!_4135)
    {
        bool _4139 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4141 = isnan(_3835);
        bool _4143 = _4139 || _4141;
        bool _4145 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4147 = _4143 || _4145;
        if (!_4147)
        {
            float _4149 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4151 = _3835 + _4149;
            float _4153 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4155 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4153;
            float _4157 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4159 = _4157 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4161 = 1.0 / _4155;
            float _4163 = _4151 * _4161;
            float _4165 = fma(_4163, _4159, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4137 = _4165;
            _4167 = true;
        }
        else
        {
            bool _4169 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4171 = isnan(_3835);
            bool _4173 = _4169 || _4171;
            bool _4175 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4177 = _4173 || _4175;
            if (!_4177)
            {
                float _4179 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4181 = _3835 + _4179;
                float _4183 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4185 = _4183 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4187 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4189 = _4187 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4191 = 1.0 / _4185;
                float _4193 = _4181 * _4191;
                float _4195 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4137 = _4195;
                _4167 = true;
            }
            else
            {
                _4137 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4167 = false;
    float _4197 = _4137;
    float _4199 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4201 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4203 = floor(_4199);
    float _4205 = floor(_4201);
    float _4207 = -_4203;
    float _4209 = _4199 + _4207;
    float _4211 = -_4205;
    float _4213 = _4201 + _4211;
    float2 _11630 = float2(_4209, _4213);
    float _4215 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11630, float2(0.0), isnan(_11630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11630, float2(0.0), isnan(_11630)), level(0.0)).x;
    float _4217 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4219 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4221 = _3763 + _4219;
    float _4223 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4217);
    float _4225 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4227 = _3765 + _4225;
    float _4229 = fma(_4221, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4231 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4223);
    float _4233 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4235 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4237 = fma(_4227, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4239 = _4231 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4241 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4233);
    float _4243 = _2681 + _4235;
    float _4245 = 1.0 / _4239;
    float _4247 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4241);
    float _4249 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4251 = _4247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4253 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4249);
    float _4255 = _4251 + _4239;
    float _4257 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4253);
    float _4259 = _4257 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4261 = _4255 * _4245;
    float _4263 = _4261 * 0.5;
    bool _4265 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4267 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4269 = _4265 || _4267;
    bool _4271 = isnan(0.5);
    bool _4273 = _4269 || _4271;
    float _4275 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4277 = fma(_4263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4275);
    float _4279 = 1.0 / _4277;
    float _4281 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    int _4283 = 2;
    if (_4273)
    {
        _4281 = _4237;
    }
    float _4285 = _4281;
    float _4287 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4289 = _4279 * _4287;
    float _4291 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _4293 = _4289 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4295 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4291);
    bool _4297 = _4289 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4299 = !_4293;
    int _4301 = _4299 ? 0 : 1;
    float _4303 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4295);
    float _4305 = _4303 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4307 = _4285;
    if (!_4293)
    {
        _4283 = 1;
    }
    int _4309 = _4283;
    float _4311 = trunc(_4305);
    int _4313 = int(_4311);
    int _4315 = _4309;
    if (!_4297)
    {
        _4315 = _4301;
    }
    int _4317 = _4315;
    int _4319 = _4317 << 6;
    float _4321 = trunc(_4259);
    int _4323 = int(_4321);
    int _4325 = _4319 + 48;
    uint _4327 = uint(int(uint(_4325) >> uint(2)));
    uint _4329 = uint(int(uint(int(_4327)) >> uint(2)));
    int _4331 = int(_4327) & 3;
    float _4333 = (*spvDescriptorSet0.vp_c15)._m0[int(_4329)][_4331];
    int _4335 = int(_4327) + 1;
    uint _4337 = uint(int(uint(_4335) >> uint(2)));
    int _4339 = _4335 & 3;
    float _4341 = (*spvDescriptorSet0.vp_c15)._m0[int(_4337)][_4339];
    int _4343 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4345 = _4313 + _4343;
    int _4347 = _4345 + 1;
    int _4349 = _4319 + 56;
    uint _4351 = uint(int(uint(_4349) >> uint(2)));
    uint _4353 = uint(int(uint(int(_4351)) >> uint(2)));
    int _4355 = int(_4351) & 3;
    float _4357 = (*spvDescriptorSet0.vp_c15)._m0[int(_4353)][_4355];
    int _4359 = int(_4351) + 1;
    uint _4361 = uint(int(uint(_4359) >> uint(2)));
    int _4363 = _4359 & 3;
    float _4365 = (*spvDescriptorSet0.vp_c15)._m0[int(_4361)][_4363];
    int _4367 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4369 = _4323 + _4367;
    int _4371 = _4369 + 1;
    int _4373 = _4319 + 64;
    uint _4375 = uint(int(uint(_4373) >> uint(2)));
    uint _4377 = uint(int(uint(int(_4375)) >> uint(2)));
    int _4379 = int(_4375) & 3;
    float _4381 = (*spvDescriptorSet0.vp_c15)._m0[int(_4377)][_4379];
    int _4383 = int(_4375) + 1;
    uint _4385 = uint(int(uint(_4383) >> uint(2)));
    int _4387 = _4383 & 3;
    float _4389 = (*spvDescriptorSet0.vp_c15)._m0[int(_4385)][_4387];
    bool _4391 = _4371 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4393 = _4371 | _4347;
    int _4395 = _4319 + 72;
    uint _4397 = uint(int(uint(_4395) >> uint(2)));
    uint _4399 = uint(int(uint(int(_4397)) >> uint(2)));
    int _4401 = int(_4397) & 3;
    float _4403 = (*spvDescriptorSet0.vp_c15)._m0[int(_4399)][_4401];
    int _4405 = int(_4397) + 1;
    uint _4407 = uint(int(uint(_4405) >> uint(2)));
    int _4409 = _4405 & 3;
    float _4411 = (*spvDescriptorSet0.vp_c15)._m0[int(_4407)][_4409];
    bool _4413 = _4393 < 0;
    bool _4415 = _4413 || _4391;
    float _4417 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4419 = _3757 + _4417;
    bool _4421 = _4347 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4423 = _4421 || _4415;
    float _4425 = fma(_4419, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4427 = _4419;
    float _4429 = as_type<float>(_4323);
    int _4431 = _4347;
    float _4433 = as_type<float>(_4317);
    if (_4273)
    {
        _4427 = _4229;
    }
    float _4435 = _4427;
    int _4437 = _4319 + 96;
    uint _4439 = uint(int(uint(_4437) >> uint(2)));
    uint _4441 = uint(int(uint(int(_4439)) >> uint(2)));
    int _4443 = int(_4439) & 3;
    float _4445 = (*spvDescriptorSet0.vp_c15)._m0[int(_4441)][_4443];
    int _4447 = int(_4439) + 1;
    uint _4449 = uint(int(uint(_4447) >> uint(2)));
    int _4451 = _4447 & 3;
    float _4453 = (*spvDescriptorSet0.vp_c15)._m0[int(_4449)][_4451];
    float _4455 = _4435;
    if (_4273)
    {
        _4429 = _4425;
    }
    float _4457 = _4429;
    int _4459 = _4319 + 104;
    uint _4461 = uint(int(uint(_4459) >> uint(2)));
    uint _4463 = uint(int(uint(int(_4461)) >> uint(2)));
    int _4465 = int(_4461) & 3;
    float _4467 = (*spvDescriptorSet0.vp_c15)._m0[int(_4463)][_4465];
    int _4469 = int(_4461) + 1;
    uint _4471 = uint(int(uint(_4469) >> uint(2)));
    int _4473 = _4469 & 3;
    float _4475 = (*spvDescriptorSet0.vp_c15)._m0[int(_4471)][_4473];
    float _4477 = _4457;
    int _4479 = as_type<int>(_4475);
    if (!_4273)
    {
        float _4481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4483 = _2681 + _4481;
        float _4485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4487 = _2687 + _4485;
        float _4489 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4491 = _4483 * _4483;
        float _4493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4495 = _2695 + _4493;
        float _4497 = fma(_4487, _4487, _4491);
        float _4499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4501 = fma(_4495, _4495, _4497);
        float _4503 = sqrt(_4501);
        float _4505 = _4489 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4507 = -_2681;
        float _4509 = _4507 + _4425;
        float _4511 = precise::min(_4503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4513 = _4511 * _4499;
        float _4515 = -_2695;
        float _4517 = _4515 + _4237;
        float _4519 = _4505 * _4513;
        float _4521 = -_2687;
        float _4523 = _4521 + _4229;
        float _4525 = fma(_4509, _4519, _2681);
        float _4527 = fma(_4523, _4519, _2687);
        float _4529 = fma(_4517, _4519, _2695);
        _4477 = _4525;
        _4131 = as_type<int>(_4519);
        _4455 = _4527;
        _4307 = _4529;
    }
    float _4531 = _4477;
    int _4533 = _4131;
    float _4535 = _4455;
    float _4537 = _4307;
    float _4539 = _4243 * _4453;
    float _4541 = _4243 * _4341;
    int _4543 = _4533;
    if (!_4423)
    {
        int _4545 = _4347 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4547 = _4545 + _4371;
        _4543 = _4547;
    }
    int _4549 = _4543;
    float _4551 = _4243 * _4389;
    float _4553 = fma(_2687, _4445, _4539);
    float _4555 = fma(_2687, _4333, _4541);
    float _4557 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4559 = _4319 + 80;
    uint _4561 = uint(int(uint(_4559) >> uint(2)));
    uint _4563 = uint(int(uint(int(_4561)) >> uint(2)));
    int _4565 = int(_4561) & 3;
    float _4567 = (*spvDescriptorSet0.vp_c15)._m0[int(_4563)][_4565];
    int _4569 = int(_4561) + 1;
    uint _4571 = uint(int(uint(_4569) >> uint(2)));
    int _4573 = _4569 & 3;
    float _4575 = (*spvDescriptorSet0.vp_c15)._m0[int(_4571)][_4573];
    float _4577 = fma(_2695, _4467, _4553);
    if (!_4423)
    {
        int _4579 = _4549 << 2;
        _4431 = _4579;
    }
    int _4581 = _4431;
    float _4583 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4557);
    float _4585 = fma(_2687, _4381, _4551);
    float _4587 = _4577 + _4475;
    int _4589 = _4581;
    if (!_4423)
    {
        uint _4591 = uint(int(uint(_4549) >> uint(2)));
        _4479 = int(_4591);
    }
    int _4593 = _4479;
    float _4595 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4583);
    if (!_4423)
    {
        int _4597 = 12 & _4581;
        _4589 = _4597;
    }
    int _4599 = _4589;
    int _4601 = _4319 + 88;
    uint _4603 = uint(int(uint(_4601) >> uint(2)));
    uint _4605 = uint(int(uint(int(_4603)) >> uint(2)));
    int _4607 = int(_4603) & 3;
    float _4609 = (*spvDescriptorSet0.vp_c15)._m0[int(_4605)][_4607];
    int _4611 = int(_4603) + 1;
    uint _4613 = uint(int(uint(_4611) >> uint(2)));
    int _4615 = _4611 & 3;
    float _4617 = (*spvDescriptorSet0.vp_c15)._m0[int(_4613)][_4615];
    float _4619 = 1.0 / _4587;
    float _4621 = _4595 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4623 = as_type<float>(_4599);
    if (!_4423)
    {
        int _4625 = _4593 << 4;
        int _4627 = _4625 + _4599;
        _4623 = as_type<float>(_4627);
    }
    float _4629 = _4623;
    float _4631 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4633 = fma(_2695, _4357, _4555);
    float _4635 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4637 = fma(_2695, _4403, _4585);
    float _4639 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4641 = _4629;
    if (!_4423)
    {
        int _4643 = as_type<int>(_4629) + 400;
        uint _4645 = uint(int(uint(_4643) >> uint(2)));
        uint _4647 = uint(int(uint(int(_4645)) >> uint(2)));
        int _4649 = int(_4645) & 3;
        float _4651 = (*spvDescriptorSet0.vp_c15)._m0[int(_4647)][_4649];
        _4641 = _4651;
    }
    float _4653 = _4641;
    float _4655 = -_4635;
    float _4657 = fma(_4655, _4631, 1.0);
    float _4659 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4661 = _4633 + _4365;
    float _4663 = _4637 + _4411;
    float _4665 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4667 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4639);
    float _4669 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4659);
    float _4671 = _4661 * _4619;
    float _4673 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4665);
    float _4675 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4667);
    float _4677 = _4663 * _4619;
    float _4679 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4669);
    bool _4681 = _4671 >= 0.0;
    float _4683 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4673);
    float _4685 = _4675 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4687 = _4453;
    float _4689 = _4619;
    if (!_4423)
    {
        float _4691 = floor(_4305);
        _4687 = _4691;
    }
    float _4693 = _4687;
    bool _4695 = _4671 <= 1.0;
    bool _4697 = _4695 && _4681;
    float _4699 = _4683 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4701 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4703 = _4679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _4705 = _4677 >= 0.0;
    bool _4707 = _4705 && _4697;
    float _4709 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4711 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4701);
    float _4713 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _4715 = _4677 <= 1.0;
    bool _4717 = _4715 && _4707;
    float _4719 = as_type<float>(_4319);
    if (!_4423)
    {
        float _4721 = floor(_4259);
        _4719 = _4721;
    }
    float _4723 = _4719;
    float _4725 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4711);
    float _4727 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4709);
    float _4729 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4713);
    float _4731 = _4243 * _4575;
    float _4733 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4725);
    float _4735 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4727);
    float _4737 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4729);
    float _4739 = fma(_2687, _4567, _4731);
    float _4741 = log2(_4657);
    float _4743 = _4693;
    if (!_4423)
    {
        float _4745 = -_4693;
        float _4747 = _4305 + _4745;
        _4743 = _4747;
    }
    float _4749 = _4743;
    float _4751 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4735);
    if (_4717)
    {
        float _4753 = float(_4317);
        _4433 = _4753;
    }
    float _4755 = _4433;
    float _4757 = fma(_2695, _4609, _4739);
    float _4759 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4737);
    float _4761 = 1.0 / _4733;
    float _4763 = _4757 + _4617;
    float _4765 = _4763 * _4619;
    float _4767 = _4755;
    if (!_4423)
    {
        float _4769 = -_4723;
        float _4771 = _4259 + _4769;
        _4689 = _4771;
    }
    float _4773 = _4689;
    float _4775 = _4731;
    if (_4717)
    {
        float _4777 = rint(_4755);
        float _4779 = precise::max(_4777, 0.0);
        uint _4781 = uint(_4779);
        uint _4783 = clamp(_4781, 0u, 65535u);
        _4775 = as_type<float>(_4783);
    }
    float _4785 = _4775;
    float _4787 = _4741 * 0.693147182464599609375;
    float _4789 = _4723;
    float _4791 = _4653;
    if (!_4423)
    {
        float _4793 = rint(_4653);
        float _4795 = precise::max(_4793, 0.0);
        uint _4797 = uint(_4795);
        uint _4799 = clamp(_4797, 0u, 65535u);
        _4789 = as_type<float>(_4799);
    }
    float _4801 = _4789;
    float _4803 = _4751 * _4761;
    float _4805 = _4759 * _4761;
    float _4807 = _4787 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4809 = fma(_4803, 0.5, 0.5);
    float _4811 = fma(_4805, -0.5, 0.5);
    float _4813 = _4785;
    if (_4717)
    {
        float3 _12655 = float3(_4671, _4677, float(as_type<int>(_4785)));
        float3 _12659 = select(_12655, float3(0.0), isnan(_12655));
        float _4815 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12659.xy, uint(rint(_12659.z)), _4765, level(0.0));
        _4813 = _4815;
    }
    float _4817 = _4813;
    float3 _12669 = float3(_4809, _4811, _4807);
    float _4819 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12669, float3(0.0), isnan(_12669)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12669, float3(0.0), isnan(_12669)), level(0.0)).x;
    float3 _12678 = float3(_4809, _4811, _4807);
    float4 _4822 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12678, float3(0.0), isnan(_12678)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12678, float3(0.0), isnan(_12678)), level(0.0)).xyzw;
    float _4824 = _4822.x;
    float _4826 = _4822.y;
    float _4828 = _4822.z;
    float _4830 = _4822.w;
    float _4832 = _4749;
    if (!_4423)
    {
        float3 _12701 = float3(_4773, _4749, float(as_type<int>(_4801)));
        float3 _12703 = select(_12701, float3(0.0), isnan(_12701));
        float _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12703.xy, uint(rint(_12703.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12703.xy, uint(rint(_12703.z)), level(0.0)).x;
        _4832 = _4834;
    }
    float _4836 = _4832;
    if (_4423)
    {
        _4767 = 1.0;
    }
    float _4838 = _4767;
    float _4840 = _4838;
    if (!_4423)
    {
        int _4842 = _4549 << 4;
        int _4844 = _4842 + 2048;
        uint _4846 = uint(int(uint(_4844) >> uint(2)));
        uint _4848 = uint(int(uint(int(_4846)) >> uint(2)));
        int _4850 = int(_4846) & 3;
        float _4852 = (*spvDescriptorSet0.vp_c15)._m0[int(_4848)][_4850];
        int _4854 = int(_4846) + 1;
        uint _4856 = uint(int(uint(_4854) >> uint(2)));
        int _4858 = _4854 & 3;
        float _4860 = (*spvDescriptorSet0.vp_c15)._m0[int(_4856)][_4858];
        int _4862 = _4844 + 8;
        uint _4864 = uint(int(uint(_4862) >> uint(2)));
        uint _4866 = uint(int(uint(int(_4864)) >> uint(2)));
        int _4868 = int(_4864) & 3;
        float _4870 = (*spvDescriptorSet0.vp_c15)._m0[int(_4866)][_4868];
        int _4872 = int(_4864) + 1;
        uint _4874 = uint(int(uint(_4872) >> uint(2)));
        int _4876 = _4872 & 3;
        float _4878 = (*spvDescriptorSet0.vp_c15)._m0[int(_4874)][_4876];
        float _4880 = _4243 * _4860;
        float _4882 = fma(_2687, _4852, _4880);
        float _4884 = fma(_2695, _4870, _4882);
        float _4886 = _4884 + _4878;
        float _4888 = precise::clamp(_4886, 0.0, 1.0);
        float _4890 = -_4888;
        float _4892 = _4890 + _4836;
        float _4894 = fma(_4892, 500.0, 1.5);
        float _4896 = exp2(_4894);
        float _4898 = 0.0 + _4896;
        float _4900 = precise::clamp(_4898, 0.0, 1.0);
        _4791 = _4870;
        _4840 = _4900;
    }
    float _4902 = _4791;
    float _4904 = _4840;
    float _4906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4908 = _4531 + _4906;
    float _4910 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4912 = _4535 + _4910;
    float _4914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4916 = _4537 + _4914;
    float _4918 = _4908 * _4908;
    float _4920 = fma(_4912, _4912, _4918);
    float _4922 = fma(_4916, _4916, _4920);
    float _4924 = rsqrt(_4922);
    float _4926 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4928 = _4912 * _4926;
    float _4930 = _4916 * _4926;
    float _4932 = _4928 * _4928;
    float _4934 = _4930 * _4930;
    float _4936 = _4932 + _4934;
    float _4938 = sqrt(_4936);
    bool _4940 = _4938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4944 = _4938 + _4942;
    float _4946 = _4916;
    float _4948 = _4936;
    float _4950 = _4944;
    float _4952 = _4902;
    float _4954 = _4908;
    float _4956 = _4926;
    if (_4940)
    {
        float _4958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4946 = _4958;
    }
    float _4960 = _4946;
    if (_4940)
    {
        float _4962 = rsqrt(_4936);
        _4948 = _4962;
    }
    float _4964 = _4948;
    float _4966 = _4964;
    if (_4940)
    {
        float _4968 = _4944 * _4960;
        _4950 = _4968;
    }
    float _4970 = _4950;
    if (_4940)
    {
        float _4972 = _4970 * 0.15915493667125701904296875;
        _4952 = _4972;
    }
    float _4974 = _4952;
    float _4976 = _4924;
    if (_4940)
    {
        float _4978 = _4974 * 6.283185482025146484375;
        float _4980 = sin(_4978);
        _4976 = _4980;
    }
    float _4982 = _4976;
    float _4984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4986 = precise::max(0.0, _4984);
    float _4988 = _4836;
    float _4990 = _4984;
    if (_4940)
    {
        float _4992 = _4974 * 6.283185482025146484375;
        float _4994 = cos(_4992);
        _4988 = _4994;
    }
    float _4996 = _4988;
    float _4998 = -_4926;
    float _5000 = -_4986;
    float _5002 = fma(_4908, _4998, _5000);
    float _5004 = _5002;
    if (!_4940)
    {
        _4954 = _4930;
    }
    float _5006 = _4954;
    float _5008 = _5006;
    if (_4940)
    {
        float _5010 = _5002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4990 = _5010;
    }
    float _5012 = _4990;
    float _5014 = _4982;
    float _5016 = _5012;
    if (_4940)
    {
        float _5018 = fma(_4982, _5012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5014 = _5018;
    }
    float _5020 = _5014;
    float _5022 = _5020;
    float _5024 = _4996;
    if (_4940)
    {
        float _5026 = _4996 + (-1.0);
        _5016 = _5026;
    }
    float _5028 = _5016;
    float _5030 = _5028;
    if (_4940)
    {
        float _5032 = _4964 * _5020;
        _4956 = _5032;
    }
    float _5034 = _4956;
    if (!_4940)
    {
        _5022 = _4928;
    }
    float _5036 = _5022;
    float _5038 = _5036;
    if (_4940)
    {
        float _5040 = _5028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5030 = _5040;
    }
    float _5042 = _5030;
    if (_4940)
    {
        float _5044 = _4928 * _5034;
        _5038 = _5044;
    }
    float _5046 = _5038;
    if (!_4940)
    {
        _4966 = _4932;
    }
    float _5048 = _4966;
    float _5050 = _5048;
    if (_4940)
    {
        float _5052 = _4930 * _5034;
        _5008 = _5052;
    }
    float _5054 = _5008;
    if (_4940)
    {
        float _5056 = fma(_5002, _4996, _5042);
        _5004 = _5056;
    }
    float _5058 = _5004;
    if (_4940)
    {
        float _5060 = _5046 * _5046;
        _5050 = _5060;
    }
    float _5062 = _5050;
    float _5064 = sqrt(_4922);
    if (!_4940)
    {
        _5024 = _4934;
    }
    float _5066 = _5024;
    float _5068 = _5066;
    if (_4940)
    {
        float _5070 = _5054 * _5054;
        _5068 = _5070;
    }
    float _5072 = _5068;
    float _5074 = fma(_5058, _5058, _5062);
    float _5076 = _5074 + _5072;
    float _5078 = rsqrt(_5076);
    float _5080 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5082 = fma(_5064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5080);
    float _5084 = precise::clamp(_5082, 0.0, 1.0);
    float _5086 = -_5084;
    float _5088 = _5086 + 1.0;
    float _5090 = abs(_5088);
    float _5092 = log2(_5090);
    float _5094 = _5078 * _5046;
    float _5096 = _5078 * _5058;
    float _5098 = _5078 * _5054;
    float _5100 = _5094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5102 = -_5100;
    float _5104 = fma(_5096, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5102);
    float _5106 = -_5098;
    float _5108 = fma(_5106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5104);
    float _5110 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5112 = fma(_5108, -0.5, 0.5);
    float _5114 = fma(_5108, 0.5, 0.5);
    float _5116 = _5096 + 1.0;
    float _5118 = exp2(_5110);
    float _5120 = fma(_5114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5122 = fma(_5114, _5120, -0.212114393711090087890625);
    float _5124 = sqrt(_5112);
    float _5126 = fma(_5114, _5122, 1.570728778839111328125);
    float _5128 = -_5096;
    float _5130 = fma(_5118, _5116, _5128);
    float _5132 = fma(_5130, 0.5, 0.5);
    float _5134 = _5124 * 0.636619746685028076171875;
    float _5136 = -_5126;
    float _5138 = fma(_5134, _5136, 1.0);
    float2 _13171 = float2(_5138, _5132);
    float3 _5142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13171, float2(0.0), isnan(_13171)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13171, float2(0.0), isnan(_13171)), level(0.0)).xyz;
    float _5144 = _5142.x;
    float _5146 = _5142.y;
    float _5148 = _5142.z;
    float _5150 = abs(_4289);
    float _5152 = log2(_5150);
    float _5154 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5156 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5158 = -_4215;
    float _5160 = _5158 + 1.0;
    float _5162 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5154);
    out.m_95.x = _4535;
    out.m_95.y = _4531;
    out.m_95.z = _4537;
    bool _5164 = _4289 <= 8000.0;
    bool _5166 = isnan(_4289);
    bool _5168 = _5164 || _5166;
    bool _5170 = isnan(8000.0);
    bool _5172 = _5168 || _5170;
    float _5174 = float(_5172);
    float _5176 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5162);
    float _5178 = exp2(_5156);
    float _5180 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5176);
    float _5182 = _5152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5184 = exp2(_5182);
    float _5186 = -_5178;
    float _5188 = _5186 + 1.0;
    float _5190 = fma(_5184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5192 = precise::clamp(_5190, 0.0, 1.0);
    float _5194 = _5180 + _4733;
    float _5196 = fma(_5192, -2.0, 3.0);
    float _5198 = _5192 * _5192;
    float _5200 = _5198 * _5196;
    float _5202 = -_5200;
    float _5204 = _5202 + 1.0;
    float _5206 = fma(_5204, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5200);
    float _5208 = _5194 * 0.5;
    float _5210 = _5194;
    float _5212 = _4751;
    if (!_4717)
    {
        _5210 = 1.0;
    }
    float _5214 = _5210;
    float _5216 = _5174 * _5206;
    float _5218 = _5214;
    if (_4717)
    {
        bool _5220 = _4817 >= _4765;
        bool _5222 = isnan(_4817);
        bool _5224 = _5220 || _5222;
        bool _5226 = isnan(_4765);
        bool _5228 = _5224 || _5226;
        float _5230 = float(_5228);
        _5218 = _5230;
    }
    float _5232 = _5218;
    float _5234 = _5188 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4751;
    out.gl_Position.y = _4759;
    out.gl_Position.z = _5180;
    out.gl_Position.w = _4733;
    float _5236 = _5216 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5238 = _5232 * _4904;
    bool _5240 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5242 = isnan(_5064);
    bool _5244 = _5240 || _5242;
    bool _5246 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5248 = _5244 || _5246;
    float _5250 = _5160 * _5236;
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5234 * _4819;
    float _5256 = -_5234;
    float _5258 = _5256 + 1.0;
    out.m_97.z = _5208;
    out.m_97.w = _4733;
    float _5260 = -_5252;
    float _5262 = fma(_5260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5264 = _4830 * _5254;
    float _5266 = _4830 * _5258;
    float _5268 = -_5238;
    float _5270 = fma(_5268, _5262, 1.0);
    float _5272 = precise::clamp(_5270, 0.0, 1.0);
    float _5274 = _5272 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5276 = _5272;
    float _5278 = _5264;
    if (!_5248)
    {
        _5212 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5280 = _5212;
    float _5282 = _5280;
    float _5284 = _5280;
    if (!_5248)
    {
        _5276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5286 = _5276;
    out.m_99.x = _5274;
    float _5288 = _5148 * _5254;
    float _5290 = fma(_5144, _5264, _4824);
    float _5292 = fma(_5146, _5264, _4826);
    float _5294 = _5286;
    float _5296 = _5286;
    if (!_5248)
    {
        _5278 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5298 = _5278;
    float _5300 = fma(_4830, _5288, _4828);
    out.m_101.x = _5290;
    out.m_101.y = _5292;
    out.m_101.z = _5300;
    out.m_101.w = _5266;
    bool _5302 = !_5248;
    float _5304 = _5298;
    float _5306 = _5298;
    if (!_5302)
    {
        bool _5308 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5310 = isnan(_5064);
        bool _5312 = _5308 || _5310;
        bool _5314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5316 = _5312 || _5314;
        if (!_5316)
        {
            float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5320 = _5064 + _5318;
            float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5324 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5322;
            float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5332 = _5330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5334 = 1.0 / _5324;
            float _5336 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5338 = _5336 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5340 = _5320 * _5334;
            float _5342 = precise::clamp(_5340, 0.0, 1.0);
            float _5344 = fma(_5342, _5328, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5346 = fma(_5342, _5332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5348 = fma(_5342, _5338, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5306 = _5346;
            _5284 = _5344;
            _5296 = _5348;
            _5350 = true;
        }
        else
        {
            bool _5352 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5354 = isnan(_5064);
            bool _5356 = _5352 || _5354;
            bool _5358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5360 = _5356 || _5358;
            if (!_5360)
            {
                _5282 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5362 = _5282;
            _5284 = _5362;
            if (!_5360)
            {
                _5304 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5364 = _5304;
            _5306 = _5364;
            if (!_5360)
            {
                _5294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5366 = _5294;
            bool _5368 = !_5360;
            _5296 = _5366;
            if (!_5368)
            {
                bool _5370 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5372 = isnan(_5064);
                bool _5374 = _5370 || _5372;
                bool _5376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5378 = _5374 || _5376;
                if (!_5378)
                {
                    float _5380 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5382 = _5064 + _5380;
                    float _5384 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5386 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5384;
                    float _5388 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5390 = _5388 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5392 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5394 = _5392 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5396 = 1.0 / _5386;
                    float _5398 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5400 = _5398 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5402 = _5382 * _5396;
                    float _5404 = precise::clamp(_5402, 0.0, 1.0);
                    float _5406 = fma(_5404, _5390, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5408 = fma(_5404, _5394, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5410 = fma(_5404, _5400, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5306 = _5408;
                    _5284 = _5406;
                    _5296 = _5410;
                    _5350 = true;
                }
                else
                {
                    _5306 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5284 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5350 = false;
    float _5412 = _5306;
    float _5414 = _5284;
    float _5416 = _5296;
    float _5418 = _5412 * 0.586610972881317138671875;
    bool _5420 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _5422 = fma(_5414, 0.298911988735198974609375, _5418);
    out.m_103.x = 0.0;
    float _5424 = fma(_5416, 0.114477999508380889892578125, _5422);
    float _5426 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5428 = -_5424;
    float _5430 = _5428 + _5414;
    float _5432 = -_5424;
    float _5434 = _5432 + _5412;
    float _5436 = -_5424;
    float _5438 = _5436 + _5416;
    out.m_99.w = _5426;
    float _5440 = fma(_5430, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    float _5442 = fma(_5434, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    float _5444 = fma(_5438, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    out.m_105.x = _5440;
    out.m_105.y = _5442;
    out.m_105.z = _5444;
    if (!_5420)
    {
        return out;
    }
    float _5446 = -_4531;
    float _5448 = _5446 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5450 = -_4535;
    float _5452 = _5450 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5454 = -_4537;
    float _5456 = _5454 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5458 = _5448 * _5448;
    float _5460 = fma(_5452, _5452, _5458);
    float _5462 = fma(_5456, _5456, _5460);
    float _5464 = sqrt(_5462);
    float _5466 = rsqrt(_5462);
    float _5468 = -_5464;
    float _5470 = _5468 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5472 = _5470 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5474 = precise::clamp(_5472, 0.0, 1.0);
    float _5476 = _5452 * _5466;
    float _5478 = _5448 * _5466;
    float _5480 = abs(_5474);
    float _5482 = log2(_5480);
    float _5484 = _5456 * _5466;
    float _5486 = _5476 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5488 = _4107 * _5478;
    float _5490 = -_5478;
    float _5492 = -_5486;
    float _5494 = fma(_5490, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5492);
    float _5496 = fma(_4093, _5476, _5488);
    float _5498 = -_5484;
    float _5500 = fma(_5498, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5494);
    float _5502 = fma(_4119, _5484, _5496);
    float _5504 = precise::clamp(_5502, 0.0, 1.0);
    float _5506 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5508 = _5500 + _5506;
    float _5510 = _5482 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5512 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5514 = precise::clamp(_5512, 0.0, 1.0);
    float _5516 = exp2(_5510);
    float _5518 = _5516 * _5514;
    float _5520 = _5504 * _5518;
    float _5522 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5524 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5526 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _5522;
    out.m_103.y = _5524;
    out.m_103.z = _5526;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5350 = false;
    bool _4167 = false;
    bool _614 = false;
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
        float _5583 = as_type<float>(_140);
        out.gl_Position.z = _5583;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _5652 = as_type<float>(_178);
        out.gl_Position.z = _5652;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _224 = 1.0 / _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = 1.0 / _218;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _238 = 1.0 / _234;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _250 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _252 = isnan(_210);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = 1.0 / _242;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _266 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _268 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _210 + _270;
    float _274 = 1.0 / _222;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = _210 + _276;
    float _280 = _272 * _224;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _210 + _282;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _288 = _278 * _238;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _290;
    float _294 = _284 * _230;
    float _296 = 1.0 / _228;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _300 = fma(_292, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _306 = _210 + _304;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _312 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _314 = _306 * _262;
    float _316 = _308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _318 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _320 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _322 = isnan(_210);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _210 + _332;
    bool _336 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _338 = isnan(_210);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_260;
    float _350 = _348 + 1.0;
    out.m_67.x = _316;
    out.m_67.y = _312;
    out.m_67.z = _318;
    out.m_67.w = _236;
    float _352 = _334 * _296;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _356 = _210 + _354;
    out.m_69.x = _302;
    out.m_69.y = _266;
    out.m_69.z = _268;
    out.m_69.w = _264;
    float _358 = _356 * _274;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = fma(_362, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _366 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _368 = isnan(_210);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_330;
    float _380 = _378 + 1.0;
    float _382 = _346 * _350;
    float _384 = _376 * _380;
    float _386 = -_346;
    float _388 = _386 + 1.0;
    bool _390 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _392 = isnan(_210);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    bool _406 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _408 = isnan(_210);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _330 * _388;
    bool _420 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _422 = isnan(_210);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = -_376;
    float _438 = _436 + 1.0;
    float _440 = fma(_404, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = -_430;
    float _448 = _446 + 1.0;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = _400 * _438;
    float _456 = -_400;
    float _458 = _456 + 1.0;
    float _460 = _416 * _448;
    float _462 = -_416;
    float _464 = _462 + 1.0;
    float _466 = fma(_434, _352, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = _440 * _460;
    float _470 = _364 * _460;
    float _472 = fma(_444, _352, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = fma(_452, _352, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _476 = _300 * _460;
    float _478 = _430 * _458;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _492;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _498;
    float _502 = fma(_482, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _504 = fma(_494, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = fma(_466, _478, _488);
    float _512 = fma(_472, _478, _490);
    float _514 = fma(_474, _478, _496);
    float _516 = fma(_500, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_486, _358, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_508, _358, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_502, _454, _510);
    float _528 = fma(_504, _454, _512);
    float _530 = fma(_520, _358, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _536;
    float _540 = fma(_516, _454, _514);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _542;
    float _546 = fma(_522, _384, _526);
    float _548 = fma(_524, _384, _528);
    float _550 = fma(_534, _288, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _552 = fma(_538, _288, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _554 = fma(_530, _384, _540);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _564 = fma(_544, _288, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _570 = fma(_550, _418, _546);
    float _572 = fma(_558, _314, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _574 = fma(_562, _314, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _576 = fma(_552, _418, _548);
    float _578 = fma(_568, _314, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _580 = fma(_564, _418, _554);
    float _582 = fma(_572, _382, _570);
    float _584 = fma(_574, _382, _576);
    float _586 = fma(_578, _382, _580);
    float _588 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].x, _582);
    float _590 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].y, _584);
    float _592 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[149].z, _586);
    bool _594 = !_286;
    float _612;
    if (!_594)
    {
        float _596 = in.m_65.x;
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _600 = _596 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _604 = _602 * _598;
        float _606 = floor(_604);
        float _608 = -_606;
        float _610 = _604 + _608;
        _612 = _610;
        _614 = true;
    }
    else
    {
        float _616 = float(_124);
        float _618 = 1.0 / _616;
        float _620 = _158 * _618;
        _612 = _620;
    }
    _614 = false;
    float _622 = _612;
    float _624 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _626 = int(_624);
    float _628 = in.m_65.x;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _632 = _622 + _630;
    float _634 = in.m_65.y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _640 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _642 = int(_640);
    float _644 = in.m_71.x;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _650 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _652 = int(_650);
    float _654 = float(_626);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _672;
    float _676 = 1.0 / _654;
    float _678 = float(_642);
    float _680 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _682 = int(_680);
    float _684 = float(uint(_652));
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _688 = ~_652;
    int _690 = _688 + 1;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _694 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _696 = isnan(_622);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _678;
    float _708 = _676 * _158;
    bool _710 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _712 = isnan(_622);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _724 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _726 = isnan(_622);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = float(uint(_682));
    float _738 = 1.0 / _684;
    int _740 = ~_682;
    int _742 = _740 + 1;
    float _744 = _706 * _158;
    float _746 = trunc(_708);
    int _748 = int(_746);
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _752 = _750 != 0;
    float _754 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _756 = int(_754);
    int _758 = as_type<int>(_738) + (-2);
    float _760 = 1.0 / _736;
    float _762 = float(uint(_748));
    float _764 = trunc(_744);
    int _766 = int(_764);
    float _768 = float(_756);
    int _770 = as_type<int>(_760) + (-2);
    float _772 = as_type<float>(_758) * _762;
    float _774 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _776 = int(_774);
    float _778 = _762;
    float _780 = _772;
    float _782 = _768;
    bool _784 = _752;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_752)
    {
        _778 = 1.0;
    }
    float _788 = _778;
    float _790 = _788;
    if (!_752)
    {
        _790 = 7.345489978790283203125;
    }
    float _792 = _790;
    float _794 = float(uint(_766));
    float _796 = trunc(_772);
    float _798 = precise::max(_796, 0.0);
    uint _801 = uint(_798);
    float _803 = _792 * _628;
    float _805 = as_type<float>(_770) * _794;
    float _807 = in.m_65.z;
    float _809 = float(uint(_776));
    float _811 = trunc(_805);
    float _813 = precise::max(_811, 0.0);
    uint _815 = uint(_813);
    float _817 = _809;
    float _819 = _803;
    if (_752)
    {
        _780 = _628;
    }
    float _821 = _780;
    int _823 = ~_776;
    int _825 = _823 + 1;
    int _827 = _690 * int(_801);
    int _829 = _827 + _748;
    float _831 = 1.0 / _768;
    float _833 = in.m_65.w;
    float _835 = float(uint(_829));
    float _837 = as_type<float>(_829);
    float _839 = _821;
    int _841 = int(_801);
    if (_752)
    {
        _837 = 1.0;
    }
    float _843 = _837;
    float _845 = 1.0 / _809;
    float _847 = _843;
    if (_752)
    {
        _782 = 1.0;
    }
    float _849 = _782;
    float _851 = as_type<float>(_758) * _835;
    float _853 = _849;
    if (!_752)
    {
        _853 = 1.2345600128173828125;
    }
    float _855 = _853;
    int _857 = _742 * int(_815);
    int _859 = _857 + _766;
    float _861 = as_type<float>(_859);
    if (!_752)
    {
        _839 = _807;
    }
    float _863 = _839;
    float _865 = _628 + _807;
    if (!_752)
    {
        _847 = 5.839270114898681640625;
    }
    float _867 = _847;
    float _869 = trunc(_851);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    int _875 = as_type<int>(_867);
    if (_752)
    {
        _817 = _628;
    }
    float _877 = _817;
    float _879 = _831 * _158;
    float _881 = _877;
    if (!_752)
    {
        _881 = _634;
    }
    float _883 = _881;
    float _885 = _863 * _867;
    float _887 = float(uint(_859));
    float _889 = _865 + (-1.0);
    bool _891 = _807 > 0.5;
    float _893 = _883 * _855;
    float _895 = floor(_885);
    float _897 = as_type<float>(_770) * _887;
    bool _899 = _833 > 0.5;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    int _907 = int(_801) + int(_873);
    float _909 = floor(_893);
    float _911 = float(_124);
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _915 = _913 != 0;
    float _917 = trunc(_879);
    int _919 = int(_917);
    float _921 = _833;
    if (!_905)
    {
        _861 = _644;
    }
    float _923 = _861;
    float _925 = -_895;
    float _927 = _885 + _925;
    float _929 = _923;
    if (_905)
    {
        bool _931 = _628 > 0.5;
        _784 = _931;
    }
    bool _933 = _784;
    if (!_905)
    {
        _921 = _923;
    }
    float _935 = _921;
    float _937 = _935;
    if (_905)
    {
        _929 = _644;
    }
    float _939 = _929;
    float _941 = floor(_803);
    int _943 = ~_652;
    int _945 = _943 + 1;
    float _947 = float(_682);
    float _949 = _939;
    if (_905)
    {
        float _951 = -_939;
        float _953 = _951 + 1.0;
        _875 = as_type<int>(_953);
    }
    int _955 = _875;
    float _957 = -_909;
    float _959 = _893 + _957;
    int _961 = ~_682;
    int _963 = _961 + 1;
    float _965 = trunc(_897);
    float _967 = precise::max(_965, 0.0);
    uint _969 = uint(_967);
    if (_905)
    {
        float _971 = _933 ? as_type<float>(_955) : _939;
        _937 = _971;
    }
    float _973 = _937;
    int _975 = _945 * _907;
    int _977 = _975 + _748;
    int _979 = as_type<int>(_845) + (-2);
    if (_915)
    {
        float _981 = -_939;
        float _983 = _981 + 1.0;
        _841 = as_type<int>(_983);
    }
    int _985 = _841;
    float _987 = float(uint(_919));
    float _989 = float(_652);
    float _991 = 1.0 / _911;
    float _993 = -_941;
    float _995 = _803 + _993;
    float _997 = float(_748);
    float _999 = float(_776);
    float _1001 = _995 * _989;
    bool _1003 = _997 >= _989;
    bool _1005 = isnan(_997);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(_989);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _989 * _158;
    int _1017 = int(_815) + int(_969);
    float _1019 = as_type<float>(_979) * _987;
    float _1021 = float(_766);
    float _1023 = 1.0 / _638;
    bool _1025 = uint(_977) >= uint(_652);
    if (!_915)
    {
        _819 = _939;
    }
    float _1027 = _819;
    float _1029 = _1015 * _991;
    float _1031 = _991 * _158;
    bool _1033 = _1021 >= _947;
    bool _1035 = isnan(_1021);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(_947);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = trunc(_1019);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = float(_919);
    float _1053 = _947 * _959;
    float _1055 = _1027;
    if (_915)
    {
        float _1057 = _891 ? as_type<float>(_985) : _939;
        _1055 = _1057;
    }
    float _1059 = _1055;
    float _1061 = _947 * _1031;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1065 = _1063 != 0;
    float _1067 = trunc(_1013);
    int _1069 = int(_1067);
    bool _1071 = _1051 >= _999;
    bool _1073 = isnan(_1051);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan(_999);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = _999 * _927;
    int _1085 = _963 * _1017;
    int _1087 = _1085 + _766;
    float _1089 = trunc(_1001);
    int _1091 = int(_1089);
    float _1093 = _999 * _1031;
    bool _1095 = uint(_1087) >= uint(_682);
    bool _1097 = !_1025;
    int _1099 = _1097 ? 0 : (-1);
    int _1101 = _825 * int(_1049);
    int _1103 = _1101 + _919;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1107 = _1105 != 0;
    float _1109 = trunc(_1053);
    int _1111 = int(_1109);
    bool _1113 = !_1095;
    int _1115 = _1113 ? 0 : (-1);
    float _1117 = float(uint(_1103));
    bool _1119 = !_1107;
    int _1121 = _1119 ? 0 : 1;
    int _1123 = ~_1017;
    int _1125 = _1123 + _1115;
    int _1127 = _1125 + 1;
    float _1129 = trunc(_1043);
    int _1131 = int(_1129);
    float _1133 = as_type<float>(_979) * _1117;
    int _1135 = abs(_1121);
    int _1137 = ~_907;
    int _1139 = _1137 + _1099;
    int _1141 = _1139 + 1;
    int _1143 = _682 * _1127;
    int _1145 = _1143 + _766;
    bool _1147 = !_1065;
    int _1149 = _1147 ? 0 : 1;
    int _1151 = _1091 * _1135;
    int _1153 = _1151 + _748;
    float _1155 = trunc(_1133);
    float _1157 = precise::max(_1155, 0.0);
    uint _1159 = uint(_1157);
    int _1161 = abs(_1149);
    int _1163 = _652 * _1141;
    int _1165 = _1163 + _748;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1169 = _1167 != 0;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1177 = _1175 != 0;
    float _1179 = in.m_71.y;
    bool _1181 = _652 == 0;
    int _1183 = _1111 * _1161;
    int _1185 = _1183 + _766;
    bool _1187 = _682 == 0;
    float _1189 = trunc(_1029);
    int _1191 = int(_1189);
    int _1193 = ~_1069;
    int _1195 = _1193 + 1;
    int _1197 = _1195 + 1;
    bool _1199 = !_1181;
    int _1201 = _1199 ? _1165 : (-1);
    bool _1203 = !_1173;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = ~_1131;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    int _1213 = _1201 * _1197;
    bool _1215 = !_1187;
    int _1217 = _1215 ? _1145 : (-1);
    float _1219 = trunc(_1081);
    int _1221 = int(_1219);
    int _1223 = abs(_1205);
    int _1225 = _682 + (-1);
    int _1227 = _1211 * _1217;
    int _1229 = int(_1049) + int(_1159);
    int _1231 = _652 + (-1);
    int _1233 = _1131 * _1225;
    int _1235 = _1233 + _1227;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1239 = _1237 != 0;
    float _1241 = trunc(_1083);
    int _1243 = int(_1241);
    bool _1245 = !_1169;
    int _1247 = _1245 ? 0 : 1;
    int _1249 = _1069 * _1231;
    int _1251 = _1249 + _1213;
    bool _1253 = !_1239;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = -_1179;
    float _1259 = _1257 + 1.0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1263 = _1261 != 0;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1267 = _1265 != 0;
    int _1269 = _1251 * _1223;
    bool _1271 = !_1177;
    int _1273 = _1271 ? 0 : 1;
    float _1275 = 1.0 / _648;
    int _1277 = abs(_1247);
    bool _1279 = !_1267;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = ~_776;
    int _1285 = _1283 + 1;
    int _1287 = _1191 * _1277;
    int _1289 = _1287 + _1269;
    int _1291 = abs(_1281);
    int _1293 = abs(_1273);
    int _1295 = _1285 * _1229;
    int _1297 = _1295 + _919;
    bool _1299 = _634 > 0.5;
    float _1301 = trunc(_1061);
    int _1303 = int(_1301);
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1307 = _1305 != 0;
    int _1309 = _1235 * _1291;
    int _1311 = _899 ? as_type<int>(_1259) : as_type<int>(_1179);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1319 = _1317 != 0;
    int _1321 = _1153 * _1293;
    int _1323 = _1321 + _1289;
    int _1325 = abs(_1255);
    int _1327 = _1299 ? as_type<int>(_1259) : as_type<int>(_1179);
    bool _1329 = !_1263;
    int _1331 = _1329 ? 0 : 1;
    int _1333 = _1091 * _1325;
    int _1335 = _1333 + _1323;
    bool _1337 = uint(_1297) >= uint(_776);
    float _1339 = _1307 ? as_type<float>(_1327) : _1179;
    bool _1341 = !_1319;
    int _1343 = _1341 ? 0 : 1;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1347 = _1345 != 0;
    bool _1349 = !_1337;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = abs(_1331);
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1357 = _1355 != 0;
    int _1359 = abs(_1343);
    int _1361 = _1303 * _1353;
    int _1363 = _1361 + _1309;
    bool _1365 = !_1315;
    int _1367 = _1365 ? 0 : 1;
    bool _1369 = !_1347;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1229;
    int _1375 = _1373 + _1351;
    int _1377 = _1375 + 1;
    float _1379 = float(uint(_1335));
    float _1381 = _1357 ? as_type<float>(_1311) : _1179;
    int _1383 = abs(_1367);
    float _1385 = as_type<float>(_758) * _1379;
    int _1387 = abs(_1371);
    int _1389 = _776 * _1377;
    int _1391 = _1389 + _919;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1395 = _1393 != 0;
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1399 = _1397 != 0;
    int _1401 = _1185 * _1383;
    int _1403 = _1401 + _1363;
    bool _1405 = _776 == 0;
    int _1407 = _1243 * _1387;
    int _1409 = _1407 + _919;
    float _1411 = trunc(_1385);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    int _1417 = ~_1221;
    int _1419 = _1417 + 1;
    int _1421 = _1419 + 1;
    bool _1423 = !_1405;
    int _1425 = _1423 ? _1391 : (-1);
    int _1427 = _1111 * _1359;
    int _1429 = _1427 + _1403;
    int _1431 = _776 + (-1);
    int _1433 = ~_652;
    int _1435 = _1433 + 1;
    int _1437 = _1421 * _1425;
    bool _1439 = !_1399;
    int _1441 = _1439 ? 0 : 1;
    float _1443 = trunc(_1093);
    int _1445 = int(_1443);
    bool _1447 = !_1395;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1221 * _1431;
    int _1453 = _1451 + _1437;
    int _1455 = abs(_1441);
    float _1457 = float(uint(_1429));
    int _1459 = _1435 * int(_1415);
    int _1461 = _1459 + _1335;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1465 = _1463 != 0;
    int _1467 = _1453 * _1455;
    int _1469 = abs(_1449);
    float _1471 = as_type<float>(_770) * _1457;
    bool _1473 = !_1465;
    int _1475 = _1473 ? 0 : 1;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1479 = _1477 != 0;
    float _1481 = float(uint(_1461));
    float _1483 = trunc(_1471);
    float _1485 = precise::max(_1483, 0.0);
    uint _1487 = uint(_1485);
    bool _1489 = !_1479;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = _1445 * _1469;
    int _1495 = _1493 + _1467;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1499 = _1497 != 0;
    float _1501 = as_type<float>(_758) * _1481;
    float _1503 = float(uint(_1153));
    int _1505 = abs(_1475);
    int _1507 = abs(_1491);
    float _1509 = as_type<float>(_758) * _1503;
    float _1511 = trunc(_1501);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = _1409 * _1505;
    int _1519 = _1517 + _1495;
    int _1521 = ~_682;
    int _1523 = _1521 + 1;
    bool _1525 = _807 > 0.5;
    int _1527 = _1243 * _1507;
    int _1529 = _1527 + _1519;
    int _1531 = ~_652;
    int _1533 = _1531 + 1;
    float _1535 = trunc(_1509);
    float _1537 = precise::max(_1535, 0.0);
    uint _1539 = uint(_1537);
    float _1541 = _1179;
    int _1543 = _1533;
    if (_1499)
    {
        float _1545 = _1525 ? _1259 : _1179;
        _1541 = _1545;
    }
    float _1547 = _1541;
    int _1549 = _1523 * int(_1487);
    int _1551 = _1549 + _1429;
    float _1553 = float(uint(_1529));
    int _1555 = ~_776;
    int _1557 = _1555 + 1;
    float _1559 = float(uint(_1551));
    float _1561 = as_type<float>(_979) * _1553;
    int _1563 = int(_1415) + int(_1515);
    float _1565 = as_type<float>(_770) * _1559;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1569 = _1567 != 0;
    float _1571 = trunc(_1561);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    bool _1577 = _652 == 0;
    int _1579 = _1533 * int(_1539);
    int _1581 = _1579 + _1153;
    bool _1583 = _682 == 0;
    float _1585 = float(uint(_1581));
    float _1587 = trunc(_1565);
    float _1589 = precise::max(_1587, 0.0);
    uint _1591 = uint(_1589);
    int _1593 = _1533 * _1563;
    int _1595 = _1593 + _1335;
    float _1597 = as_type<float>(_758) * _1585;
    if (_1569)
    {
        float _1599 = -_939;
        float _1601 = _1599 + 1.0;
        _1543 = as_type<int>(_1601);
    }
    int _1603 = _1543;
    bool _1605 = uint(_1595) >= uint(_652);
    float _1607 = float(uint(_1185));
    float _1609 = trunc(_1597);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    bool _1615 = !_1605;
    int _1617 = _1615 ? 0 : (-1);
    if (_1569)
    {
        float _1619 = _1299 ? as_type<float>(_1603) : _939;
        _949 = _1619;
    }
    float _1621 = _949;
    int _1623 = ~_1563;
    int _1625 = _1623 + _1617;
    int _1627 = _1625 + 1;
    int _1629 = int(_1487) + int(_1591);
    float _1631 = as_type<float>(_770) * _1607;
    int _1633 = _1557 * int(_1575);
    int _1635 = _1633 + _1529;
    int _1637 = ~_682;
    int _1639 = _1637 + 1;
    int _1641 = _652 * _1627;
    int _1643 = _1641 + _1335;
    float _1645 = trunc(_1631);
    float _1647 = precise::max(_1645, 0.0);
    uint _1649 = uint(_1647);
    int _1651 = ~_682;
    int _1653 = _1651 + 1;
    float _1655 = float(uint(_1635));
    bool _1657 = !_1577;
    int _1659 = _1657 ? _1643 : (-1);
    float _1661 = as_type<float>(_979) * _1655;
    float _1663 = float(uint(_1409));
    int _1665 = int(_1539) + int(_1613);
    int _1667 = _1653 * _1629;
    int _1669 = _1667 + _1429;
    float _1671 = as_type<float>(_979) * _1663;
    int _1673 = _1659 & 3;
    bool _1675 = _1673 != 0;
    float _1677 = trunc(_1661);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    int _1683 = _1659 & 3;
    bool _1685 = _1683 != 0;
    int _1687 = _1639 * int(_1649);
    int _1689 = _1687 + _1185;
    bool _1691 = uint(_1673) > 1u;
    int _1693 = _1685 ? 0 : 1;
    bool _1695 = uint(_1669) >= uint(_682);
    float _1697 = trunc(_1671);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    float _1703 = float(uint(_1689));
    bool _1705 = !_1695;
    int _1707 = _1705 ? 0 : (-1);
    int _1709 = ~_776;
    int _1711 = _1709 + 1;
    float _1713 = as_type<float>(_770) * _1703;
    int _1715 = ~_1629;
    int _1717 = _1715 + _1707;
    int _1719 = _1717 + 1;
    bool _1721 = _1673 != 3;
    int _1723 = ~_1693;
    int _1725 = _1723 + 1;
    int _1727 = _1725 + 1;
    int _1729 = _682 * _1719;
    int _1731 = _1729 + _1429;
    float _1733 = trunc(_1713);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    int _1739 = _1727;
    if (!_1691)
    {
        int _1741 = ~_1693;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = _1435 * _1665;
    int _1749 = _1747 + _1153;
    bool _1751 = uint(_1673) >= 2u;
    int _1753 = _1711 * int(_1701);
    int _1755 = _1753 + _1409;
    int _1757 = int(_1575) + int(_1681);
    int _1759 = _1751 ? 0 : 1;
    bool _1761 = !_1583;
    int _1763 = _1761 ? _1731 : (-1);
    bool _1765 = uint(_1749) >= uint(_652);
    int _1767 = ~_1759;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    float _1773 = float(uint(_1755));
    int _1775 = _1711 * _1757;
    int _1777 = _1775 + _1529;
    int _1779 = _1771;
    if (_1721)
    {
        int _1781 = ~_1759;
        int _1783 = _1781 + 1;
        _1779 = _1783;
    }
    int _1785 = _1779;
    int _1787 = _1763 & 3;
    bool _1789 = _1787 != 0;
    float _1791 = as_type<float>(_979) * _1773;
    int _1793 = ~_682;
    int _1795 = _1793 + 1;
    int _1797 = _1789 ? 0 : 1;
    bool _1799 = uint(_1777) >= uint(_776);
    float _1801 = trunc(_1791);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    int _1807 = int(_1649) + int(_1737);
    bool _1809 = !_1799;
    int _1811 = _1809 ? 0 : (-1);
    bool _1813 = uint(_1787) > 1u;
    bool _1815 = !_1765;
    int _1817 = _1815 ? 0 : (-1);
    bool _1819 = uint(_1787) >= 2u;
    int _1821 = ~_1757;
    int _1823 = _1821 + _1811;
    int _1825 = _1823 + 1;
    int _1827 = _1795 * _1807;
    int _1829 = _1827 + _1185;
    int _1831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1833 = _1831 != 0;
    int _1835 = _1819 ? 0 : 1;
    int _1837 = _776 * _1825;
    int _1839 = _1837 + _1529;
    bool _1841 = _1787 != 3;
    float _1843 = _628 * 2.0;
    int _1845 = ~_1797;
    int _1847 = _1845 + 1;
    int _1849 = _1847 + 1;
    float _1851 = _634 * 2.0;
    int _1853 = _1849;
    if (!_1813)
    {
        int _1855 = ~_1797;
        int _1857 = _1855 + 1;
        _1853 = _1857;
    }
    int _1859 = _1853;
    bool _1861 = uint(_1829) >= uint(_682);
    float _1863 = floor(_1843);
    bool _1865 = !_1405;
    int _1867 = _1865 ? _1839 : (-1);
    bool _1869 = !_1861;
    int _1871 = _1869 ? 0 : (-1);
    bool _1873 = !_1675;
    int _1875 = _1873 ? 0 : 1;
    int _1877 = _1763 & 3;
    bool _1879 = _1877 != 0;
    float _1881 = floor(_1851);
    if (_1833)
    {
        _786 = 0;
    }
    int _1883 = _786;
    int _1885 = _1867 & 3;
    bool _1887 = _1885 != 0;
    int _1889 = _1883;
    if (!_1833)
    {
        _1889 = 1;
    }
    int _1891 = _1889;
    int _1893 = int(_1701) + int(_1805);
    int _1895 = ~_1835;
    int _1897 = _1895 + 1;
    int _1899 = _1897 + 1;
    bool _1901 = !_1879;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1899;
    int _1907 = _1891;
    if (_1841)
    {
        int _1909 = ~_1835;
        int _1911 = _1909 + 1;
        _1905 = _1911;
    }
    int _1913 = _1905;
    bool _1915 = _1885 != 3;
    bool _1917 = _1891 != 1;
    if (_1833)
    {
        _1907 = 0;
    }
    int _1919 = _1907;
    int _1921 = _1919;
    if (!_1833)
    {
        _1921 = 2;
    }
    int _1923 = _1921;
    int _1925 = ~_776;
    int _1927 = _1925 + 1;
    bool _1929 = uint(_1885) >= 2u;
    bool _1931 = uint(_1885) > 1u;
    int _1933 = _1887 ? 0 : 1;
    int _1935 = _1929 ? 0 : 1;
    bool _1937 = _1923 != 2;
    int _1939 = _1927 * _1893;
    int _1941 = _1939 + _1409;
    int _1943 = ~_1935;
    int _1945 = _1943 + 1;
    int _1947 = _1945 + 1;
    int _1949 = _1947;
    float _1951 = as_type<float>(_1927);
    if (_1915)
    {
        int _1953 = ~_1935;
        int _1955 = _1953 + 1;
        _1949 = _1955;
    }
    int _1957 = _1949;
    bool _1959 = uint(_1941) >= uint(_776);
    float _1961 = 0.0;
    if (!_1917)
    {
        _1961 = _634;
    }
    float _1963 = _1961;
    int _1965 = ~_1933;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1969;
    float _1973 = _1963;
    if (!_1931)
    {
        int _1975 = ~_1933;
        int _1977 = _1975 + 1;
        _1971 = _1977;
    }
    int _1979 = _1971;
    bool _1981 = !_1959;
    int _1983 = _1981 ? 0 : (-1);
    float _1985 = 0.0;
    if (!_1917)
    {
        _1985 = _1963;
    }
    float _1987 = _1985;
    bool _1989 = _1863 > 0.0;
    bool _1991 = _1863 >= 0.0;
    bool _1993 = isnan(_1863);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(0.0);
    bool _1999 = _1995 || _1997;
    float _2001 = _1987;
    if (_1917)
    {
        _1973 = _634;
    }
    float _2003 = _1973;
    float _2005 = in.m_73.x;
    float _2007 = in.m_73.y;
    float _2009 = in.m_73.z;
    float _2011 = _2003;
    if (!_1917)
    {
        _1951 = _1987;
    }
    float _2013 = _1951;
    float _2015 = 0.0;
    float _2017 = _2013;
    if (!_1917)
    {
        _2015 = _807;
    }
    float _2019 = _2015;
    float _2021 = 0.0;
    float _2023 = _2019;
    if (!_1917)
    {
        _2021 = _807;
    }
    float _2025 = _2021;
    float _2027 = _2025;
    if (_1917)
    {
        _2017 = _628;
    }
    float _2029 = _2017;
    if (_1917)
    {
        _2001 = _628;
    }
    float _2031 = _2001;
    if (_1917)
    {
        _2023 = _2003;
    }
    float _2033 = _2023;
    float _2035 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1917)
    {
        _2027 = _2003;
    }
    float _2037 = _2027;
    bool _2039 = _1881 > 0.0;
    float _2041 = -_686;
    float _2043 = fma(_2035, 2.0, _2041);
    int _2045 = _1999 ? 0 : 1;
    float _2047 = 0.0;
    if (_1937)
    {
        _2047 = _628;
    }
    float _2049 = _2047;
    float _2051 = _2049;
    if (!_1937)
    {
        _2051 = _807;
    }
    float _2053 = _2051;
    if (!_1937)
    {
        _2011 = _628;
    }
    float _2055 = _2011;
    float _2057 = _592 * _2009;
    bool _2059 = _1881 >= 0.0;
    bool _2061 = isnan(_1881);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan(0.0);
    bool _2067 = _2063 || _2065;
    float _2069 = _588 * _2005;
    int _2071 = _1867 & 3;
    bool _2073 = _2071 != 0;
    float _2075 = _634 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2077 = ~_2045;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2085 = _2081;
    if (!_1989)
    {
        int _2087 = ~_2045;
        int _2089 = _2087 + 1;
        _2085 = _2089;
    }
    int _2091 = _2085;
    float _2093 = _2057 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _2095 = !_2073;
    int _2097 = _2095 ? 0 : 1;
    float _2099 = fma(_2083, -2.0, _722);
    bool _2101 = _1673 != 3;
    float _2103 = _2069 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2105 = _2067 ? 0 : 1;
    float _2107 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2099);
    bool _2109 = _1787 != 3;
    bool _2111 = _1885 != 3;
    float _2113 = _590 * _2007;
    bool _2115 = !_2101;
    int _2117 = _2115 ? 0 : (-1);
    int _2119 = ~_2105;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    bool _2125 = !_2109;
    int _2127 = _2125 ? 0 : (-1);
    bool _2129 = !_2111;
    int _2131 = _2129 ? 0 : (-1);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2139 = _2137 != 0;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2143 = _2141 != 0;
    int _2145 = _2123;
    if (!_2039)
    {
        int _2147 = ~_2105;
        int _2149 = _2147 + 1;
        _2145 = _2149;
    }
    int _2151 = _2145;
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2155 = _2153 != 0;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2159 = _2157 != 0;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2163 = _2161 != 0;
    float _2165 = in.m_58.x;
    float _2167 = in.m_58.y;
    float _2169 = in.m_58.z;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2177 = _2175 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2179 = !_2135;
    int _2181 = _2179 ? 0 : 1;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2185 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2187 = 1.0 / _2177;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2191 = !_2139;
    int _2193 = _2191 ? 0 : 1;
    float _2195 = fma(_2075, -2.0, _2189);
    bool _2197 = !_2143;
    int _2199 = _2197 ? 0 : 1;
    float _2201 = 1.0 / _2173;
    float _2203 = -_2183;
    float _2205 = fma(_2185, 2.0, _2203);
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2209 = _2207 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2211 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2213 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2215 = abs(_2193);
    float _2217 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2219 = _2217 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2221 = _2167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2229 = _2227 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2231 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2213);
    float _2233 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2221);
    float _2235 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2211);
    float _2237 = 1.0 / _2209;
    float _2239 = _2225 * _1023;
    float _2241 = _2229 * _1275;
    float _2243 = _662 * _2201;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2247 = _2245 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2249 = _658 * _2187;
    float _2251 = _628 + _634;
    float _2253 = _807 * 2.0;
    float _2255 = 1.0 / _2219;
    float _2257 = in.m_75.x;
    float _2259 = in.m_75.y;
    float _2261 = in.m_75.z;
    float _2263 = _2251 + (-1.0);
    float _2265 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2233);
    float _2267 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2235);
    float _2269 = fma(_2169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2231);
    float _2271 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2273 = _622 + _2271;
    float _2275 = 1.0 / _2247;
    float _2277 = _666 * _2237;
    float _2279 = fma(_2243, _2273, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2281 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2285 = _670 * _2255;
    float _2287 = _634 + _807;
    float _2289 = floor(_2253);
    float _2291 = -_2283;
    float _2293 = fma(_2281, 2.0, _2291);
    float _2295 = _2287 + (-1.0);
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2299 = _674 * _2275;
    float _2301 = fma(_2263, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2303 = fma(_2295, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2259);
    float _2307 = _2113 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2309 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2297);
    float _2311 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2313 = -_704;
    float _2315 = _2313 + 1.0;
    float _2317 = _2305 * _2307;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2321 = _622 + _2319;
    float _2323 = fma(_2311, -2.0, _692);
    bool _2325 = _2289 >= 0.0;
    bool _2327 = isnan(_2289);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(0.0);
    bool _2333 = _2329 || _2331;
    float _2335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2261);
    float _2337 = fma(_2239, _2321, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2341 = _622 + _2339;
    int _2343 = _2333 ? 0 : 1;
    float _2345 = _2335 * _2093;
    bool _2347 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2349 = isnan(_622);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2355 = _2351 || _2353;
    float _2357 = float(_2355);
    float _2359 = fma(_2249, _2341, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2361 = _2289 > 0.0;
    float _2363 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2365 = log2(_2363);
    float _2367 = _2357 * _2315;
    float _2369 = -_2357;
    float _2371 = _2369 + 1.0;
    int _2373 = ~_2343;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2383 = _622 + _2381;
    float _2385 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2387 = 1.0 + _2385;
    float _2389 = _720 * _2371;
    float _2391 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2379);
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2395 = _2377;
    float _2397 = _2337;
    float _2399 = as_type<float>(_2215);
    float _2401 = as_type<float>(_2151);
    if (!_2361)
    {
        int _2403 = ~_2343;
        int _2405 = _2403 + 1;
        _2395 = _2405;
    }
    int _2407 = _2395;
    float _2409 = 1.0 / _2387;
    bool _2411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2419 = _2415 || _2417;
    float _2421 = _2365 * _158;
    float _2423 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2425 = fma(_2241, _2383, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2427 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2429 = _622 + _2427;
    float _2431 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2257);
    float _2433 = exp2(_2421);
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2437 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2439 = isnan(_622);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2393);
    float _2451 = fma(_2277, _2429, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2453 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2435);
    float _2455 = -_720;
    float _2457 = _2455 + 1.0;
    float _2459 = _2431 * _2103;
    float _2461 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2309);
    float _2463 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2453);
    float _2465 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2449);
    float _2467 = -_158;
    float _2469 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2293);
    float _2471 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2391);
    float _2473 = -_158;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2043);
    float _2477 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2323);
    float _2479 = _2447 * _2457;
    float _2481 = -_2433;
    float _2483 = _2481 + 1.0;
    float _2485 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2487 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2195);
    bool _2489 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2491 = isnan(_622);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    float _2501 = _2419 ? _2483 : 0.0;
    float _2503 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2485);
    bool _2505 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2507 = isnan(1.0);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2513 = _2509 || _2511;
    float _2515 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2423);
    float _2517 = -_158;
    float _2519 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2205);
    float _2521 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2503);
    float _2523 = -_2447;
    float _2525 = _2523 + 1.0;
    float _2527 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2515);
    bool _2529 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2531 = isnan(_622);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2537 = _2533 || _2535;
    float _2539 = float(_2537);
    float _2541 = -_2499;
    float _2543 = _2541 + 1.0;
    bool _2545 = _622 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2547 = isnan(_622);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = _634 + (-0.5);
    float _2559 = float(_2407);
    float _2561 = _2539 * _2525;
    float _2563 = -_2539;
    float _2565 = _2563 + 1.0;
    float _2567 = _2557;
    if (_2513)
    {
        float _2569 = _2501 * _2409;
        _162 = _2569;
    }
    float _2571 = _162;
    bool _2573 = _2259 != 0.0;
    bool _2575 = isnan(_2259);
    bool _2577 = _2573 || _2575;
    bool _2579 = isnan(0.0);
    bool _2581 = _2577 || _2579;
    float _2583 = in.m_77.x;
    float _2585 = in.m_77.y;
    float _2587 = in.m_77.z;
    float _2589 = _2499 * _2565;
    int _2591 = abs(_2181);
    float _2593 = _2555 * _2543;
    bool _2595 = _2257 == 0.0;
    bool _2597 = !_2581;
    bool _2599 = _2595 && _2597;
    float _2601 = in.m_79.x;
    float _2603 = in.m_79.y;
    float _2605 = in.m_79.z;
    float _2607 = -_2555;
    float _2609 = _2607 + 1.0;
    float _2611 = float(_2591);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2615 = _622 + _2613;
    bool _2617 = _2261 == 0.0;
    bool _2619 = _2617 && _2599;
    float _2621 = _734 * _2609;
    float _2623 = fma(_2285, _632, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2625 = float(_2091);
    float _2627 = _2611 * _2559;
    float _2629 = _2337 * _2621;
    float _2631 = float(_2215);
    float _2633 = -_734;
    float _2635 = _2633 + 1.0;
    float _2637 = _2627 * (-2.0);
    float _2639 = float(_2151);
    float _2641 = fma(_2299, _2615, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2643 = fma(_2635, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2629);
    int _2645 = ~_1807;
    int _2647 = _2645 + _1871;
    int _2649 = _2647 + 1;
    int _2651 = ~_1893;
    int _2653 = _2651 + _1983;
    int _2655 = _2653 + 1;
    float _2657 = fma(_2425, _2593, _2643);
    if (_2619)
    {
        _2397 = _2583;
    }
    float _2659 = _2397;
    int _2661 = _682 * _2649;
    int _2663 = _2661 + _1185;
    int _2665 = abs(_1875);
    float _2667 = fma(_2359, _2589, _2657);
    float _2669 = _2659;
    if (_2619)
    {
        _2399 = _2659;
    }
    float _2671 = _2399;
    float _2673 = _807 + (-0.5);
    float _2675 = _2671;
    if (!_2619)
    {
        _2669 = _2583;
    }
    float _2677 = _2669;
    float _2679 = _2631 * _2625;
    float _2681 = _2267 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2683 = fma(_2301, _2637, _2301);
    float _2685 = fma(_2637, _2601, _2601);
    float _2687 = _2265 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2689 = -_2681;
    float _2691 = _2689 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _628 + (-0.5);
    float _2695 = _2269 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2697 = -_2687;
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2701 = _2691 * _2691;
    float _2703 = fma(_2693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2685);
    int _2705 = abs(_2199);
    float _2707 = -_2695;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2711 = fma(_2699, _2699, _2701);
    float _2713 = fma(_2683, _2571, _2703);
    float _2715 = fma(_2279, _2561, _2667);
    float _2717 = fma(_2709, _2709, _2711);
    float _2719 = as_type<float>(_2705);
    if (_2619)
    {
        _2719 = _2585;
    }
    float _2721 = _2719;
    float _2723 = _2679 * (-2.0);
    float _2725 = float(_2705);
    float _2727 = _2713 * 0.15915493667125701904296875;
    float _2729 = _2721;
    float _2731 = _2725;
    if (_2619)
    {
        _2401 = _2721;
    }
    float _2733 = _2401;
    float _2735 = rsqrt(_2717);
    float _2737 = _2733;
    if (!_2619)
    {
        _2729 = _2585;
    }
    float _2739 = _2729;
    float _2741 = fma(_2723, _2603, _2603);
    float _2743 = _2725 * _2639;
    float _2745 = fma(_2303, _2723, _2303);
    if (_2619)
    {
        _2731 = _2587;
    }
    float _2747 = _2731;
    float _2749 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2741);
    float _2751 = _2743 * (-2.0);
    float _2753 = _2727 * 6.283185482025146484375;
    float _2755 = sin(_2753);
    float _2757 = _2747;
    if (_2619)
    {
        _2567 = _2747;
    }
    float _2759 = _2567;
    float _2761 = fma(_2745, _2571, _2749);
    float _2763 = fma(_2751, _2605, _2605);
    float _2765 = fma(_901, _2751, _901);
    float _2767 = _2759;
    if (!_2619)
    {
        _2757 = _2587;
    }
    float _2769 = _2757;
    float _2771 = _2761 * 0.15915493667125701904296875;
    float _2773 = fma(_2673, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2763);
    float _2775 = _2699 * _2735;
    float _2777 = _2709 * _2735;
    float _2779 = in.m_81.x;
    float _2781 = in.m_81.y;
    float _2783 = in.m_81.z;
    float _2785 = in.m_81.w;
    float _2787 = _2691 * _2735;
    float _2789 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2791 = _2775 * _2789;
    float _2793 = fma(_2765, _2571, _2773);
    float _2795 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2797 = _2777 * _2795;
    float _2799 = _2727 * 6.283185482025146484375;
    float _2801 = cos(_2799);
    float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2805 = -_2791;
    float _2807 = fma(_2777, _2803, _2805);
    float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2811 = _2787 * _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2815 = -_2797;
    float _2817 = fma(_2787, _2813, _2815);
    if (!_2619)
    {
        float _2819 = fma(_2257, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2677);
        _2675 = _2819;
    }
    float _2821 = _2675;
    float _2823 = fma(_2451, _2479, _2715);
    float _2825 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2827 = -_2811;
    float _2829 = fma(_2775, _2825, _2827);
    float _2831 = _2793 * 0.15915493667125701904296875;
    float _2833 = _2771 * 6.283185482025146484375;
    float _2835 = sin(_2833);
    float _2837 = _2807 * _2807;
    float _2839 = fma(_2623, _2389, _2823);
    if (!_2619)
    {
        float _2841 = fma(_2259, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2739);
        _2737 = _2841;
    }
    float _2843 = _2737;
    if (!_2619)
    {
        float _2845 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2769);
        _2767 = _2845;
    }
    float _2847 = _2767;
    float _2849 = fma(_2817, _2817, _2837);
    float _2851 = fma(_2641, _2367, _2839);
    int _2853 = _776 * _2655;
    int _2855 = _2853 + _1409;
    float _2857 = _2771 * 6.283185482025146484375;
    float _2859 = cos(_2857);
    float _2861 = fma(_2829, _2829, _2849);
    int _2863 = abs(_2131);
    float _2865 = _2781 * _2769;
    float _2867 = _2783 * _2677;
    float _2869 = _2779 * _2739;
    bool _2871 = _652 == 0;
    float _2873 = _2831 * 6.283185482025146484375;
    float _2875 = cos(_2873);
    float _2877 = -_2865;
    float _2879 = fma(_2783, _2739, _2877);
    float _2881 = -_2867;
    float _2883 = fma(_2779, _2769, _2881);
    float _2885 = -_2869;
    float _2887 = fma(_2781, _2677, _2885);
    float _2889 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2851);
    float _2891 = _2879 * _2785;
    float _2893 = _2883 * _2785;
    float _2895 = _2887 * _2785;
    float _2897 = _2831 * 6.283185482025146484375;
    float _2899 = sin(_2897);
    out.m_83.x = _2889;
    float _2901 = _2801 * _2859;
    float _2903 = _2755 * _2835;
    float _2905 = _2801 * _2835;
    float _2907 = _2755 * _2859;
    bool _2909 = _682 == 0;
    float _2911 = rsqrt(_2861);
    float _2913 = _2859 * _2875;
    float _2915 = _2801 * _2875;
    float _2917 = _2755 * _2875;
    int _2919 = _1763 >> 31;
    float _2921 = _2835 * _2875;
    int _2923 = _1867 >> 31;
    float _2925 = -_2317;
    float _2927 = _2899 * _2925;
    float _2929 = -_2905;
    float _2931 = fma(_2899, _2907, _2929);
    int _2933 = _2919 & 3;
    float _2935 = -_2907;
    float _2937 = fma(_2899, _2905, _2935);
    int _2939 = _2923 & 3;
    int _2941 = _1763 + _2933;
    float _2943 = _2817 * _2911;
    float _2945 = _2807 * _2911;
    float _2947 = _2829 * _2911;
    float _2949 = fma(_2899, _2901, _2903);
    float _2951 = fma(_2899, _2903, _2901);
    float _2953 = fma(_2913, _2459, _2927);
    float _2955 = _2915 * _2317;
    int _2957 = _1659 >> 31;
    float _2959 = _2917 * _2317;
    float _2961 = fma(_2921, _2345, _2953);
    float _2963 = fma(_2949, _2459, _2955);
    int _2965 = _2957 & 3;
    float _2967 = fma(_2931, _2459, _2959);
    int _2969 = _1867 + _2939;
    float _2971 = fma(_2937, _2345, _2963);
    int _2973 = _1659 + _2965;
    float _2975 = fma(_2951, _2345, _2967);
    int _2977 = _2941 >> 2;
    float _2979 = _2777 * _2945;
    int _2981 = _2973 >> 2;
    float _2983 = _2775 * _2947;
    int _2985 = _2977 << 4;
    int _2987 = _2985 + 512;
    float _2989 = _2787 * _2943;
    int _2991 = _2981 << 4;
    int _2993 = _2991 + 368;
    float _2995 = -_2983;
    float _2997 = fma(_2777, _2943, _2995);
    uint _2999 = uint(int(uint(_2987) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    int _3015 = _2969 >> 2;
    float _3017 = -_2989;
    float _3019 = fma(_2775, _2945, _3017);
    int _3021 = ~_1665;
    int _3023 = _3021 + _1817;
    int _3025 = _3023 + 1;
    float _3027 = -_2979;
    float _3029 = fma(_2787, _2947, _3027);
    int _3031 = _3015 << 4;
    int _3033 = _3031 + 656;
    float _3035 = _2949 * _2997;
    float _3037 = _2949 * _3019;
    uint _3039 = uint(int(uint(_2993) >> uint(2)));
    uint _3041 = uint(int(uint(int(_3039)) >> uint(2)));
    int _3043 = int(_3039) & 3;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[int(_3041)][_3043];
    int _3047 = int(_3039) + 1;
    uint _3049 = uint(int(uint(_3047) >> uint(2)));
    int _3051 = _3047 & 3;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[int(_3049)][_3051];
    float _3055 = _2949 * _3029;
    float _3057 = fma(_2913, _2945, _3035);
    float _3059 = _2915 * _3029;
    float _3061 = _2915 * _2997;
    float _3063 = fma(_2913, _2943, _3055);
    float _3065 = _2915 * _3019;
    float _3067 = fma(_2913, _2947, _3037);
    uint _3069 = uint(int(uint(_3033) >> uint(2)));
    uint _3071 = uint(int(uint(int(_3069)) >> uint(2)));
    int _3073 = int(_3069) & 3;
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[int(_3071)][_3073];
    int _3077 = int(_3069) + 1;
    uint _3079 = uint(int(uint(_3077) >> uint(2)));
    int _3081 = _3077 & 3;
    float _3083 = (*spvDescriptorSet0.vp_c9)._m0[int(_3079)][_3081];
    float _3085 = _2937 * _3029;
    float _3087 = _2937 * _2997;
    float _3089 = _2937 * _3019;
    float _3091 = -_2899;
    float _3093 = fma(_3091, _2943, _3059);
    float _3095 = -_2899;
    float _3097 = fma(_3095, _2945, _3061);
    float _3099 = -_2899;
    float _3101 = fma(_3099, _2947, _3065);
    float _3103 = fma(_2921, _2943, _3085);
    float _3105 = fma(_2921, _2945, _3087);
    float _3107 = fma(_2921, _2947, _3089);
    float _3109 = _3029 * _2971;
    float _3111 = _2997 * _2971;
    float _3113 = _3019 * _2971;
    int _3115 = abs(_1745);
    int _3117 = _2993 + 8;
    uint _3119 = uint(int(uint(_3117) >> uint(2)));
    uint _3121 = uint(int(uint(int(_3119)) >> uint(2)));
    int _3123 = int(_3119) & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    int _3127 = int(_3119) + 1;
    uint _3129 = uint(int(uint(_3127) >> uint(2)));
    int _3131 = _3127 & 3;
    float _3133 = (*spvDescriptorSet0.vp_c9)._m0[int(_3129)][_3131];
    int _3135 = abs(_1859);
    int _3137 = _652 * _3025;
    int _3139 = _3137 + _1153;
    int _3141 = abs(_1979);
    float _3143 = fma(_2943, _2961, _3109);
    float _3145 = fma(_2945, _2961, _3111);
    int _3147 = _2987 + 8;
    uint _3149 = uint(int(uint(_3147) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    int _3165 = ~_3115;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = fma(_2947, _2961, _3113);
    int _3173 = ~_3135;
    int _3175 = _3173 + 1;
    int _3177 = _3175 + 1;
    float _3179 = fma(_2917, _2777, _3101);
    float _3181 = fma(_2931, _2775, _3063);
    bool _3183 = !_2909;
    int _3185 = _3183 ? _2663 : (-1);
    int _3187 = _3033 + 8;
    uint _3189 = uint(int(uint(_3187) >> uint(2)));
    uint _3191 = uint(int(uint(int(_3189)) >> uint(2)));
    int _3193 = int(_3189) & 3;
    float _3195 = (*spvDescriptorSet0.vp_c9)._m0[int(_3191)][_3193];
    int _3197 = int(_3189) + 1;
    uint _3199 = uint(int(uint(_3197) >> uint(2)));
    int _3201 = _3197 & 3;
    float _3203 = (*spvDescriptorSet0.vp_c9)._m0[int(_3199)][_3201];
    int _3205 = ~_3141;
    int _3207 = _3205 + 1;
    int _3209 = _3207 + 1;
    int _3211 = _3177 * as_type<int>(_3013);
    int _3213 = abs(_2097);
    float _3215 = fma(_2917, _2775, _3093);
    int _3217 = abs(_1785);
    float _3219 = fma(_2931, _2787, _3057);
    bool _3221 = !_1405;
    int _3223 = _3221 ? _2855 : (-1);
    float _3225 = fma(_2777, _2975, _3171);
    int _3227 = ~_3217;
    int _3229 = _3227 + 1;
    int _3231 = _3229 + 1;
    int _3233 = _3169 * as_type<int>(_3053);
    int _3235 = abs(_1903);
    float _3237 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3239 = int(_3237);
    int _3241 = ~_3235;
    int _3243 = _3241 + 1;
    int _3245 = _3243 + 1;
    int _3247 = _3209 * as_type<int>(_3083);
    int _3249 = ~_3213;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    float _3255 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3257 = int(_3255);
    int _3259 = ~_2665;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    int _3265 = _3245 * as_type<int>(_3005);
    int _3267 = _3265 + _3211;
    int _3269 = abs(_2117);
    int _3271 = _3253 * as_type<int>(_3075);
    int _3273 = _3271 + _3247;
    int _3275 = abs(_1913);
    int _3277 = _3263 * as_type<int>(_3045);
    int _3279 = _3277 + _3233;
    int _3281 = abs(_2127);
    float _3283 = _2695 + _3225;
    int _3285 = ~_3275;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    float _3291 = _2893 * _3215;
    int _3293 = ~_3281;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    int _3299 = _3231 * as_type<int>(_3125);
    int _3301 = _3299 + _3279;
    int _3303 = abs(_1957);
    float _3305 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3307 = int(_3305);
    float _3309 = float(uint(_3239));
    int _3311 = ~_3303;
    int _3313 = _3311 + 1;
    int _3315 = _3313 + 1;
    int _3317 = ~_3269;
    int _3319 = _3317 + 1;
    int _3321 = _3319 + 1;
    int _3323 = _3289 * as_type<int>(_3155);
    int _3325 = _3323 + _3267;
    bool _3327 = !_2871;
    int _3329 = _3327 ? _3139 : (-1);
    float _3331 = 1.0 / _3309;
    int _3333 = ~_3239;
    int _3335 = _3333 + 1;
    int _3337 = _3297 * as_type<int>(_3163);
    int _3339 = _3337 + _3325;
    bool _3341 = !_2155;
    int _3343 = _3341 ? 0 : 1;
    int _3345 = _3321 * as_type<int>(_3133);
    int _3347 = _3345 + _3301;
    bool _3349 = !_2159;
    int _3351 = _3349 ? 0 : 1;
    int _3353 = _3315 * as_type<int>(_3195);
    int _3355 = _3353 + _3273;
    int _3357 = abs(_3343);
    float _3359 = _3179 * _2843;
    int _3361 = ~_3357;
    int _3363 = _3361 + 1;
    int _3365 = _3363 + 1;
    float _3367 = float(uint(_3257));
    int _3369 = ~_2863;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    int _3375 = _3347 * _3365;
    int _3377 = abs(_3351);
    float _3379 = fma(_2775, _2975, _3143);
    int _3381 = abs(_3257);
    float _3383 = 1.0 / _3367;
    float _3385 = float(uint(_3307));
    int _3387 = _3373 * as_type<int>(_3203);
    int _3389 = _3387 + _3355;
    bool _3391 = !_2163;
    int _3393 = _3391 ? 0 : 1;
    int _3395 = _3329 * _3357;
    int _3397 = _3395 + _3375;
    int _3399 = abs(_3239);
    float _3401 = fma(_2931, _2777, _3067);
    float _3403 = 1.0 / _3385;
    int _3405 = ~_3377;
    int _3407 = _3405 + 1;
    int _3409 = _3407 + 1;
    float _3411 = _2687 + _3379;
    int _3413 = abs(_3393);
    float _3415 = fma(_2951, _2775, _3103);
    float _3417 = float(uint(_3399));
    int _3419 = _3409 * _3339;
    int _3421 = ~_3413;
    int _3423 = _3421 + 1;
    int _3425 = _3423 + 1;
    float _3427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3429 = _3283 + _3427;
    float _3431 = float(uint(_3381));
    int _3433 = _3185 * _3377;
    int _3435 = _3433 + _3419;
    int _3437 = as_type<int>(_3331) + (-2);
    float _3439 = 1.0 / _3417;
    float _3441 = float(uint(_3397));
    int _3443 = _3425 * _3389;
    int _3445 = abs(_3307);
    float _3447 = _3429 * _3429;
    int _3449 = as_type<int>(_3383) + (-2);
    float _3451 = as_type<float>(_3437) * _3441;
    int _3453 = _3223 * _3413;
    int _3455 = _3453 + _3443;
    float _3457 = 1.0 / _3431;
    float _3459 = float(uint(_3435));
    float _3461 = fma(_2917, _2787, _3097);
    float _3463 = float(uint(_3445));
    float _3465 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3467 = _3411 + _3465;
    int _3469 = as_type<int>(_3403) + (-2);
    float _3471 = as_type<float>(_3449) * _3459;
    float _3473 = float(uint(_3455));
    float _3475 = trunc(_3451);
    float _3477 = precise::max(_3475, 0.0);
    uint _3479 = uint(_3477);
    int _3481 = as_type<int>(_3439) + (-2);
    float _3483 = _3467 * _3467;
    int _3485 = abs(_3397);
    float _3487 = fma(_2787, _2975, _3145);
    int _3489 = abs(_3435);
    float _3491 = _3483 + _3447;
    int _3493 = ~_3257;
    int _3495 = _3493 + 1;
    float _3497 = 1.0 / _3463;
    float _3499 = as_type<float>(_3469) * _3473;
    float _3501 = float(uint(_3485));
    float _3503 = fma(_2951, _2777, _3107);
    int _3505 = as_type<int>(_3457) + (-2);
    float _3507 = fma(_2951, _2787, _3105);
    float _3509 = float(uint(_3489));
    float _3511 = as_type<float>(_3481) * _3501;
    float _3513 = trunc(_3471);
    float _3515 = precise::max(_3513, 0.0);
    uint _3517 = uint(_3515);
    int _3519 = abs(_3455);
    int _3521 = _3335 * int(_3479);
    int _3523 = _3521 + _3397;
    float _3525 = as_type<float>(_3505) * _3509;
    int _3527 = ~_3307;
    int _3529 = _3527 + 1;
    float _3531 = _3461 * _2843;
    float _3533 = float(uint(_3519));
    float _3535 = _2893 * _3461;
    float _3537 = trunc(_3499);
    float _3539 = precise::max(_3537, 0.0);
    uint _3541 = uint(_3539);
    int _3543 = as_type<int>(_3497) + (-2);
    int _3545 = ~_3381;
    int _3547 = _3545 + 1;
    int _3549 = ~_3445;
    int _3551 = _3549 + 1;
    float _3553 = as_type<float>(_3543) * _3533;
    float _3555 = float(uint(_3523));
    float _3557 = trunc(_3511);
    float _3559 = precise::max(_3557, 0.0);
    uint _3561 = uint(_3559);
    int _3563 = _3495 * int(_3517);
    int _3565 = _3563 + _3435;
    float _3567 = as_type<float>(_3437) * _3555;
    float _3569 = float(uint(_3565));
    float _3571 = _3461 * _2781;
    float _3573 = trunc(_3525);
    float _3575 = precise::max(_3573, 0.0);
    uint _3577 = uint(_3575);
    int _3579 = _3529 * int(_3541);
    int _3581 = _3579 + _3455;
    float _3583 = as_type<float>(_3449) * _3569;
    int _3585 = ~_3399;
    int _3587 = _3585 + 1;
    float _3589 = fma(_3219, _2779, _3571);
    float _3591 = float(uint(_3581));
    float _3593 = _3179 * _2781;
    float _3595 = trunc(_3553);
    float _3597 = precise::max(_3595, 0.0);
    uint _3599 = uint(_3597);
    float _3601 = _2893 * _3179;
    float _3603 = as_type<float>(_3469) * _3591;
    float _3605 = _3215 * _2781;
    int _3607 = _3587 * int(_3561);
    int _3609 = _3607 + _3485;
    float _3611 = fma(_3401, _2779, _3593);
    float _3613 = sqrt(_3491);
    int _3615 = _3547 * int(_3577);
    int _3617 = _3615 + _3489;
    float _3619 = _3215 * _2843;
    float _3621 = float(uint(_3609));
    float _3623 = fma(_3181, _2779, _3605);
    float _3625 = float(uint(_3617));
    float _3627 = as_type<float>(_3481) * _3621;
    float _3629 = trunc(_3567);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = _3551 * int(_3599);
    int _3637 = _3635 + _3519;
    float _3639 = fma(_3181, _2821, _3619);
    float _3641 = as_type<float>(_3505) * _3625;
    float _3643 = fma(_2891, _3181, _3291);
    float _3645 = fma(_2891, _3219, _3535);
    float _3647 = float(uint(_3637));
    float _3649 = fma(_3219, _2821, _3531);
    bool _3651 = _3613 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3653 = trunc(_3583);
    float _3655 = precise::max(_3653, 0.0);
    uint _3657 = uint(_3655);
    float _3659 = fma(_3401, _2821, _3359);
    float _3661 = as_type<float>(_3543) * _3647;
    float _3663 = _2681 + _3487;
    float _3665 = trunc(_3603);
    float _3667 = precise::max(_3665, 0.0);
    uint _3669 = uint(_3667);
    float _3671 = _2779;
    float _3673 = _3483;
    float _3675 = _3283;
    float _3677 = _3447;
    float _3679 = _3411;
    float _3681 = as_type<float>(_3455);
    if (!_3651)
    {
        _3671 = _3483;
    }
    float _3683 = _3671;
    float _3685 = _3683;
    if (!_3651)
    {
        _3673 = _3283;
    }
    float _3687 = _3673;
    float _3689 = trunc(_3627);
    float _3691 = precise::max(_3689, 0.0);
    uint _3693 = uint(_3691);
    float _3695 = _3687;
    if (!_3651)
    {
        _3675 = _3663;
    }
    float _3697 = _3675;
    float _3699 = trunc(_3641);
    float _3701 = precise::max(_3699, 0.0);
    uint _3703 = uint(_3701);
    bool _3705 = !_3651;
    float _3707 = _3697;
    if (!_3705)
    {
        float _3709 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3711 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3713 = _3613 + _3711;
        float _3715 = _3663 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3717 = rsqrt(_3491);
        float _3719 = _3713 * _3709;
        float _3721 = _3719 * 0.15915493667125701904296875;
        float _3723 = _3721 * 6.283185482025146484375;
        float _3725 = sin(_3723);
        float _3727 = _3721 * 6.283185482025146484375;
        float _3729 = cos(_3727);
        float _3731 = fma(_3725, _3715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3733 = _3717 * _3731;
        float _3735 = _3729 + (-1.0);
        float _3737 = fma(_3467, _3733, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3739 = fma(_3429, _3733, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3741 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3745 = _3737 + _3743;
        float _3747 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3749 = _3739 + _3747;
        float _3751 = fma(_3663, _3729, _3741);
        float _3753 = _3745 * _3745;
        float _3755 = _3749 * _3749;
        _3707 = _3751;
        _3685 = _3753;
        _3677 = _3755;
        _3679 = _3737;
        _3695 = _3739;
    }
    float _3757 = _3707;
    float _3759 = _3685;
    float _3761 = _3677;
    float _3763 = _3679;
    float _3765 = _3695;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3769 = _3757 + _3767;
    int _3771 = int(_3479) + int(_3633);
    float _3773 = fma(_2891, _3401, _3601);
    int _3775 = ~_3239;
    int _3777 = _3775 + 1;
    float _3779 = fma(_3769, _3769, _3759);
    int _3781 = int(_3517) + int(_3657);
    float _3783 = trunc(_3661);
    float _3785 = precise::max(_3783, 0.0);
    uint _3787 = uint(_3785);
    int _3789 = int(_3541) + int(_3669);
    float _3791 = _3779 + _3761;
    int _3793 = int(_3577) + int(_3703);
    int _3795 = _3777 * _3771;
    int _3797 = _3795 + _3397;
    int _3799 = ~_3257;
    int _3801 = _3799 + 1;
    float _3803 = fma(_3415, _2783, _3623);
    int _3805 = ~_3307;
    int _3807 = _3805 + 1;
    float _3809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3811 = ~_3381;
    int _3813 = _3811 + 1;
    int _3815 = _3801 * _3781;
    int _3817 = _3815 + _3435;
    int _3819 = int(_3561) + int(_3693);
    int _3821 = _3807 * _3789;
    int _3823 = _3821 + _3455;
    int _3825 = ~_3399;
    int _3827 = _3825 + 1;
    int _3829 = _3813 * _3793;
    int _3831 = _3829 + _3489;
    bool _3833 = uint(_3797) >= uint(_3239);
    float _3835 = sqrt(_3791);
    bool _3837 = uint(_3817) >= uint(_3257);
    int _3839 = _3827 * _3819;
    int _3841 = _3839 + _3485;
    bool _3843 = uint(_3823) >= uint(_3307);
    float _3845 = fma(_3507, _2783, _3589);
    bool _3847 = uint(_3831) >= uint(_3381);
    float _3849 = fma(_3503, _2783, _3611);
    bool _3851 = !_3833;
    int _3853 = _3851 ? 0 : (-1);
    float _3855 = _3809 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3857 = uint(_3841) >= uint(_3399);
    bool _3859 = !_3837;
    int _3861 = _3859 ? 0 : (-1);
    float _3863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3865 = !_3843;
    int _3867 = _3865 ? 0 : (-1);
    float _3869 = fma(_3855, _973, -0.5);
    int _3871 = ~_3771;
    int _3873 = _3871 + _3853;
    int _3875 = _3873 + 1;
    out.m_85.x = _3803;
    out.m_85.y = _3845;
    out.m_85.z = _3849;
    int _3877 = int(_3599) + int(_3787);
    int _3879 = ~_3445;
    int _3881 = _3879 + 1;
    float _3883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3885 = ~_3781;
    int _3887 = _3885 + _3861;
    int _3889 = _3887 + 1;
    int _3891 = ~_3789;
    int _3893 = _3891 + _3867;
    int _3895 = _3893 + 1;
    int _3897 = _3881 * _3877;
    int _3899 = _3897 + _3519;
    bool _3901 = _3239 == 0;
    bool _3903 = _3239 == 0;
    int _3905 = _3307 * _3895;
    int _3907 = _3905 + _3455;
    int _3909 = _3397 ^ _3239;
    int _3911 = _3239 * _3875;
    int _3913 = _3911 + _3397;
    bool _3915 = !_3857;
    int _3917 = _3915 ? 0 : (-1);
    float _3919 = _3863 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3921 = _3257 == 0;
    bool _3923 = _3257 == 0;
    float _3925 = fma(_1339, _3919, -0.5);
    int _3927 = _3435 ^ _3257;
    int _3929 = _3257 * _3889;
    int _3931 = _3929 + _3435;
    bool _3933 = !_3901;
    int _3935 = _3933 ? _3913 : (-1);
    float _3937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3939 = !_3847;
    int _3941 = _3939 ? 0 : (-1);
    bool _3943 = uint(_3899) >= uint(_3445);
    bool _3945 = _3307 == 0;
    bool _3947 = _3307 == 0;
    float _3949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3951 = _3455 ^ _3307;
    float _3953 = float(_3935);
    float _3955 = _3883 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3957 = ~_3917;
    int _3959 = _3819 + _3957;
    int _3961 = _3959 + 1;
    bool _3963 = !_3943;
    int _3965 = _3963 ? 0 : (-1);
    float _3967 = fma(_3855, _3953, _2519);
    uint _3969 = uint(int(uint(_3927) >> uint(31)));
    float _3971 = _3937 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3973 = uint(int(uint(_3909) >> uint(31)));
    float _3975 = fma(_3955, _1059, -0.5);
    uint _3977 = uint(int(uint(_3951) >> uint(31)));
    float _3979 = fma(_3971, _1621, -0.5);
    bool _3981 = !_3921;
    int _3983 = _3981 ? _3931 : (-1);
    float _3985 = fma(_2465, _3869, _3967);
    bool _3987 = !_3945;
    int _3989 = _3987 ? _3907 : (-1);
    int _3991 = ~_3941;
    int _3993 = _3793 + _3991;
    int _3995 = _3993 + 1;
    int _3997 = ~int(_3969);
    int _3999 = _3997 + 1;
    int _4001 = ~_3965;
    int _4003 = _3877 + _4001;
    int _4005 = _4003 + 1;
    int _4007 = ~int(_3973);
    int _4009 = _4007 + 1;
    float _4011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4013 = ~int(_3977);
    int _4015 = _4013 + 1;
    float _4017 = float(_3983);
    float _4019 = float(_3989);
    int _4021 = _3995 ^ _3999;
    float _4023 = fma(_3955, _4017, _2475);
    int _4025 = _3961 ^ _4009;
    float _4027 = fma(_3971, _4019, _2469);
    int _4029 = _4005 ^ _4015;
    float _4031 = fma(_2471, _3975, _4023);
    int _4033 = ~_3999;
    int _4035 = _4033 + _4021;
    int _4037 = _4035 + 1;
    float _4039 = _3949 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4041 = ~_4009;
    int _4043 = _4041 + _4025;
    int _4045 = _4043 + 1;
    float _4047 = _4011 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4049 = ~_4015;
    int _4051 = _4049 + _4029;
    int _4053 = _4051 + 1;
    float _4055 = fma(_1381, _4039, -0.5);
    bool _4057 = !_3923;
    int _4059 = _4057 ? _4037 : (-1);
    float _4061 = fma(_2463, _3979, _4027);
    bool _4063 = !_3903;
    int _4065 = _4063 ? _4045 : (-1);
    float _4067 = _4031 + 0.5;
    bool _4069 = !_3947;
    int _4071 = _4069 ? _4053 : (-1);
    float _4073 = _4061 + 0.5;
    float _4075 = float(_4059);
    float _4077 = fma(_2895, _3503, _3773);
    float _4079 = float(_4065);
    float _4081 = float(_4071);
    float _4083 = -_2477;
    float _4085 = fma(_4039, _4075, _4083);
    float _4087 = fma(_4047, _1547, -0.5);
    float _4089 = -_2487;
    float _4091 = fma(_3919, _4079, _4089);
    float _4093 = fma(_3415, _2847, _3639);
    float _4095 = -_2107;
    float _4097 = fma(_4047, _4081, _4095);
    float _4099 = fma(_2461, _4055, _4085);
    float _4101 = fma(_2521, _3925, _4091);
    float _4103 = fma(_2895, _3415, _3643);
    float _4105 = fma(_2527, _4087, _4097);
    float _4107 = fma(_3507, _2847, _3649);
    float _4109 = fma(_2895, _3507, _3645);
    float _4111 = _3985 + 0.5;
    float _4113 = _4101 + 0.5;
    float _4115 = _4099 + 0.5;
    float _4117 = _4105 + 0.5;
    float _4119 = fma(_3503, _2847, _3659);
    out.m_87.x = _4103;
    out.m_87.y = _4109;
    out.m_87.z = _4077;
    bool _4121 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4123 = isnan(_3835);
    bool _4125 = _4121 || _4123;
    bool _4127 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4129 = _4125 || _4127;
    out.m_89.x = _4111;
    out.m_89.y = _4113;
    out.m_89.z = _4067;
    out.m_89.w = _4115;
    out.m_91.x = _4073;
    out.m_91.y = _4117;
    out.m_93.x = _4093;
    out.m_93.y = _4107;
    out.m_93.z = _4119;
    int _4131 = as_type<int>(_3757);
    if (!_4129)
    {
        _3681 = 1.0;
    }
    float _4133 = _3681;
    bool _4135 = !_4129;
    float _4137 = _4133;
    if (!_4135)
    {
        bool _4139 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4141 = isnan(_3835);
        bool _4143 = _4139 || _4141;
        bool _4145 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4147 = _4143 || _4145;
        if (!_4147)
        {
            float _4149 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4151 = _3835 + _4149;
            float _4153 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4155 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4153;
            float _4157 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4159 = _4157 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4161 = 1.0 / _4155;
            float _4163 = _4151 * _4161;
            float _4165 = fma(_4163, _4159, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4137 = _4165;
            _4167 = true;
        }
        else
        {
            bool _4169 = _3835 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4171 = isnan(_3835);
            bool _4173 = _4169 || _4171;
            bool _4175 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4177 = _4173 || _4175;
            if (!_4177)
            {
                float _4179 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4181 = _3835 + _4179;
                float _4183 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4185 = _4183 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4187 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4189 = _4187 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4191 = 1.0 / _4185;
                float _4193 = _4181 * _4191;
                float _4195 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4137 = _4195;
                _4167 = true;
            }
            else
            {
                _4137 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4167 = false;
    float _4197 = _4137;
    float _4199 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4201 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4203 = floor(_4199);
    float _4205 = floor(_4201);
    float _4207 = -_4203;
    float _4209 = _4199 + _4207;
    float _4211 = -_4205;
    float _4213 = _4201 + _4211;
    float2 _11630 = float2(_4209, _4213);
    float _4215 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11630, float2(0.0), isnan(_11630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11630, float2(0.0), isnan(_11630)), level(0.0)).x;
    float _4217 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4219 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4221 = _3763 + _4219;
    float _4223 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4217);
    float _4225 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4227 = _3765 + _4225;
    float _4229 = fma(_4221, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4231 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4223);
    float _4233 = _2681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4235 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4237 = fma(_4227, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4239 = _4231 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4241 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4233);
    float _4243 = _2681 + _4235;
    float _4245 = 1.0 / _4239;
    float _4247 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4241);
    float _4249 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4251 = _4247 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4253 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4249);
    float _4255 = _4251 + _4239;
    float _4257 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4253);
    float _4259 = _4257 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4261 = _4255 * _4245;
    float _4263 = _4261 * 0.5;
    bool _4265 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4267 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4269 = _4265 || _4267;
    bool _4271 = isnan(0.5);
    bool _4273 = _4269 || _4271;
    float _4275 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4277 = fma(_4263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4275);
    float _4279 = 1.0 / _4277;
    float _4281 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    int _4283 = 2;
    if (_4273)
    {
        _4281 = _4237;
    }
    float _4285 = _4281;
    float _4287 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4289 = _4279 * _4287;
    float _4291 = _4243 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _4293 = _4289 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4295 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4291);
    bool _4297 = _4289 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4299 = !_4293;
    int _4301 = _4299 ? 0 : 1;
    float _4303 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4295);
    float _4305 = _4303 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4307 = _4285;
    if (!_4293)
    {
        _4283 = 1;
    }
    int _4309 = _4283;
    float _4311 = trunc(_4305);
    int _4313 = int(_4311);
    int _4315 = _4309;
    if (!_4297)
    {
        _4315 = _4301;
    }
    int _4317 = _4315;
    int _4319 = _4317 << 6;
    float _4321 = trunc(_4259);
    int _4323 = int(_4321);
    int _4325 = _4319 + 48;
    uint _4327 = uint(int(uint(_4325) >> uint(2)));
    uint _4329 = uint(int(uint(int(_4327)) >> uint(2)));
    int _4331 = int(_4327) & 3;
    float _4333 = (*spvDescriptorSet0.vp_c15)._m0[int(_4329)][_4331];
    int _4335 = int(_4327) + 1;
    uint _4337 = uint(int(uint(_4335) >> uint(2)));
    int _4339 = _4335 & 3;
    float _4341 = (*spvDescriptorSet0.vp_c15)._m0[int(_4337)][_4339];
    int _4343 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4345 = _4313 + _4343;
    int _4347 = _4345 + 1;
    int _4349 = _4319 + 56;
    uint _4351 = uint(int(uint(_4349) >> uint(2)));
    uint _4353 = uint(int(uint(int(_4351)) >> uint(2)));
    int _4355 = int(_4351) & 3;
    float _4357 = (*spvDescriptorSet0.vp_c15)._m0[int(_4353)][_4355];
    int _4359 = int(_4351) + 1;
    uint _4361 = uint(int(uint(_4359) >> uint(2)));
    int _4363 = _4359 & 3;
    float _4365 = (*spvDescriptorSet0.vp_c15)._m0[int(_4361)][_4363];
    int _4367 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4369 = _4323 + _4367;
    int _4371 = _4369 + 1;
    int _4373 = _4319 + 64;
    uint _4375 = uint(int(uint(_4373) >> uint(2)));
    uint _4377 = uint(int(uint(int(_4375)) >> uint(2)));
    int _4379 = int(_4375) & 3;
    float _4381 = (*spvDescriptorSet0.vp_c15)._m0[int(_4377)][_4379];
    int _4383 = int(_4375) + 1;
    uint _4385 = uint(int(uint(_4383) >> uint(2)));
    int _4387 = _4383 & 3;
    float _4389 = (*spvDescriptorSet0.vp_c15)._m0[int(_4385)][_4387];
    bool _4391 = _4371 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4393 = _4371 | _4347;
    int _4395 = _4319 + 72;
    uint _4397 = uint(int(uint(_4395) >> uint(2)));
    uint _4399 = uint(int(uint(int(_4397)) >> uint(2)));
    int _4401 = int(_4397) & 3;
    float _4403 = (*spvDescriptorSet0.vp_c15)._m0[int(_4399)][_4401];
    int _4405 = int(_4397) + 1;
    uint _4407 = uint(int(uint(_4405) >> uint(2)));
    int _4409 = _4405 & 3;
    float _4411 = (*spvDescriptorSet0.vp_c15)._m0[int(_4407)][_4409];
    bool _4413 = _4393 < 0;
    bool _4415 = _4413 || _4391;
    float _4417 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4419 = _3757 + _4417;
    bool _4421 = _4347 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4423 = _4421 || _4415;
    float _4425 = fma(_4419, _4197, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4427 = _4419;
    float _4429 = as_type<float>(_4323);
    int _4431 = _4347;
    float _4433 = as_type<float>(_4317);
    if (_4273)
    {
        _4427 = _4229;
    }
    float _4435 = _4427;
    int _4437 = _4319 + 96;
    uint _4439 = uint(int(uint(_4437) >> uint(2)));
    uint _4441 = uint(int(uint(int(_4439)) >> uint(2)));
    int _4443 = int(_4439) & 3;
    float _4445 = (*spvDescriptorSet0.vp_c15)._m0[int(_4441)][_4443];
    int _4447 = int(_4439) + 1;
    uint _4449 = uint(int(uint(_4447) >> uint(2)));
    int _4451 = _4447 & 3;
    float _4453 = (*spvDescriptorSet0.vp_c15)._m0[int(_4449)][_4451];
    float _4455 = _4435;
    if (_4273)
    {
        _4429 = _4425;
    }
    float _4457 = _4429;
    int _4459 = _4319 + 104;
    uint _4461 = uint(int(uint(_4459) >> uint(2)));
    uint _4463 = uint(int(uint(int(_4461)) >> uint(2)));
    int _4465 = int(_4461) & 3;
    float _4467 = (*spvDescriptorSet0.vp_c15)._m0[int(_4463)][_4465];
    int _4469 = int(_4461) + 1;
    uint _4471 = uint(int(uint(_4469) >> uint(2)));
    int _4473 = _4469 & 3;
    float _4475 = (*spvDescriptorSet0.vp_c15)._m0[int(_4471)][_4473];
    float _4477 = _4457;
    int _4479 = as_type<int>(_4475);
    if (!_4273)
    {
        float _4481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4483 = _2681 + _4481;
        float _4485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4487 = _2687 + _4485;
        float _4489 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4491 = _4483 * _4483;
        float _4493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4495 = _2695 + _4493;
        float _4497 = fma(_4487, _4487, _4491);
        float _4499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4501 = fma(_4495, _4495, _4497);
        float _4503 = sqrt(_4501);
        float _4505 = _4489 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4507 = -_2681;
        float _4509 = _4507 + _4425;
        float _4511 = precise::min(_4503, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4513 = _4511 * _4499;
        float _4515 = -_2695;
        float _4517 = _4515 + _4237;
        float _4519 = _4505 * _4513;
        float _4521 = -_2687;
        float _4523 = _4521 + _4229;
        float _4525 = fma(_4509, _4519, _2681);
        float _4527 = fma(_4523, _4519, _2687);
        float _4529 = fma(_4517, _4519, _2695);
        _4477 = _4525;
        _4131 = as_type<int>(_4519);
        _4455 = _4527;
        _4307 = _4529;
    }
    float _4531 = _4477;
    int _4533 = _4131;
    float _4535 = _4455;
    float _4537 = _4307;
    float _4539 = _4243 * _4453;
    float _4541 = _4243 * _4341;
    int _4543 = _4533;
    if (!_4423)
    {
        int _4545 = _4347 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4547 = _4545 + _4371;
        _4543 = _4547;
    }
    int _4549 = _4543;
    float _4551 = _4243 * _4389;
    float _4553 = fma(_2687, _4445, _4539);
    float _4555 = fma(_2687, _4333, _4541);
    float _4557 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4559 = _4319 + 80;
    uint _4561 = uint(int(uint(_4559) >> uint(2)));
    uint _4563 = uint(int(uint(int(_4561)) >> uint(2)));
    int _4565 = int(_4561) & 3;
    float _4567 = (*spvDescriptorSet0.vp_c15)._m0[int(_4563)][_4565];
    int _4569 = int(_4561) + 1;
    uint _4571 = uint(int(uint(_4569) >> uint(2)));
    int _4573 = _4569 & 3;
    float _4575 = (*spvDescriptorSet0.vp_c15)._m0[int(_4571)][_4573];
    float _4577 = fma(_2695, _4467, _4553);
    if (!_4423)
    {
        int _4579 = _4549 << 2;
        _4431 = _4579;
    }
    int _4581 = _4431;
    float _4583 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4557);
    float _4585 = fma(_2687, _4381, _4551);
    float _4587 = _4577 + _4475;
    int _4589 = _4581;
    if (!_4423)
    {
        uint _4591 = uint(int(uint(_4549) >> uint(2)));
        _4479 = int(_4591);
    }
    int _4593 = _4479;
    float _4595 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4583);
    if (!_4423)
    {
        int _4597 = 12 & _4581;
        _4589 = _4597;
    }
    int _4599 = _4589;
    int _4601 = _4319 + 88;
    uint _4603 = uint(int(uint(_4601) >> uint(2)));
    uint _4605 = uint(int(uint(int(_4603)) >> uint(2)));
    int _4607 = int(_4603) & 3;
    float _4609 = (*spvDescriptorSet0.vp_c15)._m0[int(_4605)][_4607];
    int _4611 = int(_4603) + 1;
    uint _4613 = uint(int(uint(_4611) >> uint(2)));
    int _4615 = _4611 & 3;
    float _4617 = (*spvDescriptorSet0.vp_c15)._m0[int(_4613)][_4615];
    float _4619 = 1.0 / _4587;
    float _4621 = _4595 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4623 = as_type<float>(_4599);
    if (!_4423)
    {
        int _4625 = _4593 << 4;
        int _4627 = _4625 + _4599;
        _4623 = as_type<float>(_4627);
    }
    float _4629 = _4623;
    float _4631 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4633 = fma(_2695, _4357, _4555);
    float _4635 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4637 = fma(_2695, _4403, _4585);
    float _4639 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4641 = _4629;
    if (!_4423)
    {
        int _4643 = as_type<int>(_4629) + 400;
        uint _4645 = uint(int(uint(_4643) >> uint(2)));
        uint _4647 = uint(int(uint(int(_4645)) >> uint(2)));
        int _4649 = int(_4645) & 3;
        float _4651 = (*spvDescriptorSet0.vp_c15)._m0[int(_4647)][_4649];
        _4641 = _4651;
    }
    float _4653 = _4641;
    float _4655 = -_4635;
    float _4657 = fma(_4655, _4631, 1.0);
    float _4659 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4661 = _4633 + _4365;
    float _4663 = _4637 + _4411;
    float _4665 = _4531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4667 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4639);
    float _4669 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4659);
    float _4671 = _4661 * _4619;
    float _4673 = fma(_4535, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4665);
    float _4675 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4667);
    float _4677 = _4663 * _4619;
    float _4679 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4669);
    bool _4681 = _4671 >= 0.0;
    float _4683 = fma(_4537, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4673);
    float _4685 = _4675 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4687 = _4453;
    float _4689 = _4619;
    if (!_4423)
    {
        float _4691 = floor(_4305);
        _4687 = _4691;
    }
    float _4693 = _4687;
    bool _4695 = _4671 <= 1.0;
    bool _4697 = _4695 && _4681;
    float _4699 = _4683 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4701 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4703 = _4679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _4705 = _4677 >= 0.0;
    bool _4707 = _4705 && _4697;
    float _4709 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4711 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4701);
    float _4713 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _4715 = _4677 <= 1.0;
    bool _4717 = _4715 && _4707;
    float _4719 = as_type<float>(_4319);
    if (!_4423)
    {
        float _4721 = floor(_4259);
        _4719 = _4721;
    }
    float _4723 = _4719;
    float _4725 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4711);
    float _4727 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4709);
    float _4729 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4713);
    float _4731 = _4243 * _4575;
    float _4733 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4725);
    float _4735 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4727);
    float _4737 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4729);
    float _4739 = fma(_2687, _4567, _4731);
    float _4741 = log2(_4657);
    float _4743 = _4693;
    if (!_4423)
    {
        float _4745 = -_4693;
        float _4747 = _4305 + _4745;
        _4743 = _4747;
    }
    float _4749 = _4743;
    float _4751 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4735);
    if (_4717)
    {
        float _4753 = float(_4317);
        _4433 = _4753;
    }
    float _4755 = _4433;
    float _4757 = fma(_2695, _4609, _4739);
    float _4759 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4737);
    float _4761 = 1.0 / _4733;
    float _4763 = _4757 + _4617;
    float _4765 = _4763 * _4619;
    float _4767 = _4755;
    if (!_4423)
    {
        float _4769 = -_4723;
        float _4771 = _4259 + _4769;
        _4689 = _4771;
    }
    float _4773 = _4689;
    float _4775 = _4731;
    if (_4717)
    {
        float _4777 = rint(_4755);
        float _4779 = precise::max(_4777, 0.0);
        uint _4781 = uint(_4779);
        uint _4783 = clamp(_4781, 0u, 65535u);
        _4775 = as_type<float>(_4783);
    }
    float _4785 = _4775;
    float _4787 = _4741 * 0.693147182464599609375;
    float _4789 = _4723;
    float _4791 = _4653;
    if (!_4423)
    {
        float _4793 = rint(_4653);
        float _4795 = precise::max(_4793, 0.0);
        uint _4797 = uint(_4795);
        uint _4799 = clamp(_4797, 0u, 65535u);
        _4789 = as_type<float>(_4799);
    }
    float _4801 = _4789;
    float _4803 = _4751 * _4761;
    float _4805 = _4759 * _4761;
    float _4807 = _4787 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4809 = fma(_4803, 0.5, 0.5);
    float _4811 = fma(_4805, -0.5, 0.5);
    float _4813 = _4785;
    if (_4717)
    {
        float3 _12655 = float3(_4671, _4677, float(as_type<int>(_4785)));
        float3 _12659 = select(_12655, float3(0.0), isnan(_12655));
        float _4815 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12659.xy, uint(rint(_12659.z)), _4765, level(0.0));
        _4813 = _4815;
    }
    float _4817 = _4813;
    float3 _12669 = float3(_4809, _4811, _4807);
    float _4819 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12669, float3(0.0), isnan(_12669)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12669, float3(0.0), isnan(_12669)), level(0.0)).x;
    float3 _12678 = float3(_4809, _4811, _4807);
    float4 _4822 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12678, float3(0.0), isnan(_12678)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12678, float3(0.0), isnan(_12678)), level(0.0)).xyzw;
    float _4824 = _4822.x;
    float _4826 = _4822.y;
    float _4828 = _4822.z;
    float _4830 = _4822.w;
    float _4832 = _4749;
    if (!_4423)
    {
        float3 _12701 = float3(_4773, _4749, float(as_type<int>(_4801)));
        float3 _12703 = select(_12701, float3(0.0), isnan(_12701));
        float _4834 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12703.xy, uint(rint(_12703.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12703.xy, uint(rint(_12703.z)), level(0.0)).x;
        _4832 = _4834;
    }
    float _4836 = _4832;
    if (_4423)
    {
        _4767 = 1.0;
    }
    float _4838 = _4767;
    float _4840 = _4838;
    if (!_4423)
    {
        int _4842 = _4549 << 4;
        int _4844 = _4842 + 2048;
        uint _4846 = uint(int(uint(_4844) >> uint(2)));
        uint _4848 = uint(int(uint(int(_4846)) >> uint(2)));
        int _4850 = int(_4846) & 3;
        float _4852 = (*spvDescriptorSet0.vp_c15)._m0[int(_4848)][_4850];
        int _4854 = int(_4846) + 1;
        uint _4856 = uint(int(uint(_4854) >> uint(2)));
        int _4858 = _4854 & 3;
        float _4860 = (*spvDescriptorSet0.vp_c15)._m0[int(_4856)][_4858];
        int _4862 = _4844 + 8;
        uint _4864 = uint(int(uint(_4862) >> uint(2)));
        uint _4866 = uint(int(uint(int(_4864)) >> uint(2)));
        int _4868 = int(_4864) & 3;
        float _4870 = (*spvDescriptorSet0.vp_c15)._m0[int(_4866)][_4868];
        int _4872 = int(_4864) + 1;
        uint _4874 = uint(int(uint(_4872) >> uint(2)));
        int _4876 = _4872 & 3;
        float _4878 = (*spvDescriptorSet0.vp_c15)._m0[int(_4874)][_4876];
        float _4880 = _4243 * _4860;
        float _4882 = fma(_2687, _4852, _4880);
        float _4884 = fma(_2695, _4870, _4882);
        float _4886 = _4884 + _4878;
        float _4888 = precise::clamp(_4886, 0.0, 1.0);
        float _4890 = -_4888;
        float _4892 = _4890 + _4836;
        float _4894 = fma(_4892, 500.0, 1.5);
        float _4896 = exp2(_4894);
        float _4898 = 0.0 + _4896;
        float _4900 = precise::clamp(_4898, 0.0, 1.0);
        _4791 = _4870;
        _4840 = _4900;
    }
    float _4902 = _4791;
    float _4904 = _4840;
    float _4906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4908 = _4531 + _4906;
    float _4910 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4912 = _4535 + _4910;
    float _4914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4916 = _4537 + _4914;
    float _4918 = _4908 * _4908;
    float _4920 = fma(_4912, _4912, _4918);
    float _4922 = fma(_4916, _4916, _4920);
    float _4924 = rsqrt(_4922);
    float _4926 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4928 = _4912 * _4926;
    float _4930 = _4916 * _4926;
    float _4932 = _4928 * _4928;
    float _4934 = _4930 * _4930;
    float _4936 = _4932 + _4934;
    float _4938 = sqrt(_4936);
    bool _4940 = _4938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4944 = _4938 + _4942;
    float _4946 = _4916;
    float _4948 = _4936;
    float _4950 = _4944;
    float _4952 = _4902;
    float _4954 = _4908;
    float _4956 = _4926;
    if (_4940)
    {
        float _4958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4946 = _4958;
    }
    float _4960 = _4946;
    if (_4940)
    {
        float _4962 = rsqrt(_4936);
        _4948 = _4962;
    }
    float _4964 = _4948;
    float _4966 = _4964;
    if (_4940)
    {
        float _4968 = _4944 * _4960;
        _4950 = _4968;
    }
    float _4970 = _4950;
    if (_4940)
    {
        float _4972 = _4970 * 0.15915493667125701904296875;
        _4952 = _4972;
    }
    float _4974 = _4952;
    float _4976 = _4924;
    if (_4940)
    {
        float _4978 = _4974 * 6.283185482025146484375;
        float _4980 = sin(_4978);
        _4976 = _4980;
    }
    float _4982 = _4976;
    float _4984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4986 = precise::max(0.0, _4984);
    float _4988 = _4836;
    float _4990 = _4984;
    if (_4940)
    {
        float _4992 = _4974 * 6.283185482025146484375;
        float _4994 = cos(_4992);
        _4988 = _4994;
    }
    float _4996 = _4988;
    float _4998 = -_4926;
    float _5000 = -_4986;
    float _5002 = fma(_4908, _4998, _5000);
    float _5004 = _5002;
    if (!_4940)
    {
        _4954 = _4930;
    }
    float _5006 = _4954;
    float _5008 = _5006;
    if (_4940)
    {
        float _5010 = _5002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4990 = _5010;
    }
    float _5012 = _4990;
    float _5014 = _4982;
    float _5016 = _5012;
    if (_4940)
    {
        float _5018 = fma(_4982, _5012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5014 = _5018;
    }
    float _5020 = _5014;
    float _5022 = _5020;
    float _5024 = _4996;
    if (_4940)
    {
        float _5026 = _4996 + (-1.0);
        _5016 = _5026;
    }
    float _5028 = _5016;
    float _5030 = _5028;
    if (_4940)
    {
        float _5032 = _4964 * _5020;
        _4956 = _5032;
    }
    float _5034 = _4956;
    if (!_4940)
    {
        _5022 = _4928;
    }
    float _5036 = _5022;
    float _5038 = _5036;
    if (_4940)
    {
        float _5040 = _5028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5030 = _5040;
    }
    float _5042 = _5030;
    if (_4940)
    {
        float _5044 = _4928 * _5034;
        _5038 = _5044;
    }
    float _5046 = _5038;
    if (!_4940)
    {
        _4966 = _4932;
    }
    float _5048 = _4966;
    float _5050 = _5048;
    if (_4940)
    {
        float _5052 = _4930 * _5034;
        _5008 = _5052;
    }
    float _5054 = _5008;
    if (_4940)
    {
        float _5056 = fma(_5002, _4996, _5042);
        _5004 = _5056;
    }
    float _5058 = _5004;
    if (_4940)
    {
        float _5060 = _5046 * _5046;
        _5050 = _5060;
    }
    float _5062 = _5050;
    float _5064 = sqrt(_4922);
    if (!_4940)
    {
        _5024 = _4934;
    }
    float _5066 = _5024;
    float _5068 = _5066;
    if (_4940)
    {
        float _5070 = _5054 * _5054;
        _5068 = _5070;
    }
    float _5072 = _5068;
    float _5074 = fma(_5058, _5058, _5062);
    float _5076 = _5074 + _5072;
    float _5078 = rsqrt(_5076);
    float _5080 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5082 = fma(_5064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5080);
    float _5084 = precise::clamp(_5082, 0.0, 1.0);
    float _5086 = -_5084;
    float _5088 = _5086 + 1.0;
    float _5090 = abs(_5088);
    float _5092 = log2(_5090);
    float _5094 = _5078 * _5046;
    float _5096 = _5078 * _5058;
    float _5098 = _5078 * _5054;
    float _5100 = _5094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5102 = -_5100;
    float _5104 = fma(_5096, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5102);
    float _5106 = -_5098;
    float _5108 = fma(_5106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5104);
    float _5110 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5112 = fma(_5108, -0.5, 0.5);
    float _5114 = fma(_5108, 0.5, 0.5);
    float _5116 = _5096 + 1.0;
    float _5118 = exp2(_5110);
    float _5120 = fma(_5114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5122 = fma(_5114, _5120, -0.212114393711090087890625);
    float _5124 = sqrt(_5112);
    float _5126 = fma(_5114, _5122, 1.570728778839111328125);
    float _5128 = -_5096;
    float _5130 = fma(_5118, _5116, _5128);
    float _5132 = fma(_5130, 0.5, 0.5);
    float _5134 = _5124 * 0.636619746685028076171875;
    float _5136 = -_5126;
    float _5138 = fma(_5134, _5136, 1.0);
    float2 _13171 = float2(_5138, _5132);
    float3 _5142 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13171, float2(0.0), isnan(_13171)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13171, float2(0.0), isnan(_13171)), level(0.0)).xyz;
    float _5144 = _5142.x;
    float _5146 = _5142.y;
    float _5148 = _5142.z;
    float _5150 = abs(_4289);
    float _5152 = log2(_5150);
    float _5154 = _4685 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5156 = _5092 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5158 = -_4215;
    float _5160 = _5158 + 1.0;
    float _5162 = fma(_4699, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5154);
    out.m_95.x = _4535;
    out.m_95.y = _4531;
    out.m_95.z = _4537;
    bool _5164 = _4289 <= 8000.0;
    bool _5166 = isnan(_4289);
    bool _5168 = _5164 || _5166;
    bool _5170 = isnan(8000.0);
    bool _5172 = _5168 || _5170;
    float _5174 = float(_5172);
    float _5176 = fma(_4621, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5162);
    float _5178 = exp2(_5156);
    float _5180 = fma(_4703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5176);
    float _5182 = _5152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5184 = exp2(_5182);
    float _5186 = -_5178;
    float _5188 = _5186 + 1.0;
    float _5190 = fma(_5184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5192 = precise::clamp(_5190, 0.0, 1.0);
    float _5194 = _5180 + _4733;
    float _5196 = fma(_5192, -2.0, 3.0);
    float _5198 = _5192 * _5192;
    float _5200 = _5198 * _5196;
    float _5202 = -_5200;
    float _5204 = _5202 + 1.0;
    float _5206 = fma(_5204, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5200);
    float _5208 = _5194 * 0.5;
    float _5210 = _5194;
    float _5212 = _4751;
    if (!_4717)
    {
        _5210 = 1.0;
    }
    float _5214 = _5210;
    float _5216 = _5174 * _5206;
    float _5218 = _5214;
    if (_4717)
    {
        bool _5220 = _4817 >= _4765;
        bool _5222 = isnan(_4817);
        bool _5224 = _5220 || _5222;
        bool _5226 = isnan(_4765);
        bool _5228 = _5224 || _5226;
        float _5230 = float(_5228);
        _5218 = _5230;
    }
    float _5232 = _5218;
    float _5234 = _5188 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4751;
    out.gl_Position.y = _4759;
    out.gl_Position.z = _5180;
    out.gl_Position.w = _4733;
    float _5236 = _5216 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5238 = _5232 * _4904;
    bool _5240 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5242 = isnan(_5064);
    bool _5244 = _5240 || _5242;
    bool _5246 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5248 = _5244 || _5246;
    float _5250 = _5160 * _5236;
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5234 * _4819;
    float _5256 = -_5234;
    float _5258 = _5256 + 1.0;
    out.m_97.z = _5208;
    out.m_97.w = _4733;
    float _5260 = -_5252;
    float _5262 = fma(_5260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5264 = _4830 * _5254;
    float _5266 = _4830 * _5258;
    float _5268 = -_5238;
    float _5270 = fma(_5268, _5262, 1.0);
    float _5272 = precise::clamp(_5270, 0.0, 1.0);
    float _5274 = _5272 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5276 = _5272;
    float _5278 = _5264;
    if (!_5248)
    {
        _5212 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5280 = _5212;
    float _5282 = _5280;
    float _5284 = _5280;
    if (!_5248)
    {
        _5276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5286 = _5276;
    out.m_99.x = _5274;
    float _5288 = _5148 * _5254;
    float _5290 = fma(_5144, _5264, _4824);
    float _5292 = fma(_5146, _5264, _4826);
    float _5294 = _5286;
    float _5296 = _5286;
    if (!_5248)
    {
        _5278 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5298 = _5278;
    float _5300 = fma(_4830, _5288, _4828);
    out.m_101.x = _5290;
    out.m_101.y = _5292;
    out.m_101.z = _5300;
    out.m_101.w = _5266;
    bool _5302 = !_5248;
    float _5304 = _5298;
    float _5306 = _5298;
    if (!_5302)
    {
        bool _5308 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5310 = isnan(_5064);
        bool _5312 = _5308 || _5310;
        bool _5314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5316 = _5312 || _5314;
        if (!_5316)
        {
            float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5320 = _5064 + _5318;
            float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5324 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5322;
            float _5326 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5328 = _5326 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5332 = _5330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5334 = 1.0 / _5324;
            float _5336 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5338 = _5336 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5340 = _5320 * _5334;
            float _5342 = precise::clamp(_5340, 0.0, 1.0);
            float _5344 = fma(_5342, _5328, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5346 = fma(_5342, _5332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5348 = fma(_5342, _5338, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5306 = _5346;
            _5284 = _5344;
            _5296 = _5348;
            _5350 = true;
        }
        else
        {
            bool _5352 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5354 = isnan(_5064);
            bool _5356 = _5352 || _5354;
            bool _5358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5360 = _5356 || _5358;
            if (!_5360)
            {
                _5282 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5362 = _5282;
            _5284 = _5362;
            if (!_5360)
            {
                _5304 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5364 = _5304;
            _5306 = _5364;
            if (!_5360)
            {
                _5294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5366 = _5294;
            bool _5368 = !_5360;
            _5296 = _5366;
            if (!_5368)
            {
                bool _5370 = _5064 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5372 = isnan(_5064);
                bool _5374 = _5370 || _5372;
                bool _5376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5378 = _5374 || _5376;
                if (!_5378)
                {
                    float _5380 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5382 = _5064 + _5380;
                    float _5384 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5386 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5384;
                    float _5388 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5390 = _5388 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5392 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5394 = _5392 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5396 = 1.0 / _5386;
                    float _5398 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5400 = _5398 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5402 = _5382 * _5396;
                    float _5404 = precise::clamp(_5402, 0.0, 1.0);
                    float _5406 = fma(_5404, _5390, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5408 = fma(_5404, _5394, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5410 = fma(_5404, _5400, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5306 = _5408;
                    _5284 = _5406;
                    _5296 = _5410;
                    _5350 = true;
                }
                else
                {
                    _5306 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5284 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5350 = false;
    float _5412 = _5306;
    float _5414 = _5284;
    float _5416 = _5296;
    float _5418 = _5412 * 0.586610972881317138671875;
    bool _5420 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _5422 = fma(_5414, 0.298911988735198974609375, _5418);
    out.m_103.x = 0.0;
    float _5424 = fma(_5416, 0.114477999508380889892578125, _5422);
    float _5426 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5428 = -_5424;
    float _5430 = _5428 + _5414;
    float _5432 = -_5424;
    float _5434 = _5432 + _5412;
    float _5436 = -_5424;
    float _5438 = _5436 + _5416;
    out.m_99.w = _5426;
    float _5440 = fma(_5430, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    float _5442 = fma(_5434, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    float _5444 = fma(_5438, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5424);
    out.m_105.x = _5440;
    out.m_105.y = _5442;
    out.m_105.z = _5444;
    if (!_5420)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5446 = -_4531;
    float _5448 = _5446 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5450 = -_4535;
    float _5452 = _5450 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5454 = -_4537;
    float _5456 = _5454 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5458 = _5448 * _5448;
    float _5460 = fma(_5452, _5452, _5458);
    float _5462 = fma(_5456, _5456, _5460);
    float _5464 = sqrt(_5462);
    float _5466 = rsqrt(_5462);
    float _5468 = -_5464;
    float _5470 = _5468 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5472 = _5470 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5474 = precise::clamp(_5472, 0.0, 1.0);
    float _5476 = _5452 * _5466;
    float _5478 = _5448 * _5466;
    float _5480 = abs(_5474);
    float _5482 = log2(_5480);
    float _5484 = _5456 * _5466;
    float _5486 = _5476 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5488 = _4107 * _5478;
    float _5490 = -_5478;
    float _5492 = -_5486;
    float _5494 = fma(_5490, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5492);
    float _5496 = fma(_4093, _5476, _5488);
    float _5498 = -_5484;
    float _5500 = fma(_5498, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5494);
    float _5502 = fma(_4119, _5484, _5496);
    float _5504 = precise::clamp(_5502, 0.0, 1.0);
    float _5506 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5508 = _5500 + _5506;
    float _5510 = _5482 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5512 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5514 = precise::clamp(_5512, 0.0, 1.0);
    float _5516 = exp2(_5510);
    float _5518 = _5516 * _5514;
    float _5520 = _5504 * _5518;
    float _5522 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5524 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5526 = _5520 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _5522;
    out.m_103.y = _5524;
    out.m_103.z = _5526;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

