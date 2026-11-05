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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
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
    float2 _560 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_560, float2(0.0), isnan(_560)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _577 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_577, float2(0.0), isnan(_577))).x;
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
    float _180 = _174 * _72;
    float _182 = -_176;
    float _184 = fma(_162, _170, _182);
    float _186 = _164 * _170;
    float _188 = -_178;
    float _190 = fma(_164, _166, _188);
    float _192 = -_174;
    bool _196 = _192 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _198 = _184 * _184;
    float _200 = -_186;
    float _202 = fma(_160, _168, _200);
    float _204 = -_174;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = _174 * _68;
    float _210 = fma(_190, _190, _198);
    float _212 = -_174;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _216 = fma(_202, _202, _210);
    bool _218 = !_196;
    int _221 = _218 ? 0 : 1;
    int _223 = 2;
    if (!_196)
    {
        _223 = 1;
    }
    int _225 = _223;
    float _227 = rsqrt(_216);
    int _229 = _225;
    if (!_206)
    {
        _229 = _221;
    }
    int _231 = _229;
    int _233 = _231 + 1;
    uint _236 = uint(_233);
    if (!_214)
    {
        _236 = uint(_231);
    }
    uint _238 = _236;
    uint _240 = min(_238, 2u);
    int _242 = int(_240) << 2;
    float _244 = _184 * _227;
    float _246 = _190 * _227;
    float _248 = _202 * _227;
    uint _250 = uint(int(uint(_242) >> uint(2)));
    uint _252 = uint(int(uint(int(_250)) >> uint(2)));
    int _254 = int(_250) & 3;
    float _256 = (*spvDescriptorSet0.fp_c1)._m0[int(_252)][_254];
    float _258 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _260 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[35].x, _258);
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
    float _282 = fma(_246, _280, _180);
    float _284 = fma(_244, _280, _208);
    float _286 = fma(_248, _280, _174);
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
            _332 = _322;
            _334 = _320;
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
            _332 = _362;
            _334 = _360;
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
            _332 = _394;
            _334 = _392;
        }
    }
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _208 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _410 = 1.0 / _400;
    float _412 = _208 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _414 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _416 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[15].x, _408);
    float _418 = float(int(_238));
    float _420 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[12].x, _412);
    float _422 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[15].z, _416);
    float _424 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[12].z, _420);
    float _426 = rint(_418);
    float _428 = precise::max(_426, 0.0);
    uint _430 = uint(_428);
    uint _432 = clamp(_430, 0u, 65535u);
    float _434 = _422 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _436 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _414);
    float _438 = _424 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _440 = _410 * _402;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].z, _436);
    float _446 = 1.0 / _434;
    float _448 = _410 * _404;
    float _450 = _442 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _452 = _444 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _454 = _410 * _406;
    float _456 = _450 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _458 = _450 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _460 = fma(_458, -0.5, _448);
    float _462 = _438 * _446;
    float _464 = _452 * _446;
    float _466 = fma(_456, 0.5, _454);
    float _468 = fma(_456, -0.5, _454);
    float _470 = fma(_458, 0.5, _448);
    float2 _1318 = float2(_462, _464);
    float2 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1318, float2(0.0), isnan(_1318))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1318, float2(0.0), isnan(_1318))).xy;
    float _476 = _474.x;
    float _478 = _474.y;
    float3 _1333 = float3(_468, _470, float(int(_432)));
    float3 _1337 = select(_1333, float3(0.0), isnan(_1333));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1337.xy, uint(rint(_1337.z)), _442);
    float3 _1346 = float3(_466, _470, float(int(_432)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1348.xy, uint(rint(_1348.z)), _442);
    float3 _1357 = float3(_466, _460, float(int(_432)));
    float3 _1359 = select(_1357, float3(0.0), isnan(_1357));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1359.xy, uint(rint(_1359.z)), _442);
    float3 _1368 = float3(_468, _460, float(int(_432)));
    float3 _1370 = select(_1368, float3(0.0), isnan(_1368));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1370.xy, uint(rint(_1370.z)), _442);
    float _488 = _208 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _490 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[14].x, _488);
    float _492 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[14].z, _490);
    float _494 = _492 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _496 = precise::min(_494, 1.0);
    float _498 = -_476;
    float _500 = fma(_498, _476, _478);
    float _502 = -_476;
    float _504 = _496 + _502;
    float _506 = fma(_504, _504, _500);
    bool _508 = _504 <= 0.001000000047497451305389404296875;
    float _510 = float(_508);
    float _512 = 1.0 / _506;
    float _514 = _482 + _480;
    float _516 = _514 + _484;
    float _518 = _500 * _512;
    float _520 = -_174;
    float _522 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _524 = _520 + _522;
    float _526 = -_174;
    float _528 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _530 = _526 + _528;
    float _532 = precise::max(_518, _510);
    float _534 = _516 + _486;
    float _536 = _524 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _530 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = precise::min(_532, 1.0);
    float _546 = fma(_534, 0.25, _538);
    float _548 = _544 + _542;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _546;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _548;
    return out;
}

