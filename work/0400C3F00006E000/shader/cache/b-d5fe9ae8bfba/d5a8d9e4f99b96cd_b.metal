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
    texture2d_array<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
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
    float2 _656 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_656, float2(0.0), isnan(_656)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _673 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_673, float2(0.0), isnan(_673))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_42.x;
    float _78 = in.m_44.y;
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
    float _108 = -_102;
    float _110 = fma(_92, _76, _108);
    float _112 = -_100;
    float _114 = fma(_98, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = -_86;
    float _124 = _122 + _92;
    float _126 = _114 * _114;
    float _128 = -_68;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[46].z, _130);
    float _134 = fma(_110, _110, _120);
    float _136 = -_86;
    float _138 = _136 + _98;
    float _140 = fma(_118, _118, _126);
    float _142 = _132 * _70;
    float _144 = fma(_124, _124, _134);
    float _146 = _132 * _72;
    float _148 = fma(_138, _138, _140);
    float _150 = -_142;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _162 = rsqrt(_144);
    float _164 = _152 * _152;
    float _166 = -_146;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _170 = _156 * _156;
    float _172 = fma(_160, _160, _164);
    float _174 = -_132;
    float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _178 = fma(_168, _168, _170);
    float _180 = rsqrt(_148);
    float _182 = _142 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _184 = fma(_176, _176, _172);
    float _186 = -_132;
    float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _190 = _142 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _192 = _142 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _194 = _142 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _196 = fma(_188, _188, _178);
    float _198 = _110 * _162;
    float _200 = _124 * _162;
    float _202 = _106 * _162;
    float _204 = sqrt(_184);
    float _206 = _142 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _208 = _142 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _210 = _142 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _212 = _142 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _214 = _138 * _180;
    float _216 = _114 * _180;
    float _218 = _118 * _180;
    float _220 = sqrt(_196);
    float _222 = _198 * _214;
    float _224 = _200 * _216;
    float _226 = _142 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _228 = _142 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _230 = -_222;
    float _232 = fma(_200, _218, _230);
    float _234 = _202 * _218;
    float _236 = -_224;
    float _238 = fma(_202, _214, _236);
    bool _242 = _204 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _244 = _232 * _232;
    float _246 = -_234;
    float _248 = fma(_198, _216, _246);
    bool _250 = _204 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _252 = _142 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _254 = fma(_238, _238, _244);
    float _256 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[19].x, _190);
    bool _258 = _220 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _260 = fma(_248, _248, _254);
    bool _262 = !_242;
    int _265 = _262 ? 0 : 1;
    float _267 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[22].x, _192);
    bool _269 = !_258;
    int _271 = _269 ? 0 : 1;
    float _273 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[20].x, _194);
    int _275 = 2;
    int _277 = 2;
    if (!_242)
    {
        _275 = 1;
    }
    int _279 = _275;
    float _281 = rsqrt(_260);
    bool _283 = _220 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _285 = _142 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _287 = _279;
    if (!_250)
    {
        _287 = _265;
    }
    int _289 = _287;
    float _291 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[23].x, _206);
    float _293 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[29].x, _226);
    if (!_258)
    {
        _277 = 1;
    }
    int _295 = _277;
    float _297 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[31].x, _228);
    float _299 = float(_289);
    float _301 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[29].z, _293);
    float _303 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[19].z, _256);
    float _305 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[31].z, _297);
    float _307 = precise::min(_299, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _309 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[20].z, _273);
    int _311 = _295;
    if (!_283)
    {
        _311 = _271;
    }
    int _313 = _311;
    float _315 = _142 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _317 = _232 * _281;
    float _319 = _238 * _281;
    float _321 = _248 * _281;
    bool _323 = _307 != 1.0;
    bool _325 = isnan(_307);
    bool _327 = _323 || _325;
    bool _329 = isnan(1.0);
    bool _331 = _327 || _329;
    float _333 = _317 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _335 = _142 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _337 = float(_313);
    float _339 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[22].z, _267);
    float _341 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[35].x, _333);
    float _343 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[21].x, _315);
    float _345 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[24].x, _335);
    float _347 = _142 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _349 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[35].z, _341);
    float _351 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[21].z, _343);
    float _353 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[24].z, _345);
    bool _355 = _307 != 0.0;
    bool _357 = isnan(_307);
    bool _359 = _355 || _357;
    bool _361 = isnan(0.0);
    bool _363 = _359 || _361;
    float _365 = abs(_349);
    float _367 = -_365;
    float _369 = _367 + 1.0;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _351 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _375 = _373;
    if (_331)
    {
        float _377 = _353 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _375 = _377;
    }
    float _379 = _375;
    float _381 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[30].x, _347);
    float _383 = precise::min(_337, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _385 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[33].x, _182);
    float _387 = abs(_371);
    float _389 = log2(_387);
    float _391 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[30].z, _381);
    bool _393 = _383 != 1.0;
    bool _395 = isnan(_383);
    bool _397 = _393 || _395;
    bool _399 = isnan(1.0);
    bool _401 = _397 || _399;
    float _403 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[33].z, _385);
    bool _405 = _383 != 0.0;
    bool _407 = isnan(_383);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    float _415 = _391 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _417 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[18].x, _252);
    float _419 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[27].x, _285);
    float _421 = _142 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _423 = _142 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _425 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[18].z, _417);
    float _427 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[27].z, _419);
    float _429 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[16].x, _421);
    float _431 = rint(_383);
    float _433 = precise::max(_431, 0.0);
    uint _436 = uint(_433);
    uint _438 = clamp(_436, 0u, 65535u);
    float _440 = _379;
    float _442 = _415;
    if (!_363)
    {
        float _444 = _425 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _440 = _444;
    }
    float _446 = _440;
    if (_401)
    {
        float _448 = _403 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _442 = _448;
    }
    float _450 = _442;
    float _452 = _389 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _454 = _450;
    if (!_413)
    {
        float _456 = _427 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[17].x, _423);
    float _462 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[25].x, _208);
    float _464 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[28].x, _212);
    float _466 = rint(_307);
    float _468 = precise::max(_466, 0.0);
    uint _470 = uint(_468);
    uint _472 = clamp(_470, 0u, 65535u);
    float _474 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[23].z, _291);
    float _476 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[25].z, _462);
    float _478 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[28].z, _464);
    float _480 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[16].z, _429);
    float _482 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[17].z, _460);
    float _484 = 0.0 + _458;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    float _488 = 0.0 + _446;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = exp2(_452);
    float _494 = _492 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _496 = fma(_317, _494, _142);
    float _498 = _142 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _500 = fma(_319, _494, _146);
    float _502 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[26].x, _210);
    float _504 = _496 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _506 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[32].x, _498);
    float _508 = fma(_321, _494, _132);
    float _510 = _496 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _512 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[3].x, _504);
    float _514 = _496 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _516 = _496 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _518 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[0].x, _510);
    float _520 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[3].z, _512);
    float _522 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[1].x, _514);
    float _524 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[2].x, _516);
    float _526 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[0].z, _518);
    float _528 = _520 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _530 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[1].z, _522);
    float _532 = fma(_508, (*spvDescriptorSet0.fp_c3)._m0[2].z, _524);
    float _534 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[32].z, _506);
    float _536 = 1.0 / _528;
    float _538 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[26].z, _502);
    float _540 = _478 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _542 = _301 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _544 = _540;
    float _546 = _542;
    if (_401)
    {
        float _548 = _305 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _544 = _548;
    }
    float _550 = _544;
    float _552 = _550;
    if (_401)
    {
        float _554 = _534 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _546 = _554;
    }
    float _556 = _546;
    float _558 = _556;
    if (!_413)
    {
        float _560 = _476 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _552 = _560;
    }
    float _562 = _552;
    if (!_413)
    {
        float _564 = _538 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _558 = _564;
    }
    float _566 = _558;
    float _568 = _303 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _570 = _309 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _572 = _526 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _574 = _568;
    float _576 = _570;
    if (_331)
    {
        float _578 = _339 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _574 = _578;
    }
    float _580 = _574;
    float _582 = _580;
    if (_331)
    {
        float _584 = _474 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _576 = _584;
    }
    float _586 = _576;
    float _588 = _530 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _590 = _532 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _592 = _586;
    if (!_363)
    {
        float _594 = _480 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _582 = _594;
    }
    float _596 = _582;
    if (!_363)
    {
        float _598 = _482 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _592 = _598;
    }
    float _600 = _592;
    float3 _1621 = float3(_562, _566, float(int(_438)));
    float3 _1625 = select(_1621, float3(0.0), isnan(_1621));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1625.xy, uint(rint(_1625.z)), _486);
    float _604 = _572 * _536;
    float _606 = _588 * _536;
    float _608 = _590 * _536;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float3 _1645 = float3(_596, _600, float(int(_472)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _612 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1647.xy, uint(rint(_1647.z)), _490);
    float3 _1654 = float3(_604, _606, float(0));
    float3 _1656 = select(_1654, float3(0.0), isnan(_1654));
    float _614 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1656.xy, uint(rint(_1656.z)), _610);
    float2 _1662 = float2(_54, _56);
    float _616 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1662, float2(0.0), isnan(_1662))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1662, float2(0.0), isnan(_1662))).x;
    float _618 = -_132;
    float _620 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _622 = _618 + _620;
    float _624 = -_132;
    float _626 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _628 = _624 + _626;
    float _630 = _622 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = _628 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _602 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _640 = fma(_612, (*spvDescriptorSet0.fp_c3)._m0[49].z, _638);
    float _642 = _636 + _614;
    float _644 = _632 + _640;
    out.m_47.x = _616;
    out.m_47.y = _642;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _644;
    return out;
}

