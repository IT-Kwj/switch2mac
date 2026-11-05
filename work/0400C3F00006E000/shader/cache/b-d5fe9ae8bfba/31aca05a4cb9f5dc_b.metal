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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _120 = false;
    bool _118 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _908 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_908, float2(0.0), isnan(_908))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_908, float2(0.0), isnan(_908))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _60;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_70;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_78;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_78)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    float _102 = in.m_44.x;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _70 * _102;
    bool _114 = as_type<int>(_110) == 368;
    if (!_114)
    {
        bool _116 = as_type<int>(_110) == 640;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _150;
            _158 = _146;
            _160 = _148;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _190;
            _158 = _186;
            _160 = _188;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _222;
            _158 = _218;
            _160 = _220;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = 1.0 / _226;
    float _236 = float(int(_95));
    float _238 = rint(_236);
    float _240 = precise::max(_238, 0.0);
    uint _242 = uint(_240);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _250 = _234 * _228;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _234 * _230;
    float _256 = _234 * _232;
    float _258 = _252 * _246;
    float _260 = _252 * _248;
    float _262 = fma(_258, 0.5, _254);
    float _264 = fma(_260, 1.5, _256);
    float _266 = fma(_258, 1.5, _254);
    float _268 = fma(_258, -0.5, _254);
    float _270 = fma(_258, -1.5, _254);
    float3 _1351 = float3(_262, _264, float(int(_244)));
    float3 _1355 = select(_1351, float3(0.0), isnan(_1351));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1355.xy, uint(rint(_1355.z)), _252);
    float3 _1364 = float3(_266, _264, float(int(_244)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1366.xy, uint(rint(_1366.z)), _252);
    float3 _1375 = float3(_268, _264, float(int(_244)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1377.xy, uint(rint(_1377.z)), _252);
    float _278 = fma(_260, 0.5, _256);
    float3 _1389 = float3(_270, _264, float(int(_244)));
    float3 _1391 = select(_1389, float3(0.0), isnan(_1389));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1391.xy, uint(rint(_1391.z)), _252);
    float3 _1400 = float3(_266, _278, float(int(_244)));
    float3 _1402 = select(_1400, float3(0.0), isnan(_1400));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1402.xy, uint(rint(_1402.z)), _252);
    float3 _1411 = float3(_262, _278, float(int(_244)));
    float3 _1413 = select(_1411, float3(0.0), isnan(_1411));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1413.xy, uint(rint(_1413.z)), _252);
    float _286 = _274 + _272;
    float _288 = _286 + _276;
    float _290 = _288 + _280;
    float _292 = _290 + _282;
    float _294 = _292 + _284;
    float _296 = fma(_260, -0.5, _256);
    float3 _1440 = float3(_268, _278, float(int(_244)));
    float3 _1442 = select(_1440, float3(0.0), isnan(_1440));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1442.xy, uint(rint(_1442.z)), _252);
    float3 _1451 = float3(_270, _278, float(int(_244)));
    float3 _1453 = select(_1451, float3(0.0), isnan(_1451));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1453.xy, uint(rint(_1453.z)), _252);
    float3 _1462 = float3(_266, _296, float(int(_244)));
    float3 _1464 = select(_1462, float3(0.0), isnan(_1462));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1464.xy, uint(rint(_1464.z)), _252);
    float3 _1473 = float3(_262, _296, float(int(_244)));
    float3 _1475 = select(_1473, float3(0.0), isnan(_1473));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1475.xy, uint(rint(_1475.z)), _252);
    float3 _1484 = float3(_268, _296, float(int(_244)));
    float3 _1486 = select(_1484, float3(0.0), isnan(_1484));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1486.xy, uint(rint(_1486.z)), _252);
    float3 _1495 = float3(_270, _296, float(int(_244)));
    float3 _1497 = select(_1495, float3(0.0), isnan(_1495));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1497.xy, uint(rint(_1497.z)), _252);
    float _310 = -_72;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _314 = fma(_260, -1.5, _256);
    float _316 = -_112;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _320 = _312 * _312;
    float _322 = -_70;
    float _324 = _322 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _326 = fma(_318, _318, _320);
    float _328 = fma(_324, _324, _326);
    float _330 = sqrt(_328);
    bool _332 = _330 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _334 = _330 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _336 = !_332;
    int _338 = _336 ? 0 : 1;
    float _340 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _342 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[22].x, _340);
    float _344 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _346 = 2;
    if (!_332)
    {
        _346 = 1;
    }
    int _348 = _346;
    float _350 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _342);
    int _352 = _348;
    if (!_334)
    {
        _352 = _338;
    }
    int _354 = _352;
    float _356 = float(_354);
    float _358 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _360 = precise::min(_356, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _362 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[19].x, _358);
    float _364 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _366 = _360 != 1.0;
    bool _368 = isnan(_360);
    bool _370 = _366 || _368;
    bool _372 = isnan(1.0);
    bool _374 = _370 || _372;
    float _376 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _362);
    float _378 = _376 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _380 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[20].x, _364);
    float3 _1633 = float3(_266, _314, float(int(_244)));
    float3 _1635 = select(_1633, float3(0.0), isnan(_1633));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1635.xy, uint(rint(_1635.z)), _252);
    float _384 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _386 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _380);
    float _388 = _378;
    if (_374)
    {
        float _390 = _350 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[23].x, _344);
    float _396 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _398 = _386 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _400 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[21].x, _384);
    float _402 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _394);
    float _404 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _400);
    float _406 = _398;
    float _408 = _392;
    if (_374)
    {
        float _410 = _402 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _406 = _410;
    }
    float _412 = _406;
    float _414 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[24].x, _396);
    float _416 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _414);
    float3 _1714 = float3(_262, _314, float(int(_244)));
    float3 _1716 = select(_1714, float3(0.0), isnan(_1714));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1716.xy, uint(rint(_1716.z)), _252);
    float3 _1725 = float3(_268, _314, float(int(_244)));
    float3 _1727 = select(_1725, float3(0.0), isnan(_1725));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1727.xy, uint(rint(_1727.z)), _252);
    float _422 = _404 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _424 = _422;
    float _426 = _412;
    if (_374)
    {
        float _428 = _416 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _424 = _428;
    }
    float _430 = _424;
    bool _432 = _360 != 0.0;
    bool _434 = isnan(_360);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _444 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[16].x, _442);
    float _446 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _448 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _444);
    float _450 = _430;
    if (!_440)
    {
        float _452 = _448 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _408 = _452;
    }
    float _454 = _408;
    float _456 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].x, _446);
    float _458 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _460 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _456);
    if (!_440)
    {
        float _462 = _460 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _426 = _462;
    }
    float _464 = _426;
    float _466 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].x, _458);
    float _468 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _466);
    if (!_440)
    {
        float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _450 = _472;
    }
    float _474 = _450;
    float _476 = 0.0 + _474;
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = _294 + _298;
    float _482 = _480 + _300;
    float _484 = rint(_360);
    float _486 = precise::max(_484, 0.0);
    uint _488 = uint(_486);
    uint _490 = clamp(_488, 0u, 65535u);
    float _492 = _482 + _302;
    float _494 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _496 = _478 * _468;
    float _498 = _492 + _304;
    float _500 = fma(_496, 1.5, _464);
    float _502 = _498 + _306;
    float _504 = _478 * _494;
    float _506 = fma(_504, 0.5, _454);
    float _508 = fma(_504, -0.5, _454);
    float3 _1890 = float3(_270, _314, float(int(_244)));
    float3 _1892 = select(_1890, float3(0.0), isnan(_1890));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1892.xy, uint(rint(_1892.z)), _252);
    float3 _1901 = float3(_506, _500, float(int(_490)));
    float3 _1903 = select(_1901, float3(0.0), isnan(_1901));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1903.xy, uint(rint(_1903.z)), _478);
    float3 _1912 = float3(_508, _500, float(int(_490)));
    float3 _1914 = select(_1912, float3(0.0), isnan(_1912));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1914.xy, uint(rint(_1914.z)), _478);
    float _516 = _502 + _308;
    float _518 = fma(_504, 1.5, _454);
    float _520 = fma(_504, -1.5, _454);
    float _522 = fma(_496, 0.5, _464);
    float _524 = _516 + _382;
    float _526 = _524 + _418;
    float _528 = _526 + _420;
    float3 _1944 = float3(_520, _500, float(int(_490)));
    float3 _1946 = select(_1944, float3(0.0), isnan(_1944));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1946.xy, uint(rint(_1946.z)), _478);
    float3 _1955 = float3(_518, _500, float(int(_490)));
    float3 _1957 = select(_1955, float3(0.0), isnan(_1955));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1957.xy, uint(rint(_1957.z)), _478);
    float3 _1966 = float3(_518, _522, float(int(_490)));
    float3 _1968 = select(_1966, float3(0.0), isnan(_1966));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1968.xy, uint(rint(_1968.z)), _478);
    float3 _1977 = float3(_506, _522, float(int(_490)));
    float3 _1979 = select(_1977, float3(0.0), isnan(_1977));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1979.xy, uint(rint(_1979.z)), _478);
    float3 _1988 = float3(_508, _522, float(int(_490)));
    float3 _1990 = select(_1988, float3(0.0), isnan(_1988));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1990.xy, uint(rint(_1990.z)), _478);
    float3 _1999 = float3(_520, _522, float(int(_490)));
    float3 _2001 = select(_1999, float3(0.0), isnan(_1999));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2001.xy, uint(rint(_2001.z)), _478);
    float _542 = fma(_496, -1.5, _464);
    float _544 = _528 + _510;
    float _546 = _532 + _512;
    float _548 = _546 + _514;
    float _550 = _548 + _530;
    float _552 = fma(_496, -0.5, _464);
    float _554 = _550 + _534;
    float3 _2031 = float3(_518, _552, float(int(_490)));
    float3 _2033 = select(_2031, float3(0.0), isnan(_2031));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2033.xy, uint(rint(_2033.z)), _478);
    float _558 = _554 + _536;
    float3 _2045 = float3(_506, _552, float(int(_490)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2047.xy, uint(rint(_2047.z)), _478);
    float _562 = _558 + _538;
    float3 _2059 = float3(_508, _552, float(int(_490)));
    float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2061.xy, uint(rint(_2061.z)), _478);
    float3 _2070 = float3(_520, _552, float(int(_490)));
    float3 _2072 = select(_2070, float3(0.0), isnan(_2070));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2072.xy, uint(rint(_2072.z)), _478);
    float3 _2081 = float3(_518, _542, float(int(_490)));
    float3 _2083 = select(_2081, float3(0.0), isnan(_2081));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2083.xy, uint(rint(_2083.z)), _478);
    float3 _2092 = float3(_506, _542, float(int(_490)));
    float3 _2094 = select(_2092, float3(0.0), isnan(_2092));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2094.xy, uint(rint(_2094.z)), _478);
    float3 _2103 = float3(_508, _542, float(int(_490)));
    float3 _2105 = select(_2103, float3(0.0), isnan(_2103));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2105.xy, uint(rint(_2105.z)), _478);
    float _574 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _576 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _578 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _580 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _582 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _584 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _586 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _588 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _590 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _592 = _562 + _540;
    float _594 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[25].x, _576);
    float _596 = -_72;
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _600 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[29].x, _574);
    float _602 = -_112;
    float _604 = _602 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _606 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[27].x, _580);
    float _608 = _598 * _598;
    float _610 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[28].x, _582);
    float _612 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[26].x, _578);
    float _614 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[30].x, _584);
    float _616 = fma(_604, _604, _608);
    float _618 = -_70;
    float _620 = _618 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _622 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[31].x, _586);
    float _624 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[32].x, _588);
    float _626 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].x, _590);
    float _628 = fma(_620, _620, _616);
    float _630 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _610);
    float _632 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _600);
    float _634 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _614);
    float _636 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _622);
    float _638 = sqrt(_628);
    float _640 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _624);
    float _642 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _626);
    float _644 = _630 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _646 = _632 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _648 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _606);
    float _650 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _594);
    float _652 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _612);
    bool _654 = _638 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _656 = _638 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _658 = !_654;
    int _660 = _658 ? 0 : 1;
    int _662 = 2;
    float _664 = _644;
    float _666 = _646;
    if (!_654)
    {
        _662 = 1;
    }
    int _668 = _662;
    int _670 = _668;
    if (!_656)
    {
        _670 = _660;
    }
    int _672 = _670;
    float _674 = _634 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _676 = float(_672);
    float _678 = precise::min(_676, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _680 = _678 != 1.0;
    bool _682 = isnan(_678);
    bool _684 = _680 || _682;
    bool _686 = isnan(1.0);
    bool _688 = _684 || _686;
    float _690 = _674;
    if (_688)
    {
        float _692 = _636 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _664 = _692;
    }
    float _694 = _664;
    float _696 = _694;
    if (_688)
    {
        float _698 = _640 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _666 = _698;
    }
    float _700 = _666;
    float _702 = _700;
    if (_688)
    {
        float _704 = _642 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _690 = _704;
    }
    float _706 = _690;
    bool _708 = _678 != 0.0;
    bool _710 = isnan(_678);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    float _718 = rint(_678);
    float _720 = precise::max(_718, 0.0);
    uint _722 = uint(_720);
    uint _724 = clamp(_722, 0u, 65535u);
    float _726 = _706;
    if (!_716)
    {
        float _728 = _648 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _726 = _728;
    }
    float _730 = _726;
    if (!_716)
    {
        float _732 = _650 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _696 = _732;
    }
    float _734 = _696;
    if (!_716)
    {
        float _736 = _652 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _702 = _736;
    }
    float _738 = _702;
    float _740 = 0.0 + _730;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float _744 = _592 + _556;
    float _746 = _494 * _742;
    float _748 = _744 + _560;
    float _750 = fma(_746, 0.5, _734);
    float _752 = fma(_746, -0.5, _734);
    float _754 = fma(_746, -1.5, _734);
    float _756 = _748 + _564;
    float _758 = _468 * _742;
    float3 _2447 = float3(_520, _542, float(int(_490)));
    float3 _2449 = select(_2447, float3(0.0), isnan(_2447));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2449.xy, uint(rint(_2449.z)), _478);
    float _762 = fma(_758, 1.5, _738);
    float3 _2461 = float3(_750, _762, float(int(_724)));
    float3 _2463 = select(_2461, float3(0.0), isnan(_2461));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2463.xy, uint(rint(_2463.z)), _742);
    float3 _2472 = float3(_752, _762, float(int(_724)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2474.xy, uint(rint(_2474.z)), _742);
    float3 _2483 = float3(_754, _762, float(int(_724)));
    float3 _2485 = select(_2483, float3(0.0), isnan(_2483));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2485.xy, uint(rint(_2485.z)), _742);
    float _770 = fma(_746, 1.5, _734);
    float _772 = fma(_758, 0.5, _738);
    float3 _2500 = float3(_770, _762, float(int(_724)));
    float3 _2502 = select(_2500, float3(0.0), isnan(_2500));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2502.xy, uint(rint(_2502.z)), _742);
    float3 _2511 = float3(_770, _772, float(int(_724)));
    float3 _2513 = select(_2511, float3(0.0), isnan(_2511));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2513.xy, uint(rint(_2513.z)), _742);
    float3 _2522 = float3(_750, _772, float(int(_724)));
    float3 _2524 = select(_2522, float3(0.0), isnan(_2522));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2524.xy, uint(rint(_2524.z)), _742);
    float3 _2533 = float3(_752, _772, float(int(_724)));
    float3 _2535 = select(_2533, float3(0.0), isnan(_2533));
    float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2535.xy, uint(rint(_2535.z)), _742);
    float2 _2541 = float2(_54, _56);
    float2 _784 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2541, float2(0.0), isnan(_2541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2541, float2(0.0), isnan(_2541))).xy;
    float _786 = _784.x;
    float _788 = _784.y;
    float _790 = _756 + _566;
    float _792 = _790 + _568;
    float _794 = _792 + _570;
    float _796 = _794 + _572;
    float _798 = fma(_758, -0.5, _738);
    float _800 = _796 + _760;
    float _802 = _774 + _764;
    float _804 = _802 + _766;
    float _806 = _804 + _768;
    float _808 = _806 + _776;
    float3 _2586 = float3(_754, _772, float(int(_724)));
    float3 _2588 = select(_2586, float3(0.0), isnan(_2586));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2588.xy, uint(rint(_2588.z)), _742);
    float3 _2597 = float3(_770, _798, float(int(_724)));
    float3 _2599 = select(_2597, float3(0.0), isnan(_2597));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2599.xy, uint(rint(_2599.z)), _742);
    float3 _2608 = float3(_750, _798, float(int(_724)));
    float3 _2610 = select(_2608, float3(0.0), isnan(_2608));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2610.xy, uint(rint(_2610.z)), _742);
    float3 _2619 = float3(_752, _798, float(int(_724)));
    float3 _2621 = select(_2619, float3(0.0), isnan(_2619));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2621.xy, uint(rint(_2621.z)), _742);
    float _818 = _808 + _778;
    float _820 = fma(_758, -1.5, _738);
    float _822 = _818 + _780;
    float _824 = fma(_786, 2.0, -1.0);
    float _826 = fma(_788, 2.0, -1.0);
    float _828 = _824 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _830 = _826 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _832 = fma(_828, 2.0, _54);
    float _834 = fma(_830, 2.0, _56);
    float3 _2660 = float3(_754, _798, float(int(_724)));
    float3 _2662 = select(_2660, float3(0.0), isnan(_2660));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2662.xy, uint(rint(_2662.z)), _742);
    float3 _2671 = float3(_770, _820, float(int(_724)));
    float3 _2673 = select(_2671, float3(0.0), isnan(_2671));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2673.xy, uint(rint(_2673.z)), _742);
    float3 _2682 = float3(_750, _820, float(int(_724)));
    float3 _2684 = select(_2682, float3(0.0), isnan(_2682));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2684.xy, uint(rint(_2684.z)), _742);
    float3 _2693 = float3(_752, _820, float(int(_724)));
    float3 _2695 = select(_2693, float3(0.0), isnan(_2693));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2695.xy, uint(rint(_2695.z)), _742);
    float3 _2704 = float3(_754, _820, float(int(_724)));
    float3 _2706 = select(_2704, float3(0.0), isnan(_2704));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2706.xy, uint(rint(_2706.z)), _742);
    float2 _2712 = float2(_832, _834);
    float _846 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2712, float2(0.0), isnan(_2712))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2712, float2(0.0), isnan(_2712))).x;
    float _848 = _800 * 0.0625;
    float _850 = _822 + _810;
    float _852 = _850 + _812;
    float _854 = _852 + _814;
    float _856 = _854 + _816;
    float _858 = _856 + _836;
    float _860 = _858 + _838;
    float _862 = _860 + _840;
    float _864 = -_70;
    float _866 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _868 = _864 + _866;
    float _870 = -_70;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _874 = _870 + _872;
    float _876 = _862 + _842;
    float _878 = _868 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _874 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _884 = precise::clamp(_882, 0.0, 1.0);
    float _886 = _876 + _844;
    float _888 = fma(_544, 0.0625, _880);
    float _890 = _886 * 0.0625;
    float _892 = _890 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _894 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[49].z, _892);
    float _896 = _894 + _884;
    out.m_47.x = _846;
    out.m_47.y = _888;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _896;
    return out;
}

