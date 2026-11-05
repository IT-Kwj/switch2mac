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
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _75;
    float _79 = abs(_73);
    bool _83 = _79 > 1.0;
    float _85 = 1.0 / _77;
    float _87 = abs(_73);
    bool _89 = _87 > as_type<float>(0x7f800000u /* inf */);
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _97 = _93 || _95;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _101 = _99 + 1.0;
    float _103 = 0.0;
    float _105 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    if (_83)
    {
        float _107 = abs(_73);
        float _109 = 1.0 / _107;
        _103 = _109;
    }
    float _111 = _103;
    float _113 = 0.0;
    if (!_83)
    {
        float _115 = abs(_73);
        float _117 = (-0.0) + _115;
        _113 = _117;
    }
    float _119 = _113;
    float _121 = _51 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _123 = fma(_121, 2.0, -1.0);
    float _125 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _127 = 1.0 / _45;
    int _130 = as_type<int>(_73) & int(0x80000000);
    float _132 = _127 * _57;
    float _134 = _127 * _63;
    float _136 = precise::max(_123, _132);
    float _138 = _134 * _134;
    float _140 = _134 * _136;
    float _142 = _136;
    float _144 = _138;
    float _146 = _119;
    if (!_83)
    {
        _142 = _119;
    }
    float _148 = _142;
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _152 = _148;
    if (_83)
    {
        _152 = _111;
    }
    float _154 = _152;
    float _156 = -_138;
    float _158 = fma(_140, _140, _156);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _162 = _134 + _160;
    float _164 = -_150;
    float _166 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _164);
    float _168 = -_150;
    float _170 = _168 + _138;
    float _172 = _154 * _154;
    float _174 = -_150;
    bool _176 = _158 > _174;
    float _178 = _150 + _158;
    float _180 = sqrt(_166);
    float _182 = _172 + 11.33538818359375;
    bool _184 = _140 < 0.0;
    bool _186 = _184 && _176;
    float _188 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _190 = _162 * _85;
    float _192 = fma(_172, _182, 28.84246826171875);
    float _194 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _196 = _125 * _188;
    float _198 = sqrt(_170);
    float _200 = fma(_172, _192, 19.6966705322265625);
    if (_186)
    {
        _105 = 0.0;
    }
    float _202 = _105;
    float _204 = 1.0 / _200;
    float _206 = _202;
    if (!_186)
    {
        _206 = _166;
    }
    float _208 = _206;
    if (_186)
    {
        _144 = 1.0;
    }
    float _210 = _144;
    float _212 = _210;
    if (!_186)
    {
        _212 = -1.0;
    }
    float _214 = _212;
    float _216 = _178 + _208;
    float _218 = fma(_172, -0.82336294651031494140625, -5.674867153167724609375);
    float _220 = floor(_196);
    float _222 = fma(_172, _218, -6.565555095672607421875);
    float _224 = _172 * _222;
    float _226 = _222;
    float _228 = _216;
    if (_186)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = sqrt(_216);
    float _234 = _230;
    if (!_186)
    {
        _234 = _180;
    }
    float _236 = _234;
    float _238 = _224 * _154;
    float _240 = fma(_238, _204, _154);
    float _242 = _198 + _236;
    int _244 = as_type<int>(_240);
    if (_83)
    {
        float _246 = -_240;
        float _248 = _246 + 1.57079637050628662109375;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = 1.0 / _242;
    float _254 = 0.0;
    float _256 = as_type<float>(_250);
    if (_186)
    {
        float _258 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _260 = fma(_258, 0.5, 0.5);
        _254 = _260;
    }
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    if (!_186)
    {
        float _268 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _264 = _268;
    }
    float _270 = _264;
    if (!_97)
    {
        int _272 = _130 | _250;
        _256 = as_type<float>(_272);
    }
    float _274 = _256;
    float _276 = fma(_140, _214, _232);
    float _278 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _280 = _278 + 0.5;
    if (_186)
    {
        _228 = _262;
    }
    float _282 = _228;
    float _284 = fma(0.454545438289642333984375, _274, 0.37000000476837158203125);
    float _286 = _282;
    if (!_186)
    {
        _286 = _270;
    }
    float _288 = _286;
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _292 = _290 + 1.0;
    float _294 = fma(_284, _101, _194);
    float _296 = _190 * _292;
    float _298 = _276 * _252;
    float _300 = _294 + _220;
    float _302 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _296);
    float _304 = fma(_298, _280, _288);
    float _306 = _300 + 1.0;
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1124 = float3(_308, _304, _302);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1124, float3(0.0), isnan(_1124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1124, float3(0.0), isnan(_1124))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float3 _1143 = float3(_310, _304, _302);
    float4 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1143, float3(0.0), isnan(_1143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1143, float3(0.0), isnan(_1143))).xyzw;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _323.w;
    float _333 = fma(_121, 2.0, -0.25);
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = fma(_125, 2.0, -0.25);
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = fma(_125, 2.0, -1.0);
    float _343 = in.m_35.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = -_220;
    float _351 = _196 + _349;
    bool _353 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _355 = precise::max(_339, _335);
    float _357 = _355 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _359 = fma(_357, _357, 1.0);
    float _361 = _357 * 2.0;
    float _363 = -_361;
    float _365 = fma(_341, _363, _359);
    float _367 = fma(_357, _357, 2.0);
    float _369 = -_357;
    float _371 = fma(_369, _357, 1.0);
    float _373 = abs(_365);
    float _375 = log2(_373);
    float _377 = _375 * 1.5;
    float _379 = exp2(_377);
    float _381 = _367 * _379;
    float _383 = _127 * _347;
    float _385 = _341 * _341;
    float _387 = 1.0 / _381;
    float _389 = _385 + 1.0;
    bool _391 = _123 >= _383;
    bool _393 = isnan(_123);
    bool _395 = _391 || _393;
    bool _397 = isnan(_383);
    bool _399 = _395 || _397;
    int _401 = _399 ? 1065353216 : 0;
    float _403 = _371 * _389;
    float _405 = _403 * 0.119366206228733062744140625;
    float _407 = fma(_385, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _409 = _405 * _387;
    float _411 = _407 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _413 = _409 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _415 = -_315;
    float _417 = _415 + _325;
    float _419 = -_321;
    float _421 = _419 + _331;
    float _423 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _425 = -_317;
    float _427 = _425 + _327;
    float _429 = fma(_351, _417, _315);
    float _431 = fma(_351, _421, _321);
    float _433 = -_319;
    float _435 = _433 + _329;
    float _437 = fma(_351, _427, _317);
    float _439 = precise::max(0.0, _429);
    float _441 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _443 = fma(_351, _435, _319);
    float _445 = precise::max(0.0, _431);
    float _447 = precise::max(_439, 9.9999997473787516355514526367188e-05);
    float _449 = precise::max(0.0, _437);
    float _451 = precise::max(0.0, _443);
    float _453 = _423 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _455 = 1.0 / _447;
    float _457 = _441 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _459 = _445 * _455;
    float _461 = _449 * _459;
    float _463 = _451 * _459;
    float _465 = _439 * _459;
    float _467 = _461 * _453;
    float _469 = _463 * _457;
    float _471 = _413 * _465;
    float _473 = _413 * _467;
    float _475 = _413 * _469;
    float _477 = fma(_411, _439, _471);
    float _479 = fma(_411, _449, _473);
    float _481 = fma(_411, _451, _475);
    float _483 = precise::max(0.0, _477);
    float _485 = precise::max(0.0, _479);
    float _487 = precise::max(0.0, _481);
    float _489 = _483 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _491 = _485 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _493 = _487 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _495 = _467;
    if (!_353)
    {
        out.m_38.x = _489;
        out.m_38.y = _491;
        out.m_38.z = _493;
        out.m_38.w = as_type<float>(_401);
        return out;
    }
    if (_83)
    {
        _146 = _111;
    }
    float _497 = _146;
    float _499 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (_186)
    {
        _495 = 0.0;
    }
    float _501 = _495;
    float _503 = _501;
    if (!_186)
    {
        _503 = _166;
    }
    float _505 = _503;
    float _507 = _497 * _497;
    float _509 = floor(_499);
    if (!_186)
    {
        _266 = _270;
    }
    float _511 = _266;
    float _513 = _507 + 11.33538818359375;
    float _515 = fma(_507, -0.82336294651031494140625, -5.674867153167724609375);
    float _517 = _178 + _505;
    float _519 = fma(_507, _513, 28.84246826171875);
    float _521 = fma(_507, _515, -6.565555095672607421875);
    float _523 = fma(_507, _519, 19.6966705322265625);
    float _525 = _507 * _521;
    float _527 = _519;
    if (_186)
    {
        _527 = 0.0;
    }
    float _529 = _527;
    float _531 = sqrt(_517);
    float _533 = _529;
    if (!_186)
    {
        _533 = _180;
    }
    float _535 = _533;
    float _537 = _525 * _497;
    float _539 = _198 + _535;
    float _541 = _535;
    if (_186)
    {
        _541 = 1.0;
    }
    float _543 = _541;
    float _545 = 1.0 / _523;
    float _547 = _543;
    if (!_186)
    {
        _547 = -1.0;
    }
    float _549 = _547;
    float _551 = 1.0 / _539;
    float _553 = fma(_140, _549, _531);
    float _555 = fma(_537, _545, _497);
    int _557 = as_type<int>(_555);
    if (_83)
    {
        float _559 = -_555;
        float _561 = _559 + 1.57079637050628662109375;
        _557 = as_type<int>(_561);
    }
    int _563 = _557;
    float _565 = as_type<float>(_563);
    if (!_97)
    {
        int _567 = _130 | _563;
        _565 = as_type<float>(_567);
    }
    float _569 = _565;
    float _571 = fma(0.454545438289642333984375, _569, 0.37000000476837158203125);
    float _573 = fma(_101, _571, _194);
    float _575 = _553 * _551;
    float _577 = _573 + _509;
    float _579 = fma(_280, _575, _511);
    float _581 = _577 + 1.0;
    float _583 = _577 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _585 = _581 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1548 = float3(_583, _579, _302);
    float4 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1548, float3(0.0), isnan(_1548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1548, float3(0.0), isnan(_1548))).xyzw;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float _595 = _587.w;
    float3 _1565 = float3(_585, _579, _302);
    float4 _597 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1565, float3(0.0), isnan(_1565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1565, float3(0.0), isnan(_1565))).xyzw;
    float _599 = _597.x;
    float _601 = _597.y;
    float _603 = _597.z;
    float _605 = _597.w;
    float _607 = -_509;
    float _609 = _499 + _607;
    float _611 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _613 = _611 + 1.0;
    float _615 = abs(_613);
    float _617 = log2(_615);
    float _619 = _617 * 1.5;
    float _621 = exp2(_619);
    float _623 = _611 + 2.0;
    float _625 = _623 * _621;
    float _627 = 1.0 / _625;
    float _629 = -_589;
    float _631 = _629 + _599;
    float _633 = -_595;
    float _635 = _633 + _605;
    float _637 = -_591;
    float _639 = _637 + _601;
    float _641 = fma(_609, _631, _589);
    float _643 = fma(_609, _635, _595);
    float _645 = -_593;
    float _647 = _645 + _603;
    float _649 = fma(_609, _639, _591);
    float _651 = precise::max(0.0, _641);
    float _653 = fma(_609, _647, _593);
    float _655 = precise::max(0.0, _643);
    float _657 = fma(_611, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _659 = precise::max(_651, 9.9999997473787516355514526367188e-05);
    float _661 = precise::max(0.0, _649);
    float _663 = _657 * _627;
    float _665 = precise::max(0.0, _653);
    float _667 = 1.0 / _659;
    float _669 = _663 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _671 = _655 * _667;
    float _673 = _661 * _671;
    float _675 = _665 * _671;
    float _677 = _651 * _671;
    float _679 = _453 * _673;
    float _681 = _457 * _675;
    float _683 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _685 = _669 * _677;
    float _687 = _669 * _679;
    float _689 = _669 * _681;
    float _691 = fma(_651, _683, _685);
    float _693 = fma(_661, _683, _687);
    float _695 = fma(_665, _683, _689);
    float _697 = precise::max(0.0, _691);
    float _699 = precise::max(0.0, _693);
    float _701 = precise::max(0.0, _695);
    float _703 = -_489;
    float _705 = fma(_697, (*spvDescriptorSet0.fp_c4)._m0[3].x, _703);
    float _707 = -_491;
    float _709 = fma(_699, (*spvDescriptorSet0.fp_c4)._m0[3].y, _707);
    float _711 = -_493;
    float _713 = fma(_701, (*spvDescriptorSet0.fp_c4)._m0[3].z, _711);
    float _715 = fma(_705, (*spvDescriptorSet0.fp_c4)._m0[7].x, _489);
    float _717 = fma(_709, (*spvDescriptorSet0.fp_c4)._m0[7].x, _491);
    float _719 = fma(_713, (*spvDescriptorSet0.fp_c4)._m0[7].x, _493);
    out.m_38.x = _715;
    out.m_38.y = _717;
    out.m_38.z = _719;
    out.m_38.w = as_type<float>(_401);
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
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _75;
    float _79 = abs(_73);
    bool _83 = _79 > 1.0;
    float _85 = 1.0 / _77;
    float _87 = abs(_73);
    bool _89 = _87 > as_type<float>(0x7f800000u /* inf */);
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _97 = _93 || _95;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _101 = _99 + 1.0;
    float _103 = 0.0;
    float _105 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    if (_83)
    {
        float _107 = abs(_73);
        float _109 = 1.0 / _107;
        _103 = _109;
    }
    float _111 = _103;
    float _113 = 0.0;
    if (!_83)
    {
        float _115 = abs(_73);
        float _117 = (-0.0) + _115;
        _113 = _117;
    }
    float _119 = _113;
    float _121 = _51 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _123 = fma(_121, 2.0, -1.0);
    float _125 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _127 = 1.0 / _45;
    int _130 = as_type<int>(_73) & int(0x80000000);
    float _132 = _127 * _57;
    float _134 = _127 * _63;
    float _136 = precise::max(_123, _132);
    float _138 = _134 * _134;
    float _140 = _134 * _136;
    float _142 = _136;
    float _144 = _138;
    float _146 = _119;
    if (!_83)
    {
        _142 = _119;
    }
    float _148 = _142;
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _152 = _148;
    if (_83)
    {
        _152 = _111;
    }
    float _154 = _152;
    float _156 = -_138;
    float _158 = fma(_140, _140, _156);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _162 = _134 + _160;
    float _164 = -_150;
    float _166 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _164);
    float _168 = -_150;
    float _170 = _168 + _138;
    float _172 = _154 * _154;
    float _174 = -_150;
    bool _176 = _158 > _174;
    float _178 = _150 + _158;
    float _180 = sqrt(_166);
    float _182 = _172 + 11.33538818359375;
    bool _184 = _140 < 0.0;
    bool _186 = _184 && _176;
    float _188 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _190 = _162 * _85;
    float _192 = fma(_172, _182, 28.84246826171875);
    float _194 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _196 = _125 * _188;
    float _198 = sqrt(_170);
    float _200 = fma(_172, _192, 19.6966705322265625);
    if (_186)
    {
        _105 = 0.0;
    }
    float _202 = _105;
    float _204 = 1.0 / _200;
    float _206 = _202;
    if (!_186)
    {
        _206 = _166;
    }
    float _208 = _206;
    if (_186)
    {
        _144 = 1.0;
    }
    float _210 = _144;
    float _212 = _210;
    if (!_186)
    {
        _212 = -1.0;
    }
    float _214 = _212;
    float _216 = _178 + _208;
    float _218 = fma(_172, -0.82336294651031494140625, -5.674867153167724609375);
    float _220 = floor(_196);
    float _222 = fma(_172, _218, -6.565555095672607421875);
    float _224 = _172 * _222;
    float _226 = _222;
    float _228 = _216;
    if (_186)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = sqrt(_216);
    float _234 = _230;
    if (!_186)
    {
        _234 = _180;
    }
    float _236 = _234;
    float _238 = _224 * _154;
    float _240 = fma(_238, _204, _154);
    float _242 = _198 + _236;
    int _244 = as_type<int>(_240);
    if (_83)
    {
        float _246 = -_240;
        float _248 = _246 + 1.57079637050628662109375;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = 1.0 / _242;
    float _254 = 0.0;
    float _256 = as_type<float>(_250);
    if (_186)
    {
        float _258 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _260 = fma(_258, 0.5, 0.5);
        _254 = _260;
    }
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    if (!_186)
    {
        float _268 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _264 = _268;
    }
    float _270 = _264;
    if (!_97)
    {
        int _272 = _130 | _250;
        _256 = as_type<float>(_272);
    }
    float _274 = _256;
    float _276 = fma(_140, _214, _232);
    float _278 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _280 = _278 + 0.5;
    if (_186)
    {
        _228 = _262;
    }
    float _282 = _228;
    float _284 = fma(0.454545438289642333984375, _274, 0.37000000476837158203125);
    float _286 = _282;
    if (!_186)
    {
        _286 = _270;
    }
    float _288 = _286;
    float _290 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _292 = _290 + 1.0;
    float _294 = fma(_284, _101, _194);
    float _296 = _190 * _292;
    float _298 = _276 * _252;
    float _300 = _294 + _220;
    float _302 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _296);
    float _304 = fma(_298, _280, _288);
    float _306 = _300 + 1.0;
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1124 = float3(_308, _304, _302);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1124, float3(0.0), isnan(_1124))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1124, float3(0.0), isnan(_1124))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float3 _1143 = float3(_310, _304, _302);
    float4 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1143, float3(0.0), isnan(_1143))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1143, float3(0.0), isnan(_1143))).xyzw;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _323.w;
    float _333 = fma(_121, 2.0, -0.25);
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = fma(_125, 2.0, -0.25);
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = fma(_125, 2.0, -1.0);
    float _343 = in.m_35.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = -_220;
    float _351 = _196 + _349;
    bool _353 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _355 = precise::max(_339, _335);
    float _357 = _355 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _359 = fma(_357, _357, 1.0);
    float _361 = _357 * 2.0;
    float _363 = -_361;
    float _365 = fma(_341, _363, _359);
    float _367 = fma(_357, _357, 2.0);
    float _369 = -_357;
    float _371 = fma(_369, _357, 1.0);
    float _373 = abs(_365);
    float _375 = log2(_373);
    float _377 = _375 * 1.5;
    float _379 = exp2(_377);
    float _381 = _367 * _379;
    float _383 = _127 * _347;
    float _385 = _341 * _341;
    float _387 = 1.0 / _381;
    float _389 = _385 + 1.0;
    bool _391 = _123 >= _383;
    bool _393 = isnan(_123);
    bool _395 = _391 || _393;
    bool _397 = isnan(_383);
    bool _399 = _395 || _397;
    int _401 = _399 ? 1065353216 : 0;
    float _403 = _371 * _389;
    float _405 = _403 * 0.119366206228733062744140625;
    float _407 = fma(_385, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _409 = _405 * _387;
    float _411 = _407 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _413 = _409 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _415 = -_315;
    float _417 = _415 + _325;
    float _419 = -_321;
    float _421 = _419 + _331;
    float _423 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _425 = -_317;
    float _427 = _425 + _327;
    float _429 = fma(_351, _417, _315);
    float _431 = fma(_351, _421, _321);
    float _433 = -_319;
    float _435 = _433 + _329;
    float _437 = fma(_351, _427, _317);
    float _439 = precise::max(0.0, _429);
    float _441 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _443 = fma(_351, _435, _319);
    float _445 = precise::max(0.0, _431);
    float _447 = precise::max(_439, 9.9999997473787516355514526367188e-05);
    float _449 = precise::max(0.0, _437);
    float _451 = precise::max(0.0, _443);
    float _453 = _423 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _455 = 1.0 / _447;
    float _457 = _441 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _459 = _445 * _455;
    float _461 = _449 * _459;
    float _463 = _451 * _459;
    float _465 = _439 * _459;
    float _467 = _461 * _453;
    float _469 = _463 * _457;
    float _471 = _413 * _465;
    float _473 = _413 * _467;
    float _475 = _413 * _469;
    float _477 = fma(_411, _439, _471);
    float _479 = fma(_411, _449, _473);
    float _481 = fma(_411, _451, _475);
    float _483 = precise::max(0.0, _477);
    float _485 = precise::max(0.0, _479);
    float _487 = precise::max(0.0, _481);
    float _489 = _483 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _491 = _485 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _493 = _487 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _495 = _467;
    if (!_353)
    {
        out.m_38.x = _489;
        out.m_38.y = _491;
        out.m_38.z = _493;
        out.m_38.w = as_type<float>(_401);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (_83)
    {
        _146 = _111;
    }
    float _497 = _146;
    float _499 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (_186)
    {
        _495 = 0.0;
    }
    float _501 = _495;
    float _503 = _501;
    if (!_186)
    {
        _503 = _166;
    }
    float _505 = _503;
    float _507 = _497 * _497;
    float _509 = floor(_499);
    if (!_186)
    {
        _266 = _270;
    }
    float _511 = _266;
    float _513 = _507 + 11.33538818359375;
    float _515 = fma(_507, -0.82336294651031494140625, -5.674867153167724609375);
    float _517 = _178 + _505;
    float _519 = fma(_507, _513, 28.84246826171875);
    float _521 = fma(_507, _515, -6.565555095672607421875);
    float _523 = fma(_507, _519, 19.6966705322265625);
    float _525 = _507 * _521;
    float _527 = _519;
    if (_186)
    {
        _527 = 0.0;
    }
    float _529 = _527;
    float _531 = sqrt(_517);
    float _533 = _529;
    if (!_186)
    {
        _533 = _180;
    }
    float _535 = _533;
    float _537 = _525 * _497;
    float _539 = _198 + _535;
    float _541 = _535;
    if (_186)
    {
        _541 = 1.0;
    }
    float _543 = _541;
    float _545 = 1.0 / _523;
    float _547 = _543;
    if (!_186)
    {
        _547 = -1.0;
    }
    float _549 = _547;
    float _551 = 1.0 / _539;
    float _553 = fma(_140, _549, _531);
    float _555 = fma(_537, _545, _497);
    int _557 = as_type<int>(_555);
    if (_83)
    {
        float _559 = -_555;
        float _561 = _559 + 1.57079637050628662109375;
        _557 = as_type<int>(_561);
    }
    int _563 = _557;
    float _565 = as_type<float>(_563);
    if (!_97)
    {
        int _567 = _130 | _563;
        _565 = as_type<float>(_567);
    }
    float _569 = _565;
    float _571 = fma(0.454545438289642333984375, _569, 0.37000000476837158203125);
    float _573 = fma(_101, _571, _194);
    float _575 = _553 * _551;
    float _577 = _573 + _509;
    float _579 = fma(_280, _575, _511);
    float _581 = _577 + 1.0;
    float _583 = _577 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _585 = _581 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1548 = float3(_583, _579, _302);
    float4 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1548, float3(0.0), isnan(_1548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1548, float3(0.0), isnan(_1548))).xyzw;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float _595 = _587.w;
    float3 _1565 = float3(_585, _579, _302);
    float4 _597 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1565, float3(0.0), isnan(_1565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1565, float3(0.0), isnan(_1565))).xyzw;
    float _599 = _597.x;
    float _601 = _597.y;
    float _603 = _597.z;
    float _605 = _597.w;
    float _607 = -_509;
    float _609 = _499 + _607;
    float _611 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _613 = _611 + 1.0;
    float _615 = abs(_613);
    float _617 = log2(_615);
    float _619 = _617 * 1.5;
    float _621 = exp2(_619);
    float _623 = _611 + 2.0;
    float _625 = _623 * _621;
    float _627 = 1.0 / _625;
    float _629 = -_589;
    float _631 = _629 + _599;
    float _633 = -_595;
    float _635 = _633 + _605;
    float _637 = -_591;
    float _639 = _637 + _601;
    float _641 = fma(_609, _631, _589);
    float _643 = fma(_609, _635, _595);
    float _645 = -_593;
    float _647 = _645 + _603;
    float _649 = fma(_609, _639, _591);
    float _651 = precise::max(0.0, _641);
    float _653 = fma(_609, _647, _593);
    float _655 = precise::max(0.0, _643);
    float _657 = fma(_611, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _659 = precise::max(_651, 9.9999997473787516355514526367188e-05);
    float _661 = precise::max(0.0, _649);
    float _663 = _657 * _627;
    float _665 = precise::max(0.0, _653);
    float _667 = 1.0 / _659;
    float _669 = _663 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _671 = _655 * _667;
    float _673 = _661 * _671;
    float _675 = _665 * _671;
    float _677 = _651 * _671;
    float _679 = _453 * _673;
    float _681 = _457 * _675;
    float _683 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _685 = _669 * _677;
    float _687 = _669 * _679;
    float _689 = _669 * _681;
    float _691 = fma(_651, _683, _685);
    float _693 = fma(_661, _683, _687);
    float _695 = fma(_665, _683, _689);
    float _697 = precise::max(0.0, _691);
    float _699 = precise::max(0.0, _693);
    float _701 = precise::max(0.0, _695);
    float _703 = -_489;
    float _705 = fma(_697, (*spvDescriptorSet0.fp_c4)._m0[3].x, _703);
    float _707 = -_491;
    float _709 = fma(_699, (*spvDescriptorSet0.fp_c4)._m0[3].y, _707);
    float _711 = -_493;
    float _713 = fma(_701, (*spvDescriptorSet0.fp_c4)._m0[3].z, _711);
    float _715 = fma(_705, (*spvDescriptorSet0.fp_c4)._m0[7].x, _489);
    float _717 = fma(_709, (*spvDescriptorSet0.fp_c4)._m0[7].x, _491);
    float _719 = fma(_713, (*spvDescriptorSet0.fp_c4)._m0[7].x, _493);
    out.m_38.x = _715;
    out.m_38.y = _717;
    out.m_38.z = _719;
    out.m_38.w = as_type<float>(_401);
    return main0_out_u{as_type<uint4>(out.m_38)};
}

