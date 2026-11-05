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
    bool _294 = false;
    bool _292 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _551 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _568 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).x;
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
    float _110 = -_66;
    float _112 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _114 = -_102;
    float _116 = fma(_108, _72, _114);
    float _118 = -_104;
    float _120 = fma(_108, _76, _118);
    float _122 = -_100;
    float _124 = _122 + _108;
    float _126 = 1.0 / _112;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _96 * _128;
    float _132 = _116 * _116;
    float _134 = -_102;
    float _136 = fma(_130, _74, _134);
    float _138 = -_104;
    float _140 = fma(_130, _78, _138);
    float _142 = -_100;
    float _144 = _142 + _130;
    float _146 = fma(_120, _120, _132);
    float _148 = _136 * _136;
    float _150 = fma(_124, _124, _146);
    float _152 = fma(_140, _140, _148);
    float _154 = fma(_144, _144, _152);
    float _156 = rsqrt(_150);
    float _158 = rsqrt(_154);
    float _160 = _120 * _156;
    float _162 = _124 * _156;
    float _164 = _116 * _156;
    float _166 = _144 * _158;
    float _168 = _136 * _158;
    float _170 = _140 * _158;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _182 = _126 * _180;
    float _184 = -_174;
    float _186 = fma(_164, _166, _184);
    float _188 = _164 * _170;
    float _190 = _178 * _178;
    float _192 = -_182;
    bool _196 = _192 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _198 = -_188;
    float _200 = fma(_160, _168, _198);
    float _202 = fma(_186, _186, _190);
    float _204 = -_182;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = -_182;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _212 = fma(_200, _200, _202);
    bool _214 = !_196;
    int _217 = _214 ? 0 : 1;
    float _219 = rsqrt(_212);
    int _221 = 2;
    if (!_196)
    {
        _221 = 1;
    }
    int _223 = _221;
    int _225 = _223;
    if (!_206)
    {
        _225 = _217;
    }
    int _227 = _225;
    int _229 = _227 + 1;
    uint _232 = uint(_229);
    if (!_210)
    {
        _232 = uint(_227);
    }
    uint _234 = _232;
    float _236 = _178 * _219;
    float _238 = _186 * _219;
    uint _240 = min(_234, 2u);
    float _242 = _200 * _219;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _246 = int(_240) << 2;
    float _248 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    uint _250 = uint(int(uint(_246) >> uint(2)));
    uint _252 = uint(int(uint(int(_250)) >> uint(2)));
    int _254 = int(_250) & 3;
    float _256 = (*spvDescriptorSet0.fp_c1)._m0[int(_252)][_254];
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _260 = abs(_258);
    float _262 = -_260;
    float _264 = _262 + 1.0;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = abs(_266);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = _238 * _276;
    float _280 = _236 * _276;
    float _282 = fma(_242, _276, _182);
    float _284 = fma(_182, _70, _278);
    float _286 = fma(_182, _68, _280);
    bool _288 = as_type<int>(_256) == 1392;
    if (!_288)
    {
        bool _290 = as_type<int>(_256) == 1664;
        _292 = _290;
        if (!_292)
        {
            _294 = true;
        }
    }
    float _328;
    float _330;
    float _332;
    float _334;
    if (!_292)
    {
        if (!_294)
        {
            float _296 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _298 = _286 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _300 = _286 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _302 = _286 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _304 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
            float _306 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].x, _298);
            float _308 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].x, _300);
            float _310 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].x, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
            float _316 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
            float _318 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _310);
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _328 = _326;
            _330 = _324;
            _332 = _320;
            _334 = _322;
        }
    }
    if ((false || _294) || _292)
    {
        if ((!_294) || _292)
        {
            _292 = false;
            float _336 = _286 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _338 = _286 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _340 = _286 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _342 = _286 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _344 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].x, _336);
            float _346 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].x, _338);
            float _348 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].x, _340);
            float _350 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].x, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _346);
            float _356 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _348);
            float _358 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _350);
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _328 = _366;
            _330 = _364;
            _332 = _360;
            _334 = _362;
        }
        if (false || _294)
        {
            _294 = false;
            float _368 = _286 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _370 = _286 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _372 = _286 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _374 = _286 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _376 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x, _368);
            float _378 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].x, _370);
            float _380 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].x, _372);
            float _382 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].x, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _378);
            float _388 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _380);
            float _390 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _328 = _398;
            _330 = _396;
            _332 = _392;
            _334 = _394;
        }
    }
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = 1.0 / _400;
    float _410 = float(int(_234));
    float _412 = rint(_410);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _422 = _408 * _402;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = _408 * _404;
    float _428 = _408 * _406;
    float _430 = _424 * _420;
    float _432 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _434 = fma(_430, 0.5, _426);
    float _436 = _424 * _432;
    float _438 = fma(_430, 1.5, _426);
    float _440 = fma(_430, -0.5, _426);
    float _442 = fma(_436, 1.5, _428);
    float _444 = fma(_430, -1.5, _426);
    float _446 = fma(_436, 0.5, _428);
    float3 _1259 = float3(_434, _442, float(int(_418)));
    float3 _1263 = select(_1259, float3(0.0), isnan(_1259));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1263.xy, uint(rint(_1263.z)), _424);
    float3 _1272 = float3(_438, _442, float(int(_418)));
    float3 _1274 = select(_1272, float3(0.0), isnan(_1272));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1274.xy, uint(rint(_1274.z)), _424);
    float3 _1283 = float3(_440, _442, float(int(_418)));
    float3 _1285 = select(_1283, float3(0.0), isnan(_1283));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1285.xy, uint(rint(_1285.z)), _424);
    float3 _1294 = float3(_444, _442, float(int(_418)));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1296.xy, uint(rint(_1296.z)), _424);
    float3 _1305 = float3(_438, _446, float(int(_418)));
    float3 _1307 = select(_1305, float3(0.0), isnan(_1305));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1307.xy, uint(rint(_1307.z)), _424);
    float3 _1316 = float3(_434, _446, float(int(_418)));
    float3 _1318 = select(_1316, float3(0.0), isnan(_1316));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1318.xy, uint(rint(_1318.z)), _424);
    float3 _1327 = float3(_440, _446, float(int(_418)));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1329.xy, uint(rint(_1329.z)), _424);
    float3 _1338 = float3(_444, _446, float(int(_418)));
    float3 _1340 = select(_1338, float3(0.0), isnan(_1338));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1340.xy, uint(rint(_1340.z)), _424);
    float _464 = fma(_436, -0.5, _428);
    float3 _1352 = float3(_434, _464, float(int(_418)));
    float3 _1354 = select(_1352, float3(0.0), isnan(_1352));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1354.xy, uint(rint(_1354.z)), _424);
    float3 _1363 = float3(_438, _464, float(int(_418)));
    float3 _1365 = select(_1363, float3(0.0), isnan(_1363));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1365.xy, uint(rint(_1365.z)), _424);
    float3 _1374 = float3(_440, _464, float(int(_418)));
    float3 _1376 = select(_1374, float3(0.0), isnan(_1374));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1376.xy, uint(rint(_1376.z)), _424);
    float3 _1385 = float3(_444, _464, float(int(_418)));
    float3 _1387 = select(_1385, float3(0.0), isnan(_1385));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1387.xy, uint(rint(_1387.z)), _424);
    float _474 = fma(_436, -1.5, _428);
    float3 _1399 = float3(_438, _474, float(int(_418)));
    float3 _1401 = select(_1399, float3(0.0), isnan(_1399));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1401.xy, uint(rint(_1401.z)), _424);
    float3 _1410 = float3(_434, _474, float(int(_418)));
    float3 _1412 = select(_1410, float3(0.0), isnan(_1410));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1412.xy, uint(rint(_1412.z)), _424);
    float3 _1421 = float3(_440, _474, float(int(_418)));
    float3 _1423 = select(_1421, float3(0.0), isnan(_1421));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1423.xy, uint(rint(_1423.z)), _424);
    float3 _1432 = float3(_444, _474, float(int(_418)));
    float3 _1434 = select(_1432, float3(0.0), isnan(_1432));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1434.xy, uint(rint(_1434.z)), _424);
    float2 _1440 = float2(_52, _54);
    float _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1440, float2(0.0), isnan(_1440))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1440, float2(0.0), isnan(_1440))).x;
    float _486 = -_182;
    float _488 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _490 = _486 + _488;
    float _492 = -_182;
    float _494 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _496 = _492 + _494;
    float _498 = _490 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _496 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[48].w, _504);
    float _508 = _450 + _448;
    float _510 = _508 + _452;
    float _512 = _510 + _454;
    float _514 = _512 + _456;
    float _516 = _514 + _458;
    float _518 = _516 + _460;
    float _520 = _518 + _462;
    float _522 = _520 + _468;
    float _524 = _522 + _466;
    float _526 = _524 + _470;
    float _528 = _526 + _472;
    float _530 = _528 + _476;
    float _532 = _530 + _478;
    float _534 = _532 + _480;
    float _536 = _534 + _482;
    float _538 = fma(_536, 0.0625, _500);
    out.m_45.x = _484;
    out.m_45.y = _538;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _506;
    return out;
}

