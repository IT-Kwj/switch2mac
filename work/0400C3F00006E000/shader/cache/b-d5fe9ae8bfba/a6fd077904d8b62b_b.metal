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
    constant _16* fp_c13 [[id(3)]];
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_57 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_49 [[user(locn9), flat]];
    float4 m_74 [[user(locn10), flat]];
    float4 m_62 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_76 [[user(locn13)]];
    float4 m_68 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _83 = in.m_43.x;
    float _85 = gl_FragCoord.w;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _89 = in.m_47.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _83 + 1.0;
    float _103 = 1.0 / _85;
    float _105 = _101 * _87;
    float _107 = floor(_105);
    float _109 = rint(_83);
    float _111 = precise::max(_109, 0.0);
    uint _114 = uint(_111);
    uint _116 = clamp(_114, 0u, 65535u);
    float _118 = _103 * _93;
    float _120 = -_107;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c9)._m0[22].x, _101);
    float _124 = _103 * _99;
    float _126 = rint(_122);
    float _128 = precise::max(_126, 0.0);
    uint _130 = uint(_128);
    uint _132 = clamp(_130, 0u, 65535u);
    float3 _818 = float3(_118, _124, float(int(_116)));
    float3 _822 = select(_818, float3(0.0), isnan(_818));
    float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _822.xy, uint(rint(_822.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _822.xy, uint(rint(_822.z))).xyzw;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    float3 _839 = float3(_118, _124, float(int(_132)));
    float3 _841 = select(_839, float3(0.0), isnan(_839));
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _841.xy, uint(rint(_841.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _841.xy, uint(rint(_841.z))).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float _155 = in.m_49.y;
    float _157 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _159 = in.m_51.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_53.w;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_55.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = _155 * _157;
    float _179 = _103 * _163;
    float _181 = _177 * _157;
    float _183 = _103 * _175;
    float _185 = floor(_181);
    float _187 = -_185;
    float _189 = fma(_187, (*spvDescriptorSet0.fp_c9)._m0[22].y, _177);
    float _191 = _103 * _169;
    float _193 = _189 + 9.9999997473787516355514526367188e-05;
    float _195 = floor(_193);
    float _197 = -_195;
    float _199 = _193 + _197;
    float _201 = in.m_57.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_57.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_53.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_53.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_53.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_51.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_51.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _103 * _205;
    float _245 = _243 * _243;
    float _247 = -_143;
    float _249 = _247 + _153;
    float _251 = fma(_199, _249, _143);
    float _253 = -_179;
    float _255 = _251 + _253;
    float _257 = _191 * _255;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = _259 * _183;
    bool _265 = _261 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _267 = isnan(_261);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _273 = _269 || _271;
    float _275 = in.m_57.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    if (!_273)
    {
        discard_fragment();
    }
    float _281 = in.m_51.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = -_141;
    float _289 = _287 + _151;
    float _291 = -_137;
    float _293 = _291 + _147;
    float _295 = fma(_199, _289, _141);
    float _297 = fma(_199, _293, _137);
    float _299 = _103 * _229;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    float _305 = -_297;
    float _307 = _305 + 1.0;
    float _309 = _103 * _279;
    float _311 = _103 * _211;
    float _313 = -_139;
    float _315 = _313 + _149;
    float _317 = fma(_309, _309, _245);
    float _319 = fma(_199, _315, _139);
    float _321 = _103 * _217;
    float _323 = fma(_311, _311, _317);
    float _325 = _103 * _223;
    float _327 = -_319;
    float _329 = _327 + 1.0;
    float _331 = _321 * _303;
    float _333 = _325 * _307;
    float _335 = rsqrt(_323);
    float _337 = _103 * _235;
    float _339 = _299 * _329;
    float _341 = _103 * _285;
    float _343 = _103 * _241;
    float _345 = fma(_297, _337, _333);
    float _347 = fma(_319, _341, _339);
    float _349 = fma(_295, _343, _331);
    float _351 = _309 * _335;
    float _353 = _243 * _335;
    float _355 = _311 * _335;
    if (!_273)
    {
        out.m_60.x = _345;
        out.m_60.y = _347;
        out.m_60.z = _349;
        out.m_60.w = _259;
        return out;
    }
    float _357 = in.m_62.w;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_62.x;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_62.y;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_64.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = abs(_351);
    float _383 = abs(_353);
    float _385 = precise::max(_381, _383);
    float _387 = abs(_355);
    float _389 = precise::max(_387, _385);
    float _391 = 1.0 / _389;
    float _393 = _353 * _391;
    float _395 = _103 * _361;
    float _397 = _103 * _367;
    float _399 = _103 * _373;
    float _401 = _103 * _379;
    float _403 = _351 * _391;
    float _405 = -_391;
    float _407 = _355 * _405;
    float _409 = 1.0 / _395;
    float _411 = precise::min(_401, 1.0);
    float _413 = _397 * _409;
    float _415 = _399 * _409;
    float2 _1219 = float2(_413, _415);
    float _417 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1219, float2(0.0), isnan(_1219))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1219, float2(0.0), isnan(_1219))).x;
    float3 _1230 = float3(_403, _393, _407);
    float3 _421 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1230, float3(0.0), isnan(_1230)), level(_411)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1230, float3(0.0), isnan(_1230)), level(_411)).xyz;
    float _423 = _421.x;
    float _425 = _421.y;
    float _427 = _421.z;
    float _429 = _353 * _353;
    float _431 = in.m_66.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_66.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_66.z;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = fma(_351, _351, _429);
    float _451 = in.m_62.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_49.x;
    float _459 = in.m_68.z;
    float _461 = fma(_355, _355, _449);
    float _463 = in.m_70.z;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = in.m_70.y;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = rsqrt(_461);
    float _477 = in.m_68.y;
    float _479 = in.m_68.x;
    float _481 = in.m_72.x;
    float _483 = gl_FragCoord.w;
    float _485 = _481 * _483;
    float _487 = _353 * _475;
    float _489 = -_487;
    float _491 = 0.0 + _489;
    float _493 = precise::clamp(_491, 0.0, 1.0);
    float _495 = _103 * _435;
    float _497 = fma(_487, -0.5, 0.5);
    float _499 = in.m_72.y;
    float _501 = gl_FragCoord.w;
    float _503 = _499 * _501;
    bool _505 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _507 = _103 * _455;
    float _509 = -_493;
    float _511 = _509 + _497;
    float _513 = -_457;
    float _515 = _513 + 1.0;
    float _517 = in.m_70.x;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = _507 * _409;
    float _525 = fma(_457, _511, _493);
    float _527 = _103 * _441;
    float _529 = -_477;
    float _531 = _495 + _529;
    float _533 = _525 * _515;
    float _535 = -_479;
    float _537 = _527 + _535;
    float _539 = in.m_74.x;
    float _541 = _103 * _447;
    float _543 = _533 * (*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _545 = _531 * _531;
    float _547 = in.m_70.w;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = -_459;
    float _555 = _541 + _553;
    float _557 = _543 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _559 = fma(_537, _537, _545);
    float _561 = _543 * (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _563 = _557 * 0.715200006961822509765625;
    float _565 = fma(_555, _555, _559);
    float _567 = _543 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _569 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _571 = fma(_523, (*spvDescriptorSet0.fp_c8)._m0[30].w, _569);
    float _573 = fma(_561, 0.2125999927520751953125, _563);
    float _575 = in.m_76.x;
    float _577 = gl_FragCoord.w;
    float _579 = _575 * _577;
    float _581 = in.m_76.z;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = fma(_567, 0.072200000286102294921875, _573);
    float _589 = 1.0 / _587;
    float _591 = _539 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _593 = -_565;
    float _595 = fma(_591, _591, _593);
    float _597 = _103 * _551;
    float _599 = 1.0 / _571;
    float _601 = _589 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = precise::max(0.0, _595);
    float _607 = in.m_76.y;
    float _609 = gl_FragCoord.w;
    float _611 = _607 * _609;
    float _613 = fma(_603, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _615 = _103 * _503;
    float _617 = sqrt(_605);
    float _619 = _561 * _613;
    float _621 = _557 * _613;
    float _623 = _567 * _613;
    float _625 = in.m_76.w;
    float _627 = gl_FragCoord.w;
    float _629 = _625 * _627;
    float _631 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _633 = _599 * _631;
    float _635 = _103 * _611;
    float _637 = _103 * _629;
    float _639 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _641 = fma(_417, (*spvDescriptorSet0.fp_c8)._m0[30].w, _639);
    float _643 = in.m_72.z;
    float _645 = gl_FragCoord.w;
    float _647 = _643 * _645;
    float _649 = 1.0 / _641;
    float _651 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _653 = -_633;
    float _655 = fma(_649, _651, _653);
    float _657 = _103 * _521;
    float _659 = _633;
    if (_505)
    {
        float _661 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _663 = _633 + _661;
        _659 = _663;
    }
    float _665 = _659;
    float _667 = _617 + _655;
    float _669 = _103 * _485;
    float _671 = _665;
    if (_505)
    {
        float _673 = _665 * 8.0;
        float _675 = precise::clamp(_673, 0.0, 1.0);
        _671 = _675;
    }
    float _677 = _671;
    float _679 = -_597;
    float _681 = _679 + _667;
    float _683 = _103 * _467;
    float _685 = _681 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _687 = _103 * _647;
    float _689 = fma(_427, 0.20999999344348907470703125, _683);
    float _691 = _685 * (-1.44269502162933349609375);
    float _693 = fma(_423, 0.20999999344348907470703125, _657);
    float _695 = _103 * _473;
    float _697 = _689 + _687;
    float _699 = _103 * _579;
    float _701 = _693 + _669;
    float _703 = exp2(_691);
    float _705 = fma(_425, 0.20999999344348907470703125, _695);
    float _707 = _103 * _585;
    float _709 = fma(_345, _701, _619);
    float _711 = fma(_349, _697, _623);
    float _713 = _705 + _615;
    float _715 = fma(_709, _637, _699);
    float _717 = fma(_711, _637, _707);
    float _719 = fma(_347, _713, _621);
    float _721 = fma(_719, _637, _635);
    float _723 = -_703;
    float _725 = _723 + 1.0;
    float _727 = precise::clamp(_725, 0.0, 1.0);
    float _729 = _261 * _727;
    float _731 = precise::clamp(_729, 0.0, 1.0);
    float _733 = _731;
    if (_505)
    {
        float _735 = _731 * _677;
        _733 = _735;
    }
    float _737 = _733;
    float _739 = 0.0 + _737;
    float _741 = precise::clamp(_739, 0.0, 1.0);
    out.m_60.x = _715;
    out.m_60.y = _721;
    out.m_60.z = _717;
    out.m_60.w = _741;
    return out;
}

