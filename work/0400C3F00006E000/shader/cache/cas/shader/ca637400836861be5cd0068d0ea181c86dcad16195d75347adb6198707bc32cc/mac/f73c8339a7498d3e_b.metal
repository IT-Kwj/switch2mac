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
    float2 _841 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_841, float2(0.0), isnan(_841)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _858 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_858, float2(0.0), isnan(_858))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_858, float2(0.0), isnan(_858))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
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
    float _108 = _76 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _74, _114);
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
    float _178 = _162 * _168;
    float _180 = -_172;
    float _182 = fma(_162, _164, _180);
    float _184 = _176 * _176;
    float _186 = -_178;
    float _188 = fma(_158, _166, _186);
    float _190 = -_70;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _194 = fma(_182, _182, _184);
    float _196 = fma(_188, _188, _194);
    float _198 = 1.0 / _192;
    float _200 = rsqrt(_196);
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _204 = _198 * _202;
    float _206 = _204 * _72;
    float _208 = _204 * _76;
    float _210 = _176 * _200;
    float _212 = _182 * _200;
    float _214 = _188 * _200;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[35].z, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = abs(_228);
    float _232 = log2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _236 = exp2(_234);
    float _238 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = fma(_210, _238, _206);
    float _242 = fma(_212, _238, _208);
    float _244 = fma(_214, _238, _204);
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _248 = _240 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].x, _246);
    float _252 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _254 = _240 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _256 = _240 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _264 = _260 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _266 = 1.0 / _262;
    float _268 = _264 * _266;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].x, _254);
    float _274 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].x, _256);
    float _276 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _278 = rint(_270);
    float _280 = precise::max(_278, 0.0);
    uint _283 = uint(_280);
    uint _285 = clamp(_283, 0u, 65535u);
    float _287 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _274);
    float _289 = _276 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _291 = _287 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _293 = _289 * _266;
    float _295 = _291 * _266;
    float _297 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _293);
    float _299 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _295);
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _303 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _301, _295);
    float3 _1249 = float3(_299, _297, float(int(_285)));
    float3 _1253 = select(_1249, float3(0.0), isnan(_1249));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1253.xy, uint(rint(_1253.z)), 1.0);
    float3 _1261 = float3(_295, _297, float(int(_285)));
    float3 _1263 = select(_1261, float3(0.0), isnan(_1261));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1263.xy, uint(rint(_1263.z)), 1.0);
    float3 _1271 = float3(_303, _297, float(int(_285)));
    float3 _1273 = select(_1271, float3(0.0), isnan(_1271));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1273.xy, uint(rint(_1273.z)), 1.0);
    float3 _1281 = float3(_299, _293, float(int(_285)));
    float3 _1283 = select(_1281, float3(0.0), isnan(_1281));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1283.xy, uint(rint(_1283.z)), 1.0);
    float _313 = -_206;
    float _315 = _313 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _317 = -_208;
    float _319 = _317 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _321 = _206 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _323 = _315 * _315;
    float _325 = _206 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _327 = fma(_319, _319, _323);
    float _329 = -_204;
    float _331 = _329 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float3 _1327 = float3(_295, _293, float(int(_285)));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1329.xy, uint(rint(_1329.z)), 1.0);
    float _335 = _206 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _337 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[22].x, _325);
    float _339 = fma(_331, _331, _327);
    float _341 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[24].x, _335);
    float _343 = _206 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _345 = _206 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _347 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _349 = sqrt(_339);
    float _351 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[24].z, _341);
    float _353 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[18].x, _345);
    float _355 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _357 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _355, _293);
    float _359 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[18].z, _353);
    bool _363 = _349 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _365 = _349 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _367 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[21].x, _321);
    bool _369 = !_363;
    int _372 = _369 ? 0 : 1;
    float _374 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[22].z, _337);
    float _376 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[21].z, _367);
    float _378 = _376 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    int _380 = 2;
    float _382 = _378;
    if (!_363)
    {
        _380 = 1;
    }
    int _384 = _380;
    int _386 = _384;
    if (!_365)
    {
        _386 = _372;
    }
    int _388 = _386;
    float _390 = _206 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _392 = float(_388);
    float _394 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[19].x, _390);
    float _396 = _206 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _398 = precise::min(_392, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _400 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[19].z, _394);
    float _402 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[20].x, _396);
    float _404 = _206 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _406 = _398 != 1.0;
    bool _408 = isnan(_398);
    bool _410 = _406 || _408;
    bool _412 = isnan(1.0);
    bool _414 = _410 || _412;
    float _416 = _400 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _418 = _398 != 0.0;
    bool _420 = isnan(_398);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[20].z, _402);
    float _430 = rint(_398);
    float _432 = precise::max(_430, 0.0);
    uint _434 = uint(_432);
    uint _436 = clamp(_434, 0u, 65535u);
    float _438 = _416;
    if (_414)
    {
        float _440 = _351 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _382 = _440;
    }
    float _442 = _382;
    float _444 = _442;
    if (_414)
    {
        float _446 = _374 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _438 = _446;
    }
    float _448 = _438;
    float _450 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[23].x, _343);
    float _452 = _206 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _454 = _428 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _456 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[16].x, _404);
    float _458 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[23].z, _450);
    float _460 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[17].x, _452);
    float _462 = _454;
    float _464 = _448;
    if (!_426)
    {
        float _466 = _359 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _444 = _466;
    }
    float _468 = _444;
    float _470 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[16].z, _456);
    if (_414)
    {
        float _472 = _458 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _462 = _472;
    }
    float _474 = _462;
    float _476 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[17].z, _460);
    float _478 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _480 = 0.0 + _468;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _474;
    if (!_426)
    {
        float _486 = _476 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _484 = _486;
    }
    float _488 = _484;
    if (!_426)
    {
        float _490 = _470 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _464 = _490;
    }
    float _492 = _464;
    float _494 = fma(_482, _478, _488);
    float3 _1631 = float3(_303, _293, float(int(_285)));
    float3 _1633 = select(_1631, float3(0.0), isnan(_1631));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1633.xy, uint(rint(_1633.z)), 1.0);
    float3 _1641 = float3(_299, _357, float(int(_285)));
    float3 _1643 = select(_1641, float3(0.0), isnan(_1641));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1643.xy, uint(rint(_1643.z)), 1.0);
    float3 _1651 = float3(_295, _357, float(int(_285)));
    float3 _1653 = select(_1651, float3(0.0), isnan(_1651));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1653.xy, uint(rint(_1653.z)), 1.0);
    float3 _1661 = float3(_303, _357, float(int(_285)));
    float3 _1663 = select(_1661, float3(0.0), isnan(_1661));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1663.xy, uint(rint(_1663.z)), 1.0);
    float3 _1671 = float3(_492, _494, float(int(_436)));
    float3 _1673 = select(_1671, float3(0.0), isnan(_1671));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1673.xy, uint(rint(_1673.z)), _482);
    float _506 = fma(_482, _347, _492);
    float3 _1686 = float3(_506, _494, float(int(_436)));
    float3 _1688 = select(_1686, float3(0.0), isnan(_1686));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1688.xy, uint(rint(_1688.z)), _482);
    float _510 = -_478;
    float _512 = fma(_482, _510, _488);
    float _514 = _305 + _307;
    float _516 = _514 + _309;
    float _518 = _516 + _311;
    float _520 = -_347;
    float _522 = fma(_482, _520, _492);
    float3 _1718 = float3(_522, _494, float(int(_436)));
    float3 _1720 = select(_1718, float3(0.0), isnan(_1718));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1720.xy, uint(rint(_1720.z)), _482);
    float3 _1729 = float3(_506, _488, float(int(_436)));
    float3 _1731 = select(_1729, float3(0.0), isnan(_1729));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1731.xy, uint(rint(_1731.z)), _482);
    float3 _1740 = float3(_492, _488, float(int(_436)));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1742.xy, uint(rint(_1742.z)), _482);
    float3 _1751 = float3(_522, _488, float(int(_436)));
    float3 _1753 = select(_1751, float3(0.0), isnan(_1751));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1753.xy, uint(rint(_1753.z)), _482);
    float3 _1762 = float3(_506, _512, float(int(_436)));
    float3 _1764 = select(_1762, float3(0.0), isnan(_1762));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1764.xy, uint(rint(_1764.z)), _482);
    float2 _1770 = float2(_56, _58);
    float2 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1770, float2(0.0), isnan(_1770))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1770, float2(0.0), isnan(_1770))).xy;
    float _538 = _536.x;
    float _540 = _536.y;
    float _542 = -_206;
    float _544 = _542 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _546 = _518 + _333;
    float _548 = -_208;
    float _550 = _548 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _552 = _206 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _554 = _544 * _544;
    float _556 = -_204;
    float _558 = _556 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _560 = fma(_550, _550, _554);
    float _562 = _206 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _564 = _206 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _566 = fma(_558, _558, _560);
    float _568 = _206 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _570 = _206 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _572 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[28].x, _552);
    float _574 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[32].x, _568);
    float _576 = sqrt(_566);
    float _578 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[28].z, _572);
    float _580 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[32].z, _574);
    float _582 = _578 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    bool _584 = _576 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _586 = _576 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _588 = _206 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _590 = !_584;
    int _592 = _590 ? 0 : 1;
    float _594 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[30].x, _588);
    float _596 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[30].z, _594);
    int _598 = 2;
    float _600 = _582;
    if (!_584)
    {
        _598 = 1;
    }
    int _602 = _598;
    int _604 = _602;
    if (!_586)
    {
        _604 = _592;
    }
    int _606 = _604;
    float _608 = _596 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _610 = float(_606);
    float _612 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[26].x, _562);
    float _614 = precise::min(_610, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _616 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].z, _612);
    bool _618 = _614 != 1.0;
    bool _620 = isnan(_614);
    bool _622 = _618 || _620;
    bool _624 = isnan(1.0);
    bool _626 = _622 || _624;
    bool _628 = _614 != 0.0;
    bool _630 = isnan(_614);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = _546 + _496;
    float _640 = _638 + _498;
    float _642 = _206 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _644 = _640 + _500;
    float _646 = _508 + _504;
    float _648 = _206 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _650 = _206 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _652 = _644 + _502;
    float _654 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[25].x, _642);
    float _656 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[29].x, _648);
    float _658 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[31].x, _650);
    float _660 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[33].x, _564);
    float _662 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[27].x, _570);
    float _664 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[29].z, _656);
    float _666 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[31].z, _658);
    float _668 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[33].z, _660);
    float _670 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[27].z, _662);
    float _672 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[25].z, _654);
    float _674 = _664 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _676 = _608;
    float _678 = _674;
    if (_626)
    {
        float _680 = _668 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _676 = _680;
    }
    float _682 = _676;
    float _684 = _682;
    if (!_636)
    {
        float _686 = _670 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _684 = _686;
    }
    float _688 = _684;
    if (_626)
    {
        float _690 = _580 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _678 = _690;
    }
    float _692 = _678;
    float _694 = _692;
    if (_626)
    {
        float _696 = _666 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _600 = _696;
    }
    float _698 = _600;
    float _700 = _698;
    if (!_636)
    {
        float _702 = _616 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _694 = _702;
    }
    float _704 = _694;
    float _706 = 0.0 + _688;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    if (!_636)
    {
        float _710 = _672 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _700 = _710;
    }
    float _712 = _700;
    float _714 = fma(_478, _708, _704);
    float _716 = -_347;
    float _718 = fma(_716, _708, _712);
    float _720 = _646 + _524;
    float _722 = rint(_614);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    uint _728 = clamp(_726, 0u, 65535u);
    float _730 = _720 + _526;
    float _732 = _730 + _528;
    float _734 = _732 + _530;
    float _736 = _734 + _532;
    float _738 = fma(_347, _708, _712);
    float3 _2138 = float3(_492, _512, float(int(_436)));
    float3 _2140 = select(_2138, float3(0.0), isnan(_2138));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2140.xy, uint(rint(_2140.z)), _482);
    float3 _2149 = float3(_522, _512, float(int(_436)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2151.xy, uint(rint(_2151.z)), _482);
    float3 _2160 = float3(_712, _714, float(int(_728)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2162.xy, uint(rint(_2162.z)), _708);
    float3 _2171 = float3(_738, _714, float(int(_728)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2173.xy, uint(rint(_2173.z)), _708);
    float _748 = fma(_538, 2.0, -1.0);
    float _750 = fma(_540, 2.0, -1.0);
    float3 _2188 = float3(_718, _714, float(int(_728)));
    float3 _2190 = select(_2188, float3(0.0), isnan(_2188));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2190.xy, uint(rint(_2190.z)), _708);
    float3 _2199 = float3(_738, _704, float(int(_728)));
    float3 _2201 = select(_2199, float3(0.0), isnan(_2199));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2201.xy, uint(rint(_2201.z)), _708);
    float _756 = _748 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _758 = _750 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _760 = fma(_756, 2.0, _56);
    float _762 = fma(_758, 2.0, _58);
    float3 _2225 = float3(_712, _704, float(int(_728)));
    float3 _2227 = select(_2225, float3(0.0), isnan(_2225));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2227.xy, uint(rint(_2227.z)), _708);
    float _766 = -_478;
    float _768 = fma(_766, _708, _704);
    float3 _2242 = float3(_718, _704, float(int(_728)));
    float3 _2244 = select(_2242, float3(0.0), isnan(_2242));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2244.xy, uint(rint(_2244.z)), _708);
    float3 _2253 = float3(_738, _768, float(int(_728)));
    float3 _2255 = select(_2253, float3(0.0), isnan(_2253));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2255.xy, uint(rint(_2255.z)), _708);
    float3 _2264 = float3(_712, _768, float(int(_728)));
    float3 _2266 = select(_2264, float3(0.0), isnan(_2264));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2266.xy, uint(rint(_2266.z)), _708);
    float3 _2275 = float3(_718, _768, float(int(_728)));
    float3 _2277 = select(_2275, float3(0.0), isnan(_2275));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2277.xy, uint(rint(_2277.z)), _708);
    float2 _2283 = float2(_760, _762);
    float _778 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2283, float2(0.0), isnan(_2283))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2283, float2(0.0), isnan(_2283))).x;
    float _780 = -_204;
    float _782 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _784 = _780 + _782;
    float _786 = _784 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = fma(_652, 0.111111111938953399658203125, _788);
    float _792 = _736 + _740;
    float _794 = _746 + _744;
    float _796 = _792 + _742;
    float _798 = _794 + _752;
    float _800 = _798 + _754;
    float _802 = _800 + _764;
    float _804 = _796 * 0.111111111938953399658203125;
    float _806 = _802 + _770;
    float _808 = _806 + _772;
    float _810 = _808 + _774;
    float _812 = _810 + _776;
    float _814 = _812 * 0.111111111938953399658203125;
    float _816 = _814 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _818 = -_204;
    float _820 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _822 = _818 + _820;
    float _824 = fma(_804, (*spvDescriptorSet0.fp_c3)._m0[49].z, _816);
    float _826 = _822 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _828 = precise::clamp(_826, 0.0, 1.0);
    float _830 = _828 + _824;
    out.m_49.x = _778;
    out.m_49.y = _790;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _830;
    return out;
}

