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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _298 = false;
    bool _296 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _538 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _555 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float2 _563 = float2(_54, _56);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_44.y;
    float _80 = in.m_42.x;
    float _82 = in.m_44.x;
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_66;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = -_68;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _104 = 1.0 / _94;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _96 * _106;
    float _110 = _72 * _108;
    float _112 = _76 * _108;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _98 * _114;
    float _118 = 1.0 / _102;
    float _120 = -_110;
    float _122 = fma(_116, _74, _120);
    float _124 = -_112;
    float _126 = fma(_116, _80, _124);
    float _128 = -_108;
    float _130 = _128 + _116;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _134 = _104 * _132;
    float _136 = _122 * _122;
    float _138 = -_110;
    float _140 = fma(_134, _78, _138);
    float _142 = -_112;
    float _144 = fma(_134, _82, _142);
    float _146 = fma(_126, _126, _136);
    float _148 = -_108;
    float _150 = _148 + _134;
    float _152 = _140 * _140;
    float _154 = fma(_130, _130, _146);
    float _156 = fma(_144, _144, _152);
    float _158 = fma(_150, _150, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _126 * _160;
    float _166 = _130 * _160;
    float _168 = _122 * _160;
    float _170 = _150 * _162;
    float _172 = _140 * _162;
    float _174 = _144 * _162;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = _118 * _176;
    float _180 = _164 * _170;
    float _182 = _166 * _172;
    float _184 = _178 * _76;
    float _186 = -_180;
    float _188 = fma(_166, _174, _186);
    float _190 = _168 * _174;
    float _192 = -_182;
    float _194 = fma(_168, _170, _192);
    float _196 = -_178;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _202 = _188 * _188;
    float _204 = -_190;
    float _206 = fma(_164, _172, _204);
    float _208 = -_178;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _212 = fma(_194, _194, _202);
    float _214 = -_178;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _218 = fma(_206, _206, _212);
    bool _220 = !_200;
    int _223 = _220 ? 0 : 1;
    int _225 = 2;
    if (!_200)
    {
        _225 = 1;
    }
    int _227 = _225;
    float _229 = rsqrt(_218);
    int _231 = _227;
    if (!_210)
    {
        _231 = _223;
    }
    int _233 = _231;
    int _235 = _233 + 1;
    uint _238 = uint(_235);
    if (!_216)
    {
        _238 = uint(_233);
    }
    uint _240 = _238;
    float _242 = _188 * _229;
    uint _244 = min(_240, 2u);
    float _246 = _194 * _229;
    float _248 = _206 * _229;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _252 = int(_244) << 2;
    float _254 = _178 * _72;
    float _256 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    uint _258 = uint(int(uint(_252) >> uint(2)));
    uint _260 = uint(int(uint(int(_258)) >> uint(2)));
    int _262 = int(_258) & 3;
    float _264 = (*spvDescriptorSet0.fp_c1)._m0[int(_260)][_262];
    float _266 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = abs(_274);
    float _278 = log2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _282 = exp2(_280);
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _286 = fma(_246, _284, _184);
    float _288 = fma(_242, _284, _254);
    float _290 = fma(_248, _284, _178);
    bool _292 = as_type<int>(_264) == 1424;
    if (!_292)
    {
        bool _294 = as_type<int>(_264) == 1696;
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
            _334 = _324;
            _336 = _326;
            _338 = _328;
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
            _334 = _364;
            _336 = _366;
            _338 = _368;
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
            _334 = _396;
            _336 = _398;
            _338 = _400;
        }
    }
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _254 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _414 = _254 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _416 = 1.0 / _404;
    float _418 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[15].x, _412);
    float _420 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[13].x, _414);
    float _422 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[15].z, _418);
    float _424 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
    float _426 = _422 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _428 = _254 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _430 = _424 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _432 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[12].x, _428);
    float _434 = 1.0 / _426;
    float _436 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[12].z, _432);
    float _438 = _436 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _440 = _438 * _434;
    float _442 = _430 * _434;
    float _444 = _416 * _406;
    float _446 = _416 * _408;
    float _448 = _416 * _410;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = float(int(_240));
    float2 _1266 = float2(_440, _442);
    float2 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1266, float2(0.0), isnan(_1266))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1266, float2(0.0), isnan(_1266))).xy;
    float _458 = _456.x;
    float _460 = _456.y;
    float _462 = rint(_452);
    float _464 = precise::max(_462, 0.0);
    uint _466 = uint(_464);
    uint _468 = clamp(_466, 0u, 65535u);
    float3 _1291 = float3(_444, _446, float(int(_468)));
    float3 _1295 = select(_1291, float3(0.0), isnan(_1291));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1295.xy, uint(rint(_1295.z)), _450);
    float _472 = _254 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _474 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[14].x, _472);
    float _476 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].z, _474);
    float _478 = _476 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _480 = precise::min(_478, 1.0);
    float _482 = -_458;
    float _484 = fma(_482, _458, _460);
    float _486 = -_458;
    float _488 = _480 + _486;
    float _490 = -_178;
    float _492 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _494 = _490 + _492;
    float _496 = fma(_488, _488, _484);
    bool _498 = _488 <= 0.001000000047497451305389404296875;
    float _500 = float(_498);
    float _502 = _494 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = 1.0 / _496;
    float _508 = _484 * _506;
    float _510 = -_178;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _514 = _510 + _512;
    float _516 = precise::max(_508, _500);
    float _518 = _514 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = precise::min(_516, 1.0);
    float _524 = _470 + _520;
    float _526 = _522 + _504;
    out.m_47.x = _70;
    out.m_47.y = _524;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _526;
    return out;
}

