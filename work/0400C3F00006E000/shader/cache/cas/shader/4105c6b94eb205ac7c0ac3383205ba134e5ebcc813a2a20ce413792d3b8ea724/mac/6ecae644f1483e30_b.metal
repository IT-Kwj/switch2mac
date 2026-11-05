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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _912 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_912, float2(0.0), isnan(_912)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _929 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_929, float2(0.0), isnan(_929))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_929, float2(0.0), isnan(_929))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _84 = -_62;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_64;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_66;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _70 * _88;
    float _104 = _72 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _74, _106);
    float _110 = -_102;
    float _112 = fma(_100, _76, _110);
    float _114 = -_104;
    float _116 = fma(_94, _78, _114);
    float _118 = -_104;
    float _120 = fma(_100, _80, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = -_160;
    float _168 = fma(_150, _152, _166);
    float _170 = _150 * _156;
    float _172 = _164 * _164;
    float _174 = -_170;
    float _176 = fma(_146, _154, _174);
    float _178 = fma(_168, _168, _172);
    float _180 = fma(_176, _176, _178);
    float _182 = -_68;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[46].z, _184);
    float _188 = rsqrt(_180);
    float _190 = _186 * _70;
    float _192 = _186 * _72;
    float _194 = -_190;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _198 = -_192;
    float _200 = _198 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _202 = _190 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _204 = _190 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _206 = _196 * _196;
    float _208 = -_186;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _212 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].x, _202);
    float _214 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].x, _204);
    float _216 = fma(_200, _200, _206);
    float _218 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[21].z, _212);
    float _220 = _164 * _188;
    float _222 = _168 * _188;
    float _224 = _176 * _188;
    float _226 = fma(_210, _210, _216);
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _230 = _190 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _232 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _234 = sqrt(_226);
    float _236 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].x, _230);
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].z, _232);
    float _240 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[22].z, _236);
    float _242 = _190 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _244 = abs(_238);
    float _246 = -_244;
    float _248 = _246 + 1.0;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].x, _242);
    float _254 = abs(_250);
    float _256 = log2(_254);
    float _258 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[20].z, _252);
    bool _262 = _234 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _264 = _234 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _266 = !_262;
    int _269 = _266 ? 0 : 1;
    float _271 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    int _273 = 2;
    if (!_262)
    {
        _273 = 1;
    }
    int _275 = _273;
    int _277 = _275;
    if (!_264)
    {
        _277 = _269;
    }
    int _279 = _277;
    float _281 = _190 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _283 = exp2(_271);
    float _285 = float(_279);
    float _287 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].x, _281);
    float _289 = precise::min(_285, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _291 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[19].z, _287);
    bool _293 = _289 != 1.0;
    bool _295 = isnan(_289);
    bool _297 = _293 || _295;
    bool _299 = isnan(1.0);
    bool _301 = _297 || _299;
    bool _303 = _289 != 0.0;
    bool _305 = isnan(_289);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = _283 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _315 = fma(_220, _313, _190);
    float _317 = fma(_222, _313, _192);
    float _319 = fma(_224, _313, _186);
    float _321 = _291 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _323 = _315 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _325 = _315 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _327 = _321;
    if (_301)
    {
        float _329 = _240 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _327 = _329;
    }
    float _331 = _327;
    float _333 = _190 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _335 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[3].x, _323);
    float _337 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[1].x, _325);
    float _339 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].x, _333);
    float _341 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[3].z, _335);
    float _343 = _315 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _345 = _315 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _347 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[1].z, _337);
    float _349 = _341 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _351 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[0].x, _343);
    float _353 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[2].x, _345);
    float _355 = _347 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _357 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _359 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[0].z, _351);
    float _361 = 1.0 / _349;
    float _363 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[2].z, _353);
    float _365 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[23].z, _339);
    float _367 = _359 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _369 = _258 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _371 = _363 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _373 = _190 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _375 = _369;
    float _377 = _331;
    if (_301)
    {
        float _379 = _365 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _375 = _379;
    }
    float _381 = _375;
    float _383 = _190 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _385 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].x, _373);
    float _387 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].x, _383);
    float _389 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[17].z, _385);
    float _391 = _218 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _393 = _371 * _361;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _367 * _361;
    float _399 = _355 * _361;
    float _401 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[24].z, _214);
    float _403 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[16].z, _387);
    float _405 = fma(_357, 0.5, _397);
    float _407 = rint(_395);
    float _409 = precise::max(_407, 0.0);
    uint _412 = uint(_409);
    uint _414 = clamp(_412, 0u, 65535u);
    float _416 = fma(_357, 1.5, _397);
    float _418 = fma(_357, -0.5, _397);
    float _420 = fma(_357, -1.5, _397);
    float _422 = fma(_82, 1.5, _399);
    float _424 = fma(_82, 0.5, _399);
    float3 _1555 = float3(_405, _422, float(int(_414)));
    float3 _1559 = select(_1555, float3(0.0), isnan(_1555));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1559.xy, uint(rint(_1559.z)), 1.0);
    float3 _1567 = float3(_418, _422, float(int(_414)));
    float3 _1569 = select(_1567, float3(0.0), isnan(_1567));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1569.xy, uint(rint(_1569.z)), 1.0);
    float3 _1577 = float3(_416, _422, float(int(_414)));
    float3 _1579 = select(_1577, float3(0.0), isnan(_1577));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1579.xy, uint(rint(_1579.z)), 1.0);
    float3 _1587 = float3(_420, _422, float(int(_414)));
    float3 _1589 = select(_1587, float3(0.0), isnan(_1587));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1589.xy, uint(rint(_1589.z)), 1.0);
    float3 _1597 = float3(_405, _424, float(int(_414)));
    float3 _1599 = select(_1597, float3(0.0), isnan(_1597));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1599.xy, uint(rint(_1599.z)), 1.0);
    float3 _1607 = float3(_416, _424, float(int(_414)));
    float3 _1609 = select(_1607, float3(0.0), isnan(_1607));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1609.xy, uint(rint(_1609.z)), 1.0);
    float3 _1617 = float3(_418, _424, float(int(_414)));
    float3 _1619 = select(_1617, float3(0.0), isnan(_1617));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1619.xy, uint(rint(_1619.z)), 1.0);
    float3 _1627 = float3(_420, _424, float(int(_414)));
    float3 _1629 = select(_1627, float3(0.0), isnan(_1627));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1629.xy, uint(rint(_1629.z)), 1.0);
    float _442 = _381;
    float _444 = _391;
    if (!_311)
    {
        float _446 = _389 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _442 = _446;
    }
    float _448 = _442;
    if (!_311)
    {
        float _450 = _403 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _377 = _450;
    }
    float _452 = _377;
    float _454 = fma(_82, -0.5, _399);
    float _456 = fma(_82, -1.5, _399);
    float _458 = _190 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_301)
    {
        float _460 = _401 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _444 = _460;
    }
    float _462 = _444;
    float _464 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _466 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _468 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].x, _458);
    float _470 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[18].z, _468);
    float _472 = _462;
    if (!_311)
    {
        float _474 = _470 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _472 = _474;
    }
    float _476 = _472;
    float3 _1710 = float3(_405, _454, float(int(_414)));
    float3 _1712 = select(_1710, float3(0.0), isnan(_1710));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1712.xy, uint(rint(_1712.z)), 1.0);
    float _480 = 0.0 + _476;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _430 + _426;
    float _486 = rint(_289);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    uint _492 = clamp(_490, 0u, 65535u);
    float _494 = _484 + _428;
    float _496 = _494 + _432;
    float3 _1741 = float3(_418, _454, float(int(_414)));
    float3 _1743 = select(_1741, float3(0.0), isnan(_1741));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1743.xy, uint(rint(_1743.z)), 1.0);
    float _500 = _496 + _436;
    float3 _1754 = float3(_416, _454, float(int(_414)));
    float3 _1756 = select(_1754, float3(0.0), isnan(_1754));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1756.xy, uint(rint(_1756.z)), 1.0);
    float _504 = _500 + _434;
    float3 _1767 = float3(_420, _454, float(int(_414)));
    float3 _1769 = select(_1767, float3(0.0), isnan(_1767));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1769.xy, uint(rint(_1769.z)), 1.0);
    float3 _1777 = float3(_416, _456, float(int(_414)));
    float3 _1779 = select(_1777, float3(0.0), isnan(_1777));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1779.xy, uint(rint(_1779.z)), 1.0);
    float3 _1787 = float3(_405, _456, float(int(_414)));
    float3 _1789 = select(_1787, float3(0.0), isnan(_1787));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1789.xy, uint(rint(_1789.z)), 1.0);
    float3 _1797 = float3(_418, _456, float(int(_414)));
    float3 _1799 = select(_1797, float3(0.0), isnan(_1797));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1799.xy, uint(rint(_1799.z)), 1.0);
    float _514 = _482 * _464;
    float _516 = _482 * _466;
    float _518 = fma(_514, 1.5, _452);
    float _520 = fma(_514, -1.5, _452);
    float _522 = fma(_514, -0.5, _452);
    float _524 = fma(_514, 0.5, _452);
    float _526 = fma(_516, 1.5, _448);
    float3 _1828 = float3(_524, _526, float(int(_492)));
    float3 _1830 = select(_1828, float3(0.0), isnan(_1828));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1830.xy, uint(rint(_1830.z)), _482);
    float3 _1839 = float3(_522, _526, float(int(_492)));
    float3 _1841 = select(_1839, float3(0.0), isnan(_1839));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1841.xy, uint(rint(_1841.z)), _482);
    float3 _1850 = float3(_520, _526, float(int(_492)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1852.xy, uint(rint(_1852.z)), _482);
    float3 _1861 = float3(_518, _526, float(int(_492)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1863.xy, uint(rint(_1863.z)), _482);
    float3 _1872 = float3(_420, _456, float(int(_414)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1874.xy, uint(rint(_1874.z)), 1.0);
    float _538 = _504 + _438;
    float _540 = _538 + _440;
    float _542 = fma(_516, 0.5, _448);
    float3 _1891 = float3(_518, _542, float(int(_492)));
    float3 _1893 = select(_1891, float3(0.0), isnan(_1891));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1893.xy, uint(rint(_1893.z)), _482);
    float _546 = _540 + _502;
    float _548 = _546 + _478;
    float _550 = _548 + _498;
    float _552 = _550 + _506;
    float _554 = _552 + _508;
    float _556 = _554 + _510;
    float _558 = _556 + _512;
    float _560 = fma(_516, -0.5, _448);
    float _562 = _534 + _528;
    float _564 = _558 + _536;
    float _566 = _562 + _530;
    float3 _1935 = float3(_524, _542, float(int(_492)));
    float3 _1937 = select(_1935, float3(0.0), isnan(_1935));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1937.xy, uint(rint(_1937.z)), _482);
    float _570 = _566 + _532;
    float3 _1949 = float3(_522, _542, float(int(_492)));
    float3 _1951 = select(_1949, float3(0.0), isnan(_1949));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1951.xy, uint(rint(_1951.z)), _482);
    float3 _1960 = float3(_520, _542, float(int(_492)));
    float3 _1962 = select(_1960, float3(0.0), isnan(_1960));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1962.xy, uint(rint(_1962.z)), _482);
    float3 _1971 = float3(_518, _560, float(int(_492)));
    float3 _1973 = select(_1971, float3(0.0), isnan(_1971));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1973.xy, uint(rint(_1973.z)), _482);
    float3 _1982 = float3(_524, _560, float(int(_492)));
    float3 _1984 = select(_1982, float3(0.0), isnan(_1982));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1984.xy, uint(rint(_1984.z)), _482);
    float _580 = -_190;
    float _582 = _580 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _584 = -_192;
    float _586 = _584 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _588 = _190 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _590 = _190 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _592 = _582 * _582;
    float _594 = _570 + _544;
    float _596 = _190 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _598 = fma(_586, _586, _592);
    float _600 = -_186;
    float _602 = _600 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _604 = _190 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _606 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].x, _590);
    float _608 = _190 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _610 = fma(_602, _602, _598);
    float _612 = _190 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _614 = _190 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _616 = _190 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _618 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].x, _596);
    float _620 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].x, _612);
    float _622 = sqrt(_610);
    float _624 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].x, _614);
    float _626 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[30].z, _606);
    float _628 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[32].z, _620);
    float _630 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].x, _604);
    float _632 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[33].z, _624);
    float _634 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].x, _616);
    float _636 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[25].z, _630);
    float _638 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[26].z, _634);
    bool _640 = _622 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _642 = _622 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _644 = !_640;
    int _646 = _644 ? 0 : 1;
    int _648 = 2;
    if (!_640)
    {
        _648 = 1;
    }
    int _650 = _648;
    int _652 = _650;
    if (!_642)
    {
        _652 = _646;
    }
    int _654 = _652;
    float _656 = _190 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _658 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].x, _608);
    float _660 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].x, _588);
    float _662 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].x, _656);
    float _664 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[28].z, _658);
    float _666 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[29].z, _660);
    float _668 = float(_654);
    float _670 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[27].z, _662);
    float _672 = fma(_516, -1.5, _448);
    float _674 = precise::min(_668, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _676 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[31].z, _618);
    float _678 = _664 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _680 = _674 != 1.0;
    bool _682 = isnan(_674);
    bool _684 = _680 || _682;
    bool _686 = isnan(1.0);
    bool _688 = _684 || _686;
    float _690 = _666 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _692 = _626 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _694 = _690;
    float _696 = _692;
    float _698 = _678;
    if (_688)
    {
        float _700 = _628 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _694 = _700;
    }
    float _702 = _694;
    float _704 = _702;
    if (_688)
    {
        float _706 = _632 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _696 = _706;
    }
    float _708 = _696;
    float _710 = _708;
    if (_688)
    {
        float _712 = _676 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _698 = _712;
    }
    float _714 = _698;
    bool _716 = _674 != 0.0;
    bool _718 = isnan(_674);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = _594 + _568;
    float _728 = _726 + _572;
    float _730 = _728 + _574;
    float _732 = _730 + _576;
    float _734 = _732 + _578;
    float3 _2277 = float3(_522, _560, float(int(_492)));
    float3 _2279 = select(_2277, float3(0.0), isnan(_2277));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2279.xy, uint(rint(_2279.z)), _482);
    float3 _2288 = float3(_520, _560, float(int(_492)));
    float3 _2290 = select(_2288, float3(0.0), isnan(_2288));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2290.xy, uint(rint(_2290.z)), _482);
    float3 _2299 = float3(_518, _672, float(int(_492)));
    float3 _2301 = select(_2299, float3(0.0), isnan(_2299));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2301.xy, uint(rint(_2301.z)), _482);
    float3 _2310 = float3(_524, _672, float(int(_492)));
    float3 _2312 = select(_2310, float3(0.0), isnan(_2310));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2312.xy, uint(rint(_2312.z)), _482);
    float3 _2321 = float3(_522, _672, float(int(_492)));
    float3 _2323 = select(_2321, float3(0.0), isnan(_2321));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2323.xy, uint(rint(_2323.z)), _482);
    float3 _2332 = float3(_520, _672, float(int(_492)));
    float3 _2334 = select(_2332, float3(0.0), isnan(_2332));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2334.xy, uint(rint(_2334.z)), _482);
    float _748 = _714;
    if (!_724)
    {
        float _750 = _670 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _710 = _750;
    }
    float _752 = _710;
    if (!_724)
    {
        float _754 = _636 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _748 = _754;
    }
    float _756 = _748;
    if (!_724)
    {
        float _758 = _638 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _704 = _758;
    }
    float _760 = _704;
    float _762 = rint(_674);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    uint _768 = clamp(_766, 0u, 65535u);
    float _770 = 0.0 + _752;
    float _772 = precise::clamp(_770, 0.0, 1.0);
    float _774 = -_186;
    float _776 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _778 = _774 + _776;
    float _780 = _464 * _772;
    float _782 = _466 * _772;
    float _784 = _778 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _786 = precise::clamp(_784, 0.0, 1.0);
    float _788 = fma(_780, 1.5, _756);
    float _790 = fma(_782, 1.5, _760);
    float _792 = fma(_780, -0.5, _756);
    float _794 = _734 + _736;
    float _796 = _794 + _738;
    float _798 = _796 + _740;
    float _800 = fma(_780, 0.5, _756);
    float _802 = fma(_780, -1.5, _756);
    float _804 = _798 + _742;
    float3 _2433 = float3(_800, _790, float(int(_768)));
    float3 _2435 = select(_2433, float3(0.0), isnan(_2433));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2435.xy, uint(rint(_2435.z)), _772);
    float3 _2444 = float3(_788, _790, float(int(_768)));
    float3 _2446 = select(_2444, float3(0.0), isnan(_2444));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2446.xy, uint(rint(_2446.z)), _772);
    float3 _2455 = float3(_792, _790, float(int(_768)));
    float3 _2457 = select(_2455, float3(0.0), isnan(_2455));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2457.xy, uint(rint(_2457.z)), _772);
    float3 _2466 = float3(_802, _790, float(int(_768)));
    float3 _2468 = select(_2466, float3(0.0), isnan(_2466));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2468.xy, uint(rint(_2468.z)), _772);
    float _814 = fma(_782, 0.5, _760);
    float3 _2480 = float3(_788, _814, float(int(_768)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2482.xy, uint(rint(_2482.z)), _772);
    float3 _2491 = float3(_800, _814, float(int(_768)));
    float3 _2493 = select(_2491, float3(0.0), isnan(_2491));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2493.xy, uint(rint(_2493.z)), _772);
    float3 _2502 = float3(_792, _814, float(int(_768)));
    float3 _2504 = select(_2502, float3(0.0), isnan(_2502));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2504.xy, uint(rint(_2504.z)), _772);
    float _822 = fma(_564, 0.0625, _786);
    float _824 = _804 + _744;
    float _826 = fma(_782, -0.5, _760);
    float3 _2523 = float3(_802, _814, float(int(_768)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2525.xy, uint(rint(_2525.z)), _772);
    float3 _2534 = float3(_788, _826, float(int(_768)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2536.xy, uint(rint(_2536.z)), _772);
    float3 _2545 = float3(_800, _826, float(int(_768)));
    float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2547.xy, uint(rint(_2547.z)), _772);
    float3 _2556 = float3(_792, _826, float(int(_768)));
    float3 _2558 = select(_2556, float3(0.0), isnan(_2556));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2558.xy, uint(rint(_2558.z)), _772);
    float _836 = fma(_782, -1.5, _760);
    float3 _2570 = float3(_802, _826, float(int(_768)));
    float3 _2572 = select(_2570, float3(0.0), isnan(_2570));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2572.xy, uint(rint(_2572.z)), _772);
    float3 _2581 = float3(_788, _836, float(int(_768)));
    float3 _2583 = select(_2581, float3(0.0), isnan(_2581));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2583.xy, uint(rint(_2583.z)), _772);
    float3 _2592 = float3(_800, _836, float(int(_768)));
    float3 _2594 = select(_2592, float3(0.0), isnan(_2592));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2594.xy, uint(rint(_2594.z)), _772);
    float3 _2603 = float3(_792, _836, float(int(_768)));
    float3 _2605 = select(_2603, float3(0.0), isnan(_2603));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2605.xy, uint(rint(_2605.z)), _772);
    float3 _2614 = float3(_802, _836, float(int(_768)));
    float3 _2616 = select(_2614, float3(0.0), isnan(_2614));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2616.xy, uint(rint(_2616.z)), _772);
    float2 _2622 = float2(_54, _56);
    float _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2622, float2(0.0), isnan(_2622))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2622, float2(0.0), isnan(_2622))).x;
    float _850 = _824 + _746;
    float _852 = -_186;
    float _854 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _856 = _852 + _854;
    float _858 = _850 * 0.0625;
    float _860 = _856 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _862 = precise::clamp(_860, 0.0, 1.0);
    float _864 = _808 + _806;
    float _866 = _864 + _810;
    float _868 = _866 + _812;
    float _870 = _868 + _816;
    float _872 = _870 + _818;
    float _874 = _872 + _820;
    float _876 = _874 + _828;
    float _878 = _876 + _830;
    float _880 = _878 + _832;
    float _882 = _880 + _834;
    float _884 = _882 + _838;
    float _886 = _884 + _840;
    float _888 = _886 + _842;
    float _890 = _888 + _844;
    float _892 = _890 + _846;
    float _894 = _892 * 0.0625;
    float _896 = _894 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _898 = fma(_858, (*spvDescriptorSet0.fp_c3)._m0[49].z, _896);
    float _900 = _862 + _898;
    out.m_47.x = _848;
    out.m_47.y = _822;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _900;
    return out;
}

