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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_44.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _80;
    float _108 = _106 * _86;
    float _110 = _106 * _92;
    float _112 = _106 * _98;
    float _114 = _106 * _104;
    float2 _726 = float2(_108, _110);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_726, float2(0.0), isnan(_726))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float2 _745 = float2(_112, _114);
    float4 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_745, float2(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_745, float2(0.0), isnan(_745))).xyzw;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float _135 = _127.w;
    float _137 = in.m_48.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_50.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_52.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _106 * _141;
    float _157 = _106 * _147;
    float _159 = in.m_44.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _106 * _163;
    float _167 = -_155;
    float _169 = fma(_125, _135, _167);
    float _171 = _157 * _169;
    float _173 = _106 * _153;
    float _175 = 0.0 + _171;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _177 * _173;
    bool _183 = _179 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _185 = isnan(_179);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _191 = _187 || _189;
    float _193 = in.m_44.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    if (!_191)
    {
        discard_fragment();
    }
    float _199 = _106 * _197;
    float2 _850 = float2(_199, _165);
    float2 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_850, float2(0.0), isnan(_850))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_850, float2(0.0), isnan(_850))).xy;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = in.m_48.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_48.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_50.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_50.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_48.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_50.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = _121 * _131;
    float _247 = _119 * _129;
    float _249 = _123 * _133;
    float _251 = _106 * _213;
    float _253 = _106 * _219;
    float _255 = _106 * _225;
    float _257 = _106 * _231;
    float _259 = _106 * _237;
    float _261 = _106 * _243;
    float _263 = -_255;
    float _265 = _253 + _263;
    float _267 = -_257;
    float _269 = _251 + _267;
    float _271 = -_261;
    float _273 = _259 + _271;
    float _275 = fma(_247, _265, _255);
    float _277 = fma(_245, _269, _257);
    float _279 = fma(_249, _273, _261);
    if (!_191)
    {
        out.m_55.x = _275;
        out.m_55.y = _277;
        out.m_55.z = _279;
        out.m_55.w = _171;
        return out;
    }
    float _281 = in.m_57.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_57.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_57.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_59.y;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_59.x;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_59.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_61.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_61.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_61.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = _207 * _207;
    float _337 = fma(_205, _205, _335);
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = -_339;
    float _343 = _341 + 1.0;
    float _345 = sqrt(_343);
    float _347 = _106 * _285;
    float _349 = _106 * _291;
    float _351 = _106 * _297;
    float _353 = _106 * _303;
    float _355 = _347 * _347;
    float _357 = _106 * _315;
    float _359 = _106 * _321;
    float _361 = _106 * _327;
    float _363 = fma(_349, _349, _355);
    float _365 = _106 * _309;
    float _367 = _353 * _353;
    float _369 = _359 * _359;
    float _371 = fma(_351, _351, _363);
    float _373 = _106 * _333;
    float _375 = fma(_365, _365, _367);
    float _377 = fma(_361, _361, _369);
    float _379 = fma(_357, _357, _375);
    float _381 = fma(_373, _373, _377);
    float _383 = rsqrt(_371);
    float _385 = rsqrt(_379);
    float _387 = rsqrt(_381);
    float _389 = _385 * _207;
    float _391 = _383 * _205;
    float _393 = in.m_63.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = _353 * _389;
    float _401 = _365 * _389;
    float _403 = _357 * _389;
    float _405 = _387 * _345;
    float _407 = fma(_347, _391, _399);
    float _409 = fma(_349, _391, _401);
    float _411 = fma(_351, _391, _403);
    float _413 = fma(_359, _405, _407);
    float _415 = fma(_361, _405, _409);
    float _417 = fma(_373, _405, _411);
    float _419 = _413 * _413;
    float _421 = fma(_415, _415, _419);
    float _423 = fma(_417, _417, _421);
    float _425 = rsqrt(_423);
    float _427 = _415 * _425;
    float _429 = _413 * _425;
    float _431 = _417 * _425;
    float _433 = abs(_427);
    float _435 = abs(_429);
    float _437 = precise::max(_433, _435);
    float _439 = abs(_431);
    float _441 = precise::max(_439, _437);
    float _443 = _106 * _397;
    float _445 = 1.0 / _441;
    float _447 = _429 * _445;
    float _449 = _427 * _445;
    float _451 = -_445;
    float _453 = _431 * _451;
    float _455 = precise::min(_443, 1.0);
    float3 _1217 = float3(_449, _447, _453);
    float3 _459 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1217, float3(0.0), isnan(_1217)), level(_455)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1217, float3(0.0), isnan(_1217)), level(_455)).xyz;
    float _461 = _459.x;
    float _463 = _459.y;
    float _465 = _459.z;
    float _467 = in.m_65.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_65.y;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_67.x;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_65.z;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_67.y;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_67.z;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_69.x;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_69.y;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_69.z;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_71.x;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_71.w;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = 0.0 + _179;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    float _537 = in.m_71.y;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_71.z;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = _106 * _471;
    float _551 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _553 = _551 + 1.0;
    float _555 = _106 * _477;
    float _557 = _106 * _489;
    float _559 = fma(_549, (*spvDescriptorSet0.fp_c13)._m0[0].y, _553);
    float _561 = fma(_555, (*spvDescriptorSet0.fp_c13)._m0[0].y, _553);
    float _563 = fma(_557, (*spvDescriptorSet0.fp_c13)._m0[0].y, _553);
    float _565 = _106 * _501;
    float _567 = _275 * _559;
    float _569 = precise::clamp(_567, 0.0, 1.0);
    float _571 = _277 * _561;
    float _573 = precise::clamp(_571, 0.0, 1.0);
    float _575 = _106 * _483;
    float _577 = _106 * _495;
    float _579 = _279 * _563;
    float _581 = precise::clamp(_579, 0.0, 1.0);
    float _583 = _106 * _507;
    float _585 = _106 * _513;
    float _587 = _106 * _519;
    float _589 = _106 * _525;
    float _591 = _106 * _531;
    float _593 = _106 * _547;
    float _595 = fma(_461, 0.20999999344348907470703125, _575);
    float _597 = fma(_463, 0.20999999344348907470703125, _577);
    float _599 = fma(_465, 0.20999999344348907470703125, _565);
    float _601 = _595 + _583;
    bool _603 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _605 = _597 + _585;
    float _607 = _599 + _587;
    float _609 = _569 * _601;
    float _611 = _106 * _541;
    float _613 = _573 * _605;
    float _615 = _581 * _607;
    float _617 = fma(_609, _591, _589);
    float _619 = fma(_613, _591, _611);
    float _621 = fma(_615, _591, _593);
    float _623 = _589;
    if (!_603)
    {
        _623 = _535;
    }
    float _625 = _623;
    bool _627 = !_603;
    float _629 = _625;
    if (!_627)
    {
        float _631 = in.m_73.w;
        float _633 = gl_FragCoord.w;
        float _635 = _631 * _633;
        float _637 = in.m_73.z;
        float _639 = gl_FragCoord.w;
        float _641 = _637 * _639;
        float _643 = _106 * _635;
        float _645 = _106 * _641;
        float _647 = 1.0 / _643;
        float _649 = _645 * _647;
        float _651 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _653 = fma(_649, (*spvDescriptorSet0.fp_c8)._m0[30].w, _651);
        float _655 = 1.0 / _653;
        float _657 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _659 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _661 = fma(_655, _657, _659);
        float _663 = _661 * 8.0;
        float _665 = precise::clamp(_663, 0.0, 1.0);
        float _667 = _535 * _665;
        _629 = _667;
    }
    float _669 = _629;
    float _671 = 0.0 + _669;
    float _673 = precise::clamp(_671, 0.0, 1.0);
    out.m_55.x = _617;
    out.m_55.y = _619;
    out.m_55.z = _621;
    out.m_55.w = _673;
    return out;
}

