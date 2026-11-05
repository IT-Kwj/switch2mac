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
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _804 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_804, float2(0.0), isnan(_804)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _821 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_821, float2(0.0), isnan(_821))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = _148 * _154;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = _162 * _162;
    float _172 = -_164;
    float _174 = fma(_144, _152, _172);
    float _176 = fma(_168, _168, _170);
    float _178 = fma(_174, _174, _176);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _168 * _180;
    float _186 = _174 * _180;
    float _188 = _182 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].x, _188);
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].z, _190);
    float _194 = abs(_192);
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = abs(_200);
    float _204 = log2(_202);
    float _206 = _204 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _208 = exp2(_206);
    float _210 = -_68;
    float _212 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _214 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[46].z, _212);
    float _216 = _214 * _70;
    float _218 = _214 * _72;
    float _220 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _222 = fma(_182, _220, _216);
    float _224 = fma(_184, _220, _218);
    float _226 = fma(_186, _220, _214);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _232 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _234 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _230);
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _232);
    float _240 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _242 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _244 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _238);
    float _246 = 1.0 / _236;
    float _248 = _244 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _250 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _240);
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _242);
    float _254 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _250);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _252);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = _248 * _246;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _260 * _246;
    float _268 = _258 * _246;
    float _270 = rint(_264);
    float _272 = precise::max(_270, 0.0);
    uint _275 = uint(_272);
    uint _277 = clamp(_275, 0u, 65535u);
    float _279 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _266);
    float _281 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _268);
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _285 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _283, _268);
    float _287 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _289 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _287, _266);
    float3 _1204 = float3(_268, _279, float(int(_277)));
    float3 _1208 = select(_1204, float3(0.0), isnan(_1204));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1208.xy, uint(rint(_1208.z)), 1.0);
    float3 _1216 = float3(_281, _279, float(int(_277)));
    float3 _1218 = select(_1216, float3(0.0), isnan(_1216));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1218.xy, uint(rint(_1218.z)), 1.0);
    float3 _1226 = float3(_285, _279, float(int(_277)));
    float3 _1228 = select(_1226, float3(0.0), isnan(_1226));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1228.xy, uint(rint(_1228.z)), 1.0);
    float3 _1236 = float3(_281, _266, float(int(_277)));
    float3 _1238 = select(_1236, float3(0.0), isnan(_1236));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1238.xy, uint(rint(_1238.z)), 1.0);
    float3 _1246 = float3(_268, _266, float(int(_277)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), 1.0);
    float3 _1256 = float3(_285, _266, float(int(_277)));
    float3 _1258 = select(_1256, float3(0.0), isnan(_1256));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1258.xy, uint(rint(_1258.z)), 1.0);
    float3 _1266 = float3(_281, _289, float(int(_277)));
    float3 _1268 = select(_1266, float3(0.0), isnan(_1266));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1268.xy, uint(rint(_1268.z)), 1.0);
    float3 _1276 = float3(_268, _289, float(int(_277)));
    float3 _1278 = select(_1276, float3(0.0), isnan(_1276));
    float _305 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1278.xy, uint(rint(_1278.z)), 1.0);
    float3 _1286 = float3(_285, _289, float(int(_277)));
    float3 _1288 = select(_1286, float3(0.0), isnan(_1286));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1288.xy, uint(rint(_1288.z)), 1.0);
    float _309 = -_216;
    float _311 = _309 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _313 = -_218;
    float _315 = _313 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _317 = _216 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _319 = _216 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _321 = _311 * _311;
    float _323 = _216 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _325 = -_218;
    float _327 = _325 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _329 = _216 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _331 = fma(_315, _315, _321);
    float _333 = -_214;
    float _335 = _333 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _337 = _216 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _339 = _216 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _341 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[18].x, _329);
    float _343 = fma(_335, _335, _331);
    float _345 = -_216;
    float _347 = _345 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _349 = -_214;
    float _351 = _349 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _353 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[19].x, _317);
    float _355 = _347 * _347;
    float _357 = sqrt(_343);
    float _359 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[20].x, _319);
    float _361 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[22].x, _337);
    float _363 = fma(_327, _327, _355);
    float _365 = _216 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _367 = _216 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _369 = _216 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _371 = fma(_351, _351, _363);
    float _373 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[24].x, _365);
    float _375 = _216 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _377 = _216 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _379 = _216 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _381 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[24].z, _373);
    float _383 = sqrt(_371);
    float _385 = _216 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _387 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[29].x, _339);
    bool _391 = _357 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _393 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[18].z, _341);
    bool _395 = _357 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _397 = _216 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _399 = !_391;
    int _402 = _399 ? 0 : 1;
    float _404 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[31].x, _375);
    float _406 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[19].z, _353);
    float _408 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[20].z, _359);
    float _410 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[22].z, _361);
    float _412 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[16].x, _367);
    float _414 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[25].x, _323);
    float _416 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[27].x, _377);
    float _418 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[28].x, _397);
    int _420 = 2;
    if (!_391)
    {
        _420 = 1;
    }
    int _422 = _420;
    float _424 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[32].x, _385);
    int _426 = _422;
    if (!_395)
    {
        _426 = _402;
    }
    int _428 = _426;
    float _430 = _216 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    bool _432 = _383 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _434 = _408 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    bool _436 = _383 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _438 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[21].x, _430);
    float _440 = float(_428);
    float _442 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[16].z, _412);
    bool _444 = !_432;
    int _446 = _444 ? 0 : 1;
    float _448 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[21].z, _438);
    float _450 = precise::min(_440, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _452 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[28].z, _418);
    float _454 = _448 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _456 = _450 != 1.0;
    bool _458 = isnan(_450);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = _216 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _468 = 2;
    float _470 = _454;
    float _472 = _434;
    if (!_432)
    {
        _468 = 1;
    }
    int _474 = _468;
    float _476 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[31].z, _404);
    int _478 = _474;
    if (!_436)
    {
        _478 = _446;
    }
    int _480 = _478;
    float _482 = _216 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    bool _484 = _450 != 0.0;
    bool _486 = isnan(_450);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    float _494 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[23].x, _466);
    float _496 = float(_480);
    float _498 = _216 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _500 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[17].x, _482);
    float _502 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[23].z, _494);
    float _504 = precise::min(_496, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    if (_464)
    {
        float _506 = _381 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _470 = _506;
    }
    float _508 = _470;
    float _510 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[30].x, _379);
    float _512 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[26].x, _369);
    float _514 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[33].x, _498);
    float _516 = _406 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _518 = _504 != 1.0;
    bool _520 = isnan(_504);
    bool _522 = _518 || _520;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    float _528 = _516;
    float _530 = _508;
    if (_464)
    {
        float _532 = _410 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (_464)
    {
        float _538 = _502 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _472 = _538;
    }
    float _540 = _472;
    float _542 = rint(_450);
    float _544 = precise::max(_542, 0.0);
    uint _546 = uint(_544);
    uint _548 = clamp(_546, 0u, 65535u);
    bool _550 = _504 != 0.0;
    bool _552 = isnan(_504);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _540;
    if (!_492)
    {
        float _562 = _393 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _530 = _562;
    }
    float _564 = _530;
    float _566 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[17].z, _500);
    float _568 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[25].z, _414);
    float _570 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[30].z, _510);
    float _572 = 0.0 + _564;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    if (!_492)
    {
        float _576 = _442 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _536 = _576;
    }
    float _578 = _536;
    float _580 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[33].z, _514);
    float _582 = _452 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _584 = _582;
    if (!_492)
    {
        float _586 = _566 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _560 = _586;
    }
    float _588 = _560;
    if (_526)
    {
        float _590 = _476 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[27].z, _416);
    float _596 = rint(_504);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    uint _602 = clamp(_600, 0u, 65535u);
    float _604 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[29].z, _387);
    float _606 = _592;
    if (!_558)
    {
        float _608 = _568 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _606 = _608;
    }
    float _610 = _606;
    float _612 = _570 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _614 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[32].z, _424);
    float _616 = _612;
    if (_526)
    {
        float _618 = _580 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _616 = _618;
    }
    float _620 = _616;
    float _622 = _620;
    if (!_558)
    {
        float _624 = _594 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _622 = _624;
    }
    float _626 = _622;
    float _628 = _293 + _291;
    float _630 = _604 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _632 = _630;
    if (_526)
    {
        float _634 = _614 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _632 = _634;
    }
    float _636 = _632;
    float _638 = _628 + _295;
    float _640 = _638 + _297;
    float _642 = _640 + _299;
    float _644 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[26].z, _512);
    float _646 = _642 + _301;
    float _648 = _646 + _303;
    float _650 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _652 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _654 = _648 + _305;
    float _656 = fma(_574, _650, _578);
    float _658 = -_650;
    float _660 = fma(_574, _658, _578);
    float _662 = fma(_574, _652, _588);
    float3 _1940 = float3(_656, _588, float(int(_548)));
    float3 _1942 = select(_1940, float3(0.0), isnan(_1940));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1942.xy, uint(rint(_1942.z)), _574);
    float _666 = -_652;
    float _668 = fma(_574, _666, _588);
    float3 _1957 = float3(_578, _662, float(int(_548)));
    float3 _1959 = select(_1957, float3(0.0), isnan(_1957));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1959.xy, uint(rint(_1959.z)), _574);
    float3 _1968 = float3(_660, _662, float(int(_548)));
    float3 _1970 = select(_1968, float3(0.0), isnan(_1968));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1970.xy, uint(rint(_1970.z)), _574);
    float3 _1979 = float3(_656, _662, float(int(_548)));
    float3 _1981 = select(_1979, float3(0.0), isnan(_1979));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1981.xy, uint(rint(_1981.z)), _574);
    float3 _1990 = float3(_578, _588, float(int(_548)));
    float3 _1992 = select(_1990, float3(0.0), isnan(_1990));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1992.xy, uint(rint(_1992.z)), _574);
    float3 _2001 = float3(_660, _588, float(int(_548)));
    float3 _2003 = select(_2001, float3(0.0), isnan(_2001));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2003.xy, uint(rint(_2003.z)), _574);
    float3 _2012 = float3(_656, _668, float(int(_548)));
    float3 _2014 = select(_2012, float3(0.0), isnan(_2012));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2014.xy, uint(rint(_2014.z)), _574);
    float3 _2023 = float3(_578, _668, float(int(_548)));
    float3 _2025 = select(_2023, float3(0.0), isnan(_2023));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2025.xy, uint(rint(_2025.z)), _574);
    float _684 = _636;
    if (!_558)
    {
        float _686 = _644 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _684 = _686;
    }
    float _688 = _684;
    float _690 = _654 + _307;
    float _692 = 0.0 + _626;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = fma(_652, _694, _688);
    float _698 = fma(_650, _694, _610);
    float _700 = -_650;
    float _702 = fma(_700, _694, _610);
    float3 _2066 = float3(_660, _668, float(int(_548)));
    float3 _2068 = select(_2066, float3(0.0), isnan(_2066));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2068.xy, uint(rint(_2068.z)), _574);
    float3 _2077 = float3(_610, _696, float(int(_602)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2079.xy, uint(rint(_2079.z)), _694);
    float3 _2088 = float3(_698, _696, float(int(_602)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2090.xy, uint(rint(_2090.z)), _694);
    float3 _2099 = float3(_702, _696, float(int(_602)));
    float3 _2101 = select(_2099, float3(0.0), isnan(_2099));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2101.xy, uint(rint(_2101.z)), _694);
    float3 _2110 = float3(_698, _688, float(int(_602)));
    float3 _2112 = select(_2110, float3(0.0), isnan(_2110));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2112.xy, uint(rint(_2112.z)), _694);
    float _714 = -_652;
    float _716 = fma(_714, _694, _688);
    float3 _2127 = float3(_610, _688, float(int(_602)));
    float3 _2129 = select(_2127, float3(0.0), isnan(_2127));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2129.xy, uint(rint(_2129.z)), _694);
    float3 _2138 = float3(_702, _688, float(int(_602)));
    float3 _2140 = select(_2138, float3(0.0), isnan(_2138));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2140.xy, uint(rint(_2140.z)), _694);
    float3 _2149 = float3(_698, _716, float(int(_602)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2151.xy, uint(rint(_2151.z)), _694);
    float3 _2160 = float3(_610, _716, float(int(_602)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2162.xy, uint(rint(_2162.z)), _694);
    float3 _2171 = float3(_702, _716, float(int(_602)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2173.xy, uint(rint(_2173.z)), _694);
    float2 _2179 = float2(_54, _56);
    float _728 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2179, float2(0.0), isnan(_2179))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2179, float2(0.0), isnan(_2179))).x;
    float _730 = -_214;
    float _732 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _734 = _730 + _732;
    float _736 = _734 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _738 = precise::clamp(_736, 0.0, 1.0);
    float _740 = fma(_690, 0.111111111938953399658203125, _738);
    float _742 = _674 + _670;
    float _744 = _742 + _672;
    float _746 = _744 + _664;
    float _748 = _746 + _676;
    float _750 = _748 + _678;
    float _752 = _750 + _680;
    float _754 = _752 + _682;
    float _756 = _708 + _706;
    float _758 = _754 + _704;
    float _760 = _756 + _710;
    float _762 = _758 * 0.111111111938953399658203125;
    float _764 = _760 + _712;
    float _766 = _764 + _718;
    float _768 = _766 + _720;
    float _770 = -_214;
    float _772 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _774 = _770 + _772;
    float _776 = _768 + _722;
    float _778 = _774 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _780 = precise::clamp(_778, 0.0, 1.0);
    float _782 = _776 + _724;
    float _784 = _782 + _726;
    float _786 = _784 * 0.111111111938953399658203125;
    float _788 = _786 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _790 = fma(_762, (*spvDescriptorSet0.fp_c3)._m0[49].z, _788);
    float _792 = _780 + _790;
    out.m_47.x = _728;
    out.m_47.y = _740;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _792;
    return out;
}

