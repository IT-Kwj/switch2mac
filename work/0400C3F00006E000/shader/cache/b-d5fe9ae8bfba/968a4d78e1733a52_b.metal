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
    float _75 = abs(_73);
    bool _79 = _75 > 1.0;
    float _81 = abs(_73);
    bool _83 = _81 > as_type<float>(0x7f800000u /* inf */);
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _91 = _87 || _89;
    float _93 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _95 = _93 + 1.0;
    float _97 = 0.0;
    float _99 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    if (_79)
    {
        float _101 = abs(_73);
        float _103 = 1.0 / _101;
        _97 = _103;
    }
    float _105 = _97;
    float _107 = 0.0;
    if (!_79)
    {
        float _109 = abs(_73);
        float _111 = (-0.0) + _109;
        _107 = _111;
    }
    float _113 = _107;
    float _115 = _51 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _117 = fma(_115, 2.0, -1.0);
    float _119 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _121 = 1.0 / _45;
    int _124 = as_type<int>(_73) & int(0x80000000);
    float _126 = _121 * _57;
    float _128 = _121 * _63;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _132 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _130;
    float _134 = precise::max(_117, _126);
    float _136 = _128 * _128;
    float _138 = 1.0 / _132;
    float _140 = _128 * _134;
    float _142 = _134;
    float _144 = _136;
    float _146 = _113;
    if (!_79)
    {
        _142 = _113;
    }
    float _148 = _142;
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _152 = _148;
    if (_79)
    {
        _152 = _105;
    }
    float _154 = _152;
    float _156 = -_136;
    float _158 = fma(_140, _140, _156);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _162 = _128 + _160;
    float _164 = -_150;
    float _166 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _164);
    float _168 = -_150;
    float _170 = _168 + _136;
    float _172 = _154 * _154;
    float _174 = -_150;
    bool _176 = _158 > _174;
    float _178 = _150 + _158;
    float _180 = sqrt(_166);
    float _182 = _172 + 11.33538818359375;
    bool _184 = _140 < 0.0;
    bool _186 = _184 && _176;
    float _188 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _190 = _162 * _138;
    float _192 = fma(_172, _182, 28.84246826171875);
    float _194 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _196 = _119 * _188;
    float _198 = sqrt(_170);
    float _200 = fma(_172, _192, 19.6966705322265625);
    if (_186)
    {
        _99 = 0.0;
    }
    float _202 = _99;
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
    if (_79)
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
    if (!_91)
    {
        int _272 = _124 | _250;
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
    float _294 = fma(_284, _95, _194);
    float _296 = _190 * _292;
    float _298 = _276 * _252;
    float _300 = _294 + _220;
    float _302 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _296);
    float _304 = fma(_298, _280, _288);
    float _306 = _300 + 1.0;
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1108 = float3(_308, _304, _302);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1108, float3(0.0), isnan(_1108))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1108, float3(0.0), isnan(_1108))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float3 _1127 = float3(_310, _304, _302);
    float4 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1127, float3(0.0), isnan(_1127))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1127, float3(0.0), isnan(_1127))).xyzw;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _323.w;
    float _333 = fma(_119, 2.0, -1.0);
    float _335 = in.m_35.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    bool _341 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _343 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _345 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
    float _347 = _343 + 1.0;
    float _349 = -_345;
    float _351 = fma(_333, _349, _347);
    float _353 = abs(_351);
    float _355 = log2(_353);
    float _357 = _121 * _339;
    float _359 = _355 * 1.5;
    float _361 = -_220;
    float _363 = _196 + _361;
    float _365 = _343 + 2.0;
    bool _367 = _117 >= _357;
    bool _369 = isnan(_117);
    bool _371 = _367 || _369;
    bool _373 = isnan(_357);
    bool _375 = _371 || _373;
    int _377 = _375 ? 1065353216 : 0;
    float _379 = exp2(_359);
    float _381 = _365 * _379;
    float _383 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _385 = 1.0 / _381;
    float _387 = -_315;
    float _389 = _387 + _325;
    float _391 = _333 * _333;
    float _393 = -_317;
    float _395 = _393 + _327;
    float _397 = -_319;
    float _399 = _397 + _329;
    float _401 = fma(_363, _389, _315);
    float _403 = -_343;
    float _405 = _403 + 1.0;
    float _407 = _391 + 1.0;
    float _409 = fma(_363, _395, _317);
    float _411 = fma(_363, _399, _319);
    float _413 = _383 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _415 = _405 * _407;
    float _417 = precise::max(0.0, _409);
    float _419 = _415 * 0.119366206228733062744140625;
    float _421 = precise::max(0.0, _401);
    float _423 = -_321;
    float _425 = _423 + _331;
    float _427 = precise::max(0.0, _411);
    float _429 = _419 * _385;
    float _431 = precise::max(_421, 9.9999997473787516355514526367188e-05);
    float _433 = fma(_363, _425, _321);
    float _435 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _437 = _429 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _439 = precise::max(0.0, _433);
    float _441 = fma(_391, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _443 = 1.0 / _431;
    float _445 = _441 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _447 = _435 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _449 = _439 * _443;
    float _451 = _417 * _449;
    float _453 = _427 * _449;
    float _455 = _421 * _449;
    float _457 = _451 * _413;
    float _459 = _453 * _447;
    float _461 = _437 * _455;
    float _463 = _437 * _457;
    float _465 = _437 * _459;
    float _467 = fma(_445, _421, _461);
    float _469 = fma(_445, _417, _463);
    float _471 = fma(_445, _427, _465);
    float _473 = precise::max(0.0, _467);
    float _475 = precise::max(0.0, _469);
    float _477 = precise::max(0.0, _471);
    float _479 = _473 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _481 = _475 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _483 = _477 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _485 = _467;
    if (!_341)
    {
        out.m_38.x = _479;
        out.m_38.y = _481;
        out.m_38.z = _483;
        out.m_38.w = as_type<float>(_377);
        return out;
    }
    if (_79)
    {
        _146 = _105;
    }
    float _487 = _146;
    float _489 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (_186)
    {
        _485 = 0.0;
    }
    float _491 = _485;
    float _493 = _491;
    if (!_186)
    {
        _493 = _166;
    }
    float _495 = _493;
    float _497 = _487 * _487;
    float _499 = floor(_489);
    if (!_186)
    {
        _266 = _270;
    }
    float _501 = _266;
    float _503 = _497 + 11.33538818359375;
    float _505 = fma(_497, -0.82336294651031494140625, -5.674867153167724609375);
    float _507 = _178 + _495;
    float _509 = fma(_497, _503, 28.84246826171875);
    float _511 = fma(_497, _505, -6.565555095672607421875);
    float _513 = fma(_497, _509, 19.6966705322265625);
    float _515 = _497 * _511;
    float _517 = _509;
    if (_186)
    {
        _517 = 0.0;
    }
    float _519 = _517;
    float _521 = sqrt(_507);
    float _523 = _519;
    if (!_186)
    {
        _523 = _180;
    }
    float _525 = _523;
    float _527 = _515 * _487;
    float _529 = _198 + _525;
    float _531 = _525;
    if (_186)
    {
        _531 = 1.0;
    }
    float _533 = _531;
    float _535 = 1.0 / _513;
    float _537 = _533;
    if (!_186)
    {
        _537 = -1.0;
    }
    float _539 = _537;
    float _541 = 1.0 / _529;
    float _543 = fma(_140, _539, _521);
    float _545 = fma(_527, _535, _487);
    int _547 = as_type<int>(_545);
    if (_79)
    {
        float _549 = -_545;
        float _551 = _549 + 1.57079637050628662109375;
        _547 = as_type<int>(_551);
    }
    int _553 = _547;
    float _555 = as_type<float>(_553);
    if (!_91)
    {
        int _557 = _124 | _553;
        _555 = as_type<float>(_557);
    }
    float _559 = _555;
    float _561 = fma(0.454545438289642333984375, _559, 0.37000000476837158203125);
    float _563 = fma(_95, _561, _194);
    float _565 = _543 * _541;
    float _567 = _563 + _499;
    float _569 = fma(_280, _565, _501);
    float _571 = _567 + 1.0;
    float _573 = _567 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _575 = _571 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1519 = float3(_573, _569, _302);
    float4 _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1519, float3(0.0), isnan(_1519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1519, float3(0.0), isnan(_1519))).xyzw;
    float _579 = _577.x;
    float _581 = _577.y;
    float _583 = _577.z;
    float _585 = _577.w;
    float3 _1536 = float3(_575, _569, _302);
    float4 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1536, float3(0.0), isnan(_1536))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1536, float3(0.0), isnan(_1536))).xyzw;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float _595 = _587.w;
    float _597 = abs(_347);
    float _599 = log2(_597);
    float _601 = -_499;
    float _603 = _489 + _601;
    float _605 = fma(_343, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _607 = _599 * 1.5;
    float _609 = exp2(_607);
    float _611 = _365 * _609;
    float _613 = 1.0 / _611;
    float _615 = _605 * _613;
    float _617 = _615 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _619 = -_579;
    float _621 = _619 + _589;
    float _623 = -_585;
    float _625 = _623 + _595;
    float _627 = -_581;
    float _629 = _627 + _591;
    float _631 = fma(_603, _621, _579);
    float _633 = fma(_603, _625, _585);
    float _635 = -_583;
    float _637 = _635 + _593;
    float _639 = fma(_603, _629, _581);
    float _641 = precise::max(0.0, _631);
    float _643 = fma(_603, _637, _583);
    float _645 = precise::max(0.0, _633);
    float _647 = precise::max(_641, 9.9999997473787516355514526367188e-05);
    float _649 = precise::max(0.0, _639);
    float _651 = precise::max(0.0, _643);
    float _653 = 1.0 / _647;
    float _655 = _645 * _653;
    float _657 = _649 * _655;
    float _659 = _651 * _655;
    float _661 = _641 * _655;
    float _663 = _413 * _657;
    float _665 = _447 * _659;
    float _667 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _669 = _617 * _661;
    float _671 = _617 * _663;
    float _673 = _617 * _665;
    float _675 = fma(_641, _667, _669);
    float _677 = fma(_649, _667, _671);
    float _679 = fma(_651, _667, _673);
    float _681 = precise::max(0.0, _675);
    float _683 = precise::max(0.0, _677);
    float _685 = precise::max(0.0, _679);
    float _687 = -_479;
    float _689 = fma(_681, (*spvDescriptorSet0.fp_c4)._m0[3].x, _687);
    float _691 = -_481;
    float _693 = fma(_683, (*spvDescriptorSet0.fp_c4)._m0[3].y, _691);
    float _695 = -_483;
    float _697 = fma(_685, (*spvDescriptorSet0.fp_c4)._m0[3].z, _695);
    float _699 = fma(_689, (*spvDescriptorSet0.fp_c4)._m0[7].x, _479);
    float _701 = fma(_693, (*spvDescriptorSet0.fp_c4)._m0[7].x, _481);
    float _703 = fma(_697, (*spvDescriptorSet0.fp_c4)._m0[7].x, _483);
    out.m_38.x = _699;
    out.m_38.y = _701;
    out.m_38.z = _703;
    out.m_38.w = as_type<float>(_377);
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
    float _75 = abs(_73);
    bool _79 = _75 > 1.0;
    float _81 = abs(_73);
    bool _83 = _81 > as_type<float>(0x7f800000u /* inf */);
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _91 = _87 || _89;
    float _93 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _95 = _93 + 1.0;
    float _97 = 0.0;
    float _99 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    if (_79)
    {
        float _101 = abs(_73);
        float _103 = 1.0 / _101;
        _97 = _103;
    }
    float _105 = _97;
    float _107 = 0.0;
    if (!_79)
    {
        float _109 = abs(_73);
        float _111 = (-0.0) + _109;
        _107 = _111;
    }
    float _113 = _107;
    float _115 = _51 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _117 = fma(_115, 2.0, -1.0);
    float _119 = _69 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _121 = 1.0 / _45;
    int _124 = as_type<int>(_73) & int(0x80000000);
    float _126 = _121 * _57;
    float _128 = _121 * _63;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _132 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _130;
    float _134 = precise::max(_117, _126);
    float _136 = _128 * _128;
    float _138 = 1.0 / _132;
    float _140 = _128 * _134;
    float _142 = _134;
    float _144 = _136;
    float _146 = _113;
    if (!_79)
    {
        _142 = _113;
    }
    float _148 = _142;
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _152 = _148;
    if (_79)
    {
        _152 = _105;
    }
    float _154 = _152;
    float _156 = -_136;
    float _158 = fma(_140, _140, _156);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _162 = _128 + _160;
    float _164 = -_150;
    float _166 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _164);
    float _168 = -_150;
    float _170 = _168 + _136;
    float _172 = _154 * _154;
    float _174 = -_150;
    bool _176 = _158 > _174;
    float _178 = _150 + _158;
    float _180 = sqrt(_166);
    float _182 = _172 + 11.33538818359375;
    bool _184 = _140 < 0.0;
    bool _186 = _184 && _176;
    float _188 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _190 = _162 * _138;
    float _192 = fma(_172, _182, 28.84246826171875);
    float _194 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _196 = _119 * _188;
    float _198 = sqrt(_170);
    float _200 = fma(_172, _192, 19.6966705322265625);
    if (_186)
    {
        _99 = 0.0;
    }
    float _202 = _99;
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
    if (_79)
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
    if (!_91)
    {
        int _272 = _124 | _250;
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
    float _294 = fma(_284, _95, _194);
    float _296 = _190 * _292;
    float _298 = _276 * _252;
    float _300 = _294 + _220;
    float _302 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _296);
    float _304 = fma(_298, _280, _288);
    float _306 = _300 + 1.0;
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _310 = _306 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1108 = float3(_308, _304, _302);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1108, float3(0.0), isnan(_1108))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1108, float3(0.0), isnan(_1108))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float3 _1127 = float3(_310, _304, _302);
    float4 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1127, float3(0.0), isnan(_1127))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1127, float3(0.0), isnan(_1127))).xyzw;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _323.w;
    float _333 = fma(_119, 2.0, -1.0);
    float _335 = in.m_35.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    bool _341 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _343 = (*spvDescriptorSet0.fp_c4)._m0[1].x * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _345 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
    float _347 = _343 + 1.0;
    float _349 = -_345;
    float _351 = fma(_333, _349, _347);
    float _353 = abs(_351);
    float _355 = log2(_353);
    float _357 = _121 * _339;
    float _359 = _355 * 1.5;
    float _361 = -_220;
    float _363 = _196 + _361;
    float _365 = _343 + 2.0;
    bool _367 = _117 >= _357;
    bool _369 = isnan(_117);
    bool _371 = _367 || _369;
    bool _373 = isnan(_357);
    bool _375 = _371 || _373;
    int _377 = _375 ? 1065353216 : 0;
    float _379 = exp2(_359);
    float _381 = _365 * _379;
    float _383 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _385 = 1.0 / _381;
    float _387 = -_315;
    float _389 = _387 + _325;
    float _391 = _333 * _333;
    float _393 = -_317;
    float _395 = _393 + _327;
    float _397 = -_319;
    float _399 = _397 + _329;
    float _401 = fma(_363, _389, _315);
    float _403 = -_343;
    float _405 = _403 + 1.0;
    float _407 = _391 + 1.0;
    float _409 = fma(_363, _395, _317);
    float _411 = fma(_363, _399, _319);
    float _413 = _383 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _415 = _405 * _407;
    float _417 = precise::max(0.0, _409);
    float _419 = _415 * 0.119366206228733062744140625;
    float _421 = precise::max(0.0, _401);
    float _423 = -_321;
    float _425 = _423 + _331;
    float _427 = precise::max(0.0, _411);
    float _429 = _419 * _385;
    float _431 = precise::max(_421, 9.9999997473787516355514526367188e-05);
    float _433 = fma(_363, _425, _321);
    float _435 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _437 = _429 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _439 = precise::max(0.0, _433);
    float _441 = fma(_391, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
    float _443 = 1.0 / _431;
    float _445 = _441 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _447 = _435 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _449 = _439 * _443;
    float _451 = _417 * _449;
    float _453 = _427 * _449;
    float _455 = _421 * _449;
    float _457 = _451 * _413;
    float _459 = _453 * _447;
    float _461 = _437 * _455;
    float _463 = _437 * _457;
    float _465 = _437 * _459;
    float _467 = fma(_445, _421, _461);
    float _469 = fma(_445, _417, _463);
    float _471 = fma(_445, _427, _465);
    float _473 = precise::max(0.0, _467);
    float _475 = precise::max(0.0, _469);
    float _477 = precise::max(0.0, _471);
    float _479 = _473 * (*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _481 = _475 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _483 = _477 * (*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _485 = _467;
    if (!_341)
    {
        out.m_38.x = _479;
        out.m_38.y = _481;
        out.m_38.z = _483;
        out.m_38.w = as_type<float>(_377);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (_79)
    {
        _146 = _105;
    }
    float _487 = _146;
    float _489 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    if (_186)
    {
        _485 = 0.0;
    }
    float _491 = _485;
    float _493 = _491;
    if (!_186)
    {
        _493 = _166;
    }
    float _495 = _493;
    float _497 = _487 * _487;
    float _499 = floor(_489);
    if (!_186)
    {
        _266 = _270;
    }
    float _501 = _266;
    float _503 = _497 + 11.33538818359375;
    float _505 = fma(_497, -0.82336294651031494140625, -5.674867153167724609375);
    float _507 = _178 + _495;
    float _509 = fma(_497, _503, 28.84246826171875);
    float _511 = fma(_497, _505, -6.565555095672607421875);
    float _513 = fma(_497, _509, 19.6966705322265625);
    float _515 = _497 * _511;
    float _517 = _509;
    if (_186)
    {
        _517 = 0.0;
    }
    float _519 = _517;
    float _521 = sqrt(_507);
    float _523 = _519;
    if (!_186)
    {
        _523 = _180;
    }
    float _525 = _523;
    float _527 = _515 * _487;
    float _529 = _198 + _525;
    float _531 = _525;
    if (_186)
    {
        _531 = 1.0;
    }
    float _533 = _531;
    float _535 = 1.0 / _513;
    float _537 = _533;
    if (!_186)
    {
        _537 = -1.0;
    }
    float _539 = _537;
    float _541 = 1.0 / _529;
    float _543 = fma(_140, _539, _521);
    float _545 = fma(_527, _535, _487);
    int _547 = as_type<int>(_545);
    if (_79)
    {
        float _549 = -_545;
        float _551 = _549 + 1.57079637050628662109375;
        _547 = as_type<int>(_551);
    }
    int _553 = _547;
    float _555 = as_type<float>(_553);
    if (!_91)
    {
        int _557 = _124 | _553;
        _555 = as_type<float>(_557);
    }
    float _559 = _555;
    float _561 = fma(0.454545438289642333984375, _559, 0.37000000476837158203125);
    float _563 = fma(_95, _561, _194);
    float _565 = _543 * _541;
    float _567 = _563 + _499;
    float _569 = fma(_280, _565, _501);
    float _571 = _567 + 1.0;
    float _573 = _567 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _575 = _571 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1519 = float3(_573, _569, _302);
    float4 _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1519, float3(0.0), isnan(_1519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1519, float3(0.0), isnan(_1519))).xyzw;
    float _579 = _577.x;
    float _581 = _577.y;
    float _583 = _577.z;
    float _585 = _577.w;
    float3 _1536 = float3(_575, _569, _302);
    float4 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1536, float3(0.0), isnan(_1536))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1536, float3(0.0), isnan(_1536))).xyzw;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float _595 = _587.w;
    float _597 = abs(_347);
    float _599 = log2(_597);
    float _601 = -_499;
    float _603 = _489 + _601;
    float _605 = fma(_343, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _607 = _599 * 1.5;
    float _609 = exp2(_607);
    float _611 = _365 * _609;
    float _613 = 1.0 / _611;
    float _615 = _605 * _613;
    float _617 = _615 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _619 = -_579;
    float _621 = _619 + _589;
    float _623 = -_585;
    float _625 = _623 + _595;
    float _627 = -_581;
    float _629 = _627 + _591;
    float _631 = fma(_603, _621, _579);
    float _633 = fma(_603, _625, _585);
    float _635 = -_583;
    float _637 = _635 + _593;
    float _639 = fma(_603, _629, _581);
    float _641 = precise::max(0.0, _631);
    float _643 = fma(_603, _637, _583);
    float _645 = precise::max(0.0, _633);
    float _647 = precise::max(_641, 9.9999997473787516355514526367188e-05);
    float _649 = precise::max(0.0, _639);
    float _651 = precise::max(0.0, _643);
    float _653 = 1.0 / _647;
    float _655 = _645 * _653;
    float _657 = _649 * _655;
    float _659 = _651 * _655;
    float _661 = _641 * _655;
    float _663 = _413 * _657;
    float _665 = _447 * _659;
    float _667 = (*spvDescriptorSet0.fp_c4)._m0[1].y * 0.0596831031143665313720703125;
    float _669 = _617 * _661;
    float _671 = _617 * _663;
    float _673 = _617 * _665;
    float _675 = fma(_641, _667, _669);
    float _677 = fma(_649, _667, _671);
    float _679 = fma(_651, _667, _673);
    float _681 = precise::max(0.0, _675);
    float _683 = precise::max(0.0, _677);
    float _685 = precise::max(0.0, _679);
    float _687 = -_479;
    float _689 = fma(_681, (*spvDescriptorSet0.fp_c4)._m0[3].x, _687);
    float _691 = -_481;
    float _693 = fma(_683, (*spvDescriptorSet0.fp_c4)._m0[3].y, _691);
    float _695 = -_483;
    float _697 = fma(_685, (*spvDescriptorSet0.fp_c4)._m0[3].z, _695);
    float _699 = fma(_689, (*spvDescriptorSet0.fp_c4)._m0[7].x, _479);
    float _701 = fma(_693, (*spvDescriptorSet0.fp_c4)._m0[7].x, _481);
    float _703 = fma(_697, (*spvDescriptorSet0.fp_c4)._m0[7].x, _483);
    out.m_38.x = _699;
    out.m_38.y = _701;
    out.m_38.z = _703;
    out.m_38.w = as_type<float>(_377);
    return main0_out_u{as_type<uint4>(out.m_38)};
}

