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
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_53 [[user(locn4), flat]];
    float4 m_51 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_47 [[user(locn7), flat]];
    float4 m_64 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_66 [[user(locn11)]];
    float4 m_74 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _81 = gl_FragCoord.w;
    float _83 = in.m_47.x;
    float _85 = in.m_49.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _93 = in.m_49.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_49.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_51.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_51.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_51.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_51.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = 1.0 / _81;
    float _131 = _83 + 1.0;
    float _133 = _131 * _91;
    float _135 = rint(_83);
    float _137 = precise::max(_135, 0.0);
    uint _140 = uint(_137);
    uint _142 = clamp(_140, 0u, 65535u);
    float _144 = floor(_133);
    float _146 = _129 * _89;
    float _148 = _129 * _109;
    float _150 = _129 * _115;
    float _152 = _129 * _121;
    float _154 = _129 * _127;
    float _156 = 1.0 / _146;
    float _158 = -_144;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c9)._m0[22].x, _131);
    float _162 = _129 * _97;
    float _164 = _129 * _103;
    float _166 = rint(_160);
    float _168 = precise::max(_166, 0.0);
    uint _170 = uint(_168);
    uint _172 = clamp(_170, 0u, 65535u);
    float _174 = _162 * _156;
    float _176 = _164 * _156;
    float2 _821 = float2(_174, _176);
    float _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_821, float2(0.0), isnan(_821))).x;
    float3 _834 = float3(_148, _152, float(int(_142)));
    float3 _838 = select(_834, float3(0.0), isnan(_834));
    float4 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _838.xy, uint(rint(_838.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _838.xy, uint(rint(_838.z))).xyzw;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _181.w;
    float3 _855 = float3(_148, _152, float(int(_172)));
    float3 _857 = select(_855, float3(0.0), isnan(_855));
    float4 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _857.xy, uint(rint(_857.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _857.xy, uint(rint(_857.z))).xyzw;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float _199 = _191.w;
    float2 _871 = float2(_150, _154);
    float4 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_871, float2(0.0), isnan(_871))).xyzw;
    float _203 = _201.x;
    float _205 = _201.y;
    float _207 = _201.z;
    float _209 = _201.w;
    float _211 = in.m_53.y;
    float _213 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _215 = in.m_49.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_55.w;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_57.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_59.x;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _211 * _213;
    float _241 = _129 * _219;
    float _243 = _239 * _213;
    float _245 = _241 * _156;
    float _247 = floor(_243);
    float _249 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _251 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[30].w, _249);
    float _253 = 1.0 / _251;
    float _255 = -_247;
    float _257 = fma(_255, (*spvDescriptorSet0.fp_c9)._m0[22].y, _239);
    float _259 = _257 + 9.9999997473787516355514526367188e-05;
    float _261 = floor(_259);
    float _263 = -_261;
    float _265 = _259 + _263;
    float _267 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _269 = _253 * _267;
    float _271 = in.m_55.z;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _279 = fma(_178, (*spvDescriptorSet0.fp_c8)._m0[30].w, _277);
    float _281 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _283 = -_189;
    float _285 = _283 + _199;
    float _287 = 1.0 / _279;
    float _289 = fma(_265, _285, _189);
    float _291 = _129 * _225;
    float _293 = _289 * _209;
    float _295 = _293 * _291;
    float _297 = _129 * _231;
    float _299 = _297 * _295;
    float _301 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _303 = -_269;
    float _305 = fma(_287, _301, _303);
    float _307 = 0.0 + _299;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _305 * _281;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = _129 * _237;
    float _317 = _309 * _313;
    float _319 = _317 * _315;
    bool _323 = _319 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _325 = isnan(_319);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _331 = _327 || _329;
    float _333 = in.m_55.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_57.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_55.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_57.y;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.z;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = _269;
    if (!_331)
    {
        discard_fragment();
    }
    float _365 = -_185;
    float _367 = _365 + _195;
    float _369 = -_183;
    float _371 = _369 + _193;
    float _373 = -_187;
    float _375 = _373 + _197;
    float _377 = _205 * _205;
    float _379 = fma(_265, _367, _185);
    float _381 = fma(_265, _371, _183);
    float _383 = _203 * _203;
    float _385 = fma(_265, _375, _187);
    float _387 = _379 * _379;
    float _389 = _381 * _381;
    float _391 = _129 * _275;
    float _393 = _385 * _385;
    float _395 = _387 * _377;
    float _397 = _389 * _383;
    float _399 = _207 * _207;
    float _401 = _129 * _337;
    float _403 = _129 * _343;
    float _405 = _129 * _349;
    float _407 = _129 * _355;
    float _409 = _129 * _361;
    float _411 = _393 * _399;
    float _413 = -_403;
    float _415 = _401 + _413;
    float _417 = -_407;
    float _419 = _405 + _417;
    float _421 = -_409;
    float _423 = _391 + _421;
    float _425 = fma(_397, _415, _403);
    float _427 = fma(_395, _419, _407);
    float _429 = fma(_411, _423, _409);
    if (!_331)
    {
        out.m_62.x = _425;
        out.m_62.y = _427;
        out.m_62.z = _429;
        out.m_62.w = _299;
        return out;
    }
    float _431 = in.m_64.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = in.m_64.x;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = in.m_64.z;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = _129 * _435;
    float _451 = _129 * _441;
    float _453 = _129 * _447;
    float _455 = _449 * _449;
    float _457 = in.m_66.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = fma(_451, _451, _455);
    float _465 = fma(_453, _453, _463);
    float _467 = rsqrt(_465);
    float _469 = _451 * _467;
    float _471 = _449 * _467;
    float _473 = _453 * _467;
    float _475 = _129 * _461;
    float _477 = abs(_469);
    float _479 = abs(_471);
    float _481 = precise::max(_477, _479);
    float _483 = precise::min(_475, 1.0);
    float _485 = abs(_473);
    float _487 = precise::max(_485, _481);
    float _489 = 1.0 / _487;
    float _491 = -_489;
    float _493 = _473 * _491;
    float _495 = _469 * _489;
    float _497 = _471 * _489;
    float3 _1298 = float3(_495, _497, _493);
    float3 _501 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1298, float3(0.0), isnan(_1298)), level(_483)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1298, float3(0.0), isnan(_1298)), level(_483)).xyz;
    float _503 = _501.x;
    float _505 = _501.y;
    float _507 = _501.z;
    float _509 = in.m_68.x;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_68.y;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_68.z;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_70.x;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_70.z;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = in.m_70.y;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_72.z;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = in.m_72.x;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_72.y;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = in.m_74.x;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = in.m_74.z;
    float _571 = gl_FragCoord.w;
    float _573 = _569 * _571;
    float _575 = in.m_74.w;
    float _577 = gl_FragCoord.w;
    float _579 = _575 * _577;
    float _581 = in.m_74.y;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    bool _587 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _589 = _129 * _513;
    float _591 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _593 = _591 + 1.0;
    float _595 = _129 * _519;
    float _597 = _129 * _525;
    float _599 = _129 * _531;
    float _601 = fma(_589, (*spvDescriptorSet0.fp_c13)._m0[0].y, _593);
    float _603 = fma(_595, (*spvDescriptorSet0.fp_c13)._m0[0].y, _593);
    float _605 = fma(_597, (*spvDescriptorSet0.fp_c13)._m0[0].y, _593);
    float _607 = _129 * _549;
    float _609 = _129 * _555;
    float _611 = _427 * _603;
    float _613 = precise::clamp(_611, 0.0, 1.0);
    float _615 = _129 * _537;
    float _617 = _429 * _605;
    float _619 = precise::clamp(_617, 0.0, 1.0);
    float _621 = _129 * _561;
    if (_587)
    {
        float _623 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _625 = _269 + _623;
        _363 = _625;
    }
    float _627 = _363;
    float _629 = _425 * _601;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    float _633 = _129 * _567;
    float _635 = _129 * _585;
    float _637 = _627;
    if (_587)
    {
        float _639 = _627 * 8.0;
        float _641 = precise::clamp(_639, 0.0, 1.0);
        _637 = _641;
    }
    float _643 = _637;
    float _645 = _129 * _573;
    float _647 = fma(_503, 0.20999999344348907470703125, _599);
    float _649 = _129 * _543;
    float _651 = fma(_507, 0.20999999344348907470703125, _615);
    float _653 = _129 * _579;
    float _655 = _647 + _609;
    float _657 = fma(_505, 0.20999999344348907470703125, _649);
    float _659 = _651 + _607;
    float _661 = 0.0 + _319;
    float _663 = precise::clamp(_661, 0.0, 1.0);
    float _665 = _631 * _655;
    float _667 = _657 + _621;
    float _669 = _619 * _659;
    float _671 = _663;
    if (_587)
    {
        float _673 = _663 * _643;
        _671 = _673;
    }
    float _675 = _671;
    float _677 = fma(_665, _653, _633);
    float _679 = _613 * _667;
    float _681 = fma(_669, _653, _645);
    float _683 = 0.0 + _675;
    float _685 = precise::clamp(_683, 0.0, 1.0);
    float _687 = fma(_679, _653, _635);
    out.m_62.x = _677;
    out.m_62.y = _687;
    out.m_62.z = _681;
    out.m_62.w = _685;
    return out;
}

