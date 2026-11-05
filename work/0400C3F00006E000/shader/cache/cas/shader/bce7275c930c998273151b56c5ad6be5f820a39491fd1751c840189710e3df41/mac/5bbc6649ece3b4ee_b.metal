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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_63 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_51 [[user(locn8), flat]];
    float4 m_53 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
    float4 m_74 [[user(locn11)]];
    float4 m_70 [[user(locn12)]];
    float4 m_76 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = gl_FragCoord.w;
    float _85 = in.m_47.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_47.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = 1.0 / _83;
    float _99 = _97 * _89;
    float _101 = _97 * _95;
    float2 _701 = float2(_99, _101);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_701, float2(0.0), isnan(_701))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_701, float2(0.0), isnan(_701))).w;
    float _105 = in.m_49.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_47.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_51.y;
    float _119 = in.m_53.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_53.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_49.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_51.x;
    float _139 = in.m_49.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_47.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _97 * _109;
    float _153 = _97 * _115;
    float _155 = _117 * 0.100000001490116119384765625;
    float _157 = _97 * _123;
    float _159 = 1.0 / _151;
    float _161 = _97 * _135;
    float _163 = _97 * _143;
    float _165 = _161 * _159;
    float _167 = fma(_103, 2.0, -1.0);
    float _169 = fma(_155, _167, _153);
    float _171 = fma(_155, _167, _157);
    float _173 = _117 * 0.20000000298023223876953125;
    float _175 = _97 * _129;
    float _177 = _137 * 32.0;
    float _179 = _97 * _149;
    float _181 = _163 * _159;
    float _183 = fma(_173, _167, _175);
    float _185 = rint(_177);
    float _187 = precise::max(_185, 0.0);
    uint _190 = uint(_187);
    uint _192 = clamp(_190, 0u, 65535u);
    float _194 = fma(_173, _167, _179);
    float2 _835 = float2(_183, _171);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_835, float2(0.0), isnan(_835))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_835, float2(0.0), isnan(_835))).w;
    float2 _843 = float2(_165, _181);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_843, float2(0.0), isnan(_843))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_843, float2(0.0), isnan(_843))).x;
    float3 _854 = float3(_194, _169, float(int(_192)));
    float3 _858 = select(_854, float3(0.0), isnan(_854));
    float4 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _858.xy, uint(rint(_858.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _858.xy, uint(rint(_858.z))).xyzw;
    float _203 = _201.x;
    float _205 = _201.y;
    float _207 = _201.z;
    float _209 = _201.w;
    float _211 = in.m_55.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_55.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_55.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_57.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_49.z;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_57.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_59.w;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _255 = _253 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _257 = _97 * _215;
    float _259 = _97 * _221;
    float _261 = in.m_57.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = _257 * _257;
    float _269 = _97 * _227;
    float _271 = _97 * _233;
    float _273 = 1.0 / _255;
    float _275 = fma(_259, _259, _267);
    float _277 = fma(_269, _269, _275);
    float _279 = in.m_61.w;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = rsqrt(_277);
    float _287 = _257 * _285;
    float _289 = _269 * _285;
    float _291 = _97 * _265;
    float _293 = _97 * _239;
    float _295 = _259 * _285;
    float _297 = _271 * _287;
    float _299 = _97 * _251;
    float _301 = _293 * _159;
    float _303 = fma(_291, _295, _297);
    float _305 = in.m_63.w;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _97 * _245;
    float _313 = fma(_299, 2.0, -1.0);
    float _315 = fma(_311, _289, _303);
    float _317 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _319 = fma(_301, (*spvDescriptorSet0.fp_c8)._m0[30].w, _317);
    float _321 = abs(_315);
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _325 = _321 + _323;
    float _327 = _325 * _273;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = 1.0 / _319;
    float _333 = fma(_329, -2.0, 3.0);
    float _335 = _329 * _329;
    float _337 = _333 * _335;
    float _339 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _341 = in.m_63.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _313 + _196;
    float _349 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _351 = fma(_198, (*spvDescriptorSet0.fp_c8)._m0[30].w, _349);
    float _353 = in.m_65.x;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = precise::max(_347, 0.20000000298023223876953125);
    float _361 = _97 * _283;
    float _363 = 1.0 / _351;
    float _365 = precise::min(_359, 0.800000011920928955078125);
    float _367 = _209 * _361;
    float _369 = fma(_365, 1.66666662693023681640625, -0.3333333432674407958984375);
    float _371 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _373 = _331 * _371;
    float _375 = _367 * _369;
    float _377 = _97 * _309;
    float _379 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _381 = -_373;
    float _383 = fma(_363, _379, _381);
    float _385 = _377 * _375;
    float _387 = _383 * _339;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = 0.0 + _385;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _393 * _389;
    float _397 = _97 * _357;
    float _399 = _395 * _337;
    float _401 = _399 * _397;
    bool _405 = _401 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _407 = isnan(_401);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _413 = _409 || _411;
    float _415 = in.m_59.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_59.x;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_63.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_63.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_59.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _373;
    if (!_413)
    {
        discard_fragment();
    }
    float _447 = _97 * _345;
    float _449 = _97 * _419;
    float _451 = _97 * _425;
    float _453 = _97 * _431;
    float _455 = _97 * _437;
    float _457 = _97 * _443;
    float _459 = -_451;
    float _461 = _459 + _453;
    float _463 = -_449;
    float _465 = _463 + _455;
    float _467 = -_457;
    float _469 = _467 + _447;
    float _471 = fma(_203, _461, _451);
    float _473 = fma(_205, _465, _449);
    float _475 = fma(_207, _469, _457);
    if (!_413)
    {
        out.m_68.x = _471;
        out.m_68.y = _473;
        out.m_68.z = _475;
        out.m_68.w = _385;
        return out;
    }
    float _477 = _271 * _271;
    float _479 = fma(_291, _291, _477);
    float _481 = in.m_70.x;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = fma(_203, -0.5, 0.5);
    float _489 = fma(_311, _311, _479);
    float _491 = rsqrt(_489);
    float _493 = _291 * _491;
    float _495 = _271 * _491;
    float _497 = _311 * _491;
    float _499 = abs(_493);
    float _501 = abs(_495);
    float _503 = precise::max(_499, _501);
    float _505 = _97 * _485;
    float _507 = abs(_497);
    float _509 = precise::max(_507, _503);
    float _511 = _487 + _505;
    float _513 = 1.0 / _509;
    float _515 = _493 * _513;
    float _517 = -_513;
    float _519 = _497 * _517;
    float _521 = precise::min(_511, 1.0);
    float _523 = _495 * _513;
    float3 _1321 = float3(_515, _523, _519);
    float3 _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1321, float3(0.0), isnan(_1321)), level(_521)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1321, float3(0.0), isnan(_1321)), level(_521)).xyz;
    float _529 = _527.x;
    float _531 = _527.y;
    float _533 = _527.z;
    float _535 = in.m_72.x;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_72.z;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_72.y;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_74.z;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_74.x;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_74.y;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_76.x;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_76.y;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_76.z;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_76.w;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    bool _595 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_595)
    {
        float _597 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _599 = _373 + _597;
        _445 = _599;
    }
    float _601 = _445;
    float _603 = _601;
    if (_595)
    {
        float _605 = _601 * 8.0;
        float _607 = precise::clamp(_605, 0.0, 1.0);
        _603 = _607;
    }
    float _609 = _603;
    float _611 = _97 * _539;
    float _613 = _97 * _545;
    float _615 = _97 * _557;
    float _617 = _97 * _563;
    float _619 = _97 * _581;
    float _621 = _97 * _587;
    float _623 = fma(_529, 0.20999999344348907470703125, _611);
    float _625 = _97 * _551;
    float _627 = fma(_533, 0.20999999344348907470703125, _613);
    float _629 = _97 * _569;
    float _631 = _623 + _617;
    float _633 = fma(_531, 0.20999999344348907470703125, _625);
    float _635 = _627 + _615;
    float _637 = 0.0 + _401;
    float _639 = precise::clamp(_637, 0.0, 1.0);
    float _641 = _97 * _575;
    float _643 = _633 + _629;
    float _645 = _97 * _593;
    float _647 = _471 * _631;
    float _649 = _475 * _635;
    float _651 = _473 * _643;
    float _653 = _639;
    if (_595)
    {
        float _655 = _639 * _609;
        _653 = _655;
    }
    float _657 = _653;
    float _659 = fma(_647, _645, _641);
    float _661 = fma(_649, _645, _621);
    float _663 = fma(_651, _645, _619);
    float _665 = 0.0 + _657;
    float _667 = precise::clamp(_665, 0.0, 1.0);
    out.m_68.x = _659;
    out.m_68.y = _663;
    out.m_68.z = _661;
    out.m_68.w = _667;
    return out;
}

