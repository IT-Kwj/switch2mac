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
    float2 _582 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _599 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_599, float2(0.0), isnan(_599))).x;
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
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = _114 * _150;
    float _154 = fma(_126, _126, _142);
    float _156 = fma(_140, _140, _148);
    float _158 = _152 * _72;
    float _160 = -_152;
    bool _164 = _160 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _166 = _152 * _68;
    float _168 = fma(_146, _146, _156);
    float _170 = rsqrt(_154);
    float _172 = -_152;
    bool _174 = _172 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _176 = -_152;
    bool _178 = _176 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _180 = rsqrt(_168);
    int _183 = 2;
    if (!_164)
    {
        _183 = 1;
    }
    int _185 = _183;
    float _187 = _122 * _170;
    float _189 = _126 * _170;
    float _191 = _118 * _170;
    float _193 = _146 * _180;
    float _195 = _136 * _180;
    float _197 = _140 * _180;
    float _199 = _187 * _193;
    float _201 = _189 * _195;
    float _203 = -_199;
    float _205 = fma(_189, _197, _203);
    float _207 = -_201;
    float _209 = fma(_191, _193, _207);
    float _211 = _191 * _197;
    float _213 = _205 * _205;
    float _215 = -_211;
    float _217 = fma(_187, _195, _215);
    float _219 = fma(_209, _209, _213);
    bool _221 = !_164;
    int _223 = _221 ? 0 : 1;
    float _225 = fma(_217, _217, _219);
    int _227 = _185;
    if (!_174)
    {
        _227 = _223;
    }
    int _229 = _227;
    float _231 = rsqrt(_225);
    int _233 = _229 + 1;
    uint _236 = uint(_233);
    if (!_178)
    {
        _236 = uint(_229);
    }
    uint _238 = _236;
    uint _240 = min(_238, 2u);
    int _242 = int(_240) << 2;
    float _244 = _205 * _231;
    float _246 = _209 * _231;
    float _248 = _217 * _231;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _252 = uint(int(uint(_242) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.fp_c1)._m0[int(_254)][_256];
    float _260 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    float _262 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].z, _260);
    float _264 = abs(_262);
    float _266 = -_264;
    float _268 = _266 + 1.0;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = abs(_270);
    float _274 = log2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _278 = exp2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _282 = fma(_246, _280, _158);
    float _284 = fma(_244, _280, _166);
    float _286 = fma(_248, _280, _152);
    bool _288 = as_type<int>(_258) == 1392;
    if (!_288)
    {
        bool _290 = as_type<int>(_258) == 1664;
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
            _330 = _320;
            _332 = _324;
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
            _330 = _360;
            _332 = _364;
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
            _330 = _392;
            _332 = _396;
            _334 = _394;
        }
    }
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _166 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _410 = float(int(_238));
    float _412 = 1.0 / _400;
    float _414 = _166 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _416 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[15].x, _408);
    float _418 = _166 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _420 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _414);
    float _422 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].z, _416);
    float _424 = rint(_410);
    float _426 = precise::max(_424, 0.0);
    uint _428 = uint(_426);
    uint _430 = clamp(_428, 0u, 65535u);
    float _432 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
    float _434 = _422 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _436 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[12].x, _418);
    float _438 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _440 = _432 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _442 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _444 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].z, _436);
    float _446 = 1.0 / _434;
    float _448 = _412 * _402;
    float _450 = _412 * _404;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = _444 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _456 = _412 * _406;
    float _458 = fma(_452, _438, _448);
    float _460 = -_442;
    float _462 = fma(_452, _460, _456);
    float _464 = _454 * _446;
    float _466 = -_438;
    float _468 = fma(_452, _466, _448);
    float _470 = fma(_452, _442, _456);
    float _472 = _440 * _446;
    float3 _1347 = float3(_448, _470, float(int(_430)));
    float3 _1351 = select(_1347, float3(0.0), isnan(_1347));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1351.xy, uint(rint(_1351.z)), _452);
    float3 _1360 = float3(_458, _470, float(int(_430)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1362.xy, uint(rint(_1362.z)), _452);
    float3 _1371 = float3(_468, _470, float(int(_430)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1373.xy, uint(rint(_1373.z)), _452);
    float3 _1382 = float3(_458, _456, float(int(_430)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1384.xy, uint(rint(_1384.z)), _452);
    float3 _1393 = float3(_448, _456, float(int(_430)));
    float3 _1395 = select(_1393, float3(0.0), isnan(_1393));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1395.xy, uint(rint(_1395.z)), _452);
    float2 _1401 = float2(_464, _472);
    float2 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1401, float2(0.0), isnan(_1401))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1401, float2(0.0), isnan(_1401))).xy;
    float _488 = _486.x;
    float _490 = _486.y;
    float3 _1416 = float3(_468, _456, float(int(_430)));
    float3 _1418 = select(_1416, float3(0.0), isnan(_1416));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1418.xy, uint(rint(_1418.z)), _452);
    float3 _1427 = float3(_458, _462, float(int(_430)));
    float3 _1429 = select(_1427, float3(0.0), isnan(_1427));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1429.xy, uint(rint(_1429.z)), _452);
    float3 _1438 = float3(_448, _462, float(int(_430)));
    float3 _1440 = select(_1438, float3(0.0), isnan(_1438));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1440.xy, uint(rint(_1440.z)), _452);
    float3 _1449 = float3(_468, _462, float(int(_430)));
    float3 _1451 = select(_1449, float3(0.0), isnan(_1449));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1451.xy, uint(rint(_1451.z)), _452);
    float _500 = _166 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _502 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[14].x, _500);
    float _504 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].z, _502);
    float _506 = _504 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _508 = precise::min(_506, 1.0);
    float _510 = -_152;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _514 = _510 + _512;
    float _516 = -_152;
    float _518 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _520 = _516 + _518;
    float _522 = _514 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = _476 + _474;
    float _528 = -_488;
    float _530 = fma(_528, _488, _490);
    float _532 = -_488;
    float _534 = _508 + _532;
    float _536 = _526 + _478;
    float _538 = fma(_534, _534, _530);
    float _540 = _536 + _480;
    bool _542 = _534 <= 0.001000000047497451305389404296875;
    float _544 = float(_542);
    float _546 = _540 + _482;
    float _548 = 1.0 / _538;
    float _550 = _546 + _492;
    float _552 = _550 + _494;
    float _554 = _530 * _548;
    float _556 = _552 + _496;
    float _558 = _520 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = precise::max(_554, _544);
    float _564 = _556 + _498;
    float _566 = precise::min(_562, 1.0);
    float _568 = fma(_564, 0.111111111938953399658203125, _524);
    float _570 = _566 + _560;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _568;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _570;
    return out;
}

