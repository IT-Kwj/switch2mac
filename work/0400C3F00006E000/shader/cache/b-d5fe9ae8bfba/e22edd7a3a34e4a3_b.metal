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
    float4 m_79 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_77 [[user(locn13)]];
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
    float4 m_67 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2244 = false;
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
        float _2531 = as_type<float>(_142);
        out.gl_Position.z = _2531;
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
        float _2599 = as_type<float>(_176);
        out.gl_Position.z = _2599;
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
    float2 _2848 = float2(_324, _328);
    float _330 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2848, float2(0.0), isnan(_2848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2848, float2(0.0), isnan(_2848)), level(0.0)).x;
    float _332 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = in.m_65.y;
    float _336 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _338 = in.m_67.x;
    float _340 = in.m_67.y;
    float _342 = in.m_67.z;
    float _344 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _346 = in.m_69.x;
    float _348 = in.m_69.y;
    float _350 = in.m_69.z;
    float _352 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _354 = _344 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _358 = _356 != 0;
    float _360 = _354 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _362 = _354 + _352;
    float _364 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _360);
    float _366 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].z, _364);
    float _368 = _354 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _370 = 0.0;
    int _372 = 2;
    float _374 = _354;
    float _376 = _310;
    float _378 = _340;
    float _380 = _342;
    if (_358)
    {
        float _382 = in.m_65.x;
        _370 = _382;
    }
    float _384 = _370;
    int _386 = 0;
    if (_358)
    {
        _386 = 0;
    }
    int _388 = _386;
    float _390 = _366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _392 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _368);
    int _394 = 0;
    int _396 = _388;
    if (_358)
    {
        _394 = 0;
    }
    int _398 = _394;
    float _400 = 1.0 / _390;
    float _402 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].z, _392);
    float _404 = _402 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _406 = _404 + _390;
    float _408 = _406 * _400;
    float _410 = _408 * 0.5;
    float _412 = 0.0;
    int _414 = _398;
    float _416 = _384;
    if (_358)
    {
        _412 = _384;
    }
    float _418 = _412;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _422 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _420);
    float _424 = 1.0 / _422;
    float _426 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    float _428 = fma(_348, 16.0, _426);
    float _430 = _428 * 0.15915493667125701904296875;
    float _432 = in.m_63.x;
    float _434 = in.m_63.y;
    float _436 = in.m_63.z;
    float _438 = _430 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _444 = _424 * _442;
    bool _446 = _444 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _448 = _362 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _450 = _444 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _452 = !_446;
    int _454 = _452 ? 0 : 1;
    float _456 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _448);
    float _458 = fma(_440, 0.5, 0.5);
    float _460 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[127].z, _456);
    float _462 = _458 * 0.004999999888241291046142578125;
    float _464 = _418;
    if (!_446)
    {
        _372 = 1;
    }
    int _466 = _372;
    float _468 = _460 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _470 = _466;
    float _472 = _468;
    if (!_450)
    {
        _470 = _454;
    }
    int _474 = _470;
    float _476 = fma(_338, _462, _346);
    float _478 = fma(_340, _462, _348);
    float _480 = fma(_342, _462, _350);
    int _482 = _474 << 6;
    float _484 = _432 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = _362 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _490 = _482 + 96;
    uint _493 = uint(int(uint(_490) >> uint(2)));
    uint _495 = uint(int(uint(int(_493)) >> uint(2)));
    int _497 = int(_493) & 3;
    float _499 = (*spvDescriptorSet0.vp_c15)._m0[int(_495)][_497];
    int _501 = int(_493) + 1;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    int _505 = _501 & 3;
    float _507 = (*spvDescriptorSet0.vp_c15)._m0[int(_503)][_505];
    float _509 = _436 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _511 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _513 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _488);
    float _515 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _517 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _480);
    float _521 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[126].z, _513);
    int _523 = _482 + 104;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    uint _527 = uint(int(uint(int(_525)) >> uint(2)));
    int _529 = int(_525) & 3;
    float _531 = (*spvDescriptorSet0.vp_c15)._m0[int(_527)][_529];
    int _533 = int(_525) + 1;
    uint _535 = uint(int(uint(_533) >> uint(2)));
    int _537 = _533 & 3;
    float _539 = (*spvDescriptorSet0.vp_c15)._m0[int(_535)][_537];
    float _541 = trunc(_468);
    int _543 = int(_541);
    float _545 = _519 * _517;
    float _547 = _521 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _478);
    int _551 = _482 + 48;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = int(_553) + 1;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    int _565 = _561 & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    float _569 = _549 * _511;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _476);
    float _573 = trunc(_547);
    int _575 = int(_573);
    float _577 = _569 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _579 = _571 * _515;
    float _581 = _569 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _583 = _482 + 64;
    uint _585 = uint(int(uint(_583) >> uint(2)));
    uint _587 = uint(int(uint(int(_585)) >> uint(2)));
    int _589 = int(_585) & 3;
    float _591 = (*spvDescriptorSet0.vp_c15)._m0[int(_587)][_589];
    int _593 = int(_585) + 1;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    int _597 = _593 & 3;
    float _599 = (*spvDescriptorSet0.vp_c15)._m0[int(_595)][_597];
    int _601 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _603 = _543 + _601;
    int _605 = _603 + 1;
    float _607 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[10].x, _577);
    float _609 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[8].x, _581);
    float _611 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[10].z, _607);
    float _613 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[8].z, _609);
    int _615 = _482 + 72;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    uint _619 = uint(int(uint(int(_617)) >> uint(2)));
    int _621 = int(_617) & 3;
    float _623 = (*spvDescriptorSet0.vp_c15)._m0[int(_619)][_621];
    int _625 = int(_617) + 1;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    int _629 = _625 & 3;
    float _631 = (*spvDescriptorSet0.vp_c15)._m0[int(_627)][_629];
    float _633 = _312 + _611;
    float _635 = _310 + _613;
    int _637 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _639 = _575 + _637;
    int _641 = _639 + 1;
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _633 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _649 = _635 + _647;
    int _651 = _482 + 56;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.vp_c15)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.vp_c15)._m0[int(_663)][_665];
    bool _669 = _641 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _671 = _645 * _645;
    int _673 = _641 | _605;
    float _675 = fma(_649, _649, _671);
    bool _677 = _673 < 0;
    bool _679 = _677 || _669;
    int _681 = _482 + 80;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.vp_c15)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.vp_c15)._m0[int(_693)][_695];
    float _699 = _362 * _507;
    float _701 = _569 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _703 = _605 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _705 = _703 || _679;
    float _707 = sqrt(_675);
    float _709 = fma(_310, _499, _699);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[9].x, _701);
    float _713 = fma(_312, _531, _709);
    float _715 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[9].z, _711);
    float _717 = _713 + _539;
    float _719 = _354 + _715;
    int _721 = as_type<int>(_579);
    int _723 = as_type<int>(_545);
    int _725 = as_type<int>(_717);
    float _727 = _719;
    float _729 = _675;
    float _731 = _645;
    float _733 = as_type<float>(_605);
    if (_358)
    {
        _374 = _334;
    }
    float _735 = _374;
    float _737 = _362 * _567;
    float _739 = _735;
    float _741 = _559;
    if (!_705)
    {
        int _743 = _605 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _745 = _743 + _641;
        _721 = _745;
    }
    int _747 = _721;
    float _749 = fma(_310, _559, _737);
    bool _751 = _707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _753 = _362 * _599;
    float _755 = 1.0 / _717;
    float _757 = fma(_310, _591, _753);
    float _759 = fma(_312, _623, _757);
    float _761 = fma(_312, _659, _749);
    float _763 = _749;
    if (!_358)
    {
        float _765 = in.m_65.x;
        float _767 = _334 * 3.1415927410125732421875;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _765 * 3.1415927410125732421875;
        float _777 = _775 * 0.15915493667125701904296875;
        float _779 = _777 * 6.283185482025146484375;
        float _781 = sin(_779);
        _763 = _777;
        _414 = 2;
        _416 = _765;
        _396 = 1;
        _464 = _781;
        _739 = _773;
    }
    float _783 = _763;
    int _785 = _414;
    float _787 = _416;
    int _789 = _396;
    float _791 = _464;
    float _793 = _739;
    float _795 = _783;
    float _797 = _793;
    if (!_705)
    {
        int _799 = _747 << 2;
        _723 = _799;
    }
    int _801 = _723;
    int _803 = _801;
    if (!_751)
    {
        _795 = _635;
    }
    float _805 = _795;
    float _807 = _805;
    if (!_751)
    {
        _741 = _633;
    }
    float _809 = _741;
    float _811 = _809;
    if (!_705)
    {
        uint _813 = uint(int(uint(_747) >> uint(2)));
        _725 = int(_813);
    }
    int _815 = _725;
    if (!_705)
    {
        int _817 = 12 & _801;
        _803 = _817;
    }
    int _819 = _803;
    bool _821 = !_751;
    if (!_821)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _827 = _707 + _825;
        float _829 = _719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _831 = rsqrt(_675);
        float _833 = _827 * _823;
        float _835 = _833 * 0.15915493667125701904296875;
        float _837 = _835 * 6.283185482025146484375;
        float _839 = cos(_837);
        float _841 = _835 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _839 + (-1.0);
        float _847 = _845 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _849 = fma(_843, _829, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = fma(_719, _839, _847);
        float _853 = _831 * _849;
        float _855 = fma(_649, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _857 = fma(_645, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _727 = _851;
        _807 = _855;
        _811 = _857;
        _729 = _831;
    }
    float _859 = _727;
    float _861 = _807;
    float _863 = _811;
    float _865 = _729;
    float _867 = _759 + _631;
    if (!_705)
    {
        int _869 = _815 << 4;
        int _871 = _869 + _819;
        _731 = as_type<float>(_871);
    }
    float _873 = _731;
    int _875 = _482 + 88;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    float _893 = _761 + _667;
    float _895 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _897 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _899 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _901 = _893 * _755;
    float _903 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _895);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _897);
    float _907 = _873;
    if (!_705)
    {
        int _909 = as_type<int>(_873) + 400;
        uint _911 = uint(int(uint(_909) >> uint(2)));
        uint _913 = uint(int(uint(int(_911)) >> uint(2)));
        int _915 = int(_911) & 3;
        float _917 = (*spvDescriptorSet0.vp_c15)._m0[int(_913)][_915];
        _907 = _917;
    }
    float _919 = _907;
    float _921 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _899);
    float _923 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    bool _925 = _901 >= 0.0;
    float _927 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _921);
    float _931 = _867 * _755;
    float _933 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _935 = _923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _937 = _901 <= 1.0;
    bool _939 = _937 && _925;
    float _941 = _927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _943 = _929 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _945 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _933);
    float _947 = _935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _949 = _931 >= 0.0;
    bool _951 = _949 && _939;
    float _953 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _955 = _943 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _957 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _945);
    float _959 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _947);
    bool _961 = _931 <= 1.0;
    bool _963 = _961 && _951;
    float _965 = -_955;
    float _967 = fma(_965, _953, 1.0);
    float _969 = _957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _971 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[7].z, _959);
    float _973 = _362 * _697;
    float _975 = _895;
    float _977 = _931;
    if (!_705)
    {
        float _979 = floor(_468);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _985 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _971);
    float _987 = fma(_310, _689, _973);
    float _989 = _935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _991 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _983);
    float _993 = log2(_967);
    float _995 = _985;
    if (_963)
    {
        float _997 = float(_474);
        _733 = _997;
    }
    float _999 = _733;
    float _1001 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _989);
    float _1003 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[4].z, _991);
    float _1005 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1001);
    float _1007 = 1.0 / _985;
    float _1009 = fma(_312, _883, _987);
    float _1011 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1003);
    float _1013 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1005);
    if (!_705)
    {
        float _1015 = -_981;
        float _1017 = _468 + _1015;
        _472 = _1017;
    }
    float _1019 = _472;
    float _1021 = _1009 + _891;
    float _1023 = _865;
    if (!_705)
    {
        float _1025 = floor(_547);
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = _1021 * _755;
    float _1031 = _993 * 0.693147182464599609375;
    float _1033 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1035 = _999;
    float _1037 = _1033;
    if (_963)
    {
        float _1039 = rint(_999);
        float _1041 = precise::max(_1039, 0.0);
        uint _1043 = uint(_1041);
        uint _1045 = clamp(_1043, 0u, 65535u);
        _1035 = as_type<float>(_1045);
    }
    float _1047 = _1035;
    float _1049 = _1011 * _1007;
    float _1051 = _1013 * _1007;
    float _1053 = fma(_1049, 0.5, 0.5);
    float _1055 = fma(_1051, -0.5, 0.5);
    float _1057 = _1021;
    float _1059 = _1049;
    float _1061 = _919;
    if (!_705)
    {
        float _1063 = rint(_919);
        float _1065 = precise::max(_1063, 0.0);
        uint _1067 = uint(_1065);
        uint _1069 = clamp(_1067, 0u, 65535u);
        _1057 = as_type<float>(_1069);
    }
    float _1071 = _1057;
    if (!_705)
    {
        float _1073 = -_1027;
        float _1075 = _547 + _1073;
        _1059 = _1075;
    }
    float _1077 = _1059;
    float _1079 = _1047;
    if (_963)
    {
        float3 _4079 = float3(_901, _931, float(as_type<int>(_1047)));
        float3 _4083 = select(_4079, float3(0.0), isnan(_4079));
        float _1081 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4083.xy, uint(rint(_4083.z)), _1029, level(0.0));
        _1079 = _1081;
    }
    float _1083 = _1079;
    float3 _4093 = float3(_1053, _1055, _1033);
    float _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4093, float3(0.0), isnan(_4093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4093, float3(0.0), isnan(_4093)), level(0.0)).x;
    float3 _4102 = float3(_1053, _1055, _1033);
    float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4102, float3(0.0), isnan(_4102)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4102, float3(0.0), isnan(_4102)), level(0.0)).xyzw;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    float _1094 = _1088.z;
    float _1096 = _1088.w;
    float _1098 = _1005;
    if (!_705)
    {
        float3 _4125 = float3(_1077, _1019, float(as_type<int>(_1071)));
        float3 _4127 = select(_4125, float3(0.0), isnan(_4125));
        float _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4127.xy, uint(rint(_4127.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4127.xy, uint(rint(_4127.z)), level(0.0)).x;
        _1098 = _1100;
    }
    float _1102 = _1098;
    float _1104 = 0.0;
    if (_705)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_705)
    {
        int _1110 = _747 << 4;
        int _1112 = _1110 + 2048;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
        int _1118 = int(_1114) & 3;
        float _1120 = (*spvDescriptorSet0.vp_c15)._m0[int(_1116)][_1118];
        int _1122 = int(_1114) + 1;
        uint _1124 = uint(int(uint(_1122) >> uint(2)));
        int _1126 = _1122 & 3;
        float _1128 = (*spvDescriptorSet0.vp_c15)._m0[int(_1124)][_1126];
        int _1130 = _1112 + 8;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
        int _1140 = int(_1132) + 1;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        int _1144 = _1140 & 3;
        float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
        float _1148 = _362 * _1128;
        float _1150 = fma(_310, _1120, _1148);
        float _1152 = fma(_312, _1138, _1150);
        float _1154 = _1152 + _1146;
        float _1156 = precise::clamp(_1154, 0.0, 1.0);
        float _1158 = -_1156;
        float _1160 = _1158 + _1102;
        float _1162 = fma(_1160, 500.0, 1.5);
        float _1164 = exp2(_1162);
        float _1166 = 0.0 + _1164;
        float _1168 = precise::clamp(_1166, 0.0, 1.0);
        _1108 = _1168;
    }
    float _1170 = _1108;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _859 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _861 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _863 + _1180;
    float _1184 = in.m_71.y;
    float _1186 = _1174 * _1174;
    float _1188 = fma(_1178, _1178, _1186);
    float _1190 = fma(_1182, _1182, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = sqrt(_1190);
    float _1196 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1198 = _1178 * _1196;
    float _1200 = _1182 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 * _1200;
    float _1206 = _1202 + _1204;
    float _1208 = sqrt(_1206);
    bool _1210 = _1208 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = _1208 + _1212;
    float _1216 = _1192;
    float _1218 = _1214;
    float _1220 = _1174;
    bool _1222 = _1210;
    if (_1210)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1216 = _1224;
    }
    float _1226 = _1216;
    if (_1210)
    {
        float _1228 = rsqrt(_1206);
        _1037 = _1228;
    }
    float _1230 = _1037;
    float _1232 = _1230;
    if (_1210)
    {
        float _1234 = _1214 * _1226;
        _1218 = _1234;
    }
    float _1236 = _1218;
    if (_1210)
    {
        float _1238 = _1236 * 0.15915493667125701904296875;
        _376 = _1238;
    }
    float _1240 = _376;
    float _1242 = _1182;
    if (_1210)
    {
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1226;
    float _1256 = _1252;
    if (_1210)
    {
        float _1258 = _1240 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1196;
    float _1266 = -_1252;
    float _1268 = fma(_1174, _1264, _1266);
    if (_1210)
    {
        float _1270 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1270;
    }
    float _1272 = _1220;
    float _1274 = _1272;
    float _1276 = _1248;
    if (_1210)
    {
        float _1278 = fma(_1248, _1272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1274 = _1278;
    }
    float _1280 = _1274;
    float _1282 = _1280;
    if (!_1210)
    {
        _1276 = _1198;
    }
    float _1284 = _1276;
    float _1286 = _1284;
    float _1288 = _1262;
    if (_1210)
    {
        float _1290 = _1262 + (-1.0);
        _1256 = _1290;
    }
    float _1292 = _1256;
    float _1294 = _1292;
    if (_1210)
    {
        float _1296 = _1230 * _1280;
        _1061 = _1296;
    }
    float _1298 = _1061;
    if (!_1210)
    {
        _1282 = _1268;
    }
    float _1300 = _1282;
    float _1302 = _1300;
    if (_1210)
    {
        float _1304 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _1304;
    }
    float _1306 = _977;
    if (_1210)
    {
        float _1308 = _1198 * _1298;
        _1286 = _1308;
    }
    float _1310 = _1286;
    if (!_1210)
    {
        _1294 = _1200;
    }
    float _1312 = _1294;
    float _1314 = _1312;
    if (_1210)
    {
        float _1316 = _1200 * _1298;
        _1314 = _1316;
    }
    float _1318 = _1314;
    if (!_1210)
    {
        _1232 = _1202;
    }
    float _1320 = _1232;
    float _1322 = _1320;
    if (_1210)
    {
        float _1324 = fma(_1268, _1262, _1306);
        _1302 = _1324;
    }
    float _1326 = _1302;
    if (_1210)
    {
        float _1328 = _1310 * _1310;
        _1322 = _1328;
    }
    float _1330 = _1322;
    if (!_1210)
    {
        _1288 = _1204;
    }
    float _1332 = _1288;
    float _1334 = _1332;
    if (_1210)
    {
        float _1336 = _1318 * _1318;
        _1334 = _1336;
    }
    float _1338 = _1334;
    float _1340 = fma(_1326, _1326, _1330);
    float _1342 = in.m_71.x;
    float _1344 = _1340 + _1338;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1194, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1354 = _1352 != 0;
    float _1356 = in.m_65.w;
    float _1358 = -_1350;
    float _1360 = _1358 + 1.0;
    float _1362 = rsqrt(_1344);
    float _1364 = abs(_1360);
    float _1366 = log2(_1364);
    float _1368 = _1202;
    float _1370 = 0.0187292993068695068359375;
    if (_1354)
    {
        float _1372 = in.m_65.x;
        _1368 = _1372;
    }
    float _1374 = _1368;
    float _1376 = _1362 * _1310;
    float _1378 = _1362 * _1326;
    float _1380 = _1362 * _1318;
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1384 = -_1382;
    float _1386 = fma(_1378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1384);
    float _1388 = -_1380;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1386);
    float _1392 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1394 = fma(_1390, -0.5, 0.5);
    float _1396 = fma(_1390, 0.5, 0.5);
    float _1398 = exp2(_1392);
    float _1400 = fma(_1396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1396, _1400, -0.212114393711090087890625);
    float _1404 = sqrt(_1394);
    float _1406 = fma(_1396, _1402, 1.570728778839111328125);
    float _1408 = _1378 + 1.0;
    float _1410 = -_1378;
    float _1412 = fma(_1398, _1408, _1410);
    float _1414 = _1404 * 0.636619746685028076171875;
    float _1416 = fma(_1412, 0.5, 0.5);
    float _1418 = -_1406;
    float _1420 = fma(_1414, _1418, 1.0);
    float2 _4620 = float2(_1420, _1416);
    float3 _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4620, float2(0.0), isnan(_4620)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4620, float2(0.0), isnan(_4620)), level(0.0)).xyz;
    float _1426 = _1424.x;
    float _1428 = _1424.y;
    float _1430 = _1424.z;
    float _1432 = _1406;
    int _1434 = as_type<int>(_1342);
    if (!_1354)
    {
        _1370 = _1342;
    }
    float _1436 = _1370;
    float _1438 = in.m_73.x;
    float _1440 = in.m_73.y;
    float _1442 = in.m_73.z;
    float _1444 = in.m_73.w;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1448 = _1446 != 0;
    float _1450 = -_1184;
    float _1452 = _1450 + 1.0;
    float _1454 = _1436;
    if (!_1354)
    {
        _1432 = _1436;
    }
    float _1456 = _1432;
    float _1458 = in.m_65.z;
    float _1460 = _1456;
    if (_1354)
    {
        _1454 = _1342;
    }
    float _1462 = _1454;
    float _1464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1466 = _1462;
    if (_1354)
    {
        bool _1468 = _1374 > 0.5;
        _1222 = _1468;
    }
    bool _1470 = _1222;
    float _1472 = _334 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1474 = _1356 > 0.5;
    if (_1354)
    {
        float _1476 = -_1462;
        float _1478 = _1476 + 1.0;
        _1434 = as_type<int>(_1478);
    }
    int _1480 = _1434;
    out.m_75.y = _1184;
    int _1482 = _1474 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1354)
    {
        float _1486 = _1470 ? as_type<float>(_1480) : _1462;
        _1460 = _1486;
    }
    float _1488 = _1460;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1492 = as_type<float>(_1480);
    if (_1448)
    {
        float _1494 = in.m_65.z;
        _1492 = _1494;
    }
    float _1496 = _1492;
    bool _1498 = _334 > 0.5;
    float _1500 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1502 = fma(_1472, -2.0, _1490);
    float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1506 = _1498 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1508 = _338 * _1442;
    float _1510 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1512 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1514 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1516 = _1458 > 0.5;
    float _1518 = -_1508;
    float _1520 = fma(_342, _1438, _1518);
    float _1522 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1510);
    float _1524 = _340 * _1438;
    float _1526 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1512);
    float _1528 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1514);
    float _1530 = _342 * _1440;
    int _1532 = _1516 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1534 = -_1524;
    float _1536 = fma(_338, _1440, _1534);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1540 = _1538 != 0;
    float _1542 = -_1530;
    float _1544 = fma(_340, _1442, _1542);
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1548 = _1546 != 0;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1552 = _1540 ? as_type<float>(_1532) : _1184;
    float _1554 = _1520 * _1444;
    bool _1556 = _1540;
    int _1558 = as_type<int>(_1528);
    float _1560 = _1458;
    if (_1448)
    {
        bool _1562 = _1496 > 0.5;
        _1556 = _1562;
    }
    bool _1564 = _1556;
    float _1566 = _1544 * _1444;
    float _1568 = _1536 * _1444;
    float _1570 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1572 = _1548 ? as_type<float>(_1506) : _1184;
    float _1574 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1550);
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1578 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1522);
    float _1580 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1584 = _1582 != 0;
    float _1586 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1574);
    float _1588 = fma(_1570, _1572, -0.5);
    float _1590 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1502);
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1594 = _1592 != 0;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1600 = _1598 != 0;
    float _1602 = -_1590;
    float _1604 = fma(_1586, _1588, _1602);
    float _1606 = _1584 ? as_type<float>(_1482) : _1184;
    float _1608 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1612 = _1610 != 0;
    float _1614 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1526);
    float _1616 = fma(_1580, _1552, -0.5);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1620 = _1612 ? as_type<float>(_1532) : _1184;
    float _1622 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1624 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1626 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1528);
    int _1628 = as_type<int>(_1590);
    int _1630 = as_type<int>(_1580);
    float _1632 = _1620;
    float _1634 = _1624;
    if (_1448)
    {
        float _1636 = -_1462;
        float _1638 = _1636 + 1.0;
        _1628 = as_type<int>(_1638);
    }
    int _1640 = _1628;
    if (_1594)
    {
        float _1642 = -_1462;
        float _1644 = _1642 + 1.0;
        _1630 = as_type<int>(_1644);
    }
    int _1646 = _1630;
    float _1648 = fma(_1608, _1606, -0.5);
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1600)
    {
        float _1652 = -_1462;
        float _1654 = _1652 + 1.0;
        _1558 = as_type<int>(_1654);
    }
    int _1656 = _1558;
    float _1658 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1662 = fma(_1622, _1620, -0.5);
    float _1664 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1624);
    if (!_1448)
    {
        _1632 = _1462;
    }
    float _1666 = _1632;
    float _1668 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1672 = _1666;
    if (!_1594)
    {
        _1634 = _1462;
    }
    float _1674 = _1634;
    float _1676 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1678 = _1674;
    if (_1448)
    {
        float _1680 = _1564 ? as_type<float>(_1640) : _1462;
        _1672 = _1680;
    }
    float _1682 = _1672;
    float _1684 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    if (_1594)
    {
        float _1686 = _1498 ? as_type<float>(_1646) : _1462;
        _1678 = _1686;
    }
    float _1688 = _1678;
    float _1690 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1660);
    if (_1600)
    {
        float _1692 = _1498 ? as_type<float>(_1656) : _1462;
        _1466 = _1692;
    }
    float _1694 = _1466;
    float _1696 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1698 = fma(_1668, _1682, -0.5);
    float _1700 = fma(_1676, _1688, -0.5);
    float _1702 = fma(_1696, _1694, -0.5);
    out.m_77.x = _1614;
    out.m_77.y = _1578;
    out.m_77.z = _1626;
    float _1704 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1710 = fma(_1704, _1488, -0.5);
    float _1712 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1726 = _478 != 0.0;
    bool _1728 = isnan(_478);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1738 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1740 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _1724;
    out.m_79.y = _1712;
    out.m_79.z = _1714;
    float _1742 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1744 = _476 == 0.0;
    bool _1746 = !_1734;
    bool _1748 = _1744 && _1746;
    float _1750 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1664);
    float _1752 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1684);
    bool _1754 = _480 == 0.0;
    bool _1756 = _1754 && _1748;
    out.m_81.x = _1738;
    out.m_81.y = _1740;
    out.m_81.z = _1742;
    out.m_81.w = _1736;
    bool _1758 = _785 != 2;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1762 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1690);
    float _1764 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    out.m_83.x = _1752;
    out.m_83.y = _1750;
    out.m_83.z = _1762;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1772 = _789 != 1;
    float _1774 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1768);
    float _1776 = _791 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1778 = _793 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1782 = -_1760;
    float _1784 = fma(_1776, 2.0, _1782);
    float _1786 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1774);
    float _1788 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1766);
    float _1790 = fma(_1778, -2.0, _1770);
    float _1792 = -_160;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1784);
    float _1796 = _1766;
    float _1798 = _1770;
    if (_1756)
    {
        _797 = _340;
    }
    float _1800 = _797;
    float _1802 = _1800;
    if (!_1756)
    {
        float _1804 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _340);
        _1802 = _1804;
    }
    float _1806 = _1802;
    if (_1758)
    {
        _378 = _787;
    }
    float _1808 = _378;
    float _1810 = fma(_1786, _1702, _1794);
    float _1812 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1788);
    float _1814 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1790);
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1818 = _1808;
    if (!_1758)
    {
        _1818 = _1458;
    }
    float _1820 = _1818;
    float _1822 = -_1814;
    float _1824 = fma(_1812, _1662, _1822);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1828 = -_1780;
    float _1830 = fma(_1764, 2.0, _1828);
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1834 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1816);
    float _1836 = _1826;
    float _1838 = _1830;
    if (_1756)
    {
        _1796 = _338;
    }
    float _1840 = _1796;
    float _1842 = _1840;
    if (!_1756)
    {
        float _1844 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[17].y, _338);
        _1842 = _1844;
    }
    float _1846 = _1842;
    if (_1756)
    {
        _1798 = _342;
    }
    float _1848 = _1798;
    float _1850 = -_1826;
    float _1852 = fma(_1832, 2.0, _1850);
    float _1854 = _1848;
    if (!_1756)
    {
        float _1856 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _342);
        _1854 = _1856;
    }
    float _1858 = _1854;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1862 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1834);
    float _1864 = -_160;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1830);
    if (!_1772)
    {
        _380 = _334;
    }
    float _1868 = _380;
    float _1870 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1860);
    float _1872 = _1868;
    if (!_1772)
    {
        _1836 = _1458;
    }
    float _1874 = _1836;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1878 = _1874;
    if (_1772)
    {
        _1560 = _334;
    }
    float _1880 = _1560;
    float _1882 = fma(_1862, _1710, _1866);
    if (!_1772)
    {
        _1838 = _1868;
    }
    float _1884 = _1838;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1888 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1876);
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1886);
    float _1892 = _1884;
    if (_1772)
    {
        _1892 = _787;
    }
    float _1894 = _1892;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1772)
    {
        _1872 = _787;
    }
    float _1898 = _1872;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1902 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1904 = _1898;
    if (_1772)
    {
        _1878 = _334;
    }
    float _1906 = _1878;
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1900);
    if (_1758)
    {
        _1904 = _334;
    }
    float _1910 = _1904;
    float _1912 = -_1896;
    float _1914 = fma(_1902, 2.0, _1912);
    float _1916 = _1910;
    if (!_1758)
    {
        _1916 = _787;
    }
    float _1918 = _1916;
    float _1920 = abs(_444);
    float _1922 = log2(_1920);
    float _1924 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1888);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1928 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1930 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1932 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1908);
    float _1934 = -_160;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1914);
    float _1938 = fma(_1928, -2.0, _1926);
    float _1940 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1890);
    float _1942 = fma(_1932, _1698, _1936);
    float _1944 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1946 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1938);
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1950 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1870);
    float _1952 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1944);
    float _1954 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1956 = fma(_1930, -2.0, _1948);
    float _1958 = -_1946;
    float _1960 = fma(_1940, _1648, _1958);
    float _1962 = _935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1964 = exp2(_1954);
    float _1966 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1956);
    float _1968 = -_160;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1852);
    float _1972 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1962);
    float _1974 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1976 = -_1966;
    float _1978 = fma(_1950, _1616, _1976);
    float _1980 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1982 = _1604 + 0.5;
    float _1984 = _1882 + 0.5;
    float _1986 = _1942 + 0.5;
    float _1988 = _1960 + 0.5;
    float _1990 = fma(_1924, _1700, _1970);
    float _1992 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1972);
    float _1994 = exp2(_1500);
    out.m_85.x = _1984;
    out.m_85.y = _1982;
    out.m_85.z = _1986;
    out.m_85.w = _1988;
    float _1996 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1974);
    float _1998 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1992);
    float _2004 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1980);
    float _2006 = _1011 + _985;
    bool _2008 = _444 <= 8000.0;
    bool _2010 = isnan(_444);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan(8000.0);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    float _2020 = _1978 + 0.5;
    out.gl_Position.x = _1011;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _2002;
    out.gl_Position.w = _985;
    float _2022 = _2002 + _985;
    float _2024 = _985 * 0.5;
    float _2026 = _2006 * 0.5;
    float _2028 = _2022 * 0.5;
    float _2030 = fma(_1013, -0.5, _2024);
    float _2032 = -_330;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1952);
    float _2038 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1996);
    float _2040 = fma(_2000, -2.0, 3.0);
    float _2042 = _2000 * _2000;
    out.m_87.x = _2026;
    out.m_87.y = _2030;
    out.m_87.z = _2028;
    out.m_87.w = _985;
    float _2044 = -_1994;
    float _2046 = _2044 + 1.0;
    float _2048 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2004);
    float _2050 = _2042 * _2040;
    float _2052 = _1810 + 0.5;
    float _2054 = _1824 + 0.5;
    float _2056 = _1990 + 0.5;
    float _2058 = -_2050;
    float _2060 = _2058 + 1.0;
    out.m_89.x = _2036;
    out.m_89.y = _2038;
    out.m_89.z = _2048;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2050);
    out.m_91.x = _2052;
    out.m_91.y = _2054;
    float _2064 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2066 = _2018 * _2062;
    float _2068 = _2062;
    float _2070 = _2046;
    if (!_963)
    {
        _2068 = 1.0;
    }
    float _2072 = _2068;
    out.m_93.x = _2056;
    out.m_93.y = _2020;
    float _2074 = _2072;
    if (_963)
    {
        bool _2076 = _1083 >= _1029;
        bool _2078 = isnan(_1083);
        bool _2080 = _2076 || _2078;
        bool _2082 = isnan(_1029);
        bool _2084 = _2080 || _2082;
        float _2086 = float(_2084);
        _2074 = _2086;
    }
    float _2088 = _2074;
    float _2090 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2092 = _2064 * _1085;
    float _2094 = -_2064;
    float _2096 = _2094 + 1.0;
    out.m_95.z = _2028;
    out.m_95.w = _985;
    float _2098 = _2034 * _2090;
    float _2100 = precise::clamp(_2098, 0.0, 1.0);
    float _2102 = _2088 * _1170;
    float _2104 = _1096 * _2092;
    float _2106 = _1096 * _2096;
    float _2108 = -_2100;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_97.x = _861;
    out.m_97.y = _859;
    out.m_97.z = _863;
    bool _2112 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2114 = isnan(_1194);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2120 = _2116 || _2118;
    float _2122 = -_2102;
    float _2124 = fma(_2122, _2110, 1.0);
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = _2126 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_99.x = _2128;
    float _2130 = _2096;
    float _2132 = _2100;
    float _2134 = _2102;
    float _2136 = _2126;
    if (!_2120)
    {
        _2130 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2138 = _2130;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2120)
    {
        _995 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2144 = _995;
    float _2146 = _2144;
    float _2148 = _2144;
    if (!_2120)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2150 = _2132;
    float _2152 = _1430 * _2092;
    float _2154 = fma(_1426, _2104, _1090);
    float _2156 = fma(_1428, _2104, _1092);
    float _2158 = _2150;
    float _2160 = _2150;
    if (!_2120)
    {
        _2070 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2162 = _2070;
    float _2164 = fma(_1096, _2152, _1094);
    float _2166 = _2162;
    float _2168 = _2162;
    if (!_2120)
    {
        _2134 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2170 = _2134;
    float _2172 = _2170;
    float _2174 = _2170;
    if (!_2120)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2176 = _2136;
    out.m_101.x = _2154;
    out.m_101.y = _2156;
    out.m_101.z = _2164;
    out.m_101.w = _2106;
    bool _2178 = !_2120;
    float _2180 = _2176;
    float _2182 = _2176;
    if (!_2178)
    {
        bool _2184 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2186 = isnan(_1194);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2192 = _2188 || _2190;
        if (!_2192)
        {
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = _1194 + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2198;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2206 = 1.0 / _2200;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2224 = _2196 * _2206;
            float _2226 = precise::clamp(_2224, 0.0, 1.0);
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2232 = fma(_2226, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2234 = fma(_2226, _2230, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2236 = fma(_2226, _2210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2238 = fma(_2226, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2240 = fma(_2226, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2242 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2148 = _2236;
            _2174 = _2240;
            _2142 = _2232;
            _2168 = _2238;
            _2160 = _2234;
            _2182 = _2242;
            _2244 = true;
        }
        else
        {
            bool _2246 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2248 = isnan(_1194);
            bool _2250 = _2246 || _2248;
            bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2254 = _2250 || _2252;
            if (!_2254)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2256 = _2140;
            _2142 = _2256;
            if (!_2254)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2258 = _2146;
            _2148 = _2258;
            if (!_2254)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2260 = _2158;
            _2160 = _2260;
            if (!_2254)
            {
                _2166 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2262 = _2166;
            _2168 = _2262;
            if (!_2254)
            {
                _2172 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2264 = _2172;
            _2174 = _2264;
            if (!_2254)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2266 = _2180;
            bool _2268 = !_2254;
            _2182 = _2266;
            if (!_2268)
            {
                bool _2270 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2272 = isnan(_1194);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2278 = _2274 || _2276;
                if (!_2278)
                {
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = _1194 + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2284;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2292 = 1.0 / _2286;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2310 = _2282 * _2292;
                    float _2312 = precise::clamp(_2310, 0.0, 1.0);
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2318 = fma(_2312, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2148 = _2322;
                    _2174 = _2326;
                    _2142 = _2318;
                    _2168 = _2324;
                    _2160 = _2320;
                    _2182 = _2328;
                    _2244 = true;
                }
                else
                {
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2174 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2168 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2244 = false;
    float _2330 = _2148;
    float _2332 = _2174;
    float _2334 = _2142;
    float _2336 = _2168;
    float _2338 = _2160;
    float _2340 = _2182;
    float _2342 = fma(_2038, -0.5, 0.5);
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = -_2330;
    float _2348 = _2346 + _2332;
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    bool _2358 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2360 = fma(_2344, _2348, _2330);
    float _2362 = fma(_2344, _2352, _2334);
    float _2364 = fma(_2344, _2356, _2338);
    float _2366 = _2360 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2368 = fma(_2362, 0.298911988735198974609375, _2366);
    float _2370 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2372 = fma(_2364, 0.114477999508380889892578125, _2368);
    out.m_59.x = _2370;
    float _2374 = -_2372;
    float _2376 = _2362 + _2374;
    float _2378 = -_2372;
    float _2380 = _2360 + _2378;
    float _2382 = -_2372;
    float _2384 = _2364 + _2382;
    float _2386 = fma(_2376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2388 = fma(_2380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2390 = fma(_2384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    out.m_105.x = _2386;
    out.m_105.y = _2388;
    out.m_105.z = _2390;
    if (!_2358)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2392 = -_859;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2396 = -_861;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2400 = -_863;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = sqrt(_2408);
    float _2412 = rsqrt(_2408);
    float _2414 = -_2410;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2398 * _2412;
    float _2424 = _2394 * _2412;
    float _2426 = abs(_2420);
    float _2428 = log2(_2426);
    float _2430 = _2402 * _2412;
    float _2432 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2434 = _2038 * _2424;
    float _2436 = -_2424;
    float _2438 = -_2432;
    float _2440 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2438);
    float _2442 = fma(_2036, _2422, _2434);
    float _2444 = -_2430;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2440);
    float _2448 = fma(_2048, _2430, _2442);
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2454 = _2446 + _2452;
    float _2456 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2458 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = exp2(_2456);
    float _2464 = _2462 * _2460;
    float _2466 = _2450 * _2464;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2470 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2468;
    out.m_103.y = _2470;
    out.m_103.z = _2472;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2244 = false;
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
        float _2531 = as_type<float>(_142);
        out.gl_Position.z = _2531;
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
        float _2599 = as_type<float>(_176);
        out.gl_Position.z = _2599;
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
    float2 _2848 = float2(_324, _328);
    float _330 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2848, float2(0.0), isnan(_2848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2848, float2(0.0), isnan(_2848)), level(0.0)).x;
    float _332 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = in.m_65.y;
    float _336 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _338 = in.m_67.x;
    float _340 = in.m_67.y;
    float _342 = in.m_67.z;
    float _344 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _346 = in.m_69.x;
    float _348 = in.m_69.y;
    float _350 = in.m_69.z;
    float _352 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _354 = _344 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _358 = _356 != 0;
    float _360 = _354 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _362 = _354 + _352;
    float _364 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _360);
    float _366 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].z, _364);
    float _368 = _354 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _370 = 0.0;
    int _372 = 2;
    float _374 = _354;
    float _376 = _310;
    float _378 = _340;
    float _380 = _342;
    if (_358)
    {
        float _382 = in.m_65.x;
        _370 = _382;
    }
    float _384 = _370;
    int _386 = 0;
    if (_358)
    {
        _386 = 0;
    }
    int _388 = _386;
    float _390 = _366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _392 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _368);
    int _394 = 0;
    int _396 = _388;
    if (_358)
    {
        _394 = 0;
    }
    int _398 = _394;
    float _400 = 1.0 / _390;
    float _402 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].z, _392);
    float _404 = _402 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _406 = _404 + _390;
    float _408 = _406 * _400;
    float _410 = _408 * 0.5;
    float _412 = 0.0;
    int _414 = _398;
    float _416 = _384;
    if (_358)
    {
        _412 = _384;
    }
    float _418 = _412;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _422 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _420);
    float _424 = 1.0 / _422;
    float _426 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    float _428 = fma(_348, 16.0, _426);
    float _430 = _428 * 0.15915493667125701904296875;
    float _432 = in.m_63.x;
    float _434 = in.m_63.y;
    float _436 = in.m_63.z;
    float _438 = _430 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _444 = _424 * _442;
    bool _446 = _444 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _448 = _362 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _450 = _444 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _452 = !_446;
    int _454 = _452 ? 0 : 1;
    float _456 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _448);
    float _458 = fma(_440, 0.5, 0.5);
    float _460 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[127].z, _456);
    float _462 = _458 * 0.004999999888241291046142578125;
    float _464 = _418;
    if (!_446)
    {
        _372 = 1;
    }
    int _466 = _372;
    float _468 = _460 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _470 = _466;
    float _472 = _468;
    if (!_450)
    {
        _470 = _454;
    }
    int _474 = _470;
    float _476 = fma(_338, _462, _346);
    float _478 = fma(_340, _462, _348);
    float _480 = fma(_342, _462, _350);
    int _482 = _474 << 6;
    float _484 = _432 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = _362 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _490 = _482 + 96;
    uint _493 = uint(int(uint(_490) >> uint(2)));
    uint _495 = uint(int(uint(int(_493)) >> uint(2)));
    int _497 = int(_493) & 3;
    float _499 = (*spvDescriptorSet0.vp_c15)._m0[int(_495)][_497];
    int _501 = int(_493) + 1;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    int _505 = _501 & 3;
    float _507 = (*spvDescriptorSet0.vp_c15)._m0[int(_503)][_505];
    float _509 = _436 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _511 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _513 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _488);
    float _515 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _517 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _480);
    float _521 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[126].z, _513);
    int _523 = _482 + 104;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    uint _527 = uint(int(uint(int(_525)) >> uint(2)));
    int _529 = int(_525) & 3;
    float _531 = (*spvDescriptorSet0.vp_c15)._m0[int(_527)][_529];
    int _533 = int(_525) + 1;
    uint _535 = uint(int(uint(_533) >> uint(2)));
    int _537 = _533 & 3;
    float _539 = (*spvDescriptorSet0.vp_c15)._m0[int(_535)][_537];
    float _541 = trunc(_468);
    int _543 = int(_541);
    float _545 = _519 * _517;
    float _547 = _521 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _478);
    int _551 = _482 + 48;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = int(_553) + 1;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    int _565 = _561 & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    float _569 = _549 * _511;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _476);
    float _573 = trunc(_547);
    int _575 = int(_573);
    float _577 = _569 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _579 = _571 * _515;
    float _581 = _569 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _583 = _482 + 64;
    uint _585 = uint(int(uint(_583) >> uint(2)));
    uint _587 = uint(int(uint(int(_585)) >> uint(2)));
    int _589 = int(_585) & 3;
    float _591 = (*spvDescriptorSet0.vp_c15)._m0[int(_587)][_589];
    int _593 = int(_585) + 1;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    int _597 = _593 & 3;
    float _599 = (*spvDescriptorSet0.vp_c15)._m0[int(_595)][_597];
    int _601 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _603 = _543 + _601;
    int _605 = _603 + 1;
    float _607 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[10].x, _577);
    float _609 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[8].x, _581);
    float _611 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[10].z, _607);
    float _613 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[8].z, _609);
    int _615 = _482 + 72;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    uint _619 = uint(int(uint(int(_617)) >> uint(2)));
    int _621 = int(_617) & 3;
    float _623 = (*spvDescriptorSet0.vp_c15)._m0[int(_619)][_621];
    int _625 = int(_617) + 1;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    int _629 = _625 & 3;
    float _631 = (*spvDescriptorSet0.vp_c15)._m0[int(_627)][_629];
    float _633 = _312 + _611;
    float _635 = _310 + _613;
    int _637 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _639 = _575 + _637;
    int _641 = _639 + 1;
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _633 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _649 = _635 + _647;
    int _651 = _482 + 56;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.vp_c15)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.vp_c15)._m0[int(_663)][_665];
    bool _669 = _641 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _671 = _645 * _645;
    int _673 = _641 | _605;
    float _675 = fma(_649, _649, _671);
    bool _677 = _673 < 0;
    bool _679 = _677 || _669;
    int _681 = _482 + 80;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.vp_c15)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.vp_c15)._m0[int(_693)][_695];
    float _699 = _362 * _507;
    float _701 = _569 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _703 = _605 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _705 = _703 || _679;
    float _707 = sqrt(_675);
    float _709 = fma(_310, _499, _699);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[9].x, _701);
    float _713 = fma(_312, _531, _709);
    float _715 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[9].z, _711);
    float _717 = _713 + _539;
    float _719 = _354 + _715;
    int _721 = as_type<int>(_579);
    int _723 = as_type<int>(_545);
    int _725 = as_type<int>(_717);
    float _727 = _719;
    float _729 = _675;
    float _731 = _645;
    float _733 = as_type<float>(_605);
    if (_358)
    {
        _374 = _334;
    }
    float _735 = _374;
    float _737 = _362 * _567;
    float _739 = _735;
    float _741 = _559;
    if (!_705)
    {
        int _743 = _605 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _745 = _743 + _641;
        _721 = _745;
    }
    int _747 = _721;
    float _749 = fma(_310, _559, _737);
    bool _751 = _707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _753 = _362 * _599;
    float _755 = 1.0 / _717;
    float _757 = fma(_310, _591, _753);
    float _759 = fma(_312, _623, _757);
    float _761 = fma(_312, _659, _749);
    float _763 = _749;
    if (!_358)
    {
        float _765 = in.m_65.x;
        float _767 = _334 * 3.1415927410125732421875;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _765 * 3.1415927410125732421875;
        float _777 = _775 * 0.15915493667125701904296875;
        float _779 = _777 * 6.283185482025146484375;
        float _781 = sin(_779);
        _763 = _777;
        _414 = 2;
        _416 = _765;
        _396 = 1;
        _464 = _781;
        _739 = _773;
    }
    float _783 = _763;
    int _785 = _414;
    float _787 = _416;
    int _789 = _396;
    float _791 = _464;
    float _793 = _739;
    float _795 = _783;
    float _797 = _793;
    if (!_705)
    {
        int _799 = _747 << 2;
        _723 = _799;
    }
    int _801 = _723;
    int _803 = _801;
    if (!_751)
    {
        _795 = _635;
    }
    float _805 = _795;
    float _807 = _805;
    if (!_751)
    {
        _741 = _633;
    }
    float _809 = _741;
    float _811 = _809;
    if (!_705)
    {
        uint _813 = uint(int(uint(_747) >> uint(2)));
        _725 = int(_813);
    }
    int _815 = _725;
    if (!_705)
    {
        int _817 = 12 & _801;
        _803 = _817;
    }
    int _819 = _803;
    bool _821 = !_751;
    if (!_821)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _827 = _707 + _825;
        float _829 = _719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _831 = rsqrt(_675);
        float _833 = _827 * _823;
        float _835 = _833 * 0.15915493667125701904296875;
        float _837 = _835 * 6.283185482025146484375;
        float _839 = cos(_837);
        float _841 = _835 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _839 + (-1.0);
        float _847 = _845 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _849 = fma(_843, _829, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = fma(_719, _839, _847);
        float _853 = _831 * _849;
        float _855 = fma(_649, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _857 = fma(_645, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _727 = _851;
        _807 = _855;
        _811 = _857;
        _729 = _831;
    }
    float _859 = _727;
    float _861 = _807;
    float _863 = _811;
    float _865 = _729;
    float _867 = _759 + _631;
    if (!_705)
    {
        int _869 = _815 << 4;
        int _871 = _869 + _819;
        _731 = as_type<float>(_871);
    }
    float _873 = _731;
    int _875 = _482 + 88;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    float _893 = _761 + _667;
    float _895 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _897 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _899 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _901 = _893 * _755;
    float _903 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _895);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _897);
    float _907 = _873;
    if (!_705)
    {
        int _909 = as_type<int>(_873) + 400;
        uint _911 = uint(int(uint(_909) >> uint(2)));
        uint _913 = uint(int(uint(int(_911)) >> uint(2)));
        int _915 = int(_911) & 3;
        float _917 = (*spvDescriptorSet0.vp_c15)._m0[int(_913)][_915];
        _907 = _917;
    }
    float _919 = _907;
    float _921 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _899);
    float _923 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    bool _925 = _901 >= 0.0;
    float _927 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _921);
    float _931 = _867 * _755;
    float _933 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _935 = _923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _937 = _901 <= 1.0;
    bool _939 = _937 && _925;
    float _941 = _927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _943 = _929 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _945 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _933);
    float _947 = _935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _949 = _931 >= 0.0;
    bool _951 = _949 && _939;
    float _953 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _955 = _943 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _957 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _945);
    float _959 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _947);
    bool _961 = _931 <= 1.0;
    bool _963 = _961 && _951;
    float _965 = -_955;
    float _967 = fma(_965, _953, 1.0);
    float _969 = _957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _971 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[7].z, _959);
    float _973 = _362 * _697;
    float _975 = _895;
    float _977 = _931;
    if (!_705)
    {
        float _979 = floor(_468);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _985 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _971);
    float _987 = fma(_310, _689, _973);
    float _989 = _935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _991 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _983);
    float _993 = log2(_967);
    float _995 = _985;
    if (_963)
    {
        float _997 = float(_474);
        _733 = _997;
    }
    float _999 = _733;
    float _1001 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _989);
    float _1003 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[4].z, _991);
    float _1005 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1001);
    float _1007 = 1.0 / _985;
    float _1009 = fma(_312, _883, _987);
    float _1011 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1003);
    float _1013 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1005);
    if (!_705)
    {
        float _1015 = -_981;
        float _1017 = _468 + _1015;
        _472 = _1017;
    }
    float _1019 = _472;
    float _1021 = _1009 + _891;
    float _1023 = _865;
    if (!_705)
    {
        float _1025 = floor(_547);
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = _1021 * _755;
    float _1031 = _993 * 0.693147182464599609375;
    float _1033 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1035 = _999;
    float _1037 = _1033;
    if (_963)
    {
        float _1039 = rint(_999);
        float _1041 = precise::max(_1039, 0.0);
        uint _1043 = uint(_1041);
        uint _1045 = clamp(_1043, 0u, 65535u);
        _1035 = as_type<float>(_1045);
    }
    float _1047 = _1035;
    float _1049 = _1011 * _1007;
    float _1051 = _1013 * _1007;
    float _1053 = fma(_1049, 0.5, 0.5);
    float _1055 = fma(_1051, -0.5, 0.5);
    float _1057 = _1021;
    float _1059 = _1049;
    float _1061 = _919;
    if (!_705)
    {
        float _1063 = rint(_919);
        float _1065 = precise::max(_1063, 0.0);
        uint _1067 = uint(_1065);
        uint _1069 = clamp(_1067, 0u, 65535u);
        _1057 = as_type<float>(_1069);
    }
    float _1071 = _1057;
    if (!_705)
    {
        float _1073 = -_1027;
        float _1075 = _547 + _1073;
        _1059 = _1075;
    }
    float _1077 = _1059;
    float _1079 = _1047;
    if (_963)
    {
        float3 _4079 = float3(_901, _931, float(as_type<int>(_1047)));
        float3 _4083 = select(_4079, float3(0.0), isnan(_4079));
        float _1081 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4083.xy, uint(rint(_4083.z)), _1029, level(0.0));
        _1079 = _1081;
    }
    float _1083 = _1079;
    float3 _4093 = float3(_1053, _1055, _1033);
    float _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4093, float3(0.0), isnan(_4093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4093, float3(0.0), isnan(_4093)), level(0.0)).x;
    float3 _4102 = float3(_1053, _1055, _1033);
    float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4102, float3(0.0), isnan(_4102)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4102, float3(0.0), isnan(_4102)), level(0.0)).xyzw;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    float _1094 = _1088.z;
    float _1096 = _1088.w;
    float _1098 = _1005;
    if (!_705)
    {
        float3 _4125 = float3(_1077, _1019, float(as_type<int>(_1071)));
        float3 _4127 = select(_4125, float3(0.0), isnan(_4125));
        float _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4127.xy, uint(rint(_4127.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4127.xy, uint(rint(_4127.z)), level(0.0)).x;
        _1098 = _1100;
    }
    float _1102 = _1098;
    float _1104 = 0.0;
    if (_705)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_705)
    {
        int _1110 = _747 << 4;
        int _1112 = _1110 + 2048;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
        int _1118 = int(_1114) & 3;
        float _1120 = (*spvDescriptorSet0.vp_c15)._m0[int(_1116)][_1118];
        int _1122 = int(_1114) + 1;
        uint _1124 = uint(int(uint(_1122) >> uint(2)));
        int _1126 = _1122 & 3;
        float _1128 = (*spvDescriptorSet0.vp_c15)._m0[int(_1124)][_1126];
        int _1130 = _1112 + 8;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
        int _1140 = int(_1132) + 1;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        int _1144 = _1140 & 3;
        float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
        float _1148 = _362 * _1128;
        float _1150 = fma(_310, _1120, _1148);
        float _1152 = fma(_312, _1138, _1150);
        float _1154 = _1152 + _1146;
        float _1156 = precise::clamp(_1154, 0.0, 1.0);
        float _1158 = -_1156;
        float _1160 = _1158 + _1102;
        float _1162 = fma(_1160, 500.0, 1.5);
        float _1164 = exp2(_1162);
        float _1166 = 0.0 + _1164;
        float _1168 = precise::clamp(_1166, 0.0, 1.0);
        _1108 = _1168;
    }
    float _1170 = _1108;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _859 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _861 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _863 + _1180;
    float _1184 = in.m_71.y;
    float _1186 = _1174 * _1174;
    float _1188 = fma(_1178, _1178, _1186);
    float _1190 = fma(_1182, _1182, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = sqrt(_1190);
    float _1196 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1198 = _1178 * _1196;
    float _1200 = _1182 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 * _1200;
    float _1206 = _1202 + _1204;
    float _1208 = sqrt(_1206);
    bool _1210 = _1208 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = _1208 + _1212;
    float _1216 = _1192;
    float _1218 = _1214;
    float _1220 = _1174;
    bool _1222 = _1210;
    if (_1210)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1216 = _1224;
    }
    float _1226 = _1216;
    if (_1210)
    {
        float _1228 = rsqrt(_1206);
        _1037 = _1228;
    }
    float _1230 = _1037;
    float _1232 = _1230;
    if (_1210)
    {
        float _1234 = _1214 * _1226;
        _1218 = _1234;
    }
    float _1236 = _1218;
    if (_1210)
    {
        float _1238 = _1236 * 0.15915493667125701904296875;
        _376 = _1238;
    }
    float _1240 = _376;
    float _1242 = _1182;
    if (_1210)
    {
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1226;
    float _1256 = _1252;
    if (_1210)
    {
        float _1258 = _1240 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1196;
    float _1266 = -_1252;
    float _1268 = fma(_1174, _1264, _1266);
    if (_1210)
    {
        float _1270 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1270;
    }
    float _1272 = _1220;
    float _1274 = _1272;
    float _1276 = _1248;
    if (_1210)
    {
        float _1278 = fma(_1248, _1272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1274 = _1278;
    }
    float _1280 = _1274;
    float _1282 = _1280;
    if (!_1210)
    {
        _1276 = _1198;
    }
    float _1284 = _1276;
    float _1286 = _1284;
    float _1288 = _1262;
    if (_1210)
    {
        float _1290 = _1262 + (-1.0);
        _1256 = _1290;
    }
    float _1292 = _1256;
    float _1294 = _1292;
    if (_1210)
    {
        float _1296 = _1230 * _1280;
        _1061 = _1296;
    }
    float _1298 = _1061;
    if (!_1210)
    {
        _1282 = _1268;
    }
    float _1300 = _1282;
    float _1302 = _1300;
    if (_1210)
    {
        float _1304 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _1304;
    }
    float _1306 = _977;
    if (_1210)
    {
        float _1308 = _1198 * _1298;
        _1286 = _1308;
    }
    float _1310 = _1286;
    if (!_1210)
    {
        _1294 = _1200;
    }
    float _1312 = _1294;
    float _1314 = _1312;
    if (_1210)
    {
        float _1316 = _1200 * _1298;
        _1314 = _1316;
    }
    float _1318 = _1314;
    if (!_1210)
    {
        _1232 = _1202;
    }
    float _1320 = _1232;
    float _1322 = _1320;
    if (_1210)
    {
        float _1324 = fma(_1268, _1262, _1306);
        _1302 = _1324;
    }
    float _1326 = _1302;
    if (_1210)
    {
        float _1328 = _1310 * _1310;
        _1322 = _1328;
    }
    float _1330 = _1322;
    if (!_1210)
    {
        _1288 = _1204;
    }
    float _1332 = _1288;
    float _1334 = _1332;
    if (_1210)
    {
        float _1336 = _1318 * _1318;
        _1334 = _1336;
    }
    float _1338 = _1334;
    float _1340 = fma(_1326, _1326, _1330);
    float _1342 = in.m_71.x;
    float _1344 = _1340 + _1338;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1194, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1354 = _1352 != 0;
    float _1356 = in.m_65.w;
    float _1358 = -_1350;
    float _1360 = _1358 + 1.0;
    float _1362 = rsqrt(_1344);
    float _1364 = abs(_1360);
    float _1366 = log2(_1364);
    float _1368 = _1202;
    float _1370 = 0.0187292993068695068359375;
    if (_1354)
    {
        float _1372 = in.m_65.x;
        _1368 = _1372;
    }
    float _1374 = _1368;
    float _1376 = _1362 * _1310;
    float _1378 = _1362 * _1326;
    float _1380 = _1362 * _1318;
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1384 = -_1382;
    float _1386 = fma(_1378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1384);
    float _1388 = -_1380;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1386);
    float _1392 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1394 = fma(_1390, -0.5, 0.5);
    float _1396 = fma(_1390, 0.5, 0.5);
    float _1398 = exp2(_1392);
    float _1400 = fma(_1396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1396, _1400, -0.212114393711090087890625);
    float _1404 = sqrt(_1394);
    float _1406 = fma(_1396, _1402, 1.570728778839111328125);
    float _1408 = _1378 + 1.0;
    float _1410 = -_1378;
    float _1412 = fma(_1398, _1408, _1410);
    float _1414 = _1404 * 0.636619746685028076171875;
    float _1416 = fma(_1412, 0.5, 0.5);
    float _1418 = -_1406;
    float _1420 = fma(_1414, _1418, 1.0);
    float2 _4620 = float2(_1420, _1416);
    float3 _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4620, float2(0.0), isnan(_4620)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4620, float2(0.0), isnan(_4620)), level(0.0)).xyz;
    float _1426 = _1424.x;
    float _1428 = _1424.y;
    float _1430 = _1424.z;
    float _1432 = _1406;
    int _1434 = as_type<int>(_1342);
    if (!_1354)
    {
        _1370 = _1342;
    }
    float _1436 = _1370;
    float _1438 = in.m_73.x;
    float _1440 = in.m_73.y;
    float _1442 = in.m_73.z;
    float _1444 = in.m_73.w;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1448 = _1446 != 0;
    float _1450 = -_1184;
    float _1452 = _1450 + 1.0;
    float _1454 = _1436;
    if (!_1354)
    {
        _1432 = _1436;
    }
    float _1456 = _1432;
    float _1458 = in.m_65.z;
    float _1460 = _1456;
    if (_1354)
    {
        _1454 = _1342;
    }
    float _1462 = _1454;
    float _1464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1466 = _1462;
    if (_1354)
    {
        bool _1468 = _1374 > 0.5;
        _1222 = _1468;
    }
    bool _1470 = _1222;
    float _1472 = _334 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1474 = _1356 > 0.5;
    if (_1354)
    {
        float _1476 = -_1462;
        float _1478 = _1476 + 1.0;
        _1434 = as_type<int>(_1478);
    }
    int _1480 = _1434;
    out.m_75.y = _1184;
    int _1482 = _1474 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1354)
    {
        float _1486 = _1470 ? as_type<float>(_1480) : _1462;
        _1460 = _1486;
    }
    float _1488 = _1460;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1492 = as_type<float>(_1480);
    if (_1448)
    {
        float _1494 = in.m_65.z;
        _1492 = _1494;
    }
    float _1496 = _1492;
    bool _1498 = _334 > 0.5;
    float _1500 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1502 = fma(_1472, -2.0, _1490);
    float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1506 = _1498 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1508 = _338 * _1442;
    float _1510 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1512 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1514 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1516 = _1458 > 0.5;
    float _1518 = -_1508;
    float _1520 = fma(_342, _1438, _1518);
    float _1522 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1510);
    float _1524 = _340 * _1438;
    float _1526 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1512);
    float _1528 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1514);
    float _1530 = _342 * _1440;
    int _1532 = _1516 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1534 = -_1524;
    float _1536 = fma(_338, _1440, _1534);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1540 = _1538 != 0;
    float _1542 = -_1530;
    float _1544 = fma(_340, _1442, _1542);
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1548 = _1546 != 0;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1552 = _1540 ? as_type<float>(_1532) : _1184;
    float _1554 = _1520 * _1444;
    bool _1556 = _1540;
    int _1558 = as_type<int>(_1528);
    float _1560 = _1458;
    if (_1448)
    {
        bool _1562 = _1496 > 0.5;
        _1556 = _1562;
    }
    bool _1564 = _1556;
    float _1566 = _1544 * _1444;
    float _1568 = _1536 * _1444;
    float _1570 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1572 = _1548 ? as_type<float>(_1506) : _1184;
    float _1574 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1550);
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1578 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1522);
    float _1580 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1584 = _1582 != 0;
    float _1586 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1574);
    float _1588 = fma(_1570, _1572, -0.5);
    float _1590 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1502);
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1594 = _1592 != 0;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1600 = _1598 != 0;
    float _1602 = -_1590;
    float _1604 = fma(_1586, _1588, _1602);
    float _1606 = _1584 ? as_type<float>(_1482) : _1184;
    float _1608 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1612 = _1610 != 0;
    float _1614 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1526);
    float _1616 = fma(_1580, _1552, -0.5);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1620 = _1612 ? as_type<float>(_1532) : _1184;
    float _1622 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1624 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1626 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1528);
    int _1628 = as_type<int>(_1590);
    int _1630 = as_type<int>(_1580);
    float _1632 = _1620;
    float _1634 = _1624;
    if (_1448)
    {
        float _1636 = -_1462;
        float _1638 = _1636 + 1.0;
        _1628 = as_type<int>(_1638);
    }
    int _1640 = _1628;
    if (_1594)
    {
        float _1642 = -_1462;
        float _1644 = _1642 + 1.0;
        _1630 = as_type<int>(_1644);
    }
    int _1646 = _1630;
    float _1648 = fma(_1608, _1606, -0.5);
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1600)
    {
        float _1652 = -_1462;
        float _1654 = _1652 + 1.0;
        _1558 = as_type<int>(_1654);
    }
    int _1656 = _1558;
    float _1658 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1662 = fma(_1622, _1620, -0.5);
    float _1664 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1624);
    if (!_1448)
    {
        _1632 = _1462;
    }
    float _1666 = _1632;
    float _1668 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1672 = _1666;
    if (!_1594)
    {
        _1634 = _1462;
    }
    float _1674 = _1634;
    float _1676 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1678 = _1674;
    if (_1448)
    {
        float _1680 = _1564 ? as_type<float>(_1640) : _1462;
        _1672 = _1680;
    }
    float _1682 = _1672;
    float _1684 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    if (_1594)
    {
        float _1686 = _1498 ? as_type<float>(_1646) : _1462;
        _1678 = _1686;
    }
    float _1688 = _1678;
    float _1690 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1660);
    if (_1600)
    {
        float _1692 = _1498 ? as_type<float>(_1656) : _1462;
        _1466 = _1692;
    }
    float _1694 = _1466;
    float _1696 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1698 = fma(_1668, _1682, -0.5);
    float _1700 = fma(_1676, _1688, -0.5);
    float _1702 = fma(_1696, _1694, -0.5);
    out.m_77.x = _1614;
    out.m_77.y = _1578;
    out.m_77.z = _1626;
    float _1704 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1710 = fma(_1704, _1488, -0.5);
    float _1712 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1726 = _478 != 0.0;
    bool _1728 = isnan(_478);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1738 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1740 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _1724;
    out.m_79.y = _1712;
    out.m_79.z = _1714;
    float _1742 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1744 = _476 == 0.0;
    bool _1746 = !_1734;
    bool _1748 = _1744 && _1746;
    float _1750 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1664);
    float _1752 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1684);
    bool _1754 = _480 == 0.0;
    bool _1756 = _1754 && _1748;
    out.m_81.x = _1738;
    out.m_81.y = _1740;
    out.m_81.z = _1742;
    out.m_81.w = _1736;
    bool _1758 = _785 != 2;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1762 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1690);
    float _1764 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    out.m_83.x = _1752;
    out.m_83.y = _1750;
    out.m_83.z = _1762;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1772 = _789 != 1;
    float _1774 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1768);
    float _1776 = _791 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1778 = _793 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1782 = -_1760;
    float _1784 = fma(_1776, 2.0, _1782);
    float _1786 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1774);
    float _1788 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1766);
    float _1790 = fma(_1778, -2.0, _1770);
    float _1792 = -_160;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1784);
    float _1796 = _1766;
    float _1798 = _1770;
    if (_1756)
    {
        _797 = _340;
    }
    float _1800 = _797;
    float _1802 = _1800;
    if (!_1756)
    {
        float _1804 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _340);
        _1802 = _1804;
    }
    float _1806 = _1802;
    if (_1758)
    {
        _378 = _787;
    }
    float _1808 = _378;
    float _1810 = fma(_1786, _1702, _1794);
    float _1812 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1788);
    float _1814 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1790);
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1818 = _1808;
    if (!_1758)
    {
        _1818 = _1458;
    }
    float _1820 = _1818;
    float _1822 = -_1814;
    float _1824 = fma(_1812, _1662, _1822);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1828 = -_1780;
    float _1830 = fma(_1764, 2.0, _1828);
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1834 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1816);
    float _1836 = _1826;
    float _1838 = _1830;
    if (_1756)
    {
        _1796 = _338;
    }
    float _1840 = _1796;
    float _1842 = _1840;
    if (!_1756)
    {
        float _1844 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[17].y, _338);
        _1842 = _1844;
    }
    float _1846 = _1842;
    if (_1756)
    {
        _1798 = _342;
    }
    float _1848 = _1798;
    float _1850 = -_1826;
    float _1852 = fma(_1832, 2.0, _1850);
    float _1854 = _1848;
    if (!_1756)
    {
        float _1856 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _342);
        _1854 = _1856;
    }
    float _1858 = _1854;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1862 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1834);
    float _1864 = -_160;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1830);
    if (!_1772)
    {
        _380 = _334;
    }
    float _1868 = _380;
    float _1870 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1860);
    float _1872 = _1868;
    if (!_1772)
    {
        _1836 = _1458;
    }
    float _1874 = _1836;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1878 = _1874;
    if (_1772)
    {
        _1560 = _334;
    }
    float _1880 = _1560;
    float _1882 = fma(_1862, _1710, _1866);
    if (!_1772)
    {
        _1838 = _1868;
    }
    float _1884 = _1838;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1888 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1876);
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1886);
    float _1892 = _1884;
    if (_1772)
    {
        _1892 = _787;
    }
    float _1894 = _1892;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1772)
    {
        _1872 = _787;
    }
    float _1898 = _1872;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1902 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1904 = _1898;
    if (_1772)
    {
        _1878 = _334;
    }
    float _1906 = _1878;
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1900);
    if (_1758)
    {
        _1904 = _334;
    }
    float _1910 = _1904;
    float _1912 = -_1896;
    float _1914 = fma(_1902, 2.0, _1912);
    float _1916 = _1910;
    if (!_1758)
    {
        _1916 = _787;
    }
    float _1918 = _1916;
    float _1920 = abs(_444);
    float _1922 = log2(_1920);
    float _1924 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1888);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1928 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1930 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1932 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1908);
    float _1934 = -_160;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1914);
    float _1938 = fma(_1928, -2.0, _1926);
    float _1940 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1890);
    float _1942 = fma(_1932, _1698, _1936);
    float _1944 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1946 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1938);
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1950 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1870);
    float _1952 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1944);
    float _1954 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1956 = fma(_1930, -2.0, _1948);
    float _1958 = -_1946;
    float _1960 = fma(_1940, _1648, _1958);
    float _1962 = _935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1964 = exp2(_1954);
    float _1966 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1956);
    float _1968 = -_160;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1852);
    float _1972 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1962);
    float _1974 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1976 = -_1966;
    float _1978 = fma(_1950, _1616, _1976);
    float _1980 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1982 = _1604 + 0.5;
    float _1984 = _1882 + 0.5;
    float _1986 = _1942 + 0.5;
    float _1988 = _1960 + 0.5;
    float _1990 = fma(_1924, _1700, _1970);
    float _1992 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1972);
    float _1994 = exp2(_1500);
    out.m_85.x = _1984;
    out.m_85.y = _1982;
    out.m_85.z = _1986;
    out.m_85.w = _1988;
    float _1996 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1974);
    float _1998 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1992);
    float _2004 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1980);
    float _2006 = _1011 + _985;
    bool _2008 = _444 <= 8000.0;
    bool _2010 = isnan(_444);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan(8000.0);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    float _2020 = _1978 + 0.5;
    out.gl_Position.x = _1011;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _2002;
    out.gl_Position.w = _985;
    float _2022 = _2002 + _985;
    float _2024 = _985 * 0.5;
    float _2026 = _2006 * 0.5;
    float _2028 = _2022 * 0.5;
    float _2030 = fma(_1013, -0.5, _2024);
    float _2032 = -_330;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1952);
    float _2038 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1996);
    float _2040 = fma(_2000, -2.0, 3.0);
    float _2042 = _2000 * _2000;
    out.m_87.x = _2026;
    out.m_87.y = _2030;
    out.m_87.z = _2028;
    out.m_87.w = _985;
    float _2044 = -_1994;
    float _2046 = _2044 + 1.0;
    float _2048 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2004);
    float _2050 = _2042 * _2040;
    float _2052 = _1810 + 0.5;
    float _2054 = _1824 + 0.5;
    float _2056 = _1990 + 0.5;
    float _2058 = -_2050;
    float _2060 = _2058 + 1.0;
    out.m_89.x = _2036;
    out.m_89.y = _2038;
    out.m_89.z = _2048;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2050);
    out.m_91.x = _2052;
    out.m_91.y = _2054;
    float _2064 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2066 = _2018 * _2062;
    float _2068 = _2062;
    float _2070 = _2046;
    if (!_963)
    {
        _2068 = 1.0;
    }
    float _2072 = _2068;
    out.m_93.x = _2056;
    out.m_93.y = _2020;
    float _2074 = _2072;
    if (_963)
    {
        bool _2076 = _1083 >= _1029;
        bool _2078 = isnan(_1083);
        bool _2080 = _2076 || _2078;
        bool _2082 = isnan(_1029);
        bool _2084 = _2080 || _2082;
        float _2086 = float(_2084);
        _2074 = _2086;
    }
    float _2088 = _2074;
    float _2090 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2092 = _2064 * _1085;
    float _2094 = -_2064;
    float _2096 = _2094 + 1.0;
    out.m_95.z = _2028;
    out.m_95.w = _985;
    float _2098 = _2034 * _2090;
    float _2100 = precise::clamp(_2098, 0.0, 1.0);
    float _2102 = _2088 * _1170;
    float _2104 = _1096 * _2092;
    float _2106 = _1096 * _2096;
    float _2108 = -_2100;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_97.x = _861;
    out.m_97.y = _859;
    out.m_97.z = _863;
    bool _2112 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2114 = isnan(_1194);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2120 = _2116 || _2118;
    float _2122 = -_2102;
    float _2124 = fma(_2122, _2110, 1.0);
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = _2126 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_99.x = _2128;
    float _2130 = _2096;
    float _2132 = _2100;
    float _2134 = _2102;
    float _2136 = _2126;
    if (!_2120)
    {
        _2130 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2138 = _2130;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2120)
    {
        _995 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2144 = _995;
    float _2146 = _2144;
    float _2148 = _2144;
    if (!_2120)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2150 = _2132;
    float _2152 = _1430 * _2092;
    float _2154 = fma(_1426, _2104, _1090);
    float _2156 = fma(_1428, _2104, _1092);
    float _2158 = _2150;
    float _2160 = _2150;
    if (!_2120)
    {
        _2070 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2162 = _2070;
    float _2164 = fma(_1096, _2152, _1094);
    float _2166 = _2162;
    float _2168 = _2162;
    if (!_2120)
    {
        _2134 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2170 = _2134;
    float _2172 = _2170;
    float _2174 = _2170;
    if (!_2120)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2176 = _2136;
    out.m_101.x = _2154;
    out.m_101.y = _2156;
    out.m_101.z = _2164;
    out.m_101.w = _2106;
    bool _2178 = !_2120;
    float _2180 = _2176;
    float _2182 = _2176;
    if (!_2178)
    {
        bool _2184 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2186 = isnan(_1194);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2192 = _2188 || _2190;
        if (!_2192)
        {
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = _1194 + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2198;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2206 = 1.0 / _2200;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2224 = _2196 * _2206;
            float _2226 = precise::clamp(_2224, 0.0, 1.0);
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2232 = fma(_2226, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2234 = fma(_2226, _2230, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2236 = fma(_2226, _2210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2238 = fma(_2226, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2240 = fma(_2226, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2242 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2148 = _2236;
            _2174 = _2240;
            _2142 = _2232;
            _2168 = _2238;
            _2160 = _2234;
            _2182 = _2242;
            _2244 = true;
        }
        else
        {
            bool _2246 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2248 = isnan(_1194);
            bool _2250 = _2246 || _2248;
            bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2254 = _2250 || _2252;
            if (!_2254)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2256 = _2140;
            _2142 = _2256;
            if (!_2254)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2258 = _2146;
            _2148 = _2258;
            if (!_2254)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2260 = _2158;
            _2160 = _2260;
            if (!_2254)
            {
                _2166 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2262 = _2166;
            _2168 = _2262;
            if (!_2254)
            {
                _2172 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2264 = _2172;
            _2174 = _2264;
            if (!_2254)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2266 = _2180;
            bool _2268 = !_2254;
            _2182 = _2266;
            if (!_2268)
            {
                bool _2270 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2272 = isnan(_1194);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2278 = _2274 || _2276;
                if (!_2278)
                {
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = _1194 + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2284;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2292 = 1.0 / _2286;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2310 = _2282 * _2292;
                    float _2312 = precise::clamp(_2310, 0.0, 1.0);
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2318 = fma(_2312, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2148 = _2322;
                    _2174 = _2326;
                    _2142 = _2318;
                    _2168 = _2324;
                    _2160 = _2320;
                    _2182 = _2328;
                    _2244 = true;
                }
                else
                {
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2174 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2168 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2244 = false;
    float _2330 = _2148;
    float _2332 = _2174;
    float _2334 = _2142;
    float _2336 = _2168;
    float _2338 = _2160;
    float _2340 = _2182;
    float _2342 = fma(_2038, -0.5, 0.5);
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = -_2330;
    float _2348 = _2346 + _2332;
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    bool _2358 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2360 = fma(_2344, _2348, _2330);
    float _2362 = fma(_2344, _2352, _2334);
    float _2364 = fma(_2344, _2356, _2338);
    float _2366 = _2360 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2368 = fma(_2362, 0.298911988735198974609375, _2366);
    float _2370 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2372 = fma(_2364, 0.114477999508380889892578125, _2368);
    out.m_59.x = _2370;
    float _2374 = -_2372;
    float _2376 = _2362 + _2374;
    float _2378 = -_2372;
    float _2380 = _2360 + _2378;
    float _2382 = -_2372;
    float _2384 = _2364 + _2382;
    float _2386 = fma(_2376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2388 = fma(_2380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2390 = fma(_2384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    out.m_105.x = _2386;
    out.m_105.y = _2388;
    out.m_105.z = _2390;
    if (!_2358)
    {
        return out;
    }
    float _2392 = -_859;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2396 = -_861;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2400 = -_863;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = sqrt(_2408);
    float _2412 = rsqrt(_2408);
    float _2414 = -_2410;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2398 * _2412;
    float _2424 = _2394 * _2412;
    float _2426 = abs(_2420);
    float _2428 = log2(_2426);
    float _2430 = _2402 * _2412;
    float _2432 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2434 = _2038 * _2424;
    float _2436 = -_2424;
    float _2438 = -_2432;
    float _2440 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2438);
    float _2442 = fma(_2036, _2422, _2434);
    float _2444 = -_2430;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2440);
    float _2448 = fma(_2048, _2430, _2442);
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2454 = _2446 + _2452;
    float _2456 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2458 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = exp2(_2456);
    float _2464 = _2462 * _2460;
    float _2466 = _2450 * _2464;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2470 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2468;
    out.m_103.y = _2470;
    out.m_103.z = _2472;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2244 = false;
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
        float _2531 = as_type<float>(_142);
        out.gl_Position.z = _2531;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2599 = as_type<float>(_176);
        out.gl_Position.z = _2599;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float2 _2848 = float2(_324, _328);
    float _330 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2848, float2(0.0), isnan(_2848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2848, float2(0.0), isnan(_2848)), level(0.0)).x;
    float _332 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = in.m_65.y;
    float _336 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _338 = in.m_67.x;
    float _340 = in.m_67.y;
    float _342 = in.m_67.z;
    float _344 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _336);
    float _346 = in.m_69.x;
    float _348 = in.m_69.y;
    float _350 = in.m_69.z;
    float _352 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _354 = _344 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _358 = _356 != 0;
    float _360 = _354 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _362 = _354 + _352;
    float _364 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _360);
    float _366 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[11].z, _364);
    float _368 = _354 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _370 = 0.0;
    int _372 = 2;
    float _374 = _354;
    float _376 = _310;
    float _378 = _340;
    float _380 = _342;
    if (_358)
    {
        float _382 = in.m_65.x;
        _370 = _382;
    }
    float _384 = _370;
    int _386 = 0;
    if (_358)
    {
        _386 = 0;
    }
    int _388 = _386;
    float _390 = _366 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _392 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _368);
    int _394 = 0;
    int _396 = _388;
    if (_358)
    {
        _394 = 0;
    }
    int _398 = _394;
    float _400 = 1.0 / _390;
    float _402 = fma(_312, (*spvDescriptorSet0.vp_c8)._m0[10].z, _392);
    float _404 = _402 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _406 = _404 + _390;
    float _408 = _406 * _400;
    float _410 = _408 * 0.5;
    float _412 = 0.0;
    int _414 = _398;
    float _416 = _384;
    if (_358)
    {
        _412 = _384;
    }
    float _418 = _412;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _422 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[30].w, _420);
    float _424 = 1.0 / _422;
    float _426 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    float _428 = fma(_348, 16.0, _426);
    float _430 = _428 * 0.15915493667125701904296875;
    float _432 = in.m_63.x;
    float _434 = in.m_63.y;
    float _436 = in.m_63.z;
    float _438 = _430 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _444 = _424 * _442;
    bool _446 = _444 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _448 = _362 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _450 = _444 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _452 = !_446;
    int _454 = _452 ? 0 : 1;
    float _456 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _448);
    float _458 = fma(_440, 0.5, 0.5);
    float _460 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[127].z, _456);
    float _462 = _458 * 0.004999999888241291046142578125;
    float _464 = _418;
    if (!_446)
    {
        _372 = 1;
    }
    int _466 = _372;
    float _468 = _460 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _470 = _466;
    float _472 = _468;
    if (!_450)
    {
        _470 = _454;
    }
    int _474 = _470;
    float _476 = fma(_338, _462, _346);
    float _478 = fma(_340, _462, _348);
    float _480 = fma(_342, _462, _350);
    int _482 = _474 << 6;
    float _484 = _432 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = _434 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = _362 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _490 = _482 + 96;
    uint _493 = uint(int(uint(_490) >> uint(2)));
    uint _495 = uint(int(uint(int(_493)) >> uint(2)));
    int _497 = int(_493) & 3;
    float _499 = (*spvDescriptorSet0.vp_c15)._m0[int(_495)][_497];
    int _501 = int(_493) + 1;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    int _505 = _501 & 3;
    float _507 = (*spvDescriptorSet0.vp_c15)._m0[int(_503)][_505];
    float _509 = _436 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _511 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _513 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _488);
    float _515 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _517 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _519 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _480);
    float _521 = fma(_312, (*spvDescriptorSet0.vp_c15)._m0[126].z, _513);
    int _523 = _482 + 104;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    uint _527 = uint(int(uint(int(_525)) >> uint(2)));
    int _529 = int(_525) & 3;
    float _531 = (*spvDescriptorSet0.vp_c15)._m0[int(_527)][_529];
    int _533 = int(_525) + 1;
    uint _535 = uint(int(uint(_533) >> uint(2)));
    int _537 = _533 & 3;
    float _539 = (*spvDescriptorSet0.vp_c15)._m0[int(_535)][_537];
    float _541 = trunc(_468);
    int _543 = int(_541);
    float _545 = _519 * _517;
    float _547 = _521 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _478);
    int _551 = _482 + 48;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = int(_553) + 1;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    int _565 = _561 & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    float _569 = _549 * _511;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _476);
    float _573 = trunc(_547);
    int _575 = int(_573);
    float _577 = _569 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _579 = _571 * _515;
    float _581 = _569 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _583 = _482 + 64;
    uint _585 = uint(int(uint(_583) >> uint(2)));
    uint _587 = uint(int(uint(int(_585)) >> uint(2)));
    int _589 = int(_585) & 3;
    float _591 = (*spvDescriptorSet0.vp_c15)._m0[int(_587)][_589];
    int _593 = int(_585) + 1;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    int _597 = _593 & 3;
    float _599 = (*spvDescriptorSet0.vp_c15)._m0[int(_595)][_597];
    int _601 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _603 = _543 + _601;
    int _605 = _603 + 1;
    float _607 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[10].x, _577);
    float _609 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[8].x, _581);
    float _611 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[10].z, _607);
    float _613 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[8].z, _609);
    int _615 = _482 + 72;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    uint _619 = uint(int(uint(int(_617)) >> uint(2)));
    int _621 = int(_617) & 3;
    float _623 = (*spvDescriptorSet0.vp_c15)._m0[int(_619)][_621];
    int _625 = int(_617) + 1;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    int _629 = _625 & 3;
    float _631 = (*spvDescriptorSet0.vp_c15)._m0[int(_627)][_629];
    float _633 = _312 + _611;
    float _635 = _310 + _613;
    int _637 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _639 = _575 + _637;
    int _641 = _639 + 1;
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _633 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _649 = _635 + _647;
    int _651 = _482 + 56;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.vp_c15)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.vp_c15)._m0[int(_663)][_665];
    bool _669 = _641 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _671 = _645 * _645;
    int _673 = _641 | _605;
    float _675 = fma(_649, _649, _671);
    bool _677 = _673 < 0;
    bool _679 = _677 || _669;
    int _681 = _482 + 80;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.vp_c15)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.vp_c15)._m0[int(_693)][_695];
    float _699 = _362 * _507;
    float _701 = _569 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _703 = _605 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _705 = _703 || _679;
    float _707 = sqrt(_675);
    float _709 = fma(_310, _499, _699);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c10)._m0[9].x, _701);
    float _713 = fma(_312, _531, _709);
    float _715 = fma(_545, (*spvDescriptorSet0.vp_c10)._m0[9].z, _711);
    float _717 = _713 + _539;
    float _719 = _354 + _715;
    int _721 = as_type<int>(_579);
    int _723 = as_type<int>(_545);
    int _725 = as_type<int>(_717);
    float _727 = _719;
    float _729 = _675;
    float _731 = _645;
    float _733 = as_type<float>(_605);
    if (_358)
    {
        _374 = _334;
    }
    float _735 = _374;
    float _737 = _362 * _567;
    float _739 = _735;
    float _741 = _559;
    if (!_705)
    {
        int _743 = _605 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _745 = _743 + _641;
        _721 = _745;
    }
    int _747 = _721;
    float _749 = fma(_310, _559, _737);
    bool _751 = _707 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _753 = _362 * _599;
    float _755 = 1.0 / _717;
    float _757 = fma(_310, _591, _753);
    float _759 = fma(_312, _623, _757);
    float _761 = fma(_312, _659, _749);
    float _763 = _749;
    if (!_358)
    {
        float _765 = in.m_65.x;
        float _767 = _334 * 3.1415927410125732421875;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _765 * 3.1415927410125732421875;
        float _777 = _775 * 0.15915493667125701904296875;
        float _779 = _777 * 6.283185482025146484375;
        float _781 = sin(_779);
        _763 = _777;
        _414 = 2;
        _416 = _765;
        _396 = 1;
        _464 = _781;
        _739 = _773;
    }
    float _783 = _763;
    int _785 = _414;
    float _787 = _416;
    int _789 = _396;
    float _791 = _464;
    float _793 = _739;
    float _795 = _783;
    float _797 = _793;
    if (!_705)
    {
        int _799 = _747 << 2;
        _723 = _799;
    }
    int _801 = _723;
    int _803 = _801;
    if (!_751)
    {
        _795 = _635;
    }
    float _805 = _795;
    float _807 = _805;
    if (!_751)
    {
        _741 = _633;
    }
    float _809 = _741;
    float _811 = _809;
    if (!_705)
    {
        uint _813 = uint(int(uint(_747) >> uint(2)));
        _725 = int(_813);
    }
    int _815 = _725;
    if (!_705)
    {
        int _817 = 12 & _801;
        _803 = _817;
    }
    int _819 = _803;
    bool _821 = !_751;
    if (!_821)
    {
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _827 = _707 + _825;
        float _829 = _719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _831 = rsqrt(_675);
        float _833 = _827 * _823;
        float _835 = _833 * 0.15915493667125701904296875;
        float _837 = _835 * 6.283185482025146484375;
        float _839 = cos(_837);
        float _841 = _835 * 6.283185482025146484375;
        float _843 = sin(_841);
        float _845 = _839 + (-1.0);
        float _847 = _845 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _849 = fma(_843, _829, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = fma(_719, _839, _847);
        float _853 = _831 * _849;
        float _855 = fma(_649, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _857 = fma(_645, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _727 = _851;
        _807 = _855;
        _811 = _857;
        _729 = _831;
    }
    float _859 = _727;
    float _861 = _807;
    float _863 = _811;
    float _865 = _729;
    float _867 = _759 + _631;
    if (!_705)
    {
        int _869 = _815 << 4;
        int _871 = _869 + _819;
        _731 = as_type<float>(_871);
    }
    float _873 = _731;
    int _875 = _482 + 88;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    float _893 = _761 + _667;
    float _895 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _897 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _899 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _901 = _893 * _755;
    float _903 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _895);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _897);
    float _907 = _873;
    if (!_705)
    {
        int _909 = as_type<int>(_873) + 400;
        uint _911 = uint(int(uint(_909) >> uint(2)));
        uint _913 = uint(int(uint(int(_911)) >> uint(2)));
        int _915 = int(_911) & 3;
        float _917 = (*spvDescriptorSet0.vp_c15)._m0[int(_913)][_915];
        _907 = _917;
    }
    float _919 = _907;
    float _921 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _899);
    float _923 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    bool _925 = _901 >= 0.0;
    float _927 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _929 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _921);
    float _931 = _867 * _755;
    float _933 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _935 = _923 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _937 = _901 <= 1.0;
    bool _939 = _937 && _925;
    float _941 = _927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _943 = _929 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _945 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _933);
    float _947 = _935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _949 = _931 >= 0.0;
    bool _951 = _949 && _939;
    float _953 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _955 = _943 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _957 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _945);
    float _959 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _947);
    bool _961 = _931 <= 1.0;
    bool _963 = _961 && _951;
    float _965 = -_955;
    float _967 = fma(_965, _953, 1.0);
    float _969 = _957 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _971 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[7].z, _959);
    float _973 = _362 * _697;
    float _975 = _895;
    float _977 = _931;
    if (!_705)
    {
        float _979 = floor(_468);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _985 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[7].w, _971);
    float _987 = fma(_310, _689, _973);
    float _989 = _935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _991 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _983);
    float _993 = log2(_967);
    float _995 = _985;
    if (_963)
    {
        float _997 = float(_474);
        _733 = _997;
    }
    float _999 = _733;
    float _1001 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _989);
    float _1003 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[4].z, _991);
    float _1005 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1001);
    float _1007 = 1.0 / _985;
    float _1009 = fma(_312, _883, _987);
    float _1011 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1003);
    float _1013 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1005);
    if (!_705)
    {
        float _1015 = -_981;
        float _1017 = _468 + _1015;
        _472 = _1017;
    }
    float _1019 = _472;
    float _1021 = _1009 + _891;
    float _1023 = _865;
    if (!_705)
    {
        float _1025 = floor(_547);
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = _1021 * _755;
    float _1031 = _993 * 0.693147182464599609375;
    float _1033 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1035 = _999;
    float _1037 = _1033;
    if (_963)
    {
        float _1039 = rint(_999);
        float _1041 = precise::max(_1039, 0.0);
        uint _1043 = uint(_1041);
        uint _1045 = clamp(_1043, 0u, 65535u);
        _1035 = as_type<float>(_1045);
    }
    float _1047 = _1035;
    float _1049 = _1011 * _1007;
    float _1051 = _1013 * _1007;
    float _1053 = fma(_1049, 0.5, 0.5);
    float _1055 = fma(_1051, -0.5, 0.5);
    float _1057 = _1021;
    float _1059 = _1049;
    float _1061 = _919;
    if (!_705)
    {
        float _1063 = rint(_919);
        float _1065 = precise::max(_1063, 0.0);
        uint _1067 = uint(_1065);
        uint _1069 = clamp(_1067, 0u, 65535u);
        _1057 = as_type<float>(_1069);
    }
    float _1071 = _1057;
    if (!_705)
    {
        float _1073 = -_1027;
        float _1075 = _547 + _1073;
        _1059 = _1075;
    }
    float _1077 = _1059;
    float _1079 = _1047;
    if (_963)
    {
        float3 _4079 = float3(_901, _931, float(as_type<int>(_1047)));
        float3 _4083 = select(_4079, float3(0.0), isnan(_4079));
        float _1081 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4083.xy, uint(rint(_4083.z)), _1029, level(0.0));
        _1079 = _1081;
    }
    float _1083 = _1079;
    float3 _4093 = float3(_1053, _1055, _1033);
    float _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4093, float3(0.0), isnan(_4093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4093, float3(0.0), isnan(_4093)), level(0.0)).x;
    float3 _4102 = float3(_1053, _1055, _1033);
    float4 _1088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4102, float3(0.0), isnan(_4102)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4102, float3(0.0), isnan(_4102)), level(0.0)).xyzw;
    float _1090 = _1088.x;
    float _1092 = _1088.y;
    float _1094 = _1088.z;
    float _1096 = _1088.w;
    float _1098 = _1005;
    if (!_705)
    {
        float3 _4125 = float3(_1077, _1019, float(as_type<int>(_1071)));
        float3 _4127 = select(_4125, float3(0.0), isnan(_4125));
        float _1100 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4127.xy, uint(rint(_4127.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4127.xy, uint(rint(_4127.z)), level(0.0)).x;
        _1098 = _1100;
    }
    float _1102 = _1098;
    float _1104 = 0.0;
    if (_705)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_705)
    {
        int _1110 = _747 << 4;
        int _1112 = _1110 + 2048;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
        int _1118 = int(_1114) & 3;
        float _1120 = (*spvDescriptorSet0.vp_c15)._m0[int(_1116)][_1118];
        int _1122 = int(_1114) + 1;
        uint _1124 = uint(int(uint(_1122) >> uint(2)));
        int _1126 = _1122 & 3;
        float _1128 = (*spvDescriptorSet0.vp_c15)._m0[int(_1124)][_1126];
        int _1130 = _1112 + 8;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
        int _1140 = int(_1132) + 1;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        int _1144 = _1140 & 3;
        float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
        float _1148 = _362 * _1128;
        float _1150 = fma(_310, _1120, _1148);
        float _1152 = fma(_312, _1138, _1150);
        float _1154 = _1152 + _1146;
        float _1156 = precise::clamp(_1154, 0.0, 1.0);
        float _1158 = -_1156;
        float _1160 = _1158 + _1102;
        float _1162 = fma(_1160, 500.0, 1.5);
        float _1164 = exp2(_1162);
        float _1166 = 0.0 + _1164;
        float _1168 = precise::clamp(_1166, 0.0, 1.0);
        _1108 = _1168;
    }
    float _1170 = _1108;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _859 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _861 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _863 + _1180;
    float _1184 = in.m_71.y;
    float _1186 = _1174 * _1174;
    float _1188 = fma(_1178, _1178, _1186);
    float _1190 = fma(_1182, _1182, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = sqrt(_1190);
    float _1196 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1198 = _1178 * _1196;
    float _1200 = _1182 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 * _1200;
    float _1206 = _1202 + _1204;
    float _1208 = sqrt(_1206);
    bool _1210 = _1208 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1214 = _1208 + _1212;
    float _1216 = _1192;
    float _1218 = _1214;
    float _1220 = _1174;
    bool _1222 = _1210;
    if (_1210)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1216 = _1224;
    }
    float _1226 = _1216;
    if (_1210)
    {
        float _1228 = rsqrt(_1206);
        _1037 = _1228;
    }
    float _1230 = _1037;
    float _1232 = _1230;
    if (_1210)
    {
        float _1234 = _1214 * _1226;
        _1218 = _1234;
    }
    float _1236 = _1218;
    if (_1210)
    {
        float _1238 = _1236 * 0.15915493667125701904296875;
        _376 = _1238;
    }
    float _1240 = _376;
    float _1242 = _1182;
    if (_1210)
    {
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1242 = _1246;
    }
    float _1248 = _1242;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1226;
    float _1256 = _1252;
    if (_1210)
    {
        float _1258 = _1240 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1196;
    float _1266 = -_1252;
    float _1268 = fma(_1174, _1264, _1266);
    if (_1210)
    {
        float _1270 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1270;
    }
    float _1272 = _1220;
    float _1274 = _1272;
    float _1276 = _1248;
    if (_1210)
    {
        float _1278 = fma(_1248, _1272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1274 = _1278;
    }
    float _1280 = _1274;
    float _1282 = _1280;
    if (!_1210)
    {
        _1276 = _1198;
    }
    float _1284 = _1276;
    float _1286 = _1284;
    float _1288 = _1262;
    if (_1210)
    {
        float _1290 = _1262 + (-1.0);
        _1256 = _1290;
    }
    float _1292 = _1256;
    float _1294 = _1292;
    if (_1210)
    {
        float _1296 = _1230 * _1280;
        _1061 = _1296;
    }
    float _1298 = _1061;
    if (!_1210)
    {
        _1282 = _1268;
    }
    float _1300 = _1282;
    float _1302 = _1300;
    if (_1210)
    {
        float _1304 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _977 = _1304;
    }
    float _1306 = _977;
    if (_1210)
    {
        float _1308 = _1198 * _1298;
        _1286 = _1308;
    }
    float _1310 = _1286;
    if (!_1210)
    {
        _1294 = _1200;
    }
    float _1312 = _1294;
    float _1314 = _1312;
    if (_1210)
    {
        float _1316 = _1200 * _1298;
        _1314 = _1316;
    }
    float _1318 = _1314;
    if (!_1210)
    {
        _1232 = _1202;
    }
    float _1320 = _1232;
    float _1322 = _1320;
    if (_1210)
    {
        float _1324 = fma(_1268, _1262, _1306);
        _1302 = _1324;
    }
    float _1326 = _1302;
    if (_1210)
    {
        float _1328 = _1310 * _1310;
        _1322 = _1328;
    }
    float _1330 = _1322;
    if (!_1210)
    {
        _1288 = _1204;
    }
    float _1332 = _1288;
    float _1334 = _1332;
    if (_1210)
    {
        float _1336 = _1318 * _1318;
        _1334 = _1336;
    }
    float _1338 = _1334;
    float _1340 = fma(_1326, _1326, _1330);
    float _1342 = in.m_71.x;
    float _1344 = _1340 + _1338;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1194, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1354 = _1352 != 0;
    float _1356 = in.m_65.w;
    float _1358 = -_1350;
    float _1360 = _1358 + 1.0;
    float _1362 = rsqrt(_1344);
    float _1364 = abs(_1360);
    float _1366 = log2(_1364);
    float _1368 = _1202;
    float _1370 = 0.0187292993068695068359375;
    if (_1354)
    {
        float _1372 = in.m_65.x;
        _1368 = _1372;
    }
    float _1374 = _1368;
    float _1376 = _1362 * _1310;
    float _1378 = _1362 * _1326;
    float _1380 = _1362 * _1318;
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1384 = -_1382;
    float _1386 = fma(_1378, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1384);
    float _1388 = -_1380;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1386);
    float _1392 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1394 = fma(_1390, -0.5, 0.5);
    float _1396 = fma(_1390, 0.5, 0.5);
    float _1398 = exp2(_1392);
    float _1400 = fma(_1396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1396, _1400, -0.212114393711090087890625);
    float _1404 = sqrt(_1394);
    float _1406 = fma(_1396, _1402, 1.570728778839111328125);
    float _1408 = _1378 + 1.0;
    float _1410 = -_1378;
    float _1412 = fma(_1398, _1408, _1410);
    float _1414 = _1404 * 0.636619746685028076171875;
    float _1416 = fma(_1412, 0.5, 0.5);
    float _1418 = -_1406;
    float _1420 = fma(_1414, _1418, 1.0);
    float2 _4620 = float2(_1420, _1416);
    float3 _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4620, float2(0.0), isnan(_4620)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4620, float2(0.0), isnan(_4620)), level(0.0)).xyz;
    float _1426 = _1424.x;
    float _1428 = _1424.y;
    float _1430 = _1424.z;
    float _1432 = _1406;
    int _1434 = as_type<int>(_1342);
    if (!_1354)
    {
        _1370 = _1342;
    }
    float _1436 = _1370;
    float _1438 = in.m_73.x;
    float _1440 = in.m_73.y;
    float _1442 = in.m_73.z;
    float _1444 = in.m_73.w;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1448 = _1446 != 0;
    float _1450 = -_1184;
    float _1452 = _1450 + 1.0;
    float _1454 = _1436;
    if (!_1354)
    {
        _1432 = _1436;
    }
    float _1456 = _1432;
    float _1458 = in.m_65.z;
    float _1460 = _1456;
    if (_1354)
    {
        _1454 = _1342;
    }
    float _1462 = _1454;
    float _1464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1466 = _1462;
    if (_1354)
    {
        bool _1468 = _1374 > 0.5;
        _1222 = _1468;
    }
    bool _1470 = _1222;
    float _1472 = _334 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1474 = _1356 > 0.5;
    if (_1354)
    {
        float _1476 = -_1462;
        float _1478 = _1476 + 1.0;
        _1434 = as_type<int>(_1478);
    }
    int _1480 = _1434;
    out.m_75.y = _1184;
    int _1482 = _1474 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1354)
    {
        float _1486 = _1470 ? as_type<float>(_1480) : _1462;
        _1460 = _1486;
    }
    float _1488 = _1460;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1492 = as_type<float>(_1480);
    if (_1448)
    {
        float _1494 = in.m_65.z;
        _1492 = _1494;
    }
    float _1496 = _1492;
    bool _1498 = _334 > 0.5;
    float _1500 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1502 = fma(_1472, -2.0, _1490);
    float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1506 = _1498 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1508 = _338 * _1442;
    float _1510 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1512 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1514 = _1440 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1516 = _1458 > 0.5;
    float _1518 = -_1508;
    float _1520 = fma(_342, _1438, _1518);
    float _1522 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1510);
    float _1524 = _340 * _1438;
    float _1526 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1512);
    float _1528 = fma(_1438, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1514);
    float _1530 = _342 * _1440;
    int _1532 = _1516 ? as_type<int>(_1452) : as_type<int>(_1184);
    float _1534 = -_1524;
    float _1536 = fma(_338, _1440, _1534);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1540 = _1538 != 0;
    float _1542 = -_1530;
    float _1544 = fma(_340, _1442, _1542);
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1548 = _1546 != 0;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1552 = _1540 ? as_type<float>(_1532) : _1184;
    float _1554 = _1520 * _1444;
    bool _1556 = _1540;
    int _1558 = as_type<int>(_1528);
    float _1560 = _1458;
    if (_1448)
    {
        bool _1562 = _1496 > 0.5;
        _1556 = _1562;
    }
    bool _1564 = _1556;
    float _1566 = _1544 * _1444;
    float _1568 = _1536 * _1444;
    float _1570 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1572 = _1548 ? as_type<float>(_1506) : _1184;
    float _1574 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1550);
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1578 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1522);
    float _1580 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1584 = _1582 != 0;
    float _1586 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1574);
    float _1588 = fma(_1570, _1572, -0.5);
    float _1590 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1502);
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1594 = _1592 != 0;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1600 = _1598 != 0;
    float _1602 = -_1590;
    float _1604 = fma(_1586, _1588, _1602);
    float _1606 = _1584 ? as_type<float>(_1482) : _1184;
    float _1608 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1612 = _1610 != 0;
    float _1614 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1526);
    float _1616 = fma(_1580, _1552, -0.5);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1620 = _1612 ? as_type<float>(_1532) : _1184;
    float _1622 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1624 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1626 = fma(_1442, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1528);
    int _1628 = as_type<int>(_1590);
    int _1630 = as_type<int>(_1580);
    float _1632 = _1620;
    float _1634 = _1624;
    if (_1448)
    {
        float _1636 = -_1462;
        float _1638 = _1636 + 1.0;
        _1628 = as_type<int>(_1638);
    }
    int _1640 = _1628;
    if (_1594)
    {
        float _1642 = -_1462;
        float _1644 = _1642 + 1.0;
        _1630 = as_type<int>(_1644);
    }
    int _1646 = _1630;
    float _1648 = fma(_1608, _1606, -0.5);
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1600)
    {
        float _1652 = -_1462;
        float _1654 = _1652 + 1.0;
        _1558 = as_type<int>(_1654);
    }
    int _1656 = _1558;
    float _1658 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1662 = fma(_1622, _1620, -0.5);
    float _1664 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1624);
    if (!_1448)
    {
        _1632 = _1462;
    }
    float _1666 = _1632;
    float _1668 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1672 = _1666;
    if (!_1594)
    {
        _1634 = _1462;
    }
    float _1674 = _1634;
    float _1676 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1678 = _1674;
    if (_1448)
    {
        float _1680 = _1564 ? as_type<float>(_1640) : _1462;
        _1672 = _1680;
    }
    float _1682 = _1672;
    float _1684 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    if (_1594)
    {
        float _1686 = _1498 ? as_type<float>(_1646) : _1462;
        _1678 = _1686;
    }
    float _1688 = _1678;
    float _1690 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1660);
    if (_1600)
    {
        float _1692 = _1498 ? as_type<float>(_1656) : _1462;
        _1466 = _1692;
    }
    float _1694 = _1466;
    float _1696 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1698 = fma(_1668, _1682, -0.5);
    float _1700 = fma(_1676, _1688, -0.5);
    float _1702 = fma(_1696, _1694, -0.5);
    out.m_77.x = _1614;
    out.m_77.y = _1578;
    out.m_77.z = _1626;
    float _1704 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1710 = fma(_1704, _1488, -0.5);
    float _1712 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1726 = _478 != 0.0;
    bool _1728 = isnan(_478);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1738 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1740 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.x = _1724;
    out.m_79.y = _1712;
    out.m_79.z = _1714;
    float _1742 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1744 = _476 == 0.0;
    bool _1746 = !_1734;
    bool _1748 = _1744 && _1746;
    float _1750 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1664);
    float _1752 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1684);
    bool _1754 = _480 == 0.0;
    bool _1756 = _1754 && _1748;
    out.m_81.x = _1738;
    out.m_81.y = _1740;
    out.m_81.z = _1742;
    out.m_81.w = _1736;
    bool _1758 = _785 != 2;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1762 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1690);
    float _1764 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    out.m_83.x = _1752;
    out.m_83.y = _1750;
    out.m_83.z = _1762;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _1772 = _789 != 1;
    float _1774 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1768);
    float _1776 = _791 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1778 = _793 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1782 = -_1760;
    float _1784 = fma(_1776, 2.0, _1782);
    float _1786 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1774);
    float _1788 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1766);
    float _1790 = fma(_1778, -2.0, _1770);
    float _1792 = -_160;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1784);
    float _1796 = _1766;
    float _1798 = _1770;
    if (_1756)
    {
        _797 = _340;
    }
    float _1800 = _797;
    float _1802 = _1800;
    if (!_1756)
    {
        float _1804 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _340);
        _1802 = _1804;
    }
    float _1806 = _1802;
    if (_1758)
    {
        _378 = _787;
    }
    float _1808 = _378;
    float _1810 = fma(_1786, _1702, _1794);
    float _1812 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1788);
    float _1814 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1790);
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1818 = _1808;
    if (!_1758)
    {
        _1818 = _1458;
    }
    float _1820 = _1818;
    float _1822 = -_1814;
    float _1824 = fma(_1812, _1662, _1822);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1828 = -_1780;
    float _1830 = fma(_1764, 2.0, _1828);
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1834 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1816);
    float _1836 = _1826;
    float _1838 = _1830;
    if (_1756)
    {
        _1796 = _338;
    }
    float _1840 = _1796;
    float _1842 = _1840;
    if (!_1756)
    {
        float _1844 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[17].y, _338);
        _1842 = _1844;
    }
    float _1846 = _1842;
    if (_1756)
    {
        _1798 = _342;
    }
    float _1848 = _1798;
    float _1850 = -_1826;
    float _1852 = fma(_1832, 2.0, _1850);
    float _1854 = _1848;
    if (!_1756)
    {
        float _1856 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[17].y, _342);
        _1854 = _1856;
    }
    float _1858 = _1854;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1862 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1834);
    float _1864 = -_160;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1830);
    if (!_1772)
    {
        _380 = _334;
    }
    float _1868 = _380;
    float _1870 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1860);
    float _1872 = _1868;
    if (!_1772)
    {
        _1836 = _1458;
    }
    float _1874 = _1836;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1878 = _1874;
    if (_1772)
    {
        _1560 = _334;
    }
    float _1880 = _1560;
    float _1882 = fma(_1862, _1710, _1866);
    if (!_1772)
    {
        _1838 = _1868;
    }
    float _1884 = _1838;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1888 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1876);
    float _1890 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1886);
    float _1892 = _1884;
    if (_1772)
    {
        _1892 = _787;
    }
    float _1894 = _1892;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1772)
    {
        _1872 = _787;
    }
    float _1898 = _1872;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1902 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1904 = _1898;
    if (_1772)
    {
        _1878 = _334;
    }
    float _1906 = _1878;
    float _1908 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1900);
    if (_1758)
    {
        _1904 = _334;
    }
    float _1910 = _1904;
    float _1912 = -_1896;
    float _1914 = fma(_1902, 2.0, _1912);
    float _1916 = _1910;
    if (!_1758)
    {
        _1916 = _787;
    }
    float _1918 = _1916;
    float _1920 = abs(_444);
    float _1922 = log2(_1920);
    float _1924 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1888);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1928 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1930 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1932 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1908);
    float _1934 = -_160;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1914);
    float _1938 = fma(_1928, -2.0, _1926);
    float _1940 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1890);
    float _1942 = fma(_1932, _1698, _1936);
    float _1944 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1946 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1938);
    float _1948 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1950 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1870);
    float _1952 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1944);
    float _1954 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1956 = fma(_1930, -2.0, _1948);
    float _1958 = -_1946;
    float _1960 = fma(_1940, _1648, _1958);
    float _1962 = _935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1964 = exp2(_1954);
    float _1966 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1956);
    float _1968 = -_160;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1852);
    float _1972 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1962);
    float _1974 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1976 = -_1966;
    float _1978 = fma(_1950, _1616, _1976);
    float _1980 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1982 = _1604 + 0.5;
    float _1984 = _1882 + 0.5;
    float _1986 = _1942 + 0.5;
    float _1988 = _1960 + 0.5;
    float _1990 = fma(_1924, _1700, _1970);
    float _1992 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1972);
    float _1994 = exp2(_1500);
    out.m_85.x = _1984;
    out.m_85.y = _1982;
    out.m_85.z = _1986;
    out.m_85.w = _1988;
    float _1996 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1974);
    float _1998 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1992);
    float _2004 = fma(_1846, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1980);
    float _2006 = _1011 + _985;
    bool _2008 = _444 <= 8000.0;
    bool _2010 = isnan(_444);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan(8000.0);
    bool _2016 = _2012 || _2014;
    float _2018 = float(_2016);
    float _2020 = _1978 + 0.5;
    out.gl_Position.x = _1011;
    out.gl_Position.y = _1013;
    out.gl_Position.z = _2002;
    out.gl_Position.w = _985;
    float _2022 = _2002 + _985;
    float _2024 = _985 * 0.5;
    float _2026 = _2006 * 0.5;
    float _2028 = _2022 * 0.5;
    float _2030 = fma(_1013, -0.5, _2024);
    float _2032 = -_330;
    float _2034 = _2032 + 1.0;
    float _2036 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1952);
    float _2038 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1996);
    float _2040 = fma(_2000, -2.0, 3.0);
    float _2042 = _2000 * _2000;
    out.m_87.x = _2026;
    out.m_87.y = _2030;
    out.m_87.z = _2028;
    out.m_87.w = _985;
    float _2044 = -_1994;
    float _2046 = _2044 + 1.0;
    float _2048 = fma(_1858, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2004);
    float _2050 = _2042 * _2040;
    float _2052 = _1810 + 0.5;
    float _2054 = _1824 + 0.5;
    float _2056 = _1990 + 0.5;
    float _2058 = -_2050;
    float _2060 = _2058 + 1.0;
    out.m_89.x = _2036;
    out.m_89.y = _2038;
    out.m_89.z = _2048;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2050);
    out.m_91.x = _2052;
    out.m_91.y = _2054;
    float _2064 = _2046 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2066 = _2018 * _2062;
    float _2068 = _2062;
    float _2070 = _2046;
    if (!_963)
    {
        _2068 = 1.0;
    }
    float _2072 = _2068;
    out.m_93.x = _2056;
    out.m_93.y = _2020;
    float _2074 = _2072;
    if (_963)
    {
        bool _2076 = _1083 >= _1029;
        bool _2078 = isnan(_1083);
        bool _2080 = _2076 || _2078;
        bool _2082 = isnan(_1029);
        bool _2084 = _2080 || _2082;
        float _2086 = float(_2084);
        _2074 = _2086;
    }
    float _2088 = _2074;
    float _2090 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2092 = _2064 * _1085;
    float _2094 = -_2064;
    float _2096 = _2094 + 1.0;
    out.m_95.z = _2028;
    out.m_95.w = _985;
    float _2098 = _2034 * _2090;
    float _2100 = precise::clamp(_2098, 0.0, 1.0);
    float _2102 = _2088 * _1170;
    float _2104 = _1096 * _2092;
    float _2106 = _1096 * _2096;
    float _2108 = -_2100;
    float _2110 = fma(_2108, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_97.x = _861;
    out.m_97.y = _859;
    out.m_97.z = _863;
    bool _2112 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2114 = isnan(_1194);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2120 = _2116 || _2118;
    float _2122 = -_2102;
    float _2124 = fma(_2122, _2110, 1.0);
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = _2126 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_99.x = _2128;
    float _2130 = _2096;
    float _2132 = _2100;
    float _2134 = _2102;
    float _2136 = _2126;
    if (!_2120)
    {
        _2130 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2138 = _2130;
    float _2140 = _2138;
    float _2142 = _2138;
    if (!_2120)
    {
        _995 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2144 = _995;
    float _2146 = _2144;
    float _2148 = _2144;
    if (!_2120)
    {
        _2132 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2150 = _2132;
    float _2152 = _1430 * _2092;
    float _2154 = fma(_1426, _2104, _1090);
    float _2156 = fma(_1428, _2104, _1092);
    float _2158 = _2150;
    float _2160 = _2150;
    if (!_2120)
    {
        _2070 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2162 = _2070;
    float _2164 = fma(_1096, _2152, _1094);
    float _2166 = _2162;
    float _2168 = _2162;
    if (!_2120)
    {
        _2134 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2170 = _2134;
    float _2172 = _2170;
    float _2174 = _2170;
    if (!_2120)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2176 = _2136;
    out.m_101.x = _2154;
    out.m_101.y = _2156;
    out.m_101.z = _2164;
    out.m_101.w = _2106;
    bool _2178 = !_2120;
    float _2180 = _2176;
    float _2182 = _2176;
    if (!_2178)
    {
        bool _2184 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2186 = isnan(_1194);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2192 = _2188 || _2190;
        if (!_2192)
        {
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = _1194 + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2200 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2198;
            float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2206 = 1.0 / _2200;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2224 = _2196 * _2206;
            float _2226 = precise::clamp(_2224, 0.0, 1.0);
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2232 = fma(_2226, _2204, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2234 = fma(_2226, _2230, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2236 = fma(_2226, _2210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2238 = fma(_2226, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2240 = fma(_2226, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2242 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2148 = _2236;
            _2174 = _2240;
            _2142 = _2232;
            _2168 = _2238;
            _2160 = _2234;
            _2182 = _2242;
            _2244 = true;
        }
        else
        {
            bool _2246 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2248 = isnan(_1194);
            bool _2250 = _2246 || _2248;
            bool _2252 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2254 = _2250 || _2252;
            if (!_2254)
            {
                _2140 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2256 = _2140;
            _2142 = _2256;
            if (!_2254)
            {
                _2146 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2258 = _2146;
            _2148 = _2258;
            if (!_2254)
            {
                _2158 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2260 = _2158;
            _2160 = _2260;
            if (!_2254)
            {
                _2166 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2262 = _2166;
            _2168 = _2262;
            if (!_2254)
            {
                _2172 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2264 = _2172;
            _2174 = _2264;
            if (!_2254)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2266 = _2180;
            bool _2268 = !_2254;
            _2182 = _2266;
            if (!_2268)
            {
                bool _2270 = _1194 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2272 = isnan(_1194);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2278 = _2274 || _2276;
                if (!_2278)
                {
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = _1194 + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2286 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2284;
                    float _2288 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2290 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2292 = 1.0 / _2286;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2310 = _2282 * _2292;
                    float _2312 = precise::clamp(_2310, 0.0, 1.0);
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2318 = fma(_2312, _2290, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2320 = fma(_2312, _2316, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2322 = fma(_2312, _2296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2324 = fma(_2312, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2326 = fma(_2312, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2328 = fma(_2312, _2308, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2148 = _2322;
                    _2174 = _2326;
                    _2142 = _2318;
                    _2168 = _2324;
                    _2160 = _2320;
                    _2182 = _2328;
                    _2244 = true;
                }
                else
                {
                    _2148 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2174 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2142 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2168 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2160 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2244 = false;
    float _2330 = _2148;
    float _2332 = _2174;
    float _2334 = _2142;
    float _2336 = _2168;
    float _2338 = _2160;
    float _2340 = _2182;
    float _2342 = fma(_2038, -0.5, 0.5);
    float _2344 = precise::clamp(_2342, 0.0, 1.0);
    float _2346 = -_2330;
    float _2348 = _2346 + _2332;
    float _2350 = -_2334;
    float _2352 = _2350 + _2336;
    float _2354 = -_2338;
    float _2356 = _2354 + _2340;
    bool _2358 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2360 = fma(_2344, _2348, _2330);
    float _2362 = fma(_2344, _2352, _2334);
    float _2364 = fma(_2344, _2356, _2338);
    float _2366 = _2360 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2368 = fma(_2362, 0.298911988735198974609375, _2366);
    float _2370 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2372 = fma(_2364, 0.114477999508380889892578125, _2368);
    out.m_59.x = _2370;
    float _2374 = -_2372;
    float _2376 = _2362 + _2374;
    float _2378 = -_2372;
    float _2380 = _2360 + _2378;
    float _2382 = -_2372;
    float _2384 = _2364 + _2382;
    float _2386 = fma(_2376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2388 = fma(_2380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    float _2390 = fma(_2384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2372);
    out.m_105.x = _2386;
    out.m_105.y = _2388;
    out.m_105.z = _2390;
    if (!_2358)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2392 = -_859;
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2396 = -_861;
    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2400 = -_863;
    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = sqrt(_2408);
    float _2412 = rsqrt(_2408);
    float _2414 = -_2410;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2398 * _2412;
    float _2424 = _2394 * _2412;
    float _2426 = abs(_2420);
    float _2428 = log2(_2426);
    float _2430 = _2402 * _2412;
    float _2432 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2434 = _2038 * _2424;
    float _2436 = -_2424;
    float _2438 = -_2432;
    float _2440 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2438);
    float _2442 = fma(_2036, _2422, _2434);
    float _2444 = -_2430;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2440);
    float _2448 = fma(_2048, _2430, _2442);
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2454 = _2446 + _2452;
    float _2456 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2458 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = exp2(_2456);
    float _2464 = _2462 * _2460;
    float _2466 = _2450 * _2464;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2470 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2468;
    out.m_103.y = _2470;
    out.m_103.z = _2472;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

