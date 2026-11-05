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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
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
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _668 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_668, float2(0.0), isnan(_668))).x;
    float2 _679 = float2(_52, _54);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_679, float2(0.0), isnan(_679)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_56;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = 1.0 / _82;
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_64;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_66;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _84 * _100;
    float _104 = 1.0 / _92;
    float _106 = _102 * _68;
    float _108 = _102 * _70;
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _114 = 1.0 / _96;
    float _116 = -_108;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _122 = _98 * _120;
    float _124 = _112 * _112;
    float _126 = _106 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _128 = _106 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _130 = _68 * _122;
    float _132 = fma(_118, _118, _124);
    float _134 = _70 * _122;
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _138 = _104 * _136;
    float _140 = -_102;
    float _142 = _140 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _144 = _106 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _146 = -_130;
    float _148 = fma(_138, _72, _146);
    float _150 = -_134;
    float _152 = fma(_138, _76, _150);
    float _154 = -_122;
    float _156 = _154 + _138;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _160 = _114 * _158;
    float _162 = _148 * _148;
    float _164 = fma(_142, _142, _132);
    float _166 = -_106;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _170 = -_130;
    float _172 = fma(_160, _74, _170);
    float _174 = -_134;
    float _176 = fma(_160, _78, _174);
    float _178 = -_122;
    float _180 = _178 + _160;
    float _182 = fma(_152, _152, _162);
    float _184 = _172 * _172;
    float _186 = sqrt(_164);
    float _188 = _168 * _168;
    float _190 = fma(_156, _156, _182);
    float _192 = fma(_176, _176, _184);
    float _194 = -_108;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _198 = _106 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _126);
    float _202 = fma(_180, _180, _192);
    float _204 = rsqrt(_190);
    float _206 = fma(_196, _196, _188);
    float _208 = -_102;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _212 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _128);
    float _214 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _144);
    float _216 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _198);
    float _218 = fma(_210, _210, _206);
    float _220 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[28].z, _200);
    float _222 = rsqrt(_202);
    bool _226 = _186 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _228 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[23].z, _212);
    bool _230 = _186 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _232 = _106 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _234 = !_226;
    int _237 = _234 ? 0 : 1;
    float _239 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[27].z, _214);
    float _241 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[31].z, _216);
    float _243 = _152 * _204;
    float _245 = _156 * _204;
    float _247 = sqrt(_218);
    float _249 = _148 * _204;
    float _251 = _106 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _253 = _106 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    int _255 = 2;
    if (!_226)
    {
        _255 = 1;
    }
    int _257 = _255;
    float _259 = _180 * _222;
    float _261 = _172 * _222;
    float _263 = _176 * _222;
    int _265 = _257;
    if (!_230)
    {
        _265 = _237;
    }
    int _267 = _265;
    float _269 = _243 * _259;
    float _271 = _245 * _261;
    float _273 = _106 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _275 = -_269;
    float _277 = fma(_245, _263, _275);
    float _279 = _249 * _263;
    float _281 = -_271;
    float _283 = fma(_249, _259, _281);
    bool _285 = _247 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _287 = _277 * _277;
    float _289 = -_279;
    float _291 = fma(_243, _261, _289);
    bool _293 = _247 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _295 = _106 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _297 = fma(_283, _283, _287);
    float _299 = float(_267);
    float _301 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _273);
    bool _303 = !_285;
    int _305 = _303 ? 0 : 1;
    float _307 = fma(_291, _291, _297);
    float _309 = precise::min(_299, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _311 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _295);
    float _313 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[24].z, _301);
    int _315 = 2;
    if (!_285)
    {
        _315 = 1;
    }
    int _317 = _315;
    float _319 = _106 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _321 = rsqrt(_307);
    bool _323 = _309 != 1.0;
    bool _325 = isnan(_309);
    bool _327 = _323 || _325;
    bool _329 = isnan(1.0);
    bool _331 = _327 || _329;
    float _333 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[21].z, _311);
    int _335 = _317;
    if (!_293)
    {
        _335 = _305;
    }
    int _337 = _335;
    float _339 = _106 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _341 = _309 != 0.0;
    bool _343 = isnan(_309);
    bool _345 = _341 || _343;
    bool _347 = isnan(0.0);
    bool _349 = _345 || _347;
    float _351 = _333 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _353 = float(_337);
    float _355 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _232);
    float _357 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _359 = rint(_309);
    float _361 = precise::max(_359, 0.0);
    uint _364 = uint(_361);
    uint _366 = clamp(_364, 0u, 65535u);
    float _368 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[22].z, _355);
    float _370 = _351;
    if (_331)
    {
        float _372 = _313 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = _277 * _321;
    float _378 = _283 * _321;
    float _380 = _291 * _321;
    float _382 = _106 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _384 = _376 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _386 = precise::min(_353, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _388 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _319);
    float _390 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _382);
    float _392 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[35].x, _384);
    bool _394 = _386 != 1.0;
    bool _396 = isnan(_386);
    bool _398 = _394 || _396;
    bool _400 = isnan(1.0);
    bool _402 = _398 || _400;
    float _404 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _339);
    float _406 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[30].z, _390);
    float _408 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[35].z, _392);
    float _410 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[33].z, _388);
    float _412 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[18].z, _404);
    float _414 = _406 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _416 = abs(_408);
    float _418 = -_416;
    float _420 = _418 + 1.0;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _106 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _426 = _374;
    float _428 = _414;
    if (!_349)
    {
        float _430 = _412 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _426 = _430;
    }
    float _432 = _426;
    bool _434 = _386 != 0.0;
    bool _436 = isnan(_386);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    float _444 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _424);
    float _446 = abs(_422);
    float _448 = log2(_446);
    if (_402)
    {
        float _450 = _410 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _428 = _450;
    }
    float _452 = _428;
    float _454 = _106 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _456 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _458 = 0.0 + _432;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _454);
    float _464 = rint(_386);
    float _466 = precise::max(_464, 0.0);
    uint _468 = uint(_466);
    uint _470 = clamp(_468, 0u, 65535u);
    float _472 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[19].z, _462);
    float _474 = _452;
    if (!_442)
    {
        float _476 = _239 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _357);
    float _482 = 0.0 + _478;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = _448 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _488 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[20].z, _444);
    float _490 = _472 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _492 = _220 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _494 = _490;
    float _496 = _492;
    if (_331)
    {
        float _498 = _368 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _494 = _498;
    }
    float _500 = _494;
    float _502 = _488 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _504 = exp2(_486);
    float _506 = _502;
    float _508 = _500;
    if (_331)
    {
        float _510 = _228 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _506 = _510;
    }
    float _512 = _506;
    float _514 = _512;
    if (_402)
    {
        float _516 = _241 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _496 = _516;
    }
    float _518 = _496;
    float _520 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _456);
    float _522 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _251);
    float _524 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _253);
    float _526 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[17].z, _480);
    float _528 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].z, _520);
    float _530 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[26].z, _522);
    float _532 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[29].z, _524);
    float _534 = _518;
    if (!_349)
    {
        float _536 = _526 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _514 = _536;
    }
    float _538 = _514;
    if (!_349)
    {
        float _540 = _528 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _508 = _540;
    }
    float _542 = _508;
    float _544 = _504 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _546 = _106 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _548 = fma(_376, _544, _106);
    float _550 = _106 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _552 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _546);
    float _554 = fma(_380, _544, _102);
    float _556 = _548 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _558 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _550);
    float _560 = fma(_378, _544, _108);
    float _562 = _548 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _564 = _548 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _566 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[32].z, _558);
    float _568 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[1].x, _556);
    float _570 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[3].x, _562);
    float _572 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[25].z, _552);
    float _574 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[2].x, _564);
    float _576 = _532 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _578 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[3].z, _570);
    float _580 = _576;
    if (_402)
    {
        float _582 = _566 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[1].z, _568);
    float _588 = _584;
    if (!_442)
    {
        float _590 = _572 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _534 = _590;
    }
    float _592 = _534;
    float _594 = _578 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _596 = _548 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_442)
    {
        float _598 = _530 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _588 = _598;
    }
    float _600 = _588;
    float _602 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[2].z, _574);
    float _604 = 1.0 / _594;
    float _606 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[0].x, _596);
    float _608 = _586 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float3 _1636 = float3(_592, _600, float(int(_470)));
    float3 _1640 = select(_1636, float3(0.0), isnan(_1636));
    float _610 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1640.xy, uint(rint(_1640.z)), _484);
    float3 _1649 = float3(_542, _538, float(int(_366)));
    float3 _1651 = select(_1649, float3(0.0), isnan(_1649));
    float _612 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1651.xy, uint(rint(_1651.z)), _460);
    float _614 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[0].z, _606);
    float _616 = _602 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _618 = _614 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _620 = _608 * _604;
    float _622 = _618 * _604;
    float _624 = _616 * _604;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float3 _1682 = float3(_622, _620, float(0));
    float3 _1684 = select(_1682, float3(0.0), isnan(_1682));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1684.xy, uint(rint(_1684.z)), _626);
    float _630 = -_102;
    float _632 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _634 = _630 + _632;
    float _636 = -_102;
    float _638 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _640 = _636 + _638;
    float _642 = _634 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    float _646 = _640 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = _610 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _652 = fma(_612, (*spvDescriptorSet0.fp_c3)._m0[49].z, _650);
    float _654 = _644 + _652;
    float _656 = _648 + _628;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _656;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _654;
    return out;
}

