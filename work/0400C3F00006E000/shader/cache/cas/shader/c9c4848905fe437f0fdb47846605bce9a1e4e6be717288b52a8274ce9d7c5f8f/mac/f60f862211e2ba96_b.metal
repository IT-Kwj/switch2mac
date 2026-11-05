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
    bool _5182 = false;
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
        float _5414 = as_type<float>(_138);
        out.gl_Position.z = _5414;
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
        float _5484 = as_type<float>(_176);
        out.gl_Position.z = _5484;
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
    float2 _6337 = float2(_654, _658);
    float _660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).x;
    float _662 = in.m_63.x;
    float _664 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _666 = in.m_63.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _670 = _668 != 0;
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    float _676 = in.m_69.x;
    float _678 = in.m_69.y;
    float _680 = in.m_69.z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _684 = -_640;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _688 = in.m_63.z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _694 = int(_692);
    float _696 = -_642;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = float(_122);
    float _702 = _662 * 2.0;
    float _704 = _662 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[5].x, _664);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _710 = floor(_702);
    float _712 = _666 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = -_690;
    float _716 = fma(_704, 2.0, _714);
    float _718 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].z, _706);
    float _720 = _586 * _676;
    float _722 = fma(_712, -2.0, _682);
    float _724 = _590 * _680;
    float _726 = _666 * 2.0;
    float _728 = _688 * 2.0;
    float _730 = _662 + _666;
    float _732 = _666 + _688;
    float _734 = _588 * _678;
    float _736 = _730 + (-1.0);
    int _738 = as_type<int>(_730);
    float _740 = _666;
    float _742 = _662;
    float _744 = _642;
    if (_670)
    {
        _738 = 0;
    }
    int _746 = _738;
    float _748 = floor(_728);
    int _750 = _746;
    if (!_670)
    {
        _750 = 2;
    }
    int _752 = _750;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _756 = _710 > 0.0;
    float _758 = _732 + (-1.0);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _762 = _752 != 2;
    float _764 = floor(_726);
    bool _766 = _710 >= 0.0;
    bool _768 = isnan(_710);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _778 = _752;
    if (_670)
    {
        _778 = 0;
    }
    int _780 = _778;
    float _782 = -_154;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[76].x, _716);
    int _786 = _774 ? 0 : 1;
    float _788 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _722);
    int _790 = _780;
    if (!_670)
    {
        _790 = 1;
    }
    int _792 = _790;
    float _794 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _796 = int(_794);
    int _798 = ~_786;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    float _804 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _806 = _802;
    float _808 = as_type<float>(_792);
    if (!_756)
    {
        int _810 = ~_786;
        int _812 = _810 + 1;
        _806 = _812;
    }
    int _814 = _806;
    bool _816 = _792 != 1;
    if (_762)
    {
        _808 = _662;
    }
    float _818 = _808;
    float _820 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _822 = int(_820);
    bool _824 = _748 > 0.0;
    float _826 = _818;
    if (!_762)
    {
        _826 = _688;
    }
    float _828 = _826;
    bool _830 = _764 > 0.0;
    bool _832 = _748 >= 0.0;
    bool _834 = isnan(_748);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = _828 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _844 = _764 >= 0.0;
    bool _846 = isnan(_764);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = 1.0 / _700;
    float _856 = _840 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _858 = -_708;
    float _860 = fma(_842, 2.0, _858);
    int _862 = _852 ? 0 : 1;
    float _864 = _842;
    float _866 = _856;
    float _868 = _828;
    if (!_816)
    {
        _864 = _666;
    }
    float _870 = _864;
    float _872 = -_154;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[86].x, _860);
    int _876 = ~as_type<int>(_856);
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    float _882 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _884 = int(_882);
    int _886 = ~_862;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    int _892 = _880;
    int _894 = _890;
    float _896 = _870;
    if (!_824)
    {
        int _898 = ~as_type<int>(_856);
        int _900 = _898 + 1;
        _892 = _900;
    }
    int _902 = _892;
    if (!_830)
    {
        int _904 = ~_862;
        int _906 = _904 + 1;
        _894 = _906;
    }
    int _908 = _894;
    if (!_816)
    {
        _866 = _870;
    }
    float _910 = _866;
    float _912 = _854 * _154;
    float _914 = _910;
    if (_816)
    {
        _914 = _662;
    }
    float _916 = _914;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _928 = _926 != 0;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_816)
    {
        _868 = _688;
    }
    float _932 = _868;
    float _934 = _916 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _936 = _932;
    if (_816)
    {
        _936 = _666;
    }
    float _938 = _936;
    float _940 = -_930;
    float _942 = fma(_934, 2.0, _940);
    float _944 = _718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _946 = !_924;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].w, _760);
    bool _952 = !_920;
    int _954 = _952 ? 0 : 1;
    float _956 = _944 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _960 = _958 != 0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _964 = _962 != 0;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_816)
    {
        _896 = _662;
    }
    float _968 = _896;
    float _970 = _944 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _972 = !_928;
    int _974 = _972 ? 0 : 1;
    float _976 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _956);
    bool _978 = !_964;
    int _980 = _978 ? 0 : 1;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[83].z, _966);
    bool _984 = !_960;
    int _986 = _984 ? 0 : 1;
    float _988 = in.m_71.x;
    float _990 = in.m_71.y;
    float _992 = in.m_71.z;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1004 = _1002 != 0;
    float _1006 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _970);
    float _1008 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[11].z, _976);
    float _1010 = float(_902);
    float _1012 = -_944;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1016 = !_996;
    float _1018 = _1016 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1020 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1006);
    float _1022 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1024 = _1006;
    float _1026 = _1018;
    if (!_816)
    {
        _1024 = _688;
    }
    float _1028 = _1024;
    float _1030 = -_154;
    float _1032 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[81].x, _942);
    int _1034 = abs(as_type<int>(_1018));
    float _1036 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1038 = _1028;
    if (_816)
    {
        _1038 = _666;
    }
    float _1040 = _1038;
    float _1042 = 1.0 / _1022;
    float _1044 = float(_1034);
    float _1046 = _1036 + _1022;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_762)
    {
        _1026 = _666;
    }
    float _1050 = _1026;
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1054 = _1044 * _1010;
    float _1056 = _1050;
    if (!_762)
    {
        _1056 = _662;
    }
    float _1058 = _1056;
    float _1060 = fma(_1052, -2.0, _1048);
    float _1062 = float(_796);
    float _1064 = _1054 * (-2.0);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1070 = 1.0 / _1062;
    float _1072 = fma(_1064, _988, _988);
    float _1074 = fma(_1068, -2.0, _1066);
    float _1076 = _674 * _154;
    float _1078 = float(_884);
    float _1080 = _1046 * _1042;
    float _1082 = _1080 * 0.5;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1086 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1088 = 1.0 / _1078;
    float _1090 = fma(_754, _1064, _754);
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1094 = _944 + _1086;
    float _1096 = float(_822);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1100 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1092);
    float _1102 = exp2(_1076);
    float _1104 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1084);
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1110 = 1.0 + _1108;
    float _1112 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1114 = _1014 * _1014;
    float _1116 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1098);
    float _1118 = 1.0 / _1096;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1122 = fma(_686, _686, _1114);
    float _1124 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1116);
    bool _1126 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1128 = isnan(1.0);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1134 = _1130 || _1132;
    float _1136 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1120);
    float _1138 = fma(_698, _698, _1122);
    bool _1140 = !_1004;
    int _1142 = _1140 ? 0 : 1;
    float _1144 = 1.0 / _1110;
    float _1146 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1106);
    bool _1148 = !_1000;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1154 = -_1102;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1146);
    float _1160 = float(_814);
    float _1162 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1152);
    int _1164 = abs(_1150);
    float _1166 = rsqrt(_1138);
    bool _1168 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1176 = _1172 || _1174;
    float _1178 = _662 + (-0.5);
    int _1180 = abs(_1142);
    float _1182 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1162);
    float _1184 = float(_1164);
    float _1186 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _982);
    float _1188 = float(_694);
    float _1190 = _1070 * _154;
    float _1192 = _1176 ? _1156 : 0.0;
    float _1194 = _1184 * _1160;
    float _1196 = float(_908);
    float _1198 = _1188 * _154;
    float _1200 = float(_1180);
    float _1202 = _1088 * _154;
    float _1204 = _1118 * _154;
    float _1206 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1100);
    float _1208 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1136);
    float _1210 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    float _1212 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1214 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1074);
    float _1216 = _1202;
    float _1218 = _1094;
    if (_1134)
    {
        float _1220 = _1192 * _1144;
        _156 = _1220;
    }
    float _1222 = _156;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1072);
    float _1226 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1228 = _1200 * _1196;
    float _1230 = _1194 * (-2.0);
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1234 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1232);
    float _1236 = fma(_1090, _1222, _1224);
    float _1238 = _662 + _688;
    float _1240 = _1228 * (-2.0);
    float _1242 = _666 + (-0.5);
    float _1244 = fma(_1230, _990, _990);
    float _1246 = _1238 + (-1.0);
    float _1248 = fma(_776, _1230, _776);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1244);
    float _1252 = 1.0 / _1234;
    float _1254 = _686 * _1166;
    float _1256 = in.m_73.x;
    float _1258 = in.m_73.y;
    float _1260 = in.m_73.z;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1264 = fma(_1240, _992, _992);
    float _1266 = _688 + (-0.5);
    float _1268 = fma(_1248, _1222, _1250);
    float _1270 = _698 * _1166;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1274 = _1254 * _1272;
    float _1276 = fma(_1262, _1240, _1262);
    float _1278 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1264);
    float _1280 = _1014 * _1166;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = _1270 * _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1288 = -_1274;
    float _1290 = fma(_1270, _1286, _1288);
    float _1292 = _1236 * 0.15915493667125701904296875;
    float _1294 = _1268 * 0.15915493667125701904296875;
    float _1296 = fma(_1276, _1222, _1278);
    float _1298 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1302 = _1280 * _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1306 = -_1284;
    float _1308 = fma(_1280, _1304, _1306);
    float _1310 = _1290 * _1290;
    float _1312 = _1292 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1318 = _1252 * _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1322 = -_1302;
    float _1324 = fma(_1254, _1320, _1322);
    float _1326 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1328 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1330 = _1318 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1332 = _1292 * 6.283185482025146484375;
    float _1334 = cos(_1332);
    bool _1336 = _1318 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1258);
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1256);
    float _1342 = _1340 * _1328;
    float _1344 = trunc(_1298);
    int _1346 = int(_1344);
    float _1348 = _1296 * 0.15915493667125701904296875;
    float _1350 = fma(_1308, _1308, _1310);
    float _1352 = _1338 * _1326;
    bool _1354 = !_1330;
    int _1356 = _1354 ? 0 : 1;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1260);
    float _1360 = fma(_1324, _1324, _1350);
    int _1362 = 2;
    float _1364 = _1226;
    if (!_1330)
    {
        _1362 = 1;
    }
    int _1366 = _1362;
    float _1368 = trunc(_1226);
    int _1370 = int(_1368);
    int _1372 = _1366;
    if (!_1336)
    {
        _1372 = _1356;
    }
    int _1374 = _1372;
    float _1376 = _1358 * _804;
    int _1378 = _1374 << 6;
    float _1380 = _1294 * 6.283185482025146484375;
    float _1382 = sin(_1380);
    int _1384 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1386 = _1346 + _1384;
    int _1388 = _1386 + 1;
    int _1390 = _1378 + 104;
    uint _1393 = uint(int(uint(_1390) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    bool _1409 = _1388 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1411 = _1294 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    int _1415 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1417 = _1370 + _1415;
    int _1419 = _1417 + 1;
    int _1421 = _1388 | _1419;
    float _1423 = _1348 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = _1314 * _1382;
    bool _1429 = _1421 < 0;
    bool _1431 = _1429 || _1409;
    float _1433 = _1334 * _1382;
    bool _1435 = _1419 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1437 = _1435 || _1431;
    float _1439 = rsqrt(_1360);
    float _1441 = _1334 * _1413;
    float _1443 = _1314 * _1413;
    float _1445 = _1348 * 6.283185482025146484375;
    float _1447 = sin(_1445);
    float _1449 = _1334 * _1425;
    float _1451 = _1413 * _1425;
    float _1453 = _1314 * _1425;
    float _1455 = _1382 * _1425;
    float _1457 = _1449 * _1352;
    int _1459 = _1378 + 48;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = _1388;
    int _1479 = _1419;
    if (!_1437)
    {
        int _1481 = _1419 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1483 = _1481 + _1388;
        _1477 = _1483;
    }
    int _1485 = _1477;
    float _1487 = _1308 * _1439;
    float _1489 = _1290 * _1439;
    float _1491 = _1324 * _1439;
    float _1493 = _1280 * _1487;
    float _1495 = _1270 * _1489;
    int _1497 = _1378 + 96;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    if (!_1437)
    {
        int _1515 = _1485 << 2;
        _1479 = _1515;
    }
    int _1517 = _1479;
    float _1519 = fma(_1447, _1441, _1427);
    float _1521 = fma(_1447, _1427, _1441);
    float _1523 = -_1433;
    float _1525 = fma(_1447, _1443, _1523);
    float _1527 = -_1443;
    float _1529 = fma(_1447, _1433, _1527);
    float _1531 = -_1352;
    float _1533 = _1447 * _1531;
    float _1535 = fma(_1519, _1342, _1457);
    int _1537 = _1378 + 64;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    uint _1541 = uint(int(uint(int(_1539)) >> uint(2)));
    int _1543 = int(_1539) & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = int(_1539) + 1;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    int _1551 = _1547 & 3;
    float _1553 = (*spvDescriptorSet0.vp_c15)._m0[int(_1549)][_1551];
    float _1555 = _1453 * _1352;
    float _1557 = fma(_1451, _1342, _1533);
    float _1559 = -_1493;
    float _1561 = fma(_1254, _1489, _1559);
    float _1563 = fma(_1529, _1376, _1535);
    float _1565 = fma(_1525, _1342, _1555);
    float _1567 = -_1495;
    float _1569 = fma(_1280, _1491, _1567);
    float _1571 = fma(_1455, _1376, _1557);
    int _1573 = _1378 + 72;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    float _1591 = _1561 * _1563;
    float _1593 = fma(_1521, _1376, _1565);
    float _1595 = _1569 * _1563;
    int _1597 = _1517;
    if (!_1437)
    {
        int _1599 = 12 & _1517;
        _1597 = _1599;
    }
    int _1601 = _1597;
    float _1603 = fma(_1491, _1571, _1591);
    int _1605 = 0;
    if (!_1437)
    {
        uint _1607 = uint(int(uint(_1485) >> uint(2)));
        _1605 = int(_1607);
    }
    int _1609 = _1605;
    float _1611 = fma(_1487, _1571, _1595);
    int _1613 = _1378 + 56;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    float _1631 = fma(_1270, _1593, _1603);
    int _1633 = _1609;
    if (!_1437)
    {
        int _1635 = _1609 << 4;
        int _1637 = _1635 + _1601;
        _1633 = _1637;
    }
    int _1639 = _1633;
    float _1641 = fma(_1254, _1593, _1611);
    float _1643 = _642 + _1631;
    float _1645 = _640 + _1641;
    int _1647 = _1378 + 80;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.vp_c15)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1667 = _1643 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1645 + _1669;
    float _1673 = _1667 * _1667;
    float _1675 = _1094 * _1475;
    float _1677 = fma(_1671, _1671, _1673);
    float _1679 = _1254 * _1491;
    float _1681 = _1475;
    float _1683 = _1671;
    if (!_1437)
    {
        float _1685 = floor(_1298);
        _1681 = _1685;
    }
    float _1687 = _1681;
    float _1689 = fma(_640, _1467, _1675);
    float _1691 = -_1679;
    float _1693 = fma(_1270, _1487, _1691);
    float _1695 = _1094 * _1513;
    float _1697 = _1693 * _1563;
    float _1699 = sqrt(_1677);
    float _1701 = fma(_640, _1505, _1695);
    float _1703 = fma(_1489, _1571, _1697);
    float _1705 = _1094 * _1553;
    float _1707 = fma(_642, _1399, _1701);
    float _1709 = fma(_1280, _1593, _1703);
    float _1711 = fma(_640, _1545, _1705);
    float _1713 = _1707 + _1407;
    float _1715 = _944 + _1709;
    float _1717 = fma(_642, _1581, _1711);
    bool _1719 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1721 = _1717 + _1589;
    float _1723 = 1.0 / _1713;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1727 = _1725 != 0;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1731 = _1729 != 0;
    float _1733 = fma(_642, _1621, _1689);
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1741 = _1739 != 0;
    float _1743 = _1733 + _1629;
    bool _1745 = !_1731;
    int _1747 = _1745 ? 0 : 1;
    bool _1749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1751 = isnan(0.5);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1757 = _1753 || _1755;
    bool _1759 = !_1727;
    int _1761 = _1759 ? 0 : 1;
    bool _1763 = !_1737;
    int _1765 = _1763 ? 0 : 1;
    bool _1767 = !_1741;
    int _1769 = _1767 ? 0 : 1;
    float _1771 = _1545;
    float _1773 = _1505;
    float _1775 = _1711;
    float _1777 = _1629;
    float _1779 = _1709;
    if (!_1719)
    {
        _1771 = _1645;
    }
    float _1781 = _1771;
    float _1783 = _1781;
    if (!_1719)
    {
        _1773 = _1643;
    }
    float _1785 = _1773;
    float _1787 = _1785;
    if (!_1719)
    {
        _1775 = _1715;
    }
    float _1789 = _1775;
    bool _1791 = !_1719;
    float _1793 = _1789;
    if (!_1791)
    {
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1799 = _1699 + _1797;
        float _1801 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = rsqrt(_1677);
        float _1805 = _1799 * _1795;
        float _1807 = _1805 * 0.15915493667125701904296875;
        float _1809 = _1807 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1807 * 6.283185482025146484375;
        float _1815 = sin(_1813);
        float _1817 = _1811 + (-1.0);
        float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = fma(_1815, _1801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1823 = fma(_1715, _1811, _1819);
        float _1825 = _1803 * _1821;
        float _1827 = fma(_1671, _1825, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1829 = fma(_1667, _1825, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1787 = _1829;
        _1783 = _1827;
        _1793 = _1823;
        _1777 = _1825;
    }
    float _1831 = _1787;
    float _1833 = _1783;
    float _1835 = _1793;
    float _1837 = _1777;
    float _1839 = _1743 * _1723;
    float _1841 = _1835;
    float _1843 = _1833;
    float _1845 = _1837;
    if (_1757)
    {
        _1683 = _1831;
    }
    float _1847 = _1683;
    float _1849 = _1847;
    if (!_1757)
    {
        float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1853 = _944 + _1851;
        float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1857 = _640 + _1855;
        float _1859 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = -_640;
        float _1863 = _1861 + _1833;
        float _1865 = _1853 * _1853;
        float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1869 = _642 + _1867;
        float _1871 = -_642;
        float _1873 = _1871 + _1831;
        float _1875 = fma(_1857, _1857, _1865);
        float _1877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1879 = fma(_1869, _1869, _1875);
        float _1881 = sqrt(_1879);
        float _1883 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1885 = precise::min(_1881, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1887 = _1885 * _1877;
        float _1889 = -_944;
        float _1891 = _1889 + _1835;
        float _1893 = _1883 * _1887;
        float _1895 = fma(_1891, _1893, _944);
        float _1897 = fma(_1863, _1893, _640);
        float _1899 = fma(_1873, _1893, _642);
        _1841 = _1895;
        _1843 = _1897;
        _1849 = _1899;
        _1845 = _1877;
    }
    float _1901 = _1841;
    float _1903 = _1843;
    float _1905 = _1849;
    float _1907 = _1845;
    int _1909 = _1378 + 88;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    uint _1913 = uint(int(uint(int(_1911)) >> uint(2)));
    int _1915 = int(_1911) & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    int _1919 = int(_1911) + 1;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    int _1923 = _1919 & 3;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[int(_1921)][_1923];
    float _1927 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1929 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1931 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1933 = _1839 >= 0.0;
    float _1935 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1927);
    float _1937 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1929);
    float _1939 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1931);
    float _1941 = _1643;
    if (!_1437)
    {
        int _1943 = _1639 + 400;
        uint _1945 = uint(int(uint(_1943) >> uint(2)));
        uint _1947 = uint(int(uint(int(_1945)) >> uint(2)));
        int _1949 = int(_1945) & 3;
        float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
        _1941 = _1951;
    }
    float _1953 = _1941;
    float _1955 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1935);
    float _1957 = _1721 * _1723;
    bool _1959 = _1839 <= 1.0;
    bool _1961 = _1959 && _1933;
    float _1963 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1965 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1937);
    float _1967 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1969 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    bool _1971 = _1957 >= 0.0;
    bool _1973 = _1971 && _1961;
    float _1975 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1963);
    float _1977 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1979 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1981 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1983 = _1957 <= 1.0;
    bool _1985 = _1983 && _1973;
    float _1987 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1975);
    float _1989 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1979);
    float _1991 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1995 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1997 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _1999 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2001 = -_1993;
    float _2003 = fma(_2001, _1991, 1.0);
    float _2005 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2007 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1997);
    float _2009 = _1094 * _1663;
    float _2011 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1999);
    if (_1985)
    {
        float _2013 = float(_1374);
        _1779 = _2013;
    }
    float _2015 = _1779;
    float _2017 = log2(_2003);
    float _2019 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2005);
    float _2021 = fma(_640, _1655, _2009);
    float _2023 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2011);
    float _2025 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2027 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2023);
    float _2029 = 1.0 / _2007;
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2025);
    float _2033 = _2025;
    if (!_1437)
    {
        float _2035 = -_1687;
        float _2037 = _1298 + _2035;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = fma(_642, _1917, _2021);
    float _2043 = _1907;
    if (!_1437)
    {
        float _2045 = floor(_1226);
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = _2041 + _1925;
    float _2051 = _2017 * 0.693147182464599609375;
    float _2053 = _2049 * _1723;
    float _2055 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2057 = _2015;
    if (_1985)
    {
        float _2059 = rint(_2015);
        float _2061 = precise::max(_2059, 0.0);
        uint _2063 = uint(_2061);
        uint _2065 = clamp(_2063, 0u, 65535u);
        _2057 = as_type<float>(_2065);
    }
    float _2067 = _2057;
    float _2069 = _2027 * _2029;
    float _2071 = _2031 * _2029;
    float _2073 = fma(_2069, 0.5, 0.5);
    float _2075 = fma(_2071, -0.5, 0.5);
    float _2077 = _2021;
    if (!_1437)
    {
        float _2079 = rint(_1953);
        float _2081 = precise::max(_2079, 0.0);
        uint _2083 = uint(_2081);
        uint _2085 = clamp(_2083, 0u, 65535u);
        _2077 = as_type<float>(_2085);
    }
    float _2087 = _2077;
    if (!_1437)
    {
        float _2089 = -_2047;
        float _2091 = _1226 + _2089;
        _1364 = _2091;
    }
    float _2093 = _1364;
    float _2095 = _2067;
    if (_1985)
    {
        float3 _8621 = float3(_1839, _1957, float(as_type<int>(_2067)));
        float3 _8625 = select(_8621, float3(0.0), isnan(_8621));
        float _2097 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8625.xy, uint(rint(_8625.z)), _2053, level(0.0));
        _2095 = _2097;
    }
    float _2099 = _2095;
    float3 _8635 = float3(_2073, _2075, _2055);
    float _2101 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8635, float3(0.0), isnan(_8635)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8635, float3(0.0), isnan(_8635)), level(0.0)).x;
    float3 _8644 = float3(_2073, _2075, _2055);
    float4 _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8644, float3(0.0), isnan(_8644)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8644, float3(0.0), isnan(_8644)), level(0.0)).xyzw;
    float _2106 = _2104.x;
    float _2108 = _2104.y;
    float _2110 = _2104.z;
    float _2112 = _2104.w;
    float _2114 = _2093;
    float _2116 = _2087;
    if (!_1437)
    {
        float3 _8668 = float3(_2039, _2093, float(as_type<int>(_2087)));
        float3 _8670 = select(_8668, float3(0.0), isnan(_8668));
        float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8670.xy, uint(rint(_8670.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8670.xy, uint(rint(_8670.z)), level(0.0)).x;
        _2114 = _2118;
    }
    float _2120 = _2114;
    float _2122 = float(uint(_694));
    float _2124 = trunc(_1190);
    int _2126 = int(_2124);
    int _2128 = ~_694;
    int _2130 = _2128 + 1;
    float _2132 = _1198 * _854;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2136 = _2134 != 0;
    int _2138 = abs(_1765);
    int _2140 = abs(_986);
    float _2142 = 1.0 / _2122;
    float _2144 = float(uint(_2126));
    float _2146 = trunc(_2132);
    int _2148 = int(_2146);
    int _2150 = as_type<int>(_2142) + (-2);
    float _2152 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2154 = int(_2152);
    float _2156 = as_type<float>(_2150) * _2144;
    float _2158 = float(_2126);
    float _2160 = in.m_75.x;
    if (_2136)
    {
        _2116 = 1.0;
    }
    float _2162 = _2116;
    float _2164 = trunc(_1204);
    int _2166 = int(_2164);
    float _2168 = _2162;
    if (!_2136)
    {
        _2168 = 7.345489978790283203125;
    }
    float _2170 = _2168;
    bool _2172 = _2158 >= _1188;
    bool _2174 = isnan(_2158);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(_1188);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = abs(_974);
    float _2186 = _2170 * _662;
    float _2188 = trunc(_2156);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    float _2194 = trunc(_2182);
    int _2196 = int(_2194);
    float _2198 = float(uint(_2166));
    int _2200 = _2130 * int(_2192);
    int _2202 = _2200 + _2126;
    float _2204 = float(uint(_2202));
    float _2206 = as_type<float>(_2150) * _2204;
    float _2208 = trunc(_2206);
    float _2210 = precise::max(_2208, 0.0);
    uint _2212 = uint(_2210);
    int _2214 = ~_2196;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = int(_2192) + int(_2212);
    float _2222 = floor(_2186);
    int _2224 = _2130 * _2220;
    int _2226 = _2224 + _2126;
    bool _2228 = uint(_2226) >= uint(_694);
    bool _2230 = !_2228;
    int _2232 = _2230 ? 0 : (-1);
    bool _2234 = _694 == 0;
    float _2236 = -_2222;
    float _2238 = _2186 + _2236;
    int _2240 = ~_2220;
    int _2242 = _2240 + _2232;
    int _2244 = _2242 + 1;
    int _2246 = _694 + (-1);
    float _2248 = _2238 * _1188;
    int _2250 = _694 * _2244;
    int _2252 = _2250 + _2126;
    float _2254 = trunc(_2248);
    int _2256 = int(_2254);
    bool _2258 = !_2234;
    int _2260 = _2258 ? _2252 : (-1);
    int _2262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2264 = _2262 != 0;
    int _2266 = abs(_948);
    int _2268 = _2260 * _2218;
    bool _2270 = !_2264;
    int _2272 = _2270 ? 0 : 1;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    int _2278 = _2196 * _2246;
    int _2280 = _2278 + _2268;
    int _2282 = abs(_2272);
    bool _2284 = !_2276;
    int _2286 = _2284 ? 0 : 1;
    int _2288 = _2280 * _2266;
    int _2290 = abs(_954);
    int _2292 = _2256 * _2282;
    int _2294 = _2292 + _2126;
    int _2296 = abs(_2286);
    float _2298 = trunc(_1202);
    int _2300 = int(_2298);
    int _2302 = _2148 * _2290;
    int _2304 = _2302 + _2288;
    float _2306 = float(uint(_2154));
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2310 = _2308 != 0;
    int _2312 = _2294 * _2184;
    int _2314 = _2312 + _2304;
    int _2316 = ~_694;
    int _2318 = _2316 + 1;
    float _2320 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2322 = int(_2320);
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2326 = _2324 != 0;
    int _2328 = _2256 * _2296;
    int _2330 = _2328 + _2314;
    float _2332 = float(uint(_2330));
    float _2334 = 1.0 / _2306;
    bool _2336 = _2276;
    int _2338 = int(_2192);
    float _2340 = _2198;
    if (_2310)
    {
        bool _2342 = _662 > 0.5;
        _2336 = _2342;
    }
    bool _2344 = _2336;
    float _2346 = as_type<float>(_2150) * _2332;
    int _2348 = as_type<int>(_2346);
    if (!_2310)
    {
        _1216 = _2160;
    }
    float _2350 = _1216;
    float _2352 = _2350;
    if (_2326)
    {
        float _2354 = -_2160;
        float _2356 = _2354 + 1.0;
        _2338 = as_type<int>(_2356);
    }
    int _2358 = _2338;
    float _2360 = trunc(_2346);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = float(uint(_2322));
    int _2368 = ~_2322;
    int _2370 = _2368 + 1;
    int _2372 = as_type<int>(_2334) + (-2);
    float _2374 = 1.0 / _2366;
    float _2376 = float(uint(_2300));
    if (_2310)
    {
        float _2378 = -_2160;
        float _2380 = _2378 + 1.0;
        _2348 = as_type<int>(_2380);
    }
    int _2382 = _2348;
    float _2384 = as_type<float>(_2372) * _2376;
    int _2386 = _2318 * int(_2364);
    int _2388 = _2386 + _2330;
    int _2390 = int(_2364);
    if (_2310)
    {
        float _2392 = _2344 ? as_type<float>(_2382) : _2160;
        _2352 = _2392;
    }
    float _2394 = _2352;
    bool _2396 = _688 > 0.5;
    float _2398 = trunc(_2384);
    float _2400 = precise::max(_2398, 0.0);
    uint _2402 = uint(_2400);
    float _2404 = float(uint(_2388));
    int _2406 = ~_2154;
    int _2408 = _2406 + 1;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2412 = _2410 != 0;
    float _2414 = as_type<float>(_2150) * _2404;
    int _2416 = as_type<int>(_2374) + (-2);
    float _2418 = trunc(_2414);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    float _2424 = as_type<float>(_2408);
    float _2426 = as_type<float>(_2408);
    if (_2136)
    {
        _2424 = _662;
    }
    float _2428 = _2424;
    float _2430 = as_type<float>(_2416) * _2198;
    float _2432 = _2428;
    if (!_2326)
    {
        _2340 = _2160;
    }
    float _2434 = _2340;
    float _2436 = _2434;
    if (!_2136)
    {
        _2432 = _666;
    }
    float _2438 = _2432;
    int _2440 = _2408 * int(_2402);
    int _2442 = _2440 + _2300;
    float _2444 = as_type<float>(_2402);
    if (_2136)
    {
        _2426 = 1.0;
    }
    float _2446 = _2426;
    float _2448 = trunc(_2430);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = _2446;
    if (!_2136)
    {
        _2454 = 1.2345600128173828125;
    }
    float _2456 = _2454;
    float _2458 = float(uint(_2442));
    if (_2326)
    {
        float _2460 = _2396 ? as_type<float>(_2358) : _2160;
        _2436 = _2460;
    }
    float _2462 = _2436;
    float _2464 = _2438 * _2456;
    int _2466 = ~_2322;
    int _2468 = _2466 + 1;
    float _2470 = as_type<float>(_2372) * _2458;
    int _2472 = int(_2364) + int(_2422);
    if (_2412)
    {
        float _2474 = -_2160;
        float _2476 = _2474 + 1.0;
        _2390 = as_type<int>(_2476);
    }
    int _2478 = _2390;
    float _2480 = trunc(_2470);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    bool _2486 = _666 > 0.5;
    float _2488 = in.m_63.w;
    if (!_2412)
    {
        _740 = _2160;
    }
    float _2490 = _740;
    int _2492 = _2468 * int(_2452);
    int _2494 = _2492 + _2166;
    int _2496 = ~_694;
    int _2498 = _2496 + 1;
    float _2500 = _2490;
    if (_2412)
    {
        float _2502 = _2486 ? as_type<float>(_2478) : _2160;
        _2500 = _2502;
    }
    float _2504 = _2500;
    float _2506 = floor(_2464);
    float _2508 = float(uint(_2494));
    float _2510 = in.m_75.y;
    int _2512 = ~_2154;
    int _2514 = _2512 + 1;
    int _2516 = _2498 * _2472;
    int _2518 = _2516 + _2330;
    if (!_2136)
    {
        _742 = _688;
    }
    float _2520 = _742;
    float _2522 = as_type<float>(_2416) * _2508;
    int _2524 = int(_2402) + int(_2484);
    bool _2526 = uint(_2518) >= uint(_694);
    float _2528 = trunc(_2522);
    float _2530 = precise::max(_2528, 0.0);
    uint _2532 = uint(_2530);
    float _2534 = float(_2154);
    int _2536 = _2514 * _2524;
    int _2538 = _2536 + _2300;
    float _2540 = float(_2300);
    float _2542 = -_2506;
    float _2544 = _2464 + _2542;
    if (_2136)
    {
        _2444 = 1.0;
    }
    float _2546 = _2444;
    float _2548 = _2546;
    if (!_2136)
    {
        _2548 = 5.839270114898681640625;
    }
    float _2550 = _2548;
    float _2552 = _2534 * _2544;
    bool _2554 = _2540 >= _2534;
    bool _2556 = isnan(_2540);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(_2534);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    bool _2566 = uint(_2538) >= uint(_2154);
    float _2568 = _2520 * _2550;
    float _2570 = trunc(_2564);
    int _2572 = int(_2570);
    float _2574 = -_2510;
    float _2576 = _2574 + 1.0;
    bool _2578 = !_2566;
    int _2580 = _2578 ? 0 : (-1);
    bool _2582 = !_2526;
    int _2584 = _2582 ? 0 : (-1);
    int _2586 = ~_2524;
    int _2588 = _2586 + _2580;
    int _2590 = _2588 + 1;
    bool _2592 = _2488 > 0.5;
    float _2594 = trunc(_2552);
    int _2596 = int(_2594);
    int _2598 = _2486 ? as_type<int>(_2576) : as_type<int>(_2510);
    int _2600 = _2154 * _2590;
    int _2602 = _2600 + _2300;
    bool _2604 = _2154 == 0;
    int _2606 = int(_2452) + int(_2532);
    float _2608 = _2534 * _912;
    int _2610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2612 = _2610 != 0;
    int _2614 = ~_2572;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2370 * _2606;
    int _2622 = _2620 + _2166;
    bool _2624 = !_2604;
    int _2626 = _2624 ? _2602 : (-1);
    float _2628 = trunc(_2608);
    int _2630 = int(_2628);
    float _2632 = _2612 ? as_type<float>(_2598) : _2510;
    int _2634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2636 = _2634 != 0;
    int _2638 = _2618 * _2626;
    int _2640 = _2592 ? as_type<int>(_2576) : as_type<int>(_2510);
    bool _2642 = !_2636;
    int _2644 = _2642 ? 0 : 1;
    int _2646 = _2154 + (-1);
    bool _2648 = uint(_2622) >= uint(_2322);
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2652 = _2650 != 0;
    int _2654 = _2572 * _2646;
    int _2656 = _2654 + _2638;
    bool _2658 = !_2648;
    int _2660 = _2658 ? 0 : (-1);
    float _2662 = floor(_2568);
    bool _2664 = !_2652;
    int _2666 = _2664 ? 0 : 1;
    int _2668 = abs(_1747);
    int _2670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2672 = _2670 != 0;
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2676 = _2674 != 0;
    int _2678 = _2656 * _2668;
    int _2680 = abs(_2644);
    float _2682 = float(_2322);
    float _2684 = float(_2166);
    int _2686 = abs(_1761);
    float _2688 = -_2662;
    float _2690 = _2568 + _2688;
    bool _2692 = _2684 >= _2682;
    bool _2694 = isnan(_2684);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(_2682);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    int _2704 = _2596 * _2680;
    int _2706 = _2704 + _2300;
    float _2708 = _2682 * _2690;
    int _2710 = ~_2606;
    int _2712 = _2710 + _2660;
    int _2714 = _2712 + 1;
    float _2716 = _2682 * _912;
    float _2718 = trunc(_2702);
    int _2720 = int(_2718);
    int _2722 = _2630 * _2686;
    int _2724 = _2722 + _2678;
    int _2726 = abs(_1769);
    int _2728 = _2322 * _2714;
    int _2730 = _2728 + _2166;
    bool _2732 = !_2672;
    int _2734 = _2732 ? 0 : 1;
    int _2736 = _2706 * _2138;
    int _2738 = _2736 + _2724;
    bool _2740 = _2322 == 0;
    float _2742 = trunc(_2716);
    int _2744 = int(_2742);
    int _2746 = abs(_2666);
    int _2748 = _2596 * _2726;
    int _2750 = _2748 + _2738;
    bool _2752 = !_2740;
    int _2754 = _2752 ? _2730 : (-1);
    int _2756 = _2322 + (-1);
    float _2758 = float(uint(_2750));
    float _2760 = trunc(_2708);
    int _2762 = int(_2760);
    int _2764 = ~_2720;
    int _2766 = _2764 + 1;
    int _2768 = _2766 + 1;
    int _2770 = ~_2472;
    int _2772 = _2770 + _2584;
    int _2774 = _2772 + 1;
    int _2776 = _2768 * _2754;
    int _2778 = _694 * _2774;
    int _2780 = _2778 + _2330;
    int _2782 = abs(_980);
    int _2784 = _2720 * _2756;
    int _2786 = _2784 + _2776;
    float _2788 = as_type<float>(_2372) * _2758;
    int _2790 = abs(_2734);
    float _2792 = float(uint(_2294));
    float _2794 = trunc(_2788);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = _2762 * _2746;
    int _2802 = _2800 + _2166;
    int _2804 = ~_2154;
    int _2806 = _2804 + 1;
    int _2808 = _2786 * _2782;
    float _2810 = as_type<float>(_2150) * _2792;
    bool _2812 = !_2234;
    int _2814 = _2812 ? _2780 : (-1);
    int _2816 = _2744 * _2140;
    int _2818 = _2816 + _2808;
    bool _2820 = !_2676;
    int _2822 = _2820 ? 0 : 1;
    int _2824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2826 = _2824 != 0;
    float _2828 = trunc(_2810);
    float _2830 = precise::max(_2828, 0.0);
    uint _2832 = uint(_2830);
    int _2834 = abs(_2822);
    int _2836 = _2802 * _2790;
    int _2838 = _2836 + _2818;
    float _2840 = _2826 ? as_type<float>(_2640) : _2510;
    int _2842 = _2806 * int(_2798);
    int _2844 = _2842 + _2750;
    int _2846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2848 = _2846 != 0;
    int _2850 = ~_694;
    int _2852 = _2850 + 1;
    int _2854 = _2762 * _2834;
    int _2856 = _2854 + _2838;
    float _2858 = float(uint(_2844));
    float _2860 = float(uint(_2856));
    float _2862 = as_type<float>(_2372) * _2858;
    int _2864 = ~_2322;
    int _2866 = _2864 + 1;
    int _2868 = _2852 * int(_2832);
    int _2870 = _2868 + _2294;
    int _2872 = ~_2154;
    int _2874 = _2872 + 1;
    float _2876 = _2510;
    if (_2848)
    {
        float _2878 = _2396 ? _2576 : _2510;
        _2876 = _2878;
    }
    float _2880 = _2876;
    float _2882 = as_type<float>(_2416) * _2860;
    int _2884 = _2814 & 3;
    bool _2886 = _2884 != 0;
    float _2888 = trunc(_2862);
    float _2890 = precise::max(_2888, 0.0);
    uint _2892 = uint(_2890);
    int _2894 = _2814 & 3;
    bool _2896 = _2894 != 0;
    float _2898 = float(uint(_2870));
    int _2900 = _2886 ? 0 : 1;
    bool _2902 = uint(_2894) > 1u;
    float _2904 = trunc(_2882);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    float _2910 = as_type<float>(_2150) * _2898;
    float _2912 = float(uint(_2706));
    int _2914 = ~_2900;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = ~_694;
    int _2922 = _2920 + 1;
    float _2924 = as_type<float>(_2372) * _2912;
    float _2926 = trunc(_2910);
    float _2928 = precise::max(_2926, 0.0);
    uint _2930 = uint(_2928);
    int _2932 = int(_2798) + int(_2892);
    int _2934 = _2918;
    float _2936 = as_type<float>(_2932);
    if (!_2902)
    {
        int _2938 = ~_2900;
        int _2940 = _2938 + 1;
        _2934 = _2940;
    }
    int _2942 = _2934;
    bool _2944 = uint(_2894) >= 2u;
    int _2946 = _2866 * int(_2908);
    int _2948 = _2946 + _2856;
    float _2950 = trunc(_2924);
    float _2952 = precise::max(_2950, 0.0);
    uint _2954 = uint(_2952);
    int _2956 = _2944 ? 0 : 1;
    bool _2958 = _2894 != 3;
    float _2960 = float(uint(_2948));
    int _2962 = ~_2154;
    int _2964 = _2962 + 1;
    int _2966 = int(_2832) + int(_2930);
    float _2968 = as_type<float>(_2416) * _2960;
    int _2970 = ~_2956;
    int _2972 = _2970 + 1;
    int _2974 = _2972 + 1;
    int _2976 = _2964 * _2932;
    int _2978 = _2976 + _2750;
    float _2980 = trunc(_2968);
    float _2982 = precise::max(_2980, 0.0);
    uint _2984 = uint(_2982);
    int _2986 = _2974;
    if (_2958)
    {
        int _2988 = ~_2956;
        int _2990 = _2988 + 1;
        _2986 = _2990;
    }
    int _2992 = _2986;
    int _2994 = _2874 * int(_2954);
    int _2996 = _2994 + _2706;
    bool _2998 = uint(_2978) >= uint(_2154);
    int _3000 = _2922 * _2966;
    int _3002 = _3000 + _2294;
    bool _3004 = !_2998;
    int _3006 = _3004 ? 0 : (-1);
    float _3008 = float(uint(_2996));
    int _3010 = ~_2932;
    int _3012 = _3010 + _3006;
    int _3014 = _3012 + 1;
    bool _3016 = uint(_3002) >= uint(_694);
    float _3018 = as_type<float>(_2372) * _3008;
    int _3020 = int(_2908) + int(_2984);
    int _3022 = _2154 * _3014;
    int _3024 = _3022 + _2750;
    if (_1437)
    {
        _2936 = 1.0;
    }
    float _3026 = _2936;
    float _3028 = _3026;
    float _3030 = _2120;
    if (!_1437)
    {
        int _3032 = _1485 << 4;
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
        float _3070 = _1094 * _3050;
        float _3072 = fma(_640, _3042, _3070);
        float _3074 = fma(_642, _3060, _3072);
        float _3076 = _3074 + _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = -_3078;
        float _3082 = _3080 + _2120;
        float _3084 = fma(_3082, 500.0, 1.5);
        float _3086 = exp2(_3084);
        float _3088 = 0.0 + _3086;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        _1218 = _3070;
        _3028 = _3090;
    }
    float _3092 = _1218;
    float _3094 = _3028;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3098 = _1901 + _3096;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3102 = _1903 + _3100;
    float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3106 = _1905 + _3104;
    bool _3108 = !_2604;
    int _3110 = _3108 ? _3024 : (-1);
    float _3112 = _3098 * _3098;
    bool _3114 = !_3016;
    int _3116 = _3114 ? 0 : (-1);
    float _3118 = fma(_3102, _3102, _3112);
    float _3120 = fma(_3106, _3106, _3118);
    float _3122 = rsqrt(_3120);
    float _3124 = sqrt(_3120);
    float _3126 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3128 = _3102 * _3126;
    float _3130 = _3106 * _3126;
    float _3132 = _3128 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 + _3134;
    float _3138 = sqrt(_3136);
    bool _3140 = _3138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = _3138 + _3142;
    float _3146 = _3122;
    float _3148 = _3092;
    float _3150 = _3144;
    float _3152 = _3098;
    float _3154 = _3136;
    if (_3140)
    {
        float _3156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3146 = _3156;
    }
    float _3158 = _3146;
    if (_3140)
    {
        float _3160 = rsqrt(_3136);
        _3148 = _3160;
    }
    float _3162 = _3148;
    float _3164 = _3162;
    if (_3140)
    {
        float _3166 = _3144 * _3158;
        _3150 = _3166;
    }
    float _3168 = _3150;
    if (_3140)
    {
        float _3170 = _3168 * 0.15915493667125701904296875;
        _744 = _3170;
    }
    float _3172 = _744;
    float _3174 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3176 = _3106;
    if (_3140)
    {
        float _3178 = _3172 * 6.283185482025146484375;
        float _3180 = sin(_3178);
        _3176 = _3180;
    }
    float _3182 = _3176;
    float _3184 = precise::max(0.0, _3174);
    float _3186 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3188 = _3184;
    if (_3140)
    {
        float _3190 = _3172 * 6.283185482025146484375;
        float _3192 = cos(_3190);
        _3186 = _3192;
    }
    float _3194 = _3186;
    float _3196 = -_3126;
    float _3198 = -_3184;
    float _3200 = fma(_3098, _3196, _3198);
    if (_3140)
    {
        float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3152 = _3202;
    }
    float _3204 = _3152;
    float _3206 = _3204;
    float _3208 = _3182;
    if (_3140)
    {
        float _3210 = fma(_3182, _3204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3206 = _3210;
    }
    float _3212 = _3206;
    float _3214 = _3212;
    if (!_3140)
    {
        _3208 = _3128;
    }
    float _3216 = _3208;
    float _3218 = _3216;
    if (_3140)
    {
        float _3220 = _3162 * _3212;
        _3030 = _3220;
    }
    float _3222 = _3030;
    if (!_3140)
    {
        _3214 = _3200;
    }
    float _3224 = _3214;
    float _3226 = _3224;
    float _3228 = _3194;
    if (_3140)
    {
        float _3230 = _3194 + (-1.0);
        _3188 = _3230;
    }
    float _3232 = _3188;
    float _3234 = _3232;
    if (_3140)
    {
        float _3236 = _3128 * _3222;
        _3218 = _3236;
    }
    float _3238 = _3218;
    if (!_3140)
    {
        _3164 = _3132;
    }
    float _3240 = _3164;
    float _3242 = _3240;
    if (_3140)
    {
        float _3244 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3154 = _3244;
    }
    float _3246 = _3154;
    if (!_3140)
    {
        _3234 = _3130;
    }
    float _3248 = _3234;
    float _3250 = _3248;
    if (_3140)
    {
        float _3252 = _3130 * _3222;
        _3250 = _3252;
    }
    float _3254 = _3250;
    if (_3140)
    {
        float _3256 = _3238 * _3238;
        _3242 = _3256;
    }
    float _3258 = _3242;
    if (_3140)
    {
        float _3260 = fma(_3200, _3194, _3246);
        _3226 = _3260;
    }
    float _3262 = _3226;
    if (!_3140)
    {
        _3228 = _3134;
    }
    float _3264 = _3228;
    float _3266 = _3264;
    if (_3140)
    {
        float _3268 = _3254 * _3254;
        _3266 = _3268;
    }
    float _3270 = _3266;
    float _3272 = fma(_3262, _3262, _3258);
    bool _3274 = !_2896;
    int _3276 = _3274 ? 0 : 1;
    int _3278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3280 = _3278 != 0;
    float _3282 = _3272 + _3270;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3286 = fma(_3124, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3284);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    float _3290 = -_3288;
    float _3292 = _3290 + 1.0;
    float _3294 = rsqrt(_3282);
    float _3296 = abs(_3292);
    float _3298 = log2(_3296);
    float _3300 = _3294 * _3238;
    float _3302 = _3294 * _3262;
    float _3304 = _3294 * _3254;
    float _3306 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3308 = -_3306;
    float _3310 = fma(_3302, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3314 = _3302 + 1.0;
    float _3316 = -_3304;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3320 = exp2(_3312);
    float _3322 = fma(_3318, 0.5, 0.5);
    float _3324 = fma(_3318, -0.5, 0.5);
    float _3326 = fma(_3322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3328 = sqrt(_3324);
    float _3330 = -_3302;
    float _3332 = fma(_3320, _3314, _3330);
    float _3334 = fma(_3322, _3326, -0.212114393711090087890625);
    int _3336 = _3110 & 3;
    bool _3338 = _3336 != 0;
    float _3340 = fma(_3332, 0.5, 0.5);
    float _3342 = fma(_3322, _3334, 1.570728778839111328125);
    int _3344 = ~_2322;
    int _3346 = _3344 + 1;
    float _3348 = _3328 * 0.636619746685028076171875;
    bool _3350 = uint(_3336) >= 2u;
    int _3352 = _3346 * _3020;
    int _3354 = _3352 + _2856;
    float _3356 = -_3342;
    float _3358 = fma(_3348, _3356, 1.0);
    int _3360 = _3350 ? 0 : 1;
    bool _3362 = !_3280;
    int _3364 = _3362 ? 0 : 1;
    bool _3366 = _3336 != 3;
    float2 _10425 = float2(_3358, _3340);
    float3 _3370 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10425, float2(0.0), isnan(_10425)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10425, float2(0.0), isnan(_10425)), level(0.0)).xyz;
    float _3372 = _3370.x;
    float _3374 = _3370.y;
    float _3376 = _3370.z;
    float _3378 = trunc(_3018);
    float _3380 = precise::max(_3378, 0.0);
    uint _3382 = uint(_3380);
    bool _3384 = uint(_3354) >= uint(_2322);
    float _3386 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3388 = _620 + _3386;
    int _3390 = _3338 ? 0 : 1;
    float _3392 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3394 = _620 + _3392;
    bool _3396 = _2894 != 3;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3400 = _620 + _3398;
    int _3402 = ~_3360;
    int _3404 = _3402 + 1;
    int _3406 = _3404 + 1;
    float _3408 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    float _3414 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3416 = uint(_3336) > 1u;
    float _3418 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3408);
    bool _3420 = !_3384;
    int _3422 = _3420 ? 0 : (-1);
    float _3424 = -_660;
    float _3426 = _3424 + 1.0;
    int _3428 = _3406;
    if (_3366)
    {
        int _3430 = ~_3360;
        int _3432 = _3430 + 1;
        _3428 = _3432;
    }
    int _3434 = _3428;
    float _3436 = exp2(_3414);
    bool _3438 = _3336 != 3;
    float _3440 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3418);
    int _3442 = int(_2954) + int(_3382);
    out.m_77.x = _1903;
    out.m_77.y = _1901;
    out.m_77.z = _1905;
    int _3444 = ~_2154;
    int _3446 = _3444 + 1;
    int _3448 = ~_3020;
    int _3450 = _3448 + _3422;
    int _3452 = _3450 + 1;
    int _3454 = ~_3390;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    bool _3460 = !_3438;
    int _3462 = _3460 ? 0 : (-1);
    int _3464 = _2322 * _3452;
    int _3466 = _3464 + _2856;
    int _3468 = _3458;
    if (!_3416)
    {
        int _3470 = ~_3390;
        int _3472 = _3470 + 1;
        _3468 = _3472;
    }
    int _3474 = _3468;
    int _3476 = _3446 * _3442;
    int _3478 = _3476 + _2706;
    int _3480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3482 = _3480 != 0;
    float _3484 = -_3436;
    float _3486 = _3484 + 1.0;
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3490 = _3488 != 0;
    int _3492 = _3110 & 3;
    bool _3494 = _3492 != 0;
    float _3496 = float(uint(_2802));
    bool _3498 = !_3494;
    int _3500 = _3498 ? 0 : 1;
    bool _3502 = uint(_3478) >= uint(_2154);
    float _3504 = as_type<float>(_2416) * _3496;
    bool _3506 = !_2740;
    int _3508 = _3506 ? _3466 : (-1);
    float _3510 = trunc(_3504);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    bool _3516 = !_3502;
    int _3518 = _3516 ? 0 : (-1);
    int _3520 = _3508 & 3;
    bool _3522 = _3520 != 0;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3528 = 1.0 / _3526;
    int _3530 = _3522 ? 0 : 1;
    float _3532 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3534 = _3532 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3536 = uint(_3520) >= 2u;
    float _3538 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3540 = _3538 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3542 = _3536 ? 0 : 1;
    float _3544 = 1.0 / _3534;
    float _3546 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3548 = _3546 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3550 = _3520 != 3;
    int _3552 = ~_2322;
    int _3554 = _3552 + 1;
    float _3556 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3558 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3556;
    float _3560 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3562 = _3560 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3564 = 1.0 / _3540;
    int _3566 = _3554 * int(_3514);
    int _3568 = _3566 + _2802;
    float _3570 = float(uint(_3568));
    float _3572 = 1.0 / _3548;
    int _3574 = ~_3542;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    float _3580 = _3558 * _3544;
    int _3582 = _3578;
    if (_3550)
    {
        int _3584 = ~_3542;
        int _3586 = _3584 + 1;
        _3582 = _3586;
    }
    int _3588 = _3582;
    float _3590 = as_type<float>(_2416) * _3570;
    bool _3592 = _3520 != 3;
    float _3594 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3596 = _3594 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3598 = _3562 * _3564;
    bool _3600 = !_3592;
    int _3602 = _3600 ? 0 : (-1);
    float _3604 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3606 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3604;
    bool _3608 = uint(_3520) > 1u;
    float _3610 = trunc(_3590);
    float _3612 = precise::max(_3610, 0.0);
    uint _3614 = uint(_3612);
    float _3616 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3616;
    bool _3620 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3622 = isnan(_620);
    bool _3624 = _3620 || _3622;
    bool _3626 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3628 = _3624 || _3626;
    float _3630 = float(_3628);
    float _3632 = _3606 * _3572;
    float _3634 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3636 = _620 + _3634;
    float _3638 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3640 = _3638 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3642 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3644 = _3642 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3646 = 1.0 / _3596;
    float _3648 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3650 = _3648 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3652 = _3618 * _3528;
    float _3654 = fma(_3580, _3388, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3656 = fma(_3598, _3636, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3658 = ~_3530;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    float _3664 = -_3630;
    float _3666 = _3664 + 1.0;
    bool _3668 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3670 = isnan(_620);
    bool _3672 = _3668 || _3670;
    bool _3674 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3676 = _3672 || _3674;
    float _3678 = float(_3676);
    float _3680 = 1.0 / _3640;
    int _3682 = _3662;
    float _3684 = _3656;
    if (!_3608)
    {
        int _3686 = ~_3530;
        int _3688 = _3686 + 1;
        _3682 = _3688;
    }
    int _3690 = _3682;
    float _3692 = fma(_3652, _3394, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _3694 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3696 = isnan(_620);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3702 = _3698 || _3700;
    float _3704 = float(_3702);
    float _3706 = _3678 * _3666;
    float _3708 = -_3678;
    float _3710 = _3708 + 1.0;
    bool _3712 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3714 = isnan(_620);
    bool _3716 = _3712 || _3714;
    bool _3718 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3720 = _3716 || _3718;
    float _3722 = float(_3720);
    float _3724 = 1.0 / _3644;
    float _3726 = -_3704;
    float _3728 = _3726 + 1.0;
    int _3730 = int(_3514) + int(_3614);
    float _3732 = _3704 * _3710;
    int _3734 = ~_2322;
    int _3736 = _3734 + 1;
    float _3738 = _3722 * _3728;
    float _3740 = -_3722;
    float _3742 = _3740 + 1.0;
    bool _3744 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3746 = isnan(_620);
    bool _3748 = _3744 || _3746;
    bool _3750 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3752 = _3748 || _3750;
    float _3754 = float(_3752);
    float _3756 = _3650 * _3646;
    bool _3758 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3760 = isnan(_620);
    bool _3762 = _3758 || _3760;
    bool _3764 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3766 = _3762 || _3764;
    float _3768 = float(_3766);
    int _3770 = _3736 * _3730;
    int _3772 = _3770 + _2802;
    int _3774 = _3508 & 3;
    bool _3776 = _3774 != 0;
    float _3778 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3780 = _3778 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3782 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3784 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3782;
    float _3786 = _3754 * _3742;
    float _3788 = -_3754;
    float _3790 = _3788 + 1.0;
    bool _3792 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3794 = isnan(_620);
    bool _3796 = _3792 || _3794;
    bool _3798 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3800 = _3796 || _3798;
    float _3802 = float(_3800);
    float _3804 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3806 = _620 + _3804;
    bool _3808 = !_3776;
    int _3810 = _3808 ? 0 : 1;
    float _3812 = -_3768;
    float _3814 = _3812 + 1.0;
    bool _3816 = uint(_3772) >= uint(_2322);
    float _3818 = _3780 * _3680;
    float _3820 = _3784 * _3724;
    bool _3822 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3824 = isnan(_620);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3830 = _3826 || _3828;
    float _3832 = float(_3830);
    float _3834 = in.m_79.x;
    float _3836 = in.m_79.y;
    float _3838 = in.m_79.z;
    float _3840 = _3768 * _3790;
    float _3842 = fma(_3632, _3806, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3844 = _3802 * _3814;
    float _3846 = -_3802;
    float _3848 = _3846 + 1.0;
    bool _3850 = !_3816;
    int _3852 = _3850 ? 0 : (-1);
    float _3854 = in.m_81.x;
    float _3856 = in.m_81.y;
    float _3858 = in.m_81.z;
    float _3860 = in.m_81.w;
    bool _3862 = _1258 != 0.0;
    bool _3864 = isnan(_1258);
    bool _3866 = _3862 || _3864;
    bool _3868 = isnan(0.0);
    bool _3870 = _3866 || _3868;
    float _3872 = _3832 * _3848;
    float _3874 = -_3832;
    float _3876 = _3874 + 1.0;
    float _3878 = fma(_3756, _3400, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _3880 = _1256 == 0.0;
    bool _3882 = !_3870;
    bool _3884 = _3880 && _3882;
    float _3886 = _3654 * _3872;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3890 = _620 + _3888;
    int _3892 = ~_2966;
    int _3894 = _3892 + _3116;
    int _3896 = _3894 + 1;
    bool _3898 = _1260 == 0.0;
    bool _3900 = _3898 && _3884;
    float _3902 = fma(_3876, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3886);
    float _3904 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3906 = _620 + _3904;
    float _3908 = fma(_3818, _3890, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3910 = abs(_1318);
    float _3912 = log2(_3910);
    float _3914 = fma(_3656, _3844, _3902);
    float _3916 = fma(_3820, _3906, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3918 = ~_3730;
    int _3920 = _3918 + _3852;
    int _3922 = _3920 + 1;
    int _3924 = _694 * _3896;
    int _3926 = _3924 + _2294;
    float _3928 = fma(_3842, _3840, _3914);
    int _3930 = ~_3442;
    int _3932 = _3930 + _3518;
    int _3934 = _3932 + 1;
    int _3936 = abs(_2942);
    float _3938 = fma(_3878, _3786, _3928);
    float _3940 = _3756;
    float _3942 = _3818;
    if (_3900)
    {
        _3940 = _3836;
    }
    float _3944 = _3940;
    float _3946 = _3944;
    if (!_3900)
    {
        float _3948 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3836);
        _3946 = _3948;
    }
    float _3950 = _3946;
    if (_3900)
    {
        _3942 = _3834;
    }
    float _3952 = _3942;
    float _3954 = _3952;
    if (!_3900)
    {
        float _3956 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3834);
        _3954 = _3956;
    }
    float _3958 = _3954;
    float _3960 = _3856 * _3838;
    float _3962 = _3858 * _3834;
    float _3964 = _3854 * _3836;
    if (_3900)
    {
        _3684 = _3838;
    }
    float _3966 = _3684;
    float _3968 = _3966;
    if (!_3900)
    {
        float _3970 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3838);
        _3968 = _3970;
    }
    float _3972 = _3968;
    float _3974 = fma(_3692, _3738, _3938);
    float _3976 = -_3960;
    float _3978 = fma(_3858, _3836, _3976);
    float _3980 = -_3962;
    float _3982 = fma(_3854, _3838, _3980);
    float _3984 = -_3964;
    float _3986 = fma(_3856, _3834, _3984);
    float _3988 = fma(_3908, _3732, _3974);
    int _3990 = _3508 >> 31;
    float _3992 = _3978 * _3860;
    float _3994 = _3982 * _3860;
    float _3996 = _3986 * _3860;
    float _3998 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _4000 = _2814 >> 31;
    float _4002 = fma(_3916, _3706, _3988);
    int _4004 = _3990 & 3;
    float _4006 = _1519 * _1693;
    int _4008 = _4000 & 3;
    float _4010 = exp2(_3998);
    int _4012 = _3508 + _4004;
    float _4014 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4002);
    int _4016 = _3110 >> 31;
    float _4018 = _1449 * _1693;
    int _4020 = _2814 + _4008;
    float _4022 = _1529 * _1569;
    int _4024 = _4012 >> 2;
    float _4026 = _1529 * _1693;
    int _4028 = _4016 & 3;
    float _4030 = _1519 * _1561;
    int _4032 = _4024 << 4;
    int _4034 = _4032 + 656;
    float _4036 = _1449 * _1569;
    int _4038 = _4020 >> 2;
    float _4040 = _1449 * _1561;
    int _4042 = _3110 + _4028;
    float _4044 = _1529 * _1561;
    uint _4046 = uint(int(uint(_4034) >> uint(2)));
    uint _4048 = uint(int(uint(int(_4046)) >> uint(2)));
    int _4050 = int(_4046) & 3;
    float _4052 = (*spvDescriptorSet0.vp_c9)._m0[int(_4048)][_4050];
    int _4054 = int(_4046) + 1;
    uint _4056 = uint(int(uint(_4054) >> uint(2)));
    int _4058 = _4054 & 3;
    float _4060 = (*spvDescriptorSet0.vp_c9)._m0[int(_4056)][_4058];
    int _4062 = _4038 << 4;
    int _4064 = _4062 + 368;
    float _4066 = -_1447;
    float _4068 = fma(_4066, _1487, _4036);
    float _4070 = fma(_4010, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4072 = precise::clamp(_4070, 0.0, 1.0);
    int _4074 = _4042 >> 2;
    float _4076 = -_1447;
    float _4078 = fma(_4076, _1491, _4040);
    out.m_83.x = _4014;
    uint _4080 = uint(int(uint(_4064) >> uint(2)));
    uint _4082 = uint(int(uint(int(_4080)) >> uint(2)));
    int _4084 = int(_4080) & 3;
    float _4086 = (*spvDescriptorSet0.vp_c9)._m0[int(_4082)][_4084];
    int _4088 = int(_4080) + 1;
    uint _4090 = uint(int(uint(_4088) >> uint(2)));
    int _4092 = _4088 & 3;
    float _4094 = (*spvDescriptorSet0.vp_c9)._m0[int(_4090)][_4092];
    int _4096 = _4074 << 4;
    int _4098 = _4096 + 512;
    float _4100 = fma(_4072, -2.0, 3.0);
    float _4102 = _4072 * _4072;
    float _4104 = fma(_1455, _1489, _4026);
    float _4106 = fma(_1455, _1491, _4044);
    int _4108 = _2154 * _3934;
    int _4110 = _4108 + _2706;
    float _4112 = _4102 * _4100;
    uint _4114 = uint(int(uint(_4098) >> uint(2)));
    uint _4116 = uint(int(uint(int(_4114)) >> uint(2)));
    int _4118 = int(_4114) & 3;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[int(_4116)][_4118];
    int _4122 = int(_4114) + 1;
    uint _4124 = uint(int(uint(_4122) >> uint(2)));
    int _4126 = _4122 & 3;
    float _4128 = (*spvDescriptorSet0.vp_c9)._m0[int(_4124)][_4126];
    float _4130 = _1519 * _1569;
    float _4132 = fma(_1451, _1489, _4006);
    float _4134 = -_1447;
    float _4136 = fma(_4134, _1489, _4018);
    float _4138 = fma(_1455, _1487, _4022);
    float _4140 = fma(_1451, _1487, _4130);
    int _4142 = abs(_3690);
    float _4144 = fma(_1453, _1280, _4136);
    int _4146 = _4064 + 8;
    uint _4148 = uint(int(uint(_4146) >> uint(2)));
    uint _4150 = uint(int(uint(int(_4148)) >> uint(2)));
    int _4152 = int(_4148) & 3;
    float _4154 = (*spvDescriptorSet0.vp_c9)._m0[int(_4150)][_4152];
    int _4156 = int(_4148) + 1;
    uint _4158 = uint(int(uint(_4156) >> uint(2)));
    int _4160 = _4156 & 3;
    float _4162 = (*spvDescriptorSet0.vp_c9)._m0[int(_4158)][_4160];
    int _4164 = abs(_3474);
    float _4166 = fma(_1451, _1491, _4030);
    int _4168 = ~_4142;
    int _4170 = _4168 + 1;
    int _4172 = _4170 + 1;
    int _4174 = _2322 * _3922;
    int _4176 = _4174 + _2802;
    int _4178 = ~_3936;
    int _4180 = _4178 + 1;
    int _4182 = _4180 + 1;
    float _4184 = fma(_1525, _1280, _4132);
    int _4186 = _4098 + 8;
    uint _4188 = uint(int(uint(_4186) >> uint(2)));
    uint _4190 = uint(int(uint(int(_4188)) >> uint(2)));
    int _4192 = int(_4188) & 3;
    float _4194 = (*spvDescriptorSet0.vp_c9)._m0[int(_4190)][_4192];
    int _4196 = int(_4188) + 1;
    uint _4198 = uint(int(uint(_4196) >> uint(2)));
    int _4200 = _4196 & 3;
    float _4202 = (*spvDescriptorSet0.vp_c9)._m0[int(_4198)][_4200];
    float _4204 = fma(_1453, _1254, _4068);
    float _4206 = fma(_1453, _1270, _4078);
    float _4208 = fma(_1525, _1254, _4140);
    float _4210 = fma(_1521, _1254, _4138);
    int _4212 = abs(_2992);
    float _4214 = fma(_1525, _1270, _4166);
    int _4216 = ~_4164;
    int _4218 = _4216 + 1;
    int _4220 = _4218 + 1;
    int _4222 = _4034 + 8;
    uint _4224 = uint(int(uint(_4222) >> uint(2)));
    uint _4226 = uint(int(uint(int(_4224)) >> uint(2)));
    int _4228 = int(_4224) & 3;
    float _4230 = (*spvDescriptorSet0.vp_c9)._m0[int(_4226)][_4228];
    int _4232 = int(_4224) + 1;
    uint _4234 = uint(int(uint(_4232) >> uint(2)));
    int _4236 = _4232 & 3;
    float _4238 = (*spvDescriptorSet0.vp_c9)._m0[int(_4234)][_4236];
    int _4240 = abs(_3500);
    float _4242 = fma(_1521, _1280, _4104);
    int _4244 = abs(_3810);
    float _4246 = fma(_1521, _1270, _4106);
    int _4248 = ~_4212;
    int _4250 = _4248 + 1;
    int _4252 = _4250 + 1;
    int _4254 = ~_4240;
    int _4256 = _4254 + 1;
    int _4258 = _4256 + 1;
    int _4260 = _4172 * as_type<int>(_4060);
    int _4262 = abs(_3276);
    int _4264 = ~_4244;
    int _4266 = _4264 + 1;
    int _4268 = _4266 + 1;
    int _4270 = ~_4262;
    int _4272 = _4270 + 1;
    int _4274 = _4272 + 1;
    int _4276 = abs(_3364);
    int _4278 = _4182 * as_type<int>(_4094);
    bool _4280 = !_2604;
    int _4282 = _4280 ? _4110 : (-1);
    float _4284 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4286 = int(_4284);
    int _4288 = _4268 * as_type<int>(_4052);
    int _4290 = _4288 + _4260;
    int _4292 = abs(_3462);
    int _4294 = _4274 * as_type<int>(_4086);
    int _4296 = _4294 + _4278;
    int _4298 = abs(_3434);
    float _4300 = _3994 * _4204;
    int _4302 = _4220 * as_type<int>(_4128);
    int _4304 = ~_4292;
    int _4306 = _4304 + 1;
    int _4308 = _4306 + 1;
    float _4310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4312 = int(_4310);
    int _4314 = ~_4298;
    int _4316 = _4314 + 1;
    int _4318 = _4316 + 1;
    int _4320 = _4258 * as_type<int>(_4120);
    int _4322 = _4320 + _4302;
    int _4324 = abs(_3412);
    float _4326 = _4206 * _3856;
    int _4328 = _4252 * as_type<int>(_4154);
    int _4330 = _4328 + _4296;
    int _4332 = abs(_3588);
    float _4334 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4336 = int(_4334);
    int _4338 = ~_4324;
    int _4340 = _4338 + 1;
    int _4342 = _4340 + 1;
    int _4344 = ~_4332;
    int _4346 = _4344 + 1;
    int _4348 = _4346 + 1;
    float _4350 = float(uint(_4286));
    int _4352 = _4318 * as_type<int>(_4194);
    int _4354 = _4352 + _4322;
    int _4356 = abs(_3602);
    int _4358 = _4342 * as_type<int>(_4162);
    int _4360 = _4358 + _4330;
    float _4362 = float(uint(_4312));
    int _4364 = ~_4356;
    int _4366 = _4364 + 1;
    int _4368 = _4366 + 1;
    float _4370 = 1.0 / _4350;
    int _4372 = abs(_4286);
    int _4374 = _4348 * as_type<int>(_4230);
    int _4376 = _4374 + _4290;
    int _4378 = ~_4312;
    int _4380 = _4378 + 1;
    int _4382 = _4308 * as_type<int>(_4202);
    int _4384 = _4382 + _4354;
    int _4386 = ~_4276;
    int _4388 = _4386 + 1;
    int _4390 = _4388 + 1;
    int _4392 = _4368 * as_type<int>(_4238);
    int _4394 = _4392 + _4376;
    bool _4396 = !_3482;
    int _4398 = _4396 ? 0 : 1;
    float _4400 = 1.0 / _4362;
    int _4402 = abs(_4312);
    int _4404 = _4360 * _4390;
    bool _4406 = !_3490;
    int _4408 = _4406 ? 0 : 1;
    int _4410 = abs(_4398);
    float _4412 = float(uint(_4336));
    bool _4414 = !_2234;
    int _4416 = _4414 ? _3926 : (-1);
    float _4418 = 1.0 / _4412;
    int _4420 = abs(_4408);
    int _4422 = ~_4410;
    int _4424 = _4422 + 1;
    int _4426 = _4424 + 1;
    int _4428 = _4416 * _4276;
    int _4430 = _4428 + _4404;
    float _4432 = float(uint(_4372));
    int _4434 = ~_4420;
    int _4436 = _4434 + 1;
    int _4438 = _4436 + 1;
    int _4440 = _4426 * _4384;
    float _4442 = 1.0 / _4432;
    int _4444 = abs(_4336);
    bool _4446 = !_2740;
    int _4448 = _4446 ? _4176 : (-1);
    int _4450 = _4438 * _4394;
    int _4452 = as_type<int>(_4370) + (-2);
    int _4454 = _4282 * _4410;
    int _4456 = _4454 + _4440;
    float _4458 = float(uint(_4430));
    int _4460 = _4448 * _4420;
    int _4462 = _4460 + _4450;
    float _4464 = float(uint(_4402));
    float _4466 = _4144 * _3856;
    float _4468 = float(uint(_4444));
    float _4470 = as_type<float>(_4452) * _4458;
    float _4472 = 1.0 / _4464;
    int _4474 = as_type<int>(_4400) + (-2);
    float _4476 = _4144 * _3950;
    float _4478 = float(uint(_4456));
    float _4480 = float(uint(_4462));
    int _4482 = abs(_4430);
    float _4484 = 1.0 / _4468;
    float _4486 = as_type<float>(_4474) * _4478;
    int _4488 = as_type<int>(_4442) + (-2);
    float _4490 = float(uint(_4482));
    int _4492 = ~_4286;
    int _4494 = _4492 + 1;
    float _4496 = trunc(_4470);
    float _4498 = precise::max(_4496, 0.0);
    uint _4500 = uint(_4498);
    int _4502 = as_type<int>(_4418) + (-2);
    int _4504 = as_type<int>(_4472) + (-2);
    int _4506 = ~_4336;
    int _4508 = _4506 + 1;
    float _4510 = as_type<float>(_4502) * _4480;
    float _4512 = as_type<float>(_4488) * _4490;
    float _4514 = trunc(_4486);
    float _4516 = precise::max(_4514, 0.0);
    uint _4518 = uint(_4516);
    int _4520 = abs(_4462);
    int _4522 = as_type<int>(_4484) + (-2);
    float _4524 = _4204 * _3856;
    float _4526 = float(uint(_4520));
    float _4528 = _4204 * _3950;
    float _4530 = _4206 * _3950;
    float _4532 = trunc(_4510);
    float _4534 = precise::max(_4532, 0.0);
    uint _4536 = uint(_4534);
    int _4538 = abs(_4456);
    int _4540 = _4494 * int(_4500);
    int _4542 = _4540 + _4430;
    float _4544 = as_type<float>(_4522) * _4526;
    float _4546 = _3994 * _4144;
    float _4548 = float(uint(_4538));
    float _4550 = _3994 * _4206;
    float _4552 = float(uint(_4542));
    int _4554 = _4380 * int(_4518);
    int _4556 = _4554 + _4456;
    float _4558 = trunc(_4512);
    float _4560 = precise::max(_4558, 0.0);
    uint _4562 = uint(_4560);
    float _4564 = as_type<float>(_4504) * _4548;
    float _4566 = fma(_4208, _3854, _4524);
    float _4568 = as_type<float>(_4452) * _4552;
    float _4570 = float(uint(_4556));
    float _4572 = fma(_4184, _3854, _4466);
    int _4574 = ~_4372;
    int _4576 = _4574 + 1;
    int _4578 = _4508 * int(_4536);
    int _4580 = _4578 + _4462;
    float _4582 = trunc(_4564);
    float _4584 = precise::max(_4582, 0.0);
    uint _4586 = uint(_4584);
    float _4588 = as_type<float>(_4474) * _4570;
    float _4590 = fma(_4214, _3854, _4326);
    float _4592 = fma(_4214, _3958, _4530);
    float _4594 = float(uint(_4580));
    float _4596 = fma(_3992, _4214, _4550);
    int _4598 = ~_4402;
    int _4600 = _4598 + 1;
    float _4602 = trunc(_4544);
    float _4604 = precise::max(_4602, 0.0);
    uint _4606 = uint(_4604);
    int _4608 = ~_4444;
    int _4610 = _4608 + 1;
    float _4612 = as_type<float>(_4502) * _4594;
    float _4614 = fma(_4208, _3958, _4528);
    int _4616 = _4576 * int(_4562);
    int _4618 = _4616 + _4482;
    float _4620 = fma(_3992, _4208, _4300);
    float _4622 = fma(_4210, _3972, _4614);
    float _4624 = trunc(_4568);
    float _4626 = precise::max(_4624, 0.0);
    uint _4628 = uint(_4626);
    int _4630 = _4600 * int(_4586);
    int _4632 = _4630 + _4538;
    float _4634 = fma(_4184, _3958, _4476);
    float _4636 = fma(_3992, _4184, _4546);
    float _4638 = float(uint(_4618));
    float _4640 = float(uint(_4632));
    float _4642 = trunc(_4588);
    float _4644 = precise::max(_4642, 0.0);
    uint _4646 = uint(_4644);
    int _4648 = _4610 * int(_4606);
    int _4650 = _4648 + _4520;
    float _4652 = as_type<float>(_4488) * _4638;
    float _4654 = as_type<float>(_4504) * _4640;
    int _4656 = ~_4312;
    int _4658 = _4656 + 1;
    int _4660 = int(_4500) + int(_4628);
    float _4662 = trunc(_4652);
    float _4664 = precise::max(_4662, 0.0);
    uint _4666 = uint(_4664);
    float _4668 = float(uint(_4650));
    int _4670 = ~_4286;
    int _4672 = _4670 + 1;
    float _4674 = as_type<float>(_4522) * _4668;
    int _4676 = int(_4518) + int(_4646);
    float _4678 = trunc(_4612);
    float _4680 = precise::max(_4678, 0.0);
    uint _4682 = uint(_4680);
    float _4684 = fma(_4210, _3858, _4566);
    float _4686 = fma(_4242, _3858, _4572);
    float _4688 = fma(_4246, _3858, _4590);
    int _4690 = _4658 * _4676;
    int _4692 = _4690 + _4456;
    int _4694 = ~_4444;
    int _4696 = _4694 + 1;
    int _4698 = _4672 * _4660;
    int _4700 = _4698 + _4430;
    float _4702 = trunc(_4654);
    float _4704 = precise::max(_4702, 0.0);
    uint _4706 = uint(_4704);
    int _4708 = int(_4562) + int(_4666);
    out.m_85.x = _4684;
    out.m_85.y = _4686;
    out.m_85.z = _4688;
    bool _4710 = uint(_4692) >= uint(_4312);
    bool _4712 = uint(_4700) >= uint(_4286);
    int _4714 = ~_4402;
    int _4716 = _4714 + 1;
    float _4718 = trunc(_4674);
    float _4720 = precise::max(_4718, 0.0);
    uint _4722 = uint(_4720);
    int _4724 = int(_4536) + int(_4682);
    int _4726 = ~_4336;
    int _4728 = _4726 + 1;
    bool _4730 = _1318 <= 8000.0;
    bool _4732 = isnan(_1318);
    bool _4734 = _4730 || _4732;
    bool _4736 = isnan(8000.0);
    bool _4738 = _4734 || _4736;
    float _4740 = float(_4738);
    int _4742 = int(_4586) + int(_4706);
    int _4744 = ~_4372;
    int _4746 = _4744 + 1;
    int _4748 = _4746 * _4708;
    int _4750 = _4748 + _4482;
    int _4752 = int(_4606) + int(_4722);
    int _4754 = _4716 * _4742;
    int _4756 = _4754 + _4538;
    int _4758 = _4728 * _4724;
    int _4760 = _4758 + _4462;
    bool _4762 = uint(_4750) >= uint(_4372);
    float _4764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4766 = !_4712;
    int _4768 = _4766 ? 0 : (-1);
    int _4770 = _4696 * _4752;
    int _4772 = _4770 + _4520;
    bool _4774 = uint(_4756) >= uint(_4402);
    bool _4776 = uint(_4760) >= uint(_4336);
    bool _4778 = !_4710;
    int _4780 = _4778 ? 0 : (-1);
    float _4782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4784 = ~_4660;
    int _4786 = _4784 + _4768;
    int _4788 = _4786 + 1;
    int _4790 = ~_4676;
    int _4792 = _4790 + _4780;
    int _4794 = _4792 + 1;
    bool _4796 = !_4776;
    int _4798 = _4796 ? 0 : (-1);
    bool _4800 = _4286 == 0;
    bool _4802 = _4286 == 0;
    int _4804 = _4430 ^ _4286;
    int _4806 = _4286 * _4788;
    int _4808 = _4806 + _4430;
    bool _4810 = !_4762;
    int _4812 = _4810 ? 0 : (-1);
    float _4814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4816 = !_4774;
    int _4818 = _4816 ? 0 : (-1);
    bool _4820 = uint(_4772) >= uint(_4444);
    bool _4822 = _4312 == 0;
    bool _4824 = _4312 == 0;
    float _4826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4828 = _4456 ^ _4312;
    int _4830 = _4312 * _4794;
    int _4832 = _4830 + _4456;
    int _4834 = ~_4724;
    int _4836 = _4834 + _4798;
    int _4838 = _4836 + 1;
    bool _4840 = !_4800;
    int _4842 = _4840 ? _4808 : (-1);
    bool _4844 = !_4822;
    int _4846 = _4844 ? _4832 : (-1);
    float _4848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4850 = ~_4812;
    int _4852 = _4708 + _4850;
    int _4854 = _4852 + 1;
    int _4856 = _4336 * _4838;
    int _4858 = _4856 + _4462;
    bool _4860 = _4336 == 0;
    float _4862 = _4814 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _4864 = _4336 == 0;
    int _4866 = _4462 ^ _4336;
    float _4868 = _4764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4870 = float(_4842);
    float _4872 = _4826 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _4874 = uint(int(uint(_4804) >> uint(31)));
    float _4876 = fma(_4868, _2394, -0.5);
    uint _4878 = uint(int(uint(_4828) >> uint(31)));
    float _4880 = fma(_4868, _4870, _784);
    bool _4882 = !_4860;
    int _4884 = _4882 ? _4858 : (-1);
    float _4886 = _4848 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4888 = ~int(_4874);
    int _4890 = _4888 + 1;
    float _4892 = fma(_4872, _2462, -0.5);
    float _4894 = float(_4846);
    float _4896 = fma(_4886, _2504, -0.5);
    float _4898 = float(_4884);
    float _4900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4902 = ~_4818;
    int _4904 = _4742 + _4902;
    int _4906 = _4904 + 1;
    float _4908 = fma(_4872, _4894, _1032);
    int _4910 = ~int(_4878);
    int _4912 = _4910 + 1;
    float _4914 = fma(_4886, _4898, _874);
    int _4916 = _4854 ^ _4890;
    float _4918 = _4782 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4920 = _4906 ^ _4912;
    float _4922 = fma(_1186, _4892, _4908);
    int _4924 = ~_4890;
    int _4926 = _4924 + _4916;
    int _4928 = _4926 + 1;
    float _4930 = fma(_2840, _4862, -0.5);
    int _4932 = ~_4912;
    int _4934 = _4932 + _4920;
    int _4936 = _4934 + 1;
    float _4938 = fma(_1112, _4876, _4880);
    bool _4940 = !_4802;
    int _4942 = _4940 ? _4928 : (-1);
    float _4944 = fma(_1206, _4896, _4914);
    bool _4946 = !_4824;
    int _4948 = _4946 ? _4936 : (-1);
    float _4950 = _4900 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4952 = float(_4942);
    float _4954 = _4944 + 0.5;
    bool _4956 = !_4820;
    int _4958 = _4956 ? 0 : (-1);
    float _4960 = fma(_4950, _2880, -0.5);
    uint _4962 = uint(int(uint(_4866) >> uint(31)));
    float _4964 = -_788;
    float _4966 = fma(_4918, _4952, _4964);
    float _4968 = float(_4948);
    float _4970 = fma(_2632, _4918, -0.5);
    int _4972 = ~_4958;
    int _4974 = _4752 + _4972;
    int _4976 = _4974 + 1;
    float _4978 = fma(_3996, _4210, _4620);
    int _4980 = ~int(_4962);
    int _4982 = _4980 + 1;
    float _4984 = fma(_1124, _4970, _4966);
    float _4986 = fma(_3996, _4242, _4636);
    float _4988 = fma(_3996, _4246, _4596);
    int _4990 = _4976 ^ _4982;
    float _4992 = -_4112;
    float _4994 = _4992 + 1.0;
    float _4996 = -_1212;
    float _4998 = fma(_4862, _4968, _4996);
    float _5000 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _5002 = ~_4982;
    int _5004 = _5002 + _4990;
    int _5006 = _5004 + 1;
    float _5008 = fma(_4994, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4112);
    out.m_87.x = _4978;
    out.m_87.y = _4986;
    out.m_87.z = _4988;
    float _5010 = _5000 * _2101;
    bool _5012 = !_4864;
    int _5014 = _5012 ? _5006 : (-1);
    float _5016 = _4740 * _5008;
    float _5018 = _4740;
    if (!_1985)
    {
        _5018 = 1.0;
    }
    float _5020 = _5018;
    float _5022 = fma(_1210, _4930, _4998);
    float _5024 = float(_5014);
    float _5026 = _3376 * _5010;
    float _5028 = _5020;
    if (_1985)
    {
        bool _5030 = _2099 >= _2053;
        bool _5032 = isnan(_2099);
        bool _5034 = _5030 || _5032;
        bool _5036 = isnan(_2053);
        bool _5038 = _5034 || _5036;
        float _5040 = float(_5038);
        _5028 = _5040;
    }
    float _5042 = _5028;
    float _5044 = _5022 + 0.5;
    float _5046 = fma(_4246, _3972, _4592);
    float _5048 = -_1214;
    float _5050 = fma(_4950, _5024, _5048);
    float _5052 = _5016 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5054 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3440);
    float _5056 = _5042 * _3094;
    float _5058 = fma(_1208, _4960, _5050);
    float _5060 = _3426 * _5052;
    float _5062 = precise::clamp(_5060, 0.0, 1.0);
    float _5064 = _5054 + _2007;
    out.gl_Position.x = _2027;
    out.gl_Position.y = _2031;
    out.gl_Position.z = _5054;
    out.gl_Position.w = _2007;
    float _5066 = _4938 + 0.5;
    float _5068 = -_5062;
    float _5070 = fma(_5068, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5072 = _4922 + 0.5;
    float _5074 = _4984 + 0.5;
    float _5076 = _5058 + 0.5;
    float _5078 = -_5056;
    float _5080 = fma(_5078, _5070, 1.0);
    float _5082 = precise::clamp(_5080, 0.0, 1.0);
    float _5084 = fma(_4242, _3972, _4634);
    float _5086 = _5064 * 0.5;
    float _5088 = _5082 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5090 = fma(_2112, _5026, _2110);
    out.m_89.x = _5066;
    out.m_89.y = _5074;
    out.m_89.z = _5072;
    out.m_89.w = _5044;
    bool _5092 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5094 = isnan(_3124);
    bool _5096 = _5092 || _5094;
    bool _5098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5100 = _5096 || _5098;
    float _5102 = _2112 * _5010;
    float _5104 = -_5000;
    float _5106 = _5104 + 1.0;
    out.m_91.x = _4954;
    out.m_91.y = _5076;
    float _5108 = fma(_3372, _5102, _2106);
    float _5110 = fma(_3374, _5102, _2108);
    float _5112 = _2112 * _5106;
    out.m_93.z = _5086;
    out.m_93.w = _2007;
    out.m_95.x = _5088;
    float _5114 = _5054;
    float _5116 = _5102;
    float _5118 = _5106;
    if (!_5100)
    {
        _5114 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5120 = _5114;
    float _5122 = _5120;
    float _5124 = _5120;
    if (!_5100)
    {
        _5116 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5126 = _5116;
    out.m_97.x = _5108;
    out.m_97.y = _5110;
    out.m_97.z = _5090;
    out.m_97.w = _5112;
    float _5128 = _5126;
    float _5130 = _5126;
    if (!_5100)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5132 = _5118;
    out.m_99.x = _4622;
    out.m_99.y = _5084;
    out.m_99.z = _5046;
    bool _5134 = !_5100;
    float _5136 = _5132;
    float _5138 = _5132;
    if (!_5134)
    {
        bool _5140 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5142 = isnan(_3124);
        bool _5144 = _5140 || _5142;
        bool _5146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5148 = _5144 || _5146;
        if (!_5148)
        {
            float _5150 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5152 = _3124 + _5150;
            float _5154 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5156 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5154;
            float _5158 = 1.0 / _5156;
            float _5160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5162 = _5160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5164 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5166 = _5164 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5168 = _5152 * _5158;
            float _5170 = precise::clamp(_5168, 0.0, 1.0);
            float _5172 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5174 = _5172 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5176 = fma(_5170, _5166, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5178 = fma(_5170, _5174, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5180 = fma(_5170, _5162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _5130 = _5180;
            _5124 = _5178;
            _5138 = _5176;
            _5182 = true;
        }
        else
        {
            bool _5184 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5186 = isnan(_3124);
            bool _5188 = _5184 || _5186;
            bool _5190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5192 = _5188 || _5190;
            if (!_5192)
            {
                _5122 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5194 = _5122;
            _5124 = _5194;
            if (!_5192)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5196 = _5128;
            _5130 = _5196;
            if (!_5192)
            {
                _5136 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5198 = _5136;
            bool _5200 = !_5192;
            _5138 = _5198;
            if (!_5200)
            {
                bool _5202 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5204 = isnan(_3124);
                bool _5206 = _5202 || _5204;
                bool _5208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5210 = _5206 || _5208;
                if (!_5210)
                {
                    float _5212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5214 = _3124 + _5212;
                    float _5216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5216;
                    float _5220 = 1.0 / _5218;
                    float _5222 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5224 = _5222 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5228 = _5226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5230 = _5214 * _5220;
                    float _5232 = precise::clamp(_5230, 0.0, 1.0);
                    float _5234 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5236 = _5234 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5238 = fma(_5232, _5228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5240 = fma(_5232, _5236, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5242 = fma(_5232, _5224, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _5130 = _5242;
                    _5124 = _5240;
                    _5138 = _5238;
                    _5182 = true;
                }
                else
                {
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5124 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5138 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5182 = false;
    float _5244 = _5130;
    float _5246 = _5124;
    float _5248 = _5138;
    float _5250 = _5244 * 0.586610972881317138671875;
    bool _5252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = 1.0;
    float _5254 = fma(_5246, 0.298911988735198974609375, _5250);
    out.m_101.x = 0.0;
    float _5256 = fma(_5248, 0.114477999508380889892578125, _5254);
    float _5258 = -_5256;
    float _5260 = _5258 + _5246;
    float _5262 = -_5256;
    float _5264 = _5262 + _5244;
    float _5266 = -_5256;
    float _5268 = _5266 + _5248;
    float _5270 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5272 = fma(_5260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    float _5274 = fma(_5264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    float _5276 = fma(_5268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    out.m_95.w = _5270;
    out.m_103.x = _5272;
    out.m_103.y = _5274;
    out.m_103.z = _5276;
    if (!_5252)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5278 = -_1901;
    float _5280 = _5278 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5282 = -_1903;
    float _5284 = _5282 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5286 = -_1905;
    float _5288 = _5286 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5290 = _5280 * _5280;
    float _5292 = fma(_5284, _5284, _5290);
    float _5294 = fma(_5288, _5288, _5292);
    float _5296 = sqrt(_5294);
    float _5298 = rsqrt(_5294);
    float _5300 = -_5296;
    float _5302 = _5300 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5304 = _5302 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5306 = precise::clamp(_5304, 0.0, 1.0);
    float _5308 = _5284 * _5298;
    float _5310 = _5280 * _5298;
    float _5312 = abs(_5306);
    float _5314 = log2(_5312);
    float _5316 = _5288 * _5298;
    float _5318 = _5308 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5320 = _5084 * _5310;
    float _5322 = -_5310;
    float _5324 = -_5318;
    float _5326 = fma(_5322, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5324);
    float _5328 = fma(_4622, _5308, _5320);
    float _5330 = -_5316;
    float _5332 = fma(_5330, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5326);
    float _5334 = fma(_5046, _5316, _5328);
    float _5336 = precise::clamp(_5334, 0.0, 1.0);
    float _5338 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5340 = _5332 + _5338;
    float _5342 = _5314 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5344 = _5340 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5346 = precise::clamp(_5344, 0.0, 1.0);
    float _5348 = exp2(_5342);
    float _5350 = _5348 * _5346;
    float _5352 = _5336 * _5350;
    float _5354 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5356 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5358 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5354;
    out.m_101.y = _5356;
    out.m_101.z = _5358;
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
    bool _5182 = false;
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
        float _5414 = as_type<float>(_138);
        out.gl_Position.z = _5414;
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
        float _5484 = as_type<float>(_176);
        out.gl_Position.z = _5484;
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
    float2 _6337 = float2(_654, _658);
    float _660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).x;
    float _662 = in.m_63.x;
    float _664 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _666 = in.m_63.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _670 = _668 != 0;
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    float _676 = in.m_69.x;
    float _678 = in.m_69.y;
    float _680 = in.m_69.z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _684 = -_640;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _688 = in.m_63.z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _694 = int(_692);
    float _696 = -_642;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = float(_122);
    float _702 = _662 * 2.0;
    float _704 = _662 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[5].x, _664);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _710 = floor(_702);
    float _712 = _666 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = -_690;
    float _716 = fma(_704, 2.0, _714);
    float _718 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].z, _706);
    float _720 = _586 * _676;
    float _722 = fma(_712, -2.0, _682);
    float _724 = _590 * _680;
    float _726 = _666 * 2.0;
    float _728 = _688 * 2.0;
    float _730 = _662 + _666;
    float _732 = _666 + _688;
    float _734 = _588 * _678;
    float _736 = _730 + (-1.0);
    int _738 = as_type<int>(_730);
    float _740 = _666;
    float _742 = _662;
    float _744 = _642;
    if (_670)
    {
        _738 = 0;
    }
    int _746 = _738;
    float _748 = floor(_728);
    int _750 = _746;
    if (!_670)
    {
        _750 = 2;
    }
    int _752 = _750;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _756 = _710 > 0.0;
    float _758 = _732 + (-1.0);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _762 = _752 != 2;
    float _764 = floor(_726);
    bool _766 = _710 >= 0.0;
    bool _768 = isnan(_710);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _778 = _752;
    if (_670)
    {
        _778 = 0;
    }
    int _780 = _778;
    float _782 = -_154;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[76].x, _716);
    int _786 = _774 ? 0 : 1;
    float _788 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _722);
    int _790 = _780;
    if (!_670)
    {
        _790 = 1;
    }
    int _792 = _790;
    float _794 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _796 = int(_794);
    int _798 = ~_786;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    float _804 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _806 = _802;
    float _808 = as_type<float>(_792);
    if (!_756)
    {
        int _810 = ~_786;
        int _812 = _810 + 1;
        _806 = _812;
    }
    int _814 = _806;
    bool _816 = _792 != 1;
    if (_762)
    {
        _808 = _662;
    }
    float _818 = _808;
    float _820 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _822 = int(_820);
    bool _824 = _748 > 0.0;
    float _826 = _818;
    if (!_762)
    {
        _826 = _688;
    }
    float _828 = _826;
    bool _830 = _764 > 0.0;
    bool _832 = _748 >= 0.0;
    bool _834 = isnan(_748);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = _828 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _844 = _764 >= 0.0;
    bool _846 = isnan(_764);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = 1.0 / _700;
    float _856 = _840 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _858 = -_708;
    float _860 = fma(_842, 2.0, _858);
    int _862 = _852 ? 0 : 1;
    float _864 = _842;
    float _866 = _856;
    float _868 = _828;
    if (!_816)
    {
        _864 = _666;
    }
    float _870 = _864;
    float _872 = -_154;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[86].x, _860);
    int _876 = ~as_type<int>(_856);
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    float _882 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _884 = int(_882);
    int _886 = ~_862;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    int _892 = _880;
    int _894 = _890;
    float _896 = _870;
    if (!_824)
    {
        int _898 = ~as_type<int>(_856);
        int _900 = _898 + 1;
        _892 = _900;
    }
    int _902 = _892;
    if (!_830)
    {
        int _904 = ~_862;
        int _906 = _904 + 1;
        _894 = _906;
    }
    int _908 = _894;
    if (!_816)
    {
        _866 = _870;
    }
    float _910 = _866;
    float _912 = _854 * _154;
    float _914 = _910;
    if (_816)
    {
        _914 = _662;
    }
    float _916 = _914;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _928 = _926 != 0;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_816)
    {
        _868 = _688;
    }
    float _932 = _868;
    float _934 = _916 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _936 = _932;
    if (_816)
    {
        _936 = _666;
    }
    float _938 = _936;
    float _940 = -_930;
    float _942 = fma(_934, 2.0, _940);
    float _944 = _718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _946 = !_924;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].w, _760);
    bool _952 = !_920;
    int _954 = _952 ? 0 : 1;
    float _956 = _944 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _960 = _958 != 0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _964 = _962 != 0;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_816)
    {
        _896 = _662;
    }
    float _968 = _896;
    float _970 = _944 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _972 = !_928;
    int _974 = _972 ? 0 : 1;
    float _976 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _956);
    bool _978 = !_964;
    int _980 = _978 ? 0 : 1;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[83].z, _966);
    bool _984 = !_960;
    int _986 = _984 ? 0 : 1;
    float _988 = in.m_71.x;
    float _990 = in.m_71.y;
    float _992 = in.m_71.z;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1004 = _1002 != 0;
    float _1006 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _970);
    float _1008 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[11].z, _976);
    float _1010 = float(_902);
    float _1012 = -_944;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1016 = !_996;
    float _1018 = _1016 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1020 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1006);
    float _1022 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1024 = _1006;
    float _1026 = _1018;
    if (!_816)
    {
        _1024 = _688;
    }
    float _1028 = _1024;
    float _1030 = -_154;
    float _1032 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[81].x, _942);
    int _1034 = abs(as_type<int>(_1018));
    float _1036 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1038 = _1028;
    if (_816)
    {
        _1038 = _666;
    }
    float _1040 = _1038;
    float _1042 = 1.0 / _1022;
    float _1044 = float(_1034);
    float _1046 = _1036 + _1022;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_762)
    {
        _1026 = _666;
    }
    float _1050 = _1026;
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1054 = _1044 * _1010;
    float _1056 = _1050;
    if (!_762)
    {
        _1056 = _662;
    }
    float _1058 = _1056;
    float _1060 = fma(_1052, -2.0, _1048);
    float _1062 = float(_796);
    float _1064 = _1054 * (-2.0);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1070 = 1.0 / _1062;
    float _1072 = fma(_1064, _988, _988);
    float _1074 = fma(_1068, -2.0, _1066);
    float _1076 = _674 * _154;
    float _1078 = float(_884);
    float _1080 = _1046 * _1042;
    float _1082 = _1080 * 0.5;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1086 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1088 = 1.0 / _1078;
    float _1090 = fma(_754, _1064, _754);
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1094 = _944 + _1086;
    float _1096 = float(_822);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1100 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1092);
    float _1102 = exp2(_1076);
    float _1104 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1084);
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1110 = 1.0 + _1108;
    float _1112 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1114 = _1014 * _1014;
    float _1116 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1098);
    float _1118 = 1.0 / _1096;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1122 = fma(_686, _686, _1114);
    float _1124 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1116);
    bool _1126 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1128 = isnan(1.0);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1134 = _1130 || _1132;
    float _1136 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1120);
    float _1138 = fma(_698, _698, _1122);
    bool _1140 = !_1004;
    int _1142 = _1140 ? 0 : 1;
    float _1144 = 1.0 / _1110;
    float _1146 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1106);
    bool _1148 = !_1000;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1154 = -_1102;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1146);
    float _1160 = float(_814);
    float _1162 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1152);
    int _1164 = abs(_1150);
    float _1166 = rsqrt(_1138);
    bool _1168 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1176 = _1172 || _1174;
    float _1178 = _662 + (-0.5);
    int _1180 = abs(_1142);
    float _1182 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1162);
    float _1184 = float(_1164);
    float _1186 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _982);
    float _1188 = float(_694);
    float _1190 = _1070 * _154;
    float _1192 = _1176 ? _1156 : 0.0;
    float _1194 = _1184 * _1160;
    float _1196 = float(_908);
    float _1198 = _1188 * _154;
    float _1200 = float(_1180);
    float _1202 = _1088 * _154;
    float _1204 = _1118 * _154;
    float _1206 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1100);
    float _1208 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1136);
    float _1210 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    float _1212 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1214 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1074);
    float _1216 = _1202;
    float _1218 = _1094;
    if (_1134)
    {
        float _1220 = _1192 * _1144;
        _156 = _1220;
    }
    float _1222 = _156;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1072);
    float _1226 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1228 = _1200 * _1196;
    float _1230 = _1194 * (-2.0);
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1234 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1232);
    float _1236 = fma(_1090, _1222, _1224);
    float _1238 = _662 + _688;
    float _1240 = _1228 * (-2.0);
    float _1242 = _666 + (-0.5);
    float _1244 = fma(_1230, _990, _990);
    float _1246 = _1238 + (-1.0);
    float _1248 = fma(_776, _1230, _776);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1244);
    float _1252 = 1.0 / _1234;
    float _1254 = _686 * _1166;
    float _1256 = in.m_73.x;
    float _1258 = in.m_73.y;
    float _1260 = in.m_73.z;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1264 = fma(_1240, _992, _992);
    float _1266 = _688 + (-0.5);
    float _1268 = fma(_1248, _1222, _1250);
    float _1270 = _698 * _1166;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1274 = _1254 * _1272;
    float _1276 = fma(_1262, _1240, _1262);
    float _1278 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1264);
    float _1280 = _1014 * _1166;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = _1270 * _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1288 = -_1274;
    float _1290 = fma(_1270, _1286, _1288);
    float _1292 = _1236 * 0.15915493667125701904296875;
    float _1294 = _1268 * 0.15915493667125701904296875;
    float _1296 = fma(_1276, _1222, _1278);
    float _1298 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1302 = _1280 * _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1306 = -_1284;
    float _1308 = fma(_1280, _1304, _1306);
    float _1310 = _1290 * _1290;
    float _1312 = _1292 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1318 = _1252 * _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1322 = -_1302;
    float _1324 = fma(_1254, _1320, _1322);
    float _1326 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1328 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1330 = _1318 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1332 = _1292 * 6.283185482025146484375;
    float _1334 = cos(_1332);
    bool _1336 = _1318 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1258);
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1256);
    float _1342 = _1340 * _1328;
    float _1344 = trunc(_1298);
    int _1346 = int(_1344);
    float _1348 = _1296 * 0.15915493667125701904296875;
    float _1350 = fma(_1308, _1308, _1310);
    float _1352 = _1338 * _1326;
    bool _1354 = !_1330;
    int _1356 = _1354 ? 0 : 1;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1260);
    float _1360 = fma(_1324, _1324, _1350);
    int _1362 = 2;
    float _1364 = _1226;
    if (!_1330)
    {
        _1362 = 1;
    }
    int _1366 = _1362;
    float _1368 = trunc(_1226);
    int _1370 = int(_1368);
    int _1372 = _1366;
    if (!_1336)
    {
        _1372 = _1356;
    }
    int _1374 = _1372;
    float _1376 = _1358 * _804;
    int _1378 = _1374 << 6;
    float _1380 = _1294 * 6.283185482025146484375;
    float _1382 = sin(_1380);
    int _1384 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1386 = _1346 + _1384;
    int _1388 = _1386 + 1;
    int _1390 = _1378 + 104;
    uint _1393 = uint(int(uint(_1390) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    bool _1409 = _1388 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1411 = _1294 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    int _1415 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1417 = _1370 + _1415;
    int _1419 = _1417 + 1;
    int _1421 = _1388 | _1419;
    float _1423 = _1348 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = _1314 * _1382;
    bool _1429 = _1421 < 0;
    bool _1431 = _1429 || _1409;
    float _1433 = _1334 * _1382;
    bool _1435 = _1419 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1437 = _1435 || _1431;
    float _1439 = rsqrt(_1360);
    float _1441 = _1334 * _1413;
    float _1443 = _1314 * _1413;
    float _1445 = _1348 * 6.283185482025146484375;
    float _1447 = sin(_1445);
    float _1449 = _1334 * _1425;
    float _1451 = _1413 * _1425;
    float _1453 = _1314 * _1425;
    float _1455 = _1382 * _1425;
    float _1457 = _1449 * _1352;
    int _1459 = _1378 + 48;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = _1388;
    int _1479 = _1419;
    if (!_1437)
    {
        int _1481 = _1419 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1483 = _1481 + _1388;
        _1477 = _1483;
    }
    int _1485 = _1477;
    float _1487 = _1308 * _1439;
    float _1489 = _1290 * _1439;
    float _1491 = _1324 * _1439;
    float _1493 = _1280 * _1487;
    float _1495 = _1270 * _1489;
    int _1497 = _1378 + 96;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    if (!_1437)
    {
        int _1515 = _1485 << 2;
        _1479 = _1515;
    }
    int _1517 = _1479;
    float _1519 = fma(_1447, _1441, _1427);
    float _1521 = fma(_1447, _1427, _1441);
    float _1523 = -_1433;
    float _1525 = fma(_1447, _1443, _1523);
    float _1527 = -_1443;
    float _1529 = fma(_1447, _1433, _1527);
    float _1531 = -_1352;
    float _1533 = _1447 * _1531;
    float _1535 = fma(_1519, _1342, _1457);
    int _1537 = _1378 + 64;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    uint _1541 = uint(int(uint(int(_1539)) >> uint(2)));
    int _1543 = int(_1539) & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = int(_1539) + 1;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    int _1551 = _1547 & 3;
    float _1553 = (*spvDescriptorSet0.vp_c15)._m0[int(_1549)][_1551];
    float _1555 = _1453 * _1352;
    float _1557 = fma(_1451, _1342, _1533);
    float _1559 = -_1493;
    float _1561 = fma(_1254, _1489, _1559);
    float _1563 = fma(_1529, _1376, _1535);
    float _1565 = fma(_1525, _1342, _1555);
    float _1567 = -_1495;
    float _1569 = fma(_1280, _1491, _1567);
    float _1571 = fma(_1455, _1376, _1557);
    int _1573 = _1378 + 72;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    float _1591 = _1561 * _1563;
    float _1593 = fma(_1521, _1376, _1565);
    float _1595 = _1569 * _1563;
    int _1597 = _1517;
    if (!_1437)
    {
        int _1599 = 12 & _1517;
        _1597 = _1599;
    }
    int _1601 = _1597;
    float _1603 = fma(_1491, _1571, _1591);
    int _1605 = 0;
    if (!_1437)
    {
        uint _1607 = uint(int(uint(_1485) >> uint(2)));
        _1605 = int(_1607);
    }
    int _1609 = _1605;
    float _1611 = fma(_1487, _1571, _1595);
    int _1613 = _1378 + 56;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    float _1631 = fma(_1270, _1593, _1603);
    int _1633 = _1609;
    if (!_1437)
    {
        int _1635 = _1609 << 4;
        int _1637 = _1635 + _1601;
        _1633 = _1637;
    }
    int _1639 = _1633;
    float _1641 = fma(_1254, _1593, _1611);
    float _1643 = _642 + _1631;
    float _1645 = _640 + _1641;
    int _1647 = _1378 + 80;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.vp_c15)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1667 = _1643 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1645 + _1669;
    float _1673 = _1667 * _1667;
    float _1675 = _1094 * _1475;
    float _1677 = fma(_1671, _1671, _1673);
    float _1679 = _1254 * _1491;
    float _1681 = _1475;
    float _1683 = _1671;
    if (!_1437)
    {
        float _1685 = floor(_1298);
        _1681 = _1685;
    }
    float _1687 = _1681;
    float _1689 = fma(_640, _1467, _1675);
    float _1691 = -_1679;
    float _1693 = fma(_1270, _1487, _1691);
    float _1695 = _1094 * _1513;
    float _1697 = _1693 * _1563;
    float _1699 = sqrt(_1677);
    float _1701 = fma(_640, _1505, _1695);
    float _1703 = fma(_1489, _1571, _1697);
    float _1705 = _1094 * _1553;
    float _1707 = fma(_642, _1399, _1701);
    float _1709 = fma(_1280, _1593, _1703);
    float _1711 = fma(_640, _1545, _1705);
    float _1713 = _1707 + _1407;
    float _1715 = _944 + _1709;
    float _1717 = fma(_642, _1581, _1711);
    bool _1719 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1721 = _1717 + _1589;
    float _1723 = 1.0 / _1713;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1727 = _1725 != 0;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1731 = _1729 != 0;
    float _1733 = fma(_642, _1621, _1689);
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1741 = _1739 != 0;
    float _1743 = _1733 + _1629;
    bool _1745 = !_1731;
    int _1747 = _1745 ? 0 : 1;
    bool _1749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1751 = isnan(0.5);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1757 = _1753 || _1755;
    bool _1759 = !_1727;
    int _1761 = _1759 ? 0 : 1;
    bool _1763 = !_1737;
    int _1765 = _1763 ? 0 : 1;
    bool _1767 = !_1741;
    int _1769 = _1767 ? 0 : 1;
    float _1771 = _1545;
    float _1773 = _1505;
    float _1775 = _1711;
    float _1777 = _1629;
    float _1779 = _1709;
    if (!_1719)
    {
        _1771 = _1645;
    }
    float _1781 = _1771;
    float _1783 = _1781;
    if (!_1719)
    {
        _1773 = _1643;
    }
    float _1785 = _1773;
    float _1787 = _1785;
    if (!_1719)
    {
        _1775 = _1715;
    }
    float _1789 = _1775;
    bool _1791 = !_1719;
    float _1793 = _1789;
    if (!_1791)
    {
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1799 = _1699 + _1797;
        float _1801 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = rsqrt(_1677);
        float _1805 = _1799 * _1795;
        float _1807 = _1805 * 0.15915493667125701904296875;
        float _1809 = _1807 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1807 * 6.283185482025146484375;
        float _1815 = sin(_1813);
        float _1817 = _1811 + (-1.0);
        float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = fma(_1815, _1801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1823 = fma(_1715, _1811, _1819);
        float _1825 = _1803 * _1821;
        float _1827 = fma(_1671, _1825, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1829 = fma(_1667, _1825, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1787 = _1829;
        _1783 = _1827;
        _1793 = _1823;
        _1777 = _1825;
    }
    float _1831 = _1787;
    float _1833 = _1783;
    float _1835 = _1793;
    float _1837 = _1777;
    float _1839 = _1743 * _1723;
    float _1841 = _1835;
    float _1843 = _1833;
    float _1845 = _1837;
    if (_1757)
    {
        _1683 = _1831;
    }
    float _1847 = _1683;
    float _1849 = _1847;
    if (!_1757)
    {
        float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1853 = _944 + _1851;
        float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1857 = _640 + _1855;
        float _1859 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = -_640;
        float _1863 = _1861 + _1833;
        float _1865 = _1853 * _1853;
        float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1869 = _642 + _1867;
        float _1871 = -_642;
        float _1873 = _1871 + _1831;
        float _1875 = fma(_1857, _1857, _1865);
        float _1877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1879 = fma(_1869, _1869, _1875);
        float _1881 = sqrt(_1879);
        float _1883 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1885 = precise::min(_1881, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1887 = _1885 * _1877;
        float _1889 = -_944;
        float _1891 = _1889 + _1835;
        float _1893 = _1883 * _1887;
        float _1895 = fma(_1891, _1893, _944);
        float _1897 = fma(_1863, _1893, _640);
        float _1899 = fma(_1873, _1893, _642);
        _1841 = _1895;
        _1843 = _1897;
        _1849 = _1899;
        _1845 = _1877;
    }
    float _1901 = _1841;
    float _1903 = _1843;
    float _1905 = _1849;
    float _1907 = _1845;
    int _1909 = _1378 + 88;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    uint _1913 = uint(int(uint(int(_1911)) >> uint(2)));
    int _1915 = int(_1911) & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    int _1919 = int(_1911) + 1;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    int _1923 = _1919 & 3;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[int(_1921)][_1923];
    float _1927 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1929 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1931 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1933 = _1839 >= 0.0;
    float _1935 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1927);
    float _1937 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1929);
    float _1939 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1931);
    float _1941 = _1643;
    if (!_1437)
    {
        int _1943 = _1639 + 400;
        uint _1945 = uint(int(uint(_1943) >> uint(2)));
        uint _1947 = uint(int(uint(int(_1945)) >> uint(2)));
        int _1949 = int(_1945) & 3;
        float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
        _1941 = _1951;
    }
    float _1953 = _1941;
    float _1955 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1935);
    float _1957 = _1721 * _1723;
    bool _1959 = _1839 <= 1.0;
    bool _1961 = _1959 && _1933;
    float _1963 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1965 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1937);
    float _1967 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1969 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    bool _1971 = _1957 >= 0.0;
    bool _1973 = _1971 && _1961;
    float _1975 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1963);
    float _1977 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1979 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1981 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1983 = _1957 <= 1.0;
    bool _1985 = _1983 && _1973;
    float _1987 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1975);
    float _1989 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1979);
    float _1991 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1995 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1997 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _1999 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2001 = -_1993;
    float _2003 = fma(_2001, _1991, 1.0);
    float _2005 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2007 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1997);
    float _2009 = _1094 * _1663;
    float _2011 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1999);
    if (_1985)
    {
        float _2013 = float(_1374);
        _1779 = _2013;
    }
    float _2015 = _1779;
    float _2017 = log2(_2003);
    float _2019 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2005);
    float _2021 = fma(_640, _1655, _2009);
    float _2023 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2011);
    float _2025 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2027 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2023);
    float _2029 = 1.0 / _2007;
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2025);
    float _2033 = _2025;
    if (!_1437)
    {
        float _2035 = -_1687;
        float _2037 = _1298 + _2035;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = fma(_642, _1917, _2021);
    float _2043 = _1907;
    if (!_1437)
    {
        float _2045 = floor(_1226);
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = _2041 + _1925;
    float _2051 = _2017 * 0.693147182464599609375;
    float _2053 = _2049 * _1723;
    float _2055 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2057 = _2015;
    if (_1985)
    {
        float _2059 = rint(_2015);
        float _2061 = precise::max(_2059, 0.0);
        uint _2063 = uint(_2061);
        uint _2065 = clamp(_2063, 0u, 65535u);
        _2057 = as_type<float>(_2065);
    }
    float _2067 = _2057;
    float _2069 = _2027 * _2029;
    float _2071 = _2031 * _2029;
    float _2073 = fma(_2069, 0.5, 0.5);
    float _2075 = fma(_2071, -0.5, 0.5);
    float _2077 = _2021;
    if (!_1437)
    {
        float _2079 = rint(_1953);
        float _2081 = precise::max(_2079, 0.0);
        uint _2083 = uint(_2081);
        uint _2085 = clamp(_2083, 0u, 65535u);
        _2077 = as_type<float>(_2085);
    }
    float _2087 = _2077;
    if (!_1437)
    {
        float _2089 = -_2047;
        float _2091 = _1226 + _2089;
        _1364 = _2091;
    }
    float _2093 = _1364;
    float _2095 = _2067;
    if (_1985)
    {
        float3 _8621 = float3(_1839, _1957, float(as_type<int>(_2067)));
        float3 _8625 = select(_8621, float3(0.0), isnan(_8621));
        float _2097 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8625.xy, uint(rint(_8625.z)), _2053, level(0.0));
        _2095 = _2097;
    }
    float _2099 = _2095;
    float3 _8635 = float3(_2073, _2075, _2055);
    float _2101 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8635, float3(0.0), isnan(_8635)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8635, float3(0.0), isnan(_8635)), level(0.0)).x;
    float3 _8644 = float3(_2073, _2075, _2055);
    float4 _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8644, float3(0.0), isnan(_8644)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8644, float3(0.0), isnan(_8644)), level(0.0)).xyzw;
    float _2106 = _2104.x;
    float _2108 = _2104.y;
    float _2110 = _2104.z;
    float _2112 = _2104.w;
    float _2114 = _2093;
    float _2116 = _2087;
    if (!_1437)
    {
        float3 _8668 = float3(_2039, _2093, float(as_type<int>(_2087)));
        float3 _8670 = select(_8668, float3(0.0), isnan(_8668));
        float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8670.xy, uint(rint(_8670.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8670.xy, uint(rint(_8670.z)), level(0.0)).x;
        _2114 = _2118;
    }
    float _2120 = _2114;
    float _2122 = float(uint(_694));
    float _2124 = trunc(_1190);
    int _2126 = int(_2124);
    int _2128 = ~_694;
    int _2130 = _2128 + 1;
    float _2132 = _1198 * _854;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2136 = _2134 != 0;
    int _2138 = abs(_1765);
    int _2140 = abs(_986);
    float _2142 = 1.0 / _2122;
    float _2144 = float(uint(_2126));
    float _2146 = trunc(_2132);
    int _2148 = int(_2146);
    int _2150 = as_type<int>(_2142) + (-2);
    float _2152 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2154 = int(_2152);
    float _2156 = as_type<float>(_2150) * _2144;
    float _2158 = float(_2126);
    float _2160 = in.m_75.x;
    if (_2136)
    {
        _2116 = 1.0;
    }
    float _2162 = _2116;
    float _2164 = trunc(_1204);
    int _2166 = int(_2164);
    float _2168 = _2162;
    if (!_2136)
    {
        _2168 = 7.345489978790283203125;
    }
    float _2170 = _2168;
    bool _2172 = _2158 >= _1188;
    bool _2174 = isnan(_2158);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(_1188);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = abs(_974);
    float _2186 = _2170 * _662;
    float _2188 = trunc(_2156);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    float _2194 = trunc(_2182);
    int _2196 = int(_2194);
    float _2198 = float(uint(_2166));
    int _2200 = _2130 * int(_2192);
    int _2202 = _2200 + _2126;
    float _2204 = float(uint(_2202));
    float _2206 = as_type<float>(_2150) * _2204;
    float _2208 = trunc(_2206);
    float _2210 = precise::max(_2208, 0.0);
    uint _2212 = uint(_2210);
    int _2214 = ~_2196;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = int(_2192) + int(_2212);
    float _2222 = floor(_2186);
    int _2224 = _2130 * _2220;
    int _2226 = _2224 + _2126;
    bool _2228 = uint(_2226) >= uint(_694);
    bool _2230 = !_2228;
    int _2232 = _2230 ? 0 : (-1);
    bool _2234 = _694 == 0;
    float _2236 = -_2222;
    float _2238 = _2186 + _2236;
    int _2240 = ~_2220;
    int _2242 = _2240 + _2232;
    int _2244 = _2242 + 1;
    int _2246 = _694 + (-1);
    float _2248 = _2238 * _1188;
    int _2250 = _694 * _2244;
    int _2252 = _2250 + _2126;
    float _2254 = trunc(_2248);
    int _2256 = int(_2254);
    bool _2258 = !_2234;
    int _2260 = _2258 ? _2252 : (-1);
    int _2262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2264 = _2262 != 0;
    int _2266 = abs(_948);
    int _2268 = _2260 * _2218;
    bool _2270 = !_2264;
    int _2272 = _2270 ? 0 : 1;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    int _2278 = _2196 * _2246;
    int _2280 = _2278 + _2268;
    int _2282 = abs(_2272);
    bool _2284 = !_2276;
    int _2286 = _2284 ? 0 : 1;
    int _2288 = _2280 * _2266;
    int _2290 = abs(_954);
    int _2292 = _2256 * _2282;
    int _2294 = _2292 + _2126;
    int _2296 = abs(_2286);
    float _2298 = trunc(_1202);
    int _2300 = int(_2298);
    int _2302 = _2148 * _2290;
    int _2304 = _2302 + _2288;
    float _2306 = float(uint(_2154));
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2310 = _2308 != 0;
    int _2312 = _2294 * _2184;
    int _2314 = _2312 + _2304;
    int _2316 = ~_694;
    int _2318 = _2316 + 1;
    float _2320 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2322 = int(_2320);
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2326 = _2324 != 0;
    int _2328 = _2256 * _2296;
    int _2330 = _2328 + _2314;
    float _2332 = float(uint(_2330));
    float _2334 = 1.0 / _2306;
    bool _2336 = _2276;
    int _2338 = int(_2192);
    float _2340 = _2198;
    if (_2310)
    {
        bool _2342 = _662 > 0.5;
        _2336 = _2342;
    }
    bool _2344 = _2336;
    float _2346 = as_type<float>(_2150) * _2332;
    int _2348 = as_type<int>(_2346);
    if (!_2310)
    {
        _1216 = _2160;
    }
    float _2350 = _1216;
    float _2352 = _2350;
    if (_2326)
    {
        float _2354 = -_2160;
        float _2356 = _2354 + 1.0;
        _2338 = as_type<int>(_2356);
    }
    int _2358 = _2338;
    float _2360 = trunc(_2346);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = float(uint(_2322));
    int _2368 = ~_2322;
    int _2370 = _2368 + 1;
    int _2372 = as_type<int>(_2334) + (-2);
    float _2374 = 1.0 / _2366;
    float _2376 = float(uint(_2300));
    if (_2310)
    {
        float _2378 = -_2160;
        float _2380 = _2378 + 1.0;
        _2348 = as_type<int>(_2380);
    }
    int _2382 = _2348;
    float _2384 = as_type<float>(_2372) * _2376;
    int _2386 = _2318 * int(_2364);
    int _2388 = _2386 + _2330;
    int _2390 = int(_2364);
    if (_2310)
    {
        float _2392 = _2344 ? as_type<float>(_2382) : _2160;
        _2352 = _2392;
    }
    float _2394 = _2352;
    bool _2396 = _688 > 0.5;
    float _2398 = trunc(_2384);
    float _2400 = precise::max(_2398, 0.0);
    uint _2402 = uint(_2400);
    float _2404 = float(uint(_2388));
    int _2406 = ~_2154;
    int _2408 = _2406 + 1;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2412 = _2410 != 0;
    float _2414 = as_type<float>(_2150) * _2404;
    int _2416 = as_type<int>(_2374) + (-2);
    float _2418 = trunc(_2414);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    float _2424 = as_type<float>(_2408);
    float _2426 = as_type<float>(_2408);
    if (_2136)
    {
        _2424 = _662;
    }
    float _2428 = _2424;
    float _2430 = as_type<float>(_2416) * _2198;
    float _2432 = _2428;
    if (!_2326)
    {
        _2340 = _2160;
    }
    float _2434 = _2340;
    float _2436 = _2434;
    if (!_2136)
    {
        _2432 = _666;
    }
    float _2438 = _2432;
    int _2440 = _2408 * int(_2402);
    int _2442 = _2440 + _2300;
    float _2444 = as_type<float>(_2402);
    if (_2136)
    {
        _2426 = 1.0;
    }
    float _2446 = _2426;
    float _2448 = trunc(_2430);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = _2446;
    if (!_2136)
    {
        _2454 = 1.2345600128173828125;
    }
    float _2456 = _2454;
    float _2458 = float(uint(_2442));
    if (_2326)
    {
        float _2460 = _2396 ? as_type<float>(_2358) : _2160;
        _2436 = _2460;
    }
    float _2462 = _2436;
    float _2464 = _2438 * _2456;
    int _2466 = ~_2322;
    int _2468 = _2466 + 1;
    float _2470 = as_type<float>(_2372) * _2458;
    int _2472 = int(_2364) + int(_2422);
    if (_2412)
    {
        float _2474 = -_2160;
        float _2476 = _2474 + 1.0;
        _2390 = as_type<int>(_2476);
    }
    int _2478 = _2390;
    float _2480 = trunc(_2470);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    bool _2486 = _666 > 0.5;
    float _2488 = in.m_63.w;
    if (!_2412)
    {
        _740 = _2160;
    }
    float _2490 = _740;
    int _2492 = _2468 * int(_2452);
    int _2494 = _2492 + _2166;
    int _2496 = ~_694;
    int _2498 = _2496 + 1;
    float _2500 = _2490;
    if (_2412)
    {
        float _2502 = _2486 ? as_type<float>(_2478) : _2160;
        _2500 = _2502;
    }
    float _2504 = _2500;
    float _2506 = floor(_2464);
    float _2508 = float(uint(_2494));
    float _2510 = in.m_75.y;
    int _2512 = ~_2154;
    int _2514 = _2512 + 1;
    int _2516 = _2498 * _2472;
    int _2518 = _2516 + _2330;
    if (!_2136)
    {
        _742 = _688;
    }
    float _2520 = _742;
    float _2522 = as_type<float>(_2416) * _2508;
    int _2524 = int(_2402) + int(_2484);
    bool _2526 = uint(_2518) >= uint(_694);
    float _2528 = trunc(_2522);
    float _2530 = precise::max(_2528, 0.0);
    uint _2532 = uint(_2530);
    float _2534 = float(_2154);
    int _2536 = _2514 * _2524;
    int _2538 = _2536 + _2300;
    float _2540 = float(_2300);
    float _2542 = -_2506;
    float _2544 = _2464 + _2542;
    if (_2136)
    {
        _2444 = 1.0;
    }
    float _2546 = _2444;
    float _2548 = _2546;
    if (!_2136)
    {
        _2548 = 5.839270114898681640625;
    }
    float _2550 = _2548;
    float _2552 = _2534 * _2544;
    bool _2554 = _2540 >= _2534;
    bool _2556 = isnan(_2540);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(_2534);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    bool _2566 = uint(_2538) >= uint(_2154);
    float _2568 = _2520 * _2550;
    float _2570 = trunc(_2564);
    int _2572 = int(_2570);
    float _2574 = -_2510;
    float _2576 = _2574 + 1.0;
    bool _2578 = !_2566;
    int _2580 = _2578 ? 0 : (-1);
    bool _2582 = !_2526;
    int _2584 = _2582 ? 0 : (-1);
    int _2586 = ~_2524;
    int _2588 = _2586 + _2580;
    int _2590 = _2588 + 1;
    bool _2592 = _2488 > 0.5;
    float _2594 = trunc(_2552);
    int _2596 = int(_2594);
    int _2598 = _2486 ? as_type<int>(_2576) : as_type<int>(_2510);
    int _2600 = _2154 * _2590;
    int _2602 = _2600 + _2300;
    bool _2604 = _2154 == 0;
    int _2606 = int(_2452) + int(_2532);
    float _2608 = _2534 * _912;
    int _2610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2612 = _2610 != 0;
    int _2614 = ~_2572;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2370 * _2606;
    int _2622 = _2620 + _2166;
    bool _2624 = !_2604;
    int _2626 = _2624 ? _2602 : (-1);
    float _2628 = trunc(_2608);
    int _2630 = int(_2628);
    float _2632 = _2612 ? as_type<float>(_2598) : _2510;
    int _2634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2636 = _2634 != 0;
    int _2638 = _2618 * _2626;
    int _2640 = _2592 ? as_type<int>(_2576) : as_type<int>(_2510);
    bool _2642 = !_2636;
    int _2644 = _2642 ? 0 : 1;
    int _2646 = _2154 + (-1);
    bool _2648 = uint(_2622) >= uint(_2322);
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2652 = _2650 != 0;
    int _2654 = _2572 * _2646;
    int _2656 = _2654 + _2638;
    bool _2658 = !_2648;
    int _2660 = _2658 ? 0 : (-1);
    float _2662 = floor(_2568);
    bool _2664 = !_2652;
    int _2666 = _2664 ? 0 : 1;
    int _2668 = abs(_1747);
    int _2670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2672 = _2670 != 0;
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2676 = _2674 != 0;
    int _2678 = _2656 * _2668;
    int _2680 = abs(_2644);
    float _2682 = float(_2322);
    float _2684 = float(_2166);
    int _2686 = abs(_1761);
    float _2688 = -_2662;
    float _2690 = _2568 + _2688;
    bool _2692 = _2684 >= _2682;
    bool _2694 = isnan(_2684);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(_2682);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    int _2704 = _2596 * _2680;
    int _2706 = _2704 + _2300;
    float _2708 = _2682 * _2690;
    int _2710 = ~_2606;
    int _2712 = _2710 + _2660;
    int _2714 = _2712 + 1;
    float _2716 = _2682 * _912;
    float _2718 = trunc(_2702);
    int _2720 = int(_2718);
    int _2722 = _2630 * _2686;
    int _2724 = _2722 + _2678;
    int _2726 = abs(_1769);
    int _2728 = _2322 * _2714;
    int _2730 = _2728 + _2166;
    bool _2732 = !_2672;
    int _2734 = _2732 ? 0 : 1;
    int _2736 = _2706 * _2138;
    int _2738 = _2736 + _2724;
    bool _2740 = _2322 == 0;
    float _2742 = trunc(_2716);
    int _2744 = int(_2742);
    int _2746 = abs(_2666);
    int _2748 = _2596 * _2726;
    int _2750 = _2748 + _2738;
    bool _2752 = !_2740;
    int _2754 = _2752 ? _2730 : (-1);
    int _2756 = _2322 + (-1);
    float _2758 = float(uint(_2750));
    float _2760 = trunc(_2708);
    int _2762 = int(_2760);
    int _2764 = ~_2720;
    int _2766 = _2764 + 1;
    int _2768 = _2766 + 1;
    int _2770 = ~_2472;
    int _2772 = _2770 + _2584;
    int _2774 = _2772 + 1;
    int _2776 = _2768 * _2754;
    int _2778 = _694 * _2774;
    int _2780 = _2778 + _2330;
    int _2782 = abs(_980);
    int _2784 = _2720 * _2756;
    int _2786 = _2784 + _2776;
    float _2788 = as_type<float>(_2372) * _2758;
    int _2790 = abs(_2734);
    float _2792 = float(uint(_2294));
    float _2794 = trunc(_2788);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = _2762 * _2746;
    int _2802 = _2800 + _2166;
    int _2804 = ~_2154;
    int _2806 = _2804 + 1;
    int _2808 = _2786 * _2782;
    float _2810 = as_type<float>(_2150) * _2792;
    bool _2812 = !_2234;
    int _2814 = _2812 ? _2780 : (-1);
    int _2816 = _2744 * _2140;
    int _2818 = _2816 + _2808;
    bool _2820 = !_2676;
    int _2822 = _2820 ? 0 : 1;
    int _2824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2826 = _2824 != 0;
    float _2828 = trunc(_2810);
    float _2830 = precise::max(_2828, 0.0);
    uint _2832 = uint(_2830);
    int _2834 = abs(_2822);
    int _2836 = _2802 * _2790;
    int _2838 = _2836 + _2818;
    float _2840 = _2826 ? as_type<float>(_2640) : _2510;
    int _2842 = _2806 * int(_2798);
    int _2844 = _2842 + _2750;
    int _2846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2848 = _2846 != 0;
    int _2850 = ~_694;
    int _2852 = _2850 + 1;
    int _2854 = _2762 * _2834;
    int _2856 = _2854 + _2838;
    float _2858 = float(uint(_2844));
    float _2860 = float(uint(_2856));
    float _2862 = as_type<float>(_2372) * _2858;
    int _2864 = ~_2322;
    int _2866 = _2864 + 1;
    int _2868 = _2852 * int(_2832);
    int _2870 = _2868 + _2294;
    int _2872 = ~_2154;
    int _2874 = _2872 + 1;
    float _2876 = _2510;
    if (_2848)
    {
        float _2878 = _2396 ? _2576 : _2510;
        _2876 = _2878;
    }
    float _2880 = _2876;
    float _2882 = as_type<float>(_2416) * _2860;
    int _2884 = _2814 & 3;
    bool _2886 = _2884 != 0;
    float _2888 = trunc(_2862);
    float _2890 = precise::max(_2888, 0.0);
    uint _2892 = uint(_2890);
    int _2894 = _2814 & 3;
    bool _2896 = _2894 != 0;
    float _2898 = float(uint(_2870));
    int _2900 = _2886 ? 0 : 1;
    bool _2902 = uint(_2894) > 1u;
    float _2904 = trunc(_2882);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    float _2910 = as_type<float>(_2150) * _2898;
    float _2912 = float(uint(_2706));
    int _2914 = ~_2900;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = ~_694;
    int _2922 = _2920 + 1;
    float _2924 = as_type<float>(_2372) * _2912;
    float _2926 = trunc(_2910);
    float _2928 = precise::max(_2926, 0.0);
    uint _2930 = uint(_2928);
    int _2932 = int(_2798) + int(_2892);
    int _2934 = _2918;
    float _2936 = as_type<float>(_2932);
    if (!_2902)
    {
        int _2938 = ~_2900;
        int _2940 = _2938 + 1;
        _2934 = _2940;
    }
    int _2942 = _2934;
    bool _2944 = uint(_2894) >= 2u;
    int _2946 = _2866 * int(_2908);
    int _2948 = _2946 + _2856;
    float _2950 = trunc(_2924);
    float _2952 = precise::max(_2950, 0.0);
    uint _2954 = uint(_2952);
    int _2956 = _2944 ? 0 : 1;
    bool _2958 = _2894 != 3;
    float _2960 = float(uint(_2948));
    int _2962 = ~_2154;
    int _2964 = _2962 + 1;
    int _2966 = int(_2832) + int(_2930);
    float _2968 = as_type<float>(_2416) * _2960;
    int _2970 = ~_2956;
    int _2972 = _2970 + 1;
    int _2974 = _2972 + 1;
    int _2976 = _2964 * _2932;
    int _2978 = _2976 + _2750;
    float _2980 = trunc(_2968);
    float _2982 = precise::max(_2980, 0.0);
    uint _2984 = uint(_2982);
    int _2986 = _2974;
    if (_2958)
    {
        int _2988 = ~_2956;
        int _2990 = _2988 + 1;
        _2986 = _2990;
    }
    int _2992 = _2986;
    int _2994 = _2874 * int(_2954);
    int _2996 = _2994 + _2706;
    bool _2998 = uint(_2978) >= uint(_2154);
    int _3000 = _2922 * _2966;
    int _3002 = _3000 + _2294;
    bool _3004 = !_2998;
    int _3006 = _3004 ? 0 : (-1);
    float _3008 = float(uint(_2996));
    int _3010 = ~_2932;
    int _3012 = _3010 + _3006;
    int _3014 = _3012 + 1;
    bool _3016 = uint(_3002) >= uint(_694);
    float _3018 = as_type<float>(_2372) * _3008;
    int _3020 = int(_2908) + int(_2984);
    int _3022 = _2154 * _3014;
    int _3024 = _3022 + _2750;
    if (_1437)
    {
        _2936 = 1.0;
    }
    float _3026 = _2936;
    float _3028 = _3026;
    float _3030 = _2120;
    if (!_1437)
    {
        int _3032 = _1485 << 4;
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
        float _3070 = _1094 * _3050;
        float _3072 = fma(_640, _3042, _3070);
        float _3074 = fma(_642, _3060, _3072);
        float _3076 = _3074 + _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = -_3078;
        float _3082 = _3080 + _2120;
        float _3084 = fma(_3082, 500.0, 1.5);
        float _3086 = exp2(_3084);
        float _3088 = 0.0 + _3086;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        _1218 = _3070;
        _3028 = _3090;
    }
    float _3092 = _1218;
    float _3094 = _3028;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3098 = _1901 + _3096;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3102 = _1903 + _3100;
    float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3106 = _1905 + _3104;
    bool _3108 = !_2604;
    int _3110 = _3108 ? _3024 : (-1);
    float _3112 = _3098 * _3098;
    bool _3114 = !_3016;
    int _3116 = _3114 ? 0 : (-1);
    float _3118 = fma(_3102, _3102, _3112);
    float _3120 = fma(_3106, _3106, _3118);
    float _3122 = rsqrt(_3120);
    float _3124 = sqrt(_3120);
    float _3126 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3128 = _3102 * _3126;
    float _3130 = _3106 * _3126;
    float _3132 = _3128 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 + _3134;
    float _3138 = sqrt(_3136);
    bool _3140 = _3138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = _3138 + _3142;
    float _3146 = _3122;
    float _3148 = _3092;
    float _3150 = _3144;
    float _3152 = _3098;
    float _3154 = _3136;
    if (_3140)
    {
        float _3156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3146 = _3156;
    }
    float _3158 = _3146;
    if (_3140)
    {
        float _3160 = rsqrt(_3136);
        _3148 = _3160;
    }
    float _3162 = _3148;
    float _3164 = _3162;
    if (_3140)
    {
        float _3166 = _3144 * _3158;
        _3150 = _3166;
    }
    float _3168 = _3150;
    if (_3140)
    {
        float _3170 = _3168 * 0.15915493667125701904296875;
        _744 = _3170;
    }
    float _3172 = _744;
    float _3174 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3176 = _3106;
    if (_3140)
    {
        float _3178 = _3172 * 6.283185482025146484375;
        float _3180 = sin(_3178);
        _3176 = _3180;
    }
    float _3182 = _3176;
    float _3184 = precise::max(0.0, _3174);
    float _3186 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3188 = _3184;
    if (_3140)
    {
        float _3190 = _3172 * 6.283185482025146484375;
        float _3192 = cos(_3190);
        _3186 = _3192;
    }
    float _3194 = _3186;
    float _3196 = -_3126;
    float _3198 = -_3184;
    float _3200 = fma(_3098, _3196, _3198);
    if (_3140)
    {
        float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3152 = _3202;
    }
    float _3204 = _3152;
    float _3206 = _3204;
    float _3208 = _3182;
    if (_3140)
    {
        float _3210 = fma(_3182, _3204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3206 = _3210;
    }
    float _3212 = _3206;
    float _3214 = _3212;
    if (!_3140)
    {
        _3208 = _3128;
    }
    float _3216 = _3208;
    float _3218 = _3216;
    if (_3140)
    {
        float _3220 = _3162 * _3212;
        _3030 = _3220;
    }
    float _3222 = _3030;
    if (!_3140)
    {
        _3214 = _3200;
    }
    float _3224 = _3214;
    float _3226 = _3224;
    float _3228 = _3194;
    if (_3140)
    {
        float _3230 = _3194 + (-1.0);
        _3188 = _3230;
    }
    float _3232 = _3188;
    float _3234 = _3232;
    if (_3140)
    {
        float _3236 = _3128 * _3222;
        _3218 = _3236;
    }
    float _3238 = _3218;
    if (!_3140)
    {
        _3164 = _3132;
    }
    float _3240 = _3164;
    float _3242 = _3240;
    if (_3140)
    {
        float _3244 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3154 = _3244;
    }
    float _3246 = _3154;
    if (!_3140)
    {
        _3234 = _3130;
    }
    float _3248 = _3234;
    float _3250 = _3248;
    if (_3140)
    {
        float _3252 = _3130 * _3222;
        _3250 = _3252;
    }
    float _3254 = _3250;
    if (_3140)
    {
        float _3256 = _3238 * _3238;
        _3242 = _3256;
    }
    float _3258 = _3242;
    if (_3140)
    {
        float _3260 = fma(_3200, _3194, _3246);
        _3226 = _3260;
    }
    float _3262 = _3226;
    if (!_3140)
    {
        _3228 = _3134;
    }
    float _3264 = _3228;
    float _3266 = _3264;
    if (_3140)
    {
        float _3268 = _3254 * _3254;
        _3266 = _3268;
    }
    float _3270 = _3266;
    float _3272 = fma(_3262, _3262, _3258);
    bool _3274 = !_2896;
    int _3276 = _3274 ? 0 : 1;
    int _3278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3280 = _3278 != 0;
    float _3282 = _3272 + _3270;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3286 = fma(_3124, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3284);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    float _3290 = -_3288;
    float _3292 = _3290 + 1.0;
    float _3294 = rsqrt(_3282);
    float _3296 = abs(_3292);
    float _3298 = log2(_3296);
    float _3300 = _3294 * _3238;
    float _3302 = _3294 * _3262;
    float _3304 = _3294 * _3254;
    float _3306 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3308 = -_3306;
    float _3310 = fma(_3302, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3314 = _3302 + 1.0;
    float _3316 = -_3304;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3320 = exp2(_3312);
    float _3322 = fma(_3318, 0.5, 0.5);
    float _3324 = fma(_3318, -0.5, 0.5);
    float _3326 = fma(_3322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3328 = sqrt(_3324);
    float _3330 = -_3302;
    float _3332 = fma(_3320, _3314, _3330);
    float _3334 = fma(_3322, _3326, -0.212114393711090087890625);
    int _3336 = _3110 & 3;
    bool _3338 = _3336 != 0;
    float _3340 = fma(_3332, 0.5, 0.5);
    float _3342 = fma(_3322, _3334, 1.570728778839111328125);
    int _3344 = ~_2322;
    int _3346 = _3344 + 1;
    float _3348 = _3328 * 0.636619746685028076171875;
    bool _3350 = uint(_3336) >= 2u;
    int _3352 = _3346 * _3020;
    int _3354 = _3352 + _2856;
    float _3356 = -_3342;
    float _3358 = fma(_3348, _3356, 1.0);
    int _3360 = _3350 ? 0 : 1;
    bool _3362 = !_3280;
    int _3364 = _3362 ? 0 : 1;
    bool _3366 = _3336 != 3;
    float2 _10425 = float2(_3358, _3340);
    float3 _3370 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10425, float2(0.0), isnan(_10425)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10425, float2(0.0), isnan(_10425)), level(0.0)).xyz;
    float _3372 = _3370.x;
    float _3374 = _3370.y;
    float _3376 = _3370.z;
    float _3378 = trunc(_3018);
    float _3380 = precise::max(_3378, 0.0);
    uint _3382 = uint(_3380);
    bool _3384 = uint(_3354) >= uint(_2322);
    float _3386 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3388 = _620 + _3386;
    int _3390 = _3338 ? 0 : 1;
    float _3392 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3394 = _620 + _3392;
    bool _3396 = _2894 != 3;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3400 = _620 + _3398;
    int _3402 = ~_3360;
    int _3404 = _3402 + 1;
    int _3406 = _3404 + 1;
    float _3408 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    float _3414 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3416 = uint(_3336) > 1u;
    float _3418 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3408);
    bool _3420 = !_3384;
    int _3422 = _3420 ? 0 : (-1);
    float _3424 = -_660;
    float _3426 = _3424 + 1.0;
    int _3428 = _3406;
    if (_3366)
    {
        int _3430 = ~_3360;
        int _3432 = _3430 + 1;
        _3428 = _3432;
    }
    int _3434 = _3428;
    float _3436 = exp2(_3414);
    bool _3438 = _3336 != 3;
    float _3440 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3418);
    int _3442 = int(_2954) + int(_3382);
    out.m_77.x = _1903;
    out.m_77.y = _1901;
    out.m_77.z = _1905;
    int _3444 = ~_2154;
    int _3446 = _3444 + 1;
    int _3448 = ~_3020;
    int _3450 = _3448 + _3422;
    int _3452 = _3450 + 1;
    int _3454 = ~_3390;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    bool _3460 = !_3438;
    int _3462 = _3460 ? 0 : (-1);
    int _3464 = _2322 * _3452;
    int _3466 = _3464 + _2856;
    int _3468 = _3458;
    if (!_3416)
    {
        int _3470 = ~_3390;
        int _3472 = _3470 + 1;
        _3468 = _3472;
    }
    int _3474 = _3468;
    int _3476 = _3446 * _3442;
    int _3478 = _3476 + _2706;
    int _3480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3482 = _3480 != 0;
    float _3484 = -_3436;
    float _3486 = _3484 + 1.0;
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3490 = _3488 != 0;
    int _3492 = _3110 & 3;
    bool _3494 = _3492 != 0;
    float _3496 = float(uint(_2802));
    bool _3498 = !_3494;
    int _3500 = _3498 ? 0 : 1;
    bool _3502 = uint(_3478) >= uint(_2154);
    float _3504 = as_type<float>(_2416) * _3496;
    bool _3506 = !_2740;
    int _3508 = _3506 ? _3466 : (-1);
    float _3510 = trunc(_3504);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    bool _3516 = !_3502;
    int _3518 = _3516 ? 0 : (-1);
    int _3520 = _3508 & 3;
    bool _3522 = _3520 != 0;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3528 = 1.0 / _3526;
    int _3530 = _3522 ? 0 : 1;
    float _3532 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3534 = _3532 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3536 = uint(_3520) >= 2u;
    float _3538 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3540 = _3538 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3542 = _3536 ? 0 : 1;
    float _3544 = 1.0 / _3534;
    float _3546 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3548 = _3546 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3550 = _3520 != 3;
    int _3552 = ~_2322;
    int _3554 = _3552 + 1;
    float _3556 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3558 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3556;
    float _3560 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3562 = _3560 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3564 = 1.0 / _3540;
    int _3566 = _3554 * int(_3514);
    int _3568 = _3566 + _2802;
    float _3570 = float(uint(_3568));
    float _3572 = 1.0 / _3548;
    int _3574 = ~_3542;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    float _3580 = _3558 * _3544;
    int _3582 = _3578;
    if (_3550)
    {
        int _3584 = ~_3542;
        int _3586 = _3584 + 1;
        _3582 = _3586;
    }
    int _3588 = _3582;
    float _3590 = as_type<float>(_2416) * _3570;
    bool _3592 = _3520 != 3;
    float _3594 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3596 = _3594 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3598 = _3562 * _3564;
    bool _3600 = !_3592;
    int _3602 = _3600 ? 0 : (-1);
    float _3604 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3606 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3604;
    bool _3608 = uint(_3520) > 1u;
    float _3610 = trunc(_3590);
    float _3612 = precise::max(_3610, 0.0);
    uint _3614 = uint(_3612);
    float _3616 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3616;
    bool _3620 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3622 = isnan(_620);
    bool _3624 = _3620 || _3622;
    bool _3626 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3628 = _3624 || _3626;
    float _3630 = float(_3628);
    float _3632 = _3606 * _3572;
    float _3634 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3636 = _620 + _3634;
    float _3638 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3640 = _3638 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3642 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3644 = _3642 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3646 = 1.0 / _3596;
    float _3648 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3650 = _3648 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3652 = _3618 * _3528;
    float _3654 = fma(_3580, _3388, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3656 = fma(_3598, _3636, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3658 = ~_3530;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    float _3664 = -_3630;
    float _3666 = _3664 + 1.0;
    bool _3668 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3670 = isnan(_620);
    bool _3672 = _3668 || _3670;
    bool _3674 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3676 = _3672 || _3674;
    float _3678 = float(_3676);
    float _3680 = 1.0 / _3640;
    int _3682 = _3662;
    float _3684 = _3656;
    if (!_3608)
    {
        int _3686 = ~_3530;
        int _3688 = _3686 + 1;
        _3682 = _3688;
    }
    int _3690 = _3682;
    float _3692 = fma(_3652, _3394, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _3694 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3696 = isnan(_620);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3702 = _3698 || _3700;
    float _3704 = float(_3702);
    float _3706 = _3678 * _3666;
    float _3708 = -_3678;
    float _3710 = _3708 + 1.0;
    bool _3712 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3714 = isnan(_620);
    bool _3716 = _3712 || _3714;
    bool _3718 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3720 = _3716 || _3718;
    float _3722 = float(_3720);
    float _3724 = 1.0 / _3644;
    float _3726 = -_3704;
    float _3728 = _3726 + 1.0;
    int _3730 = int(_3514) + int(_3614);
    float _3732 = _3704 * _3710;
    int _3734 = ~_2322;
    int _3736 = _3734 + 1;
    float _3738 = _3722 * _3728;
    float _3740 = -_3722;
    float _3742 = _3740 + 1.0;
    bool _3744 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3746 = isnan(_620);
    bool _3748 = _3744 || _3746;
    bool _3750 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3752 = _3748 || _3750;
    float _3754 = float(_3752);
    float _3756 = _3650 * _3646;
    bool _3758 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3760 = isnan(_620);
    bool _3762 = _3758 || _3760;
    bool _3764 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3766 = _3762 || _3764;
    float _3768 = float(_3766);
    int _3770 = _3736 * _3730;
    int _3772 = _3770 + _2802;
    int _3774 = _3508 & 3;
    bool _3776 = _3774 != 0;
    float _3778 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3780 = _3778 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3782 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3784 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3782;
    float _3786 = _3754 * _3742;
    float _3788 = -_3754;
    float _3790 = _3788 + 1.0;
    bool _3792 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3794 = isnan(_620);
    bool _3796 = _3792 || _3794;
    bool _3798 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3800 = _3796 || _3798;
    float _3802 = float(_3800);
    float _3804 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3806 = _620 + _3804;
    bool _3808 = !_3776;
    int _3810 = _3808 ? 0 : 1;
    float _3812 = -_3768;
    float _3814 = _3812 + 1.0;
    bool _3816 = uint(_3772) >= uint(_2322);
    float _3818 = _3780 * _3680;
    float _3820 = _3784 * _3724;
    bool _3822 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3824 = isnan(_620);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3830 = _3826 || _3828;
    float _3832 = float(_3830);
    float _3834 = in.m_79.x;
    float _3836 = in.m_79.y;
    float _3838 = in.m_79.z;
    float _3840 = _3768 * _3790;
    float _3842 = fma(_3632, _3806, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3844 = _3802 * _3814;
    float _3846 = -_3802;
    float _3848 = _3846 + 1.0;
    bool _3850 = !_3816;
    int _3852 = _3850 ? 0 : (-1);
    float _3854 = in.m_81.x;
    float _3856 = in.m_81.y;
    float _3858 = in.m_81.z;
    float _3860 = in.m_81.w;
    bool _3862 = _1258 != 0.0;
    bool _3864 = isnan(_1258);
    bool _3866 = _3862 || _3864;
    bool _3868 = isnan(0.0);
    bool _3870 = _3866 || _3868;
    float _3872 = _3832 * _3848;
    float _3874 = -_3832;
    float _3876 = _3874 + 1.0;
    float _3878 = fma(_3756, _3400, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _3880 = _1256 == 0.0;
    bool _3882 = !_3870;
    bool _3884 = _3880 && _3882;
    float _3886 = _3654 * _3872;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3890 = _620 + _3888;
    int _3892 = ~_2966;
    int _3894 = _3892 + _3116;
    int _3896 = _3894 + 1;
    bool _3898 = _1260 == 0.0;
    bool _3900 = _3898 && _3884;
    float _3902 = fma(_3876, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3886);
    float _3904 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3906 = _620 + _3904;
    float _3908 = fma(_3818, _3890, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3910 = abs(_1318);
    float _3912 = log2(_3910);
    float _3914 = fma(_3656, _3844, _3902);
    float _3916 = fma(_3820, _3906, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3918 = ~_3730;
    int _3920 = _3918 + _3852;
    int _3922 = _3920 + 1;
    int _3924 = _694 * _3896;
    int _3926 = _3924 + _2294;
    float _3928 = fma(_3842, _3840, _3914);
    int _3930 = ~_3442;
    int _3932 = _3930 + _3518;
    int _3934 = _3932 + 1;
    int _3936 = abs(_2942);
    float _3938 = fma(_3878, _3786, _3928);
    float _3940 = _3756;
    float _3942 = _3818;
    if (_3900)
    {
        _3940 = _3836;
    }
    float _3944 = _3940;
    float _3946 = _3944;
    if (!_3900)
    {
        float _3948 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3836);
        _3946 = _3948;
    }
    float _3950 = _3946;
    if (_3900)
    {
        _3942 = _3834;
    }
    float _3952 = _3942;
    float _3954 = _3952;
    if (!_3900)
    {
        float _3956 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3834);
        _3954 = _3956;
    }
    float _3958 = _3954;
    float _3960 = _3856 * _3838;
    float _3962 = _3858 * _3834;
    float _3964 = _3854 * _3836;
    if (_3900)
    {
        _3684 = _3838;
    }
    float _3966 = _3684;
    float _3968 = _3966;
    if (!_3900)
    {
        float _3970 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3838);
        _3968 = _3970;
    }
    float _3972 = _3968;
    float _3974 = fma(_3692, _3738, _3938);
    float _3976 = -_3960;
    float _3978 = fma(_3858, _3836, _3976);
    float _3980 = -_3962;
    float _3982 = fma(_3854, _3838, _3980);
    float _3984 = -_3964;
    float _3986 = fma(_3856, _3834, _3984);
    float _3988 = fma(_3908, _3732, _3974);
    int _3990 = _3508 >> 31;
    float _3992 = _3978 * _3860;
    float _3994 = _3982 * _3860;
    float _3996 = _3986 * _3860;
    float _3998 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _4000 = _2814 >> 31;
    float _4002 = fma(_3916, _3706, _3988);
    int _4004 = _3990 & 3;
    float _4006 = _1519 * _1693;
    int _4008 = _4000 & 3;
    float _4010 = exp2(_3998);
    int _4012 = _3508 + _4004;
    float _4014 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4002);
    int _4016 = _3110 >> 31;
    float _4018 = _1449 * _1693;
    int _4020 = _2814 + _4008;
    float _4022 = _1529 * _1569;
    int _4024 = _4012 >> 2;
    float _4026 = _1529 * _1693;
    int _4028 = _4016 & 3;
    float _4030 = _1519 * _1561;
    int _4032 = _4024 << 4;
    int _4034 = _4032 + 656;
    float _4036 = _1449 * _1569;
    int _4038 = _4020 >> 2;
    float _4040 = _1449 * _1561;
    int _4042 = _3110 + _4028;
    float _4044 = _1529 * _1561;
    uint _4046 = uint(int(uint(_4034) >> uint(2)));
    uint _4048 = uint(int(uint(int(_4046)) >> uint(2)));
    int _4050 = int(_4046) & 3;
    float _4052 = (*spvDescriptorSet0.vp_c9)._m0[int(_4048)][_4050];
    int _4054 = int(_4046) + 1;
    uint _4056 = uint(int(uint(_4054) >> uint(2)));
    int _4058 = _4054 & 3;
    float _4060 = (*spvDescriptorSet0.vp_c9)._m0[int(_4056)][_4058];
    int _4062 = _4038 << 4;
    int _4064 = _4062 + 368;
    float _4066 = -_1447;
    float _4068 = fma(_4066, _1487, _4036);
    float _4070 = fma(_4010, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4072 = precise::clamp(_4070, 0.0, 1.0);
    int _4074 = _4042 >> 2;
    float _4076 = -_1447;
    float _4078 = fma(_4076, _1491, _4040);
    out.m_83.x = _4014;
    uint _4080 = uint(int(uint(_4064) >> uint(2)));
    uint _4082 = uint(int(uint(int(_4080)) >> uint(2)));
    int _4084 = int(_4080) & 3;
    float _4086 = (*spvDescriptorSet0.vp_c9)._m0[int(_4082)][_4084];
    int _4088 = int(_4080) + 1;
    uint _4090 = uint(int(uint(_4088) >> uint(2)));
    int _4092 = _4088 & 3;
    float _4094 = (*spvDescriptorSet0.vp_c9)._m0[int(_4090)][_4092];
    int _4096 = _4074 << 4;
    int _4098 = _4096 + 512;
    float _4100 = fma(_4072, -2.0, 3.0);
    float _4102 = _4072 * _4072;
    float _4104 = fma(_1455, _1489, _4026);
    float _4106 = fma(_1455, _1491, _4044);
    int _4108 = _2154 * _3934;
    int _4110 = _4108 + _2706;
    float _4112 = _4102 * _4100;
    uint _4114 = uint(int(uint(_4098) >> uint(2)));
    uint _4116 = uint(int(uint(int(_4114)) >> uint(2)));
    int _4118 = int(_4114) & 3;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[int(_4116)][_4118];
    int _4122 = int(_4114) + 1;
    uint _4124 = uint(int(uint(_4122) >> uint(2)));
    int _4126 = _4122 & 3;
    float _4128 = (*spvDescriptorSet0.vp_c9)._m0[int(_4124)][_4126];
    float _4130 = _1519 * _1569;
    float _4132 = fma(_1451, _1489, _4006);
    float _4134 = -_1447;
    float _4136 = fma(_4134, _1489, _4018);
    float _4138 = fma(_1455, _1487, _4022);
    float _4140 = fma(_1451, _1487, _4130);
    int _4142 = abs(_3690);
    float _4144 = fma(_1453, _1280, _4136);
    int _4146 = _4064 + 8;
    uint _4148 = uint(int(uint(_4146) >> uint(2)));
    uint _4150 = uint(int(uint(int(_4148)) >> uint(2)));
    int _4152 = int(_4148) & 3;
    float _4154 = (*spvDescriptorSet0.vp_c9)._m0[int(_4150)][_4152];
    int _4156 = int(_4148) + 1;
    uint _4158 = uint(int(uint(_4156) >> uint(2)));
    int _4160 = _4156 & 3;
    float _4162 = (*spvDescriptorSet0.vp_c9)._m0[int(_4158)][_4160];
    int _4164 = abs(_3474);
    float _4166 = fma(_1451, _1491, _4030);
    int _4168 = ~_4142;
    int _4170 = _4168 + 1;
    int _4172 = _4170 + 1;
    int _4174 = _2322 * _3922;
    int _4176 = _4174 + _2802;
    int _4178 = ~_3936;
    int _4180 = _4178 + 1;
    int _4182 = _4180 + 1;
    float _4184 = fma(_1525, _1280, _4132);
    int _4186 = _4098 + 8;
    uint _4188 = uint(int(uint(_4186) >> uint(2)));
    uint _4190 = uint(int(uint(int(_4188)) >> uint(2)));
    int _4192 = int(_4188) & 3;
    float _4194 = (*spvDescriptorSet0.vp_c9)._m0[int(_4190)][_4192];
    int _4196 = int(_4188) + 1;
    uint _4198 = uint(int(uint(_4196) >> uint(2)));
    int _4200 = _4196 & 3;
    float _4202 = (*spvDescriptorSet0.vp_c9)._m0[int(_4198)][_4200];
    float _4204 = fma(_1453, _1254, _4068);
    float _4206 = fma(_1453, _1270, _4078);
    float _4208 = fma(_1525, _1254, _4140);
    float _4210 = fma(_1521, _1254, _4138);
    int _4212 = abs(_2992);
    float _4214 = fma(_1525, _1270, _4166);
    int _4216 = ~_4164;
    int _4218 = _4216 + 1;
    int _4220 = _4218 + 1;
    int _4222 = _4034 + 8;
    uint _4224 = uint(int(uint(_4222) >> uint(2)));
    uint _4226 = uint(int(uint(int(_4224)) >> uint(2)));
    int _4228 = int(_4224) & 3;
    float _4230 = (*spvDescriptorSet0.vp_c9)._m0[int(_4226)][_4228];
    int _4232 = int(_4224) + 1;
    uint _4234 = uint(int(uint(_4232) >> uint(2)));
    int _4236 = _4232 & 3;
    float _4238 = (*spvDescriptorSet0.vp_c9)._m0[int(_4234)][_4236];
    int _4240 = abs(_3500);
    float _4242 = fma(_1521, _1280, _4104);
    int _4244 = abs(_3810);
    float _4246 = fma(_1521, _1270, _4106);
    int _4248 = ~_4212;
    int _4250 = _4248 + 1;
    int _4252 = _4250 + 1;
    int _4254 = ~_4240;
    int _4256 = _4254 + 1;
    int _4258 = _4256 + 1;
    int _4260 = _4172 * as_type<int>(_4060);
    int _4262 = abs(_3276);
    int _4264 = ~_4244;
    int _4266 = _4264 + 1;
    int _4268 = _4266 + 1;
    int _4270 = ~_4262;
    int _4272 = _4270 + 1;
    int _4274 = _4272 + 1;
    int _4276 = abs(_3364);
    int _4278 = _4182 * as_type<int>(_4094);
    bool _4280 = !_2604;
    int _4282 = _4280 ? _4110 : (-1);
    float _4284 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4286 = int(_4284);
    int _4288 = _4268 * as_type<int>(_4052);
    int _4290 = _4288 + _4260;
    int _4292 = abs(_3462);
    int _4294 = _4274 * as_type<int>(_4086);
    int _4296 = _4294 + _4278;
    int _4298 = abs(_3434);
    float _4300 = _3994 * _4204;
    int _4302 = _4220 * as_type<int>(_4128);
    int _4304 = ~_4292;
    int _4306 = _4304 + 1;
    int _4308 = _4306 + 1;
    float _4310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4312 = int(_4310);
    int _4314 = ~_4298;
    int _4316 = _4314 + 1;
    int _4318 = _4316 + 1;
    int _4320 = _4258 * as_type<int>(_4120);
    int _4322 = _4320 + _4302;
    int _4324 = abs(_3412);
    float _4326 = _4206 * _3856;
    int _4328 = _4252 * as_type<int>(_4154);
    int _4330 = _4328 + _4296;
    int _4332 = abs(_3588);
    float _4334 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4336 = int(_4334);
    int _4338 = ~_4324;
    int _4340 = _4338 + 1;
    int _4342 = _4340 + 1;
    int _4344 = ~_4332;
    int _4346 = _4344 + 1;
    int _4348 = _4346 + 1;
    float _4350 = float(uint(_4286));
    int _4352 = _4318 * as_type<int>(_4194);
    int _4354 = _4352 + _4322;
    int _4356 = abs(_3602);
    int _4358 = _4342 * as_type<int>(_4162);
    int _4360 = _4358 + _4330;
    float _4362 = float(uint(_4312));
    int _4364 = ~_4356;
    int _4366 = _4364 + 1;
    int _4368 = _4366 + 1;
    float _4370 = 1.0 / _4350;
    int _4372 = abs(_4286);
    int _4374 = _4348 * as_type<int>(_4230);
    int _4376 = _4374 + _4290;
    int _4378 = ~_4312;
    int _4380 = _4378 + 1;
    int _4382 = _4308 * as_type<int>(_4202);
    int _4384 = _4382 + _4354;
    int _4386 = ~_4276;
    int _4388 = _4386 + 1;
    int _4390 = _4388 + 1;
    int _4392 = _4368 * as_type<int>(_4238);
    int _4394 = _4392 + _4376;
    bool _4396 = !_3482;
    int _4398 = _4396 ? 0 : 1;
    float _4400 = 1.0 / _4362;
    int _4402 = abs(_4312);
    int _4404 = _4360 * _4390;
    bool _4406 = !_3490;
    int _4408 = _4406 ? 0 : 1;
    int _4410 = abs(_4398);
    float _4412 = float(uint(_4336));
    bool _4414 = !_2234;
    int _4416 = _4414 ? _3926 : (-1);
    float _4418 = 1.0 / _4412;
    int _4420 = abs(_4408);
    int _4422 = ~_4410;
    int _4424 = _4422 + 1;
    int _4426 = _4424 + 1;
    int _4428 = _4416 * _4276;
    int _4430 = _4428 + _4404;
    float _4432 = float(uint(_4372));
    int _4434 = ~_4420;
    int _4436 = _4434 + 1;
    int _4438 = _4436 + 1;
    int _4440 = _4426 * _4384;
    float _4442 = 1.0 / _4432;
    int _4444 = abs(_4336);
    bool _4446 = !_2740;
    int _4448 = _4446 ? _4176 : (-1);
    int _4450 = _4438 * _4394;
    int _4452 = as_type<int>(_4370) + (-2);
    int _4454 = _4282 * _4410;
    int _4456 = _4454 + _4440;
    float _4458 = float(uint(_4430));
    int _4460 = _4448 * _4420;
    int _4462 = _4460 + _4450;
    float _4464 = float(uint(_4402));
    float _4466 = _4144 * _3856;
    float _4468 = float(uint(_4444));
    float _4470 = as_type<float>(_4452) * _4458;
    float _4472 = 1.0 / _4464;
    int _4474 = as_type<int>(_4400) + (-2);
    float _4476 = _4144 * _3950;
    float _4478 = float(uint(_4456));
    float _4480 = float(uint(_4462));
    int _4482 = abs(_4430);
    float _4484 = 1.0 / _4468;
    float _4486 = as_type<float>(_4474) * _4478;
    int _4488 = as_type<int>(_4442) + (-2);
    float _4490 = float(uint(_4482));
    int _4492 = ~_4286;
    int _4494 = _4492 + 1;
    float _4496 = trunc(_4470);
    float _4498 = precise::max(_4496, 0.0);
    uint _4500 = uint(_4498);
    int _4502 = as_type<int>(_4418) + (-2);
    int _4504 = as_type<int>(_4472) + (-2);
    int _4506 = ~_4336;
    int _4508 = _4506 + 1;
    float _4510 = as_type<float>(_4502) * _4480;
    float _4512 = as_type<float>(_4488) * _4490;
    float _4514 = trunc(_4486);
    float _4516 = precise::max(_4514, 0.0);
    uint _4518 = uint(_4516);
    int _4520 = abs(_4462);
    int _4522 = as_type<int>(_4484) + (-2);
    float _4524 = _4204 * _3856;
    float _4526 = float(uint(_4520));
    float _4528 = _4204 * _3950;
    float _4530 = _4206 * _3950;
    float _4532 = trunc(_4510);
    float _4534 = precise::max(_4532, 0.0);
    uint _4536 = uint(_4534);
    int _4538 = abs(_4456);
    int _4540 = _4494 * int(_4500);
    int _4542 = _4540 + _4430;
    float _4544 = as_type<float>(_4522) * _4526;
    float _4546 = _3994 * _4144;
    float _4548 = float(uint(_4538));
    float _4550 = _3994 * _4206;
    float _4552 = float(uint(_4542));
    int _4554 = _4380 * int(_4518);
    int _4556 = _4554 + _4456;
    float _4558 = trunc(_4512);
    float _4560 = precise::max(_4558, 0.0);
    uint _4562 = uint(_4560);
    float _4564 = as_type<float>(_4504) * _4548;
    float _4566 = fma(_4208, _3854, _4524);
    float _4568 = as_type<float>(_4452) * _4552;
    float _4570 = float(uint(_4556));
    float _4572 = fma(_4184, _3854, _4466);
    int _4574 = ~_4372;
    int _4576 = _4574 + 1;
    int _4578 = _4508 * int(_4536);
    int _4580 = _4578 + _4462;
    float _4582 = trunc(_4564);
    float _4584 = precise::max(_4582, 0.0);
    uint _4586 = uint(_4584);
    float _4588 = as_type<float>(_4474) * _4570;
    float _4590 = fma(_4214, _3854, _4326);
    float _4592 = fma(_4214, _3958, _4530);
    float _4594 = float(uint(_4580));
    float _4596 = fma(_3992, _4214, _4550);
    int _4598 = ~_4402;
    int _4600 = _4598 + 1;
    float _4602 = trunc(_4544);
    float _4604 = precise::max(_4602, 0.0);
    uint _4606 = uint(_4604);
    int _4608 = ~_4444;
    int _4610 = _4608 + 1;
    float _4612 = as_type<float>(_4502) * _4594;
    float _4614 = fma(_4208, _3958, _4528);
    int _4616 = _4576 * int(_4562);
    int _4618 = _4616 + _4482;
    float _4620 = fma(_3992, _4208, _4300);
    float _4622 = fma(_4210, _3972, _4614);
    float _4624 = trunc(_4568);
    float _4626 = precise::max(_4624, 0.0);
    uint _4628 = uint(_4626);
    int _4630 = _4600 * int(_4586);
    int _4632 = _4630 + _4538;
    float _4634 = fma(_4184, _3958, _4476);
    float _4636 = fma(_3992, _4184, _4546);
    float _4638 = float(uint(_4618));
    float _4640 = float(uint(_4632));
    float _4642 = trunc(_4588);
    float _4644 = precise::max(_4642, 0.0);
    uint _4646 = uint(_4644);
    int _4648 = _4610 * int(_4606);
    int _4650 = _4648 + _4520;
    float _4652 = as_type<float>(_4488) * _4638;
    float _4654 = as_type<float>(_4504) * _4640;
    int _4656 = ~_4312;
    int _4658 = _4656 + 1;
    int _4660 = int(_4500) + int(_4628);
    float _4662 = trunc(_4652);
    float _4664 = precise::max(_4662, 0.0);
    uint _4666 = uint(_4664);
    float _4668 = float(uint(_4650));
    int _4670 = ~_4286;
    int _4672 = _4670 + 1;
    float _4674 = as_type<float>(_4522) * _4668;
    int _4676 = int(_4518) + int(_4646);
    float _4678 = trunc(_4612);
    float _4680 = precise::max(_4678, 0.0);
    uint _4682 = uint(_4680);
    float _4684 = fma(_4210, _3858, _4566);
    float _4686 = fma(_4242, _3858, _4572);
    float _4688 = fma(_4246, _3858, _4590);
    int _4690 = _4658 * _4676;
    int _4692 = _4690 + _4456;
    int _4694 = ~_4444;
    int _4696 = _4694 + 1;
    int _4698 = _4672 * _4660;
    int _4700 = _4698 + _4430;
    float _4702 = trunc(_4654);
    float _4704 = precise::max(_4702, 0.0);
    uint _4706 = uint(_4704);
    int _4708 = int(_4562) + int(_4666);
    out.m_85.x = _4684;
    out.m_85.y = _4686;
    out.m_85.z = _4688;
    bool _4710 = uint(_4692) >= uint(_4312);
    bool _4712 = uint(_4700) >= uint(_4286);
    int _4714 = ~_4402;
    int _4716 = _4714 + 1;
    float _4718 = trunc(_4674);
    float _4720 = precise::max(_4718, 0.0);
    uint _4722 = uint(_4720);
    int _4724 = int(_4536) + int(_4682);
    int _4726 = ~_4336;
    int _4728 = _4726 + 1;
    bool _4730 = _1318 <= 8000.0;
    bool _4732 = isnan(_1318);
    bool _4734 = _4730 || _4732;
    bool _4736 = isnan(8000.0);
    bool _4738 = _4734 || _4736;
    float _4740 = float(_4738);
    int _4742 = int(_4586) + int(_4706);
    int _4744 = ~_4372;
    int _4746 = _4744 + 1;
    int _4748 = _4746 * _4708;
    int _4750 = _4748 + _4482;
    int _4752 = int(_4606) + int(_4722);
    int _4754 = _4716 * _4742;
    int _4756 = _4754 + _4538;
    int _4758 = _4728 * _4724;
    int _4760 = _4758 + _4462;
    bool _4762 = uint(_4750) >= uint(_4372);
    float _4764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4766 = !_4712;
    int _4768 = _4766 ? 0 : (-1);
    int _4770 = _4696 * _4752;
    int _4772 = _4770 + _4520;
    bool _4774 = uint(_4756) >= uint(_4402);
    bool _4776 = uint(_4760) >= uint(_4336);
    bool _4778 = !_4710;
    int _4780 = _4778 ? 0 : (-1);
    float _4782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4784 = ~_4660;
    int _4786 = _4784 + _4768;
    int _4788 = _4786 + 1;
    int _4790 = ~_4676;
    int _4792 = _4790 + _4780;
    int _4794 = _4792 + 1;
    bool _4796 = !_4776;
    int _4798 = _4796 ? 0 : (-1);
    bool _4800 = _4286 == 0;
    bool _4802 = _4286 == 0;
    int _4804 = _4430 ^ _4286;
    int _4806 = _4286 * _4788;
    int _4808 = _4806 + _4430;
    bool _4810 = !_4762;
    int _4812 = _4810 ? 0 : (-1);
    float _4814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4816 = !_4774;
    int _4818 = _4816 ? 0 : (-1);
    bool _4820 = uint(_4772) >= uint(_4444);
    bool _4822 = _4312 == 0;
    bool _4824 = _4312 == 0;
    float _4826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4828 = _4456 ^ _4312;
    int _4830 = _4312 * _4794;
    int _4832 = _4830 + _4456;
    int _4834 = ~_4724;
    int _4836 = _4834 + _4798;
    int _4838 = _4836 + 1;
    bool _4840 = !_4800;
    int _4842 = _4840 ? _4808 : (-1);
    bool _4844 = !_4822;
    int _4846 = _4844 ? _4832 : (-1);
    float _4848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4850 = ~_4812;
    int _4852 = _4708 + _4850;
    int _4854 = _4852 + 1;
    int _4856 = _4336 * _4838;
    int _4858 = _4856 + _4462;
    bool _4860 = _4336 == 0;
    float _4862 = _4814 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _4864 = _4336 == 0;
    int _4866 = _4462 ^ _4336;
    float _4868 = _4764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4870 = float(_4842);
    float _4872 = _4826 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _4874 = uint(int(uint(_4804) >> uint(31)));
    float _4876 = fma(_4868, _2394, -0.5);
    uint _4878 = uint(int(uint(_4828) >> uint(31)));
    float _4880 = fma(_4868, _4870, _784);
    bool _4882 = !_4860;
    int _4884 = _4882 ? _4858 : (-1);
    float _4886 = _4848 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4888 = ~int(_4874);
    int _4890 = _4888 + 1;
    float _4892 = fma(_4872, _2462, -0.5);
    float _4894 = float(_4846);
    float _4896 = fma(_4886, _2504, -0.5);
    float _4898 = float(_4884);
    float _4900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4902 = ~_4818;
    int _4904 = _4742 + _4902;
    int _4906 = _4904 + 1;
    float _4908 = fma(_4872, _4894, _1032);
    int _4910 = ~int(_4878);
    int _4912 = _4910 + 1;
    float _4914 = fma(_4886, _4898, _874);
    int _4916 = _4854 ^ _4890;
    float _4918 = _4782 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4920 = _4906 ^ _4912;
    float _4922 = fma(_1186, _4892, _4908);
    int _4924 = ~_4890;
    int _4926 = _4924 + _4916;
    int _4928 = _4926 + 1;
    float _4930 = fma(_2840, _4862, -0.5);
    int _4932 = ~_4912;
    int _4934 = _4932 + _4920;
    int _4936 = _4934 + 1;
    float _4938 = fma(_1112, _4876, _4880);
    bool _4940 = !_4802;
    int _4942 = _4940 ? _4928 : (-1);
    float _4944 = fma(_1206, _4896, _4914);
    bool _4946 = !_4824;
    int _4948 = _4946 ? _4936 : (-1);
    float _4950 = _4900 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4952 = float(_4942);
    float _4954 = _4944 + 0.5;
    bool _4956 = !_4820;
    int _4958 = _4956 ? 0 : (-1);
    float _4960 = fma(_4950, _2880, -0.5);
    uint _4962 = uint(int(uint(_4866) >> uint(31)));
    float _4964 = -_788;
    float _4966 = fma(_4918, _4952, _4964);
    float _4968 = float(_4948);
    float _4970 = fma(_2632, _4918, -0.5);
    int _4972 = ~_4958;
    int _4974 = _4752 + _4972;
    int _4976 = _4974 + 1;
    float _4978 = fma(_3996, _4210, _4620);
    int _4980 = ~int(_4962);
    int _4982 = _4980 + 1;
    float _4984 = fma(_1124, _4970, _4966);
    float _4986 = fma(_3996, _4242, _4636);
    float _4988 = fma(_3996, _4246, _4596);
    int _4990 = _4976 ^ _4982;
    float _4992 = -_4112;
    float _4994 = _4992 + 1.0;
    float _4996 = -_1212;
    float _4998 = fma(_4862, _4968, _4996);
    float _5000 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _5002 = ~_4982;
    int _5004 = _5002 + _4990;
    int _5006 = _5004 + 1;
    float _5008 = fma(_4994, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4112);
    out.m_87.x = _4978;
    out.m_87.y = _4986;
    out.m_87.z = _4988;
    float _5010 = _5000 * _2101;
    bool _5012 = !_4864;
    int _5014 = _5012 ? _5006 : (-1);
    float _5016 = _4740 * _5008;
    float _5018 = _4740;
    if (!_1985)
    {
        _5018 = 1.0;
    }
    float _5020 = _5018;
    float _5022 = fma(_1210, _4930, _4998);
    float _5024 = float(_5014);
    float _5026 = _3376 * _5010;
    float _5028 = _5020;
    if (_1985)
    {
        bool _5030 = _2099 >= _2053;
        bool _5032 = isnan(_2099);
        bool _5034 = _5030 || _5032;
        bool _5036 = isnan(_2053);
        bool _5038 = _5034 || _5036;
        float _5040 = float(_5038);
        _5028 = _5040;
    }
    float _5042 = _5028;
    float _5044 = _5022 + 0.5;
    float _5046 = fma(_4246, _3972, _4592);
    float _5048 = -_1214;
    float _5050 = fma(_4950, _5024, _5048);
    float _5052 = _5016 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5054 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3440);
    float _5056 = _5042 * _3094;
    float _5058 = fma(_1208, _4960, _5050);
    float _5060 = _3426 * _5052;
    float _5062 = precise::clamp(_5060, 0.0, 1.0);
    float _5064 = _5054 + _2007;
    out.gl_Position.x = _2027;
    out.gl_Position.y = _2031;
    out.gl_Position.z = _5054;
    out.gl_Position.w = _2007;
    float _5066 = _4938 + 0.5;
    float _5068 = -_5062;
    float _5070 = fma(_5068, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5072 = _4922 + 0.5;
    float _5074 = _4984 + 0.5;
    float _5076 = _5058 + 0.5;
    float _5078 = -_5056;
    float _5080 = fma(_5078, _5070, 1.0);
    float _5082 = precise::clamp(_5080, 0.0, 1.0);
    float _5084 = fma(_4242, _3972, _4634);
    float _5086 = _5064 * 0.5;
    float _5088 = _5082 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5090 = fma(_2112, _5026, _2110);
    out.m_89.x = _5066;
    out.m_89.y = _5074;
    out.m_89.z = _5072;
    out.m_89.w = _5044;
    bool _5092 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5094 = isnan(_3124);
    bool _5096 = _5092 || _5094;
    bool _5098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5100 = _5096 || _5098;
    float _5102 = _2112 * _5010;
    float _5104 = -_5000;
    float _5106 = _5104 + 1.0;
    out.m_91.x = _4954;
    out.m_91.y = _5076;
    float _5108 = fma(_3372, _5102, _2106);
    float _5110 = fma(_3374, _5102, _2108);
    float _5112 = _2112 * _5106;
    out.m_93.z = _5086;
    out.m_93.w = _2007;
    out.m_95.x = _5088;
    float _5114 = _5054;
    float _5116 = _5102;
    float _5118 = _5106;
    if (!_5100)
    {
        _5114 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5120 = _5114;
    float _5122 = _5120;
    float _5124 = _5120;
    if (!_5100)
    {
        _5116 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5126 = _5116;
    out.m_97.x = _5108;
    out.m_97.y = _5110;
    out.m_97.z = _5090;
    out.m_97.w = _5112;
    float _5128 = _5126;
    float _5130 = _5126;
    if (!_5100)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5132 = _5118;
    out.m_99.x = _4622;
    out.m_99.y = _5084;
    out.m_99.z = _5046;
    bool _5134 = !_5100;
    float _5136 = _5132;
    float _5138 = _5132;
    if (!_5134)
    {
        bool _5140 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5142 = isnan(_3124);
        bool _5144 = _5140 || _5142;
        bool _5146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5148 = _5144 || _5146;
        if (!_5148)
        {
            float _5150 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5152 = _3124 + _5150;
            float _5154 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5156 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5154;
            float _5158 = 1.0 / _5156;
            float _5160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5162 = _5160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5164 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5166 = _5164 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5168 = _5152 * _5158;
            float _5170 = precise::clamp(_5168, 0.0, 1.0);
            float _5172 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5174 = _5172 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5176 = fma(_5170, _5166, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5178 = fma(_5170, _5174, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5180 = fma(_5170, _5162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _5130 = _5180;
            _5124 = _5178;
            _5138 = _5176;
            _5182 = true;
        }
        else
        {
            bool _5184 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5186 = isnan(_3124);
            bool _5188 = _5184 || _5186;
            bool _5190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5192 = _5188 || _5190;
            if (!_5192)
            {
                _5122 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5194 = _5122;
            _5124 = _5194;
            if (!_5192)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5196 = _5128;
            _5130 = _5196;
            if (!_5192)
            {
                _5136 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5198 = _5136;
            bool _5200 = !_5192;
            _5138 = _5198;
            if (!_5200)
            {
                bool _5202 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5204 = isnan(_3124);
                bool _5206 = _5202 || _5204;
                bool _5208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5210 = _5206 || _5208;
                if (!_5210)
                {
                    float _5212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5214 = _3124 + _5212;
                    float _5216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5216;
                    float _5220 = 1.0 / _5218;
                    float _5222 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5224 = _5222 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5228 = _5226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5230 = _5214 * _5220;
                    float _5232 = precise::clamp(_5230, 0.0, 1.0);
                    float _5234 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5236 = _5234 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5238 = fma(_5232, _5228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5240 = fma(_5232, _5236, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5242 = fma(_5232, _5224, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _5130 = _5242;
                    _5124 = _5240;
                    _5138 = _5238;
                    _5182 = true;
                }
                else
                {
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5124 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5138 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5182 = false;
    float _5244 = _5130;
    float _5246 = _5124;
    float _5248 = _5138;
    float _5250 = _5244 * 0.586610972881317138671875;
    bool _5252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = 1.0;
    float _5254 = fma(_5246, 0.298911988735198974609375, _5250);
    out.m_101.x = 0.0;
    float _5256 = fma(_5248, 0.114477999508380889892578125, _5254);
    float _5258 = -_5256;
    float _5260 = _5258 + _5246;
    float _5262 = -_5256;
    float _5264 = _5262 + _5244;
    float _5266 = -_5256;
    float _5268 = _5266 + _5248;
    float _5270 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5272 = fma(_5260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    float _5274 = fma(_5264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    float _5276 = fma(_5268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    out.m_95.w = _5270;
    out.m_103.x = _5272;
    out.m_103.y = _5274;
    out.m_103.z = _5276;
    if (!_5252)
    {
        return out;
    }
    float _5278 = -_1901;
    float _5280 = _5278 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5282 = -_1903;
    float _5284 = _5282 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5286 = -_1905;
    float _5288 = _5286 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5290 = _5280 * _5280;
    float _5292 = fma(_5284, _5284, _5290);
    float _5294 = fma(_5288, _5288, _5292);
    float _5296 = sqrt(_5294);
    float _5298 = rsqrt(_5294);
    float _5300 = -_5296;
    float _5302 = _5300 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5304 = _5302 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5306 = precise::clamp(_5304, 0.0, 1.0);
    float _5308 = _5284 * _5298;
    float _5310 = _5280 * _5298;
    float _5312 = abs(_5306);
    float _5314 = log2(_5312);
    float _5316 = _5288 * _5298;
    float _5318 = _5308 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5320 = _5084 * _5310;
    float _5322 = -_5310;
    float _5324 = -_5318;
    float _5326 = fma(_5322, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5324);
    float _5328 = fma(_4622, _5308, _5320);
    float _5330 = -_5316;
    float _5332 = fma(_5330, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5326);
    float _5334 = fma(_5046, _5316, _5328);
    float _5336 = precise::clamp(_5334, 0.0, 1.0);
    float _5338 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5340 = _5332 + _5338;
    float _5342 = _5314 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5344 = _5340 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5346 = precise::clamp(_5344, 0.0, 1.0);
    float _5348 = exp2(_5342);
    float _5350 = _5348 * _5346;
    float _5352 = _5336 * _5350;
    float _5354 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5356 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5358 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5354;
    out.m_101.y = _5356;
    out.m_101.z = _5358;
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
    bool _5182 = false;
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
        float _5414 = as_type<float>(_138);
        out.gl_Position.z = _5414;
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
        float _5484 = as_type<float>(_176);
        out.gl_Position.z = _5484;
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
    float2 _6337 = float2(_654, _658);
    float _660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6337, float2(0.0), isnan(_6337)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6337, float2(0.0), isnan(_6337)), level(0.0)).x;
    float _662 = in.m_63.x;
    float _664 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _666 = in.m_63.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _670 = _668 != 0;
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    float _676 = in.m_69.x;
    float _678 = in.m_69.y;
    float _680 = in.m_69.z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _684 = -_640;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _688 = in.m_63.z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _694 = int(_692);
    float _696 = -_642;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _700 = float(_122);
    float _702 = _662 * 2.0;
    float _704 = _662 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = fma(_622, (*spvDescriptorSet0.vp_c10)._m0[5].x, _664);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _710 = floor(_702);
    float _712 = _666 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _714 = -_690;
    float _716 = fma(_704, 2.0, _714);
    float _718 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].z, _706);
    float _720 = _586 * _676;
    float _722 = fma(_712, -2.0, _682);
    float _724 = _590 * _680;
    float _726 = _666 * 2.0;
    float _728 = _688 * 2.0;
    float _730 = _662 + _666;
    float _732 = _666 + _688;
    float _734 = _588 * _678;
    float _736 = _730 + (-1.0);
    int _738 = as_type<int>(_730);
    float _740 = _666;
    float _742 = _662;
    float _744 = _642;
    if (_670)
    {
        _738 = 0;
    }
    int _746 = _738;
    float _748 = floor(_728);
    int _750 = _746;
    if (!_670)
    {
        _750 = 2;
    }
    int _752 = _750;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _756 = _710 > 0.0;
    float _758 = _732 + (-1.0);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _762 = _752 != 2;
    float _764 = floor(_726);
    bool _766 = _710 >= 0.0;
    bool _768 = isnan(_710);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _778 = _752;
    if (_670)
    {
        _778 = 0;
    }
    int _780 = _778;
    float _782 = -_154;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[76].x, _716);
    int _786 = _774 ? 0 : 1;
    float _788 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _722);
    int _790 = _780;
    if (!_670)
    {
        _790 = 1;
    }
    int _792 = _790;
    float _794 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _796 = int(_794);
    int _798 = ~_786;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    float _804 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _806 = _802;
    float _808 = as_type<float>(_792);
    if (!_756)
    {
        int _810 = ~_786;
        int _812 = _810 + 1;
        _806 = _812;
    }
    int _814 = _806;
    bool _816 = _792 != 1;
    if (_762)
    {
        _808 = _662;
    }
    float _818 = _808;
    float _820 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _822 = int(_820);
    bool _824 = _748 > 0.0;
    float _826 = _818;
    if (!_762)
    {
        _826 = _688;
    }
    float _828 = _826;
    bool _830 = _764 > 0.0;
    bool _832 = _748 >= 0.0;
    bool _834 = isnan(_748);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = _828 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _844 = _764 >= 0.0;
    bool _846 = isnan(_764);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = 1.0 / _700;
    float _856 = _840 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _858 = -_708;
    float _860 = fma(_842, 2.0, _858);
    int _862 = _852 ? 0 : 1;
    float _864 = _842;
    float _866 = _856;
    float _868 = _828;
    if (!_816)
    {
        _864 = _666;
    }
    float _870 = _864;
    float _872 = -_154;
    float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[86].x, _860);
    int _876 = ~as_type<int>(_856);
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    float _882 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _884 = int(_882);
    int _886 = ~_862;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    int _892 = _880;
    int _894 = _890;
    float _896 = _870;
    if (!_824)
    {
        int _898 = ~as_type<int>(_856);
        int _900 = _898 + 1;
        _892 = _900;
    }
    int _902 = _892;
    if (!_830)
    {
        int _904 = ~_862;
        int _906 = _904 + 1;
        _894 = _906;
    }
    int _908 = _894;
    if (!_816)
    {
        _866 = _870;
    }
    float _910 = _866;
    float _912 = _854 * _154;
    float _914 = _910;
    if (_816)
    {
        _914 = _662;
    }
    float _916 = _914;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _928 = _926 != 0;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_816)
    {
        _868 = _688;
    }
    float _932 = _868;
    float _934 = _916 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _936 = _932;
    if (_816)
    {
        _936 = _666;
    }
    float _938 = _936;
    float _940 = -_930;
    float _942 = fma(_934, 2.0, _940);
    float _944 = _718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _946 = !_924;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].w, _760);
    bool _952 = !_920;
    int _954 = _952 ? 0 : 1;
    float _956 = _944 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _960 = _958 != 0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _964 = _962 != 0;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_816)
    {
        _896 = _662;
    }
    float _968 = _896;
    float _970 = _944 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _972 = !_928;
    int _974 = _972 ? 0 : 1;
    float _976 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[11].x, _956);
    bool _978 = !_964;
    int _980 = _978 ? 0 : 1;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[83].z, _966);
    bool _984 = !_960;
    int _986 = _984 ? 0 : 1;
    float _988 = in.m_71.x;
    float _990 = in.m_71.y;
    float _992 = in.m_71.z;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1004 = _1002 != 0;
    float _1006 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[10].x, _970);
    float _1008 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[11].z, _976);
    float _1010 = float(_902);
    float _1012 = -_944;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1016 = !_996;
    float _1018 = _1016 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1020 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1006);
    float _1022 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1024 = _1006;
    float _1026 = _1018;
    if (!_816)
    {
        _1024 = _688;
    }
    float _1028 = _1024;
    float _1030 = -_154;
    float _1032 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[81].x, _942);
    int _1034 = abs(as_type<int>(_1018));
    float _1036 = _1020 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1038 = _1028;
    if (_816)
    {
        _1038 = _666;
    }
    float _1040 = _1038;
    float _1042 = 1.0 / _1022;
    float _1044 = float(_1034);
    float _1046 = _1036 + _1022;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_762)
    {
        _1026 = _666;
    }
    float _1050 = _1026;
    float _1052 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1054 = _1044 * _1010;
    float _1056 = _1050;
    if (!_762)
    {
        _1056 = _662;
    }
    float _1058 = _1056;
    float _1060 = fma(_1052, -2.0, _1048);
    float _1062 = float(_796);
    float _1064 = _1054 * (-2.0);
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1070 = 1.0 / _1062;
    float _1072 = fma(_1064, _988, _988);
    float _1074 = fma(_1068, -2.0, _1066);
    float _1076 = _674 * _154;
    float _1078 = float(_884);
    float _1080 = _1046 * _1042;
    float _1082 = _1080 * 0.5;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1086 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1088 = 1.0 / _1078;
    float _1090 = fma(_754, _1064, _754);
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1094 = _944 + _1086;
    float _1096 = float(_822);
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1100 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1092);
    float _1102 = exp2(_1076);
    float _1104 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1084);
    float _1106 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1110 = 1.0 + _1108;
    float _1112 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1114 = _1014 * _1014;
    float _1116 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1098);
    float _1118 = 1.0 / _1096;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1122 = fma(_686, _686, _1114);
    float _1124 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1116);
    bool _1126 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1128 = isnan(1.0);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1134 = _1130 || _1132;
    float _1136 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1120);
    float _1138 = fma(_698, _698, _1122);
    bool _1140 = !_1004;
    int _1142 = _1140 ? 0 : 1;
    float _1144 = 1.0 / _1110;
    float _1146 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1106);
    bool _1148 = !_1000;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1154 = -_1102;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1146);
    float _1160 = float(_814);
    float _1162 = fma(_640, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1152);
    int _1164 = abs(_1150);
    float _1166 = rsqrt(_1138);
    bool _1168 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1170 = isnan(0.0);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1176 = _1172 || _1174;
    float _1178 = _662 + (-0.5);
    int _1180 = abs(_1142);
    float _1182 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1162);
    float _1184 = float(_1164);
    float _1186 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _982);
    float _1188 = float(_694);
    float _1190 = _1070 * _154;
    float _1192 = _1176 ? _1156 : 0.0;
    float _1194 = _1184 * _1160;
    float _1196 = float(_908);
    float _1198 = _1188 * _154;
    float _1200 = float(_1180);
    float _1202 = _1088 * _154;
    float _1204 = _1118 * _154;
    float _1206 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1100);
    float _1208 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1136);
    float _1210 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    float _1212 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1214 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1074);
    float _1216 = _1202;
    float _1218 = _1094;
    if (_1134)
    {
        float _1220 = _1192 * _1144;
        _156 = _1220;
    }
    float _1222 = _156;
    float _1224 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1072);
    float _1226 = _1182 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1228 = _1200 * _1196;
    float _1230 = _1194 * (-2.0);
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1234 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1232);
    float _1236 = fma(_1090, _1222, _1224);
    float _1238 = _662 + _688;
    float _1240 = _1228 * (-2.0);
    float _1242 = _666 + (-0.5);
    float _1244 = fma(_1230, _990, _990);
    float _1246 = _1238 + (-1.0);
    float _1248 = fma(_776, _1230, _776);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1244);
    float _1252 = 1.0 / _1234;
    float _1254 = _686 * _1166;
    float _1256 = in.m_73.x;
    float _1258 = in.m_73.y;
    float _1260 = in.m_73.z;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1264 = fma(_1240, _992, _992);
    float _1266 = _688 + (-0.5);
    float _1268 = fma(_1248, _1222, _1250);
    float _1270 = _698 * _1166;
    float _1272 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1274 = _1254 * _1272;
    float _1276 = fma(_1262, _1240, _1262);
    float _1278 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1264);
    float _1280 = _1014 * _1166;
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = _1270 * _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1288 = -_1274;
    float _1290 = fma(_1270, _1286, _1288);
    float _1292 = _1236 * 0.15915493667125701904296875;
    float _1294 = _1268 * 0.15915493667125701904296875;
    float _1296 = fma(_1276, _1222, _1278);
    float _1298 = _1158 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1302 = _1280 * _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1306 = -_1284;
    float _1308 = fma(_1280, _1304, _1306);
    float _1310 = _1290 * _1290;
    float _1312 = _1292 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1318 = _1252 * _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1322 = -_1302;
    float _1324 = fma(_1254, _1320, _1322);
    float _1326 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1328 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1330 = _1318 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1332 = _1292 * 6.283185482025146484375;
    float _1334 = cos(_1332);
    bool _1336 = _1318 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1258);
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1256);
    float _1342 = _1340 * _1328;
    float _1344 = trunc(_1298);
    int _1346 = int(_1344);
    float _1348 = _1296 * 0.15915493667125701904296875;
    float _1350 = fma(_1308, _1308, _1310);
    float _1352 = _1338 * _1326;
    bool _1354 = !_1330;
    int _1356 = _1354 ? 0 : 1;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1260);
    float _1360 = fma(_1324, _1324, _1350);
    int _1362 = 2;
    float _1364 = _1226;
    if (!_1330)
    {
        _1362 = 1;
    }
    int _1366 = _1362;
    float _1368 = trunc(_1226);
    int _1370 = int(_1368);
    int _1372 = _1366;
    if (!_1336)
    {
        _1372 = _1356;
    }
    int _1374 = _1372;
    float _1376 = _1358 * _804;
    int _1378 = _1374 << 6;
    float _1380 = _1294 * 6.283185482025146484375;
    float _1382 = sin(_1380);
    int _1384 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1386 = _1346 + _1384;
    int _1388 = _1386 + 1;
    int _1390 = _1378 + 104;
    uint _1393 = uint(int(uint(_1390) >> uint(2)));
    uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
    int _1397 = int(_1393) & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    int _1401 = int(_1393) + 1;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    int _1405 = _1401 & 3;
    float _1407 = (*spvDescriptorSet0.vp_c15)._m0[int(_1403)][_1405];
    bool _1409 = _1388 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1411 = _1294 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    int _1415 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1417 = _1370 + _1415;
    int _1419 = _1417 + 1;
    int _1421 = _1388 | _1419;
    float _1423 = _1348 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = _1314 * _1382;
    bool _1429 = _1421 < 0;
    bool _1431 = _1429 || _1409;
    float _1433 = _1334 * _1382;
    bool _1435 = _1419 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1437 = _1435 || _1431;
    float _1439 = rsqrt(_1360);
    float _1441 = _1334 * _1413;
    float _1443 = _1314 * _1413;
    float _1445 = _1348 * 6.283185482025146484375;
    float _1447 = sin(_1445);
    float _1449 = _1334 * _1425;
    float _1451 = _1413 * _1425;
    float _1453 = _1314 * _1425;
    float _1455 = _1382 * _1425;
    float _1457 = _1449 * _1352;
    int _1459 = _1378 + 48;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = _1388;
    int _1479 = _1419;
    if (!_1437)
    {
        int _1481 = _1419 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1483 = _1481 + _1388;
        _1477 = _1483;
    }
    int _1485 = _1477;
    float _1487 = _1308 * _1439;
    float _1489 = _1290 * _1439;
    float _1491 = _1324 * _1439;
    float _1493 = _1280 * _1487;
    float _1495 = _1270 * _1489;
    int _1497 = _1378 + 96;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    if (!_1437)
    {
        int _1515 = _1485 << 2;
        _1479 = _1515;
    }
    int _1517 = _1479;
    float _1519 = fma(_1447, _1441, _1427);
    float _1521 = fma(_1447, _1427, _1441);
    float _1523 = -_1433;
    float _1525 = fma(_1447, _1443, _1523);
    float _1527 = -_1443;
    float _1529 = fma(_1447, _1433, _1527);
    float _1531 = -_1352;
    float _1533 = _1447 * _1531;
    float _1535 = fma(_1519, _1342, _1457);
    int _1537 = _1378 + 64;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    uint _1541 = uint(int(uint(int(_1539)) >> uint(2)));
    int _1543 = int(_1539) & 3;
    float _1545 = (*spvDescriptorSet0.vp_c15)._m0[int(_1541)][_1543];
    int _1547 = int(_1539) + 1;
    uint _1549 = uint(int(uint(_1547) >> uint(2)));
    int _1551 = _1547 & 3;
    float _1553 = (*spvDescriptorSet0.vp_c15)._m0[int(_1549)][_1551];
    float _1555 = _1453 * _1352;
    float _1557 = fma(_1451, _1342, _1533);
    float _1559 = -_1493;
    float _1561 = fma(_1254, _1489, _1559);
    float _1563 = fma(_1529, _1376, _1535);
    float _1565 = fma(_1525, _1342, _1555);
    float _1567 = -_1495;
    float _1569 = fma(_1280, _1491, _1567);
    float _1571 = fma(_1455, _1376, _1557);
    int _1573 = _1378 + 72;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    float _1591 = _1561 * _1563;
    float _1593 = fma(_1521, _1376, _1565);
    float _1595 = _1569 * _1563;
    int _1597 = _1517;
    if (!_1437)
    {
        int _1599 = 12 & _1517;
        _1597 = _1599;
    }
    int _1601 = _1597;
    float _1603 = fma(_1491, _1571, _1591);
    int _1605 = 0;
    if (!_1437)
    {
        uint _1607 = uint(int(uint(_1485) >> uint(2)));
        _1605 = int(_1607);
    }
    int _1609 = _1605;
    float _1611 = fma(_1487, _1571, _1595);
    int _1613 = _1378 + 56;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    uint _1617 = uint(int(uint(int(_1615)) >> uint(2)));
    int _1619 = int(_1615) & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    int _1623 = int(_1615) + 1;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    int _1627 = _1623 & 3;
    float _1629 = (*spvDescriptorSet0.vp_c15)._m0[int(_1625)][_1627];
    float _1631 = fma(_1270, _1593, _1603);
    int _1633 = _1609;
    if (!_1437)
    {
        int _1635 = _1609 << 4;
        int _1637 = _1635 + _1601;
        _1633 = _1637;
    }
    int _1639 = _1633;
    float _1641 = fma(_1254, _1593, _1611);
    float _1643 = _642 + _1631;
    float _1645 = _640 + _1641;
    int _1647 = _1378 + 80;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.vp_c15)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1667 = _1643 + _1665;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1671 = _1645 + _1669;
    float _1673 = _1667 * _1667;
    float _1675 = _1094 * _1475;
    float _1677 = fma(_1671, _1671, _1673);
    float _1679 = _1254 * _1491;
    float _1681 = _1475;
    float _1683 = _1671;
    if (!_1437)
    {
        float _1685 = floor(_1298);
        _1681 = _1685;
    }
    float _1687 = _1681;
    float _1689 = fma(_640, _1467, _1675);
    float _1691 = -_1679;
    float _1693 = fma(_1270, _1487, _1691);
    float _1695 = _1094 * _1513;
    float _1697 = _1693 * _1563;
    float _1699 = sqrt(_1677);
    float _1701 = fma(_640, _1505, _1695);
    float _1703 = fma(_1489, _1571, _1697);
    float _1705 = _1094 * _1553;
    float _1707 = fma(_642, _1399, _1701);
    float _1709 = fma(_1280, _1593, _1703);
    float _1711 = fma(_640, _1545, _1705);
    float _1713 = _1707 + _1407;
    float _1715 = _944 + _1709;
    float _1717 = fma(_642, _1581, _1711);
    bool _1719 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1721 = _1717 + _1589;
    float _1723 = 1.0 / _1713;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1727 = _1725 != 0;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1731 = _1729 != 0;
    float _1733 = fma(_642, _1621, _1689);
    int _1735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1737 = _1735 != 0;
    int _1739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1741 = _1739 != 0;
    float _1743 = _1733 + _1629;
    bool _1745 = !_1731;
    int _1747 = _1745 ? 0 : 1;
    bool _1749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1751 = isnan(0.5);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1757 = _1753 || _1755;
    bool _1759 = !_1727;
    int _1761 = _1759 ? 0 : 1;
    bool _1763 = !_1737;
    int _1765 = _1763 ? 0 : 1;
    bool _1767 = !_1741;
    int _1769 = _1767 ? 0 : 1;
    float _1771 = _1545;
    float _1773 = _1505;
    float _1775 = _1711;
    float _1777 = _1629;
    float _1779 = _1709;
    if (!_1719)
    {
        _1771 = _1645;
    }
    float _1781 = _1771;
    float _1783 = _1781;
    if (!_1719)
    {
        _1773 = _1643;
    }
    float _1785 = _1773;
    float _1787 = _1785;
    if (!_1719)
    {
        _1775 = _1715;
    }
    float _1789 = _1775;
    bool _1791 = !_1719;
    float _1793 = _1789;
    if (!_1791)
    {
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1799 = _1699 + _1797;
        float _1801 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = rsqrt(_1677);
        float _1805 = _1799 * _1795;
        float _1807 = _1805 * 0.15915493667125701904296875;
        float _1809 = _1807 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1807 * 6.283185482025146484375;
        float _1815 = sin(_1813);
        float _1817 = _1811 + (-1.0);
        float _1819 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1821 = fma(_1815, _1801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1823 = fma(_1715, _1811, _1819);
        float _1825 = _1803 * _1821;
        float _1827 = fma(_1671, _1825, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1829 = fma(_1667, _1825, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1787 = _1829;
        _1783 = _1827;
        _1793 = _1823;
        _1777 = _1825;
    }
    float _1831 = _1787;
    float _1833 = _1783;
    float _1835 = _1793;
    float _1837 = _1777;
    float _1839 = _1743 * _1723;
    float _1841 = _1835;
    float _1843 = _1833;
    float _1845 = _1837;
    if (_1757)
    {
        _1683 = _1831;
    }
    float _1847 = _1683;
    float _1849 = _1847;
    if (!_1757)
    {
        float _1851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1853 = _944 + _1851;
        float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1857 = _640 + _1855;
        float _1859 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1861 = -_640;
        float _1863 = _1861 + _1833;
        float _1865 = _1853 * _1853;
        float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1869 = _642 + _1867;
        float _1871 = -_642;
        float _1873 = _1871 + _1831;
        float _1875 = fma(_1857, _1857, _1865);
        float _1877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1879 = fma(_1869, _1869, _1875);
        float _1881 = sqrt(_1879);
        float _1883 = _1859 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1885 = precise::min(_1881, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1887 = _1885 * _1877;
        float _1889 = -_944;
        float _1891 = _1889 + _1835;
        float _1893 = _1883 * _1887;
        float _1895 = fma(_1891, _1893, _944);
        float _1897 = fma(_1863, _1893, _640);
        float _1899 = fma(_1873, _1893, _642);
        _1841 = _1895;
        _1843 = _1897;
        _1849 = _1899;
        _1845 = _1877;
    }
    float _1901 = _1841;
    float _1903 = _1843;
    float _1905 = _1849;
    float _1907 = _1845;
    int _1909 = _1378 + 88;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    uint _1913 = uint(int(uint(int(_1911)) >> uint(2)));
    int _1915 = int(_1911) & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    int _1919 = int(_1911) + 1;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    int _1923 = _1919 & 3;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[int(_1921)][_1923];
    float _1927 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1929 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1931 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1933 = _1839 >= 0.0;
    float _1935 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1927);
    float _1937 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1929);
    float _1939 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1931);
    float _1941 = _1643;
    if (!_1437)
    {
        int _1943 = _1639 + 400;
        uint _1945 = uint(int(uint(_1943) >> uint(2)));
        uint _1947 = uint(int(uint(int(_1945)) >> uint(2)));
        int _1949 = int(_1945) & 3;
        float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
        _1941 = _1951;
    }
    float _1953 = _1941;
    float _1955 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1935);
    float _1957 = _1721 * _1723;
    bool _1959 = _1839 <= 1.0;
    bool _1961 = _1959 && _1933;
    float _1963 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1965 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1937);
    float _1967 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1969 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    bool _1971 = _1957 >= 0.0;
    bool _1973 = _1971 && _1961;
    float _1975 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1963);
    float _1977 = _1965 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1979 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1981 = _1969 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1983 = _1957 <= 1.0;
    bool _1985 = _1983 && _1973;
    float _1987 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1975);
    float _1989 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1979);
    float _1991 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1993 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1995 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1997 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1989);
    float _1999 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2001 = -_1993;
    float _2003 = fma(_2001, _1991, 1.0);
    float _2005 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2007 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1997);
    float _2009 = _1094 * _1663;
    float _2011 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1999);
    if (_1985)
    {
        float _2013 = float(_1374);
        _1779 = _2013;
    }
    float _2015 = _1779;
    float _2017 = log2(_2003);
    float _2019 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2005);
    float _2021 = fma(_640, _1655, _2009);
    float _2023 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2011);
    float _2025 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2027 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2023);
    float _2029 = 1.0 / _2007;
    float _2031 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2025);
    float _2033 = _2025;
    if (!_1437)
    {
        float _2035 = -_1687;
        float _2037 = _1298 + _2035;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = fma(_642, _1917, _2021);
    float _2043 = _1907;
    if (!_1437)
    {
        float _2045 = floor(_1226);
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = _2041 + _1925;
    float _2051 = _2017 * 0.693147182464599609375;
    float _2053 = _2049 * _1723;
    float _2055 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2057 = _2015;
    if (_1985)
    {
        float _2059 = rint(_2015);
        float _2061 = precise::max(_2059, 0.0);
        uint _2063 = uint(_2061);
        uint _2065 = clamp(_2063, 0u, 65535u);
        _2057 = as_type<float>(_2065);
    }
    float _2067 = _2057;
    float _2069 = _2027 * _2029;
    float _2071 = _2031 * _2029;
    float _2073 = fma(_2069, 0.5, 0.5);
    float _2075 = fma(_2071, -0.5, 0.5);
    float _2077 = _2021;
    if (!_1437)
    {
        float _2079 = rint(_1953);
        float _2081 = precise::max(_2079, 0.0);
        uint _2083 = uint(_2081);
        uint _2085 = clamp(_2083, 0u, 65535u);
        _2077 = as_type<float>(_2085);
    }
    float _2087 = _2077;
    if (!_1437)
    {
        float _2089 = -_2047;
        float _2091 = _1226 + _2089;
        _1364 = _2091;
    }
    float _2093 = _1364;
    float _2095 = _2067;
    if (_1985)
    {
        float3 _8621 = float3(_1839, _1957, float(as_type<int>(_2067)));
        float3 _8625 = select(_8621, float3(0.0), isnan(_8621));
        float _2097 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8625.xy, uint(rint(_8625.z)), _2053, level(0.0));
        _2095 = _2097;
    }
    float _2099 = _2095;
    float3 _8635 = float3(_2073, _2075, _2055);
    float _2101 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8635, float3(0.0), isnan(_8635)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8635, float3(0.0), isnan(_8635)), level(0.0)).x;
    float3 _8644 = float3(_2073, _2075, _2055);
    float4 _2104 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8644, float3(0.0), isnan(_8644)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8644, float3(0.0), isnan(_8644)), level(0.0)).xyzw;
    float _2106 = _2104.x;
    float _2108 = _2104.y;
    float _2110 = _2104.z;
    float _2112 = _2104.w;
    float _2114 = _2093;
    float _2116 = _2087;
    if (!_1437)
    {
        float3 _8668 = float3(_2039, _2093, float(as_type<int>(_2087)));
        float3 _8670 = select(_8668, float3(0.0), isnan(_8668));
        float _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8670.xy, uint(rint(_8670.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8670.xy, uint(rint(_8670.z)), level(0.0)).x;
        _2114 = _2118;
    }
    float _2120 = _2114;
    float _2122 = float(uint(_694));
    float _2124 = trunc(_1190);
    int _2126 = int(_2124);
    int _2128 = ~_694;
    int _2130 = _2128 + 1;
    float _2132 = _1198 * _854;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2136 = _2134 != 0;
    int _2138 = abs(_1765);
    int _2140 = abs(_986);
    float _2142 = 1.0 / _2122;
    float _2144 = float(uint(_2126));
    float _2146 = trunc(_2132);
    int _2148 = int(_2146);
    int _2150 = as_type<int>(_2142) + (-2);
    float _2152 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2154 = int(_2152);
    float _2156 = as_type<float>(_2150) * _2144;
    float _2158 = float(_2126);
    float _2160 = in.m_75.x;
    if (_2136)
    {
        _2116 = 1.0;
    }
    float _2162 = _2116;
    float _2164 = trunc(_1204);
    int _2166 = int(_2164);
    float _2168 = _2162;
    if (!_2136)
    {
        _2168 = 7.345489978790283203125;
    }
    float _2170 = _2168;
    bool _2172 = _2158 >= _1188;
    bool _2174 = isnan(_2158);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(_1188);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = abs(_974);
    float _2186 = _2170 * _662;
    float _2188 = trunc(_2156);
    float _2190 = precise::max(_2188, 0.0);
    uint _2192 = uint(_2190);
    float _2194 = trunc(_2182);
    int _2196 = int(_2194);
    float _2198 = float(uint(_2166));
    int _2200 = _2130 * int(_2192);
    int _2202 = _2200 + _2126;
    float _2204 = float(uint(_2202));
    float _2206 = as_type<float>(_2150) * _2204;
    float _2208 = trunc(_2206);
    float _2210 = precise::max(_2208, 0.0);
    uint _2212 = uint(_2210);
    int _2214 = ~_2196;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = int(_2192) + int(_2212);
    float _2222 = floor(_2186);
    int _2224 = _2130 * _2220;
    int _2226 = _2224 + _2126;
    bool _2228 = uint(_2226) >= uint(_694);
    bool _2230 = !_2228;
    int _2232 = _2230 ? 0 : (-1);
    bool _2234 = _694 == 0;
    float _2236 = -_2222;
    float _2238 = _2186 + _2236;
    int _2240 = ~_2220;
    int _2242 = _2240 + _2232;
    int _2244 = _2242 + 1;
    int _2246 = _694 + (-1);
    float _2248 = _2238 * _1188;
    int _2250 = _694 * _2244;
    int _2252 = _2250 + _2126;
    float _2254 = trunc(_2248);
    int _2256 = int(_2254);
    bool _2258 = !_2234;
    int _2260 = _2258 ? _2252 : (-1);
    int _2262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2264 = _2262 != 0;
    int _2266 = abs(_948);
    int _2268 = _2260 * _2218;
    bool _2270 = !_2264;
    int _2272 = _2270 ? 0 : 1;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2276 = _2274 != 0;
    int _2278 = _2196 * _2246;
    int _2280 = _2278 + _2268;
    int _2282 = abs(_2272);
    bool _2284 = !_2276;
    int _2286 = _2284 ? 0 : 1;
    int _2288 = _2280 * _2266;
    int _2290 = abs(_954);
    int _2292 = _2256 * _2282;
    int _2294 = _2292 + _2126;
    int _2296 = abs(_2286);
    float _2298 = trunc(_1202);
    int _2300 = int(_2298);
    int _2302 = _2148 * _2290;
    int _2304 = _2302 + _2288;
    float _2306 = float(uint(_2154));
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2310 = _2308 != 0;
    int _2312 = _2294 * _2184;
    int _2314 = _2312 + _2304;
    int _2316 = ~_694;
    int _2318 = _2316 + 1;
    float _2320 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2322 = int(_2320);
    int _2324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2326 = _2324 != 0;
    int _2328 = _2256 * _2296;
    int _2330 = _2328 + _2314;
    float _2332 = float(uint(_2330));
    float _2334 = 1.0 / _2306;
    bool _2336 = _2276;
    int _2338 = int(_2192);
    float _2340 = _2198;
    if (_2310)
    {
        bool _2342 = _662 > 0.5;
        _2336 = _2342;
    }
    bool _2344 = _2336;
    float _2346 = as_type<float>(_2150) * _2332;
    int _2348 = as_type<int>(_2346);
    if (!_2310)
    {
        _1216 = _2160;
    }
    float _2350 = _1216;
    float _2352 = _2350;
    if (_2326)
    {
        float _2354 = -_2160;
        float _2356 = _2354 + 1.0;
        _2338 = as_type<int>(_2356);
    }
    int _2358 = _2338;
    float _2360 = trunc(_2346);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = float(uint(_2322));
    int _2368 = ~_2322;
    int _2370 = _2368 + 1;
    int _2372 = as_type<int>(_2334) + (-2);
    float _2374 = 1.0 / _2366;
    float _2376 = float(uint(_2300));
    if (_2310)
    {
        float _2378 = -_2160;
        float _2380 = _2378 + 1.0;
        _2348 = as_type<int>(_2380);
    }
    int _2382 = _2348;
    float _2384 = as_type<float>(_2372) * _2376;
    int _2386 = _2318 * int(_2364);
    int _2388 = _2386 + _2330;
    int _2390 = int(_2364);
    if (_2310)
    {
        float _2392 = _2344 ? as_type<float>(_2382) : _2160;
        _2352 = _2392;
    }
    float _2394 = _2352;
    bool _2396 = _688 > 0.5;
    float _2398 = trunc(_2384);
    float _2400 = precise::max(_2398, 0.0);
    uint _2402 = uint(_2400);
    float _2404 = float(uint(_2388));
    int _2406 = ~_2154;
    int _2408 = _2406 + 1;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2412 = _2410 != 0;
    float _2414 = as_type<float>(_2150) * _2404;
    int _2416 = as_type<int>(_2374) + (-2);
    float _2418 = trunc(_2414);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    float _2424 = as_type<float>(_2408);
    float _2426 = as_type<float>(_2408);
    if (_2136)
    {
        _2424 = _662;
    }
    float _2428 = _2424;
    float _2430 = as_type<float>(_2416) * _2198;
    float _2432 = _2428;
    if (!_2326)
    {
        _2340 = _2160;
    }
    float _2434 = _2340;
    float _2436 = _2434;
    if (!_2136)
    {
        _2432 = _666;
    }
    float _2438 = _2432;
    int _2440 = _2408 * int(_2402);
    int _2442 = _2440 + _2300;
    float _2444 = as_type<float>(_2402);
    if (_2136)
    {
        _2426 = 1.0;
    }
    float _2446 = _2426;
    float _2448 = trunc(_2430);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = _2446;
    if (!_2136)
    {
        _2454 = 1.2345600128173828125;
    }
    float _2456 = _2454;
    float _2458 = float(uint(_2442));
    if (_2326)
    {
        float _2460 = _2396 ? as_type<float>(_2358) : _2160;
        _2436 = _2460;
    }
    float _2462 = _2436;
    float _2464 = _2438 * _2456;
    int _2466 = ~_2322;
    int _2468 = _2466 + 1;
    float _2470 = as_type<float>(_2372) * _2458;
    int _2472 = int(_2364) + int(_2422);
    if (_2412)
    {
        float _2474 = -_2160;
        float _2476 = _2474 + 1.0;
        _2390 = as_type<int>(_2476);
    }
    int _2478 = _2390;
    float _2480 = trunc(_2470);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    bool _2486 = _666 > 0.5;
    float _2488 = in.m_63.w;
    if (!_2412)
    {
        _740 = _2160;
    }
    float _2490 = _740;
    int _2492 = _2468 * int(_2452);
    int _2494 = _2492 + _2166;
    int _2496 = ~_694;
    int _2498 = _2496 + 1;
    float _2500 = _2490;
    if (_2412)
    {
        float _2502 = _2486 ? as_type<float>(_2478) : _2160;
        _2500 = _2502;
    }
    float _2504 = _2500;
    float _2506 = floor(_2464);
    float _2508 = float(uint(_2494));
    float _2510 = in.m_75.y;
    int _2512 = ~_2154;
    int _2514 = _2512 + 1;
    int _2516 = _2498 * _2472;
    int _2518 = _2516 + _2330;
    if (!_2136)
    {
        _742 = _688;
    }
    float _2520 = _742;
    float _2522 = as_type<float>(_2416) * _2508;
    int _2524 = int(_2402) + int(_2484);
    bool _2526 = uint(_2518) >= uint(_694);
    float _2528 = trunc(_2522);
    float _2530 = precise::max(_2528, 0.0);
    uint _2532 = uint(_2530);
    float _2534 = float(_2154);
    int _2536 = _2514 * _2524;
    int _2538 = _2536 + _2300;
    float _2540 = float(_2300);
    float _2542 = -_2506;
    float _2544 = _2464 + _2542;
    if (_2136)
    {
        _2444 = 1.0;
    }
    float _2546 = _2444;
    float _2548 = _2546;
    if (!_2136)
    {
        _2548 = 5.839270114898681640625;
    }
    float _2550 = _2548;
    float _2552 = _2534 * _2544;
    bool _2554 = _2540 >= _2534;
    bool _2556 = isnan(_2540);
    bool _2558 = _2554 || _2556;
    bool _2560 = isnan(_2534);
    bool _2562 = _2558 || _2560;
    float _2564 = float(_2562);
    bool _2566 = uint(_2538) >= uint(_2154);
    float _2568 = _2520 * _2550;
    float _2570 = trunc(_2564);
    int _2572 = int(_2570);
    float _2574 = -_2510;
    float _2576 = _2574 + 1.0;
    bool _2578 = !_2566;
    int _2580 = _2578 ? 0 : (-1);
    bool _2582 = !_2526;
    int _2584 = _2582 ? 0 : (-1);
    int _2586 = ~_2524;
    int _2588 = _2586 + _2580;
    int _2590 = _2588 + 1;
    bool _2592 = _2488 > 0.5;
    float _2594 = trunc(_2552);
    int _2596 = int(_2594);
    int _2598 = _2486 ? as_type<int>(_2576) : as_type<int>(_2510);
    int _2600 = _2154 * _2590;
    int _2602 = _2600 + _2300;
    bool _2604 = _2154 == 0;
    int _2606 = int(_2452) + int(_2532);
    float _2608 = _2534 * _912;
    int _2610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2612 = _2610 != 0;
    int _2614 = ~_2572;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2370 * _2606;
    int _2622 = _2620 + _2166;
    bool _2624 = !_2604;
    int _2626 = _2624 ? _2602 : (-1);
    float _2628 = trunc(_2608);
    int _2630 = int(_2628);
    float _2632 = _2612 ? as_type<float>(_2598) : _2510;
    int _2634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2636 = _2634 != 0;
    int _2638 = _2618 * _2626;
    int _2640 = _2592 ? as_type<int>(_2576) : as_type<int>(_2510);
    bool _2642 = !_2636;
    int _2644 = _2642 ? 0 : 1;
    int _2646 = _2154 + (-1);
    bool _2648 = uint(_2622) >= uint(_2322);
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2652 = _2650 != 0;
    int _2654 = _2572 * _2646;
    int _2656 = _2654 + _2638;
    bool _2658 = !_2648;
    int _2660 = _2658 ? 0 : (-1);
    float _2662 = floor(_2568);
    bool _2664 = !_2652;
    int _2666 = _2664 ? 0 : 1;
    int _2668 = abs(_1747);
    int _2670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2672 = _2670 != 0;
    int _2674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2676 = _2674 != 0;
    int _2678 = _2656 * _2668;
    int _2680 = abs(_2644);
    float _2682 = float(_2322);
    float _2684 = float(_2166);
    int _2686 = abs(_1761);
    float _2688 = -_2662;
    float _2690 = _2568 + _2688;
    bool _2692 = _2684 >= _2682;
    bool _2694 = isnan(_2684);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(_2682);
    bool _2700 = _2696 || _2698;
    float _2702 = float(_2700);
    int _2704 = _2596 * _2680;
    int _2706 = _2704 + _2300;
    float _2708 = _2682 * _2690;
    int _2710 = ~_2606;
    int _2712 = _2710 + _2660;
    int _2714 = _2712 + 1;
    float _2716 = _2682 * _912;
    float _2718 = trunc(_2702);
    int _2720 = int(_2718);
    int _2722 = _2630 * _2686;
    int _2724 = _2722 + _2678;
    int _2726 = abs(_1769);
    int _2728 = _2322 * _2714;
    int _2730 = _2728 + _2166;
    bool _2732 = !_2672;
    int _2734 = _2732 ? 0 : 1;
    int _2736 = _2706 * _2138;
    int _2738 = _2736 + _2724;
    bool _2740 = _2322 == 0;
    float _2742 = trunc(_2716);
    int _2744 = int(_2742);
    int _2746 = abs(_2666);
    int _2748 = _2596 * _2726;
    int _2750 = _2748 + _2738;
    bool _2752 = !_2740;
    int _2754 = _2752 ? _2730 : (-1);
    int _2756 = _2322 + (-1);
    float _2758 = float(uint(_2750));
    float _2760 = trunc(_2708);
    int _2762 = int(_2760);
    int _2764 = ~_2720;
    int _2766 = _2764 + 1;
    int _2768 = _2766 + 1;
    int _2770 = ~_2472;
    int _2772 = _2770 + _2584;
    int _2774 = _2772 + 1;
    int _2776 = _2768 * _2754;
    int _2778 = _694 * _2774;
    int _2780 = _2778 + _2330;
    int _2782 = abs(_980);
    int _2784 = _2720 * _2756;
    int _2786 = _2784 + _2776;
    float _2788 = as_type<float>(_2372) * _2758;
    int _2790 = abs(_2734);
    float _2792 = float(uint(_2294));
    float _2794 = trunc(_2788);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = _2762 * _2746;
    int _2802 = _2800 + _2166;
    int _2804 = ~_2154;
    int _2806 = _2804 + 1;
    int _2808 = _2786 * _2782;
    float _2810 = as_type<float>(_2150) * _2792;
    bool _2812 = !_2234;
    int _2814 = _2812 ? _2780 : (-1);
    int _2816 = _2744 * _2140;
    int _2818 = _2816 + _2808;
    bool _2820 = !_2676;
    int _2822 = _2820 ? 0 : 1;
    int _2824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2826 = _2824 != 0;
    float _2828 = trunc(_2810);
    float _2830 = precise::max(_2828, 0.0);
    uint _2832 = uint(_2830);
    int _2834 = abs(_2822);
    int _2836 = _2802 * _2790;
    int _2838 = _2836 + _2818;
    float _2840 = _2826 ? as_type<float>(_2640) : _2510;
    int _2842 = _2806 * int(_2798);
    int _2844 = _2842 + _2750;
    int _2846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2848 = _2846 != 0;
    int _2850 = ~_694;
    int _2852 = _2850 + 1;
    int _2854 = _2762 * _2834;
    int _2856 = _2854 + _2838;
    float _2858 = float(uint(_2844));
    float _2860 = float(uint(_2856));
    float _2862 = as_type<float>(_2372) * _2858;
    int _2864 = ~_2322;
    int _2866 = _2864 + 1;
    int _2868 = _2852 * int(_2832);
    int _2870 = _2868 + _2294;
    int _2872 = ~_2154;
    int _2874 = _2872 + 1;
    float _2876 = _2510;
    if (_2848)
    {
        float _2878 = _2396 ? _2576 : _2510;
        _2876 = _2878;
    }
    float _2880 = _2876;
    float _2882 = as_type<float>(_2416) * _2860;
    int _2884 = _2814 & 3;
    bool _2886 = _2884 != 0;
    float _2888 = trunc(_2862);
    float _2890 = precise::max(_2888, 0.0);
    uint _2892 = uint(_2890);
    int _2894 = _2814 & 3;
    bool _2896 = _2894 != 0;
    float _2898 = float(uint(_2870));
    int _2900 = _2886 ? 0 : 1;
    bool _2902 = uint(_2894) > 1u;
    float _2904 = trunc(_2882);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    float _2910 = as_type<float>(_2150) * _2898;
    float _2912 = float(uint(_2706));
    int _2914 = ~_2900;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = ~_694;
    int _2922 = _2920 + 1;
    float _2924 = as_type<float>(_2372) * _2912;
    float _2926 = trunc(_2910);
    float _2928 = precise::max(_2926, 0.0);
    uint _2930 = uint(_2928);
    int _2932 = int(_2798) + int(_2892);
    int _2934 = _2918;
    float _2936 = as_type<float>(_2932);
    if (!_2902)
    {
        int _2938 = ~_2900;
        int _2940 = _2938 + 1;
        _2934 = _2940;
    }
    int _2942 = _2934;
    bool _2944 = uint(_2894) >= 2u;
    int _2946 = _2866 * int(_2908);
    int _2948 = _2946 + _2856;
    float _2950 = trunc(_2924);
    float _2952 = precise::max(_2950, 0.0);
    uint _2954 = uint(_2952);
    int _2956 = _2944 ? 0 : 1;
    bool _2958 = _2894 != 3;
    float _2960 = float(uint(_2948));
    int _2962 = ~_2154;
    int _2964 = _2962 + 1;
    int _2966 = int(_2832) + int(_2930);
    float _2968 = as_type<float>(_2416) * _2960;
    int _2970 = ~_2956;
    int _2972 = _2970 + 1;
    int _2974 = _2972 + 1;
    int _2976 = _2964 * _2932;
    int _2978 = _2976 + _2750;
    float _2980 = trunc(_2968);
    float _2982 = precise::max(_2980, 0.0);
    uint _2984 = uint(_2982);
    int _2986 = _2974;
    if (_2958)
    {
        int _2988 = ~_2956;
        int _2990 = _2988 + 1;
        _2986 = _2990;
    }
    int _2992 = _2986;
    int _2994 = _2874 * int(_2954);
    int _2996 = _2994 + _2706;
    bool _2998 = uint(_2978) >= uint(_2154);
    int _3000 = _2922 * _2966;
    int _3002 = _3000 + _2294;
    bool _3004 = !_2998;
    int _3006 = _3004 ? 0 : (-1);
    float _3008 = float(uint(_2996));
    int _3010 = ~_2932;
    int _3012 = _3010 + _3006;
    int _3014 = _3012 + 1;
    bool _3016 = uint(_3002) >= uint(_694);
    float _3018 = as_type<float>(_2372) * _3008;
    int _3020 = int(_2908) + int(_2984);
    int _3022 = _2154 * _3014;
    int _3024 = _3022 + _2750;
    if (_1437)
    {
        _2936 = 1.0;
    }
    float _3026 = _2936;
    float _3028 = _3026;
    float _3030 = _2120;
    if (!_1437)
    {
        int _3032 = _1485 << 4;
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
        float _3070 = _1094 * _3050;
        float _3072 = fma(_640, _3042, _3070);
        float _3074 = fma(_642, _3060, _3072);
        float _3076 = _3074 + _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        float _3080 = -_3078;
        float _3082 = _3080 + _2120;
        float _3084 = fma(_3082, 500.0, 1.5);
        float _3086 = exp2(_3084);
        float _3088 = 0.0 + _3086;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        _1218 = _3070;
        _3028 = _3090;
    }
    float _3092 = _1218;
    float _3094 = _3028;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3098 = _1901 + _3096;
    float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3102 = _1903 + _3100;
    float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3106 = _1905 + _3104;
    bool _3108 = !_2604;
    int _3110 = _3108 ? _3024 : (-1);
    float _3112 = _3098 * _3098;
    bool _3114 = !_3016;
    int _3116 = _3114 ? 0 : (-1);
    float _3118 = fma(_3102, _3102, _3112);
    float _3120 = fma(_3106, _3106, _3118);
    float _3122 = rsqrt(_3120);
    float _3124 = sqrt(_3120);
    float _3126 = _3122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3128 = _3102 * _3126;
    float _3130 = _3106 * _3126;
    float _3132 = _3128 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 + _3134;
    float _3138 = sqrt(_3136);
    bool _3140 = _3138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = _3138 + _3142;
    float _3146 = _3122;
    float _3148 = _3092;
    float _3150 = _3144;
    float _3152 = _3098;
    float _3154 = _3136;
    if (_3140)
    {
        float _3156 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3146 = _3156;
    }
    float _3158 = _3146;
    if (_3140)
    {
        float _3160 = rsqrt(_3136);
        _3148 = _3160;
    }
    float _3162 = _3148;
    float _3164 = _3162;
    if (_3140)
    {
        float _3166 = _3144 * _3158;
        _3150 = _3166;
    }
    float _3168 = _3150;
    if (_3140)
    {
        float _3170 = _3168 * 0.15915493667125701904296875;
        _744 = _3170;
    }
    float _3172 = _744;
    float _3174 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3176 = _3106;
    if (_3140)
    {
        float _3178 = _3172 * 6.283185482025146484375;
        float _3180 = sin(_3178);
        _3176 = _3180;
    }
    float _3182 = _3176;
    float _3184 = precise::max(0.0, _3174);
    float _3186 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3188 = _3184;
    if (_3140)
    {
        float _3190 = _3172 * 6.283185482025146484375;
        float _3192 = cos(_3190);
        _3186 = _3192;
    }
    float _3194 = _3186;
    float _3196 = -_3126;
    float _3198 = -_3184;
    float _3200 = fma(_3098, _3196, _3198);
    if (_3140)
    {
        float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3152 = _3202;
    }
    float _3204 = _3152;
    float _3206 = _3204;
    float _3208 = _3182;
    if (_3140)
    {
        float _3210 = fma(_3182, _3204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3206 = _3210;
    }
    float _3212 = _3206;
    float _3214 = _3212;
    if (!_3140)
    {
        _3208 = _3128;
    }
    float _3216 = _3208;
    float _3218 = _3216;
    if (_3140)
    {
        float _3220 = _3162 * _3212;
        _3030 = _3220;
    }
    float _3222 = _3030;
    if (!_3140)
    {
        _3214 = _3200;
    }
    float _3224 = _3214;
    float _3226 = _3224;
    float _3228 = _3194;
    if (_3140)
    {
        float _3230 = _3194 + (-1.0);
        _3188 = _3230;
    }
    float _3232 = _3188;
    float _3234 = _3232;
    if (_3140)
    {
        float _3236 = _3128 * _3222;
        _3218 = _3236;
    }
    float _3238 = _3218;
    if (!_3140)
    {
        _3164 = _3132;
    }
    float _3240 = _3164;
    float _3242 = _3240;
    if (_3140)
    {
        float _3244 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3154 = _3244;
    }
    float _3246 = _3154;
    if (!_3140)
    {
        _3234 = _3130;
    }
    float _3248 = _3234;
    float _3250 = _3248;
    if (_3140)
    {
        float _3252 = _3130 * _3222;
        _3250 = _3252;
    }
    float _3254 = _3250;
    if (_3140)
    {
        float _3256 = _3238 * _3238;
        _3242 = _3256;
    }
    float _3258 = _3242;
    if (_3140)
    {
        float _3260 = fma(_3200, _3194, _3246);
        _3226 = _3260;
    }
    float _3262 = _3226;
    if (!_3140)
    {
        _3228 = _3134;
    }
    float _3264 = _3228;
    float _3266 = _3264;
    if (_3140)
    {
        float _3268 = _3254 * _3254;
        _3266 = _3268;
    }
    float _3270 = _3266;
    float _3272 = fma(_3262, _3262, _3258);
    bool _3274 = !_2896;
    int _3276 = _3274 ? 0 : 1;
    int _3278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3280 = _3278 != 0;
    float _3282 = _3272 + _3270;
    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3286 = fma(_3124, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3284);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    float _3290 = -_3288;
    float _3292 = _3290 + 1.0;
    float _3294 = rsqrt(_3282);
    float _3296 = abs(_3292);
    float _3298 = log2(_3296);
    float _3300 = _3294 * _3238;
    float _3302 = _3294 * _3262;
    float _3304 = _3294 * _3254;
    float _3306 = _3300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3308 = -_3306;
    float _3310 = fma(_3302, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3314 = _3302 + 1.0;
    float _3316 = -_3304;
    float _3318 = fma(_3316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3320 = exp2(_3312);
    float _3322 = fma(_3318, 0.5, 0.5);
    float _3324 = fma(_3318, -0.5, 0.5);
    float _3326 = fma(_3322, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3328 = sqrt(_3324);
    float _3330 = -_3302;
    float _3332 = fma(_3320, _3314, _3330);
    float _3334 = fma(_3322, _3326, -0.212114393711090087890625);
    int _3336 = _3110 & 3;
    bool _3338 = _3336 != 0;
    float _3340 = fma(_3332, 0.5, 0.5);
    float _3342 = fma(_3322, _3334, 1.570728778839111328125);
    int _3344 = ~_2322;
    int _3346 = _3344 + 1;
    float _3348 = _3328 * 0.636619746685028076171875;
    bool _3350 = uint(_3336) >= 2u;
    int _3352 = _3346 * _3020;
    int _3354 = _3352 + _2856;
    float _3356 = -_3342;
    float _3358 = fma(_3348, _3356, 1.0);
    int _3360 = _3350 ? 0 : 1;
    bool _3362 = !_3280;
    int _3364 = _3362 ? 0 : 1;
    bool _3366 = _3336 != 3;
    float2 _10425 = float2(_3358, _3340);
    float3 _3370 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10425, float2(0.0), isnan(_10425)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10425, float2(0.0), isnan(_10425)), level(0.0)).xyz;
    float _3372 = _3370.x;
    float _3374 = _3370.y;
    float _3376 = _3370.z;
    float _3378 = trunc(_3018);
    float _3380 = precise::max(_3378, 0.0);
    uint _3382 = uint(_3380);
    bool _3384 = uint(_3354) >= uint(_2322);
    float _3386 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3388 = _620 + _3386;
    int _3390 = _3338 ? 0 : 1;
    float _3392 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3394 = _620 + _3392;
    bool _3396 = _2894 != 3;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3400 = _620 + _3398;
    int _3402 = ~_3360;
    int _3404 = _3402 + 1;
    int _3406 = _3404 + 1;
    float _3408 = _1967 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    float _3414 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3416 = uint(_3336) > 1u;
    float _3418 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3408);
    bool _3420 = !_3384;
    int _3422 = _3420 ? 0 : (-1);
    float _3424 = -_660;
    float _3426 = _3424 + 1.0;
    int _3428 = _3406;
    if (_3366)
    {
        int _3430 = ~_3360;
        int _3432 = _3430 + 1;
        _3428 = _3432;
    }
    int _3434 = _3428;
    float _3436 = exp2(_3414);
    bool _3438 = _3336 != 3;
    float _3440 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3418);
    int _3442 = int(_2954) + int(_3382);
    out.m_77.x = _1903;
    out.m_77.y = _1901;
    out.m_77.z = _1905;
    int _3444 = ~_2154;
    int _3446 = _3444 + 1;
    int _3448 = ~_3020;
    int _3450 = _3448 + _3422;
    int _3452 = _3450 + 1;
    int _3454 = ~_3390;
    int _3456 = _3454 + 1;
    int _3458 = _3456 + 1;
    bool _3460 = !_3438;
    int _3462 = _3460 ? 0 : (-1);
    int _3464 = _2322 * _3452;
    int _3466 = _3464 + _2856;
    int _3468 = _3458;
    if (!_3416)
    {
        int _3470 = ~_3390;
        int _3472 = _3470 + 1;
        _3468 = _3472;
    }
    int _3474 = _3468;
    int _3476 = _3446 * _3442;
    int _3478 = _3476 + _2706;
    int _3480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3482 = _3480 != 0;
    float _3484 = -_3436;
    float _3486 = _3484 + 1.0;
    int _3488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3490 = _3488 != 0;
    int _3492 = _3110 & 3;
    bool _3494 = _3492 != 0;
    float _3496 = float(uint(_2802));
    bool _3498 = !_3494;
    int _3500 = _3498 ? 0 : 1;
    bool _3502 = uint(_3478) >= uint(_2154);
    float _3504 = as_type<float>(_2416) * _3496;
    bool _3506 = !_2740;
    int _3508 = _3506 ? _3466 : (-1);
    float _3510 = trunc(_3504);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    bool _3516 = !_3502;
    int _3518 = _3516 ? 0 : (-1);
    int _3520 = _3508 & 3;
    bool _3522 = _3520 != 0;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3528 = 1.0 / _3526;
    int _3530 = _3522 ? 0 : 1;
    float _3532 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3534 = _3532 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3536 = uint(_3520) >= 2u;
    float _3538 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3540 = _3538 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3542 = _3536 ? 0 : 1;
    float _3544 = 1.0 / _3534;
    float _3546 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3548 = _3546 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3550 = _3520 != 3;
    int _3552 = ~_2322;
    int _3554 = _3552 + 1;
    float _3556 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3558 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3556;
    float _3560 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3562 = _3560 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3564 = 1.0 / _3540;
    int _3566 = _3554 * int(_3514);
    int _3568 = _3566 + _2802;
    float _3570 = float(uint(_3568));
    float _3572 = 1.0 / _3548;
    int _3574 = ~_3542;
    int _3576 = _3574 + 1;
    int _3578 = _3576 + 1;
    float _3580 = _3558 * _3544;
    int _3582 = _3578;
    if (_3550)
    {
        int _3584 = ~_3542;
        int _3586 = _3584 + 1;
        _3582 = _3586;
    }
    int _3588 = _3582;
    float _3590 = as_type<float>(_2416) * _3570;
    bool _3592 = _3520 != 3;
    float _3594 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3596 = _3594 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3598 = _3562 * _3564;
    bool _3600 = !_3592;
    int _3602 = _3600 ? 0 : (-1);
    float _3604 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3606 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3604;
    bool _3608 = uint(_3520) > 1u;
    float _3610 = trunc(_3590);
    float _3612 = precise::max(_3610, 0.0);
    uint _3614 = uint(_3612);
    float _3616 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3618 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3616;
    bool _3620 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3622 = isnan(_620);
    bool _3624 = _3620 || _3622;
    bool _3626 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3628 = _3624 || _3626;
    float _3630 = float(_3628);
    float _3632 = _3606 * _3572;
    float _3634 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3636 = _620 + _3634;
    float _3638 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3640 = _3638 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3642 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3644 = _3642 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3646 = 1.0 / _3596;
    float _3648 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3650 = _3648 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3652 = _3618 * _3528;
    float _3654 = fma(_3580, _3388, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3656 = fma(_3598, _3636, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3658 = ~_3530;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    float _3664 = -_3630;
    float _3666 = _3664 + 1.0;
    bool _3668 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3670 = isnan(_620);
    bool _3672 = _3668 || _3670;
    bool _3674 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3676 = _3672 || _3674;
    float _3678 = float(_3676);
    float _3680 = 1.0 / _3640;
    int _3682 = _3662;
    float _3684 = _3656;
    if (!_3608)
    {
        int _3686 = ~_3530;
        int _3688 = _3686 + 1;
        _3682 = _3688;
    }
    int _3690 = _3682;
    float _3692 = fma(_3652, _3394, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _3694 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3696 = isnan(_620);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3702 = _3698 || _3700;
    float _3704 = float(_3702);
    float _3706 = _3678 * _3666;
    float _3708 = -_3678;
    float _3710 = _3708 + 1.0;
    bool _3712 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3714 = isnan(_620);
    bool _3716 = _3712 || _3714;
    bool _3718 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3720 = _3716 || _3718;
    float _3722 = float(_3720);
    float _3724 = 1.0 / _3644;
    float _3726 = -_3704;
    float _3728 = _3726 + 1.0;
    int _3730 = int(_3514) + int(_3614);
    float _3732 = _3704 * _3710;
    int _3734 = ~_2322;
    int _3736 = _3734 + 1;
    float _3738 = _3722 * _3728;
    float _3740 = -_3722;
    float _3742 = _3740 + 1.0;
    bool _3744 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3746 = isnan(_620);
    bool _3748 = _3744 || _3746;
    bool _3750 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3752 = _3748 || _3750;
    float _3754 = float(_3752);
    float _3756 = _3650 * _3646;
    bool _3758 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3760 = isnan(_620);
    bool _3762 = _3758 || _3760;
    bool _3764 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3766 = _3762 || _3764;
    float _3768 = float(_3766);
    int _3770 = _3736 * _3730;
    int _3772 = _3770 + _2802;
    int _3774 = _3508 & 3;
    bool _3776 = _3774 != 0;
    float _3778 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3780 = _3778 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3782 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3784 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3782;
    float _3786 = _3754 * _3742;
    float _3788 = -_3754;
    float _3790 = _3788 + 1.0;
    bool _3792 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3794 = isnan(_620);
    bool _3796 = _3792 || _3794;
    bool _3798 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3800 = _3796 || _3798;
    float _3802 = float(_3800);
    float _3804 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3806 = _620 + _3804;
    bool _3808 = !_3776;
    int _3810 = _3808 ? 0 : 1;
    float _3812 = -_3768;
    float _3814 = _3812 + 1.0;
    bool _3816 = uint(_3772) >= uint(_2322);
    float _3818 = _3780 * _3680;
    float _3820 = _3784 * _3724;
    bool _3822 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3824 = isnan(_620);
    bool _3826 = _3822 || _3824;
    bool _3828 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3830 = _3826 || _3828;
    float _3832 = float(_3830);
    float _3834 = in.m_79.x;
    float _3836 = in.m_79.y;
    float _3838 = in.m_79.z;
    float _3840 = _3768 * _3790;
    float _3842 = fma(_3632, _3806, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3844 = _3802 * _3814;
    float _3846 = -_3802;
    float _3848 = _3846 + 1.0;
    bool _3850 = !_3816;
    int _3852 = _3850 ? 0 : (-1);
    float _3854 = in.m_81.x;
    float _3856 = in.m_81.y;
    float _3858 = in.m_81.z;
    float _3860 = in.m_81.w;
    bool _3862 = _1258 != 0.0;
    bool _3864 = isnan(_1258);
    bool _3866 = _3862 || _3864;
    bool _3868 = isnan(0.0);
    bool _3870 = _3866 || _3868;
    float _3872 = _3832 * _3848;
    float _3874 = -_3832;
    float _3876 = _3874 + 1.0;
    float _3878 = fma(_3756, _3400, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _3880 = _1256 == 0.0;
    bool _3882 = !_3870;
    bool _3884 = _3880 && _3882;
    float _3886 = _3654 * _3872;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3890 = _620 + _3888;
    int _3892 = ~_2966;
    int _3894 = _3892 + _3116;
    int _3896 = _3894 + 1;
    bool _3898 = _1260 == 0.0;
    bool _3900 = _3898 && _3884;
    float _3902 = fma(_3876, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3886);
    float _3904 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3906 = _620 + _3904;
    float _3908 = fma(_3818, _3890, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3910 = abs(_1318);
    float _3912 = log2(_3910);
    float _3914 = fma(_3656, _3844, _3902);
    float _3916 = fma(_3820, _3906, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _3918 = ~_3730;
    int _3920 = _3918 + _3852;
    int _3922 = _3920 + 1;
    int _3924 = _694 * _3896;
    int _3926 = _3924 + _2294;
    float _3928 = fma(_3842, _3840, _3914);
    int _3930 = ~_3442;
    int _3932 = _3930 + _3518;
    int _3934 = _3932 + 1;
    int _3936 = abs(_2942);
    float _3938 = fma(_3878, _3786, _3928);
    float _3940 = _3756;
    float _3942 = _3818;
    if (_3900)
    {
        _3940 = _3836;
    }
    float _3944 = _3940;
    float _3946 = _3944;
    if (!_3900)
    {
        float _3948 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3836);
        _3946 = _3948;
    }
    float _3950 = _3946;
    if (_3900)
    {
        _3942 = _3834;
    }
    float _3952 = _3942;
    float _3954 = _3952;
    if (!_3900)
    {
        float _3956 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3834);
        _3954 = _3956;
    }
    float _3958 = _3954;
    float _3960 = _3856 * _3838;
    float _3962 = _3858 * _3834;
    float _3964 = _3854 * _3836;
    if (_3900)
    {
        _3684 = _3838;
    }
    float _3966 = _3684;
    float _3968 = _3966;
    if (!_3900)
    {
        float _3970 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3838);
        _3968 = _3970;
    }
    float _3972 = _3968;
    float _3974 = fma(_3692, _3738, _3938);
    float _3976 = -_3960;
    float _3978 = fma(_3858, _3836, _3976);
    float _3980 = -_3962;
    float _3982 = fma(_3854, _3838, _3980);
    float _3984 = -_3964;
    float _3986 = fma(_3856, _3834, _3984);
    float _3988 = fma(_3908, _3732, _3974);
    int _3990 = _3508 >> 31;
    float _3992 = _3978 * _3860;
    float _3994 = _3982 * _3860;
    float _3996 = _3986 * _3860;
    float _3998 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _4000 = _2814 >> 31;
    float _4002 = fma(_3916, _3706, _3988);
    int _4004 = _3990 & 3;
    float _4006 = _1519 * _1693;
    int _4008 = _4000 & 3;
    float _4010 = exp2(_3998);
    int _4012 = _3508 + _4004;
    float _4014 = fma(_3630, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4002);
    int _4016 = _3110 >> 31;
    float _4018 = _1449 * _1693;
    int _4020 = _2814 + _4008;
    float _4022 = _1529 * _1569;
    int _4024 = _4012 >> 2;
    float _4026 = _1529 * _1693;
    int _4028 = _4016 & 3;
    float _4030 = _1519 * _1561;
    int _4032 = _4024 << 4;
    int _4034 = _4032 + 656;
    float _4036 = _1449 * _1569;
    int _4038 = _4020 >> 2;
    float _4040 = _1449 * _1561;
    int _4042 = _3110 + _4028;
    float _4044 = _1529 * _1561;
    uint _4046 = uint(int(uint(_4034) >> uint(2)));
    uint _4048 = uint(int(uint(int(_4046)) >> uint(2)));
    int _4050 = int(_4046) & 3;
    float _4052 = (*spvDescriptorSet0.vp_c9)._m0[int(_4048)][_4050];
    int _4054 = int(_4046) + 1;
    uint _4056 = uint(int(uint(_4054) >> uint(2)));
    int _4058 = _4054 & 3;
    float _4060 = (*spvDescriptorSet0.vp_c9)._m0[int(_4056)][_4058];
    int _4062 = _4038 << 4;
    int _4064 = _4062 + 368;
    float _4066 = -_1447;
    float _4068 = fma(_4066, _1487, _4036);
    float _4070 = fma(_4010, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4072 = precise::clamp(_4070, 0.0, 1.0);
    int _4074 = _4042 >> 2;
    float _4076 = -_1447;
    float _4078 = fma(_4076, _1491, _4040);
    out.m_83.x = _4014;
    uint _4080 = uint(int(uint(_4064) >> uint(2)));
    uint _4082 = uint(int(uint(int(_4080)) >> uint(2)));
    int _4084 = int(_4080) & 3;
    float _4086 = (*spvDescriptorSet0.vp_c9)._m0[int(_4082)][_4084];
    int _4088 = int(_4080) + 1;
    uint _4090 = uint(int(uint(_4088) >> uint(2)));
    int _4092 = _4088 & 3;
    float _4094 = (*spvDescriptorSet0.vp_c9)._m0[int(_4090)][_4092];
    int _4096 = _4074 << 4;
    int _4098 = _4096 + 512;
    float _4100 = fma(_4072, -2.0, 3.0);
    float _4102 = _4072 * _4072;
    float _4104 = fma(_1455, _1489, _4026);
    float _4106 = fma(_1455, _1491, _4044);
    int _4108 = _2154 * _3934;
    int _4110 = _4108 + _2706;
    float _4112 = _4102 * _4100;
    uint _4114 = uint(int(uint(_4098) >> uint(2)));
    uint _4116 = uint(int(uint(int(_4114)) >> uint(2)));
    int _4118 = int(_4114) & 3;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[int(_4116)][_4118];
    int _4122 = int(_4114) + 1;
    uint _4124 = uint(int(uint(_4122) >> uint(2)));
    int _4126 = _4122 & 3;
    float _4128 = (*spvDescriptorSet0.vp_c9)._m0[int(_4124)][_4126];
    float _4130 = _1519 * _1569;
    float _4132 = fma(_1451, _1489, _4006);
    float _4134 = -_1447;
    float _4136 = fma(_4134, _1489, _4018);
    float _4138 = fma(_1455, _1487, _4022);
    float _4140 = fma(_1451, _1487, _4130);
    int _4142 = abs(_3690);
    float _4144 = fma(_1453, _1280, _4136);
    int _4146 = _4064 + 8;
    uint _4148 = uint(int(uint(_4146) >> uint(2)));
    uint _4150 = uint(int(uint(int(_4148)) >> uint(2)));
    int _4152 = int(_4148) & 3;
    float _4154 = (*spvDescriptorSet0.vp_c9)._m0[int(_4150)][_4152];
    int _4156 = int(_4148) + 1;
    uint _4158 = uint(int(uint(_4156) >> uint(2)));
    int _4160 = _4156 & 3;
    float _4162 = (*spvDescriptorSet0.vp_c9)._m0[int(_4158)][_4160];
    int _4164 = abs(_3474);
    float _4166 = fma(_1451, _1491, _4030);
    int _4168 = ~_4142;
    int _4170 = _4168 + 1;
    int _4172 = _4170 + 1;
    int _4174 = _2322 * _3922;
    int _4176 = _4174 + _2802;
    int _4178 = ~_3936;
    int _4180 = _4178 + 1;
    int _4182 = _4180 + 1;
    float _4184 = fma(_1525, _1280, _4132);
    int _4186 = _4098 + 8;
    uint _4188 = uint(int(uint(_4186) >> uint(2)));
    uint _4190 = uint(int(uint(int(_4188)) >> uint(2)));
    int _4192 = int(_4188) & 3;
    float _4194 = (*spvDescriptorSet0.vp_c9)._m0[int(_4190)][_4192];
    int _4196 = int(_4188) + 1;
    uint _4198 = uint(int(uint(_4196) >> uint(2)));
    int _4200 = _4196 & 3;
    float _4202 = (*spvDescriptorSet0.vp_c9)._m0[int(_4198)][_4200];
    float _4204 = fma(_1453, _1254, _4068);
    float _4206 = fma(_1453, _1270, _4078);
    float _4208 = fma(_1525, _1254, _4140);
    float _4210 = fma(_1521, _1254, _4138);
    int _4212 = abs(_2992);
    float _4214 = fma(_1525, _1270, _4166);
    int _4216 = ~_4164;
    int _4218 = _4216 + 1;
    int _4220 = _4218 + 1;
    int _4222 = _4034 + 8;
    uint _4224 = uint(int(uint(_4222) >> uint(2)));
    uint _4226 = uint(int(uint(int(_4224)) >> uint(2)));
    int _4228 = int(_4224) & 3;
    float _4230 = (*spvDescriptorSet0.vp_c9)._m0[int(_4226)][_4228];
    int _4232 = int(_4224) + 1;
    uint _4234 = uint(int(uint(_4232) >> uint(2)));
    int _4236 = _4232 & 3;
    float _4238 = (*spvDescriptorSet0.vp_c9)._m0[int(_4234)][_4236];
    int _4240 = abs(_3500);
    float _4242 = fma(_1521, _1280, _4104);
    int _4244 = abs(_3810);
    float _4246 = fma(_1521, _1270, _4106);
    int _4248 = ~_4212;
    int _4250 = _4248 + 1;
    int _4252 = _4250 + 1;
    int _4254 = ~_4240;
    int _4256 = _4254 + 1;
    int _4258 = _4256 + 1;
    int _4260 = _4172 * as_type<int>(_4060);
    int _4262 = abs(_3276);
    int _4264 = ~_4244;
    int _4266 = _4264 + 1;
    int _4268 = _4266 + 1;
    int _4270 = ~_4262;
    int _4272 = _4270 + 1;
    int _4274 = _4272 + 1;
    int _4276 = abs(_3364);
    int _4278 = _4182 * as_type<int>(_4094);
    bool _4280 = !_2604;
    int _4282 = _4280 ? _4110 : (-1);
    float _4284 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4286 = int(_4284);
    int _4288 = _4268 * as_type<int>(_4052);
    int _4290 = _4288 + _4260;
    int _4292 = abs(_3462);
    int _4294 = _4274 * as_type<int>(_4086);
    int _4296 = _4294 + _4278;
    int _4298 = abs(_3434);
    float _4300 = _3994 * _4204;
    int _4302 = _4220 * as_type<int>(_4128);
    int _4304 = ~_4292;
    int _4306 = _4304 + 1;
    int _4308 = _4306 + 1;
    float _4310 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4312 = int(_4310);
    int _4314 = ~_4298;
    int _4316 = _4314 + 1;
    int _4318 = _4316 + 1;
    int _4320 = _4258 * as_type<int>(_4120);
    int _4322 = _4320 + _4302;
    int _4324 = abs(_3412);
    float _4326 = _4206 * _3856;
    int _4328 = _4252 * as_type<int>(_4154);
    int _4330 = _4328 + _4296;
    int _4332 = abs(_3588);
    float _4334 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4336 = int(_4334);
    int _4338 = ~_4324;
    int _4340 = _4338 + 1;
    int _4342 = _4340 + 1;
    int _4344 = ~_4332;
    int _4346 = _4344 + 1;
    int _4348 = _4346 + 1;
    float _4350 = float(uint(_4286));
    int _4352 = _4318 * as_type<int>(_4194);
    int _4354 = _4352 + _4322;
    int _4356 = abs(_3602);
    int _4358 = _4342 * as_type<int>(_4162);
    int _4360 = _4358 + _4330;
    float _4362 = float(uint(_4312));
    int _4364 = ~_4356;
    int _4366 = _4364 + 1;
    int _4368 = _4366 + 1;
    float _4370 = 1.0 / _4350;
    int _4372 = abs(_4286);
    int _4374 = _4348 * as_type<int>(_4230);
    int _4376 = _4374 + _4290;
    int _4378 = ~_4312;
    int _4380 = _4378 + 1;
    int _4382 = _4308 * as_type<int>(_4202);
    int _4384 = _4382 + _4354;
    int _4386 = ~_4276;
    int _4388 = _4386 + 1;
    int _4390 = _4388 + 1;
    int _4392 = _4368 * as_type<int>(_4238);
    int _4394 = _4392 + _4376;
    bool _4396 = !_3482;
    int _4398 = _4396 ? 0 : 1;
    float _4400 = 1.0 / _4362;
    int _4402 = abs(_4312);
    int _4404 = _4360 * _4390;
    bool _4406 = !_3490;
    int _4408 = _4406 ? 0 : 1;
    int _4410 = abs(_4398);
    float _4412 = float(uint(_4336));
    bool _4414 = !_2234;
    int _4416 = _4414 ? _3926 : (-1);
    float _4418 = 1.0 / _4412;
    int _4420 = abs(_4408);
    int _4422 = ~_4410;
    int _4424 = _4422 + 1;
    int _4426 = _4424 + 1;
    int _4428 = _4416 * _4276;
    int _4430 = _4428 + _4404;
    float _4432 = float(uint(_4372));
    int _4434 = ~_4420;
    int _4436 = _4434 + 1;
    int _4438 = _4436 + 1;
    int _4440 = _4426 * _4384;
    float _4442 = 1.0 / _4432;
    int _4444 = abs(_4336);
    bool _4446 = !_2740;
    int _4448 = _4446 ? _4176 : (-1);
    int _4450 = _4438 * _4394;
    int _4452 = as_type<int>(_4370) + (-2);
    int _4454 = _4282 * _4410;
    int _4456 = _4454 + _4440;
    float _4458 = float(uint(_4430));
    int _4460 = _4448 * _4420;
    int _4462 = _4460 + _4450;
    float _4464 = float(uint(_4402));
    float _4466 = _4144 * _3856;
    float _4468 = float(uint(_4444));
    float _4470 = as_type<float>(_4452) * _4458;
    float _4472 = 1.0 / _4464;
    int _4474 = as_type<int>(_4400) + (-2);
    float _4476 = _4144 * _3950;
    float _4478 = float(uint(_4456));
    float _4480 = float(uint(_4462));
    int _4482 = abs(_4430);
    float _4484 = 1.0 / _4468;
    float _4486 = as_type<float>(_4474) * _4478;
    int _4488 = as_type<int>(_4442) + (-2);
    float _4490 = float(uint(_4482));
    int _4492 = ~_4286;
    int _4494 = _4492 + 1;
    float _4496 = trunc(_4470);
    float _4498 = precise::max(_4496, 0.0);
    uint _4500 = uint(_4498);
    int _4502 = as_type<int>(_4418) + (-2);
    int _4504 = as_type<int>(_4472) + (-2);
    int _4506 = ~_4336;
    int _4508 = _4506 + 1;
    float _4510 = as_type<float>(_4502) * _4480;
    float _4512 = as_type<float>(_4488) * _4490;
    float _4514 = trunc(_4486);
    float _4516 = precise::max(_4514, 0.0);
    uint _4518 = uint(_4516);
    int _4520 = abs(_4462);
    int _4522 = as_type<int>(_4484) + (-2);
    float _4524 = _4204 * _3856;
    float _4526 = float(uint(_4520));
    float _4528 = _4204 * _3950;
    float _4530 = _4206 * _3950;
    float _4532 = trunc(_4510);
    float _4534 = precise::max(_4532, 0.0);
    uint _4536 = uint(_4534);
    int _4538 = abs(_4456);
    int _4540 = _4494 * int(_4500);
    int _4542 = _4540 + _4430;
    float _4544 = as_type<float>(_4522) * _4526;
    float _4546 = _3994 * _4144;
    float _4548 = float(uint(_4538));
    float _4550 = _3994 * _4206;
    float _4552 = float(uint(_4542));
    int _4554 = _4380 * int(_4518);
    int _4556 = _4554 + _4456;
    float _4558 = trunc(_4512);
    float _4560 = precise::max(_4558, 0.0);
    uint _4562 = uint(_4560);
    float _4564 = as_type<float>(_4504) * _4548;
    float _4566 = fma(_4208, _3854, _4524);
    float _4568 = as_type<float>(_4452) * _4552;
    float _4570 = float(uint(_4556));
    float _4572 = fma(_4184, _3854, _4466);
    int _4574 = ~_4372;
    int _4576 = _4574 + 1;
    int _4578 = _4508 * int(_4536);
    int _4580 = _4578 + _4462;
    float _4582 = trunc(_4564);
    float _4584 = precise::max(_4582, 0.0);
    uint _4586 = uint(_4584);
    float _4588 = as_type<float>(_4474) * _4570;
    float _4590 = fma(_4214, _3854, _4326);
    float _4592 = fma(_4214, _3958, _4530);
    float _4594 = float(uint(_4580));
    float _4596 = fma(_3992, _4214, _4550);
    int _4598 = ~_4402;
    int _4600 = _4598 + 1;
    float _4602 = trunc(_4544);
    float _4604 = precise::max(_4602, 0.0);
    uint _4606 = uint(_4604);
    int _4608 = ~_4444;
    int _4610 = _4608 + 1;
    float _4612 = as_type<float>(_4502) * _4594;
    float _4614 = fma(_4208, _3958, _4528);
    int _4616 = _4576 * int(_4562);
    int _4618 = _4616 + _4482;
    float _4620 = fma(_3992, _4208, _4300);
    float _4622 = fma(_4210, _3972, _4614);
    float _4624 = trunc(_4568);
    float _4626 = precise::max(_4624, 0.0);
    uint _4628 = uint(_4626);
    int _4630 = _4600 * int(_4586);
    int _4632 = _4630 + _4538;
    float _4634 = fma(_4184, _3958, _4476);
    float _4636 = fma(_3992, _4184, _4546);
    float _4638 = float(uint(_4618));
    float _4640 = float(uint(_4632));
    float _4642 = trunc(_4588);
    float _4644 = precise::max(_4642, 0.0);
    uint _4646 = uint(_4644);
    int _4648 = _4610 * int(_4606);
    int _4650 = _4648 + _4520;
    float _4652 = as_type<float>(_4488) * _4638;
    float _4654 = as_type<float>(_4504) * _4640;
    int _4656 = ~_4312;
    int _4658 = _4656 + 1;
    int _4660 = int(_4500) + int(_4628);
    float _4662 = trunc(_4652);
    float _4664 = precise::max(_4662, 0.0);
    uint _4666 = uint(_4664);
    float _4668 = float(uint(_4650));
    int _4670 = ~_4286;
    int _4672 = _4670 + 1;
    float _4674 = as_type<float>(_4522) * _4668;
    int _4676 = int(_4518) + int(_4646);
    float _4678 = trunc(_4612);
    float _4680 = precise::max(_4678, 0.0);
    uint _4682 = uint(_4680);
    float _4684 = fma(_4210, _3858, _4566);
    float _4686 = fma(_4242, _3858, _4572);
    float _4688 = fma(_4246, _3858, _4590);
    int _4690 = _4658 * _4676;
    int _4692 = _4690 + _4456;
    int _4694 = ~_4444;
    int _4696 = _4694 + 1;
    int _4698 = _4672 * _4660;
    int _4700 = _4698 + _4430;
    float _4702 = trunc(_4654);
    float _4704 = precise::max(_4702, 0.0);
    uint _4706 = uint(_4704);
    int _4708 = int(_4562) + int(_4666);
    out.m_85.x = _4684;
    out.m_85.y = _4686;
    out.m_85.z = _4688;
    bool _4710 = uint(_4692) >= uint(_4312);
    bool _4712 = uint(_4700) >= uint(_4286);
    int _4714 = ~_4402;
    int _4716 = _4714 + 1;
    float _4718 = trunc(_4674);
    float _4720 = precise::max(_4718, 0.0);
    uint _4722 = uint(_4720);
    int _4724 = int(_4536) + int(_4682);
    int _4726 = ~_4336;
    int _4728 = _4726 + 1;
    bool _4730 = _1318 <= 8000.0;
    bool _4732 = isnan(_1318);
    bool _4734 = _4730 || _4732;
    bool _4736 = isnan(8000.0);
    bool _4738 = _4734 || _4736;
    float _4740 = float(_4738);
    int _4742 = int(_4586) + int(_4706);
    int _4744 = ~_4372;
    int _4746 = _4744 + 1;
    int _4748 = _4746 * _4708;
    int _4750 = _4748 + _4482;
    int _4752 = int(_4606) + int(_4722);
    int _4754 = _4716 * _4742;
    int _4756 = _4754 + _4538;
    int _4758 = _4728 * _4724;
    int _4760 = _4758 + _4462;
    bool _4762 = uint(_4750) >= uint(_4372);
    float _4764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4766 = !_4712;
    int _4768 = _4766 ? 0 : (-1);
    int _4770 = _4696 * _4752;
    int _4772 = _4770 + _4520;
    bool _4774 = uint(_4756) >= uint(_4402);
    bool _4776 = uint(_4760) >= uint(_4336);
    bool _4778 = !_4710;
    int _4780 = _4778 ? 0 : (-1);
    float _4782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4784 = ~_4660;
    int _4786 = _4784 + _4768;
    int _4788 = _4786 + 1;
    int _4790 = ~_4676;
    int _4792 = _4790 + _4780;
    int _4794 = _4792 + 1;
    bool _4796 = !_4776;
    int _4798 = _4796 ? 0 : (-1);
    bool _4800 = _4286 == 0;
    bool _4802 = _4286 == 0;
    int _4804 = _4430 ^ _4286;
    int _4806 = _4286 * _4788;
    int _4808 = _4806 + _4430;
    bool _4810 = !_4762;
    int _4812 = _4810 ? 0 : (-1);
    float _4814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4816 = !_4774;
    int _4818 = _4816 ? 0 : (-1);
    bool _4820 = uint(_4772) >= uint(_4444);
    bool _4822 = _4312 == 0;
    bool _4824 = _4312 == 0;
    float _4826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4828 = _4456 ^ _4312;
    int _4830 = _4312 * _4794;
    int _4832 = _4830 + _4456;
    int _4834 = ~_4724;
    int _4836 = _4834 + _4798;
    int _4838 = _4836 + 1;
    bool _4840 = !_4800;
    int _4842 = _4840 ? _4808 : (-1);
    bool _4844 = !_4822;
    int _4846 = _4844 ? _4832 : (-1);
    float _4848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4850 = ~_4812;
    int _4852 = _4708 + _4850;
    int _4854 = _4852 + 1;
    int _4856 = _4336 * _4838;
    int _4858 = _4856 + _4462;
    bool _4860 = _4336 == 0;
    float _4862 = _4814 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _4864 = _4336 == 0;
    int _4866 = _4462 ^ _4336;
    float _4868 = _4764 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4870 = float(_4842);
    float _4872 = _4826 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _4874 = uint(int(uint(_4804) >> uint(31)));
    float _4876 = fma(_4868, _2394, -0.5);
    uint _4878 = uint(int(uint(_4828) >> uint(31)));
    float _4880 = fma(_4868, _4870, _784);
    bool _4882 = !_4860;
    int _4884 = _4882 ? _4858 : (-1);
    float _4886 = _4848 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4888 = ~int(_4874);
    int _4890 = _4888 + 1;
    float _4892 = fma(_4872, _2462, -0.5);
    float _4894 = float(_4846);
    float _4896 = fma(_4886, _2504, -0.5);
    float _4898 = float(_4884);
    float _4900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4902 = ~_4818;
    int _4904 = _4742 + _4902;
    int _4906 = _4904 + 1;
    float _4908 = fma(_4872, _4894, _1032);
    int _4910 = ~int(_4878);
    int _4912 = _4910 + 1;
    float _4914 = fma(_4886, _4898, _874);
    int _4916 = _4854 ^ _4890;
    float _4918 = _4782 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4920 = _4906 ^ _4912;
    float _4922 = fma(_1186, _4892, _4908);
    int _4924 = ~_4890;
    int _4926 = _4924 + _4916;
    int _4928 = _4926 + 1;
    float _4930 = fma(_2840, _4862, -0.5);
    int _4932 = ~_4912;
    int _4934 = _4932 + _4920;
    int _4936 = _4934 + 1;
    float _4938 = fma(_1112, _4876, _4880);
    bool _4940 = !_4802;
    int _4942 = _4940 ? _4928 : (-1);
    float _4944 = fma(_1206, _4896, _4914);
    bool _4946 = !_4824;
    int _4948 = _4946 ? _4936 : (-1);
    float _4950 = _4900 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4952 = float(_4942);
    float _4954 = _4944 + 0.5;
    bool _4956 = !_4820;
    int _4958 = _4956 ? 0 : (-1);
    float _4960 = fma(_4950, _2880, -0.5);
    uint _4962 = uint(int(uint(_4866) >> uint(31)));
    float _4964 = -_788;
    float _4966 = fma(_4918, _4952, _4964);
    float _4968 = float(_4948);
    float _4970 = fma(_2632, _4918, -0.5);
    int _4972 = ~_4958;
    int _4974 = _4752 + _4972;
    int _4976 = _4974 + 1;
    float _4978 = fma(_3996, _4210, _4620);
    int _4980 = ~int(_4962);
    int _4982 = _4980 + 1;
    float _4984 = fma(_1124, _4970, _4966);
    float _4986 = fma(_3996, _4242, _4636);
    float _4988 = fma(_3996, _4246, _4596);
    int _4990 = _4976 ^ _4982;
    float _4992 = -_4112;
    float _4994 = _4992 + 1.0;
    float _4996 = -_1212;
    float _4998 = fma(_4862, _4968, _4996);
    float _5000 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _5002 = ~_4982;
    int _5004 = _5002 + _4990;
    int _5006 = _5004 + 1;
    float _5008 = fma(_4994, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4112);
    out.m_87.x = _4978;
    out.m_87.y = _4986;
    out.m_87.z = _4988;
    float _5010 = _5000 * _2101;
    bool _5012 = !_4864;
    int _5014 = _5012 ? _5006 : (-1);
    float _5016 = _4740 * _5008;
    float _5018 = _4740;
    if (!_1985)
    {
        _5018 = 1.0;
    }
    float _5020 = _5018;
    float _5022 = fma(_1210, _4930, _4998);
    float _5024 = float(_5014);
    float _5026 = _3376 * _5010;
    float _5028 = _5020;
    if (_1985)
    {
        bool _5030 = _2099 >= _2053;
        bool _5032 = isnan(_2099);
        bool _5034 = _5030 || _5032;
        bool _5036 = isnan(_2053);
        bool _5038 = _5034 || _5036;
        float _5040 = float(_5038);
        _5028 = _5040;
    }
    float _5042 = _5028;
    float _5044 = _5022 + 0.5;
    float _5046 = fma(_4246, _3972, _4592);
    float _5048 = -_1214;
    float _5050 = fma(_4950, _5024, _5048);
    float _5052 = _5016 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5054 = fma(_1995, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3440);
    float _5056 = _5042 * _3094;
    float _5058 = fma(_1208, _4960, _5050);
    float _5060 = _3426 * _5052;
    float _5062 = precise::clamp(_5060, 0.0, 1.0);
    float _5064 = _5054 + _2007;
    out.gl_Position.x = _2027;
    out.gl_Position.y = _2031;
    out.gl_Position.z = _5054;
    out.gl_Position.w = _2007;
    float _5066 = _4938 + 0.5;
    float _5068 = -_5062;
    float _5070 = fma(_5068, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5072 = _4922 + 0.5;
    float _5074 = _4984 + 0.5;
    float _5076 = _5058 + 0.5;
    float _5078 = -_5056;
    float _5080 = fma(_5078, _5070, 1.0);
    float _5082 = precise::clamp(_5080, 0.0, 1.0);
    float _5084 = fma(_4242, _3972, _4634);
    float _5086 = _5064 * 0.5;
    float _5088 = _5082 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5090 = fma(_2112, _5026, _2110);
    out.m_89.x = _5066;
    out.m_89.y = _5074;
    out.m_89.z = _5072;
    out.m_89.w = _5044;
    bool _5092 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5094 = isnan(_3124);
    bool _5096 = _5092 || _5094;
    bool _5098 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5100 = _5096 || _5098;
    float _5102 = _2112 * _5010;
    float _5104 = -_5000;
    float _5106 = _5104 + 1.0;
    out.m_91.x = _4954;
    out.m_91.y = _5076;
    float _5108 = fma(_3372, _5102, _2106);
    float _5110 = fma(_3374, _5102, _2108);
    float _5112 = _2112 * _5106;
    out.m_93.z = _5086;
    out.m_93.w = _2007;
    out.m_95.x = _5088;
    float _5114 = _5054;
    float _5116 = _5102;
    float _5118 = _5106;
    if (!_5100)
    {
        _5114 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5120 = _5114;
    float _5122 = _5120;
    float _5124 = _5120;
    if (!_5100)
    {
        _5116 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5126 = _5116;
    out.m_97.x = _5108;
    out.m_97.y = _5110;
    out.m_97.z = _5090;
    out.m_97.w = _5112;
    float _5128 = _5126;
    float _5130 = _5126;
    if (!_5100)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5132 = _5118;
    out.m_99.x = _4622;
    out.m_99.y = _5084;
    out.m_99.z = _5046;
    bool _5134 = !_5100;
    float _5136 = _5132;
    float _5138 = _5132;
    if (!_5134)
    {
        bool _5140 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5142 = isnan(_3124);
        bool _5144 = _5140 || _5142;
        bool _5146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5148 = _5144 || _5146;
        if (!_5148)
        {
            float _5150 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5152 = _3124 + _5150;
            float _5154 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5156 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5154;
            float _5158 = 1.0 / _5156;
            float _5160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5162 = _5160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5164 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5166 = _5164 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5168 = _5152 * _5158;
            float _5170 = precise::clamp(_5168, 0.0, 1.0);
            float _5172 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5174 = _5172 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5176 = fma(_5170, _5166, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5178 = fma(_5170, _5174, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5180 = fma(_5170, _5162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _5130 = _5180;
            _5124 = _5178;
            _5138 = _5176;
            _5182 = true;
        }
        else
        {
            bool _5184 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5186 = isnan(_3124);
            bool _5188 = _5184 || _5186;
            bool _5190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5192 = _5188 || _5190;
            if (!_5192)
            {
                _5122 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5194 = _5122;
            _5124 = _5194;
            if (!_5192)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5196 = _5128;
            _5130 = _5196;
            if (!_5192)
            {
                _5136 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5198 = _5136;
            bool _5200 = !_5192;
            _5138 = _5198;
            if (!_5200)
            {
                bool _5202 = _3124 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5204 = isnan(_3124);
                bool _5206 = _5202 || _5204;
                bool _5208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5210 = _5206 || _5208;
                if (!_5210)
                {
                    float _5212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5214 = _3124 + _5212;
                    float _5216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5216;
                    float _5220 = 1.0 / _5218;
                    float _5222 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5224 = _5222 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5228 = _5226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5230 = _5214 * _5220;
                    float _5232 = precise::clamp(_5230, 0.0, 1.0);
                    float _5234 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5236 = _5234 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5238 = fma(_5232, _5228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5240 = fma(_5232, _5236, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5242 = fma(_5232, _5224, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _5130 = _5242;
                    _5124 = _5240;
                    _5138 = _5238;
                    _5182 = true;
                }
                else
                {
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5124 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5138 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5182 = false;
    float _5244 = _5130;
    float _5246 = _5124;
    float _5248 = _5138;
    float _5250 = _5244 * 0.586610972881317138671875;
    bool _5252 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = 1.0;
    float _5254 = fma(_5246, 0.298911988735198974609375, _5250);
    out.m_101.x = 0.0;
    float _5256 = fma(_5248, 0.114477999508380889892578125, _5254);
    float _5258 = -_5256;
    float _5260 = _5258 + _5246;
    float _5262 = -_5256;
    float _5264 = _5262 + _5244;
    float _5266 = -_5256;
    float _5268 = _5266 + _5248;
    float _5270 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5272 = fma(_5260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    float _5274 = fma(_5264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    float _5276 = fma(_5268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5256);
    out.m_95.w = _5270;
    out.m_103.x = _5272;
    out.m_103.y = _5274;
    out.m_103.z = _5276;
    if (!_5252)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5278 = -_1901;
    float _5280 = _5278 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5282 = -_1903;
    float _5284 = _5282 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5286 = -_1905;
    float _5288 = _5286 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5290 = _5280 * _5280;
    float _5292 = fma(_5284, _5284, _5290);
    float _5294 = fma(_5288, _5288, _5292);
    float _5296 = sqrt(_5294);
    float _5298 = rsqrt(_5294);
    float _5300 = -_5296;
    float _5302 = _5300 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5304 = _5302 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5306 = precise::clamp(_5304, 0.0, 1.0);
    float _5308 = _5284 * _5298;
    float _5310 = _5280 * _5298;
    float _5312 = abs(_5306);
    float _5314 = log2(_5312);
    float _5316 = _5288 * _5298;
    float _5318 = _5308 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5320 = _5084 * _5310;
    float _5322 = -_5310;
    float _5324 = -_5318;
    float _5326 = fma(_5322, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5324);
    float _5328 = fma(_4622, _5308, _5320);
    float _5330 = -_5316;
    float _5332 = fma(_5330, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5326);
    float _5334 = fma(_5046, _5316, _5328);
    float _5336 = precise::clamp(_5334, 0.0, 1.0);
    float _5338 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5340 = _5332 + _5338;
    float _5342 = _5314 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5344 = _5340 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5346 = precise::clamp(_5344, 0.0, 1.0);
    float _5348 = exp2(_5342);
    float _5350 = _5348 * _5346;
    float _5352 = _5336 * _5350;
    float _5354 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5356 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5358 = _5352 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5354;
    out.m_101.y = _5356;
    out.m_101.z = _5358;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

