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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
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
    float _110 = in.m_46.z;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_46.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_48.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = 1.0 / _78;
    float _136 = _134 * _84;
    float _138 = _134 * _90;
    float _140 = _134 * _96;
    float _142 = _134 * _102;
    float _144 = _134 * _108;
    float _146 = _134 * _114;
    float _148 = 1.0 / _136;
    float _150 = _134 * _120;
    float _152 = _134 * _126;
    float _154 = _134 * _132;
    float _156 = _138 * _148;
    float _158 = _140 * _148;
    float2 _808 = float2(_156, _158);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_808, float2(0.0), isnan(_808))).x;
    float2 _819 = float2(_142, _144);
    float4 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_819, float2(0.0), isnan(_819))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_819, float2(0.0), isnan(_819))).xyzw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _163.w;
    float2 _835 = float2(_146, _150);
    float4 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_835, float2(0.0), isnan(_835))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_835, float2(0.0), isnan(_835))).xyzw;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float _181 = _173.w;
    float2 _851 = float2(_152, _154);
    float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_851, float2(0.0), isnan(_851))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_851, float2(0.0), isnan(_851))).xyzw;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _183.w;
    float _193 = in.m_50.y;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_50.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_50.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_52.y;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_52.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_52.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_44.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _237 = _235 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _239 = 1.0 / _237;
    float _241 = _134 * _197;
    float _243 = _134 * _203;
    float _245 = _134 * _209;
    float _247 = _241 * _241;
    float _249 = in.m_54.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = fma(_243, _243, _247);
    float _257 = fma(_245, _245, _255);
    float _259 = _134 * _215;
    float _261 = rsqrt(_257);
    float _263 = _241 * _261;
    float _265 = _243 * _261;
    float _267 = _134 * _221;
    float _269 = _245 * _261;
    float _271 = in.m_56.w;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _259 * _263;
    float _279 = in.m_58.w;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = _134 * _233;
    float _287 = fma(_267, _265, _277);
    float _289 = _134 * _227;
    float _291 = _285 * _148;
    float _293 = _134 * _253;
    float _295 = fma(_289, _269, _287);
    float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _299 = fma(_291, (*spvDescriptorSet0.fp_c8)._m0[30].w, _297);
    float _301 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _303 = abs(_295);
    float _305 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _307 = _303 + _305;
    float _309 = _307 * _239;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = in.m_60.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = 1.0 / _299;
    float _321 = _134 * _275;
    float _323 = in.m_58.x;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_58.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_58.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _343 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _341);
    float _345 = fma(_311, -2.0, 3.0);
    float _347 = _311 * _311;
    float _349 = 1.0 / _343;
    float _351 = _345 * _347;
    float _353 = _171 + _181;
    float _355 = _134 * _283;
    float _357 = _353 * _191;
    float _359 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _361 = _319 * _359;
    float _363 = -_321;
    float _365 = fma(_357, _293, _363);
    float _367 = _355 * _365;
    float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _371 = -_361;
    float _373 = fma(_349, _369, _371);
    float _375 = 0.0 + _367;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = _373 * _301;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = abs(_373);
    bool _387 = _383 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _389 = float(_387);
    float _391 = _377 * _381;
    float _393 = _134 * _317;
    float _395 = _391 * _351;
    float _397 = _395 * _389;
    float _399 = _397 * _393;
    bool _401 = _399 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _403 = isnan(_399);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _409 = _405 || _407;
    float _411 = in.m_56.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_56.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_56.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_54.x;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = _361;
    if (!_409)
    {
        discard_fragment();
    }
    float _437 = in.m_54.y;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_54.z;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = _177 * _177;
    float _451 = _175 * _175;
    float _453 = _179 * _179;
    float _455 = _134 * _333;
    float _457 = fma(_167, _167, _449);
    float _459 = fma(_165, _165, _451);
    float _461 = fma(_169, _169, _453);
    float _463 = _457 * _187;
    float _465 = _459 * _185;
    float _467 = _134 * _327;
    float _469 = _134 * _339;
    float _471 = _461 * _189;
    float _473 = _134 * _415;
    float _475 = _134 * _421;
    float _477 = _134 * _427;
    float _479 = _134 * _433;
    float _481 = -_467;
    float _483 = _473 + _481;
    float _485 = -_455;
    float _487 = _475 + _485;
    float _489 = -_469;
    float _491 = _477 + _489;
    float _493 = fma(_465, _483, _467);
    float _495 = fma(_471, _487, _455);
    float _497 = fma(_463, _491, _469);
    float _499 = _493 * _479;
    float _501 = _134 * _441;
    float _503 = _134 * _447;
    float _505 = _497 * _501;
    float _507 = _495 * _503;
    if (!_409)
    {
        out.m_63.x = _499;
        out.m_63.y = _505;
        out.m_63.z = _507;
        out.m_63.w = _367;
        return out;
    }
    float _509 = _259 * _259;
    float _511 = fma(_267, _267, _509);
    float _513 = in.m_65.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = fma(_289, _289, _511);
    float _521 = rsqrt(_519);
    float _523 = _267 * _521;
    float _525 = _259 * _521;
    float _527 = _289 * _521;
    float _529 = abs(_523);
    float _531 = abs(_525);
    float _533 = precise::max(_529, _531);
    float _535 = _134 * _517;
    float _537 = abs(_527);
    float _539 = precise::max(_537, _533);
    float _541 = precise::min(_535, 1.0);
    float _543 = 1.0 / _539;
    float _545 = _523 * _543;
    float _547 = _525 * _543;
    float _549 = -_543;
    float _551 = _527 * _549;
    float3 _1382 = float3(_545, _547, _551);
    float3 _555 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1382, float3(0.0), isnan(_1382)), level(_541)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1382, float3(0.0), isnan(_1382)), level(_541)).xyz;
    float _557 = _555.x;
    float _559 = _555.y;
    float _561 = _555.z;
    float _563 = in.m_67.x;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = in.m_67.z;
    float _571 = gl_FragCoord.w;
    float _573 = _569 * _571;
    float _575 = in.m_67.y;
    float _577 = gl_FragCoord.w;
    float _579 = _575 * _577;
    float _581 = in.m_69.z;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = in.m_69.x;
    float _589 = gl_FragCoord.w;
    float _591 = _587 * _589;
    float _593 = in.m_69.y;
    float _595 = gl_FragCoord.w;
    float _597 = _593 * _595;
    float _599 = in.m_71.x;
    float _601 = gl_FragCoord.w;
    float _603 = _599 * _601;
    float _605 = in.m_71.y;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = in.m_71.z;
    float _613 = gl_FragCoord.w;
    float _615 = _611 * _613;
    float _617 = in.m_71.w;
    float _619 = gl_FragCoord.w;
    float _621 = _617 * _619;
    bool _623 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_623)
    {
        float _625 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _627 = _361 + _625;
        _435 = _627;
    }
    float _629 = _435;
    float _631 = _134 * _567;
    float _633 = _134 * _573;
    float _635 = _134 * _585;
    float _637 = _134 * _591;
    float _639 = _134 * _609;
    float _641 = _134 * _615;
    float _643 = _134 * _621;
    float _645 = fma(_557, 0.20999999344348907470703125, _631);
    float _647 = _134 * _579;
    float _649 = fma(_561, 0.20999999344348907470703125, _633);
    float _651 = _134 * _597;
    float _653 = _645 + _637;
    float _655 = fma(_559, 0.20999999344348907470703125, _647);
    float _657 = _649 + _635;
    float _659 = 0.0 + _399;
    float _661 = precise::clamp(_659, 0.0, 1.0);
    float _663 = _633;
    float _665 = _661;
    if (_623)
    {
        float _667 = _629 * 8.0;
        float _669 = precise::clamp(_667, 0.0, 1.0);
        _663 = _669;
    }
    float _671 = _663;
    float _673 = _655 + _651;
    float _675 = _134 * _603;
    float _677 = _499 * _653;
    float _679 = _507 * _657;
    float _681 = _505 * _673;
    if (_623)
    {
        float _683 = _661 * _671;
        _665 = _683;
    }
    float _685 = _665;
    float _687 = fma(_677, _643, _675);
    float _689 = fma(_679, _643, _641);
    float _691 = fma(_681, _643, _639);
    float _693 = 0.0 + _685;
    float _695 = precise::clamp(_693, 0.0, 1.0);
    out.m_63.x = _687;
    out.m_63.y = _691;
    out.m_63.z = _689;
    out.m_63.w = _695;
    return out;
}

