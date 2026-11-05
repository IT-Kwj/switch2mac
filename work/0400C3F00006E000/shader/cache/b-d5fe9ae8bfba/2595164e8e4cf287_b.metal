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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture3d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = gl_FragCoord.y;
    float _49 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _51 = _47 / _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = gl_FragCoord.x;
    float _67 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _69 = _65 / _67;
    float _71 = precise::max((*spvDescriptorSet0.fp_c4)._m0[2].y, -0.19750000536441802978515625);
    float _73 = _71 * 5.34962368011474609375;
    float _75 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = abs(_73);
    bool _81 = _77 > 1.0;
    float _83 = abs(_73);
    bool _85 = _83 > as_type<float>(0x7f800000u /* inf */);
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _93 = _89 || _91;
    float _95 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _97 = 0.0;
    if (_81)
    {
        float _99 = abs(_73);
        float _101 = 1.0 / _99;
        _97 = _101;
    }
    float _103 = _97;
    float _105 = 0.0;
    if (!_81)
    {
        float _107 = abs(_73);
        float _109 = (-0.0) + _107;
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _51 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _117 = _115 + 1.0;
    float _119 = fma(_113, 2.0, -1.0);
    float _121 = _113;
    float _123 = _111;
    if (!_81)
    {
        _121 = _111;
    }
    float _125 = _121;
    float _127 = 1.0 / _45;
    float _129 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    int _132 = as_type<int>(_73) & int(0x80000000);
    float _134 = _129 * 1.57079637050628662109375;
    float _136 = _125;
    float _138 = _134;
    if (_81)
    {
        _136 = _103;
    }
    float _140 = _136;
    float _142 = _134 * 0.15915493667125701904296875;
    float _144 = _140 * _140;
    float _146 = _142 * 6.283185482025146484375;
    float _148 = sin(_146);
    float _150 = _127 * _57;
    float _152 = _127 * _63;
    float _154 = _144 + 11.33538818359375;
    float _156 = precise::max(_119, _150);
    float _158 = _152 * _152;
    float _160 = fma(_144, _154, 28.84246826171875);
    float _162 = _152 * _156;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _164;
    float _168 = -_75;
    float _170 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _168);
    float _172 = -_75;
    float _174 = _172 + _158;
    float _176 = -_158;
    float _178 = fma(_162, _162, _176);
    float _180 = fma(_144, _160, 19.6966705322265625);
    float _182 = sqrt(_170);
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = _152 + _184;
    float _188 = -_75;
    bool _190 = _178 > _188;
    float _192 = _75 + _178;
    float _194 = fma(_144, -0.82336294651031494140625, -5.674867153167724609375);
    bool _196 = _162 < 0.0;
    bool _198 = _196 && _190;
    float _200 = sqrt(_174);
    float _202 = fma(_144, _194, -6.565555095672607421875);
    float _204 = _144 * _202;
    float _206 = 1.0 / _180;
    float _208 = _204 * _140;
    float _210 = _154;
    float _212 = _158;
    float _214 = _140;
    if (_198)
    {
        _210 = 0.0;
    }
    float _216 = _210;
    float _218 = 0.0;
    float _220 = _216;
    if (_198)
    {
        float _222 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _224 = fma(_222, 0.5, 0.5);
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_198)
    {
        _220 = _170;
    }
    float _230 = _220;
    float _232 = 0.0;
    if (!_198)
    {
        float _234 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _232 = _234;
    }
    float _236 = _232;
    float _238 = 1.0 / _166;
    if (_198)
    {
        _212 = 1.0;
    }
    float _240 = _212;
    float _242 = _192 + _230;
    float _244 = _240;
    if (!_198)
    {
        _244 = -1.0;
    }
    float _246 = _244;
    if (_198)
    {
        _138 = 0.0;
    }
    float _248 = _138;
    float _250 = sqrt(_242);
    float _252 = _248;
    if (!_198)
    {
        _252 = _182;
    }
    float _254 = _252;
    float _256 = fma(_208, _206, _140);
    int _258 = as_type<int>(_256);
    if (_198)
    {
        _214 = _226;
    }
    float _260 = _214;
    float _262 = _260;
    if (!_198)
    {
        _262 = _236;
    }
    float _264 = _262;
    float _266 = _200 + _254;
    if (_81)
    {
        float _268 = -_256;
        float _270 = _268 + 1.57079637050628662109375;
        _258 = as_type<int>(_270);
    }
    int _272 = _258;
    float _274 = _186 * _238;
    float _276 = 1.0 / _266;
    float _278 = as_type<float>(_272);
    if (!_93)
    {
        int _280 = _132 | _272;
        _278 = as_type<float>(_280);
    }
    float _282 = _278;
    float _284 = fma(_162, _246, _250);
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _288 = fma(0.454545438289642333984375, _282, 0.37000000476837158203125);
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _292 = _290 + 0.5;
    float _294 = _148 * _286;
    float _296 = fma(_288, _117, _95);
    float _298 = floor(_294);
    float _300 = _284 * _276;
    float _302 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _304 = _302 + 1.0;
    float _306 = _274 * _304;
    float _308 = fma(_300, _292, _264);
    float _310 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _306);
    float _312 = _296 + _298;
    float _314 = _312 + 1.0;
    float _316 = _312 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1125 = float3(_316, _308, _310);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1125, float3(0.0), isnan(_1125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1125, float3(0.0), isnan(_1125))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float3 _1144 = float3(_318, _308, _310);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1144, float3(0.0), isnan(_1144))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1144, float3(0.0), isnan(_1144))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float _341 = fma(_148, 2.0, -1.0);
    float _343 = in.m_35.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    bool _349 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _351 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _353 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
    float _355 = _351 + 1.0;
    float _357 = -_353;
    float _359 = fma(_341, _357, _355);
    float _361 = abs(_359);
    float _363 = log2(_361);
    float _365 = _127 * _347;
    float _367 = _363 * 1.5;
    float _369 = -_298;
    float _371 = _294 + _369;
    float _373 = _351 + 2.0;
    bool _375 = _119 >= _365;
    bool _377 = isnan(_119);
    bool _379 = _375 || _377;
    bool _381 = isnan(_365);
    bool _383 = _379 || _381;
    int _385 = _383 ? 1065353216 : 0;
    float _387 = exp2(_367);
    float _389 = _373 * _387;
    float _391 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _393 = 1.0 / _389;
    float _395 = -_323;
    float _397 = _395 + _333;
    float _399 = _341 * _341;
    float _401 = -_325;
    float _403 = _401 + _335;
    float _405 = -_327;
    float _407 = _405 + _337;
    float _409 = fma(_371, _397, _323);
    float _411 = -_351;
    float _413 = _411 + 1.0;
    float _415 = _399 + 1.0;
    float _417 = fma(_371, _403, _325);
    float _419 = fma(_371, _407, _327);
    float _421 = _391 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _423 = _413 * _415;
    float _425 = precise::max(0.0, _417);
    float _427 = _423 * 0.119366206228733062744140625;
    float _429 = precise::max(0.0, _409);
    float _431 = -_329;
    float _433 = _431 + _339;
    float _435 = precise::max(0.0, _419);
    float _437 = _427 * _393;
    float _439 = precise::max(_429, 9.9999997473787516355514526367188e-05);
    float _441 = fma(_371, _433, _329);
    float _443 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _445 = _437 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _447 = precise::max(0.0, _441);
    float _449 = fma(_399, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _451 = 1.0 / _439;
    float _453 = _449 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _455 = _443 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _457 = _447 * _451;
    float _459 = _425 * _457;
    float _461 = _435 * _457;
    float _463 = _429 * _457;
    float _465 = _459 * _421;
    float _467 = _461 * _455;
    float _469 = _445 * _463;
    float _471 = _445 * _465;
    float _473 = _445 * _467;
    float _475 = fma(_453, _429, _469);
    float _477 = fma(_453, _425, _471);
    float _479 = fma(_453, _435, _473);
    float _481 = precise::max(0.0, _475);
    float _483 = precise::max(0.0, _477);
    float _485 = precise::max(0.0, _479);
    float _487 = _481 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _489 = _483 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _491 = _485 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _493 = _435;
    if (!_349)
    {
        out.m_38.x = _487;
        out.m_38.y = _489;
        out.m_38.z = _491;
        out.m_38.w = as_type<float>(_385);
        return out;
    }
    if (_81)
    {
        _123 = _103;
    }
    float _495 = _123;
    float _497 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (!_198)
    {
        _228 = _236;
    }
    float _499 = _228;
    float _501 = _495 * _495;
    float _503 = floor(_497);
    float _505 = _501 + 11.33538818359375;
    float _507 = fma(_501, -0.82336294651031494140625, -5.674867153167724609375);
    float _509 = fma(_501, _505, 28.84246826171875);
    float _511 = fma(_501, _507, -6.565555095672607421875);
    float _513 = _505;
    if (_198)
    {
        _513 = 0.0;
        _493 = 0.0;
    }
    float _515 = _513;
    float _517 = _493;
    float _519 = fma(_501, _509, 19.6966705322265625);
    float _521 = _515;
    float _523 = _517;
    if (!_198)
    {
        _521 = _170;
    }
    float _525 = _521;
    float _527 = _501 * _511;
    if (!_198)
    {
        _523 = _182;
    }
    float _529 = _523;
    float _531 = 1.0 / _519;
    float _533 = _527 * _495;
    float _535 = _192 + _525;
    float _537 = _200 + _529;
    float _539 = _529;
    if (_198)
    {
        _539 = 1.0;
    }
    float _541 = _539;
    float _543 = _541;
    if (!_198)
    {
        _543 = -1.0;
    }
    float _545 = _543;
    float _547 = sqrt(_535);
    float _549 = fma(_533, _531, _495);
    float _551 = 1.0 / _537;
    int _553 = as_type<int>(_549);
    if (_81)
    {
        float _555 = -_549;
        float _557 = _555 + 1.57079637050628662109375;
        _553 = as_type<int>(_557);
    }
    int _559 = _553;
    float _561 = fma(_162, _545, _547);
    float _563 = as_type<float>(_559);
    if (!_93)
    {
        int _565 = _132 | _559;
        _563 = as_type<float>(_565);
    }
    float _567 = _563;
    float _569 = fma(0.454545438289642333984375, _567, 0.37000000476837158203125);
    float _571 = _561 * _551;
    float _573 = fma(_117, _569, _95);
    float _575 = fma(_292, _571, _499);
    float _577 = _573 + _503;
    float _579 = _577 + 1.0;
    float _581 = _577 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _583 = _579 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1533 = float3(_581, _575, _310);
    float4 _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1533, float3(0.0), isnan(_1533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1533, float3(0.0), isnan(_1533))).xyzw;
    float _587 = _585.x;
    float _589 = _585.y;
    float _591 = _585.z;
    float _593 = _585.w;
    float3 _1550 = float3(_583, _575, _310);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1550, float3(0.0), isnan(_1550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1550, float3(0.0), isnan(_1550))).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = abs(_355);
    float _607 = log2(_605);
    float _609 = -_503;
    float _611 = _497 + _609;
    float _613 = fma(_351, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _615 = _607 * 1.5;
    float _617 = exp2(_615);
    float _619 = _373 * _617;
    float _621 = 1.0 / _619;
    float _623 = _613 * _621;
    float _625 = _623 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _627 = -_587;
    float _629 = _627 + _597;
    float _631 = -_593;
    float _633 = _631 + _603;
    float _635 = -_589;
    float _637 = _635 + _599;
    float _639 = fma(_611, _629, _587);
    float _641 = fma(_611, _633, _593);
    float _643 = -_591;
    float _645 = _643 + _601;
    float _647 = fma(_611, _637, _589);
    float _649 = precise::max(0.0, _639);
    float _651 = fma(_611, _645, _591);
    float _653 = precise::max(0.0, _641);
    float _655 = precise::max(_649, 9.9999997473787516355514526367188e-05);
    float _657 = precise::max(0.0, _647);
    float _659 = precise::max(0.0, _651);
    float _661 = 1.0 / _655;
    float _663 = _653 * _661;
    float _665 = _657 * _663;
    float _667 = _659 * _663;
    float _669 = _649 * _663;
    float _671 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _673 = _421 * _665;
    float _675 = _455 * _667;
    float _677 = _625 * _669;
    float _679 = _625 * _673;
    float _681 = _625 * _675;
    float _683 = fma(_649, _671, _677);
    float _685 = fma(_657, _671, _679);
    float _687 = fma(_659, _671, _681);
    float _689 = precise::max(0.0, _683);
    float _691 = precise::max(0.0, _685);
    float _693 = precise::max(0.0, _687);
    float _695 = -_487;
    float _697 = fma(_689, (*spvDescriptorSet0.fp_c4)._m0[3].x, _695);
    float _699 = -_489;
    float _701 = fma(_691, (*spvDescriptorSet0.fp_c4)._m0[3].y, _699);
    float _703 = -_491;
    float _705 = fma(_693, (*spvDescriptorSet0.fp_c4)._m0[3].z, _703);
    float _707 = fma(_697, (*spvDescriptorSet0.fp_c4)._m0[7].x, _487);
    float _709 = fma(_701, (*spvDescriptorSet0.fp_c4)._m0[7].x, _489);
    float _711 = fma(_705, (*spvDescriptorSet0.fp_c4)._m0[7].x, _491);
    out.m_38.x = _707;
    out.m_38.y = _709;
    out.m_38.z = _711;
    out.m_38.w = as_type<float>(_385);
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = gl_FragCoord.y;
    float _49 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _51 = _47 / _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = gl_FragCoord.x;
    float _67 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _69 = _65 / _67;
    float _71 = precise::max((*spvDescriptorSet0.fp_c4)._m0[2].y, -0.19750000536441802978515625);
    float _73 = _71 * 5.34962368011474609375;
    float _75 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = abs(_73);
    bool _81 = _77 > 1.0;
    float _83 = abs(_73);
    bool _85 = _83 > as_type<float>(0x7f800000u /* inf */);
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _93 = _89 || _91;
    float _95 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _97 = 0.0;
    if (_81)
    {
        float _99 = abs(_73);
        float _101 = 1.0 / _99;
        _97 = _101;
    }
    float _103 = _97;
    float _105 = 0.0;
    if (!_81)
    {
        float _107 = abs(_73);
        float _109 = (-0.0) + _107;
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _51 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _117 = _115 + 1.0;
    float _119 = fma(_113, 2.0, -1.0);
    float _121 = _113;
    float _123 = _111;
    if (!_81)
    {
        _121 = _111;
    }
    float _125 = _121;
    float _127 = 1.0 / _45;
    float _129 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    int _132 = as_type<int>(_73) & int(0x80000000);
    float _134 = _129 * 1.57079637050628662109375;
    float _136 = _125;
    float _138 = _134;
    if (_81)
    {
        _136 = _103;
    }
    float _140 = _136;
    float _142 = _134 * 0.15915493667125701904296875;
    float _144 = _140 * _140;
    float _146 = _142 * 6.283185482025146484375;
    float _148 = sin(_146);
    float _150 = _127 * _57;
    float _152 = _127 * _63;
    float _154 = _144 + 11.33538818359375;
    float _156 = precise::max(_119, _150);
    float _158 = _152 * _152;
    float _160 = fma(_144, _154, 28.84246826171875);
    float _162 = _152 * _156;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _164;
    float _168 = -_75;
    float _170 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _168);
    float _172 = -_75;
    float _174 = _172 + _158;
    float _176 = -_158;
    float _178 = fma(_162, _162, _176);
    float _180 = fma(_144, _160, 19.6966705322265625);
    float _182 = sqrt(_170);
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = _152 + _184;
    float _188 = -_75;
    bool _190 = _178 > _188;
    float _192 = _75 + _178;
    float _194 = fma(_144, -0.82336294651031494140625, -5.674867153167724609375);
    bool _196 = _162 < 0.0;
    bool _198 = _196 && _190;
    float _200 = sqrt(_174);
    float _202 = fma(_144, _194, -6.565555095672607421875);
    float _204 = _144 * _202;
    float _206 = 1.0 / _180;
    float _208 = _204 * _140;
    float _210 = _154;
    float _212 = _158;
    float _214 = _140;
    if (_198)
    {
        _210 = 0.0;
    }
    float _216 = _210;
    float _218 = 0.0;
    float _220 = _216;
    if (_198)
    {
        float _222 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _224 = fma(_222, 0.5, 0.5);
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_198)
    {
        _220 = _170;
    }
    float _230 = _220;
    float _232 = 0.0;
    if (!_198)
    {
        float _234 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _232 = _234;
    }
    float _236 = _232;
    float _238 = 1.0 / _166;
    if (_198)
    {
        _212 = 1.0;
    }
    float _240 = _212;
    float _242 = _192 + _230;
    float _244 = _240;
    if (!_198)
    {
        _244 = -1.0;
    }
    float _246 = _244;
    if (_198)
    {
        _138 = 0.0;
    }
    float _248 = _138;
    float _250 = sqrt(_242);
    float _252 = _248;
    if (!_198)
    {
        _252 = _182;
    }
    float _254 = _252;
    float _256 = fma(_208, _206, _140);
    int _258 = as_type<int>(_256);
    if (_198)
    {
        _214 = _226;
    }
    float _260 = _214;
    float _262 = _260;
    if (!_198)
    {
        _262 = _236;
    }
    float _264 = _262;
    float _266 = _200 + _254;
    if (_81)
    {
        float _268 = -_256;
        float _270 = _268 + 1.57079637050628662109375;
        _258 = as_type<int>(_270);
    }
    int _272 = _258;
    float _274 = _186 * _238;
    float _276 = 1.0 / _266;
    float _278 = as_type<float>(_272);
    if (!_93)
    {
        int _280 = _132 | _272;
        _278 = as_type<float>(_280);
    }
    float _282 = _278;
    float _284 = fma(_162, _246, _250);
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _288 = fma(0.454545438289642333984375, _282, 0.37000000476837158203125);
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _292 = _290 + 0.5;
    float _294 = _148 * _286;
    float _296 = fma(_288, _117, _95);
    float _298 = floor(_294);
    float _300 = _284 * _276;
    float _302 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _304 = _302 + 1.0;
    float _306 = _274 * _304;
    float _308 = fma(_300, _292, _264);
    float _310 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _306);
    float _312 = _296 + _298;
    float _314 = _312 + 1.0;
    float _316 = _312 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1125 = float3(_316, _308, _310);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1125, float3(0.0), isnan(_1125))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1125, float3(0.0), isnan(_1125))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float3 _1144 = float3(_318, _308, _310);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1144, float3(0.0), isnan(_1144))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1144, float3(0.0), isnan(_1144))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float _341 = fma(_148, 2.0, -1.0);
    float _343 = in.m_35.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    bool _349 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _351 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _353 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
    float _355 = _351 + 1.0;
    float _357 = -_353;
    float _359 = fma(_341, _357, _355);
    float _361 = abs(_359);
    float _363 = log2(_361);
    float _365 = _127 * _347;
    float _367 = _363 * 1.5;
    float _369 = -_298;
    float _371 = _294 + _369;
    float _373 = _351 + 2.0;
    bool _375 = _119 >= _365;
    bool _377 = isnan(_119);
    bool _379 = _375 || _377;
    bool _381 = isnan(_365);
    bool _383 = _379 || _381;
    int _385 = _383 ? 1065353216 : 0;
    float _387 = exp2(_367);
    float _389 = _373 * _387;
    float _391 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _393 = 1.0 / _389;
    float _395 = -_323;
    float _397 = _395 + _333;
    float _399 = _341 * _341;
    float _401 = -_325;
    float _403 = _401 + _335;
    float _405 = -_327;
    float _407 = _405 + _337;
    float _409 = fma(_371, _397, _323);
    float _411 = -_351;
    float _413 = _411 + 1.0;
    float _415 = _399 + 1.0;
    float _417 = fma(_371, _403, _325);
    float _419 = fma(_371, _407, _327);
    float _421 = _391 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _423 = _413 * _415;
    float _425 = precise::max(0.0, _417);
    float _427 = _423 * 0.119366206228733062744140625;
    float _429 = precise::max(0.0, _409);
    float _431 = -_329;
    float _433 = _431 + _339;
    float _435 = precise::max(0.0, _419);
    float _437 = _427 * _393;
    float _439 = precise::max(_429, 9.9999997473787516355514526367188e-05);
    float _441 = fma(_371, _433, _329);
    float _443 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _445 = _437 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _447 = precise::max(0.0, _441);
    float _449 = fma(_399, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _451 = 1.0 / _439;
    float _453 = _449 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _455 = _443 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _457 = _447 * _451;
    float _459 = _425 * _457;
    float _461 = _435 * _457;
    float _463 = _429 * _457;
    float _465 = _459 * _421;
    float _467 = _461 * _455;
    float _469 = _445 * _463;
    float _471 = _445 * _465;
    float _473 = _445 * _467;
    float _475 = fma(_453, _429, _469);
    float _477 = fma(_453, _425, _471);
    float _479 = fma(_453, _435, _473);
    float _481 = precise::max(0.0, _475);
    float _483 = precise::max(0.0, _477);
    float _485 = precise::max(0.0, _479);
    float _487 = _481 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _489 = _483 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _491 = _485 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _493 = _435;
    if (!_349)
    {
        out.m_38.x = _487;
        out.m_38.y = _489;
        out.m_38.z = _491;
        out.m_38.w = as_type<float>(_385);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (_81)
    {
        _123 = _103;
    }
    float _495 = _123;
    float _497 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (!_198)
    {
        _228 = _236;
    }
    float _499 = _228;
    float _501 = _495 * _495;
    float _503 = floor(_497);
    float _505 = _501 + 11.33538818359375;
    float _507 = fma(_501, -0.82336294651031494140625, -5.674867153167724609375);
    float _509 = fma(_501, _505, 28.84246826171875);
    float _511 = fma(_501, _507, -6.565555095672607421875);
    float _513 = _505;
    if (_198)
    {
        _513 = 0.0;
        _493 = 0.0;
    }
    float _515 = _513;
    float _517 = _493;
    float _519 = fma(_501, _509, 19.6966705322265625);
    float _521 = _515;
    float _523 = _517;
    if (!_198)
    {
        _521 = _170;
    }
    float _525 = _521;
    float _527 = _501 * _511;
    if (!_198)
    {
        _523 = _182;
    }
    float _529 = _523;
    float _531 = 1.0 / _519;
    float _533 = _527 * _495;
    float _535 = _192 + _525;
    float _537 = _200 + _529;
    float _539 = _529;
    if (_198)
    {
        _539 = 1.0;
    }
    float _541 = _539;
    float _543 = _541;
    if (!_198)
    {
        _543 = -1.0;
    }
    float _545 = _543;
    float _547 = sqrt(_535);
    float _549 = fma(_533, _531, _495);
    float _551 = 1.0 / _537;
    int _553 = as_type<int>(_549);
    if (_81)
    {
        float _555 = -_549;
        float _557 = _555 + 1.57079637050628662109375;
        _553 = as_type<int>(_557);
    }
    int _559 = _553;
    float _561 = fma(_162, _545, _547);
    float _563 = as_type<float>(_559);
    if (!_93)
    {
        int _565 = _132 | _559;
        _563 = as_type<float>(_565);
    }
    float _567 = _563;
    float _569 = fma(0.454545438289642333984375, _567, 0.37000000476837158203125);
    float _571 = _561 * _551;
    float _573 = fma(_117, _569, _95);
    float _575 = fma(_292, _571, _499);
    float _577 = _573 + _503;
    float _579 = _577 + 1.0;
    float _581 = _577 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _583 = _579 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1533 = float3(_581, _575, _310);
    float4 _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1533, float3(0.0), isnan(_1533))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1533, float3(0.0), isnan(_1533))).xyzw;
    float _587 = _585.x;
    float _589 = _585.y;
    float _591 = _585.z;
    float _593 = _585.w;
    float3 _1550 = float3(_583, _575, _310);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1550, float3(0.0), isnan(_1550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1550, float3(0.0), isnan(_1550))).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = abs(_355);
    float _607 = log2(_605);
    float _609 = -_503;
    float _611 = _497 + _609;
    float _613 = fma(_351, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _615 = _607 * 1.5;
    float _617 = exp2(_615);
    float _619 = _373 * _617;
    float _621 = 1.0 / _619;
    float _623 = _613 * _621;
    float _625 = _623 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _627 = -_587;
    float _629 = _627 + _597;
    float _631 = -_593;
    float _633 = _631 + _603;
    float _635 = -_589;
    float _637 = _635 + _599;
    float _639 = fma(_611, _629, _587);
    float _641 = fma(_611, _633, _593);
    float _643 = -_591;
    float _645 = _643 + _601;
    float _647 = fma(_611, _637, _589);
    float _649 = precise::max(0.0, _639);
    float _651 = fma(_611, _645, _591);
    float _653 = precise::max(0.0, _641);
    float _655 = precise::max(_649, 9.9999997473787516355514526367188e-05);
    float _657 = precise::max(0.0, _647);
    float _659 = precise::max(0.0, _651);
    float _661 = 1.0 / _655;
    float _663 = _653 * _661;
    float _665 = _657 * _663;
    float _667 = _659 * _663;
    float _669 = _649 * _663;
    float _671 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _673 = _421 * _665;
    float _675 = _455 * _667;
    float _677 = _625 * _669;
    float _679 = _625 * _673;
    float _681 = _625 * _675;
    float _683 = fma(_649, _671, _677);
    float _685 = fma(_657, _671, _679);
    float _687 = fma(_659, _671, _681);
    float _689 = precise::max(0.0, _683);
    float _691 = precise::max(0.0, _685);
    float _693 = precise::max(0.0, _687);
    float _695 = -_487;
    float _697 = fma(_689, (*spvDescriptorSet0.fp_c4)._m0[3].x, _695);
    float _699 = -_489;
    float _701 = fma(_691, (*spvDescriptorSet0.fp_c4)._m0[3].y, _699);
    float _703 = -_491;
    float _705 = fma(_693, (*spvDescriptorSet0.fp_c4)._m0[3].z, _703);
    float _707 = fma(_697, (*spvDescriptorSet0.fp_c4)._m0[7].x, _487);
    float _709 = fma(_701, (*spvDescriptorSet0.fp_c4)._m0[7].x, _489);
    float _711 = fma(_705, (*spvDescriptorSet0.fp_c4)._m0[7].x, _491);
    out.m_38.x = _707;
    out.m_38.y = _709;
    out.m_38.z = _711;
    out.m_38.w = as_type<float>(_385);
    return main0_out_u{as_type<uint4>(out.m_38)};
}

