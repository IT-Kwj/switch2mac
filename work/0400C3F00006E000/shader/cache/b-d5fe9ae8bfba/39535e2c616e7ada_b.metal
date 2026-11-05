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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _908 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_908, float2(0.0), isnan(_908)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _925 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_925, float2(0.0), isnan(_925))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_925, float2(0.0), isnan(_925))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_98;
    float _110 = fma(_90, _72, _108);
    float _112 = -_98;
    float _114 = fma(_96, _74, _112);
    float _116 = -_100;
    float _118 = fma(_90, _76, _116);
    float _120 = -_100;
    float _122 = fma(_96, _78, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_84;
    float _130 = _128 + _90;
    float _132 = -_84;
    float _134 = _132 + _96;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = _106 * _68;
    float _142 = fma(_130, _130, _136);
    float _144 = fma(_134, _134, _138);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _118 * _146;
    float _152 = _130 * _146;
    float _154 = _110 * _146;
    float _156 = _134 * _148;
    float _158 = _114 * _148;
    float _160 = _122 * _148;
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
    float _194 = _106 * _70;
    float _196 = _188 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _216 = exp2(_214);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _220 = fma(_188, _218, _140);
    float _222 = fma(_190, _218, _194);
    float _224 = fma(_192, _218, _106);
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _226);
    float _232 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _234 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _236 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].z, _230);
    float _240 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _242 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _234);
    float _246 = _238 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = _240 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _250 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _242);
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _256 = 1.0 / _246;
    float _258 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].z, _250);
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _262 = _248 * _256;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _258 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _268 = _260 * _256;
    float _270 = _266 * _256;
    float _272 = rint(_264);
    float _274 = precise::max(_272, 0.0);
    uint _277 = uint(_274);
    uint _279 = clamp(_277, 0u, 65535u);
    float _281 = fma(_236, 0.5, _268);
    float _283 = fma(_236, 1.5, _268);
    float _285 = fma(_236, -0.5, _268);
    float _287 = fma(_236, -1.5, _268);
    float _289 = fma(_254, 1.5, _270);
    float _291 = fma(_254, 0.5, _270);
    float3 _1312 = float3(_283, _289, float(int(_279)));
    float3 _1316 = select(_1312, float3(0.0), isnan(_1312));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1316.xy, uint(rint(_1316.z)), 1.0);
    float3 _1324 = float3(_281, _289, float(int(_279)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1326.xy, uint(rint(_1326.z)), 1.0);
    float3 _1334 = float3(_285, _289, float(int(_279)));
    float3 _1336 = select(_1334, float3(0.0), isnan(_1334));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1336.xy, uint(rint(_1336.z)), 1.0);
    float3 _1344 = float3(_287, _289, float(int(_279)));
    float3 _1346 = select(_1344, float3(0.0), isnan(_1344));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1346.xy, uint(rint(_1346.z)), 1.0);
    float3 _1354 = float3(_281, _291, float(int(_279)));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1356.xy, uint(rint(_1356.z)), 1.0);
    float3 _1364 = float3(_285, _291, float(int(_279)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1366.xy, uint(rint(_1366.z)), 1.0);
    float3 _1374 = float3(_283, _291, float(int(_279)));
    float3 _1376 = select(_1374, float3(0.0), isnan(_1374));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1376.xy, uint(rint(_1376.z)), 1.0);
    float _307 = fma(_254, -0.5, _270);
    float3 _1387 = float3(_287, _291, float(int(_279)));
    float3 _1389 = select(_1387, float3(0.0), isnan(_1387));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1389.xy, uint(rint(_1389.z)), 1.0);
    float3 _1397 = float3(_283, _307, float(int(_279)));
    float3 _1399 = select(_1397, float3(0.0), isnan(_1397));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1399.xy, uint(rint(_1399.z)), 1.0);
    float3 _1407 = float3(_281, _307, float(int(_279)));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1409.xy, uint(rint(_1409.z)), 1.0);
    float3 _1417 = float3(_285, _307, float(int(_279)));
    float3 _1419 = select(_1417, float3(0.0), isnan(_1417));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1419.xy, uint(rint(_1419.z)), 1.0);
    float3 _1427 = float3(_287, _307, float(int(_279)));
    float3 _1429 = select(_1427, float3(0.0), isnan(_1427));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1429.xy, uint(rint(_1429.z)), 1.0);
    float _319 = -_140;
    float _321 = _319 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _323 = -_194;
    float _325 = _323 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _327 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _329 = _293 + _295;
    float _331 = fma(_254, -1.5, _270);
    float _333 = _321 * _321;
    float _335 = _329 + _297;
    float _337 = _140 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _339 = fma(_325, _325, _333);
    float _341 = _335 + _299;
    float _343 = -_106;
    float _345 = _343 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _347 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].x, _337);
    float _349 = _140 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _351 = _341 + _305;
    float _353 = fma(_345, _345, _339);
    float _355 = _140 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _357 = _351 + _301;
    float _359 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].z, _347);
    float _361 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].x, _349);
    float _363 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].x, _355);
    float _365 = _357 + _303;
    float _367 = sqrt(_353);
    float _369 = _140 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _371 = _359 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _373 = _365 + _309;
    float _375 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].z, _361);
    float _377 = _140 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _379 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].x, _369);
    float _381 = _373 + _311;
    float _383 = _140 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _385 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _387 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].z, _379);
    float _389 = _381 + _313;
    float _391 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].x, _383);
    float _393 = _389 + _315;
    bool _397 = _367 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _399 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].z, _391);
    bool _401 = _367 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _403 = _393 + _317;
    float _405 = _140 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _407 = !_397;
    int _410 = _407 ? 0 : 1;
    float3 _1613 = float3(_283, _331, float(int(_279)));
    float3 _1615 = select(_1613, float3(0.0), isnan(_1613));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1615.xy, uint(rint(_1615.z)), 1.0);
    float3 _1623 = float3(_281, _331, float(int(_279)));
    float3 _1625 = select(_1623, float3(0.0), isnan(_1623));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1625.xy, uint(rint(_1625.z)), 1.0);
    float3 _1633 = float3(_285, _331, float(int(_279)));
    float3 _1635 = select(_1633, float3(0.0), isnan(_1633));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1635.xy, uint(rint(_1635.z)), 1.0);
    float _418 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].x, _405);
    int _420 = 2;
    float _422 = _371;
    if (!_397)
    {
        _420 = 1;
    }
    int _424 = _420;
    float _426 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].z, _418);
    int _428 = _424;
    if (!_401)
    {
        _428 = _410;
    }
    int _430 = _428;
    float _432 = float(_430);
    float _434 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].z, _363);
    float _436 = _375 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _438 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].x, _377);
    float _440 = precise::min(_432, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _442 = _434 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _444 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _438);
    bool _446 = _440 != 1.0;
    bool _448 = isnan(_440);
    bool _450 = _446 || _448;
    bool _452 = isnan(1.0);
    bool _454 = _450 || _452;
    float _456 = rint(_440);
    float _458 = precise::max(_456, 0.0);
    uint _460 = uint(_458);
    uint _462 = clamp(_460, 0u, 65535u);
    bool _464 = _440 != 0.0;
    bool _466 = isnan(_440);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = _442;
    float _476 = _436;
    if (_454)
    {
        float _478 = _387 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _422 = _478;
    }
    float _480 = _422;
    float _482 = _140 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _484 = _480;
    if (!_472)
    {
        float _486 = _444 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _484 = _486;
    }
    float _488 = _484;
    float _490 = _140 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_454)
    {
        float _492 = _399 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _474 = _492;
    }
    float _494 = _474;
    float _496 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].x, _482);
    float _498 = _494;
    if (_454)
    {
        float _500 = _426 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _476 = _500;
    }
    float _502 = _476;
    float _504 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].x, _490);
    float _506 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _496);
    float _508 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].z, _504);
    float _510 = _502;
    if (!_472)
    {
        float _512 = _506 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _510 = _512;
    }
    float _514 = _510;
    if (!_472)
    {
        float _516 = _508 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _498 = _516;
    }
    float _518 = _498;
    float _520 = 0.0 + _518;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = _522 * _327;
    float _526 = _522 * _385;
    float _528 = fma(_524, 1.5, _514);
    float _530 = fma(_526, 0.5, _488);
    float _532 = fma(_526, -0.5, _488);
    float3 _1836 = float3(_287, _331, float(int(_279)));
    float3 _1838 = select(_1836, float3(0.0), isnan(_1836));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1838.xy, uint(rint(_1838.z)), 1.0);
    float3 _1846 = float3(_530, _528, float(int(_462)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1848.xy, uint(rint(_1848.z)), _522);
    float3 _1857 = float3(_532, _528, float(int(_462)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1859.xy, uint(rint(_1859.z)), _522);
    float _540 = fma(_526, 1.5, _488);
    float _542 = fma(_526, -1.5, _488);
    float _544 = fma(_524, 0.5, _514);
    float _546 = _403 + _412;
    float _548 = _546 + _414;
    float3 _1883 = float3(_542, _528, float(int(_462)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1885.xy, uint(rint(_1885.z)), _522);
    float3 _1894 = float3(_540, _528, float(int(_462)));
    float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1896.xy, uint(rint(_1896.z)), _522);
    float3 _1905 = float3(_540, _544, float(int(_462)));
    float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1907.xy, uint(rint(_1907.z)), _522);
    float3 _1916 = float3(_530, _544, float(int(_462)));
    float3 _1918 = select(_1916, float3(0.0), isnan(_1916));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1918.xy, uint(rint(_1918.z)), _522);
    float3 _1927 = float3(_532, _544, float(int(_462)));
    float3 _1929 = select(_1927, float3(0.0), isnan(_1927));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1929.xy, uint(rint(_1929.z)), _522);
    float3 _1938 = float3(_542, _544, float(int(_462)));
    float3 _1940 = select(_1938, float3(0.0), isnan(_1938));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1940.xy, uint(rint(_1940.z)), _522);
    float _562 = _548 + _416;
    float _564 = fma(_524, -1.5, _514);
    float _566 = _562 + _534;
    float _568 = _552 + _536;
    float _570 = fma(_524, -0.5, _514);
    float _572 = _568 + _538;
    float _574 = _572 + _550;
    float3 _1970 = float3(_530, _570, float(int(_462)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1972.xy, uint(rint(_1972.z)), _522);
    float3 _1981 = float3(_540, _570, float(int(_462)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1983.xy, uint(rint(_1983.z)), _522);
    float3 _1992 = float3(_532, _570, float(int(_462)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1994.xy, uint(rint(_1994.z)), _522);
    float3 _2003 = float3(_542, _570, float(int(_462)));
    float3 _2005 = select(_2003, float3(0.0), isnan(_2003));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2005.xy, uint(rint(_2005.z)), _522);
    float3 _2014 = float3(_540, _564, float(int(_462)));
    float3 _2016 = select(_2014, float3(0.0), isnan(_2014));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2016.xy, uint(rint(_2016.z)), _522);
    float3 _2025 = float3(_530, _564, float(int(_462)));
    float3 _2027 = select(_2025, float3(0.0), isnan(_2025));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2027.xy, uint(rint(_2027.z)), _522);
    float _588 = -_140;
    float _590 = _588 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _592 = -_194;
    float _594 = _592 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _596 = _574 + _554;
    float _598 = _140 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _600 = _590 * _590;
    float _602 = _140 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _604 = _596 + _556;
    float _606 = _140 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _608 = fma(_594, _594, _600);
    float _610 = -_106;
    float _612 = _610 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _614 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].x, _598);
    float _616 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].x, _606);
    float _618 = fma(_612, _612, _608);
    float _620 = _604 + _558;
    float _622 = _140 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _624 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].z, _614);
    float _626 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].z, _616);
    float _628 = sqrt(_618);
    float _630 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].x, _622);
    float _632 = _620 + _560;
    float _634 = _140 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _636 = _140 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _638 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].z, _630);
    float _640 = _140 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _642 = _140 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _644 = _140 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _646 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].x, _634);
    float _648 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].x, _636);
    float _650 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].x, _640);
    float _652 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].x, _642);
    float _654 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].x, _644);
    float _656 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].x, _602);
    float _658 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].z, _650);
    bool _660 = _628 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _662 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].z, _652);
    bool _664 = _628 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _666 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].z, _654);
    bool _668 = !_660;
    int _670 = _668 ? 0 : 1;
    float _672 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].z, _656);
    float _674 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].z, _646);
    float _676 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].z, _648);
    float _678 = _658 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _680 = _662 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _682 = 2;
    float _684 = _678;
    float _686 = _680;
    if (!_660)
    {
        _682 = 1;
    }
    int _688 = _682;
    int _690 = _688;
    if (!_664)
    {
        _690 = _670;
    }
    int _692 = _690;
    float _694 = float(_692);
    float _696 = _638 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _698 = precise::min(_694, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _700 = _698 != 1.0;
    bool _702 = isnan(_698);
    bool _704 = _700 || _702;
    bool _706 = isnan(1.0);
    bool _708 = _704 || _706;
    float _710 = rint(_698);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    uint _716 = clamp(_714, 0u, 65535u);
    bool _718 = _698 != 0.0;
    bool _720 = isnan(_698);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _696;
    if (_708)
    {
        float _730 = _624 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _728 = _730;
    }
    float _732 = _728;
    float _734 = _732;
    if (_708)
    {
        float _736 = _666 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _684 = _736;
    }
    float _738 = _684;
    float _740 = _738;
    if (!_726)
    {
        float _742 = _626 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _734 = _742;
    }
    float _744 = _734;
    if (_708)
    {
        float _746 = _672 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _686 = _746;
    }
    float _748 = _686;
    float _750 = _748;
    if (!_726)
    {
        float _752 = _674 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _740 = _752;
    }
    float _754 = _740;
    if (!_726)
    {
        float _756 = _676 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _750 = _756;
    }
    float _758 = _750;
    float3 _2350 = float3(_532, _564, float(int(_462)));
    float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2352.xy, uint(rint(_2352.z)), _522);
    float3 _2361 = float3(_542, _564, float(int(_462)));
    float3 _2363 = select(_2361, float3(0.0), isnan(_2361));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2363.xy, uint(rint(_2363.z)), _522);
    float _764 = _632 + _578;
    float _766 = _764 + _576;
    float _768 = _766 + _580;
    float _770 = -_106;
    float _772 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _774 = _770 + _772;
    float _776 = _768 + _582;
    float _778 = 0.0 + _744;
    float _780 = precise::clamp(_778, 0.0, 1.0);
    float _782 = _774 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _776 + _584;
    float _788 = _385 * _780;
    float _790 = _327 * _780;
    float _792 = _786 + _586;
    float _794 = fma(_788, 0.5, _754);
    float _796 = fma(_790, 1.5, _758);
    float _798 = fma(_790, 0.5, _758);
    float _800 = fma(_788, 1.5, _754);
    float _802 = fma(_788, -0.5, _754);
    float3 _2429 = float3(_794, _796, float(int(_716)));
    float3 _2431 = select(_2429, float3(0.0), isnan(_2429));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2431.xy, uint(rint(_2431.z)), _780);
    float3 _2440 = float3(_800, _796, float(int(_716)));
    float3 _2442 = select(_2440, float3(0.0), isnan(_2440));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2442.xy, uint(rint(_2442.z)), _780);
    float3 _2451 = float3(_802, _796, float(int(_716)));
    float3 _2453 = select(_2451, float3(0.0), isnan(_2451));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2453.xy, uint(rint(_2453.z)), _780);
    float3 _2462 = float3(_794, _798, float(int(_716)));
    float3 _2464 = select(_2462, float3(0.0), isnan(_2462));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2464.xy, uint(rint(_2464.z)), _780);
    float _812 = fma(_788, -1.5, _754);
    float _814 = fma(_566, 0.0625, _784);
    float3 _2480 = float3(_812, _796, float(int(_716)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2482.xy, uint(rint(_2482.z)), _780);
    float3 _2491 = float3(_800, _798, float(int(_716)));
    float3 _2493 = select(_2491, float3(0.0), isnan(_2491));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2493.xy, uint(rint(_2493.z)), _780);
    float3 _2502 = float3(_802, _798, float(int(_716)));
    float3 _2504 = select(_2502, float3(0.0), isnan(_2502));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2504.xy, uint(rint(_2504.z)), _780);
    float _822 = fma(_790, -0.5, _758);
    float _824 = _792 + _760;
    float3 _2519 = float3(_812, _798, float(int(_716)));
    float3 _2521 = select(_2519, float3(0.0), isnan(_2519));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2521.xy, uint(rint(_2521.z)), _780);
    float3 _2530 = float3(_800, _822, float(int(_716)));
    float3 _2532 = select(_2530, float3(0.0), isnan(_2530));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2532.xy, uint(rint(_2532.z)), _780);
    float3 _2541 = float3(_794, _822, float(int(_716)));
    float3 _2543 = select(_2541, float3(0.0), isnan(_2541));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2543.xy, uint(rint(_2543.z)), _780);
    float _832 = fma(_790, -1.5, _758);
    float3 _2555 = float3(_802, _822, float(int(_716)));
    float3 _2557 = select(_2555, float3(0.0), isnan(_2555));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2557.xy, uint(rint(_2557.z)), _780);
    float3 _2566 = float3(_812, _822, float(int(_716)));
    float3 _2568 = select(_2566, float3(0.0), isnan(_2566));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2568.xy, uint(rint(_2568.z)), _780);
    float _838 = _824 + _762;
    float3 _2580 = float3(_800, _832, float(int(_716)));
    float3 _2582 = select(_2580, float3(0.0), isnan(_2580));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2582.xy, uint(rint(_2582.z)), _780);
    float3 _2591 = float3(_794, _832, float(int(_716)));
    float3 _2593 = select(_2591, float3(0.0), isnan(_2591));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2593.xy, uint(rint(_2593.z)), _780);
    float3 _2602 = float3(_802, _832, float(int(_716)));
    float3 _2604 = select(_2602, float3(0.0), isnan(_2602));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2604.xy, uint(rint(_2604.z)), _780);
    float3 _2613 = float3(_812, _832, float(int(_716)));
    float3 _2615 = select(_2613, float3(0.0), isnan(_2613));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2615.xy, uint(rint(_2615.z)), _780);
    float _848 = -_106;
    float _850 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _852 = _848 + _850;
    float _854 = _838 * 0.0625;
    float _856 = _852 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _858 = precise::clamp(_856, 0.0, 1.0);
    float _860 = _806 + _804;
    float _862 = _860 + _808;
    float _864 = _862 + _816;
    float _866 = _864 + _818;
    float _868 = _866 + _810;
    float _870 = _868 + _820;
    float _872 = _870 + _826;
    float _874 = _872 + _828;
    float _876 = _874 + _830;
    float _878 = _876 + _834;
    float _880 = _878 + _836;
    float _882 = _880 + _840;
    float _884 = _882 + _842;
    float _886 = _884 + _844;
    float _888 = _886 + _846;
    float _890 = _888 * 0.0625;
    float _892 = _890 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _894 = fma(_854, (*spvDescriptorSet0.fp_c3)._m0[49].z, _892);
    float _896 = _858 + _894;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _814;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _896;
    return out;
}

