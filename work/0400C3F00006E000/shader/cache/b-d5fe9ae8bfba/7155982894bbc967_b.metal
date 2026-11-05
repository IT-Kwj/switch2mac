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
    float2 _534 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _551 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).x;
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
    float _146 = _106 * _70;
    float _148 = fma(_130, _130, _136);
    float _150 = fma(_134, _134, _138);
    float _152 = -_106;
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _156 = _106 * _68;
    bool _158 = !_144;
    uint _161 = uint(_158 ? 0 : 1);
    float _163 = rsqrt(_148);
    uint _165 = 2u;
    if (!_144)
    {
        _165 = 1u;
    }
    uint _167 = _165;
    float _169 = rsqrt(_150);
    uint _171 = _167;
    if (!_154)
    {
        _171 = _161;
    }
    uint _173 = _171;
    float _175 = _118 * _163;
    float _177 = _130 * _163;
    float _179 = _110 * _163;
    float _181 = _134 * _169;
    float _183 = _114 * _169;
    float _185 = _122 * _169;
    float _187 = _175 * _181;
    float _189 = _177 * _183;
    float _191 = -_187;
    float _193 = fma(_177, _185, _191);
    float _195 = -_189;
    float _197 = fma(_179, _181, _195);
    float _199 = _179 * _185;
    uint _201 = min(_173, 2u);
    float _203 = _193 * _193;
    float _205 = -_199;
    float _207 = fma(_175, _183, _205);
    int _210 = int(_201) << 2;
    float _212 = fma(_197, _197, _203);
    float _214 = fma(_207, _207, _212);
    float _216 = rsqrt(_214);
    float _218 = _193 * _216;
    float _220 = _197 * _216;
    float _222 = _207 * _216;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _226 = uint(int(uint(_210) >> uint(2)));
    uint _228 = uint(int(uint(int(_226)) >> uint(2)));
    int _230 = int(_226) & 3;
    float _232 = (*spvDescriptorSet0.fp_c1)._m0[int(_228)][_230];
    float _234 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[35].x, _224);
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].z, _234);
    float _238 = abs(_236);
    float _240 = -_238;
    float _242 = _240 + 1.0;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = abs(_244);
    float _248 = log2(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _252 = exp2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _256 = fma(_220, _254, _146);
    float _258 = fma(_218, _254, _156);
    float _260 = fma(_222, _254, _106);
    bool _262 = as_type<int>(_232) == 1200;
    if (!_262)
    {
        bool _264 = as_type<int>(_232) == 1472;
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
            _304 = _298;
            _306 = _294;
            _308 = _296;
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
            _304 = _338;
            _306 = _334;
            _308 = _336;
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
            _304 = _370;
            _306 = _366;
            _308 = _368;
        }
    }
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _156 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _384 = 1.0 / _374;
    float _386 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _388 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _390 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[15].x, _382);
    float _392 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[12].x, _386);
    float _394 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].x, _388);
    float _396 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].z, _390);
    float _398 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].z, _392);
    float _400 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
    float _402 = _396 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _404 = float(int(_173));
    float _406 = _398 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _408 = _400 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _410 = 1.0 / _402;
    float _412 = _384 * _376;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _384 * _378;
    float _418 = _384 * _380;
    float _420 = _414 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _422 = rint(_404);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    uint _428 = clamp(_426, 0u, 65535u);
    float _430 = _420 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _432 = _420 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _434 = fma(_430, 0.5, _416);
    float _436 = fma(_430, -0.5, _416);
    float _438 = fma(_432, 0.5, _418);
    float _440 = _406 * _410;
    float _442 = _408 * _410;
    float _444 = fma(_432, -0.5, _418);
    float2 _1260 = float2(_440, _442);
    float2 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1260, float2(0.0), isnan(_1260))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1260, float2(0.0), isnan(_1260))).xy;
    float _450 = _448.x;
    float _452 = _448.y;
    float3 _1275 = float3(_436, _438, float(int(_428)));
    float3 _1279 = select(_1275, float3(0.0), isnan(_1275));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1279.xy, uint(rint(_1279.z)), _414);
    float3 _1288 = float3(_434, _438, float(int(_428)));
    float3 _1290 = select(_1288, float3(0.0), isnan(_1288));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1290.xy, uint(rint(_1290.z)), _414);
    float3 _1299 = float3(_434, _444, float(int(_428)));
    float3 _1301 = select(_1299, float3(0.0), isnan(_1299));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1301.xy, uint(rint(_1301.z)), _414);
    float3 _1310 = float3(_436, _444, float(int(_428)));
    float3 _1312 = select(_1310, float3(0.0), isnan(_1310));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1312.xy, uint(rint(_1312.z)), _414);
    float _462 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _464 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[14].x, _462);
    float _466 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].z, _464);
    float _468 = _466 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _470 = precise::min(_468, 1.0);
    float _472 = -_106;
    float _474 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _476 = _472 + _474;
    float _478 = _476 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = -_450;
    float _484 = fma(_482, _450, _452);
    float _486 = -_450;
    float _488 = _470 + _486;
    float _490 = fma(_488, _488, _484);
    bool _492 = _488 <= 0.001000000047497451305389404296875;
    float _494 = float(_492);
    float _496 = 1.0 / _490;
    float _498 = _456 + _454;
    float _500 = _498 + _458;
    float _502 = -_106;
    float _504 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _506 = _502 + _504;
    float _508 = _484 * _496;
    float _510 = _500 + _460;
    float _512 = _506 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = precise::max(_508, _494);
    float _518 = fma(_510, 0.25, _480);
    float _520 = precise::min(_516, 1.0);
    float _522 = _520 + _514;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _518;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _522;
    return out;
}

