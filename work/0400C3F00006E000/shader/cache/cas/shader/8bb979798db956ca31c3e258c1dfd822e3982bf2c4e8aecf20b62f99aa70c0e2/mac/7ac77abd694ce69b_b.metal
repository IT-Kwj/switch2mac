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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _298 = false;
    bool _296 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _584 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_584, float2(0.0), isnan(_584)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _601 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_66;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _72 * _104;
    float _108 = _76 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _74, _114);
    float _118 = -_108;
    float _120 = fma(_112, _80, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _78, _132);
    float _136 = -_108;
    float _138 = fma(_128, _82, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = -_70;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _160 = rsqrt(_152);
    float _162 = 1.0 / _158;
    float _164 = _120 * _154;
    float _166 = _124 * _154;
    float _168 = _116 * _154;
    float _170 = _144 * _160;
    float _172 = _134 * _160;
    float _174 = _138 * _160;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _186 = _162 * _184;
    float _188 = _168 * _174;
    float _190 = -_178;
    float _192 = fma(_168, _170, _190);
    float _194 = _182 * _182;
    float _196 = -_188;
    float _198 = fma(_164, _172, _196);
    float _200 = -_186;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = fma(_192, _192, _194);
    float _208 = -_186;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _212 = _186 * _72;
    float _214 = -_186;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _218 = fma(_198, _198, _206);
    bool _220 = !_204;
    int _223 = _220 ? 0 : 1;
    float _225 = _186 * _76;
    float _227 = rsqrt(_218);
    int _229 = 2;
    if (!_204)
    {
        _229 = 1;
    }
    int _231 = _229;
    int _233 = _231;
    if (!_210)
    {
        _233 = _223;
    }
    int _235 = _233;
    int _237 = _235 + 1;
    uint _240 = uint(_237);
    if (!_216)
    {
        _240 = uint(_235);
    }
    uint _242 = _240;
    float _244 = _182 * _227;
    uint _246 = min(_242, 2u);
    float _248 = _192 * _227;
    float _250 = _198 * _227;
    float _252 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _254 = int(_246) << 2;
    float _256 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _252);
    uint _258 = uint(int(uint(_254) >> uint(2)));
    uint _260 = uint(int(uint(int(_258)) >> uint(2)));
    int _262 = int(_258) & 3;
    float _264 = (*spvDescriptorSet0.fp_c1)._m0[int(_260)][_262];
    float _266 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = abs(_274);
    float _278 = log2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _282 = exp2(_280);
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _286 = fma(_248, _284, _225);
    float _288 = fma(_244, _284, _212);
    float _290 = fma(_250, _284, _186);
    bool _292 = as_type<int>(_264) == 1392;
    if (!_292)
    {
        bool _294 = as_type<int>(_264) == 1664;
        _296 = _294;
        if (!_296)
        {
            _298 = true;
        }
    }
    float _332;
    float _334;
    float _336;
    float _338;
    if (!_296)
    {
        if (!_298)
        {
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _306 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _304);
            float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _306);
            float _316 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[0].z, _308);
            float _318 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
            float _322 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[3].z, _314);
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _332 = _330;
            _334 = _328;
            _336 = _324;
            _338 = _326;
        }
    }
    if ((false || _298) || _296)
    {
        if ((!_298) || _296)
        {
            _296 = false;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _346 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _344);
            float _354 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _346);
            float _356 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[4].z, _348);
            float _358 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].z, _352);
            float _362 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[7].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _332 = _370;
            _334 = _368;
            _336 = _364;
            _338 = _366;
        }
        if (false || _298)
        {
            _298 = false;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _378 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _376);
            float _386 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _378);
            float _388 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[8].z, _380);
            float _390 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[10].z, _384);
            float _394 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _332 = _402;
            _334 = _400;
            _336 = _396;
            _338 = _398;
        }
    }
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float2 _1223 = float2(_56, _58);
    float2 _414 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1223, float2(0.0), isnan(_1223))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1223, float2(0.0), isnan(_1223))).xy;
    float _416 = _414.x;
    float _418 = _414.y;
    float _420 = _212 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _422 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _424 = 1.0 / _404;
    float _426 = float(int(_242));
    float _428 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[15].x, _420);
    float _430 = _212 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _432 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[13].x, _422);
    float _434 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].z, _428);
    float _436 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[13].z, _432);
    float _438 = rint(_426);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    uint _444 = clamp(_442, 0u, 65535u);
    float _446 = _434 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _448 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[12].x, _430);
    float _450 = _436 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _452 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[12].z, _448);
    float _454 = _424 * _406;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = 1.0 / _446;
    float _460 = _424 * _408;
    float _462 = _452 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _464 = _424 * _410;
    float _466 = _456 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _468 = _462 * _458;
    float _470 = _450 * _458;
    float _472 = _466 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _474 = _466 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float2 _1340 = float2(_468, _470);
    float2 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1340, float2(0.0), isnan(_1340))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1340, float2(0.0), isnan(_1340))).xy;
    float _478 = _476.x;
    float _480 = _476.y;
    float _482 = fma(_472, 0.5, _460);
    float _484 = fma(_472, -0.5, _460);
    float _486 = fma(_474, 0.5, _464);
    float _488 = fma(_474, -0.5, _464);
    float _490 = fma(_418, 2.0, -1.0);
    float _492 = fma(_416, 2.0, -1.0);
    float _494 = _490 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _496 = _492 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _498 = fma(_494, 2.0, _58);
    float _500 = fma(_496, 2.0, _56);
    float3 _1390 = float3(_484, _486, float(int(_444)));
    float3 _1394 = select(_1390, float3(0.0), isnan(_1390));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1394.xy, uint(rint(_1394.z)), _456);
    float3 _1403 = float3(_482, _486, float(int(_444)));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1405.xy, uint(rint(_1405.z)), _456);
    float3 _1414 = float3(_482, _488, float(int(_444)));
    float3 _1416 = select(_1414, float3(0.0), isnan(_1414));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1416.xy, uint(rint(_1416.z)), _456);
    float3 _1425 = float3(_484, _488, float(int(_444)));
    float3 _1427 = select(_1425, float3(0.0), isnan(_1425));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1427.xy, uint(rint(_1427.z)), _456);
    float2 _1433 = float2(_500, _498);
    float _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1433, float2(0.0), isnan(_1433))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1433, float2(0.0), isnan(_1433))).x;
    float _512 = _212 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _514 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[14].x, _512);
    float _516 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[14].z, _514);
    float _518 = _516 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _520 = precise::min(_518, 1.0);
    float _522 = -_478;
    float _524 = fma(_522, _478, _480);
    float _526 = -_478;
    float _528 = _520 + _526;
    float _530 = fma(_528, _528, _524);
    bool _532 = _528 <= 0.001000000047497451305389404296875;
    float _534 = float(_532);
    float _536 = 1.0 / _530;
    float _538 = -_186;
    float _540 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _542 = _538 + _540;
    float _544 = _542 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = _524 * _536;
    float _550 = -_186;
    float _552 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _554 = _550 + _552;
    float _556 = precise::max(_548, _534);
    float _558 = _554 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = precise::min(_556, 1.0);
    float _564 = _562 + _546;
    float _566 = _504 + _502;
    float _568 = _566 + _506;
    float _570 = _568 + _508;
    float _572 = fma(_570, 0.25, _560);
    out.m_49.x = _510;
    out.m_49.y = _572;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _564;
    return out;
}

