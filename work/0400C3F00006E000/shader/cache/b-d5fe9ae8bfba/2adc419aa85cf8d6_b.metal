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
    float2 _650 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = _68 * _58;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _80 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _84 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _88 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _92 = 1.0 / _84;
    float _94 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _88);
    float _96 = _90 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _76);
    float _100 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _94);
    float _102 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _98);
    float _104 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _106 = _102 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _108 = _96 * _92;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = _104 * _92;
    float _114 = _106 * _92;
    float _116 = rint(_110);
    float _118 = precise::max(_116, 0.0);
    uint _121 = uint(_118);
    uint _123 = clamp(_121, 0u, 65535u);
    float _125 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _112);
    float _127 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _114);
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _131 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _129, _114);
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _135 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _133, _112);
    float3 _820 = float3(_114, _125, float(int(_123)));
    float3 _824 = select(_820, float3(0.0), isnan(_820));
    float _137 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _824.xy, uint(rint(_824.z)), 1.0);
    float3 _832 = float3(_127, _125, float(int(_123)));
    float3 _834 = select(_832, float3(0.0), isnan(_832));
    float _139 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _834.xy, uint(rint(_834.z)), 1.0);
    float3 _842 = float3(_131, _125, float(int(_123)));
    float3 _844 = select(_842, float3(0.0), isnan(_842));
    float _141 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _844.xy, uint(rint(_844.z)), 1.0);
    float3 _852 = float3(_127, _112, float(int(_123)));
    float3 _854 = select(_852, float3(0.0), isnan(_852));
    float _143 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _854.xy, uint(rint(_854.z)), 1.0);
    float3 _862 = float3(_114, _112, float(int(_123)));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _145 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _864.xy, uint(rint(_864.z)), 1.0);
    float3 _872 = float3(_131, _112, float(int(_123)));
    float3 _874 = select(_872, float3(0.0), isnan(_872));
    float _147 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _874.xy, uint(rint(_874.z)), 1.0);
    float3 _882 = float3(_127, _135, float(int(_123)));
    float3 _884 = select(_882, float3(0.0), isnan(_882));
    float _149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _884.xy, uint(rint(_884.z)), 1.0);
    float3 _892 = float3(_114, _135, float(int(_123)));
    float3 _894 = select(_892, float3(0.0), isnan(_892));
    float _151 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _894.xy, uint(rint(_894.z)), 1.0);
    float3 _902 = float3(_131, _135, float(int(_123)));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _153 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _904.xy, uint(rint(_904.z)), 1.0);
    float _155 = -_70;
    float _157 = _155 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _159 = -_72;
    float _161 = _159 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _163 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _165 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _167 = _157 * _157;
    float _169 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _171 = -_72;
    float _173 = _171 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _175 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _177 = fma(_161, _161, _167);
    float _179 = -_68;
    float _181 = _179 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _183 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _185 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _187 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _175);
    float _189 = fma(_181, _181, _177);
    float _191 = -_70;
    float _193 = _191 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _195 = -_68;
    float _197 = _195 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _199 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _163);
    float _201 = _193 * _193;
    float _203 = sqrt(_189);
    float _205 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _165);
    float _207 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _183);
    float _209 = fma(_173, _173, _201);
    float _211 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _213 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _215 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _217 = fma(_197, _197, _209);
    float _219 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _211);
    float _221 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _223 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _225 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _227 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _219);
    float _229 = sqrt(_217);
    float _231 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _233 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _185);
    bool _237 = _203 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _239 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _187);
    bool _241 = _203 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _243 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _245 = !_237;
    int _248 = _245 ? 0 : 1;
    float _250 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _221);
    float _252 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _199);
    float _254 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _205);
    float _256 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _207);
    float _258 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _213);
    float _260 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _169);
    float _262 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _223);
    float _264 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _243);
    int _266 = 2;
    if (!_237)
    {
        _266 = 1;
    }
    int _268 = _266;
    float _270 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _231);
    int _272 = _268;
    if (!_241)
    {
        _272 = _248;
    }
    int _274 = _272;
    float _276 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _278 = _229 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _280 = _254 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    bool _282 = _229 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _284 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _276);
    float _286 = float(_274);
    float _288 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _258);
    bool _290 = !_278;
    int _292 = _290 ? 0 : 1;
    float _294 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _284);
    float _296 = precise::min(_286, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _298 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _264);
    float _300 = _294 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _302 = _296 != 1.0;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan(1.0);
    bool _310 = _306 || _308;
    float _312 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _314 = 2;
    float _316 = _300;
    float _318 = _280;
    if (!_278)
    {
        _314 = 1;
    }
    int _320 = _314;
    float _322 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _250);
    int _324 = _320;
    if (!_282)
    {
        _324 = _292;
    }
    int _326 = _324;
    float _328 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _330 = _296 != 0.0;
    bool _332 = isnan(_296);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _312);
    float _342 = float(_326);
    float _344 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _346 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _328);
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _340);
    float _350 = precise::min(_342, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    if (_310)
    {
        float _352 = _227 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _316 = _352;
    }
    float _354 = _316;
    float _356 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _225);
    float _358 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _215);
    float _360 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _344);
    float _362 = _252 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _364 = _350 != 1.0;
    bool _366 = isnan(_350);
    bool _368 = _364 || _366;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    float _374 = _362;
    float _376 = _354;
    if (_310)
    {
        float _378 = _256 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _374 = _378;
    }
    float _380 = _374;
    float _382 = _380;
    if (_310)
    {
        float _384 = _348 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _318 = _384;
    }
    float _386 = _318;
    float _388 = rint(_296);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    uint _394 = clamp(_392, 0u, 65535u);
    bool _396 = _350 != 0.0;
    bool _398 = isnan(_350);
    bool _400 = _396 || _398;
    bool _402 = isnan(0.0);
    bool _404 = _400 || _402;
    float _406 = _386;
    if (!_338)
    {
        float _408 = _239 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _376 = _408;
    }
    float _410 = _376;
    float _412 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _346);
    float _414 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _260);
    float _416 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _356);
    float _418 = 0.0 + _410;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    if (!_338)
    {
        float _422 = _288 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _382 = _422;
    }
    float _424 = _382;
    float _426 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _360);
    float _428 = _298 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _430 = _428;
    if (!_338)
    {
        float _432 = _412 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _406 = _432;
    }
    float _434 = _406;
    if (_372)
    {
        float _436 = _322 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _430 = _436;
    }
    float _438 = _430;
    float _440 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _262);
    float _442 = rint(_350);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    uint _448 = clamp(_446, 0u, 65535u);
    float _450 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _233);
    float _452 = _438;
    if (!_404)
    {
        float _454 = _414 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _452 = _454;
    }
    float _456 = _452;
    float _458 = _416 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _460 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _270);
    float _462 = _458;
    if (_372)
    {
        float _464 = _426 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = _466;
    if (!_404)
    {
        float _470 = _440 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = _139 + _137;
    float _476 = _450 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _478 = _476;
    if (_372)
    {
        float _480 = _460 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _478 = _480;
    }
    float _482 = _478;
    float _484 = _474 + _141;
    float _486 = _484 + _143;
    float _488 = _486 + _145;
    float _490 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _358);
    float _492 = _488 + _147;
    float _494 = _492 + _149;
    float _496 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _498 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _500 = _494 + _151;
    float _502 = fma(_420, _496, _424);
    float _504 = -_496;
    float _506 = fma(_420, _504, _424);
    float _508 = fma(_420, _498, _434);
    float3 _1556 = float3(_502, _434, float(int(_394)));
    float3 _1558 = select(_1556, float3(0.0), isnan(_1556));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1558.xy, uint(rint(_1558.z)), _420);
    float _512 = -_498;
    float _514 = fma(_420, _512, _434);
    float3 _1573 = float3(_424, _508, float(int(_394)));
    float3 _1575 = select(_1573, float3(0.0), isnan(_1573));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1575.xy, uint(rint(_1575.z)), _420);
    float3 _1584 = float3(_506, _508, float(int(_394)));
    float3 _1586 = select(_1584, float3(0.0), isnan(_1584));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1586.xy, uint(rint(_1586.z)), _420);
    float3 _1595 = float3(_502, _508, float(int(_394)));
    float3 _1597 = select(_1595, float3(0.0), isnan(_1595));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1597.xy, uint(rint(_1597.z)), _420);
    float3 _1606 = float3(_424, _434, float(int(_394)));
    float3 _1608 = select(_1606, float3(0.0), isnan(_1606));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1608.xy, uint(rint(_1608.z)), _420);
    float3 _1617 = float3(_506, _434, float(int(_394)));
    float3 _1619 = select(_1617, float3(0.0), isnan(_1617));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1619.xy, uint(rint(_1619.z)), _420);
    float3 _1628 = float3(_502, _514, float(int(_394)));
    float3 _1630 = select(_1628, float3(0.0), isnan(_1628));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1630.xy, uint(rint(_1630.z)), _420);
    float3 _1639 = float3(_424, _514, float(int(_394)));
    float3 _1641 = select(_1639, float3(0.0), isnan(_1639));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1641.xy, uint(rint(_1641.z)), _420);
    float _530 = _482;
    if (!_404)
    {
        float _532 = _490 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _530 = _532;
    }
    float _534 = _530;
    float _536 = _500 + _153;
    float _538 = 0.0 + _472;
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = fma(_498, _540, _534);
    float _544 = fma(_496, _540, _456);
    float _546 = -_496;
    float _548 = fma(_546, _540, _456);
    float3 _1682 = float3(_506, _514, float(int(_394)));
    float3 _1684 = select(_1682, float3(0.0), isnan(_1682));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1684.xy, uint(rint(_1684.z)), _420);
    float3 _1693 = float3(_456, _542, float(int(_448)));
    float3 _1695 = select(_1693, float3(0.0), isnan(_1693));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1695.xy, uint(rint(_1695.z)), _540);
    float3 _1704 = float3(_544, _542, float(int(_448)));
    float3 _1706 = select(_1704, float3(0.0), isnan(_1704));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1706.xy, uint(rint(_1706.z)), _540);
    float3 _1715 = float3(_548, _542, float(int(_448)));
    float3 _1717 = select(_1715, float3(0.0), isnan(_1715));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1717.xy, uint(rint(_1717.z)), _540);
    float3 _1726 = float3(_544, _534, float(int(_448)));
    float3 _1728 = select(_1726, float3(0.0), isnan(_1726));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1728.xy, uint(rint(_1728.z)), _540);
    float _560 = -_498;
    float _562 = fma(_560, _540, _534);
    float3 _1743 = float3(_456, _534, float(int(_448)));
    float3 _1745 = select(_1743, float3(0.0), isnan(_1743));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1745.xy, uint(rint(_1745.z)), _540);
    float3 _1754 = float3(_548, _534, float(int(_448)));
    float3 _1756 = select(_1754, float3(0.0), isnan(_1754));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1756.xy, uint(rint(_1756.z)), _540);
    float3 _1765 = float3(_544, _562, float(int(_448)));
    float3 _1767 = select(_1765, float3(0.0), isnan(_1765));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1767.xy, uint(rint(_1767.z)), _540);
    float3 _1776 = float3(_456, _562, float(int(_448)));
    float3 _1778 = select(_1776, float3(0.0), isnan(_1776));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1778.xy, uint(rint(_1778.z)), _540);
    float3 _1787 = float3(_548, _562, float(int(_448)));
    float3 _1789 = select(_1787, float3(0.0), isnan(_1787));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1789.xy, uint(rint(_1789.z)), _540);
    float2 _1795 = float2(_50, _52);
    float _574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1795, float2(0.0), isnan(_1795))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1795, float2(0.0), isnan(_1795))).x;
    float _576 = -_68;
    float _578 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _580 = _576 + _578;
    float _582 = _580 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float _586 = fma(_536, 0.111111111938953399658203125, _584);
    float _588 = _520 + _516;
    float _590 = _588 + _518;
    float _592 = _590 + _510;
    float _594 = _592 + _522;
    float _596 = _594 + _524;
    float _598 = _596 + _526;
    float _600 = _598 + _528;
    float _602 = _554 + _552;
    float _604 = _600 + _550;
    float _606 = _602 + _556;
    float _608 = _604 * 0.111111111938953399658203125;
    float _610 = _606 + _558;
    float _612 = _610 + _564;
    float _614 = _612 + _566;
    float _616 = -_68;
    float _618 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _620 = _616 + _618;
    float _622 = _614 + _568;
    float _624 = _620 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _622 + _570;
    float _630 = _628 + _572;
    float _632 = _630 * 0.111111111938953399658203125;
    float _634 = _632 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _636 = fma(_608, (*spvDescriptorSet0.fp_c3)._m0[49].z, _634);
    float _638 = _626 + _636;
    out.m_43.x = _574;
    out.m_43.y = _586;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _638;
    return out;
}

