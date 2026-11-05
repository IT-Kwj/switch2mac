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
    float2 _821 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_821, float2(0.0), isnan(_821)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _838 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_838, float2(0.0), isnan(_838))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_838, float2(0.0), isnan(_838))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _86 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = -_68;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = _72 * _92;
    float _108 = _74 * _92;
    float _110 = -_106;
    float _112 = fma(_98, _76, _110);
    float _114 = -_106;
    float _116 = fma(_104, _78, _114);
    float _118 = -_108;
    float _120 = fma(_98, _80, _118);
    float _122 = -_108;
    float _124 = fma(_104, _82, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_92;
    float _132 = _130 + _98;
    float _134 = -_92;
    float _136 = _134 + _104;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = fma(_132, _132, _138);
    float _144 = fma(_136, _136, _140);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _120 * _146;
    float _152 = _132 * _146;
    float _154 = _112 * _146;
    float _156 = _136 * _148;
    float _158 = _116 * _148;
    float _160 = _124 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _158;
    float _166 = -_162;
    float _168 = fma(_152, _160, _166);
    float _170 = _154 * _160;
    float _172 = -_164;
    float _174 = fma(_154, _156, _172);
    float _176 = _168 * _168;
    float _178 = -_170;
    float _180 = fma(_150, _158, _178);
    float _182 = fma(_174, _174, _176);
    float _184 = fma(_180, _180, _182);
    float _186 = rsqrt(_184);
    float _188 = _168 * _186;
    float _190 = _174 * _186;
    float _192 = _180 * _186;
    float _194 = _188 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].x, _194);
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].z, _196);
    float _200 = abs(_198);
    float _202 = -_200;
    float _204 = _202 + 1.0;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = abs(_206);
    float _210 = log2(_208);
    float _212 = -_70;
    float _214 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _216 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[46].z, _214);
    float _218 = _216 * _72;
    float _220 = _216 * _74;
    float _222 = -_218;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _226 = -_220;
    float _228 = _226 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _230 = _218 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _232 = _218 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _234 = _224 * _224;
    float _236 = -_216;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _240 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _242 = fma(_228, _228, _234);
    float _244 = fma(_238, _238, _242);
    float _246 = exp2(_240);
    float _248 = sqrt(_244);
    float _250 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _252 = fma(_188, _250, _218);
    float _254 = fma(_190, _250, _220);
    float _256 = fma(_192, _250, _216);
    float _258 = _252 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _260 = _252 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _264 = _248 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _266 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].x, _258);
    float _268 = _252 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _270 = _252 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    bool _272 = _248 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _274 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].z, _266);
    float _276 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _278 = _274 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _280 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].x, _268);
    float _282 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].x, _270);
    bool _284 = !_264;
    int _287 = _284 ? 0 : 1;
    float _289 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].z, _276);
    float _291 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
    float _293 = 1.0 / _278;
    float _295 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
    int _297 = 2;
    if (!_264)
    {
        _297 = 1;
    }
    int _299 = _297;
    float _301 = _291 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    int _303 = _299;
    if (!_272)
    {
        _303 = _287;
    }
    int _305 = _303;
    float _307 = _295 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _309 = _289 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _311 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[22].x, _232);
    float _313 = _301 * _293;
    float _315 = _218 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _317 = _307 * _293;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = _218 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _323 = _309 * _293;
    float _325 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[19].x, _315);
    float _327 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[21].x, _321);
    float _329 = fma(_319, _84, _313);
    float _331 = -_84;
    float _333 = fma(_319, _331, _313);
    float _335 = fma(_319, _86, _323);
    float _337 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[21].z, _327);
    float _339 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[24].x, _230);
    float _341 = _337 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _343 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[19].z, _325);
    float3 _1317 = float3(_329, _335, float(0));
    float3 _1321 = select(_1317, float3(0.0), isnan(_1317));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1321.xy, uint(rint(_1321.z)), _319);
    float3 _1328 = float3(_313, _335, float(0));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1330.xy, uint(rint(_1330.z)), _319);
    float3 _1337 = float3(_333, _335, float(0));
    float3 _1339 = select(_1337, float3(0.0), isnan(_1337));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1339.xy, uint(rint(_1339.z)), _319);
    float3 _1346 = float3(_329, _323, float(0));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1348.xy, uint(rint(_1348.z)), _319);
    float _353 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[24].z, _339);
    float _355 = float(_305);
    float _357 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[22].z, _311);
    float _359 = _343 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float3 _1371 = float3(_313, _323, float(0));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1373.xy, uint(rint(_1373.z)), _319);
    float _363 = precise::min(_355, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _365 = _218 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _367 = _218 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _369 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _371 = _363 != 1.0;
    bool _373 = isnan(_363);
    bool _375 = _371 || _373;
    bool _377 = isnan(1.0);
    bool _379 = _375 || _377;
    float _381 = _218 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _383 = _363 != 0.0;
    bool _385 = isnan(_363);
    bool _387 = _383 || _385;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    float _393 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[23].x, _367);
    float _395 = -_86;
    float _397 = fma(_319, _395, _323);
    float _399 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[17].x, _381);
    float _401 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[23].z, _393);
    float _403 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _405 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[17].z, _399);
    float _407 = _218 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _409 = rint(_363);
    float _411 = precise::max(_409, 0.0);
    uint _414 = uint(_411);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _341;
    float _420 = _359;
    if (_379)
    {
        float _422 = _353 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _418 = _422;
    }
    float _424 = _418;
    float _426 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[20].x, _365);
    float _428 = _424;
    if (_379)
    {
        float _430 = _357 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _420 = _430;
    }
    float _432 = _420;
    float _434 = _218 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _436 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[18].x, _407);
    float _438 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[20].z, _426);
    float _440 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[16].x, _434);
    float _442 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[18].z, _436);
    float _444 = _438 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _446 = _444;
    float _448 = _432;
    if (_379)
    {
        float _450 = _401 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _446 = _450;
    }
    float _452 = _446;
    float _454 = _452;
    if (!_391)
    {
        float _456 = _405 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[16].z, _440);
    if (!_391)
    {
        float _462 = _442 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _428 = _462;
    }
    float _464 = _428;
    if (!_391)
    {
        float _466 = _460 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _448 = _466;
    }
    float _468 = _448;
    float3 _1574 = float3(_333, _323, float(0));
    float3 _1576 = select(_1574, float3(0.0), isnan(_1574));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1576.xy, uint(rint(_1576.z)), _319);
    float _472 = 0.0 + _464;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = fma(_474, _369, _458);
    float3 _1591 = float3(_329, _397, float(0));
    float3 _1593 = select(_1591, float3(0.0), isnan(_1591));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1593.xy, uint(rint(_1593.z)), _319);
    float3 _1600 = float3(_313, _397, float(0));
    float3 _1602 = select(_1600, float3(0.0), isnan(_1600));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1602.xy, uint(rint(_1602.z)), _319);
    float _482 = fma(_474, _403, _468);
    float3 _1613 = float3(_333, _397, float(0));
    float3 _1615 = select(_1613, float3(0.0), isnan(_1613));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1615.xy, uint(rint(_1615.z)), _319);
    float3 _1624 = float3(_468, _476, float(int(_416)));
    float3 _1626 = select(_1624, float3(0.0), isnan(_1624));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1626.xy, uint(rint(_1626.z)), _474);
    float3 _1635 = float3(_482, _476, float(int(_416)));
    float3 _1637 = select(_1635, float3(0.0), isnan(_1635));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1637.xy, uint(rint(_1637.z)), _474);
    float _490 = -_369;
    float _492 = fma(_474, _490, _458);
    float _494 = _345 + _347;
    float _496 = _494 + _349;
    float _498 = _496 + _351;
    float _500 = -_403;
    float _502 = fma(_474, _500, _468);
    float3 _1667 = float3(_502, _476, float(int(_416)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1669.xy, uint(rint(_1669.z)), _474);
    float3 _1678 = float3(_482, _458, float(int(_416)));
    float3 _1680 = select(_1678, float3(0.0), isnan(_1678));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1680.xy, uint(rint(_1680.z)), _474);
    float3 _1689 = float3(_468, _458, float(int(_416)));
    float3 _1691 = select(_1689, float3(0.0), isnan(_1689));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1691.xy, uint(rint(_1691.z)), _474);
    float3 _1700 = float3(_502, _458, float(int(_416)));
    float3 _1702 = select(_1700, float3(0.0), isnan(_1700));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1702.xy, uint(rint(_1702.z)), _474);
    float3 _1711 = float3(_482, _492, float(int(_416)));
    float3 _1713 = select(_1711, float3(0.0), isnan(_1711));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1713.xy, uint(rint(_1713.z)), _474);
    float2 _1719 = float2(_56, _58);
    float2 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1719, float2(0.0), isnan(_1719))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1719, float2(0.0), isnan(_1719))).xy;
    float _518 = _516.x;
    float _520 = _516.y;
    float _522 = -_218;
    float _524 = _522 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _526 = _498 + _361;
    float _528 = -_220;
    float _530 = _528 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _532 = _524 * _524;
    float _534 = fma(_530, _530, _532);
    float _536 = -_216;
    float _538 = _536 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _540 = fma(_538, _538, _534);
    float _542 = _218 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _544 = _218 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _546 = _218 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _548 = _218 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _550 = sqrt(_540);
    float _552 = _218 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _554 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[30].x, _546);
    float _556 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[28].x, _544);
    float _558 = _526 + _470;
    float _560 = _488 + _486;
    bool _562 = _550 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _564 = _558 + _478;
    bool _566 = _550 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _568 = _218 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _570 = !_562;
    int _572 = _570 ? 0 : 1;
    float _574 = _564 + _480;
    float _576 = _218 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _578 = _218 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _580 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[32].x, _548);
    float _582 = _574 + _484;
    float _584 = _218 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _586 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[31].x, _578);
    float _588 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[33].x, _552);
    int _590 = 2;
    if (!_562)
    {
        _590 = 1;
    }
    int _592 = _590;
    float _594 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[29].x, _584);
    int _596 = _592;
    if (!_566)
    {
        _596 = _572;
    }
    int _598 = _596;
    float _600 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[25].x, _576);
    float _602 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[30].z, _554);
    float _604 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[33].z, _588);
    float _606 = float(_598);
    float _608 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[26].x, _542);
    float _610 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[27].x, _568);
    float _612 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[28].z, _556);
    float _614 = precise::min(_606, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _616 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[29].z, _594);
    float _618 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[27].z, _610);
    float _620 = _602 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _622 = _614 != 1.0;
    bool _624 = isnan(_614);
    bool _626 = _622 || _624;
    bool _628 = isnan(1.0);
    bool _630 = _626 || _628;
    float _632 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[31].z, _586);
    bool _634 = _614 != 0.0;
    bool _636 = isnan(_614);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[32].z, _580);
    float _646 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[25].z, _600);
    float _648 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[26].z, _608);
    float _650 = _612 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _652 = _616 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _654 = _620;
    float _656 = _650;
    float _658 = _652;
    if (_630)
    {
        float _660 = _604 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _654 = _660;
    }
    float _662 = _654;
    float _664 = _662;
    if (_630)
    {
        float _666 = _632 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _656 = _666;
    }
    float _668 = _656;
    float _670 = _668;
    if (!_642)
    {
        float _672 = _618 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _664 = _672;
    }
    float _674 = _664;
    if (_630)
    {
        float _676 = _644 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _658 = _676;
    }
    float _678 = _658;
    float _680 = _678;
    if (!_642)
    {
        float _682 = _646 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _670 = _682;
    }
    float _684 = _670;
    if (!_642)
    {
        float _686 = _648 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _680 = _686;
    }
    float _688 = _680;
    float _690 = 0.0 + _674;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = fma(_369, _692, _688);
    float _696 = fma(_403, _692, _684);
    float _698 = -_403;
    float _700 = fma(_698, _692, _684);
    float3 _2064 = float3(_468, _492, float(int(_416)));
    float3 _2066 = select(_2064, float3(0.0), isnan(_2064));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2066.xy, uint(rint(_2066.z)), _474);
    float _704 = _560 + _504;
    float _706 = _704 + _506;
    float _708 = rint(_614);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    uint _714 = clamp(_712, 0u, 65535u);
    float _716 = _706 + _508;
    float _718 = _716 + _510;
    float _720 = _718 + _512;
    float _722 = fma(_518, 2.0, -1.0);
    float _724 = fma(_520, 2.0, -1.0);
    float3 _2104 = float3(_502, _492, float(int(_416)));
    float3 _2106 = select(_2104, float3(0.0), isnan(_2104));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2106.xy, uint(rint(_2106.z)), _474);
    float _728 = _722 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2120 = float3(_684, _694, float(int(_714)));
    float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2122.xy, uint(rint(_2122.z)), _692);
    float3 _2131 = float3(_696, _694, float(int(_714)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2133.xy, uint(rint(_2133.z)), _692);
    float _734 = _724 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _2146 = float3(_700, _694, float(int(_714)));
    float3 _2148 = select(_2146, float3(0.0), isnan(_2146));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2148.xy, uint(rint(_2148.z)), _692);
    float3 _2157 = float3(_696, _688, float(int(_714)));
    float3 _2159 = select(_2157, float3(0.0), isnan(_2157));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2159.xy, uint(rint(_2159.z)), _692);
    float _740 = fma(_728, 2.0, _56);
    float _742 = fma(_734, 2.0, _58);
    float3 _2174 = float3(_684, _688, float(int(_714)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2176.xy, uint(rint(_2176.z)), _692);
    float _746 = -_369;
    float _748 = fma(_746, _692, _688);
    float3 _2191 = float3(_700, _688, float(int(_714)));
    float3 _2193 = select(_2191, float3(0.0), isnan(_2191));
    float _750 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2193.xy, uint(rint(_2193.z)), _692);
    float3 _2202 = float3(_696, _748, float(int(_714)));
    float3 _2204 = select(_2202, float3(0.0), isnan(_2202));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2204.xy, uint(rint(_2204.z)), _692);
    float3 _2213 = float3(_684, _748, float(int(_714)));
    float3 _2215 = select(_2213, float3(0.0), isnan(_2213));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2215.xy, uint(rint(_2215.z)), _692);
    float3 _2224 = float3(_700, _748, float(int(_714)));
    float3 _2226 = select(_2224, float3(0.0), isnan(_2224));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2226.xy, uint(rint(_2226.z)), _692);
    float2 _2232 = float2(_740, _742);
    float _758 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2232, float2(0.0), isnan(_2232))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2232, float2(0.0), isnan(_2232))).x;
    float _760 = -_216;
    float _762 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _764 = _760 + _762;
    float _766 = _764 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = fma(_582, 0.111111111938953399658203125, _768);
    float _772 = _720 + _702;
    float _774 = _772 + _726;
    float _776 = _732 + _730;
    float _778 = _776 + _736;
    float _780 = _778 + _738;
    float _782 = _780 + _744;
    float _784 = _774 * 0.111111111938953399658203125;
    float _786 = -_216;
    float _788 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _790 = _786 + _788;
    float _792 = _782 + _750;
    float _794 = _790 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _792 + _752;
    float _800 = _798 + _754;
    float _802 = _800 + _756;
    float _804 = _802 * 0.111111111938953399658203125;
    float _806 = _804 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _808 = fma(_784, (*spvDescriptorSet0.fp_c3)._m0[49].z, _806);
    float _810 = _796 + _808;
    out.m_49.x = _758;
    out.m_49.y = _770;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _810;
    return out;
}

