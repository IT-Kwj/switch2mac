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
    bool _288 = false;
    bool _286 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _548 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _565 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_565, float2(0.0), isnan(_565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_565, float2(0.0), isnan(_565))).x;
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
    float _156 = rsqrt(_152);
    float _158 = -_70;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = _120 * _154;
    float _164 = _124 * _154;
    float _166 = 1.0 / _160;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _162 * _170;
    float _178 = _164 * _172;
    float _180 = -_176;
    float _182 = fma(_164, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _166 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_162, _172, _196);
    float _200 = fma(_188, _188, _194);
    float _202 = -_192;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = -_192;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _212 = fma(_198, _198, _200);
    bool _214 = !_206;
    uint _217 = uint(_214 ? 0 : 1);
    float _219 = rsqrt(_212);
    uint _221 = 2u;
    if (!_206)
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
    float _234 = _182 * _219;
    float _236 = _188 * _219;
    float _238 = _198 * _219;
    float _240 = _192 * _76;
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _244 = uint(int(uint(_232) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _254 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _192 * _72;
    float _266 = abs(_262);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = fma(_236, _274, _240);
    float _278 = fma(_234, _274, _264);
    float _280 = fma(_238, _274, _192);
    bool _282 = as_type<int>(_250) == 1344;
    if (!_282)
    {
        bool _284 = as_type<int>(_250) == 1616;
        _286 = _284;
        if (!_286)
        {
            _288 = true;
        }
    }
    float _322;
    float _324;
    float _326;
    float _328;
    if (!_286)
    {
        if (!_288)
        {
            float _290 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _296 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _296);
            float _306 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, _298);
            float _308 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[1].z, _300);
            float _310 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[2].z, _302);
            float _312 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[3].z, _304);
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _322 = _320;
            _324 = _316;
            _326 = _314;
            _328 = _318;
        }
    }
    if ((false || _288) || _286)
    {
        if ((!_288) || _286)
        {
            _286 = false;
            float _330 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _336 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _336);
            float _346 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[4].z, _338);
            float _348 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[5].z, _340);
            float _350 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].z, _342);
            float _352 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[7].z, _344);
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _322 = _360;
            _324 = _356;
            _326 = _354;
            _328 = _358;
        }
        if (false || _288)
        {
            _288 = false;
            float _362 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _368 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _368);
            float _378 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[8].z, _370);
            float _380 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[9].z, _372);
            float _382 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[10].z, _374);
            float _384 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _322 = _392;
            _324 = _388;
            _326 = _386;
            _328 = _390;
        }
    }
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _264 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _404 = _264 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _406 = 1.0 / _394;
    float _408 = float(int(_227));
    float _410 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[13].x, _402);
    float _412 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[15].x, _404);
    float2 _1196 = float2(_56, _58);
    float2 _416 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1196, float2(0.0), isnan(_1196))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1196, float2(0.0), isnan(_1196))).xy;
    float _418 = _416.x;
    float _420 = _416.y;
    float _422 = _264 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _424 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].z, _410);
    float _426 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[15].z, _412);
    float _428 = rint(_408);
    float _430 = precise::max(_428, 0.0);
    uint _432 = uint(_430);
    uint _434 = clamp(_432, 0u, 65535u);
    float _436 = _424 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _438 = _426 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _440 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[12].x, _422);
    float _442 = 1.0 / _438;
    float _444 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[12].z, _440);
    float _446 = _406 * _396;
    float _448 = _406 * _398;
    float _450 = _406 * _400;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = _444 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _456 = _454 * _442;
    float _458 = _436 * _442;
    float2 _1274 = float2(_456, _458);
    float2 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1274, float2(0.0), isnan(_1274))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1274, float2(0.0), isnan(_1274))).xy;
    float _462 = _460.x;
    float _464 = _460.y;
    float3 _1289 = float3(_448, _446, float(int(_434)));
    float3 _1293 = select(_1289, float3(0.0), isnan(_1289));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1293.xy, uint(rint(_1293.z)), _452);
    float _468 = fma(_418, 2.0, -1.0);
    float _470 = fma(_420, 2.0, -1.0);
    float _472 = _468 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _474 = _470 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _476 = fma(_472, 2.0, _56);
    float _478 = fma(_474, 2.0, _58);
    float2 _1320 = float2(_476, _478);
    float _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1320, float2(0.0), isnan(_1320))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1320, float2(0.0), isnan(_1320))).x;
    float _482 = _264 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _484 = -_192;
    float _486 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _488 = _484 + _486;
    float _490 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[14].x, _482);
    float _492 = -_462;
    float _494 = fma(_492, _462, _464);
    float _496 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[14].z, _490);
    float _498 = -_192;
    float _500 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _502 = _498 + _500;
    float _504 = _488 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = _496 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _510 = _502 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _466 + _506;
    float _516 = precise::min(_508, 1.0);
    float _518 = -_462;
    float _520 = _516 + _518;
    float _522 = fma(_520, _520, _494);
    bool _524 = _520 <= 0.001000000047497451305389404296875;
    float _526 = float(_524);
    float _528 = 1.0 / _522;
    float _530 = _494 * _528;
    float _532 = precise::max(_530, _526);
    float _534 = precise::min(_532, 1.0);
    float _536 = _534 + _512;
    out.m_49.x = _480;
    out.m_49.y = _514;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _536;
    return out;
}

