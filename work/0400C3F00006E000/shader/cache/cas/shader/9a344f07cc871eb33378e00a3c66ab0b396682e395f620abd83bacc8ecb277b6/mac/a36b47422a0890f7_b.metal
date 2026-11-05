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
    bool _288 = false;
    bool _286 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _528 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_528, float2(0.0), isnan(_528)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _545 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_545, float2(0.0), isnan(_545))).x;
    float2 _553 = float2(_54, _56);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_553, float2(0.0), isnan(_553))).x;
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
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = -_178;
    float _186 = fma(_168, _170, _184);
    float _188 = _168 * _174;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _118 * _190;
    float _194 = _182 * _182;
    float _196 = -_188;
    float _198 = fma(_164, _172, _196);
    float _200 = _192 * _76;
    float _202 = fma(_186, _186, _194);
    float _204 = -_192;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = -_192;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_198, _198, _202);
    bool _216 = !_208;
    uint _219 = uint(_216 ? 0 : 1);
    float _221 = rsqrt(_214);
    uint _223 = 2u;
    if (!_208)
    {
        _223 = 1u;
    }
    uint _225 = _223;
    uint _227 = _225;
    if (!_212)
    {
        _227 = _219;
    }
    uint _229 = _227;
    float _231 = _192 * _72;
    float _233 = _182 * _221;
    uint _235 = min(_229, 2u);
    float _237 = _186 * _221;
    float _239 = _198 * _221;
    float _241 = _233 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _244 = int(_235) << 2;
    float _246 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[35].x, _241);
    uint _248 = uint(int(uint(_244) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = abs(_264);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = fma(_237, _274, _200);
    float _278 = fma(_233, _274, _231);
    float _280 = fma(_239, _274, _192);
    bool _282 = as_type<int>(_254) == 1376;
    if (!_282)
    {
        bool _284 = as_type<int>(_254) == 1648;
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
            _324 = _314;
            _326 = _316;
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
            _324 = _354;
            _326 = _356;
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
            _324 = _386;
            _326 = _388;
            _328 = _390;
        }
    }
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _231 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _404 = _231 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _406 = 1.0 / _394;
    float _408 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].x, _402);
    float _410 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[13].x, _404);
    float _412 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[15].z, _408);
    float _414 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].z, _410);
    float _416 = _412 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _418 = _231 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _420 = _414 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _422 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[12].x, _418);
    float _424 = 1.0 / _416;
    float _426 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[12].z, _422);
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _430 = _428 * _424;
    float _432 = _420 * _424;
    float _434 = _406 * _396;
    float _436 = _406 * _398;
    float _438 = _406 * _400;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = float(int(_229));
    float2 _1240 = float2(_430, _432);
    float2 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1240, float2(0.0), isnan(_1240))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1240, float2(0.0), isnan(_1240))).xy;
    float _448 = _446.x;
    float _450 = _446.y;
    float _452 = rint(_442);
    float _454 = precise::max(_452, 0.0);
    uint _456 = uint(_454);
    uint _458 = clamp(_456, 0u, 65535u);
    float3 _1265 = float3(_434, _436, float(int(_458)));
    float3 _1269 = select(_1265, float3(0.0), isnan(_1265));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1269.xy, uint(rint(_1269.z)), _440);
    float _462 = _231 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _464 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[14].x, _462);
    float _466 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[14].z, _464);
    float _468 = _466 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _470 = precise::min(_468, 1.0);
    float _472 = -_448;
    float _474 = fma(_472, _448, _450);
    float _476 = -_448;
    float _478 = _470 + _476;
    float _480 = fma(_478, _478, _474);
    bool _482 = _478 <= 0.001000000047497451305389404296875;
    float _484 = float(_482);
    float _486 = 1.0 / _480;
    float _488 = _474 * _486;
    float _490 = -_192;
    float _492 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _494 = _490 + _492;
    float _496 = precise::max(_488, _484);
    float _498 = -_192;
    float _500 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _502 = _498 + _500;
    float _504 = _494 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = precise::min(_496, 1.0);
    float _510 = _502 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _460 + _506;
    float _516 = _508 + _512;
    out.m_47.x = _70;
    out.m_47.y = _514;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _516;
    return out;
}

