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
    bool _284 = false;
    bool _282 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _550 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_550, float2(0.0), isnan(_550)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _567 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_567, float2(0.0), isnan(_567))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_567, float2(0.0), isnan(_567))).x;
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
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = _164 * _170;
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _188 = _114 * _186;
    float _190 = _178 * _178;
    float _192 = -_180;
    float _194 = fma(_160, _168, _192);
    float _196 = _188 * _72;
    float _198 = fma(_184, _184, _190);
    float _200 = -_188;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = _188 * _68;
    float _208 = -_188;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _212 = fma(_194, _194, _198);
    bool _214 = !_204;
    uint _217 = uint(_214 ? 0 : 1);
    float _219 = rsqrt(_212);
    uint _221 = 2u;
    if (!_204)
    {
        _221 = 1u;
    }
    uint _223 = _221;
    uint _225 = _223;
    if (!_210)
    {
        _225 = _217;
    }
    uint _227 = _225;
    uint _229 = min(_227, 2u);
    int _232 = int(_229) << 2;
    float _234 = _178 * _219;
    float _236 = _184 * _219;
    float _238 = _194 * _219;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _242 = uint(int(uint(_232) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _240);
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _250);
    float _254 = abs(_252);
    float _256 = -_254;
    float _258 = _256 + 1.0;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = abs(_260);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_236, _270, _196);
    float _274 = fma(_234, _270, _206);
    float _276 = fma(_238, _270, _188);
    bool _278 = as_type<int>(_248) == 1344;
    if (!_278)
    {
        bool _280 = as_type<int>(_248) == 1616;
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
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _314;
            _322 = _312;
            _324 = _310;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _354;
            _322 = _352;
            _324 = _350;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _386;
            _322 = _384;
            _324 = _382;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _206 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _400 = 1.0 / _390;
    float _402 = _206 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _404 = _206 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _406 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].x, _398);
    float _408 = float(int(_227));
    float _410 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[12].x, _402);
    float _412 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].z, _406);
    float _414 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[12].z, _410);
    float _416 = rint(_408);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = _412 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _426 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _404);
    float _428 = _414 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _430 = _400 * _392;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[13].z, _426);
    float _436 = 1.0 / _424;
    float _438 = _400 * _394;
    float _440 = _432 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _442 = _434 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _444 = _400 * _396;
    float _446 = _440 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _448 = _440 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _450 = fma(_448, -0.5, _438);
    float _452 = _428 * _436;
    float _454 = _442 * _436;
    float _456 = fma(_446, 0.5, _444);
    float _458 = fma(_446, -0.5, _444);
    float _460 = fma(_448, 0.5, _438);
    float2 _1292 = float2(_452, _454);
    float2 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1292, float2(0.0), isnan(_1292))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1292, float2(0.0), isnan(_1292))).xy;
    float _466 = _464.x;
    float _468 = _464.y;
    float3 _1307 = float3(_458, _460, float(int(_422)));
    float3 _1311 = select(_1307, float3(0.0), isnan(_1307));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1311.xy, uint(rint(_1311.z)), _432);
    float3 _1320 = float3(_456, _460, float(int(_422)));
    float3 _1322 = select(_1320, float3(0.0), isnan(_1320));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1322.xy, uint(rint(_1322.z)), _432);
    float3 _1331 = float3(_456, _450, float(int(_422)));
    float3 _1333 = select(_1331, float3(0.0), isnan(_1331));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1333.xy, uint(rint(_1333.z)), _432);
    float3 _1342 = float3(_458, _450, float(int(_422)));
    float3 _1344 = select(_1342, float3(0.0), isnan(_1342));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1344.xy, uint(rint(_1344.z)), _432);
    float _478 = _206 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _480 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[14].x, _478);
    float _482 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].z, _480);
    float _484 = _482 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _486 = precise::min(_484, 1.0);
    float _488 = -_466;
    float _490 = fma(_488, _466, _468);
    float _492 = -_466;
    float _494 = _486 + _492;
    float _496 = fma(_494, _494, _490);
    bool _498 = _494 <= 0.001000000047497451305389404296875;
    float _500 = float(_498);
    float _502 = 1.0 / _496;
    float _504 = _472 + _470;
    float _506 = _504 + _474;
    float _508 = _490 * _502;
    float _510 = -_188;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _514 = _510 + _512;
    float _516 = -_188;
    float _518 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _520 = _516 + _518;
    float _522 = precise::max(_508, _500);
    float _524 = _506 + _476;
    float _526 = _514 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = _520 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = precise::min(_522, 1.0);
    float _536 = fma(_524, 0.25, _528);
    float _538 = _534 + _532;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _536;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _538;
    return out;
}

