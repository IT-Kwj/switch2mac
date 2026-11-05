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
    float2 _664 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_664, float2(0.0), isnan(_664)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _681 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_681, float2(0.0), isnan(_681))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
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
    float _102 = _74 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _72, _104);
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
    float _136 = -_68;
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[46].z, _138);
    float _142 = fma(_126, _126, _132);
    float _144 = fma(_130, _130, _134);
    float _146 = _140 * _70;
    float _148 = _140 * _74;
    float _150 = rsqrt(_142);
    float _152 = -_146;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _156 = -_148;
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _160 = -_146;
    float _162 = _160 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _164 = -_148;
    float _166 = _164 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _168 = _154 * _154;
    float _170 = _146 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _172 = _162 * _162;
    float _174 = rsqrt(_144);
    float _176 = fma(_158, _158, _168);
    float _178 = -_140;
    float _180 = _178 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _182 = fma(_166, _166, _172);
    float _184 = _146 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _186 = _146 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _188 = fma(_180, _180, _176);
    float _190 = -_140;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _194 = _114 * _150;
    float _196 = _126 * _150;
    float _198 = _106 * _150;
    float _200 = fma(_192, _192, _182);
    float _202 = sqrt(_188);
    float _204 = _146 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _206 = _146 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _208 = _146 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _210 = _130 * _174;
    float _212 = _110 * _174;
    float _214 = _118 * _174;
    float _216 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[33].x, _170);
    float _218 = _194 * _210;
    float _220 = _196 * _212;
    float _222 = sqrt(_200);
    float _224 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[33].z, _216);
    float _226 = -_218;
    float _228 = fma(_196, _214, _226);
    float _230 = _198 * _214;
    float _232 = -_220;
    float _234 = fma(_198, _210, _232);
    float _236 = _228 * _228;
    float _238 = -_230;
    float _240 = fma(_194, _212, _238);
    bool _244 = _202 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _246 = _146 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _248 = fma(_234, _234, _236);
    bool _250 = _202 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _252 = _146 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _254 = !_244;
    int _257 = _254 ? 0 : 1;
    float _259 = fma(_240, _240, _248);
    float _261 = _146 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _263 = _222 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _265 = _146 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _267 = _146 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _269 = rsqrt(_259);
    int _271 = 2;
    int _273 = 2;
    if (!_244)
    {
        _271 = 1;
    }
    int _275 = _271;
    float _277 = _146 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _279 = _222 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _281 = _146 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    int _283 = _275;
    if (!_250)
    {
        _283 = _257;
    }
    int _285 = _283;
    float _287 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[19].x, _184);
    bool _289 = !_263;
    int _291 = _289 ? 0 : 1;
    float _293 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[22].x, _186);
    float _295 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[20].x, _206);
    if (!_263)
    {
        _273 = 1;
    }
    int _297 = _273;
    float _299 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[23].x, _208);
    float _301 = float(_285);
    float _303 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[29].x, _265);
    float _305 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[31].x, _267);
    float _307 = _228 * _269;
    float _309 = _234 * _269;
    float _311 = _240 * _269;
    float _313 = precise::min(_301, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _315 = _307 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _317 = _297;
    if (!_279)
    {
        _317 = _291;
    }
    int _319 = _317;
    float _321 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[24].x, _281);
    bool _323 = _313 != 1.0;
    bool _325 = isnan(_313);
    bool _327 = _323 || _325;
    bool _329 = isnan(1.0);
    bool _331 = _327 || _329;
    float _333 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[35].x, _315);
    float _335 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[21].x, _204);
    float _337 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[24].z, _321);
    float _339 = _146 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _341 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[35].z, _333);
    float _343 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[21].z, _335);
    bool _345 = _313 != 0.0;
    bool _347 = isnan(_313);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = _146 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _357 = abs(_341);
    float _359 = -_357;
    float _361 = _359 + 1.0;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = _343 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _367 = float(_319);
    float _369 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[27].x, _355);
    float _371 = _365;
    if (_331)
    {
        float _373 = _337 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _371 = _373;
    }
    float _375 = _371;
    float _377 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[30].x, _339);
    float _379 = abs(_363);
    float _381 = log2(_379);
    float _383 = precise::min(_367, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _385 = _146 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _387 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[30].z, _377);
    float _389 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[27].z, _369);
    bool _391 = _383 != 1.0;
    bool _393 = isnan(_383);
    bool _395 = _391 || _393;
    bool _397 = isnan(1.0);
    bool _399 = _395 || _397;
    float _401 = _146 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _403 = _383 != 0.0;
    bool _405 = isnan(_383);
    bool _407 = _403 || _405;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    float _413 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[32].x, _277);
    float _415 = rint(_383);
    float _417 = precise::max(_415, 0.0);
    uint _420 = uint(_417);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[29].z, _303);
    float _426 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[31].z, _305);
    float _428 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[32].z, _413);
    float _430 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[20].z, _295);
    float _432 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[22].z, _293);
    float _434 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[23].z, _299);
    float _436 = _381 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _438 = _387 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _440 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[18].x, _385);
    float _442 = _438;
    float _444 = _375;
    if (_399)
    {
        float _446 = _224 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _442 = _446;
    }
    float _448 = _442;
    float _450 = _146 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _452 = _448;
    if (!_411)
    {
        float _454 = _389 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _452 = _454;
    }
    float _456 = _452;
    float _458 = exp2(_436);
    float _460 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[18].z, _440);
    float _462 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[17].x, _450);
    float _464 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[25].x, _246);
    float _466 = 0.0 + _456;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    if (!_353)
    {
        float _470 = _460 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _444 = _470;
    }
    float _472 = _444;
    float _474 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[16].x, _401);
    float _476 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[25].z, _464);
    float _478 = rint(_313);
    float _480 = precise::max(_478, 0.0);
    uint _482 = uint(_480);
    uint _484 = clamp(_482, 0u, 65535u);
    float _486 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[17].z, _462);
    float _488 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[16].z, _474);
    float _490 = 0.0 + _472;
    float _492 = precise::clamp(_490, 0.0, 1.0);
    float _494 = _458 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _496 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[28].x, _261);
    float _498 = fma(_307, _494, _146);
    float _500 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[26].x, _252);
    float _502 = fma(_309, _494, _148);
    float _504 = fma(_311, _494, _140);
    float _506 = _498 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _508 = _498 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _510 = _498 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _512 = _498 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _514 = fma(_502, (*spvDescriptorSet0.fp_c3)._m0[3].x, _506);
    float _516 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[19].z, _287);
    float _518 = fma(_502, (*spvDescriptorSet0.fp_c3)._m0[0].x, _508);
    float _520 = fma(_502, (*spvDescriptorSet0.fp_c3)._m0[1].x, _510);
    float _522 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[3].z, _514);
    float _524 = fma(_502, (*spvDescriptorSet0.fp_c3)._m0[2].x, _512);
    float _526 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[28].z, _496);
    float _528 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[26].z, _500);
    float _530 = _522 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _532 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[2].z, _524);
    float _534 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[0].z, _518);
    float _536 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[1].z, _520);
    float _538 = _424 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _540 = _532 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _542 = 1.0 / _530;
    float _544 = _538;
    if (_399)
    {
        float _546 = _428 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _544 = _546;
    }
    float _548 = _544;
    float _550 = _526 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _552 = _548;
    float _554 = _550;
    if (!_411)
    {
        float _556 = _528 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _552 = _556;
    }
    float _558 = _552;
    if (_399)
    {
        float _560 = _426 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _554 = _560;
    }
    float _562 = _554;
    float _564 = _562;
    if (!_411)
    {
        float _566 = _476 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _564 = _566;
    }
    float _568 = _564;
    float _570 = _516 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _572 = _430 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _574 = _570;
    float _576 = _572;
    if (_331)
    {
        float _578 = _432 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _574 = _578;
    }
    float _580 = _574;
    float _582 = _580;
    if (_331)
    {
        float _584 = _434 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _576 = _584;
    }
    float _586 = _576;
    float _588 = _536 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _590 = _586;
    if (!_353)
    {
        float _592 = _488 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _582 = _592;
    }
    float _594 = _582;
    if (!_353)
    {
        float _596 = _486 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _590 = _596;
    }
    float _598 = _590;
    float _600 = _540 * _542;
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float3 _1630 = float3(_568, _558, float(int(_422)));
    float3 _1634 = select(_1630, float3(0.0), isnan(_1630));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1634.xy, uint(rint(_1634.z)), _468);
    float3 _1643 = float3(_594, _598, float(int(_484)));
    float3 _1645 = select(_1643, float3(0.0), isnan(_1643));
    float _606 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1645.xy, uint(rint(_1645.z)), _492);
    float _608 = _534 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _610 = rint(_602);
    float _612 = precise::max(_610, 0.0);
    uint _614 = uint(_612);
    uint _616 = clamp(_614, 0u, 65535u);
    float _618 = _588 * _542;
    float _620 = _608 * _542;
    float3 _1672 = float3(_620, _618, float(int(_616)));
    float3 _1674 = select(_1672, float3(0.0), isnan(_1672));
    float _622 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1674.xy, uint(rint(_1674.z)), 1.0);
    float2 _1679 = float2(_54, _56);
    float _624 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1679, float2(0.0), isnan(_1679))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1679, float2(0.0), isnan(_1679))).x;
    float _626 = -_140;
    float _628 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _630 = _626 + _628;
    float _632 = -_140;
    float _634 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _636 = _632 + _634;
    float _638 = _630 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = _636 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    float _646 = _604 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _648 = fma(_606, (*spvDescriptorSet0.fp_c3)._m0[49].z, _646);
    float _650 = _640 + _648;
    float _652 = _644 + _622;
    out.m_47.x = _624;
    out.m_47.y = _652;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _650;
    return out;
}

