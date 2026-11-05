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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _527 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).x;
    float2 _538 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_538, float2(0.0), isnan(_538))).xy;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = in.m_42.y;
    float _68 = in.m_42.x;
    float _70 = -_56;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[46].z, _72);
    float _76 = _74 * _66;
    float _78 = _74 * _68;
    float _80 = -_76;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _84 = -_78;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _88 = -_76;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _92 = -_78;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _96 = _82 * _82;
    float _98 = _76 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _100 = _90 * _90;
    float _102 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _104 = fma(_86, _86, _96);
    float _106 = -_74;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _110 = fma(_94, _94, _100);
    float _112 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].x, _98);
    float _114 = fma(_108, _108, _104);
    float _116 = -_74;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _120 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].x, _102);
    float _122 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].z, _112);
    float _124 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = fma(_118, _118, _110);
    float _128 = sqrt(_114);
    float _130 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].z, _120);
    float _132 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = _76 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _136 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _138 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _140 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _142 = _76 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _144 = sqrt(_126);
    float _146 = _76 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _148 = _76 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _150 = _76 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _152 = _76 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _154 = _76 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _156 = _76 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _158 = _76 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _162 = _128 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _164 = _76 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _166 = _128 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _168 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _170 = !_162;
    int _173 = _170 ? 0 : 1;
    float _175 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _136);
    float _177 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _138);
    float _179 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].x, _142);
    bool _181 = _144 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _183 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].x, _146);
    bool _185 = _144 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _187 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].x, _150);
    bool _189 = !_181;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].x, _152);
    int _195 = 2;
    int _197 = 2;
    if (!_162)
    {
        _195 = 1;
    }
    int _199 = _195;
    float _201 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].x, _154);
    int _203 = _199;
    if (!_166)
    {
        _203 = _173;
    }
    int _205 = _203;
    float _207 = _76 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _209 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].x, _156);
    float _211 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].x, _158);
    float _213 = float(_205);
    float _215 = _76 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _217 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].x, _207);
    if (!_181)
    {
        _197 = 1;
    }
    int _219 = _197;
    float _221 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].x, _164);
    float _223 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].x, _215);
    float _225 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].z, _217);
    int _227 = _219;
    if (!_185)
    {
        _227 = _191;
    }
    int _229 = _227;
    float _231 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].z, _211);
    float _233 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].z, _223);
    float _235 = _225 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _237 = _122 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _239 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _241 = float(_229);
    float _243 = _76 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _245 = precise::min(_213, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _247 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _239);
    float _249 = precise::min(_241, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _251 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].x, _243);
    bool _253 = _245 != 1.0;
    bool _255 = isnan(_245);
    bool _257 = _253 || _255;
    bool _259 = isnan(1.0);
    bool _261 = _257 || _259;
    float _263 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _247);
    bool _265 = _249 != 1.0;
    bool _267 = isnan(_249);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].z, _251);
    bool _277 = _245 != 0.0;
    bool _279 = isnan(_245);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = _263 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _289 = _249 != 0.0;
    bool _291 = isnan(_249);
    bool _293 = _289 || _291;
    bool _295 = isnan(0.0);
    bool _297 = _293 || _295;
    float _299 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].x, _134);
    float _301 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].x, _148);
    float _303 = rint(_249);
    float _305 = precise::max(_303, 0.0);
    uint _308 = uint(_305);
    uint _310 = clamp(_308, 0u, 65535u);
    float _312 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].z, _209);
    float _314 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].z, _221);
    float _316 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].z, _201);
    float _318 = _235;
    float _320 = _237;
    if (_261)
    {
        float _322 = _233 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _318 = _322;
    }
    float _324 = _318;
    float _326 = _76 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _328 = _324;
    if (_273)
    {
        float _330 = _130 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _320 = _330;
    }
    float _332 = _320;
    float _334 = _76 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _336 = 1.0 / _287;
    float _338 = _76 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _340 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].x, _326);
    float _342 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].x, _334);
    float _344 = _332;
    if (!_285)
    {
        float _346 = _275 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _328 = _346;
    }
    float _348 = _328;
    float _350 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].x, _338);
    float _352 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].z, _340);
    float _354 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].z, _342);
    float _356 = rint(_245);
    float _358 = precise::max(_356, 0.0);
    uint _360 = uint(_358);
    uint _362 = clamp(_360, 0u, 65535u);
    float _364 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].z, _350);
    if (!_297)
    {
        float _366 = _352 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _344 = _366;
    }
    float _368 = _344;
    float _370 = _231 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _372 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].z, _299);
    float _374 = _370;
    if (_273)
    {
        float _376 = _364 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _374 = _376;
    }
    float _378 = _374;
    float _380 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _175);
    float _382 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].z, _301);
    float _384 = _168 * _336;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _177);
    float _390 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].z, _179);
    float _392 = _312 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _394 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].z, _193);
    float _396 = rint(_386);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    float _404 = _378;
    float _406 = _392;
    if (!_297)
    {
        float _408 = _354 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _404 = _408;
    }
    float _410 = _404;
    float _412 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].z, _183);
    if (_273)
    {
        float _414 = _314 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _406 = _414;
    }
    float _416 = _406;
    float _418 = _372 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _420 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].z, _187);
    float _422 = _416;
    float _424 = _418;
    if (!_297)
    {
        float _426 = _316 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _422 = _426;
    }
    float _428 = _422;
    float _430 = 0.0 + _368;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _380 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    if (_261)
    {
        float _436 = _382 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _424 = _436;
    }
    float _438 = _424;
    float _440 = _388 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _442 = _390 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _444 = _438;
    float _446 = _442;
    if (!_285)
    {
        float _448 = _394 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _444 = _448;
    }
    float _450 = _444;
    float _452 = fma(_62, 2.0, -1.0);
    if (_261)
    {
        float _454 = _412 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _446 = _454;
    }
    float _456 = _446;
    float _458 = _456;
    if (!_285)
    {
        float _460 = _420 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _458 = _460;
    }
    float _462 = _458;
    float _464 = fma(_64, 2.0, -1.0);
    float _466 = 0.0 + _348;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float3 _1289 = float3(_428, _410, float(int(_310)));
    float3 _1293 = select(_1289, float3(0.0), isnan(_1289));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1293.xy, uint(rint(_1293.z)), _432);
    float _472 = _434 * _336;
    float _474 = _440 * _336;
    float _476 = _452 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _478 = _464 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1317 = float3(_462, _450, float(int(_362)));
    float3 _1319 = select(_1317, float3(0.0), isnan(_1317));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1319.xy, uint(rint(_1319.z)), _468);
    float _482 = fma(_476, 2.0, _52);
    float _484 = fma(_478, 2.0, _54);
    float3 _1334 = float3(_472, _474, float(int(_402)));
    float3 _1336 = select(_1334, float3(0.0), isnan(_1334));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1336.xy, uint(rint(_1336.z)), 1.0);
    float2 _1341 = float2(_482, _484);
    float _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1341, float2(0.0), isnan(_1341))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1341, float2(0.0), isnan(_1341))).x;
    float _490 = -_74;
    float _492 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _494 = _490 + _492;
    float _496 = -_74;
    float _498 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _500 = _496 + _498;
    float _502 = _494 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = _500 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _470 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _512 = fma(_480, (*spvDescriptorSet0.fp_c3)._m0[49].z, _510);
    float _514 = _504 + _486;
    float _516 = _508 + _512;
    out.m_45.x = _488;
    out.m_45.y = _514;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _516;
    return out;
}

