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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_50 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_71 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_44.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_46.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_48.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_48.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_46.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_48.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = 1.0 / _78;
    float _136 = _134 * _84;
    float _138 = _134 * _90;
    float _140 = _134 * _96;
    float _142 = _134 * _102;
    float _144 = _134 * _108;
    float _146 = _134 * _120;
    float _148 = 1.0 / _136;
    float _150 = _134 * _126;
    float _152 = _134 * _132;
    float _154 = _140 * _148;
    float _156 = _142 * _148;
    float _158 = _134 * _114;
    float2 _786 = float2(_154, _156);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_786, float2(0.0), isnan(_786))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_786, float2(0.0), isnan(_786))).x;
    float2 _797 = float2(_138, _146);
    float _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_797, float2(0.0), isnan(_797))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_797, float2(0.0), isnan(_797))).w;
    float2 _805 = float2(_144, _158);
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_805, float2(0.0), isnan(_805))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_805, float2(0.0), isnan(_805))).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float2 _821 = float2(_150, _152);
    float4 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_821, float2(0.0), isnan(_821))).xyzw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float _183 = _175.w;
    float _185 = in.m_50.y;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_50.x;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_50.z;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_52.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_44.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _217 = -(*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _219 = 1.0 + _217;
    float _221 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _223 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _221;
    float _225 = 1.0 / _219;
    float _227 = 1.0 / _223;
    float _229 = _134 * _189;
    float _231 = _134 * _195;
    float _233 = _134 * _207;
    float _235 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _237 = _229 + _235;
    float _239 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _241 = _231 + _239;
    float _243 = _134 * _201;
    float _245 = _134 * _213;
    float _247 = _237 * _237;
    float _249 = precise::max(_233, (*spvDescriptorSet0.fp_c9)._m0[191].w);
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _253 = _243 + _251;
    float _255 = precise::max(0.0, _233);
    float _257 = fma(_241, _241, _247);
    float _259 = _245 * _148;
    float _261 = in.m_54.w;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = precise::min(_255, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _269 = fma(_253, _253, _257);
    float _271 = precise::min(_249, 1.0);
    float _273 = in.m_56.w;
    float _275 = gl_FragCoord.w;
    float _277 = _273 * _275;
    float _279 = _267 * _215;
    float _281 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _283 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[30].w, _281);
    float _285 = sqrt(_269);
    float _287 = -(*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _289 = _271 + _287;
    float _291 = -_289;
    float _293 = fma(_291, _225, 1.0);
    float _295 = 1.0 / _283;
    float _297 = _293 * _279;
    float _299 = abs(_285);
    float _301 = precise::max(_299, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _303 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _305 = precise::min(_301, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _307 = _134 * _265;
    float _309 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _311 = _305 + _309;
    float _313 = _134 * _277;
    float _315 = _311 * _227;
    float _317 = in.m_58.x;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_56.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_56.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_54.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_54.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _349 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _347);
    float _351 = _173 * _162;
    float _353 = 1.0 / _349;
    float _355 = _183 * _351;
    float _357 = _307 * _355;
    float _359 = _134 * _321;
    float _361 = _313 * _357;
    float _363 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _365 = _295 * _363;
    float _367 = _315 * _361;
    float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _371 = -_365;
    float _373 = fma(_353, _369, _371);
    float _375 = _367 * _297;
    float _377 = _373 * _303;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = 0.0 + _375;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _383 * _379;
    float _387 = _385 * _359;
    bool _391 = _387 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _393 = isnan(_387);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _399 = _395 || _397;
    float _401 = in.m_56.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = in.m_54.x;
    float _409 = gl_FragCoord.w;
    float _411 = _407 * _409;
    float _413 = _365;
    if (!_399)
    {
        discard_fragment();
    }
    float _415 = _177 * _177;
    float _417 = _179 * _179;
    float _419 = _181 * _181;
    float _421 = _167 * _415;
    float _423 = _169 * _417;
    float _425 = _171 * _419;
    float _427 = _134 * _327;
    float _429 = -_421;
    float _431 = _429 + 1.0;
    float _433 = _134 * _333;
    float _435 = -_425;
    float _437 = _435 + 1.0;
    float _439 = _134 * _405;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    float _445 = _439 * _431;
    float _447 = _427 * _443;
    float _449 = _433 * _437;
    float _451 = _134 * _411;
    float _453 = _134 * _339;
    float _455 = _134 * _345;
    float _457 = fma(_421, _451, _445);
    float _459 = fma(_423, _453, _447);
    float _461 = fma(_425, _455, _449);
    if (!_399)
    {
        out.m_61.x = _457;
        out.m_61.y = _459;
        out.m_61.z = _461;
        out.m_61.w = _375;
        return out;
    }
    float _463 = in.m_63.y;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_63.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_63.z;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = _134 * _467;
    float _483 = _134 * _473;
    float _485 = _134 * _479;
    float _487 = _481 * _481;
    float _489 = in.m_65.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = fma(_483, _483, _487);
    float _497 = fma(_485, _485, _495);
    float _499 = rsqrt(_497);
    float _501 = _483 * _499;
    float _503 = _481 * _499;
    float _505 = _485 * _499;
    float _507 = _134 * _493;
    float _509 = abs(_501);
    float _511 = abs(_503);
    float _513 = precise::max(_509, _511);
    float _515 = precise::min(_507, 1.0);
    float _517 = abs(_505);
    float _519 = precise::max(_517, _513);
    float _521 = 1.0 / _519;
    float _523 = -_521;
    float _525 = _505 * _523;
    float _527 = _501 * _521;
    float _529 = _503 * _521;
    float3 _1330 = float3(_527, _529, _525);
    float3 _533 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1330, float3(0.0), isnan(_1330)), level(_515)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1330, float3(0.0), isnan(_1330)), level(_515)).xyz;
    float _535 = _533.x;
    float _537 = _533.y;
    float _539 = _533.z;
    float _541 = in.m_67.x;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_67.z;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_67.y;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_69.z;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_69.x;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_69.y;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_71.x;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_71.y;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = in.m_71.z;
    float _591 = gl_FragCoord.w;
    float _593 = _589 * _591;
    float _595 = in.m_71.w;
    float _597 = gl_FragCoord.w;
    float _599 = _595 * _597;
    bool _601 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_601)
    {
        float _603 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _605 = _365 + _603;
        _413 = _605;
    }
    float _607 = _413;
    float _609 = _607;
    if (_601)
    {
        float _611 = _607 * 8.0;
        float _613 = precise::clamp(_611, 0.0, 1.0);
        _609 = _613;
    }
    float _615 = _609;
    float _617 = _134 * _545;
    float _619 = _134 * _551;
    float _621 = _134 * _563;
    float _623 = _134 * _569;
    float _625 = _134 * _575;
    float _627 = _134 * _587;
    float _629 = fma(_535, 0.20999999344348907470703125, _617);
    float _631 = _134 * _557;
    float _633 = fma(_539, 0.20999999344348907470703125, _619);
    float _635 = _134 * _581;
    float _637 = _629 + _623;
    float _639 = fma(_537, 0.20999999344348907470703125, _631);
    float _641 = _633 + _621;
    float _643 = 0.0 + _387;
    float _645 = precise::clamp(_643, 0.0, 1.0);
    float _647 = _134 * _593;
    float _649 = _639 + _625;
    float _651 = _134 * _599;
    float _653 = _457 * _637;
    float _655 = _461 * _641;
    float _657 = _459 * _649;
    float _659 = _645;
    if (_601)
    {
        float _661 = _645 * _615;
        _659 = _661;
    }
    float _663 = _659;
    float _665 = fma(_653, _651, _635);
    float _667 = fma(_655, _651, _647);
    float _669 = fma(_657, _651, _627);
    float _671 = 0.0 + _663;
    float _673 = precise::clamp(_671, 0.0, 1.0);
    out.m_61.x = _665;
    out.m_61.y = _669;
    out.m_61.z = _667;
    out.m_61.w = _673;
    return out;
}

