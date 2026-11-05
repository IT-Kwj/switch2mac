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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
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
    float4 m_85 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_109 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_107 [[user(locn14)]];
    float4 m_103 [[user(locn15)]];
    float4 m_105 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_73 [[attribute(0)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2258 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_56.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_128);
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _134;
    if (!_132)
    {
        out.m_59.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2544 = as_type<float>(_144);
        out.gl_Position.z = _2544;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_61.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_158)
    {
        float _164 = float(_128);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _162 >= _166;
    bool _170 = !_158;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_180);
        out.gl_Position.z = _2613;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_56.x;
    float _184 = in.m_56.y;
    float _186 = in.m_56.z;
    float _188 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    float _200 = _196 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _202 = _198 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _204 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _206 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _208 = floor(_204);
    float _210 = floor(_206);
    float _212 = -_208;
    float _214 = _204 + _212;
    float _216 = -_210;
    float _218 = _206 + _216;
    float2 _2693 = float2(_214, _218);
    float _220 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2693, float2(0.0), isnan(_2693)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2693, float2(0.0), isnan(_2693)), level(0.0)).x;
    float _222 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _224 = in.m_63.y;
    float _226 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _222);
    float _228 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _230 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _226);
    float _232 = _230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _234 = _232 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _236 = _232 + _228;
    float _238 = fma(_200, (*spvDescriptorSet0.vp_c8)._m0[11].x, _234);
    float _240 = _236 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _242 = in.m_65.x;
    float _244 = in.m_65.y;
    float _246 = in.m_65.z;
    float _248 = _236 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _250 = fma(_202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _238);
    float _252 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[126].x, _240);
    float _254 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[127].x, _248);
    float _256 = _250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _258 = _232 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _260 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[126].z, _252);
    float _262 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[127].z, _254);
    float _264 = 1.0 / _256;
    float _266 = fma(_200, (*spvDescriptorSet0.vp_c8)._m0[10].x, _258);
    float _268 = _260 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _270 = _262 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _272 = fma(_202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _266);
    float _274 = in.m_67.x;
    float _276 = in.m_67.y;
    float _278 = in.m_67.z;
    float _280 = trunc(_268);
    int _282 = int(_280);
    float _284 = _272 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _286 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    float _288 = _284 + _256;
    float _290 = fma(_244, 16.0, _286);
    float _292 = trunc(_270);
    int _294 = int(_292);
    float _296 = _288 * _264;
    float _298 = _296 * 0.5;
    float _300 = _290 * 0.15915493667125701904296875;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _304 = fma(_298, (*spvDescriptorSet0.vp_c8)._m0[30].w, _302);
    float _306 = in.m_69.x;
    float _308 = in.m_69.y;
    float _310 = in.m_69.z;
    float _312 = _300 * 6.283185482025146484375;
    float _314 = sin(_312);
    int _316 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _318 = _282 + _316;
    int _320 = _318 + 1;
    bool _322 = _320 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _324 = 1.0 / _304;
    int _326 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _328 = _294 + _326;
    int _330 = _328 + 1;
    int _332 = _320 | _330;
    float _334 = fma(_314, 0.5, 0.5);
    bool _336 = _332 < 0;
    bool _338 = _336 || _322;
    float _340 = _334 * 0.004999999888241291046142578125;
    bool _342 = _330 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _344 = _342 || _338;
    float _346 = _310 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _350 = _324 * _348;
    float _352 = fma(_274, _340, _242);
    float _354 = fma(_276, _340, _244);
    float _356 = fma(_278, _340, _246);
    float _358 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _360 = _350 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _362 = _306 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _364 = _350 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _366 = _308 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _368 = !_360;
    int _370 = _368 ? 0 : 1;
    int _372 = 0;
    int _374 = as_type<int>(_324);
    int _376 = 2;
    int _378 = as_type<int>(_358);
    float _380 = _236;
    float _382 = _276;
    float _384 = _274;
    if (!_344)
    {
        int _386 = _330 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _388 = _386 + _320;
        _372 = _388;
    }
    int _390 = _372;
    float _392 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _394 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _356);
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _352);
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _354);
    if (!_344)
    {
        int _402 = _390 << 2;
        _374 = _402;
    }
    int _404 = _374;
    float _406 = _396 * _358;
    int _408 = _404;
    if (!_360)
    {
        _376 = 1;
    }
    int _410 = _376;
    float _412 = _398 * _392;
    int _414 = _410;
    if (!_364)
    {
        _414 = _370;
    }
    int _416 = _414;
    float _418 = _400 * _394;
    float _420 = as_type<float>(_416);
    if (!_344)
    {
        uint _423 = uint(int(uint(_390) >> uint(2)));
        _378 = int(_423);
    }
    int _425 = _378;
    int _427 = _416 << 6;
    float _429 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _431 = as_type<float>(_427);
    if (!_344)
    {
        int _433 = 12 & _404;
        _408 = _433;
    }
    int _435 = _408;
    float _437 = _418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _439 = _427 + 96;
    uint _441 = uint(int(uint(_439) >> uint(2)));
    uint _443 = uint(int(uint(int(_441)) >> uint(2)));
    int _445 = int(_441) & 3;
    float _447 = (*spvDescriptorSet0.vp_c15)._m0[int(_443)][_445];
    int _449 = int(_441) + 1;
    uint _451 = uint(int(uint(_449) >> uint(2)));
    int _453 = _449 & 3;
    float _455 = (*spvDescriptorSet0.vp_c15)._m0[int(_451)][_453];
    float _457 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _429);
    float _459 = 0.0;
    if (!_344)
    {
        int _461 = _425 << 4;
        int _463 = _461 + _435;
        _459 = as_type<float>(_463);
    }
    float _465 = _459;
    float _467 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _437);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _471 = _469 != 0;
    float _473 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[10].z, _457);
    float _475 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _477 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[8].z, _467);
    float _479 = _465;
    if (!_344)
    {
        int _481 = as_type<int>(_465) + 400;
        uint _483 = uint(int(uint(_481) >> uint(2)));
        uint _485 = uint(int(uint(int(_483)) >> uint(2)));
        int _487 = int(_483) & 3;
        float _489 = (*spvDescriptorSet0.vp_c15)._m0[int(_485)][_487];
        _479 = _489;
    }
    float _491 = _479;
    float _493 = _202 + _473;
    float _495 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _475);
    float _497 = _200 + _477;
    float _499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _501 = _493 + _499;
    float _503 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].z, _495);
    float _505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _507 = _497 + _505;
    int _509 = _427 + 48;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    uint _513 = uint(int(uint(int(_511)) >> uint(2)));
    int _515 = int(_511) & 3;
    float _517 = (*spvDescriptorSet0.vp_c15)._m0[int(_513)][_515];
    int _519 = int(_511) + 1;
    uint _521 = uint(int(uint(_519) >> uint(2)));
    int _523 = _519 & 3;
    float _525 = (*spvDescriptorSet0.vp_c15)._m0[int(_521)][_523];
    float _527 = _501 * _501;
    float _529 = 0.0;
    float _531 = _527;
    float _533 = _503;
    if (_471)
    {
        float _535 = in.m_63.x;
        _529 = _535;
    }
    float _537 = _529;
    int _539 = 0;
    if (_471)
    {
        _539 = 0;
    }
    int _541 = _539;
    float _543 = fma(_507, _507, _527);
    int _545 = 0;
    int _547 = _541;
    if (_471)
    {
        _545 = 0;
    }
    int _549 = _545;
    int _551 = _427 + 56;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = int(_553) + 1;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    int _565 = _561 & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    float _569 = sqrt(_543);
    int _571 = _427 + 64;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    uint _575 = uint(int(uint(int(_573)) >> uint(2)));
    int _577 = int(_573) & 3;
    float _579 = (*spvDescriptorSet0.vp_c15)._m0[int(_575)][_577];
    int _581 = int(_573) + 1;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    int _585 = _581 & 3;
    float _587 = (*spvDescriptorSet0.vp_c15)._m0[int(_583)][_585];
    int _589 = _427 + 72;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    uint _593 = uint(int(uint(int(_591)) >> uint(2)));
    int _595 = int(_591) & 3;
    float _597 = (*spvDescriptorSet0.vp_c15)._m0[int(_593)][_595];
    int _599 = int(_591) + 1;
    uint _601 = uint(int(uint(_599) >> uint(2)));
    int _603 = _599 & 3;
    float _605 = (*spvDescriptorSet0.vp_c15)._m0[int(_601)][_603];
    bool _607 = _569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _609 = _537;
    int _611 = _549;
    if (_471)
    {
        _531 = _537;
    }
    float _613 = _531;
    float _615 = _236 * _455;
    int _617 = _427 + 80;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.vp_c15)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    float _635 = _232 + _503;
    float _637 = fma(_200, _447, _615);
    int _639 = _427 + 88;
    uint _641 = uint(int(uint(_639) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c15)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c15)._m0[int(_651)][_653];
    int _657 = _427 + 104;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.vp_c15)._m0[int(_669)][_671];
    float _675 = _447;
    float _677 = _613;
    float _679 = _635;
    if (_471)
    {
        _431 = _224;
    }
    float _681 = _431;
    float _683 = _681;
    float _685 = _525;
    float _687 = _633;
    float _689 = _625;
    if (!_471)
    {
        float _691 = in.m_63.x;
        float _693 = _224 * 3.1415927410125732421875;
        float _695 = _693 * 0.15915493667125701904296875;
        float _697 = _695 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = _691 * 3.1415927410125732421875;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = sin(_705);
        _675 = _703;
        _547 = 1;
        _609 = _691;
        _677 = _707;
        _611 = 2;
        _683 = _699;
    }
    float _709 = _675;
    int _711 = _547;
    float _713 = _609;
    float _715 = _677;
    int _717 = _611;
    float _719 = _683;
    float _721 = _709;
    float _723 = _719;
    if (!_607)
    {
        _721 = _497;
    }
    float _725 = _721;
    float _727 = _725;
    if (!_607)
    {
        _533 = _493;
    }
    float _729 = _533;
    bool _731 = !_607;
    float _733 = _729;
    if (!_731)
    {
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _737 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _739 = _569 + _737;
        float _741 = rsqrt(_543);
        float _743 = _739 * _735;
        float _745 = _635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _747 = _743 * 0.15915493667125701904296875;
        float _749 = _747 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = _747 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _751 + (-1.0);
        float _759 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _761 = _757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = _741 * _759;
        float _765 = fma(_635, _751, _761);
        float _767 = fma(_507, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _769 = fma(_501, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _679 = _765;
        _727 = _767;
        _733 = _769;
    }
    float _771 = _679;
    float _773 = _727;
    float _775 = _733;
    float _777 = fma(_202, _665, _637);
    float _779 = _236 * _525;
    float _781 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _783 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _785 = isnan(0.5);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _791 = _787 || _789;
    float _793 = _236 * _587;
    float _795 = fma(_200, _517, _779);
    float _797 = _777 + _673;
    float _799 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _781);
    if (!_344)
    {
        float _801 = floor(_268);
        _685 = _801;
    }
    float _803 = _685;
    float _805 = fma(_200, _579, _793);
    float _807 = fma(_202, _559, _795);
    float _809 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _799);
    float _811 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _813 = fma(_202, _597, _805);
    float _815 = _807 + _567;
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _819 = 1.0 / _797;
    float _821 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _823 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _825 = _817 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _827 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _829 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _821);
    float _831 = _813 + _605;
    float _833 = -_825;
    float _835 = fma(_833, _811, 1.0);
    float _837 = _501;
    float _839 = _829;
    if (!_344)
    {
        float _841 = floor(_270);
        _837 = _841;
    }
    float _843 = _837;
    float _845 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _829);
    float _847 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _823);
    float _849 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _827);
    if (_791)
    {
        _839 = 1.0;
    }
    float _851 = _839;
    float _853 = _815 * _819;
    float _855 = _851;
    float _857 = _853;
    if (!_791)
    {
        float _859 = as_type<float>(in.m_73.w);
        int _861 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _863 = _861 == 4;
        bool _865 = _861 == 8;
        bool _867 = _861 == 12;
        int _869 = as_type<int>(_859) << 16;
        int _871 = as_type<int>(_859) << 8;
        int _873 = as_type<int>(_859) << 24;
        int _875 = _869 >> 24;
        int _877 = _871 >> 24;
        int _879 = as_type<int>(_859) >> 24;
        int _881 = _873 >> 24;
        float _883 = float(_875);
        float _885 = float(_877);
        float _887 = float(_879);
        float _889 = _883 * 0.0078740157186985015869140625;
        float _891 = float(_881);
        float _893 = _885 * 0.0078740157186985015869140625;
        float _895 = _887 * 0.0078740157186985015869140625;
        float _897 = precise::min(_889, 1.0);
        float _899 = _891 * 0.0078740157186985015869140625;
        float _901 = precise::min(_893, 1.0);
        float _903 = precise::min(_895, 1.0);
        float _905 = precise::min(_899, 1.0);
        float _907 = precise::max(_897, -1.0);
        float _909 = precise::max(_901, -1.0);
        float _911 = precise::max(_903, -1.0);
        float _913 = precise::max(_905, -1.0);
        float _915 = _913;
        if (_863)
        {
            _915 = _907;
        }
        float _917 = _915;
        float _919 = _917;
        if (_865)
        {
            _919 = _909;
        }
        float _921 = _919;
        float _923 = _921;
        if (_867)
        {
            _923 = _911;
        }
        float _925 = _923;
        float _927 = abs(_925);
        float _929 = (-0.0) + _927;
        _855 = _929;
    }
    float _931 = _855;
    float _933 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _847);
    float _935 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _937 = _853 >= 0.0;
    float _939 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _849);
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _943 = _935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _945 = _831 * _819;
    bool _947 = _853 <= 1.0;
    bool _949 = _947 && _937;
    float _951 = _935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _953 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _943);
    float _955 = _935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _957 = _939 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _959 = _945 >= 0.0;
    bool _961 = _959 && _949;
    float _963 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[7].z, _953);
    float _965 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _955);
    float _967 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _951);
    bool _969 = _931 != 0.0;
    bool _971 = isnan(_931);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    float _979 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[7].w, _963);
    bool _981 = _945 <= 1.0;
    bool _983 = _981 && _961;
    float _985 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[4].z, _965);
    float _987 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[5].z, _967);
    float _989 = 1.0 / _979;
    float _991 = _236 * _633;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[4].w, _985);
    float _995 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[5].w, _987);
    float _997 = fma(_200, _625, _991);
    float _999 = log2(_835);
    float _1001 = _997;
    float _1003 = _979;
    float _1005 = _931;
    if (_977)
    {
        _687 = _993;
    }
    float _1007 = _687;
    float _1009 = fma(_202, _647, _997);
    float _1011 = _1007;
    if (_977)
    {
        _689 = _995;
    }
    float _1013 = _689;
    float _1015 = _1013;
    if (!_977)
    {
        _1015 = 0.0;
        _1011 = 0.0;
    }
    float _1017 = _1015;
    float _1019 = _1011;
    if (_983)
    {
        float _1021 = float(_416);
        _420 = _1021;
    }
    float _1023 = _420;
    if (!_344)
    {
        float _1025 = -_843;
        float _1027 = _270 + _1025;
        _1001 = _1027;
    }
    float _1029 = _1001;
    float _1031 = _1009 + _655;
    float _1033 = _835;
    if (_983)
    {
        float _1035 = rint(_1023);
        float _1037 = precise::max(_1035, 0.0);
        uint _1039 = uint(_1037);
        uint _1041 = clamp(_1039, 0u, 65535u);
        _1033 = as_type<float>(_1041);
    }
    float _1043 = _1033;
    float _1045 = _989 * _1017;
    float _1047 = _989 * _1019;
    float _1049 = _1031 * _819;
    float _1051 = fma(_1045, -0.5, 0.5);
    float _1053 = fma(_1047, 0.5, 0.5);
    float _1055 = _999 * 0.693147182464599609375;
    float _1057 = _1017;
    float _1059 = _1047;
    float _1061 = _989;
    if (!_344)
    {
        float _1063 = rint(_491);
        float _1065 = precise::max(_1063, 0.0);
        uint _1067 = uint(_1065);
        uint _1069 = clamp(_1067, 0u, 65535u);
        _1057 = as_type<float>(_1069);
    }
    float _1071 = _1057;
    if (!_344)
    {
        float _1073 = -_803;
        float _1075 = _268 + _1073;
        _1059 = _1075;
    }
    float _1077 = _1059;
    float _1079 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1081 = _843;
    float _1083 = _1043;
    float _1085 = _1079;
    if (_983)
    {
        float3 _4073 = float3(_853, _945, float(as_type<int>(_1043)));
        float3 _4077 = select(_4073, float3(0.0), isnan(_4073));
        float _1087 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4077.xy, uint(rint(_4077.z)), _1049, level(0.0));
        _1081 = _1087;
    }
    float _1089 = _1081;
    float3 _4087 = float3(_1053, _1051, _1079);
    float _1091 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4087, float3(0.0), isnan(_4087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4087, float3(0.0), isnan(_4087)), level(0.0)).x;
    float3 _4096 = float3(_1053, _1051, _1079);
    float4 _1094 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4096, float3(0.0), isnan(_4096)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4096, float3(0.0), isnan(_4096)), level(0.0)).xyzw;
    float _1096 = _1094.x;
    float _1098 = _1094.y;
    float _1100 = _1094.z;
    float _1102 = _1094.w;
    float _1104 = _1023;
    if (!_344)
    {
        float3 _4119 = float3(_1077, _1029, float(as_type<int>(_1071)));
        float3 _4121 = select(_4119, float3(0.0), isnan(_4119));
        float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4121.xy, uint(rint(_4121.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4121.xy, uint(rint(_4121.z)), level(0.0)).x;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = in.m_75.x;
    if (_344)
    {
        _1061 = 1.0;
    }
    float _1112 = _1061;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1116 = _1114 != 0;
    float _1118 = 0.0;
    float _1120 = _1112;
    float _1122 = _1110;
    if (!_1116)
    {
        _1118 = _1110;
    }
    float _1124 = _1118;
    float _1126 = _1124;
    if (!_344)
    {
        int _1128 = _390 << 4;
        int _1130 = _1128 + 2048;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
        int _1140 = int(_1132) + 1;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        int _1144 = _1140 & 3;
        float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
        int _1148 = _1130 + 8;
        uint _1150 = uint(int(uint(_1148) >> uint(2)));
        uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
        int _1154 = int(_1150) & 3;
        float _1156 = (*spvDescriptorSet0.vp_c15)._m0[int(_1152)][_1154];
        int _1158 = int(_1150) + 1;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        int _1162 = _1158 & 3;
        float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
        float _1166 = _236 * _1146;
        float _1168 = fma(_200, _1138, _1166);
        float _1170 = fma(_202, _1156, _1168);
        float _1172 = _1170 + _1164;
        float _1174 = precise::clamp(_1172, 0.0, 1.0);
        float _1176 = -_1174;
        float _1178 = _1176 + _1108;
        float _1180 = fma(_1178, 500.0, 1.5);
        float _1182 = exp2(_1180);
        float _1184 = 0.0 + _1182;
        float _1186 = precise::clamp(_1184, 0.0, 1.0);
        _380 = _1166;
        _1120 = _1186;
    }
    float _1188 = _380;
    float _1190 = _1120;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1194 = _771 + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _773 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _775 + _1200;
    float _1204 = in.m_75.y;
    float _1206 = _1194 * _1194;
    float _1208 = in.m_63.z;
    float _1210 = fma(_1198, _1198, _1206);
    float _1212 = fma(_1202, _1202, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = sqrt(_1212);
    float _1218 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1220 = _1198 * _1218;
    float _1222 = _1202 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 * _1222;
    float _1228 = _1224 + _1226;
    float _1230 = sqrt(_1228);
    bool _1232 = _1230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = _1230 + _1234;
    float _1238 = _1214;
    float _1240 = _1236;
    float _1242 = _1194;
    float _1244 = _1188;
    bool _1246 = _1232;
    int _1248 = as_type<int>(_1204);
    float _1250 = _1208;
    if (_1232)
    {
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1232)
    {
        float _1256 = rsqrt(_1228);
        _1083 = _1256;
    }
    float _1258 = _1083;
    float _1260 = _1258;
    if (_1232)
    {
        float _1262 = _1236 * _1254;
        _1240 = _1262;
    }
    float _1264 = _1240;
    if (_1232)
    {
        float _1266 = _1264 * 0.15915493667125701904296875;
        _857 = _1266;
    }
    float _1268 = _857;
    float _1270 = _1202;
    if (_1232)
    {
        float _1272 = _1268 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1280 = precise::max(0.0, _1278);
    float _1282 = _1254;
    float _1284 = _1280;
    if (_1232)
    {
        float _1286 = _1268 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        _1282 = _1288;
    }
    float _1290 = _1282;
    float _1292 = -_1218;
    float _1294 = -_1280;
    float _1296 = fma(_1194, _1292, _1294);
    if (_1232)
    {
        float _1298 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1298;
    }
    float _1300 = _1242;
    float _1302 = _1300;
    float _1304 = _1276;
    if (_1232)
    {
        float _1306 = fma(_1276, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = _1308;
    if (!_1232)
    {
        _1304 = _1220;
    }
    float _1312 = _1304;
    float _1314 = _1312;
    float _1316 = _1290;
    if (_1232)
    {
        float _1318 = _1290 + (-1.0);
        _1284 = _1318;
    }
    float _1320 = _1284;
    float _1322 = _1320;
    if (_1232)
    {
        float _1324 = _1258 * _1308;
        _1085 = _1324;
    }
    float _1326 = _1085;
    if (!_1232)
    {
        _1310 = _1296;
    }
    float _1328 = _1310;
    float _1330 = _1328;
    if (_1232)
    {
        float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1332;
    }
    float _1334 = _1244;
    if (_1232)
    {
        float _1336 = _1220 * _1326;
        _1314 = _1336;
    }
    float _1338 = _1314;
    if (!_1232)
    {
        _1322 = _1222;
    }
    float _1340 = _1322;
    float _1342 = _1340;
    if (_1232)
    {
        float _1344 = _1222 * _1326;
        _1342 = _1344;
    }
    float _1346 = _1342;
    if (!_1232)
    {
        _1260 = _1224;
    }
    float _1348 = _1260;
    float _1350 = _1348;
    if (_1232)
    {
        float _1352 = fma(_1296, _1290, _1334);
        _1330 = _1352;
    }
    float _1354 = _1330;
    if (_1232)
    {
        float _1356 = _1338 * _1338;
        _1350 = _1356;
    }
    float _1358 = _1350;
    if (!_1232)
    {
        _1316 = _1226;
    }
    float _1360 = _1316;
    float _1362 = _1360;
    if (_1232)
    {
        float _1364 = _1346 * _1346;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = _1334;
    if (_1116)
    {
        float _1370 = in.m_63.x;
        _1368 = _1370;
    }
    float _1372 = _1368;
    float _1374 = fma(_1354, _1354, _1358);
    float _1376 = in.m_63.w;
    float _1378 = _1374 + _1366;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1382 = fma(_1216, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1380);
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = -_1384;
    float _1388 = _1386 + 1.0;
    float _1390 = rsqrt(_1378);
    float _1392 = abs(_1388);
    float _1394 = log2(_1392);
    float _1396 = _1390 * _1338;
    float _1398 = _1390 * _1354;
    float _1400 = _1390 * _1346;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1404 = -_1402;
    float _1406 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = -_1400;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1412 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = fma(_1410, -0.5, 0.5);
    float _1416 = fma(_1410, 0.5, 0.5);
    float _1418 = exp2(_1412);
    float _1420 = fma(_1416, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1422 = fma(_1416, _1420, -0.212114393711090087890625);
    float _1424 = _1398 + 1.0;
    float _1426 = sqrt(_1414);
    float _1428 = fma(_1416, _1422, 1.570728778839111328125);
    float _1430 = -_1398;
    float _1432 = fma(_1418, _1424, _1430);
    float _1434 = fma(_1432, 0.5, 0.5);
    float _1436 = _1426 * 0.636619746685028076171875;
    float _1438 = -_1428;
    float _1440 = fma(_1436, _1438, 1.0);
    float2 _4628 = float2(_1440, _1434);
    float3 _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4628, float2(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4628, float2(0.0), isnan(_4628)), level(0.0)).xyz;
    float _1446 = _1444.x;
    float _1448 = _1444.y;
    float _1450 = _1444.z;
    int _1452 = as_type<int>(_1418);
    if (_1116)
    {
        float _1454 = -_1110;
        float _1456 = _1454 + 1.0;
        _1452 = as_type<int>(_1456);
    }
    int _1458 = _1452;
    if (_1116)
    {
        bool _1460 = _1372 > 0.5;
        _1246 = _1460;
    }
    bool _1462 = _1246;
    float _1464 = -_1204;
    float _1466 = _1464 + 1.0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1470 = _1468 != 0;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1116)
    {
        float _1474 = _1462 ? as_type<float>(_1458) : _1110;
        _1126 = _1474;
    }
    float _1476 = _1126;
    out.m_77.y = _1204;
    bool _1478 = _224 > 0.5;
    float _1480 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1482 = _1376 > 0.5;
    float _1484 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1486 = _1478 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1488 = in.m_79.x;
    float _1490 = in.m_79.y;
    float _1492 = in.m_79.z;
    float _1494 = in.m_79.w;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1498 = _1470 ? as_type<float>(_1486) : _1204;
    float _1500 = -_220;
    float _1502 = _1500 + 1.0;
    int _1504 = _1482 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1510 = _1508 != 0;
    float _1512 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1514 = _1208 > 0.5;
    float _1516 = fma(_1484, -2.0, _1506);
    float _1518 = _1510 ? as_type<float>(_1504) : _1204;
    float _1520 = exp2(_1480);
    int _1522 = _1514 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1524 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1516);
    out.m_81.x = _773;
    out.m_81.y = _771;
    out.m_81.z = _775;
    float _1526 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1532 = _1530 != 0;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1546 = _1544 != 0;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1550 = _1532 ? as_type<float>(_1522) : _1204;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1556 = _1554 != 0;
    float _1558 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1562 = _1560 != 0;
    float _1564 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1568 = _1566 != 0;
    float _1570 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1574 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_83.x = _1538;
    out.m_83.y = _1558;
    out.m_83.z = _1564;
    out.m_83.w = _1552;
    float _1578 = _274 * _1492;
    float _1580 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1582 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_85.x = _1570;
    out.m_85.y = _1574;
    out.m_85.z = _1576;
    float _1584 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1586 = _276 * _1488;
    float _1588 = -_1578;
    float _1590 = fma(_278, _1488, _1588);
    float _1592 = 0.0;
    int _1594 = as_type<int>(_1524);
    int _1596 = as_type<int>(_1526);
    bool _1598 = _1568;
    if (_1546)
    {
        float _1600 = in.m_63.z;
        _1592 = _1600;
    }
    float _1602 = _1592;
    float _1604 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1580);
    float _1606 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1582);
    float _1608 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1584);
    float _1610 = -_1586;
    float _1612 = fma(_274, _1490, _1610);
    float _1614 = _278 * _1490;
    float _1616 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1620 = fma(_1512, _1498, -0.5);
    float _1622 = _1568 ? as_type<float>(_1522) : _1204;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1626 = fma(_1616, _1518, -0.5);
    float _1628 = -_1614;
    float _1630 = fma(_276, _1492, _1628);
    float _1632 = _1590 * _1494;
    float _1634 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1624);
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1638 = _1630 * _1494;
    float _1640 = _1612 * _1494;
    float _1642 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1634);
    float _1644 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1604);
    float _1646 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1606);
    float _1648 = fma(_1526, _1550, -0.5);
    float _1650 = -_1524;
    float _1652 = fma(_1642, _1620, _1650);
    float _1654 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1656 = _1654;
    float _1658 = _1572;
    if (_1556)
    {
        float _1660 = -_1110;
        float _1662 = _1660 + 1.0;
        _1594 = as_type<int>(_1662);
    }
    int _1664 = _1594;
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1668 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1608);
    float _1670 = fma(_1654, _1622, -0.5);
    if (!_1556)
    {
        _1656 = _1110;
    }
    float _1672 = _1656;
    float _1674 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1676 = _1672;
    if (_1556)
    {
        float _1678 = _1478 ? as_type<float>(_1664) : _1110;
        _1676 = _1678;
    }
    float _1680 = _1676;
    float _1682 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1684 = _711 != 1;
    if (_1546)
    {
        float _1686 = -_1110;
        float _1688 = _1686 + 1.0;
        _1596 = as_type<int>(_1688);
    }
    int _1690 = _1596;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1546)
    {
        bool _1694 = _1602 > 0.5;
        _1598 = _1694;
    }
    bool _1696 = _1598;
    float _1698 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1682);
    if (!_1546)
    {
        _1658 = _1110;
    }
    float _1702 = _1658;
    float _1704 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1674);
    float _1706 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1698);
    out.m_87.x = _1644;
    out.m_87.y = _1646;
    out.m_87.z = _1668;
    float _1708 = _1702;
    if (_1546)
    {
        float _1710 = _1696 ? as_type<float>(_1690) : _1110;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1716 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1700);
    if (_1562)
    {
        float _1718 = -_1110;
        float _1720 = _1718 + 1.0;
        _1248 = as_type<int>(_1720);
    }
    int _1722 = _1248;
    float _1724 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1704);
    float _1726 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1706);
    if (_1562)
    {
        float _1728 = _1478 ? as_type<float>(_1722) : _1110;
        _1122 = _1728;
    }
    float _1730 = _1122;
    out.m_89.x = _1724;
    out.m_89.y = _1716;
    out.m_89.z = _1726;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1734 = _713 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1736 = fma(_1714, _1712, -0.5);
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1740 = -_1732;
    float _1742 = fma(_1734, 2.0, _1740);
    float _1744 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1746 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1752 = fma(_1744, _1680, -0.5);
    float _1754 = _715 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1756 = fma(_1746, _1730, -0.5);
    bool _1758 = _717 != 2;
    float _1760 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1748);
    float _1762 = -_1750;
    float _1764 = fma(_1754, 2.0, _1762);
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1770 = _719 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1772 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1760);
    float _1774 = -_162;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1764);
    float _1778 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1766);
    float _1780 = fma(_1770, -2.0, _1768);
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1784 = fma(_1772, _1756, _1776);
    float _1786 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1778);
    float _1788 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1780);
    float _1790 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1792 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1782);
    float _1794 = -_1788;
    float _1796 = fma(_1786, _1670, _1794);
    float _1798 = fma(_1790, _1476, -0.5);
    float _1800 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1792);
    float _1802 = -_162;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1742);
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1808 = _1790;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1812 = _1786;
    if (_1758)
    {
        _1808 = _713;
    }
    float _1814 = _1808;
    float _1816 = fma(_1800, _1798, _1804);
    float _1818 = _1814;
    if (!_1758)
    {
        _1818 = _1208;
    }
    float _1820 = _1818;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1684)
    {
        _723 = _224;
    }
    float _1824 = _723;
    float _1826 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1806);
    bool _1828 = _354 != 0.0;
    bool _1830 = isnan(_354);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(0.0);
    bool _1836 = _1832 || _1834;
    float _1838 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1840 = _1824;
    if (!_1684)
    {
        _1810 = _1824;
    }
    float _1842 = _1810;
    float _1844 = _1842;
    if (_1684)
    {
        _1840 = _224;
    }
    float _1846 = _1840;
    float _1848 = -_1822;
    float _1850 = fma(_1838, 2.0, _1848);
    float _1852 = _1784 + 0.5;
    float _1854 = _1852;
    if (!_1684)
    {
        _1812 = _1842;
    }
    float _1856 = _1812;
    float _1858 = _1796 + 0.5;
    float _1860 = _1856;
    if (_1684)
    {
        _1844 = _713;
    }
    float _1862 = _1844;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1866 = -_162;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1850);
    out.m_91.x = _1852;
    out.m_91.y = _1858;
    float _1870 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1864);
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_1684)
    {
        _1860 = _713;
    }
    float _1874 = _1860;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1878 = _352 == 0.0;
    bool _1880 = !_1836;
    bool _1882 = _1878 && _1880;
    float _1884 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1870);
    float _1886 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1876);
    float _1888 = _1884;
    if (!_1684)
    {
        _1872 = _1208;
    }
    float _1890 = _1872;
    float _1892 = _1890;
    if (_1758)
    {
        _1854 = _1846;
    }
    float _1894 = _1854;
    float _1896 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1886);
    float _1898 = _1894;
    if (!_1758)
    {
        _1898 = _713;
    }
    float _1900 = _1898;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1904 = _356 == 0.0;
    bool _1906 = _1904 && _1882;
    float _1908 = fma(_1896, _1752, _1868);
    float _1910 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1912 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1684)
    {
        _1250 = _1846;
    }
    float _1914 = _1250;
    float _1916 = abs(_350);
    float _1918 = log2(_1916);
    if (_1684)
    {
        _1892 = _1846;
    }
    float _1920 = _1892;
    float _1922 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1902);
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_1906)
    {
        float _1928 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[17].y, _276);
        _382 = _1928;
    }
    float _1930 = _382;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1906)
    {
        _1926 = _278;
    }
    float _1936 = _1926;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1940 = _1936;
    if (!_1906)
    {
        float _1942 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[17].y, _278);
        _1940 = _1942;
    }
    float _1944 = _1940;
    float _1946 = fma(_1924, -2.0, _1934);
    float _1948 = _935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1950 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1952 = -_1938;
    float _1954 = fma(_1910, 2.0, _1952);
    float _1956 = fma(_1912, -2.0, _1932);
    float _1958 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1948);
    if (!_1906)
    {
        float _1960 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[17].y, _274);
        _384 = _1960;
    }
    float _1962 = _384;
    float _1964 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1922);
    float _1966 = -_162;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1954);
    float _1970 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1946);
    float _1972 = exp2(_1950);
    float _1974 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1826);
    float _1976 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1956);
    float _1978 = _1816 + 0.5;
    float _1980 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1958);
    float _1982 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1984 = fma(_1884, _1736, _1968);
    float _1986 = -_1970;
    float _1988 = fma(_1964, _1626, _1986);
    float _1990 = -_1976;
    float _1992 = fma(_1974, _1648, _1990);
    float _1994 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1996 = _1652 + 0.5;
    float _1998 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2000 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1980);
    float _2002 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1982);
    float _2004 = _1908 + 0.5;
    float _2006 = _1984 + 0.5;
    float _2008 = _1988 + 0.5;
    float _2010 = _1992 + 0.5;
    float _2012 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1998);
    float _2014 = _2000 + _979;
    out.m_93.x = _1978;
    out.m_93.y = _1996;
    out.m_93.z = _2006;
    out.m_93.w = _2008;
    float _2016 = _979 * 0.5;
    if (!_977)
    {
        _1888 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2018 = _1888;
    float _2020 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1994);
    float _2022 = fma(_1972, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    out.m_95.x = _2004;
    out.m_95.y = _2010;
    bool _2026 = _350 <= 8000.0;
    bool _2028 = isnan(_350);
    bool _2030 = _2026 || _2028;
    bool _2032 = isnan(8000.0);
    bool _2034 = _2030 || _2032;
    float _2036 = float(_2034);
    int _2038 = as_type<int>(_1972);
    if (!_977)
    {
        float _2040 = _2018 * 5.0;
        _2038 = as_type<int>(_2040);
    }
    int _2042 = _2038;
    float _2044 = _993 + _979;
    out.gl_Position.x = _993;
    out.gl_Position.y = _995;
    out.gl_Position.z = _2000;
    out.gl_Position.w = _979;
    float _2046 = _2014 * 0.5;
    float _2048 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2002);
    float _2050 = fma(_995, -0.5, _2016);
    float _2052 = _2044 * 0.5;
    float _2054 = fma(_2024, -2.0, 3.0);
    float _2056 = _2024 * _2024;
    float _2058 = -_1520;
    float _2060 = _2058 + 1.0;
    out.m_97.x = _2052;
    out.m_97.y = _2050;
    out.m_97.z = _2046;
    out.m_97.w = _979;
    float _2062 = _2056 * _2054;
    float _2064 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2020);
    float _2066 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2068 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2012);
    float _2070 = -_2062;
    float _2072 = _2070 + 1.0;
    out.m_99.z = _2046;
    out.m_99.w = _979;
    float _2074 = _2066 * _1091;
    float _2076 = -_2066;
    float _2078 = _2076 + 1.0;
    float _2080 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    out.m_101.x = _2048;
    out.m_101.y = _2064;
    out.m_101.z = _2068;
    float _2082 = _2036 * _2080;
    float _2084 = _1102 * _2074;
    float _2086 = _1102 * _2078;
    float _2088 = _2080;
    float _2090 = 0.0;
    float _2092 = _2078;
    float _2094 = _2060;
    if (!_983)
    {
        _2088 = 1.0;
    }
    float _2096 = _2088;
    float _2098 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2100 = _2096;
    if (_983)
    {
        bool _2102 = _1089 >= _1049;
        bool _2104 = isnan(_1089);
        bool _2106 = _2102 || _2104;
        bool _2108 = isnan(_1049);
        bool _2110 = _2106 || _2108;
        float _2112 = float(_2110);
        _2100 = _2112;
    }
    float _2114 = _2100;
    if (!_977)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5919 = as_type<float>(_2042);
        out.gl_Position.z = _5919;
    }
    bool _2116 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2118 = isnan(_1216);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2124 = _2120 || _2122;
    float _2126 = _1502 * _2098;
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = _2114 * _1190;
    float _2132 = -_2128;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2136 = -_2130;
    float _2138 = fma(_2136, _2134, 1.0);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2144 = _2142;
    if (!_977)
    {
        _2144 = 0.0;
    }
    float _2146 = _2144;
    float _2148 = _1450 * _2074;
    float _2150 = fma(_1446, _2084, _1096);
    float _2152 = fma(_1448, _2084, _1098);
    float _2154 = _2140 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2156 = fma(_1102, _2148, _1100);
    float _2158 = _2154;
    if (!_2124)
    {
        _2090 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2160 = _2090;
    float _2162 = _2160;
    float _2164 = _2160;
    if (!_2124)
    {
        _1003 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2166 = _1003;
    out.m_103.x = _2154;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2124)
    {
        _2092 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2092;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2124)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2178 = _2094;
    out.m_105.x = _2150;
    out.m_105.y = _2152;
    out.m_105.z = _2156;
    out.m_105.w = _2086;
    float _2180 = _2178;
    float _2182 = _2178;
    if (!_2124)
    {
        _1005 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2184 = _1005;
    float _2186 = _2184;
    float _2188 = _2184;
    if (!_2124)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2190 = _2158;
    bool _2192 = !_2124;
    float _2194 = _2190;
    float _2196 = _2190;
    if (!_2192)
    {
        bool _2198 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2200 = isnan(_1216);
        bool _2202 = _2198 || _2200;
        bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2206 = _2202 || _2204;
        if (!_2206)
        {
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2210 = _1216 + _2208;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2214 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2212;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2224 = 1.0 / _2214;
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2238 = _2210 * _2224;
            float _2240 = precise::clamp(_2238, 0.0, 1.0);
            float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2246 = fma(_2240, _2218, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2248 = fma(_2240, _2222, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2250 = fma(_2240, _2244, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2252 = fma(_2240, _2228, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2254 = fma(_2240, _2232, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2256 = fma(_2240, _2236, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2196 = _2246;
            _2170 = _2254;
            _2182 = _2248;
            _2164 = _2252;
            _2188 = _2250;
            _2176 = _2256;
            _2258 = true;
        }
        else
        {
            bool _2260 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2262 = isnan(_1216);
            bool _2264 = _2260 || _2262;
            bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2268 = _2264 || _2266;
            if (!_2268)
            {
                _2162 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2270 = _2162;
            _2164 = _2270;
            if (!_2268)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2272 = _2168;
            _2170 = _2272;
            if (!_2268)
            {
                _2174 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2274 = _2174;
            _2176 = _2274;
            if (!_2268)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2276 = _2180;
            _2182 = _2276;
            if (!_2268)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2278 = _2194;
            _2196 = _2278;
            if (!_2268)
            {
                _2186 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2280 = _2186;
            bool _2282 = !_2268;
            _2188 = _2280;
            if (!_2282)
            {
                bool _2284 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2286 = isnan(_1216);
                bool _2288 = _2284 || _2286;
                bool _2290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2292 = _2288 || _2290;
                if (!_2292)
                {
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2296 = _1216 + _2294;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2300 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2310 = 1.0 / _2300;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2324 = _2296 * _2310;
                    float _2326 = precise::clamp(_2324, 0.0, 1.0);
                    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2332 = fma(_2326, _2304, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2334 = fma(_2326, _2308, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2336 = fma(_2326, _2330, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2338 = fma(_2326, _2314, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2340 = fma(_2326, _2318, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2342 = fma(_2326, _2322, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2196 = _2332;
                    _2170 = _2340;
                    _2182 = _2334;
                    _2164 = _2338;
                    _2188 = _2336;
                    _2176 = _2342;
                    _2258 = true;
                }
                else
                {
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2164 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2188 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2176 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2258 = false;
    float _2344 = _2196;
    float _2346 = _2170;
    float _2348 = _2182;
    float _2350 = _2164;
    float _2352 = _2188;
    float _2354 = _2176;
    float _2356 = fma(_2064, -0.5, 0.5);
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    float _2360 = -_2344;
    float _2362 = _2346 + _2360;
    float _2364 = -_2348;
    float _2366 = _2350 + _2364;
    float _2368 = -_2352;
    float _2370 = _2354 + _2368;
    bool _2372 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2374 = fma(_2358, _2362, _2344);
    float _2376 = fma(_2358, _2366, _2348);
    float _2378 = fma(_2358, _2370, _2352);
    float _2380 = _2146 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2382 = _2374 * 0.586610972881317138671875;
    out.m_107.x = 0.0;
    float _2384 = fma(_2376, 0.298911988735198974609375, _2382);
    out.m_59.x = _2380;
    float _2386 = fma(_2378, 0.114477999508380889892578125, _2384);
    float _2388 = -_2386;
    float _2390 = _2376 + _2388;
    float _2392 = -_2386;
    float _2394 = _2374 + _2392;
    float _2396 = -_2386;
    float _2398 = _2378 + _2396;
    float _2400 = fma(_2390, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    float _2402 = fma(_2394, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    float _2404 = fma(_2398, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    out.m_109.x = _2400;
    out.m_109.y = _2402;
    out.m_109.z = _2404;
    if (!_2372)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2406 = -_771;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2410 = -_773;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2414 = -_775;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2418 = _2408 * _2408;
    float _2420 = fma(_2412, _2412, _2418);
    float _2422 = fma(_2416, _2416, _2420);
    float _2424 = sqrt(_2422);
    float _2426 = rsqrt(_2422);
    float _2428 = -_2424;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2432 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = _2412 * _2426;
    float _2438 = _2408 * _2426;
    float _2440 = abs(_2434);
    float _2442 = log2(_2440);
    float _2444 = _2416 * _2426;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2448 = _2064 * _2438;
    float _2450 = -_2438;
    float _2452 = -_2446;
    float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2452);
    float _2456 = fma(_2048, _2436, _2448);
    float _2458 = -_2444;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2454);
    float _2462 = fma(_2068, _2444, _2456);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2468 = _2460 + _2466;
    float _2470 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = exp2(_2470);
    float _2478 = _2476 * _2474;
    float _2480 = _2464 * _2478;
    float _2482 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _2482;
    out.m_107.y = _2484;
    out.m_107.z = _2486;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2258 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_56.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_128);
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _134;
    if (!_132)
    {
        out.m_59.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2544 = as_type<float>(_144);
        out.gl_Position.z = _2544;
    }
    if (!_132)
    {
        return out;
    }
    float _148 = in.m_61.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_158)
    {
        float _164 = float(_128);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _162 >= _166;
    bool _170 = !_158;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_180);
        out.gl_Position.z = _2613;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_56.x;
    float _184 = in.m_56.y;
    float _186 = in.m_56.z;
    float _188 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    float _200 = _196 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _202 = _198 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _204 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _206 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _208 = floor(_204);
    float _210 = floor(_206);
    float _212 = -_208;
    float _214 = _204 + _212;
    float _216 = -_210;
    float _218 = _206 + _216;
    float2 _2693 = float2(_214, _218);
    float _220 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2693, float2(0.0), isnan(_2693)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2693, float2(0.0), isnan(_2693)), level(0.0)).x;
    float _222 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _224 = in.m_63.y;
    float _226 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _222);
    float _228 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _230 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _226);
    float _232 = _230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _234 = _232 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _236 = _232 + _228;
    float _238 = fma(_200, (*spvDescriptorSet0.vp_c8)._m0[11].x, _234);
    float _240 = _236 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _242 = in.m_65.x;
    float _244 = in.m_65.y;
    float _246 = in.m_65.z;
    float _248 = _236 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _250 = fma(_202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _238);
    float _252 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[126].x, _240);
    float _254 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[127].x, _248);
    float _256 = _250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _258 = _232 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _260 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[126].z, _252);
    float _262 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[127].z, _254);
    float _264 = 1.0 / _256;
    float _266 = fma(_200, (*spvDescriptorSet0.vp_c8)._m0[10].x, _258);
    float _268 = _260 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _270 = _262 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _272 = fma(_202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _266);
    float _274 = in.m_67.x;
    float _276 = in.m_67.y;
    float _278 = in.m_67.z;
    float _280 = trunc(_268);
    int _282 = int(_280);
    float _284 = _272 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _286 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    float _288 = _284 + _256;
    float _290 = fma(_244, 16.0, _286);
    float _292 = trunc(_270);
    int _294 = int(_292);
    float _296 = _288 * _264;
    float _298 = _296 * 0.5;
    float _300 = _290 * 0.15915493667125701904296875;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _304 = fma(_298, (*spvDescriptorSet0.vp_c8)._m0[30].w, _302);
    float _306 = in.m_69.x;
    float _308 = in.m_69.y;
    float _310 = in.m_69.z;
    float _312 = _300 * 6.283185482025146484375;
    float _314 = sin(_312);
    int _316 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _318 = _282 + _316;
    int _320 = _318 + 1;
    bool _322 = _320 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _324 = 1.0 / _304;
    int _326 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _328 = _294 + _326;
    int _330 = _328 + 1;
    int _332 = _320 | _330;
    float _334 = fma(_314, 0.5, 0.5);
    bool _336 = _332 < 0;
    bool _338 = _336 || _322;
    float _340 = _334 * 0.004999999888241291046142578125;
    bool _342 = _330 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _344 = _342 || _338;
    float _346 = _310 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _350 = _324 * _348;
    float _352 = fma(_274, _340, _242);
    float _354 = fma(_276, _340, _244);
    float _356 = fma(_278, _340, _246);
    float _358 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _360 = _350 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _362 = _306 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _364 = _350 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _366 = _308 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _368 = !_360;
    int _370 = _368 ? 0 : 1;
    int _372 = 0;
    int _374 = as_type<int>(_324);
    int _376 = 2;
    int _378 = as_type<int>(_358);
    float _380 = _236;
    float _382 = _276;
    float _384 = _274;
    if (!_344)
    {
        int _386 = _330 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _388 = _386 + _320;
        _372 = _388;
    }
    int _390 = _372;
    float _392 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _394 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _356);
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _352);
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _354);
    if (!_344)
    {
        int _402 = _390 << 2;
        _374 = _402;
    }
    int _404 = _374;
    float _406 = _396 * _358;
    int _408 = _404;
    if (!_360)
    {
        _376 = 1;
    }
    int _410 = _376;
    float _412 = _398 * _392;
    int _414 = _410;
    if (!_364)
    {
        _414 = _370;
    }
    int _416 = _414;
    float _418 = _400 * _394;
    float _420 = as_type<float>(_416);
    if (!_344)
    {
        uint _423 = uint(int(uint(_390) >> uint(2)));
        _378 = int(_423);
    }
    int _425 = _378;
    int _427 = _416 << 6;
    float _429 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _431 = as_type<float>(_427);
    if (!_344)
    {
        int _433 = 12 & _404;
        _408 = _433;
    }
    int _435 = _408;
    float _437 = _418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _439 = _427 + 96;
    uint _441 = uint(int(uint(_439) >> uint(2)));
    uint _443 = uint(int(uint(int(_441)) >> uint(2)));
    int _445 = int(_441) & 3;
    float _447 = (*spvDescriptorSet0.vp_c15)._m0[int(_443)][_445];
    int _449 = int(_441) + 1;
    uint _451 = uint(int(uint(_449) >> uint(2)));
    int _453 = _449 & 3;
    float _455 = (*spvDescriptorSet0.vp_c15)._m0[int(_451)][_453];
    float _457 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _429);
    float _459 = 0.0;
    if (!_344)
    {
        int _461 = _425 << 4;
        int _463 = _461 + _435;
        _459 = as_type<float>(_463);
    }
    float _465 = _459;
    float _467 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _437);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _471 = _469 != 0;
    float _473 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[10].z, _457);
    float _475 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _477 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[8].z, _467);
    float _479 = _465;
    if (!_344)
    {
        int _481 = as_type<int>(_465) + 400;
        uint _483 = uint(int(uint(_481) >> uint(2)));
        uint _485 = uint(int(uint(int(_483)) >> uint(2)));
        int _487 = int(_483) & 3;
        float _489 = (*spvDescriptorSet0.vp_c15)._m0[int(_485)][_487];
        _479 = _489;
    }
    float _491 = _479;
    float _493 = _202 + _473;
    float _495 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _475);
    float _497 = _200 + _477;
    float _499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _501 = _493 + _499;
    float _503 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].z, _495);
    float _505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _507 = _497 + _505;
    int _509 = _427 + 48;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    uint _513 = uint(int(uint(int(_511)) >> uint(2)));
    int _515 = int(_511) & 3;
    float _517 = (*spvDescriptorSet0.vp_c15)._m0[int(_513)][_515];
    int _519 = int(_511) + 1;
    uint _521 = uint(int(uint(_519) >> uint(2)));
    int _523 = _519 & 3;
    float _525 = (*spvDescriptorSet0.vp_c15)._m0[int(_521)][_523];
    float _527 = _501 * _501;
    float _529 = 0.0;
    float _531 = _527;
    float _533 = _503;
    if (_471)
    {
        float _535 = in.m_63.x;
        _529 = _535;
    }
    float _537 = _529;
    int _539 = 0;
    if (_471)
    {
        _539 = 0;
    }
    int _541 = _539;
    float _543 = fma(_507, _507, _527);
    int _545 = 0;
    int _547 = _541;
    if (_471)
    {
        _545 = 0;
    }
    int _549 = _545;
    int _551 = _427 + 56;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = int(_553) + 1;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    int _565 = _561 & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    float _569 = sqrt(_543);
    int _571 = _427 + 64;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    uint _575 = uint(int(uint(int(_573)) >> uint(2)));
    int _577 = int(_573) & 3;
    float _579 = (*spvDescriptorSet0.vp_c15)._m0[int(_575)][_577];
    int _581 = int(_573) + 1;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    int _585 = _581 & 3;
    float _587 = (*spvDescriptorSet0.vp_c15)._m0[int(_583)][_585];
    int _589 = _427 + 72;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    uint _593 = uint(int(uint(int(_591)) >> uint(2)));
    int _595 = int(_591) & 3;
    float _597 = (*spvDescriptorSet0.vp_c15)._m0[int(_593)][_595];
    int _599 = int(_591) + 1;
    uint _601 = uint(int(uint(_599) >> uint(2)));
    int _603 = _599 & 3;
    float _605 = (*spvDescriptorSet0.vp_c15)._m0[int(_601)][_603];
    bool _607 = _569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _609 = _537;
    int _611 = _549;
    if (_471)
    {
        _531 = _537;
    }
    float _613 = _531;
    float _615 = _236 * _455;
    int _617 = _427 + 80;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.vp_c15)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    float _635 = _232 + _503;
    float _637 = fma(_200, _447, _615);
    int _639 = _427 + 88;
    uint _641 = uint(int(uint(_639) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c15)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c15)._m0[int(_651)][_653];
    int _657 = _427 + 104;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.vp_c15)._m0[int(_669)][_671];
    float _675 = _447;
    float _677 = _613;
    float _679 = _635;
    if (_471)
    {
        _431 = _224;
    }
    float _681 = _431;
    float _683 = _681;
    float _685 = _525;
    float _687 = _633;
    float _689 = _625;
    if (!_471)
    {
        float _691 = in.m_63.x;
        float _693 = _224 * 3.1415927410125732421875;
        float _695 = _693 * 0.15915493667125701904296875;
        float _697 = _695 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = _691 * 3.1415927410125732421875;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = sin(_705);
        _675 = _703;
        _547 = 1;
        _609 = _691;
        _677 = _707;
        _611 = 2;
        _683 = _699;
    }
    float _709 = _675;
    int _711 = _547;
    float _713 = _609;
    float _715 = _677;
    int _717 = _611;
    float _719 = _683;
    float _721 = _709;
    float _723 = _719;
    if (!_607)
    {
        _721 = _497;
    }
    float _725 = _721;
    float _727 = _725;
    if (!_607)
    {
        _533 = _493;
    }
    float _729 = _533;
    bool _731 = !_607;
    float _733 = _729;
    if (!_731)
    {
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _737 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _739 = _569 + _737;
        float _741 = rsqrt(_543);
        float _743 = _739 * _735;
        float _745 = _635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _747 = _743 * 0.15915493667125701904296875;
        float _749 = _747 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = _747 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _751 + (-1.0);
        float _759 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _761 = _757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = _741 * _759;
        float _765 = fma(_635, _751, _761);
        float _767 = fma(_507, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _769 = fma(_501, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _679 = _765;
        _727 = _767;
        _733 = _769;
    }
    float _771 = _679;
    float _773 = _727;
    float _775 = _733;
    float _777 = fma(_202, _665, _637);
    float _779 = _236 * _525;
    float _781 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _783 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _785 = isnan(0.5);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _791 = _787 || _789;
    float _793 = _236 * _587;
    float _795 = fma(_200, _517, _779);
    float _797 = _777 + _673;
    float _799 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _781);
    if (!_344)
    {
        float _801 = floor(_268);
        _685 = _801;
    }
    float _803 = _685;
    float _805 = fma(_200, _579, _793);
    float _807 = fma(_202, _559, _795);
    float _809 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _799);
    float _811 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _813 = fma(_202, _597, _805);
    float _815 = _807 + _567;
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _819 = 1.0 / _797;
    float _821 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _823 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _825 = _817 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _827 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _829 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _821);
    float _831 = _813 + _605;
    float _833 = -_825;
    float _835 = fma(_833, _811, 1.0);
    float _837 = _501;
    float _839 = _829;
    if (!_344)
    {
        float _841 = floor(_270);
        _837 = _841;
    }
    float _843 = _837;
    float _845 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _829);
    float _847 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _823);
    float _849 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _827);
    if (_791)
    {
        _839 = 1.0;
    }
    float _851 = _839;
    float _853 = _815 * _819;
    float _855 = _851;
    float _857 = _853;
    if (!_791)
    {
        float _859 = as_type<float>(in.m_73.w);
        int _861 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _863 = _861 == 4;
        bool _865 = _861 == 8;
        bool _867 = _861 == 12;
        int _869 = as_type<int>(_859) << 16;
        int _871 = as_type<int>(_859) << 8;
        int _873 = as_type<int>(_859) << 24;
        int _875 = _869 >> 24;
        int _877 = _871 >> 24;
        int _879 = as_type<int>(_859) >> 24;
        int _881 = _873 >> 24;
        float _883 = float(_875);
        float _885 = float(_877);
        float _887 = float(_879);
        float _889 = _883 * 0.0078740157186985015869140625;
        float _891 = float(_881);
        float _893 = _885 * 0.0078740157186985015869140625;
        float _895 = _887 * 0.0078740157186985015869140625;
        float _897 = precise::min(_889, 1.0);
        float _899 = _891 * 0.0078740157186985015869140625;
        float _901 = precise::min(_893, 1.0);
        float _903 = precise::min(_895, 1.0);
        float _905 = precise::min(_899, 1.0);
        float _907 = precise::max(_897, -1.0);
        float _909 = precise::max(_901, -1.0);
        float _911 = precise::max(_903, -1.0);
        float _913 = precise::max(_905, -1.0);
        float _915 = _913;
        if (_863)
        {
            _915 = _907;
        }
        float _917 = _915;
        float _919 = _917;
        if (_865)
        {
            _919 = _909;
        }
        float _921 = _919;
        float _923 = _921;
        if (_867)
        {
            _923 = _911;
        }
        float _925 = _923;
        float _927 = abs(_925);
        float _929 = (-0.0) + _927;
        _855 = _929;
    }
    float _931 = _855;
    float _933 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _847);
    float _935 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _937 = _853 >= 0.0;
    float _939 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _849);
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _943 = _935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _945 = _831 * _819;
    bool _947 = _853 <= 1.0;
    bool _949 = _947 && _937;
    float _951 = _935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _953 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _943);
    float _955 = _935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _957 = _939 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _959 = _945 >= 0.0;
    bool _961 = _959 && _949;
    float _963 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[7].z, _953);
    float _965 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _955);
    float _967 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _951);
    bool _969 = _931 != 0.0;
    bool _971 = isnan(_931);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    float _979 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[7].w, _963);
    bool _981 = _945 <= 1.0;
    bool _983 = _981 && _961;
    float _985 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[4].z, _965);
    float _987 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[5].z, _967);
    float _989 = 1.0 / _979;
    float _991 = _236 * _633;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[4].w, _985);
    float _995 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[5].w, _987);
    float _997 = fma(_200, _625, _991);
    float _999 = log2(_835);
    float _1001 = _997;
    float _1003 = _979;
    float _1005 = _931;
    if (_977)
    {
        _687 = _993;
    }
    float _1007 = _687;
    float _1009 = fma(_202, _647, _997);
    float _1011 = _1007;
    if (_977)
    {
        _689 = _995;
    }
    float _1013 = _689;
    float _1015 = _1013;
    if (!_977)
    {
        _1015 = 0.0;
        _1011 = 0.0;
    }
    float _1017 = _1015;
    float _1019 = _1011;
    if (_983)
    {
        float _1021 = float(_416);
        _420 = _1021;
    }
    float _1023 = _420;
    if (!_344)
    {
        float _1025 = -_843;
        float _1027 = _270 + _1025;
        _1001 = _1027;
    }
    float _1029 = _1001;
    float _1031 = _1009 + _655;
    float _1033 = _835;
    if (_983)
    {
        float _1035 = rint(_1023);
        float _1037 = precise::max(_1035, 0.0);
        uint _1039 = uint(_1037);
        uint _1041 = clamp(_1039, 0u, 65535u);
        _1033 = as_type<float>(_1041);
    }
    float _1043 = _1033;
    float _1045 = _989 * _1017;
    float _1047 = _989 * _1019;
    float _1049 = _1031 * _819;
    float _1051 = fma(_1045, -0.5, 0.5);
    float _1053 = fma(_1047, 0.5, 0.5);
    float _1055 = _999 * 0.693147182464599609375;
    float _1057 = _1017;
    float _1059 = _1047;
    float _1061 = _989;
    if (!_344)
    {
        float _1063 = rint(_491);
        float _1065 = precise::max(_1063, 0.0);
        uint _1067 = uint(_1065);
        uint _1069 = clamp(_1067, 0u, 65535u);
        _1057 = as_type<float>(_1069);
    }
    float _1071 = _1057;
    if (!_344)
    {
        float _1073 = -_803;
        float _1075 = _268 + _1073;
        _1059 = _1075;
    }
    float _1077 = _1059;
    float _1079 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1081 = _843;
    float _1083 = _1043;
    float _1085 = _1079;
    if (_983)
    {
        float3 _4073 = float3(_853, _945, float(as_type<int>(_1043)));
        float3 _4077 = select(_4073, float3(0.0), isnan(_4073));
        float _1087 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4077.xy, uint(rint(_4077.z)), _1049, level(0.0));
        _1081 = _1087;
    }
    float _1089 = _1081;
    float3 _4087 = float3(_1053, _1051, _1079);
    float _1091 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4087, float3(0.0), isnan(_4087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4087, float3(0.0), isnan(_4087)), level(0.0)).x;
    float3 _4096 = float3(_1053, _1051, _1079);
    float4 _1094 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4096, float3(0.0), isnan(_4096)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4096, float3(0.0), isnan(_4096)), level(0.0)).xyzw;
    float _1096 = _1094.x;
    float _1098 = _1094.y;
    float _1100 = _1094.z;
    float _1102 = _1094.w;
    float _1104 = _1023;
    if (!_344)
    {
        float3 _4119 = float3(_1077, _1029, float(as_type<int>(_1071)));
        float3 _4121 = select(_4119, float3(0.0), isnan(_4119));
        float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4121.xy, uint(rint(_4121.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4121.xy, uint(rint(_4121.z)), level(0.0)).x;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = in.m_75.x;
    if (_344)
    {
        _1061 = 1.0;
    }
    float _1112 = _1061;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1116 = _1114 != 0;
    float _1118 = 0.0;
    float _1120 = _1112;
    float _1122 = _1110;
    if (!_1116)
    {
        _1118 = _1110;
    }
    float _1124 = _1118;
    float _1126 = _1124;
    if (!_344)
    {
        int _1128 = _390 << 4;
        int _1130 = _1128 + 2048;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
        int _1140 = int(_1132) + 1;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        int _1144 = _1140 & 3;
        float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
        int _1148 = _1130 + 8;
        uint _1150 = uint(int(uint(_1148) >> uint(2)));
        uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
        int _1154 = int(_1150) & 3;
        float _1156 = (*spvDescriptorSet0.vp_c15)._m0[int(_1152)][_1154];
        int _1158 = int(_1150) + 1;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        int _1162 = _1158 & 3;
        float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
        float _1166 = _236 * _1146;
        float _1168 = fma(_200, _1138, _1166);
        float _1170 = fma(_202, _1156, _1168);
        float _1172 = _1170 + _1164;
        float _1174 = precise::clamp(_1172, 0.0, 1.0);
        float _1176 = -_1174;
        float _1178 = _1176 + _1108;
        float _1180 = fma(_1178, 500.0, 1.5);
        float _1182 = exp2(_1180);
        float _1184 = 0.0 + _1182;
        float _1186 = precise::clamp(_1184, 0.0, 1.0);
        _380 = _1166;
        _1120 = _1186;
    }
    float _1188 = _380;
    float _1190 = _1120;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1194 = _771 + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _773 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _775 + _1200;
    float _1204 = in.m_75.y;
    float _1206 = _1194 * _1194;
    float _1208 = in.m_63.z;
    float _1210 = fma(_1198, _1198, _1206);
    float _1212 = fma(_1202, _1202, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = sqrt(_1212);
    float _1218 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1220 = _1198 * _1218;
    float _1222 = _1202 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 * _1222;
    float _1228 = _1224 + _1226;
    float _1230 = sqrt(_1228);
    bool _1232 = _1230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = _1230 + _1234;
    float _1238 = _1214;
    float _1240 = _1236;
    float _1242 = _1194;
    float _1244 = _1188;
    bool _1246 = _1232;
    int _1248 = as_type<int>(_1204);
    float _1250 = _1208;
    if (_1232)
    {
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1232)
    {
        float _1256 = rsqrt(_1228);
        _1083 = _1256;
    }
    float _1258 = _1083;
    float _1260 = _1258;
    if (_1232)
    {
        float _1262 = _1236 * _1254;
        _1240 = _1262;
    }
    float _1264 = _1240;
    if (_1232)
    {
        float _1266 = _1264 * 0.15915493667125701904296875;
        _857 = _1266;
    }
    float _1268 = _857;
    float _1270 = _1202;
    if (_1232)
    {
        float _1272 = _1268 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1280 = precise::max(0.0, _1278);
    float _1282 = _1254;
    float _1284 = _1280;
    if (_1232)
    {
        float _1286 = _1268 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        _1282 = _1288;
    }
    float _1290 = _1282;
    float _1292 = -_1218;
    float _1294 = -_1280;
    float _1296 = fma(_1194, _1292, _1294);
    if (_1232)
    {
        float _1298 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1298;
    }
    float _1300 = _1242;
    float _1302 = _1300;
    float _1304 = _1276;
    if (_1232)
    {
        float _1306 = fma(_1276, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = _1308;
    if (!_1232)
    {
        _1304 = _1220;
    }
    float _1312 = _1304;
    float _1314 = _1312;
    float _1316 = _1290;
    if (_1232)
    {
        float _1318 = _1290 + (-1.0);
        _1284 = _1318;
    }
    float _1320 = _1284;
    float _1322 = _1320;
    if (_1232)
    {
        float _1324 = _1258 * _1308;
        _1085 = _1324;
    }
    float _1326 = _1085;
    if (!_1232)
    {
        _1310 = _1296;
    }
    float _1328 = _1310;
    float _1330 = _1328;
    if (_1232)
    {
        float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1332;
    }
    float _1334 = _1244;
    if (_1232)
    {
        float _1336 = _1220 * _1326;
        _1314 = _1336;
    }
    float _1338 = _1314;
    if (!_1232)
    {
        _1322 = _1222;
    }
    float _1340 = _1322;
    float _1342 = _1340;
    if (_1232)
    {
        float _1344 = _1222 * _1326;
        _1342 = _1344;
    }
    float _1346 = _1342;
    if (!_1232)
    {
        _1260 = _1224;
    }
    float _1348 = _1260;
    float _1350 = _1348;
    if (_1232)
    {
        float _1352 = fma(_1296, _1290, _1334);
        _1330 = _1352;
    }
    float _1354 = _1330;
    if (_1232)
    {
        float _1356 = _1338 * _1338;
        _1350 = _1356;
    }
    float _1358 = _1350;
    if (!_1232)
    {
        _1316 = _1226;
    }
    float _1360 = _1316;
    float _1362 = _1360;
    if (_1232)
    {
        float _1364 = _1346 * _1346;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = _1334;
    if (_1116)
    {
        float _1370 = in.m_63.x;
        _1368 = _1370;
    }
    float _1372 = _1368;
    float _1374 = fma(_1354, _1354, _1358);
    float _1376 = in.m_63.w;
    float _1378 = _1374 + _1366;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1382 = fma(_1216, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1380);
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = -_1384;
    float _1388 = _1386 + 1.0;
    float _1390 = rsqrt(_1378);
    float _1392 = abs(_1388);
    float _1394 = log2(_1392);
    float _1396 = _1390 * _1338;
    float _1398 = _1390 * _1354;
    float _1400 = _1390 * _1346;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1404 = -_1402;
    float _1406 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = -_1400;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1412 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = fma(_1410, -0.5, 0.5);
    float _1416 = fma(_1410, 0.5, 0.5);
    float _1418 = exp2(_1412);
    float _1420 = fma(_1416, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1422 = fma(_1416, _1420, -0.212114393711090087890625);
    float _1424 = _1398 + 1.0;
    float _1426 = sqrt(_1414);
    float _1428 = fma(_1416, _1422, 1.570728778839111328125);
    float _1430 = -_1398;
    float _1432 = fma(_1418, _1424, _1430);
    float _1434 = fma(_1432, 0.5, 0.5);
    float _1436 = _1426 * 0.636619746685028076171875;
    float _1438 = -_1428;
    float _1440 = fma(_1436, _1438, 1.0);
    float2 _4628 = float2(_1440, _1434);
    float3 _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4628, float2(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4628, float2(0.0), isnan(_4628)), level(0.0)).xyz;
    float _1446 = _1444.x;
    float _1448 = _1444.y;
    float _1450 = _1444.z;
    int _1452 = as_type<int>(_1418);
    if (_1116)
    {
        float _1454 = -_1110;
        float _1456 = _1454 + 1.0;
        _1452 = as_type<int>(_1456);
    }
    int _1458 = _1452;
    if (_1116)
    {
        bool _1460 = _1372 > 0.5;
        _1246 = _1460;
    }
    bool _1462 = _1246;
    float _1464 = -_1204;
    float _1466 = _1464 + 1.0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1470 = _1468 != 0;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1116)
    {
        float _1474 = _1462 ? as_type<float>(_1458) : _1110;
        _1126 = _1474;
    }
    float _1476 = _1126;
    out.m_77.y = _1204;
    bool _1478 = _224 > 0.5;
    float _1480 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1482 = _1376 > 0.5;
    float _1484 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1486 = _1478 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1488 = in.m_79.x;
    float _1490 = in.m_79.y;
    float _1492 = in.m_79.z;
    float _1494 = in.m_79.w;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1498 = _1470 ? as_type<float>(_1486) : _1204;
    float _1500 = -_220;
    float _1502 = _1500 + 1.0;
    int _1504 = _1482 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1510 = _1508 != 0;
    float _1512 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1514 = _1208 > 0.5;
    float _1516 = fma(_1484, -2.0, _1506);
    float _1518 = _1510 ? as_type<float>(_1504) : _1204;
    float _1520 = exp2(_1480);
    int _1522 = _1514 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1524 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1516);
    out.m_81.x = _773;
    out.m_81.y = _771;
    out.m_81.z = _775;
    float _1526 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1532 = _1530 != 0;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1546 = _1544 != 0;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1550 = _1532 ? as_type<float>(_1522) : _1204;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1556 = _1554 != 0;
    float _1558 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1562 = _1560 != 0;
    float _1564 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1568 = _1566 != 0;
    float _1570 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1574 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_83.x = _1538;
    out.m_83.y = _1558;
    out.m_83.z = _1564;
    out.m_83.w = _1552;
    float _1578 = _274 * _1492;
    float _1580 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1582 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_85.x = _1570;
    out.m_85.y = _1574;
    out.m_85.z = _1576;
    float _1584 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1586 = _276 * _1488;
    float _1588 = -_1578;
    float _1590 = fma(_278, _1488, _1588);
    float _1592 = 0.0;
    int _1594 = as_type<int>(_1524);
    int _1596 = as_type<int>(_1526);
    bool _1598 = _1568;
    if (_1546)
    {
        float _1600 = in.m_63.z;
        _1592 = _1600;
    }
    float _1602 = _1592;
    float _1604 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1580);
    float _1606 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1582);
    float _1608 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1584);
    float _1610 = -_1586;
    float _1612 = fma(_274, _1490, _1610);
    float _1614 = _278 * _1490;
    float _1616 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1620 = fma(_1512, _1498, -0.5);
    float _1622 = _1568 ? as_type<float>(_1522) : _1204;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1626 = fma(_1616, _1518, -0.5);
    float _1628 = -_1614;
    float _1630 = fma(_276, _1492, _1628);
    float _1632 = _1590 * _1494;
    float _1634 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1624);
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1638 = _1630 * _1494;
    float _1640 = _1612 * _1494;
    float _1642 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1634);
    float _1644 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1604);
    float _1646 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1606);
    float _1648 = fma(_1526, _1550, -0.5);
    float _1650 = -_1524;
    float _1652 = fma(_1642, _1620, _1650);
    float _1654 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1656 = _1654;
    float _1658 = _1572;
    if (_1556)
    {
        float _1660 = -_1110;
        float _1662 = _1660 + 1.0;
        _1594 = as_type<int>(_1662);
    }
    int _1664 = _1594;
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1668 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1608);
    float _1670 = fma(_1654, _1622, -0.5);
    if (!_1556)
    {
        _1656 = _1110;
    }
    float _1672 = _1656;
    float _1674 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1676 = _1672;
    if (_1556)
    {
        float _1678 = _1478 ? as_type<float>(_1664) : _1110;
        _1676 = _1678;
    }
    float _1680 = _1676;
    float _1682 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1684 = _711 != 1;
    if (_1546)
    {
        float _1686 = -_1110;
        float _1688 = _1686 + 1.0;
        _1596 = as_type<int>(_1688);
    }
    int _1690 = _1596;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1546)
    {
        bool _1694 = _1602 > 0.5;
        _1598 = _1694;
    }
    bool _1696 = _1598;
    float _1698 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1682);
    if (!_1546)
    {
        _1658 = _1110;
    }
    float _1702 = _1658;
    float _1704 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1674);
    float _1706 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1698);
    out.m_87.x = _1644;
    out.m_87.y = _1646;
    out.m_87.z = _1668;
    float _1708 = _1702;
    if (_1546)
    {
        float _1710 = _1696 ? as_type<float>(_1690) : _1110;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1716 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1700);
    if (_1562)
    {
        float _1718 = -_1110;
        float _1720 = _1718 + 1.0;
        _1248 = as_type<int>(_1720);
    }
    int _1722 = _1248;
    float _1724 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1704);
    float _1726 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1706);
    if (_1562)
    {
        float _1728 = _1478 ? as_type<float>(_1722) : _1110;
        _1122 = _1728;
    }
    float _1730 = _1122;
    out.m_89.x = _1724;
    out.m_89.y = _1716;
    out.m_89.z = _1726;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1734 = _713 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1736 = fma(_1714, _1712, -0.5);
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1740 = -_1732;
    float _1742 = fma(_1734, 2.0, _1740);
    float _1744 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1746 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1752 = fma(_1744, _1680, -0.5);
    float _1754 = _715 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1756 = fma(_1746, _1730, -0.5);
    bool _1758 = _717 != 2;
    float _1760 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1748);
    float _1762 = -_1750;
    float _1764 = fma(_1754, 2.0, _1762);
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1770 = _719 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1772 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1760);
    float _1774 = -_162;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1764);
    float _1778 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1766);
    float _1780 = fma(_1770, -2.0, _1768);
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1784 = fma(_1772, _1756, _1776);
    float _1786 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1778);
    float _1788 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1780);
    float _1790 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1792 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1782);
    float _1794 = -_1788;
    float _1796 = fma(_1786, _1670, _1794);
    float _1798 = fma(_1790, _1476, -0.5);
    float _1800 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1792);
    float _1802 = -_162;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1742);
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1808 = _1790;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1812 = _1786;
    if (_1758)
    {
        _1808 = _713;
    }
    float _1814 = _1808;
    float _1816 = fma(_1800, _1798, _1804);
    float _1818 = _1814;
    if (!_1758)
    {
        _1818 = _1208;
    }
    float _1820 = _1818;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1684)
    {
        _723 = _224;
    }
    float _1824 = _723;
    float _1826 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1806);
    bool _1828 = _354 != 0.0;
    bool _1830 = isnan(_354);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(0.0);
    bool _1836 = _1832 || _1834;
    float _1838 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1840 = _1824;
    if (!_1684)
    {
        _1810 = _1824;
    }
    float _1842 = _1810;
    float _1844 = _1842;
    if (_1684)
    {
        _1840 = _224;
    }
    float _1846 = _1840;
    float _1848 = -_1822;
    float _1850 = fma(_1838, 2.0, _1848);
    float _1852 = _1784 + 0.5;
    float _1854 = _1852;
    if (!_1684)
    {
        _1812 = _1842;
    }
    float _1856 = _1812;
    float _1858 = _1796 + 0.5;
    float _1860 = _1856;
    if (_1684)
    {
        _1844 = _713;
    }
    float _1862 = _1844;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1866 = -_162;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1850);
    out.m_91.x = _1852;
    out.m_91.y = _1858;
    float _1870 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1864);
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_1684)
    {
        _1860 = _713;
    }
    float _1874 = _1860;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1878 = _352 == 0.0;
    bool _1880 = !_1836;
    bool _1882 = _1878 && _1880;
    float _1884 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1870);
    float _1886 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1876);
    float _1888 = _1884;
    if (!_1684)
    {
        _1872 = _1208;
    }
    float _1890 = _1872;
    float _1892 = _1890;
    if (_1758)
    {
        _1854 = _1846;
    }
    float _1894 = _1854;
    float _1896 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1886);
    float _1898 = _1894;
    if (!_1758)
    {
        _1898 = _713;
    }
    float _1900 = _1898;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1904 = _356 == 0.0;
    bool _1906 = _1904 && _1882;
    float _1908 = fma(_1896, _1752, _1868);
    float _1910 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1912 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1684)
    {
        _1250 = _1846;
    }
    float _1914 = _1250;
    float _1916 = abs(_350);
    float _1918 = log2(_1916);
    if (_1684)
    {
        _1892 = _1846;
    }
    float _1920 = _1892;
    float _1922 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1902);
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_1906)
    {
        float _1928 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[17].y, _276);
        _382 = _1928;
    }
    float _1930 = _382;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1906)
    {
        _1926 = _278;
    }
    float _1936 = _1926;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1940 = _1936;
    if (!_1906)
    {
        float _1942 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[17].y, _278);
        _1940 = _1942;
    }
    float _1944 = _1940;
    float _1946 = fma(_1924, -2.0, _1934);
    float _1948 = _935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1950 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1952 = -_1938;
    float _1954 = fma(_1910, 2.0, _1952);
    float _1956 = fma(_1912, -2.0, _1932);
    float _1958 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1948);
    if (!_1906)
    {
        float _1960 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[17].y, _274);
        _384 = _1960;
    }
    float _1962 = _384;
    float _1964 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1922);
    float _1966 = -_162;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1954);
    float _1970 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1946);
    float _1972 = exp2(_1950);
    float _1974 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1826);
    float _1976 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1956);
    float _1978 = _1816 + 0.5;
    float _1980 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1958);
    float _1982 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1984 = fma(_1884, _1736, _1968);
    float _1986 = -_1970;
    float _1988 = fma(_1964, _1626, _1986);
    float _1990 = -_1976;
    float _1992 = fma(_1974, _1648, _1990);
    float _1994 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1996 = _1652 + 0.5;
    float _1998 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2000 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1980);
    float _2002 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1982);
    float _2004 = _1908 + 0.5;
    float _2006 = _1984 + 0.5;
    float _2008 = _1988 + 0.5;
    float _2010 = _1992 + 0.5;
    float _2012 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1998);
    float _2014 = _2000 + _979;
    out.m_93.x = _1978;
    out.m_93.y = _1996;
    out.m_93.z = _2006;
    out.m_93.w = _2008;
    float _2016 = _979 * 0.5;
    if (!_977)
    {
        _1888 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2018 = _1888;
    float _2020 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1994);
    float _2022 = fma(_1972, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    out.m_95.x = _2004;
    out.m_95.y = _2010;
    bool _2026 = _350 <= 8000.0;
    bool _2028 = isnan(_350);
    bool _2030 = _2026 || _2028;
    bool _2032 = isnan(8000.0);
    bool _2034 = _2030 || _2032;
    float _2036 = float(_2034);
    int _2038 = as_type<int>(_1972);
    if (!_977)
    {
        float _2040 = _2018 * 5.0;
        _2038 = as_type<int>(_2040);
    }
    int _2042 = _2038;
    float _2044 = _993 + _979;
    out.gl_Position.x = _993;
    out.gl_Position.y = _995;
    out.gl_Position.z = _2000;
    out.gl_Position.w = _979;
    float _2046 = _2014 * 0.5;
    float _2048 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2002);
    float _2050 = fma(_995, -0.5, _2016);
    float _2052 = _2044 * 0.5;
    float _2054 = fma(_2024, -2.0, 3.0);
    float _2056 = _2024 * _2024;
    float _2058 = -_1520;
    float _2060 = _2058 + 1.0;
    out.m_97.x = _2052;
    out.m_97.y = _2050;
    out.m_97.z = _2046;
    out.m_97.w = _979;
    float _2062 = _2056 * _2054;
    float _2064 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2020);
    float _2066 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2068 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2012);
    float _2070 = -_2062;
    float _2072 = _2070 + 1.0;
    out.m_99.z = _2046;
    out.m_99.w = _979;
    float _2074 = _2066 * _1091;
    float _2076 = -_2066;
    float _2078 = _2076 + 1.0;
    float _2080 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    out.m_101.x = _2048;
    out.m_101.y = _2064;
    out.m_101.z = _2068;
    float _2082 = _2036 * _2080;
    float _2084 = _1102 * _2074;
    float _2086 = _1102 * _2078;
    float _2088 = _2080;
    float _2090 = 0.0;
    float _2092 = _2078;
    float _2094 = _2060;
    if (!_983)
    {
        _2088 = 1.0;
    }
    float _2096 = _2088;
    float _2098 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2100 = _2096;
    if (_983)
    {
        bool _2102 = _1089 >= _1049;
        bool _2104 = isnan(_1089);
        bool _2106 = _2102 || _2104;
        bool _2108 = isnan(_1049);
        bool _2110 = _2106 || _2108;
        float _2112 = float(_2110);
        _2100 = _2112;
    }
    float _2114 = _2100;
    if (!_977)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5919 = as_type<float>(_2042);
        out.gl_Position.z = _5919;
    }
    bool _2116 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2118 = isnan(_1216);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2124 = _2120 || _2122;
    float _2126 = _1502 * _2098;
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = _2114 * _1190;
    float _2132 = -_2128;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2136 = -_2130;
    float _2138 = fma(_2136, _2134, 1.0);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2144 = _2142;
    if (!_977)
    {
        _2144 = 0.0;
    }
    float _2146 = _2144;
    float _2148 = _1450 * _2074;
    float _2150 = fma(_1446, _2084, _1096);
    float _2152 = fma(_1448, _2084, _1098);
    float _2154 = _2140 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2156 = fma(_1102, _2148, _1100);
    float _2158 = _2154;
    if (!_2124)
    {
        _2090 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2160 = _2090;
    float _2162 = _2160;
    float _2164 = _2160;
    if (!_2124)
    {
        _1003 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2166 = _1003;
    out.m_103.x = _2154;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2124)
    {
        _2092 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2092;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2124)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2178 = _2094;
    out.m_105.x = _2150;
    out.m_105.y = _2152;
    out.m_105.z = _2156;
    out.m_105.w = _2086;
    float _2180 = _2178;
    float _2182 = _2178;
    if (!_2124)
    {
        _1005 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2184 = _1005;
    float _2186 = _2184;
    float _2188 = _2184;
    if (!_2124)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2190 = _2158;
    bool _2192 = !_2124;
    float _2194 = _2190;
    float _2196 = _2190;
    if (!_2192)
    {
        bool _2198 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2200 = isnan(_1216);
        bool _2202 = _2198 || _2200;
        bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2206 = _2202 || _2204;
        if (!_2206)
        {
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2210 = _1216 + _2208;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2214 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2212;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2224 = 1.0 / _2214;
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2238 = _2210 * _2224;
            float _2240 = precise::clamp(_2238, 0.0, 1.0);
            float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2246 = fma(_2240, _2218, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2248 = fma(_2240, _2222, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2250 = fma(_2240, _2244, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2252 = fma(_2240, _2228, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2254 = fma(_2240, _2232, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2256 = fma(_2240, _2236, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2196 = _2246;
            _2170 = _2254;
            _2182 = _2248;
            _2164 = _2252;
            _2188 = _2250;
            _2176 = _2256;
            _2258 = true;
        }
        else
        {
            bool _2260 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2262 = isnan(_1216);
            bool _2264 = _2260 || _2262;
            bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2268 = _2264 || _2266;
            if (!_2268)
            {
                _2162 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2270 = _2162;
            _2164 = _2270;
            if (!_2268)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2272 = _2168;
            _2170 = _2272;
            if (!_2268)
            {
                _2174 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2274 = _2174;
            _2176 = _2274;
            if (!_2268)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2276 = _2180;
            _2182 = _2276;
            if (!_2268)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2278 = _2194;
            _2196 = _2278;
            if (!_2268)
            {
                _2186 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2280 = _2186;
            bool _2282 = !_2268;
            _2188 = _2280;
            if (!_2282)
            {
                bool _2284 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2286 = isnan(_1216);
                bool _2288 = _2284 || _2286;
                bool _2290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2292 = _2288 || _2290;
                if (!_2292)
                {
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2296 = _1216 + _2294;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2300 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2310 = 1.0 / _2300;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2324 = _2296 * _2310;
                    float _2326 = precise::clamp(_2324, 0.0, 1.0);
                    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2332 = fma(_2326, _2304, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2334 = fma(_2326, _2308, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2336 = fma(_2326, _2330, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2338 = fma(_2326, _2314, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2340 = fma(_2326, _2318, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2342 = fma(_2326, _2322, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2196 = _2332;
                    _2170 = _2340;
                    _2182 = _2334;
                    _2164 = _2338;
                    _2188 = _2336;
                    _2176 = _2342;
                    _2258 = true;
                }
                else
                {
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2164 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2188 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2176 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2258 = false;
    float _2344 = _2196;
    float _2346 = _2170;
    float _2348 = _2182;
    float _2350 = _2164;
    float _2352 = _2188;
    float _2354 = _2176;
    float _2356 = fma(_2064, -0.5, 0.5);
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    float _2360 = -_2344;
    float _2362 = _2346 + _2360;
    float _2364 = -_2348;
    float _2366 = _2350 + _2364;
    float _2368 = -_2352;
    float _2370 = _2354 + _2368;
    bool _2372 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2374 = fma(_2358, _2362, _2344);
    float _2376 = fma(_2358, _2366, _2348);
    float _2378 = fma(_2358, _2370, _2352);
    float _2380 = _2146 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2382 = _2374 * 0.586610972881317138671875;
    out.m_107.x = 0.0;
    float _2384 = fma(_2376, 0.298911988735198974609375, _2382);
    out.m_59.x = _2380;
    float _2386 = fma(_2378, 0.114477999508380889892578125, _2384);
    float _2388 = -_2386;
    float _2390 = _2376 + _2388;
    float _2392 = -_2386;
    float _2394 = _2374 + _2392;
    float _2396 = -_2386;
    float _2398 = _2378 + _2396;
    float _2400 = fma(_2390, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    float _2402 = fma(_2394, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    float _2404 = fma(_2398, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    out.m_109.x = _2400;
    out.m_109.y = _2402;
    out.m_109.z = _2404;
    if (!_2372)
    {
        return out;
    }
    float _2406 = -_771;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2410 = -_773;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2414 = -_775;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2418 = _2408 * _2408;
    float _2420 = fma(_2412, _2412, _2418);
    float _2422 = fma(_2416, _2416, _2420);
    float _2424 = sqrt(_2422);
    float _2426 = rsqrt(_2422);
    float _2428 = -_2424;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2432 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = _2412 * _2426;
    float _2438 = _2408 * _2426;
    float _2440 = abs(_2434);
    float _2442 = log2(_2440);
    float _2444 = _2416 * _2426;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2448 = _2064 * _2438;
    float _2450 = -_2438;
    float _2452 = -_2446;
    float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2452);
    float _2456 = fma(_2048, _2436, _2448);
    float _2458 = -_2444;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2454);
    float _2462 = fma(_2068, _2444, _2456);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2468 = _2460 + _2466;
    float _2470 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = exp2(_2470);
    float _2478 = _2476 * _2474;
    float _2480 = _2464 * _2478;
    float _2482 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _2482;
    out.m_107.y = _2484;
    out.m_107.z = _2486;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2258 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_56.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_128);
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _134;
    if (!_132)
    {
        out.m_59.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2544 = as_type<float>(_144);
        out.gl_Position.z = _2544;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_61.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_158)
    {
        float _164 = float(_128);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _162 >= _166;
    bool _170 = !_158;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_59.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_180);
        out.gl_Position.z = _2613;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_56.x;
    float _184 = in.m_56.y;
    float _186 = in.m_56.z;
    float _188 = _184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _194 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _196 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _198 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    float _200 = _196 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _202 = _198 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _204 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _206 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _208 = floor(_204);
    float _210 = floor(_206);
    float _212 = -_208;
    float _214 = _204 + _212;
    float _216 = -_210;
    float _218 = _206 + _216;
    float2 _2693 = float2(_214, _218);
    float _220 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2693, float2(0.0), isnan(_2693)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2693, float2(0.0), isnan(_2693)), level(0.0)).x;
    float _222 = _184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _224 = in.m_63.y;
    float _226 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _222);
    float _228 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _230 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _226);
    float _232 = _230 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _234 = _232 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _236 = _232 + _228;
    float _238 = fma(_200, (*spvDescriptorSet0.vp_c8)._m0[11].x, _234);
    float _240 = _236 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _242 = in.m_65.x;
    float _244 = in.m_65.y;
    float _246 = in.m_65.z;
    float _248 = _236 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _250 = fma(_202, (*spvDescriptorSet0.vp_c8)._m0[11].z, _238);
    float _252 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[126].x, _240);
    float _254 = fma(_200, (*spvDescriptorSet0.vp_c15)._m0[127].x, _248);
    float _256 = _250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _258 = _232 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _260 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[126].z, _252);
    float _262 = fma(_202, (*spvDescriptorSet0.vp_c15)._m0[127].z, _254);
    float _264 = 1.0 / _256;
    float _266 = fma(_200, (*spvDescriptorSet0.vp_c8)._m0[10].x, _258);
    float _268 = _260 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _270 = _262 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _272 = fma(_202, (*spvDescriptorSet0.vp_c8)._m0[10].z, _266);
    float _274 = in.m_67.x;
    float _276 = in.m_67.y;
    float _278 = in.m_67.z;
    float _280 = trunc(_268);
    int _282 = int(_280);
    float _284 = _272 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _286 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.20000003278255462646484375;
    float _288 = _284 + _256;
    float _290 = fma(_244, 16.0, _286);
    float _292 = trunc(_270);
    int _294 = int(_292);
    float _296 = _288 * _264;
    float _298 = _296 * 0.5;
    float _300 = _290 * 0.15915493667125701904296875;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _304 = fma(_298, (*spvDescriptorSet0.vp_c8)._m0[30].w, _302);
    float _306 = in.m_69.x;
    float _308 = in.m_69.y;
    float _310 = in.m_69.z;
    float _312 = _300 * 6.283185482025146484375;
    float _314 = sin(_312);
    int _316 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _318 = _282 + _316;
    int _320 = _318 + 1;
    bool _322 = _320 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _324 = 1.0 / _304;
    int _326 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _328 = _294 + _326;
    int _330 = _328 + 1;
    int _332 = _320 | _330;
    float _334 = fma(_314, 0.5, 0.5);
    bool _336 = _332 < 0;
    bool _338 = _336 || _322;
    float _340 = _334 * 0.004999999888241291046142578125;
    bool _342 = _330 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _344 = _342 || _338;
    float _346 = _310 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _350 = _324 * _348;
    float _352 = fma(_274, _340, _242);
    float _354 = fma(_276, _340, _244);
    float _356 = fma(_278, _340, _246);
    float _358 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _360 = _350 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _362 = _306 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _364 = _350 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _366 = _308 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _368 = !_360;
    int _370 = _368 ? 0 : 1;
    int _372 = 0;
    int _374 = as_type<int>(_324);
    int _376 = 2;
    int _378 = as_type<int>(_358);
    float _380 = _236;
    float _382 = _276;
    float _384 = _274;
    if (!_344)
    {
        int _386 = _330 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _388 = _386 + _320;
        _372 = _388;
    }
    int _390 = _372;
    float _392 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _394 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _356);
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _352);
    float _400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _354);
    if (!_344)
    {
        int _402 = _390 << 2;
        _374 = _402;
    }
    int _404 = _374;
    float _406 = _396 * _358;
    int _408 = _404;
    if (!_360)
    {
        _376 = 1;
    }
    int _410 = _376;
    float _412 = _398 * _392;
    int _414 = _410;
    if (!_364)
    {
        _414 = _370;
    }
    int _416 = _414;
    float _418 = _400 * _394;
    float _420 = as_type<float>(_416);
    if (!_344)
    {
        uint _423 = uint(int(uint(_390) >> uint(2)));
        _378 = int(_423);
    }
    int _425 = _378;
    int _427 = _416 << 6;
    float _429 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _431 = as_type<float>(_427);
    if (!_344)
    {
        int _433 = 12 & _404;
        _408 = _433;
    }
    int _435 = _408;
    float _437 = _418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _439 = _427 + 96;
    uint _441 = uint(int(uint(_439) >> uint(2)));
    uint _443 = uint(int(uint(int(_441)) >> uint(2)));
    int _445 = int(_441) & 3;
    float _447 = (*spvDescriptorSet0.vp_c15)._m0[int(_443)][_445];
    int _449 = int(_441) + 1;
    uint _451 = uint(int(uint(_449) >> uint(2)));
    int _453 = _449 & 3;
    float _455 = (*spvDescriptorSet0.vp_c15)._m0[int(_451)][_453];
    float _457 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _429);
    float _459 = 0.0;
    if (!_344)
    {
        int _461 = _425 << 4;
        int _463 = _461 + _435;
        _459 = as_type<float>(_463);
    }
    float _465 = _459;
    float _467 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _437);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _471 = _469 != 0;
    float _473 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[10].z, _457);
    float _475 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _477 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[8].z, _467);
    float _479 = _465;
    if (!_344)
    {
        int _481 = as_type<int>(_465) + 400;
        uint _483 = uint(int(uint(_481) >> uint(2)));
        uint _485 = uint(int(uint(int(_483)) >> uint(2)));
        int _487 = int(_483) & 3;
        float _489 = (*spvDescriptorSet0.vp_c15)._m0[int(_485)][_487];
        _479 = _489;
    }
    float _491 = _479;
    float _493 = _202 + _473;
    float _495 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _475);
    float _497 = _200 + _477;
    float _499 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _501 = _493 + _499;
    float _503 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[9].z, _495);
    float _505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _507 = _497 + _505;
    int _509 = _427 + 48;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    uint _513 = uint(int(uint(int(_511)) >> uint(2)));
    int _515 = int(_511) & 3;
    float _517 = (*spvDescriptorSet0.vp_c15)._m0[int(_513)][_515];
    int _519 = int(_511) + 1;
    uint _521 = uint(int(uint(_519) >> uint(2)));
    int _523 = _519 & 3;
    float _525 = (*spvDescriptorSet0.vp_c15)._m0[int(_521)][_523];
    float _527 = _501 * _501;
    float _529 = 0.0;
    float _531 = _527;
    float _533 = _503;
    if (_471)
    {
        float _535 = in.m_63.x;
        _529 = _535;
    }
    float _537 = _529;
    int _539 = 0;
    if (_471)
    {
        _539 = 0;
    }
    int _541 = _539;
    float _543 = fma(_507, _507, _527);
    int _545 = 0;
    int _547 = _541;
    if (_471)
    {
        _545 = 0;
    }
    int _549 = _545;
    int _551 = _427 + 56;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c15)._m0[int(_555)][_557];
    int _561 = int(_553) + 1;
    uint _563 = uint(int(uint(_561) >> uint(2)));
    int _565 = _561 & 3;
    float _567 = (*spvDescriptorSet0.vp_c15)._m0[int(_563)][_565];
    float _569 = sqrt(_543);
    int _571 = _427 + 64;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    uint _575 = uint(int(uint(int(_573)) >> uint(2)));
    int _577 = int(_573) & 3;
    float _579 = (*spvDescriptorSet0.vp_c15)._m0[int(_575)][_577];
    int _581 = int(_573) + 1;
    uint _583 = uint(int(uint(_581) >> uint(2)));
    int _585 = _581 & 3;
    float _587 = (*spvDescriptorSet0.vp_c15)._m0[int(_583)][_585];
    int _589 = _427 + 72;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    uint _593 = uint(int(uint(int(_591)) >> uint(2)));
    int _595 = int(_591) & 3;
    float _597 = (*spvDescriptorSet0.vp_c15)._m0[int(_593)][_595];
    int _599 = int(_591) + 1;
    uint _601 = uint(int(uint(_599) >> uint(2)));
    int _603 = _599 & 3;
    float _605 = (*spvDescriptorSet0.vp_c15)._m0[int(_601)][_603];
    bool _607 = _569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _609 = _537;
    int _611 = _549;
    if (_471)
    {
        _531 = _537;
    }
    float _613 = _531;
    float _615 = _236 * _455;
    int _617 = _427 + 80;
    uint _619 = uint(int(uint(_617) >> uint(2)));
    uint _621 = uint(int(uint(int(_619)) >> uint(2)));
    int _623 = int(_619) & 3;
    float _625 = (*spvDescriptorSet0.vp_c15)._m0[int(_621)][_623];
    int _627 = int(_619) + 1;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    int _631 = _627 & 3;
    float _633 = (*spvDescriptorSet0.vp_c15)._m0[int(_629)][_631];
    float _635 = _232 + _503;
    float _637 = fma(_200, _447, _615);
    int _639 = _427 + 88;
    uint _641 = uint(int(uint(_639) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.vp_c15)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.vp_c15)._m0[int(_651)][_653];
    int _657 = _427 + 104;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.vp_c15)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.vp_c15)._m0[int(_669)][_671];
    float _675 = _447;
    float _677 = _613;
    float _679 = _635;
    if (_471)
    {
        _431 = _224;
    }
    float _681 = _431;
    float _683 = _681;
    float _685 = _525;
    float _687 = _633;
    float _689 = _625;
    if (!_471)
    {
        float _691 = in.m_63.x;
        float _693 = _224 * 3.1415927410125732421875;
        float _695 = _693 * 0.15915493667125701904296875;
        float _697 = _695 * 6.283185482025146484375;
        float _699 = sin(_697);
        float _701 = _691 * 3.1415927410125732421875;
        float _703 = _701 * 0.15915493667125701904296875;
        float _705 = _703 * 6.283185482025146484375;
        float _707 = sin(_705);
        _675 = _703;
        _547 = 1;
        _609 = _691;
        _677 = _707;
        _611 = 2;
        _683 = _699;
    }
    float _709 = _675;
    int _711 = _547;
    float _713 = _609;
    float _715 = _677;
    int _717 = _611;
    float _719 = _683;
    float _721 = _709;
    float _723 = _719;
    if (!_607)
    {
        _721 = _497;
    }
    float _725 = _721;
    float _727 = _725;
    if (!_607)
    {
        _533 = _493;
    }
    float _729 = _533;
    bool _731 = !_607;
    float _733 = _729;
    if (!_731)
    {
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _737 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _739 = _569 + _737;
        float _741 = rsqrt(_543);
        float _743 = _739 * _735;
        float _745 = _635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _747 = _743 * 0.15915493667125701904296875;
        float _749 = _747 * 6.283185482025146484375;
        float _751 = cos(_749);
        float _753 = _747 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _751 + (-1.0);
        float _759 = fma(_755, _745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _761 = _757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = _741 * _759;
        float _765 = fma(_635, _751, _761);
        float _767 = fma(_507, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _769 = fma(_501, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _679 = _765;
        _727 = _767;
        _733 = _769;
    }
    float _771 = _679;
    float _773 = _727;
    float _775 = _733;
    float _777 = fma(_202, _665, _637);
    float _779 = _236 * _525;
    float _781 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _783 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _785 = isnan(0.5);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _791 = _787 || _789;
    float _793 = _236 * _587;
    float _795 = fma(_200, _517, _779);
    float _797 = _777 + _673;
    float _799 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _781);
    if (!_344)
    {
        float _801 = floor(_268);
        _685 = _801;
    }
    float _803 = _685;
    float _805 = fma(_200, _579, _793);
    float _807 = fma(_202, _559, _795);
    float _809 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _799);
    float _811 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _813 = fma(_202, _597, _805);
    float _815 = _807 + _567;
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _819 = 1.0 / _797;
    float _821 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _823 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _825 = _817 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _827 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _829 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _821);
    float _831 = _813 + _605;
    float _833 = -_825;
    float _835 = fma(_833, _811, 1.0);
    float _837 = _501;
    float _839 = _829;
    if (!_344)
    {
        float _841 = floor(_270);
        _837 = _841;
    }
    float _843 = _837;
    float _845 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _829);
    float _847 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _823);
    float _849 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _827);
    if (_791)
    {
        _839 = 1.0;
    }
    float _851 = _839;
    float _853 = _815 * _819;
    float _855 = _851;
    float _857 = _853;
    if (!_791)
    {
        float _859 = as_type<float>(in.m_73.w);
        int _861 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _863 = _861 == 4;
        bool _865 = _861 == 8;
        bool _867 = _861 == 12;
        int _869 = as_type<int>(_859) << 16;
        int _871 = as_type<int>(_859) << 8;
        int _873 = as_type<int>(_859) << 24;
        int _875 = _869 >> 24;
        int _877 = _871 >> 24;
        int _879 = as_type<int>(_859) >> 24;
        int _881 = _873 >> 24;
        float _883 = float(_875);
        float _885 = float(_877);
        float _887 = float(_879);
        float _889 = _883 * 0.0078740157186985015869140625;
        float _891 = float(_881);
        float _893 = _885 * 0.0078740157186985015869140625;
        float _895 = _887 * 0.0078740157186985015869140625;
        float _897 = precise::min(_889, 1.0);
        float _899 = _891 * 0.0078740157186985015869140625;
        float _901 = precise::min(_893, 1.0);
        float _903 = precise::min(_895, 1.0);
        float _905 = precise::min(_899, 1.0);
        float _907 = precise::max(_897, -1.0);
        float _909 = precise::max(_901, -1.0);
        float _911 = precise::max(_903, -1.0);
        float _913 = precise::max(_905, -1.0);
        float _915 = _913;
        if (_863)
        {
            _915 = _907;
        }
        float _917 = _915;
        float _919 = _917;
        if (_865)
        {
            _919 = _909;
        }
        float _921 = _919;
        float _923 = _921;
        if (_867)
        {
            _923 = _911;
        }
        float _925 = _923;
        float _927 = abs(_925);
        float _929 = (-0.0) + _927;
        _855 = _929;
    }
    float _931 = _855;
    float _933 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _847);
    float _935 = _845 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _937 = _853 >= 0.0;
    float _939 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _849);
    float _941 = _933 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _943 = _935 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _945 = _831 * _819;
    bool _947 = _853 <= 1.0;
    bool _949 = _947 && _937;
    float _951 = _935 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _953 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[7].x, _943);
    float _955 = _935 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _957 = _939 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _959 = _945 >= 0.0;
    bool _961 = _959 && _949;
    float _963 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[7].z, _953);
    float _965 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[4].x, _955);
    float _967 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[5].x, _951);
    bool _969 = _931 != 0.0;
    bool _971 = isnan(_931);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    float _979 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[7].w, _963);
    bool _981 = _945 <= 1.0;
    bool _983 = _981 && _961;
    float _985 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[4].z, _965);
    float _987 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[5].z, _967);
    float _989 = 1.0 / _979;
    float _991 = _236 * _633;
    float _993 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[4].w, _985);
    float _995 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[5].w, _987);
    float _997 = fma(_200, _625, _991);
    float _999 = log2(_835);
    float _1001 = _997;
    float _1003 = _979;
    float _1005 = _931;
    if (_977)
    {
        _687 = _993;
    }
    float _1007 = _687;
    float _1009 = fma(_202, _647, _997);
    float _1011 = _1007;
    if (_977)
    {
        _689 = _995;
    }
    float _1013 = _689;
    float _1015 = _1013;
    if (!_977)
    {
        _1015 = 0.0;
        _1011 = 0.0;
    }
    float _1017 = _1015;
    float _1019 = _1011;
    if (_983)
    {
        float _1021 = float(_416);
        _420 = _1021;
    }
    float _1023 = _420;
    if (!_344)
    {
        float _1025 = -_843;
        float _1027 = _270 + _1025;
        _1001 = _1027;
    }
    float _1029 = _1001;
    float _1031 = _1009 + _655;
    float _1033 = _835;
    if (_983)
    {
        float _1035 = rint(_1023);
        float _1037 = precise::max(_1035, 0.0);
        uint _1039 = uint(_1037);
        uint _1041 = clamp(_1039, 0u, 65535u);
        _1033 = as_type<float>(_1041);
    }
    float _1043 = _1033;
    float _1045 = _989 * _1017;
    float _1047 = _989 * _1019;
    float _1049 = _1031 * _819;
    float _1051 = fma(_1045, -0.5, 0.5);
    float _1053 = fma(_1047, 0.5, 0.5);
    float _1055 = _999 * 0.693147182464599609375;
    float _1057 = _1017;
    float _1059 = _1047;
    float _1061 = _989;
    if (!_344)
    {
        float _1063 = rint(_491);
        float _1065 = precise::max(_1063, 0.0);
        uint _1067 = uint(_1065);
        uint _1069 = clamp(_1067, 0u, 65535u);
        _1057 = as_type<float>(_1069);
    }
    float _1071 = _1057;
    if (!_344)
    {
        float _1073 = -_803;
        float _1075 = _268 + _1073;
        _1059 = _1075;
    }
    float _1077 = _1059;
    float _1079 = _1055 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1081 = _843;
    float _1083 = _1043;
    float _1085 = _1079;
    if (_983)
    {
        float3 _4073 = float3(_853, _945, float(as_type<int>(_1043)));
        float3 _4077 = select(_4073, float3(0.0), isnan(_4073));
        float _1087 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4077.xy, uint(rint(_4077.z)), _1049, level(0.0));
        _1081 = _1087;
    }
    float _1089 = _1081;
    float3 _4087 = float3(_1053, _1051, _1079);
    float _1091 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4087, float3(0.0), isnan(_4087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4087, float3(0.0), isnan(_4087)), level(0.0)).x;
    float3 _4096 = float3(_1053, _1051, _1079);
    float4 _1094 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4096, float3(0.0), isnan(_4096)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4096, float3(0.0), isnan(_4096)), level(0.0)).xyzw;
    float _1096 = _1094.x;
    float _1098 = _1094.y;
    float _1100 = _1094.z;
    float _1102 = _1094.w;
    float _1104 = _1023;
    if (!_344)
    {
        float3 _4119 = float3(_1077, _1029, float(as_type<int>(_1071)));
        float3 _4121 = select(_4119, float3(0.0), isnan(_4119));
        float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4121.xy, uint(rint(_4121.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4121.xy, uint(rint(_4121.z)), level(0.0)).x;
        _1104 = _1106;
    }
    float _1108 = _1104;
    float _1110 = in.m_75.x;
    if (_344)
    {
        _1061 = 1.0;
    }
    float _1112 = _1061;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1116 = _1114 != 0;
    float _1118 = 0.0;
    float _1120 = _1112;
    float _1122 = _1110;
    if (!_1116)
    {
        _1118 = _1110;
    }
    float _1124 = _1118;
    float _1126 = _1124;
    if (!_344)
    {
        int _1128 = _390 << 4;
        int _1130 = _1128 + 2048;
        uint _1132 = uint(int(uint(_1130) >> uint(2)));
        uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
        int _1136 = int(_1132) & 3;
        float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
        int _1140 = int(_1132) + 1;
        uint _1142 = uint(int(uint(_1140) >> uint(2)));
        int _1144 = _1140 & 3;
        float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
        int _1148 = _1130 + 8;
        uint _1150 = uint(int(uint(_1148) >> uint(2)));
        uint _1152 = uint(int(uint(int(_1150)) >> uint(2)));
        int _1154 = int(_1150) & 3;
        float _1156 = (*spvDescriptorSet0.vp_c15)._m0[int(_1152)][_1154];
        int _1158 = int(_1150) + 1;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        int _1162 = _1158 & 3;
        float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
        float _1166 = _236 * _1146;
        float _1168 = fma(_200, _1138, _1166);
        float _1170 = fma(_202, _1156, _1168);
        float _1172 = _1170 + _1164;
        float _1174 = precise::clamp(_1172, 0.0, 1.0);
        float _1176 = -_1174;
        float _1178 = _1176 + _1108;
        float _1180 = fma(_1178, 500.0, 1.5);
        float _1182 = exp2(_1180);
        float _1184 = 0.0 + _1182;
        float _1186 = precise::clamp(_1184, 0.0, 1.0);
        _380 = _1166;
        _1120 = _1186;
    }
    float _1188 = _380;
    float _1190 = _1120;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1194 = _771 + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _773 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _775 + _1200;
    float _1204 = in.m_75.y;
    float _1206 = _1194 * _1194;
    float _1208 = in.m_63.z;
    float _1210 = fma(_1198, _1198, _1206);
    float _1212 = fma(_1202, _1202, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = sqrt(_1212);
    float _1218 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1220 = _1198 * _1218;
    float _1222 = _1202 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 * _1222;
    float _1228 = _1224 + _1226;
    float _1230 = sqrt(_1228);
    bool _1232 = _1230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = _1230 + _1234;
    float _1238 = _1214;
    float _1240 = _1236;
    float _1242 = _1194;
    float _1244 = _1188;
    bool _1246 = _1232;
    int _1248 = as_type<int>(_1204);
    float _1250 = _1208;
    if (_1232)
    {
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1232)
    {
        float _1256 = rsqrt(_1228);
        _1083 = _1256;
    }
    float _1258 = _1083;
    float _1260 = _1258;
    if (_1232)
    {
        float _1262 = _1236 * _1254;
        _1240 = _1262;
    }
    float _1264 = _1240;
    if (_1232)
    {
        float _1266 = _1264 * 0.15915493667125701904296875;
        _857 = _1266;
    }
    float _1268 = _857;
    float _1270 = _1202;
    if (_1232)
    {
        float _1272 = _1268 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1280 = precise::max(0.0, _1278);
    float _1282 = _1254;
    float _1284 = _1280;
    if (_1232)
    {
        float _1286 = _1268 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        _1282 = _1288;
    }
    float _1290 = _1282;
    float _1292 = -_1218;
    float _1294 = -_1280;
    float _1296 = fma(_1194, _1292, _1294);
    if (_1232)
    {
        float _1298 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1298;
    }
    float _1300 = _1242;
    float _1302 = _1300;
    float _1304 = _1276;
    if (_1232)
    {
        float _1306 = fma(_1276, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = _1308;
    if (!_1232)
    {
        _1304 = _1220;
    }
    float _1312 = _1304;
    float _1314 = _1312;
    float _1316 = _1290;
    if (_1232)
    {
        float _1318 = _1290 + (-1.0);
        _1284 = _1318;
    }
    float _1320 = _1284;
    float _1322 = _1320;
    if (_1232)
    {
        float _1324 = _1258 * _1308;
        _1085 = _1324;
    }
    float _1326 = _1085;
    if (!_1232)
    {
        _1310 = _1296;
    }
    float _1328 = _1310;
    float _1330 = _1328;
    if (_1232)
    {
        float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1332;
    }
    float _1334 = _1244;
    if (_1232)
    {
        float _1336 = _1220 * _1326;
        _1314 = _1336;
    }
    float _1338 = _1314;
    if (!_1232)
    {
        _1322 = _1222;
    }
    float _1340 = _1322;
    float _1342 = _1340;
    if (_1232)
    {
        float _1344 = _1222 * _1326;
        _1342 = _1344;
    }
    float _1346 = _1342;
    if (!_1232)
    {
        _1260 = _1224;
    }
    float _1348 = _1260;
    float _1350 = _1348;
    if (_1232)
    {
        float _1352 = fma(_1296, _1290, _1334);
        _1330 = _1352;
    }
    float _1354 = _1330;
    if (_1232)
    {
        float _1356 = _1338 * _1338;
        _1350 = _1356;
    }
    float _1358 = _1350;
    if (!_1232)
    {
        _1316 = _1226;
    }
    float _1360 = _1316;
    float _1362 = _1360;
    if (_1232)
    {
        float _1364 = _1346 * _1346;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = _1334;
    if (_1116)
    {
        float _1370 = in.m_63.x;
        _1368 = _1370;
    }
    float _1372 = _1368;
    float _1374 = fma(_1354, _1354, _1358);
    float _1376 = in.m_63.w;
    float _1378 = _1374 + _1366;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1382 = fma(_1216, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1380);
    float _1384 = precise::clamp(_1382, 0.0, 1.0);
    float _1386 = -_1384;
    float _1388 = _1386 + 1.0;
    float _1390 = rsqrt(_1378);
    float _1392 = abs(_1388);
    float _1394 = log2(_1392);
    float _1396 = _1390 * _1338;
    float _1398 = _1390 * _1354;
    float _1400 = _1390 * _1346;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1404 = -_1402;
    float _1406 = fma(_1398, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = -_1400;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1412 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = fma(_1410, -0.5, 0.5);
    float _1416 = fma(_1410, 0.5, 0.5);
    float _1418 = exp2(_1412);
    float _1420 = fma(_1416, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1422 = fma(_1416, _1420, -0.212114393711090087890625);
    float _1424 = _1398 + 1.0;
    float _1426 = sqrt(_1414);
    float _1428 = fma(_1416, _1422, 1.570728778839111328125);
    float _1430 = -_1398;
    float _1432 = fma(_1418, _1424, _1430);
    float _1434 = fma(_1432, 0.5, 0.5);
    float _1436 = _1426 * 0.636619746685028076171875;
    float _1438 = -_1428;
    float _1440 = fma(_1436, _1438, 1.0);
    float2 _4628 = float2(_1440, _1434);
    float3 _1444 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4628, float2(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4628, float2(0.0), isnan(_4628)), level(0.0)).xyz;
    float _1446 = _1444.x;
    float _1448 = _1444.y;
    float _1450 = _1444.z;
    int _1452 = as_type<int>(_1418);
    if (_1116)
    {
        float _1454 = -_1110;
        float _1456 = _1454 + 1.0;
        _1452 = as_type<int>(_1456);
    }
    int _1458 = _1452;
    if (_1116)
    {
        bool _1460 = _1372 > 0.5;
        _1246 = _1460;
    }
    bool _1462 = _1246;
    float _1464 = -_1204;
    float _1466 = _1464 + 1.0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1470 = _1468 != 0;
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1116)
    {
        float _1474 = _1462 ? as_type<float>(_1458) : _1110;
        _1126 = _1474;
    }
    float _1476 = _1126;
    out.m_77.y = _1204;
    bool _1478 = _224 > 0.5;
    float _1480 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1482 = _1376 > 0.5;
    float _1484 = _224 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1486 = _1478 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1488 = in.m_79.x;
    float _1490 = in.m_79.y;
    float _1492 = in.m_79.z;
    float _1494 = in.m_79.w;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1498 = _1470 ? as_type<float>(_1486) : _1204;
    float _1500 = -_220;
    float _1502 = _1500 + 1.0;
    int _1504 = _1482 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1510 = _1508 != 0;
    float _1512 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1514 = _1208 > 0.5;
    float _1516 = fma(_1484, -2.0, _1506);
    float _1518 = _1510 ? as_type<float>(_1504) : _1204;
    float _1520 = exp2(_1480);
    int _1522 = _1514 ? as_type<int>(_1466) : as_type<int>(_1204);
    float _1524 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1516);
    out.m_81.x = _773;
    out.m_81.y = _771;
    out.m_81.z = _775;
    float _1526 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1532 = _1530 != 0;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1546 = _1544 != 0;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1550 = _1532 ? as_type<float>(_1522) : _1204;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1556 = _1554 != 0;
    float _1558 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1562 = _1560 != 0;
    float _1564 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1568 = _1566 != 0;
    float _1570 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1574 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_83.x = _1538;
    out.m_83.y = _1558;
    out.m_83.z = _1564;
    out.m_83.w = _1552;
    float _1578 = _274 * _1492;
    float _1580 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1582 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_85.x = _1570;
    out.m_85.y = _1574;
    out.m_85.z = _1576;
    float _1584 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1586 = _276 * _1488;
    float _1588 = -_1578;
    float _1590 = fma(_278, _1488, _1588);
    float _1592 = 0.0;
    int _1594 = as_type<int>(_1524);
    int _1596 = as_type<int>(_1526);
    bool _1598 = _1568;
    if (_1546)
    {
        float _1600 = in.m_63.z;
        _1592 = _1600;
    }
    float _1602 = _1592;
    float _1604 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1580);
    float _1606 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1582);
    float _1608 = fma(_1488, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1584);
    float _1610 = -_1586;
    float _1612 = fma(_274, _1490, _1610);
    float _1614 = _278 * _1490;
    float _1616 = _1572 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1620 = fma(_1512, _1498, -0.5);
    float _1622 = _1568 ? as_type<float>(_1522) : _1204;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1626 = fma(_1616, _1518, -0.5);
    float _1628 = -_1614;
    float _1630 = fma(_276, _1492, _1628);
    float _1632 = _1590 * _1494;
    float _1634 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1624);
    float _1636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1638 = _1630 * _1494;
    float _1640 = _1612 * _1494;
    float _1642 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1634);
    float _1644 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1604);
    float _1646 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1606);
    float _1648 = fma(_1526, _1550, -0.5);
    float _1650 = -_1524;
    float _1652 = fma(_1642, _1620, _1650);
    float _1654 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1656 = _1654;
    float _1658 = _1572;
    if (_1556)
    {
        float _1660 = -_1110;
        float _1662 = _1660 + 1.0;
        _1594 = as_type<int>(_1662);
    }
    int _1664 = _1594;
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1668 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1608);
    float _1670 = fma(_1654, _1622, -0.5);
    if (!_1556)
    {
        _1656 = _1110;
    }
    float _1672 = _1656;
    float _1674 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1676 = _1672;
    if (_1556)
    {
        float _1678 = _1478 ? as_type<float>(_1664) : _1110;
        _1676 = _1678;
    }
    float _1680 = _1676;
    float _1682 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1684 = _711 != 1;
    if (_1546)
    {
        float _1686 = -_1110;
        float _1688 = _1686 + 1.0;
        _1596 = as_type<int>(_1688);
    }
    int _1690 = _1596;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (_1546)
    {
        bool _1694 = _1602 > 0.5;
        _1598 = _1694;
    }
    bool _1696 = _1598;
    float _1698 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1682);
    if (!_1546)
    {
        _1658 = _1110;
    }
    float _1702 = _1658;
    float _1704 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1674);
    float _1706 = fma(_1638, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1698);
    out.m_87.x = _1644;
    out.m_87.y = _1646;
    out.m_87.z = _1668;
    float _1708 = _1702;
    if (_1546)
    {
        float _1710 = _1696 ? as_type<float>(_1690) : _1110;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1716 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1700);
    if (_1562)
    {
        float _1718 = -_1110;
        float _1720 = _1718 + 1.0;
        _1248 = as_type<int>(_1720);
    }
    int _1722 = _1248;
    float _1724 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1704);
    float _1726 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1706);
    if (_1562)
    {
        float _1728 = _1478 ? as_type<float>(_1722) : _1110;
        _1122 = _1728;
    }
    float _1730 = _1122;
    out.m_89.x = _1724;
    out.m_89.y = _1716;
    out.m_89.z = _1726;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1734 = _713 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1736 = fma(_1714, _1712, -0.5);
    float _1738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1740 = -_1732;
    float _1742 = fma(_1734, 2.0, _1740);
    float _1744 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1746 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1752 = fma(_1744, _1680, -0.5);
    float _1754 = _715 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1756 = fma(_1746, _1730, -0.5);
    bool _1758 = _717 != 2;
    float _1760 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1748);
    float _1762 = -_1750;
    float _1764 = fma(_1754, 2.0, _1762);
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1770 = _719 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1772 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1760);
    float _1774 = -_162;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1764);
    float _1778 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1766);
    float _1780 = fma(_1770, -2.0, _1768);
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1784 = fma(_1772, _1756, _1776);
    float _1786 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1778);
    float _1788 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1780);
    float _1790 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1792 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1782);
    float _1794 = -_1788;
    float _1796 = fma(_1786, _1670, _1794);
    float _1798 = fma(_1790, _1476, -0.5);
    float _1800 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1792);
    float _1802 = -_162;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1742);
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1808 = _1790;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1812 = _1786;
    if (_1758)
    {
        _1808 = _713;
    }
    float _1814 = _1808;
    float _1816 = fma(_1800, _1798, _1804);
    float _1818 = _1814;
    if (!_1758)
    {
        _1818 = _1208;
    }
    float _1820 = _1818;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1684)
    {
        _723 = _224;
    }
    float _1824 = _723;
    float _1826 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1806);
    bool _1828 = _354 != 0.0;
    bool _1830 = isnan(_354);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(0.0);
    bool _1836 = _1832 || _1834;
    float _1838 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1840 = _1824;
    if (!_1684)
    {
        _1810 = _1824;
    }
    float _1842 = _1810;
    float _1844 = _1842;
    if (_1684)
    {
        _1840 = _224;
    }
    float _1846 = _1840;
    float _1848 = -_1822;
    float _1850 = fma(_1838, 2.0, _1848);
    float _1852 = _1784 + 0.5;
    float _1854 = _1852;
    if (!_1684)
    {
        _1812 = _1842;
    }
    float _1856 = _1812;
    float _1858 = _1796 + 0.5;
    float _1860 = _1856;
    if (_1684)
    {
        _1844 = _713;
    }
    float _1862 = _1844;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1866 = -_162;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1850);
    out.m_91.x = _1852;
    out.m_91.y = _1858;
    float _1870 = fma(_1862, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1864);
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_1684)
    {
        _1860 = _713;
    }
    float _1874 = _1860;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1878 = _352 == 0.0;
    bool _1880 = !_1836;
    bool _1882 = _1878 && _1880;
    float _1884 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1870);
    float _1886 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1876);
    float _1888 = _1884;
    if (!_1684)
    {
        _1872 = _1208;
    }
    float _1890 = _1872;
    float _1892 = _1890;
    if (_1758)
    {
        _1854 = _1846;
    }
    float _1894 = _1854;
    float _1896 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1886);
    float _1898 = _1894;
    if (!_1758)
    {
        _1898 = _713;
    }
    float _1900 = _1898;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1904 = _356 == 0.0;
    bool _1906 = _1904 && _1882;
    float _1908 = fma(_1896, _1752, _1868);
    float _1910 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1912 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1684)
    {
        _1250 = _1846;
    }
    float _1914 = _1250;
    float _1916 = abs(_350);
    float _1918 = log2(_1916);
    if (_1684)
    {
        _1892 = _1846;
    }
    float _1920 = _1892;
    float _1922 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1902);
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_1906)
    {
        float _1928 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[17].y, _276);
        _382 = _1928;
    }
    float _1930 = _382;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1906)
    {
        _1926 = _278;
    }
    float _1936 = _1926;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1940 = _1936;
    if (!_1906)
    {
        float _1942 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[17].y, _278);
        _1940 = _1942;
    }
    float _1944 = _1940;
    float _1946 = fma(_1924, -2.0, _1934);
    float _1948 = _935 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1950 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1952 = -_1938;
    float _1954 = fma(_1910, 2.0, _1952);
    float _1956 = fma(_1912, -2.0, _1932);
    float _1958 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1948);
    if (!_1906)
    {
        float _1960 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[17].y, _274);
        _384 = _1960;
    }
    float _1962 = _384;
    float _1964 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1922);
    float _1966 = -_162;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1954);
    float _1970 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1946);
    float _1972 = exp2(_1950);
    float _1974 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1826);
    float _1976 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1956);
    float _1978 = _1816 + 0.5;
    float _1980 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1958);
    float _1982 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1984 = fma(_1884, _1736, _1968);
    float _1986 = -_1970;
    float _1988 = fma(_1964, _1626, _1986);
    float _1990 = -_1976;
    float _1992 = fma(_1974, _1648, _1990);
    float _1994 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1996 = _1652 + 0.5;
    float _1998 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2000 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1980);
    float _2002 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1982);
    float _2004 = _1908 + 0.5;
    float _2006 = _1984 + 0.5;
    float _2008 = _1988 + 0.5;
    float _2010 = _1992 + 0.5;
    float _2012 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1998);
    float _2014 = _2000 + _979;
    out.m_93.x = _1978;
    out.m_93.y = _1996;
    out.m_93.z = _2006;
    out.m_93.w = _2008;
    float _2016 = _979 * 0.5;
    if (!_977)
    {
        _1888 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2018 = _1888;
    float _2020 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1994);
    float _2022 = fma(_1972, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    out.m_95.x = _2004;
    out.m_95.y = _2010;
    bool _2026 = _350 <= 8000.0;
    bool _2028 = isnan(_350);
    bool _2030 = _2026 || _2028;
    bool _2032 = isnan(8000.0);
    bool _2034 = _2030 || _2032;
    float _2036 = float(_2034);
    int _2038 = as_type<int>(_1972);
    if (!_977)
    {
        float _2040 = _2018 * 5.0;
        _2038 = as_type<int>(_2040);
    }
    int _2042 = _2038;
    float _2044 = _993 + _979;
    out.gl_Position.x = _993;
    out.gl_Position.y = _995;
    out.gl_Position.z = _2000;
    out.gl_Position.w = _979;
    float _2046 = _2014 * 0.5;
    float _2048 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2002);
    float _2050 = fma(_995, -0.5, _2016);
    float _2052 = _2044 * 0.5;
    float _2054 = fma(_2024, -2.0, 3.0);
    float _2056 = _2024 * _2024;
    float _2058 = -_1520;
    float _2060 = _2058 + 1.0;
    out.m_97.x = _2052;
    out.m_97.y = _2050;
    out.m_97.z = _2046;
    out.m_97.w = _979;
    float _2062 = _2056 * _2054;
    float _2064 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2020);
    float _2066 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2068 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2012);
    float _2070 = -_2062;
    float _2072 = _2070 + 1.0;
    out.m_99.z = _2046;
    out.m_99.w = _979;
    float _2074 = _2066 * _1091;
    float _2076 = -_2066;
    float _2078 = _2076 + 1.0;
    float _2080 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2062);
    out.m_101.x = _2048;
    out.m_101.y = _2064;
    out.m_101.z = _2068;
    float _2082 = _2036 * _2080;
    float _2084 = _1102 * _2074;
    float _2086 = _1102 * _2078;
    float _2088 = _2080;
    float _2090 = 0.0;
    float _2092 = _2078;
    float _2094 = _2060;
    if (!_983)
    {
        _2088 = 1.0;
    }
    float _2096 = _2088;
    float _2098 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2100 = _2096;
    if (_983)
    {
        bool _2102 = _1089 >= _1049;
        bool _2104 = isnan(_1089);
        bool _2106 = _2102 || _2104;
        bool _2108 = isnan(_1049);
        bool _2110 = _2106 || _2108;
        float _2112 = float(_2110);
        _2100 = _2112;
    }
    float _2114 = _2100;
    if (!_977)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5919 = as_type<float>(_2042);
        out.gl_Position.z = _5919;
    }
    bool _2116 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2118 = isnan(_1216);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2124 = _2120 || _2122;
    float _2126 = _1502 * _2098;
    float _2128 = precise::clamp(_2126, 0.0, 1.0);
    float _2130 = _2114 * _1190;
    float _2132 = -_2128;
    float _2134 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2136 = -_2130;
    float _2138 = fma(_2136, _2134, 1.0);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = _931 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2144 = _2142;
    if (!_977)
    {
        _2144 = 0.0;
    }
    float _2146 = _2144;
    float _2148 = _1450 * _2074;
    float _2150 = fma(_1446, _2084, _1096);
    float _2152 = fma(_1448, _2084, _1098);
    float _2154 = _2140 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2156 = fma(_1102, _2148, _1100);
    float _2158 = _2154;
    if (!_2124)
    {
        _2090 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2160 = _2090;
    float _2162 = _2160;
    float _2164 = _2160;
    if (!_2124)
    {
        _1003 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2166 = _1003;
    out.m_103.x = _2154;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_2124)
    {
        _2092 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2092;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2124)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2178 = _2094;
    out.m_105.x = _2150;
    out.m_105.y = _2152;
    out.m_105.z = _2156;
    out.m_105.w = _2086;
    float _2180 = _2178;
    float _2182 = _2178;
    if (!_2124)
    {
        _1005 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2184 = _1005;
    float _2186 = _2184;
    float _2188 = _2184;
    if (!_2124)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2190 = _2158;
    bool _2192 = !_2124;
    float _2194 = _2190;
    float _2196 = _2190;
    if (!_2192)
    {
        bool _2198 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2200 = isnan(_1216);
        bool _2202 = _2198 || _2200;
        bool _2204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2206 = _2202 || _2204;
        if (!_2206)
        {
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2210 = _1216 + _2208;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2214 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2212;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2224 = 1.0 / _2214;
            float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2238 = _2210 * _2224;
            float _2240 = precise::clamp(_2238, 0.0, 1.0);
            float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2246 = fma(_2240, _2218, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2248 = fma(_2240, _2222, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2250 = fma(_2240, _2244, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2252 = fma(_2240, _2228, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2254 = fma(_2240, _2232, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2256 = fma(_2240, _2236, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2196 = _2246;
            _2170 = _2254;
            _2182 = _2248;
            _2164 = _2252;
            _2188 = _2250;
            _2176 = _2256;
            _2258 = true;
        }
        else
        {
            bool _2260 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2262 = isnan(_1216);
            bool _2264 = _2260 || _2262;
            bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2268 = _2264 || _2266;
            if (!_2268)
            {
                _2162 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2270 = _2162;
            _2164 = _2270;
            if (!_2268)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2272 = _2168;
            _2170 = _2272;
            if (!_2268)
            {
                _2174 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2274 = _2174;
            _2176 = _2274;
            if (!_2268)
            {
                _2180 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2276 = _2180;
            _2182 = _2276;
            if (!_2268)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2278 = _2194;
            _2196 = _2278;
            if (!_2268)
            {
                _2186 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2280 = _2186;
            bool _2282 = !_2268;
            _2188 = _2280;
            if (!_2282)
            {
                bool _2284 = _1216 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2286 = isnan(_1216);
                bool _2288 = _2284 || _2286;
                bool _2290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2292 = _2288 || _2290;
                if (!_2292)
                {
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2296 = _1216 + _2294;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2300 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2310 = 1.0 / _2300;
                    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2322 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2324 = _2296 * _2310;
                    float _2326 = precise::clamp(_2324, 0.0, 1.0);
                    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2332 = fma(_2326, _2304, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2334 = fma(_2326, _2308, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2336 = fma(_2326, _2330, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2338 = fma(_2326, _2314, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2340 = fma(_2326, _2318, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2342 = fma(_2326, _2322, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2196 = _2332;
                    _2170 = _2340;
                    _2182 = _2334;
                    _2164 = _2338;
                    _2188 = _2336;
                    _2176 = _2342;
                    _2258 = true;
                }
                else
                {
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2182 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2164 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2188 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2176 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2258 = false;
    float _2344 = _2196;
    float _2346 = _2170;
    float _2348 = _2182;
    float _2350 = _2164;
    float _2352 = _2188;
    float _2354 = _2176;
    float _2356 = fma(_2064, -0.5, 0.5);
    float _2358 = precise::clamp(_2356, 0.0, 1.0);
    float _2360 = -_2344;
    float _2362 = _2346 + _2360;
    float _2364 = -_2348;
    float _2366 = _2350 + _2364;
    float _2368 = -_2352;
    float _2370 = _2354 + _2368;
    bool _2372 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2374 = fma(_2358, _2362, _2344);
    float _2376 = fma(_2358, _2366, _2348);
    float _2378 = fma(_2358, _2370, _2352);
    float _2380 = _2146 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2382 = _2374 * 0.586610972881317138671875;
    out.m_107.x = 0.0;
    float _2384 = fma(_2376, 0.298911988735198974609375, _2382);
    out.m_59.x = _2380;
    float _2386 = fma(_2378, 0.114477999508380889892578125, _2384);
    float _2388 = -_2386;
    float _2390 = _2376 + _2388;
    float _2392 = -_2386;
    float _2394 = _2374 + _2392;
    float _2396 = -_2386;
    float _2398 = _2378 + _2396;
    float _2400 = fma(_2390, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    float _2402 = fma(_2394, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    float _2404 = fma(_2398, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2386);
    out.m_109.x = _2400;
    out.m_109.y = _2402;
    out.m_109.z = _2404;
    if (!_2372)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2406 = -_771;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2410 = -_773;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2414 = -_775;
    float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2418 = _2408 * _2408;
    float _2420 = fma(_2412, _2412, _2418);
    float _2422 = fma(_2416, _2416, _2420);
    float _2424 = sqrt(_2422);
    float _2426 = rsqrt(_2422);
    float _2428 = -_2424;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2432 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = _2412 * _2426;
    float _2438 = _2408 * _2426;
    float _2440 = abs(_2434);
    float _2442 = log2(_2440);
    float _2444 = _2416 * _2426;
    float _2446 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2448 = _2064 * _2438;
    float _2450 = -_2438;
    float _2452 = -_2446;
    float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2452);
    float _2456 = fma(_2048, _2436, _2448);
    float _2458 = -_2444;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2454);
    float _2462 = fma(_2068, _2444, _2456);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2468 = _2460 + _2466;
    float _2470 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = exp2(_2470);
    float _2478 = _2476 * _2474;
    float _2480 = _2464 * _2478;
    float _2482 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_107.x = _2482;
    out.m_107.y = _2484;
    out.m_107.z = _2486;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

