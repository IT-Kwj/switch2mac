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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5224 = false;
    bool _612 = false;
    bool _200 = false;
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
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5508 = as_type<float>(_138);
        out.gl_Position.z = _5508;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_61.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    int _172 = 0;
    if (_166)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5578 = as_type<float>(_176);
        out.gl_Position.z = _5578;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_63.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _154 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = 1.0 / _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _228 = 1.0 / _216;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _234 = 1.0 / _220;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _236;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = 1.0 / _232;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _256 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _258 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _262 = isnan(_208);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _274 = 1.0 / _226;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _208 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = _208 + _280;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _286 = 1.0 / _238;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _292 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _294 = _288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _298 = _208 + _296;
    out.m_65.x = _258;
    out.m_65.y = _256;
    out.m_65.z = _292;
    out.m_65.w = _244;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _208 + _300;
    float _304 = _298 * _248;
    bool _306 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _308 = isnan(_208);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    out.m_67.x = _294;
    out.m_67.y = _246;
    out.m_67.z = _272;
    out.m_67.w = _290;
    float _318 = _302 * _228;
    float _320 = _278 * _234;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _208 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _208 + _326;
    float _330 = _282 * _286;
    float _332 = _324 * _222;
    float _334 = _328 * _274;
    bool _336 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _338 = isnan(_208);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_346;
    float _350 = _348 + 1.0;
    float _352 = -_316;
    float _354 = _352 + 1.0;
    bool _356 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_208);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _270 * _350;
    float _370 = -_270;
    float _372 = _370 + 1.0;
    bool _374 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_208);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _366 * _354;
    float _392 = _316 * _372;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = -_366;
    float _416 = _414 + 1.0;
    bool _418 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_208);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_396, _320, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _432 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _434 = isnan(_208);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_400, _320, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = fma(_388, _320, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _448 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = fma(_408, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = fma(_412, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _384 * _416;
    float _456 = -_384;
    float _458 = _456 + 1.0;
    float _460 = -_442;
    float _462 = _460 + 1.0;
    float _464 = _442 * _458;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = _428 * _462;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _476;
    float _480 = fma(_468, _332, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = fma(_472, _332, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = _450 * _474;
    float _486 = fma(_478, _332, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = _448 * _474;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = _452 * _474;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _508 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].z, _494);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_430, _464, _504);
    float _516 = fma(_444, _464, _506);
    float _518 = fma(_446, _464, _508);
    float _520 = fma(_498, _334, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _522 = fma(_502, _334, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _524 = fma(_512, _334, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _526 = fma(_482, _454, _514);
    float _528 = fma(_486, _454, _516);
    float _530 = fma(_480, _454, _518);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _540;
    float _544 = fma(_520, _390, _526);
    float _546 = fma(_522, _390, _528);
    float _548 = fma(_524, _390, _530);
    float _550 = fma(_534, _330, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _552 = fma(_538, _330, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _554 = fma(_542, _330, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _568 = fma(_550, _392, _544);
    float _570 = fma(_558, _304, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _572 = fma(_562, _304, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _574 = fma(_566, _304, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _576 = fma(_552, _392, _546);
    float _578 = fma(_554, _392, _548);
    float _580 = fma(_570, _368, _568);
    float _582 = fma(_572, _368, _576);
    float _584 = fma(_574, _368, _578);
    float _586 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].x, _580);
    float _588 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].y, _582);
    float _590 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].z, _584);
    bool _592 = !_284;
    float _610;
    if (!_592)
    {
        float _594 = in.m_63.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        float _614 = float(_122);
        float _616 = 1.0 / _614;
        float _618 = _154 * _616;
        _610 = _618;
    }
    _612 = false;
    float _620 = _610;
    float _622 = in.m_56.x;
    float _624 = in.m_56.y;
    float _626 = in.m_56.z;
    float _628 = _624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _630 = _624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _632 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[4].x, _628);
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[6].x, _630);
    float _636 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[4].z, _632);
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    float _640 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _642 = _638 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _644 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _646 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _648 = floor(_644);
    float _650 = floor(_646);
    float _652 = -_648;
    float _654 = _644 + _652;
    float _656 = -_650;
    float _658 = _646 + _656;
    float2 _6431 = float2(_654, _658);
    float _660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6431, float2(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6431, float2(0.0), isnan(_6431)), level(0.0)).x;
    float _662 = in.m_69.x;
    float _664 = in.m_69.y;
    float _666 = in.m_69.z;
    float _668 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _670 = in.m_63.x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _674 = _672 != 0;
    float _676 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _678 = log2(_676);
    float _680 = in.m_63.y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _684 = in.m_63.z;
    float _686 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _688 = int(_686);
    float _690 = -_640;
    float _692 = _690 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = float(_122);
    float _696 = -_642;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _702 = int(_700);
    float _704 = _590 * _666;
    float _706 = _588 * _664;
    float _708 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[5].x, _668);
    float _710 = _670 * 2.0;
    float _712 = _670 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = _586 * _662;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _718 = floor(_710);
    float _720 = _680 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _722 = _680 * 2.0;
    float _724 = -_682;
    float _726 = fma(_712, 2.0, _724);
    float _728 = _680 + _684;
    float _730 = fma(_720, -2.0, _716);
    float _732 = _684 * 2.0;
    float _734 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].z, _708);
    float _736 = floor(_722);
    float _738 = _670 + _680;
    float _740 = _728 + (-1.0);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _744 = float(_688);
    float _746 = _738 + (-1.0);
    int _748 = as_type<int>(_738);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _752 = _680;
    float _754 = _670;
    float _756 = _642;
    if (_674)
    {
        _748 = 0;
    }
    int _758 = _748;
    float _760 = -_154;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[76].x, _726);
    float _764 = floor(_732);
    int _766 = _758;
    if (!_674)
    {
        _766 = 2;
    }
    int _768 = _766;
    float _770 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _772 = _718 > 0.0;
    float _774 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _730);
    float _776 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _778 = _768 != 2;
    float _780 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _782 = int(_780);
    bool _784 = _718 >= 0.0;
    bool _786 = isnan(_718);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _796 = _768;
    if (_674)
    {
        _796 = 0;
    }
    int _798 = _796;
    int _800 = _792 ? 0 : 1;
    int _802 = _798;
    if (!_674)
    {
        _802 = 1;
    }
    int _804 = _802;
    float _806 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _808 = int(_806);
    bool _810 = _764 > 0.0;
    bool _812 = _764 >= 0.0;
    bool _814 = isnan(_764);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    int _822 = ~_800;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    float _830 = as_type<float>(_804);
    if (!_772)
    {
        int _832 = ~_800;
        int _834 = _832 + 1;
        _828 = _834;
    }
    int _836 = _828;
    float _838 = 1.0 / _744;
    bool _840 = _804 != 1;
    if (_778)
    {
        _830 = _670;
    }
    float _842 = _830;
    float _844 = _842;
    if (!_778)
    {
        _844 = _684;
    }
    float _846 = _844;
    float _848 = 1.0 / _694;
    bool _850 = _736 > 0.0;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _854 = _736 >= 0.0;
    bool _856 = isnan(_736);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = _846 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _866 = _820 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _868 = _862 ? 0 : 1;
    float _870 = -_852;
    float _872 = fma(_864, 2.0, _870);
    float _874 = _864;
    float _876 = _866;
    float _878 = _846;
    if (!_840)
    {
        _874 = _680;
    }
    float _880 = _874;
    float _882 = _838 * _154;
    int _884 = ~as_type<int>(_866);
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = -_154;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[86].x, _872);
    int _894 = ~_868;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _888;
    int _902 = _898;
    float _904 = _880;
    if (!_810)
    {
        int _906 = ~as_type<int>(_866);
        int _908 = _906 + 1;
        _900 = _908;
    }
    int _910 = _900;
    float _912 = _848 * _154;
    if (!_850)
    {
        int _914 = ~_868;
        int _916 = _914 + 1;
        _902 = _916;
    }
    int _918 = _902;
    if (!_840)
    {
        _876 = _880;
    }
    float _920 = _876;
    float _922 = _920;
    if (_840)
    {
        _922 = _670;
    }
    float _924 = _922;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _938 = _936 != 0;
    float _940 = _924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_840)
    {
        _878 = _684;
    }
    float _942 = _878;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _946 = _942;
    if (_840)
    {
        _946 = _680;
    }
    float _948 = _946;
    float _950 = -_926;
    float _952 = fma(_940, 2.0, _950);
    float _954 = _734 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _956 = !_934;
    int _958 = _956 ? 0 : 1;
    bool _960 = !_930;
    int _962 = _960 ? 0 : 1;
    float _964 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[83].w, _944);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _972 = _970 != 0;
    float _974 = _954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _976 = _954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_840)
    {
        _904 = _670;
    }
    float _978 = _904;
    float _980 = -_954;
    float _982 = _980 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _984 = !_938;
    int _986 = _984 ? 0 : 1;
    float _988 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _974);
    bool _990 = !_972;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _976);
    bool _996 = !_968;
    int _998 = _996 ? 0 : 1;
    float _1000 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[10].z, _988);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1012 = _1010 != 0;
    float _1014 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[83].z, _742);
    float _1016 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[11].z, _994);
    float _1018 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1020 = float(_782);
    float _1022 = in.m_71.x;
    float _1024 = in.m_71.y;
    float _1026 = in.m_71.z;
    bool _1028 = !_1004;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1034 = _988;
    if (!_840)
    {
        _1034 = _684;
    }
    float _1036 = _1034;
    float _1038 = 1.0 / _1020;
    int _1040 = abs(_1030);
    float _1042 = _1018 + _1032;
    float _1044 = _1036;
    float _1046 = as_type<float>(_1040);
    if (_840)
    {
        _1044 = _680;
    }
    float _1048 = _1044;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1052 = _982 * _982;
    if (_778)
    {
        _1046 = _680;
    }
    float _1054 = _1046;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1058 = 1.0 / _1032;
    float _1060 = _1054;
    if (!_778)
    {
        _1060 = _670;
    }
    float _1062 = _1060;
    float _1064 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1014);
    float _1066 = float(_910);
    float _1068 = fma(_1056, -2.0, _1050);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1072 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1074 = float(_1040);
    float _1076 = _1038 * _154;
    float _1078 = fma(_1072, -2.0, _1070);
    float _1080 = _678 * _154;
    float _1082 = _1074 * _1066;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1086 = float(_808);
    float _1088 = _1042 * _1058;
    float _1090 = _1088 * 0.5;
    float _1092 = exp2(_1080);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1096 = _1082 * (-2.0);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1100 = 1.0 + _1098;
    float _1102 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1084);
    float _1104 = fma(_770, _1096, _770);
    float _1106 = fma(_1096, _1022, _1022);
    float _1108 = 1.0 / _1086;
    float _1110 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _1112 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1114 = isnan(1.0);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1120 = _1116 || _1118;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1136 = _954 + _1110;
    float _1138 = 1.0 / _1100;
    float _1140 = -_1092;
    float _1142 = _1140 + 1.0;
    float _1144 = float(_702);
    float _1146 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1122);
    float _1148 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1134);
    float _1150 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1094);
    float _1152 = _1132 ? _1142 : 0.0;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1156 = _1144 * _154;
    float _1158 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1146);
    float _1160 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1148);
    float _1162 = _1108 * _154;
    float _1164 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1102);
    float _1166 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1150);
    float _1168 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _964);
    float _1170 = -_154;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[81].x, _952);
    float _1174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1068);
    float _1176 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1078);
    int _1178 = as_type<int>(_1076);
    float _1180 = _1136;
    if (_1120)
    {
        float _1182 = _1152 * _1138;
        _156 = _1182;
    }
    float _1184 = _156;
    float _1186 = fma(_692, _692, _1052);
    float _1188 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1154);
    bool _1190 = !_1008;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _670 + (-0.5);
    float _1196 = fma(_698, _698, _1186);
    float _1198 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1188);
    bool _1200 = !_1012;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1106);
    float _1206 = float(_836);
    float _1208 = rsqrt(_1196);
    int _1210 = abs(_1192);
    float _1212 = fma(_1104, _1184, _1204);
    int _1214 = abs(_1202);
    float _1216 = _670 + _684;
    float _1218 = float(_1210);
    float _1220 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1222 = _1216 + (-1.0);
    float _1224 = float(_918);
    float _1226 = _1218 * _1206;
    float _1228 = float(_1214);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1232 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1230);
    float _1234 = _1226 * (-2.0);
    float _1236 = _680 + (-0.5);
    float _1238 = _1228 * _1224;
    float _1240 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1220);
    float _1242 = 1.0 / _1232;
    float _1244 = in.m_73.x;
    float _1246 = in.m_73.y;
    float _1248 = in.m_73.z;
    float _1250 = _1238 * (-2.0);
    float _1252 = fma(_1234, _1024, _1024);
    float _1254 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1256 = _684 + (-0.5);
    float _1258 = _692 * _1208;
    float _1260 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1252);
    float _1262 = fma(_1250, _1026, _1026);
    float _1264 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1240);
    float _1266 = fma(_794, _1234, _794);
    float _1268 = fma(_1254, _1250, _1254);
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1262);
    float _1272 = _698 * _1208;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1276 = _1258 * _1274;
    float _1278 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1280 = _1264 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1282 = fma(_1266, _1184, _1260);
    float _1284 = fma(_1268, _1184, _1270);
    float _1286 = _982 * _1208;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1272 * _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1294 = -_1276;
    float _1296 = fma(_1272, _1292, _1294);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1300 = _1242 * _1298;
    float _1302 = trunc(_1278);
    int _1304 = int(_1302);
    float _1306 = _1212 * 0.15915493667125701904296875;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1310 = _1286 * _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1314 = -_1290;
    float _1316 = fma(_1286, _1312, _1314);
    float _1318 = _1296 * _1296;
    float _1320 = _1282 * 0.15915493667125701904296875;
    bool _1322 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1324 = trunc(_1280);
    int _1326 = int(_1324);
    bool _1328 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1332 = -_1310;
    float _1334 = fma(_1258, _1330, _1332);
    float _1336 = fma(_1316, _1316, _1318);
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1246);
    float _1340 = _1284 * 0.15915493667125701904296875;
    float _1342 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1344 = fma(_1334, _1334, _1336);
    float _1346 = _1306 * 6.283185482025146484375;
    float _1348 = sin(_1346);
    float _1350 = _1338 * _1342;
    bool _1352 = !_1322;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1244);
    int _1358 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1360 = _1304 + _1358;
    int _1362 = _1360 + 1;
    float _1364 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1366 = 2;
    int _1368 = _1362;
    if (!_1322)
    {
        _1366 = 1;
    }
    int _1370 = _1366;
    float _1372 = _1306 * 6.283185482025146484375;
    float _1374 = cos(_1372);
    int _1376 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1378 = _1326 + _1376;
    int _1380 = _1378 + 1;
    float _1382 = _1356 * _776;
    int _1384 = _1370;
    int _1386 = _1380;
    if (!_1328)
    {
        _1384 = _1354;
    }
    int _1388 = _1384;
    float _1390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1248);
    int _1392 = _1362 | _1380;
    bool _1394 = _1362 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1396 = _1320 * 6.283185482025146484375;
    float _1398 = sin(_1396);
    int _1400 = _1388 << 6;
    float _1402 = _1390 * _1364;
    bool _1404 = _1392 < 0;
    bool _1406 = _1404 || _1394;
    int _1408 = _1400 + 96;
    uint _1411 = uint(int(uint(_1408) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
    int _1419 = int(_1411) + 1;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    int _1423 = _1419 & 3;
    float _1425 = (*spvDescriptorSet0.vp_c15)._m0[int(_1421)][_1423];
    bool _1427 = _1380 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1429 = _1427 || _1406;
    float _1431 = _1320 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    int _1435 = _1400 + 48;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    int _1445 = int(_1437) + 1;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    int _1449 = _1445 & 3;
    float _1451 = (*spvDescriptorSet0.vp_c15)._m0[int(_1447)][_1449];
    float _1453 = _1340 * 6.283185482025146484375;
    float _1455 = cos(_1453);
    float _1457 = _1348 * _1398;
    float _1459 = _1374 * _1398;
    if (!_1429)
    {
        int _1461 = _1380 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1463 = _1461 + _1362;
        _1368 = _1463;
    }
    int _1465 = _1368;
    float _1467 = rsqrt(_1344);
    float _1469 = _1374 * _1433;
    float _1471 = _1348 * _1433;
    float _1473 = as_type<float>(_1465);
    if (!_1429)
    {
        int _1475 = _1465 << 2;
        _1386 = _1475;
    }
    int _1477 = _1386;
    int _1479 = 0;
    int _1481 = _1477;
    if (!_1429)
    {
        uint _1483 = uint(int(uint(_1465) >> uint(2)));
        _1479 = int(_1483);
    }
    int _1485 = _1479;
    int _1487 = _1485;
    if (!_1429)
    {
        int _1489 = 12 & _1477;
        _1481 = _1489;
    }
    int _1491 = _1481;
    float _1493 = _1340 * 6.283185482025146484375;
    float _1495 = sin(_1493);
    float _1497 = _1374 * _1455;
    float _1499 = _1348 * _1455;
    int _1501 = _1400 + 104;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c15)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
    float _1519 = _1433 * _1455;
    float _1521 = _1497 * _1350;
    float _1523 = _1398 * _1455;
    if (!_1429)
    {
        int _1525 = _1485 << 4;
        int _1527 = _1525 + _1491;
        _1487 = _1527;
    }
    int _1529 = _1487;
    float _1531 = _1316 * _1467;
    float _1533 = _1296 * _1467;
    float _1535 = _1334 * _1467;
    float _1537 = _1286 * _1531;
    float _1539 = _1272 * _1533;
    int _1541 = _1400 + 72;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.vp_c15)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
    float _1559 = fma(_1495, _1469, _1457);
    float _1561 = -_1459;
    float _1563 = fma(_1495, _1471, _1561);
    float _1565 = -_1471;
    float _1567 = fma(_1495, _1459, _1565);
    float _1569 = fma(_1495, _1457, _1469);
    float _1571 = -_1350;
    float _1573 = _1495 * _1571;
    float _1575 = fma(_1559, _1382, _1521);
    int _1577 = _1400 + 64;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    float _1595 = _1499 * _1350;
    float _1597 = fma(_1519, _1382, _1573);
    float _1599 = -_1537;
    float _1601 = fma(_1258, _1533, _1599);
    float _1603 = fma(_1567, _1402, _1575);
    float _1605 = fma(_1563, _1382, _1595);
    float _1607 = -_1539;
    float _1609 = fma(_1286, _1535, _1607);
    float _1611 = fma(_1523, _1402, _1597);
    float _1613 = _1601 * _1603;
    float _1615 = fma(_1569, _1402, _1605);
    float _1617 = _1609 * _1603;
    int _1619 = _1400 + 56;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    float _1637 = fma(_1535, _1611, _1613);
    float _1639 = _1136 * _1425;
    float _1641 = fma(_1531, _1611, _1617);
    float _1643 = _1136 * _1451;
    float _1645 = fma(_1272, _1615, _1637);
    float _1647 = fma(_640, _1417, _1639);
    float _1649 = fma(_1258, _1615, _1641);
    float _1651 = _1451;
    float _1653 = _1417;
    if (!_1429)
    {
        float _1655 = floor(_1278);
        _1651 = _1655;
    }
    float _1657 = _1651;
    float _1659 = _642 + _1645;
    float _1661 = fma(_640, _1443, _1643);
    int _1663 = _1400 + 80;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    float _1681 = _640 + _1649;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1685 = _1659 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1689 = _1681 + _1687;
    float _1691 = _1685 * _1685;
    float _1693 = fma(_642, _1509, _1647);
    float _1695 = fma(_1689, _1689, _1691);
    float _1697 = _1258 * _1535;
    float _1699 = _1693 + _1517;
    float _1701 = sqrt(_1695);
    float _1703 = -_1697;
    float _1705 = fma(_1272, _1531, _1703);
    float _1707 = _1705 * _1603;
    float _1709 = 1.0 / _1699;
    float _1711 = fma(_1533, _1611, _1707);
    float _1713 = _1136 * _1593;
    bool _1715 = _1701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = fma(_640, _1585, _1713);
    float _1719 = fma(_1286, _1615, _1711);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1727 = _1725 != 0;
    float _1729 = fma(_642, _1549, _1717);
    float _1731 = fma(_642, _1627, _1661);
    float _1733 = _1729 + _1557;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1741 = _1739 != 0;
    float _1743 = _954 + _1719;
    bool _1745 = !_1727;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = _1731 + _1635;
    bool _1751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    bool _1761 = !_1723;
    int _1763 = _1761 ? 0 : 1;
    bool _1765 = !_1737;
    int _1767 = _1765 ? 0 : 1;
    bool _1769 = !_1741;
    int _1771 = _1769 ? 0 : 1;
    float _1773 = _1719;
    float _1775 = _1717;
    float _1777 = _1689;
    float _1779 = _1661;
    if (!_1715)
    {
        _1773 = _1681;
    }
    float _1781 = _1773;
    float _1783 = _1781;
    if (!_1715)
    {
        _1653 = _1659;
    }
    float _1785 = _1653;
    float _1787 = _1785;
    if (!_1715)
    {
        _1775 = _1743;
    }
    float _1789 = _1775;
    bool _1791 = !_1715;
    float _1793 = _1789;
    float _1795 = _1679;
    if (!_1791)
    {
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1801 = _1701 + _1799;
        float _1803 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1805 = rsqrt(_1695);
        float _1807 = _1801 * _1797;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = _1813 + (-1.0);
        float _1821 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1823 = fma(_1817, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1825 = fma(_1743, _1813, _1821);
        float _1827 = _1805 * _1823;
        float _1829 = fma(_1689, _1827, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1831 = fma(_1685, _1827, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1787 = _1831;
        _1783 = _1829;
        _1793 = _1825;
    }
    float _1833 = _1787;
    float _1835 = _1783;
    float _1837 = _1793;
    float _1839 = _1749 * _1709;
    float _1841 = _1837;
    float _1843 = _1835;
    if (_1759)
    {
        _1777 = _1833;
    }
    float _1845 = _1777;
    float _1847 = _1845;
    if (!_1759)
    {
        float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1851 = _954 + _1849;
        float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1855 = _640 + _1853;
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1859 = -_640;
        float _1861 = _1859 + _1835;
        float _1863 = _1851 * _1851;
        float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1867 = _642 + _1865;
        float _1869 = -_642;
        float _1871 = _1869 + _1833;
        float _1873 = fma(_1855, _1855, _1863);
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1877 = fma(_1867, _1867, _1873);
        float _1879 = sqrt(_1877);
        float _1881 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1883 = precise::min(_1879, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1885 = _1883 * _1875;
        float _1887 = -_954;
        float _1889 = _1887 + _1837;
        float _1891 = _1881 * _1885;
        float _1893 = fma(_1889, _1891, _954);
        float _1895 = fma(_1861, _1891, _640);
        float _1897 = fma(_1871, _1891, _642);
        _1841 = _1893;
        _1843 = _1895;
        _1847 = _1897;
    }
    float _1899 = _1841;
    float _1901 = _1843;
    float _1903 = _1847;
    int _1905 = _1400 + 88;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    uint _1909 = uint(int(uint(int(_1907)) >> uint(2)));
    int _1911 = int(_1907) & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    int _1915 = int(_1907) + 1;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    int _1919 = _1915 & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    float _1923 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1925 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1927 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1929 = _1839 >= 0.0;
    float _1931 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1923);
    float _1933 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1925);
    float _1935 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    float _1937 = _1695;
    if (!_1429)
    {
        int _1939 = _1529 + 400;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
        int _1945 = int(_1941) & 3;
        float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
        _1937 = _1947;
    }
    float _1949 = _1937;
    float _1951 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1953 = _1733 * _1709;
    bool _1955 = _1839 <= 1.0;
    bool _1957 = _1955 && _1929;
    float _1959 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1933);
    float _1961 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    float _1963 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1965 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1967 = _1953 >= 0.0;
    bool _1969 = _1967 && _1957;
    float _1971 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1973 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1975 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1963);
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1979 = _1953 <= 1.0;
    bool _1981 = _1979 && _1969;
    float _1983 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1985 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1987 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1975);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1977);
    float _1991 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1993 = -_1985;
    float _1995 = fma(_1993, _1983, 1.0);
    float _1997 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1999 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _2001 = _1136 * _1679;
    float _2003 = _1989;
    if (!_1429)
    {
        float _2005 = floor(_1280);
        _1779 = _2005;
    }
    float _2007 = _1779;
    float _2009 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1991);
    float _2011 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1999);
    float _2013 = _2011;
    if (_1981)
    {
        float _2015 = float(_1388);
        _2003 = _2015;
    }
    float _2017 = _2003;
    float _2019 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2021 = fma(_640, _1671, _2001);
    if (!_1429)
    {
        float _2023 = -_1657;
        float _2025 = _1278 + _2023;
        _1795 = _2025;
    }
    float _2027 = _1795;
    float _2029 = log2(_1995);
    float _2031 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2019);
    float _2033 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2009);
    float _2035 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2031);
    float _2037 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2033);
    float _2039 = 1.0 / _2011;
    float _2041 = fma(_642, _1913, _2021);
    float _2043 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2035);
    float _2045 = _2041 + _1921;
    float _2047 = _2017;
    if (_1981)
    {
        float _2049 = rint(_2017);
        float _2051 = precise::max(_2049, 0.0);
        uint _2053 = uint(_2051);
        uint _2055 = clamp(_2053, 0u, 65535u);
        _2047 = as_type<float>(_2055);
    }
    float _2057 = _2047;
    float _2059 = _2029 * 0.693147182464599609375;
    float _2061 = _2045 * _1709;
    float _2063 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2065 = _2059;
    if (!_1429)
    {
        float _2067 = -_2007;
        float _2069 = _1280 + _2067;
        _2065 = _2069;
    }
    float _2071 = _2065;
    float _2073 = _2021;
    if (!_1429)
    {
        float _2075 = rint(_1949);
        float _2077 = precise::max(_2075, 0.0);
        uint _2079 = uint(_2077);
        uint _2081 = clamp(_2079, 0u, 65535u);
        _2073 = as_type<float>(_2081);
    }
    float _2083 = _2073;
    float _2085 = _2037 * _2039;
    float _2087 = _2043 * _2039;
    float _2089 = fma(_2085, 0.5, 0.5);
    float _2091 = fma(_2087, -0.5, 0.5);
    float _2093 = _2085;
    if (_1981)
    {
        float3 _8715 = float3(_1839, _1953, float(as_type<int>(_2057)));
        float3 _8719 = select(_8715, float3(0.0), isnan(_8715));
        float _2095 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8719.xy, uint(rint(_8719.z)), _2061, level(0.0));
        _2093 = _2095;
    }
    float _2097 = _2093;
    float3 _8729 = float3(_2089, _2091, _2063);
    float _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8729, float3(0.0), isnan(_8729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8729, float3(0.0), isnan(_8729)), level(0.0)).x;
    float3 _8738 = float3(_2089, _2091, _2063);
    float4 _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8738, float3(0.0), isnan(_8738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8738, float3(0.0), isnan(_8738)), level(0.0)).xyzw;
    float _2104 = _2102.x;
    float _2106 = _2102.y;
    float _2108 = _2102.z;
    float _2110 = _2102.w;
    float _2112 = _2071;
    if (!_1429)
    {
        float3 _8761 = float3(_2027, _2071, float(as_type<int>(_2083)));
        float3 _8763 = select(_8761, float3(0.0), isnan(_8761));
        float _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8763.xy, uint(rint(_8763.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8763.xy, uint(rint(_8763.z)), level(0.0)).x;
        _2112 = _2114;
    }
    float _2116 = _2112;
    float _2118 = float(uint(_702));
    float _2120 = trunc(_1076);
    int _2122 = int(_2120);
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2126 = _2124 != 0;
    float _2128 = _1156 * _848;
    int _2130 = abs(_986);
    int _2132 = abs(_1767);
    float _2134 = 1.0 / _2118;
    float _2136 = float(uint(_2122));
    float _2138 = trunc(_2128);
    int _2140 = int(_2138);
    int _2142 = as_type<int>(_2134) + (-2);
    float _2144 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2146 = int(_2144);
    float _2148 = as_type<float>(_2142) * _2136;
    float _2150 = trunc(_2148);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    int _2156 = ~_702;
    int _2158 = _2156 + 1;
    int _2160 = abs(_962);
    int _2162 = _2158 * int(_2154);
    int _2164 = _2162 + _2122;
    float _2166 = float(uint(_2164));
    int _2168 = ~_702;
    int _2170 = _2168 + 1;
    float _2172 = float(_2122);
    float _2174 = as_type<float>(_2142) * _2166;
    float _2176 = _2166;
    if (_2126)
    {
        _2176 = 1.0;
    }
    float _2178 = _2176;
    float _2180 = _2178;
    if (!_2126)
    {
        _2180 = 7.345489978790283203125;
    }
    float _2182 = _2180;
    bool _2184 = _2172 >= _1144;
    bool _2186 = isnan(_2172);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(_1144);
    bool _2192 = _2188 || _2190;
    float _2194 = float(_2192);
    float _2196 = trunc(_2174);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    int _2202 = ~_2146;
    int _2204 = _2202 + 1;
    float _2206 = _2182 * _670;
    float _2208 = floor(_2206);
    int _2210 = int(_2154) + int(_2200);
    float _2212 = trunc(_2194);
    int _2214 = int(_2212);
    int _2216 = _2170 * _2210;
    int _2218 = _2216 + _2122;
    float _2220 = -_2208;
    float _2222 = _2206 + _2220;
    int _2224 = _702 + (-1);
    bool _2226 = uint(_2218) >= uint(_702);
    float _2228 = _2222 * _1144;
    bool _2230 = !_2226;
    int _2232 = _2230 ? 0 : (-1);
    bool _2234 = _702 == 0;
    int _2236 = ~_2210;
    int _2238 = _2236 + _2232;
    int _2240 = _2238 + 1;
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2244 = _2242 != 0;
    float _2246 = in.m_63.w;
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2250 = _2248 != 0;
    int _2252 = _702 * _2240;
    int _2254 = _2252 + _2122;
    int _2256 = ~_2214;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2264 = _2262 != 0;
    bool _2266 = !_2234;
    int _2268 = _2266 ? _2254 : (-1);
    float _2270 = trunc(_2228);
    int _2272 = int(_2270);
    int _2274 = _2268 * _2260;
    bool _2276 = !_2244;
    int _2278 = _2276 ? 0 : 1;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2282 = _2280 != 0;
    int _2284 = _2214 * _2224;
    int _2286 = _2284 + _2274;
    int _2288 = abs(_2278);
    int _2290 = abs(_958);
    float _2292 = trunc(_882);
    int _2294 = int(_2292);
    bool _2296 = !_2282;
    int _2298 = _2296 ? 0 : 1;
    int _2300 = _2286 * _2290;
    int _2302 = _2272 * _2288;
    int _2304 = _2302 + _2122;
    int _2306 = abs(_2298);
    float _2308 = in.m_75.x;
    int _2310 = _2140 * _2160;
    int _2312 = _2310 + _2300;
    float _2314 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2316 = int(_2314);
    bool _2318 = _2282;
    if (_2250)
    {
        bool _2320 = _670 > 0.5;
        _2318 = _2320;
    }
    bool _2322 = _2318;
    int _2324 = _2304 * _2130;
    int _2326 = _2324 + _2312;
    int _2328 = _2272 * _2306;
    int _2330 = _2328 + _2326;
    float _2332 = float(uint(_2146));
    float _2334 = trunc(_1162);
    int _2336 = int(_2334);
    float _2338 = float(uint(_2294));
    float _2340 = float(uint(_2330));
    float _2342 = float(uint(_2316));
    float _2344 = 1.0 / _2332;
    float _2346 = as_type<float>(_2142) * _2340;
    int _2348 = ~_2146;
    int _2350 = _2348 + 1;
    float _2352 = as_type<float>(_2350);
    if (!_2250)
    {
        _750 = _2308;
    }
    float _2354 = _750;
    float _2356 = _2354;
    if (_2264)
    {
        float _2358 = -_2308;
        float _2360 = _2358 + 1.0;
        _1178 = as_type<int>(_2360);
    }
    int _2362 = _1178;
    float _2364 = trunc(_2346);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = float(uint(_2336));
    int _2372 = ~_702;
    int _2374 = _2372 + 1;
    int _2376 = as_type<int>(_2344) + (-2);
    float _2378 = 1.0 / _2342;
    float _2380 = as_type<float>(_2376) * _2370;
    int _2382 = _2374 * int(_2368);
    int _2384 = _2382 + _2330;
    float _2386 = trunc(_2380);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    int _2392 = _2374;
    int _2394 = int(_2368);
    if (_2250)
    {
        float _2396 = -_2308;
        float _2398 = _2396 + 1.0;
        _2392 = as_type<int>(_2398);
    }
    int _2400 = _2392;
    float _2402 = float(uint(_2384));
    float _2404 = _2402;
    if (_2250)
    {
        float _2406 = _2322 ? as_type<float>(_2400) : _2308;
        _2356 = _2406;
    }
    float _2408 = _2356;
    int _2410 = as_type<int>(_2378) + (-2);
    float _2412 = as_type<float>(_2142) * _2402;
    bool _2414 = _684 > 0.5;
    float _2416 = as_type<float>(_2410) * _2338;
    float _2418 = trunc(_2412);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2426 = _2424 != 0;
    int _2428 = _2350 * int(_2390);
    int _2430 = _2428 + _2336;
    float _2432 = as_type<float>(_2350);
    if (_2126)
    {
        _2404 = _670;
    }
    float _2434 = _2404;
    float _2436 = _2434;
    if (_2126)
    {
        _2432 = 1.0;
    }
    float _2438 = _2432;
    float _2440 = float(uint(_2430));
    float _2442 = trunc(_2416);
    float _2444 = precise::max(_2442, 0.0);
    uint _2446 = uint(_2444);
    float _2448 = _2438;
    if (!_2264)
    {
        _2352 = _2308;
    }
    float _2450 = _2352;
    float _2452 = _2450;
    if (!_2126)
    {
        _2436 = _680;
    }
    float _2454 = _2436;
    float _2456 = as_type<float>(_2376) * _2440;
    if (!_2126)
    {
        _2448 = 1.2345600128173828125;
    }
    float _2458 = _2448;
    if (_2264)
    {
        float _2460 = _2414 ? as_type<float>(_2362) : _2308;
        _2452 = _2460;
    }
    float _2462 = _2452;
    int _2464 = ~_2316;
    int _2466 = _2464 + 1;
    float _2468 = _2454 * _2458;
    int _2470 = int(_2368) + int(_2422);
    if (_2426)
    {
        float _2472 = -_2308;
        float _2474 = _2472 + 1.0;
        _2394 = as_type<int>(_2474);
    }
    int _2476 = _2394;
    float _2478 = floor(_2468);
    bool _2480 = _680 > 0.5;
    float _2482 = as_type<float>(_2476);
    if (!_2426)
    {
        _752 = _2308;
    }
    float _2484 = _752;
    int _2486 = _2466 * int(_2446);
    int _2488 = _2486 + _2294;
    int _2490 = ~_702;
    int _2492 = _2490 + 1;
    float _2494 = _2484;
    if (_2426)
    {
        float _2496 = _2480 ? as_type<float>(_2476) : _2308;
        _2494 = _2496;
    }
    float _2498 = _2494;
    float _2500 = trunc(_2456);
    float _2502 = precise::max(_2500, 0.0);
    uint _2504 = uint(_2502);
    float _2506 = float(uint(_2488));
    int _2508 = _2492 * _2470;
    int _2510 = _2508 + _2330;
    if (_2126)
    {
        _2482 = 1.0;
    }
    float _2512 = _2482;
    float _2514 = _2512;
    if (!_2126)
    {
        _754 = _684;
    }
    float _2516 = _754;
    float _2518 = as_type<float>(_2410) * _2506;
    float _2520 = float(_2146);
    float _2522 = in.m_75.y;
    bool _2524 = uint(_2510) >= uint(_702);
    float _2526 = trunc(_2518);
    float _2528 = precise::max(_2526, 0.0);
    uint _2530 = uint(_2528);
    if (!_2126)
    {
        _2514 = 5.839270114898681640625;
    }
    float _2532 = _2514;
    bool _2534 = !_2524;
    int _2536 = _2534 ? 0 : (-1);
    int _2538 = int(_2390) + int(_2504);
    float _2540 = _2516 * _2532;
    float _2542 = float(_2336);
    float _2544 = -_2478;
    float _2546 = _2468 + _2544;
    bool _2548 = _2246 > 0.5;
    int _2550 = _2204 * _2538;
    int _2552 = _2550 + _2336;
    bool _2554 = _2542 >= _2520;
    bool _2556 = isnan(_2542);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(_2520);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = _2520 * _2546;
    int _2568 = ~_2316;
    int _2570 = _2568 + 1;
    float _2572 = floor(_2540);
    bool _2574 = uint(_2552) >= uint(_2146);
    int _2576 = int(_2446) + int(_2530);
    float _2578 = _2520 * _912;
    bool _2580 = !_2574;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = -_2522;
    float _2586 = _2584 + 1.0;
    float _2588 = trunc(_2564);
    int _2590 = int(_2588);
    int _2592 = ~_2538;
    int _2594 = _2592 + _2582;
    int _2596 = _2594 + 1;
    int _2598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2600 = _2598 != 0;
    int _2602 = _2146 * _2596;
    int _2604 = _2602 + _2336;
    int _2606 = _2480 ? as_type<int>(_2586) : as_type<int>(_2522);
    int _2608 = _2570 * _2576;
    int _2610 = _2608 + _2294;
    bool _2612 = _2146 == 0;
    float _2614 = trunc(_2578);
    int _2616 = int(_2614);
    float _2618 = _2600 ? as_type<float>(_2606) : _2522;
    float _2620 = -_2572;
    float _2622 = _2540 + _2620;
    int _2624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2626 = _2624 != 0;
    bool _2628 = !_2612;
    int _2630 = _2628 ? _2604 : (-1);
    int _2632 = ~_2590;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    int _2638 = _2548 ? as_type<int>(_2586) : as_type<int>(_2522);
    bool _2640 = !_2626;
    int _2642 = _2640 ? 0 : 1;
    bool _2644 = uint(_2610) >= uint(_2316);
    int _2646 = _2636 * _2630;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2650 = _2648 != 0;
    float _2652 = trunc(_2566);
    int _2654 = int(_2652);
    int _2656 = _2146 + (-1);
    bool _2658 = !_2644;
    int _2660 = _2658 ? 0 : (-1);
    bool _2662 = !_2650;
    int _2664 = _2662 ? 0 : 1;
    int _2666 = _2590 * _2656;
    int _2668 = _2666 + _2646;
    int _2670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2672 = _2670 != 0;
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2676 = _2674 != 0;
    float _2678 = float(_2316);
    float _2680 = float(_2294);
    int _2682 = abs(_1747);
    int _2684 = abs(_2642);
    int _2686 = abs(_1763);
    int _2688 = _2668 * _2682;
    bool _2690 = _2680 >= _2678;
    bool _2692 = isnan(_2680);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan(_2678);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    int _2702 = _2654 * _2684;
    int _2704 = _2702 + _2336;
    float _2706 = _2678 * _2622;
    int _2708 = abs(_1771);
    float _2710 = _2678 * _912;
    float _2712 = trunc(_2700);
    int _2714 = int(_2712);
    int _2716 = _2616 * _2686;
    int _2718 = _2716 + _2688;
    int _2720 = ~_2576;
    int _2722 = _2720 + _2660;
    int _2724 = _2722 + 1;
    int _2726 = _2704 * _2132;
    int _2728 = _2726 + _2718;
    bool _2730 = !_2672;
    int _2732 = _2730 ? 0 : 1;
    int _2734 = _2316 * _2724;
    int _2736 = _2734 + _2294;
    bool _2738 = _2316 == 0;
    int _2740 = _2654 * _2708;
    int _2742 = _2740 + _2728;
    float _2744 = trunc(_2706);
    int _2746 = int(_2744);
    int _2748 = abs(_2664);
    bool _2750 = !_2738;
    int _2752 = _2750 ? _2736 : (-1);
    float _2754 = float(uint(_2742));
    int _2756 = ~_2714;
    int _2758 = _2756 + 1;
    int _2760 = _2758 + 1;
    float _2762 = trunc(_2710);
    int _2764 = int(_2762);
    int _2766 = _2316 + (-1);
    int _2768 = ~_2470;
    int _2770 = _2768 + _2536;
    int _2772 = _2770 + 1;
    int _2774 = _2760 * _2752;
    int _2776 = abs(_992);
    float _2778 = as_type<float>(_2376) * _2754;
    int _2780 = _2714 * _2766;
    int _2782 = _2780 + _2774;
    int _2784 = abs(_998);
    int _2786 = _2746 * _2748;
    int _2788 = _2786 + _2294;
    int _2790 = _702 * _2772;
    int _2792 = _2790 + _2330;
    float _2794 = trunc(_2778);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = abs(_2732);
    int _2802 = _2782 * _2776;
    float _2804 = float(uint(_2304));
    bool _2806 = !_2676;
    int _2808 = _2806 ? 0 : 1;
    int _2810 = _2764 * _2784;
    int _2812 = _2810 + _2802;
    int _2814 = ~_2146;
    int _2816 = _2814 + 1;
    float _2818 = as_type<float>(_2142) * _2804;
    int _2820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2822 = _2820 != 0;
    int _2824 = _2788 * _2800;
    int _2826 = _2824 + _2812;
    int _2828 = abs(_2808);
    float _2830 = _2822 ? as_type<float>(_2638) : _2522;
    float _2832 = trunc(_2818);
    float _2834 = precise::max(_2832, 0.0);
    uint _2836 = uint(_2834);
    int _2838 = _2816 * int(_2798);
    int _2840 = _2838 + _2742;
    int _2842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2844 = _2842 != 0;
    float _2846 = float(uint(_2840));
    int _2848 = _2746 * _2828;
    int _2850 = _2848 + _2826;
    int _2852 = ~_702;
    int _2854 = _2852 + 1;
    bool _2856 = !_2234;
    int _2858 = _2856 ? _2792 : (-1);
    float _2860 = as_type<float>(_2376) * _2846;
    float _2862 = float(uint(_2850));
    float _2864 = trunc(_2860);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    int _2870 = ~_2316;
    int _2872 = _2870 + 1;
    int _2874 = _2854 * int(_2836);
    int _2876 = _2874 + _2304;
    float _2878 = _2522;
    float _2880 = as_type<float>(_2682);
    if (_2844)
    {
        float _2882 = _2414 ? _2586 : _2522;
        _2878 = _2882;
    }
    float _2884 = _2878;
    float _2886 = as_type<float>(_2410) * _2862;
    int _2888 = _2858 & 3;
    bool _2890 = _2888 != 0;
    int _2892 = _2858 & 3;
    bool _2894 = _2892 != 0;
    float _2896 = trunc(_2886);
    float _2898 = precise::max(_2896, 0.0);
    uint _2900 = uint(_2898);
    float _2902 = float(uint(_2876));
    int _2904 = _2890 ? 0 : 1;
    bool _2906 = uint(_2892) > 1u;
    float _2908 = as_type<float>(_2142) * _2902;
    float _2910 = float(uint(_2704));
    int _2912 = ~_2904;
    int _2914 = _2912 + 1;
    int _2916 = _2914 + 1;
    int _2918 = int(_2798) + int(_2868);
    float _2920 = trunc(_2908);
    float _2922 = precise::max(_2920, 0.0);
    uint _2924 = uint(_2922);
    float _2926 = as_type<float>(_2376) * _2910;
    int _2928 = ~_2146;
    int _2930 = _2928 + 1;
    int _2932 = _2872 * int(_2900);
    int _2934 = _2932 + _2850;
    int _2936 = ~_2146;
    int _2938 = _2936 + 1;
    int _2940 = _2916;
    float _2942 = as_type<float>(_2918);
    if (!_2906)
    {
        int _2944 = ~_2904;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = trunc(_2926);
    float _2952 = precise::max(_2950, 0.0);
    uint _2954 = uint(_2952);
    bool _2956 = uint(_2892) >= 2u;
    float _2958 = float(uint(_2934));
    int _2960 = _2956 ? 0 : 1;
    bool _2962 = _2892 != 3;
    float _2964 = as_type<float>(_2410) * _2958;
    int _2966 = int(_2836) + int(_2924);
    int _2968 = _2938 * _2918;
    int _2970 = _2968 + _2742;
    float _2972 = trunc(_2964);
    float _2974 = precise::max(_2972, 0.0);
    uint _2976 = uint(_2974);
    int _2978 = ~_2960;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    int _2984 = ~_702;
    int _2986 = _2984 + 1;
    int _2988 = _2930 * int(_2954);
    int _2990 = _2988 + _2704;
    int _2992 = _2982;
    if (_2962)
    {
        int _2994 = ~_2960;
        int _2996 = _2994 + 1;
        _2992 = _2996;
    }
    int _2998 = _2992;
    bool _3000 = uint(_2970) >= uint(_2146);
    int _3002 = _2986 * _2966;
    int _3004 = _3002 + _2304;
    float _3006 = float(uint(_2990));
    bool _3008 = !_3000;
    int _3010 = _3008 ? 0 : (-1);
    bool _3012 = uint(_3004) >= uint(_702);
    float _3014 = as_type<float>(_2376) * _3006;
    int _3016 = ~_2918;
    int _3018 = _3016 + _3010;
    int _3020 = _3018 + 1;
    int _3022 = int(_2900) + int(_2976);
    if (_1429)
    {
        _2942 = 1.0;
    }
    float _3024 = _2942;
    int _3026 = _2146 * _3020;
    int _3028 = _3026 + _2742;
    float _3030 = _3024;
    if (!_1429)
    {
        int _3032 = _1465 << 4;
        int _3034 = _3032 + 2048;
        uint _3036 = uint(int(uint(_3034) >> uint(2)));
        uint _3038 = uint(int(uint(int(_3036)) >> uint(2)));
        int _3040 = int(_3036) & 3;
        float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
        int _3044 = int(_3036) + 1;
        uint _3046 = uint(int(uint(_3044) >> uint(2)));
        int _3048 = _3044 & 3;
        float _3050 = (*spvDescriptorSet0.vp_c15)._m0[int(_3046)][_3048];
        int _3052 = _3034 + 8;
        uint _3054 = uint(int(uint(_3052) >> uint(2)));
        uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
        int _3058 = int(_3054) & 3;
        float _3060 = (*spvDescriptorSet0.vp_c15)._m0[int(_3056)][_3058];
        int _3062 = int(_3054) + 1;
        uint _3064 = uint(int(uint(_3062) >> uint(2)));
        int _3066 = _3062 & 3;
        float _3068 = (*spvDescriptorSet0.vp_c15)._m0[int(_3064)][_3066];
        float _3070 = _1136 * _3050;
        float _3072 = fma(_640, _3042, _3070);
        float _3074 = fma(_642, _3060, _3072);
        float _3076 = _3074 + _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = -_3078;
        float _3082 = _3080 + _2116;
        float _3084 = fma(_3082, 500.0, 1.5);
        float _3086 = exp2(_3084);
        float _3088 = 0.0 + _3086;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        _1180 = _3070;
        _1473 = as_type<float>(_3034);
        _3030 = _3090;
    }
    float _3092 = _1180;
    float _3094 = _1473;
    float _3096 = _3030;
    float _3098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3100 = _1899 + _3098;
    float _3102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3104 = _1901 + _3102;
    float _3106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3108 = _1903 + _3106;
    bool _3110 = !_2612;
    int _3112 = _3110 ? _3028 : (-1);
    float _3114 = _3100 * _3100;
    bool _3116 = !_3012;
    int _3118 = _3116 ? 0 : (-1);
    float _3120 = fma(_3104, _3104, _3114);
    float _3122 = fma(_3108, _3108, _3120);
    float _3124 = rsqrt(_3122);
    float _3126 = sqrt(_3122);
    float _3128 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3130 = _3104 * _3128;
    float _3132 = _3108 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 * _3132;
    float _3138 = _3134 + _3136;
    float _3140 = sqrt(_3138);
    bool _3142 = _3140 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3146 = _3140 + _3144;
    float _3148 = _3124;
    float _3150 = _3092;
    float _3152 = _3146;
    float _3154 = _3100;
    float _3156 = _3094;
    if (_3142)
    {
        float _3158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3158;
    }
    float _3160 = _3148;
    if (_3142)
    {
        float _3162 = rsqrt(_3138);
        _3150 = _3162;
    }
    float _3164 = _3150;
    float _3166 = _3164;
    if (_3142)
    {
        float _3168 = _3146 * _3160;
        _3152 = _3168;
    }
    float _3170 = _3152;
    bool _3172 = !_2894;
    int _3174 = _3172 ? 0 : 1;
    if (_3142)
    {
        float _3176 = _3170 * 0.15915493667125701904296875;
        _756 = _3176;
    }
    float _3178 = _756;
    float _3180 = _3108;
    if (_3142)
    {
        float _3182 = _3178 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        _3180 = _3184;
    }
    float _3186 = _3180;
    float _3188 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3190 = precise::max(0.0, _3188);
    float _3192 = _3160;
    float _3194 = _3190;
    if (_3142)
    {
        float _3196 = _3178 * 6.283185482025146484375;
        float _3198 = cos(_3196);
        _3192 = _3198;
    }
    float _3200 = _3192;
    float _3202 = -_3128;
    float _3204 = -_3190;
    float _3206 = fma(_3100, _3202, _3204);
    if (_3142)
    {
        float _3208 = _3206 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3154 = _3208;
    }
    float _3210 = _3154;
    float _3212 = _3210;
    float _3214 = _3186;
    if (_3142)
    {
        float _3216 = fma(_3186, _3210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3212 = _3216;
    }
    float _3218 = _3212;
    float _3220 = _3218;
    if (!_3142)
    {
        _3214 = _3130;
    }
    float _3222 = _3214;
    float _3224 = _3222;
    float _3226 = _3200;
    if (_3142)
    {
        float _3228 = _3200 + (-1.0);
        _3194 = _3228;
    }
    float _3230 = _3194;
    float _3232 = _3230;
    if (_3142)
    {
        float _3234 = _3164 * _3218;
        _2880 = _3234;
    }
    float _3236 = _2880;
    if (!_3142)
    {
        _3220 = _3206;
    }
    float _3238 = _3220;
    float _3240 = _3238;
    if (_3142)
    {
        float _3242 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3156 = _3242;
    }
    float _3244 = _3156;
    if (_3142)
    {
        float _3246 = _3130 * _3236;
        _3224 = _3246;
    }
    float _3248 = _3224;
    if (!_3142)
    {
        _3232 = _3132;
    }
    float _3250 = _3232;
    float _3252 = _3250;
    if (_3142)
    {
        float _3254 = _3132 * _3236;
        _3252 = _3254;
    }
    float _3256 = _3252;
    if (!_3142)
    {
        _3166 = _3134;
    }
    float _3258 = _3166;
    float _3260 = _3258;
    if (_3142)
    {
        float _3262 = fma(_3206, _3200, _3244);
        _3240 = _3262;
    }
    float _3264 = _3240;
    if (_3142)
    {
        float _3266 = _3248 * _3248;
        _3260 = _3266;
    }
    float _3268 = _3260;
    if (!_3142)
    {
        _3226 = _3136;
    }
    float _3270 = _3226;
    float _3272 = _3270;
    if (_3142)
    {
        float _3274 = _3256 * _3256;
        _3272 = _3274;
    }
    float _3276 = _3272;
    float _3278 = fma(_3264, _3264, _3268);
    int _3280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3282 = _3280 != 0;
    float _3284 = _3278 + _3276;
    float _3286 = rsqrt(_3284);
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3290 = fma(_3126, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3288);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = -_3292;
    float _3296 = _3294 + 1.0;
    float _3298 = abs(_3296);
    float _3300 = log2(_3298);
    float _3302 = _3286 * _3248;
    float _3304 = _3286 * _3264;
    float _3306 = _3286 * _3256;
    float _3308 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3310 = -_3308;
    float _3312 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3310);
    float _3314 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = -_3306;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3312);
    float _3320 = exp2(_3314);
    float _3322 = fma(_3318, -0.5, 0.5);
    float _3324 = fma(_3318, 0.5, 0.5);
    float _3326 = fma(_3324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3328 = sqrt(_3322);
    float _3330 = fma(_3324, _3326, -0.212114393711090087890625);
    float _3332 = fma(_3324, _3330, 1.570728778839111328125);
    float _3334 = _3304 + 1.0;
    float _3336 = -_3304;
    float _3338 = fma(_3320, _3334, _3336);
    int _3340 = _3112 & 3;
    bool _3342 = _3340 != 0;
    float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3346 = _3344 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3348 = !_3282;
    int _3350 = _3348 ? 0 : 1;
    float _3352 = fma(_3338, 0.5, 0.5);
    float _3354 = _3328 * 0.636619746685028076171875;
    int _3356 = ~_2316;
    int _3358 = _3356 + 1;
    bool _3360 = _3340 != 3;
    float _3362 = -_3332;
    float _3364 = fma(_3354, _3362, 1.0);
    bool _3366 = uint(_3340) >= 2u;
    int _3368 = _3358 * _3022;
    int _3370 = _3368 + _2850;
    float _3372 = 1.0 / _3346;
    int _3374 = _3366 ? 0 : 1;
    float2 _10534 = float2(_3364, _3352);
    float3 _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10534, float2(0.0), isnan(_10534)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10534, float2(0.0), isnan(_10534)), level(0.0)).xyz;
    float _3380 = _3378.x;
    float _3382 = _3378.y;
    float _3384 = _3378.z;
    bool _3386 = uint(_3370) >= uint(_2316);
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3392 = _3342 ? 0 : 1;
    float _3394 = trunc(_3014);
    float _3396 = precise::max(_3394, 0.0);
    uint _3398 = uint(_3396);
    bool _3400 = _2892 != 3;
    float _3402 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3404 = _620 + _3402;
    int _3406 = ~_3374;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3414 = _620 + _3412;
    int _3416 = _3410;
    if (_3360)
    {
        int _3418 = ~_3374;
        int _3420 = _3418 + 1;
        _3416 = _3420;
    }
    int _3422 = _3416;
    float _3424 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3426 = !_3400;
    int _3428 = _3426 ? 0 : (-1);
    float _3430 = 1.0 / _3390;
    bool _3432 = _3340 != 3;
    float _3434 = -_660;
    float _3436 = _3434 + 1.0;
    bool _3438 = uint(_3340) > 1u;
    out.m_77.x = _1901;
    out.m_77.y = _1899;
    out.m_77.z = _1903;
    bool _3440 = !_3432;
    int _3442 = _3440 ? 0 : (-1);
    bool _3444 = !_3386;
    int _3446 = _3444 ? 0 : (-1);
    float _3448 = exp2(_3424);
    int _3450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3452 = _3450 != 0;
    int _3454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3456 = _3454 != 0;
    float _3458 = float(uint(_2788));
    int _3460 = int(_2954) + int(_3398);
    int _3462 = ~_2146;
    int _3464 = _3462 + 1;
    float _3466 = as_type<float>(_2410) * _3458;
    int _3468 = ~_3022;
    int _3470 = _3468 + _3446;
    int _3472 = _3470 + 1;
    int _3474 = ~_3392;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    int _3480 = _3464 * _3460;
    int _3482 = _3480 + _2704;
    int _3484 = _3478;
    if (!_3438)
    {
        int _3486 = ~_3392;
        int _3488 = _3486 + 1;
        _3484 = _3488;
    }
    int _3490 = _3484;
    int _3492 = _2316 * _3472;
    int _3494 = _3492 + _2850;
    int _3496 = _3112 & 3;
    bool _3498 = _3496 != 0;
    float _3500 = trunc(_3466);
    float _3502 = precise::max(_3500, 0.0);
    uint _3504 = uint(_3502);
    float _3506 = -_3448;
    float _3508 = _3506 + 1.0;
    bool _3510 = !_3498;
    int _3512 = _3510 ? 0 : 1;
    bool _3514 = uint(_3482) >= uint(_2146);
    float _3516 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3518 = _3516 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3520 = !_2738;
    int _3522 = _3520 ? _3494 : (-1);
    float _3524 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3526 = !_3514;
    int _3528 = _3526 ? 0 : (-1);
    int _3530 = _3522 & 3;
    bool _3532 = _3530 != 0;
    float _3534 = 1.0 / _3518;
    int _3536 = ~_2316;
    int _3538 = _3536 + 1;
    float _3540 = _3524 * _2099;
    int _3542 = _3532 ? 0 : 1;
    bool _3544 = uint(_3530) >= 2u;
    int _3546 = _3538 * int(_3504);
    int _3548 = _3546 + _2788;
    int _3550 = _3544 ? 0 : 1;
    float _3552 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3554 = _3552 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3556 = _3530 != 3;
    float _3558 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3560 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3558;
    float _3562 = _3560 * _3372;
    float _3564 = float(uint(_3548));
    float _3566 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3568 = _3566 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3570 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3572 = _3570 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3574 = 1.0 / _3554;
    float _3576 = as_type<float>(_2410) * _3564;
    float _3578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3580 = _3578 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3582 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3584 = _620 + _3582;
    float _3586 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3588 = _3586 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _3590 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3592 = isnan(_620);
    bool _3594 = _3590 || _3592;
    bool _3596 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3598 = _3594 || _3596;
    float _3600 = float(_3598);
    float _3602 = 1.0 / _3568;
    float _3604 = _3588 * _3534;
    bool _3606 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3608 = isnan(_620);
    bool _3610 = _3606 || _3608;
    bool _3612 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3614 = _3610 || _3612;
    float _3616 = float(_3614);
    float _3618 = -_3600;
    float _3620 = _3618 + 1.0;
    int _3622 = ~_2966;
    int _3624 = _3622 + _3118;
    int _3626 = _3624 + 1;
    float _3628 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3630 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3628;
    float _3632 = fma(_3604, _3404, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3634 = trunc(_3576);
    float _3636 = precise::max(_3634, 0.0);
    uint _3638 = uint(_3636);
    float _3640 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3642 = _3640 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3644 = ~_3550;
    int _3646 = _3644 + 1;
    int _3648 = _3646 + 1;
    float _3650 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3652 = _620 + _3650;
    int _3654 = _3648;
    if (_3556)
    {
        int _3656 = ~_3550;
        int _3658 = _3656 + 1;
        _3654 = _3658;
    }
    int _3660 = _3654;
    float _3662 = _3642 * _3430;
    bool _3664 = _3530 != 3;
    float _3666 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3668 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3666;
    float _3670 = 1.0 / _3580;
    float _3672 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3674 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3672;
    bool _3676 = !_3664;
    int _3678 = _3676 ? 0 : (-1);
    float _3680 = _3668 * _3574;
    bool _3682 = uint(_3530) > 1u;
    float _3684 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3686 = _620 + _3684;
    float _3688 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3690 = _3688 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3692 = _3674 * _3602;
    int _3694 = int(_3504) + int(_3638);
    float _3696 = fma(_3562, _3686, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3698 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3700 = isnan(_620);
    bool _3702 = _3698 || _3700;
    bool _3704 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3706 = _3702 || _3704;
    float _3708 = float(_3706);
    float _3710 = 1.0 / _3572;
    int _3712 = ~_3542;
    int _3714 = _3712 + 1;
    int _3716 = _3714 + 1;
    float _3718 = fma(_3662, _3584, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3720 = ~_2316;
    int _3722 = _3720 + 1;
    float _3724 = _3708 * _3620;
    float _3726 = _3690 * _3670;
    int _3728 = _3716;
    float _3730 = _3726;
    float _3732 = _3692;
    float _3734 = _3718;
    if (!_3682)
    {
        int _3736 = ~_3542;
        int _3738 = _3736 + 1;
        _3728 = _3738;
    }
    int _3740 = _3728;
    float _3742 = -_3708;
    float _3744 = _3742 + 1.0;
    bool _3746 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3748 = isnan(_620);
    bool _3750 = _3746 || _3748;
    bool _3752 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3754 = _3750 || _3752;
    float _3756 = float(_3754);
    int _3758 = _3722 * _3694;
    int _3760 = _3758 + _2788;
    bool _3762 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3764 = isnan(_620);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3770 = _3766 || _3768;
    float _3772 = float(_3770);
    int _3774 = _702 * _3626;
    int _3776 = _3774 + _2304;
    bool _3778 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3780 = isnan(_620);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3786 = _3782 || _3784;
    float _3788 = float(_3786);
    float _3790 = -_3756;
    float _3792 = _3790 + 1.0;
    float _3794 = _3756 * _3744;
    bool _3796 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3798 = isnan(_620);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3804 = _3800 || _3802;
    float _3806 = float(_3804);
    float _3808 = -_3772;
    float _3810 = _3808 + 1.0;
    float _3812 = _3772 * _3792;
    int _3814 = _3522 & 3;
    bool _3816 = _3814 != 0;
    float _3818 = -_3788;
    float _3820 = _3818 + 1.0;
    bool _3822 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3824 = isnan(_620);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3830 = _3826 || _3828;
    float _3832 = float(_3830);
    float _3834 = _3806 * _3810;
    float _3836 = -_3806;
    float _3838 = _3836 + 1.0;
    float _3840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3842 = _620 + _3840;
    bool _3844 = !_3816;
    int _3846 = _3844 ? 0 : 1;
    float _3848 = -_3832;
    float _3850 = _3848 + 1.0;
    bool _3852 = uint(_3760) >= uint(_2316);
    float _3854 = _3630 * _3710;
    float _3856 = _3788 * _3838;
    float _3858 = in.m_79.x;
    float _3860 = in.m_79.y;
    float _3862 = in.m_79.z;
    float _3864 = fma(_3680, _3842, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3866 = _3832 * _3820;
    bool _3868 = !_3852;
    int _3870 = _3868 ? 0 : (-1);
    float _3872 = in.m_81.x;
    float _3874 = in.m_81.y;
    float _3876 = in.m_81.z;
    float _3878 = in.m_81.w;
    float _3880 = _3616 * _3850;
    bool _3882 = _1246 != 0.0;
    bool _3884 = isnan(_1246);
    bool _3886 = _3882 || _3884;
    bool _3888 = isnan(0.0);
    bool _3890 = _3886 || _3888;
    float _3892 = -_3616;
    float _3894 = _3892 + 1.0;
    float _3896 = fma(_3692, _3414, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3898 = _3696 * _3880;
    bool _3900 = _1244 == 0.0;
    bool _3902 = !_3890;
    bool _3904 = _3900 && _3902;
    float _3906 = fma(_3726, _3652, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3908 = ~_3694;
    int _3910 = _3908 + _3870;
    int _3912 = _3910 + 1;
    float _3914 = fma(_3894, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3898);
    bool _3916 = _1248 == 0.0;
    bool _3918 = _3916 && _3904;
    float _3920 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3922 = _620 + _3920;
    int _3924 = ~_3460;
    int _3926 = _3924 + _3528;
    int _3928 = _3926 + 1;
    float _3930 = abs(_1300);
    float _3932 = log2(_3930);
    float _3934 = fma(_3718, _3866, _3914);
    float _3936 = fma(_3854, _3922, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3938 = _2316 * _3912;
    int _3940 = _3938 + _2788;
    int _3942 = abs(_3512);
    float _3944 = fma(_3864, _3856, _3934);
    int _3946 = _2146 * _3928;
    int _3948 = _3946 + _2704;
    int _3950 = abs(_2948);
    float _3952 = fma(_3632, _3834, _3944);
    if (_3918)
    {
        _3730 = _3860;
    }
    float _3954 = _3730;
    float _3956 = _3954;
    if (!_3918)
    {
        float _3958 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3860);
        _3956 = _3958;
    }
    float _3960 = _3956;
    float _3962 = _3874 * _3862;
    if (_3918)
    {
        _3732 = _3858;
    }
    float _3964 = _3732;
    float _3966 = _3964;
    if (!_3918)
    {
        float _3968 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3858);
        _3966 = _3968;
    }
    float _3970 = _3966;
    if (_3918)
    {
        _3734 = _3862;
    }
    float _3972 = _3734;
    float _3974 = _3876 * _3858;
    float _3976 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3978 = _3972;
    if (!_3918)
    {
        float _3980 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3862);
        _3978 = _3980;
    }
    float _3982 = _3978;
    float _3984 = _3872 * _3860;
    float _3986 = fma(_3896, _3812, _3952);
    float _3988 = -_3962;
    float _3990 = fma(_3876, _3860, _3988);
    float _3992 = -_3974;
    float _3994 = fma(_3872, _3862, _3992);
    float _3996 = -_3984;
    float _3998 = fma(_3874, _3858, _3996);
    float _4000 = fma(_3906, _3794, _3986);
    float _4002 = _3990 * _3878;
    float _4004 = exp2(_3976);
    int _4006 = _3522 >> 31;
    float _4008 = _3994 * _3878;
    float _4010 = _3998 * _3878;
    int _4012 = _2858 >> 31;
    float _4014 = fma(_3936, _3724, _4000);
    int _4016 = _4006 & 3;
    float _4018 = _1559 * _1601;
    int _4020 = _4012 & 3;
    float _4022 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4014);
    int _4024 = _3522 + _4016;
    float _4026 = _1559 * _1705;
    float _4028 = _1497 * _1705;
    int _4030 = _2858 + _4020;
    float _4032 = _1497 * _1601;
    int _4034 = _4024 >> 2;
    float _4036 = fma(_4004, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4038 = precise::clamp(_4036, 0.0, 1.0);
    float _4040 = _1567 * _1609;
    int _4042 = _3112 >> 31;
    float _4044 = _4038 * _4038;
    int _4046 = _4034 << 4;
    int _4048 = _4046 + 656;
    float _4050 = fma(_4038, -2.0, 3.0);
    int _4052 = _4030 >> 2;
    float _4054 = fma(_1519, _1533, _4026);
    int _4056 = _4042 & 3;
    uint _4058 = uint(int(uint(_4048) >> uint(2)));
    uint _4060 = uint(int(uint(int(_4058)) >> uint(2)));
    int _4062 = int(_4058) & 3;
    float _4064 = (*spvDescriptorSet0.vp_c9)._m0[int(_4060)][_4062];
    int _4066 = int(_4058) + 1;
    uint _4068 = uint(int(uint(_4066) >> uint(2)));
    int _4070 = _4066 & 3;
    float _4072 = (*spvDescriptorSet0.vp_c9)._m0[int(_4068)][_4070];
    int _4074 = _4052 << 4;
    int _4076 = _4074 + 368;
    float _4078 = _4044 * _4050;
    int _4080 = _3112 + _4056;
    float _4082 = _1559 * _1609;
    float _4084 = _1497 * _1609;
    float _4086 = _1567 * _1705;
    int _4088 = _4080 >> 2;
    uint _4090 = uint(int(uint(_4076) >> uint(2)));
    uint _4092 = uint(int(uint(int(_4090)) >> uint(2)));
    int _4094 = int(_4090) & 3;
    float _4096 = (*spvDescriptorSet0.vp_c9)._m0[int(_4092)][_4094];
    int _4098 = int(_4090) + 1;
    uint _4100 = uint(int(uint(_4098) >> uint(2)));
    int _4102 = _4098 & 3;
    float _4104 = (*spvDescriptorSet0.vp_c9)._m0[int(_4100)][_4102];
    float _4106 = _1567 * _1601;
    float _4108 = fma(_1519, _1531, _4082);
    int _4110 = _4088 << 4;
    int _4112 = _4110 + 512;
    float _4114 = fma(_1519, _1535, _4018);
    float _4116 = -_1495;
    float _4118 = fma(_4116, _1531, _4084);
    float _4120 = -_1495;
    float _4122 = fma(_4120, _1533, _4028);
    float _4124 = -_1495;
    float _4126 = fma(_4124, _1535, _4032);
    int _4128 = _4076 + 8;
    uint _4130 = uint(int(uint(_4128) >> uint(2)));
    uint _4132 = uint(int(uint(int(_4130)) >> uint(2)));
    int _4134 = int(_4130) & 3;
    float _4136 = (*spvDescriptorSet0.vp_c9)._m0[int(_4132)][_4134];
    int _4138 = int(_4130) + 1;
    uint _4140 = uint(int(uint(_4138) >> uint(2)));
    int _4142 = _4138 & 3;
    float _4144 = (*spvDescriptorSet0.vp_c9)._m0[int(_4140)][_4142];
    float _4146 = fma(_1523, _1531, _4040);
    float _4148 = fma(_1523, _1533, _4086);
    float _4150 = fma(_1523, _1535, _4106);
    int _4152 = abs(_3490);
    float _4154 = fma(_1499, _1258, _4118);
    int _4156 = abs(_3740);
    float _4158 = fma(_1499, _1286, _4122);
    uint _4160 = uint(int(uint(_4112) >> uint(2)));
    uint _4162 = uint(int(uint(int(_4160)) >> uint(2)));
    int _4164 = int(_4160) & 3;
    float _4166 = (*spvDescriptorSet0.vp_c9)._m0[int(_4162)][_4164];
    int _4168 = int(_4160) + 1;
    uint _4170 = uint(int(uint(_4168) >> uint(2)));
    int _4172 = _4168 & 3;
    float _4174 = (*spvDescriptorSet0.vp_c9)._m0[int(_4170)][_4172];
    int _4176 = ~_3950;
    int _4178 = _4176 + 1;
    int _4180 = _4178 + 1;
    float _4182 = fma(_1499, _1272, _4126);
    int _4184 = ~_4156;
    int _4186 = _4184 + 1;
    int _4188 = _4186 + 1;
    float _4190 = fma(_1563, _1286, _4054);
    int _4192 = abs(_2998);
    float _4194 = fma(_1569, _1286, _4148);
    int _4196 = ~_4152;
    int _4198 = _4196 + 1;
    int _4200 = _4198 + 1;
    int _4202 = _4112 + 8;
    uint _4204 = uint(int(uint(_4202) >> uint(2)));
    uint _4206 = uint(int(uint(int(_4204)) >> uint(2)));
    int _4208 = int(_4204) & 3;
    float _4210 = (*spvDescriptorSet0.vp_c9)._m0[int(_4206)][_4208];
    int _4212 = int(_4204) + 1;
    uint _4214 = uint(int(uint(_4212) >> uint(2)));
    int _4216 = _4212 & 3;
    float _4218 = (*spvDescriptorSet0.vp_c9)._m0[int(_4214)][_4216];
    int _4220 = ~_4192;
    int _4222 = _4220 + 1;
    int _4224 = _4222 + 1;
    float _4226 = fma(_1563, _1258, _4108);
    float _4228 = fma(_1563, _1272, _4114);
    int _4230 = abs(_3660);
    float _4232 = fma(_1569, _1272, _4150);
    int _4234 = ~_3942;
    int _4236 = _4234 + 1;
    int _4238 = _4236 + 1;
    int _4240 = _4048 + 8;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    uint _4244 = uint(int(uint(int(_4242)) >> uint(2)));
    int _4246 = int(_4242) & 3;
    float _4248 = (*spvDescriptorSet0.vp_c9)._m0[int(_4244)][_4246];
    int _4250 = int(_4242) + 1;
    uint _4252 = uint(int(uint(_4250) >> uint(2)));
    int _4254 = _4250 & 3;
    float _4256 = (*spvDescriptorSet0.vp_c9)._m0[int(_4252)][_4254];
    int _4258 = ~_4230;
    int _4260 = _4258 + 1;
    int _4262 = _4260 + 1;
    float _4264 = fma(_1569, _1258, _4146);
    bool _4266 = !_2612;
    int _4268 = _4266 ? _3948 : (-1);
    out.m_83.x = _4022;
    bool _4270 = !_2738;
    int _4272 = _4270 ? _3940 : (-1);
    int _4274 = _4188 * as_type<int>(_4072);
    int _4276 = abs(_3174);
    float _4278 = _4158 * _3874;
    float _4280 = _4182 * _3874;
    int _4282 = ~_4276;
    int _4284 = _4282 + 1;
    int _4286 = _4284 + 1;
    int _4288 = _4180 * as_type<int>(_4104);
    float _4290 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4292 = int(_4290);
    int _4294 = _4286 * as_type<int>(_4096);
    int _4296 = _4294 + _4288;
    int _4298 = abs(_3422);
    float _4300 = _4008 * _4158;
    int _4302 = abs(_3350);
    int _4304 = _4224 * as_type<int>(_4136);
    int _4306 = _4304 + _4296;
    int _4308 = ~_4298;
    int _4310 = _4308 + 1;
    int _4312 = _4310 + 1;
    float _4314 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4316 = int(_4314);
    int _4318 = _4200 * as_type<int>(_4174);
    int _4320 = abs(_3846);
    float _4322 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4324 = int(_4322);
    float _4326 = float(uint(_4292));
    int _4328 = _4238 * as_type<int>(_4166);
    int _4330 = _4328 + _4318;
    int _4332 = ~_4320;
    int _4334 = _4332 + 1;
    int _4336 = _4334 + 1;
    int _4338 = abs(_3428);
    int _4340 = _4312 * as_type<int>(_4210);
    int _4342 = _4340 + _4330;
    int _4344 = abs(_3678);
    int _4346 = _4336 * as_type<int>(_4064);
    int _4348 = _4346 + _4274;
    int _4350 = ~_4338;
    int _4352 = _4350 + 1;
    int _4354 = _4352 + 1;
    float _4356 = 1.0 / _4326;
    int _4358 = abs(_3442);
    float _4360 = _4154 * _3874;
    int _4362 = ~_4344;
    int _4364 = _4362 + 1;
    int _4366 = _4364 + 1;
    int _4368 = _4354 * as_type<int>(_4144);
    int _4370 = _4368 + _4306;
    int _4372 = ~_4358;
    int _4374 = _4372 + 1;
    int _4376 = _4374 + 1;
    int _4378 = _4262 * as_type<int>(_4248);
    int _4380 = _4378 + _4348;
    float _4382 = float(uint(_4316));
    float _4384 = _4158 * _3960;
    int _4386 = abs(_4292);
    int _4388 = _4376 * as_type<int>(_4218);
    int _4390 = _4388 + _4342;
    float _4392 = 1.0 / _4382;
    float _4394 = float(uint(_4324));
    int _4396 = _4366 * as_type<int>(_4256);
    int _4398 = _4396 + _4380;
    bool _4400 = !_3452;
    int _4402 = _4400 ? 0 : 1;
    int _4404 = ~_4302;
    int _4406 = _4404 + 1;
    int _4408 = _4406 + 1;
    float _4410 = float(uint(_4386));
    float _4412 = 1.0 / _4394;
    bool _4414 = !_3456;
    int _4416 = _4414 ? 0 : 1;
    int _4418 = _4370 * _4408;
    int _4420 = abs(_4402);
    int _4422 = abs(_4416);
    int _4424 = ~_4420;
    int _4426 = _4424 + 1;
    int _4428 = _4426 + 1;
    float _4430 = 1.0 / _4410;
    bool _4432 = !_2234;
    int _4434 = _4432 ? _3776 : (-1);
    int _4436 = abs(_4324);
    int _4438 = _4428 * _4390;
    int _4440 = ~_4316;
    int _4442 = _4440 + 1;
    int _4444 = _4434 * _4302;
    int _4446 = _4444 + _4418;
    int _4448 = abs(_4316);
    int _4450 = ~_4422;
    int _4452 = _4450 + 1;
    int _4454 = _4452 + 1;
    float _4456 = float(uint(_4436));
    int _4458 = as_type<int>(_4356) + (-2);
    int _4460 = _4454 * _4398;
    float _4462 = float(uint(_4446));
    int _4464 = _4268 * _4420;
    int _4466 = _4464 + _4438;
    int _4468 = as_type<int>(_4412) + (-2);
    int _4470 = _4272 * _4422;
    int _4472 = _4470 + _4460;
    float _4474 = 1.0 / _4456;
    float _4476 = float(uint(_4448));
    float _4478 = _4154 * _3960;
    float _4480 = float(uint(_4466));
    float _4482 = _4182 * _3960;
    float _4484 = float(uint(_4472));
    int _4486 = abs(_4446);
    float _4488 = as_type<float>(_4468) * _4480;
    int _4490 = as_type<int>(_4392) + (-2);
    float _4492 = as_type<float>(_4458) * _4462;
    float _4494 = 1.0 / _4476;
    int _4496 = as_type<int>(_4430) + (-2);
    float _4498 = as_type<float>(_4490) * _4484;
    int _4500 = abs(_4466);
    int _4502 = as_type<int>(_4474) + (-2);
    float _4504 = trunc(_4492);
    float _4506 = precise::max(_4504, 0.0);
    uint _4508 = uint(_4506);
    int _4510 = ~_4292;
    int _4512 = _4510 + 1;
    float _4514 = float(uint(_4500));
    float _4516 = float(uint(_4486));
    float _4518 = trunc(_4498);
    float _4520 = precise::max(_4518, 0.0);
    uint _4522 = uint(_4520);
    int _4524 = abs(_4472);
    float _4526 = as_type<float>(_4502) * _4514;
    int _4528 = as_type<int>(_4494) + (-2);
    float _4530 = as_type<float>(_4496) * _4516;
    float _4532 = float(uint(_4524));
    float _4534 = _4008 * _4154;
    int _4536 = ~_4324;
    int _4538 = _4536 + 1;
    float _4540 = trunc(_4488);
    float _4542 = precise::max(_4540, 0.0);
    uint _4544 = uint(_4542);
    int _4546 = _4512 * int(_4508);
    int _4548 = _4546 + _4446;
    float _4550 = _4008 * _4182;
    float _4552 = as_type<float>(_4528) * _4532;
    float _4554 = fma(_4228, _3872, _4280);
    float _4556 = float(uint(_4548));
    float _4558 = fma(_4226, _3872, _4360);
    float _4560 = trunc(_4530);
    float _4562 = precise::max(_4560, 0.0);
    uint _4564 = uint(_4562);
    int _4566 = _4442 * int(_4522);
    int _4568 = _4566 + _4472;
    int _4570 = ~_4386;
    int _4572 = _4570 + 1;
    float _4574 = as_type<float>(_4458) * _4556;
    float _4576 = float(uint(_4568));
    float _4578 = trunc(_4526);
    float _4580 = precise::max(_4578, 0.0);
    uint _4582 = uint(_4580);
    int _4584 = _4538 * int(_4544);
    int _4586 = _4584 + _4466;
    float _4588 = fma(_4190, _3872, _4278);
    float _4590 = as_type<float>(_4490) * _4576;
    int _4592 = ~_4448;
    int _4594 = _4592 + 1;
    float _4596 = fma(_4226, _3970, _4478);
    float _4598 = float(uint(_4586));
    float _4600 = trunc(_4552);
    float _4602 = precise::max(_4600, 0.0);
    uint _4604 = uint(_4602);
    int _4606 = _4572 * int(_4564);
    int _4608 = _4606 + _4486;
    int _4610 = ~_4436;
    int _4612 = _4610 + 1;
    float _4614 = as_type<float>(_4468) * _4598;
    float _4616 = fma(_4002, _4226, _4534);
    float _4618 = float(uint(_4608));
    float _4620 = fma(_4190, _3970, _4384);
    int _4622 = _4612 * int(_4582);
    int _4624 = _4622 + _4500;
    float _4626 = trunc(_4614);
    float _4628 = precise::max(_4626, 0.0);
    uint _4630 = uint(_4628);
    float _4632 = as_type<float>(_4496) * _4618;
    float _4634 = fma(_4002, _4190, _4300);
    float _4636 = float(uint(_4624));
    float _4638 = _3384 * _3540;
    float _4640 = fma(_4194, _3982, _4620);
    int _4642 = _4594 * int(_4604);
    int _4644 = _4642 + _4524;
    int _4646 = ~_4324;
    int _4648 = _4646 + 1;
    float _4650 = trunc(_4574);
    float _4652 = precise::max(_4650, 0.0);
    uint _4654 = uint(_4652);
    float _4656 = as_type<float>(_4502) * _4636;
    float _4658 = fma(_4228, _3970, _4482);
    float _4660 = float(uint(_4644));
    float _4662 = fma(_4002, _4228, _4550);
    float _4664 = fma(_4264, _3876, _4558);
    float _4666 = fma(_4194, _3876, _4588);
    float _4668 = fma(_4232, _3876, _4554);
    float _4670 = trunc(_4656);
    float _4672 = precise::max(_4670, 0.0);
    uint _4674 = uint(_4672);
    float _4676 = as_type<float>(_4528) * _4660;
    int _4678 = int(_4544) + int(_4630);
    int _4680 = ~_4292;
    int _4682 = _4680 + 1;
    out.m_85.x = _4664;
    out.m_85.y = _4666;
    out.m_85.z = _4668;
    float _4684 = trunc(_4632);
    float _4686 = precise::max(_4684, 0.0);
    uint _4688 = uint(_4686);
    int _4690 = int(_4508) + int(_4654);
    float _4692 = trunc(_4676);
    float _4694 = precise::max(_4692, 0.0);
    uint _4696 = uint(_4694);
    float _4698 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _4700 = _4682 * _4690;
    int _4702 = _4700 + _4446;
    int _4704 = int(_4582) + int(_4674);
    int _4706 = _4648 * _4678;
    int _4708 = _4706 + _4466;
    float _4710 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4698);
    int _4712 = ~_4386;
    int _4714 = _4712 + 1;
    float _4716 = trunc(_4590);
    float _4718 = precise::max(_4716, 0.0);
    uint _4720 = uint(_4718);
    int _4722 = int(_4564) + int(_4688);
    float _4724 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4710);
    int _4726 = ~_4448;
    int _4728 = _4726 + 1;
    bool _4730 = uint(_4708) >= uint(_4324);
    int _4732 = _4714 * _4722;
    int _4734 = _4732 + _4486;
    int _4736 = ~_4316;
    int _4738 = _4736 + 1;
    float _4740 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4724);
    int _4742 = int(_4604) + int(_4696);
    float _4744 = _4740 + _2011;
    bool _4746 = uint(_4702) >= uint(_4292);
    int _4748 = ~_4436;
    int _4750 = _4748 + 1;
    int _4752 = _4728 * _4742;
    int _4754 = _4752 + _4524;
    int _4756 = int(_4522) + int(_4720);
    float _4758 = _4744 * 0.5;
    bool _4760 = uint(_4734) >= uint(_4386);
    int _4762 = _4750 * _4704;
    int _4764 = _4762 + _4500;
    bool _4766 = !_4746;
    int _4768 = _4766 ? 0 : (-1);
    int _4770 = _4738 * _4756;
    int _4772 = _4770 + _4472;
    bool _4774 = !_4730;
    int _4776 = _4774 ? 0 : (-1);
    float _4778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4780 = uint(_4754) >= uint(_4448);
    bool _4782 = uint(_4772) >= uint(_4316);
    int _4784 = ~_4690;
    int _4786 = _4784 + _4768;
    int _4788 = _4786 + 1;
    int _4790 = ~_4678;
    int _4792 = _4790 + _4776;
    int _4794 = _4792 + 1;
    float _4796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4798 = uint(_4764) >= uint(_4436);
    bool _4800 = !_4782;
    int _4802 = _4800 ? 0 : (-1);
    bool _4804 = _4292 == 0;
    bool _4806 = _4292 == 0;
    float _4808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4810 = _4446 ^ _4292;
    int _4812 = _4292 * _4788;
    int _4814 = _4812 + _4446;
    bool _4816 = !_4760;
    int _4818 = _4816 ? 0 : (-1);
    int _4820 = _4324 * _4794;
    int _4822 = _4820 + _4466;
    bool _4824 = _4324 == 0;
    int _4826 = ~_4756;
    int _4828 = _4826 + _4802;
    int _4830 = _4828 + 1;
    float _4832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4834 = !_4824;
    int _4836 = _4834 ? _4822 : (-1);
    bool _4838 = !_4804;
    int _4840 = _4838 ? _4814 : (-1);
    int _4842 = _4316 * _4830;
    int _4844 = _4842 + _4472;
    bool _4846 = _4316 == 0;
    bool _4848 = _4316 == 0;
    int _4850 = _4472 ^ _4316;
    float _4852 = _4796 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _4854 = float(_4836);
    bool _4856 = !_4798;
    int _4858 = _4856 ? 0 : (-1);
    float _4860 = fma(_4852, _2462, -0.5);
    int _4862 = _4466 ^ _4324;
    float _4864 = fma(_4852, _4854, _1172);
    uint _4866 = uint(int(uint(_4810) >> uint(31)));
    float _4868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4870 = _4324 == 0;
    float _4872 = _4778 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4874 = float(_4840);
    float _4876 = fma(_1064, _4860, _4864);
    bool _4878 = !_4780;
    int _4880 = _4878 ? 0 : (-1);
    float _4882 = fma(_4872, _2408, -0.5);
    uint _4884 = uint(int(uint(_4850) >> uint(31)));
    float _4886 = fma(_4872, _4874, _762);
    bool _4888 = !_4846;
    int _4890 = _4888 ? _4844 : (-1);
    float _4892 = _4832 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4894 = ~_4818;
    int _4896 = _4722 + _4894;
    int _4898 = _4896 + 1;
    float _4900 = fma(_1158, _4882, _4886);
    uint _4902 = uint(int(uint(_4862) >> uint(31)));
    float _4904 = fma(_4892, _2498, -0.5);
    int _4906 = ~int(_4866);
    int _4908 = _4906 + 1;
    float _4910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4912 = ~_4880;
    int _4914 = _4742 + _4912;
    int _4916 = _4914 + 1;
    float _4918 = _4900 + 0.5;
    int _4920 = ~int(_4884);
    int _4922 = _4920 + 1;
    float _4924 = float(_4890);
    int _4926 = ~_4858;
    int _4928 = _4704 + _4926;
    int _4930 = _4928 + 1;
    int _4932 = ~int(_4902);
    int _4934 = _4932 + 1;
    int _4936 = _4898 ^ _4908;
    int _4938 = _4916 ^ _4922;
    float _4940 = fma(_4892, _4924, _892);
    int _4942 = _4930 ^ _4934;
    float _4944 = _4808 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4946 = ~_4908;
    int _4948 = _4946 + _4936;
    int _4950 = _4948 + 1;
    float _4952 = fma(_1164, _4904, _4940);
    int _4954 = ~_4934;
    int _4956 = _4954 + _4942;
    int _4958 = _4956 + 1;
    bool _4960 = !_4806;
    int _4962 = _4960 ? _4950 : (-1);
    float _4964 = _4952 + 0.5;
    bool _4966 = !_4870;
    int _4968 = _4966 ? _4958 : (-1);
    float _4970 = float(_4962);
    float _4972 = float(_4968);
    float _4974 = fma(_2618, _4944, -0.5);
    bool _4976 = _1300 <= 8000.0;
    bool _4978 = isnan(_1300);
    bool _4980 = _4976 || _4978;
    bool _4982 = isnan(8000.0);
    bool _4984 = _4980 || _4982;
    float _4986 = float(_4984);
    float _4988 = -_774;
    float _4990 = fma(_4944, _4970, _4988);
    float _4992 = fma(_4010, _4194, _4634);
    int _4994 = ~_4922;
    int _4996 = _4994 + _4938;
    int _4998 = _4996 + 1;
    float _5000 = _4910 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5002 = fma(_1160, _4974, _4990);
    float _5004 = fma(_4010, _4264, _4616);
    float _5006 = fma(_4010, _4232, _4662);
    float _5008 = -_4078;
    float _5010 = _5008 + 1.0;
    bool _5012 = !_4848;
    int _5014 = _5012 ? _4998 : (-1);
    float _5016 = _4868 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5018 = _4744;
    float _5020 = _4740;
    if (!_1981)
    {
        _5018 = 1.0;
    }
    float _5022 = _5018;
    float _5024 = fma(_5010, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4078);
    out.m_87.x = _5004;
    out.m_87.y = _4992;
    out.m_87.z = _5006;
    float _5026 = float(_5014);
    float _5028 = fma(_2830, _5000, -0.5);
    float _5030 = _4986 * _5024;
    float _5032 = _5022;
    if (_1981)
    {
        bool _5034 = _2097 >= _2061;
        bool _5036 = isnan(_2097);
        bool _5038 = _5034 || _5036;
        bool _5040 = isnan(_2061);
        bool _5042 = _5038 || _5040;
        float _5044 = float(_5042);
        _5032 = _5044;
    }
    float _5046 = _5032;
    float _5048 = -_1174;
    float _5050 = fma(_5000, _4972, _5048);
    float _5052 = fma(_5016, _2884, -0.5);
    float _5054 = -_1176;
    float _5056 = fma(_5016, _5026, _5054);
    float _5058 = _5046 * _3096;
    float _5060 = fma(_1168, _5028, _5050);
    out.gl_Position.x = _2037;
    out.gl_Position.y = _2043;
    out.gl_Position.z = _4740;
    out.gl_Position.w = _2011;
    float _5062 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5064 = fma(_1166, _5052, _5056);
    float _5066 = fma(_4264, _3982, _4596);
    float _5068 = _4876 + 0.5;
    float _5070 = _3436 * _5062;
    float _5072 = precise::clamp(_5070, 0.0, 1.0);
    float _5074 = _5002 + 0.5;
    float _5076 = _5060 + 0.5;
    float _5078 = _5064 + 0.5;
    float _5080 = -_5072;
    float _5082 = fma(_5080, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5084 = fma(_4232, _3982, _4658);
    float _5086 = fma(_2110, _4638, _2108);
    float _5088 = -_5058;
    float _5090 = fma(_5088, _5082, 1.0);
    float _5092 = precise::clamp(_5090, 0.0, 1.0);
    float _5094 = _2110 * _3540;
    float _5096 = -_3524;
    float _5098 = _5096 + 1.0;
    out.m_89.x = _4918;
    out.m_89.y = _5074;
    out.m_89.z = _5068;
    out.m_89.w = _5076;
    float _5100 = _5092 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5102 = fma(_3380, _5094, _2104);
    float _5104 = fma(_3382, _5094, _2106);
    float _5106 = _2110 * _5098;
    out.m_91.x = _4964;
    out.m_91.y = _5078;
    bool _5108 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5110 = isnan(_3126);
    bool _5112 = _5108 || _5110;
    bool _5114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5116 = _5112 || _5114;
    out.m_93.z = _4758;
    out.m_93.w = _2011;
    out.m_95.x = _5100;
    out.m_97.x = _5102;
    out.m_97.y = _5104;
    out.m_97.z = _5086;
    out.m_97.w = _5106;
    float _5118 = _5058;
    float _5120 = _5094;
    float _5122 = _5098;
    float _5124 = _5092;
    if (!_5116)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5126 = _5118;
    out.m_99.x = _5066;
    out.m_99.y = _4640;
    out.m_99.z = _5084;
    float _5128 = _5126;
    float _5130 = _5126;
    if (!_5116)
    {
        _2013 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5132 = _2013;
    float _5134 = _5132;
    float _5136 = _5132;
    if (!_5116)
    {
        _5020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5138 = _5020;
    float _5140 = _5138;
    float _5142 = _5138;
    if (!_5116)
    {
        _5120 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5144 = _5120;
    float _5146 = _5144;
    float _5148 = _5144;
    if (!_5116)
    {
        _5122 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5150 = _5122;
    float _5152 = _5150;
    float _5154 = _5150;
    if (!_5116)
    {
        _5124 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5156 = _5124;
    bool _5158 = !_5116;
    float _5160 = _5156;
    float _5162 = _5156;
    if (!_5158)
    {
        bool _5164 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5166 = isnan(_3126);
        bool _5168 = _5164 || _5166;
        bool _5170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5172 = _5168 || _5170;
        if (!_5172)
        {
            float _5174 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5176 = _3126 + _5174;
            float _5178 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5180 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5178;
            float _5182 = 1.0 / _5180;
            float _5184 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5186 = _5184 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5188 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5190 = _5188 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5192 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5194 = _5192 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5196 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5198 = _5196 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5200 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5202 = _5200 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5204 = _5176 * _5182;
            float _5206 = precise::clamp(_5204, 0.0, 1.0);
            float _5208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5210 = _5208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5212 = fma(_5206, _5186, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5214 = fma(_5206, _5210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5216 = fma(_5206, _5190, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5218 = fma(_5206, _5194, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5220 = fma(_5206, _5198, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5222 = fma(_5206, _5202, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5136 = _5214;
            _5154 = _5220;
            _5130 = _5212;
            _5148 = _5218;
            _5142 = _5216;
            _5162 = _5222;
            _5224 = true;
        }
        else
        {
            bool _5226 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5228 = isnan(_3126);
            bool _5230 = _5226 || _5228;
            bool _5232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5234 = _5230 || _5232;
            if (!_5234)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5236 = _5128;
            _5130 = _5236;
            if (!_5234)
            {
                _5134 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5238 = _5134;
            _5136 = _5238;
            if (!_5234)
            {
                _5140 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5240 = _5140;
            _5142 = _5240;
            if (!_5234)
            {
                _5146 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5242 = _5146;
            _5148 = _5242;
            if (!_5234)
            {
                _5152 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5244 = _5152;
            _5154 = _5244;
            if (!_5234)
            {
                _5160 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5246 = _5160;
            bool _5248 = !_5234;
            _5162 = _5246;
            if (!_5248)
            {
                bool _5250 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5252 = isnan(_3126);
                bool _5254 = _5250 || _5252;
                bool _5256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5258 = _5254 || _5256;
                if (!_5258)
                {
                    float _5260 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5262 = _3126 + _5260;
                    float _5264 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5266 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5264;
                    float _5268 = 1.0 / _5266;
                    float _5270 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5272 = _5270 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5274 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5276 = _5274 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5278 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5280 = _5278 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5282 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5284 = _5282 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5286 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5288 = _5286 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5290 = _5262 * _5268;
                    float _5292 = precise::clamp(_5290, 0.0, 1.0);
                    float _5294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5296 = _5294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5298 = fma(_5292, _5272, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5300 = fma(_5292, _5296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5302 = fma(_5292, _5276, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5304 = fma(_5292, _5280, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5306 = fma(_5292, _5284, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5308 = fma(_5292, _5288, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5136 = _5300;
                    _5154 = _5306;
                    _5130 = _5298;
                    _5148 = _5304;
                    _5142 = _5302;
                    _5162 = _5308;
                    _5224 = true;
                }
                else
                {
                    _5136 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5154 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5148 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5142 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5162 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5224 = false;
    float _5310 = _5136;
    float _5312 = _5154;
    float _5314 = _5130;
    float _5316 = _5148;
    float _5318 = _5142;
    float _5320 = _5162;
    float _5322 = fma(_4640, -0.5, 0.5);
    float _5324 = precise::clamp(_5322, 0.0, 1.0);
    float _5326 = -_5310;
    float _5328 = _5326 + _5312;
    float _5330 = -_5314;
    float _5332 = _5330 + _5316;
    float _5334 = -_5318;
    float _5336 = _5334 + _5320;
    bool _5338 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5340 = fma(_5324, _5328, _5310);
    float _5342 = fma(_5324, _5332, _5314);
    float _5344 = fma(_5324, _5336, _5318);
    float _5346 = _5340 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _5348 = fma(_5342, 0.298911988735198974609375, _5346);
    float _5350 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5352 = fma(_5344, 0.114477999508380889892578125, _5348);
    out.m_95.w = _5350;
    float _5354 = -_5352;
    float _5356 = _5342 + _5354;
    float _5358 = -_5352;
    float _5360 = _5340 + _5358;
    float _5362 = -_5352;
    float _5364 = _5344 + _5362;
    out.m_101.x = 0.0;
    float _5366 = fma(_5356, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    float _5368 = fma(_5360, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    float _5370 = fma(_5364, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    out.m_103.x = _5366;
    out.m_103.y = _5368;
    out.m_103.z = _5370;
    if (!_5338)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5372 = -_1899;
    float _5374 = _5372 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5376 = -_1901;
    float _5378 = _5376 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5380 = -_1903;
    float _5382 = _5380 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5384 = _5374 * _5374;
    float _5386 = fma(_5378, _5378, _5384);
    float _5388 = fma(_5382, _5382, _5386);
    float _5390 = sqrt(_5388);
    float _5392 = rsqrt(_5388);
    float _5394 = -_5390;
    float _5396 = _5394 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5398 = _5396 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5400 = precise::clamp(_5398, 0.0, 1.0);
    float _5402 = _5378 * _5392;
    float _5404 = _5374 * _5392;
    float _5406 = abs(_5400);
    float _5408 = log2(_5406);
    float _5410 = _5382 * _5392;
    float _5412 = _5402 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5414 = _4640 * _5404;
    float _5416 = -_5404;
    float _5418 = -_5412;
    float _5420 = fma(_5416, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5418);
    float _5422 = fma(_5066, _5402, _5414);
    float _5424 = -_5410;
    float _5426 = fma(_5424, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5420);
    float _5428 = fma(_5084, _5410, _5422);
    float _5430 = precise::clamp(_5428, 0.0, 1.0);
    float _5432 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5434 = _5426 + _5432;
    float _5436 = _5408 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5438 = _5434 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5440 = precise::clamp(_5438, 0.0, 1.0);
    float _5442 = exp2(_5436);
    float _5444 = _5442 * _5440;
    float _5446 = _5430 * _5444;
    float _5448 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5450 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5452 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5448;
    out.m_101.y = _5450;
    out.m_101.z = _5452;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5224 = false;
    bool _612 = false;
    bool _200 = false;
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
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5508 = as_type<float>(_138);
        out.gl_Position.z = _5508;
    }
    if (!_126)
    {
        return out;
    }
    float _140 = in.m_61.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    int _172 = 0;
    if (_166)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5578 = as_type<float>(_176);
        out.gl_Position.z = _5578;
    }
    if (_166)
    {
        return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_63.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _154 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = 1.0 / _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _228 = 1.0 / _216;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _234 = 1.0 / _220;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _236;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = 1.0 / _232;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _256 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _258 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _262 = isnan(_208);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _274 = 1.0 / _226;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _208 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = _208 + _280;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _286 = 1.0 / _238;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _292 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _294 = _288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _298 = _208 + _296;
    out.m_65.x = _258;
    out.m_65.y = _256;
    out.m_65.z = _292;
    out.m_65.w = _244;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _208 + _300;
    float _304 = _298 * _248;
    bool _306 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _308 = isnan(_208);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    out.m_67.x = _294;
    out.m_67.y = _246;
    out.m_67.z = _272;
    out.m_67.w = _290;
    float _318 = _302 * _228;
    float _320 = _278 * _234;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _208 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _208 + _326;
    float _330 = _282 * _286;
    float _332 = _324 * _222;
    float _334 = _328 * _274;
    bool _336 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _338 = isnan(_208);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_346;
    float _350 = _348 + 1.0;
    float _352 = -_316;
    float _354 = _352 + 1.0;
    bool _356 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_208);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _270 * _350;
    float _370 = -_270;
    float _372 = _370 + 1.0;
    bool _374 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_208);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _366 * _354;
    float _392 = _316 * _372;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = -_366;
    float _416 = _414 + 1.0;
    bool _418 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_208);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_396, _320, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _432 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _434 = isnan(_208);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_400, _320, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = fma(_388, _320, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _448 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = fma(_408, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = fma(_412, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _384 * _416;
    float _456 = -_384;
    float _458 = _456 + 1.0;
    float _460 = -_442;
    float _462 = _460 + 1.0;
    float _464 = _442 * _458;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = _428 * _462;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _476;
    float _480 = fma(_468, _332, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = fma(_472, _332, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = _450 * _474;
    float _486 = fma(_478, _332, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = _448 * _474;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = _452 * _474;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _508 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].z, _494);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_430, _464, _504);
    float _516 = fma(_444, _464, _506);
    float _518 = fma(_446, _464, _508);
    float _520 = fma(_498, _334, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _522 = fma(_502, _334, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _524 = fma(_512, _334, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _526 = fma(_482, _454, _514);
    float _528 = fma(_486, _454, _516);
    float _530 = fma(_480, _454, _518);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _540;
    float _544 = fma(_520, _390, _526);
    float _546 = fma(_522, _390, _528);
    float _548 = fma(_524, _390, _530);
    float _550 = fma(_534, _330, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _552 = fma(_538, _330, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _554 = fma(_542, _330, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _568 = fma(_550, _392, _544);
    float _570 = fma(_558, _304, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _572 = fma(_562, _304, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _574 = fma(_566, _304, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _576 = fma(_552, _392, _546);
    float _578 = fma(_554, _392, _548);
    float _580 = fma(_570, _368, _568);
    float _582 = fma(_572, _368, _576);
    float _584 = fma(_574, _368, _578);
    float _586 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].x, _580);
    float _588 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].y, _582);
    float _590 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].z, _584);
    bool _592 = !_284;
    float _610;
    if (!_592)
    {
        float _594 = in.m_63.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        float _614 = float(_122);
        float _616 = 1.0 / _614;
        float _618 = _154 * _616;
        _610 = _618;
    }
    _612 = false;
    float _620 = _610;
    float _622 = in.m_56.x;
    float _624 = in.m_56.y;
    float _626 = in.m_56.z;
    float _628 = _624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _630 = _624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _632 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[4].x, _628);
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[6].x, _630);
    float _636 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[4].z, _632);
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    float _640 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _642 = _638 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _644 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _646 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _648 = floor(_644);
    float _650 = floor(_646);
    float _652 = -_648;
    float _654 = _644 + _652;
    float _656 = -_650;
    float _658 = _646 + _656;
    float2 _6431 = float2(_654, _658);
    float _660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6431, float2(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6431, float2(0.0), isnan(_6431)), level(0.0)).x;
    float _662 = in.m_69.x;
    float _664 = in.m_69.y;
    float _666 = in.m_69.z;
    float _668 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _670 = in.m_63.x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _674 = _672 != 0;
    float _676 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _678 = log2(_676);
    float _680 = in.m_63.y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _684 = in.m_63.z;
    float _686 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _688 = int(_686);
    float _690 = -_640;
    float _692 = _690 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = float(_122);
    float _696 = -_642;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _702 = int(_700);
    float _704 = _590 * _666;
    float _706 = _588 * _664;
    float _708 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[5].x, _668);
    float _710 = _670 * 2.0;
    float _712 = _670 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = _586 * _662;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _718 = floor(_710);
    float _720 = _680 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _722 = _680 * 2.0;
    float _724 = -_682;
    float _726 = fma(_712, 2.0, _724);
    float _728 = _680 + _684;
    float _730 = fma(_720, -2.0, _716);
    float _732 = _684 * 2.0;
    float _734 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].z, _708);
    float _736 = floor(_722);
    float _738 = _670 + _680;
    float _740 = _728 + (-1.0);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _744 = float(_688);
    float _746 = _738 + (-1.0);
    int _748 = as_type<int>(_738);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _752 = _680;
    float _754 = _670;
    float _756 = _642;
    if (_674)
    {
        _748 = 0;
    }
    int _758 = _748;
    float _760 = -_154;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[76].x, _726);
    float _764 = floor(_732);
    int _766 = _758;
    if (!_674)
    {
        _766 = 2;
    }
    int _768 = _766;
    float _770 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _772 = _718 > 0.0;
    float _774 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _730);
    float _776 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _778 = _768 != 2;
    float _780 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _782 = int(_780);
    bool _784 = _718 >= 0.0;
    bool _786 = isnan(_718);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _796 = _768;
    if (_674)
    {
        _796 = 0;
    }
    int _798 = _796;
    int _800 = _792 ? 0 : 1;
    int _802 = _798;
    if (!_674)
    {
        _802 = 1;
    }
    int _804 = _802;
    float _806 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _808 = int(_806);
    bool _810 = _764 > 0.0;
    bool _812 = _764 >= 0.0;
    bool _814 = isnan(_764);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    int _822 = ~_800;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    float _830 = as_type<float>(_804);
    if (!_772)
    {
        int _832 = ~_800;
        int _834 = _832 + 1;
        _828 = _834;
    }
    int _836 = _828;
    float _838 = 1.0 / _744;
    bool _840 = _804 != 1;
    if (_778)
    {
        _830 = _670;
    }
    float _842 = _830;
    float _844 = _842;
    if (!_778)
    {
        _844 = _684;
    }
    float _846 = _844;
    float _848 = 1.0 / _694;
    bool _850 = _736 > 0.0;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _854 = _736 >= 0.0;
    bool _856 = isnan(_736);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = _846 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _866 = _820 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _868 = _862 ? 0 : 1;
    float _870 = -_852;
    float _872 = fma(_864, 2.0, _870);
    float _874 = _864;
    float _876 = _866;
    float _878 = _846;
    if (!_840)
    {
        _874 = _680;
    }
    float _880 = _874;
    float _882 = _838 * _154;
    int _884 = ~as_type<int>(_866);
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = -_154;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[86].x, _872);
    int _894 = ~_868;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _888;
    int _902 = _898;
    float _904 = _880;
    if (!_810)
    {
        int _906 = ~as_type<int>(_866);
        int _908 = _906 + 1;
        _900 = _908;
    }
    int _910 = _900;
    float _912 = _848 * _154;
    if (!_850)
    {
        int _914 = ~_868;
        int _916 = _914 + 1;
        _902 = _916;
    }
    int _918 = _902;
    if (!_840)
    {
        _876 = _880;
    }
    float _920 = _876;
    float _922 = _920;
    if (_840)
    {
        _922 = _670;
    }
    float _924 = _922;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _938 = _936 != 0;
    float _940 = _924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_840)
    {
        _878 = _684;
    }
    float _942 = _878;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _946 = _942;
    if (_840)
    {
        _946 = _680;
    }
    float _948 = _946;
    float _950 = -_926;
    float _952 = fma(_940, 2.0, _950);
    float _954 = _734 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _956 = !_934;
    int _958 = _956 ? 0 : 1;
    bool _960 = !_930;
    int _962 = _960 ? 0 : 1;
    float _964 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[83].w, _944);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _972 = _970 != 0;
    float _974 = _954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _976 = _954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_840)
    {
        _904 = _670;
    }
    float _978 = _904;
    float _980 = -_954;
    float _982 = _980 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _984 = !_938;
    int _986 = _984 ? 0 : 1;
    float _988 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _974);
    bool _990 = !_972;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _976);
    bool _996 = !_968;
    int _998 = _996 ? 0 : 1;
    float _1000 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[10].z, _988);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1012 = _1010 != 0;
    float _1014 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[83].z, _742);
    float _1016 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[11].z, _994);
    float _1018 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1020 = float(_782);
    float _1022 = in.m_71.x;
    float _1024 = in.m_71.y;
    float _1026 = in.m_71.z;
    bool _1028 = !_1004;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1034 = _988;
    if (!_840)
    {
        _1034 = _684;
    }
    float _1036 = _1034;
    float _1038 = 1.0 / _1020;
    int _1040 = abs(_1030);
    float _1042 = _1018 + _1032;
    float _1044 = _1036;
    float _1046 = as_type<float>(_1040);
    if (_840)
    {
        _1044 = _680;
    }
    float _1048 = _1044;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1052 = _982 * _982;
    if (_778)
    {
        _1046 = _680;
    }
    float _1054 = _1046;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1058 = 1.0 / _1032;
    float _1060 = _1054;
    if (!_778)
    {
        _1060 = _670;
    }
    float _1062 = _1060;
    float _1064 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1014);
    float _1066 = float(_910);
    float _1068 = fma(_1056, -2.0, _1050);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1072 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1074 = float(_1040);
    float _1076 = _1038 * _154;
    float _1078 = fma(_1072, -2.0, _1070);
    float _1080 = _678 * _154;
    float _1082 = _1074 * _1066;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1086 = float(_808);
    float _1088 = _1042 * _1058;
    float _1090 = _1088 * 0.5;
    float _1092 = exp2(_1080);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1096 = _1082 * (-2.0);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1100 = 1.0 + _1098;
    float _1102 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1084);
    float _1104 = fma(_770, _1096, _770);
    float _1106 = fma(_1096, _1022, _1022);
    float _1108 = 1.0 / _1086;
    float _1110 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _1112 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1114 = isnan(1.0);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1120 = _1116 || _1118;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1136 = _954 + _1110;
    float _1138 = 1.0 / _1100;
    float _1140 = -_1092;
    float _1142 = _1140 + 1.0;
    float _1144 = float(_702);
    float _1146 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1122);
    float _1148 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1134);
    float _1150 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1094);
    float _1152 = _1132 ? _1142 : 0.0;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1156 = _1144 * _154;
    float _1158 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1146);
    float _1160 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1148);
    float _1162 = _1108 * _154;
    float _1164 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1102);
    float _1166 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1150);
    float _1168 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _964);
    float _1170 = -_154;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[81].x, _952);
    float _1174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1068);
    float _1176 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1078);
    int _1178 = as_type<int>(_1076);
    float _1180 = _1136;
    if (_1120)
    {
        float _1182 = _1152 * _1138;
        _156 = _1182;
    }
    float _1184 = _156;
    float _1186 = fma(_692, _692, _1052);
    float _1188 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1154);
    bool _1190 = !_1008;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _670 + (-0.5);
    float _1196 = fma(_698, _698, _1186);
    float _1198 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1188);
    bool _1200 = !_1012;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1106);
    float _1206 = float(_836);
    float _1208 = rsqrt(_1196);
    int _1210 = abs(_1192);
    float _1212 = fma(_1104, _1184, _1204);
    int _1214 = abs(_1202);
    float _1216 = _670 + _684;
    float _1218 = float(_1210);
    float _1220 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1222 = _1216 + (-1.0);
    float _1224 = float(_918);
    float _1226 = _1218 * _1206;
    float _1228 = float(_1214);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1232 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1230);
    float _1234 = _1226 * (-2.0);
    float _1236 = _680 + (-0.5);
    float _1238 = _1228 * _1224;
    float _1240 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1220);
    float _1242 = 1.0 / _1232;
    float _1244 = in.m_73.x;
    float _1246 = in.m_73.y;
    float _1248 = in.m_73.z;
    float _1250 = _1238 * (-2.0);
    float _1252 = fma(_1234, _1024, _1024);
    float _1254 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1256 = _684 + (-0.5);
    float _1258 = _692 * _1208;
    float _1260 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1252);
    float _1262 = fma(_1250, _1026, _1026);
    float _1264 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1240);
    float _1266 = fma(_794, _1234, _794);
    float _1268 = fma(_1254, _1250, _1254);
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1262);
    float _1272 = _698 * _1208;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1276 = _1258 * _1274;
    float _1278 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1280 = _1264 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1282 = fma(_1266, _1184, _1260);
    float _1284 = fma(_1268, _1184, _1270);
    float _1286 = _982 * _1208;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1272 * _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1294 = -_1276;
    float _1296 = fma(_1272, _1292, _1294);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1300 = _1242 * _1298;
    float _1302 = trunc(_1278);
    int _1304 = int(_1302);
    float _1306 = _1212 * 0.15915493667125701904296875;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1310 = _1286 * _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1314 = -_1290;
    float _1316 = fma(_1286, _1312, _1314);
    float _1318 = _1296 * _1296;
    float _1320 = _1282 * 0.15915493667125701904296875;
    bool _1322 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1324 = trunc(_1280);
    int _1326 = int(_1324);
    bool _1328 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1332 = -_1310;
    float _1334 = fma(_1258, _1330, _1332);
    float _1336 = fma(_1316, _1316, _1318);
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1246);
    float _1340 = _1284 * 0.15915493667125701904296875;
    float _1342 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1344 = fma(_1334, _1334, _1336);
    float _1346 = _1306 * 6.283185482025146484375;
    float _1348 = sin(_1346);
    float _1350 = _1338 * _1342;
    bool _1352 = !_1322;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1244);
    int _1358 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1360 = _1304 + _1358;
    int _1362 = _1360 + 1;
    float _1364 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1366 = 2;
    int _1368 = _1362;
    if (!_1322)
    {
        _1366 = 1;
    }
    int _1370 = _1366;
    float _1372 = _1306 * 6.283185482025146484375;
    float _1374 = cos(_1372);
    int _1376 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1378 = _1326 + _1376;
    int _1380 = _1378 + 1;
    float _1382 = _1356 * _776;
    int _1384 = _1370;
    int _1386 = _1380;
    if (!_1328)
    {
        _1384 = _1354;
    }
    int _1388 = _1384;
    float _1390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1248);
    int _1392 = _1362 | _1380;
    bool _1394 = _1362 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1396 = _1320 * 6.283185482025146484375;
    float _1398 = sin(_1396);
    int _1400 = _1388 << 6;
    float _1402 = _1390 * _1364;
    bool _1404 = _1392 < 0;
    bool _1406 = _1404 || _1394;
    int _1408 = _1400 + 96;
    uint _1411 = uint(int(uint(_1408) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
    int _1419 = int(_1411) + 1;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    int _1423 = _1419 & 3;
    float _1425 = (*spvDescriptorSet0.vp_c15)._m0[int(_1421)][_1423];
    bool _1427 = _1380 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1429 = _1427 || _1406;
    float _1431 = _1320 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    int _1435 = _1400 + 48;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    int _1445 = int(_1437) + 1;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    int _1449 = _1445 & 3;
    float _1451 = (*spvDescriptorSet0.vp_c15)._m0[int(_1447)][_1449];
    float _1453 = _1340 * 6.283185482025146484375;
    float _1455 = cos(_1453);
    float _1457 = _1348 * _1398;
    float _1459 = _1374 * _1398;
    if (!_1429)
    {
        int _1461 = _1380 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1463 = _1461 + _1362;
        _1368 = _1463;
    }
    int _1465 = _1368;
    float _1467 = rsqrt(_1344);
    float _1469 = _1374 * _1433;
    float _1471 = _1348 * _1433;
    float _1473 = as_type<float>(_1465);
    if (!_1429)
    {
        int _1475 = _1465 << 2;
        _1386 = _1475;
    }
    int _1477 = _1386;
    int _1479 = 0;
    int _1481 = _1477;
    if (!_1429)
    {
        uint _1483 = uint(int(uint(_1465) >> uint(2)));
        _1479 = int(_1483);
    }
    int _1485 = _1479;
    int _1487 = _1485;
    if (!_1429)
    {
        int _1489 = 12 & _1477;
        _1481 = _1489;
    }
    int _1491 = _1481;
    float _1493 = _1340 * 6.283185482025146484375;
    float _1495 = sin(_1493);
    float _1497 = _1374 * _1455;
    float _1499 = _1348 * _1455;
    int _1501 = _1400 + 104;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c15)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
    float _1519 = _1433 * _1455;
    float _1521 = _1497 * _1350;
    float _1523 = _1398 * _1455;
    if (!_1429)
    {
        int _1525 = _1485 << 4;
        int _1527 = _1525 + _1491;
        _1487 = _1527;
    }
    int _1529 = _1487;
    float _1531 = _1316 * _1467;
    float _1533 = _1296 * _1467;
    float _1535 = _1334 * _1467;
    float _1537 = _1286 * _1531;
    float _1539 = _1272 * _1533;
    int _1541 = _1400 + 72;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.vp_c15)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
    float _1559 = fma(_1495, _1469, _1457);
    float _1561 = -_1459;
    float _1563 = fma(_1495, _1471, _1561);
    float _1565 = -_1471;
    float _1567 = fma(_1495, _1459, _1565);
    float _1569 = fma(_1495, _1457, _1469);
    float _1571 = -_1350;
    float _1573 = _1495 * _1571;
    float _1575 = fma(_1559, _1382, _1521);
    int _1577 = _1400 + 64;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    float _1595 = _1499 * _1350;
    float _1597 = fma(_1519, _1382, _1573);
    float _1599 = -_1537;
    float _1601 = fma(_1258, _1533, _1599);
    float _1603 = fma(_1567, _1402, _1575);
    float _1605 = fma(_1563, _1382, _1595);
    float _1607 = -_1539;
    float _1609 = fma(_1286, _1535, _1607);
    float _1611 = fma(_1523, _1402, _1597);
    float _1613 = _1601 * _1603;
    float _1615 = fma(_1569, _1402, _1605);
    float _1617 = _1609 * _1603;
    int _1619 = _1400 + 56;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    float _1637 = fma(_1535, _1611, _1613);
    float _1639 = _1136 * _1425;
    float _1641 = fma(_1531, _1611, _1617);
    float _1643 = _1136 * _1451;
    float _1645 = fma(_1272, _1615, _1637);
    float _1647 = fma(_640, _1417, _1639);
    float _1649 = fma(_1258, _1615, _1641);
    float _1651 = _1451;
    float _1653 = _1417;
    if (!_1429)
    {
        float _1655 = floor(_1278);
        _1651 = _1655;
    }
    float _1657 = _1651;
    float _1659 = _642 + _1645;
    float _1661 = fma(_640, _1443, _1643);
    int _1663 = _1400 + 80;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    float _1681 = _640 + _1649;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1685 = _1659 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1689 = _1681 + _1687;
    float _1691 = _1685 * _1685;
    float _1693 = fma(_642, _1509, _1647);
    float _1695 = fma(_1689, _1689, _1691);
    float _1697 = _1258 * _1535;
    float _1699 = _1693 + _1517;
    float _1701 = sqrt(_1695);
    float _1703 = -_1697;
    float _1705 = fma(_1272, _1531, _1703);
    float _1707 = _1705 * _1603;
    float _1709 = 1.0 / _1699;
    float _1711 = fma(_1533, _1611, _1707);
    float _1713 = _1136 * _1593;
    bool _1715 = _1701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = fma(_640, _1585, _1713);
    float _1719 = fma(_1286, _1615, _1711);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1727 = _1725 != 0;
    float _1729 = fma(_642, _1549, _1717);
    float _1731 = fma(_642, _1627, _1661);
    float _1733 = _1729 + _1557;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1741 = _1739 != 0;
    float _1743 = _954 + _1719;
    bool _1745 = !_1727;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = _1731 + _1635;
    bool _1751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    bool _1761 = !_1723;
    int _1763 = _1761 ? 0 : 1;
    bool _1765 = !_1737;
    int _1767 = _1765 ? 0 : 1;
    bool _1769 = !_1741;
    int _1771 = _1769 ? 0 : 1;
    float _1773 = _1719;
    float _1775 = _1717;
    float _1777 = _1689;
    float _1779 = _1661;
    if (!_1715)
    {
        _1773 = _1681;
    }
    float _1781 = _1773;
    float _1783 = _1781;
    if (!_1715)
    {
        _1653 = _1659;
    }
    float _1785 = _1653;
    float _1787 = _1785;
    if (!_1715)
    {
        _1775 = _1743;
    }
    float _1789 = _1775;
    bool _1791 = !_1715;
    float _1793 = _1789;
    float _1795 = _1679;
    if (!_1791)
    {
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1801 = _1701 + _1799;
        float _1803 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1805 = rsqrt(_1695);
        float _1807 = _1801 * _1797;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = _1813 + (-1.0);
        float _1821 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1823 = fma(_1817, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1825 = fma(_1743, _1813, _1821);
        float _1827 = _1805 * _1823;
        float _1829 = fma(_1689, _1827, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1831 = fma(_1685, _1827, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1787 = _1831;
        _1783 = _1829;
        _1793 = _1825;
    }
    float _1833 = _1787;
    float _1835 = _1783;
    float _1837 = _1793;
    float _1839 = _1749 * _1709;
    float _1841 = _1837;
    float _1843 = _1835;
    if (_1759)
    {
        _1777 = _1833;
    }
    float _1845 = _1777;
    float _1847 = _1845;
    if (!_1759)
    {
        float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1851 = _954 + _1849;
        float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1855 = _640 + _1853;
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1859 = -_640;
        float _1861 = _1859 + _1835;
        float _1863 = _1851 * _1851;
        float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1867 = _642 + _1865;
        float _1869 = -_642;
        float _1871 = _1869 + _1833;
        float _1873 = fma(_1855, _1855, _1863);
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1877 = fma(_1867, _1867, _1873);
        float _1879 = sqrt(_1877);
        float _1881 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1883 = precise::min(_1879, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1885 = _1883 * _1875;
        float _1887 = -_954;
        float _1889 = _1887 + _1837;
        float _1891 = _1881 * _1885;
        float _1893 = fma(_1889, _1891, _954);
        float _1895 = fma(_1861, _1891, _640);
        float _1897 = fma(_1871, _1891, _642);
        _1841 = _1893;
        _1843 = _1895;
        _1847 = _1897;
    }
    float _1899 = _1841;
    float _1901 = _1843;
    float _1903 = _1847;
    int _1905 = _1400 + 88;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    uint _1909 = uint(int(uint(int(_1907)) >> uint(2)));
    int _1911 = int(_1907) & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    int _1915 = int(_1907) + 1;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    int _1919 = _1915 & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    float _1923 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1925 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1927 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1929 = _1839 >= 0.0;
    float _1931 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1923);
    float _1933 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1925);
    float _1935 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    float _1937 = _1695;
    if (!_1429)
    {
        int _1939 = _1529 + 400;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
        int _1945 = int(_1941) & 3;
        float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
        _1937 = _1947;
    }
    float _1949 = _1937;
    float _1951 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1953 = _1733 * _1709;
    bool _1955 = _1839 <= 1.0;
    bool _1957 = _1955 && _1929;
    float _1959 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1933);
    float _1961 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    float _1963 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1965 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1967 = _1953 >= 0.0;
    bool _1969 = _1967 && _1957;
    float _1971 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1973 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1975 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1963);
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1979 = _1953 <= 1.0;
    bool _1981 = _1979 && _1969;
    float _1983 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1985 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1987 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1975);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1977);
    float _1991 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1993 = -_1985;
    float _1995 = fma(_1993, _1983, 1.0);
    float _1997 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1999 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _2001 = _1136 * _1679;
    float _2003 = _1989;
    if (!_1429)
    {
        float _2005 = floor(_1280);
        _1779 = _2005;
    }
    float _2007 = _1779;
    float _2009 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1991);
    float _2011 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1999);
    float _2013 = _2011;
    if (_1981)
    {
        float _2015 = float(_1388);
        _2003 = _2015;
    }
    float _2017 = _2003;
    float _2019 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2021 = fma(_640, _1671, _2001);
    if (!_1429)
    {
        float _2023 = -_1657;
        float _2025 = _1278 + _2023;
        _1795 = _2025;
    }
    float _2027 = _1795;
    float _2029 = log2(_1995);
    float _2031 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2019);
    float _2033 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2009);
    float _2035 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2031);
    float _2037 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2033);
    float _2039 = 1.0 / _2011;
    float _2041 = fma(_642, _1913, _2021);
    float _2043 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2035);
    float _2045 = _2041 + _1921;
    float _2047 = _2017;
    if (_1981)
    {
        float _2049 = rint(_2017);
        float _2051 = precise::max(_2049, 0.0);
        uint _2053 = uint(_2051);
        uint _2055 = clamp(_2053, 0u, 65535u);
        _2047 = as_type<float>(_2055);
    }
    float _2057 = _2047;
    float _2059 = _2029 * 0.693147182464599609375;
    float _2061 = _2045 * _1709;
    float _2063 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2065 = _2059;
    if (!_1429)
    {
        float _2067 = -_2007;
        float _2069 = _1280 + _2067;
        _2065 = _2069;
    }
    float _2071 = _2065;
    float _2073 = _2021;
    if (!_1429)
    {
        float _2075 = rint(_1949);
        float _2077 = precise::max(_2075, 0.0);
        uint _2079 = uint(_2077);
        uint _2081 = clamp(_2079, 0u, 65535u);
        _2073 = as_type<float>(_2081);
    }
    float _2083 = _2073;
    float _2085 = _2037 * _2039;
    float _2087 = _2043 * _2039;
    float _2089 = fma(_2085, 0.5, 0.5);
    float _2091 = fma(_2087, -0.5, 0.5);
    float _2093 = _2085;
    if (_1981)
    {
        float3 _8715 = float3(_1839, _1953, float(as_type<int>(_2057)));
        float3 _8719 = select(_8715, float3(0.0), isnan(_8715));
        float _2095 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8719.xy, uint(rint(_8719.z)), _2061, level(0.0));
        _2093 = _2095;
    }
    float _2097 = _2093;
    float3 _8729 = float3(_2089, _2091, _2063);
    float _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8729, float3(0.0), isnan(_8729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8729, float3(0.0), isnan(_8729)), level(0.0)).x;
    float3 _8738 = float3(_2089, _2091, _2063);
    float4 _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8738, float3(0.0), isnan(_8738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8738, float3(0.0), isnan(_8738)), level(0.0)).xyzw;
    float _2104 = _2102.x;
    float _2106 = _2102.y;
    float _2108 = _2102.z;
    float _2110 = _2102.w;
    float _2112 = _2071;
    if (!_1429)
    {
        float3 _8761 = float3(_2027, _2071, float(as_type<int>(_2083)));
        float3 _8763 = select(_8761, float3(0.0), isnan(_8761));
        float _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8763.xy, uint(rint(_8763.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8763.xy, uint(rint(_8763.z)), level(0.0)).x;
        _2112 = _2114;
    }
    float _2116 = _2112;
    float _2118 = float(uint(_702));
    float _2120 = trunc(_1076);
    int _2122 = int(_2120);
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2126 = _2124 != 0;
    float _2128 = _1156 * _848;
    int _2130 = abs(_986);
    int _2132 = abs(_1767);
    float _2134 = 1.0 / _2118;
    float _2136 = float(uint(_2122));
    float _2138 = trunc(_2128);
    int _2140 = int(_2138);
    int _2142 = as_type<int>(_2134) + (-2);
    float _2144 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2146 = int(_2144);
    float _2148 = as_type<float>(_2142) * _2136;
    float _2150 = trunc(_2148);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    int _2156 = ~_702;
    int _2158 = _2156 + 1;
    int _2160 = abs(_962);
    int _2162 = _2158 * int(_2154);
    int _2164 = _2162 + _2122;
    float _2166 = float(uint(_2164));
    int _2168 = ~_702;
    int _2170 = _2168 + 1;
    float _2172 = float(_2122);
    float _2174 = as_type<float>(_2142) * _2166;
    float _2176 = _2166;
    if (_2126)
    {
        _2176 = 1.0;
    }
    float _2178 = _2176;
    float _2180 = _2178;
    if (!_2126)
    {
        _2180 = 7.345489978790283203125;
    }
    float _2182 = _2180;
    bool _2184 = _2172 >= _1144;
    bool _2186 = isnan(_2172);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(_1144);
    bool _2192 = _2188 || _2190;
    float _2194 = float(_2192);
    float _2196 = trunc(_2174);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    int _2202 = ~_2146;
    int _2204 = _2202 + 1;
    float _2206 = _2182 * _670;
    float _2208 = floor(_2206);
    int _2210 = int(_2154) + int(_2200);
    float _2212 = trunc(_2194);
    int _2214 = int(_2212);
    int _2216 = _2170 * _2210;
    int _2218 = _2216 + _2122;
    float _2220 = -_2208;
    float _2222 = _2206 + _2220;
    int _2224 = _702 + (-1);
    bool _2226 = uint(_2218) >= uint(_702);
    float _2228 = _2222 * _1144;
    bool _2230 = !_2226;
    int _2232 = _2230 ? 0 : (-1);
    bool _2234 = _702 == 0;
    int _2236 = ~_2210;
    int _2238 = _2236 + _2232;
    int _2240 = _2238 + 1;
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2244 = _2242 != 0;
    float _2246 = in.m_63.w;
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2250 = _2248 != 0;
    int _2252 = _702 * _2240;
    int _2254 = _2252 + _2122;
    int _2256 = ~_2214;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2264 = _2262 != 0;
    bool _2266 = !_2234;
    int _2268 = _2266 ? _2254 : (-1);
    float _2270 = trunc(_2228);
    int _2272 = int(_2270);
    int _2274 = _2268 * _2260;
    bool _2276 = !_2244;
    int _2278 = _2276 ? 0 : 1;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2282 = _2280 != 0;
    int _2284 = _2214 * _2224;
    int _2286 = _2284 + _2274;
    int _2288 = abs(_2278);
    int _2290 = abs(_958);
    float _2292 = trunc(_882);
    int _2294 = int(_2292);
    bool _2296 = !_2282;
    int _2298 = _2296 ? 0 : 1;
    int _2300 = _2286 * _2290;
    int _2302 = _2272 * _2288;
    int _2304 = _2302 + _2122;
    int _2306 = abs(_2298);
    float _2308 = in.m_75.x;
    int _2310 = _2140 * _2160;
    int _2312 = _2310 + _2300;
    float _2314 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2316 = int(_2314);
    bool _2318 = _2282;
    if (_2250)
    {
        bool _2320 = _670 > 0.5;
        _2318 = _2320;
    }
    bool _2322 = _2318;
    int _2324 = _2304 * _2130;
    int _2326 = _2324 + _2312;
    int _2328 = _2272 * _2306;
    int _2330 = _2328 + _2326;
    float _2332 = float(uint(_2146));
    float _2334 = trunc(_1162);
    int _2336 = int(_2334);
    float _2338 = float(uint(_2294));
    float _2340 = float(uint(_2330));
    float _2342 = float(uint(_2316));
    float _2344 = 1.0 / _2332;
    float _2346 = as_type<float>(_2142) * _2340;
    int _2348 = ~_2146;
    int _2350 = _2348 + 1;
    float _2352 = as_type<float>(_2350);
    if (!_2250)
    {
        _750 = _2308;
    }
    float _2354 = _750;
    float _2356 = _2354;
    if (_2264)
    {
        float _2358 = -_2308;
        float _2360 = _2358 + 1.0;
        _1178 = as_type<int>(_2360);
    }
    int _2362 = _1178;
    float _2364 = trunc(_2346);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = float(uint(_2336));
    int _2372 = ~_702;
    int _2374 = _2372 + 1;
    int _2376 = as_type<int>(_2344) + (-2);
    float _2378 = 1.0 / _2342;
    float _2380 = as_type<float>(_2376) * _2370;
    int _2382 = _2374 * int(_2368);
    int _2384 = _2382 + _2330;
    float _2386 = trunc(_2380);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    int _2392 = _2374;
    int _2394 = int(_2368);
    if (_2250)
    {
        float _2396 = -_2308;
        float _2398 = _2396 + 1.0;
        _2392 = as_type<int>(_2398);
    }
    int _2400 = _2392;
    float _2402 = float(uint(_2384));
    float _2404 = _2402;
    if (_2250)
    {
        float _2406 = _2322 ? as_type<float>(_2400) : _2308;
        _2356 = _2406;
    }
    float _2408 = _2356;
    int _2410 = as_type<int>(_2378) + (-2);
    float _2412 = as_type<float>(_2142) * _2402;
    bool _2414 = _684 > 0.5;
    float _2416 = as_type<float>(_2410) * _2338;
    float _2418 = trunc(_2412);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2426 = _2424 != 0;
    int _2428 = _2350 * int(_2390);
    int _2430 = _2428 + _2336;
    float _2432 = as_type<float>(_2350);
    if (_2126)
    {
        _2404 = _670;
    }
    float _2434 = _2404;
    float _2436 = _2434;
    if (_2126)
    {
        _2432 = 1.0;
    }
    float _2438 = _2432;
    float _2440 = float(uint(_2430));
    float _2442 = trunc(_2416);
    float _2444 = precise::max(_2442, 0.0);
    uint _2446 = uint(_2444);
    float _2448 = _2438;
    if (!_2264)
    {
        _2352 = _2308;
    }
    float _2450 = _2352;
    float _2452 = _2450;
    if (!_2126)
    {
        _2436 = _680;
    }
    float _2454 = _2436;
    float _2456 = as_type<float>(_2376) * _2440;
    if (!_2126)
    {
        _2448 = 1.2345600128173828125;
    }
    float _2458 = _2448;
    if (_2264)
    {
        float _2460 = _2414 ? as_type<float>(_2362) : _2308;
        _2452 = _2460;
    }
    float _2462 = _2452;
    int _2464 = ~_2316;
    int _2466 = _2464 + 1;
    float _2468 = _2454 * _2458;
    int _2470 = int(_2368) + int(_2422);
    if (_2426)
    {
        float _2472 = -_2308;
        float _2474 = _2472 + 1.0;
        _2394 = as_type<int>(_2474);
    }
    int _2476 = _2394;
    float _2478 = floor(_2468);
    bool _2480 = _680 > 0.5;
    float _2482 = as_type<float>(_2476);
    if (!_2426)
    {
        _752 = _2308;
    }
    float _2484 = _752;
    int _2486 = _2466 * int(_2446);
    int _2488 = _2486 + _2294;
    int _2490 = ~_702;
    int _2492 = _2490 + 1;
    float _2494 = _2484;
    if (_2426)
    {
        float _2496 = _2480 ? as_type<float>(_2476) : _2308;
        _2494 = _2496;
    }
    float _2498 = _2494;
    float _2500 = trunc(_2456);
    float _2502 = precise::max(_2500, 0.0);
    uint _2504 = uint(_2502);
    float _2506 = float(uint(_2488));
    int _2508 = _2492 * _2470;
    int _2510 = _2508 + _2330;
    if (_2126)
    {
        _2482 = 1.0;
    }
    float _2512 = _2482;
    float _2514 = _2512;
    if (!_2126)
    {
        _754 = _684;
    }
    float _2516 = _754;
    float _2518 = as_type<float>(_2410) * _2506;
    float _2520 = float(_2146);
    float _2522 = in.m_75.y;
    bool _2524 = uint(_2510) >= uint(_702);
    float _2526 = trunc(_2518);
    float _2528 = precise::max(_2526, 0.0);
    uint _2530 = uint(_2528);
    if (!_2126)
    {
        _2514 = 5.839270114898681640625;
    }
    float _2532 = _2514;
    bool _2534 = !_2524;
    int _2536 = _2534 ? 0 : (-1);
    int _2538 = int(_2390) + int(_2504);
    float _2540 = _2516 * _2532;
    float _2542 = float(_2336);
    float _2544 = -_2478;
    float _2546 = _2468 + _2544;
    bool _2548 = _2246 > 0.5;
    int _2550 = _2204 * _2538;
    int _2552 = _2550 + _2336;
    bool _2554 = _2542 >= _2520;
    bool _2556 = isnan(_2542);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(_2520);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = _2520 * _2546;
    int _2568 = ~_2316;
    int _2570 = _2568 + 1;
    float _2572 = floor(_2540);
    bool _2574 = uint(_2552) >= uint(_2146);
    int _2576 = int(_2446) + int(_2530);
    float _2578 = _2520 * _912;
    bool _2580 = !_2574;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = -_2522;
    float _2586 = _2584 + 1.0;
    float _2588 = trunc(_2564);
    int _2590 = int(_2588);
    int _2592 = ~_2538;
    int _2594 = _2592 + _2582;
    int _2596 = _2594 + 1;
    int _2598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2600 = _2598 != 0;
    int _2602 = _2146 * _2596;
    int _2604 = _2602 + _2336;
    int _2606 = _2480 ? as_type<int>(_2586) : as_type<int>(_2522);
    int _2608 = _2570 * _2576;
    int _2610 = _2608 + _2294;
    bool _2612 = _2146 == 0;
    float _2614 = trunc(_2578);
    int _2616 = int(_2614);
    float _2618 = _2600 ? as_type<float>(_2606) : _2522;
    float _2620 = -_2572;
    float _2622 = _2540 + _2620;
    int _2624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2626 = _2624 != 0;
    bool _2628 = !_2612;
    int _2630 = _2628 ? _2604 : (-1);
    int _2632 = ~_2590;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    int _2638 = _2548 ? as_type<int>(_2586) : as_type<int>(_2522);
    bool _2640 = !_2626;
    int _2642 = _2640 ? 0 : 1;
    bool _2644 = uint(_2610) >= uint(_2316);
    int _2646 = _2636 * _2630;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2650 = _2648 != 0;
    float _2652 = trunc(_2566);
    int _2654 = int(_2652);
    int _2656 = _2146 + (-1);
    bool _2658 = !_2644;
    int _2660 = _2658 ? 0 : (-1);
    bool _2662 = !_2650;
    int _2664 = _2662 ? 0 : 1;
    int _2666 = _2590 * _2656;
    int _2668 = _2666 + _2646;
    int _2670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2672 = _2670 != 0;
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2676 = _2674 != 0;
    float _2678 = float(_2316);
    float _2680 = float(_2294);
    int _2682 = abs(_1747);
    int _2684 = abs(_2642);
    int _2686 = abs(_1763);
    int _2688 = _2668 * _2682;
    bool _2690 = _2680 >= _2678;
    bool _2692 = isnan(_2680);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan(_2678);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    int _2702 = _2654 * _2684;
    int _2704 = _2702 + _2336;
    float _2706 = _2678 * _2622;
    int _2708 = abs(_1771);
    float _2710 = _2678 * _912;
    float _2712 = trunc(_2700);
    int _2714 = int(_2712);
    int _2716 = _2616 * _2686;
    int _2718 = _2716 + _2688;
    int _2720 = ~_2576;
    int _2722 = _2720 + _2660;
    int _2724 = _2722 + 1;
    int _2726 = _2704 * _2132;
    int _2728 = _2726 + _2718;
    bool _2730 = !_2672;
    int _2732 = _2730 ? 0 : 1;
    int _2734 = _2316 * _2724;
    int _2736 = _2734 + _2294;
    bool _2738 = _2316 == 0;
    int _2740 = _2654 * _2708;
    int _2742 = _2740 + _2728;
    float _2744 = trunc(_2706);
    int _2746 = int(_2744);
    int _2748 = abs(_2664);
    bool _2750 = !_2738;
    int _2752 = _2750 ? _2736 : (-1);
    float _2754 = float(uint(_2742));
    int _2756 = ~_2714;
    int _2758 = _2756 + 1;
    int _2760 = _2758 + 1;
    float _2762 = trunc(_2710);
    int _2764 = int(_2762);
    int _2766 = _2316 + (-1);
    int _2768 = ~_2470;
    int _2770 = _2768 + _2536;
    int _2772 = _2770 + 1;
    int _2774 = _2760 * _2752;
    int _2776 = abs(_992);
    float _2778 = as_type<float>(_2376) * _2754;
    int _2780 = _2714 * _2766;
    int _2782 = _2780 + _2774;
    int _2784 = abs(_998);
    int _2786 = _2746 * _2748;
    int _2788 = _2786 + _2294;
    int _2790 = _702 * _2772;
    int _2792 = _2790 + _2330;
    float _2794 = trunc(_2778);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = abs(_2732);
    int _2802 = _2782 * _2776;
    float _2804 = float(uint(_2304));
    bool _2806 = !_2676;
    int _2808 = _2806 ? 0 : 1;
    int _2810 = _2764 * _2784;
    int _2812 = _2810 + _2802;
    int _2814 = ~_2146;
    int _2816 = _2814 + 1;
    float _2818 = as_type<float>(_2142) * _2804;
    int _2820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2822 = _2820 != 0;
    int _2824 = _2788 * _2800;
    int _2826 = _2824 + _2812;
    int _2828 = abs(_2808);
    float _2830 = _2822 ? as_type<float>(_2638) : _2522;
    float _2832 = trunc(_2818);
    float _2834 = precise::max(_2832, 0.0);
    uint _2836 = uint(_2834);
    int _2838 = _2816 * int(_2798);
    int _2840 = _2838 + _2742;
    int _2842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2844 = _2842 != 0;
    float _2846 = float(uint(_2840));
    int _2848 = _2746 * _2828;
    int _2850 = _2848 + _2826;
    int _2852 = ~_702;
    int _2854 = _2852 + 1;
    bool _2856 = !_2234;
    int _2858 = _2856 ? _2792 : (-1);
    float _2860 = as_type<float>(_2376) * _2846;
    float _2862 = float(uint(_2850));
    float _2864 = trunc(_2860);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    int _2870 = ~_2316;
    int _2872 = _2870 + 1;
    int _2874 = _2854 * int(_2836);
    int _2876 = _2874 + _2304;
    float _2878 = _2522;
    float _2880 = as_type<float>(_2682);
    if (_2844)
    {
        float _2882 = _2414 ? _2586 : _2522;
        _2878 = _2882;
    }
    float _2884 = _2878;
    float _2886 = as_type<float>(_2410) * _2862;
    int _2888 = _2858 & 3;
    bool _2890 = _2888 != 0;
    int _2892 = _2858 & 3;
    bool _2894 = _2892 != 0;
    float _2896 = trunc(_2886);
    float _2898 = precise::max(_2896, 0.0);
    uint _2900 = uint(_2898);
    float _2902 = float(uint(_2876));
    int _2904 = _2890 ? 0 : 1;
    bool _2906 = uint(_2892) > 1u;
    float _2908 = as_type<float>(_2142) * _2902;
    float _2910 = float(uint(_2704));
    int _2912 = ~_2904;
    int _2914 = _2912 + 1;
    int _2916 = _2914 + 1;
    int _2918 = int(_2798) + int(_2868);
    float _2920 = trunc(_2908);
    float _2922 = precise::max(_2920, 0.0);
    uint _2924 = uint(_2922);
    float _2926 = as_type<float>(_2376) * _2910;
    int _2928 = ~_2146;
    int _2930 = _2928 + 1;
    int _2932 = _2872 * int(_2900);
    int _2934 = _2932 + _2850;
    int _2936 = ~_2146;
    int _2938 = _2936 + 1;
    int _2940 = _2916;
    float _2942 = as_type<float>(_2918);
    if (!_2906)
    {
        int _2944 = ~_2904;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = trunc(_2926);
    float _2952 = precise::max(_2950, 0.0);
    uint _2954 = uint(_2952);
    bool _2956 = uint(_2892) >= 2u;
    float _2958 = float(uint(_2934));
    int _2960 = _2956 ? 0 : 1;
    bool _2962 = _2892 != 3;
    float _2964 = as_type<float>(_2410) * _2958;
    int _2966 = int(_2836) + int(_2924);
    int _2968 = _2938 * _2918;
    int _2970 = _2968 + _2742;
    float _2972 = trunc(_2964);
    float _2974 = precise::max(_2972, 0.0);
    uint _2976 = uint(_2974);
    int _2978 = ~_2960;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    int _2984 = ~_702;
    int _2986 = _2984 + 1;
    int _2988 = _2930 * int(_2954);
    int _2990 = _2988 + _2704;
    int _2992 = _2982;
    if (_2962)
    {
        int _2994 = ~_2960;
        int _2996 = _2994 + 1;
        _2992 = _2996;
    }
    int _2998 = _2992;
    bool _3000 = uint(_2970) >= uint(_2146);
    int _3002 = _2986 * _2966;
    int _3004 = _3002 + _2304;
    float _3006 = float(uint(_2990));
    bool _3008 = !_3000;
    int _3010 = _3008 ? 0 : (-1);
    bool _3012 = uint(_3004) >= uint(_702);
    float _3014 = as_type<float>(_2376) * _3006;
    int _3016 = ~_2918;
    int _3018 = _3016 + _3010;
    int _3020 = _3018 + 1;
    int _3022 = int(_2900) + int(_2976);
    if (_1429)
    {
        _2942 = 1.0;
    }
    float _3024 = _2942;
    int _3026 = _2146 * _3020;
    int _3028 = _3026 + _2742;
    float _3030 = _3024;
    if (!_1429)
    {
        int _3032 = _1465 << 4;
        int _3034 = _3032 + 2048;
        uint _3036 = uint(int(uint(_3034) >> uint(2)));
        uint _3038 = uint(int(uint(int(_3036)) >> uint(2)));
        int _3040 = int(_3036) & 3;
        float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
        int _3044 = int(_3036) + 1;
        uint _3046 = uint(int(uint(_3044) >> uint(2)));
        int _3048 = _3044 & 3;
        float _3050 = (*spvDescriptorSet0.vp_c15)._m0[int(_3046)][_3048];
        int _3052 = _3034 + 8;
        uint _3054 = uint(int(uint(_3052) >> uint(2)));
        uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
        int _3058 = int(_3054) & 3;
        float _3060 = (*spvDescriptorSet0.vp_c15)._m0[int(_3056)][_3058];
        int _3062 = int(_3054) + 1;
        uint _3064 = uint(int(uint(_3062) >> uint(2)));
        int _3066 = _3062 & 3;
        float _3068 = (*spvDescriptorSet0.vp_c15)._m0[int(_3064)][_3066];
        float _3070 = _1136 * _3050;
        float _3072 = fma(_640, _3042, _3070);
        float _3074 = fma(_642, _3060, _3072);
        float _3076 = _3074 + _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = -_3078;
        float _3082 = _3080 + _2116;
        float _3084 = fma(_3082, 500.0, 1.5);
        float _3086 = exp2(_3084);
        float _3088 = 0.0 + _3086;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        _1180 = _3070;
        _1473 = as_type<float>(_3034);
        _3030 = _3090;
    }
    float _3092 = _1180;
    float _3094 = _1473;
    float _3096 = _3030;
    float _3098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3100 = _1899 + _3098;
    float _3102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3104 = _1901 + _3102;
    float _3106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3108 = _1903 + _3106;
    bool _3110 = !_2612;
    int _3112 = _3110 ? _3028 : (-1);
    float _3114 = _3100 * _3100;
    bool _3116 = !_3012;
    int _3118 = _3116 ? 0 : (-1);
    float _3120 = fma(_3104, _3104, _3114);
    float _3122 = fma(_3108, _3108, _3120);
    float _3124 = rsqrt(_3122);
    float _3126 = sqrt(_3122);
    float _3128 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3130 = _3104 * _3128;
    float _3132 = _3108 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 * _3132;
    float _3138 = _3134 + _3136;
    float _3140 = sqrt(_3138);
    bool _3142 = _3140 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3146 = _3140 + _3144;
    float _3148 = _3124;
    float _3150 = _3092;
    float _3152 = _3146;
    float _3154 = _3100;
    float _3156 = _3094;
    if (_3142)
    {
        float _3158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3158;
    }
    float _3160 = _3148;
    if (_3142)
    {
        float _3162 = rsqrt(_3138);
        _3150 = _3162;
    }
    float _3164 = _3150;
    float _3166 = _3164;
    if (_3142)
    {
        float _3168 = _3146 * _3160;
        _3152 = _3168;
    }
    float _3170 = _3152;
    bool _3172 = !_2894;
    int _3174 = _3172 ? 0 : 1;
    if (_3142)
    {
        float _3176 = _3170 * 0.15915493667125701904296875;
        _756 = _3176;
    }
    float _3178 = _756;
    float _3180 = _3108;
    if (_3142)
    {
        float _3182 = _3178 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        _3180 = _3184;
    }
    float _3186 = _3180;
    float _3188 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3190 = precise::max(0.0, _3188);
    float _3192 = _3160;
    float _3194 = _3190;
    if (_3142)
    {
        float _3196 = _3178 * 6.283185482025146484375;
        float _3198 = cos(_3196);
        _3192 = _3198;
    }
    float _3200 = _3192;
    float _3202 = -_3128;
    float _3204 = -_3190;
    float _3206 = fma(_3100, _3202, _3204);
    if (_3142)
    {
        float _3208 = _3206 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3154 = _3208;
    }
    float _3210 = _3154;
    float _3212 = _3210;
    float _3214 = _3186;
    if (_3142)
    {
        float _3216 = fma(_3186, _3210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3212 = _3216;
    }
    float _3218 = _3212;
    float _3220 = _3218;
    if (!_3142)
    {
        _3214 = _3130;
    }
    float _3222 = _3214;
    float _3224 = _3222;
    float _3226 = _3200;
    if (_3142)
    {
        float _3228 = _3200 + (-1.0);
        _3194 = _3228;
    }
    float _3230 = _3194;
    float _3232 = _3230;
    if (_3142)
    {
        float _3234 = _3164 * _3218;
        _2880 = _3234;
    }
    float _3236 = _2880;
    if (!_3142)
    {
        _3220 = _3206;
    }
    float _3238 = _3220;
    float _3240 = _3238;
    if (_3142)
    {
        float _3242 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3156 = _3242;
    }
    float _3244 = _3156;
    if (_3142)
    {
        float _3246 = _3130 * _3236;
        _3224 = _3246;
    }
    float _3248 = _3224;
    if (!_3142)
    {
        _3232 = _3132;
    }
    float _3250 = _3232;
    float _3252 = _3250;
    if (_3142)
    {
        float _3254 = _3132 * _3236;
        _3252 = _3254;
    }
    float _3256 = _3252;
    if (!_3142)
    {
        _3166 = _3134;
    }
    float _3258 = _3166;
    float _3260 = _3258;
    if (_3142)
    {
        float _3262 = fma(_3206, _3200, _3244);
        _3240 = _3262;
    }
    float _3264 = _3240;
    if (_3142)
    {
        float _3266 = _3248 * _3248;
        _3260 = _3266;
    }
    float _3268 = _3260;
    if (!_3142)
    {
        _3226 = _3136;
    }
    float _3270 = _3226;
    float _3272 = _3270;
    if (_3142)
    {
        float _3274 = _3256 * _3256;
        _3272 = _3274;
    }
    float _3276 = _3272;
    float _3278 = fma(_3264, _3264, _3268);
    int _3280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3282 = _3280 != 0;
    float _3284 = _3278 + _3276;
    float _3286 = rsqrt(_3284);
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3290 = fma(_3126, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3288);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = -_3292;
    float _3296 = _3294 + 1.0;
    float _3298 = abs(_3296);
    float _3300 = log2(_3298);
    float _3302 = _3286 * _3248;
    float _3304 = _3286 * _3264;
    float _3306 = _3286 * _3256;
    float _3308 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3310 = -_3308;
    float _3312 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3310);
    float _3314 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = -_3306;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3312);
    float _3320 = exp2(_3314);
    float _3322 = fma(_3318, -0.5, 0.5);
    float _3324 = fma(_3318, 0.5, 0.5);
    float _3326 = fma(_3324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3328 = sqrt(_3322);
    float _3330 = fma(_3324, _3326, -0.212114393711090087890625);
    float _3332 = fma(_3324, _3330, 1.570728778839111328125);
    float _3334 = _3304 + 1.0;
    float _3336 = -_3304;
    float _3338 = fma(_3320, _3334, _3336);
    int _3340 = _3112 & 3;
    bool _3342 = _3340 != 0;
    float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3346 = _3344 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3348 = !_3282;
    int _3350 = _3348 ? 0 : 1;
    float _3352 = fma(_3338, 0.5, 0.5);
    float _3354 = _3328 * 0.636619746685028076171875;
    int _3356 = ~_2316;
    int _3358 = _3356 + 1;
    bool _3360 = _3340 != 3;
    float _3362 = -_3332;
    float _3364 = fma(_3354, _3362, 1.0);
    bool _3366 = uint(_3340) >= 2u;
    int _3368 = _3358 * _3022;
    int _3370 = _3368 + _2850;
    float _3372 = 1.0 / _3346;
    int _3374 = _3366 ? 0 : 1;
    float2 _10534 = float2(_3364, _3352);
    float3 _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10534, float2(0.0), isnan(_10534)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10534, float2(0.0), isnan(_10534)), level(0.0)).xyz;
    float _3380 = _3378.x;
    float _3382 = _3378.y;
    float _3384 = _3378.z;
    bool _3386 = uint(_3370) >= uint(_2316);
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3392 = _3342 ? 0 : 1;
    float _3394 = trunc(_3014);
    float _3396 = precise::max(_3394, 0.0);
    uint _3398 = uint(_3396);
    bool _3400 = _2892 != 3;
    float _3402 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3404 = _620 + _3402;
    int _3406 = ~_3374;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3414 = _620 + _3412;
    int _3416 = _3410;
    if (_3360)
    {
        int _3418 = ~_3374;
        int _3420 = _3418 + 1;
        _3416 = _3420;
    }
    int _3422 = _3416;
    float _3424 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3426 = !_3400;
    int _3428 = _3426 ? 0 : (-1);
    float _3430 = 1.0 / _3390;
    bool _3432 = _3340 != 3;
    float _3434 = -_660;
    float _3436 = _3434 + 1.0;
    bool _3438 = uint(_3340) > 1u;
    out.m_77.x = _1901;
    out.m_77.y = _1899;
    out.m_77.z = _1903;
    bool _3440 = !_3432;
    int _3442 = _3440 ? 0 : (-1);
    bool _3444 = !_3386;
    int _3446 = _3444 ? 0 : (-1);
    float _3448 = exp2(_3424);
    int _3450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3452 = _3450 != 0;
    int _3454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3456 = _3454 != 0;
    float _3458 = float(uint(_2788));
    int _3460 = int(_2954) + int(_3398);
    int _3462 = ~_2146;
    int _3464 = _3462 + 1;
    float _3466 = as_type<float>(_2410) * _3458;
    int _3468 = ~_3022;
    int _3470 = _3468 + _3446;
    int _3472 = _3470 + 1;
    int _3474 = ~_3392;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    int _3480 = _3464 * _3460;
    int _3482 = _3480 + _2704;
    int _3484 = _3478;
    if (!_3438)
    {
        int _3486 = ~_3392;
        int _3488 = _3486 + 1;
        _3484 = _3488;
    }
    int _3490 = _3484;
    int _3492 = _2316 * _3472;
    int _3494 = _3492 + _2850;
    int _3496 = _3112 & 3;
    bool _3498 = _3496 != 0;
    float _3500 = trunc(_3466);
    float _3502 = precise::max(_3500, 0.0);
    uint _3504 = uint(_3502);
    float _3506 = -_3448;
    float _3508 = _3506 + 1.0;
    bool _3510 = !_3498;
    int _3512 = _3510 ? 0 : 1;
    bool _3514 = uint(_3482) >= uint(_2146);
    float _3516 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3518 = _3516 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3520 = !_2738;
    int _3522 = _3520 ? _3494 : (-1);
    float _3524 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3526 = !_3514;
    int _3528 = _3526 ? 0 : (-1);
    int _3530 = _3522 & 3;
    bool _3532 = _3530 != 0;
    float _3534 = 1.0 / _3518;
    int _3536 = ~_2316;
    int _3538 = _3536 + 1;
    float _3540 = _3524 * _2099;
    int _3542 = _3532 ? 0 : 1;
    bool _3544 = uint(_3530) >= 2u;
    int _3546 = _3538 * int(_3504);
    int _3548 = _3546 + _2788;
    int _3550 = _3544 ? 0 : 1;
    float _3552 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3554 = _3552 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3556 = _3530 != 3;
    float _3558 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3560 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3558;
    float _3562 = _3560 * _3372;
    float _3564 = float(uint(_3548));
    float _3566 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3568 = _3566 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3570 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3572 = _3570 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3574 = 1.0 / _3554;
    float _3576 = as_type<float>(_2410) * _3564;
    float _3578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3580 = _3578 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3582 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3584 = _620 + _3582;
    float _3586 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3588 = _3586 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _3590 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3592 = isnan(_620);
    bool _3594 = _3590 || _3592;
    bool _3596 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3598 = _3594 || _3596;
    float _3600 = float(_3598);
    float _3602 = 1.0 / _3568;
    float _3604 = _3588 * _3534;
    bool _3606 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3608 = isnan(_620);
    bool _3610 = _3606 || _3608;
    bool _3612 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3614 = _3610 || _3612;
    float _3616 = float(_3614);
    float _3618 = -_3600;
    float _3620 = _3618 + 1.0;
    int _3622 = ~_2966;
    int _3624 = _3622 + _3118;
    int _3626 = _3624 + 1;
    float _3628 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3630 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3628;
    float _3632 = fma(_3604, _3404, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3634 = trunc(_3576);
    float _3636 = precise::max(_3634, 0.0);
    uint _3638 = uint(_3636);
    float _3640 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3642 = _3640 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3644 = ~_3550;
    int _3646 = _3644 + 1;
    int _3648 = _3646 + 1;
    float _3650 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3652 = _620 + _3650;
    int _3654 = _3648;
    if (_3556)
    {
        int _3656 = ~_3550;
        int _3658 = _3656 + 1;
        _3654 = _3658;
    }
    int _3660 = _3654;
    float _3662 = _3642 * _3430;
    bool _3664 = _3530 != 3;
    float _3666 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3668 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3666;
    float _3670 = 1.0 / _3580;
    float _3672 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3674 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3672;
    bool _3676 = !_3664;
    int _3678 = _3676 ? 0 : (-1);
    float _3680 = _3668 * _3574;
    bool _3682 = uint(_3530) > 1u;
    float _3684 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3686 = _620 + _3684;
    float _3688 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3690 = _3688 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3692 = _3674 * _3602;
    int _3694 = int(_3504) + int(_3638);
    float _3696 = fma(_3562, _3686, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3698 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3700 = isnan(_620);
    bool _3702 = _3698 || _3700;
    bool _3704 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3706 = _3702 || _3704;
    float _3708 = float(_3706);
    float _3710 = 1.0 / _3572;
    int _3712 = ~_3542;
    int _3714 = _3712 + 1;
    int _3716 = _3714 + 1;
    float _3718 = fma(_3662, _3584, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3720 = ~_2316;
    int _3722 = _3720 + 1;
    float _3724 = _3708 * _3620;
    float _3726 = _3690 * _3670;
    int _3728 = _3716;
    float _3730 = _3726;
    float _3732 = _3692;
    float _3734 = _3718;
    if (!_3682)
    {
        int _3736 = ~_3542;
        int _3738 = _3736 + 1;
        _3728 = _3738;
    }
    int _3740 = _3728;
    float _3742 = -_3708;
    float _3744 = _3742 + 1.0;
    bool _3746 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3748 = isnan(_620);
    bool _3750 = _3746 || _3748;
    bool _3752 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3754 = _3750 || _3752;
    float _3756 = float(_3754);
    int _3758 = _3722 * _3694;
    int _3760 = _3758 + _2788;
    bool _3762 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3764 = isnan(_620);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3770 = _3766 || _3768;
    float _3772 = float(_3770);
    int _3774 = _702 * _3626;
    int _3776 = _3774 + _2304;
    bool _3778 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3780 = isnan(_620);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3786 = _3782 || _3784;
    float _3788 = float(_3786);
    float _3790 = -_3756;
    float _3792 = _3790 + 1.0;
    float _3794 = _3756 * _3744;
    bool _3796 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3798 = isnan(_620);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3804 = _3800 || _3802;
    float _3806 = float(_3804);
    float _3808 = -_3772;
    float _3810 = _3808 + 1.0;
    float _3812 = _3772 * _3792;
    int _3814 = _3522 & 3;
    bool _3816 = _3814 != 0;
    float _3818 = -_3788;
    float _3820 = _3818 + 1.0;
    bool _3822 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3824 = isnan(_620);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3830 = _3826 || _3828;
    float _3832 = float(_3830);
    float _3834 = _3806 * _3810;
    float _3836 = -_3806;
    float _3838 = _3836 + 1.0;
    float _3840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3842 = _620 + _3840;
    bool _3844 = !_3816;
    int _3846 = _3844 ? 0 : 1;
    float _3848 = -_3832;
    float _3850 = _3848 + 1.0;
    bool _3852 = uint(_3760) >= uint(_2316);
    float _3854 = _3630 * _3710;
    float _3856 = _3788 * _3838;
    float _3858 = in.m_79.x;
    float _3860 = in.m_79.y;
    float _3862 = in.m_79.z;
    float _3864 = fma(_3680, _3842, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3866 = _3832 * _3820;
    bool _3868 = !_3852;
    int _3870 = _3868 ? 0 : (-1);
    float _3872 = in.m_81.x;
    float _3874 = in.m_81.y;
    float _3876 = in.m_81.z;
    float _3878 = in.m_81.w;
    float _3880 = _3616 * _3850;
    bool _3882 = _1246 != 0.0;
    bool _3884 = isnan(_1246);
    bool _3886 = _3882 || _3884;
    bool _3888 = isnan(0.0);
    bool _3890 = _3886 || _3888;
    float _3892 = -_3616;
    float _3894 = _3892 + 1.0;
    float _3896 = fma(_3692, _3414, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3898 = _3696 * _3880;
    bool _3900 = _1244 == 0.0;
    bool _3902 = !_3890;
    bool _3904 = _3900 && _3902;
    float _3906 = fma(_3726, _3652, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3908 = ~_3694;
    int _3910 = _3908 + _3870;
    int _3912 = _3910 + 1;
    float _3914 = fma(_3894, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3898);
    bool _3916 = _1248 == 0.0;
    bool _3918 = _3916 && _3904;
    float _3920 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3922 = _620 + _3920;
    int _3924 = ~_3460;
    int _3926 = _3924 + _3528;
    int _3928 = _3926 + 1;
    float _3930 = abs(_1300);
    float _3932 = log2(_3930);
    float _3934 = fma(_3718, _3866, _3914);
    float _3936 = fma(_3854, _3922, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3938 = _2316 * _3912;
    int _3940 = _3938 + _2788;
    int _3942 = abs(_3512);
    float _3944 = fma(_3864, _3856, _3934);
    int _3946 = _2146 * _3928;
    int _3948 = _3946 + _2704;
    int _3950 = abs(_2948);
    float _3952 = fma(_3632, _3834, _3944);
    if (_3918)
    {
        _3730 = _3860;
    }
    float _3954 = _3730;
    float _3956 = _3954;
    if (!_3918)
    {
        float _3958 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3860);
        _3956 = _3958;
    }
    float _3960 = _3956;
    float _3962 = _3874 * _3862;
    if (_3918)
    {
        _3732 = _3858;
    }
    float _3964 = _3732;
    float _3966 = _3964;
    if (!_3918)
    {
        float _3968 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3858);
        _3966 = _3968;
    }
    float _3970 = _3966;
    if (_3918)
    {
        _3734 = _3862;
    }
    float _3972 = _3734;
    float _3974 = _3876 * _3858;
    float _3976 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3978 = _3972;
    if (!_3918)
    {
        float _3980 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3862);
        _3978 = _3980;
    }
    float _3982 = _3978;
    float _3984 = _3872 * _3860;
    float _3986 = fma(_3896, _3812, _3952);
    float _3988 = -_3962;
    float _3990 = fma(_3876, _3860, _3988);
    float _3992 = -_3974;
    float _3994 = fma(_3872, _3862, _3992);
    float _3996 = -_3984;
    float _3998 = fma(_3874, _3858, _3996);
    float _4000 = fma(_3906, _3794, _3986);
    float _4002 = _3990 * _3878;
    float _4004 = exp2(_3976);
    int _4006 = _3522 >> 31;
    float _4008 = _3994 * _3878;
    float _4010 = _3998 * _3878;
    int _4012 = _2858 >> 31;
    float _4014 = fma(_3936, _3724, _4000);
    int _4016 = _4006 & 3;
    float _4018 = _1559 * _1601;
    int _4020 = _4012 & 3;
    float _4022 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4014);
    int _4024 = _3522 + _4016;
    float _4026 = _1559 * _1705;
    float _4028 = _1497 * _1705;
    int _4030 = _2858 + _4020;
    float _4032 = _1497 * _1601;
    int _4034 = _4024 >> 2;
    float _4036 = fma(_4004, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4038 = precise::clamp(_4036, 0.0, 1.0);
    float _4040 = _1567 * _1609;
    int _4042 = _3112 >> 31;
    float _4044 = _4038 * _4038;
    int _4046 = _4034 << 4;
    int _4048 = _4046 + 656;
    float _4050 = fma(_4038, -2.0, 3.0);
    int _4052 = _4030 >> 2;
    float _4054 = fma(_1519, _1533, _4026);
    int _4056 = _4042 & 3;
    uint _4058 = uint(int(uint(_4048) >> uint(2)));
    uint _4060 = uint(int(uint(int(_4058)) >> uint(2)));
    int _4062 = int(_4058) & 3;
    float _4064 = (*spvDescriptorSet0.vp_c9)._m0[int(_4060)][_4062];
    int _4066 = int(_4058) + 1;
    uint _4068 = uint(int(uint(_4066) >> uint(2)));
    int _4070 = _4066 & 3;
    float _4072 = (*spvDescriptorSet0.vp_c9)._m0[int(_4068)][_4070];
    int _4074 = _4052 << 4;
    int _4076 = _4074 + 368;
    float _4078 = _4044 * _4050;
    int _4080 = _3112 + _4056;
    float _4082 = _1559 * _1609;
    float _4084 = _1497 * _1609;
    float _4086 = _1567 * _1705;
    int _4088 = _4080 >> 2;
    uint _4090 = uint(int(uint(_4076) >> uint(2)));
    uint _4092 = uint(int(uint(int(_4090)) >> uint(2)));
    int _4094 = int(_4090) & 3;
    float _4096 = (*spvDescriptorSet0.vp_c9)._m0[int(_4092)][_4094];
    int _4098 = int(_4090) + 1;
    uint _4100 = uint(int(uint(_4098) >> uint(2)));
    int _4102 = _4098 & 3;
    float _4104 = (*spvDescriptorSet0.vp_c9)._m0[int(_4100)][_4102];
    float _4106 = _1567 * _1601;
    float _4108 = fma(_1519, _1531, _4082);
    int _4110 = _4088 << 4;
    int _4112 = _4110 + 512;
    float _4114 = fma(_1519, _1535, _4018);
    float _4116 = -_1495;
    float _4118 = fma(_4116, _1531, _4084);
    float _4120 = -_1495;
    float _4122 = fma(_4120, _1533, _4028);
    float _4124 = -_1495;
    float _4126 = fma(_4124, _1535, _4032);
    int _4128 = _4076 + 8;
    uint _4130 = uint(int(uint(_4128) >> uint(2)));
    uint _4132 = uint(int(uint(int(_4130)) >> uint(2)));
    int _4134 = int(_4130) & 3;
    float _4136 = (*spvDescriptorSet0.vp_c9)._m0[int(_4132)][_4134];
    int _4138 = int(_4130) + 1;
    uint _4140 = uint(int(uint(_4138) >> uint(2)));
    int _4142 = _4138 & 3;
    float _4144 = (*spvDescriptorSet0.vp_c9)._m0[int(_4140)][_4142];
    float _4146 = fma(_1523, _1531, _4040);
    float _4148 = fma(_1523, _1533, _4086);
    float _4150 = fma(_1523, _1535, _4106);
    int _4152 = abs(_3490);
    float _4154 = fma(_1499, _1258, _4118);
    int _4156 = abs(_3740);
    float _4158 = fma(_1499, _1286, _4122);
    uint _4160 = uint(int(uint(_4112) >> uint(2)));
    uint _4162 = uint(int(uint(int(_4160)) >> uint(2)));
    int _4164 = int(_4160) & 3;
    float _4166 = (*spvDescriptorSet0.vp_c9)._m0[int(_4162)][_4164];
    int _4168 = int(_4160) + 1;
    uint _4170 = uint(int(uint(_4168) >> uint(2)));
    int _4172 = _4168 & 3;
    float _4174 = (*spvDescriptorSet0.vp_c9)._m0[int(_4170)][_4172];
    int _4176 = ~_3950;
    int _4178 = _4176 + 1;
    int _4180 = _4178 + 1;
    float _4182 = fma(_1499, _1272, _4126);
    int _4184 = ~_4156;
    int _4186 = _4184 + 1;
    int _4188 = _4186 + 1;
    float _4190 = fma(_1563, _1286, _4054);
    int _4192 = abs(_2998);
    float _4194 = fma(_1569, _1286, _4148);
    int _4196 = ~_4152;
    int _4198 = _4196 + 1;
    int _4200 = _4198 + 1;
    int _4202 = _4112 + 8;
    uint _4204 = uint(int(uint(_4202) >> uint(2)));
    uint _4206 = uint(int(uint(int(_4204)) >> uint(2)));
    int _4208 = int(_4204) & 3;
    float _4210 = (*spvDescriptorSet0.vp_c9)._m0[int(_4206)][_4208];
    int _4212 = int(_4204) + 1;
    uint _4214 = uint(int(uint(_4212) >> uint(2)));
    int _4216 = _4212 & 3;
    float _4218 = (*spvDescriptorSet0.vp_c9)._m0[int(_4214)][_4216];
    int _4220 = ~_4192;
    int _4222 = _4220 + 1;
    int _4224 = _4222 + 1;
    float _4226 = fma(_1563, _1258, _4108);
    float _4228 = fma(_1563, _1272, _4114);
    int _4230 = abs(_3660);
    float _4232 = fma(_1569, _1272, _4150);
    int _4234 = ~_3942;
    int _4236 = _4234 + 1;
    int _4238 = _4236 + 1;
    int _4240 = _4048 + 8;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    uint _4244 = uint(int(uint(int(_4242)) >> uint(2)));
    int _4246 = int(_4242) & 3;
    float _4248 = (*spvDescriptorSet0.vp_c9)._m0[int(_4244)][_4246];
    int _4250 = int(_4242) + 1;
    uint _4252 = uint(int(uint(_4250) >> uint(2)));
    int _4254 = _4250 & 3;
    float _4256 = (*spvDescriptorSet0.vp_c9)._m0[int(_4252)][_4254];
    int _4258 = ~_4230;
    int _4260 = _4258 + 1;
    int _4262 = _4260 + 1;
    float _4264 = fma(_1569, _1258, _4146);
    bool _4266 = !_2612;
    int _4268 = _4266 ? _3948 : (-1);
    out.m_83.x = _4022;
    bool _4270 = !_2738;
    int _4272 = _4270 ? _3940 : (-1);
    int _4274 = _4188 * as_type<int>(_4072);
    int _4276 = abs(_3174);
    float _4278 = _4158 * _3874;
    float _4280 = _4182 * _3874;
    int _4282 = ~_4276;
    int _4284 = _4282 + 1;
    int _4286 = _4284 + 1;
    int _4288 = _4180 * as_type<int>(_4104);
    float _4290 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4292 = int(_4290);
    int _4294 = _4286 * as_type<int>(_4096);
    int _4296 = _4294 + _4288;
    int _4298 = abs(_3422);
    float _4300 = _4008 * _4158;
    int _4302 = abs(_3350);
    int _4304 = _4224 * as_type<int>(_4136);
    int _4306 = _4304 + _4296;
    int _4308 = ~_4298;
    int _4310 = _4308 + 1;
    int _4312 = _4310 + 1;
    float _4314 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4316 = int(_4314);
    int _4318 = _4200 * as_type<int>(_4174);
    int _4320 = abs(_3846);
    float _4322 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4324 = int(_4322);
    float _4326 = float(uint(_4292));
    int _4328 = _4238 * as_type<int>(_4166);
    int _4330 = _4328 + _4318;
    int _4332 = ~_4320;
    int _4334 = _4332 + 1;
    int _4336 = _4334 + 1;
    int _4338 = abs(_3428);
    int _4340 = _4312 * as_type<int>(_4210);
    int _4342 = _4340 + _4330;
    int _4344 = abs(_3678);
    int _4346 = _4336 * as_type<int>(_4064);
    int _4348 = _4346 + _4274;
    int _4350 = ~_4338;
    int _4352 = _4350 + 1;
    int _4354 = _4352 + 1;
    float _4356 = 1.0 / _4326;
    int _4358 = abs(_3442);
    float _4360 = _4154 * _3874;
    int _4362 = ~_4344;
    int _4364 = _4362 + 1;
    int _4366 = _4364 + 1;
    int _4368 = _4354 * as_type<int>(_4144);
    int _4370 = _4368 + _4306;
    int _4372 = ~_4358;
    int _4374 = _4372 + 1;
    int _4376 = _4374 + 1;
    int _4378 = _4262 * as_type<int>(_4248);
    int _4380 = _4378 + _4348;
    float _4382 = float(uint(_4316));
    float _4384 = _4158 * _3960;
    int _4386 = abs(_4292);
    int _4388 = _4376 * as_type<int>(_4218);
    int _4390 = _4388 + _4342;
    float _4392 = 1.0 / _4382;
    float _4394 = float(uint(_4324));
    int _4396 = _4366 * as_type<int>(_4256);
    int _4398 = _4396 + _4380;
    bool _4400 = !_3452;
    int _4402 = _4400 ? 0 : 1;
    int _4404 = ~_4302;
    int _4406 = _4404 + 1;
    int _4408 = _4406 + 1;
    float _4410 = float(uint(_4386));
    float _4412 = 1.0 / _4394;
    bool _4414 = !_3456;
    int _4416 = _4414 ? 0 : 1;
    int _4418 = _4370 * _4408;
    int _4420 = abs(_4402);
    int _4422 = abs(_4416);
    int _4424 = ~_4420;
    int _4426 = _4424 + 1;
    int _4428 = _4426 + 1;
    float _4430 = 1.0 / _4410;
    bool _4432 = !_2234;
    int _4434 = _4432 ? _3776 : (-1);
    int _4436 = abs(_4324);
    int _4438 = _4428 * _4390;
    int _4440 = ~_4316;
    int _4442 = _4440 + 1;
    int _4444 = _4434 * _4302;
    int _4446 = _4444 + _4418;
    int _4448 = abs(_4316);
    int _4450 = ~_4422;
    int _4452 = _4450 + 1;
    int _4454 = _4452 + 1;
    float _4456 = float(uint(_4436));
    int _4458 = as_type<int>(_4356) + (-2);
    int _4460 = _4454 * _4398;
    float _4462 = float(uint(_4446));
    int _4464 = _4268 * _4420;
    int _4466 = _4464 + _4438;
    int _4468 = as_type<int>(_4412) + (-2);
    int _4470 = _4272 * _4422;
    int _4472 = _4470 + _4460;
    float _4474 = 1.0 / _4456;
    float _4476 = float(uint(_4448));
    float _4478 = _4154 * _3960;
    float _4480 = float(uint(_4466));
    float _4482 = _4182 * _3960;
    float _4484 = float(uint(_4472));
    int _4486 = abs(_4446);
    float _4488 = as_type<float>(_4468) * _4480;
    int _4490 = as_type<int>(_4392) + (-2);
    float _4492 = as_type<float>(_4458) * _4462;
    float _4494 = 1.0 / _4476;
    int _4496 = as_type<int>(_4430) + (-2);
    float _4498 = as_type<float>(_4490) * _4484;
    int _4500 = abs(_4466);
    int _4502 = as_type<int>(_4474) + (-2);
    float _4504 = trunc(_4492);
    float _4506 = precise::max(_4504, 0.0);
    uint _4508 = uint(_4506);
    int _4510 = ~_4292;
    int _4512 = _4510 + 1;
    float _4514 = float(uint(_4500));
    float _4516 = float(uint(_4486));
    float _4518 = trunc(_4498);
    float _4520 = precise::max(_4518, 0.0);
    uint _4522 = uint(_4520);
    int _4524 = abs(_4472);
    float _4526 = as_type<float>(_4502) * _4514;
    int _4528 = as_type<int>(_4494) + (-2);
    float _4530 = as_type<float>(_4496) * _4516;
    float _4532 = float(uint(_4524));
    float _4534 = _4008 * _4154;
    int _4536 = ~_4324;
    int _4538 = _4536 + 1;
    float _4540 = trunc(_4488);
    float _4542 = precise::max(_4540, 0.0);
    uint _4544 = uint(_4542);
    int _4546 = _4512 * int(_4508);
    int _4548 = _4546 + _4446;
    float _4550 = _4008 * _4182;
    float _4552 = as_type<float>(_4528) * _4532;
    float _4554 = fma(_4228, _3872, _4280);
    float _4556 = float(uint(_4548));
    float _4558 = fma(_4226, _3872, _4360);
    float _4560 = trunc(_4530);
    float _4562 = precise::max(_4560, 0.0);
    uint _4564 = uint(_4562);
    int _4566 = _4442 * int(_4522);
    int _4568 = _4566 + _4472;
    int _4570 = ~_4386;
    int _4572 = _4570 + 1;
    float _4574 = as_type<float>(_4458) * _4556;
    float _4576 = float(uint(_4568));
    float _4578 = trunc(_4526);
    float _4580 = precise::max(_4578, 0.0);
    uint _4582 = uint(_4580);
    int _4584 = _4538 * int(_4544);
    int _4586 = _4584 + _4466;
    float _4588 = fma(_4190, _3872, _4278);
    float _4590 = as_type<float>(_4490) * _4576;
    int _4592 = ~_4448;
    int _4594 = _4592 + 1;
    float _4596 = fma(_4226, _3970, _4478);
    float _4598 = float(uint(_4586));
    float _4600 = trunc(_4552);
    float _4602 = precise::max(_4600, 0.0);
    uint _4604 = uint(_4602);
    int _4606 = _4572 * int(_4564);
    int _4608 = _4606 + _4486;
    int _4610 = ~_4436;
    int _4612 = _4610 + 1;
    float _4614 = as_type<float>(_4468) * _4598;
    float _4616 = fma(_4002, _4226, _4534);
    float _4618 = float(uint(_4608));
    float _4620 = fma(_4190, _3970, _4384);
    int _4622 = _4612 * int(_4582);
    int _4624 = _4622 + _4500;
    float _4626 = trunc(_4614);
    float _4628 = precise::max(_4626, 0.0);
    uint _4630 = uint(_4628);
    float _4632 = as_type<float>(_4496) * _4618;
    float _4634 = fma(_4002, _4190, _4300);
    float _4636 = float(uint(_4624));
    float _4638 = _3384 * _3540;
    float _4640 = fma(_4194, _3982, _4620);
    int _4642 = _4594 * int(_4604);
    int _4644 = _4642 + _4524;
    int _4646 = ~_4324;
    int _4648 = _4646 + 1;
    float _4650 = trunc(_4574);
    float _4652 = precise::max(_4650, 0.0);
    uint _4654 = uint(_4652);
    float _4656 = as_type<float>(_4502) * _4636;
    float _4658 = fma(_4228, _3970, _4482);
    float _4660 = float(uint(_4644));
    float _4662 = fma(_4002, _4228, _4550);
    float _4664 = fma(_4264, _3876, _4558);
    float _4666 = fma(_4194, _3876, _4588);
    float _4668 = fma(_4232, _3876, _4554);
    float _4670 = trunc(_4656);
    float _4672 = precise::max(_4670, 0.0);
    uint _4674 = uint(_4672);
    float _4676 = as_type<float>(_4528) * _4660;
    int _4678 = int(_4544) + int(_4630);
    int _4680 = ~_4292;
    int _4682 = _4680 + 1;
    out.m_85.x = _4664;
    out.m_85.y = _4666;
    out.m_85.z = _4668;
    float _4684 = trunc(_4632);
    float _4686 = precise::max(_4684, 0.0);
    uint _4688 = uint(_4686);
    int _4690 = int(_4508) + int(_4654);
    float _4692 = trunc(_4676);
    float _4694 = precise::max(_4692, 0.0);
    uint _4696 = uint(_4694);
    float _4698 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _4700 = _4682 * _4690;
    int _4702 = _4700 + _4446;
    int _4704 = int(_4582) + int(_4674);
    int _4706 = _4648 * _4678;
    int _4708 = _4706 + _4466;
    float _4710 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4698);
    int _4712 = ~_4386;
    int _4714 = _4712 + 1;
    float _4716 = trunc(_4590);
    float _4718 = precise::max(_4716, 0.0);
    uint _4720 = uint(_4718);
    int _4722 = int(_4564) + int(_4688);
    float _4724 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4710);
    int _4726 = ~_4448;
    int _4728 = _4726 + 1;
    bool _4730 = uint(_4708) >= uint(_4324);
    int _4732 = _4714 * _4722;
    int _4734 = _4732 + _4486;
    int _4736 = ~_4316;
    int _4738 = _4736 + 1;
    float _4740 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4724);
    int _4742 = int(_4604) + int(_4696);
    float _4744 = _4740 + _2011;
    bool _4746 = uint(_4702) >= uint(_4292);
    int _4748 = ~_4436;
    int _4750 = _4748 + 1;
    int _4752 = _4728 * _4742;
    int _4754 = _4752 + _4524;
    int _4756 = int(_4522) + int(_4720);
    float _4758 = _4744 * 0.5;
    bool _4760 = uint(_4734) >= uint(_4386);
    int _4762 = _4750 * _4704;
    int _4764 = _4762 + _4500;
    bool _4766 = !_4746;
    int _4768 = _4766 ? 0 : (-1);
    int _4770 = _4738 * _4756;
    int _4772 = _4770 + _4472;
    bool _4774 = !_4730;
    int _4776 = _4774 ? 0 : (-1);
    float _4778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4780 = uint(_4754) >= uint(_4448);
    bool _4782 = uint(_4772) >= uint(_4316);
    int _4784 = ~_4690;
    int _4786 = _4784 + _4768;
    int _4788 = _4786 + 1;
    int _4790 = ~_4678;
    int _4792 = _4790 + _4776;
    int _4794 = _4792 + 1;
    float _4796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4798 = uint(_4764) >= uint(_4436);
    bool _4800 = !_4782;
    int _4802 = _4800 ? 0 : (-1);
    bool _4804 = _4292 == 0;
    bool _4806 = _4292 == 0;
    float _4808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4810 = _4446 ^ _4292;
    int _4812 = _4292 * _4788;
    int _4814 = _4812 + _4446;
    bool _4816 = !_4760;
    int _4818 = _4816 ? 0 : (-1);
    int _4820 = _4324 * _4794;
    int _4822 = _4820 + _4466;
    bool _4824 = _4324 == 0;
    int _4826 = ~_4756;
    int _4828 = _4826 + _4802;
    int _4830 = _4828 + 1;
    float _4832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4834 = !_4824;
    int _4836 = _4834 ? _4822 : (-1);
    bool _4838 = !_4804;
    int _4840 = _4838 ? _4814 : (-1);
    int _4842 = _4316 * _4830;
    int _4844 = _4842 + _4472;
    bool _4846 = _4316 == 0;
    bool _4848 = _4316 == 0;
    int _4850 = _4472 ^ _4316;
    float _4852 = _4796 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _4854 = float(_4836);
    bool _4856 = !_4798;
    int _4858 = _4856 ? 0 : (-1);
    float _4860 = fma(_4852, _2462, -0.5);
    int _4862 = _4466 ^ _4324;
    float _4864 = fma(_4852, _4854, _1172);
    uint _4866 = uint(int(uint(_4810) >> uint(31)));
    float _4868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4870 = _4324 == 0;
    float _4872 = _4778 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4874 = float(_4840);
    float _4876 = fma(_1064, _4860, _4864);
    bool _4878 = !_4780;
    int _4880 = _4878 ? 0 : (-1);
    float _4882 = fma(_4872, _2408, -0.5);
    uint _4884 = uint(int(uint(_4850) >> uint(31)));
    float _4886 = fma(_4872, _4874, _762);
    bool _4888 = !_4846;
    int _4890 = _4888 ? _4844 : (-1);
    float _4892 = _4832 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4894 = ~_4818;
    int _4896 = _4722 + _4894;
    int _4898 = _4896 + 1;
    float _4900 = fma(_1158, _4882, _4886);
    uint _4902 = uint(int(uint(_4862) >> uint(31)));
    float _4904 = fma(_4892, _2498, -0.5);
    int _4906 = ~int(_4866);
    int _4908 = _4906 + 1;
    float _4910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4912 = ~_4880;
    int _4914 = _4742 + _4912;
    int _4916 = _4914 + 1;
    float _4918 = _4900 + 0.5;
    int _4920 = ~int(_4884);
    int _4922 = _4920 + 1;
    float _4924 = float(_4890);
    int _4926 = ~_4858;
    int _4928 = _4704 + _4926;
    int _4930 = _4928 + 1;
    int _4932 = ~int(_4902);
    int _4934 = _4932 + 1;
    int _4936 = _4898 ^ _4908;
    int _4938 = _4916 ^ _4922;
    float _4940 = fma(_4892, _4924, _892);
    int _4942 = _4930 ^ _4934;
    float _4944 = _4808 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4946 = ~_4908;
    int _4948 = _4946 + _4936;
    int _4950 = _4948 + 1;
    float _4952 = fma(_1164, _4904, _4940);
    int _4954 = ~_4934;
    int _4956 = _4954 + _4942;
    int _4958 = _4956 + 1;
    bool _4960 = !_4806;
    int _4962 = _4960 ? _4950 : (-1);
    float _4964 = _4952 + 0.5;
    bool _4966 = !_4870;
    int _4968 = _4966 ? _4958 : (-1);
    float _4970 = float(_4962);
    float _4972 = float(_4968);
    float _4974 = fma(_2618, _4944, -0.5);
    bool _4976 = _1300 <= 8000.0;
    bool _4978 = isnan(_1300);
    bool _4980 = _4976 || _4978;
    bool _4982 = isnan(8000.0);
    bool _4984 = _4980 || _4982;
    float _4986 = float(_4984);
    float _4988 = -_774;
    float _4990 = fma(_4944, _4970, _4988);
    float _4992 = fma(_4010, _4194, _4634);
    int _4994 = ~_4922;
    int _4996 = _4994 + _4938;
    int _4998 = _4996 + 1;
    float _5000 = _4910 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5002 = fma(_1160, _4974, _4990);
    float _5004 = fma(_4010, _4264, _4616);
    float _5006 = fma(_4010, _4232, _4662);
    float _5008 = -_4078;
    float _5010 = _5008 + 1.0;
    bool _5012 = !_4848;
    int _5014 = _5012 ? _4998 : (-1);
    float _5016 = _4868 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5018 = _4744;
    float _5020 = _4740;
    if (!_1981)
    {
        _5018 = 1.0;
    }
    float _5022 = _5018;
    float _5024 = fma(_5010, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4078);
    out.m_87.x = _5004;
    out.m_87.y = _4992;
    out.m_87.z = _5006;
    float _5026 = float(_5014);
    float _5028 = fma(_2830, _5000, -0.5);
    float _5030 = _4986 * _5024;
    float _5032 = _5022;
    if (_1981)
    {
        bool _5034 = _2097 >= _2061;
        bool _5036 = isnan(_2097);
        bool _5038 = _5034 || _5036;
        bool _5040 = isnan(_2061);
        bool _5042 = _5038 || _5040;
        float _5044 = float(_5042);
        _5032 = _5044;
    }
    float _5046 = _5032;
    float _5048 = -_1174;
    float _5050 = fma(_5000, _4972, _5048);
    float _5052 = fma(_5016, _2884, -0.5);
    float _5054 = -_1176;
    float _5056 = fma(_5016, _5026, _5054);
    float _5058 = _5046 * _3096;
    float _5060 = fma(_1168, _5028, _5050);
    out.gl_Position.x = _2037;
    out.gl_Position.y = _2043;
    out.gl_Position.z = _4740;
    out.gl_Position.w = _2011;
    float _5062 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5064 = fma(_1166, _5052, _5056);
    float _5066 = fma(_4264, _3982, _4596);
    float _5068 = _4876 + 0.5;
    float _5070 = _3436 * _5062;
    float _5072 = precise::clamp(_5070, 0.0, 1.0);
    float _5074 = _5002 + 0.5;
    float _5076 = _5060 + 0.5;
    float _5078 = _5064 + 0.5;
    float _5080 = -_5072;
    float _5082 = fma(_5080, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5084 = fma(_4232, _3982, _4658);
    float _5086 = fma(_2110, _4638, _2108);
    float _5088 = -_5058;
    float _5090 = fma(_5088, _5082, 1.0);
    float _5092 = precise::clamp(_5090, 0.0, 1.0);
    float _5094 = _2110 * _3540;
    float _5096 = -_3524;
    float _5098 = _5096 + 1.0;
    out.m_89.x = _4918;
    out.m_89.y = _5074;
    out.m_89.z = _5068;
    out.m_89.w = _5076;
    float _5100 = _5092 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5102 = fma(_3380, _5094, _2104);
    float _5104 = fma(_3382, _5094, _2106);
    float _5106 = _2110 * _5098;
    out.m_91.x = _4964;
    out.m_91.y = _5078;
    bool _5108 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5110 = isnan(_3126);
    bool _5112 = _5108 || _5110;
    bool _5114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5116 = _5112 || _5114;
    out.m_93.z = _4758;
    out.m_93.w = _2011;
    out.m_95.x = _5100;
    out.m_97.x = _5102;
    out.m_97.y = _5104;
    out.m_97.z = _5086;
    out.m_97.w = _5106;
    float _5118 = _5058;
    float _5120 = _5094;
    float _5122 = _5098;
    float _5124 = _5092;
    if (!_5116)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5126 = _5118;
    out.m_99.x = _5066;
    out.m_99.y = _4640;
    out.m_99.z = _5084;
    float _5128 = _5126;
    float _5130 = _5126;
    if (!_5116)
    {
        _2013 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5132 = _2013;
    float _5134 = _5132;
    float _5136 = _5132;
    if (!_5116)
    {
        _5020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5138 = _5020;
    float _5140 = _5138;
    float _5142 = _5138;
    if (!_5116)
    {
        _5120 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5144 = _5120;
    float _5146 = _5144;
    float _5148 = _5144;
    if (!_5116)
    {
        _5122 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5150 = _5122;
    float _5152 = _5150;
    float _5154 = _5150;
    if (!_5116)
    {
        _5124 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5156 = _5124;
    bool _5158 = !_5116;
    float _5160 = _5156;
    float _5162 = _5156;
    if (!_5158)
    {
        bool _5164 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5166 = isnan(_3126);
        bool _5168 = _5164 || _5166;
        bool _5170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5172 = _5168 || _5170;
        if (!_5172)
        {
            float _5174 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5176 = _3126 + _5174;
            float _5178 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5180 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5178;
            float _5182 = 1.0 / _5180;
            float _5184 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5186 = _5184 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5188 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5190 = _5188 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5192 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5194 = _5192 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5196 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5198 = _5196 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5200 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5202 = _5200 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5204 = _5176 * _5182;
            float _5206 = precise::clamp(_5204, 0.0, 1.0);
            float _5208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5210 = _5208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5212 = fma(_5206, _5186, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5214 = fma(_5206, _5210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5216 = fma(_5206, _5190, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5218 = fma(_5206, _5194, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5220 = fma(_5206, _5198, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5222 = fma(_5206, _5202, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5136 = _5214;
            _5154 = _5220;
            _5130 = _5212;
            _5148 = _5218;
            _5142 = _5216;
            _5162 = _5222;
            _5224 = true;
        }
        else
        {
            bool _5226 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5228 = isnan(_3126);
            bool _5230 = _5226 || _5228;
            bool _5232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5234 = _5230 || _5232;
            if (!_5234)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5236 = _5128;
            _5130 = _5236;
            if (!_5234)
            {
                _5134 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5238 = _5134;
            _5136 = _5238;
            if (!_5234)
            {
                _5140 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5240 = _5140;
            _5142 = _5240;
            if (!_5234)
            {
                _5146 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5242 = _5146;
            _5148 = _5242;
            if (!_5234)
            {
                _5152 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5244 = _5152;
            _5154 = _5244;
            if (!_5234)
            {
                _5160 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5246 = _5160;
            bool _5248 = !_5234;
            _5162 = _5246;
            if (!_5248)
            {
                bool _5250 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5252 = isnan(_3126);
                bool _5254 = _5250 || _5252;
                bool _5256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5258 = _5254 || _5256;
                if (!_5258)
                {
                    float _5260 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5262 = _3126 + _5260;
                    float _5264 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5266 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5264;
                    float _5268 = 1.0 / _5266;
                    float _5270 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5272 = _5270 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5274 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5276 = _5274 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5278 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5280 = _5278 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5282 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5284 = _5282 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5286 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5288 = _5286 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5290 = _5262 * _5268;
                    float _5292 = precise::clamp(_5290, 0.0, 1.0);
                    float _5294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5296 = _5294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5298 = fma(_5292, _5272, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5300 = fma(_5292, _5296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5302 = fma(_5292, _5276, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5304 = fma(_5292, _5280, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5306 = fma(_5292, _5284, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5308 = fma(_5292, _5288, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5136 = _5300;
                    _5154 = _5306;
                    _5130 = _5298;
                    _5148 = _5304;
                    _5142 = _5302;
                    _5162 = _5308;
                    _5224 = true;
                }
                else
                {
                    _5136 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5154 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5148 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5142 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5162 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5224 = false;
    float _5310 = _5136;
    float _5312 = _5154;
    float _5314 = _5130;
    float _5316 = _5148;
    float _5318 = _5142;
    float _5320 = _5162;
    float _5322 = fma(_4640, -0.5, 0.5);
    float _5324 = precise::clamp(_5322, 0.0, 1.0);
    float _5326 = -_5310;
    float _5328 = _5326 + _5312;
    float _5330 = -_5314;
    float _5332 = _5330 + _5316;
    float _5334 = -_5318;
    float _5336 = _5334 + _5320;
    bool _5338 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5340 = fma(_5324, _5328, _5310);
    float _5342 = fma(_5324, _5332, _5314);
    float _5344 = fma(_5324, _5336, _5318);
    float _5346 = _5340 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _5348 = fma(_5342, 0.298911988735198974609375, _5346);
    float _5350 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5352 = fma(_5344, 0.114477999508380889892578125, _5348);
    out.m_95.w = _5350;
    float _5354 = -_5352;
    float _5356 = _5342 + _5354;
    float _5358 = -_5352;
    float _5360 = _5340 + _5358;
    float _5362 = -_5352;
    float _5364 = _5344 + _5362;
    out.m_101.x = 0.0;
    float _5366 = fma(_5356, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    float _5368 = fma(_5360, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    float _5370 = fma(_5364, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    out.m_103.x = _5366;
    out.m_103.y = _5368;
    out.m_103.z = _5370;
    if (!_5338)
    {
        return out;
    }
    float _5372 = -_1899;
    float _5374 = _5372 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5376 = -_1901;
    float _5378 = _5376 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5380 = -_1903;
    float _5382 = _5380 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5384 = _5374 * _5374;
    float _5386 = fma(_5378, _5378, _5384);
    float _5388 = fma(_5382, _5382, _5386);
    float _5390 = sqrt(_5388);
    float _5392 = rsqrt(_5388);
    float _5394 = -_5390;
    float _5396 = _5394 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5398 = _5396 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5400 = precise::clamp(_5398, 0.0, 1.0);
    float _5402 = _5378 * _5392;
    float _5404 = _5374 * _5392;
    float _5406 = abs(_5400);
    float _5408 = log2(_5406);
    float _5410 = _5382 * _5392;
    float _5412 = _5402 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5414 = _4640 * _5404;
    float _5416 = -_5404;
    float _5418 = -_5412;
    float _5420 = fma(_5416, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5418);
    float _5422 = fma(_5066, _5402, _5414);
    float _5424 = -_5410;
    float _5426 = fma(_5424, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5420);
    float _5428 = fma(_5084, _5410, _5422);
    float _5430 = precise::clamp(_5428, 0.0, 1.0);
    float _5432 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5434 = _5426 + _5432;
    float _5436 = _5408 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5438 = _5434 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5440 = precise::clamp(_5438, 0.0, 1.0);
    float _5442 = exp2(_5436);
    float _5444 = _5442 * _5440;
    float _5446 = _5430 * _5444;
    float _5448 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5450 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5452 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5448;
    out.m_101.y = _5450;
    out.m_101.z = _5452;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5224 = false;
    bool _612 = false;
    bool _200 = false;
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
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5508 = as_type<float>(_138);
        out.gl_Position.z = _5508;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_61.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    int _172 = 0;
    if (_166)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5578 = as_type<float>(_176);
        out.gl_Position.z = _5578;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_63.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _154 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = 1.0 / _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _228 = 1.0 / _216;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _234 = 1.0 / _220;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _236;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = 1.0 / _232;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _256 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _258 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _262 = isnan(_208);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _274 = 1.0 / _226;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _208 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = _208 + _280;
    bool _284 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _286 = 1.0 / _238;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _292 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _294 = _288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _298 = _208 + _296;
    out.m_65.x = _258;
    out.m_65.y = _256;
    out.m_65.z = _292;
    out.m_65.w = _244;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _208 + _300;
    float _304 = _298 * _248;
    bool _306 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _308 = isnan(_208);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    out.m_67.x = _294;
    out.m_67.y = _246;
    out.m_67.z = _272;
    out.m_67.w = _290;
    float _318 = _302 * _228;
    float _320 = _278 * _234;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = _208 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _208 + _326;
    float _330 = _282 * _286;
    float _332 = _324 * _222;
    float _334 = _328 * _274;
    bool _336 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _338 = isnan(_208);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_346;
    float _350 = _348 + 1.0;
    float _352 = -_316;
    float _354 = _352 + 1.0;
    bool _356 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_208);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _270 * _350;
    float _370 = -_270;
    float _372 = _370 + 1.0;
    bool _374 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _376 = isnan(_208);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _366 * _354;
    float _392 = _316 * _372;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = -_366;
    float _416 = _414 + 1.0;
    bool _418 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _420 = isnan(_208);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_396, _320, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _432 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _434 = isnan(_208);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_400, _320, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = fma(_388, _320, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _448 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = fma(_408, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = fma(_412, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _384 * _416;
    float _456 = -_384;
    float _458 = _456 + 1.0;
    float _460 = -_442;
    float _462 = _460 + 1.0;
    float _464 = _442 * _458;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = _428 * _462;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _476;
    float _480 = fma(_468, _332, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = fma(_472, _332, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = _450 * _474;
    float _486 = fma(_478, _332, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = _448 * _474;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = _452 * _474;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].y, _484);
    float _508 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].z, _494);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_430, _464, _504);
    float _516 = fma(_444, _464, _506);
    float _518 = fma(_446, _464, _508);
    float _520 = fma(_498, _334, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _522 = fma(_502, _334, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _524 = fma(_512, _334, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _526 = fma(_482, _454, _514);
    float _528 = fma(_486, _454, _516);
    float _530 = fma(_480, _454, _518);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _540;
    float _544 = fma(_520, _390, _526);
    float _546 = fma(_522, _390, _528);
    float _548 = fma(_524, _390, _530);
    float _550 = fma(_534, _330, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _552 = fma(_538, _330, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _554 = fma(_542, _330, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _568 = fma(_550, _392, _544);
    float _570 = fma(_558, _304, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _572 = fma(_562, _304, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _574 = fma(_566, _304, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _576 = fma(_552, _392, _546);
    float _578 = fma(_554, _392, _548);
    float _580 = fma(_570, _368, _568);
    float _582 = fma(_572, _368, _576);
    float _584 = fma(_574, _368, _578);
    float _586 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].x, _580);
    float _588 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].y, _582);
    float _590 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[149].z, _584);
    bool _592 = !_284;
    float _610;
    if (!_592)
    {
        float _594 = in.m_63.x;
        float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _598 = _594 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _602 = _600 * _596;
        float _604 = floor(_602);
        float _606 = -_604;
        float _608 = _602 + _606;
        _610 = _608;
        _612 = true;
    }
    else
    {
        float _614 = float(_122);
        float _616 = 1.0 / _614;
        float _618 = _154 * _616;
        _610 = _618;
    }
    _612 = false;
    float _620 = _610;
    float _622 = in.m_56.x;
    float _624 = in.m_56.y;
    float _626 = in.m_56.z;
    float _628 = _624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _630 = _624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _632 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[4].x, _628);
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[6].x, _630);
    float _636 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[4].z, _632);
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[6].z, _634);
    float _640 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _642 = _638 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _644 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _646 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _648 = floor(_644);
    float _650 = floor(_646);
    float _652 = -_648;
    float _654 = _644 + _652;
    float _656 = -_650;
    float _658 = _646 + _656;
    float2 _6431 = float2(_654, _658);
    float _660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6431, float2(0.0), isnan(_6431)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6431, float2(0.0), isnan(_6431)), level(0.0)).x;
    float _662 = in.m_69.x;
    float _664 = in.m_69.y;
    float _666 = in.m_69.z;
    float _668 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _670 = in.m_63.x;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _674 = _672 != 0;
    float _676 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _678 = log2(_676);
    float _680 = in.m_63.y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _684 = in.m_63.z;
    float _686 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _688 = int(_686);
    float _690 = -_640;
    float _692 = _690 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _694 = float(_122);
    float _696 = -_642;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _702 = int(_700);
    float _704 = _590 * _666;
    float _706 = _588 * _664;
    float _708 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[5].x, _668);
    float _710 = _670 * 2.0;
    float _712 = _670 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = _586 * _662;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _718 = floor(_710);
    float _720 = _680 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _722 = _680 * 2.0;
    float _724 = -_682;
    float _726 = fma(_712, 2.0, _724);
    float _728 = _680 + _684;
    float _730 = fma(_720, -2.0, _716);
    float _732 = _684 * 2.0;
    float _734 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].z, _708);
    float _736 = floor(_722);
    float _738 = _670 + _680;
    float _740 = _728 + (-1.0);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _744 = float(_688);
    float _746 = _738 + (-1.0);
    int _748 = as_type<int>(_738);
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _752 = _680;
    float _754 = _670;
    float _756 = _642;
    if (_674)
    {
        _748 = 0;
    }
    int _758 = _748;
    float _760 = -_154;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[76].x, _726);
    float _764 = floor(_732);
    int _766 = _758;
    if (!_674)
    {
        _766 = 2;
    }
    int _768 = _766;
    float _770 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _772 = _718 > 0.0;
    float _774 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _730);
    float _776 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _778 = _768 != 2;
    float _780 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _782 = int(_780);
    bool _784 = _718 >= 0.0;
    bool _786 = isnan(_718);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _796 = _768;
    if (_674)
    {
        _796 = 0;
    }
    int _798 = _796;
    int _800 = _792 ? 0 : 1;
    int _802 = _798;
    if (!_674)
    {
        _802 = 1;
    }
    int _804 = _802;
    float _806 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _808 = int(_806);
    bool _810 = _764 > 0.0;
    bool _812 = _764 >= 0.0;
    bool _814 = isnan(_764);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    int _822 = ~_800;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    float _830 = as_type<float>(_804);
    if (!_772)
    {
        int _832 = ~_800;
        int _834 = _832 + 1;
        _828 = _834;
    }
    int _836 = _828;
    float _838 = 1.0 / _744;
    bool _840 = _804 != 1;
    if (_778)
    {
        _830 = _670;
    }
    float _842 = _830;
    float _844 = _842;
    if (!_778)
    {
        _844 = _684;
    }
    float _846 = _844;
    float _848 = 1.0 / _694;
    bool _850 = _736 > 0.0;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _854 = _736 >= 0.0;
    bool _856 = isnan(_736);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = _846 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _866 = _820 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _868 = _862 ? 0 : 1;
    float _870 = -_852;
    float _872 = fma(_864, 2.0, _870);
    float _874 = _864;
    float _876 = _866;
    float _878 = _846;
    if (!_840)
    {
        _874 = _680;
    }
    float _880 = _874;
    float _882 = _838 * _154;
    int _884 = ~as_type<int>(_866);
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = -_154;
    float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[86].x, _872);
    int _894 = ~_868;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _888;
    int _902 = _898;
    float _904 = _880;
    if (!_810)
    {
        int _906 = ~as_type<int>(_866);
        int _908 = _906 + 1;
        _900 = _908;
    }
    int _910 = _900;
    float _912 = _848 * _154;
    if (!_850)
    {
        int _914 = ~_868;
        int _916 = _914 + 1;
        _902 = _916;
    }
    int _918 = _902;
    if (!_840)
    {
        _876 = _880;
    }
    float _920 = _876;
    float _922 = _920;
    if (_840)
    {
        _922 = _670;
    }
    float _924 = _922;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _938 = _936 != 0;
    float _940 = _924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_840)
    {
        _878 = _684;
    }
    float _942 = _878;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _946 = _942;
    if (_840)
    {
        _946 = _680;
    }
    float _948 = _946;
    float _950 = -_926;
    float _952 = fma(_940, 2.0, _950);
    float _954 = _734 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _956 = !_934;
    int _958 = _956 ? 0 : 1;
    bool _960 = !_930;
    int _962 = _960 ? 0 : 1;
    float _964 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[83].w, _944);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _972 = _970 != 0;
    float _974 = _954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _976 = _954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_840)
    {
        _904 = _670;
    }
    float _978 = _904;
    float _980 = -_954;
    float _982 = _980 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _984 = !_938;
    int _986 = _984 ? 0 : 1;
    float _988 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _974);
    bool _990 = !_972;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _976);
    bool _996 = !_968;
    int _998 = _996 ? 0 : 1;
    float _1000 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[10].z, _988);
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1012 = _1010 != 0;
    float _1014 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[83].z, _742);
    float _1016 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[11].z, _994);
    float _1018 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1020 = float(_782);
    float _1022 = in.m_71.x;
    float _1024 = in.m_71.y;
    float _1026 = in.m_71.z;
    bool _1028 = !_1004;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1034 = _988;
    if (!_840)
    {
        _1034 = _684;
    }
    float _1036 = _1034;
    float _1038 = 1.0 / _1020;
    int _1040 = abs(_1030);
    float _1042 = _1018 + _1032;
    float _1044 = _1036;
    float _1046 = as_type<float>(_1040);
    if (_840)
    {
        _1044 = _680;
    }
    float _1048 = _1044;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1052 = _982 * _982;
    if (_778)
    {
        _1046 = _680;
    }
    float _1054 = _1046;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1058 = 1.0 / _1032;
    float _1060 = _1054;
    if (!_778)
    {
        _1060 = _670;
    }
    float _1062 = _1060;
    float _1064 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1014);
    float _1066 = float(_910);
    float _1068 = fma(_1056, -2.0, _1050);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1072 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1074 = float(_1040);
    float _1076 = _1038 * _154;
    float _1078 = fma(_1072, -2.0, _1070);
    float _1080 = _678 * _154;
    float _1082 = _1074 * _1066;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1086 = float(_808);
    float _1088 = _1042 * _1058;
    float _1090 = _1088 * 0.5;
    float _1092 = exp2(_1080);
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1096 = _1082 * (-2.0);
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1100 = 1.0 + _1098;
    float _1102 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1084);
    float _1104 = fma(_770, _1096, _770);
    float _1106 = fma(_1096, _1022, _1022);
    float _1108 = 1.0 / _1086;
    float _1110 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    bool _1112 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1114 = isnan(1.0);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1120 = _1116 || _1118;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1136 = _954 + _1110;
    float _1138 = 1.0 / _1100;
    float _1140 = -_1092;
    float _1142 = _1140 + 1.0;
    float _1144 = float(_702);
    float _1146 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1122);
    float _1148 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1134);
    float _1150 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1094);
    float _1152 = _1132 ? _1142 : 0.0;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1156 = _1144 * _154;
    float _1158 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1146);
    float _1160 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1148);
    float _1162 = _1108 * _154;
    float _1164 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1102);
    float _1166 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1150);
    float _1168 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _964);
    float _1170 = -_154;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[81].x, _952);
    float _1174 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1068);
    float _1176 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1078);
    int _1178 = as_type<int>(_1076);
    float _1180 = _1136;
    if (_1120)
    {
        float _1182 = _1152 * _1138;
        _156 = _1182;
    }
    float _1184 = _156;
    float _1186 = fma(_692, _692, _1052);
    float _1188 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1154);
    bool _1190 = !_1008;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _670 + (-0.5);
    float _1196 = fma(_698, _698, _1186);
    float _1198 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1188);
    bool _1200 = !_1012;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1106);
    float _1206 = float(_836);
    float _1208 = rsqrt(_1196);
    int _1210 = abs(_1192);
    float _1212 = fma(_1104, _1184, _1204);
    int _1214 = abs(_1202);
    float _1216 = _670 + _684;
    float _1218 = float(_1210);
    float _1220 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1222 = _1216 + (-1.0);
    float _1224 = float(_918);
    float _1226 = _1218 * _1206;
    float _1228 = float(_1214);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1232 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1230);
    float _1234 = _1226 * (-2.0);
    float _1236 = _680 + (-0.5);
    float _1238 = _1228 * _1224;
    float _1240 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1220);
    float _1242 = 1.0 / _1232;
    float _1244 = in.m_73.x;
    float _1246 = in.m_73.y;
    float _1248 = in.m_73.z;
    float _1250 = _1238 * (-2.0);
    float _1252 = fma(_1234, _1024, _1024);
    float _1254 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1256 = _684 + (-0.5);
    float _1258 = _692 * _1208;
    float _1260 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1252);
    float _1262 = fma(_1250, _1026, _1026);
    float _1264 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1240);
    float _1266 = fma(_794, _1234, _794);
    float _1268 = fma(_1254, _1250, _1254);
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1262);
    float _1272 = _698 * _1208;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1276 = _1258 * _1274;
    float _1278 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1280 = _1264 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1282 = fma(_1266, _1184, _1260);
    float _1284 = fma(_1268, _1184, _1270);
    float _1286 = _982 * _1208;
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1272 * _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1294 = -_1276;
    float _1296 = fma(_1272, _1292, _1294);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1300 = _1242 * _1298;
    float _1302 = trunc(_1278);
    int _1304 = int(_1302);
    float _1306 = _1212 * 0.15915493667125701904296875;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1310 = _1286 * _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1314 = -_1290;
    float _1316 = fma(_1286, _1312, _1314);
    float _1318 = _1296 * _1296;
    float _1320 = _1282 * 0.15915493667125701904296875;
    bool _1322 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1324 = trunc(_1280);
    int _1326 = int(_1324);
    bool _1328 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1332 = -_1310;
    float _1334 = fma(_1258, _1330, _1332);
    float _1336 = fma(_1316, _1316, _1318);
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1246);
    float _1340 = _1284 * 0.15915493667125701904296875;
    float _1342 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1344 = fma(_1334, _1334, _1336);
    float _1346 = _1306 * 6.283185482025146484375;
    float _1348 = sin(_1346);
    float _1350 = _1338 * _1342;
    bool _1352 = !_1322;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1244);
    int _1358 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1360 = _1304 + _1358;
    int _1362 = _1360 + 1;
    float _1364 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1366 = 2;
    int _1368 = _1362;
    if (!_1322)
    {
        _1366 = 1;
    }
    int _1370 = _1366;
    float _1372 = _1306 * 6.283185482025146484375;
    float _1374 = cos(_1372);
    int _1376 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1378 = _1326 + _1376;
    int _1380 = _1378 + 1;
    float _1382 = _1356 * _776;
    int _1384 = _1370;
    int _1386 = _1380;
    if (!_1328)
    {
        _1384 = _1354;
    }
    int _1388 = _1384;
    float _1390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1248);
    int _1392 = _1362 | _1380;
    bool _1394 = _1362 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1396 = _1320 * 6.283185482025146484375;
    float _1398 = sin(_1396);
    int _1400 = _1388 << 6;
    float _1402 = _1390 * _1364;
    bool _1404 = _1392 < 0;
    bool _1406 = _1404 || _1394;
    int _1408 = _1400 + 96;
    uint _1411 = uint(int(uint(_1408) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.vp_c15)._m0[int(_1413)][_1415];
    int _1419 = int(_1411) + 1;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    int _1423 = _1419 & 3;
    float _1425 = (*spvDescriptorSet0.vp_c15)._m0[int(_1421)][_1423];
    bool _1427 = _1380 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1429 = _1427 || _1406;
    float _1431 = _1320 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    int _1435 = _1400 + 48;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    int _1445 = int(_1437) + 1;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    int _1449 = _1445 & 3;
    float _1451 = (*spvDescriptorSet0.vp_c15)._m0[int(_1447)][_1449];
    float _1453 = _1340 * 6.283185482025146484375;
    float _1455 = cos(_1453);
    float _1457 = _1348 * _1398;
    float _1459 = _1374 * _1398;
    if (!_1429)
    {
        int _1461 = _1380 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1463 = _1461 + _1362;
        _1368 = _1463;
    }
    int _1465 = _1368;
    float _1467 = rsqrt(_1344);
    float _1469 = _1374 * _1433;
    float _1471 = _1348 * _1433;
    float _1473 = as_type<float>(_1465);
    if (!_1429)
    {
        int _1475 = _1465 << 2;
        _1386 = _1475;
    }
    int _1477 = _1386;
    int _1479 = 0;
    int _1481 = _1477;
    if (!_1429)
    {
        uint _1483 = uint(int(uint(_1465) >> uint(2)));
        _1479 = int(_1483);
    }
    int _1485 = _1479;
    int _1487 = _1485;
    if (!_1429)
    {
        int _1489 = 12 & _1477;
        _1481 = _1489;
    }
    int _1491 = _1481;
    float _1493 = _1340 * 6.283185482025146484375;
    float _1495 = sin(_1493);
    float _1497 = _1374 * _1455;
    float _1499 = _1348 * _1455;
    int _1501 = _1400 + 104;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c15)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.vp_c15)._m0[int(_1513)][_1515];
    float _1519 = _1433 * _1455;
    float _1521 = _1497 * _1350;
    float _1523 = _1398 * _1455;
    if (!_1429)
    {
        int _1525 = _1485 << 4;
        int _1527 = _1525 + _1491;
        _1487 = _1527;
    }
    int _1529 = _1487;
    float _1531 = _1316 * _1467;
    float _1533 = _1296 * _1467;
    float _1535 = _1334 * _1467;
    float _1537 = _1286 * _1531;
    float _1539 = _1272 * _1533;
    int _1541 = _1400 + 72;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.vp_c15)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.vp_c15)._m0[int(_1553)][_1555];
    float _1559 = fma(_1495, _1469, _1457);
    float _1561 = -_1459;
    float _1563 = fma(_1495, _1471, _1561);
    float _1565 = -_1471;
    float _1567 = fma(_1495, _1459, _1565);
    float _1569 = fma(_1495, _1457, _1469);
    float _1571 = -_1350;
    float _1573 = _1495 * _1571;
    float _1575 = fma(_1559, _1382, _1521);
    int _1577 = _1400 + 64;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    float _1595 = _1499 * _1350;
    float _1597 = fma(_1519, _1382, _1573);
    float _1599 = -_1537;
    float _1601 = fma(_1258, _1533, _1599);
    float _1603 = fma(_1567, _1402, _1575);
    float _1605 = fma(_1563, _1382, _1595);
    float _1607 = -_1539;
    float _1609 = fma(_1286, _1535, _1607);
    float _1611 = fma(_1523, _1402, _1597);
    float _1613 = _1601 * _1603;
    float _1615 = fma(_1569, _1402, _1605);
    float _1617 = _1609 * _1603;
    int _1619 = _1400 + 56;
    uint _1621 = uint(int(uint(_1619) >> uint(2)));
    uint _1623 = uint(int(uint(int(_1621)) >> uint(2)));
    int _1625 = int(_1621) & 3;
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[int(_1623)][_1625];
    int _1629 = int(_1621) + 1;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    int _1633 = _1629 & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    float _1637 = fma(_1535, _1611, _1613);
    float _1639 = _1136 * _1425;
    float _1641 = fma(_1531, _1611, _1617);
    float _1643 = _1136 * _1451;
    float _1645 = fma(_1272, _1615, _1637);
    float _1647 = fma(_640, _1417, _1639);
    float _1649 = fma(_1258, _1615, _1641);
    float _1651 = _1451;
    float _1653 = _1417;
    if (!_1429)
    {
        float _1655 = floor(_1278);
        _1651 = _1655;
    }
    float _1657 = _1651;
    float _1659 = _642 + _1645;
    float _1661 = fma(_640, _1443, _1643);
    int _1663 = _1400 + 80;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[int(_1675)][_1677];
    float _1681 = _640 + _1649;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1685 = _1659 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1689 = _1681 + _1687;
    float _1691 = _1685 * _1685;
    float _1693 = fma(_642, _1509, _1647);
    float _1695 = fma(_1689, _1689, _1691);
    float _1697 = _1258 * _1535;
    float _1699 = _1693 + _1517;
    float _1701 = sqrt(_1695);
    float _1703 = -_1697;
    float _1705 = fma(_1272, _1531, _1703);
    float _1707 = _1705 * _1603;
    float _1709 = 1.0 / _1699;
    float _1711 = fma(_1533, _1611, _1707);
    float _1713 = _1136 * _1593;
    bool _1715 = _1701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = fma(_640, _1585, _1713);
    float _1719 = fma(_1286, _1615, _1711);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1727 = _1725 != 0;
    float _1729 = fma(_642, _1549, _1717);
    float _1731 = fma(_642, _1627, _1661);
    float _1733 = _1729 + _1557;
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1741 = _1739 != 0;
    float _1743 = _954 + _1719;
    bool _1745 = !_1727;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = _1731 + _1635;
    bool _1751 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1753 = isnan(0.5);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1759 = _1755 || _1757;
    bool _1761 = !_1723;
    int _1763 = _1761 ? 0 : 1;
    bool _1765 = !_1737;
    int _1767 = _1765 ? 0 : 1;
    bool _1769 = !_1741;
    int _1771 = _1769 ? 0 : 1;
    float _1773 = _1719;
    float _1775 = _1717;
    float _1777 = _1689;
    float _1779 = _1661;
    if (!_1715)
    {
        _1773 = _1681;
    }
    float _1781 = _1773;
    float _1783 = _1781;
    if (!_1715)
    {
        _1653 = _1659;
    }
    float _1785 = _1653;
    float _1787 = _1785;
    if (!_1715)
    {
        _1775 = _1743;
    }
    float _1789 = _1775;
    bool _1791 = !_1715;
    float _1793 = _1789;
    float _1795 = _1679;
    if (!_1791)
    {
        float _1797 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1801 = _1701 + _1799;
        float _1803 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1805 = rsqrt(_1695);
        float _1807 = _1801 * _1797;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = _1813 + (-1.0);
        float _1821 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1823 = fma(_1817, _1803, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1825 = fma(_1743, _1813, _1821);
        float _1827 = _1805 * _1823;
        float _1829 = fma(_1689, _1827, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1831 = fma(_1685, _1827, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1787 = _1831;
        _1783 = _1829;
        _1793 = _1825;
    }
    float _1833 = _1787;
    float _1835 = _1783;
    float _1837 = _1793;
    float _1839 = _1749 * _1709;
    float _1841 = _1837;
    float _1843 = _1835;
    if (_1759)
    {
        _1777 = _1833;
    }
    float _1845 = _1777;
    float _1847 = _1845;
    if (!_1759)
    {
        float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1851 = _954 + _1849;
        float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1855 = _640 + _1853;
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1859 = -_640;
        float _1861 = _1859 + _1835;
        float _1863 = _1851 * _1851;
        float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1867 = _642 + _1865;
        float _1869 = -_642;
        float _1871 = _1869 + _1833;
        float _1873 = fma(_1855, _1855, _1863);
        float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1877 = fma(_1867, _1867, _1873);
        float _1879 = sqrt(_1877);
        float _1881 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1883 = precise::min(_1879, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1885 = _1883 * _1875;
        float _1887 = -_954;
        float _1889 = _1887 + _1837;
        float _1891 = _1881 * _1885;
        float _1893 = fma(_1889, _1891, _954);
        float _1895 = fma(_1861, _1891, _640);
        float _1897 = fma(_1871, _1891, _642);
        _1841 = _1893;
        _1843 = _1895;
        _1847 = _1897;
    }
    float _1899 = _1841;
    float _1901 = _1843;
    float _1903 = _1847;
    int _1905 = _1400 + 88;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    uint _1909 = uint(int(uint(int(_1907)) >> uint(2)));
    int _1911 = int(_1907) & 3;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[int(_1909)][_1911];
    int _1915 = int(_1907) + 1;
    uint _1917 = uint(int(uint(_1915) >> uint(2)));
    int _1919 = _1915 & 3;
    float _1921 = (*spvDescriptorSet0.vp_c15)._m0[int(_1917)][_1919];
    float _1923 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1925 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1927 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1929 = _1839 >= 0.0;
    float _1931 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1923);
    float _1933 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1925);
    float _1935 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    float _1937 = _1695;
    if (!_1429)
    {
        int _1939 = _1529 + 400;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
        int _1945 = int(_1941) & 3;
        float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
        _1937 = _1947;
    }
    float _1949 = _1937;
    float _1951 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1953 = _1733 * _1709;
    bool _1955 = _1839 <= 1.0;
    bool _1957 = _1955 && _1929;
    float _1959 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1933);
    float _1961 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    float _1963 = _1899 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1965 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1967 = _1953 >= 0.0;
    bool _1969 = _1967 && _1957;
    float _1971 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1973 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1975 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1963);
    float _1977 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1979 = _1953 <= 1.0;
    bool _1981 = _1979 && _1969;
    float _1983 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1985 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1987 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1975);
    float _1989 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1977);
    float _1991 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1993 = -_1985;
    float _1995 = fma(_1993, _1983, 1.0);
    float _1997 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1999 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _2001 = _1136 * _1679;
    float _2003 = _1989;
    if (!_1429)
    {
        float _2005 = floor(_1280);
        _1779 = _2005;
    }
    float _2007 = _1779;
    float _2009 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1991);
    float _2011 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1999);
    float _2013 = _2011;
    if (_1981)
    {
        float _2015 = float(_1388);
        _2003 = _2015;
    }
    float _2017 = _2003;
    float _2019 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2021 = fma(_640, _1671, _2001);
    if (!_1429)
    {
        float _2023 = -_1657;
        float _2025 = _1278 + _2023;
        _1795 = _2025;
    }
    float _2027 = _1795;
    float _2029 = log2(_1995);
    float _2031 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2019);
    float _2033 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2009);
    float _2035 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2031);
    float _2037 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2033);
    float _2039 = 1.0 / _2011;
    float _2041 = fma(_642, _1913, _2021);
    float _2043 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2035);
    float _2045 = _2041 + _1921;
    float _2047 = _2017;
    if (_1981)
    {
        float _2049 = rint(_2017);
        float _2051 = precise::max(_2049, 0.0);
        uint _2053 = uint(_2051);
        uint _2055 = clamp(_2053, 0u, 65535u);
        _2047 = as_type<float>(_2055);
    }
    float _2057 = _2047;
    float _2059 = _2029 * 0.693147182464599609375;
    float _2061 = _2045 * _1709;
    float _2063 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2065 = _2059;
    if (!_1429)
    {
        float _2067 = -_2007;
        float _2069 = _1280 + _2067;
        _2065 = _2069;
    }
    float _2071 = _2065;
    float _2073 = _2021;
    if (!_1429)
    {
        float _2075 = rint(_1949);
        float _2077 = precise::max(_2075, 0.0);
        uint _2079 = uint(_2077);
        uint _2081 = clamp(_2079, 0u, 65535u);
        _2073 = as_type<float>(_2081);
    }
    float _2083 = _2073;
    float _2085 = _2037 * _2039;
    float _2087 = _2043 * _2039;
    float _2089 = fma(_2085, 0.5, 0.5);
    float _2091 = fma(_2087, -0.5, 0.5);
    float _2093 = _2085;
    if (_1981)
    {
        float3 _8715 = float3(_1839, _1953, float(as_type<int>(_2057)));
        float3 _8719 = select(_8715, float3(0.0), isnan(_8715));
        float _2095 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8719.xy, uint(rint(_8719.z)), _2061, level(0.0));
        _2093 = _2095;
    }
    float _2097 = _2093;
    float3 _8729 = float3(_2089, _2091, _2063);
    float _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8729, float3(0.0), isnan(_8729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8729, float3(0.0), isnan(_8729)), level(0.0)).x;
    float3 _8738 = float3(_2089, _2091, _2063);
    float4 _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8738, float3(0.0), isnan(_8738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8738, float3(0.0), isnan(_8738)), level(0.0)).xyzw;
    float _2104 = _2102.x;
    float _2106 = _2102.y;
    float _2108 = _2102.z;
    float _2110 = _2102.w;
    float _2112 = _2071;
    if (!_1429)
    {
        float3 _8761 = float3(_2027, _2071, float(as_type<int>(_2083)));
        float3 _8763 = select(_8761, float3(0.0), isnan(_8761));
        float _2114 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8763.xy, uint(rint(_8763.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8763.xy, uint(rint(_8763.z)), level(0.0)).x;
        _2112 = _2114;
    }
    float _2116 = _2112;
    float _2118 = float(uint(_702));
    float _2120 = trunc(_1076);
    int _2122 = int(_2120);
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2126 = _2124 != 0;
    float _2128 = _1156 * _848;
    int _2130 = abs(_986);
    int _2132 = abs(_1767);
    float _2134 = 1.0 / _2118;
    float _2136 = float(uint(_2122));
    float _2138 = trunc(_2128);
    int _2140 = int(_2138);
    int _2142 = as_type<int>(_2134) + (-2);
    float _2144 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2146 = int(_2144);
    float _2148 = as_type<float>(_2142) * _2136;
    float _2150 = trunc(_2148);
    float _2152 = precise::max(_2150, 0.0);
    uint _2154 = uint(_2152);
    int _2156 = ~_702;
    int _2158 = _2156 + 1;
    int _2160 = abs(_962);
    int _2162 = _2158 * int(_2154);
    int _2164 = _2162 + _2122;
    float _2166 = float(uint(_2164));
    int _2168 = ~_702;
    int _2170 = _2168 + 1;
    float _2172 = float(_2122);
    float _2174 = as_type<float>(_2142) * _2166;
    float _2176 = _2166;
    if (_2126)
    {
        _2176 = 1.0;
    }
    float _2178 = _2176;
    float _2180 = _2178;
    if (!_2126)
    {
        _2180 = 7.345489978790283203125;
    }
    float _2182 = _2180;
    bool _2184 = _2172 >= _1144;
    bool _2186 = isnan(_2172);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(_1144);
    bool _2192 = _2188 || _2190;
    float _2194 = float(_2192);
    float _2196 = trunc(_2174);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    int _2202 = ~_2146;
    int _2204 = _2202 + 1;
    float _2206 = _2182 * _670;
    float _2208 = floor(_2206);
    int _2210 = int(_2154) + int(_2200);
    float _2212 = trunc(_2194);
    int _2214 = int(_2212);
    int _2216 = _2170 * _2210;
    int _2218 = _2216 + _2122;
    float _2220 = -_2208;
    float _2222 = _2206 + _2220;
    int _2224 = _702 + (-1);
    bool _2226 = uint(_2218) >= uint(_702);
    float _2228 = _2222 * _1144;
    bool _2230 = !_2226;
    int _2232 = _2230 ? 0 : (-1);
    bool _2234 = _702 == 0;
    int _2236 = ~_2210;
    int _2238 = _2236 + _2232;
    int _2240 = _2238 + 1;
    int _2242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2244 = _2242 != 0;
    float _2246 = in.m_63.w;
    int _2248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2250 = _2248 != 0;
    int _2252 = _702 * _2240;
    int _2254 = _2252 + _2122;
    int _2256 = ~_2214;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2264 = _2262 != 0;
    bool _2266 = !_2234;
    int _2268 = _2266 ? _2254 : (-1);
    float _2270 = trunc(_2228);
    int _2272 = int(_2270);
    int _2274 = _2268 * _2260;
    bool _2276 = !_2244;
    int _2278 = _2276 ? 0 : 1;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2282 = _2280 != 0;
    int _2284 = _2214 * _2224;
    int _2286 = _2284 + _2274;
    int _2288 = abs(_2278);
    int _2290 = abs(_958);
    float _2292 = trunc(_882);
    int _2294 = int(_2292);
    bool _2296 = !_2282;
    int _2298 = _2296 ? 0 : 1;
    int _2300 = _2286 * _2290;
    int _2302 = _2272 * _2288;
    int _2304 = _2302 + _2122;
    int _2306 = abs(_2298);
    float _2308 = in.m_75.x;
    int _2310 = _2140 * _2160;
    int _2312 = _2310 + _2300;
    float _2314 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2316 = int(_2314);
    bool _2318 = _2282;
    if (_2250)
    {
        bool _2320 = _670 > 0.5;
        _2318 = _2320;
    }
    bool _2322 = _2318;
    int _2324 = _2304 * _2130;
    int _2326 = _2324 + _2312;
    int _2328 = _2272 * _2306;
    int _2330 = _2328 + _2326;
    float _2332 = float(uint(_2146));
    float _2334 = trunc(_1162);
    int _2336 = int(_2334);
    float _2338 = float(uint(_2294));
    float _2340 = float(uint(_2330));
    float _2342 = float(uint(_2316));
    float _2344 = 1.0 / _2332;
    float _2346 = as_type<float>(_2142) * _2340;
    int _2348 = ~_2146;
    int _2350 = _2348 + 1;
    float _2352 = as_type<float>(_2350);
    if (!_2250)
    {
        _750 = _2308;
    }
    float _2354 = _750;
    float _2356 = _2354;
    if (_2264)
    {
        float _2358 = -_2308;
        float _2360 = _2358 + 1.0;
        _1178 = as_type<int>(_2360);
    }
    int _2362 = _1178;
    float _2364 = trunc(_2346);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = float(uint(_2336));
    int _2372 = ~_702;
    int _2374 = _2372 + 1;
    int _2376 = as_type<int>(_2344) + (-2);
    float _2378 = 1.0 / _2342;
    float _2380 = as_type<float>(_2376) * _2370;
    int _2382 = _2374 * int(_2368);
    int _2384 = _2382 + _2330;
    float _2386 = trunc(_2380);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    int _2392 = _2374;
    int _2394 = int(_2368);
    if (_2250)
    {
        float _2396 = -_2308;
        float _2398 = _2396 + 1.0;
        _2392 = as_type<int>(_2398);
    }
    int _2400 = _2392;
    float _2402 = float(uint(_2384));
    float _2404 = _2402;
    if (_2250)
    {
        float _2406 = _2322 ? as_type<float>(_2400) : _2308;
        _2356 = _2406;
    }
    float _2408 = _2356;
    int _2410 = as_type<int>(_2378) + (-2);
    float _2412 = as_type<float>(_2142) * _2402;
    bool _2414 = _684 > 0.5;
    float _2416 = as_type<float>(_2410) * _2338;
    float _2418 = trunc(_2412);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2426 = _2424 != 0;
    int _2428 = _2350 * int(_2390);
    int _2430 = _2428 + _2336;
    float _2432 = as_type<float>(_2350);
    if (_2126)
    {
        _2404 = _670;
    }
    float _2434 = _2404;
    float _2436 = _2434;
    if (_2126)
    {
        _2432 = 1.0;
    }
    float _2438 = _2432;
    float _2440 = float(uint(_2430));
    float _2442 = trunc(_2416);
    float _2444 = precise::max(_2442, 0.0);
    uint _2446 = uint(_2444);
    float _2448 = _2438;
    if (!_2264)
    {
        _2352 = _2308;
    }
    float _2450 = _2352;
    float _2452 = _2450;
    if (!_2126)
    {
        _2436 = _680;
    }
    float _2454 = _2436;
    float _2456 = as_type<float>(_2376) * _2440;
    if (!_2126)
    {
        _2448 = 1.2345600128173828125;
    }
    float _2458 = _2448;
    if (_2264)
    {
        float _2460 = _2414 ? as_type<float>(_2362) : _2308;
        _2452 = _2460;
    }
    float _2462 = _2452;
    int _2464 = ~_2316;
    int _2466 = _2464 + 1;
    float _2468 = _2454 * _2458;
    int _2470 = int(_2368) + int(_2422);
    if (_2426)
    {
        float _2472 = -_2308;
        float _2474 = _2472 + 1.0;
        _2394 = as_type<int>(_2474);
    }
    int _2476 = _2394;
    float _2478 = floor(_2468);
    bool _2480 = _680 > 0.5;
    float _2482 = as_type<float>(_2476);
    if (!_2426)
    {
        _752 = _2308;
    }
    float _2484 = _752;
    int _2486 = _2466 * int(_2446);
    int _2488 = _2486 + _2294;
    int _2490 = ~_702;
    int _2492 = _2490 + 1;
    float _2494 = _2484;
    if (_2426)
    {
        float _2496 = _2480 ? as_type<float>(_2476) : _2308;
        _2494 = _2496;
    }
    float _2498 = _2494;
    float _2500 = trunc(_2456);
    float _2502 = precise::max(_2500, 0.0);
    uint _2504 = uint(_2502);
    float _2506 = float(uint(_2488));
    int _2508 = _2492 * _2470;
    int _2510 = _2508 + _2330;
    if (_2126)
    {
        _2482 = 1.0;
    }
    float _2512 = _2482;
    float _2514 = _2512;
    if (!_2126)
    {
        _754 = _684;
    }
    float _2516 = _754;
    float _2518 = as_type<float>(_2410) * _2506;
    float _2520 = float(_2146);
    float _2522 = in.m_75.y;
    bool _2524 = uint(_2510) >= uint(_702);
    float _2526 = trunc(_2518);
    float _2528 = precise::max(_2526, 0.0);
    uint _2530 = uint(_2528);
    if (!_2126)
    {
        _2514 = 5.839270114898681640625;
    }
    float _2532 = _2514;
    bool _2534 = !_2524;
    int _2536 = _2534 ? 0 : (-1);
    int _2538 = int(_2390) + int(_2504);
    float _2540 = _2516 * _2532;
    float _2542 = float(_2336);
    float _2544 = -_2478;
    float _2546 = _2468 + _2544;
    bool _2548 = _2246 > 0.5;
    int _2550 = _2204 * _2538;
    int _2552 = _2550 + _2336;
    bool _2554 = _2542 >= _2520;
    bool _2556 = isnan(_2542);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(_2520);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    float _2566 = _2520 * _2546;
    int _2568 = ~_2316;
    int _2570 = _2568 + 1;
    float _2572 = floor(_2540);
    bool _2574 = uint(_2552) >= uint(_2146);
    int _2576 = int(_2446) + int(_2530);
    float _2578 = _2520 * _912;
    bool _2580 = !_2574;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = -_2522;
    float _2586 = _2584 + 1.0;
    float _2588 = trunc(_2564);
    int _2590 = int(_2588);
    int _2592 = ~_2538;
    int _2594 = _2592 + _2582;
    int _2596 = _2594 + 1;
    int _2598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2600 = _2598 != 0;
    int _2602 = _2146 * _2596;
    int _2604 = _2602 + _2336;
    int _2606 = _2480 ? as_type<int>(_2586) : as_type<int>(_2522);
    int _2608 = _2570 * _2576;
    int _2610 = _2608 + _2294;
    bool _2612 = _2146 == 0;
    float _2614 = trunc(_2578);
    int _2616 = int(_2614);
    float _2618 = _2600 ? as_type<float>(_2606) : _2522;
    float _2620 = -_2572;
    float _2622 = _2540 + _2620;
    int _2624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2626 = _2624 != 0;
    bool _2628 = !_2612;
    int _2630 = _2628 ? _2604 : (-1);
    int _2632 = ~_2590;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    int _2638 = _2548 ? as_type<int>(_2586) : as_type<int>(_2522);
    bool _2640 = !_2626;
    int _2642 = _2640 ? 0 : 1;
    bool _2644 = uint(_2610) >= uint(_2316);
    int _2646 = _2636 * _2630;
    int _2648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2650 = _2648 != 0;
    float _2652 = trunc(_2566);
    int _2654 = int(_2652);
    int _2656 = _2146 + (-1);
    bool _2658 = !_2644;
    int _2660 = _2658 ? 0 : (-1);
    bool _2662 = !_2650;
    int _2664 = _2662 ? 0 : 1;
    int _2666 = _2590 * _2656;
    int _2668 = _2666 + _2646;
    int _2670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2672 = _2670 != 0;
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2676 = _2674 != 0;
    float _2678 = float(_2316);
    float _2680 = float(_2294);
    int _2682 = abs(_1747);
    int _2684 = abs(_2642);
    int _2686 = abs(_1763);
    int _2688 = _2668 * _2682;
    bool _2690 = _2680 >= _2678;
    bool _2692 = isnan(_2680);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan(_2678);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    int _2702 = _2654 * _2684;
    int _2704 = _2702 + _2336;
    float _2706 = _2678 * _2622;
    int _2708 = abs(_1771);
    float _2710 = _2678 * _912;
    float _2712 = trunc(_2700);
    int _2714 = int(_2712);
    int _2716 = _2616 * _2686;
    int _2718 = _2716 + _2688;
    int _2720 = ~_2576;
    int _2722 = _2720 + _2660;
    int _2724 = _2722 + 1;
    int _2726 = _2704 * _2132;
    int _2728 = _2726 + _2718;
    bool _2730 = !_2672;
    int _2732 = _2730 ? 0 : 1;
    int _2734 = _2316 * _2724;
    int _2736 = _2734 + _2294;
    bool _2738 = _2316 == 0;
    int _2740 = _2654 * _2708;
    int _2742 = _2740 + _2728;
    float _2744 = trunc(_2706);
    int _2746 = int(_2744);
    int _2748 = abs(_2664);
    bool _2750 = !_2738;
    int _2752 = _2750 ? _2736 : (-1);
    float _2754 = float(uint(_2742));
    int _2756 = ~_2714;
    int _2758 = _2756 + 1;
    int _2760 = _2758 + 1;
    float _2762 = trunc(_2710);
    int _2764 = int(_2762);
    int _2766 = _2316 + (-1);
    int _2768 = ~_2470;
    int _2770 = _2768 + _2536;
    int _2772 = _2770 + 1;
    int _2774 = _2760 * _2752;
    int _2776 = abs(_992);
    float _2778 = as_type<float>(_2376) * _2754;
    int _2780 = _2714 * _2766;
    int _2782 = _2780 + _2774;
    int _2784 = abs(_998);
    int _2786 = _2746 * _2748;
    int _2788 = _2786 + _2294;
    int _2790 = _702 * _2772;
    int _2792 = _2790 + _2330;
    float _2794 = trunc(_2778);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = abs(_2732);
    int _2802 = _2782 * _2776;
    float _2804 = float(uint(_2304));
    bool _2806 = !_2676;
    int _2808 = _2806 ? 0 : 1;
    int _2810 = _2764 * _2784;
    int _2812 = _2810 + _2802;
    int _2814 = ~_2146;
    int _2816 = _2814 + 1;
    float _2818 = as_type<float>(_2142) * _2804;
    int _2820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2822 = _2820 != 0;
    int _2824 = _2788 * _2800;
    int _2826 = _2824 + _2812;
    int _2828 = abs(_2808);
    float _2830 = _2822 ? as_type<float>(_2638) : _2522;
    float _2832 = trunc(_2818);
    float _2834 = precise::max(_2832, 0.0);
    uint _2836 = uint(_2834);
    int _2838 = _2816 * int(_2798);
    int _2840 = _2838 + _2742;
    int _2842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2844 = _2842 != 0;
    float _2846 = float(uint(_2840));
    int _2848 = _2746 * _2828;
    int _2850 = _2848 + _2826;
    int _2852 = ~_702;
    int _2854 = _2852 + 1;
    bool _2856 = !_2234;
    int _2858 = _2856 ? _2792 : (-1);
    float _2860 = as_type<float>(_2376) * _2846;
    float _2862 = float(uint(_2850));
    float _2864 = trunc(_2860);
    float _2866 = precise::max(_2864, 0.0);
    uint _2868 = uint(_2866);
    int _2870 = ~_2316;
    int _2872 = _2870 + 1;
    int _2874 = _2854 * int(_2836);
    int _2876 = _2874 + _2304;
    float _2878 = _2522;
    float _2880 = as_type<float>(_2682);
    if (_2844)
    {
        float _2882 = _2414 ? _2586 : _2522;
        _2878 = _2882;
    }
    float _2884 = _2878;
    float _2886 = as_type<float>(_2410) * _2862;
    int _2888 = _2858 & 3;
    bool _2890 = _2888 != 0;
    int _2892 = _2858 & 3;
    bool _2894 = _2892 != 0;
    float _2896 = trunc(_2886);
    float _2898 = precise::max(_2896, 0.0);
    uint _2900 = uint(_2898);
    float _2902 = float(uint(_2876));
    int _2904 = _2890 ? 0 : 1;
    bool _2906 = uint(_2892) > 1u;
    float _2908 = as_type<float>(_2142) * _2902;
    float _2910 = float(uint(_2704));
    int _2912 = ~_2904;
    int _2914 = _2912 + 1;
    int _2916 = _2914 + 1;
    int _2918 = int(_2798) + int(_2868);
    float _2920 = trunc(_2908);
    float _2922 = precise::max(_2920, 0.0);
    uint _2924 = uint(_2922);
    float _2926 = as_type<float>(_2376) * _2910;
    int _2928 = ~_2146;
    int _2930 = _2928 + 1;
    int _2932 = _2872 * int(_2900);
    int _2934 = _2932 + _2850;
    int _2936 = ~_2146;
    int _2938 = _2936 + 1;
    int _2940 = _2916;
    float _2942 = as_type<float>(_2918);
    if (!_2906)
    {
        int _2944 = ~_2904;
        int _2946 = _2944 + 1;
        _2940 = _2946;
    }
    int _2948 = _2940;
    float _2950 = trunc(_2926);
    float _2952 = precise::max(_2950, 0.0);
    uint _2954 = uint(_2952);
    bool _2956 = uint(_2892) >= 2u;
    float _2958 = float(uint(_2934));
    int _2960 = _2956 ? 0 : 1;
    bool _2962 = _2892 != 3;
    float _2964 = as_type<float>(_2410) * _2958;
    int _2966 = int(_2836) + int(_2924);
    int _2968 = _2938 * _2918;
    int _2970 = _2968 + _2742;
    float _2972 = trunc(_2964);
    float _2974 = precise::max(_2972, 0.0);
    uint _2976 = uint(_2974);
    int _2978 = ~_2960;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    int _2984 = ~_702;
    int _2986 = _2984 + 1;
    int _2988 = _2930 * int(_2954);
    int _2990 = _2988 + _2704;
    int _2992 = _2982;
    if (_2962)
    {
        int _2994 = ~_2960;
        int _2996 = _2994 + 1;
        _2992 = _2996;
    }
    int _2998 = _2992;
    bool _3000 = uint(_2970) >= uint(_2146);
    int _3002 = _2986 * _2966;
    int _3004 = _3002 + _2304;
    float _3006 = float(uint(_2990));
    bool _3008 = !_3000;
    int _3010 = _3008 ? 0 : (-1);
    bool _3012 = uint(_3004) >= uint(_702);
    float _3014 = as_type<float>(_2376) * _3006;
    int _3016 = ~_2918;
    int _3018 = _3016 + _3010;
    int _3020 = _3018 + 1;
    int _3022 = int(_2900) + int(_2976);
    if (_1429)
    {
        _2942 = 1.0;
    }
    float _3024 = _2942;
    int _3026 = _2146 * _3020;
    int _3028 = _3026 + _2742;
    float _3030 = _3024;
    if (!_1429)
    {
        int _3032 = _1465 << 4;
        int _3034 = _3032 + 2048;
        uint _3036 = uint(int(uint(_3034) >> uint(2)));
        uint _3038 = uint(int(uint(int(_3036)) >> uint(2)));
        int _3040 = int(_3036) & 3;
        float _3042 = (*spvDescriptorSet0.vp_c15)._m0[int(_3038)][_3040];
        int _3044 = int(_3036) + 1;
        uint _3046 = uint(int(uint(_3044) >> uint(2)));
        int _3048 = _3044 & 3;
        float _3050 = (*spvDescriptorSet0.vp_c15)._m0[int(_3046)][_3048];
        int _3052 = _3034 + 8;
        uint _3054 = uint(int(uint(_3052) >> uint(2)));
        uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
        int _3058 = int(_3054) & 3;
        float _3060 = (*spvDescriptorSet0.vp_c15)._m0[int(_3056)][_3058];
        int _3062 = int(_3054) + 1;
        uint _3064 = uint(int(uint(_3062) >> uint(2)));
        int _3066 = _3062 & 3;
        float _3068 = (*spvDescriptorSet0.vp_c15)._m0[int(_3064)][_3066];
        float _3070 = _1136 * _3050;
        float _3072 = fma(_640, _3042, _3070);
        float _3074 = fma(_642, _3060, _3072);
        float _3076 = _3074 + _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = -_3078;
        float _3082 = _3080 + _2116;
        float _3084 = fma(_3082, 500.0, 1.5);
        float _3086 = exp2(_3084);
        float _3088 = 0.0 + _3086;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        _1180 = _3070;
        _1473 = as_type<float>(_3034);
        _3030 = _3090;
    }
    float _3092 = _1180;
    float _3094 = _1473;
    float _3096 = _3030;
    float _3098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3100 = _1899 + _3098;
    float _3102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3104 = _1901 + _3102;
    float _3106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3108 = _1903 + _3106;
    bool _3110 = !_2612;
    int _3112 = _3110 ? _3028 : (-1);
    float _3114 = _3100 * _3100;
    bool _3116 = !_3012;
    int _3118 = _3116 ? 0 : (-1);
    float _3120 = fma(_3104, _3104, _3114);
    float _3122 = fma(_3108, _3108, _3120);
    float _3124 = rsqrt(_3122);
    float _3126 = sqrt(_3122);
    float _3128 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3130 = _3104 * _3128;
    float _3132 = _3108 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 * _3132;
    float _3138 = _3134 + _3136;
    float _3140 = sqrt(_3138);
    bool _3142 = _3140 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3146 = _3140 + _3144;
    float _3148 = _3124;
    float _3150 = _3092;
    float _3152 = _3146;
    float _3154 = _3100;
    float _3156 = _3094;
    if (_3142)
    {
        float _3158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3158;
    }
    float _3160 = _3148;
    if (_3142)
    {
        float _3162 = rsqrt(_3138);
        _3150 = _3162;
    }
    float _3164 = _3150;
    float _3166 = _3164;
    if (_3142)
    {
        float _3168 = _3146 * _3160;
        _3152 = _3168;
    }
    float _3170 = _3152;
    bool _3172 = !_2894;
    int _3174 = _3172 ? 0 : 1;
    if (_3142)
    {
        float _3176 = _3170 * 0.15915493667125701904296875;
        _756 = _3176;
    }
    float _3178 = _756;
    float _3180 = _3108;
    if (_3142)
    {
        float _3182 = _3178 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        _3180 = _3184;
    }
    float _3186 = _3180;
    float _3188 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3190 = precise::max(0.0, _3188);
    float _3192 = _3160;
    float _3194 = _3190;
    if (_3142)
    {
        float _3196 = _3178 * 6.283185482025146484375;
        float _3198 = cos(_3196);
        _3192 = _3198;
    }
    float _3200 = _3192;
    float _3202 = -_3128;
    float _3204 = -_3190;
    float _3206 = fma(_3100, _3202, _3204);
    if (_3142)
    {
        float _3208 = _3206 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3154 = _3208;
    }
    float _3210 = _3154;
    float _3212 = _3210;
    float _3214 = _3186;
    if (_3142)
    {
        float _3216 = fma(_3186, _3210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3212 = _3216;
    }
    float _3218 = _3212;
    float _3220 = _3218;
    if (!_3142)
    {
        _3214 = _3130;
    }
    float _3222 = _3214;
    float _3224 = _3222;
    float _3226 = _3200;
    if (_3142)
    {
        float _3228 = _3200 + (-1.0);
        _3194 = _3228;
    }
    float _3230 = _3194;
    float _3232 = _3230;
    if (_3142)
    {
        float _3234 = _3164 * _3218;
        _2880 = _3234;
    }
    float _3236 = _2880;
    if (!_3142)
    {
        _3220 = _3206;
    }
    float _3238 = _3220;
    float _3240 = _3238;
    if (_3142)
    {
        float _3242 = _3230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3156 = _3242;
    }
    float _3244 = _3156;
    if (_3142)
    {
        float _3246 = _3130 * _3236;
        _3224 = _3246;
    }
    float _3248 = _3224;
    if (!_3142)
    {
        _3232 = _3132;
    }
    float _3250 = _3232;
    float _3252 = _3250;
    if (_3142)
    {
        float _3254 = _3132 * _3236;
        _3252 = _3254;
    }
    float _3256 = _3252;
    if (!_3142)
    {
        _3166 = _3134;
    }
    float _3258 = _3166;
    float _3260 = _3258;
    if (_3142)
    {
        float _3262 = fma(_3206, _3200, _3244);
        _3240 = _3262;
    }
    float _3264 = _3240;
    if (_3142)
    {
        float _3266 = _3248 * _3248;
        _3260 = _3266;
    }
    float _3268 = _3260;
    if (!_3142)
    {
        _3226 = _3136;
    }
    float _3270 = _3226;
    float _3272 = _3270;
    if (_3142)
    {
        float _3274 = _3256 * _3256;
        _3272 = _3274;
    }
    float _3276 = _3272;
    float _3278 = fma(_3264, _3264, _3268);
    int _3280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3282 = _3280 != 0;
    float _3284 = _3278 + _3276;
    float _3286 = rsqrt(_3284);
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3290 = fma(_3126, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3288);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = -_3292;
    float _3296 = _3294 + 1.0;
    float _3298 = abs(_3296);
    float _3300 = log2(_3298);
    float _3302 = _3286 * _3248;
    float _3304 = _3286 * _3264;
    float _3306 = _3286 * _3256;
    float _3308 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3310 = -_3308;
    float _3312 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3310);
    float _3314 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = -_3306;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3312);
    float _3320 = exp2(_3314);
    float _3322 = fma(_3318, -0.5, 0.5);
    float _3324 = fma(_3318, 0.5, 0.5);
    float _3326 = fma(_3324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3328 = sqrt(_3322);
    float _3330 = fma(_3324, _3326, -0.212114393711090087890625);
    float _3332 = fma(_3324, _3330, 1.570728778839111328125);
    float _3334 = _3304 + 1.0;
    float _3336 = -_3304;
    float _3338 = fma(_3320, _3334, _3336);
    int _3340 = _3112 & 3;
    bool _3342 = _3340 != 0;
    float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3346 = _3344 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3348 = !_3282;
    int _3350 = _3348 ? 0 : 1;
    float _3352 = fma(_3338, 0.5, 0.5);
    float _3354 = _3328 * 0.636619746685028076171875;
    int _3356 = ~_2316;
    int _3358 = _3356 + 1;
    bool _3360 = _3340 != 3;
    float _3362 = -_3332;
    float _3364 = fma(_3354, _3362, 1.0);
    bool _3366 = uint(_3340) >= 2u;
    int _3368 = _3358 * _3022;
    int _3370 = _3368 + _2850;
    float _3372 = 1.0 / _3346;
    int _3374 = _3366 ? 0 : 1;
    float2 _10534 = float2(_3364, _3352);
    float3 _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10534, float2(0.0), isnan(_10534)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10534, float2(0.0), isnan(_10534)), level(0.0)).xyz;
    float _3380 = _3378.x;
    float _3382 = _3378.y;
    float _3384 = _3378.z;
    bool _3386 = uint(_3370) >= uint(_2316);
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3392 = _3342 ? 0 : 1;
    float _3394 = trunc(_3014);
    float _3396 = precise::max(_3394, 0.0);
    uint _3398 = uint(_3396);
    bool _3400 = _2892 != 3;
    float _3402 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3404 = _620 + _3402;
    int _3406 = ~_3374;
    int _3408 = _3406 + 1;
    int _3410 = _3408 + 1;
    float _3412 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3414 = _620 + _3412;
    int _3416 = _3410;
    if (_3360)
    {
        int _3418 = ~_3374;
        int _3420 = _3418 + 1;
        _3416 = _3420;
    }
    int _3422 = _3416;
    float _3424 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3426 = !_3400;
    int _3428 = _3426 ? 0 : (-1);
    float _3430 = 1.0 / _3390;
    bool _3432 = _3340 != 3;
    float _3434 = -_660;
    float _3436 = _3434 + 1.0;
    bool _3438 = uint(_3340) > 1u;
    out.m_77.x = _1901;
    out.m_77.y = _1899;
    out.m_77.z = _1903;
    bool _3440 = !_3432;
    int _3442 = _3440 ? 0 : (-1);
    bool _3444 = !_3386;
    int _3446 = _3444 ? 0 : (-1);
    float _3448 = exp2(_3424);
    int _3450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3452 = _3450 != 0;
    int _3454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3456 = _3454 != 0;
    float _3458 = float(uint(_2788));
    int _3460 = int(_2954) + int(_3398);
    int _3462 = ~_2146;
    int _3464 = _3462 + 1;
    float _3466 = as_type<float>(_2410) * _3458;
    int _3468 = ~_3022;
    int _3470 = _3468 + _3446;
    int _3472 = _3470 + 1;
    int _3474 = ~_3392;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    int _3480 = _3464 * _3460;
    int _3482 = _3480 + _2704;
    int _3484 = _3478;
    if (!_3438)
    {
        int _3486 = ~_3392;
        int _3488 = _3486 + 1;
        _3484 = _3488;
    }
    int _3490 = _3484;
    int _3492 = _2316 * _3472;
    int _3494 = _3492 + _2850;
    int _3496 = _3112 & 3;
    bool _3498 = _3496 != 0;
    float _3500 = trunc(_3466);
    float _3502 = precise::max(_3500, 0.0);
    uint _3504 = uint(_3502);
    float _3506 = -_3448;
    float _3508 = _3506 + 1.0;
    bool _3510 = !_3498;
    int _3512 = _3510 ? 0 : 1;
    bool _3514 = uint(_3482) >= uint(_2146);
    float _3516 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3518 = _3516 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3520 = !_2738;
    int _3522 = _3520 ? _3494 : (-1);
    float _3524 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3526 = !_3514;
    int _3528 = _3526 ? 0 : (-1);
    int _3530 = _3522 & 3;
    bool _3532 = _3530 != 0;
    float _3534 = 1.0 / _3518;
    int _3536 = ~_2316;
    int _3538 = _3536 + 1;
    float _3540 = _3524 * _2099;
    int _3542 = _3532 ? 0 : 1;
    bool _3544 = uint(_3530) >= 2u;
    int _3546 = _3538 * int(_3504);
    int _3548 = _3546 + _2788;
    int _3550 = _3544 ? 0 : 1;
    float _3552 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3554 = _3552 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3556 = _3530 != 3;
    float _3558 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3560 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3558;
    float _3562 = _3560 * _3372;
    float _3564 = float(uint(_3548));
    float _3566 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3568 = _3566 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3570 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3572 = _3570 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3574 = 1.0 / _3554;
    float _3576 = as_type<float>(_2410) * _3564;
    float _3578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3580 = _3578 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3582 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3584 = _620 + _3582;
    float _3586 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3588 = _3586 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _3590 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3592 = isnan(_620);
    bool _3594 = _3590 || _3592;
    bool _3596 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3598 = _3594 || _3596;
    float _3600 = float(_3598);
    float _3602 = 1.0 / _3568;
    float _3604 = _3588 * _3534;
    bool _3606 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3608 = isnan(_620);
    bool _3610 = _3606 || _3608;
    bool _3612 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3614 = _3610 || _3612;
    float _3616 = float(_3614);
    float _3618 = -_3600;
    float _3620 = _3618 + 1.0;
    int _3622 = ~_2966;
    int _3624 = _3622 + _3118;
    int _3626 = _3624 + 1;
    float _3628 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3630 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3628;
    float _3632 = fma(_3604, _3404, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3634 = trunc(_3576);
    float _3636 = precise::max(_3634, 0.0);
    uint _3638 = uint(_3636);
    float _3640 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3642 = _3640 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3644 = ~_3550;
    int _3646 = _3644 + 1;
    int _3648 = _3646 + 1;
    float _3650 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3652 = _620 + _3650;
    int _3654 = _3648;
    if (_3556)
    {
        int _3656 = ~_3550;
        int _3658 = _3656 + 1;
        _3654 = _3658;
    }
    int _3660 = _3654;
    float _3662 = _3642 * _3430;
    bool _3664 = _3530 != 3;
    float _3666 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3668 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3666;
    float _3670 = 1.0 / _3580;
    float _3672 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3674 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3672;
    bool _3676 = !_3664;
    int _3678 = _3676 ? 0 : (-1);
    float _3680 = _3668 * _3574;
    bool _3682 = uint(_3530) > 1u;
    float _3684 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3686 = _620 + _3684;
    float _3688 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3690 = _3688 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3692 = _3674 * _3602;
    int _3694 = int(_3504) + int(_3638);
    float _3696 = fma(_3562, _3686, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3698 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3700 = isnan(_620);
    bool _3702 = _3698 || _3700;
    bool _3704 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3706 = _3702 || _3704;
    float _3708 = float(_3706);
    float _3710 = 1.0 / _3572;
    int _3712 = ~_3542;
    int _3714 = _3712 + 1;
    int _3716 = _3714 + 1;
    float _3718 = fma(_3662, _3584, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3720 = ~_2316;
    int _3722 = _3720 + 1;
    float _3724 = _3708 * _3620;
    float _3726 = _3690 * _3670;
    int _3728 = _3716;
    float _3730 = _3726;
    float _3732 = _3692;
    float _3734 = _3718;
    if (!_3682)
    {
        int _3736 = ~_3542;
        int _3738 = _3736 + 1;
        _3728 = _3738;
    }
    int _3740 = _3728;
    float _3742 = -_3708;
    float _3744 = _3742 + 1.0;
    bool _3746 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3748 = isnan(_620);
    bool _3750 = _3746 || _3748;
    bool _3752 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3754 = _3750 || _3752;
    float _3756 = float(_3754);
    int _3758 = _3722 * _3694;
    int _3760 = _3758 + _2788;
    bool _3762 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3764 = isnan(_620);
    bool _3766 = _3762 || _3764;
    bool _3768 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3770 = _3766 || _3768;
    float _3772 = float(_3770);
    int _3774 = _702 * _3626;
    int _3776 = _3774 + _2304;
    bool _3778 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3780 = isnan(_620);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3786 = _3782 || _3784;
    float _3788 = float(_3786);
    float _3790 = -_3756;
    float _3792 = _3790 + 1.0;
    float _3794 = _3756 * _3744;
    bool _3796 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3798 = isnan(_620);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3804 = _3800 || _3802;
    float _3806 = float(_3804);
    float _3808 = -_3772;
    float _3810 = _3808 + 1.0;
    float _3812 = _3772 * _3792;
    int _3814 = _3522 & 3;
    bool _3816 = _3814 != 0;
    float _3818 = -_3788;
    float _3820 = _3818 + 1.0;
    bool _3822 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3824 = isnan(_620);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3830 = _3826 || _3828;
    float _3832 = float(_3830);
    float _3834 = _3806 * _3810;
    float _3836 = -_3806;
    float _3838 = _3836 + 1.0;
    float _3840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3842 = _620 + _3840;
    bool _3844 = !_3816;
    int _3846 = _3844 ? 0 : 1;
    float _3848 = -_3832;
    float _3850 = _3848 + 1.0;
    bool _3852 = uint(_3760) >= uint(_2316);
    float _3854 = _3630 * _3710;
    float _3856 = _3788 * _3838;
    float _3858 = in.m_79.x;
    float _3860 = in.m_79.y;
    float _3862 = in.m_79.z;
    float _3864 = fma(_3680, _3842, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3866 = _3832 * _3820;
    bool _3868 = !_3852;
    int _3870 = _3868 ? 0 : (-1);
    float _3872 = in.m_81.x;
    float _3874 = in.m_81.y;
    float _3876 = in.m_81.z;
    float _3878 = in.m_81.w;
    float _3880 = _3616 * _3850;
    bool _3882 = _1246 != 0.0;
    bool _3884 = isnan(_1246);
    bool _3886 = _3882 || _3884;
    bool _3888 = isnan(0.0);
    bool _3890 = _3886 || _3888;
    float _3892 = -_3616;
    float _3894 = _3892 + 1.0;
    float _3896 = fma(_3692, _3414, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3898 = _3696 * _3880;
    bool _3900 = _1244 == 0.0;
    bool _3902 = !_3890;
    bool _3904 = _3900 && _3902;
    float _3906 = fma(_3726, _3652, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _3908 = ~_3694;
    int _3910 = _3908 + _3870;
    int _3912 = _3910 + 1;
    float _3914 = fma(_3894, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3898);
    bool _3916 = _1248 == 0.0;
    bool _3918 = _3916 && _3904;
    float _3920 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3922 = _620 + _3920;
    int _3924 = ~_3460;
    int _3926 = _3924 + _3528;
    int _3928 = _3926 + 1;
    float _3930 = abs(_1300);
    float _3932 = log2(_3930);
    float _3934 = fma(_3718, _3866, _3914);
    float _3936 = fma(_3854, _3922, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3938 = _2316 * _3912;
    int _3940 = _3938 + _2788;
    int _3942 = abs(_3512);
    float _3944 = fma(_3864, _3856, _3934);
    int _3946 = _2146 * _3928;
    int _3948 = _3946 + _2704;
    int _3950 = abs(_2948);
    float _3952 = fma(_3632, _3834, _3944);
    if (_3918)
    {
        _3730 = _3860;
    }
    float _3954 = _3730;
    float _3956 = _3954;
    if (!_3918)
    {
        float _3958 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3860);
        _3956 = _3958;
    }
    float _3960 = _3956;
    float _3962 = _3874 * _3862;
    if (_3918)
    {
        _3732 = _3858;
    }
    float _3964 = _3732;
    float _3966 = _3964;
    if (!_3918)
    {
        float _3968 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3858);
        _3966 = _3968;
    }
    float _3970 = _3966;
    if (_3918)
    {
        _3734 = _3862;
    }
    float _3972 = _3734;
    float _3974 = _3876 * _3858;
    float _3976 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3978 = _3972;
    if (!_3918)
    {
        float _3980 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3862);
        _3978 = _3980;
    }
    float _3982 = _3978;
    float _3984 = _3872 * _3860;
    float _3986 = fma(_3896, _3812, _3952);
    float _3988 = -_3962;
    float _3990 = fma(_3876, _3860, _3988);
    float _3992 = -_3974;
    float _3994 = fma(_3872, _3862, _3992);
    float _3996 = -_3984;
    float _3998 = fma(_3874, _3858, _3996);
    float _4000 = fma(_3906, _3794, _3986);
    float _4002 = _3990 * _3878;
    float _4004 = exp2(_3976);
    int _4006 = _3522 >> 31;
    float _4008 = _3994 * _3878;
    float _4010 = _3998 * _3878;
    int _4012 = _2858 >> 31;
    float _4014 = fma(_3936, _3724, _4000);
    int _4016 = _4006 & 3;
    float _4018 = _1559 * _1601;
    int _4020 = _4012 & 3;
    float _4022 = fma(_3600, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4014);
    int _4024 = _3522 + _4016;
    float _4026 = _1559 * _1705;
    float _4028 = _1497 * _1705;
    int _4030 = _2858 + _4020;
    float _4032 = _1497 * _1601;
    int _4034 = _4024 >> 2;
    float _4036 = fma(_4004, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4038 = precise::clamp(_4036, 0.0, 1.0);
    float _4040 = _1567 * _1609;
    int _4042 = _3112 >> 31;
    float _4044 = _4038 * _4038;
    int _4046 = _4034 << 4;
    int _4048 = _4046 + 656;
    float _4050 = fma(_4038, -2.0, 3.0);
    int _4052 = _4030 >> 2;
    float _4054 = fma(_1519, _1533, _4026);
    int _4056 = _4042 & 3;
    uint _4058 = uint(int(uint(_4048) >> uint(2)));
    uint _4060 = uint(int(uint(int(_4058)) >> uint(2)));
    int _4062 = int(_4058) & 3;
    float _4064 = (*spvDescriptorSet0.vp_c9)._m0[int(_4060)][_4062];
    int _4066 = int(_4058) + 1;
    uint _4068 = uint(int(uint(_4066) >> uint(2)));
    int _4070 = _4066 & 3;
    float _4072 = (*spvDescriptorSet0.vp_c9)._m0[int(_4068)][_4070];
    int _4074 = _4052 << 4;
    int _4076 = _4074 + 368;
    float _4078 = _4044 * _4050;
    int _4080 = _3112 + _4056;
    float _4082 = _1559 * _1609;
    float _4084 = _1497 * _1609;
    float _4086 = _1567 * _1705;
    int _4088 = _4080 >> 2;
    uint _4090 = uint(int(uint(_4076) >> uint(2)));
    uint _4092 = uint(int(uint(int(_4090)) >> uint(2)));
    int _4094 = int(_4090) & 3;
    float _4096 = (*spvDescriptorSet0.vp_c9)._m0[int(_4092)][_4094];
    int _4098 = int(_4090) + 1;
    uint _4100 = uint(int(uint(_4098) >> uint(2)));
    int _4102 = _4098 & 3;
    float _4104 = (*spvDescriptorSet0.vp_c9)._m0[int(_4100)][_4102];
    float _4106 = _1567 * _1601;
    float _4108 = fma(_1519, _1531, _4082);
    int _4110 = _4088 << 4;
    int _4112 = _4110 + 512;
    float _4114 = fma(_1519, _1535, _4018);
    float _4116 = -_1495;
    float _4118 = fma(_4116, _1531, _4084);
    float _4120 = -_1495;
    float _4122 = fma(_4120, _1533, _4028);
    float _4124 = -_1495;
    float _4126 = fma(_4124, _1535, _4032);
    int _4128 = _4076 + 8;
    uint _4130 = uint(int(uint(_4128) >> uint(2)));
    uint _4132 = uint(int(uint(int(_4130)) >> uint(2)));
    int _4134 = int(_4130) & 3;
    float _4136 = (*spvDescriptorSet0.vp_c9)._m0[int(_4132)][_4134];
    int _4138 = int(_4130) + 1;
    uint _4140 = uint(int(uint(_4138) >> uint(2)));
    int _4142 = _4138 & 3;
    float _4144 = (*spvDescriptorSet0.vp_c9)._m0[int(_4140)][_4142];
    float _4146 = fma(_1523, _1531, _4040);
    float _4148 = fma(_1523, _1533, _4086);
    float _4150 = fma(_1523, _1535, _4106);
    int _4152 = abs(_3490);
    float _4154 = fma(_1499, _1258, _4118);
    int _4156 = abs(_3740);
    float _4158 = fma(_1499, _1286, _4122);
    uint _4160 = uint(int(uint(_4112) >> uint(2)));
    uint _4162 = uint(int(uint(int(_4160)) >> uint(2)));
    int _4164 = int(_4160) & 3;
    float _4166 = (*spvDescriptorSet0.vp_c9)._m0[int(_4162)][_4164];
    int _4168 = int(_4160) + 1;
    uint _4170 = uint(int(uint(_4168) >> uint(2)));
    int _4172 = _4168 & 3;
    float _4174 = (*spvDescriptorSet0.vp_c9)._m0[int(_4170)][_4172];
    int _4176 = ~_3950;
    int _4178 = _4176 + 1;
    int _4180 = _4178 + 1;
    float _4182 = fma(_1499, _1272, _4126);
    int _4184 = ~_4156;
    int _4186 = _4184 + 1;
    int _4188 = _4186 + 1;
    float _4190 = fma(_1563, _1286, _4054);
    int _4192 = abs(_2998);
    float _4194 = fma(_1569, _1286, _4148);
    int _4196 = ~_4152;
    int _4198 = _4196 + 1;
    int _4200 = _4198 + 1;
    int _4202 = _4112 + 8;
    uint _4204 = uint(int(uint(_4202) >> uint(2)));
    uint _4206 = uint(int(uint(int(_4204)) >> uint(2)));
    int _4208 = int(_4204) & 3;
    float _4210 = (*spvDescriptorSet0.vp_c9)._m0[int(_4206)][_4208];
    int _4212 = int(_4204) + 1;
    uint _4214 = uint(int(uint(_4212) >> uint(2)));
    int _4216 = _4212 & 3;
    float _4218 = (*spvDescriptorSet0.vp_c9)._m0[int(_4214)][_4216];
    int _4220 = ~_4192;
    int _4222 = _4220 + 1;
    int _4224 = _4222 + 1;
    float _4226 = fma(_1563, _1258, _4108);
    float _4228 = fma(_1563, _1272, _4114);
    int _4230 = abs(_3660);
    float _4232 = fma(_1569, _1272, _4150);
    int _4234 = ~_3942;
    int _4236 = _4234 + 1;
    int _4238 = _4236 + 1;
    int _4240 = _4048 + 8;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    uint _4244 = uint(int(uint(int(_4242)) >> uint(2)));
    int _4246 = int(_4242) & 3;
    float _4248 = (*spvDescriptorSet0.vp_c9)._m0[int(_4244)][_4246];
    int _4250 = int(_4242) + 1;
    uint _4252 = uint(int(uint(_4250) >> uint(2)));
    int _4254 = _4250 & 3;
    float _4256 = (*spvDescriptorSet0.vp_c9)._m0[int(_4252)][_4254];
    int _4258 = ~_4230;
    int _4260 = _4258 + 1;
    int _4262 = _4260 + 1;
    float _4264 = fma(_1569, _1258, _4146);
    bool _4266 = !_2612;
    int _4268 = _4266 ? _3948 : (-1);
    out.m_83.x = _4022;
    bool _4270 = !_2738;
    int _4272 = _4270 ? _3940 : (-1);
    int _4274 = _4188 * as_type<int>(_4072);
    int _4276 = abs(_3174);
    float _4278 = _4158 * _3874;
    float _4280 = _4182 * _3874;
    int _4282 = ~_4276;
    int _4284 = _4282 + 1;
    int _4286 = _4284 + 1;
    int _4288 = _4180 * as_type<int>(_4104);
    float _4290 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4292 = int(_4290);
    int _4294 = _4286 * as_type<int>(_4096);
    int _4296 = _4294 + _4288;
    int _4298 = abs(_3422);
    float _4300 = _4008 * _4158;
    int _4302 = abs(_3350);
    int _4304 = _4224 * as_type<int>(_4136);
    int _4306 = _4304 + _4296;
    int _4308 = ~_4298;
    int _4310 = _4308 + 1;
    int _4312 = _4310 + 1;
    float _4314 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4316 = int(_4314);
    int _4318 = _4200 * as_type<int>(_4174);
    int _4320 = abs(_3846);
    float _4322 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4324 = int(_4322);
    float _4326 = float(uint(_4292));
    int _4328 = _4238 * as_type<int>(_4166);
    int _4330 = _4328 + _4318;
    int _4332 = ~_4320;
    int _4334 = _4332 + 1;
    int _4336 = _4334 + 1;
    int _4338 = abs(_3428);
    int _4340 = _4312 * as_type<int>(_4210);
    int _4342 = _4340 + _4330;
    int _4344 = abs(_3678);
    int _4346 = _4336 * as_type<int>(_4064);
    int _4348 = _4346 + _4274;
    int _4350 = ~_4338;
    int _4352 = _4350 + 1;
    int _4354 = _4352 + 1;
    float _4356 = 1.0 / _4326;
    int _4358 = abs(_3442);
    float _4360 = _4154 * _3874;
    int _4362 = ~_4344;
    int _4364 = _4362 + 1;
    int _4366 = _4364 + 1;
    int _4368 = _4354 * as_type<int>(_4144);
    int _4370 = _4368 + _4306;
    int _4372 = ~_4358;
    int _4374 = _4372 + 1;
    int _4376 = _4374 + 1;
    int _4378 = _4262 * as_type<int>(_4248);
    int _4380 = _4378 + _4348;
    float _4382 = float(uint(_4316));
    float _4384 = _4158 * _3960;
    int _4386 = abs(_4292);
    int _4388 = _4376 * as_type<int>(_4218);
    int _4390 = _4388 + _4342;
    float _4392 = 1.0 / _4382;
    float _4394 = float(uint(_4324));
    int _4396 = _4366 * as_type<int>(_4256);
    int _4398 = _4396 + _4380;
    bool _4400 = !_3452;
    int _4402 = _4400 ? 0 : 1;
    int _4404 = ~_4302;
    int _4406 = _4404 + 1;
    int _4408 = _4406 + 1;
    float _4410 = float(uint(_4386));
    float _4412 = 1.0 / _4394;
    bool _4414 = !_3456;
    int _4416 = _4414 ? 0 : 1;
    int _4418 = _4370 * _4408;
    int _4420 = abs(_4402);
    int _4422 = abs(_4416);
    int _4424 = ~_4420;
    int _4426 = _4424 + 1;
    int _4428 = _4426 + 1;
    float _4430 = 1.0 / _4410;
    bool _4432 = !_2234;
    int _4434 = _4432 ? _3776 : (-1);
    int _4436 = abs(_4324);
    int _4438 = _4428 * _4390;
    int _4440 = ~_4316;
    int _4442 = _4440 + 1;
    int _4444 = _4434 * _4302;
    int _4446 = _4444 + _4418;
    int _4448 = abs(_4316);
    int _4450 = ~_4422;
    int _4452 = _4450 + 1;
    int _4454 = _4452 + 1;
    float _4456 = float(uint(_4436));
    int _4458 = as_type<int>(_4356) + (-2);
    int _4460 = _4454 * _4398;
    float _4462 = float(uint(_4446));
    int _4464 = _4268 * _4420;
    int _4466 = _4464 + _4438;
    int _4468 = as_type<int>(_4412) + (-2);
    int _4470 = _4272 * _4422;
    int _4472 = _4470 + _4460;
    float _4474 = 1.0 / _4456;
    float _4476 = float(uint(_4448));
    float _4478 = _4154 * _3960;
    float _4480 = float(uint(_4466));
    float _4482 = _4182 * _3960;
    float _4484 = float(uint(_4472));
    int _4486 = abs(_4446);
    float _4488 = as_type<float>(_4468) * _4480;
    int _4490 = as_type<int>(_4392) + (-2);
    float _4492 = as_type<float>(_4458) * _4462;
    float _4494 = 1.0 / _4476;
    int _4496 = as_type<int>(_4430) + (-2);
    float _4498 = as_type<float>(_4490) * _4484;
    int _4500 = abs(_4466);
    int _4502 = as_type<int>(_4474) + (-2);
    float _4504 = trunc(_4492);
    float _4506 = precise::max(_4504, 0.0);
    uint _4508 = uint(_4506);
    int _4510 = ~_4292;
    int _4512 = _4510 + 1;
    float _4514 = float(uint(_4500));
    float _4516 = float(uint(_4486));
    float _4518 = trunc(_4498);
    float _4520 = precise::max(_4518, 0.0);
    uint _4522 = uint(_4520);
    int _4524 = abs(_4472);
    float _4526 = as_type<float>(_4502) * _4514;
    int _4528 = as_type<int>(_4494) + (-2);
    float _4530 = as_type<float>(_4496) * _4516;
    float _4532 = float(uint(_4524));
    float _4534 = _4008 * _4154;
    int _4536 = ~_4324;
    int _4538 = _4536 + 1;
    float _4540 = trunc(_4488);
    float _4542 = precise::max(_4540, 0.0);
    uint _4544 = uint(_4542);
    int _4546 = _4512 * int(_4508);
    int _4548 = _4546 + _4446;
    float _4550 = _4008 * _4182;
    float _4552 = as_type<float>(_4528) * _4532;
    float _4554 = fma(_4228, _3872, _4280);
    float _4556 = float(uint(_4548));
    float _4558 = fma(_4226, _3872, _4360);
    float _4560 = trunc(_4530);
    float _4562 = precise::max(_4560, 0.0);
    uint _4564 = uint(_4562);
    int _4566 = _4442 * int(_4522);
    int _4568 = _4566 + _4472;
    int _4570 = ~_4386;
    int _4572 = _4570 + 1;
    float _4574 = as_type<float>(_4458) * _4556;
    float _4576 = float(uint(_4568));
    float _4578 = trunc(_4526);
    float _4580 = precise::max(_4578, 0.0);
    uint _4582 = uint(_4580);
    int _4584 = _4538 * int(_4544);
    int _4586 = _4584 + _4466;
    float _4588 = fma(_4190, _3872, _4278);
    float _4590 = as_type<float>(_4490) * _4576;
    int _4592 = ~_4448;
    int _4594 = _4592 + 1;
    float _4596 = fma(_4226, _3970, _4478);
    float _4598 = float(uint(_4586));
    float _4600 = trunc(_4552);
    float _4602 = precise::max(_4600, 0.0);
    uint _4604 = uint(_4602);
    int _4606 = _4572 * int(_4564);
    int _4608 = _4606 + _4486;
    int _4610 = ~_4436;
    int _4612 = _4610 + 1;
    float _4614 = as_type<float>(_4468) * _4598;
    float _4616 = fma(_4002, _4226, _4534);
    float _4618 = float(uint(_4608));
    float _4620 = fma(_4190, _3970, _4384);
    int _4622 = _4612 * int(_4582);
    int _4624 = _4622 + _4500;
    float _4626 = trunc(_4614);
    float _4628 = precise::max(_4626, 0.0);
    uint _4630 = uint(_4628);
    float _4632 = as_type<float>(_4496) * _4618;
    float _4634 = fma(_4002, _4190, _4300);
    float _4636 = float(uint(_4624));
    float _4638 = _3384 * _3540;
    float _4640 = fma(_4194, _3982, _4620);
    int _4642 = _4594 * int(_4604);
    int _4644 = _4642 + _4524;
    int _4646 = ~_4324;
    int _4648 = _4646 + 1;
    float _4650 = trunc(_4574);
    float _4652 = precise::max(_4650, 0.0);
    uint _4654 = uint(_4652);
    float _4656 = as_type<float>(_4502) * _4636;
    float _4658 = fma(_4228, _3970, _4482);
    float _4660 = float(uint(_4644));
    float _4662 = fma(_4002, _4228, _4550);
    float _4664 = fma(_4264, _3876, _4558);
    float _4666 = fma(_4194, _3876, _4588);
    float _4668 = fma(_4232, _3876, _4554);
    float _4670 = trunc(_4656);
    float _4672 = precise::max(_4670, 0.0);
    uint _4674 = uint(_4672);
    float _4676 = as_type<float>(_4528) * _4660;
    int _4678 = int(_4544) + int(_4630);
    int _4680 = ~_4292;
    int _4682 = _4680 + 1;
    out.m_85.x = _4664;
    out.m_85.y = _4666;
    out.m_85.z = _4668;
    float _4684 = trunc(_4632);
    float _4686 = precise::max(_4684, 0.0);
    uint _4688 = uint(_4686);
    int _4690 = int(_4508) + int(_4654);
    float _4692 = trunc(_4676);
    float _4694 = precise::max(_4692, 0.0);
    uint _4696 = uint(_4694);
    float _4698 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _4700 = _4682 * _4690;
    int _4702 = _4700 + _4446;
    int _4704 = int(_4582) + int(_4674);
    int _4706 = _4648 * _4678;
    int _4708 = _4706 + _4466;
    float _4710 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4698);
    int _4712 = ~_4386;
    int _4714 = _4712 + 1;
    float _4716 = trunc(_4590);
    float _4718 = precise::max(_4716, 0.0);
    uint _4720 = uint(_4718);
    int _4722 = int(_4564) + int(_4688);
    float _4724 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4710);
    int _4726 = ~_4448;
    int _4728 = _4726 + 1;
    bool _4730 = uint(_4708) >= uint(_4324);
    int _4732 = _4714 * _4722;
    int _4734 = _4732 + _4486;
    int _4736 = ~_4316;
    int _4738 = _4736 + 1;
    float _4740 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4724);
    int _4742 = int(_4604) + int(_4696);
    float _4744 = _4740 + _2011;
    bool _4746 = uint(_4702) >= uint(_4292);
    int _4748 = ~_4436;
    int _4750 = _4748 + 1;
    int _4752 = _4728 * _4742;
    int _4754 = _4752 + _4524;
    int _4756 = int(_4522) + int(_4720);
    float _4758 = _4744 * 0.5;
    bool _4760 = uint(_4734) >= uint(_4386);
    int _4762 = _4750 * _4704;
    int _4764 = _4762 + _4500;
    bool _4766 = !_4746;
    int _4768 = _4766 ? 0 : (-1);
    int _4770 = _4738 * _4756;
    int _4772 = _4770 + _4472;
    bool _4774 = !_4730;
    int _4776 = _4774 ? 0 : (-1);
    float _4778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4780 = uint(_4754) >= uint(_4448);
    bool _4782 = uint(_4772) >= uint(_4316);
    int _4784 = ~_4690;
    int _4786 = _4784 + _4768;
    int _4788 = _4786 + 1;
    int _4790 = ~_4678;
    int _4792 = _4790 + _4776;
    int _4794 = _4792 + 1;
    float _4796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4798 = uint(_4764) >= uint(_4436);
    bool _4800 = !_4782;
    int _4802 = _4800 ? 0 : (-1);
    bool _4804 = _4292 == 0;
    bool _4806 = _4292 == 0;
    float _4808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4810 = _4446 ^ _4292;
    int _4812 = _4292 * _4788;
    int _4814 = _4812 + _4446;
    bool _4816 = !_4760;
    int _4818 = _4816 ? 0 : (-1);
    int _4820 = _4324 * _4794;
    int _4822 = _4820 + _4466;
    bool _4824 = _4324 == 0;
    int _4826 = ~_4756;
    int _4828 = _4826 + _4802;
    int _4830 = _4828 + 1;
    float _4832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4834 = !_4824;
    int _4836 = _4834 ? _4822 : (-1);
    bool _4838 = !_4804;
    int _4840 = _4838 ? _4814 : (-1);
    int _4842 = _4316 * _4830;
    int _4844 = _4842 + _4472;
    bool _4846 = _4316 == 0;
    bool _4848 = _4316 == 0;
    int _4850 = _4472 ^ _4316;
    float _4852 = _4796 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _4854 = float(_4836);
    bool _4856 = !_4798;
    int _4858 = _4856 ? 0 : (-1);
    float _4860 = fma(_4852, _2462, -0.5);
    int _4862 = _4466 ^ _4324;
    float _4864 = fma(_4852, _4854, _1172);
    uint _4866 = uint(int(uint(_4810) >> uint(31)));
    float _4868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4870 = _4324 == 0;
    float _4872 = _4778 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4874 = float(_4840);
    float _4876 = fma(_1064, _4860, _4864);
    bool _4878 = !_4780;
    int _4880 = _4878 ? 0 : (-1);
    float _4882 = fma(_4872, _2408, -0.5);
    uint _4884 = uint(int(uint(_4850) >> uint(31)));
    float _4886 = fma(_4872, _4874, _762);
    bool _4888 = !_4846;
    int _4890 = _4888 ? _4844 : (-1);
    float _4892 = _4832 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4894 = ~_4818;
    int _4896 = _4722 + _4894;
    int _4898 = _4896 + 1;
    float _4900 = fma(_1158, _4882, _4886);
    uint _4902 = uint(int(uint(_4862) >> uint(31)));
    float _4904 = fma(_4892, _2498, -0.5);
    int _4906 = ~int(_4866);
    int _4908 = _4906 + 1;
    float _4910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4912 = ~_4880;
    int _4914 = _4742 + _4912;
    int _4916 = _4914 + 1;
    float _4918 = _4900 + 0.5;
    int _4920 = ~int(_4884);
    int _4922 = _4920 + 1;
    float _4924 = float(_4890);
    int _4926 = ~_4858;
    int _4928 = _4704 + _4926;
    int _4930 = _4928 + 1;
    int _4932 = ~int(_4902);
    int _4934 = _4932 + 1;
    int _4936 = _4898 ^ _4908;
    int _4938 = _4916 ^ _4922;
    float _4940 = fma(_4892, _4924, _892);
    int _4942 = _4930 ^ _4934;
    float _4944 = _4808 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4946 = ~_4908;
    int _4948 = _4946 + _4936;
    int _4950 = _4948 + 1;
    float _4952 = fma(_1164, _4904, _4940);
    int _4954 = ~_4934;
    int _4956 = _4954 + _4942;
    int _4958 = _4956 + 1;
    bool _4960 = !_4806;
    int _4962 = _4960 ? _4950 : (-1);
    float _4964 = _4952 + 0.5;
    bool _4966 = !_4870;
    int _4968 = _4966 ? _4958 : (-1);
    float _4970 = float(_4962);
    float _4972 = float(_4968);
    float _4974 = fma(_2618, _4944, -0.5);
    bool _4976 = _1300 <= 8000.0;
    bool _4978 = isnan(_1300);
    bool _4980 = _4976 || _4978;
    bool _4982 = isnan(8000.0);
    bool _4984 = _4980 || _4982;
    float _4986 = float(_4984);
    float _4988 = -_774;
    float _4990 = fma(_4944, _4970, _4988);
    float _4992 = fma(_4010, _4194, _4634);
    int _4994 = ~_4922;
    int _4996 = _4994 + _4938;
    int _4998 = _4996 + 1;
    float _5000 = _4910 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5002 = fma(_1160, _4974, _4990);
    float _5004 = fma(_4010, _4264, _4616);
    float _5006 = fma(_4010, _4232, _4662);
    float _5008 = -_4078;
    float _5010 = _5008 + 1.0;
    bool _5012 = !_4848;
    int _5014 = _5012 ? _4998 : (-1);
    float _5016 = _4868 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5018 = _4744;
    float _5020 = _4740;
    if (!_1981)
    {
        _5018 = 1.0;
    }
    float _5022 = _5018;
    float _5024 = fma(_5010, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4078);
    out.m_87.x = _5004;
    out.m_87.y = _4992;
    out.m_87.z = _5006;
    float _5026 = float(_5014);
    float _5028 = fma(_2830, _5000, -0.5);
    float _5030 = _4986 * _5024;
    float _5032 = _5022;
    if (_1981)
    {
        bool _5034 = _2097 >= _2061;
        bool _5036 = isnan(_2097);
        bool _5038 = _5034 || _5036;
        bool _5040 = isnan(_2061);
        bool _5042 = _5038 || _5040;
        float _5044 = float(_5042);
        _5032 = _5044;
    }
    float _5046 = _5032;
    float _5048 = -_1174;
    float _5050 = fma(_5000, _4972, _5048);
    float _5052 = fma(_5016, _2884, -0.5);
    float _5054 = -_1176;
    float _5056 = fma(_5016, _5026, _5054);
    float _5058 = _5046 * _3096;
    float _5060 = fma(_1168, _5028, _5050);
    out.gl_Position.x = _2037;
    out.gl_Position.y = _2043;
    out.gl_Position.z = _4740;
    out.gl_Position.w = _2011;
    float _5062 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5064 = fma(_1166, _5052, _5056);
    float _5066 = fma(_4264, _3982, _4596);
    float _5068 = _4876 + 0.5;
    float _5070 = _3436 * _5062;
    float _5072 = precise::clamp(_5070, 0.0, 1.0);
    float _5074 = _5002 + 0.5;
    float _5076 = _5060 + 0.5;
    float _5078 = _5064 + 0.5;
    float _5080 = -_5072;
    float _5082 = fma(_5080, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5084 = fma(_4232, _3982, _4658);
    float _5086 = fma(_2110, _4638, _2108);
    float _5088 = -_5058;
    float _5090 = fma(_5088, _5082, 1.0);
    float _5092 = precise::clamp(_5090, 0.0, 1.0);
    float _5094 = _2110 * _3540;
    float _5096 = -_3524;
    float _5098 = _5096 + 1.0;
    out.m_89.x = _4918;
    out.m_89.y = _5074;
    out.m_89.z = _5068;
    out.m_89.w = _5076;
    float _5100 = _5092 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5102 = fma(_3380, _5094, _2104);
    float _5104 = fma(_3382, _5094, _2106);
    float _5106 = _2110 * _5098;
    out.m_91.x = _4964;
    out.m_91.y = _5078;
    bool _5108 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5110 = isnan(_3126);
    bool _5112 = _5108 || _5110;
    bool _5114 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5116 = _5112 || _5114;
    out.m_93.z = _4758;
    out.m_93.w = _2011;
    out.m_95.x = _5100;
    out.m_97.x = _5102;
    out.m_97.y = _5104;
    out.m_97.z = _5086;
    out.m_97.w = _5106;
    float _5118 = _5058;
    float _5120 = _5094;
    float _5122 = _5098;
    float _5124 = _5092;
    if (!_5116)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5126 = _5118;
    out.m_99.x = _5066;
    out.m_99.y = _4640;
    out.m_99.z = _5084;
    float _5128 = _5126;
    float _5130 = _5126;
    if (!_5116)
    {
        _2013 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5132 = _2013;
    float _5134 = _5132;
    float _5136 = _5132;
    if (!_5116)
    {
        _5020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5138 = _5020;
    float _5140 = _5138;
    float _5142 = _5138;
    if (!_5116)
    {
        _5120 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5144 = _5120;
    float _5146 = _5144;
    float _5148 = _5144;
    if (!_5116)
    {
        _5122 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5150 = _5122;
    float _5152 = _5150;
    float _5154 = _5150;
    if (!_5116)
    {
        _5124 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5156 = _5124;
    bool _5158 = !_5116;
    float _5160 = _5156;
    float _5162 = _5156;
    if (!_5158)
    {
        bool _5164 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5166 = isnan(_3126);
        bool _5168 = _5164 || _5166;
        bool _5170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5172 = _5168 || _5170;
        if (!_5172)
        {
            float _5174 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5176 = _3126 + _5174;
            float _5178 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5180 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5178;
            float _5182 = 1.0 / _5180;
            float _5184 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5186 = _5184 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5188 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5190 = _5188 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5192 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5194 = _5192 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5196 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5198 = _5196 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5200 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5202 = _5200 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5204 = _5176 * _5182;
            float _5206 = precise::clamp(_5204, 0.0, 1.0);
            float _5208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5210 = _5208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5212 = fma(_5206, _5186, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5214 = fma(_5206, _5210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5216 = fma(_5206, _5190, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5218 = fma(_5206, _5194, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5220 = fma(_5206, _5198, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5222 = fma(_5206, _5202, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5136 = _5214;
            _5154 = _5220;
            _5130 = _5212;
            _5148 = _5218;
            _5142 = _5216;
            _5162 = _5222;
            _5224 = true;
        }
        else
        {
            bool _5226 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5228 = isnan(_3126);
            bool _5230 = _5226 || _5228;
            bool _5232 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5234 = _5230 || _5232;
            if (!_5234)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5236 = _5128;
            _5130 = _5236;
            if (!_5234)
            {
                _5134 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5238 = _5134;
            _5136 = _5238;
            if (!_5234)
            {
                _5140 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5240 = _5140;
            _5142 = _5240;
            if (!_5234)
            {
                _5146 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5242 = _5146;
            _5148 = _5242;
            if (!_5234)
            {
                _5152 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5244 = _5152;
            _5154 = _5244;
            if (!_5234)
            {
                _5160 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5246 = _5160;
            bool _5248 = !_5234;
            _5162 = _5246;
            if (!_5248)
            {
                bool _5250 = _3126 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5252 = isnan(_3126);
                bool _5254 = _5250 || _5252;
                bool _5256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5258 = _5254 || _5256;
                if (!_5258)
                {
                    float _5260 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5262 = _3126 + _5260;
                    float _5264 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5266 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5264;
                    float _5268 = 1.0 / _5266;
                    float _5270 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5272 = _5270 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5274 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5276 = _5274 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5278 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5280 = _5278 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5282 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5284 = _5282 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5286 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5288 = _5286 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5290 = _5262 * _5268;
                    float _5292 = precise::clamp(_5290, 0.0, 1.0);
                    float _5294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5296 = _5294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5298 = fma(_5292, _5272, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5300 = fma(_5292, _5296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5302 = fma(_5292, _5276, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5304 = fma(_5292, _5280, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5306 = fma(_5292, _5284, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5308 = fma(_5292, _5288, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5136 = _5300;
                    _5154 = _5306;
                    _5130 = _5298;
                    _5148 = _5304;
                    _5142 = _5302;
                    _5162 = _5308;
                    _5224 = true;
                }
                else
                {
                    _5136 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5154 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5148 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5142 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5162 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5224 = false;
    float _5310 = _5136;
    float _5312 = _5154;
    float _5314 = _5130;
    float _5316 = _5148;
    float _5318 = _5142;
    float _5320 = _5162;
    float _5322 = fma(_4640, -0.5, 0.5);
    float _5324 = precise::clamp(_5322, 0.0, 1.0);
    float _5326 = -_5310;
    float _5328 = _5326 + _5312;
    float _5330 = -_5314;
    float _5332 = _5330 + _5316;
    float _5334 = -_5318;
    float _5336 = _5334 + _5320;
    bool _5338 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5340 = fma(_5324, _5328, _5310);
    float _5342 = fma(_5324, _5332, _5314);
    float _5344 = fma(_5324, _5336, _5318);
    float _5346 = _5340 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _5348 = fma(_5342, 0.298911988735198974609375, _5346);
    float _5350 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5352 = fma(_5344, 0.114477999508380889892578125, _5348);
    out.m_95.w = _5350;
    float _5354 = -_5352;
    float _5356 = _5342 + _5354;
    float _5358 = -_5352;
    float _5360 = _5340 + _5358;
    float _5362 = -_5352;
    float _5364 = _5344 + _5362;
    out.m_101.x = 0.0;
    float _5366 = fma(_5356, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    float _5368 = fma(_5360, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    float _5370 = fma(_5364, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5352);
    out.m_103.x = _5366;
    out.m_103.y = _5368;
    out.m_103.z = _5370;
    if (!_5338)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5372 = -_1899;
    float _5374 = _5372 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5376 = -_1901;
    float _5378 = _5376 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5380 = -_1903;
    float _5382 = _5380 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5384 = _5374 * _5374;
    float _5386 = fma(_5378, _5378, _5384);
    float _5388 = fma(_5382, _5382, _5386);
    float _5390 = sqrt(_5388);
    float _5392 = rsqrt(_5388);
    float _5394 = -_5390;
    float _5396 = _5394 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5398 = _5396 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5400 = precise::clamp(_5398, 0.0, 1.0);
    float _5402 = _5378 * _5392;
    float _5404 = _5374 * _5392;
    float _5406 = abs(_5400);
    float _5408 = log2(_5406);
    float _5410 = _5382 * _5392;
    float _5412 = _5402 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5414 = _4640 * _5404;
    float _5416 = -_5404;
    float _5418 = -_5412;
    float _5420 = fma(_5416, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5418);
    float _5422 = fma(_5066, _5402, _5414);
    float _5424 = -_5410;
    float _5426 = fma(_5424, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5420);
    float _5428 = fma(_5084, _5410, _5422);
    float _5430 = precise::clamp(_5428, 0.0, 1.0);
    float _5432 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5434 = _5426 + _5432;
    float _5436 = _5408 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5438 = _5434 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5440 = precise::clamp(_5438, 0.0, 1.0);
    float _5442 = exp2(_5436);
    float _5444 = _5442 * _5440;
    float _5446 = _5430 * _5444;
    float _5448 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5450 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5452 = _5446 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5448;
    out.m_101.y = _5450;
    out.m_101.z = _5452;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

