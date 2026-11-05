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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _646 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = _64 * _58;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _72);
    float _80 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _74);
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _78);
    float _84 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _88 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = _82 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _94 = 1.0 / _84;
    float _96 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _88);
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _98);
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _104 = _96 * _94;
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _90 * _94;
    float _110 = _102 * _94;
    float _112 = rint(_106);
    float _114 = precise::max(_112, 0.0);
    uint _117 = uint(_114);
    uint _119 = clamp(_117, 0u, 65535u);
    float _121 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _108);
    float _123 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _110);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _127 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _125, _110);
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _131 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _129, _108);
    float3 _812 = float3(_110, _121, float(int(_119)));
    float3 _816 = select(_812, float3(0.0), isnan(_812));
    float _133 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _816.xy, uint(rint(_816.z)), 1.0);
    float3 _824 = float3(_123, _121, float(int(_119)));
    float3 _826 = select(_824, float3(0.0), isnan(_824));
    float _135 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _826.xy, uint(rint(_826.z)), 1.0);
    float3 _834 = float3(_127, _121, float(int(_119)));
    float3 _836 = select(_834, float3(0.0), isnan(_834));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _836.xy, uint(rint(_836.z)), 1.0);
    float3 _844 = float3(_123, _108, float(int(_119)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _846.xy, uint(rint(_846.z)), 1.0);
    float3 _854 = float3(_110, _108, float(int(_119)));
    float3 _856 = select(_854, float3(0.0), isnan(_854));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _856.xy, uint(rint(_856.z)), 1.0);
    float3 _864 = float3(_127, _108, float(int(_119)));
    float3 _866 = select(_864, float3(0.0), isnan(_864));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _866.xy, uint(rint(_866.z)), 1.0);
    float3 _874 = float3(_123, _131, float(int(_119)));
    float3 _876 = select(_874, float3(0.0), isnan(_874));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _876.xy, uint(rint(_876.z)), 1.0);
    float3 _884 = float3(_110, _131, float(int(_119)));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _886.xy, uint(rint(_886.z)), 1.0);
    float3 _894 = float3(_127, _131, float(int(_119)));
    float3 _896 = select(_894, float3(0.0), isnan(_894));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _896.xy, uint(rint(_896.z)), 1.0);
    float _151 = -_66;
    float _153 = _151 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _155 = -_68;
    float _157 = _155 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _159 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _161 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _163 = _153 * _153;
    float _165 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _167 = -_68;
    float _169 = _167 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _171 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _173 = fma(_157, _157, _163);
    float _175 = -_64;
    float _177 = _175 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _179 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _181 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _183 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _171);
    float _185 = fma(_177, _177, _173);
    float _187 = -_66;
    float _189 = _187 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _191 = -_64;
    float _193 = _191 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _195 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _159);
    float _197 = _189 * _189;
    float _199 = sqrt(_185);
    float _201 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _161);
    float _203 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _179);
    float _205 = fma(_169, _169, _197);
    float _207 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _209 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _211 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _213 = fma(_193, _193, _205);
    float _215 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _207);
    float _217 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _219 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _221 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _223 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _215);
    float _225 = sqrt(_213);
    float _227 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _229 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _181);
    bool _233 = _199 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _235 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _183);
    bool _237 = _199 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _239 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _241 = !_233;
    int _244 = _241 ? 0 : 1;
    float _246 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _217);
    float _248 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _195);
    float _250 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _201);
    float _252 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _203);
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _209);
    float _256 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _165);
    float _258 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _219);
    float _260 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _239);
    int _262 = 2;
    if (!_233)
    {
        _262 = 1;
    }
    int _264 = _262;
    float _266 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _227);
    int _268 = _264;
    if (!_237)
    {
        _268 = _244;
    }
    int _270 = _268;
    float _272 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _274 = _225 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _276 = _250 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    bool _278 = _225 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _280 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _272);
    float _282 = float(_270);
    float _284 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _254);
    bool _286 = !_274;
    int _288 = _286 ? 0 : 1;
    float _290 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _280);
    float _292 = precise::min(_282, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _294 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _260);
    float _296 = _290 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _298 = _292 != 1.0;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan(1.0);
    bool _306 = _302 || _304;
    float _308 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _310 = 2;
    float _312 = _296;
    float _314 = _276;
    if (!_274)
    {
        _310 = 1;
    }
    int _316 = _310;
    float _318 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _246);
    int _320 = _316;
    if (!_278)
    {
        _320 = _288;
    }
    int _322 = _320;
    float _324 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _326 = _292 != 0.0;
    bool _328 = isnan(_292);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _308);
    float _338 = float(_322);
    float _340 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _342 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _324);
    float _344 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _336);
    float _346 = precise::min(_338, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    if (_306)
    {
        float _348 = _223 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _312 = _348;
    }
    float _350 = _312;
    float _352 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _221);
    float _354 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _211);
    float _356 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _340);
    float _358 = _248 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _360 = _346 != 1.0;
    bool _362 = isnan(_346);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.0);
    bool _368 = _364 || _366;
    float _370 = _358;
    float _372 = _350;
    if (_306)
    {
        float _374 = _252 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _370 = _374;
    }
    float _376 = _370;
    float _378 = _376;
    if (_306)
    {
        float _380 = _344 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _314 = _380;
    }
    float _382 = _314;
    float _384 = rint(_292);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    uint _390 = clamp(_388, 0u, 65535u);
    bool _392 = _346 != 0.0;
    bool _394 = isnan(_346);
    bool _396 = _392 || _394;
    bool _398 = isnan(0.0);
    bool _400 = _396 || _398;
    float _402 = _382;
    if (!_334)
    {
        float _404 = _235 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _372 = _404;
    }
    float _406 = _372;
    float _408 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _342);
    float _410 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _256);
    float _412 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _352);
    float _414 = 0.0 + _406;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    if (!_334)
    {
        float _418 = _284 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _378 = _418;
    }
    float _420 = _378;
    float _422 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _356);
    float _424 = _294 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _426 = _424;
    if (!_334)
    {
        float _428 = _408 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _402 = _428;
    }
    float _430 = _402;
    if (_368)
    {
        float _432 = _318 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _426 = _432;
    }
    float _434 = _426;
    float _436 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _258);
    float _438 = rint(_346);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    uint _444 = clamp(_442, 0u, 65535u);
    float _446 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _229);
    float _448 = _434;
    if (!_400)
    {
        float _450 = _410 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = _412 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _456 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _266);
    float _458 = _454;
    if (_368)
    {
        float _460 = _422 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _458 = _460;
    }
    float _462 = _458;
    float _464 = _462;
    if (!_400)
    {
        float _466 = _436 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _464 = _466;
    }
    float _468 = _464;
    float _470 = _135 + _133;
    float _472 = _446 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _474 = _472;
    if (_368)
    {
        float _476 = _456 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _470 + _137;
    float _482 = _480 + _139;
    float _484 = _482 + _141;
    float _486 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _354);
    float _488 = _484 + _143;
    float _490 = _488 + _145;
    float _492 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _494 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _496 = _490 + _147;
    float _498 = fma(_416, _492, _420);
    float _500 = -_492;
    float _502 = fma(_416, _500, _420);
    float _504 = fma(_416, _494, _430);
    float3 _1548 = float3(_498, _430, float(int(_390)));
    float3 _1550 = select(_1548, float3(0.0), isnan(_1548));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1550.xy, uint(rint(_1550.z)), _416);
    float _508 = -_494;
    float _510 = fma(_416, _508, _430);
    float3 _1565 = float3(_420, _504, float(int(_390)));
    float3 _1567 = select(_1565, float3(0.0), isnan(_1565));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1567.xy, uint(rint(_1567.z)), _416);
    float3 _1576 = float3(_502, _504, float(int(_390)));
    float3 _1578 = select(_1576, float3(0.0), isnan(_1576));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1578.xy, uint(rint(_1578.z)), _416);
    float3 _1587 = float3(_498, _504, float(int(_390)));
    float3 _1589 = select(_1587, float3(0.0), isnan(_1587));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1589.xy, uint(rint(_1589.z)), _416);
    float3 _1598 = float3(_420, _430, float(int(_390)));
    float3 _1600 = select(_1598, float3(0.0), isnan(_1598));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1600.xy, uint(rint(_1600.z)), _416);
    float3 _1609 = float3(_502, _430, float(int(_390)));
    float3 _1611 = select(_1609, float3(0.0), isnan(_1609));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1611.xy, uint(rint(_1611.z)), _416);
    float3 _1620 = float3(_498, _510, float(int(_390)));
    float3 _1622 = select(_1620, float3(0.0), isnan(_1620));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1622.xy, uint(rint(_1622.z)), _416);
    float3 _1631 = float3(_420, _510, float(int(_390)));
    float3 _1633 = select(_1631, float3(0.0), isnan(_1631));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1633.xy, uint(rint(_1633.z)), _416);
    float _526 = _478;
    if (!_400)
    {
        float _528 = _486 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _526 = _528;
    }
    float _530 = _526;
    float _532 = _496 + _149;
    float _534 = 0.0 + _468;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = fma(_494, _536, _530);
    float _540 = fma(_492, _536, _452);
    float _542 = -_492;
    float _544 = fma(_542, _536, _452);
    float3 _1674 = float3(_502, _510, float(int(_390)));
    float3 _1676 = select(_1674, float3(0.0), isnan(_1674));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1676.xy, uint(rint(_1676.z)), _416);
    float3 _1685 = float3(_452, _538, float(int(_444)));
    float3 _1687 = select(_1685, float3(0.0), isnan(_1685));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1687.xy, uint(rint(_1687.z)), _536);
    float3 _1696 = float3(_540, _538, float(int(_444)));
    float3 _1698 = select(_1696, float3(0.0), isnan(_1696));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1698.xy, uint(rint(_1698.z)), _536);
    float3 _1707 = float3(_544, _538, float(int(_444)));
    float3 _1709 = select(_1707, float3(0.0), isnan(_1707));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1709.xy, uint(rint(_1709.z)), _536);
    float3 _1718 = float3(_540, _530, float(int(_444)));
    float3 _1720 = select(_1718, float3(0.0), isnan(_1718));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1720.xy, uint(rint(_1720.z)), _536);
    float _556 = -_494;
    float _558 = fma(_556, _536, _530);
    float3 _1735 = float3(_452, _530, float(int(_444)));
    float3 _1737 = select(_1735, float3(0.0), isnan(_1735));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1737.xy, uint(rint(_1737.z)), _536);
    float3 _1746 = float3(_544, _530, float(int(_444)));
    float3 _1748 = select(_1746, float3(0.0), isnan(_1746));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1748.xy, uint(rint(_1748.z)), _536);
    float3 _1757 = float3(_540, _558, float(int(_444)));
    float3 _1759 = select(_1757, float3(0.0), isnan(_1757));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1759.xy, uint(rint(_1759.z)), _536);
    float3 _1768 = float3(_452, _558, float(int(_444)));
    float3 _1770 = select(_1768, float3(0.0), isnan(_1768));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1770.xy, uint(rint(_1770.z)), _536);
    float3 _1779 = float3(_544, _558, float(int(_444)));
    float3 _1781 = select(_1779, float3(0.0), isnan(_1779));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1781.xy, uint(rint(_1781.z)), _536);
    float2 _1787 = float2(_50, _52);
    float _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1787, float2(0.0), isnan(_1787))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1787, float2(0.0), isnan(_1787))).x;
    float _572 = -_64;
    float _574 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _576 = _572 + _574;
    float _578 = _576 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = fma(_532, 0.111111111938953399658203125, _580);
    float _584 = _516 + _512;
    float _586 = _584 + _514;
    float _588 = _586 + _506;
    float _590 = _588 + _518;
    float _592 = _590 + _520;
    float _594 = _592 + _522;
    float _596 = _594 + _524;
    float _598 = _550 + _548;
    float _600 = _596 + _546;
    float _602 = _598 + _552;
    float _604 = _600 * 0.111111111938953399658203125;
    float _606 = _602 + _554;
    float _608 = _606 + _560;
    float _610 = _608 + _562;
    float _612 = -_64;
    float _614 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _616 = _612 + _614;
    float _618 = _610 + _564;
    float _620 = _616 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = _618 + _566;
    float _626 = _624 + _568;
    float _628 = _626 * 0.111111111938953399658203125;
    float _630 = _628 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _632 = fma(_604, (*spvDescriptorSet0.fp_c3)._m0[49].z, _630);
    float _634 = _622 + _632;
    out.m_43.x = _570;
    out.m_43.y = _582;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _634;
    return out;
}

