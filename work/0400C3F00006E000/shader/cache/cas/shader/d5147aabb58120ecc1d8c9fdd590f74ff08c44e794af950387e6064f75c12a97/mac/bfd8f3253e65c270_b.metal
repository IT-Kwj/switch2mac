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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _893 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_893, float2(0.0), isnan(_893))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_893, float2(0.0), isnan(_893))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = -_66;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_66;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = in.m_40.x;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _66 * _106;
    float _118 = _66 * _56;
    bool _120 = as_type<int>(_114) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_114) == 688;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _118 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _118 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _118 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _156;
            _164 = _152;
            _166 = _154;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _118 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _118 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _118 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _118 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _196;
            _164 = _192;
            _166 = _194;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _118 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _118 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _118 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _118 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _228;
            _164 = _224;
            _166 = _226;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = 1.0 / _232;
    float _242 = float(int(_100));
    float _244 = rint(_242);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _254 = _240 * _234;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _240 * _236;
    float _260 = _240 * _238;
    float _262 = _256 * _252;
    float _264 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _266 = fma(_262, 0.5, _258);
    float _268 = _256 * _264;
    float _270 = fma(_262, 1.5, _258);
    float _272 = fma(_262, -0.5, _258);
    float _274 = fma(_268, 1.5, _260);
    float _276 = fma(_262, -1.5, _258);
    float3 _1352 = float3(_266, _274, float(int(_250)));
    float3 _1356 = select(_1352, float3(0.0), isnan(_1352));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1356.xy, uint(rint(_1356.z)), _256);
    float3 _1365 = float3(_270, _274, float(int(_250)));
    float3 _1367 = select(_1365, float3(0.0), isnan(_1365));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1367.xy, uint(rint(_1367.z)), _256);
    float3 _1376 = float3(_272, _274, float(int(_250)));
    float3 _1378 = select(_1376, float3(0.0), isnan(_1376));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1378.xy, uint(rint(_1378.z)), _256);
    float3 _1387 = float3(_276, _274, float(int(_250)));
    float3 _1389 = select(_1387, float3(0.0), isnan(_1387));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1389.xy, uint(rint(_1389.z)), _256);
    float _286 = fma(_268, 0.5, _260);
    float3 _1401 = float3(_270, _286, float(int(_250)));
    float3 _1403 = select(_1401, float3(0.0), isnan(_1401));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1403.xy, uint(rint(_1403.z)), _256);
    float3 _1412 = float3(_266, _286, float(int(_250)));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1414.xy, uint(rint(_1414.z)), _256);
    float _292 = fma(_268, -0.5, _260);
    float _294 = _280 + _278;
    float _296 = _294 + _282;
    float _298 = _296 + _284;
    float _300 = _298 + _288;
    float3 _1438 = float3(_272, _286, float(int(_250)));
    float3 _1440 = select(_1438, float3(0.0), isnan(_1438));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1440.xy, uint(rint(_1440.z)), _256);
    float3 _1449 = float3(_276, _286, float(int(_250)));
    float3 _1451 = select(_1449, float3(0.0), isnan(_1449));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1451.xy, uint(rint(_1451.z)), _256);
    float3 _1460 = float3(_270, _292, float(int(_250)));
    float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1462.xy, uint(rint(_1462.z)), _256);
    float3 _1471 = float3(_266, _292, float(int(_250)));
    float3 _1473 = select(_1471, float3(0.0), isnan(_1471));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1473.xy, uint(rint(_1473.z)), _256);
    float3 _1482 = float3(_272, _292, float(int(_250)));
    float3 _1484 = select(_1482, float3(0.0), isnan(_1482));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1484.xy, uint(rint(_1484.z)), _256);
    float3 _1493 = float3(_276, _292, float(int(_250)));
    float3 _1495 = select(_1493, float3(0.0), isnan(_1493));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1495.xy, uint(rint(_1495.z)), _256);
    float _314 = -_118;
    float _316 = _314 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _318 = -_116;
    float _320 = _318 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _322 = _300 + _290;
    float _324 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _326 = _316 * _316;
    float _328 = fma(_320, _320, _326);
    float _330 = -_66;
    float _332 = _330 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _334 = fma(_332, _332, _328);
    float _336 = _118 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _338 = _118 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _340 = _118 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _342 = fma(_268, -1.5, _260);
    float _344 = sqrt(_334);
    float _346 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[22].x, _336);
    float _348 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[20].x, _338);
    float _350 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[23].x, _340);
    float _352 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _346);
    float _354 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _348);
    float _356 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _350);
    bool _358 = _344 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _360 = _344 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _362 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _364 = !_358;
    int _366 = _364 ? 0 : 1;
    int _368 = 2;
    if (!_358)
    {
        _368 = 1;
    }
    int _370 = _368;
    int _372 = _370;
    if (!_360)
    {
        _372 = _366;
    }
    int _374 = _372;
    float _376 = _354 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _378 = _118 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _380 = float(_374);
    float _382 = _118 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _384 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[17].x, _378);
    float _386 = precise::min(_380, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _388 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[19].x, _382);
    float _390 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _384);
    bool _392 = _386 != 1.0;
    bool _394 = isnan(_386);
    bool _396 = _392 || _394;
    bool _398 = isnan(1.0);
    bool _400 = _396 || _398;
    float _402 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _388);
    bool _404 = _386 != 0.0;
    bool _406 = isnan(_386);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = _402 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _416 = _118 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _418 = _414;
    float _420 = _376;
    if (_400)
    {
        float _422 = _352 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _418 = _422;
    }
    float _424 = _418;
    float _426 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[21].x, _416);
    float _428 = _424;
    if (_400)
    {
        float _430 = _356 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _420 = _430;
    }
    float _432 = _420;
    float _434 = _118 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _436 = _118 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _438 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _426);
    float _440 = _432;
    if (!_412)
    {
        float _442 = _390 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[24].x, _434);
    float _448 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[16].x, _436);
    float _450 = _438 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _452 = _118 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _454 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _446);
    float _456 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _448);
    float _458 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[18].x, _452);
    float _460 = _450;
    if (_400)
    {
        float _462 = _454 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _460 = _462;
    }
    float _464 = _460;
    float _466 = _464;
    if (!_412)
    {
        float _468 = _456 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _428 = _468;
    }
    float _470 = _428;
    float _472 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _458);
    if (!_412)
    {
        float _474 = _472 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _466 = _474;
    }
    float _476 = _466;
    float _478 = 0.0 + _476;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = _480 * _324;
    float _484 = _480 * _362;
    float _486 = fma(_482, 0.5, _470);
    float _488 = fma(_482, 1.5, _470);
    float _490 = fma(_482, -0.5, _470);
    float _492 = fma(_482, -1.5, _470);
    float _494 = fma(_484, 0.5, _444);
    float _496 = _322 + _302;
    float _498 = _496 + _304;
    float _500 = _498 + _306;
    float _502 = _500 + _308;
    float3 _1853 = float3(_270, _342, float(int(_250)));
    float3 _1855 = select(_1853, float3(0.0), isnan(_1853));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1855.xy, uint(rint(_1855.z)), _256);
    float _506 = fma(_484, 1.5, _444);
    float _508 = _502 + _310;
    float _510 = rint(_386);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    uint _516 = clamp(_514, 0u, 65535u);
    float _518 = _508 + _312;
    float3 _1881 = float3(_266, _342, float(int(_250)));
    float3 _1883 = select(_1881, float3(0.0), isnan(_1881));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1883.xy, uint(rint(_1883.z)), _256);
    float3 _1892 = float3(_272, _342, float(int(_250)));
    float3 _1894 = select(_1892, float3(0.0), isnan(_1892));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1894.xy, uint(rint(_1894.z)), _256);
    float3 _1903 = float3(_276, _342, float(int(_250)));
    float3 _1905 = select(_1903, float3(0.0), isnan(_1903));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1905.xy, uint(rint(_1905.z)), _256);
    float3 _1914 = float3(_486, _506, float(int(_516)));
    float3 _1916 = select(_1914, float3(0.0), isnan(_1914));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1916.xy, uint(rint(_1916.z)), _480);
    float3 _1925 = float3(_488, _506, float(int(_516)));
    float3 _1927 = select(_1925, float3(0.0), isnan(_1925));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1927.xy, uint(rint(_1927.z)), _480);
    float3 _1936 = float3(_490, _506, float(int(_516)));
    float3 _1938 = select(_1936, float3(0.0), isnan(_1936));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1938.xy, uint(rint(_1938.z)), _480);
    float3 _1947 = float3(_492, _506, float(int(_516)));
    float3 _1949 = select(_1947, float3(0.0), isnan(_1947));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1949.xy, uint(rint(_1949.z)), _480);
    float3 _1958 = float3(_488, _494, float(int(_516)));
    float3 _1960 = select(_1958, float3(0.0), isnan(_1958));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1960.xy, uint(rint(_1960.z)), _480);
    float _536 = _518 + _504;
    float _538 = fma(_484, -0.5, _444);
    float _540 = _536 + _520;
    float _542 = _540 + _522;
    float _544 = _542 + _524;
    float _546 = _528 + _526;
    float3 _1987 = float3(_486, _494, float(int(_516)));
    float3 _1989 = select(_1987, float3(0.0), isnan(_1987));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1989.xy, uint(rint(_1989.z)), _480);
    float _550 = _546 + _530;
    float3 _2001 = float3(_490, _494, float(int(_516)));
    float3 _2003 = select(_2001, float3(0.0), isnan(_2001));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2003.xy, uint(rint(_2003.z)), _480);
    float3 _2012 = float3(_492, _494, float(int(_516)));
    float3 _2014 = select(_2012, float3(0.0), isnan(_2012));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2014.xy, uint(rint(_2014.z)), _480);
    float3 _2023 = float3(_488, _538, float(int(_516)));
    float3 _2025 = select(_2023, float3(0.0), isnan(_2023));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2025.xy, uint(rint(_2025.z)), _480);
    float3 _2034 = float3(_486, _538, float(int(_516)));
    float3 _2036 = select(_2034, float3(0.0), isnan(_2034));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2036.xy, uint(rint(_2036.z)), _480);
    float _560 = _550 + _532;
    float _562 = _560 + _534;
    float _564 = _562 + _548;
    float _566 = fma(_484, -1.5, _444);
    float _568 = _564 + _552;
    float3 _2060 = float3(_490, _538, float(int(_516)));
    float3 _2062 = select(_2060, float3(0.0), isnan(_2060));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2062.xy, uint(rint(_2062.z)), _480);
    float3 _2071 = float3(_492, _538, float(int(_516)));
    float3 _2073 = select(_2071, float3(0.0), isnan(_2071));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2073.xy, uint(rint(_2073.z)), _480);
    float3 _2082 = float3(_488, _566, float(int(_516)));
    float3 _2084 = select(_2082, float3(0.0), isnan(_2082));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2084.xy, uint(rint(_2084.z)), _480);
    float3 _2093 = float3(_486, _566, float(int(_516)));
    float3 _2095 = select(_2093, float3(0.0), isnan(_2093));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2095.xy, uint(rint(_2095.z)), _480);
    float3 _2104 = float3(_490, _566, float(int(_516)));
    float3 _2106 = select(_2104, float3(0.0), isnan(_2104));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2106.xy, uint(rint(_2106.z)), _480);
    float _580 = _568 + _554;
    float _582 = _118 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _584 = _118 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _586 = _118 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _588 = _580 + _556;
    float _590 = _118 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _592 = _118 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _594 = _118 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _596 = _118 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _598 = _118 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _600 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[27].x, _584);
    float _602 = _118 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _604 = -_118;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _608 = -_116;
    float _610 = _608 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _612 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[30].x, _592);
    float _614 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[31].x, _594);
    float _616 = _606 * _606;
    float _618 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[25].x, _590);
    float _620 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[32].x, _596);
    float _622 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[26].x, _582);
    float _624 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[28].x, _586);
    float _626 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[29].x, _598);
    float _628 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[33].x, _602);
    float _630 = fma(_610, _610, _616);
    float _632 = -_66;
    float _634 = _632 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _636 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _624);
    float _638 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _626);
    float _640 = fma(_634, _634, _630);
    float _642 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _612);
    float _644 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _614);
    float _646 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _620);
    float _648 = _638 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _650 = _642 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _652 = sqrt(_640);
    float _654 = _588 + _558;
    float _656 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _600);
    float _658 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _618);
    float _660 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _622);
    bool _662 = _652 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _664 = _652 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _666 = !_662;
    int _668 = _666 ? 0 : 1;
    int _670 = 2;
    float _672 = _648;
    float _674 = _650;
    if (!_662)
    {
        _670 = 1;
    }
    int _676 = _670;
    int _678 = _676;
    if (!_664)
    {
        _678 = _668;
    }
    int _680 = _678;
    float _682 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _628);
    float _684 = _636 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _686 = float(_680);
    float _688 = precise::min(_686, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _690 = _688 != 1.0;
    bool _692 = isnan(_688);
    bool _694 = _690 || _692;
    bool _696 = isnan(1.0);
    bool _698 = _694 || _696;
    float _700 = _684;
    if (_698)
    {
        float _702 = _644 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _700 = _702;
    }
    float _704 = _700;
    float _706 = _704;
    if (_698)
    {
        float _708 = _646 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _672 = _708;
    }
    float _710 = _672;
    float _712 = _710;
    if (_698)
    {
        float _714 = _682 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _674 = _714;
    }
    float _716 = _674;
    bool _718 = _688 != 0.0;
    bool _720 = isnan(_688);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = rint(_688);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    uint _734 = clamp(_732, 0u, 65535u);
    float _736 = _716;
    if (!_726)
    {
        float _738 = _656 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _736 = _738;
    }
    float _740 = _736;
    if (!_726)
    {
        float _742 = _658 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _706 = _742;
    }
    float _744 = _706;
    if (!_726)
    {
        float _746 = _660 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _712 = _746;
    }
    float _748 = _712;
    float _750 = 0.0 + _740;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _362 * _752;
    float _756 = _324 * _752;
    float _758 = fma(_754, 0.5, _748);
    float _760 = fma(_756, 0.5, _744);
    float _762 = fma(_756, 1.5, _744);
    float _764 = fma(_756, -0.5, _744);
    float _766 = _654 + _570;
    float _768 = fma(_754, 1.5, _748);
    float _770 = _766 + _572;
    float3 _2457 = float3(_492, _566, float(int(_516)));
    float3 _2459 = select(_2457, float3(0.0), isnan(_2457));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2459.xy, uint(rint(_2459.z)), _480);
    float3 _2468 = float3(_760, _768, float(int(_734)));
    float3 _2470 = select(_2468, float3(0.0), isnan(_2468));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2470.xy, uint(rint(_2470.z)), _752);
    float3 _2479 = float3(_762, _768, float(int(_734)));
    float3 _2481 = select(_2479, float3(0.0), isnan(_2479));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2481.xy, uint(rint(_2481.z)), _752);
    float3 _2490 = float3(_764, _768, float(int(_734)));
    float3 _2492 = select(_2490, float3(0.0), isnan(_2490));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2492.xy, uint(rint(_2492.z)), _752);
    float3 _2501 = float3(_760, _758, float(int(_734)));
    float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
    float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2503.xy, uint(rint(_2503.z)), _752);
    float _782 = _770 + _574;
    float _784 = fma(_756, -1.5, _744);
    float _786 = _782 + _576;
    float3 _2521 = float3(_784, _768, float(int(_734)));
    float3 _2523 = select(_2521, float3(0.0), isnan(_2521));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2523.xy, uint(rint(_2523.z)), _752);
    float _790 = _786 + _578;
    float3 _2535 = float3(_762, _758, float(int(_734)));
    float3 _2537 = select(_2535, float3(0.0), isnan(_2535));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2537.xy, uint(rint(_2537.z)), _752);
    float _794 = fma(_754, -0.5, _748);
    float3 _2549 = float3(_764, _758, float(int(_734)));
    float3 _2551 = select(_2549, float3(0.0), isnan(_2549));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2551.xy, uint(rint(_2551.z)), _752);
    float3 _2560 = float3(_784, _758, float(int(_734)));
    float3 _2562 = select(_2560, float3(0.0), isnan(_2560));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2562.xy, uint(rint(_2562.z)), _752);
    float3 _2571 = float3(_762, _794, float(int(_734)));
    float3 _2573 = select(_2571, float3(0.0), isnan(_2571));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2573.xy, uint(rint(_2573.z)), _752);
    float3 _2582 = float3(_760, _794, float(int(_734)));
    float3 _2584 = select(_2582, float3(0.0), isnan(_2582));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2584.xy, uint(rint(_2584.z)), _752);
    float _804 = fma(_754, -1.5, _748);
    float3 _2596 = float3(_764, _794, float(int(_734)));
    float3 _2598 = select(_2596, float3(0.0), isnan(_2596));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2598.xy, uint(rint(_2598.z)), _752);
    float3 _2607 = float3(_784, _794, float(int(_734)));
    float3 _2609 = select(_2607, float3(0.0), isnan(_2607));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2609.xy, uint(rint(_2609.z)), _752);
    float3 _2618 = float3(_762, _804, float(int(_734)));
    float3 _2620 = select(_2618, float3(0.0), isnan(_2618));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2620.xy, uint(rint(_2620.z)), _752);
    float3 _2629 = float3(_760, _804, float(int(_734)));
    float3 _2631 = select(_2629, float3(0.0), isnan(_2629));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2631.xy, uint(rint(_2631.z)), _752);
    float3 _2640 = float3(_764, _804, float(int(_734)));
    float3 _2642 = select(_2640, float3(0.0), isnan(_2640));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2642.xy, uint(rint(_2642.z)), _752);
    float _816 = _790 + _772;
    float3 _2654 = float3(_784, _804, float(int(_734)));
    float3 _2656 = select(_2654, float3(0.0), isnan(_2654));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2656.xy, uint(rint(_2656.z)), _752);
    float _820 = _776 + _774;
    float _822 = _820 + _778;
    float _824 = _822 + _788;
    float _826 = _816 * 0.0625;
    float _828 = _824 + _792;
    float _830 = _828 + _780;
    float _832 = -_66;
    float _834 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _836 = _832 + _834;
    float _838 = _830 + _796;
    float _840 = -_66;
    float _842 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _844 = _840 + _842;
    float _846 = _836 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _848 = precise::clamp(_846, 0.0, 1.0);
    float _850 = _838 + _798;
    float _852 = _844 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _854 = precise::clamp(_852, 0.0, 1.0);
    float _856 = _850 + _800;
    float _858 = fma(_544, 0.0625, _854);
    float _860 = _856 + _802;
    float _862 = _860 + _806;
    float _864 = _862 + _808;
    float _866 = _864 + _810;
    float _868 = _866 + _812;
    float _870 = _868 + _814;
    float _872 = _870 + _818;
    float _874 = _872 * 0.0625;
    float _876 = _874 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _878 = fma(_826, (*spvDescriptorSet0.fp_c3)._m0[49].z, _876);
    float _880 = _878 + _848;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _858;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _880;
    return out;
}

