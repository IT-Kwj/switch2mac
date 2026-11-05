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
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _879 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_879, float2(0.0), isnan(_879))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_879, float2(0.0), isnan(_879))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _56;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_72;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_72)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    bool _106 = as_type<int>(_104) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_104) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _142;
            _150 = _138;
            _152 = _140;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _182;
            _150 = _178;
            _152 = _180;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _214;
            _150 = _210;
            _152 = _212;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = 1.0 / _218;
    float _228 = float(int(_91));
    float _230 = rint(_228);
    float _232 = precise::max(_230, 0.0);
    uint _234 = uint(_232);
    uint _236 = clamp(_234, 0u, 65535u);
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _240 = _226 * _220;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _226 * _222;
    float _246 = _226 * _224;
    float _248 = _242 * _238;
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _252 = fma(_248, 0.5, _244);
    float _254 = _242 * _250;
    float _256 = fma(_248, 1.5, _244);
    float _258 = fma(_248, -0.5, _244);
    float _260 = fma(_254, 1.5, _246);
    float _262 = fma(_248, -1.5, _244);
    float3 _1318 = float3(_252, _260, float(int(_236)));
    float3 _1322 = select(_1318, float3(0.0), isnan(_1318));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1322.xy, uint(rint(_1322.z)), _242);
    float3 _1331 = float3(_256, _260, float(int(_236)));
    float3 _1333 = select(_1331, float3(0.0), isnan(_1331));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1333.xy, uint(rint(_1333.z)), _242);
    float3 _1342 = float3(_258, _260, float(int(_236)));
    float3 _1344 = select(_1342, float3(0.0), isnan(_1342));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1344.xy, uint(rint(_1344.z)), _242);
    float3 _1353 = float3(_262, _260, float(int(_236)));
    float3 _1355 = select(_1353, float3(0.0), isnan(_1353));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1355.xy, uint(rint(_1355.z)), _242);
    float _272 = fma(_254, 0.5, _246);
    float3 _1367 = float3(_256, _272, float(int(_236)));
    float3 _1369 = select(_1367, float3(0.0), isnan(_1367));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1369.xy, uint(rint(_1369.z)), _242);
    float3 _1378 = float3(_252, _272, float(int(_236)));
    float3 _1380 = select(_1378, float3(0.0), isnan(_1378));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1380.xy, uint(rint(_1380.z)), _242);
    float _278 = fma(_254, -0.5, _246);
    float _280 = _266 + _264;
    float _282 = _280 + _268;
    float _284 = _282 + _270;
    float _286 = _284 + _274;
    float3 _1404 = float3(_258, _272, float(int(_236)));
    float3 _1406 = select(_1404, float3(0.0), isnan(_1404));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1406.xy, uint(rint(_1406.z)), _242);
    float3 _1415 = float3(_262, _272, float(int(_236)));
    float3 _1417 = select(_1415, float3(0.0), isnan(_1415));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1417.xy, uint(rint(_1417.z)), _242);
    float3 _1426 = float3(_256, _278, float(int(_236)));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1428.xy, uint(rint(_1428.z)), _242);
    float3 _1437 = float3(_252, _278, float(int(_236)));
    float3 _1439 = select(_1437, float3(0.0), isnan(_1437));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1439.xy, uint(rint(_1439.z)), _242);
    float3 _1448 = float3(_258, _278, float(int(_236)));
    float3 _1450 = select(_1448, float3(0.0), isnan(_1448));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1450.xy, uint(rint(_1450.z)), _242);
    float3 _1459 = float3(_262, _278, float(int(_236)));
    float3 _1461 = select(_1459, float3(0.0), isnan(_1459));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1461.xy, uint(rint(_1461.z)), _242);
    float _300 = -_74;
    float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _304 = -_66;
    float _306 = _304 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _308 = _286 + _276;
    float _310 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _312 = _302 * _302;
    float _314 = fma(_306, _306, _312);
    float _316 = -_64;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _320 = fma(_318, _318, _314);
    float _322 = _74 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _324 = _74 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _326 = _74 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _328 = fma(_254, -1.5, _246);
    float _330 = sqrt(_320);
    float _332 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _322);
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _324);
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _326);
    float _338 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _332);
    float _340 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _334);
    float _342 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _336);
    bool _344 = _330 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _346 = _330 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _348 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _350 = !_344;
    int _352 = _350 ? 0 : 1;
    int _354 = 2;
    if (!_344)
    {
        _354 = 1;
    }
    int _356 = _354;
    int _358 = _356;
    if (!_346)
    {
        _358 = _352;
    }
    int _360 = _358;
    float _362 = _340 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _364 = _74 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _366 = float(_360);
    float _368 = _74 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _364);
    float _372 = precise::min(_366, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _374 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _368);
    float _376 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _370);
    bool _378 = _372 != 1.0;
    bool _380 = isnan(_372);
    bool _382 = _378 || _380;
    bool _384 = isnan(1.0);
    bool _386 = _382 || _384;
    float _388 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _374);
    bool _390 = _372 != 0.0;
    bool _392 = isnan(_372);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = _388 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _402 = _74 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _404 = _400;
    float _406 = _362;
    if (_386)
    {
        float _408 = _338 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _404 = _408;
    }
    float _410 = _404;
    float _412 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _402);
    float _414 = _410;
    if (_386)
    {
        float _416 = _342 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _406 = _416;
    }
    float _418 = _406;
    float _420 = _74 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _422 = _74 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _424 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _412);
    float _426 = _418;
    if (!_398)
    {
        float _428 = _376 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _426 = _428;
    }
    float _430 = _426;
    float _432 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _420);
    float _434 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _422);
    float _436 = _424 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _438 = _74 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _440 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _432);
    float _442 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _434);
    float _444 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _438);
    float _446 = _436;
    if (_386)
    {
        float _448 = _440 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _446 = _448;
    }
    float _450 = _446;
    float _452 = _450;
    if (!_398)
    {
        float _454 = _442 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _414 = _454;
    }
    float _456 = _414;
    float _458 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _444);
    if (!_398)
    {
        float _460 = _458 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _452 = _460;
    }
    float _462 = _452;
    float _464 = 0.0 + _462;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = _466 * _310;
    float _470 = _466 * _348;
    float _472 = fma(_468, 0.5, _456);
    float _474 = fma(_468, 1.5, _456);
    float _476 = fma(_468, -0.5, _456);
    float _478 = fma(_468, -1.5, _456);
    float _480 = fma(_470, 0.5, _430);
    float _482 = _308 + _288;
    float _484 = _482 + _290;
    float _486 = _484 + _292;
    float _488 = _486 + _294;
    float3 _1819 = float3(_256, _328, float(int(_236)));
    float3 _1821 = select(_1819, float3(0.0), isnan(_1819));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1821.xy, uint(rint(_1821.z)), _242);
    float _492 = fma(_470, 1.5, _430);
    float _494 = _488 + _296;
    float _496 = rint(_372);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    uint _502 = clamp(_500, 0u, 65535u);
    float _504 = _494 + _298;
    float3 _1847 = float3(_252, _328, float(int(_236)));
    float3 _1849 = select(_1847, float3(0.0), isnan(_1847));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1849.xy, uint(rint(_1849.z)), _242);
    float3 _1858 = float3(_258, _328, float(int(_236)));
    float3 _1860 = select(_1858, float3(0.0), isnan(_1858));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1860.xy, uint(rint(_1860.z)), _242);
    float3 _1869 = float3(_262, _328, float(int(_236)));
    float3 _1871 = select(_1869, float3(0.0), isnan(_1869));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1871.xy, uint(rint(_1871.z)), _242);
    float3 _1880 = float3(_472, _492, float(int(_502)));
    float3 _1882 = select(_1880, float3(0.0), isnan(_1880));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1882.xy, uint(rint(_1882.z)), _466);
    float3 _1891 = float3(_474, _492, float(int(_502)));
    float3 _1893 = select(_1891, float3(0.0), isnan(_1891));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1893.xy, uint(rint(_1893.z)), _466);
    float3 _1902 = float3(_476, _492, float(int(_502)));
    float3 _1904 = select(_1902, float3(0.0), isnan(_1902));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1904.xy, uint(rint(_1904.z)), _466);
    float3 _1913 = float3(_478, _492, float(int(_502)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1915.xy, uint(rint(_1915.z)), _466);
    float3 _1924 = float3(_474, _480, float(int(_502)));
    float3 _1926 = select(_1924, float3(0.0), isnan(_1924));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1926.xy, uint(rint(_1926.z)), _466);
    float _522 = _504 + _490;
    float _524 = fma(_470, -0.5, _430);
    float _526 = _522 + _506;
    float _528 = _526 + _508;
    float _530 = _528 + _510;
    float _532 = _514 + _512;
    float3 _1953 = float3(_472, _480, float(int(_502)));
    float3 _1955 = select(_1953, float3(0.0), isnan(_1953));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1955.xy, uint(rint(_1955.z)), _466);
    float _536 = _532 + _516;
    float3 _1967 = float3(_476, _480, float(int(_502)));
    float3 _1969 = select(_1967, float3(0.0), isnan(_1967));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1969.xy, uint(rint(_1969.z)), _466);
    float3 _1978 = float3(_478, _480, float(int(_502)));
    float3 _1980 = select(_1978, float3(0.0), isnan(_1978));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1980.xy, uint(rint(_1980.z)), _466);
    float3 _1989 = float3(_474, _524, float(int(_502)));
    float3 _1991 = select(_1989, float3(0.0), isnan(_1989));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1991.xy, uint(rint(_1991.z)), _466);
    float3 _2000 = float3(_472, _524, float(int(_502)));
    float3 _2002 = select(_2000, float3(0.0), isnan(_2000));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2002.xy, uint(rint(_2002.z)), _466);
    float _546 = _536 + _518;
    float _548 = _546 + _520;
    float _550 = _548 + _534;
    float _552 = fma(_470, -1.5, _430);
    float _554 = _550 + _538;
    float3 _2026 = float3(_476, _524, float(int(_502)));
    float3 _2028 = select(_2026, float3(0.0), isnan(_2026));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2028.xy, uint(rint(_2028.z)), _466);
    float3 _2037 = float3(_478, _524, float(int(_502)));
    float3 _2039 = select(_2037, float3(0.0), isnan(_2037));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2039.xy, uint(rint(_2039.z)), _466);
    float3 _2048 = float3(_474, _552, float(int(_502)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2050.xy, uint(rint(_2050.z)), _466);
    float3 _2059 = float3(_472, _552, float(int(_502)));
    float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2061.xy, uint(rint(_2061.z)), _466);
    float3 _2070 = float3(_476, _552, float(int(_502)));
    float3 _2072 = select(_2070, float3(0.0), isnan(_2070));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2072.xy, uint(rint(_2072.z)), _466);
    float _566 = _554 + _540;
    float _568 = _74 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _570 = _74 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _572 = _74 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _574 = _566 + _542;
    float _576 = _74 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _578 = _74 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _580 = _74 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _582 = _74 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _584 = _74 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _586 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _570);
    float _588 = _74 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _590 = -_74;
    float _592 = _590 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _594 = -_66;
    float _596 = _594 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _598 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _578);
    float _600 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _580);
    float _602 = _592 * _592;
    float _604 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _576);
    float _606 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _582);
    float _608 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _568);
    float _610 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _572);
    float _612 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _584);
    float _614 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _588);
    float _616 = fma(_596, _596, _602);
    float _618 = -_64;
    float _620 = _618 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _622 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _610);
    float _624 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _612);
    float _626 = fma(_620, _620, _616);
    float _628 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _598);
    float _630 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _600);
    float _632 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _606);
    float _634 = _624 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _636 = _628 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _638 = sqrt(_626);
    float _640 = _574 + _544;
    float _642 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _586);
    float _644 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _604);
    float _646 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _608);
    bool _648 = _638 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _650 = _638 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _652 = !_648;
    int _654 = _652 ? 0 : 1;
    int _656 = 2;
    float _658 = _634;
    float _660 = _636;
    if (!_648)
    {
        _656 = 1;
    }
    int _662 = _656;
    int _664 = _662;
    if (!_650)
    {
        _664 = _654;
    }
    int _666 = _664;
    float _668 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _614);
    float _670 = _622 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _672 = float(_666);
    float _674 = precise::min(_672, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _676 = _674 != 1.0;
    bool _678 = isnan(_674);
    bool _680 = _676 || _678;
    bool _682 = isnan(1.0);
    bool _684 = _680 || _682;
    float _686 = _670;
    if (_684)
    {
        float _688 = _630 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _686 = _688;
    }
    float _690 = _686;
    float _692 = _690;
    if (_684)
    {
        float _694 = _632 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _658 = _694;
    }
    float _696 = _658;
    float _698 = _696;
    if (_684)
    {
        float _700 = _668 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _660 = _700;
    }
    float _702 = _660;
    bool _704 = _674 != 0.0;
    bool _706 = isnan(_674);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    float _714 = rint(_674);
    float _716 = precise::max(_714, 0.0);
    uint _718 = uint(_716);
    uint _720 = clamp(_718, 0u, 65535u);
    float _722 = _702;
    if (!_712)
    {
        float _724 = _642 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _722 = _724;
    }
    float _726 = _722;
    if (!_712)
    {
        float _728 = _644 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _692 = _728;
    }
    float _730 = _692;
    if (!_712)
    {
        float _732 = _646 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _698 = _732;
    }
    float _734 = _698;
    float _736 = 0.0 + _726;
    float _738 = precise::clamp(_736, 0.0, 1.0);
    float _740 = _348 * _738;
    float _742 = _310 * _738;
    float _744 = fma(_740, 0.5, _734);
    float _746 = fma(_742, 0.5, _730);
    float _748 = fma(_742, 1.5, _730);
    float _750 = fma(_742, -0.5, _730);
    float _752 = _640 + _556;
    float _754 = fma(_740, 1.5, _734);
    float _756 = _752 + _558;
    float3 _2423 = float3(_478, _552, float(int(_502)));
    float3 _2425 = select(_2423, float3(0.0), isnan(_2423));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2425.xy, uint(rint(_2425.z)), _466);
    float3 _2434 = float3(_746, _754, float(int(_720)));
    float3 _2436 = select(_2434, float3(0.0), isnan(_2434));
    float _760 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2436.xy, uint(rint(_2436.z)), _738);
    float3 _2445 = float3(_748, _754, float(int(_720)));
    float3 _2447 = select(_2445, float3(0.0), isnan(_2445));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2447.xy, uint(rint(_2447.z)), _738);
    float3 _2456 = float3(_750, _754, float(int(_720)));
    float3 _2458 = select(_2456, float3(0.0), isnan(_2456));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2458.xy, uint(rint(_2458.z)), _738);
    float3 _2467 = float3(_746, _744, float(int(_720)));
    float3 _2469 = select(_2467, float3(0.0), isnan(_2467));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2469.xy, uint(rint(_2469.z)), _738);
    float _768 = _756 + _560;
    float _770 = fma(_742, -1.5, _730);
    float _772 = _768 + _562;
    float3 _2487 = float3(_770, _754, float(int(_720)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2489.xy, uint(rint(_2489.z)), _738);
    float _776 = _772 + _564;
    float3 _2501 = float3(_748, _744, float(int(_720)));
    float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2503.xy, uint(rint(_2503.z)), _738);
    float _780 = fma(_740, -0.5, _734);
    float3 _2515 = float3(_750, _744, float(int(_720)));
    float3 _2517 = select(_2515, float3(0.0), isnan(_2515));
    float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2517.xy, uint(rint(_2517.z)), _738);
    float3 _2526 = float3(_770, _744, float(int(_720)));
    float3 _2528 = select(_2526, float3(0.0), isnan(_2526));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2528.xy, uint(rint(_2528.z)), _738);
    float3 _2537 = float3(_748, _780, float(int(_720)));
    float3 _2539 = select(_2537, float3(0.0), isnan(_2537));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2539.xy, uint(rint(_2539.z)), _738);
    float3 _2548 = float3(_746, _780, float(int(_720)));
    float3 _2550 = select(_2548, float3(0.0), isnan(_2548));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2550.xy, uint(rint(_2550.z)), _738);
    float _790 = fma(_740, -1.5, _734);
    float3 _2562 = float3(_750, _780, float(int(_720)));
    float3 _2564 = select(_2562, float3(0.0), isnan(_2562));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2564.xy, uint(rint(_2564.z)), _738);
    float3 _2573 = float3(_770, _780, float(int(_720)));
    float3 _2575 = select(_2573, float3(0.0), isnan(_2573));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2575.xy, uint(rint(_2575.z)), _738);
    float3 _2584 = float3(_748, _790, float(int(_720)));
    float3 _2586 = select(_2584, float3(0.0), isnan(_2584));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2586.xy, uint(rint(_2586.z)), _738);
    float3 _2595 = float3(_746, _790, float(int(_720)));
    float3 _2597 = select(_2595, float3(0.0), isnan(_2595));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2597.xy, uint(rint(_2597.z)), _738);
    float3 _2606 = float3(_750, _790, float(int(_720)));
    float3 _2608 = select(_2606, float3(0.0), isnan(_2606));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2608.xy, uint(rint(_2608.z)), _738);
    float _802 = _776 + _758;
    float3 _2620 = float3(_770, _790, float(int(_720)));
    float3 _2622 = select(_2620, float3(0.0), isnan(_2620));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2622.xy, uint(rint(_2622.z)), _738);
    float _806 = _762 + _760;
    float _808 = _806 + _764;
    float _810 = _808 + _774;
    float _812 = _802 * 0.0625;
    float _814 = _810 + _778;
    float _816 = _814 + _766;
    float _818 = -_64;
    float _820 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _822 = _818 + _820;
    float _824 = _816 + _782;
    float _826 = -_64;
    float _828 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _830 = _826 + _828;
    float _832 = _822 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = _824 + _784;
    float _838 = _830 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _840 = precise::clamp(_838, 0.0, 1.0);
    float _842 = _836 + _786;
    float _844 = fma(_530, 0.0625, _840);
    float _846 = _842 + _788;
    float _848 = _846 + _792;
    float _850 = _848 + _794;
    float _852 = _850 + _796;
    float _854 = _852 + _798;
    float _856 = _854 + _800;
    float _858 = _856 + _804;
    float _860 = _858 * 0.0625;
    float _862 = _860 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _864 = fma(_812, (*spvDescriptorSet0.fp_c3)._m0[49].z, _862);
    float _866 = _864 + _834;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _844;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _866;
    return out;
}

