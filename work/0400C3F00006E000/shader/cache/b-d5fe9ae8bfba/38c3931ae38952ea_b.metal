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
    bool _294 = false;
    bool _292 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _618 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _635 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
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
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _72 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _94 * _110;
    float _114 = 1.0 / _98;
    float _116 = -_106;
    float _118 = fma(_112, _70, _116);
    float _120 = -_108;
    float _122 = fma(_112, _76, _120);
    float _124 = -_104;
    float _126 = _124 + _112;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _100 * _128;
    float _132 = _118 * _118;
    float _134 = -_106;
    float _136 = fma(_130, _74, _134);
    float _138 = -_108;
    float _140 = fma(_130, _78, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_104;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = fma(_126, _126, _142);
    float _152 = fma(_140, _140, _148);
    float _154 = fma(_146, _146, _152);
    float _156 = rsqrt(_150);
    float _158 = rsqrt(_154);
    float _160 = _122 * _156;
    float _162 = _126 * _156;
    float _164 = _118 * _156;
    float _166 = _146 * _158;
    float _168 = _136 * _158;
    float _170 = _140 * _158;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _174 = _114 * _172;
    float _176 = _160 * _166;
    float _178 = _162 * _168;
    float _180 = _164 * _170;
    float _182 = _174 * _72;
    float _184 = -_176;
    float _186 = fma(_162, _170, _184);
    float _188 = -_178;
    float _190 = fma(_164, _166, _188);
    float _192 = -_180;
    float _194 = fma(_160, _168, _192);
    float _196 = -_174;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _202 = _186 * _186;
    float _204 = -_174;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = -_174;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _212 = fma(_190, _190, _202);
    bool _214 = !_200;
    int _217 = _214 ? 0 : 1;
    float _219 = fma(_194, _194, _212);
    int _221 = 2;
    if (!_200)
    {
        _221 = 1;
    }
    int _223 = _221;
    float _225 = rsqrt(_219);
    int _227 = _223;
    if (!_206)
    {
        _227 = _217;
    }
    int _229 = _227;
    int _231 = _229 + 1;
    uint _234 = uint(_231);
    if (!_210)
    {
        _234 = uint(_229);
    }
    uint _236 = _234;
    uint _238 = min(_236, 2u);
    int _240 = int(_238) << 2;
    float _242 = _186 * _225;
    float _244 = _190 * _225;
    float _246 = _194 * _225;
    uint _248 = uint(int(uint(_240) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = _242 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].x, _256);
    float _260 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].z, _258);
    float _262 = abs(_260);
    float _264 = -_262;
    float _266 = _264 + 1.0;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _174 * _68;
    float _272 = abs(_268);
    float _274 = log2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _278 = exp2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _282 = fma(_244, _280, _182);
    float _284 = fma(_242, _280, _270);
    float _286 = fma(_246, _280, _174);
    bool _288 = as_type<int>(_254) == 1392;
    if (!_288)
    {
        bool _290 = as_type<int>(_254) == 1664;
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
            float _296 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _298 = _284 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _300 = _284 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _302 = _284 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _304 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
            float _306 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].x, _298);
            float _308 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].x, _300);
            float _310 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].z, _304);
            float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
            float _316 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
            float _318 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].z, _310);
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
            float _336 = _284 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _338 = _284 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _340 = _284 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _342 = _284 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _344 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].x, _336);
            float _346 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].x, _338);
            float _348 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].x, _340);
            float _350 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].z, _344);
            float _354 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].z, _346);
            float _356 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].z, _348);
            float _358 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].z, _350);
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
            float _368 = _284 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _370 = _284 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _372 = _284 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _374 = _284 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _376 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].x, _368);
            float _378 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].x, _370);
            float _380 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].x, _372);
            float _382 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].z, _376);
            float _386 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].z, _378);
            float _388 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].z, _380);
            float _390 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
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
    float _410 = float(int(_236));
    float _412 = rint(_410);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    uint _418 = clamp(_416, 0u, 65535u);
    float _420 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _424 = _408 * _402;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _408 * _404;
    float _430 = _408 * _406;
    float _432 = _426 * _420;
    float _434 = _426 * _422;
    float _436 = fma(_432, 0.5, _428);
    float _438 = fma(_434, 0.5, _430);
    float _440 = fma(_434, 1.5, _430);
    float _442 = fma(_432, 1.5, _428);
    float _444 = fma(_432, -0.5, _428);
    float _446 = fma(_432, -1.5, _428);
    float _448 = fma(_434, -0.5, _430);
    float3 _1329 = float3(_436, _440, float(int(_418)));
    float3 _1333 = select(_1329, float3(0.0), isnan(_1329));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1333.xy, uint(rint(_1333.z)), _426);
    float3 _1342 = float3(_442, _438, float(int(_418)));
    float3 _1344 = select(_1342, float3(0.0), isnan(_1342));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1344.xy, uint(rint(_1344.z)), _426);
    float3 _1353 = float3(_436, _438, float(int(_418)));
    float3 _1355 = select(_1353, float3(0.0), isnan(_1353));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1355.xy, uint(rint(_1355.z)), _426);
    float3 _1364 = float3(_444, _438, float(int(_418)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1366.xy, uint(rint(_1366.z)), _426);
    float3 _1375 = float3(_446, _438, float(int(_418)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1377.xy, uint(rint(_1377.z)), _426);
    float3 _1386 = float3(_442, _448, float(int(_418)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1388.xy, uint(rint(_1388.z)), _426);
    float3 _1397 = float3(_444, _440, float(int(_418)));
    float3 _1399 = select(_1397, float3(0.0), isnan(_1397));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1399.xy, uint(rint(_1399.z)), _426);
    float3 _1408 = float3(_446, _440, float(int(_418)));
    float3 _1410 = select(_1408, float3(0.0), isnan(_1408));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1410.xy, uint(rint(_1410.z)), _426);
    float3 _1419 = float3(_442, _440, float(int(_418)));
    float3 _1421 = select(_1419, float3(0.0), isnan(_1419));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1421.xy, uint(rint(_1421.z)), _426);
    float3 _1430 = float3(_436, _448, float(int(_418)));
    float3 _1432 = select(_1430, float3(0.0), isnan(_1430));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1432.xy, uint(rint(_1432.z)), _426);
    float3 _1441 = float3(_444, _448, float(int(_418)));
    float3 _1443 = select(_1441, float3(0.0), isnan(_1441));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1443.xy, uint(rint(_1443.z)), _426);
    float3 _1452 = float3(_446, _448, float(int(_418)));
    float3 _1454 = select(_1452, float3(0.0), isnan(_1452));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1454.xy, uint(rint(_1454.z)), _426);
    float _474 = _270 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _476 = fma(_434, -1.5, _430);
    float _478 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[15].x, _474);
    float _480 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[15].z, _478);
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _484 = _270 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _486 = _270 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _488 = 1.0 / _482;
    float _490 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[12].x, _484);
    float _492 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _486);
    float _494 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[12].z, _490);
    float _496 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].z, _492);
    float _498 = _494 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _500 = _496 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _502 = _498 * _488;
    float _504 = _500 * _488;
    float2 _1528 = float2(_502, _504);
    float2 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1528, float2(0.0), isnan(_1528))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1528, float2(0.0), isnan(_1528))).xy;
    float _510 = _508.x;
    float _512 = _508.y;
    float3 _1543 = float3(_442, _476, float(int(_418)));
    float3 _1545 = select(_1543, float3(0.0), isnan(_1543));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1545.xy, uint(rint(_1545.z)), _426);
    float3 _1554 = float3(_436, _476, float(int(_418)));
    float3 _1556 = select(_1554, float3(0.0), isnan(_1554));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1556.xy, uint(rint(_1556.z)), _426);
    float3 _1565 = float3(_444, _476, float(int(_418)));
    float3 _1567 = select(_1565, float3(0.0), isnan(_1565));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1567.xy, uint(rint(_1567.z)), _426);
    float3 _1576 = float3(_446, _476, float(int(_418)));
    float3 _1578 = select(_1576, float3(0.0), isnan(_1576));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1578.xy, uint(rint(_1578.z)), _426);
    float _522 = _270 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _524 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[14].x, _522);
    float _526 = -_174;
    float _528 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _530 = _526 + _528;
    float _532 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[14].z, _524);
    float _534 = _530 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = _532 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _540 = precise::min(_538, 1.0);
    float _542 = _466 + _450;
    float _544 = _542 + _462;
    float _546 = _544 + _464;
    float _548 = _546 + _452;
    float _550 = _548 + _454;
    float _552 = _550 + _456;
    float _554 = _552 + _458;
    float _556 = _554 + _460;
    float _558 = _556 + _468;
    float _560 = _558 + _470;
    float _562 = _560 + _472;
    float _564 = -_174;
    float _566 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _568 = _564 + _566;
    float _570 = _568 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    float _574 = -_510;
    float _576 = fma(_574, _510, _512);
    float _578 = -_510;
    float _580 = _540 + _578;
    float _582 = fma(_580, _580, _576);
    float _584 = _562 + _514;
    bool _586 = _580 <= 0.001000000047497451305389404296875;
    float _588 = float(_586);
    float _590 = 1.0 / _582;
    float _592 = _584 + _516;
    float _594 = _592 + _518;
    float _596 = _576 * _590;
    float _598 = precise::max(_596, _588);
    float _600 = _594 + _520;
    float _602 = precise::min(_598, 1.0);
    float _604 = fma(_600, 0.0625, _536);
    float _606 = _602 + _572;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _604;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _606;
    return out;
}

