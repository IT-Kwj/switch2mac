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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    bool _284 = false;
    bool _282 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _541 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _558 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _70 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _72, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = -_100;
    float _138 = _136 + _124;
    float _140 = fma(_116, _116, _126);
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _140);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_138, _138, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = -_66;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _158 = _116 * _150;
    float _160 = 1.0 / _156;
    float _162 = _120 * _150;
    float _164 = _112 * _150;
    float _166 = _138 * _152;
    float _168 = _130 * _152;
    float _170 = _134 * _152;
    float _172 = _158 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = _164 * _170;
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    float _186 = _178 * _178;
    float _188 = -_180;
    float _190 = fma(_158, _168, _188);
    float _192 = fma(_184, _184, _186);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _196 = _160 * _194;
    float _198 = fma(_190, _190, _192);
    float _200 = -_196;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = -_196;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = rsqrt(_198);
    bool _212 = !_204;
    uint _215 = uint(_212 ? 0 : 1);
    uint _217 = 2u;
    if (!_204)
    {
        _217 = 1u;
    }
    uint _219 = _217;
    uint _221 = _219;
    if (!_208)
    {
        _221 = _215;
    }
    uint _223 = _221;
    float _225 = _178 * _210;
    float _227 = _184 * _210;
    uint _229 = min(_223, 2u);
    float _231 = _190 * _210;
    float _233 = _225 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _236 = int(_229) << 2;
    float _238 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[35].x, _233);
    uint _240 = uint(int(uint(_236) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = _227 * _266;
    float _270 = _225 * _266;
    float _272 = fma(_231, _266, _196);
    float _274 = fma(_196, _70, _268);
    float _276 = fma(_196, _68, _270);
    bool _278 = as_type<int>(_246) == 1344;
    if (!_278)
    {
        bool _280 = as_type<int>(_246) == 1616;
        _282 = _280;
        if (!_282)
        {
            _284 = true;
        }
    }
    float _318;
    float _320;
    float _322;
    float _324;
    if (!_282)
    {
        if (!_284)
        {
            float _286 = _276 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _276 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _276 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _314;
            _322 = _310;
            _324 = _312;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _276 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _276 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _354;
            _322 = _350;
            _324 = _352;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _276 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _276 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _276 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _386;
            _322 = _382;
            _324 = _384;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = 1.0 / _390;
    float _400 = float(int(_223));
    float _402 = rint(_400);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    uint _408 = clamp(_406, 0u, 65535u);
    float _410 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _412 = _398 * _392;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _398 * _394;
    float _418 = _398 * _396;
    float _420 = _414 * _410;
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _424 = fma(_420, 0.5, _416);
    float _426 = _414 * _422;
    float _428 = fma(_420, 1.5, _416);
    float _430 = fma(_420, -0.5, _416);
    float _432 = fma(_426, 1.5, _418);
    float _434 = fma(_420, -1.5, _416);
    float _436 = fma(_426, 0.5, _418);
    float3 _1233 = float3(_424, _432, float(int(_408)));
    float3 _1237 = select(_1233, float3(0.0), isnan(_1233));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1237.xy, uint(rint(_1237.z)), _414);
    float3 _1246 = float3(_428, _432, float(int(_408)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), _414);
    float3 _1257 = float3(_430, _432, float(int(_408)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1259.xy, uint(rint(_1259.z)), _414);
    float3 _1268 = float3(_434, _432, float(int(_408)));
    float3 _1270 = select(_1268, float3(0.0), isnan(_1268));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1270.xy, uint(rint(_1270.z)), _414);
    float3 _1279 = float3(_428, _436, float(int(_408)));
    float3 _1281 = select(_1279, float3(0.0), isnan(_1279));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1281.xy, uint(rint(_1281.z)), _414);
    float3 _1290 = float3(_424, _436, float(int(_408)));
    float3 _1292 = select(_1290, float3(0.0), isnan(_1290));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1292.xy, uint(rint(_1292.z)), _414);
    float3 _1301 = float3(_430, _436, float(int(_408)));
    float3 _1303 = select(_1301, float3(0.0), isnan(_1301));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1303.xy, uint(rint(_1303.z)), _414);
    float3 _1312 = float3(_434, _436, float(int(_408)));
    float3 _1314 = select(_1312, float3(0.0), isnan(_1312));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1314.xy, uint(rint(_1314.z)), _414);
    float _454 = fma(_426, -0.5, _418);
    float3 _1326 = float3(_424, _454, float(int(_408)));
    float3 _1328 = select(_1326, float3(0.0), isnan(_1326));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1328.xy, uint(rint(_1328.z)), _414);
    float3 _1337 = float3(_428, _454, float(int(_408)));
    float3 _1339 = select(_1337, float3(0.0), isnan(_1337));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1339.xy, uint(rint(_1339.z)), _414);
    float3 _1348 = float3(_430, _454, float(int(_408)));
    float3 _1350 = select(_1348, float3(0.0), isnan(_1348));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1350.xy, uint(rint(_1350.z)), _414);
    float3 _1359 = float3(_434, _454, float(int(_408)));
    float3 _1361 = select(_1359, float3(0.0), isnan(_1359));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1361.xy, uint(rint(_1361.z)), _414);
    float _464 = fma(_426, -1.5, _418);
    float3 _1373 = float3(_428, _464, float(int(_408)));
    float3 _1375 = select(_1373, float3(0.0), isnan(_1373));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1375.xy, uint(rint(_1375.z)), _414);
    float3 _1384 = float3(_424, _464, float(int(_408)));
    float3 _1386 = select(_1384, float3(0.0), isnan(_1384));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1386.xy, uint(rint(_1386.z)), _414);
    float3 _1395 = float3(_430, _464, float(int(_408)));
    float3 _1397 = select(_1395, float3(0.0), isnan(_1395));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1397.xy, uint(rint(_1397.z)), _414);
    float3 _1406 = float3(_434, _464, float(int(_408)));
    float3 _1408 = select(_1406, float3(0.0), isnan(_1406));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1408.xy, uint(rint(_1408.z)), _414);
    float2 _1414 = float2(_52, _54);
    float _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1414, float2(0.0), isnan(_1414))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1414, float2(0.0), isnan(_1414))).x;
    float _476 = -_196;
    float _478 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _480 = _476 + _478;
    float _482 = -_196;
    float _484 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _486 = _482 + _484;
    float _488 = _480 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = _486 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[48].w, _494);
    float _498 = _440 + _438;
    float _500 = _498 + _442;
    float _502 = _500 + _444;
    float _504 = _502 + _446;
    float _506 = _504 + _448;
    float _508 = _506 + _450;
    float _510 = _508 + _452;
    float _512 = _510 + _458;
    float _514 = _512 + _456;
    float _516 = _514 + _460;
    float _518 = _516 + _462;
    float _520 = _518 + _466;
    float _522 = _520 + _468;
    float _524 = _522 + _470;
    float _526 = _524 + _472;
    float _528 = fma(_526, 0.0625, _490);
    out.m_45.x = _474;
    out.m_45.y = _528;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _496;
    return out;
}

