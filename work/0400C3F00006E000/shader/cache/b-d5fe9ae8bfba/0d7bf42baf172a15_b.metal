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
    float4 m_81 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_75 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 m_103 [[user(locn14)]];
    float4 m_99 [[user(locn15)]];
    float4 m_101 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    float _136 = _134;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_128)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_142);
        out.gl_Position.z = _2535;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_124);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
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
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_176);
        out.gl_Position.z = _2603;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_63.w;
    float _180 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = in.m_61.x;
    float _194 = in.m_61.y;
    float _196 = in.m_61.z;
    float _198 = in.m_56.x;
    float _200 = in.m_56.y;
    float _202 = in.m_56.z;
    float _204 = 0.0;
    float _206 = _180;
    if (!_190)
    {
        float _208 = _180 * _180;
        float _210 = _208 * 0.5;
        _204 = _210;
    }
    float _212 = _204;
    float _214 = _212;
    if (!_190)
    {
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    bool _220 = !_190;
    float _222 = _218;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _180 * _226;
        float _236 = exp2(_234);
        float _238 = _232 * 0.693147182464599609375;
        float _240 = 1.0 / _238;
        float _242 = 1.0 / _230;
        float _244 = _236 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _240, _180);
        float _250 = _248 * _242;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_190;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _180 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _206 = _276;
    }
    float _278 = _206;
    float _280 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _282 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_278, _194, _280);
    float _288 = fma(_278, _192, _282);
    float _290 = fma(_278, _196, _284);
    float _292 = fma(_286, _178, _200);
    float _294 = fma(_288, _178, _198);
    float _296 = fma(_290, _178, _202);
    float _298 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _298);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _310 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _312 = _308 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _314 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _316 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _318 = floor(_314);
    float _320 = floor(_316);
    float _322 = -_318;
    float _324 = _314 + _322;
    float _326 = -_320;
    float _328 = _316 + _326;
    float2 _2852 = float2(_324, _328);
    float _330 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2852, float2(0.0), isnan(_2852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2852, float2(0.0), isnan(_2852)), level(0.0)).x;
    float _332 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = in.m_65.x;
    float _336 = in.m_65.y;
    float _338 = in.m_65.z;
    float _340 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _342 = in.m_67.y;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _346 = _344 != 0;
    float _348 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _350 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _352 = _350 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _354 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _352);
    float _356 = 0.0;
    int _358 = 2;
    if (_346)
    {
        float _360 = in.m_67.x;
        _356 = _360;
    }
    float _362 = _356;
    int _364 = 0;
    int _366 = 0;
    if (_346)
    {
        _364 = 0;
        _366 = 0;
    }
    int _368 = _364;
    int _370 = _366;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].z, _354);
    float _374 = _350 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _376 = _372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _378 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _374);
    float _380 = 0.0;
    int _382 = _368;
    int _384 = _370;
    float _386 = _342;
    if (_346)
    {
        _380 = _342;
    }
    float _388 = _380;
    float _390 = 1.0 / _376;
    float _392 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].z, _378);
    float _394 = _392 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _396 = _394 + _376;
    float _398 = 0.0;
    float _400 = _388;
    float _402 = _362;
    if (_346)
    {
        _398 = _362;
    }
    float _404 = _398;
    float _406 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _408 = _396 * _390;
    float _410 = _408 * 0.5;
    float _412 = _350 + _406;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _416 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _414);
    float _418 = in.m_63.x;
    float _420 = in.m_63.y;
    float _422 = in.m_63.z;
    float _424 = _412 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _426 = 1.0 / _416;
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _424);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[127].z, _428);
    float _432 = _430 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _434 = trunc(_432);
    int _436 = int(_434);
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _440 = _426 * _438;
    bool _442 = _440 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _444 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _446 = _440 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _448 = _418 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _450 = !_442;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _336);
    float _456 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _460 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _462 = _454 * _456;
    float _464 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _468 = _404;
    if (!_442)
    {
        _358 = 1;
    }
    int _470 = _358;
    float _472 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _474 = _470;
    if (!_446)
    {
        _474 = _452;
    }
    int _476 = _474;
    float _478 = _412 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _480 = _464 * _458;
    float _482 = _462 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _484 = _476 << 6;
    float _486 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _478);
    float _488 = _466 * _472;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _482);
    int _492 = _484 + 96;
    uint _495 = uint(int(uint(_492) >> uint(2)));
    uint _497 = uint(int(uint(int(_495)) >> uint(2)));
    int _499 = int(_495) & 3;
    float _501 = (*spvDescriptorSet0.vp_c15)._m0[int(_497)][_499];
    int _503 = int(_495) + 1;
    uint _505 = uint(int(uint(_503) >> uint(2)));
    int _507 = _503 & 3;
    float _509 = (*spvDescriptorSet0.vp_c15)._m0[int(_505)][_507];
    float _511 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[126].z, _486);
    float _513 = _462 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _515 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _517 = _436 + _515;
    int _519 = _517 + 1;
    float _521 = _462 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _523 = _511 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _525 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _513);
    int _527 = _484 + 104;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    uint _531 = uint(int(uint(int(_529)) >> uint(2)));
    int _533 = int(_529) & 3;
    float _535 = (*spvDescriptorSet0.vp_c15)._m0[int(_531)][_533];
    int _537 = int(_529) + 1;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    int _541 = _537 & 3;
    float _543 = (*spvDescriptorSet0.vp_c15)._m0[int(_539)][_541];
    float _545 = trunc(_523);
    int _547 = int(_545);
    float _549 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[10].z, _525);
    float _551 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[8].z, _490);
    float _553 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _521);
    float _555 = _312 + _549;
    float _557 = _310 + _551;
    int _559 = _484 + 48;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    uint _563 = uint(int(uint(int(_561)) >> uint(2)));
    int _565 = int(_561) & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    int _569 = int(_561) + 1;
    uint _571 = uint(int(uint(_569) >> uint(2)));
    int _573 = _569 & 3;
    float _575 = (*spvDescriptorSet0.vp_c15)._m0[int(_571)][_573];
    float _577 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[9].z, _553);
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _557 + _579;
    int _583 = _484 + 64;
    uint _585 = uint(int(uint(_583) >> uint(2)));
    uint _587 = uint(int(uint(int(_585)) >> uint(2)));
    int _589 = int(_585) & 3;
    float _591 = (*spvDescriptorSet0.vp_c15)._m0[int(_587)][_589];
    int _593 = int(_585) + 1;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    int _597 = _593 & 3;
    float _599 = (*spvDescriptorSet0.vp_c15)._m0[int(_595)][_597];
    int _601 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _603 = _547 + _601;
    int _605 = _603 + 1;
    float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _609 = _555 + _607;
    bool _611 = _605 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _613 = _609 * _609;
    int _615 = _605 | _519;
    int _617 = _484 + 56;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.vp_c15)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    bool _635 = _615 < 0;
    bool _637 = _635 || _611;
    float _639 = fma(_581, _581, _613);
    bool _641 = _519 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _643 = _641 || _637;
    int _645 = _484 + 72;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.vp_c15)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.vp_c15)._m0[int(_657)][_659];
    int _663 = _484 + 80;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.vp_c15)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.vp_c15)._m0[int(_675)][_677];
    float _681 = _412 * _509;
    float _683 = sqrt(_639);
    int _685 = as_type<int>(_480);
    int _687 = as_type<int>(_553);
    float _689 = _555;
    int _691 = as_type<int>(_639);
    float _693 = _523;
    if (!_643)
    {
        int _695 = _519 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _697 = _695 + _605;
        _685 = _697;
    }
    int _699 = _685;
    float _701 = fma(_310, _501, _681);
    float _703 = fma(_312, _535, _701);
    float _705 = _703 + _543;
    float _707 = _412 * _575;
    bool _709 = _683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _711 = fma(_310, _567, _707);
    float _713 = 1.0 / _705;
    float _715 = _412 * _599;
    float _717 = _350 + _577;
    float _719 = fma(_310, _591, _715);
    float _721 = fma(_312, _625, _711);
    float _723 = fma(_312, _653, _719);
    float _725 = _591;
    int _727 = as_type<int>(_719);
    float _729 = _717;
    float _731 = 1.0;
    if (!_346)
    {
        float _733 = in.m_67.x;
        float _735 = _342 * 3.1415927410125732421875;
        float _737 = _735 * 0.15915493667125701904296875;
        float _739 = _737 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = _733 * 3.1415927410125732421875;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = sin(_747);
        _382 = 1;
        _384 = 2;
        _468 = _749;
        _400 = _741;
        _402 = _733;
    }
    int _751 = _382;
    int _753 = _384;
    float _755 = _468;
    float _757 = _400;
    float _759 = _402;
    if (!_643)
    {
        int _761 = _699 << 2;
        _687 = _761;
    }
    int _763 = _687;
    int _765 = _763;
    if (!_709)
    {
        _725 = _557;
    }
    float _767 = _725;
    float _769 = _767;
    if (!_643)
    {
        uint _771 = uint(int(uint(_699) >> uint(2)));
        _727 = int(_771);
    }
    int _773 = _727;
    if (!_643)
    {
        int _775 = 12 & _763;
        _765 = _775;
    }
    int _777 = _765;
    bool _779 = !_709;
    if (!_779)
    {
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _785 = _683 + _783;
        float _787 = rsqrt(_639);
        float _789 = _785 * _781;
        float _791 = _717 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = _789 * 0.15915493667125701904296875;
        float _795 = _793 * 6.283185482025146484375;
        float _797 = cos(_795);
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        float _803 = _797 + (-1.0);
        float _805 = _803 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = fma(_801, _791, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _809 = fma(_717, _797, _805);
        float _811 = _787 * _807;
        float _813 = fma(_581, _811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _815 = fma(_609, _811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _729 = _809;
        _769 = _813;
        _689 = _815;
        _691 = as_type<int>(_787);
    }
    float _817 = _729;
    float _819 = _769;
    float _821 = _689;
    int _823 = _691;
    float _825 = _817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _827 = _823;
    if (!_643)
    {
        int _829 = _773 << 4;
        int _831 = _829 + _777;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _721 + _633;
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _825);
    int _841 = _484 + 88;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.vp_c15)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[int(_853)][_855];
    float _859 = _723 + _661;
    float _861 = _817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _863 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _837);
    float _865 = _835 * _713;
    float _867 = _817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _861);
    float _871 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _863);
    float _873 = _825;
    if (!_643)
    {
        int _875 = _833 + 400;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        uint _879 = uint(int(uint(int(_877)) >> uint(2)));
        int _881 = int(_877) & 3;
        float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
        _873 = _883;
    }
    float _885 = _873;
    bool _887 = _865 >= 0.0;
    float _889 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _869);
    float _891 = _871 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _893 = _859 * _713;
    float _895 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _839);
    bool _897 = _865 <= 1.0;
    bool _899 = _897 && _887;
    float _901 = _889 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _903 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _867);
    float _905 = _891 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _907 = _895 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _909 = _893 >= 0.0;
    bool _911 = _909 && _899;
    float _913 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _903);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _905);
    float _917 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _919 = _907 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _921 = _893 <= 1.0;
    bool _923 = _921 && _911;
    float _925 = _913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _927 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[7].z, _915);
    float _929 = -_919;
    float _931 = fma(_929, _917, 1.0);
    float _933 = _891 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _935 = _891 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[7].w, _927);
    float _939 = _412 * _679;
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _933);
    float _943 = log2(_931);
    float _945 = fma(_310, _671, _939);
    float _947 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[4].z, _941);
    float _949 = _895;
    if (_923)
    {
        float _951 = float(_476);
        _949 = _951;
    }
    float _953 = _949;
    float _955 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _935);
    float _957 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[4].w, _947);
    float _959 = 1.0 / _937;
    float _961 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[5].z, _955);
    float _963 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[5].w, _961);
    float _965 = fma(_312, _849, _945);
    float _967 = _723;
    if (!_643)
    {
        float _969 = floor(_523);
        _967 = _969;
    }
    float _971 = _967;
    float _973 = _943 * 0.693147182464599609375;
    float _975 = _965 + _857;
    float _977 = _973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _979 = _975 * _713;
    float _981 = _581;
    float _983 = _979;
    if (!_643)
    {
        float _985 = floor(_432);
        _981 = _985;
    }
    float _987 = _981;
    float _989 = _957 * _959;
    float _991 = _963 * _959;
    float _993 = fma(_989, 0.5, 0.5);
    float _995 = fma(_991, -0.5, 0.5);
    float _997 = _939;
    float _999 = _991;
    if (_923)
    {
        float _1001 = rint(_953);
        float _1003 = precise::max(_1001, 0.0);
        uint _1005 = uint(_1003);
        uint _1007 = clamp(_1005, 0u, 65535u);
        _997 = as_type<float>(_1007);
    }
    float _1009 = _997;
    if (!_643)
    {
        float _1011 = -_971;
        float _1013 = _523 + _1011;
        _693 = _1013;
    }
    float _1015 = _693;
    float _1017 = _941;
    float _1019 = _1015;
    if (!_643)
    {
        float _1021 = rint(_885);
        float _1023 = precise::max(_1021, 0.0);
        uint _1025 = uint(_1023);
        uint _1027 = clamp(_1025, 0u, 65535u);
        _1017 = as_type<float>(_1027);
    }
    float _1029 = _1017;
    float _1031 = _987;
    if (!_643)
    {
        float _1033 = -_987;
        float _1035 = _432 + _1033;
        _1031 = _1035;
    }
    float _1037 = _1031;
    float _1039 = _989;
    float _1041 = _1009;
    if (_923)
    {
        float3 _4028 = float3(_865, _893, float(as_type<int>(_1009)));
        float3 _4032 = select(_4028, float3(0.0), isnan(_4028));
        float _1043 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4032.xy, uint(rint(_4032.z)), _979, level(0.0));
        _1039 = _1043;
    }
    float _1045 = _1039;
    float3 _4042 = float3(_993, _995, _977);
    float _1047 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4042, float3(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4042, float3(0.0), isnan(_4042)), level(0.0)).x;
    float3 _4051 = float3(_993, _995, _977);
    float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4051, float3(0.0), isnan(_4051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4051, float3(0.0), isnan(_4051)), level(0.0)).xyzw;
    float _1052 = _1050.x;
    float _1054 = _1050.y;
    float _1056 = _1050.z;
    float _1058 = _1050.w;
    float _1060 = _953;
    if (!_643)
    {
        float3 _4074 = float3(_1015, _1037, float(as_type<int>(_1029)));
        float3 _4076 = select(_4074, float3(0.0), isnan(_4074));
        float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4076.xy, uint(rint(_4076.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4076.xy, uint(rint(_4076.z)), level(0.0)).x;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (_643)
    {
        _999 = 1.0;
    }
    float _1066 = _999;
    float _1068 = _1066;
    float _1070 = _1045;
    float _1072 = _1047;
    if (!_643)
    {
        int _1074 = _699 << 4;
        int _1076 = _1074 + 2048;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
        int _1082 = int(_1078) & 3;
        float _1084 = (*spvDescriptorSet0.vp_c15)._m0[int(_1080)][_1082];
        int _1086 = int(_1078) + 1;
        uint _1088 = uint(int(uint(_1086) >> uint(2)));
        int _1090 = _1086 & 3;
        float _1092 = (*spvDescriptorSet0.vp_c15)._m0[int(_1088)][_1090];
        int _1094 = _1076 + 8;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
        int _1100 = int(_1096) & 3;
        float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
        int _1104 = int(_1096) + 1;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        int _1108 = _1104 & 3;
        float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
        float _1112 = _412 * _1092;
        float _1114 = fma(_310, _1084, _1112);
        float _1116 = fma(_312, _1102, _1114);
        float _1118 = _1116 + _1110;
        float _1120 = precise::clamp(_1118, 0.0, 1.0);
        float _1122 = -_1120;
        float _1124 = _1122 + _1064;
        float _1126 = fma(_1124, 500.0, 1.5);
        float _1128 = exp2(_1126);
        float _1130 = 0.0 + _1128;
        float _1132 = precise::clamp(_1130, 0.0, 1.0);
        _1019 = _1110;
        _1068 = _1132;
    }
    float _1134 = _1019;
    float _1136 = _1068;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _817 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1144 = _819 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _821 + _1146;
    float _1150 = in.m_69.x;
    float _1152 = _1140 * _1140;
    float _1154 = in.m_67.w;
    float _1156 = fma(_1144, _1144, _1152);
    float _1158 = in.m_67.z;
    float _1160 = fma(_1148, _1148, _1156);
    float _1162 = rsqrt(_1160);
    float _1164 = sqrt(_1160);
    float _1166 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1168 = _1144 * _1166;
    float _1170 = _1148 * _1166;
    float _1172 = _1168 * _1168;
    float _1174 = _1170 * _1170;
    float _1176 = _1172 + _1174;
    float _1178 = sqrt(_1176);
    bool _1180 = _1178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1184 = _1178 + _1182;
    float _1186 = _1148;
    float _1188 = _1162;
    float _1190 = _1184;
    float _1192 = _1166;
    bool _1194 = _1180;
    float _1196 = _1158;
    if (_1180)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1198;
    }
    float _1200 = _1186;
    if (_1180)
    {
        float _1202 = rsqrt(_1176);
        _1188 = _1202;
    }
    float _1204 = _1188;
    float _1206 = _1204;
    if (_1180)
    {
        float _1208 = _1184 * _1200;
        _1190 = _1208;
    }
    float _1210 = _1190;
    if (_1180)
    {
        float _1212 = _1210 * 0.15915493667125701904296875;
        _1041 = _1212;
    }
    float _1214 = _1041;
    float _1216 = _1200;
    float _1218 = _1214;
    if (_1180)
    {
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        _1216 = _1222;
    }
    float _1224 = _1216;
    float _1226 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1228 = precise::max(0.0, _1226);
    float _1230 = _1134;
    float _1232 = _1228;
    if (_1180)
    {
        float _1234 = _1214 * 6.283185482025146484375;
        float _1236 = cos(_1234);
        _1230 = _1236;
    }
    float _1238 = _1230;
    float _1240 = -_1166;
    float _1242 = -_1228;
    float _1244 = fma(_1140, _1240, _1242);
    float _1246 = _1244;
    if (_1180)
    {
        float _1248 = _1244 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1248;
    }
    float _1250 = _1232;
    float _1252 = _1224;
    float _1254 = _1250;
    if (_1180)
    {
        float _1256 = fma(_1224, _1250, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = _1258;
    float _1262 = _1238;
    if (_1180)
    {
        float _1264 = _1238 + (-1.0);
        _1254 = _1264;
    }
    float _1266 = _1254;
    float _1268 = _1266;
    if (_1180)
    {
        float _1270 = _1204 * _1258;
        _1192 = _1270;
    }
    float _1272 = _1192;
    if (!_1180)
    {
        _1260 = _1168;
    }
    float _1274 = _1260;
    float _1276 = _1274;
    if (_1180)
    {
        float _1278 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1278;
    }
    float _1280 = _1218;
    if (_1180)
    {
        float _1282 = _1168 * _1272;
        _1276 = _1282;
    }
    float _1284 = _1276;
    if (!_1180)
    {
        _1268 = _1170;
    }
    float _1286 = _1268;
    float _1288 = _1286;
    if (_1180)
    {
        float _1290 = _1170 * _1272;
        _1288 = _1290;
    }
    float _1292 = _1288;
    if (!_1180)
    {
        _1206 = _1172;
    }
    float _1294 = _1206;
    float _1296 = _1294;
    if (_1180)
    {
        float _1298 = fma(_1244, _1238, _1280);
        _1246 = _1298;
    }
    float _1300 = _1246;
    if (_1180)
    {
        float _1302 = _1284 * _1284;
        _1296 = _1302;
    }
    float _1304 = _1296;
    if (!_1180)
    {
        _1262 = _1174;
    }
    float _1306 = _1262;
    float _1308 = _1306;
    if (_1180)
    {
        float _1310 = _1292 * _1292;
        _1308 = _1310;
    }
    float _1312 = _1308;
    float _1314 = fma(_1300, _1300, _1304);
    float _1316 = in.m_69.y;
    float _1318 = _1314 + _1312;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1322 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1320);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = -_1324;
    float _1328 = _1326 + 1.0;
    float _1330 = rsqrt(_1318);
    float _1332 = _1330 * _1284;
    float _1334 = _1330 * _1300;
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1338 = _1330 * _1292;
    float _1340 = abs(_1328);
    float _1342 = log2(_1340);
    float _1344 = -_1336;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1344);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1350 = _1348 != 0;
    float _1352 = -_1338;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1346);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1358 = _1356 != 0;
    float _1360 = fma(_1354, -0.5, 0.5);
    float _1362 = fma(_1354, 0.5, 0.5);
    float _1364 = fma(_1362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = sqrt(_1360);
    float _1368 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1370 = _1174;
    float _1372 = _1368;
    if (_1350)
    {
        float _1374 = in.m_67.x;
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = fma(_1362, _1364, -0.212114393711090087890625);
    float _1380 = _1334 + 1.0;
    float _1382 = fma(_1362, _1378, 1.570728778839111328125);
    float _1384 = exp2(_1368);
    float _1386 = _1366 * 0.636619746685028076171875;
    if (!_1350)
    {
        _1372 = _1150;
    }
    float _1388 = _1372;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = -_1382;
    float _1394 = fma(_1386, _1392, 1.0);
    float _1396 = -_1334;
    float _1398 = fma(_1384, _1380, _1396);
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = fma(_1398, 0.5, 0.5);
    float2 _4591 = float2(_1394, _1402);
    float3 _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).xyz;
    float _1408 = _1406.x;
    float _1410 = _1406.y;
    float _1412 = _1406.z;
    float _1414 = 0.0;
    float _1416 = _1388;
    int _1418 = as_type<int>(_1398);
    if (!_1350)
    {
        _1414 = _1388;
    }
    float _1420 = _1414;
    float _1422 = -_1316;
    float _1424 = _1422 + 1.0;
    float _1426 = _1420;
    int _1428 = as_type<int>(_1316);
    if (_1350)
    {
        _1416 = _1150;
    }
    float _1430 = _1416;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1434 = _1430;
    if (_1350)
    {
        bool _1436 = _1376 > 0.5;
        _1194 = _1436;
    }
    bool _1438 = _1194;
    float _1440 = _1150;
    if (_1358)
    {
        float _1442 = in.m_67.z;
        _1440 = _1442;
    }
    float _1444 = _1440;
    bool _1446 = _1154 > 0.5;
    if (_1350)
    {
        float _1448 = -_1430;
        float _1450 = _1448 + 1.0;
        _1418 = as_type<int>(_1450);
    }
    int _1452 = _1418;
    bool _1454 = _1158 > 0.5;
    out.m_71.y = _1316;
    int _1456 = _1446 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    if (_1350)
    {
        float _1460 = _1438 ? as_type<float>(_1452) : _1430;
        _1426 = _1460;
    }
    float _1462 = _1426;
    float _1464 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1466 = _342 > 0.5;
    float _1468 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1472 = _1470 != 0;
    float _1474 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1476 = _1466 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1478 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1480 = _1454 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1484 = _1472 ? as_type<float>(_1476) : _1316;
    float _1486 = _891 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1490 = _1488 != 0;
    float _1492 = -_330;
    float _1494 = _1492 + 1.0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1498 = _1496 != 0;
    float _1500 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1502 = _1490 ? as_type<float>(_1480) : _1316;
    float _1504 = exp2(_1474);
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1508 = _1506 != 0;
    float _1510 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1514 = _1512 != 0;
    float _1516 = fma(_1478, _1502, -0.5);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1520 = _1518 != 0;
    float _1522 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1524 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1526 = _1520 ? as_type<float>(_1480) : _1316;
    float _1528 = fma(_1522, _1484, -0.5);
    bool _1530 = _336 != 0.0;
    bool _1532 = isnan(_336);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    float _1540 = in.m_73.x;
    float _1542 = in.m_73.y;
    float _1544 = in.m_73.z;
    float _1546 = _1514 ? as_type<float>(_1456) : _1316;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1550 = _334 == 0.0;
    bool _1552 = !_1538;
    bool _1554 = _1550 && _1552;
    float _1556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1558 = _1514;
    int _1560 = as_type<int>(_1478);
    float _1562 = _1500;
    if (_1358)
    {
        bool _1564 = _1444 > 0.5;
        _1558 = _1564;
    }
    bool _1566 = _1558;
    float _1568 = fma(_1464, -2.0, _1548);
    if (_1508)
    {
        float _1570 = -_1430;
        float _1572 = _1570 + 1.0;
        _1560 = as_type<int>(_1572);
    }
    int _1574 = _1560;
    bool _1576 = _338 == 0.0;
    bool _1578 = _1576 && _1554;
    float _1580 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1568);
    float _1582 = fma(_1500, _1526, -0.5);
    float _1584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1588 = as_type<int>(_1586);
    float _1590 = as_type<float>(_1574);
    if (_1358)
    {
        float _1592 = -_1430;
        float _1594 = _1592 + 1.0;
        _1428 = as_type<int>(_1594);
    }
    int _1596 = _1428;
    if (!_1508)
    {
        _1562 = _1430;
    }
    float _1598 = _1562;
    float _1600 = fma(_1524, _1546, -0.5);
    float _1602 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1586);
    float _1604 = _1598;
    if (_1498)
    {
        float _1606 = -_1430;
        float _1608 = _1606 + 1.0;
        _1588 = as_type<int>(_1608);
    }
    int _1610 = _1588;
    if (_1508)
    {
        float _1612 = _1466 ? as_type<float>(_1574) : _1430;
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1510);
    float _1618 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1602);
    float _1620 = 0.0;
    float _1622 = _1618;
    if (!_1358)
    {
        _1620 = _1430;
    }
    float _1624 = _1620;
    out.m_75.x = _819;
    out.m_75.y = _817;
    out.m_75.z = _821;
    float _1626 = 0.0;
    float _1628 = _1624;
    if (_1578)
    {
        _1626 = _1540;
    }
    float _1630 = _1626;
    float _1632 = -_1580;
    float _1634 = fma(_1618, _1528, _1632);
    float _1636 = 0.0;
    float _1638 = _1630;
    if (_1578)
    {
        _1636 = _1542;
    }
    float _1640 = _1636;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1644 = _1640;
    if (_1578)
    {
        _1590 = _1630;
    }
    float _1646 = _1590;
    float _1648 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1616);
    float _1650 = _1646;
    if (_1578)
    {
        _1622 = _1640;
    }
    float _1652 = _1622;
    float _1654 = 0.0;
    float _1656 = _1652;
    if (!_1498)
    {
        _1654 = _1430;
    }
    float _1658 = _1654;
    float _1660 = _1658;
    if (!_1578)
    {
        _1638 = _1540;
    }
    float _1662 = _1638;
    float _1664 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_1578)
    {
        _1644 = _1542;
    }
    float _1666 = _1644;
    float _1668 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1358)
    {
        float _1670 = _1566 ? as_type<float>(_1596) : _1430;
        _1628 = _1670;
    }
    float _1672 = _1628;
    float _1674 = fma(_1664, _1614, -0.5);
    if (_1498)
    {
        float _1676 = _1466 ? as_type<float>(_1610) : _1430;
        _1660 = _1676;
    }
    float _1678 = _1660;
    if (!_1578)
    {
        float _1680 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1666);
        _1656 = _1680;
    }
    float _1682 = _1656;
    float _1684 = 0.0;
    if (_1578)
    {
        _1684 = _1544;
    }
    float _1686 = _1684;
    float _1688 = fma(_1468, _1672, -0.5);
    float _1690 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1692 = fma(_1668, _1678, -0.5);
    float _1694 = _1686;
    if (_1578)
    {
        _1434 = _1686;
    }
    float _1696 = _1434;
    float _1698 = _1696;
    if (!_1578)
    {
        float _1700 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1662);
        _1650 = _1700;
    }
    float _1702 = _1650;
    if (!_1578)
    {
        _1694 = _1544;
    }
    float _1704 = _1694;
    float _1706 = fma(_1690, _1462, -0.5);
    float _1708 = in.m_77.x;
    float _1710 = in.m_77.y;
    float _1712 = in.m_77.z;
    float _1714 = in.m_77.w;
    if (!_1578)
    {
        float _1716 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1704);
        _1698 = _1716;
    }
    float _1718 = _1698;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1740 = _751 != 1;
    out.m_79.x = _1728;
    out.m_79.y = _1730;
    out.m_79.z = _1732;
    out.m_79.w = _1726;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1748 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1750 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1752 = _1712 * _1662;
    float _1754 = _1708 * _1666;
    float _1756 = _1710 * _1704;
    float _1758 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1746);
    float _1760 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1748);
    float _1762 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1750);
    float _1764 = -_1752;
    float _1766 = fma(_1708, _1704, _1764);
    float _1768 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = -_1754;
    float _1772 = fma(_1710, _1662, _1770);
    float _1774 = -_1756;
    float _1776 = fma(_1712, _1666, _1774);
    float _1778 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1758);
    float _1780 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1760);
    float _1782 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1762);
    float _1784 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1786 = _1766 * _1714;
    float _1788 = _1776 * _1714;
    float _1790 = _1772 * _1714;
    out.m_81.x = _1742;
    out.m_81.y = _1744;
    out.m_81.z = _1768;
    float _1792 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    out.m_83.x = _1778;
    out.m_83.y = _1780;
    out.m_83.z = _1782;
    bool _1796 = _753 != 2;
    float _1798 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1800 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1802 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _957;
    out.gl_Position.y = _963;
    out.gl_Position.z = _1648;
    out.gl_Position.w = _937;
    float _1804 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1784);
    float _1806 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1792);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1812 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1794);
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1818 = _755 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1820 = _757 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1824 = _759 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1826 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1814);
    float _1828 = -_1816;
    float _1830 = fma(_1818, 2.0, _1828);
    float _1832 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1810);
    float _1834 = fma(_1820, -2.0, _1808);
    float _1836 = -_1822;
    float _1838 = fma(_1824, 2.0, _1836);
    float _1840 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1826);
    float _1842 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1812);
    float _1844 = -_160;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1830);
    float _1848 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1832);
    float _1850 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1834);
    float _1852 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1798);
    float _1854 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1856 = fma(_1842, _1674, _1846);
    float _1858 = -_1850;
    float _1860 = fma(_1848, _1582, _1858);
    float _1862 = _1846;
    float _1864 = _1788;
    float _1866 = _1848;
    if (!_1740)
    {
        _1862 = _342;
    }
    float _1868 = _1862;
    float _1870 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1800);
    float _1872 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1854);
    float _1874 = -_160;
    float _1876 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1838);
    float _1878 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
    float _1880 = _1868;
    if (_1796)
    {
        _1864 = _759;
    }
    float _1882 = _1864;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1886 = fma(_1840, _1706, _1876);
    float _1888 = _1882;
    if (!_1796)
    {
        _1888 = _1158;
    }
    float _1890 = _1888;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1894 = _1890;
    if (!_1740)
    {
        _1866 = _1868;
    }
    float _1896 = _1866;
    float _1898 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1884);
    float _1900 = _1896;
    if (_1740)
    {
        _1880 = _342;
    }
    float _1902 = _1880;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1906 = _1902;
    if (!_1740)
    {
        _386 = _1158;
    }
    float _1908 = _386;
    float _1910 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1912 = _1908;
    if (_1740)
    {
        _1196 = _1902;
    }
    float _1914 = _1196;
    float _1916 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1892);
    if (_1740)
    {
        _1912 = _1902;
    }
    float _1918 = _1912;
    float _1920 = -_1904;
    float _1922 = fma(_1910, 2.0, _1920);
    if (!_1796)
    {
        _1906 = _759;
    }
    float _1924 = _1906;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1740)
    {
        _1894 = _1896;
    }
    float _1928 = _1894;
    float _1930 = -_160;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1922);
    float _1934 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1936 = _1928;
    if (_1740)
    {
        _1900 = _759;
    }
    float _1938 = _1900;
    float _1940 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1926);
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1740)
    {
        _1936 = _759;
    }
    float _1944 = _1936;
    float _1946 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1916);
    float _1948 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1952 = abs(_440);
    float _1954 = log2(_1952);
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1958 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1942);
    float _1960 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1872);
    float _1962 = -_1950;
    float _1964 = fma(_1956, 2.0, _1962);
    float _1966 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1958);
    float _1968 = _1886 + 0.5;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1972 = -_160;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1964);
    float _1976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1898);
    float _1978 = fma(_1934, -2.0, _1970);
    float _1980 = fma(_1966, _1688, _1974);
    float _1982 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1940);
    float _1984 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1870);
    float _1986 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1988 = _1980 + 0.5;
    float _1990 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1978);
    float _1992 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1878);
    float _1994 = exp2(_1986);
    float _1996 = _1634 + 0.5;
    float _1998 = -_1990;
    float _2000 = fma(_1982, _1600, _1998);
    out.m_85.x = _1984;
    out.m_85.y = _1960;
    out.m_85.z = _1992;
    bool _2002 = _440 <= 8000.0;
    bool _2004 = isnan(_440);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan(8000.0);
    bool _2010 = _2006 || _2008;
    float _2012 = float(_2010);
    float _2014 = _2000 + 0.5;
    float _2016 = _957 + _937;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2020 = _1856 + 0.5;
    out.m_87.x = _1968;
    out.m_87.y = _1996;
    out.m_87.z = _1988;
    out.m_87.w = _2014;
    float _2022 = fma(_1948, -2.0, _2018);
    float _2024 = _1648 + _937;
    float _2026 = _2016 * 0.5;
    float _2028 = _1860 + 0.5;
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2032 = precise::clamp(_2030, 0.0, 1.0);
    float _2034 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1806);
    float _2036 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1804);
    float _2038 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1852);
    float _2040 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2022);
    float _2042 = _2024 * 0.5;
    float _2044 = fma(_1946, _1692, _1932);
    out.m_89.x = _2020;
    out.m_89.y = _2028;
    float _2046 = -_2040;
    float _2048 = fma(_1976, _1516, _2046);
    float _2050 = _937 * 0.5;
    float _2052 = _2044 + 0.5;
    float _2054 = _2048 + 0.5;
    out.m_91.x = _2034;
    out.m_91.y = _2036;
    out.m_91.z = _2038;
    float _2056 = fma(_2032, -2.0, 3.0);
    float _2058 = _2032 * _2032;
    float _2060 = fma(_963, -0.5, _2050);
    out.m_93.x = _2052;
    out.m_93.y = _2054;
    float _2062 = _2058 * _2056;
    out.m_95.x = _2026;
    out.m_95.y = _2060;
    out.m_95.z = _2042;
    out.m_95.w = _937;
    float _2064 = -_2062;
    float _2066 = _2064 + 1.0;
    out.m_97.z = _2042;
    out.m_97.w = _937;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    float _2070 = -_1504;
    float _2072 = _2070 + 1.0;
    float _2074 = _2012 * _2068;
    float _2076 = _2068;
    if (!_923)
    {
        _2076 = 1.0;
    }
    float _2078 = _2076;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2082 = _2078;
    if (_923)
    {
        bool _2084 = _1045 >= _979;
        bool _2086 = isnan(_1045);
        bool _2088 = _2084 || _2086;
        bool _2090 = isnan(_979);
        bool _2092 = _2088 || _2090;
        float _2094 = float(_2092);
        _2082 = _2094;
    }
    float _2096 = _2082;
    float _2098 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2100 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2102 = isnan(_1164);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2108 = _2104 || _2106;
    float _2110 = _1494 * _2098;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = _2080 * _1047;
    float _2116 = _2096 * _1136;
    float _2118 = -_2080;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2112;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2126 = _1058 * _2114;
    float _2128 = _1058 * _2120;
    float _2130 = -_2116;
    float _2132 = fma(_2130, _2124, 1.0);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = _2134;
    float _2138 = _2114;
    if (!_2108)
    {
        _1070 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2140 = _1070;
    float _2142 = _1412 * _2114;
    float _2144 = fma(_1408, _2126, _1052);
    float _2146 = fma(_1410, _2126, _1054);
    float _2148 = _2134 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2150 = fma(_1058, _2142, _1056);
    float _2152 = _2140;
    float _2154 = _2140;
    if (!_2108)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2156 = _983;
    float _2158 = _2156;
    float _2160 = _2156;
    if (!_2108)
    {
        _1072 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2162 = _1072;
    out.m_99.x = _2148;
    float _2164 = _2162;
    float _2166 = _2162;
    if (!_2108)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2168 = _2136;
    float _2170 = _2168;
    float _2172 = _2168;
    if (!_2108)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2174 = _2138;
    out.m_101.x = _2144;
    out.m_101.y = _2146;
    out.m_101.z = _2150;
    out.m_101.w = _2128;
    float _2176 = _2174;
    float _2178 = _2174;
    if (!_2108)
    {
        _731 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2180 = _731;
    bool _2182 = !_2108;
    float _2184 = _2180;
    float _2186 = _2180;
    if (!_2182)
    {
        bool _2188 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2190 = isnan(_1164);
        bool _2192 = _2188 || _2190;
        bool _2194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2196 = _2192 || _2194;
        if (!_2196)
        {
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = _1164 + _2198;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2204 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2202;
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2210 = 1.0 / _2204;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2228 = _2200 * _2210;
            float _2230 = precise::clamp(_2228, 0.0, 1.0);
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2236 = fma(_2230, _2208, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2238 = fma(_2230, _2234, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2240 = fma(_2230, _2214, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2242 = fma(_2230, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2244 = fma(_2230, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2246 = fma(_2230, _2226, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2160 = _2236;
            _2178 = _2244;
            _2154 = _2240;
            _2172 = _2242;
            _2166 = _2238;
            _2186 = _2246;
            _2248 = true;
        }
        else
        {
            bool _2250 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2252 = isnan(_1164);
            bool _2254 = _2250 || _2252;
            bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2258 = _2254 || _2256;
            if (!_2258)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2260 = _2152;
            _2154 = _2260;
            if (!_2258)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2262 = _2158;
            _2160 = _2262;
            if (!_2258)
            {
                _2164 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2264 = _2164;
            _2166 = _2264;
            if (!_2258)
            {
                _2170 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2266 = _2170;
            _2172 = _2266;
            if (!_2258)
            {
                _2176 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2268 = _2176;
            _2178 = _2268;
            if (!_2258)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2270 = _2184;
            bool _2272 = !_2258;
            _2186 = _2270;
            if (!_2272)
            {
                bool _2274 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2276 = isnan(_1164);
                bool _2278 = _2274 || _2276;
                bool _2280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2282 = _2278 || _2280;
                if (!_2282)
                {
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = _1164 + _2284;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2290 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2288;
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2296 = 1.0 / _2290;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2314 = _2286 * _2296;
                    float _2316 = precise::clamp(_2314, 0.0, 1.0);
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2322 = fma(_2316, _2294, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2324 = fma(_2316, _2320, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2326 = fma(_2316, _2300, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2328 = fma(_2316, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2330 = fma(_2316, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2332 = fma(_2316, _2312, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2160 = _2322;
                    _2178 = _2330;
                    _2154 = _2326;
                    _2172 = _2328;
                    _2166 = _2324;
                    _2186 = _2332;
                    _2248 = true;
                }
                else
                {
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2178 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2172 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2166 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2248 = false;
    float _2334 = _2160;
    float _2336 = _2178;
    float _2338 = _2154;
    float _2340 = _2172;
    float _2342 = _2166;
    float _2344 = _2186;
    float _2346 = fma(_2036, -0.5, 0.5);
    float _2348 = precise::clamp(_2346, 0.0, 1.0);
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    float _2358 = -_2342;
    float _2360 = _2358 + _2344;
    bool _2362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2364 = fma(_2348, _2352, _2334);
    float _2366 = fma(_2348, _2356, _2338);
    float _2368 = fma(_2348, _2360, _2342);
    float _2370 = _2364 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2372 = fma(_2366, 0.298911988735198974609375, _2370);
    float _2374 = fma(_2368, 0.114477999508380889892578125, _2372);
    float _2376 = -_2374;
    float _2378 = _2366 + _2376;
    float _2380 = -_2374;
    float _2382 = _2364 + _2380;
    float _2384 = -_2374;
    float _2386 = _2368 + _2384;
    float _2388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2390 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2392 = fma(_2382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    out.m_59.x = _2388;
    out.m_105.x = _2390;
    out.m_105.y = _2392;
    out.m_105.z = _2394;
    if (!_2362)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2396 = -_817;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2400 = -_819;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2404 = -_821;
    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2408 = _2398 * _2398;
    float _2410 = fma(_2402, _2402, _2408);
    float _2412 = fma(_2406, _2406, _2410);
    float _2414 = sqrt(_2412);
    float _2416 = rsqrt(_2412);
    float _2418 = -_2414;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    float _2426 = _2402 * _2416;
    float _2428 = _2398 * _2416;
    float _2430 = abs(_2424);
    float _2432 = log2(_2430);
    float _2434 = _2406 * _2416;
    float _2436 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2438 = _2036 * _2428;
    float _2440 = -_2428;
    float _2442 = -_2436;
    float _2444 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2442);
    float _2446 = fma(_2034, _2426, _2438);
    float _2448 = -_2434;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2444);
    float _2452 = fma(_2038, _2434, _2446);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2458 = _2450 + _2456;
    float _2460 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2462 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = exp2(_2460);
    float _2468 = _2466 * _2464;
    float _2470 = _2454 * _2468;
    float _2472 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2472;
    out.m_103.y = _2474;
    out.m_103.z = _2476;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    float _136 = _134;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_128)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_142);
        out.gl_Position.z = _2535;
    }
    if (!_128)
    {
        return out;
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_124);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
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
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_176);
        out.gl_Position.z = _2603;
    }
    if (_170)
    {
        return out;
    }
    float _178 = in.m_63.w;
    float _180 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = in.m_61.x;
    float _194 = in.m_61.y;
    float _196 = in.m_61.z;
    float _198 = in.m_56.x;
    float _200 = in.m_56.y;
    float _202 = in.m_56.z;
    float _204 = 0.0;
    float _206 = _180;
    if (!_190)
    {
        float _208 = _180 * _180;
        float _210 = _208 * 0.5;
        _204 = _210;
    }
    float _212 = _204;
    float _214 = _212;
    if (!_190)
    {
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    bool _220 = !_190;
    float _222 = _218;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _180 * _226;
        float _236 = exp2(_234);
        float _238 = _232 * 0.693147182464599609375;
        float _240 = 1.0 / _238;
        float _242 = 1.0 / _230;
        float _244 = _236 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _240, _180);
        float _250 = _248 * _242;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_190;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _180 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _206 = _276;
    }
    float _278 = _206;
    float _280 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _282 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_278, _194, _280);
    float _288 = fma(_278, _192, _282);
    float _290 = fma(_278, _196, _284);
    float _292 = fma(_286, _178, _200);
    float _294 = fma(_288, _178, _198);
    float _296 = fma(_290, _178, _202);
    float _298 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _298);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _310 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _312 = _308 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _314 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _316 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _318 = floor(_314);
    float _320 = floor(_316);
    float _322 = -_318;
    float _324 = _314 + _322;
    float _326 = -_320;
    float _328 = _316 + _326;
    float2 _2852 = float2(_324, _328);
    float _330 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2852, float2(0.0), isnan(_2852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2852, float2(0.0), isnan(_2852)), level(0.0)).x;
    float _332 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = in.m_65.x;
    float _336 = in.m_65.y;
    float _338 = in.m_65.z;
    float _340 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _342 = in.m_67.y;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _346 = _344 != 0;
    float _348 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _350 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _352 = _350 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _354 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _352);
    float _356 = 0.0;
    int _358 = 2;
    if (_346)
    {
        float _360 = in.m_67.x;
        _356 = _360;
    }
    float _362 = _356;
    int _364 = 0;
    int _366 = 0;
    if (_346)
    {
        _364 = 0;
        _366 = 0;
    }
    int _368 = _364;
    int _370 = _366;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].z, _354);
    float _374 = _350 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _376 = _372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _378 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _374);
    float _380 = 0.0;
    int _382 = _368;
    int _384 = _370;
    float _386 = _342;
    if (_346)
    {
        _380 = _342;
    }
    float _388 = _380;
    float _390 = 1.0 / _376;
    float _392 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].z, _378);
    float _394 = _392 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _396 = _394 + _376;
    float _398 = 0.0;
    float _400 = _388;
    float _402 = _362;
    if (_346)
    {
        _398 = _362;
    }
    float _404 = _398;
    float _406 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _408 = _396 * _390;
    float _410 = _408 * 0.5;
    float _412 = _350 + _406;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _416 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _414);
    float _418 = in.m_63.x;
    float _420 = in.m_63.y;
    float _422 = in.m_63.z;
    float _424 = _412 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _426 = 1.0 / _416;
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _424);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[127].z, _428);
    float _432 = _430 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _434 = trunc(_432);
    int _436 = int(_434);
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _440 = _426 * _438;
    bool _442 = _440 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _444 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _446 = _440 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _448 = _418 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _450 = !_442;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _336);
    float _456 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _460 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _462 = _454 * _456;
    float _464 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _468 = _404;
    if (!_442)
    {
        _358 = 1;
    }
    int _470 = _358;
    float _472 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _474 = _470;
    if (!_446)
    {
        _474 = _452;
    }
    int _476 = _474;
    float _478 = _412 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _480 = _464 * _458;
    float _482 = _462 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _484 = _476 << 6;
    float _486 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _478);
    float _488 = _466 * _472;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _482);
    int _492 = _484 + 96;
    uint _495 = uint(int(uint(_492) >> uint(2)));
    uint _497 = uint(int(uint(int(_495)) >> uint(2)));
    int _499 = int(_495) & 3;
    float _501 = (*spvDescriptorSet0.vp_c15)._m0[int(_497)][_499];
    int _503 = int(_495) + 1;
    uint _505 = uint(int(uint(_503) >> uint(2)));
    int _507 = _503 & 3;
    float _509 = (*spvDescriptorSet0.vp_c15)._m0[int(_505)][_507];
    float _511 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[126].z, _486);
    float _513 = _462 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _515 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _517 = _436 + _515;
    int _519 = _517 + 1;
    float _521 = _462 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _523 = _511 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _525 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _513);
    int _527 = _484 + 104;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    uint _531 = uint(int(uint(int(_529)) >> uint(2)));
    int _533 = int(_529) & 3;
    float _535 = (*spvDescriptorSet0.vp_c15)._m0[int(_531)][_533];
    int _537 = int(_529) + 1;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    int _541 = _537 & 3;
    float _543 = (*spvDescriptorSet0.vp_c15)._m0[int(_539)][_541];
    float _545 = trunc(_523);
    int _547 = int(_545);
    float _549 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[10].z, _525);
    float _551 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[8].z, _490);
    float _553 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _521);
    float _555 = _312 + _549;
    float _557 = _310 + _551;
    int _559 = _484 + 48;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    uint _563 = uint(int(uint(int(_561)) >> uint(2)));
    int _565 = int(_561) & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    int _569 = int(_561) + 1;
    uint _571 = uint(int(uint(_569) >> uint(2)));
    int _573 = _569 & 3;
    float _575 = (*spvDescriptorSet0.vp_c15)._m0[int(_571)][_573];
    float _577 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[9].z, _553);
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _557 + _579;
    int _583 = _484 + 64;
    uint _585 = uint(int(uint(_583) >> uint(2)));
    uint _587 = uint(int(uint(int(_585)) >> uint(2)));
    int _589 = int(_585) & 3;
    float _591 = (*spvDescriptorSet0.vp_c15)._m0[int(_587)][_589];
    int _593 = int(_585) + 1;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    int _597 = _593 & 3;
    float _599 = (*spvDescriptorSet0.vp_c15)._m0[int(_595)][_597];
    int _601 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _603 = _547 + _601;
    int _605 = _603 + 1;
    float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _609 = _555 + _607;
    bool _611 = _605 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _613 = _609 * _609;
    int _615 = _605 | _519;
    int _617 = _484 + 56;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.vp_c15)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    bool _635 = _615 < 0;
    bool _637 = _635 || _611;
    float _639 = fma(_581, _581, _613);
    bool _641 = _519 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _643 = _641 || _637;
    int _645 = _484 + 72;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.vp_c15)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.vp_c15)._m0[int(_657)][_659];
    int _663 = _484 + 80;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.vp_c15)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.vp_c15)._m0[int(_675)][_677];
    float _681 = _412 * _509;
    float _683 = sqrt(_639);
    int _685 = as_type<int>(_480);
    int _687 = as_type<int>(_553);
    float _689 = _555;
    int _691 = as_type<int>(_639);
    float _693 = _523;
    if (!_643)
    {
        int _695 = _519 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _697 = _695 + _605;
        _685 = _697;
    }
    int _699 = _685;
    float _701 = fma(_310, _501, _681);
    float _703 = fma(_312, _535, _701);
    float _705 = _703 + _543;
    float _707 = _412 * _575;
    bool _709 = _683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _711 = fma(_310, _567, _707);
    float _713 = 1.0 / _705;
    float _715 = _412 * _599;
    float _717 = _350 + _577;
    float _719 = fma(_310, _591, _715);
    float _721 = fma(_312, _625, _711);
    float _723 = fma(_312, _653, _719);
    float _725 = _591;
    int _727 = as_type<int>(_719);
    float _729 = _717;
    float _731 = 1.0;
    if (!_346)
    {
        float _733 = in.m_67.x;
        float _735 = _342 * 3.1415927410125732421875;
        float _737 = _735 * 0.15915493667125701904296875;
        float _739 = _737 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = _733 * 3.1415927410125732421875;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = sin(_747);
        _382 = 1;
        _384 = 2;
        _468 = _749;
        _400 = _741;
        _402 = _733;
    }
    int _751 = _382;
    int _753 = _384;
    float _755 = _468;
    float _757 = _400;
    float _759 = _402;
    if (!_643)
    {
        int _761 = _699 << 2;
        _687 = _761;
    }
    int _763 = _687;
    int _765 = _763;
    if (!_709)
    {
        _725 = _557;
    }
    float _767 = _725;
    float _769 = _767;
    if (!_643)
    {
        uint _771 = uint(int(uint(_699) >> uint(2)));
        _727 = int(_771);
    }
    int _773 = _727;
    if (!_643)
    {
        int _775 = 12 & _763;
        _765 = _775;
    }
    int _777 = _765;
    bool _779 = !_709;
    if (!_779)
    {
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _785 = _683 + _783;
        float _787 = rsqrt(_639);
        float _789 = _785 * _781;
        float _791 = _717 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = _789 * 0.15915493667125701904296875;
        float _795 = _793 * 6.283185482025146484375;
        float _797 = cos(_795);
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        float _803 = _797 + (-1.0);
        float _805 = _803 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = fma(_801, _791, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _809 = fma(_717, _797, _805);
        float _811 = _787 * _807;
        float _813 = fma(_581, _811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _815 = fma(_609, _811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _729 = _809;
        _769 = _813;
        _689 = _815;
        _691 = as_type<int>(_787);
    }
    float _817 = _729;
    float _819 = _769;
    float _821 = _689;
    int _823 = _691;
    float _825 = _817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _827 = _823;
    if (!_643)
    {
        int _829 = _773 << 4;
        int _831 = _829 + _777;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _721 + _633;
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _825);
    int _841 = _484 + 88;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.vp_c15)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[int(_853)][_855];
    float _859 = _723 + _661;
    float _861 = _817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _863 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _837);
    float _865 = _835 * _713;
    float _867 = _817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _861);
    float _871 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _863);
    float _873 = _825;
    if (!_643)
    {
        int _875 = _833 + 400;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        uint _879 = uint(int(uint(int(_877)) >> uint(2)));
        int _881 = int(_877) & 3;
        float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
        _873 = _883;
    }
    float _885 = _873;
    bool _887 = _865 >= 0.0;
    float _889 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _869);
    float _891 = _871 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _893 = _859 * _713;
    float _895 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _839);
    bool _897 = _865 <= 1.0;
    bool _899 = _897 && _887;
    float _901 = _889 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _903 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _867);
    float _905 = _891 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _907 = _895 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _909 = _893 >= 0.0;
    bool _911 = _909 && _899;
    float _913 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _903);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _905);
    float _917 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _919 = _907 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _921 = _893 <= 1.0;
    bool _923 = _921 && _911;
    float _925 = _913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _927 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[7].z, _915);
    float _929 = -_919;
    float _931 = fma(_929, _917, 1.0);
    float _933 = _891 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _935 = _891 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[7].w, _927);
    float _939 = _412 * _679;
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _933);
    float _943 = log2(_931);
    float _945 = fma(_310, _671, _939);
    float _947 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[4].z, _941);
    float _949 = _895;
    if (_923)
    {
        float _951 = float(_476);
        _949 = _951;
    }
    float _953 = _949;
    float _955 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _935);
    float _957 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[4].w, _947);
    float _959 = 1.0 / _937;
    float _961 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[5].z, _955);
    float _963 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[5].w, _961);
    float _965 = fma(_312, _849, _945);
    float _967 = _723;
    if (!_643)
    {
        float _969 = floor(_523);
        _967 = _969;
    }
    float _971 = _967;
    float _973 = _943 * 0.693147182464599609375;
    float _975 = _965 + _857;
    float _977 = _973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _979 = _975 * _713;
    float _981 = _581;
    float _983 = _979;
    if (!_643)
    {
        float _985 = floor(_432);
        _981 = _985;
    }
    float _987 = _981;
    float _989 = _957 * _959;
    float _991 = _963 * _959;
    float _993 = fma(_989, 0.5, 0.5);
    float _995 = fma(_991, -0.5, 0.5);
    float _997 = _939;
    float _999 = _991;
    if (_923)
    {
        float _1001 = rint(_953);
        float _1003 = precise::max(_1001, 0.0);
        uint _1005 = uint(_1003);
        uint _1007 = clamp(_1005, 0u, 65535u);
        _997 = as_type<float>(_1007);
    }
    float _1009 = _997;
    if (!_643)
    {
        float _1011 = -_971;
        float _1013 = _523 + _1011;
        _693 = _1013;
    }
    float _1015 = _693;
    float _1017 = _941;
    float _1019 = _1015;
    if (!_643)
    {
        float _1021 = rint(_885);
        float _1023 = precise::max(_1021, 0.0);
        uint _1025 = uint(_1023);
        uint _1027 = clamp(_1025, 0u, 65535u);
        _1017 = as_type<float>(_1027);
    }
    float _1029 = _1017;
    float _1031 = _987;
    if (!_643)
    {
        float _1033 = -_987;
        float _1035 = _432 + _1033;
        _1031 = _1035;
    }
    float _1037 = _1031;
    float _1039 = _989;
    float _1041 = _1009;
    if (_923)
    {
        float3 _4028 = float3(_865, _893, float(as_type<int>(_1009)));
        float3 _4032 = select(_4028, float3(0.0), isnan(_4028));
        float _1043 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4032.xy, uint(rint(_4032.z)), _979, level(0.0));
        _1039 = _1043;
    }
    float _1045 = _1039;
    float3 _4042 = float3(_993, _995, _977);
    float _1047 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4042, float3(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4042, float3(0.0), isnan(_4042)), level(0.0)).x;
    float3 _4051 = float3(_993, _995, _977);
    float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4051, float3(0.0), isnan(_4051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4051, float3(0.0), isnan(_4051)), level(0.0)).xyzw;
    float _1052 = _1050.x;
    float _1054 = _1050.y;
    float _1056 = _1050.z;
    float _1058 = _1050.w;
    float _1060 = _953;
    if (!_643)
    {
        float3 _4074 = float3(_1015, _1037, float(as_type<int>(_1029)));
        float3 _4076 = select(_4074, float3(0.0), isnan(_4074));
        float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4076.xy, uint(rint(_4076.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4076.xy, uint(rint(_4076.z)), level(0.0)).x;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (_643)
    {
        _999 = 1.0;
    }
    float _1066 = _999;
    float _1068 = _1066;
    float _1070 = _1045;
    float _1072 = _1047;
    if (!_643)
    {
        int _1074 = _699 << 4;
        int _1076 = _1074 + 2048;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
        int _1082 = int(_1078) & 3;
        float _1084 = (*spvDescriptorSet0.vp_c15)._m0[int(_1080)][_1082];
        int _1086 = int(_1078) + 1;
        uint _1088 = uint(int(uint(_1086) >> uint(2)));
        int _1090 = _1086 & 3;
        float _1092 = (*spvDescriptorSet0.vp_c15)._m0[int(_1088)][_1090];
        int _1094 = _1076 + 8;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
        int _1100 = int(_1096) & 3;
        float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
        int _1104 = int(_1096) + 1;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        int _1108 = _1104 & 3;
        float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
        float _1112 = _412 * _1092;
        float _1114 = fma(_310, _1084, _1112);
        float _1116 = fma(_312, _1102, _1114);
        float _1118 = _1116 + _1110;
        float _1120 = precise::clamp(_1118, 0.0, 1.0);
        float _1122 = -_1120;
        float _1124 = _1122 + _1064;
        float _1126 = fma(_1124, 500.0, 1.5);
        float _1128 = exp2(_1126);
        float _1130 = 0.0 + _1128;
        float _1132 = precise::clamp(_1130, 0.0, 1.0);
        _1019 = _1110;
        _1068 = _1132;
    }
    float _1134 = _1019;
    float _1136 = _1068;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _817 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1144 = _819 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _821 + _1146;
    float _1150 = in.m_69.x;
    float _1152 = _1140 * _1140;
    float _1154 = in.m_67.w;
    float _1156 = fma(_1144, _1144, _1152);
    float _1158 = in.m_67.z;
    float _1160 = fma(_1148, _1148, _1156);
    float _1162 = rsqrt(_1160);
    float _1164 = sqrt(_1160);
    float _1166 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1168 = _1144 * _1166;
    float _1170 = _1148 * _1166;
    float _1172 = _1168 * _1168;
    float _1174 = _1170 * _1170;
    float _1176 = _1172 + _1174;
    float _1178 = sqrt(_1176);
    bool _1180 = _1178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1184 = _1178 + _1182;
    float _1186 = _1148;
    float _1188 = _1162;
    float _1190 = _1184;
    float _1192 = _1166;
    bool _1194 = _1180;
    float _1196 = _1158;
    if (_1180)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1198;
    }
    float _1200 = _1186;
    if (_1180)
    {
        float _1202 = rsqrt(_1176);
        _1188 = _1202;
    }
    float _1204 = _1188;
    float _1206 = _1204;
    if (_1180)
    {
        float _1208 = _1184 * _1200;
        _1190 = _1208;
    }
    float _1210 = _1190;
    if (_1180)
    {
        float _1212 = _1210 * 0.15915493667125701904296875;
        _1041 = _1212;
    }
    float _1214 = _1041;
    float _1216 = _1200;
    float _1218 = _1214;
    if (_1180)
    {
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        _1216 = _1222;
    }
    float _1224 = _1216;
    float _1226 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1228 = precise::max(0.0, _1226);
    float _1230 = _1134;
    float _1232 = _1228;
    if (_1180)
    {
        float _1234 = _1214 * 6.283185482025146484375;
        float _1236 = cos(_1234);
        _1230 = _1236;
    }
    float _1238 = _1230;
    float _1240 = -_1166;
    float _1242 = -_1228;
    float _1244 = fma(_1140, _1240, _1242);
    float _1246 = _1244;
    if (_1180)
    {
        float _1248 = _1244 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1248;
    }
    float _1250 = _1232;
    float _1252 = _1224;
    float _1254 = _1250;
    if (_1180)
    {
        float _1256 = fma(_1224, _1250, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = _1258;
    float _1262 = _1238;
    if (_1180)
    {
        float _1264 = _1238 + (-1.0);
        _1254 = _1264;
    }
    float _1266 = _1254;
    float _1268 = _1266;
    if (_1180)
    {
        float _1270 = _1204 * _1258;
        _1192 = _1270;
    }
    float _1272 = _1192;
    if (!_1180)
    {
        _1260 = _1168;
    }
    float _1274 = _1260;
    float _1276 = _1274;
    if (_1180)
    {
        float _1278 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1278;
    }
    float _1280 = _1218;
    if (_1180)
    {
        float _1282 = _1168 * _1272;
        _1276 = _1282;
    }
    float _1284 = _1276;
    if (!_1180)
    {
        _1268 = _1170;
    }
    float _1286 = _1268;
    float _1288 = _1286;
    if (_1180)
    {
        float _1290 = _1170 * _1272;
        _1288 = _1290;
    }
    float _1292 = _1288;
    if (!_1180)
    {
        _1206 = _1172;
    }
    float _1294 = _1206;
    float _1296 = _1294;
    if (_1180)
    {
        float _1298 = fma(_1244, _1238, _1280);
        _1246 = _1298;
    }
    float _1300 = _1246;
    if (_1180)
    {
        float _1302 = _1284 * _1284;
        _1296 = _1302;
    }
    float _1304 = _1296;
    if (!_1180)
    {
        _1262 = _1174;
    }
    float _1306 = _1262;
    float _1308 = _1306;
    if (_1180)
    {
        float _1310 = _1292 * _1292;
        _1308 = _1310;
    }
    float _1312 = _1308;
    float _1314 = fma(_1300, _1300, _1304);
    float _1316 = in.m_69.y;
    float _1318 = _1314 + _1312;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1322 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1320);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = -_1324;
    float _1328 = _1326 + 1.0;
    float _1330 = rsqrt(_1318);
    float _1332 = _1330 * _1284;
    float _1334 = _1330 * _1300;
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1338 = _1330 * _1292;
    float _1340 = abs(_1328);
    float _1342 = log2(_1340);
    float _1344 = -_1336;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1344);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1350 = _1348 != 0;
    float _1352 = -_1338;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1346);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1358 = _1356 != 0;
    float _1360 = fma(_1354, -0.5, 0.5);
    float _1362 = fma(_1354, 0.5, 0.5);
    float _1364 = fma(_1362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = sqrt(_1360);
    float _1368 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1370 = _1174;
    float _1372 = _1368;
    if (_1350)
    {
        float _1374 = in.m_67.x;
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = fma(_1362, _1364, -0.212114393711090087890625);
    float _1380 = _1334 + 1.0;
    float _1382 = fma(_1362, _1378, 1.570728778839111328125);
    float _1384 = exp2(_1368);
    float _1386 = _1366 * 0.636619746685028076171875;
    if (!_1350)
    {
        _1372 = _1150;
    }
    float _1388 = _1372;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = -_1382;
    float _1394 = fma(_1386, _1392, 1.0);
    float _1396 = -_1334;
    float _1398 = fma(_1384, _1380, _1396);
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = fma(_1398, 0.5, 0.5);
    float2 _4591 = float2(_1394, _1402);
    float3 _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).xyz;
    float _1408 = _1406.x;
    float _1410 = _1406.y;
    float _1412 = _1406.z;
    float _1414 = 0.0;
    float _1416 = _1388;
    int _1418 = as_type<int>(_1398);
    if (!_1350)
    {
        _1414 = _1388;
    }
    float _1420 = _1414;
    float _1422 = -_1316;
    float _1424 = _1422 + 1.0;
    float _1426 = _1420;
    int _1428 = as_type<int>(_1316);
    if (_1350)
    {
        _1416 = _1150;
    }
    float _1430 = _1416;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1434 = _1430;
    if (_1350)
    {
        bool _1436 = _1376 > 0.5;
        _1194 = _1436;
    }
    bool _1438 = _1194;
    float _1440 = _1150;
    if (_1358)
    {
        float _1442 = in.m_67.z;
        _1440 = _1442;
    }
    float _1444 = _1440;
    bool _1446 = _1154 > 0.5;
    if (_1350)
    {
        float _1448 = -_1430;
        float _1450 = _1448 + 1.0;
        _1418 = as_type<int>(_1450);
    }
    int _1452 = _1418;
    bool _1454 = _1158 > 0.5;
    out.m_71.y = _1316;
    int _1456 = _1446 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    if (_1350)
    {
        float _1460 = _1438 ? as_type<float>(_1452) : _1430;
        _1426 = _1460;
    }
    float _1462 = _1426;
    float _1464 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1466 = _342 > 0.5;
    float _1468 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1472 = _1470 != 0;
    float _1474 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1476 = _1466 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1478 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1480 = _1454 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1484 = _1472 ? as_type<float>(_1476) : _1316;
    float _1486 = _891 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1490 = _1488 != 0;
    float _1492 = -_330;
    float _1494 = _1492 + 1.0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1498 = _1496 != 0;
    float _1500 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1502 = _1490 ? as_type<float>(_1480) : _1316;
    float _1504 = exp2(_1474);
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1508 = _1506 != 0;
    float _1510 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1514 = _1512 != 0;
    float _1516 = fma(_1478, _1502, -0.5);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1520 = _1518 != 0;
    float _1522 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1524 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1526 = _1520 ? as_type<float>(_1480) : _1316;
    float _1528 = fma(_1522, _1484, -0.5);
    bool _1530 = _336 != 0.0;
    bool _1532 = isnan(_336);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    float _1540 = in.m_73.x;
    float _1542 = in.m_73.y;
    float _1544 = in.m_73.z;
    float _1546 = _1514 ? as_type<float>(_1456) : _1316;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1550 = _334 == 0.0;
    bool _1552 = !_1538;
    bool _1554 = _1550 && _1552;
    float _1556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1558 = _1514;
    int _1560 = as_type<int>(_1478);
    float _1562 = _1500;
    if (_1358)
    {
        bool _1564 = _1444 > 0.5;
        _1558 = _1564;
    }
    bool _1566 = _1558;
    float _1568 = fma(_1464, -2.0, _1548);
    if (_1508)
    {
        float _1570 = -_1430;
        float _1572 = _1570 + 1.0;
        _1560 = as_type<int>(_1572);
    }
    int _1574 = _1560;
    bool _1576 = _338 == 0.0;
    bool _1578 = _1576 && _1554;
    float _1580 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1568);
    float _1582 = fma(_1500, _1526, -0.5);
    float _1584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1588 = as_type<int>(_1586);
    float _1590 = as_type<float>(_1574);
    if (_1358)
    {
        float _1592 = -_1430;
        float _1594 = _1592 + 1.0;
        _1428 = as_type<int>(_1594);
    }
    int _1596 = _1428;
    if (!_1508)
    {
        _1562 = _1430;
    }
    float _1598 = _1562;
    float _1600 = fma(_1524, _1546, -0.5);
    float _1602 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1586);
    float _1604 = _1598;
    if (_1498)
    {
        float _1606 = -_1430;
        float _1608 = _1606 + 1.0;
        _1588 = as_type<int>(_1608);
    }
    int _1610 = _1588;
    if (_1508)
    {
        float _1612 = _1466 ? as_type<float>(_1574) : _1430;
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1510);
    float _1618 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1602);
    float _1620 = 0.0;
    float _1622 = _1618;
    if (!_1358)
    {
        _1620 = _1430;
    }
    float _1624 = _1620;
    out.m_75.x = _819;
    out.m_75.y = _817;
    out.m_75.z = _821;
    float _1626 = 0.0;
    float _1628 = _1624;
    if (_1578)
    {
        _1626 = _1540;
    }
    float _1630 = _1626;
    float _1632 = -_1580;
    float _1634 = fma(_1618, _1528, _1632);
    float _1636 = 0.0;
    float _1638 = _1630;
    if (_1578)
    {
        _1636 = _1542;
    }
    float _1640 = _1636;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1644 = _1640;
    if (_1578)
    {
        _1590 = _1630;
    }
    float _1646 = _1590;
    float _1648 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1616);
    float _1650 = _1646;
    if (_1578)
    {
        _1622 = _1640;
    }
    float _1652 = _1622;
    float _1654 = 0.0;
    float _1656 = _1652;
    if (!_1498)
    {
        _1654 = _1430;
    }
    float _1658 = _1654;
    float _1660 = _1658;
    if (!_1578)
    {
        _1638 = _1540;
    }
    float _1662 = _1638;
    float _1664 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_1578)
    {
        _1644 = _1542;
    }
    float _1666 = _1644;
    float _1668 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1358)
    {
        float _1670 = _1566 ? as_type<float>(_1596) : _1430;
        _1628 = _1670;
    }
    float _1672 = _1628;
    float _1674 = fma(_1664, _1614, -0.5);
    if (_1498)
    {
        float _1676 = _1466 ? as_type<float>(_1610) : _1430;
        _1660 = _1676;
    }
    float _1678 = _1660;
    if (!_1578)
    {
        float _1680 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1666);
        _1656 = _1680;
    }
    float _1682 = _1656;
    float _1684 = 0.0;
    if (_1578)
    {
        _1684 = _1544;
    }
    float _1686 = _1684;
    float _1688 = fma(_1468, _1672, -0.5);
    float _1690 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1692 = fma(_1668, _1678, -0.5);
    float _1694 = _1686;
    if (_1578)
    {
        _1434 = _1686;
    }
    float _1696 = _1434;
    float _1698 = _1696;
    if (!_1578)
    {
        float _1700 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1662);
        _1650 = _1700;
    }
    float _1702 = _1650;
    if (!_1578)
    {
        _1694 = _1544;
    }
    float _1704 = _1694;
    float _1706 = fma(_1690, _1462, -0.5);
    float _1708 = in.m_77.x;
    float _1710 = in.m_77.y;
    float _1712 = in.m_77.z;
    float _1714 = in.m_77.w;
    if (!_1578)
    {
        float _1716 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1704);
        _1698 = _1716;
    }
    float _1718 = _1698;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1740 = _751 != 1;
    out.m_79.x = _1728;
    out.m_79.y = _1730;
    out.m_79.z = _1732;
    out.m_79.w = _1726;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1748 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1750 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1752 = _1712 * _1662;
    float _1754 = _1708 * _1666;
    float _1756 = _1710 * _1704;
    float _1758 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1746);
    float _1760 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1748);
    float _1762 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1750);
    float _1764 = -_1752;
    float _1766 = fma(_1708, _1704, _1764);
    float _1768 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = -_1754;
    float _1772 = fma(_1710, _1662, _1770);
    float _1774 = -_1756;
    float _1776 = fma(_1712, _1666, _1774);
    float _1778 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1758);
    float _1780 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1760);
    float _1782 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1762);
    float _1784 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1786 = _1766 * _1714;
    float _1788 = _1776 * _1714;
    float _1790 = _1772 * _1714;
    out.m_81.x = _1742;
    out.m_81.y = _1744;
    out.m_81.z = _1768;
    float _1792 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    out.m_83.x = _1778;
    out.m_83.y = _1780;
    out.m_83.z = _1782;
    bool _1796 = _753 != 2;
    float _1798 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1800 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1802 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _957;
    out.gl_Position.y = _963;
    out.gl_Position.z = _1648;
    out.gl_Position.w = _937;
    float _1804 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1784);
    float _1806 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1792);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1812 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1794);
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1818 = _755 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1820 = _757 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1824 = _759 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1826 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1814);
    float _1828 = -_1816;
    float _1830 = fma(_1818, 2.0, _1828);
    float _1832 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1810);
    float _1834 = fma(_1820, -2.0, _1808);
    float _1836 = -_1822;
    float _1838 = fma(_1824, 2.0, _1836);
    float _1840 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1826);
    float _1842 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1812);
    float _1844 = -_160;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1830);
    float _1848 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1832);
    float _1850 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1834);
    float _1852 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1798);
    float _1854 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1856 = fma(_1842, _1674, _1846);
    float _1858 = -_1850;
    float _1860 = fma(_1848, _1582, _1858);
    float _1862 = _1846;
    float _1864 = _1788;
    float _1866 = _1848;
    if (!_1740)
    {
        _1862 = _342;
    }
    float _1868 = _1862;
    float _1870 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1800);
    float _1872 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1854);
    float _1874 = -_160;
    float _1876 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1838);
    float _1878 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
    float _1880 = _1868;
    if (_1796)
    {
        _1864 = _759;
    }
    float _1882 = _1864;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1886 = fma(_1840, _1706, _1876);
    float _1888 = _1882;
    if (!_1796)
    {
        _1888 = _1158;
    }
    float _1890 = _1888;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1894 = _1890;
    if (!_1740)
    {
        _1866 = _1868;
    }
    float _1896 = _1866;
    float _1898 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1884);
    float _1900 = _1896;
    if (_1740)
    {
        _1880 = _342;
    }
    float _1902 = _1880;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1906 = _1902;
    if (!_1740)
    {
        _386 = _1158;
    }
    float _1908 = _386;
    float _1910 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1912 = _1908;
    if (_1740)
    {
        _1196 = _1902;
    }
    float _1914 = _1196;
    float _1916 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1892);
    if (_1740)
    {
        _1912 = _1902;
    }
    float _1918 = _1912;
    float _1920 = -_1904;
    float _1922 = fma(_1910, 2.0, _1920);
    if (!_1796)
    {
        _1906 = _759;
    }
    float _1924 = _1906;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1740)
    {
        _1894 = _1896;
    }
    float _1928 = _1894;
    float _1930 = -_160;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1922);
    float _1934 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1936 = _1928;
    if (_1740)
    {
        _1900 = _759;
    }
    float _1938 = _1900;
    float _1940 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1926);
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1740)
    {
        _1936 = _759;
    }
    float _1944 = _1936;
    float _1946 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1916);
    float _1948 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1952 = abs(_440);
    float _1954 = log2(_1952);
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1958 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1942);
    float _1960 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1872);
    float _1962 = -_1950;
    float _1964 = fma(_1956, 2.0, _1962);
    float _1966 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1958);
    float _1968 = _1886 + 0.5;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1972 = -_160;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1964);
    float _1976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1898);
    float _1978 = fma(_1934, -2.0, _1970);
    float _1980 = fma(_1966, _1688, _1974);
    float _1982 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1940);
    float _1984 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1870);
    float _1986 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1988 = _1980 + 0.5;
    float _1990 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1978);
    float _1992 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1878);
    float _1994 = exp2(_1986);
    float _1996 = _1634 + 0.5;
    float _1998 = -_1990;
    float _2000 = fma(_1982, _1600, _1998);
    out.m_85.x = _1984;
    out.m_85.y = _1960;
    out.m_85.z = _1992;
    bool _2002 = _440 <= 8000.0;
    bool _2004 = isnan(_440);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan(8000.0);
    bool _2010 = _2006 || _2008;
    float _2012 = float(_2010);
    float _2014 = _2000 + 0.5;
    float _2016 = _957 + _937;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2020 = _1856 + 0.5;
    out.m_87.x = _1968;
    out.m_87.y = _1996;
    out.m_87.z = _1988;
    out.m_87.w = _2014;
    float _2022 = fma(_1948, -2.0, _2018);
    float _2024 = _1648 + _937;
    float _2026 = _2016 * 0.5;
    float _2028 = _1860 + 0.5;
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2032 = precise::clamp(_2030, 0.0, 1.0);
    float _2034 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1806);
    float _2036 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1804);
    float _2038 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1852);
    float _2040 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2022);
    float _2042 = _2024 * 0.5;
    float _2044 = fma(_1946, _1692, _1932);
    out.m_89.x = _2020;
    out.m_89.y = _2028;
    float _2046 = -_2040;
    float _2048 = fma(_1976, _1516, _2046);
    float _2050 = _937 * 0.5;
    float _2052 = _2044 + 0.5;
    float _2054 = _2048 + 0.5;
    out.m_91.x = _2034;
    out.m_91.y = _2036;
    out.m_91.z = _2038;
    float _2056 = fma(_2032, -2.0, 3.0);
    float _2058 = _2032 * _2032;
    float _2060 = fma(_963, -0.5, _2050);
    out.m_93.x = _2052;
    out.m_93.y = _2054;
    float _2062 = _2058 * _2056;
    out.m_95.x = _2026;
    out.m_95.y = _2060;
    out.m_95.z = _2042;
    out.m_95.w = _937;
    float _2064 = -_2062;
    float _2066 = _2064 + 1.0;
    out.m_97.z = _2042;
    out.m_97.w = _937;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    float _2070 = -_1504;
    float _2072 = _2070 + 1.0;
    float _2074 = _2012 * _2068;
    float _2076 = _2068;
    if (!_923)
    {
        _2076 = 1.0;
    }
    float _2078 = _2076;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2082 = _2078;
    if (_923)
    {
        bool _2084 = _1045 >= _979;
        bool _2086 = isnan(_1045);
        bool _2088 = _2084 || _2086;
        bool _2090 = isnan(_979);
        bool _2092 = _2088 || _2090;
        float _2094 = float(_2092);
        _2082 = _2094;
    }
    float _2096 = _2082;
    float _2098 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2100 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2102 = isnan(_1164);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2108 = _2104 || _2106;
    float _2110 = _1494 * _2098;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = _2080 * _1047;
    float _2116 = _2096 * _1136;
    float _2118 = -_2080;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2112;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2126 = _1058 * _2114;
    float _2128 = _1058 * _2120;
    float _2130 = -_2116;
    float _2132 = fma(_2130, _2124, 1.0);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = _2134;
    float _2138 = _2114;
    if (!_2108)
    {
        _1070 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2140 = _1070;
    float _2142 = _1412 * _2114;
    float _2144 = fma(_1408, _2126, _1052);
    float _2146 = fma(_1410, _2126, _1054);
    float _2148 = _2134 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2150 = fma(_1058, _2142, _1056);
    float _2152 = _2140;
    float _2154 = _2140;
    if (!_2108)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2156 = _983;
    float _2158 = _2156;
    float _2160 = _2156;
    if (!_2108)
    {
        _1072 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2162 = _1072;
    out.m_99.x = _2148;
    float _2164 = _2162;
    float _2166 = _2162;
    if (!_2108)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2168 = _2136;
    float _2170 = _2168;
    float _2172 = _2168;
    if (!_2108)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2174 = _2138;
    out.m_101.x = _2144;
    out.m_101.y = _2146;
    out.m_101.z = _2150;
    out.m_101.w = _2128;
    float _2176 = _2174;
    float _2178 = _2174;
    if (!_2108)
    {
        _731 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2180 = _731;
    bool _2182 = !_2108;
    float _2184 = _2180;
    float _2186 = _2180;
    if (!_2182)
    {
        bool _2188 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2190 = isnan(_1164);
        bool _2192 = _2188 || _2190;
        bool _2194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2196 = _2192 || _2194;
        if (!_2196)
        {
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = _1164 + _2198;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2204 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2202;
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2210 = 1.0 / _2204;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2228 = _2200 * _2210;
            float _2230 = precise::clamp(_2228, 0.0, 1.0);
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2236 = fma(_2230, _2208, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2238 = fma(_2230, _2234, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2240 = fma(_2230, _2214, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2242 = fma(_2230, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2244 = fma(_2230, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2246 = fma(_2230, _2226, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2160 = _2236;
            _2178 = _2244;
            _2154 = _2240;
            _2172 = _2242;
            _2166 = _2238;
            _2186 = _2246;
            _2248 = true;
        }
        else
        {
            bool _2250 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2252 = isnan(_1164);
            bool _2254 = _2250 || _2252;
            bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2258 = _2254 || _2256;
            if (!_2258)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2260 = _2152;
            _2154 = _2260;
            if (!_2258)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2262 = _2158;
            _2160 = _2262;
            if (!_2258)
            {
                _2164 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2264 = _2164;
            _2166 = _2264;
            if (!_2258)
            {
                _2170 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2266 = _2170;
            _2172 = _2266;
            if (!_2258)
            {
                _2176 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2268 = _2176;
            _2178 = _2268;
            if (!_2258)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2270 = _2184;
            bool _2272 = !_2258;
            _2186 = _2270;
            if (!_2272)
            {
                bool _2274 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2276 = isnan(_1164);
                bool _2278 = _2274 || _2276;
                bool _2280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2282 = _2278 || _2280;
                if (!_2282)
                {
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = _1164 + _2284;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2290 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2288;
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2296 = 1.0 / _2290;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2314 = _2286 * _2296;
                    float _2316 = precise::clamp(_2314, 0.0, 1.0);
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2322 = fma(_2316, _2294, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2324 = fma(_2316, _2320, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2326 = fma(_2316, _2300, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2328 = fma(_2316, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2330 = fma(_2316, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2332 = fma(_2316, _2312, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2160 = _2322;
                    _2178 = _2330;
                    _2154 = _2326;
                    _2172 = _2328;
                    _2166 = _2324;
                    _2186 = _2332;
                    _2248 = true;
                }
                else
                {
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2178 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2172 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2166 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2248 = false;
    float _2334 = _2160;
    float _2336 = _2178;
    float _2338 = _2154;
    float _2340 = _2172;
    float _2342 = _2166;
    float _2344 = _2186;
    float _2346 = fma(_2036, -0.5, 0.5);
    float _2348 = precise::clamp(_2346, 0.0, 1.0);
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    float _2358 = -_2342;
    float _2360 = _2358 + _2344;
    bool _2362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2364 = fma(_2348, _2352, _2334);
    float _2366 = fma(_2348, _2356, _2338);
    float _2368 = fma(_2348, _2360, _2342);
    float _2370 = _2364 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2372 = fma(_2366, 0.298911988735198974609375, _2370);
    float _2374 = fma(_2368, 0.114477999508380889892578125, _2372);
    float _2376 = -_2374;
    float _2378 = _2366 + _2376;
    float _2380 = -_2374;
    float _2382 = _2364 + _2380;
    float _2384 = -_2374;
    float _2386 = _2368 + _2384;
    float _2388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2390 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2392 = fma(_2382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    out.m_59.x = _2388;
    out.m_105.x = _2390;
    out.m_105.y = _2392;
    out.m_105.z = _2394;
    if (!_2362)
    {
        return out;
    }
    float _2396 = -_817;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2400 = -_819;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2404 = -_821;
    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2408 = _2398 * _2398;
    float _2410 = fma(_2402, _2402, _2408);
    float _2412 = fma(_2406, _2406, _2410);
    float _2414 = sqrt(_2412);
    float _2416 = rsqrt(_2412);
    float _2418 = -_2414;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    float _2426 = _2402 * _2416;
    float _2428 = _2398 * _2416;
    float _2430 = abs(_2424);
    float _2432 = log2(_2430);
    float _2434 = _2406 * _2416;
    float _2436 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2438 = _2036 * _2428;
    float _2440 = -_2428;
    float _2442 = -_2436;
    float _2444 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2442);
    float _2446 = fma(_2034, _2426, _2438);
    float _2448 = -_2434;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2444);
    float _2452 = fma(_2038, _2434, _2446);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2458 = _2450 + _2456;
    float _2460 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2462 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = exp2(_2460);
    float _2468 = _2466 * _2464;
    float _2470 = _2454 * _2468;
    float _2472 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2472;
    out.m_103.y = _2474;
    out.m_103.z = _2476;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    float _136 = _134;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_128)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2535 = as_type<float>(_142);
        out.gl_Position.z = _2535;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_61.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_124);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
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
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2603 = as_type<float>(_176);
        out.gl_Position.z = _2603;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_63.w;
    float _180 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = in.m_61.x;
    float _194 = in.m_61.y;
    float _196 = in.m_61.z;
    float _198 = in.m_56.x;
    float _200 = in.m_56.y;
    float _202 = in.m_56.z;
    float _204 = 0.0;
    float _206 = _180;
    if (!_190)
    {
        float _208 = _180 * _180;
        float _210 = _208 * 0.5;
        _204 = _210;
    }
    float _212 = _204;
    float _214 = _212;
    if (!_190)
    {
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _216;
    }
    float _218 = _214;
    bool _220 = !_190;
    float _222 = _218;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _180 * _226;
        float _236 = exp2(_234);
        float _238 = _232 * 0.693147182464599609375;
        float _240 = 1.0 / _238;
        float _242 = 1.0 / _230;
        float _244 = _236 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _240, _180);
        float _250 = _248 * _242;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_190;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _180 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _206 = _276;
    }
    float _278 = _206;
    float _280 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _282 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_278, _194, _280);
    float _288 = fma(_278, _192, _282);
    float _290 = fma(_278, _196, _284);
    float _292 = fma(_286, _178, _200);
    float _294 = fma(_288, _178, _198);
    float _296 = fma(_290, _178, _202);
    float _298 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _298);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _310 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _312 = _308 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _314 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _316 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _318 = floor(_314);
    float _320 = floor(_316);
    float _322 = -_318;
    float _324 = _314 + _322;
    float _326 = -_320;
    float _328 = _316 + _326;
    float2 _2852 = float2(_324, _328);
    float _330 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2852, float2(0.0), isnan(_2852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2852, float2(0.0), isnan(_2852)), level(0.0)).x;
    float _332 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = in.m_65.x;
    float _336 = in.m_65.y;
    float _338 = in.m_65.z;
    float _340 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _342 = in.m_67.y;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _346 = _344 != 0;
    float _348 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _350 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _352 = _350 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _354 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _352);
    float _356 = 0.0;
    int _358 = 2;
    if (_346)
    {
        float _360 = in.m_67.x;
        _356 = _360;
    }
    float _362 = _356;
    int _364 = 0;
    int _366 = 0;
    if (_346)
    {
        _364 = 0;
        _366 = 0;
    }
    int _368 = _364;
    int _370 = _366;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].z, _354);
    float _374 = _350 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _376 = _372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _378 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _374);
    float _380 = 0.0;
    int _382 = _368;
    int _384 = _370;
    float _386 = _342;
    if (_346)
    {
        _380 = _342;
    }
    float _388 = _380;
    float _390 = 1.0 / _376;
    float _392 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].z, _378);
    float _394 = _392 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _396 = _394 + _376;
    float _398 = 0.0;
    float _400 = _388;
    float _402 = _362;
    if (_346)
    {
        _398 = _362;
    }
    float _404 = _398;
    float _406 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _408 = _396 * _390;
    float _410 = _408 * 0.5;
    float _412 = _350 + _406;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _416 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _414);
    float _418 = in.m_63.x;
    float _420 = in.m_63.y;
    float _422 = in.m_63.z;
    float _424 = _412 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _426 = 1.0 / _416;
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _424);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[127].z, _428);
    float _432 = _430 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _434 = trunc(_432);
    int _436 = int(_434);
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _440 = _426 * _438;
    bool _442 = _440 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _444 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _446 = _440 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _448 = _418 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _450 = !_442;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _336);
    float _456 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _458 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _460 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _462 = _454 * _456;
    float _464 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _468 = _404;
    if (!_442)
    {
        _358 = 1;
    }
    int _470 = _358;
    float _472 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _474 = _470;
    if (!_446)
    {
        _474 = _452;
    }
    int _476 = _474;
    float _478 = _412 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _480 = _464 * _458;
    float _482 = _462 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _484 = _476 << 6;
    float _486 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _478);
    float _488 = _466 * _472;
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _482);
    int _492 = _484 + 96;
    uint _495 = uint(int(uint(_492) >> uint(2)));
    uint _497 = uint(int(uint(int(_495)) >> uint(2)));
    int _499 = int(_495) & 3;
    float _501 = (*spvDescriptorSet0.vp_c15)._m0[int(_497)][_499];
    int _503 = int(_495) + 1;
    uint _505 = uint(int(uint(_503) >> uint(2)));
    int _507 = _503 & 3;
    float _509 = (*spvDescriptorSet0.vp_c15)._m0[int(_505)][_507];
    float _511 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[126].z, _486);
    float _513 = _462 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _515 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _517 = _436 + _515;
    int _519 = _517 + 1;
    float _521 = _462 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _523 = _511 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _525 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _513);
    int _527 = _484 + 104;
    uint _529 = uint(int(uint(_527) >> uint(2)));
    uint _531 = uint(int(uint(int(_529)) >> uint(2)));
    int _533 = int(_529) & 3;
    float _535 = (*spvDescriptorSet0.vp_c15)._m0[int(_531)][_533];
    int _537 = int(_529) + 1;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    int _541 = _537 & 3;
    float _543 = (*spvDescriptorSet0.vp_c15)._m0[int(_539)][_541];
    float _545 = trunc(_523);
    int _547 = int(_545);
    float _549 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[10].z, _525);
    float _551 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[8].z, _490);
    float _553 = fma(_480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _521);
    float _555 = _312 + _549;
    float _557 = _310 + _551;
    int _559 = _484 + 48;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    uint _563 = uint(int(uint(int(_561)) >> uint(2)));
    int _565 = int(_561) & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    int _569 = int(_561) + 1;
    uint _571 = uint(int(uint(_569) >> uint(2)));
    int _573 = _569 & 3;
    float _575 = (*spvDescriptorSet0.vp_c15)._m0[int(_571)][_573];
    float _577 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[9].z, _553);
    float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _581 = _557 + _579;
    int _583 = _484 + 64;
    uint _585 = uint(int(uint(_583) >> uint(2)));
    uint _587 = uint(int(uint(int(_585)) >> uint(2)));
    int _589 = int(_585) & 3;
    float _591 = (*spvDescriptorSet0.vp_c15)._m0[int(_587)][_589];
    int _593 = int(_585) + 1;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    int _597 = _593 & 3;
    float _599 = (*spvDescriptorSet0.vp_c15)._m0[int(_595)][_597];
    int _601 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _603 = _547 + _601;
    int _605 = _603 + 1;
    float _607 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _609 = _555 + _607;
    bool _611 = _605 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _613 = _609 * _609;
    int _615 = _605 | _519;
    int _617 = _484 + 56;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.vp_c15)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    bool _635 = _615 < 0;
    bool _637 = _635 || _611;
    float _639 = fma(_581, _581, _613);
    bool _641 = _519 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _643 = _641 || _637;
    int _645 = _484 + 72;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    uint _649 = uint(int(uint(int(_647)) >> uint(2)));
    int _651 = int(_647) & 3;
    float _653 = (*spvDescriptorSet0.vp_c15)._m0[int(_649)][_651];
    int _655 = int(_647) + 1;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    int _659 = _655 & 3;
    float _661 = (*spvDescriptorSet0.vp_c15)._m0[int(_657)][_659];
    int _663 = _484 + 80;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.vp_c15)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.vp_c15)._m0[int(_675)][_677];
    float _681 = _412 * _509;
    float _683 = sqrt(_639);
    int _685 = as_type<int>(_480);
    int _687 = as_type<int>(_553);
    float _689 = _555;
    int _691 = as_type<int>(_639);
    float _693 = _523;
    if (!_643)
    {
        int _695 = _519 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _697 = _695 + _605;
        _685 = _697;
    }
    int _699 = _685;
    float _701 = fma(_310, _501, _681);
    float _703 = fma(_312, _535, _701);
    float _705 = _703 + _543;
    float _707 = _412 * _575;
    bool _709 = _683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _711 = fma(_310, _567, _707);
    float _713 = 1.0 / _705;
    float _715 = _412 * _599;
    float _717 = _350 + _577;
    float _719 = fma(_310, _591, _715);
    float _721 = fma(_312, _625, _711);
    float _723 = fma(_312, _653, _719);
    float _725 = _591;
    int _727 = as_type<int>(_719);
    float _729 = _717;
    float _731 = 1.0;
    if (!_346)
    {
        float _733 = in.m_67.x;
        float _735 = _342 * 3.1415927410125732421875;
        float _737 = _735 * 0.15915493667125701904296875;
        float _739 = _737 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = _733 * 3.1415927410125732421875;
        float _745 = _743 * 0.15915493667125701904296875;
        float _747 = _745 * 6.283185482025146484375;
        float _749 = sin(_747);
        _382 = 1;
        _384 = 2;
        _468 = _749;
        _400 = _741;
        _402 = _733;
    }
    int _751 = _382;
    int _753 = _384;
    float _755 = _468;
    float _757 = _400;
    float _759 = _402;
    if (!_643)
    {
        int _761 = _699 << 2;
        _687 = _761;
    }
    int _763 = _687;
    int _765 = _763;
    if (!_709)
    {
        _725 = _557;
    }
    float _767 = _725;
    float _769 = _767;
    if (!_643)
    {
        uint _771 = uint(int(uint(_699) >> uint(2)));
        _727 = int(_771);
    }
    int _773 = _727;
    if (!_643)
    {
        int _775 = 12 & _763;
        _765 = _775;
    }
    int _777 = _765;
    bool _779 = !_709;
    if (!_779)
    {
        float _781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _785 = _683 + _783;
        float _787 = rsqrt(_639);
        float _789 = _785 * _781;
        float _791 = _717 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = _789 * 0.15915493667125701904296875;
        float _795 = _793 * 6.283185482025146484375;
        float _797 = cos(_795);
        float _799 = _793 * 6.283185482025146484375;
        float _801 = sin(_799);
        float _803 = _797 + (-1.0);
        float _805 = _803 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _807 = fma(_801, _791, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _809 = fma(_717, _797, _805);
        float _811 = _787 * _807;
        float _813 = fma(_581, _811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _815 = fma(_609, _811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _729 = _809;
        _769 = _813;
        _689 = _815;
        _691 = as_type<int>(_787);
    }
    float _817 = _729;
    float _819 = _769;
    float _821 = _689;
    int _823 = _691;
    float _825 = _817 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _827 = _823;
    if (!_643)
    {
        int _829 = _773 << 4;
        int _831 = _829 + _777;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _721 + _633;
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[2].x, _825);
    int _841 = _484 + 88;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.vp_c15)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[int(_853)][_855];
    float _859 = _723 + _661;
    float _861 = _817 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _863 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[1].x, _837);
    float _865 = _835 * _713;
    float _867 = _817 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[0].x, _861);
    float _871 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[1].z, _863);
    float _873 = _825;
    if (!_643)
    {
        int _875 = _833 + 400;
        uint _877 = uint(int(uint(_875) >> uint(2)));
        uint _879 = uint(int(uint(int(_877)) >> uint(2)));
        int _881 = int(_877) & 3;
        float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
        _873 = _883;
    }
    float _885 = _873;
    bool _887 = _865 >= 0.0;
    float _889 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[0].z, _869);
    float _891 = _871 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _893 = _859 * _713;
    float _895 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[2].z, _839);
    bool _897 = _865 <= 1.0;
    bool _899 = _897 && _887;
    float _901 = _889 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _903 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[3].x, _867);
    float _905 = _891 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _907 = _895 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _909 = _893 >= 0.0;
    bool _911 = _909 && _899;
    float _913 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[3].z, _903);
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _905);
    float _917 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _919 = _907 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _921 = _893 <= 1.0;
    bool _923 = _921 && _911;
    float _925 = _913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _927 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[7].z, _915);
    float _929 = -_919;
    float _931 = fma(_929, _917, 1.0);
    float _933 = _891 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _935 = _891 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[7].w, _927);
    float _939 = _412 * _679;
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _933);
    float _943 = log2(_931);
    float _945 = fma(_310, _671, _939);
    float _947 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[4].z, _941);
    float _949 = _895;
    if (_923)
    {
        float _951 = float(_476);
        _949 = _951;
    }
    float _953 = _949;
    float _955 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _935);
    float _957 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[4].w, _947);
    float _959 = 1.0 / _937;
    float _961 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[5].z, _955);
    float _963 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[5].w, _961);
    float _965 = fma(_312, _849, _945);
    float _967 = _723;
    if (!_643)
    {
        float _969 = floor(_523);
        _967 = _969;
    }
    float _971 = _967;
    float _973 = _943 * 0.693147182464599609375;
    float _975 = _965 + _857;
    float _977 = _973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _979 = _975 * _713;
    float _981 = _581;
    float _983 = _979;
    if (!_643)
    {
        float _985 = floor(_432);
        _981 = _985;
    }
    float _987 = _981;
    float _989 = _957 * _959;
    float _991 = _963 * _959;
    float _993 = fma(_989, 0.5, 0.5);
    float _995 = fma(_991, -0.5, 0.5);
    float _997 = _939;
    float _999 = _991;
    if (_923)
    {
        float _1001 = rint(_953);
        float _1003 = precise::max(_1001, 0.0);
        uint _1005 = uint(_1003);
        uint _1007 = clamp(_1005, 0u, 65535u);
        _997 = as_type<float>(_1007);
    }
    float _1009 = _997;
    if (!_643)
    {
        float _1011 = -_971;
        float _1013 = _523 + _1011;
        _693 = _1013;
    }
    float _1015 = _693;
    float _1017 = _941;
    float _1019 = _1015;
    if (!_643)
    {
        float _1021 = rint(_885);
        float _1023 = precise::max(_1021, 0.0);
        uint _1025 = uint(_1023);
        uint _1027 = clamp(_1025, 0u, 65535u);
        _1017 = as_type<float>(_1027);
    }
    float _1029 = _1017;
    float _1031 = _987;
    if (!_643)
    {
        float _1033 = -_987;
        float _1035 = _432 + _1033;
        _1031 = _1035;
    }
    float _1037 = _1031;
    float _1039 = _989;
    float _1041 = _1009;
    if (_923)
    {
        float3 _4028 = float3(_865, _893, float(as_type<int>(_1009)));
        float3 _4032 = select(_4028, float3(0.0), isnan(_4028));
        float _1043 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4032.xy, uint(rint(_4032.z)), _979, level(0.0));
        _1039 = _1043;
    }
    float _1045 = _1039;
    float3 _4042 = float3(_993, _995, _977);
    float _1047 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4042, float3(0.0), isnan(_4042)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4042, float3(0.0), isnan(_4042)), level(0.0)).x;
    float3 _4051 = float3(_993, _995, _977);
    float4 _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4051, float3(0.0), isnan(_4051)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4051, float3(0.0), isnan(_4051)), level(0.0)).xyzw;
    float _1052 = _1050.x;
    float _1054 = _1050.y;
    float _1056 = _1050.z;
    float _1058 = _1050.w;
    float _1060 = _953;
    if (!_643)
    {
        float3 _4074 = float3(_1015, _1037, float(as_type<int>(_1029)));
        float3 _4076 = select(_4074, float3(0.0), isnan(_4074));
        float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4076.xy, uint(rint(_4076.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4076.xy, uint(rint(_4076.z)), level(0.0)).x;
        _1060 = _1062;
    }
    float _1064 = _1060;
    if (_643)
    {
        _999 = 1.0;
    }
    float _1066 = _999;
    float _1068 = _1066;
    float _1070 = _1045;
    float _1072 = _1047;
    if (!_643)
    {
        int _1074 = _699 << 4;
        int _1076 = _1074 + 2048;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
        int _1082 = int(_1078) & 3;
        float _1084 = (*spvDescriptorSet0.vp_c15)._m0[int(_1080)][_1082];
        int _1086 = int(_1078) + 1;
        uint _1088 = uint(int(uint(_1086) >> uint(2)));
        int _1090 = _1086 & 3;
        float _1092 = (*spvDescriptorSet0.vp_c15)._m0[int(_1088)][_1090];
        int _1094 = _1076 + 8;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        uint _1098 = uint(int(uint(int(_1096)) >> uint(2)));
        int _1100 = int(_1096) & 3;
        float _1102 = (*spvDescriptorSet0.vp_c15)._m0[int(_1098)][_1100];
        int _1104 = int(_1096) + 1;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        int _1108 = _1104 & 3;
        float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
        float _1112 = _412 * _1092;
        float _1114 = fma(_310, _1084, _1112);
        float _1116 = fma(_312, _1102, _1114);
        float _1118 = _1116 + _1110;
        float _1120 = precise::clamp(_1118, 0.0, 1.0);
        float _1122 = -_1120;
        float _1124 = _1122 + _1064;
        float _1126 = fma(_1124, 500.0, 1.5);
        float _1128 = exp2(_1126);
        float _1130 = 0.0 + _1128;
        float _1132 = precise::clamp(_1130, 0.0, 1.0);
        _1019 = _1110;
        _1068 = _1132;
    }
    float _1134 = _1019;
    float _1136 = _1068;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _817 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1144 = _819 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _821 + _1146;
    float _1150 = in.m_69.x;
    float _1152 = _1140 * _1140;
    float _1154 = in.m_67.w;
    float _1156 = fma(_1144, _1144, _1152);
    float _1158 = in.m_67.z;
    float _1160 = fma(_1148, _1148, _1156);
    float _1162 = rsqrt(_1160);
    float _1164 = sqrt(_1160);
    float _1166 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1168 = _1144 * _1166;
    float _1170 = _1148 * _1166;
    float _1172 = _1168 * _1168;
    float _1174 = _1170 * _1170;
    float _1176 = _1172 + _1174;
    float _1178 = sqrt(_1176);
    bool _1180 = _1178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1184 = _1178 + _1182;
    float _1186 = _1148;
    float _1188 = _1162;
    float _1190 = _1184;
    float _1192 = _1166;
    bool _1194 = _1180;
    float _1196 = _1158;
    if (_1180)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1198;
    }
    float _1200 = _1186;
    if (_1180)
    {
        float _1202 = rsqrt(_1176);
        _1188 = _1202;
    }
    float _1204 = _1188;
    float _1206 = _1204;
    if (_1180)
    {
        float _1208 = _1184 * _1200;
        _1190 = _1208;
    }
    float _1210 = _1190;
    if (_1180)
    {
        float _1212 = _1210 * 0.15915493667125701904296875;
        _1041 = _1212;
    }
    float _1214 = _1041;
    float _1216 = _1200;
    float _1218 = _1214;
    if (_1180)
    {
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        _1216 = _1222;
    }
    float _1224 = _1216;
    float _1226 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1228 = precise::max(0.0, _1226);
    float _1230 = _1134;
    float _1232 = _1228;
    if (_1180)
    {
        float _1234 = _1214 * 6.283185482025146484375;
        float _1236 = cos(_1234);
        _1230 = _1236;
    }
    float _1238 = _1230;
    float _1240 = -_1166;
    float _1242 = -_1228;
    float _1244 = fma(_1140, _1240, _1242);
    float _1246 = _1244;
    if (_1180)
    {
        float _1248 = _1244 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1248;
    }
    float _1250 = _1232;
    float _1252 = _1224;
    float _1254 = _1250;
    if (_1180)
    {
        float _1256 = fma(_1224, _1250, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = _1258;
    float _1262 = _1238;
    if (_1180)
    {
        float _1264 = _1238 + (-1.0);
        _1254 = _1264;
    }
    float _1266 = _1254;
    float _1268 = _1266;
    if (_1180)
    {
        float _1270 = _1204 * _1258;
        _1192 = _1270;
    }
    float _1272 = _1192;
    if (!_1180)
    {
        _1260 = _1168;
    }
    float _1274 = _1260;
    float _1276 = _1274;
    if (_1180)
    {
        float _1278 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1278;
    }
    float _1280 = _1218;
    if (_1180)
    {
        float _1282 = _1168 * _1272;
        _1276 = _1282;
    }
    float _1284 = _1276;
    if (!_1180)
    {
        _1268 = _1170;
    }
    float _1286 = _1268;
    float _1288 = _1286;
    if (_1180)
    {
        float _1290 = _1170 * _1272;
        _1288 = _1290;
    }
    float _1292 = _1288;
    if (!_1180)
    {
        _1206 = _1172;
    }
    float _1294 = _1206;
    float _1296 = _1294;
    if (_1180)
    {
        float _1298 = fma(_1244, _1238, _1280);
        _1246 = _1298;
    }
    float _1300 = _1246;
    if (_1180)
    {
        float _1302 = _1284 * _1284;
        _1296 = _1302;
    }
    float _1304 = _1296;
    if (!_1180)
    {
        _1262 = _1174;
    }
    float _1306 = _1262;
    float _1308 = _1306;
    if (_1180)
    {
        float _1310 = _1292 * _1292;
        _1308 = _1310;
    }
    float _1312 = _1308;
    float _1314 = fma(_1300, _1300, _1304);
    float _1316 = in.m_69.y;
    float _1318 = _1314 + _1312;
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1322 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1320);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = -_1324;
    float _1328 = _1326 + 1.0;
    float _1330 = rsqrt(_1318);
    float _1332 = _1330 * _1284;
    float _1334 = _1330 * _1300;
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1338 = _1330 * _1292;
    float _1340 = abs(_1328);
    float _1342 = log2(_1340);
    float _1344 = -_1336;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1344);
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1350 = _1348 != 0;
    float _1352 = -_1338;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1346);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1358 = _1356 != 0;
    float _1360 = fma(_1354, -0.5, 0.5);
    float _1362 = fma(_1354, 0.5, 0.5);
    float _1364 = fma(_1362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1366 = sqrt(_1360);
    float _1368 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1370 = _1174;
    float _1372 = _1368;
    if (_1350)
    {
        float _1374 = in.m_67.x;
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = fma(_1362, _1364, -0.212114393711090087890625);
    float _1380 = _1334 + 1.0;
    float _1382 = fma(_1362, _1378, 1.570728778839111328125);
    float _1384 = exp2(_1368);
    float _1386 = _1366 * 0.636619746685028076171875;
    if (!_1350)
    {
        _1372 = _1150;
    }
    float _1388 = _1372;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = -_1382;
    float _1394 = fma(_1386, _1392, 1.0);
    float _1396 = -_1334;
    float _1398 = fma(_1384, _1380, _1396);
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1402 = fma(_1398, 0.5, 0.5);
    float2 _4591 = float2(_1394, _1402);
    float3 _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).xyz;
    float _1408 = _1406.x;
    float _1410 = _1406.y;
    float _1412 = _1406.z;
    float _1414 = 0.0;
    float _1416 = _1388;
    int _1418 = as_type<int>(_1398);
    if (!_1350)
    {
        _1414 = _1388;
    }
    float _1420 = _1414;
    float _1422 = -_1316;
    float _1424 = _1422 + 1.0;
    float _1426 = _1420;
    int _1428 = as_type<int>(_1316);
    if (_1350)
    {
        _1416 = _1150;
    }
    float _1430 = _1416;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1434 = _1430;
    if (_1350)
    {
        bool _1436 = _1376 > 0.5;
        _1194 = _1436;
    }
    bool _1438 = _1194;
    float _1440 = _1150;
    if (_1358)
    {
        float _1442 = in.m_67.z;
        _1440 = _1442;
    }
    float _1444 = _1440;
    bool _1446 = _1154 > 0.5;
    if (_1350)
    {
        float _1448 = -_1430;
        float _1450 = _1448 + 1.0;
        _1418 = as_type<int>(_1450);
    }
    int _1452 = _1418;
    bool _1454 = _1158 > 0.5;
    out.m_71.y = _1316;
    int _1456 = _1446 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    if (_1350)
    {
        float _1460 = _1438 ? as_type<float>(_1452) : _1430;
        _1426 = _1460;
    }
    float _1462 = _1426;
    float _1464 = _342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1466 = _342 > 0.5;
    float _1468 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1472 = _1470 != 0;
    float _1474 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1476 = _1466 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1478 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1480 = _1454 ? as_type<int>(_1424) : as_type<int>(_1316);
    float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1484 = _1472 ? as_type<float>(_1476) : _1316;
    float _1486 = _891 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1490 = _1488 != 0;
    float _1492 = -_330;
    float _1494 = _1492 + 1.0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1498 = _1496 != 0;
    float _1500 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1502 = _1490 ? as_type<float>(_1480) : _1316;
    float _1504 = exp2(_1474);
    int _1506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1508 = _1506 != 0;
    float _1510 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1486);
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1514 = _1512 != 0;
    float _1516 = fma(_1478, _1502, -0.5);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1520 = _1518 != 0;
    float _1522 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1524 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1526 = _1520 ? as_type<float>(_1480) : _1316;
    float _1528 = fma(_1522, _1484, -0.5);
    bool _1530 = _336 != 0.0;
    bool _1532 = isnan(_336);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    float _1540 = in.m_73.x;
    float _1542 = in.m_73.y;
    float _1544 = in.m_73.z;
    float _1546 = _1514 ? as_type<float>(_1456) : _1316;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1550 = _334 == 0.0;
    bool _1552 = !_1538;
    bool _1554 = _1550 && _1552;
    float _1556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1558 = _1514;
    int _1560 = as_type<int>(_1478);
    float _1562 = _1500;
    if (_1358)
    {
        bool _1564 = _1444 > 0.5;
        _1558 = _1564;
    }
    bool _1566 = _1558;
    float _1568 = fma(_1464, -2.0, _1548);
    if (_1508)
    {
        float _1570 = -_1430;
        float _1572 = _1570 + 1.0;
        _1560 = as_type<int>(_1572);
    }
    int _1574 = _1560;
    bool _1576 = _338 == 0.0;
    bool _1578 = _1576 && _1554;
    float _1580 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1568);
    float _1582 = fma(_1500, _1526, -0.5);
    float _1584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1588 = as_type<int>(_1586);
    float _1590 = as_type<float>(_1574);
    if (_1358)
    {
        float _1592 = -_1430;
        float _1594 = _1592 + 1.0;
        _1428 = as_type<int>(_1594);
    }
    int _1596 = _1428;
    if (!_1508)
    {
        _1562 = _1430;
    }
    float _1598 = _1562;
    float _1600 = fma(_1524, _1546, -0.5);
    float _1602 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1586);
    float _1604 = _1598;
    if (_1498)
    {
        float _1606 = -_1430;
        float _1608 = _1606 + 1.0;
        _1588 = as_type<int>(_1608);
    }
    int _1610 = _1588;
    if (_1508)
    {
        float _1612 = _1466 ? as_type<float>(_1574) : _1430;
        _1604 = _1612;
    }
    float _1614 = _1604;
    float _1616 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1510);
    float _1618 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1602);
    float _1620 = 0.0;
    float _1622 = _1618;
    if (!_1358)
    {
        _1620 = _1430;
    }
    float _1624 = _1620;
    out.m_75.x = _819;
    out.m_75.y = _817;
    out.m_75.z = _821;
    float _1626 = 0.0;
    float _1628 = _1624;
    if (_1578)
    {
        _1626 = _1540;
    }
    float _1630 = _1626;
    float _1632 = -_1580;
    float _1634 = fma(_1618, _1528, _1632);
    float _1636 = 0.0;
    float _1638 = _1630;
    if (_1578)
    {
        _1636 = _1542;
    }
    float _1640 = _1636;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1644 = _1640;
    if (_1578)
    {
        _1590 = _1630;
    }
    float _1646 = _1590;
    float _1648 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1616);
    float _1650 = _1646;
    if (_1578)
    {
        _1622 = _1640;
    }
    float _1652 = _1622;
    float _1654 = 0.0;
    float _1656 = _1652;
    if (!_1498)
    {
        _1654 = _1430;
    }
    float _1658 = _1654;
    float _1660 = _1658;
    if (!_1578)
    {
        _1638 = _1540;
    }
    float _1662 = _1638;
    float _1664 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_1578)
    {
        _1644 = _1542;
    }
    float _1666 = _1644;
    float _1668 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1358)
    {
        float _1670 = _1566 ? as_type<float>(_1596) : _1430;
        _1628 = _1670;
    }
    float _1672 = _1628;
    float _1674 = fma(_1664, _1614, -0.5);
    if (_1498)
    {
        float _1676 = _1466 ? as_type<float>(_1610) : _1430;
        _1660 = _1676;
    }
    float _1678 = _1660;
    if (!_1578)
    {
        float _1680 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1666);
        _1656 = _1680;
    }
    float _1682 = _1656;
    float _1684 = 0.0;
    if (_1578)
    {
        _1684 = _1544;
    }
    float _1686 = _1684;
    float _1688 = fma(_1468, _1672, -0.5);
    float _1690 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1692 = fma(_1668, _1678, -0.5);
    float _1694 = _1686;
    if (_1578)
    {
        _1434 = _1686;
    }
    float _1696 = _1434;
    float _1698 = _1696;
    if (!_1578)
    {
        float _1700 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1662);
        _1650 = _1700;
    }
    float _1702 = _1650;
    if (!_1578)
    {
        _1694 = _1544;
    }
    float _1704 = _1694;
    float _1706 = fma(_1690, _1462, -0.5);
    float _1708 = in.m_77.x;
    float _1710 = in.m_77.y;
    float _1712 = in.m_77.z;
    float _1714 = in.m_77.w;
    if (!_1578)
    {
        float _1716 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1704);
        _1698 = _1716;
    }
    float _1718 = _1698;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1740 = _751 != 1;
    out.m_79.x = _1728;
    out.m_79.y = _1730;
    out.m_79.z = _1732;
    out.m_79.w = _1726;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1748 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1750 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1752 = _1712 * _1662;
    float _1754 = _1708 * _1666;
    float _1756 = _1710 * _1704;
    float _1758 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1746);
    float _1760 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1748);
    float _1762 = fma(_1708, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1750);
    float _1764 = -_1752;
    float _1766 = fma(_1708, _1704, _1764);
    float _1768 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = -_1754;
    float _1772 = fma(_1710, _1662, _1770);
    float _1774 = -_1756;
    float _1776 = fma(_1712, _1666, _1774);
    float _1778 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1758);
    float _1780 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1760);
    float _1782 = fma(_1712, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1762);
    float _1784 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1786 = _1766 * _1714;
    float _1788 = _1776 * _1714;
    float _1790 = _1772 * _1714;
    out.m_81.x = _1742;
    out.m_81.y = _1744;
    out.m_81.z = _1768;
    float _1792 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    out.m_83.x = _1778;
    out.m_83.y = _1780;
    out.m_83.z = _1782;
    bool _1796 = _753 != 2;
    float _1798 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1800 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1802 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _957;
    out.gl_Position.y = _963;
    out.gl_Position.z = _1648;
    out.gl_Position.w = _937;
    float _1804 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1784);
    float _1806 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1792);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1812 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1794);
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1818 = _755 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1820 = _757 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1824 = _759 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1826 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1814);
    float _1828 = -_1816;
    float _1830 = fma(_1818, 2.0, _1828);
    float _1832 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1810);
    float _1834 = fma(_1820, -2.0, _1808);
    float _1836 = -_1822;
    float _1838 = fma(_1824, 2.0, _1836);
    float _1840 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1826);
    float _1842 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1812);
    float _1844 = -_160;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1830);
    float _1848 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1832);
    float _1850 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1834);
    float _1852 = fma(_1702, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1798);
    float _1854 = _1786 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1856 = fma(_1842, _1674, _1846);
    float _1858 = -_1850;
    float _1860 = fma(_1848, _1582, _1858);
    float _1862 = _1846;
    float _1864 = _1788;
    float _1866 = _1848;
    if (!_1740)
    {
        _1862 = _342;
    }
    float _1868 = _1862;
    float _1870 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1800);
    float _1872 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1854);
    float _1874 = -_160;
    float _1876 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1838);
    float _1878 = fma(_1788, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
    float _1880 = _1868;
    if (_1796)
    {
        _1864 = _759;
    }
    float _1882 = _1864;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1886 = fma(_1840, _1706, _1876);
    float _1888 = _1882;
    if (!_1796)
    {
        _1888 = _1158;
    }
    float _1890 = _1888;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1894 = _1890;
    if (!_1740)
    {
        _1866 = _1868;
    }
    float _1896 = _1866;
    float _1898 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1884);
    float _1900 = _1896;
    if (_1740)
    {
        _1880 = _342;
    }
    float _1902 = _1880;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1906 = _1902;
    if (!_1740)
    {
        _386 = _1158;
    }
    float _1908 = _386;
    float _1910 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1912 = _1908;
    if (_1740)
    {
        _1196 = _1902;
    }
    float _1914 = _1196;
    float _1916 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1892);
    if (_1740)
    {
        _1912 = _1902;
    }
    float _1918 = _1912;
    float _1920 = -_1904;
    float _1922 = fma(_1910, 2.0, _1920);
    if (!_1796)
    {
        _1906 = _759;
    }
    float _1924 = _1906;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1740)
    {
        _1894 = _1896;
    }
    float _1928 = _1894;
    float _1930 = -_160;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1922);
    float _1934 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1936 = _1928;
    if (_1740)
    {
        _1900 = _759;
    }
    float _1938 = _1900;
    float _1940 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1926);
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1740)
    {
        _1936 = _759;
    }
    float _1944 = _1936;
    float _1946 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1916);
    float _1948 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1952 = abs(_440);
    float _1954 = log2(_1952);
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1958 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1942);
    float _1960 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1872);
    float _1962 = -_1950;
    float _1964 = fma(_1956, 2.0, _1962);
    float _1966 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1958);
    float _1968 = _1886 + 0.5;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1972 = -_160;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1964);
    float _1976 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1898);
    float _1978 = fma(_1934, -2.0, _1970);
    float _1980 = fma(_1966, _1688, _1974);
    float _1982 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1940);
    float _1984 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1870);
    float _1986 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1988 = _1980 + 0.5;
    float _1990 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1978);
    float _1992 = fma(_1790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1878);
    float _1994 = exp2(_1986);
    float _1996 = _1634 + 0.5;
    float _1998 = -_1990;
    float _2000 = fma(_1982, _1600, _1998);
    out.m_85.x = _1984;
    out.m_85.y = _1960;
    out.m_85.z = _1992;
    bool _2002 = _440 <= 8000.0;
    bool _2004 = isnan(_440);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan(8000.0);
    bool _2010 = _2006 || _2008;
    float _2012 = float(_2010);
    float _2014 = _2000 + 0.5;
    float _2016 = _957 + _937;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2020 = _1856 + 0.5;
    out.m_87.x = _1968;
    out.m_87.y = _1996;
    out.m_87.z = _1988;
    out.m_87.w = _2014;
    float _2022 = fma(_1948, -2.0, _2018);
    float _2024 = _1648 + _937;
    float _2026 = _2016 * 0.5;
    float _2028 = _1860 + 0.5;
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2032 = precise::clamp(_2030, 0.0, 1.0);
    float _2034 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1806);
    float _2036 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1804);
    float _2038 = fma(_1718, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1852);
    float _2040 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2022);
    float _2042 = _2024 * 0.5;
    float _2044 = fma(_1946, _1692, _1932);
    out.m_89.x = _2020;
    out.m_89.y = _2028;
    float _2046 = -_2040;
    float _2048 = fma(_1976, _1516, _2046);
    float _2050 = _937 * 0.5;
    float _2052 = _2044 + 0.5;
    float _2054 = _2048 + 0.5;
    out.m_91.x = _2034;
    out.m_91.y = _2036;
    out.m_91.z = _2038;
    float _2056 = fma(_2032, -2.0, 3.0);
    float _2058 = _2032 * _2032;
    float _2060 = fma(_963, -0.5, _2050);
    out.m_93.x = _2052;
    out.m_93.y = _2054;
    float _2062 = _2058 * _2056;
    out.m_95.x = _2026;
    out.m_95.y = _2060;
    out.m_95.z = _2042;
    out.m_95.w = _937;
    float _2064 = -_2062;
    float _2066 = _2064 + 1.0;
    out.m_97.z = _2042;
    out.m_97.w = _937;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    float _2070 = -_1504;
    float _2072 = _2070 + 1.0;
    float _2074 = _2012 * _2068;
    float _2076 = _2068;
    if (!_923)
    {
        _2076 = 1.0;
    }
    float _2078 = _2076;
    float _2080 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2082 = _2078;
    if (_923)
    {
        bool _2084 = _1045 >= _979;
        bool _2086 = isnan(_1045);
        bool _2088 = _2084 || _2086;
        bool _2090 = isnan(_979);
        bool _2092 = _2088 || _2090;
        float _2094 = float(_2092);
        _2082 = _2094;
    }
    float _2096 = _2082;
    float _2098 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2100 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2102 = isnan(_1164);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2108 = _2104 || _2106;
    float _2110 = _1494 * _2098;
    float _2112 = precise::clamp(_2110, 0.0, 1.0);
    float _2114 = _2080 * _1047;
    float _2116 = _2096 * _1136;
    float _2118 = -_2080;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2112;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2126 = _1058 * _2114;
    float _2128 = _1058 * _2120;
    float _2130 = -_2116;
    float _2132 = fma(_2130, _2124, 1.0);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = _2134;
    float _2138 = _2114;
    if (!_2108)
    {
        _1070 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2140 = _1070;
    float _2142 = _1412 * _2114;
    float _2144 = fma(_1408, _2126, _1052);
    float _2146 = fma(_1410, _2126, _1054);
    float _2148 = _2134 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2150 = fma(_1058, _2142, _1056);
    float _2152 = _2140;
    float _2154 = _2140;
    if (!_2108)
    {
        _983 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2156 = _983;
    float _2158 = _2156;
    float _2160 = _2156;
    if (!_2108)
    {
        _1072 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2162 = _1072;
    out.m_99.x = _2148;
    float _2164 = _2162;
    float _2166 = _2162;
    if (!_2108)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2168 = _2136;
    float _2170 = _2168;
    float _2172 = _2168;
    if (!_2108)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2174 = _2138;
    out.m_101.x = _2144;
    out.m_101.y = _2146;
    out.m_101.z = _2150;
    out.m_101.w = _2128;
    float _2176 = _2174;
    float _2178 = _2174;
    if (!_2108)
    {
        _731 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2180 = _731;
    bool _2182 = !_2108;
    float _2184 = _2180;
    float _2186 = _2180;
    if (!_2182)
    {
        bool _2188 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2190 = isnan(_1164);
        bool _2192 = _2188 || _2190;
        bool _2194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2196 = _2192 || _2194;
        if (!_2196)
        {
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = _1164 + _2198;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2204 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2202;
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2210 = 1.0 / _2204;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2228 = _2200 * _2210;
            float _2230 = precise::clamp(_2228, 0.0, 1.0);
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2236 = fma(_2230, _2208, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2238 = fma(_2230, _2234, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2240 = fma(_2230, _2214, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2242 = fma(_2230, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2244 = fma(_2230, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2246 = fma(_2230, _2226, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2160 = _2236;
            _2178 = _2244;
            _2154 = _2240;
            _2172 = _2242;
            _2166 = _2238;
            _2186 = _2246;
            _2248 = true;
        }
        else
        {
            bool _2250 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2252 = isnan(_1164);
            bool _2254 = _2250 || _2252;
            bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2258 = _2254 || _2256;
            if (!_2258)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2260 = _2152;
            _2154 = _2260;
            if (!_2258)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2262 = _2158;
            _2160 = _2262;
            if (!_2258)
            {
                _2164 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2264 = _2164;
            _2166 = _2264;
            if (!_2258)
            {
                _2170 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2266 = _2170;
            _2172 = _2266;
            if (!_2258)
            {
                _2176 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2268 = _2176;
            _2178 = _2268;
            if (!_2258)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2270 = _2184;
            bool _2272 = !_2258;
            _2186 = _2270;
            if (!_2272)
            {
                bool _2274 = _1164 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2276 = isnan(_1164);
                bool _2278 = _2274 || _2276;
                bool _2280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2282 = _2278 || _2280;
                if (!_2282)
                {
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = _1164 + _2284;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2290 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2288;
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2294 = _2292 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2296 = 1.0 / _2290;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2314 = _2286 * _2296;
                    float _2316 = precise::clamp(_2314, 0.0, 1.0);
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2322 = fma(_2316, _2294, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2324 = fma(_2316, _2320, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2326 = fma(_2316, _2300, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2328 = fma(_2316, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2330 = fma(_2316, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2332 = fma(_2316, _2312, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2160 = _2322;
                    _2178 = _2330;
                    _2154 = _2326;
                    _2172 = _2328;
                    _2166 = _2324;
                    _2186 = _2332;
                    _2248 = true;
                }
                else
                {
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2178 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2172 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2166 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2248 = false;
    float _2334 = _2160;
    float _2336 = _2178;
    float _2338 = _2154;
    float _2340 = _2172;
    float _2342 = _2166;
    float _2344 = _2186;
    float _2346 = fma(_2036, -0.5, 0.5);
    float _2348 = precise::clamp(_2346, 0.0, 1.0);
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    float _2358 = -_2342;
    float _2360 = _2358 + _2344;
    bool _2362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2364 = fma(_2348, _2352, _2334);
    float _2366 = fma(_2348, _2356, _2338);
    float _2368 = fma(_2348, _2360, _2342);
    float _2370 = _2364 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2372 = fma(_2366, 0.298911988735198974609375, _2370);
    float _2374 = fma(_2368, 0.114477999508380889892578125, _2372);
    float _2376 = -_2374;
    float _2378 = _2366 + _2376;
    float _2380 = -_2374;
    float _2382 = _2364 + _2380;
    float _2384 = -_2374;
    float _2386 = _2368 + _2384;
    float _2388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2390 = fma(_2378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2392 = fma(_2382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    float _2394 = fma(_2386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2374);
    out.m_59.x = _2388;
    out.m_105.x = _2390;
    out.m_105.y = _2392;
    out.m_105.z = _2394;
    if (!_2362)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2396 = -_817;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2400 = -_819;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2404 = -_821;
    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2408 = _2398 * _2398;
    float _2410 = fma(_2402, _2402, _2408);
    float _2412 = fma(_2406, _2406, _2410);
    float _2414 = sqrt(_2412);
    float _2416 = rsqrt(_2412);
    float _2418 = -_2414;
    float _2420 = _2418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2422 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    float _2426 = _2402 * _2416;
    float _2428 = _2398 * _2416;
    float _2430 = abs(_2424);
    float _2432 = log2(_2430);
    float _2434 = _2406 * _2416;
    float _2436 = _2426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2438 = _2036 * _2428;
    float _2440 = -_2428;
    float _2442 = -_2436;
    float _2444 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2442);
    float _2446 = fma(_2034, _2426, _2438);
    float _2448 = -_2434;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2444);
    float _2452 = fma(_2038, _2434, _2446);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2458 = _2450 + _2456;
    float _2460 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2462 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = exp2(_2460);
    float _2468 = _2466 * _2464;
    float _2470 = _2454 * _2468;
    float _2472 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2474 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2472;
    out.m_103.y = _2474;
    out.m_103.z = _2476;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

