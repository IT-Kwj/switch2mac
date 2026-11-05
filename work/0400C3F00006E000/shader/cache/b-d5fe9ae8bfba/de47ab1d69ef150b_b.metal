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
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _883 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_883, float2(0.0), isnan(_883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_883, float2(0.0), isnan(_883))).x;
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
    float _96 = in.m_40.x;
    uint _98 = uint(int(uint(_94) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _66 * _96;
    float _108 = _66 * _56;
    bool _110 = as_type<int>(_104) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_104) == 640;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _146;
            _154 = _142;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _218;
            _154 = _214;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = 1.0 / _222;
    float _232 = float(int(_89));
    float _234 = rint(_232);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    uint _240 = clamp(_238, 0u, 65535u);
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = _230 * _224;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _230 * _226;
    float _250 = _230 * _228;
    float _252 = _246 * _242;
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _256 = fma(_252, 0.5, _248);
    float _258 = _246 * _254;
    float _260 = fma(_252, 1.5, _248);
    float _262 = fma(_252, -0.5, _248);
    float _264 = fma(_258, 1.5, _250);
    float _266 = fma(_252, -1.5, _248);
    float3 _1326 = float3(_256, _264, float(int(_240)));
    float3 _1330 = select(_1326, float3(0.0), isnan(_1326));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1330.xy, uint(rint(_1330.z)), _246);
    float3 _1339 = float3(_260, _264, float(int(_240)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1341.xy, uint(rint(_1341.z)), _246);
    float3 _1350 = float3(_262, _264, float(int(_240)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1352.xy, uint(rint(_1352.z)), _246);
    float3 _1361 = float3(_266, _264, float(int(_240)));
    float3 _1363 = select(_1361, float3(0.0), isnan(_1361));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1363.xy, uint(rint(_1363.z)), _246);
    float _276 = fma(_258, 0.5, _250);
    float3 _1375 = float3(_260, _276, float(int(_240)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1377.xy, uint(rint(_1377.z)), _246);
    float3 _1386 = float3(_256, _276, float(int(_240)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1388.xy, uint(rint(_1388.z)), _246);
    float _282 = fma(_258, -0.5, _250);
    float _284 = _270 + _268;
    float _286 = _284 + _272;
    float _288 = _286 + _274;
    float _290 = _288 + _278;
    float3 _1412 = float3(_262, _276, float(int(_240)));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1414.xy, uint(rint(_1414.z)), _246);
    float3 _1423 = float3(_266, _276, float(int(_240)));
    float3 _1425 = select(_1423, float3(0.0), isnan(_1423));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1425.xy, uint(rint(_1425.z)), _246);
    float3 _1434 = float3(_260, _282, float(int(_240)));
    float3 _1436 = select(_1434, float3(0.0), isnan(_1434));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1436.xy, uint(rint(_1436.z)), _246);
    float3 _1445 = float3(_256, _282, float(int(_240)));
    float3 _1447 = select(_1445, float3(0.0), isnan(_1445));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1447.xy, uint(rint(_1447.z)), _246);
    float3 _1456 = float3(_262, _282, float(int(_240)));
    float3 _1458 = select(_1456, float3(0.0), isnan(_1456));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1458.xy, uint(rint(_1458.z)), _246);
    float3 _1467 = float3(_266, _282, float(int(_240)));
    float3 _1469 = select(_1467, float3(0.0), isnan(_1467));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1469.xy, uint(rint(_1469.z)), _246);
    float _304 = -_108;
    float _306 = _304 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _308 = -_106;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _312 = _290 + _280;
    float _314 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _316 = _306 * _306;
    float _318 = fma(_310, _310, _316);
    float _320 = -_66;
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _324 = fma(_322, _322, _318);
    float _326 = _108 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _328 = _108 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _330 = _108 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _332 = fma(_258, -1.5, _250);
    float _334 = sqrt(_324);
    float _336 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].x, _326);
    float _338 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].x, _328);
    float _340 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].x, _330);
    float _342 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _336);
    float _344 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _338);
    float _346 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _340);
    bool _348 = _334 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _350 = _334 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _352 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _354 = !_348;
    int _356 = _354 ? 0 : 1;
    int _358 = 2;
    if (!_348)
    {
        _358 = 1;
    }
    int _360 = _358;
    int _362 = _360;
    if (!_350)
    {
        _362 = _356;
    }
    int _364 = _362;
    float _366 = _344 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _368 = _108 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _370 = float(_364);
    float _372 = _108 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _374 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].x, _368);
    float _376 = precise::min(_370, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _378 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].x, _372);
    float _380 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _374);
    bool _382 = _376 != 1.0;
    bool _384 = isnan(_376);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    float _392 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _378);
    bool _394 = _376 != 0.0;
    bool _396 = isnan(_376);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.0);
    bool _402 = _398 || _400;
    float _404 = _392 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _406 = _108 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _408 = _404;
    float _410 = _366;
    if (_390)
    {
        float _412 = _342 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].x, _406);
    float _418 = _414;
    if (_390)
    {
        float _420 = _346 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _410 = _420;
    }
    float _422 = _410;
    float _424 = _108 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _426 = _108 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _428 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _416);
    float _430 = _422;
    if (!_402)
    {
        float _432 = _380 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _430 = _432;
    }
    float _434 = _430;
    float _436 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].x, _424);
    float _438 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].x, _426);
    float _440 = _428 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _442 = _108 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _444 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _436);
    float _446 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _438);
    float _448 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].x, _442);
    float _450 = _440;
    if (_390)
    {
        float _452 = _444 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _450 = _452;
    }
    float _454 = _450;
    float _456 = _454;
    if (!_402)
    {
        float _458 = _446 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _418 = _458;
    }
    float _460 = _418;
    float _462 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _448);
    if (!_402)
    {
        float _464 = _462 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _456 = _464;
    }
    float _466 = _456;
    float _468 = 0.0 + _466;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = _470 * _314;
    float _474 = _470 * _352;
    float _476 = fma(_472, 0.5, _460);
    float _478 = fma(_472, 1.5, _460);
    float _480 = fma(_472, -0.5, _460);
    float _482 = fma(_472, -1.5, _460);
    float _484 = fma(_474, 0.5, _434);
    float _486 = _312 + _292;
    float _488 = _486 + _294;
    float _490 = _488 + _296;
    float _492 = _490 + _298;
    float3 _1827 = float3(_260, _332, float(int(_240)));
    float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1829.xy, uint(rint(_1829.z)), _246);
    float _496 = fma(_474, 1.5, _434);
    float _498 = _492 + _300;
    float _500 = rint(_376);
    float _502 = precise::max(_500, 0.0);
    uint _504 = uint(_502);
    uint _506 = clamp(_504, 0u, 65535u);
    float _508 = _498 + _302;
    float3 _1855 = float3(_256, _332, float(int(_240)));
    float3 _1857 = select(_1855, float3(0.0), isnan(_1855));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1857.xy, uint(rint(_1857.z)), _246);
    float3 _1866 = float3(_262, _332, float(int(_240)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1868.xy, uint(rint(_1868.z)), _246);
    float3 _1877 = float3(_266, _332, float(int(_240)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1879.xy, uint(rint(_1879.z)), _246);
    float3 _1888 = float3(_476, _496, float(int(_506)));
    float3 _1890 = select(_1888, float3(0.0), isnan(_1888));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1890.xy, uint(rint(_1890.z)), _470);
    float3 _1899 = float3(_478, _496, float(int(_506)));
    float3 _1901 = select(_1899, float3(0.0), isnan(_1899));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1901.xy, uint(rint(_1901.z)), _470);
    float3 _1910 = float3(_480, _496, float(int(_506)));
    float3 _1912 = select(_1910, float3(0.0), isnan(_1910));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1912.xy, uint(rint(_1912.z)), _470);
    float3 _1921 = float3(_482, _496, float(int(_506)));
    float3 _1923 = select(_1921, float3(0.0), isnan(_1921));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1923.xy, uint(rint(_1923.z)), _470);
    float3 _1932 = float3(_478, _484, float(int(_506)));
    float3 _1934 = select(_1932, float3(0.0), isnan(_1932));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1934.xy, uint(rint(_1934.z)), _470);
    float _526 = _508 + _494;
    float _528 = fma(_474, -0.5, _434);
    float _530 = _526 + _510;
    float _532 = _530 + _512;
    float _534 = _532 + _514;
    float _536 = _518 + _516;
    float3 _1961 = float3(_476, _484, float(int(_506)));
    float3 _1963 = select(_1961, float3(0.0), isnan(_1961));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1963.xy, uint(rint(_1963.z)), _470);
    float _540 = _536 + _520;
    float3 _1975 = float3(_480, _484, float(int(_506)));
    float3 _1977 = select(_1975, float3(0.0), isnan(_1975));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1977.xy, uint(rint(_1977.z)), _470);
    float3 _1986 = float3(_482, _484, float(int(_506)));
    float3 _1988 = select(_1986, float3(0.0), isnan(_1986));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1988.xy, uint(rint(_1988.z)), _470);
    float3 _1997 = float3(_478, _528, float(int(_506)));
    float3 _1999 = select(_1997, float3(0.0), isnan(_1997));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1999.xy, uint(rint(_1999.z)), _470);
    float3 _2008 = float3(_476, _528, float(int(_506)));
    float3 _2010 = select(_2008, float3(0.0), isnan(_2008));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2010.xy, uint(rint(_2010.z)), _470);
    float _550 = _540 + _522;
    float _552 = _550 + _524;
    float _554 = _552 + _538;
    float _556 = fma(_474, -1.5, _434);
    float _558 = _554 + _542;
    float3 _2034 = float3(_480, _528, float(int(_506)));
    float3 _2036 = select(_2034, float3(0.0), isnan(_2034));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2036.xy, uint(rint(_2036.z)), _470);
    float3 _2045 = float3(_482, _528, float(int(_506)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2047.xy, uint(rint(_2047.z)), _470);
    float3 _2056 = float3(_478, _556, float(int(_506)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2058.xy, uint(rint(_2058.z)), _470);
    float3 _2067 = float3(_476, _556, float(int(_506)));
    float3 _2069 = select(_2067, float3(0.0), isnan(_2067));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2069.xy, uint(rint(_2069.z)), _470);
    float3 _2078 = float3(_480, _556, float(int(_506)));
    float3 _2080 = select(_2078, float3(0.0), isnan(_2078));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2080.xy, uint(rint(_2080.z)), _470);
    float _570 = _558 + _544;
    float _572 = _108 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _574 = _108 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _576 = _108 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _578 = _570 + _546;
    float _580 = _108 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _582 = _108 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _584 = _108 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _586 = _108 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _588 = _108 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _590 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].x, _574);
    float _592 = _108 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _594 = -_108;
    float _596 = _594 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _598 = -_106;
    float _600 = _598 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _602 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].x, _582);
    float _604 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].x, _584);
    float _606 = _596 * _596;
    float _608 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].x, _580);
    float _610 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].x, _586);
    float _612 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].x, _572);
    float _614 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].x, _576);
    float _616 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].x, _588);
    float _618 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].x, _592);
    float _620 = fma(_600, _600, _606);
    float _622 = -_66;
    float _624 = _622 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _626 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _614);
    float _628 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _616);
    float _630 = fma(_624, _624, _620);
    float _632 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _602);
    float _634 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _604);
    float _636 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _610);
    float _638 = _628 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _640 = _632 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _642 = sqrt(_630);
    float _644 = _578 + _548;
    float _646 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _590);
    float _648 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _608);
    float _650 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _612);
    bool _652 = _642 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _654 = _642 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _656 = !_652;
    int _658 = _656 ? 0 : 1;
    int _660 = 2;
    float _662 = _638;
    float _664 = _640;
    if (!_652)
    {
        _660 = 1;
    }
    int _666 = _660;
    int _668 = _666;
    if (!_654)
    {
        _668 = _658;
    }
    int _670 = _668;
    float _672 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _618);
    float _674 = _626 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _676 = float(_670);
    float _678 = precise::min(_676, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _680 = _678 != 1.0;
    bool _682 = isnan(_678);
    bool _684 = _680 || _682;
    bool _686 = isnan(1.0);
    bool _688 = _684 || _686;
    float _690 = _674;
    if (_688)
    {
        float _692 = _634 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _690 = _692;
    }
    float _694 = _690;
    float _696 = _694;
    if (_688)
    {
        float _698 = _636 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _662 = _698;
    }
    float _700 = _662;
    float _702 = _700;
    if (_688)
    {
        float _704 = _672 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _664 = _704;
    }
    float _706 = _664;
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
        float _728 = _646 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _726 = _728;
    }
    float _730 = _726;
    if (!_716)
    {
        float _732 = _648 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _696 = _732;
    }
    float _734 = _696;
    if (!_716)
    {
        float _736 = _650 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _702 = _736;
    }
    float _738 = _702;
    float _740 = 0.0 + _730;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float _744 = _352 * _742;
    float _746 = _314 * _742;
    float _748 = fma(_744, 0.5, _738);
    float _750 = fma(_746, 0.5, _734);
    float _752 = fma(_746, 1.5, _734);
    float _754 = fma(_746, -0.5, _734);
    float _756 = _644 + _560;
    float _758 = fma(_744, 1.5, _738);
    float _760 = _756 + _562;
    float3 _2431 = float3(_482, _556, float(int(_506)));
    float3 _2433 = select(_2431, float3(0.0), isnan(_2431));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2433.xy, uint(rint(_2433.z)), _470);
    float3 _2442 = float3(_750, _758, float(int(_724)));
    float3 _2444 = select(_2442, float3(0.0), isnan(_2442));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2444.xy, uint(rint(_2444.z)), _742);
    float3 _2453 = float3(_752, _758, float(int(_724)));
    float3 _2455 = select(_2453, float3(0.0), isnan(_2453));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2455.xy, uint(rint(_2455.z)), _742);
    float3 _2464 = float3(_754, _758, float(int(_724)));
    float3 _2466 = select(_2464, float3(0.0), isnan(_2464));
    float _768 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2466.xy, uint(rint(_2466.z)), _742);
    float3 _2475 = float3(_750, _748, float(int(_724)));
    float3 _2477 = select(_2475, float3(0.0), isnan(_2475));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2477.xy, uint(rint(_2477.z)), _742);
    float _772 = _760 + _564;
    float _774 = fma(_746, -1.5, _734);
    float _776 = _772 + _566;
    float3 _2495 = float3(_774, _758, float(int(_724)));
    float3 _2497 = select(_2495, float3(0.0), isnan(_2495));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2497.xy, uint(rint(_2497.z)), _742);
    float _780 = _776 + _568;
    float3 _2509 = float3(_752, _748, float(int(_724)));
    float3 _2511 = select(_2509, float3(0.0), isnan(_2509));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2511.xy, uint(rint(_2511.z)), _742);
    float _784 = fma(_744, -0.5, _738);
    float3 _2523 = float3(_754, _748, float(int(_724)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2525.xy, uint(rint(_2525.z)), _742);
    float3 _2534 = float3(_774, _748, float(int(_724)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2536.xy, uint(rint(_2536.z)), _742);
    float3 _2545 = float3(_752, _784, float(int(_724)));
    float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2547.xy, uint(rint(_2547.z)), _742);
    float3 _2556 = float3(_750, _784, float(int(_724)));
    float3 _2558 = select(_2556, float3(0.0), isnan(_2556));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2558.xy, uint(rint(_2558.z)), _742);
    float _794 = fma(_744, -1.5, _738);
    float3 _2570 = float3(_754, _784, float(int(_724)));
    float3 _2572 = select(_2570, float3(0.0), isnan(_2570));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2572.xy, uint(rint(_2572.z)), _742);
    float3 _2581 = float3(_774, _784, float(int(_724)));
    float3 _2583 = select(_2581, float3(0.0), isnan(_2581));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2583.xy, uint(rint(_2583.z)), _742);
    float3 _2592 = float3(_752, _794, float(int(_724)));
    float3 _2594 = select(_2592, float3(0.0), isnan(_2592));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2594.xy, uint(rint(_2594.z)), _742);
    float3 _2603 = float3(_750, _794, float(int(_724)));
    float3 _2605 = select(_2603, float3(0.0), isnan(_2603));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2605.xy, uint(rint(_2605.z)), _742);
    float3 _2614 = float3(_754, _794, float(int(_724)));
    float3 _2616 = select(_2614, float3(0.0), isnan(_2614));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2616.xy, uint(rint(_2616.z)), _742);
    float _806 = _780 + _762;
    float3 _2628 = float3(_774, _794, float(int(_724)));
    float3 _2630 = select(_2628, float3(0.0), isnan(_2628));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2630.xy, uint(rint(_2630.z)), _742);
    float _810 = _766 + _764;
    float _812 = _810 + _768;
    float _814 = _812 + _778;
    float _816 = _806 * 0.0625;
    float _818 = _814 + _782;
    float _820 = _818 + _770;
    float _822 = -_66;
    float _824 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _826 = _822 + _824;
    float _828 = _820 + _786;
    float _830 = -_66;
    float _832 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _834 = _830 + _832;
    float _836 = _826 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _838 = precise::clamp(_836, 0.0, 1.0);
    float _840 = _828 + _788;
    float _842 = _834 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _844 = precise::clamp(_842, 0.0, 1.0);
    float _846 = _840 + _790;
    float _848 = fma(_534, 0.0625, _844);
    float _850 = _846 + _792;
    float _852 = _850 + _796;
    float _854 = _852 + _798;
    float _856 = _854 + _800;
    float _858 = _856 + _802;
    float _860 = _858 + _804;
    float _862 = _860 + _808;
    float _864 = _862 * 0.0625;
    float _866 = _864 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _868 = fma(_816, (*spvDescriptorSet0.fp_c3)._m0[49].z, _866);
    float _870 = _868 + _838;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _848;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _870;
    return out;
}

