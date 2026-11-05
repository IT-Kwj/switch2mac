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
    float2 _638 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_638, float2(0.0), isnan(_638))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _60 = -_52;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _54;
    float _68 = _64 * _56;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _76 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _72);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _74);
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _76);
    float _84 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _78);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _88 = _82 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _90 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = _84 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _90);
    float _98 = 1.0 / _88;
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _96);
    float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = _92 * _98;
    float _106 = _102 * _98;
    float _108 = _94 * _98;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _114 = fma(_110, _58, _104);
    float _116 = fma(_110, _112, _106);
    float _118 = -_58;
    float _120 = fma(_110, _118, _104);
    float3 _788 = float3(_114, _116, float(0));
    float3 _792 = select(_788, float3(0.0), isnan(_788));
    float _122 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _792.xy, uint(rint(_792.z)), _110);
    float3 _799 = float3(_104, _116, float(0));
    float3 _801 = select(_799, float3(0.0), isnan(_799));
    float _124 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _801.xy, uint(rint(_801.z)), _110);
    float3 _808 = float3(_120, _116, float(0));
    float3 _810 = select(_808, float3(0.0), isnan(_808));
    float _126 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _810.xy, uint(rint(_810.z)), _110);
    float _128 = -_66;
    float _130 = _128 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _132 = -_68;
    float _134 = _132 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _136 = -_66;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _140 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _142 = _130 * _130;
    float _144 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _146 = _138 * _138;
    float _148 = fma(_134, _134, _142);
    float _150 = -_64;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _154 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _158 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _160 = fma(_152, _152, _148);
    float _162 = -_68;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _166 = -_64;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _170 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _172 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _174 = fma(_164, _164, _146);
    float _176 = sqrt(_160);
    float _178 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _180 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _182 = fma(_168, _168, _174);
    float _184 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _178);
    float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _190 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _192 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _194 = sqrt(_182);
    float _196 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _198 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _200 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _202 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _144);
    float _204 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _154);
    float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _156);
    bool _210 = _176 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _158);
    bool _214 = _176 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _216 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _218 = !_210;
    int _221 = _218 ? 0 : 1;
    float _223 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _170);
    float _225 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _172);
    float _227 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _216);
    float _229 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _180);
    bool _231 = _194 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _233 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _184);
    float _235 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _188);
    float _237 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _190);
    int _239 = 2;
    if (!_210)
    {
        _239 = 1;
    }
    int _241 = _239;
    float _243 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _192);
    bool _245 = _194 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _247 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    int _249 = _241;
    if (!_214)
    {
        _249 = _221;
    }
    int _251 = _249;
    float _253 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _140);
    float _255 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _247);
    float _257 = float(_251);
    float _259 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _196);
    int _261 = 2;
    if (!_231)
    {
        _261 = 1;
    }
    int _263 = _261;
    float _265 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _198);
    float _267 = precise::min(_257, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _269 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _200);
    bool _271 = !_231;
    int _273 = _271 ? 0 : 1;
    float _275 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _202);
    bool _277 = _267 != 1.0;
    bool _279 = isnan(_267);
    bool _281 = _277 || _279;
    bool _283 = isnan(1.0);
    bool _285 = _281 || _283;
    float _287 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _225);
    int _289 = _263;
    if (!_245)
    {
        _289 = _273;
    }
    int _291 = _289;
    float _293 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _227);
    bool _295 = _267 != 0.0;
    bool _297 = isnan(_267);
    bool _299 = _295 || _297;
    bool _301 = isnan(0.0);
    bool _303 = _299 || _301;
    float _305 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _259);
    float _307 = float(_291);
    float _309 = _293 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _311 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _204);
    float _313 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _269);
    float _315 = precise::min(_307, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _317 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _243);
    float _319 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _206);
    float _321 = _309;
    if (_285)
    {
        float _323 = _275 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _321 = _323;
    }
    float _325 = _321;
    bool _327 = _315 != 1.0;
    bool _329 = isnan(_315);
    bool _331 = _327 || _329;
    bool _333 = isnan(1.0);
    bool _335 = _331 || _333;
    float _337 = _311 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _339 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _229);
    float _341 = _325;
    float _343 = _337;
    if (!_303)
    {
        float _345 = _287 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _341 = _345;
    }
    float _347 = _341;
    float _349 = _305 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _351 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _186);
    float _353 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _212);
    float _355 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _237);
    float _357 = _317 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _359 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _223);
    float _361 = _349;
    float _363 = _357;
    if (_335)
    {
        float _365 = _313 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _361 = _365;
    }
    float _367 = _361;
    float _369 = _367;
    if (_285)
    {
        float _371 = _319 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _343 = _371;
    }
    float _373 = _343;
    float _375 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _233);
    float _377 = _373;
    if (!_303)
    {
        float _379 = _339 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _377 = _379;
    }
    float _381 = _377;
    float _383 = _353 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _385 = _355 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _387 = _383;
    float _389 = _385;
    if (_285)
    {
        float _391 = _359 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _387 = _391;
    }
    float _393 = _387;
    float _395 = _393;
    if (!_303)
    {
        float _397 = _375 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _395 = _397;
    }
    float _399 = _395;
    float _401 = -_112;
    float _403 = fma(_110, _401, _106);
    if (_335)
    {
        float _405 = _351 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _389 = _405;
    }
    float _407 = _389;
    float _409 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _265);
    float _411 = _407;
    if (_335)
    {
        float _413 = _409 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _363 = _413;
    }
    float _415 = _363;
    bool _417 = _315 != 0.0;
    bool _419 = isnan(_315);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = _122 + _124;
    float _429 = _427 + _126;
    float3 _1373 = float3(_114, _106, float(0));
    float3 _1375 = select(_1373, float3(0.0), isnan(_1373));
    float _431 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1375.xy, uint(rint(_1375.z)), _110);
    float3 _1382 = float3(_104, _106, float(0));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _433 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1384.xy, uint(rint(_1384.z)), _110);
    float3 _1391 = float3(_120, _106, float(0));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _435 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1393.xy, uint(rint(_1393.z)), _110);
    float3 _1400 = float3(_114, _403, float(0));
    float3 _1402 = select(_1400, float3(0.0), isnan(_1400));
    float _437 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1402.xy, uint(rint(_1402.z)), _110);
    float3 _1409 = float3(_104, _403, float(0));
    float3 _1411 = select(_1409, float3(0.0), isnan(_1409));
    float _439 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1411.xy, uint(rint(_1411.z)), _110);
    float3 _1418 = float3(_120, _403, float(0));
    float3 _1420 = select(_1418, float3(0.0), isnan(_1418));
    float _441 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1420.xy, uint(rint(_1420.z)), _110);
    float _443 = rint(_267);
    float _445 = precise::max(_443, 0.0);
    uint _448 = uint(_445);
    uint _450 = clamp(_448, 0u, 65535u);
    float _452 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _454 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _253);
    float _456 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _458 = 0.0 + _399;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _255);
    float _464 = _415;
    if (!_425)
    {
        float _466 = _454 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _369 = _466;
    }
    float _468 = _369;
    float _470 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _235);
    float _472 = rint(_315);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    uint _478 = clamp(_476, 0u, 65535u);
    float _480 = fma(_460, _452, _347);
    if (!_425)
    {
        float _482 = _462 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _464 = _482;
    }
    float _484 = _464;
    if (!_425)
    {
        float _486 = _470 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _411 = _486;
    }
    float _488 = _411;
    float _490 = _429 + _431;
    float _492 = -_452;
    float _494 = fma(_460, _492, _347);
    float _496 = _490 + _433;
    float _498 = _496 + _435;
    float _500 = _498 + _437;
    float _502 = fma(_460, _456, _381);
    float3 _1533 = float3(_347, _502, float(int(_450)));
    float3 _1535 = select(_1533, float3(0.0), isnan(_1533));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1535.xy, uint(rint(_1535.z)), _460);
    float3 _1544 = float3(_480, _502, float(int(_450)));
    float3 _1546 = select(_1544, float3(0.0), isnan(_1544));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1546.xy, uint(rint(_1546.z)), _460);
    float3 _1555 = float3(_494, _502, float(int(_450)));
    float3 _1557 = select(_1555, float3(0.0), isnan(_1555));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1557.xy, uint(rint(_1557.z)), _460);
    float3 _1566 = float3(_480, _381, float(int(_450)));
    float3 _1568 = select(_1566, float3(0.0), isnan(_1566));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1568.xy, uint(rint(_1568.z)), _460);
    float3 _1577 = float3(_347, _381, float(int(_450)));
    float3 _1579 = select(_1577, float3(0.0), isnan(_1577));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1579.xy, uint(rint(_1579.z)), _460);
    float3 _1588 = float3(_494, _381, float(int(_450)));
    float3 _1590 = select(_1588, float3(0.0), isnan(_1588));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1590.xy, uint(rint(_1590.z)), _460);
    float _516 = -_456;
    float _518 = fma(_460, _516, _381);
    float _520 = 0.0 + _468;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = fma(_456, _522, _484);
    float _526 = fma(_452, _522, _488);
    float3 _1617 = float3(_480, _518, float(int(_450)));
    float3 _1619 = select(_1617, float3(0.0), isnan(_1617));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1619.xy, uint(rint(_1619.z)), _460);
    float _530 = -_452;
    float _532 = fma(_530, _522, _488);
    float3 _1634 = float3(_347, _518, float(int(_450)));
    float3 _1636 = select(_1634, float3(0.0), isnan(_1634));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1636.xy, uint(rint(_1636.z)), _460);
    float3 _1645 = float3(_494, _518, float(int(_450)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1647.xy, uint(rint(_1647.z)), _460);
    float3 _1656 = float3(_488, _524, float(int(_478)));
    float3 _1658 = select(_1656, float3(0.0), isnan(_1656));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1658.xy, uint(rint(_1658.z)), _522);
    float3 _1667 = float3(_526, _524, float(int(_478)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1669.xy, uint(rint(_1669.z)), _522);
    float3 _1678 = float3(_532, _524, float(int(_478)));
    float3 _1680 = select(_1678, float3(0.0), isnan(_1678));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1680.xy, uint(rint(_1680.z)), _522);
    float _544 = -_456;
    float _546 = fma(_544, _522, _484);
    float3 _1695 = float3(_526, _484, float(int(_478)));
    float3 _1697 = select(_1695, float3(0.0), isnan(_1695));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1697.xy, uint(rint(_1697.z)), _522);
    float3 _1706 = float3(_488, _484, float(int(_478)));
    float3 _1708 = select(_1706, float3(0.0), isnan(_1706));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1708.xy, uint(rint(_1708.z)), _522);
    float3 _1717 = float3(_532, _484, float(int(_478)));
    float3 _1719 = select(_1717, float3(0.0), isnan(_1717));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1719.xy, uint(rint(_1719.z)), _522);
    float3 _1728 = float3(_526, _546, float(int(_478)));
    float3 _1730 = select(_1728, float3(0.0), isnan(_1728));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1730.xy, uint(rint(_1730.z)), _522);
    float3 _1739 = float3(_488, _546, float(int(_478)));
    float3 _1741 = select(_1739, float3(0.0), isnan(_1739));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1741.xy, uint(rint(_1741.z)), _522);
    float3 _1750 = float3(_532, _546, float(int(_478)));
    float3 _1752 = select(_1750, float3(0.0), isnan(_1750));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1752.xy, uint(rint(_1752.z)), _522);
    float _560 = _500 + _439;
    float _562 = _560 + _441;
    float _564 = -_64;
    float _566 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _568 = _564 + _566;
    float _570 = _568 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    float _574 = fma(_562, 0.111111111938953399658203125, _572);
    float _576 = _506 + _504;
    float _578 = -_64;
    float _580 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _582 = _578 + _580;
    float _584 = _576 + _508;
    float _586 = _582 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = _584 + _510;
    float _592 = _590 + _512;
    float _594 = _592 + _514;
    float _596 = _594 + _528;
    float _598 = _596 + _534;
    float _600 = _540 + _538;
    float _602 = _598 + _536;
    float _604 = _600 + _542;
    float _606 = _602 * 0.111111111938953399658203125;
    float _608 = _604 + _548;
    float _610 = _608 + _550;
    float _612 = _610 + _552;
    float _614 = _612 + _554;
    float _616 = _614 + _556;
    float _618 = _616 + _558;
    float _620 = _618 * 0.111111111938953399658203125;
    float _622 = _620 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _624 = fma(_606, (*spvDescriptorSet0.fp_c3)._m0[49].z, _622);
    float _626 = _588 + _624;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _574;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _626;
    return out;
}

