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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _825 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_825, float2(0.0), isnan(_825)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _842 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_842, float2(0.0), isnan(_842))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
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
    float _182 = rsqrt(_180);
    float _184 = _164 * _182;
    float _186 = _168 * _182;
    float _188 = _176 * _182;
    float _190 = -_70;
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[46].z, _192);
    float _196 = _184 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = _194 * _72;
    float _200 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _202 = _194 * _74;
    float _204 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _206 = abs(_204);
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = abs(_212);
    float _216 = log2(_214);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _220 = exp2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _224 = fma(_184, _222, _198);
    float _226 = fma(_186, _222, _202);
    float _228 = fma(_188, _222, _194);
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].x, _230);
    float _236 = _224 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _234);
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _244 = _224 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _246 = 1.0 / _240;
    float _248 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _242);
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _252 = _250 * _246;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].x, _232);
    float _258 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].x, _244);
    float _260 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _256);
    float _262 = rint(_254);
    float _264 = precise::max(_262, 0.0);
    uint _267 = uint(_264);
    uint _269 = clamp(_267, 0u, 65535u);
    float _271 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, _258);
    float _273 = _260 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _275 = _271 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _277 = _273 * _246;
    float _279 = _275 * _246;
    float _281 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _277);
    float _283 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _279);
    float _285 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _287 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _285, _279);
    float3 _1217 = float3(_283, _281, float(int(_269)));
    float3 _1221 = select(_1217, float3(0.0), isnan(_1217));
    float _289 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1221.xy, uint(rint(_1221.z)), 1.0);
    float3 _1229 = float3(_279, _281, float(int(_269)));
    float3 _1231 = select(_1229, float3(0.0), isnan(_1229));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1231.xy, uint(rint(_1231.z)), 1.0);
    float3 _1239 = float3(_287, _281, float(int(_269)));
    float3 _1241 = select(_1239, float3(0.0), isnan(_1239));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1241.xy, uint(rint(_1241.z)), 1.0);
    float3 _1249 = float3(_283, _277, float(int(_269)));
    float3 _1251 = select(_1249, float3(0.0), isnan(_1249));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1251.xy, uint(rint(_1251.z)), 1.0);
    float _297 = -_198;
    float _299 = _297 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _301 = -_202;
    float _303 = _301 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _305 = _198 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _307 = _299 * _299;
    float _309 = _198 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _311 = fma(_303, _303, _307);
    float _313 = -_194;
    float _315 = _313 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float3 _1295 = float3(_279, _277, float(int(_269)));
    float3 _1297 = select(_1295, float3(0.0), isnan(_1295));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1297.xy, uint(rint(_1297.z)), 1.0);
    float _319 = _198 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _321 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].x, _309);
    float _323 = fma(_315, _315, _311);
    float _325 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].x, _319);
    float _327 = _198 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _329 = _198 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _331 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _333 = sqrt(_323);
    float _335 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _325);
    float _337 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].x, _329);
    float _339 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _341 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _339, _277);
    float _343 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _337);
    bool _347 = _333 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _349 = _333 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _351 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].x, _305);
    bool _353 = !_347;
    int _356 = _353 ? 0 : 1;
    float _358 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _321);
    float _360 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _351);
    float _362 = _360 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    int _364 = 2;
    float _366 = _362;
    if (!_347)
    {
        _364 = 1;
    }
    int _368 = _364;
    int _370 = _368;
    if (!_349)
    {
        _370 = _356;
    }
    int _372 = _370;
    float _374 = _198 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _376 = float(_372);
    float _378 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].x, _374);
    float _380 = _198 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _382 = precise::min(_376, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _384 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _378);
    float _386 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].x, _380);
    float _388 = _198 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _390 = _382 != 1.0;
    bool _392 = isnan(_382);
    bool _394 = _390 || _392;
    bool _396 = isnan(1.0);
    bool _398 = _394 || _396;
    float _400 = _384 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _402 = _382 != 0.0;
    bool _404 = isnan(_382);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _386);
    float _414 = rint(_382);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    uint _420 = clamp(_418, 0u, 65535u);
    float _422 = _400;
    if (_398)
    {
        float _424 = _335 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _366 = _424;
    }
    float _426 = _366;
    float _428 = _426;
    if (_398)
    {
        float _430 = _358 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _422 = _430;
    }
    float _432 = _422;
    float _434 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].x, _327);
    float _436 = _198 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _438 = _412 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _440 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].x, _388);
    float _442 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _434);
    float _444 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].x, _436);
    float _446 = _438;
    float _448 = _432;
    if (!_410)
    {
        float _450 = _343 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _428 = _450;
    }
    float _452 = _428;
    float _454 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _440);
    if (_398)
    {
        float _456 = _442 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _446 = _456;
    }
    float _458 = _446;
    float _460 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _444);
    float _462 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _464 = 0.0 + _452;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = _458;
    if (!_410)
    {
        float _470 = _460 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _468 = _470;
    }
    float _472 = _468;
    if (!_410)
    {
        float _474 = _454 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _448 = _474;
    }
    float _476 = _448;
    float _478 = fma(_466, _462, _472);
    float3 _1599 = float3(_287, _277, float(int(_269)));
    float3 _1601 = select(_1599, float3(0.0), isnan(_1599));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1601.xy, uint(rint(_1601.z)), 1.0);
    float3 _1609 = float3(_283, _341, float(int(_269)));
    float3 _1611 = select(_1609, float3(0.0), isnan(_1609));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1611.xy, uint(rint(_1611.z)), 1.0);
    float3 _1619 = float3(_279, _341, float(int(_269)));
    float3 _1621 = select(_1619, float3(0.0), isnan(_1619));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1621.xy, uint(rint(_1621.z)), 1.0);
    float3 _1629 = float3(_287, _341, float(int(_269)));
    float3 _1631 = select(_1629, float3(0.0), isnan(_1629));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1631.xy, uint(rint(_1631.z)), 1.0);
    float3 _1639 = float3(_476, _478, float(int(_420)));
    float3 _1641 = select(_1639, float3(0.0), isnan(_1639));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1641.xy, uint(rint(_1641.z)), _466);
    float _490 = fma(_466, _331, _476);
    float3 _1654 = float3(_490, _478, float(int(_420)));
    float3 _1656 = select(_1654, float3(0.0), isnan(_1654));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1656.xy, uint(rint(_1656.z)), _466);
    float _494 = -_462;
    float _496 = fma(_466, _494, _472);
    float _498 = _289 + _291;
    float _500 = _498 + _293;
    float _502 = _500 + _295;
    float _504 = -_331;
    float _506 = fma(_466, _504, _476);
    float3 _1686 = float3(_506, _478, float(int(_420)));
    float3 _1688 = select(_1686, float3(0.0), isnan(_1686));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1688.xy, uint(rint(_1688.z)), _466);
    float3 _1697 = float3(_490, _472, float(int(_420)));
    float3 _1699 = select(_1697, float3(0.0), isnan(_1697));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1699.xy, uint(rint(_1699.z)), _466);
    float3 _1708 = float3(_476, _472, float(int(_420)));
    float3 _1710 = select(_1708, float3(0.0), isnan(_1708));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1710.xy, uint(rint(_1710.z)), _466);
    float3 _1719 = float3(_506, _472, float(int(_420)));
    float3 _1721 = select(_1719, float3(0.0), isnan(_1719));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1721.xy, uint(rint(_1721.z)), _466);
    float3 _1730 = float3(_490, _496, float(int(_420)));
    float3 _1732 = select(_1730, float3(0.0), isnan(_1730));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1732.xy, uint(rint(_1732.z)), _466);
    float2 _1738 = float2(_56, _58);
    float2 _520 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1738, float2(0.0), isnan(_1738))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1738, float2(0.0), isnan(_1738))).xy;
    float _522 = _520.x;
    float _524 = _520.y;
    float _526 = -_198;
    float _528 = _526 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _530 = _502 + _317;
    float _532 = -_202;
    float _534 = _532 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _536 = _198 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _538 = _528 * _528;
    float _540 = -_194;
    float _542 = _540 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _544 = fma(_534, _534, _538);
    float _546 = _198 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _548 = _198 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _550 = fma(_542, _542, _544);
    float _552 = _198 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _554 = _198 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _556 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].x, _536);
    float _558 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].x, _552);
    float _560 = sqrt(_550);
    float _562 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _556);
    float _564 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _558);
    float _566 = _562 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _568 = _560 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _570 = _560 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _572 = _198 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _574 = !_568;
    int _576 = _574 ? 0 : 1;
    float _578 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].x, _572);
    float _580 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _578);
    int _582 = 2;
    float _584 = _566;
    if (!_568)
    {
        _582 = 1;
    }
    int _586 = _582;
    int _588 = _586;
    if (!_570)
    {
        _588 = _576;
    }
    int _590 = _588;
    float _592 = _580 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _594 = float(_590);
    float _596 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _546);
    float _598 = precise::min(_594, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _600 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _596);
    bool _602 = _598 != 1.0;
    bool _604 = isnan(_598);
    bool _606 = _602 || _604;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = _598 != 0.0;
    bool _614 = isnan(_598);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _530 + _480;
    float _624 = _622 + _482;
    float _626 = _198 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _628 = _624 + _484;
    float _630 = _492 + _488;
    float _632 = _198 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _634 = _198 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _636 = _628 + _486;
    float _638 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].x, _626);
    float _640 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].x, _632);
    float _642 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].x, _634);
    float _644 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].x, _548);
    float _646 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].x, _554);
    float _648 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _640);
    float _650 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _642);
    float _652 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _644);
    float _654 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _646);
    float _656 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _638);
    float _658 = _648 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _660 = _592;
    float _662 = _658;
    if (_610)
    {
        float _664 = _652 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _660 = _664;
    }
    float _666 = _660;
    float _668 = _666;
    if (!_620)
    {
        float _670 = _654 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _668 = _670;
    }
    float _672 = _668;
    if (_610)
    {
        float _674 = _564 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _662 = _674;
    }
    float _676 = _662;
    float _678 = _676;
    if (_610)
    {
        float _680 = _650 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _584 = _680;
    }
    float _682 = _584;
    float _684 = _682;
    if (!_620)
    {
        float _686 = _600 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _678 = _686;
    }
    float _688 = _678;
    float _690 = 0.0 + _672;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    if (!_620)
    {
        float _694 = _656 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _684 = _694;
    }
    float _696 = _684;
    float _698 = fma(_462, _692, _688);
    float _700 = -_331;
    float _702 = fma(_700, _692, _696);
    float _704 = _630 + _508;
    float _706 = rint(_598);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    uint _712 = clamp(_710, 0u, 65535u);
    float _714 = _704 + _510;
    float _716 = _714 + _512;
    float _718 = _716 + _514;
    float _720 = _718 + _516;
    float _722 = fma(_331, _692, _696);
    float3 _2106 = float3(_476, _496, float(int(_420)));
    float3 _2108 = select(_2106, float3(0.0), isnan(_2106));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2108.xy, uint(rint(_2108.z)), _466);
    float3 _2117 = float3(_506, _496, float(int(_420)));
    float3 _2119 = select(_2117, float3(0.0), isnan(_2117));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2119.xy, uint(rint(_2119.z)), _466);
    float3 _2128 = float3(_696, _698, float(int(_712)));
    float3 _2130 = select(_2128, float3(0.0), isnan(_2128));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2130.xy, uint(rint(_2130.z)), _692);
    float3 _2139 = float3(_722, _698, float(int(_712)));
    float3 _2141 = select(_2139, float3(0.0), isnan(_2139));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2141.xy, uint(rint(_2141.z)), _692);
    float _732 = fma(_522, 2.0, -1.0);
    float _734 = fma(_524, 2.0, -1.0);
    float3 _2156 = float3(_702, _698, float(int(_712)));
    float3 _2158 = select(_2156, float3(0.0), isnan(_2156));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2158.xy, uint(rint(_2158.z)), _692);
    float3 _2167 = float3(_722, _688, float(int(_712)));
    float3 _2169 = select(_2167, float3(0.0), isnan(_2167));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2169.xy, uint(rint(_2169.z)), _692);
    float _740 = _732 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _742 = _734 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _744 = fma(_740, 2.0, _56);
    float _746 = fma(_742, 2.0, _58);
    float3 _2193 = float3(_696, _688, float(int(_712)));
    float3 _2195 = select(_2193, float3(0.0), isnan(_2193));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2195.xy, uint(rint(_2195.z)), _692);
    float _750 = -_462;
    float _752 = fma(_750, _692, _688);
    float3 _2210 = float3(_702, _688, float(int(_712)));
    float3 _2212 = select(_2210, float3(0.0), isnan(_2210));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2212.xy, uint(rint(_2212.z)), _692);
    float3 _2221 = float3(_722, _752, float(int(_712)));
    float3 _2223 = select(_2221, float3(0.0), isnan(_2221));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2223.xy, uint(rint(_2223.z)), _692);
    float3 _2232 = float3(_696, _752, float(int(_712)));
    float3 _2234 = select(_2232, float3(0.0), isnan(_2232));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2234.xy, uint(rint(_2234.z)), _692);
    float3 _2243 = float3(_702, _752, float(int(_712)));
    float3 _2245 = select(_2243, float3(0.0), isnan(_2243));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2245.xy, uint(rint(_2245.z)), _692);
    float2 _2251 = float2(_744, _746);
    float _762 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2251, float2(0.0), isnan(_2251))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2251, float2(0.0), isnan(_2251))).x;
    float _764 = -_194;
    float _766 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _768 = _764 + _766;
    float _770 = _768 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _772 = precise::clamp(_770, 0.0, 1.0);
    float _774 = fma(_636, 0.111111111938953399658203125, _772);
    float _776 = _720 + _724;
    float _778 = _730 + _728;
    float _780 = _776 + _726;
    float _782 = _778 + _736;
    float _784 = _782 + _738;
    float _786 = _784 + _748;
    float _788 = _780 * 0.111111111938953399658203125;
    float _790 = _786 + _754;
    float _792 = _790 + _756;
    float _794 = _792 + _758;
    float _796 = _794 + _760;
    float _798 = _796 * 0.111111111938953399658203125;
    float _800 = _798 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _802 = -_194;
    float _804 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _806 = _802 + _804;
    float _808 = fma(_788, (*spvDescriptorSet0.fp_c3)._m0[49].z, _800);
    float _810 = _806 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _812 = precise::clamp(_810, 0.0, 1.0);
    float _814 = _812 + _808;
    out.m_49.x = _762;
    out.m_49.y = _774;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _814;
    return out;
}

