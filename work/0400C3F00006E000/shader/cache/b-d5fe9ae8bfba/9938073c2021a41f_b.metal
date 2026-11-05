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
    texture2d_array<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
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
    float2 _949 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_949, float2(0.0), isnan(_949)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _966 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_966, float2(0.0), isnan(_966))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_966, float2(0.0), isnan(_966))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_66;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _72 * _104;
    float _108 = _74 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _76, _114);
    float _118 = -_108;
    float _120 = fma(_112, _80, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _78, _132);
    float _136 = -_108;
    float _138 = fma(_128, _82, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = _120 * _154;
    float _160 = _124 * _154;
    float _162 = _116 * _154;
    float _164 = _144 * _156;
    float _166 = _134 * _156;
    float _168 = _138 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_170;
    float _176 = fma(_160, _168, _174);
    float _178 = -_70;
    float _180 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _182 = -_172;
    float _184 = fma(_162, _164, _182);
    float _186 = _162 * _168;
    float _188 = _176 * _176;
    float _190 = -_186;
    float _192 = fma(_158, _166, _190);
    float _194 = fma(_184, _184, _188);
    float _196 = 1.0 / _180;
    float _198 = fma(_192, _192, _194);
    float _200 = rsqrt(_198);
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _204 = _196 * _202;
    float _206 = _204 * _72;
    float _208 = _204 * _74;
    float _210 = -_206;
    float _212 = _210 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _214 = _176 * _200;
    float _216 = _184 * _200;
    float _218 = _192 * _200;
    float _220 = -_208;
    float _222 = _220 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _224 = _214 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _226 = _212 * _212;
    float _228 = -_204;
    float _230 = _228 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _232 = _206 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _234 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].x, _224);
    float _236 = fma(_222, _222, _226);
    float _238 = _206 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _240 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[22].x, _232);
    float _242 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].z, _234);
    float _244 = fma(_230, _230, _236);
    float _246 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[23].x, _238);
    float _248 = _206 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _250 = abs(_242);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _206 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _260 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[23].z, _246);
    float _262 = sqrt(_244);
    float _264 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[24].x, _248);
    float _266 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[17].x, _258);
    float _268 = _206 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _270 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[24].z, _264);
    float _272 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[17].z, _266);
    float _274 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[21].x, _268);
    float _276 = abs(_256);
    float _278 = log2(_276);
    float _280 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[21].z, _274);
    bool _284 = _262 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _286 = _262 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _288 = !_284;
    int _291 = _288 ? 0 : 1;
    float _293 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    int _295 = 2;
    if (!_284)
    {
        _295 = 1;
    }
    int _297 = _295;
    float _299 = exp2(_293);
    int _301 = _297;
    if (!_286)
    {
        _301 = _291;
    }
    int _303 = _301;
    float _305 = float(_303);
    float _307 = precise::min(_305, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _309 = _206 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _311 = _307 != 1.0;
    bool _313 = isnan(_307);
    bool _315 = _311 || _313;
    bool _317 = isnan(1.0);
    bool _319 = _315 || _317;
    float _321 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[19].x, _309);
    bool _323 = _307 != 0.0;
    bool _325 = isnan(_307);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = _299 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _335 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[19].z, _321);
    float _337 = fma(_214, _333, _206);
    float _339 = fma(_216, _333, _208);
    float _341 = fma(_218, _333, _204);
    float _343 = _335 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _345 = _337 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _347 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[22].z, _240);
    float _349 = _206 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _351 = fma(_339, (*spvDescriptorSet0.fp_c3)._m0[3].x, _345);
    float _353 = _343;
    if (_319)
    {
        float _355 = _347 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _353 = _355;
    }
    float _357 = _353;
    float _359 = _337 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _361 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[20].x, _349);
    float _363 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[3].z, _351);
    float _365 = _337 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _367 = _337 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _369 = fma(_339, (*spvDescriptorSet0.fp_c3)._m0[1].x, _359);
    float _371 = _363 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _373 = fma(_339, (*spvDescriptorSet0.fp_c3)._m0[0].x, _365);
    float _375 = fma(_339, (*spvDescriptorSet0.fp_c3)._m0[2].x, _367);
    float _377 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[1].z, _369);
    float _379 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[0].z, _373);
    float _381 = 1.0 / _371;
    float _383 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[2].z, _375);
    float _385 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[20].z, _361);
    float _387 = _379 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _389 = _377 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _391 = _383 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _393 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _395 = _385 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _397 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _399 = _395;
    float _401 = _357;
    if (_319)
    {
        float _403 = _260 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _399 = _403;
    }
    float _405 = _399;
    float _407 = _391 * _381;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = _387 * _381;
    float _413 = _389 * _381;
    float _415 = _206 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _417 = fma(_393, 0.5, _411);
    float _419 = rint(_409);
    float _421 = precise::max(_419, 0.0);
    uint _424 = uint(_421);
    uint _426 = clamp(_424, 0u, 65535u);
    float _428 = fma(_393, 1.5, _411);
    float _430 = fma(_393, -0.5, _411);
    float _432 = fma(_393, -1.5, _411);
    float _434 = fma(_397, 1.5, _413);
    float _436 = fma(_397, 0.5, _413);
    float _438 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[16].x, _415);
    float _440 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[16].z, _438);
    float _442 = _280 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float3 _1608 = float3(_417, _434, float(int(_426)));
    float3 _1612 = select(_1608, float3(0.0), isnan(_1608));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1612.xy, uint(rint(_1612.z)), 1.0);
    float3 _1620 = float3(_430, _434, float(int(_426)));
    float3 _1622 = select(_1620, float3(0.0), isnan(_1620));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1622.xy, uint(rint(_1622.z)), 1.0);
    float3 _1630 = float3(_428, _434, float(int(_426)));
    float3 _1632 = select(_1630, float3(0.0), isnan(_1630));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1632.xy, uint(rint(_1632.z)), 1.0);
    float3 _1640 = float3(_432, _434, float(int(_426)));
    float3 _1642 = select(_1640, float3(0.0), isnan(_1640));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1642.xy, uint(rint(_1642.z)), 1.0);
    float3 _1650 = float3(_428, _436, float(int(_426)));
    float3 _1652 = select(_1650, float3(0.0), isnan(_1650));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1652.xy, uint(rint(_1652.z)), 1.0);
    float3 _1660 = float3(_417, _436, float(int(_426)));
    float3 _1662 = select(_1660, float3(0.0), isnan(_1660));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1662.xy, uint(rint(_1662.z)), 1.0);
    float3 _1670 = float3(_430, _436, float(int(_426)));
    float3 _1672 = select(_1670, float3(0.0), isnan(_1670));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1672.xy, uint(rint(_1672.z)), 1.0);
    float3 _1680 = float3(_432, _436, float(int(_426)));
    float3 _1682 = select(_1680, float3(0.0), isnan(_1680));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1682.xy, uint(rint(_1682.z)), 1.0);
    float _460 = _405;
    float _462 = _442;
    if (!_331)
    {
        float _464 = _440 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _401 = _464;
    }
    float _466 = _401;
    float _468 = fma(_397, -0.5, _413);
    float _470 = fma(_397, -1.5, _413);
    float _472 = _206 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (!_331)
    {
        float _474 = _272 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _460 = _474;
    }
    float _476 = _460;
    float _478 = rint(_307);
    float _480 = precise::max(_478, 0.0);
    uint _482 = uint(_480);
    uint _484 = clamp(_482, 0u, 65535u);
    float _486 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[18].x, _472);
    if (_319)
    {
        float _488 = _270 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _462 = _488;
    }
    float _490 = _462;
    float _492 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _494 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _496 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[18].z, _486);
    float _498 = _490;
    if (!_331)
    {
        float _500 = _496 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = 0.0 + _502;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = _448 + _444;
    float _510 = _508 + _446;
    float _512 = _510 + _450;
    float _514 = _512 + _452;
    float3 _1787 = float3(_428, _468, float(int(_426)));
    float3 _1789 = select(_1787, float3(0.0), isnan(_1787));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1789.xy, uint(rint(_1789.z)), 1.0);
    float3 _1797 = float3(_417, _468, float(int(_426)));
    float3 _1799 = select(_1797, float3(0.0), isnan(_1797));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1799.xy, uint(rint(_1799.z)), 1.0);
    float3 _1807 = float3(_430, _468, float(int(_426)));
    float3 _1809 = select(_1807, float3(0.0), isnan(_1807));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1809.xy, uint(rint(_1809.z)), 1.0);
    float3 _1817 = float3(_432, _468, float(int(_426)));
    float3 _1819 = select(_1817, float3(0.0), isnan(_1817));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1819.xy, uint(rint(_1819.z)), 1.0);
    float _524 = _506 * _494;
    float3 _1830 = float3(_428, _470, float(int(_426)));
    float3 _1832 = select(_1830, float3(0.0), isnan(_1830));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1832.xy, uint(rint(_1832.z)), 1.0);
    float3 _1840 = float3(_417, _470, float(int(_426)));
    float3 _1842 = select(_1840, float3(0.0), isnan(_1840));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1842.xy, uint(rint(_1842.z)), 1.0);
    float3 _1850 = float3(_430, _470, float(int(_426)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1852.xy, uint(rint(_1852.z)), 1.0);
    float3 _1860 = float3(_432, _470, float(int(_426)));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1862.xy, uint(rint(_1862.z)), 1.0);
    float _534 = fma(_524, 1.5, _476);
    float _536 = _506 * _492;
    float _538 = fma(_536, 0.5, _466);
    float _540 = fma(_536, 1.5, _466);
    float3 _1882 = float3(_538, _534, float(int(_484)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1884.xy, uint(rint(_1884.z)), _506);
    float3 _1893 = float3(_540, _534, float(int(_484)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1895.xy, uint(rint(_1895.z)), _506);
    float _546 = _514 + _454;
    float _548 = fma(_536, -0.5, _466);
    float _550 = _546 + _456;
    float _552 = _550 + _458;
    float _554 = _552 + _516;
    float _556 = _554 + _518;
    float _558 = _556 + _520;
    float _560 = _558 + _522;
    float _562 = _560 + _526;
    float _564 = _562 + _528;
    float3 _1934 = float3(_548, _534, float(int(_484)));
    float3 _1936 = select(_1934, float3(0.0), isnan(_1934));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1936.xy, uint(rint(_1936.z)), _506);
    float _568 = _564 + _530;
    float _570 = fma(_536, -1.5, _466);
    float _572 = fma(_524, 0.5, _476);
    float _574 = _544 + _542;
    float3 _1957 = float3(_570, _534, float(int(_484)));
    float3 _1959 = select(_1957, float3(0.0), isnan(_1957));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1959.xy, uint(rint(_1959.z)), _506);
    float _578 = _568 + _532;
    float _580 = fma(_524, -0.5, _476);
    float3 _1974 = float3(_540, _572, float(int(_484)));
    float3 _1976 = select(_1974, float3(0.0), isnan(_1974));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1976.xy, uint(rint(_1976.z)), _506);
    float3 _1985 = float3(_538, _572, float(int(_484)));
    float3 _1987 = select(_1985, float3(0.0), isnan(_1985));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1987.xy, uint(rint(_1987.z)), _506);
    float3 _1996 = float3(_548, _572, float(int(_484)));
    float3 _1998 = select(_1996, float3(0.0), isnan(_1996));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1998.xy, uint(rint(_1998.z)), _506);
    float3 _2007 = float3(_570, _572, float(int(_484)));
    float3 _2009 = select(_2007, float3(0.0), isnan(_2007));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2009.xy, uint(rint(_2009.z)), _506);
    float3 _2018 = float3(_540, _580, float(int(_484)));
    float3 _2020 = select(_2018, float3(0.0), isnan(_2018));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2020.xy, uint(rint(_2020.z)), _506);
    float3 _2029 = float3(_538, _580, float(int(_484)));
    float3 _2031 = select(_2029, float3(0.0), isnan(_2029));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2031.xy, uint(rint(_2031.z)), _506);
    float3 _2040 = float3(_548, _580, float(int(_484)));
    float3 _2042 = select(_2040, float3(0.0), isnan(_2040));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2042.xy, uint(rint(_2042.z)), _506);
    float _596 = _574 + _566;
    float _598 = _596 + _576;
    float _600 = _598 + _582;
    float _602 = fma(_524, -1.5, _476);
    float3 _2063 = float3(_570, _580, float(int(_484)));
    float3 _2065 = select(_2063, float3(0.0), isnan(_2063));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2065.xy, uint(rint(_2065.z)), _506);
    float _606 = _600 + _584;
    float3 _2077 = float3(_540, _602, float(int(_484)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _608 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2079.xy, uint(rint(_2079.z)), _506);
    float _610 = _606 + _586;
    float _612 = _610 + _588;
    float3 _2094 = float3(_538, _602, float(int(_484)));
    float3 _2096 = select(_2094, float3(0.0), isnan(_2094));
    float _614 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2096.xy, uint(rint(_2096.z)), _506);
    float _616 = _612 + _590;
    float3 _2108 = float3(_548, _602, float(int(_484)));
    float3 _2110 = select(_2108, float3(0.0), isnan(_2108));
    float _618 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2110.xy, uint(rint(_2110.z)), _506);
    float _620 = -_206;
    float _622 = _620 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _624 = -_208;
    float _626 = _624 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _628 = _206 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _630 = _206 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _632 = _622 * _622;
    float _634 = _206 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _636 = _206 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _638 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[28].x, _628);
    float _640 = fma(_626, _626, _632);
    float _642 = -_204;
    float _644 = _642 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _646 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[30].x, _630);
    float _648 = _206 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _650 = fma(_644, _644, _640);
    float _652 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[33].x, _634);
    float _654 = _616 + _592;
    float _656 = _206 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _658 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[27].x, _636);
    float _660 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[28].z, _638);
    float _662 = sqrt(_650);
    float _664 = _206 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _666 = _206 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _668 = _206 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _670 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[30].z, _646);
    float _672 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[25].x, _648);
    float _674 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[33].z, _652);
    float _676 = _654 + _594;
    float _678 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[26].x, _656);
    float _680 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[27].z, _658);
    float _682 = _660 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _684 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[29].x, _664);
    float _686 = _670 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _688 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[31].x, _666);
    float _690 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[32].x, _668);
    float _692 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[29].z, _684);
    bool _694 = _662 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _696 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[31].z, _688);
    bool _698 = _662 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _700 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[32].z, _690);
    bool _702 = !_694;
    int _704 = _702 ? 0 : 1;
    float _706 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[25].z, _672);
    float _708 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].z, _678);
    float _710 = _692 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _712 = 2;
    float _714 = _686;
    float _716 = _682;
    float _718 = _710;
    if (!_694)
    {
        _712 = 1;
    }
    int _720 = _712;
    int _722 = _720;
    if (!_698)
    {
        _722 = _704;
    }
    int _724 = _722;
    float _726 = float(_724);
    float _728 = precise::min(_726, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _730 = _728 != 1.0;
    bool _732 = isnan(_728);
    bool _734 = _730 || _732;
    bool _736 = isnan(1.0);
    bool _738 = _734 || _736;
    float _740 = rint(_728);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    uint _746 = clamp(_744, 0u, 65535u);
    bool _748 = _728 != 0.0;
    bool _750 = isnan(_728);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    if (_738)
    {
        float _758 = _674 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _714 = _758;
    }
    float _760 = _714;
    float _762 = _760;
    if (_738)
    {
        float _764 = _696 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _716 = _764;
    }
    float _766 = _716;
    float _768 = _766;
    if (!_756)
    {
        float _770 = _680 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _762 = _770;
    }
    float _772 = _762;
    if (_738)
    {
        float _774 = _700 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _718 = _774;
    }
    float _776 = _718;
    float _778 = _776;
    if (!_756)
    {
        float _780 = _706 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _768 = _780;
    }
    float _782 = _768;
    if (!_756)
    {
        float _784 = _708 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _778 = _784;
    }
    float _786 = _778;
    float _788 = 0.0 + _772;
    float _790 = precise::clamp(_788, 0.0, 1.0);
    float _792 = -_204;
    float _794 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _796 = _792 + _794;
    float _798 = _492 * _790;
    float _800 = _494 * _790;
    float _802 = _796 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = fma(_798, 0.5, _782);
    float _808 = fma(_800, 1.5, _786);
    float _810 = fma(_798, 1.5, _782);
    float _812 = fma(_800, 0.5, _786);
    float _814 = _676 + _604;
    float _816 = _814 + _608;
    float _818 = fma(_798, -0.5, _782);
    float _820 = fma(_798, -1.5, _782);
    float _822 = _816 + _614;
    float _824 = _822 + _618;
    float3 _2481 = float3(_570, _602, float(int(_484)));
    float3 _2483 = select(_2481, float3(0.0), isnan(_2481));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2483.xy, uint(rint(_2483.z)), _506);
    float3 _2492 = float3(_806, _808, float(int(_746)));
    float3 _2494 = select(_2492, float3(0.0), isnan(_2492));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2494.xy, uint(rint(_2494.z)), _790);
    float3 _2503 = float3(_810, _808, float(int(_746)));
    float3 _2505 = select(_2503, float3(0.0), isnan(_2503));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2505.xy, uint(rint(_2505.z)), _790);
    float3 _2514 = float3(_818, _808, float(int(_746)));
    float3 _2516 = select(_2514, float3(0.0), isnan(_2514));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2516.xy, uint(rint(_2516.z)), _790);
    float3 _2525 = float3(_820, _808, float(int(_746)));
    float3 _2527 = select(_2525, float3(0.0), isnan(_2525));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2527.xy, uint(rint(_2527.z)), _790);
    float3 _2536 = float3(_810, _812, float(int(_746)));
    float3 _2538 = select(_2536, float3(0.0), isnan(_2536));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2538.xy, uint(rint(_2538.z)), _790);
    float3 _2547 = float3(_806, _812, float(int(_746)));
    float3 _2549 = select(_2547, float3(0.0), isnan(_2547));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2549.xy, uint(rint(_2549.z)), _790);
    float _840 = fma(_578, 0.0625, _804);
    float _842 = fma(_800, -0.5, _786);
    float3 _2565 = float3(_818, _812, float(int(_746)));
    float3 _2567 = select(_2565, float3(0.0), isnan(_2565));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2567.xy, uint(rint(_2567.z)), _790);
    float _846 = _824 + _826;
    float _848 = _830 + _828;
    float _850 = _848 + _832;
    float _852 = _850 + _834;
    float _854 = fma(_800, -1.5, _786);
    float2 _2588 = float2(_56, _58);
    float2 _858 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2588, float2(0.0), isnan(_2588))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2588, float2(0.0), isnan(_2588))).xy;
    float _860 = _858.x;
    float _862 = _858.y;
    float3 _2603 = float3(_820, _812, float(int(_746)));
    float3 _2605 = select(_2603, float3(0.0), isnan(_2603));
    float _864 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2605.xy, uint(rint(_2605.z)), _790);
    float3 _2614 = float3(_810, _842, float(int(_746)));
    float3 _2616 = select(_2614, float3(0.0), isnan(_2614));
    float _866 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2616.xy, uint(rint(_2616.z)), _790);
    float _868 = _852 + _836;
    float3 _2628 = float3(_806, _842, float(int(_746)));
    float3 _2630 = select(_2628, float3(0.0), isnan(_2628));
    float _870 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2630.xy, uint(rint(_2630.z)), _790);
    float3 _2639 = float3(_818, _842, float(int(_746)));
    float3 _2641 = select(_2639, float3(0.0), isnan(_2639));
    float _872 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2641.xy, uint(rint(_2641.z)), _790);
    float3 _2650 = float3(_820, _842, float(int(_746)));
    float3 _2652 = select(_2650, float3(0.0), isnan(_2650));
    float _874 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2652.xy, uint(rint(_2652.z)), _790);
    float _876 = _868 + _838;
    float _878 = fma(_860, 2.0, -1.0);
    float _880 = fma(_862, 2.0, -1.0);
    float _882 = _878 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _884 = _880 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _886 = _876 + _844;
    float _888 = fma(_882, 2.0, _56);
    float _890 = fma(_884, 2.0, _58);
    float3 _2688 = float3(_810, _854, float(int(_746)));
    float3 _2690 = select(_2688, float3(0.0), isnan(_2688));
    float _892 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2690.xy, uint(rint(_2690.z)), _790);
    float3 _2699 = float3(_806, _854, float(int(_746)));
    float3 _2701 = select(_2699, float3(0.0), isnan(_2699));
    float _894 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2701.xy, uint(rint(_2701.z)), _790);
    float3 _2710 = float3(_818, _854, float(int(_746)));
    float3 _2712 = select(_2710, float3(0.0), isnan(_2710));
    float _896 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2712.xy, uint(rint(_2712.z)), _790);
    float3 _2721 = float3(_820, _854, float(int(_746)));
    float3 _2723 = select(_2721, float3(0.0), isnan(_2721));
    float _898 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2723.xy, uint(rint(_2723.z)), _790);
    float2 _2729 = float2(_888, _890);
    float _900 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2729, float2(0.0), isnan(_2729))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2729, float2(0.0), isnan(_2729))).x;
    float _902 = _886 + _864;
    float _904 = _846 * 0.0625;
    float _906 = _902 + _866;
    float _908 = _906 + _870;
    float _910 = _908 + _872;
    float _912 = _910 + _874;
    float _914 = -_204;
    float _916 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _918 = _914 + _916;
    float _920 = _918 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _922 = precise::clamp(_920, 0.0, 1.0);
    float _924 = _912 + _892;
    float _926 = _924 + _894;
    float _928 = _926 + _896;
    float _930 = _928 + _898;
    float _932 = _930 * 0.0625;
    float _934 = _932 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _936 = fma(_904, (*spvDescriptorSet0.fp_c3)._m0[49].z, _934);
    float _938 = _922 + _936;
    out.m_49.x = _900;
    out.m_49.y = _840;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _938;
    return out;
}

