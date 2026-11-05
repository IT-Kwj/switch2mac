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
    float2 _928 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_928, float2(0.0), isnan(_928)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _945 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_945, float2(0.0), isnan(_945))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_945, float2(0.0), isnan(_945))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _70 * _104;
    float _108 = _74 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _72, _114);
    float _118 = -_108;
    float _120 = fma(_112, _78, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _76, _132);
    float _136 = -_108;
    float _138 = fma(_128, _80, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = -_68;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = _120 * _154;
    float _164 = _124 * _154;
    float _166 = _116 * _154;
    float _168 = 1.0 / _160;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _162 * _170;
    float _178 = _164 * _172;
    float _180 = _166 * _174;
    float _182 = -_176;
    float _184 = fma(_164, _174, _182);
    float _186 = -_178;
    float _188 = fma(_166, _170, _186);
    float _190 = -_180;
    float _192 = fma(_162, _172, _190);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _196 = _168 * _194;
    float _198 = _184 * _184;
    float _200 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _202 = _196 * _70;
    float _204 = fma(_188, _188, _198);
    float _206 = _196 * _74;
    float _208 = -_202;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _212 = fma(_192, _192, _204);
    float _214 = -_206;
    float _216 = _214 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _218 = _202 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _220 = _210 * _210;
    float _222 = -_196;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _226 = _202 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _228 = rsqrt(_212);
    float _230 = fma(_216, _216, _220);
    float _232 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[22].x, _218);
    float _234 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[21].x, _226);
    float _236 = _202 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _238 = fma(_224, _224, _230);
    float _240 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[22].z, _232);
    float _242 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[21].z, _234);
    float _244 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[24].x, _236);
    float _246 = sqrt(_238);
    float _248 = _184 * _228;
    float _250 = _188 * _228;
    float _252 = _192 * _228;
    float _254 = _248 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _256 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].x, _254);
    bool _260 = _246 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _262 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    bool _264 = _246 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _266 = !_260;
    int _269 = _266 ? 0 : 1;
    float _271 = abs(_262);
    float _273 = -_271;
    float _275 = _273 + 1.0;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = abs(_277);
    float _281 = log2(_279);
    int _283 = 2;
    if (!_260)
    {
        _283 = 1;
    }
    int _285 = _283;
    int _287 = _285;
    if (!_264)
    {
        _287 = _269;
    }
    int _289 = _287;
    float _291 = float(_289);
    float _293 = _202 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _295 = precise::min(_291, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _297 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[19].x, _293);
    float _299 = _281 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    bool _301 = _295 != 1.0;
    bool _303 = isnan(_295);
    bool _305 = _301 || _303;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    float _311 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[19].z, _297);
    bool _313 = _295 != 0.0;
    bool _315 = isnan(_295);
    bool _317 = _313 || _315;
    bool _319 = isnan(0.0);
    bool _321 = _317 || _319;
    float _323 = exp2(_299);
    float _325 = _323 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _327 = fma(_248, _325, _202);
    float _329 = fma(_250, _325, _206);
    float _331 = fma(_252, _325, _196);
    float _333 = _311 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _335 = _327 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _337 = _327 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _339 = _202 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _341 = _333;
    if (_309)
    {
        float _343 = _240 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _341 = _343;
    }
    float _345 = _341;
    float _347 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[3].x, _335);
    float _349 = _202 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _351 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[1].x, _337);
    float _353 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[20].x, _339);
    float _355 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[3].z, _347);
    float _357 = _327 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _359 = _327 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _361 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[23].x, _349);
    float _363 = _355 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _365 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[0].x, _357);
    float _367 = fma(_329, (*spvDescriptorSet0.fp_c3)._m0[2].x, _359);
    float _369 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[1].z, _351);
    float _371 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[20].z, _353);
    float _373 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[0].z, _365);
    float _375 = 1.0 / _363;
    float _377 = fma(_331, (*spvDescriptorSet0.fp_c3)._m0[2].z, _367);
    float _379 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[23].z, _361);
    float _381 = _373 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _383 = _369 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _385 = _377 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _387 = _371 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _389 = _387;
    float _391 = _345;
    if (_309)
    {
        float _393 = _379 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _389 = _393;
    }
    float _395 = _389;
    float _397 = _202 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _399 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[17].x, _397);
    float _401 = _385 * _375;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = _381 * _375;
    float _407 = _383 * _375;
    float _409 = _202 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _411 = rint(_403);
    float _413 = precise::max(_411, 0.0);
    uint _416 = uint(_413);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = fma(_200, 0.5, _405);
    float _422 = fma(_200, 1.5, _405);
    float _424 = fma(_200, -0.5, _405);
    float _426 = fma(_200, -1.5, _405);
    float _428 = fma(_82, 1.5, _407);
    float _430 = fma(_82, 0.5, _407);
    float _432 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[16].x, _409);
    float _434 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[17].z, _399);
    float _436 = _242 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _438 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[24].z, _244);
    float _440 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[16].z, _432);
    float3 _1587 = float3(_420, _428, float(int(_418)));
    float3 _1591 = select(_1587, float3(0.0), isnan(_1587));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1591.xy, uint(rint(_1591.z)), 1.0);
    float3 _1599 = float3(_424, _428, float(int(_418)));
    float3 _1601 = select(_1599, float3(0.0), isnan(_1599));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1601.xy, uint(rint(_1601.z)), 1.0);
    float3 _1609 = float3(_422, _428, float(int(_418)));
    float3 _1611 = select(_1609, float3(0.0), isnan(_1609));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1611.xy, uint(rint(_1611.z)), 1.0);
    float3 _1619 = float3(_426, _428, float(int(_418)));
    float3 _1621 = select(_1619, float3(0.0), isnan(_1619));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1621.xy, uint(rint(_1621.z)), 1.0);
    float3 _1629 = float3(_420, _430, float(int(_418)));
    float3 _1631 = select(_1629, float3(0.0), isnan(_1629));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1631.xy, uint(rint(_1631.z)), 1.0);
    float3 _1639 = float3(_422, _430, float(int(_418)));
    float3 _1641 = select(_1639, float3(0.0), isnan(_1639));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1641.xy, uint(rint(_1641.z)), 1.0);
    float3 _1649 = float3(_424, _430, float(int(_418)));
    float3 _1651 = select(_1649, float3(0.0), isnan(_1649));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1651.xy, uint(rint(_1651.z)), 1.0);
    float3 _1659 = float3(_426, _430, float(int(_418)));
    float3 _1661 = select(_1659, float3(0.0), isnan(_1659));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1661.xy, uint(rint(_1661.z)), 1.0);
    float _458 = _395;
    float _460 = _436;
    if (!_321)
    {
        float _462 = _434 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _458 = _462;
    }
    float _464 = _458;
    if (!_321)
    {
        float _466 = _440 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _391 = _466;
    }
    float _468 = _391;
    float _470 = fma(_82, -0.5, _407);
    float _472 = fma(_82, -1.5, _407);
    float _474 = _202 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_309)
    {
        float _476 = _438 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _460 = _476;
    }
    float _478 = _460;
    float _480 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _482 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _484 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[18].x, _474);
    float _486 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[18].z, _484);
    float _488 = _478;
    if (!_321)
    {
        float _490 = _486 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _488 = _490;
    }
    float _492 = _488;
    float3 _1742 = float3(_420, _470, float(int(_418)));
    float3 _1744 = select(_1742, float3(0.0), isnan(_1742));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1744.xy, uint(rint(_1744.z)), 1.0);
    float _496 = 0.0 + _492;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = _446 + _442;
    float _502 = rint(_295);
    float _504 = precise::max(_502, 0.0);
    uint _506 = uint(_504);
    uint _508 = clamp(_506, 0u, 65535u);
    float _510 = _500 + _444;
    float _512 = _510 + _448;
    float3 _1773 = float3(_424, _470, float(int(_418)));
    float3 _1775 = select(_1773, float3(0.0), isnan(_1773));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1775.xy, uint(rint(_1775.z)), 1.0);
    float _516 = _512 + _452;
    float3 _1786 = float3(_422, _470, float(int(_418)));
    float3 _1788 = select(_1786, float3(0.0), isnan(_1786));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1788.xy, uint(rint(_1788.z)), 1.0);
    float _520 = _516 + _450;
    float3 _1799 = float3(_426, _470, float(int(_418)));
    float3 _1801 = select(_1799, float3(0.0), isnan(_1799));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1801.xy, uint(rint(_1801.z)), 1.0);
    float3 _1809 = float3(_422, _472, float(int(_418)));
    float3 _1811 = select(_1809, float3(0.0), isnan(_1809));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1811.xy, uint(rint(_1811.z)), 1.0);
    float3 _1819 = float3(_420, _472, float(int(_418)));
    float3 _1821 = select(_1819, float3(0.0), isnan(_1819));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1821.xy, uint(rint(_1821.z)), 1.0);
    float3 _1829 = float3(_424, _472, float(int(_418)));
    float3 _1831 = select(_1829, float3(0.0), isnan(_1829));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1831.xy, uint(rint(_1831.z)), 1.0);
    float _530 = _498 * _480;
    float _532 = _498 * _482;
    float _534 = fma(_530, 1.5, _468);
    float _536 = fma(_530, -1.5, _468);
    float _538 = fma(_530, -0.5, _468);
    float _540 = fma(_530, 0.5, _468);
    float _542 = fma(_532, 1.5, _464);
    float3 _1860 = float3(_540, _542, float(int(_508)));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1862.xy, uint(rint(_1862.z)), _498);
    float3 _1871 = float3(_538, _542, float(int(_508)));
    float3 _1873 = select(_1871, float3(0.0), isnan(_1871));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1873.xy, uint(rint(_1873.z)), _498);
    float3 _1882 = float3(_536, _542, float(int(_508)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1884.xy, uint(rint(_1884.z)), _498);
    float3 _1893 = float3(_534, _542, float(int(_508)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1895.xy, uint(rint(_1895.z)), _498);
    float3 _1904 = float3(_426, _472, float(int(_418)));
    float3 _1906 = select(_1904, float3(0.0), isnan(_1904));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1906.xy, uint(rint(_1906.z)), 1.0);
    float _554 = _520 + _454;
    float _556 = _554 + _456;
    float _558 = fma(_532, 0.5, _464);
    float3 _1923 = float3(_534, _558, float(int(_508)));
    float3 _1925 = select(_1923, float3(0.0), isnan(_1923));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1925.xy, uint(rint(_1925.z)), _498);
    float _562 = _556 + _518;
    float _564 = _562 + _494;
    float _566 = _564 + _514;
    float _568 = _566 + _522;
    float _570 = _568 + _524;
    float _572 = _570 + _526;
    float _574 = _572 + _528;
    float _576 = fma(_532, -0.5, _464);
    float _578 = _550 + _544;
    float _580 = _574 + _552;
    float _582 = _578 + _546;
    float3 _1967 = float3(_540, _558, float(int(_508)));
    float3 _1969 = select(_1967, float3(0.0), isnan(_1967));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1969.xy, uint(rint(_1969.z)), _498);
    float _586 = _582 + _548;
    float3 _1981 = float3(_538, _558, float(int(_508)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1983.xy, uint(rint(_1983.z)), _498);
    float3 _1992 = float3(_536, _558, float(int(_508)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1994.xy, uint(rint(_1994.z)), _498);
    float3 _2003 = float3(_534, _576, float(int(_508)));
    float3 _2005 = select(_2003, float3(0.0), isnan(_2003));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2005.xy, uint(rint(_2005.z)), _498);
    float3 _2014 = float3(_540, _576, float(int(_508)));
    float3 _2016 = select(_2014, float3(0.0), isnan(_2014));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2016.xy, uint(rint(_2016.z)), _498);
    float _596 = -_202;
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _600 = -_206;
    float _602 = _600 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _604 = _202 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _606 = _202 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _608 = _598 * _598;
    float _610 = _586 + _560;
    float _612 = _202 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _614 = fma(_602, _602, _608);
    float _616 = -_196;
    float _618 = _616 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _620 = _202 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _622 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[30].x, _606);
    float _624 = _202 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _626 = fma(_618, _618, _614);
    float _628 = _202 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _630 = _202 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _632 = _202 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _634 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[31].x, _612);
    float _636 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[32].x, _628);
    float _638 = sqrt(_626);
    float _640 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[33].x, _630);
    float _642 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[30].z, _622);
    float _644 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[32].z, _636);
    float _646 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[25].x, _620);
    float _648 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[33].z, _640);
    float _650 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[26].x, _632);
    float _652 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[25].z, _646);
    float _654 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[26].z, _650);
    bool _656 = _638 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _658 = _638 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _660 = !_656;
    int _662 = _660 ? 0 : 1;
    int _664 = 2;
    if (!_656)
    {
        _664 = 1;
    }
    int _666 = _664;
    int _668 = _666;
    if (!_658)
    {
        _668 = _662;
    }
    int _670 = _668;
    float _672 = _202 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _674 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[28].x, _624);
    float _676 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[29].x, _604);
    float _678 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[27].x, _672);
    float _680 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[28].z, _674);
    float _682 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[29].z, _676);
    float _684 = float(_670);
    float _686 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[27].z, _678);
    float _688 = fma(_532, -1.5, _464);
    float _690 = precise::min(_684, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _692 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[31].z, _634);
    float _694 = _680 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _696 = _690 != 1.0;
    bool _698 = isnan(_690);
    bool _700 = _696 || _698;
    bool _702 = isnan(1.0);
    bool _704 = _700 || _702;
    float _706 = _682 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _708 = _642 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _710 = _706;
    float _712 = _708;
    float _714 = _694;
    if (_704)
    {
        float _716 = _644 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _710 = _716;
    }
    float _718 = _710;
    float _720 = _718;
    if (_704)
    {
        float _722 = _648 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _712 = _722;
    }
    float _724 = _712;
    float _726 = _724;
    if (_704)
    {
        float _728 = _692 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _714 = _728;
    }
    float _730 = _714;
    bool _732 = _690 != 0.0;
    bool _734 = isnan(_690);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = _610 + _584;
    float _744 = _742 + _588;
    float _746 = _744 + _590;
    float _748 = _746 + _592;
    float _750 = _748 + _594;
    float3 _2309 = float3(_538, _576, float(int(_508)));
    float3 _2311 = select(_2309, float3(0.0), isnan(_2309));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2311.xy, uint(rint(_2311.z)), _498);
    float3 _2320 = float3(_536, _576, float(int(_508)));
    float3 _2322 = select(_2320, float3(0.0), isnan(_2320));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2322.xy, uint(rint(_2322.z)), _498);
    float3 _2331 = float3(_534, _688, float(int(_508)));
    float3 _2333 = select(_2331, float3(0.0), isnan(_2331));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2333.xy, uint(rint(_2333.z)), _498);
    float3 _2342 = float3(_540, _688, float(int(_508)));
    float3 _2344 = select(_2342, float3(0.0), isnan(_2342));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2344.xy, uint(rint(_2344.z)), _498);
    float3 _2353 = float3(_538, _688, float(int(_508)));
    float3 _2355 = select(_2353, float3(0.0), isnan(_2353));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2355.xy, uint(rint(_2355.z)), _498);
    float3 _2364 = float3(_536, _688, float(int(_508)));
    float3 _2366 = select(_2364, float3(0.0), isnan(_2364));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2366.xy, uint(rint(_2366.z)), _498);
    float _764 = _730;
    if (!_740)
    {
        float _766 = _686 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _726 = _766;
    }
    float _768 = _726;
    if (!_740)
    {
        float _770 = _652 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _764 = _770;
    }
    float _772 = _764;
    if (!_740)
    {
        float _774 = _654 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _720 = _774;
    }
    float _776 = _720;
    float _778 = rint(_690);
    float _780 = precise::max(_778, 0.0);
    uint _782 = uint(_780);
    uint _784 = clamp(_782, 0u, 65535u);
    float _786 = 0.0 + _768;
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = -_196;
    float _792 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _794 = _790 + _792;
    float _796 = _480 * _788;
    float _798 = _482 * _788;
    float _800 = _794 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _802 = precise::clamp(_800, 0.0, 1.0);
    float _804 = fma(_796, 1.5, _772);
    float _806 = fma(_798, 1.5, _776);
    float _808 = fma(_796, -0.5, _772);
    float _810 = _750 + _752;
    float _812 = _810 + _754;
    float _814 = _812 + _756;
    float _816 = fma(_796, 0.5, _772);
    float _818 = fma(_796, -1.5, _772);
    float _820 = _814 + _758;
    float3 _2465 = float3(_816, _806, float(int(_784)));
    float3 _2467 = select(_2465, float3(0.0), isnan(_2465));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2467.xy, uint(rint(_2467.z)), _788);
    float3 _2476 = float3(_804, _806, float(int(_784)));
    float3 _2478 = select(_2476, float3(0.0), isnan(_2476));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2478.xy, uint(rint(_2478.z)), _788);
    float3 _2487 = float3(_808, _806, float(int(_784)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2489.xy, uint(rint(_2489.z)), _788);
    float3 _2498 = float3(_818, _806, float(int(_784)));
    float3 _2500 = select(_2498, float3(0.0), isnan(_2498));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2500.xy, uint(rint(_2500.z)), _788);
    float _830 = fma(_798, 0.5, _776);
    float3 _2512 = float3(_804, _830, float(int(_784)));
    float3 _2514 = select(_2512, float3(0.0), isnan(_2512));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2514.xy, uint(rint(_2514.z)), _788);
    float3 _2523 = float3(_816, _830, float(int(_784)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2525.xy, uint(rint(_2525.z)), _788);
    float3 _2534 = float3(_808, _830, float(int(_784)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2536.xy, uint(rint(_2536.z)), _788);
    float _838 = fma(_580, 0.0625, _802);
    float _840 = _820 + _760;
    float _842 = fma(_798, -0.5, _776);
    float3 _2555 = float3(_818, _830, float(int(_784)));
    float3 _2557 = select(_2555, float3(0.0), isnan(_2555));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2557.xy, uint(rint(_2557.z)), _788);
    float3 _2566 = float3(_804, _842, float(int(_784)));
    float3 _2568 = select(_2566, float3(0.0), isnan(_2566));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2568.xy, uint(rint(_2568.z)), _788);
    float3 _2577 = float3(_816, _842, float(int(_784)));
    float3 _2579 = select(_2577, float3(0.0), isnan(_2577));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2579.xy, uint(rint(_2579.z)), _788);
    float3 _2588 = float3(_808, _842, float(int(_784)));
    float3 _2590 = select(_2588, float3(0.0), isnan(_2588));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2590.xy, uint(rint(_2590.z)), _788);
    float _852 = fma(_798, -1.5, _776);
    float3 _2602 = float3(_818, _842, float(int(_784)));
    float3 _2604 = select(_2602, float3(0.0), isnan(_2602));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2604.xy, uint(rint(_2604.z)), _788);
    float3 _2613 = float3(_804, _852, float(int(_784)));
    float3 _2615 = select(_2613, float3(0.0), isnan(_2613));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2615.xy, uint(rint(_2615.z)), _788);
    float3 _2624 = float3(_816, _852, float(int(_784)));
    float3 _2626 = select(_2624, float3(0.0), isnan(_2624));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2626.xy, uint(rint(_2626.z)), _788);
    float3 _2635 = float3(_808, _852, float(int(_784)));
    float3 _2637 = select(_2635, float3(0.0), isnan(_2635));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2637.xy, uint(rint(_2637.z)), _788);
    float3 _2646 = float3(_818, _852, float(int(_784)));
    float3 _2648 = select(_2646, float3(0.0), isnan(_2646));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2648.xy, uint(rint(_2648.z)), _788);
    float2 _2654 = float2(_54, _56);
    float _864 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2654, float2(0.0), isnan(_2654))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2654, float2(0.0), isnan(_2654))).x;
    float _866 = _840 + _762;
    float _868 = -_196;
    float _870 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _872 = _868 + _870;
    float _874 = _866 * 0.0625;
    float _876 = _872 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _824 + _822;
    float _882 = _880 + _826;
    float _884 = _882 + _828;
    float _886 = _884 + _832;
    float _888 = _886 + _834;
    float _890 = _888 + _836;
    float _892 = _890 + _844;
    float _894 = _892 + _846;
    float _896 = _894 + _848;
    float _898 = _896 + _850;
    float _900 = _898 + _854;
    float _902 = _900 + _856;
    float _904 = _902 + _858;
    float _906 = _904 + _860;
    float _908 = _906 + _862;
    float _910 = _908 * 0.0625;
    float _912 = _910 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _914 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[49].z, _912);
    float _916 = _878 + _914;
    out.m_47.x = _864;
    out.m_47.y = _838;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _916;
    return out;
}

