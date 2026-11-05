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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
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
    bool _268 = false;
    bool _266 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _592 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_592, float2(0.0), isnan(_592)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _609 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
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
    float _140 = -_106;
    bool _144 = _140 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _146 = _106 * _70;
    float _148 = fma(_130, _130, _136);
    float _150 = fma(_134, _134, _138);
    float _152 = -_106;
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _156 = rsqrt(_148);
    float _158 = rsqrt(_150);
    float _160 = _118 * _156;
    float _162 = _130 * _156;
    float _164 = _110 * _156;
    float _166 = _134 * _158;
    float _168 = _114 * _158;
    float _170 = _122 * _158;
    bool _172 = !_144;
    uint _175 = uint(_172 ? 0 : 1);
    float _177 = _160 * _166;
    float _179 = _162 * _168;
    float _181 = -_177;
    float _183 = fma(_162, _170, _181);
    float _185 = _164 * _170;
    float _187 = -_179;
    float _189 = fma(_164, _166, _187);
    float _191 = _183 * _183;
    float _193 = -_185;
    float _195 = fma(_160, _168, _193);
    float _197 = fma(_189, _189, _191);
    uint _199 = 2u;
    if (!_144)
    {
        _199 = 1u;
    }
    uint _201 = _199;
    float _203 = fma(_195, _195, _197);
    uint _205 = _201;
    if (!_154)
    {
        _205 = _175;
    }
    uint _207 = _205;
    float _209 = rsqrt(_203);
    uint _211 = min(_207, 2u);
    int _214 = int(_211) << 2;
    float _216 = _183 * _209;
    float _218 = _189 * _209;
    float _220 = _195 * _209;
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _224 = uint(int(uint(_214) >> uint(2)));
    uint _226 = uint(int(uint(int(_224)) >> uint(2)));
    int _228 = int(_224) & 3;
    float _230 = (*spvDescriptorSet0.fp_c1)._m0[int(_226)][_228];
    float _232 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].x, _222);
    float _234 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[35].z, _232);
    float _236 = abs(_234);
    float _238 = -_236;
    float _240 = _238 + 1.0;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _106 * _68;
    float _246 = abs(_242);
    float _248 = log2(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _252 = exp2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _256 = fma(_218, _254, _146);
    float _258 = fma(_216, _254, _244);
    float _260 = fma(_220, _254, _106);
    bool _262 = as_type<int>(_230) == 1200;
    if (!_262)
    {
        bool _264 = as_type<int>(_230) == 1472;
        _266 = _264;
        if (!_266)
        {
            _268 = true;
        }
    }
    float _302;
    float _304;
    float _306;
    float _308;
    if (!_266)
    {
        if (!_268)
        {
            float _270 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _272 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _274 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _276 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _278 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
            float _280 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
            float _282 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
            float _284 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].z, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
            float _290 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
            float _292 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].z, _284);
            float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _302 = _300;
            _304 = _298;
            _306 = _294;
            _308 = _296;
        }
    }
    if ((false || _268) || _266)
    {
        if ((!_268) || _266)
        {
            _266 = false;
            float _310 = _258 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _312 = _258 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _314 = _258 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _316 = _258 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _318 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[4].x, _310);
            float _320 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[5].x, _312);
            float _322 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[6].x, _314);
            float _324 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[7].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].z, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].z, _320);
            float _330 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].z, _322);
            float _332 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].z, _324);
            float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _302 = _340;
            _304 = _338;
            _306 = _334;
            _308 = _336;
        }
        if (false || _268)
        {
            _268 = false;
            float _342 = _258 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _344 = _258 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _346 = _258 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _348 = _258 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _350 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[8].x, _342);
            float _352 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[9].x, _344);
            float _354 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[10].x, _346);
            float _356 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[11].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].z, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].z, _352);
            float _362 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].z, _354);
            float _364 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _302 = _372;
            _304 = _370;
            _306 = _366;
            _308 = _368;
        }
    }
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = 1.0 / _374;
    float _384 = float(int(_207));
    float _386 = rint(_384);
    float _388 = precise::max(_386, 0.0);
    uint _390 = uint(_388);
    uint _392 = clamp(_390, 0u, 65535u);
    float _394 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _398 = _382 * _376;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _382 * _378;
    float _404 = _382 * _380;
    float _406 = _400 * _394;
    float _408 = _400 * _396;
    float _410 = fma(_406, 0.5, _402);
    float _412 = fma(_408, 0.5, _404);
    float _414 = fma(_408, 1.5, _404);
    float _416 = fma(_406, 1.5, _402);
    float _418 = fma(_406, -0.5, _402);
    float _420 = fma(_406, -1.5, _402);
    float _422 = fma(_408, -0.5, _404);
    float3 _1271 = float3(_410, _414, float(int(_392)));
    float3 _1275 = select(_1271, float3(0.0), isnan(_1271));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1275.xy, uint(rint(_1275.z)), _400);
    float3 _1284 = float3(_416, _412, float(int(_392)));
    float3 _1286 = select(_1284, float3(0.0), isnan(_1284));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1286.xy, uint(rint(_1286.z)), _400);
    float3 _1295 = float3(_410, _412, float(int(_392)));
    float3 _1297 = select(_1295, float3(0.0), isnan(_1295));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1297.xy, uint(rint(_1297.z)), _400);
    float3 _1306 = float3(_418, _412, float(int(_392)));
    float3 _1308 = select(_1306, float3(0.0), isnan(_1306));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1308.xy, uint(rint(_1308.z)), _400);
    float3 _1317 = float3(_420, _412, float(int(_392)));
    float3 _1319 = select(_1317, float3(0.0), isnan(_1317));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1319.xy, uint(rint(_1319.z)), _400);
    float3 _1328 = float3(_416, _422, float(int(_392)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1330.xy, uint(rint(_1330.z)), _400);
    float3 _1339 = float3(_418, _414, float(int(_392)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1341.xy, uint(rint(_1341.z)), _400);
    float3 _1350 = float3(_420, _414, float(int(_392)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1352.xy, uint(rint(_1352.z)), _400);
    float3 _1361 = float3(_416, _414, float(int(_392)));
    float3 _1363 = select(_1361, float3(0.0), isnan(_1361));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1363.xy, uint(rint(_1363.z)), _400);
    float3 _1372 = float3(_410, _422, float(int(_392)));
    float3 _1374 = select(_1372, float3(0.0), isnan(_1372));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1374.xy, uint(rint(_1374.z)), _400);
    float3 _1383 = float3(_418, _422, float(int(_392)));
    float3 _1385 = select(_1383, float3(0.0), isnan(_1383));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1385.xy, uint(rint(_1385.z)), _400);
    float3 _1394 = float3(_420, _422, float(int(_392)));
    float3 _1396 = select(_1394, float3(0.0), isnan(_1394));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1396.xy, uint(rint(_1396.z)), _400);
    float _448 = _244 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _450 = fma(_408, -1.5, _404);
    float _452 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[15].x, _448);
    float _454 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].z, _452);
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _458 = _244 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _460 = _244 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _462 = 1.0 / _456;
    float _464 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[12].x, _458);
    float _466 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].x, _460);
    float _468 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].z, _464);
    float _470 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _466);
    float _472 = _468 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _474 = _470 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _476 = _472 * _462;
    float _478 = _474 * _462;
    float2 _1470 = float2(_476, _478);
    float2 _482 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1470, float2(0.0), isnan(_1470))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1470, float2(0.0), isnan(_1470))).xy;
    float _484 = _482.x;
    float _486 = _482.y;
    float3 _1485 = float3(_416, _450, float(int(_392)));
    float3 _1487 = select(_1485, float3(0.0), isnan(_1485));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1487.xy, uint(rint(_1487.z)), _400);
    float3 _1496 = float3(_410, _450, float(int(_392)));
    float3 _1498 = select(_1496, float3(0.0), isnan(_1496));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1498.xy, uint(rint(_1498.z)), _400);
    float3 _1507 = float3(_418, _450, float(int(_392)));
    float3 _1509 = select(_1507, float3(0.0), isnan(_1507));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1509.xy, uint(rint(_1509.z)), _400);
    float3 _1518 = float3(_420, _450, float(int(_392)));
    float3 _1520 = select(_1518, float3(0.0), isnan(_1518));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1520.xy, uint(rint(_1520.z)), _400);
    float _496 = _244 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _498 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[14].x, _496);
    float _500 = -_106;
    float _502 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _504 = _500 + _502;
    float _506 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].z, _498);
    float _508 = _504 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _510 = precise::clamp(_508, 0.0, 1.0);
    float _512 = _506 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _514 = precise::min(_512, 1.0);
    float _516 = _440 + _424;
    float _518 = _516 + _436;
    float _520 = _518 + _438;
    float _522 = _520 + _426;
    float _524 = _522 + _428;
    float _526 = _524 + _430;
    float _528 = _526 + _432;
    float _530 = _528 + _434;
    float _532 = _530 + _442;
    float _534 = _532 + _444;
    float _536 = _534 + _446;
    float _538 = -_106;
    float _540 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _542 = _538 + _540;
    float _544 = _542 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = -_484;
    float _550 = fma(_548, _484, _486);
    float _552 = -_484;
    float _554 = _514 + _552;
    float _556 = fma(_554, _554, _550);
    float _558 = _536 + _488;
    bool _560 = _554 <= 0.001000000047497451305389404296875;
    float _562 = float(_560);
    float _564 = 1.0 / _556;
    float _566 = _558 + _490;
    float _568 = _566 + _492;
    float _570 = _550 * _564;
    float _572 = precise::max(_570, _562);
    float _574 = _568 + _494;
    float _576 = precise::min(_572, 1.0);
    float _578 = fma(_574, 0.0625, _510);
    float _580 = _576 + _546;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _578;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _580;
    return out;
}

