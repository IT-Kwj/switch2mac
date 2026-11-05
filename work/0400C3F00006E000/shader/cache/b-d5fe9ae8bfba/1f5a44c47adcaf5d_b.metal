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
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_71 [[user(locn9), flat]];
    float4 m_48 [[user(locn10)]];
    float4 m_58 [[user(locn11)]];
    float4 m_54 [[user(locn12)]];
    float4 m_69 [[user(locn13), flat]];
    float4 m_56 [[user(locn14), flat]];
    float4 m_46 [[user(locn15)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _84 = gl_FragCoord.w;
    float _86 = in.m_44.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_46.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_46.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _84;
    float _112 = _110 * _90;
    float _114 = _110 * _96;
    float _116 = _110 * _102;
    float _118 = _110 * _108;
    float2 _741 = float2(_112, _114);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_741, float2(0.0), isnan(_741))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_741, float2(0.0), isnan(_741))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float2 _760 = float2(_116, _118);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_760, float2(0.0), isnan(_760))).w;
    float _133 = in.m_48.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_48.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_50.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_52.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_54.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _110 * _137;
    float _165 = _110 * _143;
    float _167 = in.m_56.x;
    float _169 = fma(_163, 2.0, -1.0);
    float _171 = fma(_165, 2.0, -1.0);
    float _173 = _169 * _169;
    float _175 = fma(_171, _171, _173);
    float _177 = sqrt(_175);
    float _179 = 0.0 + _177;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = precise::min(_167, 0.9900000095367431640625);
    float _185 = _110 * _161;
    float _187 = -_181;
    float _189 = _187 + 1.0;
    float _191 = -_183;
    float _193 = _191 + 1.0;
    float _195 = _189 * _189;
    float _197 = _189 * _195;
    float _199 = fma(_197, _167, _129);
    float _201 = fma(_131, _193, _183);
    float _203 = _110 * _149;
    float _205 = _110 * _155;
    float _207 = -_203;
    float _209 = fma(_199, _201, _207);
    float _211 = _205 * _209;
    float _213 = 0.0 + _211;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _215 * _185;
    bool _221 = _217 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _223 = isnan(_217);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _229 = _225 || _227;
    float _231 = in.m_58.w;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = _217;
    if (!_229)
    {
        discard_fragment();
    }
    float _239 = in.m_58.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_58.y;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _110 * _235;
    float _253 = 1.0 / _251;
    float _255 = _110 * _243;
    float _257 = _110 * _249;
    float _259 = _255 * _253;
    float _261 = _257 * _253;
    float2 _942 = float2(_259, _261);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_942, float2(0.0), isnan(_942))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_942, float2(0.0), isnan(_942))).x;
    float _265 = in.m_60.y;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_60.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_60.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_52.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_52.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_52.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_50.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_50.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_50.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _127 * _127;
    float _321 = _123 * _123;
    float _323 = -_321;
    float _325 = _323 + 1.0;
    float _327 = _110 * _269;
    float _329 = _110 * _275;
    float _331 = _110 * _281;
    float _333 = _110 * _287;
    float _335 = _327 * _327;
    float _337 = _333 * _325;
    float _339 = fma(_329, _329, _335);
    float _341 = _125 * _125;
    float _343 = _110 * _293;
    float _345 = -_319;
    float _347 = _345 + 1.0;
    float _349 = fma(_331, _331, _339);
    float _351 = -_341;
    float _353 = _351 + 1.0;
    float _355 = _110 * _299;
    float _357 = _110 * _311;
    float _359 = rsqrt(_349);
    float _361 = _343 * _353;
    float _363 = _355 * _347;
    float _365 = _110 * _305;
    float _367 = _110 * _317;
    float _369 = fma(_341, _357, _361);
    float _371 = fma(_321, _365, _337);
    float _373 = fma(_319, _367, _363);
    float _375 = _329 * _359;
    float _377 = _327 * _359;
    float _379 = _331 * _359;
    if (!_229)
    {
        out.m_63.x = _371;
        out.m_63.y = _369;
        out.m_63.z = _373;
        out.m_63.w = _211;
        return out;
    }
    float _381 = in.m_65.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = _377 * _377;
    float _389 = abs(_375);
    float _391 = abs(_377);
    float _393 = precise::max(_389, _391);
    float _395 = fma(_375, _375, _387);
    float _397 = abs(_379);
    float _399 = precise::max(_397, _393);
    float _401 = fma(_379, _379, _395);
    float _403 = 1.0 / _399;
    float _405 = rsqrt(_401);
    float _407 = -_403;
    float _409 = _379 * _407;
    float _411 = _375 * _403;
    float _413 = _377 * _403;
    float _415 = _110 * _385;
    float _417 = -_377;
    float _419 = fma(_417, _405, 0.0);
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = _421 + _415;
    float _425 = precise::min(_423, 1.0);
    float3 _1178 = float3(_411, _413, _409);
    float3 _429 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1178, float3(0.0), isnan(_1178)), level(_425)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1178, float3(0.0), isnan(_1178)), level(_425)).xyz;
    float _431 = _429.x;
    float _433 = _429.y;
    float _435 = _429.z;
    float _437 = in.m_67.y;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_67.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = in.m_69.y;
    float _451 = in.m_69.x;
    float _453 = in.m_67.z;
    float _455 = gl_FragCoord.w;
    float _457 = _453 * _455;
    float _459 = in.m_58.z;
    float _461 = gl_FragCoord.w;
    float _463 = _459 * _461;
    float _465 = in.m_69.z;
    float _467 = in.m_71.x;
    float _469 = in.m_73.z;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_75.x;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = in.m_75.w;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = _110 * _441;
    float _489 = _110 * _447;
    float _491 = in.m_77.w;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = -_449;
    float _499 = _487 + _497;
    float _501 = -_451;
    float _503 = _489 + _501;
    float _505 = _110 * _457;
    float _507 = _110 * _463;
    float _509 = _499 * _499;
    float _511 = _467 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _513 = -_465;
    float _515 = _505 + _513;
    float _517 = _507 * _253;
    float _519 = fma(_503, _503, _509);
    float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _523 = fma(_263, (*spvDescriptorSet0.fp_c8)._m0[30].w, _521);
    float _525 = in.m_77.y;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _533 = fma(_517, (*spvDescriptorSet0.fp_c8)._m0[30].w, _531);
    float _535 = fma(_515, _515, _519);
    float _537 = in.m_77.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_73.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = 1.0 / _533;
    float _551 = -_535;
    float _553 = fma(_511, _511, _551);
    float _555 = in.m_73.y;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = _110 * _473;
    float _563 = precise::max(0.0, _553);
    float _565 = 1.0 / _523;
    bool _567 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _569 = _110 * _479;
    float _571 = sqrt(_563);
    float _573 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _575 = _549 * _573;
    float _577 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _579 = -_575;
    float _581 = fma(_565, _577, _579);
    float _583 = _575;
    if (_567)
    {
        float _585 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _587 = _575 + _585;
        _583 = _587;
    }
    float _589 = _583;
    float _591 = in.m_77.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = _110 * _541;
    float _599 = _110 * _547;
    float _601 = _571 + _581;
    float _603 = _110 * _495;
    float _605 = in.m_75.y;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = in.m_75.z;
    float _613 = gl_FragCoord.w;
    float _615 = _611 * _613;
    float _617 = -_603;
    float _619 = _617 + _601;
    float _621 = _110 * _485;
    float _623 = _619 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _625 = _623 * (-1.44269502162933349609375);
    float _627 = exp2(_625);
    float _629 = _110 * _595;
    float _631 = _110 * _529;
    float _633 = _110 * _559;
    float _635 = _110 * _609;
    float _637 = -_627;
    float _639 = _637 + 1.0;
    float _641 = precise::clamp(_639, 0.0, 1.0);
    float _643 = _110 * _615;
    float _645 = _217 * _641;
    float _647 = precise::clamp(_645, 0.0, 1.0);
    float _649 = _647;
    if (_567)
    {
        float _651 = _589 * 8.0;
        float _653 = precise::clamp(_651, 0.0, 1.0);
        _237 = _653;
    }
    float _655 = _237;
    if (_567)
    {
        float _657 = _647 * _655;
        _649 = _657;
    }
    float _659 = _649;
    float _661 = 0.0 + _659;
    float _663 = precise::clamp(_661, 0.0, 1.0);
    float _665 = fma(_431, 0.20999999344348907470703125, _629);
    float _667 = fma(_433, 0.20999999344348907470703125, _631);
    float _669 = fma(_435, 0.20999999344348907470703125, _597);
    float _671 = _665 + _599;
    float _673 = _667 + _633;
    float _675 = _669 + _561;
    float _677 = _371 * _671;
    float _679 = _369 * _673;
    float _681 = _373 * _675;
    float _683 = fma(_677, _621, _569);
    float _685 = fma(_679, _621, _635);
    float _687 = fma(_681, _621, _643);
    out.m_63.x = _683;
    out.m_63.y = _685;
    out.m_63.z = _687;
    out.m_63.w = _663;
    return out;
}

