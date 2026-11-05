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
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _889 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_889, float2(0.0), isnan(_889))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_889, float2(0.0), isnan(_889))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = -_62;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_62;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _78 = !_68;
    int _81 = _78 ? 0 : 1;
    int _83 = 2;
    if (!_68)
    {
        _83 = 1;
    }
    int _85 = _83;
    int _87 = _85;
    if (!_72)
    {
        _87 = _81;
    }
    int _89 = _87;
    int _91 = _89 + 1;
    uint _94 = uint(_91);
    if (!_76)
    {
        _94 = uint(_89);
    }
    uint _96 = _94;
    uint _98 = min(_96, 2u);
    int _100 = int(_98) << 2;
    float _102 = in.m_40.x;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _62 * _102;
    float _114 = _62 * _56;
    bool _116 = as_type<int>(_110) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_110) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _114 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _114 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _114 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _152;
            _160 = _148;
            _162 = _150;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _114 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _114 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _114 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _114 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _192;
            _160 = _188;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _114 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _114 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _114 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _114 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _224;
            _160 = _220;
            _162 = _222;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = 1.0 / _228;
    float _238 = float(int(_96));
    float _240 = rint(_238);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _250 = _236 * _230;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _236 * _232;
    float _256 = _236 * _234;
    float _258 = _252 * _248;
    float _260 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _262 = fma(_258, 0.5, _254);
    float _264 = _252 * _260;
    float _266 = fma(_258, 1.5, _254);
    float _268 = fma(_258, -0.5, _254);
    float _270 = fma(_264, 1.5, _256);
    float _272 = fma(_258, -1.5, _254);
    float3 _1344 = float3(_262, _270, float(int(_246)));
    float3 _1348 = select(_1344, float3(0.0), isnan(_1344));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1348.xy, uint(rint(_1348.z)), _252);
    float3 _1357 = float3(_266, _270, float(int(_246)));
    float3 _1359 = select(_1357, float3(0.0), isnan(_1357));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1359.xy, uint(rint(_1359.z)), _252);
    float3 _1368 = float3(_268, _270, float(int(_246)));
    float3 _1370 = select(_1368, float3(0.0), isnan(_1368));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1370.xy, uint(rint(_1370.z)), _252);
    float3 _1379 = float3(_272, _270, float(int(_246)));
    float3 _1381 = select(_1379, float3(0.0), isnan(_1379));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1381.xy, uint(rint(_1381.z)), _252);
    float _282 = fma(_264, 0.5, _256);
    float3 _1393 = float3(_266, _282, float(int(_246)));
    float3 _1395 = select(_1393, float3(0.0), isnan(_1393));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1395.xy, uint(rint(_1395.z)), _252);
    float3 _1404 = float3(_262, _282, float(int(_246)));
    float3 _1406 = select(_1404, float3(0.0), isnan(_1404));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1406.xy, uint(rint(_1406.z)), _252);
    float _288 = fma(_264, -0.5, _256);
    float _290 = _276 + _274;
    float _292 = _290 + _278;
    float _294 = _292 + _280;
    float _296 = _294 + _284;
    float3 _1430 = float3(_268, _282, float(int(_246)));
    float3 _1432 = select(_1430, float3(0.0), isnan(_1430));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1432.xy, uint(rint(_1432.z)), _252);
    float3 _1441 = float3(_272, _282, float(int(_246)));
    float3 _1443 = select(_1441, float3(0.0), isnan(_1441));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1443.xy, uint(rint(_1443.z)), _252);
    float3 _1452 = float3(_266, _288, float(int(_246)));
    float3 _1454 = select(_1452, float3(0.0), isnan(_1452));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1454.xy, uint(rint(_1454.z)), _252);
    float3 _1463 = float3(_262, _288, float(int(_246)));
    float3 _1465 = select(_1463, float3(0.0), isnan(_1463));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1465.xy, uint(rint(_1465.z)), _252);
    float3 _1474 = float3(_268, _288, float(int(_246)));
    float3 _1476 = select(_1474, float3(0.0), isnan(_1474));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1476.xy, uint(rint(_1476.z)), _252);
    float3 _1485 = float3(_272, _288, float(int(_246)));
    float3 _1487 = select(_1485, float3(0.0), isnan(_1485));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1487.xy, uint(rint(_1487.z)), _252);
    float _310 = -_114;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _314 = -_112;
    float _316 = _314 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _318 = _296 + _286;
    float _320 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _322 = _312 * _312;
    float _324 = fma(_316, _316, _322);
    float _326 = -_62;
    float _328 = _326 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _330 = fma(_328, _328, _324);
    float _332 = _114 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _334 = _114 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _336 = _114 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _338 = fma(_264, -1.5, _256);
    float _340 = sqrt(_330);
    float _342 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[22].x, _332);
    float _344 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[20].x, _334);
    float _346 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[23].x, _336);
    float _348 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[22].z, _342);
    float _350 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[20].z, _344);
    float _352 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[23].z, _346);
    bool _354 = _340 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _356 = _340 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _358 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _360 = !_354;
    int _362 = _360 ? 0 : 1;
    int _364 = 2;
    if (!_354)
    {
        _364 = 1;
    }
    int _366 = _364;
    int _368 = _366;
    if (!_356)
    {
        _368 = _362;
    }
    int _370 = _368;
    float _372 = _350 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _374 = _114 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _376 = float(_370);
    float _378 = _114 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _380 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].x, _374);
    float _382 = precise::min(_376, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _384 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[19].x, _378);
    float _386 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[17].z, _380);
    bool _388 = _382 != 1.0;
    bool _390 = isnan(_382);
    bool _392 = _388 || _390;
    bool _394 = isnan(1.0);
    bool _396 = _392 || _394;
    float _398 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[19].z, _384);
    bool _400 = _382 != 0.0;
    bool _402 = isnan(_382);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _398 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _412 = _114 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _414 = _410;
    float _416 = _372;
    if (_396)
    {
        float _418 = _348 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _414 = _418;
    }
    float _420 = _414;
    float _422 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[21].x, _412);
    float _424 = _420;
    if (_396)
    {
        float _426 = _352 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _416 = _426;
    }
    float _428 = _416;
    float _430 = _114 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _432 = _114 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _434 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[21].z, _422);
    float _436 = _428;
    if (!_408)
    {
        float _438 = _386 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _436 = _438;
    }
    float _440 = _436;
    float _442 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[24].x, _430);
    float _444 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[16].x, _432);
    float _446 = _434 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _448 = _114 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _450 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[24].z, _442);
    float _452 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[16].z, _444);
    float _454 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].x, _448);
    float _456 = _446;
    if (_396)
    {
        float _458 = _450 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _456 = _458;
    }
    float _460 = _456;
    float _462 = _460;
    if (!_408)
    {
        float _464 = _452 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _424 = _464;
    }
    float _466 = _424;
    float _468 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[18].z, _454);
    if (!_408)
    {
        float _470 = _468 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _462 = _470;
    }
    float _472 = _462;
    float _474 = 0.0 + _472;
    float _476 = precise::clamp(_474, 0.0, 1.0);
    float _478 = _476 * _320;
    float _480 = _476 * _358;
    float _482 = fma(_478, 0.5, _466);
    float _484 = fma(_478, 1.5, _466);
    float _486 = fma(_478, -0.5, _466);
    float _488 = fma(_478, -1.5, _466);
    float _490 = fma(_480, 0.5, _440);
    float _492 = _318 + _298;
    float _494 = _492 + _300;
    float _496 = _494 + _302;
    float _498 = _496 + _304;
    float3 _1845 = float3(_266, _338, float(int(_246)));
    float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1847.xy, uint(rint(_1847.z)), _252);
    float _502 = fma(_480, 1.5, _440);
    float _504 = _498 + _306;
    float _506 = rint(_382);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    uint _512 = clamp(_510, 0u, 65535u);
    float _514 = _504 + _308;
    float3 _1873 = float3(_262, _338, float(int(_246)));
    float3 _1875 = select(_1873, float3(0.0), isnan(_1873));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1875.xy, uint(rint(_1875.z)), _252);
    float3 _1884 = float3(_268, _338, float(int(_246)));
    float3 _1886 = select(_1884, float3(0.0), isnan(_1884));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1886.xy, uint(rint(_1886.z)), _252);
    float3 _1895 = float3(_272, _338, float(int(_246)));
    float3 _1897 = select(_1895, float3(0.0), isnan(_1895));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1897.xy, uint(rint(_1897.z)), _252);
    float3 _1906 = float3(_482, _502, float(int(_512)));
    float3 _1908 = select(_1906, float3(0.0), isnan(_1906));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1908.xy, uint(rint(_1908.z)), _476);
    float3 _1917 = float3(_484, _502, float(int(_512)));
    float3 _1919 = select(_1917, float3(0.0), isnan(_1917));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1919.xy, uint(rint(_1919.z)), _476);
    float3 _1928 = float3(_486, _502, float(int(_512)));
    float3 _1930 = select(_1928, float3(0.0), isnan(_1928));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1930.xy, uint(rint(_1930.z)), _476);
    float3 _1939 = float3(_488, _502, float(int(_512)));
    float3 _1941 = select(_1939, float3(0.0), isnan(_1939));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1941.xy, uint(rint(_1941.z)), _476);
    float3 _1950 = float3(_484, _490, float(int(_512)));
    float3 _1952 = select(_1950, float3(0.0), isnan(_1950));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1952.xy, uint(rint(_1952.z)), _476);
    float _532 = _514 + _500;
    float _534 = fma(_480, -0.5, _440);
    float _536 = _532 + _516;
    float _538 = _536 + _518;
    float _540 = _538 + _520;
    float _542 = _524 + _522;
    float3 _1979 = float3(_482, _490, float(int(_512)));
    float3 _1981 = select(_1979, float3(0.0), isnan(_1979));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1981.xy, uint(rint(_1981.z)), _476);
    float _546 = _542 + _526;
    float3 _1993 = float3(_486, _490, float(int(_512)));
    float3 _1995 = select(_1993, float3(0.0), isnan(_1993));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1995.xy, uint(rint(_1995.z)), _476);
    float3 _2004 = float3(_488, _490, float(int(_512)));
    float3 _2006 = select(_2004, float3(0.0), isnan(_2004));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2006.xy, uint(rint(_2006.z)), _476);
    float3 _2015 = float3(_484, _534, float(int(_512)));
    float3 _2017 = select(_2015, float3(0.0), isnan(_2015));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2017.xy, uint(rint(_2017.z)), _476);
    float3 _2026 = float3(_482, _534, float(int(_512)));
    float3 _2028 = select(_2026, float3(0.0), isnan(_2026));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2028.xy, uint(rint(_2028.z)), _476);
    float _556 = _546 + _528;
    float _558 = _556 + _530;
    float _560 = _558 + _544;
    float _562 = fma(_480, -1.5, _440);
    float _564 = _560 + _548;
    float3 _2052 = float3(_486, _534, float(int(_512)));
    float3 _2054 = select(_2052, float3(0.0), isnan(_2052));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2054.xy, uint(rint(_2054.z)), _476);
    float3 _2063 = float3(_488, _534, float(int(_512)));
    float3 _2065 = select(_2063, float3(0.0), isnan(_2063));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2065.xy, uint(rint(_2065.z)), _476);
    float3 _2074 = float3(_484, _562, float(int(_512)));
    float3 _2076 = select(_2074, float3(0.0), isnan(_2074));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2076.xy, uint(rint(_2076.z)), _476);
    float3 _2085 = float3(_482, _562, float(int(_512)));
    float3 _2087 = select(_2085, float3(0.0), isnan(_2085));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2087.xy, uint(rint(_2087.z)), _476);
    float3 _2096 = float3(_486, _562, float(int(_512)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2098.xy, uint(rint(_2098.z)), _476);
    float _576 = _564 + _550;
    float _578 = _114 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _580 = _114 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _582 = _114 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _584 = _576 + _552;
    float _586 = _114 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _588 = _114 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _590 = _114 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _592 = _114 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _594 = _114 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _596 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[27].x, _580);
    float _598 = _114 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _600 = -_114;
    float _602 = _600 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _604 = -_112;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _608 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[30].x, _588);
    float _610 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[31].x, _590);
    float _612 = _602 * _602;
    float _614 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[25].x, _586);
    float _616 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[32].x, _592);
    float _618 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[26].x, _578);
    float _620 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[28].x, _582);
    float _622 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[29].x, _594);
    float _624 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].x, _598);
    float _626 = fma(_606, _606, _612);
    float _628 = -_62;
    float _630 = _628 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _632 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[28].z, _620);
    float _634 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[29].z, _622);
    float _636 = fma(_630, _630, _626);
    float _638 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[30].z, _608);
    float _640 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[31].z, _610);
    float _642 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[32].z, _616);
    float _644 = _634 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _646 = _638 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _648 = sqrt(_636);
    float _650 = _584 + _554;
    float _652 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[27].z, _596);
    float _654 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[25].z, _614);
    float _656 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[26].z, _618);
    bool _658 = _648 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _660 = _648 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _662 = !_658;
    int _664 = _662 ? 0 : 1;
    int _666 = 2;
    float _668 = _644;
    float _670 = _646;
    if (!_658)
    {
        _666 = 1;
    }
    int _672 = _666;
    int _674 = _672;
    if (!_660)
    {
        _674 = _664;
    }
    int _676 = _674;
    float _678 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[33].z, _624);
    float _680 = _632 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _682 = float(_676);
    float _684 = precise::min(_682, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _686 = _684 != 1.0;
    bool _688 = isnan(_684);
    bool _690 = _686 || _688;
    bool _692 = isnan(1.0);
    bool _694 = _690 || _692;
    float _696 = _680;
    if (_694)
    {
        float _698 = _640 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _696 = _698;
    }
    float _700 = _696;
    float _702 = _700;
    if (_694)
    {
        float _704 = _642 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _668 = _704;
    }
    float _706 = _668;
    float _708 = _706;
    if (_694)
    {
        float _710 = _678 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _670 = _710;
    }
    float _712 = _670;
    bool _714 = _684 != 0.0;
    bool _716 = isnan(_684);
    bool _718 = _714 || _716;
    bool _720 = isnan(0.0);
    bool _722 = _718 || _720;
    float _724 = rint(_684);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = clamp(_728, 0u, 65535u);
    float _732 = _712;
    if (!_722)
    {
        float _734 = _652 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _732 = _734;
    }
    float _736 = _732;
    if (!_722)
    {
        float _738 = _654 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _702 = _738;
    }
    float _740 = _702;
    if (!_722)
    {
        float _742 = _656 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _708 = _742;
    }
    float _744 = _708;
    float _746 = 0.0 + _736;
    float _748 = precise::clamp(_746, 0.0, 1.0);
    float _750 = _358 * _748;
    float _752 = _320 * _748;
    float _754 = fma(_750, 0.5, _744);
    float _756 = fma(_752, 0.5, _740);
    float _758 = fma(_752, 1.5, _740);
    float _760 = fma(_752, -0.5, _740);
    float _762 = _650 + _566;
    float _764 = fma(_750, 1.5, _744);
    float _766 = _762 + _568;
    float3 _2449 = float3(_488, _562, float(int(_512)));
    float3 _2451 = select(_2449, float3(0.0), isnan(_2449));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2451.xy, uint(rint(_2451.z)), _476);
    float3 _2460 = float3(_756, _764, float(int(_730)));
    float3 _2462 = select(_2460, float3(0.0), isnan(_2460));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2462.xy, uint(rint(_2462.z)), _748);
    float3 _2471 = float3(_758, _764, float(int(_730)));
    float3 _2473 = select(_2471, float3(0.0), isnan(_2471));
    float _772 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2473.xy, uint(rint(_2473.z)), _748);
    float3 _2482 = float3(_760, _764, float(int(_730)));
    float3 _2484 = select(_2482, float3(0.0), isnan(_2482));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2484.xy, uint(rint(_2484.z)), _748);
    float3 _2493 = float3(_756, _754, float(int(_730)));
    float3 _2495 = select(_2493, float3(0.0), isnan(_2493));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2495.xy, uint(rint(_2495.z)), _748);
    float _778 = _766 + _570;
    float _780 = fma(_752, -1.5, _740);
    float _782 = _778 + _572;
    float3 _2513 = float3(_780, _764, float(int(_730)));
    float3 _2515 = select(_2513, float3(0.0), isnan(_2513));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2515.xy, uint(rint(_2515.z)), _748);
    float _786 = _782 + _574;
    float3 _2527 = float3(_758, _754, float(int(_730)));
    float3 _2529 = select(_2527, float3(0.0), isnan(_2527));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2529.xy, uint(rint(_2529.z)), _748);
    float _790 = fma(_750, -0.5, _744);
    float3 _2541 = float3(_760, _754, float(int(_730)));
    float3 _2543 = select(_2541, float3(0.0), isnan(_2541));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2543.xy, uint(rint(_2543.z)), _748);
    float3 _2552 = float3(_780, _754, float(int(_730)));
    float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2554.xy, uint(rint(_2554.z)), _748);
    float3 _2563 = float3(_758, _790, float(int(_730)));
    float3 _2565 = select(_2563, float3(0.0), isnan(_2563));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2565.xy, uint(rint(_2565.z)), _748);
    float3 _2574 = float3(_756, _790, float(int(_730)));
    float3 _2576 = select(_2574, float3(0.0), isnan(_2574));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2576.xy, uint(rint(_2576.z)), _748);
    float _800 = fma(_750, -1.5, _744);
    float3 _2588 = float3(_760, _790, float(int(_730)));
    float3 _2590 = select(_2588, float3(0.0), isnan(_2588));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2590.xy, uint(rint(_2590.z)), _748);
    float3 _2599 = float3(_780, _790, float(int(_730)));
    float3 _2601 = select(_2599, float3(0.0), isnan(_2599));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2601.xy, uint(rint(_2601.z)), _748);
    float3 _2610 = float3(_758, _800, float(int(_730)));
    float3 _2612 = select(_2610, float3(0.0), isnan(_2610));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2612.xy, uint(rint(_2612.z)), _748);
    float3 _2621 = float3(_756, _800, float(int(_730)));
    float3 _2623 = select(_2621, float3(0.0), isnan(_2621));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2623.xy, uint(rint(_2623.z)), _748);
    float3 _2632 = float3(_760, _800, float(int(_730)));
    float3 _2634 = select(_2632, float3(0.0), isnan(_2632));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2634.xy, uint(rint(_2634.z)), _748);
    float _812 = _786 + _768;
    float3 _2646 = float3(_780, _800, float(int(_730)));
    float3 _2648 = select(_2646, float3(0.0), isnan(_2646));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2648.xy, uint(rint(_2648.z)), _748);
    float _816 = _772 + _770;
    float _818 = _816 + _774;
    float _820 = _818 + _784;
    float _822 = _812 * 0.0625;
    float _824 = _820 + _788;
    float _826 = _824 + _776;
    float _828 = -_62;
    float _830 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _832 = _828 + _830;
    float _834 = _826 + _792;
    float _836 = -_62;
    float _838 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _840 = _836 + _838;
    float _842 = _832 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _844 = precise::clamp(_842, 0.0, 1.0);
    float _846 = _834 + _794;
    float _848 = _840 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _850 = precise::clamp(_848, 0.0, 1.0);
    float _852 = _846 + _796;
    float _854 = fma(_540, 0.0625, _850);
    float _856 = _852 + _798;
    float _858 = _856 + _802;
    float _860 = _858 + _804;
    float _862 = _860 + _806;
    float _864 = _862 + _808;
    float _866 = _864 + _810;
    float _868 = _866 + _814;
    float _870 = _868 * 0.0625;
    float _872 = _870 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _874 = fma(_822, (*spvDescriptorSet0.fp_c3)._m0[49].z, _872);
    float _876 = _874 + _844;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _854;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _876;
    return out;
}

