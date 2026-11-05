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
    bool _268 = false;
    bool _266 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _508 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_508, float2(0.0), isnan(_508)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _525 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_525, float2(0.0), isnan(_525))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_98;
    float _110 = fma(_90, _72, _108);
    float _112 = -_98;
    float _114 = fma(_96, _74, _112);
    float _116 = -_100;
    float _118 = fma(_90, _76, _116);
    float _120 = -_100;
    float _122 = fma(_96, _78, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_84;
    float _130 = _128 + _90;
    float _132 = -_84;
    float _134 = _132 + _96;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = -_106;
    bool _144 = _140 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _146 = _106 * _68;
    float _148 = fma(_130, _130, _136);
    float _150 = fma(_134, _134, _138);
    float _152 = -_106;
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _156 = !_144;
    uint _159 = uint(_156 ? 0 : 1);
    float _161 = rsqrt(_148);
    uint _163 = 2u;
    if (!_144)
    {
        _163 = 1u;
    }
    uint _165 = _163;
    float _167 = rsqrt(_150);
    uint _169 = _165;
    if (!_154)
    {
        _169 = _159;
    }
    uint _171 = _169;
    float _173 = _118 * _161;
    float _175 = _130 * _161;
    float _177 = _110 * _161;
    float _179 = _134 * _167;
    float _181 = _114 * _167;
    float _183 = _122 * _167;
    float _185 = _173 * _179;
    float _187 = _175 * _181;
    float _189 = -_185;
    float _191 = fma(_175, _183, _189);
    float _193 = -_187;
    float _195 = fma(_177, _179, _193);
    float _197 = _177 * _183;
    float _199 = _191 * _191;
    float _201 = -_197;
    float _203 = fma(_173, _181, _201);
    float _205 = fma(_195, _195, _199);
    float _207 = fma(_203, _203, _205);
    float _209 = rsqrt(_207);
    float _211 = _191 * _209;
    uint _213 = min(_171, 2u);
    float _215 = _195 * _209;
    float _217 = _203 * _209;
    float _219 = _211 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _222 = int(_213) << 2;
    float _224 = _106 * _70;
    float _226 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[35].x, _219);
    uint _228 = uint(int(uint(_222) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[35].z, _226);
    float _238 = abs(_236);
    float _240 = -_238;
    float _242 = _240 + 1.0;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = abs(_244);
    float _248 = log2(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _252 = exp2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _256 = fma(_215, _254, _224);
    float _258 = fma(_211, _254, _146);
    float _260 = fma(_217, _254, _106);
    bool _262 = as_type<int>(_234) == 1200;
    if (!_262)
    {
        bool _264 = as_type<int>(_234) == 1472;
        _266 = _264;
        if (!_266)
        {
            _268 = true;
        }
    }
    float _302;
    float _304;
    float _306;
    float _308;
    if (!_266)
    {
        if (!_268)
        {
            float _270 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _272 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _274 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _276 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _278 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
            float _280 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
            float _282 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
            float _284 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].z, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
            float _290 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
            float _292 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].z, _284);
            float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _302 = _300;
            _304 = _294;
            _306 = _296;
            _308 = _298;
        }
    }
    if ((false || _268) || _266)
    {
        if ((!_268) || _266)
        {
            _266 = false;
            float _310 = _258 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _312 = _258 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _314 = _258 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _316 = _258 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _318 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[4].x, _310);
            float _320 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[5].x, _312);
            float _322 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[6].x, _314);
            float _324 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[7].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].z, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].z, _320);
            float _330 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].z, _322);
            float _332 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].z, _324);
            float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _302 = _340;
            _304 = _334;
            _306 = _336;
            _308 = _338;
        }
        if (false || _268)
        {
            _268 = false;
            float _342 = _258 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _344 = _258 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _346 = _258 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _348 = _258 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _350 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[8].x, _342);
            float _352 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[9].x, _344);
            float _354 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[10].x, _346);
            float _356 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[11].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].z, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].z, _352);
            float _362 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].z, _354);
            float _364 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _302 = _372;
            _304 = _366;
            _306 = _368;
            _308 = _370;
        }
    }
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _146 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _384 = _146 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _386 = 1.0 / _374;
    float _388 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[15].x, _382);
    float _390 = _146 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _392 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[13].x, _384);
    float _394 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].z, _388);
    float _396 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _392);
    float _398 = _394 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _400 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[12].x, _390);
    float _402 = _396 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _404 = 1.0 / _398;
    float _406 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].z, _400);
    float _408 = _386 * _376;
    float _410 = _386 * _378;
    float _412 = _386 * _380;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _406 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _418 = _416 * _404;
    float _420 = _402 * _404;
    float _422 = float(int(_171));
    float2 _1196 = float2(_418, _420);
    float2 _426 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1196, float2(0.0), isnan(_1196))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1196, float2(0.0), isnan(_1196))).xy;
    float _428 = _426.x;
    float _430 = _426.y;
    float _432 = rint(_422);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    uint _438 = clamp(_436, 0u, 65535u);
    float3 _1221 = float3(_408, _410, float(int(_438)));
    float3 _1225 = select(_1221, float3(0.0), isnan(_1221));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1225.xy, uint(rint(_1225.z)), _414);
    float _442 = _146 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _444 = -_106;
    float _446 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _448 = _444 + _446;
    float _450 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[14].x, _442);
    float _452 = _448 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].z, _450);
    float _458 = _456 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _460 = precise::min(_458, 1.0);
    float _462 = -_106;
    float _464 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _466 = _462 + _464;
    float _468 = _466 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = -_428;
    float _474 = fma(_472, _428, _430);
    float _476 = -_428;
    float _478 = _460 + _476;
    float _480 = fma(_478, _478, _474);
    bool _482 = _478 <= 0.001000000047497451305389404296875;
    float _484 = float(_482);
    float _486 = 1.0 / _480;
    float _488 = _474 * _486;
    float _490 = _440 + _454;
    float _492 = precise::max(_488, _484);
    float _494 = precise::min(_492, 1.0);
    float _496 = _494 + _470;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _490;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _496;
    return out;
}

