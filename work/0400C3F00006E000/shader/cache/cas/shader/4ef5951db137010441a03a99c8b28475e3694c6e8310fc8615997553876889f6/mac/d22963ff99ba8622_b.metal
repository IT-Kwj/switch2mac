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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _646 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _54;
    float _70 = _66 * _56;
    float _72 = -_66;
    float _74 = _72 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = -_68;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _82 = -_70;
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _86 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _88 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _90 = _80 * _80;
    float _92 = -_66;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _96 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _86);
    float _98 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _88);
    float _100 = fma(_84, _84, _90);
    float _102 = -_68;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _106 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _108 = _98 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _110 = fma(_94, _94, _100);
    float _112 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _114 = _106 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _116 = 1.0 / _108;
    float _118 = -_70;
    float _120 = _118 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _122 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _112);
    float _124 = _104 * _104;
    float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _122);
    float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _130 = sqrt(_110);
    float _132 = fma(_120, _120, _124);
    float _134 = _126 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
    float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
    float _140 = _134 * _116;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _146 = rint(_142);
    float _148 = precise::max(_146, 0.0);
    uint _151 = uint(_148);
    uint _153 = clamp(_151, 0u, 65535u);
    float _155 = _144 * _116;
    bool _159 = _130 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _161 = _114 * _116;
    bool _163 = _130 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _165 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _155);
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _169 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _167, _155);
    float _171 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _161);
    bool _173 = !_159;
    int _176 = _173 ? 0 : 1;
    float3 _880 = float3(_165, _171, float(int(_153)));
    float3 _884 = select(_880, float3(0.0), isnan(_880));
    float _178 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _884.xy, uint(rint(_884.z)), 1.0);
    float3 _892 = float3(_155, _171, float(int(_153)));
    float3 _894 = select(_892, float3(0.0), isnan(_892));
    float _180 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _894.xy, uint(rint(_894.z)), 1.0);
    int _182 = 2;
    if (!_159)
    {
        _182 = 1;
    }
    int _184 = _182;
    float3 _907 = float3(_169, _171, float(int(_153)));
    float3 _909 = select(_907, float3(0.0), isnan(_907));
    float _186 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _909.xy, uint(rint(_909.z)), 1.0);
    int _188 = _184;
    if (!_163)
    {
        _188 = _176;
    }
    int _190 = _188;
    float _192 = fma(_74, _74, _132);
    float _194 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _196 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _198 = float(_190);
    float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _202 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _194);
    float _204 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _206 = precise::min(_198, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _208 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _196);
    float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _200);
    float _214 = sqrt(_192);
    bool _216 = _206 != 1.0;
    bool _218 = isnan(_206);
    bool _220 = _216 || _218;
    bool _222 = isnan(1.0);
    bool _224 = _220 || _222;
    float _226 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _228 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _204);
    float _230 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _208);
    float _232 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _234 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _210);
    float _236 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _238 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _212);
    float _240 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _226);
    float _242 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _228);
    float _244 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _232);
    float _246 = _234 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _248 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _236);
    float _250 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _240);
    bool _252 = _214 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _254 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _256 = _214 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _258 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _230);
    float _260 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _202);
    float _262 = _238 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _264 = _262;
    float _266 = _246;
    if (_224)
    {
        float _268 = _242 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _264 = _268;
    }
    float _270 = _264;
    float _272 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _244);
    float _274 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _248);
    float _276 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _254);
    float _278 = _250 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float3 _1108 = float3(_155, _161, float(int(_153)));
    float3 _1110 = select(_1108, float3(0.0), isnan(_1108));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1110.xy, uint(rint(_1110.z)), 1.0);
    float3 _1118 = float3(_165, _161, float(int(_153)));
    float3 _1120 = select(_1118, float3(0.0), isnan(_1118));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1120.xy, uint(rint(_1120.z)), 1.0);
    float _284 = _272 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _286 = _284;
    float _288 = _278;
    float _290 = _270;
    if (_224)
    {
        float _292 = _274 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _286 = _292;
    }
    float _294 = _286;
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _298 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _300 = _206 != 0.0;
    bool _302 = isnan(_206);
    bool _304 = _300 || _302;
    bool _306 = isnan(0.0);
    bool _308 = _304 || _306;
    float _310 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _312 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _314 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _316 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _318 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _320 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _322 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float3 _1200 = float3(_169, _161, float(int(_153)));
    float3 _1202 = select(_1200, float3(0.0), isnan(_1200));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1202.xy, uint(rint(_1202.z)), 1.0);
    bool _326 = !_252;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _296);
    float _332 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _298);
    float _334 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _310);
    float _336 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _312);
    float _338 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _314);
    float _340 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _316);
    float _342 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _318);
    float _344 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _320);
    float _346 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _322);
    float _348 = _294;
    int _350 = 2;
    if (!_308)
    {
        float _352 = _260 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _348 = _352;
    }
    float _354 = _348;
    if (!_252)
    {
        _350 = 1;
    }
    int _356 = _350;
    float _358 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _344);
    int _360 = _356;
    if (!_256)
    {
        _360 = _328;
    }
    int _362 = _360;
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _276);
    float _366 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _342);
    float _368 = float(_362);
    float _370 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _372 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _370, _161);
    float _374 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _340);
    float _376 = _366 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _378 = precise::min(_368, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float3 _1320 = float3(_165, _372, float(int(_153)));
    float3 _1322 = select(_1320, float3(0.0), isnan(_1320));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1322.xy, uint(rint(_1322.z)), 1.0);
    float _382 = _376;
    if (_224)
    {
        float _384 = _258 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _266 = _384;
    }
    float _386 = _266;
    float _388 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _346);
    bool _390 = _378 != 1.0;
    bool _392 = isnan(_378);
    bool _394 = _390 || _392;
    bool _396 = isnan(1.0);
    bool _398 = _394 || _396;
    float _400 = _374 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float3 _1360 = float3(_155, _372, float(int(_153)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1362.xy, uint(rint(_1362.z)), 1.0);
    float3 _1370 = float3(_169, _372, float(int(_153)));
    float3 _1372 = select(_1370, float3(0.0), isnan(_1370));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1372.xy, uint(rint(_1372.z)), 1.0);
    float _406 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _330);
    float _408 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _332);
    float _410 = _400;
    float _412 = _386;
    if (_398)
    {
        float _414 = _364 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _382 = _414;
    }
    float _416 = _382;
    float _418 = _416;
    if (_398)
    {
        float _420 = _388 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _288 = _420;
    }
    float _422 = _288;
    float _424 = _422;
    if (_398)
    {
        float _426 = _358 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _410 = _426;
    }
    float _428 = _410;
    bool _430 = _378 != 0.0;
    bool _432 = isnan(_378);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    float _440 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _442 = _428;
    if (!_308)
    {
        float _444 = _406 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _290 = _444;
    }
    float _446 = _290;
    if (!_308)
    {
        float _448 = _408 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _412 = _448;
    }
    float _450 = _412;
    float _452 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _454 = 0.0 + _354;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _334);
    float _460 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _338);
    float _462 = rint(_378);
    float _464 = precise::max(_462, 0.0);
    uint _466 = uint(_464);
    uint _468 = clamp(_466, 0u, 65535u);
    float _470 = fma(_456, _452, _450);
    float _472 = rint(_206);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    uint _478 = clamp(_476, 0u, 65535u);
    if (!_438)
    {
        float _480 = _458 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _442 = _480;
    }
    float _482 = _442;
    if (!_438)
    {
        float _484 = _460 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _424 = _484;
    }
    float _486 = _424;
    float _488 = fma(_456, _440, _446);
    float _490 = _178 + _180;
    float _492 = _490 + _186;
    float _494 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _336);
    float3 _1532 = float3(_446, _470, float(int(_478)));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1534.xy, uint(rint(_1534.z)), _456);
    float _498 = _492 + _282;
    float _500 = _498 + _280;
    float _502 = _500 + _324;
    float _504 = -_440;
    float _506 = fma(_456, _504, _446);
    float3 _1558 = float3(_506, _470, float(int(_478)));
    float3 _1560 = select(_1558, float3(0.0), isnan(_1558));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1560.xy, uint(rint(_1560.z)), _456);
    float3 _1569 = float3(_488, _470, float(int(_478)));
    float3 _1571 = select(_1569, float3(0.0), isnan(_1569));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1571.xy, uint(rint(_1571.z)), _456);
    float3 _1580 = float3(_488, _450, float(int(_478)));
    float3 _1582 = select(_1580, float3(0.0), isnan(_1580));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1582.xy, uint(rint(_1582.z)), _456);
    float3 _1591 = float3(_446, _450, float(int(_478)));
    float3 _1593 = select(_1591, float3(0.0), isnan(_1591));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1593.xy, uint(rint(_1593.z)), _456);
    float3 _1602 = float3(_506, _450, float(int(_478)));
    float3 _1604 = select(_1602, float3(0.0), isnan(_1602));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1604.xy, uint(rint(_1604.z)), _456);
    if (!_438)
    {
        float _518 = _494 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _418 = _518;
    }
    float _520 = _418;
    float _522 = -_452;
    float _524 = fma(_456, _522, _450);
    float _526 = 0.0 + _486;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = _502 + _380;
    float _532 = fma(_440, _528, _482);
    float _534 = -_440;
    float _536 = fma(_534, _528, _482);
    float _538 = fma(_452, _528, _520);
    float3 _1650 = float3(_488, _524, float(int(_478)));
    float3 _1652 = select(_1650, float3(0.0), isnan(_1650));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1652.xy, uint(rint(_1652.z)), _456);
    float3 _1661 = float3(_446, _524, float(int(_478)));
    float3 _1663 = select(_1661, float3(0.0), isnan(_1661));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1663.xy, uint(rint(_1663.z)), _456);
    float3 _1672 = float3(_506, _524, float(int(_478)));
    float3 _1674 = select(_1672, float3(0.0), isnan(_1672));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1674.xy, uint(rint(_1674.z)), _456);
    float3 _1683 = float3(_482, _538, float(int(_468)));
    float3 _1685 = select(_1683, float3(0.0), isnan(_1683));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1685.xy, uint(rint(_1685.z)), _528);
    float3 _1694 = float3(_532, _538, float(int(_468)));
    float3 _1696 = select(_1694, float3(0.0), isnan(_1694));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1696.xy, uint(rint(_1696.z)), _528);
    float3 _1705 = float3(_536, _538, float(int(_468)));
    float3 _1707 = select(_1705, float3(0.0), isnan(_1705));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1707.xy, uint(rint(_1707.z)), _528);
    float _552 = -_452;
    float _554 = fma(_552, _528, _520);
    float3 _1722 = float3(_532, _520, float(int(_468)));
    float3 _1724 = select(_1722, float3(0.0), isnan(_1722));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1724.xy, uint(rint(_1724.z)), _528);
    float3 _1733 = float3(_482, _520, float(int(_468)));
    float3 _1735 = select(_1733, float3(0.0), isnan(_1733));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1735.xy, uint(rint(_1735.z)), _528);
    float3 _1744 = float3(_536, _520, float(int(_468)));
    float3 _1746 = select(_1744, float3(0.0), isnan(_1744));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1746.xy, uint(rint(_1746.z)), _528);
    float3 _1755 = float3(_532, _554, float(int(_468)));
    float3 _1757 = select(_1755, float3(0.0), isnan(_1755));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1757.xy, uint(rint(_1757.z)), _528);
    float3 _1766 = float3(_482, _554, float(int(_468)));
    float3 _1768 = select(_1766, float3(0.0), isnan(_1766));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1768.xy, uint(rint(_1768.z)), _528);
    float3 _1777 = float3(_536, _554, float(int(_468)));
    float3 _1779 = select(_1777, float3(0.0), isnan(_1777));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1779.xy, uint(rint(_1779.z)), _528);
    float _568 = _530 + _402;
    float _570 = _568 + _404;
    float _572 = -_66;
    float _574 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _576 = _572 + _574;
    float _578 = _576 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = fma(_570, 0.111111111938953399658203125, _580);
    float _584 = -_66;
    float _586 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _588 = _584 + _586;
    float _590 = _588 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _592 = precise::clamp(_590, 0.0, 1.0);
    float _594 = _510 + _496;
    float _596 = _594 + _508;
    float _598 = _596 + _512;
    float _600 = _598 + _514;
    float _602 = _600 + _516;
    float _604 = _602 + _540;
    float _606 = _604 + _542;
    float _608 = _548 + _546;
    float _610 = _606 + _544;
    float _612 = _608 + _550;
    float _614 = _610 * 0.111111111938953399658203125;
    float _616 = _612 + _556;
    float _618 = _616 + _558;
    float _620 = _618 + _560;
    float _622 = _620 + _562;
    float _624 = _622 + _564;
    float _626 = _624 + _566;
    float _628 = _626 * 0.111111111938953399658203125;
    float _630 = _628 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _632 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[49].z, _630);
    float _634 = _592 + _632;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _582;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _634;
    return out;
}

