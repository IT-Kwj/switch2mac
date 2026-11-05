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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_69 [[user(locn10), flat]];
    float4 m_61 [[user(locn11)]];
    float4 m_50 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
    float4 m_67 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _82;
    float _98 = _96 * _88;
    float _100 = _96 * _94;
    float2 _760 = float2(_98, _100);
    float4 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_760, float2(0.0), isnan(_760))).xyzw;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _103.w;
    float _113 = in.m_46.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_48.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_50.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _96 * _117;
    float _133 = _96 * _123;
    float _135 = _96 * _129;
    float _137 = in.m_44.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _96 * _141;
    float _145 = -_131;
    float _147 = _111 + _145;
    float _149 = _133 * _147;
    float _151 = 0.0 + _149;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _153 * _135;
    bool _159 = _155 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _161 = isnan(_155);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _167 = _163 || _165;
    float _169 = in.m_44.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _155;
    if (!_167)
    {
        discard_fragment();
    }
    float _177 = _96 * _173;
    float2 _868 = float2(_143, _177);
    float2 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_868, float2(0.0), isnan(_868))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_868, float2(0.0), isnan(_868))).xy;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = in.m_48.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_46.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_46.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_48.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_46.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_48.z;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = _107 * _107;
    float _225 = _105 * _105;
    float _227 = _96 * _191;
    float _229 = _96 * _197;
    float _231 = _96 * _203;
    float _233 = _96 * _209;
    float _235 = _96 * _215;
    float _237 = _96 * _221;
    float _239 = _109 * _109;
    float _241 = -_227;
    float _243 = _229 + _241;
    float _245 = -_233;
    float _247 = _231 + _245;
    float _249 = -_237;
    float _251 = _235 + _249;
    float _253 = fma(_225, _243, _227);
    float _255 = fma(_223, _247, _233);
    float _257 = fma(_239, _251, _237);
    if (!_167)
    {
        out.m_53.x = _253;
        out.m_53.y = _255;
        out.m_53.z = _257;
        out.m_53.w = _149;
        return out;
    }
    float _259 = in.m_55.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_55.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_57.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_57.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_59.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_55.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_57.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_59.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_59.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = _185 * _185;
    float _315 = fma(_183, _183, _313);
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _96 * _263;
    float _321 = _96 * _269;
    float _323 = _96 * _275;
    float _325 = -_317;
    float _327 = _325 + 1.0;
    float _329 = _319 * _319;
    float _331 = _96 * _287;
    float _333 = _323 * _323;
    float _335 = _96 * _293;
    float _337 = fma(_321, _321, _329);
    float _339 = _96 * _281;
    float _341 = _96 * _299;
    float _343 = _96 * _305;
    float _345 = _331 * _331;
    float _347 = fma(_339, _339, _333);
    float _349 = fma(_335, _335, _337);
    float _351 = _96 * _311;
    float _353 = fma(_343, _343, _345);
    float _355 = fma(_341, _341, _347);
    float _357 = sqrt(_327);
    float _359 = in.m_61.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = fma(_351, _351, _353);
    float _367 = rsqrt(_355);
    float _369 = rsqrt(_349);
    float _371 = rsqrt(_365);
    float _373 = _185 * _367;
    float _375 = _339 * _373;
    float _377 = _183 * _369;
    float _379 = _323 * _373;
    float _381 = _341 * _373;
    float _383 = _96 * _363;
    float _385 = fma(_321, _377, _375);
    float _387 = fma(_319, _377, _379);
    float _389 = fma(_335, _377, _381);
    float _391 = _357 * _371;
    float _393 = in.m_63.x;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_61.w;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = fma(_331, _391, _387);
    float _407 = fma(_343, _391, _385);
    float _409 = fma(_351, _391, _389);
    float _411 = _405 * _405;
    float _413 = in.m_61.x;
    float _415 = gl_FragCoord.w;
    float _417 = _413 * _415;
    float _419 = fma(_407, _407, _411);
    float _421 = fma(_409, _409, _419);
    float _423 = rsqrt(_421);
    float _425 = _96 * _403;
    float _427 = _405 * _423;
    float _429 = _407 * _423;
    float _431 = 1.0 / _425;
    float _433 = _409 * _423;
    float _435 = _96 * _397;
    float _437 = _96 * _417;
    float _439 = abs(_429);
    float _441 = abs(_427);
    float _443 = precise::max(_439, _441);
    float _445 = abs(_433);
    float _447 = precise::max(_445, _443);
    float _449 = 1.0 / _447;
    float _451 = _437 * _431;
    float _453 = _383 * _431;
    float _455 = precise::min(_435, 1.0);
    float2 _1261 = float2(_451, _453);
    float _457 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1261, float2(0.0), isnan(_1261))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1261, float2(0.0), isnan(_1261))).x;
    float _459 = -_449;
    float _461 = _433 * _459;
    float _463 = _429 * _449;
    float _465 = _427 * _449;
    float3 _1281 = float3(_463, _465, _461);
    float3 _469 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1281, float3(0.0), isnan(_1281)), level(_455)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1281, float3(0.0), isnan(_1281)), level(_455)).xyz;
    float _471 = _469.x;
    float _473 = _469.y;
    float _475 = _469.z;
    float _477 = in.m_65.y;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_65.x;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_67.y;
    float _491 = in.m_67.x;
    float _493 = in.m_65.z;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = in.m_61.z;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    float _505 = in.m_67.z;
    float _507 = in.m_69.x;
    float _509 = in.m_71.x;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_71.w;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = _96 * _481;
    float _523 = _96 * _487;
    float _525 = in.m_73.z;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_73.y;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = -_489;
    float _539 = _521 + _537;
    float _541 = -_491;
    float _543 = _523 + _541;
    float _545 = _96 * _497;
    float _547 = _96 * _503;
    float _549 = _539 * _539;
    float _551 = -_505;
    float _553 = _545 + _551;
    float _555 = _547 * _431;
    float _557 = fma(_543, _543, _549);
    float _559 = in.m_73.w;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = _507 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _567 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _569 = fma(_555, (*spvDescriptorSet0.fp_c8)._m0[30].w, _567);
    float _571 = fma(_553, _553, _557);
    float _573 = in.m_75.z;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_73.x;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_75.x;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = -_571;
    float _593 = fma(_565, _565, _591);
    float _595 = 1.0 / _569;
    float _597 = in.m_75.y;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _605 = fma(_457, (*spvDescriptorSet0.fp_c8)._m0[30].w, _603);
    float _607 = precise::max(0.0, _593);
    float _609 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _611 = _595 * _609;
    float _613 = in.m_71.z;
    float _615 = gl_FragCoord.w;
    float _617 = _613 * _615;
    float _619 = 1.0 / _605;
    float _621 = _96 * _601;
    float _623 = sqrt(_607);
    float _625 = in.m_71.y;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _633 = -_611;
    float _635 = fma(_619, _631, _633);
    float _637 = _623 + _635;
    float _639 = _96 * _563;
    float _641 = _96 * _589;
    float _643 = -_639;
    float _645 = _643 + _637;
    float _647 = _645 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _649 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _651 = _96 * _519;
    float _653 = _647 * (-1.44269502162933349609375);
    float _655 = _96 * _583;
    float _657 = _96 * _529;
    float _659 = _96 * _629;
    float _661 = fma(_471, 0.20999999344348907470703125, _655);
    float _663 = exp2(_653);
    float _665 = _96 * _535;
    float _667 = _96 * _577;
    float _669 = fma(_475, 0.20999999344348907470703125, _657);
    float _671 = _661 + _641;
    float _673 = fma(_473, 0.20999999344348907470703125, _665);
    float _675 = _473;
    if (_649)
    {
        float _677 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _679 = _611 + _677;
        _675 = _679;
    }
    float _681 = _675;
    float _683 = _669 + _667;
    float _685 = _96 * _513;
    float _687 = _673 + _621;
    float _689 = _96 * _617;
    float _691 = _253 * _671;
    float _693 = _257 * _683;
    float _695 = _255 * _687;
    float _697 = fma(_691, _651, _685);
    float _699 = -_663;
    float _701 = _699 + 1.0;
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = fma(_695, _651, _659);
    float _707 = fma(_693, _651, _689);
    float _709 = _155 * _703;
    float _711 = precise::clamp(_709, 0.0, 1.0);
    float _713 = _711;
    if (_649)
    {
        float _715 = _681 * 8.0;
        float _717 = precise::clamp(_715, 0.0, 1.0);
        _175 = _717;
    }
    float _719 = _175;
    if (_649)
    {
        float _721 = _711 * _719;
        _713 = _721;
    }
    float _723 = _713;
    float _725 = 0.0 + _723;
    float _727 = precise::clamp(_725, 0.0, 1.0);
    out.m_53.x = _697;
    out.m_53.y = _705;
    out.m_53.z = _707;
    out.m_53.w = _727;
    return out;
}

