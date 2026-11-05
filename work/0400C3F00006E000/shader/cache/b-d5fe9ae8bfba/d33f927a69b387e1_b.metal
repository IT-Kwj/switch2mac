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
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _750 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_750, float2(0.0), isnan(_750))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_750, float2(0.0), isnan(_750))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _54;
    float _72 = _68 * _56;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _82 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _80);
    float _88 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _82);
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _92 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _94 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _94);
    float _102 = 1.0 / _92;
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _100);
    float _106 = _104 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _108 = _106 * _102;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _96 * _102;
    float _114 = _98 * _102;
    float _116 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _118 = _110 * _58;
    float _120 = _110 * _116;
    float _122 = fma(_118, 1.5, _112);
    float _124 = fma(_118, 0.5, _112);
    float _126 = fma(_118, -0.5, _112);
    float _128 = fma(_118, -1.5, _112);
    float _130 = fma(_120, 1.5, _114);
    float _132 = fma(_120, 0.5, _114);
    float3 _918 = float3(_122, _130, float(0));
    float3 _922 = select(_918, float3(0.0), isnan(_918));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _922.xy, uint(rint(_922.z)), _110);
    float3 _929 = float3(_124, _130, float(0));
    float3 _931 = select(_929, float3(0.0), isnan(_929));
    float _136 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _931.xy, uint(rint(_931.z)), _110);
    float3 _938 = float3(_126, _130, float(0));
    float3 _940 = select(_938, float3(0.0), isnan(_938));
    float _138 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _940.xy, uint(rint(_940.z)), _110);
    float3 _947 = float3(_128, _130, float(0));
    float3 _949 = select(_947, float3(0.0), isnan(_947));
    float _140 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _949.xy, uint(rint(_949.z)), _110);
    float3 _956 = float3(_122, _132, float(0));
    float3 _958 = select(_956, float3(0.0), isnan(_956));
    float _142 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _958.xy, uint(rint(_958.z)), _110);
    float3 _965 = float3(_124, _132, float(0));
    float3 _967 = select(_965, float3(0.0), isnan(_965));
    float _144 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _967.xy, uint(rint(_967.z)), _110);
    float _146 = fma(_120, -0.5, _114);
    float _148 = _134 + _136;
    float _150 = _148 + _138;
    float _152 = _150 + _140;
    float3 _986 = float3(_126, _132, float(0));
    float3 _988 = select(_986, float3(0.0), isnan(_986));
    float _154 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _988.xy, uint(rint(_988.z)), _110);
    float _156 = _152 + _142;
    float3 _998 = float3(_128, _132, float(0));
    float3 _1000 = select(_998, float3(0.0), isnan(_998));
    float _158 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1000.xy, uint(rint(_1000.z)), _110);
    float _160 = _156 + _144;
    float3 _1010 = float3(_122, _146, float(0));
    float3 _1012 = select(_1010, float3(0.0), isnan(_1010));
    float _162 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1012.xy, uint(rint(_1012.z)), _110);
    float3 _1019 = float3(_124, _146, float(0));
    float3 _1021 = select(_1019, float3(0.0), isnan(_1019));
    float _164 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1021.xy, uint(rint(_1021.z)), _110);
    float3 _1028 = float3(_126, _146, float(0));
    float3 _1030 = select(_1028, float3(0.0), isnan(_1028));
    float _166 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1030.xy, uint(rint(_1030.z)), _110);
    float3 _1037 = float3(_128, _146, float(0));
    float3 _1039 = select(_1037, float3(0.0), isnan(_1037));
    float _168 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1039.xy, uint(rint(_1039.z)), _110);
    float _170 = -_70;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _174 = -_72;
    float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _178 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _180 = _172 * _172;
    float _182 = fma(_176, _176, _180);
    float _184 = -_68;
    float _186 = _184 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _188 = fma(_186, _186, _182);
    float _190 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _194 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _196 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _198 = sqrt(_188);
    float _200 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _190);
    float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _192);
    float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _194);
    float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _196);
    float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _200);
    float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _202);
    float _212 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _214 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _204);
    float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _206);
    float _220 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _222 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _212);
    float _224 = _214 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _226 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _220);
    bool _230 = _198 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _232 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _222);
    bool _234 = _198 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _236 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _226);
    bool _238 = !_230;
    int _241 = _238 ? 0 : 1;
    float _243 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    int _245 = 2;
    float _247 = _216;
    float _249 = _224;
    if (!_230)
    {
        _245 = 1;
    }
    int _251 = _245;
    int _253 = _251;
    if (!_234)
    {
        _253 = _241;
    }
    int _255 = _253;
    float _257 = float(_255);
    float _259 = fma(_120, -1.5, _114);
    float _261 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _263 = precise::min(_257, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _265 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _261);
    bool _267 = _263 != 1.0;
    bool _269 = isnan(_263);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _265);
    bool _279 = _263 != 0.0;
    bool _281 = isnan(_263);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    float _289 = rint(_263);
    float _291 = precise::max(_289, 0.0);
    uint _294 = uint(_291);
    uint _296 = clamp(_294, 0u, 65535u);
    if (_275)
    {
        float _298 = _210 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _247 = _298;
    }
    float _300 = _247;
    float _302 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _304 = _300;
    if (_275)
    {
        float _306 = _218 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _249 = _306;
    }
    float _308 = _249;
    float _310 = _308;
    if (!_287)
    {
        float _312 = _277 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _310 = _312;
    }
    float _314 = _310;
    if (!_287)
    {
        float _316 = _236 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _304 = _316;
    }
    float _318 = _304;
    float _320 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _302);
    float _322 = 0.0 + _314;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _320);
    float _328 = _324 * _178;
    float _330 = _326 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _332 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _334 = _330;
    if (_275)
    {
        float _336 = _232 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _334 = _336;
    }
    float _338 = _334;
    float _340 = fma(_328, 0.5, _318);
    float _342 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _332);
    float _344 = fma(_328, -0.5, _318);
    float _346 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _342);
    float _348 = _338;
    if (!_287)
    {
        float _350 = _346 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _348 = _350;
    }
    float _352 = _348;
    float _354 = _324 * _243;
    float _356 = fma(_354, 1.5, _352);
    float _358 = _160 + _154;
    float _360 = _358 + _158;
    float _362 = _360 + _162;
    float _364 = _362 + _164;
    float _366 = _364 + _166;
    float3 _1399 = float3(_122, _259, float(0));
    float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
    float _368 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1401.xy, uint(rint(_1401.z)), _110);
    float _370 = _366 + _168;
    float3 _1411 = float3(_124, _259, float(0));
    float3 _1413 = select(_1411, float3(0.0), isnan(_1411));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1413.xy, uint(rint(_1413.z)), _110);
    float3 _1420 = float3(_126, _259, float(0));
    float3 _1422 = select(_1420, float3(0.0), isnan(_1420));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1422.xy, uint(rint(_1422.z)), _110);
    float3 _1429 = float3(_128, _259, float(0));
    float3 _1431 = select(_1429, float3(0.0), isnan(_1429));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1431.xy, uint(rint(_1431.z)), _110);
    float3 _1440 = float3(_340, _356, float(int(_296)));
    float3 _1442 = select(_1440, float3(0.0), isnan(_1440));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1442.xy, uint(rint(_1442.z)), _324);
    float3 _1451 = float3(_344, _356, float(int(_296)));
    float3 _1453 = select(_1451, float3(0.0), isnan(_1451));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1453.xy, uint(rint(_1453.z)), _324);
    float _382 = fma(_328, 1.5, _318);
    float _384 = fma(_328, -1.5, _318);
    float3 _1468 = float3(_384, _356, float(int(_296)));
    float3 _1470 = select(_1468, float3(0.0), isnan(_1468));
    float _386 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1470.xy, uint(rint(_1470.z)), _324);
    float3 _1479 = float3(_382, _356, float(int(_296)));
    float3 _1481 = select(_1479, float3(0.0), isnan(_1479));
    float _388 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1481.xy, uint(rint(_1481.z)), _324);
    float _390 = _370 + _368;
    float _392 = _390 + _372;
    float _394 = fma(_354, 0.5, _352);
    float3 _1499 = float3(_382, _394, float(int(_296)));
    float3 _1501 = select(_1499, float3(0.0), isnan(_1499));
    float _396 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1501.xy, uint(rint(_1501.z)), _324);
    float3 _1510 = float3(_340, _394, float(int(_296)));
    float3 _1512 = select(_1510, float3(0.0), isnan(_1510));
    float _398 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1512.xy, uint(rint(_1512.z)), _324);
    float3 _1521 = float3(_344, _394, float(int(_296)));
    float3 _1523 = select(_1521, float3(0.0), isnan(_1521));
    float _400 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1523.xy, uint(rint(_1523.z)), _324);
    float3 _1532 = float3(_384, _394, float(int(_296)));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1534.xy, uint(rint(_1534.z)), _324);
    float _404 = _392 + _374;
    float _406 = _388 + _378;
    float _408 = _404 + _376;
    float _410 = _406 + _380;
    float _412 = fma(_354, -0.5, _352);
    float _414 = fma(_354, -1.5, _352);
    float _416 = _410 + _386;
    float3 _1564 = float3(_340, _412, float(int(_296)));
    float3 _1566 = select(_1564, float3(0.0), isnan(_1564));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1566.xy, uint(rint(_1566.z)), _324);
    float3 _1575 = float3(_382, _412, float(int(_296)));
    float3 _1577 = select(_1575, float3(0.0), isnan(_1575));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1577.xy, uint(rint(_1577.z)), _324);
    float3 _1586 = float3(_344, _412, float(int(_296)));
    float3 _1588 = select(_1586, float3(0.0), isnan(_1586));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1588.xy, uint(rint(_1588.z)), _324);
    float3 _1597 = float3(_384, _412, float(int(_296)));
    float3 _1599 = select(_1597, float3(0.0), isnan(_1597));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1599.xy, uint(rint(_1599.z)), _324);
    float3 _1608 = float3(_382, _414, float(int(_296)));
    float3 _1610 = select(_1608, float3(0.0), isnan(_1608));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1610.xy, uint(rint(_1610.z)), _324);
    float3 _1619 = float3(_340, _414, float(int(_296)));
    float3 _1621 = select(_1619, float3(0.0), isnan(_1619));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1621.xy, uint(rint(_1621.z)), _324);
    float _430 = -_70;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _434 = -_72;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _438 = _432 * _432;
    float _440 = fma(_436, _436, _438);
    float _442 = -_68;
    float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _446 = fma(_444, _444, _440);
    float _448 = _416 + _396;
    float _450 = sqrt(_446);
    float _452 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _454 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _456 = _448 + _398;
    float _458 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _460 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _452);
    float _462 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _464 = _456 + _400;
    float _466 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _468 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _470 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _472 = _464 + _402;
    float _474 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _476 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _478 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _458);
    float _480 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _466);
    bool _482 = _450 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _484 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _454);
    bool _486 = _450 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _488 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _460);
    bool _490 = !_482;
    int _492 = _490 ? 0 : 1;
    float _494 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _462);
    float _496 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _468);
    float _498 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _470);
    float _500 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _474);
    float _502 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _476);
    float _504 = _472 + _420;
    float _506 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _478);
    float _508 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _480);
    int _510 = 2;
    if (!_482)
    {
        _510 = 1;
    }
    int _512 = _510;
    float _514 = _504 + _418;
    int _516 = _512;
    if (!_486)
    {
        _516 = _492;
    }
    int _518 = _516;
    float _520 = _488 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _522 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _496);
    float _524 = _514 + _422;
    float _526 = float(_518);
    float _528 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _498);
    float _530 = _524 + _424;
    float _532 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _500);
    float _534 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _502);
    float _536 = precise::min(_526, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _538 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _484);
    float3 _1850 = float3(_344, _414, float(int(_296)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1852.xy, uint(rint(_1852.z)), _324);
    float _542 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _494);
    bool _544 = _536 != 1.0;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    float _554 = rint(_536);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    uint _560 = clamp(_558, 0u, 65535u);
    bool _562 = _536 != 0.0;
    bool _564 = isnan(_536);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = _522 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _574 = _528 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _576 = _530 + _426;
    float _578 = -_68;
    float _580 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _582 = _578 + _580;
    float _584 = _576 + _428;
    float _586 = _582 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = _520;
    float _592 = _572;
    float _594 = _574;
    if (_552)
    {
        float _596 = _506 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _590 = _596;
    }
    float _598 = _590;
    float _600 = _598;
    if (_552)
    {
        float _602 = _532 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _592 = _602;
    }
    float _604 = _592;
    float _606 = _604;
    if (!_570)
    {
        float _608 = _508 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _600 = _608;
    }
    float _610 = _600;
    if (_552)
    {
        float _612 = _534 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _594 = _612;
    }
    float _614 = _594;
    float _616 = _614;
    if (!_570)
    {
        float _618 = _538 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _606 = _618;
    }
    float _620 = _606;
    if (!_570)
    {
        float _622 = _542 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _616 = _622;
    }
    float _624 = _616;
    float _626 = 0.0 + _610;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _178 * _628;
    float _632 = _243 * _628;
    float _634 = fma(_630, 0.5, _620);
    float _636 = fma(_632, 1.5, _624);
    float _638 = fma(_632, 0.5, _624);
    float _640 = fma(_630, 1.5, _620);
    float3 _2009 = float3(_384, _414, float(int(_296)));
    float3 _2011 = select(_2009, float3(0.0), isnan(_2009));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2011.xy, uint(rint(_2011.z)), _324);
    float3 _2020 = float3(_634, _636, float(int(_560)));
    float3 _2022 = select(_2020, float3(0.0), isnan(_2020));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2022.xy, uint(rint(_2022.z)), _628);
    float _646 = fma(_630, -0.5, _620);
    float3 _2034 = float3(_640, _636, float(int(_560)));
    float3 _2036 = select(_2034, float3(0.0), isnan(_2034));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2036.xy, uint(rint(_2036.z)), _628);
    float3 _2045 = float3(_646, _636, float(int(_560)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2047.xy, uint(rint(_2047.z)), _628);
    float3 _2056 = float3(_634, _638, float(int(_560)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2058.xy, uint(rint(_2058.z)), _628);
    float _654 = fma(_630, -1.5, _620);
    float _656 = fma(_408, 0.0625, _588);
    float3 _2074 = float3(_654, _636, float(int(_560)));
    float3 _2076 = select(_2074, float3(0.0), isnan(_2074));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2076.xy, uint(rint(_2076.z)), _628);
    float3 _2085 = float3(_640, _638, float(int(_560)));
    float3 _2087 = select(_2085, float3(0.0), isnan(_2085));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2087.xy, uint(rint(_2087.z)), _628);
    float3 _2096 = float3(_646, _638, float(int(_560)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2098.xy, uint(rint(_2098.z)), _628);
    float _664 = fma(_632, -0.5, _624);
    float _666 = _584 + _540;
    float3 _2113 = float3(_654, _638, float(int(_560)));
    float3 _2115 = select(_2113, float3(0.0), isnan(_2113));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2115.xy, uint(rint(_2115.z)), _628);
    float3 _2124 = float3(_640, _664, float(int(_560)));
    float3 _2126 = select(_2124, float3(0.0), isnan(_2124));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2126.xy, uint(rint(_2126.z)), _628);
    float3 _2135 = float3(_634, _664, float(int(_560)));
    float3 _2137 = select(_2135, float3(0.0), isnan(_2135));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2137.xy, uint(rint(_2137.z)), _628);
    float _674 = fma(_632, -1.5, _624);
    float3 _2149 = float3(_646, _664, float(int(_560)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2151.xy, uint(rint(_2151.z)), _628);
    float3 _2160 = float3(_654, _664, float(int(_560)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2162.xy, uint(rint(_2162.z)), _628);
    float3 _2171 = float3(_640, _674, float(int(_560)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2173.xy, uint(rint(_2173.z)), _628);
    float3 _2182 = float3(_634, _674, float(int(_560)));
    float3 _2184 = select(_2182, float3(0.0), isnan(_2182));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2184.xy, uint(rint(_2184.z)), _628);
    float3 _2193 = float3(_646, _674, float(int(_560)));
    float3 _2195 = select(_2193, float3(0.0), isnan(_2193));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2195.xy, uint(rint(_2195.z)), _628);
    float3 _2204 = float3(_654, _674, float(int(_560)));
    float3 _2206 = select(_2204, float3(0.0), isnan(_2204));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2206.xy, uint(rint(_2206.z)), _628);
    float _688 = _666 + _642;
    float _690 = _648 + _644;
    float _692 = _690 + _650;
    float _694 = _692 + _658;
    float _696 = _694 + _660;
    float _698 = _696 + _652;
    float _700 = _698 + _662;
    float _702 = -_68;
    float _704 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _706 = _702 + _704;
    float _708 = _688 * 0.0625;
    float _710 = _706 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _712 = precise::clamp(_710, 0.0, 1.0);
    float _714 = _700 + _668;
    float _716 = _714 + _670;
    float _718 = _716 + _672;
    float _720 = _718 + _676;
    float _722 = _720 + _678;
    float _724 = _722 + _680;
    float _726 = _724 + _682;
    float _728 = _726 + _684;
    float _730 = _728 + _686;
    float _732 = _730 * 0.0625;
    float _734 = _732 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _736 = fma(_708, (*spvDescriptorSet0.fp_c3)._m0[49].z, _734);
    float _738 = _712 + _736;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _656;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _738;
    return out;
}

