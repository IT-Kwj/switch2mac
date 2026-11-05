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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
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
    float _110 = in.m_48.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_48.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 1.0 / _78;
    float _124 = _122 * _84;
    float _126 = _122 * _90;
    float _128 = _122 * _96;
    float _130 = _122 * _102;
    float _132 = 1.0 / _124;
    float _134 = _122 * _108;
    float _136 = _122 * _114;
    float _138 = _122 * _120;
    float _140 = _126 * _132;
    float _142 = _128 * _132;
    float2 _762 = float2(_140, _142);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float2 _773 = float2(_130, _134);
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_773, float2(0.0), isnan(_773))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_773, float2(0.0), isnan(_773))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float2 _789 = float2(_136, _138);
    float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_789, float2(0.0), isnan(_789))).xyzw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _157.w;
    float _167 = in.m_44.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_50.w;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_52.w;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_54.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _122 * _171;
    float _193 = _191 * _132;
    float _195 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _199 = fma(_193, (*spvDescriptorSet0.fp_c8)._m0[30].w, _197);
    float _201 = _122 * _177;
    float _203 = 1.0 / _199;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _207 = fma(_144, (*spvDescriptorSet0.fp_c8)._m0[30].w, _205);
    float _209 = _122 * _183;
    float _211 = 1.0 / _207;
    float _213 = -_201;
    float _215 = fma(_155, _165, _213);
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _219 = _203 * _217;
    float _221 = _122 * _189;
    float _223 = _209 * _215;
    float _225 = 0.0 + _223;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _231 = -_219;
    float _233 = fma(_211, _229, _231);
    float _235 = _233 * _195;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _227 * _237;
    float _241 = _239 * _221;
    bool _245 = _241 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _247 = isnan(_241);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _253 = _249 || _251;
    float _255 = in.m_46.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_46.w;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    if (!_253)
    {
        discard_fragment();
    }
    float _267 = _122 * _259;
    float _269 = _122 * _265;
    float2 _955 = float2(_267, _269);
    float2 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_955, float2(0.0), isnan(_955))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_955, float2(0.0), isnan(_955))).xy;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = in.m_50.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_50.x;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_52.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_52.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_50.z;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_52.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _149 * _159;
    float _317 = _151 * _161;
    float _319 = _153 * _163;
    float _321 = _122 * _283;
    float _323 = _122 * _289;
    float _325 = _122 * _295;
    float _327 = _122 * _301;
    float _329 = _122 * _307;
    float _331 = _122 * _313;
    float _333 = -_325;
    float _335 = _323 + _333;
    float _337 = -_327;
    float _339 = _321 + _337;
    float _341 = -_331;
    float _343 = _329 + _341;
    float _345 = fma(_315, _335, _325);
    float _347 = fma(_317, _339, _327);
    float _349 = fma(_319, _343, _331);
    if (!_253)
    {
        out.m_57.x = _345;
        out.m_57.y = _347;
        out.m_57.z = _349;
        out.m_57.w = _223;
        return out;
    }
    float _351 = in.m_59.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_61.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_59.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_61.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_63.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_59.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_61.z;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_63.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_63.z;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = _277 * _277;
    float _407 = fma(_275, _275, _405);
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = -_409;
    float _413 = _411 + 1.0;
    float _415 = sqrt(_413);
    float _417 = _122 * _355;
    float _419 = _122 * _361;
    float _421 = _122 * _367;
    float _423 = _122 * _373;
    float _425 = _122 * _379;
    float _427 = _419 * _419;
    float _429 = _122 * _385;
    float _431 = _417 * _417;
    float _433 = _122 * _391;
    float _435 = fma(_423, _423, _427);
    float _437 = _425 * _425;
    float _439 = _122 * _397;
    float _441 = fma(_421, _421, _431);
    float _443 = fma(_433, _433, _435);
    float _445 = _122 * _403;
    float _447 = fma(_439, _439, _437);
    float _449 = fma(_429, _429, _441);
    float _451 = rsqrt(_443);
    float _453 = fma(_445, _445, _447);
    float _455 = rsqrt(_449);
    float _457 = rsqrt(_453);
    float _459 = _277 * _451;
    float _461 = _419 * _459;
    float _463 = _423 * _459;
    float _465 = _433 * _459;
    float _467 = _275 * _455;
    float _469 = fma(_417, _467, _461);
    float _471 = fma(_421, _467, _463);
    float _473 = fma(_429, _467, _465);
    float _475 = _415 * _457;
    float _477 = in.m_65.x;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = fma(_425, _475, _469);
    float _485 = fma(_439, _475, _471);
    float _487 = fma(_445, _475, _473);
    float _489 = _483 * _483;
    float _491 = fma(_485, _485, _489);
    float _493 = fma(_487, _487, _491);
    float _495 = rsqrt(_493);
    float _497 = _122 * _481;
    float _499 = _485 * _495;
    float _501 = _483 * _495;
    float _503 = _487 * _495;
    float _505 = precise::min(_497, 1.0);
    float _507 = abs(_499);
    float _509 = abs(_501);
    float _511 = precise::max(_507, _509);
    float _513 = abs(_503);
    float _515 = precise::max(_513, _511);
    float _517 = 1.0 / _515;
    float _519 = _499 * _517;
    float _521 = _501 * _517;
    float _523 = -_517;
    float _525 = _503 * _523;
    float3 _1322 = float3(_519, _521, _525);
    float3 _529 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1322, float3(0.0), isnan(_1322)), level(_505)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1322, float3(0.0), isnan(_1322)), level(_505)).xyz;
    float _531 = _529.x;
    float _533 = _529.y;
    float _535 = _529.z;
    float _537 = in.m_67.x;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_67.z;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_67.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_69.z;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_69.x;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_69.y;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_71.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_71.y;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_71.z;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_71.w;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    bool _597 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _599 = _122 * _541;
    float _601 = _122 * _553;
    float _603 = _122 * _559;
    float _605 = _122 * _565;
    float _607 = _122 * _571;
    float _609 = _122 * _583;
    float _611 = _122 * _589;
    float _613 = fma(_531, 0.20999999344348907470703125, _599);
    float _615 = _122 * _547;
    float _617 = fma(_533, 0.20999999344348907470703125, _601);
    float _619 = _122 * _577;
    float _621 = _613 + _605;
    float _623 = fma(_535, 0.20999999344348907470703125, _615);
    float _625 = _615;
    if (_597)
    {
        float _627 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _629 = _219 + _627;
        _625 = _629;
    }
    float _631 = _625;
    float _633 = _617 + _607;
    float _635 = _122 * _595;
    float _637 = _623 + _603;
    float _639 = 0.0 + _241;
    float _641 = precise::clamp(_639, 0.0, 1.0);
    float _643 = _631;
    float _645 = _641;
    if (_597)
    {
        float _647 = _631 * 8.0;
        float _649 = precise::clamp(_647, 0.0, 1.0);
        _643 = _649;
    }
    float _651 = _643;
    float _653 = _345 * _621;
    float _655 = _347 * _633;
    float _657 = _349 * _637;
    if (_597)
    {
        float _659 = _641 * _651;
        _645 = _659;
    }
    float _661 = _645;
    float _663 = fma(_653, _635, _619);
    float _665 = fma(_655, _635, _609);
    float _667 = fma(_657, _635, _611);
    float _669 = 0.0 + _661;
    float _671 = precise::clamp(_669, 0.0, 1.0);
    out.m_57.x = _663;
    out.m_57.y = _665;
    out.m_57.z = _667;
    out.m_57.w = _671;
    return out;
}

