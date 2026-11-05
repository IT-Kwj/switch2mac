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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _883 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_883, float2(0.0), isnan(_883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_883, float2(0.0), isnan(_883))).x;
    float _58 = in.m_42.x;
    float _60 = -_56;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_72;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_72)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    float _96 = in.m_42.y;
    uint _98 = uint(int(uint(_94) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _96;
    bool _108 = as_type<int>(_104) == 336;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 608;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _106 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _106 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _106 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _106 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _144;
            _152 = _140;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _106 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _106 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _106 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _106 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _184;
            _152 = _180;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _106 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _106 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _106 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _216;
            _152 = _212;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = 1.0 / _220;
    float _230 = float(int(_89));
    float _232 = rint(_230);
    float _234 = precise::max(_232, 0.0);
    uint _236 = uint(_234);
    uint _238 = clamp(_236, 0u, 65535u);
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _242 = _228 * _222;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _228 * _224;
    float _248 = _228 * _226;
    float _250 = _244 * _240;
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _254 = fma(_250, 0.5, _246);
    float _256 = _244 * _252;
    float _258 = fma(_250, 1.5, _246);
    float _260 = fma(_250, -0.5, _246);
    float _262 = fma(_250, -1.5, _246);
    float _264 = fma(_256, 1.5, _248);
    float _266 = fma(_256, 0.5, _248);
    float3 _1325 = float3(_254, _264, float(int(_238)));
    float3 _1329 = select(_1325, float3(0.0), isnan(_1325));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1329.xy, uint(rint(_1329.z)), _244);
    float3 _1338 = float3(_258, _264, float(int(_238)));
    float3 _1340 = select(_1338, float3(0.0), isnan(_1338));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1340.xy, uint(rint(_1340.z)), _244);
    float3 _1349 = float3(_260, _264, float(int(_238)));
    float3 _1351 = select(_1349, float3(0.0), isnan(_1349));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1351.xy, uint(rint(_1351.z)), _244);
    float3 _1360 = float3(_262, _264, float(int(_238)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1362.xy, uint(rint(_1362.z)), _244);
    float3 _1371 = float3(_258, _266, float(int(_238)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1373.xy, uint(rint(_1373.z)), _244);
    float3 _1382 = float3(_254, _266, float(int(_238)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1384.xy, uint(rint(_1384.z)), _244);
    float _280 = _270 + _268;
    float _282 = _280 + _272;
    float _284 = _282 + _274;
    float _286 = _284 + _276;
    float _288 = _286 + _278;
    float _290 = fma(_256, -0.5, _248);
    float3 _1411 = float3(_260, _266, float(int(_238)));
    float3 _1413 = select(_1411, float3(0.0), isnan(_1411));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1413.xy, uint(rint(_1413.z)), _244);
    float3 _1422 = float3(_262, _266, float(int(_238)));
    float3 _1424 = select(_1422, float3(0.0), isnan(_1422));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1424.xy, uint(rint(_1424.z)), _244);
    float3 _1433 = float3(_258, _290, float(int(_238)));
    float3 _1435 = select(_1433, float3(0.0), isnan(_1433));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1435.xy, uint(rint(_1435.z)), _244);
    float3 _1444 = float3(_254, _290, float(int(_238)));
    float3 _1446 = select(_1444, float3(0.0), isnan(_1444));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1446.xy, uint(rint(_1446.z)), _244);
    float3 _1455 = float3(_260, _290, float(int(_238)));
    float3 _1457 = select(_1455, float3(0.0), isnan(_1455));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1457.xy, uint(rint(_1457.z)), _244);
    float3 _1466 = float3(_262, _290, float(int(_238)));
    float3 _1468 = select(_1466, float3(0.0), isnan(_1466));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1468.xy, uint(rint(_1468.z)), _244);
    float _304 = fma(_256, -1.5, _248);
    float _306 = -_106;
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _310 = -_66;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _314 = _308 * _308;
    float _316 = fma(_312, _312, _314);
    float _318 = -_64;
    float _320 = _318 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _322 = fma(_320, _320, _316);
    float _324 = sqrt(_322);
    bool _326 = _324 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _328 = _324 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _330 = !_326;
    int _332 = _330 ? 0 : 1;
    int _334 = 2;
    if (!_326)
    {
        _334 = 1;
    }
    int _336 = _334;
    int _338 = _336;
    if (!_328)
    {
        _338 = _332;
    }
    int _340 = _338;
    float _342 = _106 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _344 = float(_340);
    float _346 = _106 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _348 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _342);
    float _350 = _106 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _352 = precise::min(_344, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _354 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _346);
    float _356 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _348);
    float _358 = _106 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _360 = _352 != 1.0;
    bool _362 = isnan(_352);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.0);
    bool _368 = _364 || _366;
    float _370 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _354);
    float _372 = _356 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _374 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _358);
    float _376 = _106 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _378 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _374);
    float _380 = _372;
    if (_368)
    {
        float _382 = _370 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _380 = _382;
    }
    float _384 = _380;
    float _386 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _350);
    float _388 = _106 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _390 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _386);
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _394 = _392;
    float _396 = _384;
    if (_368)
    {
        float _398 = _378 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _394 = _398;
    }
    float _400 = _394;
    float _402 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _376);
    float _404 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _388);
    float3 _1664 = float3(_258, _304, float(int(_238)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1666.xy, uint(rint(_1666.z)), _244);
    float _408 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _402);
    float _410 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _412 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _404);
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _416 = _414;
    float _418 = _400;
    if (_368)
    {
        float _420 = _408 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _416 = _420;
    }
    float _422 = _416;
    bool _424 = _352 != 0.0;
    bool _426 = isnan(_352);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _410);
    float _436 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _438 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _434);
    float _440 = _422;
    if (!_432)
    {
        float _442 = _438 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _396 = _442;
    }
    float _444 = _396;
    float _446 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _436);
    float _448 = _106 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _450 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _446);
    if (!_432)
    {
        float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _418 = _452;
    }
    float _454 = _418;
    float _456 = _288 + _292;
    float _458 = _456 + _294;
    float _460 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _448);
    float _462 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _464 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _466 = _458 + _296;
    float _468 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _460);
    float _470 = rint(_352);
    float _472 = precise::max(_470, 0.0);
    uint _474 = uint(_472);
    uint _476 = clamp(_474, 0u, 65535u);
    float _478 = _466 + _298;
    if (!_432)
    {
        float _480 = _468 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _440 = _480;
    }
    float _482 = _440;
    float _484 = _478 + _300;
    float _486 = 0.0 + _482;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = _488 * _464;
    float3 _1827 = float3(_254, _304, float(int(_238)));
    float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1829.xy, uint(rint(_1829.z)), _244);
    float3 _1838 = float3(_260, _304, float(int(_238)));
    float3 _1840 = select(_1838, float3(0.0), isnan(_1838));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1840.xy, uint(rint(_1840.z)), _244);
    float3 _1849 = float3(_262, _304, float(int(_238)));
    float3 _1851 = select(_1849, float3(0.0), isnan(_1849));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1851.xy, uint(rint(_1851.z)), _244);
    float _498 = _488 * _462;
    float _500 = fma(_490, 1.5, _454);
    float _502 = fma(_498, 0.5, _444);
    float _504 = fma(_498, -0.5, _444);
    float3 _1872 = float3(_502, _500, float(int(_476)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1874.xy, uint(rint(_1874.z)), _488);
    float3 _1883 = float3(_504, _500, float(int(_476)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1885.xy, uint(rint(_1885.z)), _488);
    float _510 = _484 + _302;
    float _512 = fma(_490, 0.5, _454);
    float _514 = fma(_498, -1.5, _444);
    float _516 = _510 + _406;
    float _518 = _516 + _492;
    float _520 = fma(_498, 1.5, _444);
    float _522 = _518 + _494;
    float3 _1915 = float3(_514, _500, float(int(_476)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1917.xy, uint(rint(_1917.z)), _488);
    float3 _1926 = float3(_520, _500, float(int(_476)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1928.xy, uint(rint(_1928.z)), _488);
    float3 _1937 = float3(_520, _512, float(int(_476)));
    float3 _1939 = select(_1937, float3(0.0), isnan(_1937));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1939.xy, uint(rint(_1939.z)), _488);
    float3 _1948 = float3(_502, _512, float(int(_476)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1950.xy, uint(rint(_1950.z)), _488);
    float3 _1959 = float3(_504, _512, float(int(_476)));
    float3 _1961 = select(_1959, float3(0.0), isnan(_1959));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1961.xy, uint(rint(_1961.z)), _488);
    float3 _1970 = float3(_514, _512, float(int(_476)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1972.xy, uint(rint(_1972.z)), _488);
    float _536 = _522 + _496;
    float _538 = fma(_490, -0.5, _454);
    float _540 = fma(_490, -1.5, _454);
    float3 _1990 = float3(_520, _538, float(int(_476)));
    float3 _1992 = select(_1990, float3(0.0), isnan(_1990));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1992.xy, uint(rint(_1992.z)), _488);
    float _544 = _526 + _506;
    float _546 = _544 + _508;
    float _548 = _546 + _524;
    float _550 = _548 + _528;
    float _552 = _550 + _530;
    float _554 = _552 + _532;
    float3 _2019 = float3(_502, _538, float(int(_476)));
    float3 _2021 = select(_2019, float3(0.0), isnan(_2019));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2021.xy, uint(rint(_2021.z)), _488);
    float3 _2030 = float3(_504, _538, float(int(_476)));
    float3 _2032 = select(_2030, float3(0.0), isnan(_2030));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2032.xy, uint(rint(_2032.z)), _488);
    float3 _2041 = float3(_514, _538, float(int(_476)));
    float3 _2043 = select(_2041, float3(0.0), isnan(_2041));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2043.xy, uint(rint(_2043.z)), _488);
    float3 _2052 = float3(_520, _540, float(int(_476)));
    float3 _2054 = select(_2052, float3(0.0), isnan(_2052));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2054.xy, uint(rint(_2054.z)), _488);
    float3 _2063 = float3(_502, _540, float(int(_476)));
    float3 _2065 = select(_2063, float3(0.0), isnan(_2063));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2065.xy, uint(rint(_2065.z)), _488);
    float _566 = _106 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _568 = _554 + _534;
    float _570 = _106 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _572 = _106 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _574 = _106 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _576 = _106 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _578 = _568 + _542;
    float _580 = _106 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _582 = -_106;
    float _584 = _582 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _586 = _106 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _588 = _106 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _590 = _106 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _592 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _566);
    float _594 = -_66;
    float _596 = _594 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _598 = _584 * _584;
    float _600 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _570);
    float _602 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _572);
    float _604 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _574);
    float _606 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _576);
    float _608 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _590);
    float _610 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _586);
    float _612 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _580);
    float _614 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _588);
    float _616 = fma(_596, _596, _598);
    float _618 = -_64;
    float _620 = _618 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _622 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _600);
    float _624 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _592);
    float _626 = fma(_620, _620, _616);
    float _628 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _608);
    float _630 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _610);
    float _632 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _612);
    float _634 = _624 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _636 = _628 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _638 = sqrt(_626);
    float _640 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _602);
    float _642 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _606);
    float _644 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _604);
    bool _646 = _638 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _648 = _638 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _650 = !_646;
    int _652 = _650 ? 0 : 1;
    int _654 = 2;
    float _656 = _634;
    float _658 = _636;
    if (!_646)
    {
        _654 = 1;
    }
    int _660 = _654;
    int _662 = _660;
    if (!_648)
    {
        _662 = _652;
    }
    int _664 = _662;
    float _666 = float(_664);
    float _668 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _614);
    float _670 = _622 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _672 = precise::min(_666, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _674 = _672 != 1.0;
    bool _676 = isnan(_672);
    bool _678 = _674 || _676;
    bool _680 = isnan(1.0);
    bool _682 = _678 || _680;
    float _684 = _670;
    if (_682)
    {
        float _686 = _630 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _684 = _686;
    }
    float _688 = _684;
    float _690 = _688;
    if (_682)
    {
        float _692 = _632 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _656 = _692;
    }
    float _694 = _656;
    float _696 = _694;
    if (_682)
    {
        float _698 = _668 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _658 = _698;
    }
    float _700 = _658;
    bool _702 = _672 != 0.0;
    bool _704 = isnan(_672);
    bool _706 = _702 || _704;
    bool _708 = isnan(0.0);
    bool _710 = _706 || _708;
    float _712 = _700;
    if (!_710)
    {
        float _714 = _640 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _690 = _714;
    }
    float _716 = _690;
    if (!_710)
    {
        float _718 = _642 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _712 = _718;
    }
    float _720 = _712;
    float _722 = rint(_672);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    uint _728 = clamp(_726, 0u, 65535u);
    if (!_710)
    {
        float _730 = _644 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _696 = _730;
    }
    float _732 = _696;
    float _734 = 0.0 + _720;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = _462 * _736;
    float _740 = _464 * _736;
    float _742 = fma(_738, 0.5, _716);
    float _744 = fma(_740, 1.5, _732);
    float _746 = fma(_738, 1.5, _716);
    float _748 = fma(_740, 0.5, _732);
    float _750 = _578 + _556;
    float _752 = _750 + _558;
    float _754 = _752 + _560;
    float3 _2413 = float3(_504, _540, float(int(_476)));
    float3 _2415 = select(_2413, float3(0.0), isnan(_2413));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2415.xy, uint(rint(_2415.z)), _488);
    float3 _2424 = float3(_514, _540, float(int(_476)));
    float3 _2426 = select(_2424, float3(0.0), isnan(_2424));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2426.xy, uint(rint(_2426.z)), _488);
    float3 _2435 = float3(_742, _744, float(int(_728)));
    float3 _2437 = select(_2435, float3(0.0), isnan(_2435));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2437.xy, uint(rint(_2437.z)), _736);
    float3 _2446 = float3(_746, _744, float(int(_728)));
    float3 _2448 = select(_2446, float3(0.0), isnan(_2446));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2448.xy, uint(rint(_2448.z)), _736);
    float3 _2457 = float3(_742, _748, float(int(_728)));
    float3 _2459 = select(_2457, float3(0.0), isnan(_2457));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2459.xy, uint(rint(_2459.z)), _736);
    float _766 = fma(_738, -0.5, _716);
    float _768 = fma(_738, -1.5, _716);
    float3 _2474 = float3(_766, _744, float(int(_728)));
    float3 _2476 = select(_2474, float3(0.0), isnan(_2474));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2476.xy, uint(rint(_2476.z)), _736);
    float3 _2485 = float3(_768, _744, float(int(_728)));
    float3 _2487 = select(_2485, float3(0.0), isnan(_2485));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2487.xy, uint(rint(_2487.z)), _736);
    float3 _2496 = float3(_746, _748, float(int(_728)));
    float3 _2498 = select(_2496, float3(0.0), isnan(_2496));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2498.xy, uint(rint(_2498.z)), _736);
    float3 _2507 = float3(_766, _748, float(int(_728)));
    float3 _2509 = select(_2507, float3(0.0), isnan(_2507));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2509.xy, uint(rint(_2509.z)), _736);
    float3 _2518 = float3(_768, _748, float(int(_728)));
    float3 _2520 = select(_2518, float3(0.0), isnan(_2518));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2520.xy, uint(rint(_2520.z)), _736);
    float _780 = fma(_740, -1.5, _732);
    float _782 = fma(_740, -0.5, _732);
    float3 _2535 = float3(_742, _782, float(int(_728)));
    float3 _2537 = select(_2535, float3(0.0), isnan(_2535));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2537.xy, uint(rint(_2537.z)), _736);
    float3 _2546 = float3(_766, _782, float(int(_728)));
    float3 _2548 = select(_2546, float3(0.0), isnan(_2546));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2548.xy, uint(rint(_2548.z)), _736);
    float3 _2557 = float3(_746, _782, float(int(_728)));
    float3 _2559 = select(_2557, float3(0.0), isnan(_2557));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2559.xy, uint(rint(_2559.z)), _736);
    float3 _2568 = float3(_768, _782, float(int(_728)));
    float3 _2570 = select(_2568, float3(0.0), isnan(_2568));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2570.xy, uint(rint(_2570.z)), _736);
    float3 _2579 = float3(_746, _780, float(int(_728)));
    float3 _2581 = select(_2579, float3(0.0), isnan(_2579));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2581.xy, uint(rint(_2581.z)), _736);
    float3 _2590 = float3(_742, _780, float(int(_728)));
    float3 _2592 = select(_2590, float3(0.0), isnan(_2590));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2592.xy, uint(rint(_2592.z)), _736);
    float3 _2601 = float3(_766, _780, float(int(_728)));
    float3 _2603 = select(_2601, float3(0.0), isnan(_2601));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2603.xy, uint(rint(_2603.z)), _736);
    float3 _2612 = float3(_768, _780, float(int(_728)));
    float3 _2614 = select(_2612, float3(0.0), isnan(_2612));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2614.xy, uint(rint(_2614.z)), _736);
    float2 _2620 = float2(_52, _54);
    float _800 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2620, float2(0.0), isnan(_2620))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2620, float2(0.0), isnan(_2620))).x;
    float _802 = _754 + _562;
    float _804 = -_64;
    float _806 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _808 = _804 + _806;
    float _810 = -_64;
    float _812 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _814 = _810 + _812;
    float _816 = _802 + _564;
    float _818 = _808 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _820 = precise::clamp(_818, 0.0, 1.0);
    float _822 = fma(_536, 0.0625, _820);
    float _824 = _816 + _756;
    float _826 = _762 + _760;
    float _828 = _824 + _758;
    float _830 = _826 + _770;
    float _832 = _830 + _772;
    float _834 = _832 + _774;
    float _836 = _834 + _764;
    float _838 = _836 + _776;
    float _840 = _838 + _778;
    float _842 = _840 + _788;
    float _844 = _842 + _784;
    float _846 = _844 + _786;
    float _848 = _846 + _790;
    float _850 = _848 + _792;
    float _852 = _850 + _794;
    float _854 = _852 + _796;
    float _856 = _854 + _798;
    float _858 = _856 * 0.0625;
    float _860 = _828 * 0.0625;
    float _862 = _858 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _864 = fma(_860, (*spvDescriptorSet0.fp_c3)._m0[49].z, _862);
    float _866 = _814 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _868 = precise::clamp(_866, 0.0, 1.0);
    float _870 = _864 + _868;
    out.m_45.x = _800;
    out.m_45.y = _822;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _870;
    return out;
}

