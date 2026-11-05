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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_42 [[user(locn7), flat]];
    float4 m_48 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _706 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_706, float2(0.0), isnan(_706))).w;
    float _92 = in.m_40.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.x;
    float _100 = in.m_42.y;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_40.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _84 * _96;
    float _116 = -_98;
    float _118 = _116 + _100;
    float _120 = 0.0 + _114;
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = 1.0 / _118;
    float _126 = precise::max(_98, _122);
    float _128 = _84 * _106;
    float _130 = precise::min(_100, _126);
    float _132 = precise::max(_128, _98);
    float _134 = _84 * _112;
    float _136 = -_98;
    float _138 = _136 + _130;
    float _140 = precise::min(_100, _132);
    float _142 = 0.0 + _134;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _138 * _124;
    float _148 = -_98;
    float _150 = _148 + _140;
    float _152 = sqrt(_146);
    float _154 = -_150;
    float _156 = fma(_154, _124, 1.0);
    float _158 = _90 * 0.20000000298023223876953125;
    float _160 = _158 * _156;
    float _162 = fma(_160, _152, _146);
    float2 _811 = float2(_144, _162);
    float4 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_811, float2(0.0), isnan(_811))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_811, float2(0.0), isnan(_811))).xyzw;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float _173 = _165.w;
    float _175 = in.m_46.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_46.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_48.y;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_48.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_48.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_50.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _84 * _179;
    float _219 = _84 * _185;
    float _221 = _84 * _191;
    float _223 = _217 * _217;
    float _225 = fma(_219, _219, _223);
    float _227 = fma(_221, _221, _225);
    float _229 = _84 * _197;
    float _231 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _233 = _231 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _235 = rsqrt(_227);
    float _237 = 1.0 / _233;
    float _239 = _217 * _235;
    float _241 = _84 * _203;
    float _243 = _219 * _235;
    float _245 = in.m_52.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _229 * _239;
    float _253 = _221 * _235;
    float _255 = fma(_241, _243, _251);
    float _257 = _84 * _209;
    float _259 = fma(_257, _253, _255);
    float _261 = abs(_259);
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _265 = _261 + _263;
    float _267 = _265 * _237;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_269, -2.0, 3.0);
    float _273 = _269 * _269;
    float _275 = _84 * _215;
    float _277 = _271 * _273;
    float _279 = _84 * _249;
    float _281 = _173 * _275;
    float _283 = 0.0 + _281;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _285 * _277;
    float _289 = _287 * _279;
    bool _293 = _289 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _295 = isnan(_289);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _301 = _297 || _299;
    float _303 = in.m_44.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    if (!_301)
    {
        discard_fragment();
    }
    float _309 = _84 * _307;
    float _311 = 0.0 + _309;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    bool _315 = _313 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _317 = isnan(_313);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    bool _327 = _313 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _329 = isnan(_313);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_325;
    float _341 = _339 + 1.0;
    float _343 = _337 * _341;
    float _345 = -_337;
    float _347 = _345 + 1.0;
    float _349 = _343 * (*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _351 = _343 * (*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _353 = _343 * (*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _355 = fma(_347, (*spvDescriptorSet0.fp_c9)._m0[107].x, _349);
    float _357 = fma(_347, (*spvDescriptorSet0.fp_c9)._m0[107].y, _351);
    float _359 = fma(_347, (*spvDescriptorSet0.fp_c9)._m0[107].z, _353);
    bool _361 = _313 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _363 = isnan(_313);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_371;
    float _375 = _373 + 1.0;
    float _377 = _325 * _375;
    float _379 = fma(_377, (*spvDescriptorSet0.fp_c9)._m0[108].x, _355);
    float _381 = fma(_377, (*spvDescriptorSet0.fp_c9)._m0[108].y, _357);
    float _383 = fma(_377, (*spvDescriptorSet0.fp_c9)._m0[108].z, _359);
    bool _385 = _313 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _387 = isnan(_313);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_395;
    float _399 = _397 + 1.0;
    float _401 = _371 * _399;
    float _403 = fma(_401, (*spvDescriptorSet0.fp_c9)._m0[109].x, _379);
    float _405 = fma(_401, (*spvDescriptorSet0.fp_c9)._m0[109].y, _381);
    float _407 = fma(_401, (*spvDescriptorSet0.fp_c9)._m0[109].z, _383);
    bool _409 = _313 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _411 = isnan(_313);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = _313 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _423 = isnan(_313);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -_419;
    float _435 = _433 + 1.0;
    float _437 = _395 * _435;
    float _439 = -_431;
    float _441 = _439 + 1.0;
    float _443 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[110].x, _403);
    float _445 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[110].y, _405);
    float _447 = _419 * _441;
    float _449 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[110].z, _407);
    float _451 = fma(_447, (*spvDescriptorSet0.fp_c9)._m0[111].x, _443);
    float _453 = fma(_447, (*spvDescriptorSet0.fp_c9)._m0[111].y, _445);
    float _455 = fma(_447, (*spvDescriptorSet0.fp_c9)._m0[111].z, _449);
    float _457 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[112].x, _451);
    float _459 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[112].y, _453);
    float _461 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[112].z, _455);
    float _463 = _457 * _167;
    float _465 = _459 * _169;
    float _467 = _461 * _171;
    if (!_301)
    {
        out.m_55.x = _463;
        out.m_55.y = _465;
        out.m_55.z = _467;
        out.m_55.w = _281;
        return out;
    }
    float _469 = _229 * _229;
    float _471 = fma(_241, _241, _469);
    float _473 = fma(_257, _257, _471);
    float _475 = rsqrt(_473);
    float _477 = _241 * _475;
    float _479 = _229 * _475;
    float _481 = _257 * _475;
    float _483 = abs(_477);
    float _485 = abs(_479);
    float _487 = precise::max(_483, _485);
    float _489 = abs(_481);
    float _491 = precise::max(_489, _487);
    float _493 = 1.0 / _491;
    float _495 = -_493;
    float _497 = _481 * _495;
    float _499 = _477 * _493;
    float _501 = _479 * _493;
    float3 _1340 = float3(_499, _501, _497);
    float3 _505 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1340, float3(0.0), isnan(_1340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1340, float3(0.0), isnan(_1340)), level(0.0)).xyz;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    float _513 = in.m_57.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_57.z;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_57.y;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_59.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_59.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_59.y;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_61.x;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_61.w;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_61.y;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_61.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = 0.0 + _289;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    bool _577 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _579 = _84 * _517;
    float _581 = _84 * _523;
    float _583 = _84 * _529;
    float _585 = fma(_507, 0.20999999344348907470703125, _579);
    float _587 = fma(_511, 0.20999999344348907470703125, _581);
    float _589 = _84 * _535;
    float _591 = _84 * _541;
    float _593 = fma(_509, 0.20999999344348907470703125, _583);
    float _595 = _84 * _547;
    float _597 = _585 + _589;
    float _599 = _587 + _591;
    float _601 = _84 * _565;
    float _603 = _593 + _595;
    float _605 = _463 * _597;
    float _607 = _467 * _599;
    float _609 = _84 * _553;
    float _611 = _84 * _559;
    float _613 = _465 * _603;
    float _615 = _84 * _571;
    float _617 = fma(_605, _611, _609);
    float _619 = fma(_613, _611, _601);
    float _621 = fma(_607, _611, _615);
    float _623 = _609;
    if (!_577)
    {
        _623 = _575;
    }
    float _625 = _623;
    bool _627 = !_577;
    float _629 = _625;
    if (!_627)
    {
        float _631 = in.m_63.w;
        float _633 = gl_FragCoord.w;
        float _635 = _631 * _633;
        float _637 = in.m_63.z;
        float _639 = gl_FragCoord.w;
        float _641 = _637 * _639;
        float _643 = _84 * _635;
        float _645 = _84 * _641;
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
        float _667 = _575 * _665;
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

