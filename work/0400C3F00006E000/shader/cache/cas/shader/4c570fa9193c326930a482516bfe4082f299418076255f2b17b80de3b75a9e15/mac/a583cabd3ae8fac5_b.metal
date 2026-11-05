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
    float _121 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _123 = 1.0 / _45;
    int _126 = as_type<int>(_73) & int(0x80000000);
    float _128 = _123 * _57;
    float _130 = _123 * _63;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _134 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _132;
    float _136 = -_75;
    float _138 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _136);
    float _140 = precise::max(_119, _128);
    float _142 = _130 * _130;
    float _144 = sqrt(_138);
    float _146 = _130 * _140;
    float _148 = _140;
    float _150 = _142;
    float _152 = _111;
    if (!_81)
    {
        _148 = _111;
    }
    float _154 = _148;
    float _156 = -_75;
    float _158 = _156 + _142;
    float _160 = _154;
    if (_81)
    {
        _160 = _103;
    }
    float _162 = _160;
    float _164 = -_142;
    float _166 = fma(_146, _146, _164);
    float _168 = 1.0 / _134;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _172 = _130 + _170;
    float _174 = _162 * _162;
    float _176 = -_75;
    bool _178 = _166 > _176;
    float _180 = _75 + _166;
    float _182 = _174 + 11.33538818359375;
    bool _184 = _146 < 0.0;
    bool _186 = _184 && _178;
    float _188 = sqrt(_158);
    float _190 = fma(_174, _182, 28.84246826171875);
    float _192 = fma(_174, _190, 19.6966705322265625);
    float _194 = fma(_174, -0.82336294651031494140625, -5.674867153167724609375);
    float _196 = _172 * _168;
    float _198 = fma(_174, _194, -6.565555095672607421875);
    float _200 = _182;
    float _202 = _174;
    float _204 = _162;
    if (_186)
    {
        _200 = 0.0;
        _150 = 0.0;
    }
    float _206 = _200;
    float _208 = _150;
    float _210 = 1.0 / _192;
    float _212 = _206;
    float _214 = _208;
    if (!_186)
    {
        _212 = _138;
    }
    float _216 = _212;
    float _218 = _174 * _198;
    if (_186)
    {
        _202 = 1.0;
    }
    float _220 = _202;
    float _222 = 0.0;
    float _224 = _220;
    if (_186)
    {
        float _226 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _228 = fma(_226, 0.5, 0.5);
        _222 = _228;
    }
    float _230 = _222;
    float _232 = _230;
    if (!_186)
    {
        _224 = -1.0;
    }
    float _234 = _224;
    float _236 = _180 + _216;
    float _238 = _121 * 1.57079637050628662109375;
    if (!_186)
    {
        _214 = _144;
    }
    float _240 = _214;
    float _242 = _218 * _162;
    float _244 = sqrt(_236);
    float _246 = _238 * 0.15915493667125701904296875;
    float _248 = 0.0;
    if (!_186)
    {
        float _250 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _248 = _250;
    }
    float _252 = _248;
    float _254 = _188 + _240;
    float _256 = fma(_242, _210, _162);
    float _258 = _246 * 6.283185482025146484375;
    float _260 = sin(_258);
    int _262 = as_type<int>(_256);
    if (_186)
    {
        _204 = _230;
    }
    float _264 = _204;
    float _266 = _264;
    if (_81)
    {
        float _268 = -_256;
        float _270 = _268 + 1.57079637050628662109375;
        _262 = as_type<int>(_270);
    }
    int _272 = _262;
    float _274 = as_type<float>(_272);
    if (!_186)
    {
        _266 = _252;
    }
    float _276 = _266;
    if (!_93)
    {
        int _278 = _126 | _272;
        _274 = as_type<float>(_278);
    }
    float _280 = _274;
    float _282 = fma(_146, _234, _244);
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _286 = 1.0 / _254;
    float _288 = fma(0.454545438289642333984375, _280, 0.37000000476837158203125);
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _292 = _290 + 0.5;
    float _294 = _260 * _284;
    float _296 = fma(_288, _117, _95);
    float _298 = floor(_294);
    float _300 = _282 * _286;
    float _302 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _304 = _302 + 1.0;
    float _306 = _196 * _304;
    float _308 = fma(_300, _292, _276);
    float _310 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _306);
    float _312 = _296 + _298;
    float _314 = _312 + 1.0;
    float _316 = _312 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1138 = float3(_316, _308, _310);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1138, float3(0.0), isnan(_1138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1138, float3(0.0), isnan(_1138))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float3 _1157 = float3(_318, _308, _310);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1157, float3(0.0), isnan(_1157))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1157, float3(0.0), isnan(_1157))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float _341 = fma(_113, 2.0, -0.25);
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = fma(_121, 2.0, -0.25);
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = fma(_260, 2.0, -1.0);
    float _351 = in.m_35.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = -_298;
    float _359 = _294 + _357;
    bool _361 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _363 = precise::max(_347, _343);
    float _365 = _363 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _367 = fma(_365, _365, 1.0);
    float _369 = _365 * 2.0;
    float _371 = -_369;
    float _373 = fma(_349, _371, _367);
    float _375 = fma(_365, _365, 2.0);
    float _377 = -_365;
    float _379 = fma(_377, _365, 1.0);
    float _381 = abs(_373);
    float _383 = log2(_381);
    float _385 = _383 * 1.5;
    float _387 = exp2(_385);
    float _389 = _375 * _387;
    float _391 = _123 * _355;
    float _393 = _349 * _349;
    float _395 = 1.0 / _389;
    float _397 = _393 + 1.0;
    bool _399 = _119 >= _391;
    bool _401 = isnan(_119);
    bool _403 = _399 || _401;
    bool _405 = isnan(_391);
    bool _407 = _403 || _405;
    int _409 = _407 ? 1065353216 : 0;
    float _411 = _379 * _397;
    float _413 = _411 * 0.119366206228733062744140625;
    float _415 = fma(_393, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _417 = _413 * _395;
    float _419 = _415 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _421 = _417 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _423 = -_323;
    float _425 = _423 + _333;
    float _427 = -_329;
    float _429 = _427 + _339;
    float _431 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _433 = -_325;
    float _435 = _433 + _335;
    float _437 = fma(_359, _425, _323);
    float _439 = fma(_359, _429, _329);
    float _441 = -_327;
    float _443 = _441 + _337;
    float _445 = fma(_359, _435, _325);
    float _447 = precise::max(0.0, _437);
    float _449 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _451 = fma(_359, _443, _327);
    float _453 = precise::max(0.0, _439);
    float _455 = precise::max(_447, 9.9999997473787516355514526367188e-05);
    float _457 = precise::max(0.0, _445);
    float _459 = precise::max(0.0, _451);
    float _461 = _431 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _463 = 1.0 / _455;
    float _465 = _449 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _467 = _453 * _463;
    float _469 = _457 * _467;
    float _471 = _459 * _467;
    float _473 = _447 * _467;
    float _475 = _469 * _461;
    float _477 = _471 * _465;
    float _479 = _421 * _473;
    float _481 = _421 * _475;
    float _483 = _421 * _477;
    float _485 = fma(_419, _447, _479);
    float _487 = fma(_419, _457, _481);
    float _489 = fma(_419, _459, _483);
    float _491 = precise::max(0.0, _485);
    float _493 = precise::max(0.0, _487);
    float _495 = precise::max(0.0, _489);
    float _497 = _491 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _499 = _493 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _501 = _495 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _503 = _473;
    if (!_361)
    {
        out.m_38.x = _497;
        out.m_38.y = _499;
        out.m_38.z = _501;
        out.m_38.w = as_type<float>(_409);
        return out;
    }
    if (_81)
    {
        _152 = _103;
    }
    float _505 = _152;
    float _507 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (!_186)
    {
        _232 = _252;
    }
    float _509 = _232;
    float _511 = _505 * _505;
    float _513 = floor(_507);
    float _515 = _511 + 11.33538818359375;
    float _517 = fma(_511, -0.82336294651031494140625, -5.674867153167724609375);
    float _519 = fma(_511, _515, 28.84246826171875);
    float _521 = fma(_511, _517, -6.565555095672607421875);
    float _523 = _515;
    if (_186)
    {
        _523 = 0.0;
        _503 = 0.0;
    }
    float _525 = _523;
    float _527 = _503;
    float _529 = fma(_511, _519, 19.6966705322265625);
    float _531 = _525;
    float _533 = _527;
    if (!_186)
    {
        _531 = _138;
    }
    float _535 = _531;
    float _537 = _511 * _521;
    if (!_186)
    {
        _533 = _144;
    }
    float _539 = _533;
    float _541 = 1.0 / _529;
    float _543 = _537 * _505;
    float _545 = _180 + _535;
    float _547 = _188 + _539;
    float _549 = _539;
    if (_186)
    {
        _549 = 1.0;
    }
    float _551 = _549;
    float _553 = _551;
    if (!_186)
    {
        _553 = -1.0;
    }
    float _555 = _553;
    float _557 = sqrt(_545);
    float _559 = fma(_543, _541, _505);
    float _561 = 1.0 / _547;
    int _563 = as_type<int>(_559);
    if (_81)
    {
        float _565 = -_559;
        float _567 = _565 + 1.57079637050628662109375;
        _563 = as_type<int>(_567);
    }
    int _569 = _563;
    float _571 = fma(_146, _555, _557);
    float _573 = as_type<float>(_569);
    if (!_93)
    {
        int _575 = _126 | _569;
        _573 = as_type<float>(_575);
    }
    float _577 = _573;
    float _579 = fma(0.454545438289642333984375, _577, 0.37000000476837158203125);
    float _581 = _571 * _561;
    float _583 = fma(_117, _579, _95);
    float _585 = fma(_292, _581, _509);
    float _587 = _583 + _513;
    float _589 = _587 + 1.0;
    float _591 = _587 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _593 = _589 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1559 = float3(_591, _585, _310);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1559, float3(0.0), isnan(_1559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1559, float3(0.0), isnan(_1559))).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float3 _1576 = float3(_593, _585, _310);
    float4 _605 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1576, float3(0.0), isnan(_1576))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1576, float3(0.0), isnan(_1576))).xyzw;
    float _607 = _605.x;
    float _609 = _605.y;
    float _611 = _605.z;
    float _613 = _605.w;
    float _615 = -_513;
    float _617 = _507 + _615;
    float _619 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _621 = _619 + 1.0;
    float _623 = abs(_621);
    float _625 = log2(_623);
    float _627 = _625 * 1.5;
    float _629 = exp2(_627);
    float _631 = _619 + 2.0;
    float _633 = _631 * _629;
    float _635 = 1.0 / _633;
    float _637 = -_597;
    float _639 = _637 + _607;
    float _641 = -_603;
    float _643 = _641 + _613;
    float _645 = -_599;
    float _647 = _645 + _609;
    float _649 = fma(_617, _639, _597);
    float _651 = fma(_617, _643, _603);
    float _653 = -_601;
    float _655 = _653 + _611;
    float _657 = fma(_617, _647, _599);
    float _659 = precise::max(0.0, _649);
    float _661 = fma(_617, _655, _601);
    float _663 = precise::max(0.0, _651);
    float _665 = fma(_619, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _667 = precise::max(_659, 9.9999997473787516355514526367188e-05);
    float _669 = precise::max(0.0, _657);
    float _671 = _665 * _635;
    float _673 = precise::max(0.0, _661);
    float _675 = 1.0 / _667;
    float _677 = _671 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _679 = _663 * _675;
    float _681 = _669 * _679;
    float _683 = _673 * _679;
    float _685 = _659 * _679;
    float _687 = _461 * _681;
    float _689 = _465 * _683;
    float _691 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _693 = _677 * _685;
    float _695 = _677 * _687;
    float _697 = _677 * _689;
    float _699 = fma(_659, _691, _693);
    float _701 = fma(_669, _691, _695);
    float _703 = fma(_673, _691, _697);
    float _705 = precise::max(0.0, _699);
    float _707 = precise::max(0.0, _701);
    float _709 = precise::max(0.0, _703);
    float _711 = -_497;
    float _713 = fma(_705, (*spvDescriptorSet0.fp_c4)._m0[3].x, _711);
    float _715 = -_499;
    float _717 = fma(_707, (*spvDescriptorSet0.fp_c4)._m0[3].y, _715);
    float _719 = -_501;
    float _721 = fma(_709, (*spvDescriptorSet0.fp_c4)._m0[3].z, _719);
    float _723 = fma(_713, (*spvDescriptorSet0.fp_c4)._m0[7].x, _497);
    float _725 = fma(_717, (*spvDescriptorSet0.fp_c4)._m0[7].x, _499);
    float _727 = fma(_721, (*spvDescriptorSet0.fp_c4)._m0[7].x, _501);
    out.m_38.x = _723;
    out.m_38.y = _725;
    out.m_38.z = _727;
    out.m_38.w = as_type<float>(_409);
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
    float _121 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _123 = 1.0 / _45;
    int _126 = as_type<int>(_73) & int(0x80000000);
    float _128 = _123 * _57;
    float _130 = _123 * _63;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _134 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _132;
    float _136 = -_75;
    float _138 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _136);
    float _140 = precise::max(_119, _128);
    float _142 = _130 * _130;
    float _144 = sqrt(_138);
    float _146 = _130 * _140;
    float _148 = _140;
    float _150 = _142;
    float _152 = _111;
    if (!_81)
    {
        _148 = _111;
    }
    float _154 = _148;
    float _156 = -_75;
    float _158 = _156 + _142;
    float _160 = _154;
    if (_81)
    {
        _160 = _103;
    }
    float _162 = _160;
    float _164 = -_142;
    float _166 = fma(_146, _146, _164);
    float _168 = 1.0 / _134;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _172 = _130 + _170;
    float _174 = _162 * _162;
    float _176 = -_75;
    bool _178 = _166 > _176;
    float _180 = _75 + _166;
    float _182 = _174 + 11.33538818359375;
    bool _184 = _146 < 0.0;
    bool _186 = _184 && _178;
    float _188 = sqrt(_158);
    float _190 = fma(_174, _182, 28.84246826171875);
    float _192 = fma(_174, _190, 19.6966705322265625);
    float _194 = fma(_174, -0.82336294651031494140625, -5.674867153167724609375);
    float _196 = _172 * _168;
    float _198 = fma(_174, _194, -6.565555095672607421875);
    float _200 = _182;
    float _202 = _174;
    float _204 = _162;
    if (_186)
    {
        _200 = 0.0;
        _150 = 0.0;
    }
    float _206 = _200;
    float _208 = _150;
    float _210 = 1.0 / _192;
    float _212 = _206;
    float _214 = _208;
    if (!_186)
    {
        _212 = _138;
    }
    float _216 = _212;
    float _218 = _174 * _198;
    if (_186)
    {
        _202 = 1.0;
    }
    float _220 = _202;
    float _222 = 0.0;
    float _224 = _220;
    if (_186)
    {
        float _226 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _228 = fma(_226, 0.5, 0.5);
        _222 = _228;
    }
    float _230 = _222;
    float _232 = _230;
    if (!_186)
    {
        _224 = -1.0;
    }
    float _234 = _224;
    float _236 = _180 + _216;
    float _238 = _121 * 1.57079637050628662109375;
    if (!_186)
    {
        _214 = _144;
    }
    float _240 = _214;
    float _242 = _218 * _162;
    float _244 = sqrt(_236);
    float _246 = _238 * 0.15915493667125701904296875;
    float _248 = 0.0;
    if (!_186)
    {
        float _250 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _248 = _250;
    }
    float _252 = _248;
    float _254 = _188 + _240;
    float _256 = fma(_242, _210, _162);
    float _258 = _246 * 6.283185482025146484375;
    float _260 = sin(_258);
    int _262 = as_type<int>(_256);
    if (_186)
    {
        _204 = _230;
    }
    float _264 = _204;
    float _266 = _264;
    if (_81)
    {
        float _268 = -_256;
        float _270 = _268 + 1.57079637050628662109375;
        _262 = as_type<int>(_270);
    }
    int _272 = _262;
    float _274 = as_type<float>(_272);
    if (!_186)
    {
        _266 = _252;
    }
    float _276 = _266;
    if (!_93)
    {
        int _278 = _126 | _272;
        _274 = as_type<float>(_278);
    }
    float _280 = _274;
    float _282 = fma(_146, _234, _244);
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _286 = 1.0 / _254;
    float _288 = fma(0.454545438289642333984375, _280, 0.37000000476837158203125);
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _292 = _290 + 0.5;
    float _294 = _260 * _284;
    float _296 = fma(_288, _117, _95);
    float _298 = floor(_294);
    float _300 = _282 * _286;
    float _302 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _304 = _302 + 1.0;
    float _306 = _196 * _304;
    float _308 = fma(_300, _292, _276);
    float _310 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _306);
    float _312 = _296 + _298;
    float _314 = _312 + 1.0;
    float _316 = _312 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1138 = float3(_316, _308, _310);
    float4 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1138, float3(0.0), isnan(_1138))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1138, float3(0.0), isnan(_1138))).xyzw;
    float _323 = _321.x;
    float _325 = _321.y;
    float _327 = _321.z;
    float _329 = _321.w;
    float3 _1157 = float3(_318, _308, _310);
    float4 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1157, float3(0.0), isnan(_1157))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1157, float3(0.0), isnan(_1157))).xyzw;
    float _333 = _331.x;
    float _335 = _331.y;
    float _337 = _331.z;
    float _339 = _331.w;
    float _341 = fma(_113, 2.0, -0.25);
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = fma(_121, 2.0, -0.25);
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = fma(_260, 2.0, -1.0);
    float _351 = in.m_35.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = -_298;
    float _359 = _294 + _357;
    bool _361 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _363 = precise::max(_347, _343);
    float _365 = _363 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _367 = fma(_365, _365, 1.0);
    float _369 = _365 * 2.0;
    float _371 = -_369;
    float _373 = fma(_349, _371, _367);
    float _375 = fma(_365, _365, 2.0);
    float _377 = -_365;
    float _379 = fma(_377, _365, 1.0);
    float _381 = abs(_373);
    float _383 = log2(_381);
    float _385 = _383 * 1.5;
    float _387 = exp2(_385);
    float _389 = _375 * _387;
    float _391 = _123 * _355;
    float _393 = _349 * _349;
    float _395 = 1.0 / _389;
    float _397 = _393 + 1.0;
    bool _399 = _119 >= _391;
    bool _401 = isnan(_119);
    bool _403 = _399 || _401;
    bool _405 = isnan(_391);
    bool _407 = _403 || _405;
    int _409 = _407 ? 1065353216 : 0;
    float _411 = _379 * _397;
    float _413 = _411 * 0.119366206228733062744140625;
    float _415 = fma(_393, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _417 = _413 * _395;
    float _419 = _415 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _421 = _417 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _423 = -_323;
    float _425 = _423 + _333;
    float _427 = -_329;
    float _429 = _427 + _339;
    float _431 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _433 = -_325;
    float _435 = _433 + _335;
    float _437 = fma(_359, _425, _323);
    float _439 = fma(_359, _429, _329);
    float _441 = -_327;
    float _443 = _441 + _337;
    float _445 = fma(_359, _435, _325);
    float _447 = precise::max(0.0, _437);
    float _449 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _451 = fma(_359, _443, _327);
    float _453 = precise::max(0.0, _439);
    float _455 = precise::max(_447, 9.9999997473787516355514526367188e-05);
    float _457 = precise::max(0.0, _445);
    float _459 = precise::max(0.0, _451);
    float _461 = _431 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _463 = 1.0 / _455;
    float _465 = _449 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _467 = _453 * _463;
    float _469 = _457 * _467;
    float _471 = _459 * _467;
    float _473 = _447 * _467;
    float _475 = _469 * _461;
    float _477 = _471 * _465;
    float _479 = _421 * _473;
    float _481 = _421 * _475;
    float _483 = _421 * _477;
    float _485 = fma(_419, _447, _479);
    float _487 = fma(_419, _457, _481);
    float _489 = fma(_419, _459, _483);
    float _491 = precise::max(0.0, _485);
    float _493 = precise::max(0.0, _487);
    float _495 = precise::max(0.0, _489);
    float _497 = _491 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _499 = _493 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _501 = _495 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _503 = _473;
    if (!_361)
    {
        out.m_38.x = _497;
        out.m_38.y = _499;
        out.m_38.z = _501;
        out.m_38.w = as_type<float>(_409);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (_81)
    {
        _152 = _103;
    }
    float _505 = _152;
    float _507 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (!_186)
    {
        _232 = _252;
    }
    float _509 = _232;
    float _511 = _505 * _505;
    float _513 = floor(_507);
    float _515 = _511 + 11.33538818359375;
    float _517 = fma(_511, -0.82336294651031494140625, -5.674867153167724609375);
    float _519 = fma(_511, _515, 28.84246826171875);
    float _521 = fma(_511, _517, -6.565555095672607421875);
    float _523 = _515;
    if (_186)
    {
        _523 = 0.0;
        _503 = 0.0;
    }
    float _525 = _523;
    float _527 = _503;
    float _529 = fma(_511, _519, 19.6966705322265625);
    float _531 = _525;
    float _533 = _527;
    if (!_186)
    {
        _531 = _138;
    }
    float _535 = _531;
    float _537 = _511 * _521;
    if (!_186)
    {
        _533 = _144;
    }
    float _539 = _533;
    float _541 = 1.0 / _529;
    float _543 = _537 * _505;
    float _545 = _180 + _535;
    float _547 = _188 + _539;
    float _549 = _539;
    if (_186)
    {
        _549 = 1.0;
    }
    float _551 = _549;
    float _553 = _551;
    if (!_186)
    {
        _553 = -1.0;
    }
    float _555 = _553;
    float _557 = sqrt(_545);
    float _559 = fma(_543, _541, _505);
    float _561 = 1.0 / _547;
    int _563 = as_type<int>(_559);
    if (_81)
    {
        float _565 = -_559;
        float _567 = _565 + 1.57079637050628662109375;
        _563 = as_type<int>(_567);
    }
    int _569 = _563;
    float _571 = fma(_146, _555, _557);
    float _573 = as_type<float>(_569);
    if (!_93)
    {
        int _575 = _126 | _569;
        _573 = as_type<float>(_575);
    }
    float _577 = _573;
    float _579 = fma(0.454545438289642333984375, _577, 0.37000000476837158203125);
    float _581 = _571 * _561;
    float _583 = fma(_117, _579, _95);
    float _585 = fma(_292, _581, _509);
    float _587 = _583 + _513;
    float _589 = _587 + 1.0;
    float _591 = _587 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _593 = _589 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1559 = float3(_591, _585, _310);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1559, float3(0.0), isnan(_1559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1559, float3(0.0), isnan(_1559))).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float3 _1576 = float3(_593, _585, _310);
    float4 _605 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1576, float3(0.0), isnan(_1576))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1576, float3(0.0), isnan(_1576))).xyzw;
    float _607 = _605.x;
    float _609 = _605.y;
    float _611 = _605.z;
    float _613 = _605.w;
    float _615 = -_513;
    float _617 = _507 + _615;
    float _619 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _621 = _619 + 1.0;
    float _623 = abs(_621);
    float _625 = log2(_623);
    float _627 = _625 * 1.5;
    float _629 = exp2(_627);
    float _631 = _619 + 2.0;
    float _633 = _631 * _629;
    float _635 = 1.0 / _633;
    float _637 = -_597;
    float _639 = _637 + _607;
    float _641 = -_603;
    float _643 = _641 + _613;
    float _645 = -_599;
    float _647 = _645 + _609;
    float _649 = fma(_617, _639, _597);
    float _651 = fma(_617, _643, _603);
    float _653 = -_601;
    float _655 = _653 + _611;
    float _657 = fma(_617, _647, _599);
    float _659 = precise::max(0.0, _649);
    float _661 = fma(_617, _655, _601);
    float _663 = precise::max(0.0, _651);
    float _665 = fma(_619, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _667 = precise::max(_659, 9.9999997473787516355514526367188e-05);
    float _669 = precise::max(0.0, _657);
    float _671 = _665 * _635;
    float _673 = precise::max(0.0, _661);
    float _675 = 1.0 / _667;
    float _677 = _671 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _679 = _663 * _675;
    float _681 = _669 * _679;
    float _683 = _673 * _679;
    float _685 = _659 * _679;
    float _687 = _461 * _681;
    float _689 = _465 * _683;
    float _691 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _693 = _677 * _685;
    float _695 = _677 * _687;
    float _697 = _677 * _689;
    float _699 = fma(_659, _691, _693);
    float _701 = fma(_669, _691, _695);
    float _703 = fma(_673, _691, _697);
    float _705 = precise::max(0.0, _699);
    float _707 = precise::max(0.0, _701);
    float _709 = precise::max(0.0, _703);
    float _711 = -_497;
    float _713 = fma(_705, (*spvDescriptorSet0.fp_c4)._m0[3].x, _711);
    float _715 = -_499;
    float _717 = fma(_707, (*spvDescriptorSet0.fp_c4)._m0[3].y, _715);
    float _719 = -_501;
    float _721 = fma(_709, (*spvDescriptorSet0.fp_c4)._m0[3].z, _719);
    float _723 = fma(_713, (*spvDescriptorSet0.fp_c4)._m0[7].x, _497);
    float _725 = fma(_717, (*spvDescriptorSet0.fp_c4)._m0[7].x, _499);
    float _727 = fma(_721, (*spvDescriptorSet0.fp_c4)._m0[7].x, _501);
    out.m_38.x = _723;
    out.m_38.y = _725;
    out.m_38.z = _727;
    out.m_38.w = as_type<float>(_409);
    return main0_out_u{as_type<uint4>(out.m_38)};
}

