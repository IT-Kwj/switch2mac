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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_71 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_67 [[attribute(12)]];
    float4 m_57 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1409 = false;
    bool _1405 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = in.m_46.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = _99;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2619 = as_type<float>(_124);
        out.gl_Position.z = _2619;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _128 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_99);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_104);
    bool _140 = _108 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _116;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _126 = as_type<int>(_148);
    }
    int _150 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2674 = as_type<float>(_150);
        out.gl_Position.z = _2674;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = 1.0 / _138;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _156 = _108 * _152;
    bool _158 = !_154;
    float _160 = _156;
    float _178;
    if (!_158)
    {
        float _162 = in.m_53.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _156;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _186 = _182 + _184;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _190 = _188 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _192 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _194 = isnan(_182);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _208 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _210 = isnan(_182);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _220;
    bool _224 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _226 = isnan(_182);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = 1.0 / _190;
    float _238 = -_202;
    float _240 = _238 + 1.0;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _244 = _218 * _240;
    float _246 = -_218;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _206;
    float _252 = _222 * _236;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _258 = fma(_252, _186, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _260 = _256 * _250;
    float _262 = _258 * _244;
    float _264 = -_234;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _270 = _182 + _268;
    float _272 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[115].x, _262);
    float _274 = _202 * _266;
    float _276 = fma(_260, _270, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _280 = fma(_276, _274, _272);
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _286 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[117].x, _280);
    float _288 = _278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _290 = _282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _292 = _284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _288;
    out.m_55.y = _290;
    out.m_55.z = _292;
    out.m_55.w = _294;
    bool _296 = !_242;
    if (!_296)
    {
        float _298 = in.m_53.x;
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _160 = _312;
    }
    float _314 = _160;
    float _316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _318 = int(_316);
    float _320 = in.m_44.x;
    float _322 = in.m_44.y;
    float _324 = in.m_44.z;
    float _326 = in.m_53.w;
    float _328 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _330 = int(_328);
    float _332 = in.m_53.x;
    float _334 = in.m_57.w;
    float _336 = float(_318);
    float _338 = 1.0 / _336;
    float _340 = float(uint(_330));
    int _342 = ~_330;
    int _344 = _342 + 1;
    int _346 = ~_330;
    int _348 = _346 + 1;
    float _350 = 1.0 / _340;
    float _352 = _332 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_59.w = _334;
    float _354 = _108 * _338;
    float _356 = trunc(_354);
    int _358 = int(_356);
    float _360 = float(_330);
    int _362 = as_type<int>(_350) + (-2);
    float _364 = float(uint(_358));
    float _366 = as_type<float>(_362) * _364;
    float _368 = trunc(_366);
    float _370 = precise::max(_368, 0.0);
    uint _373 = uint(_370);
    int _375 = _344 * int(_373);
    int _377 = _375 + _358;
    float _379 = float(uint(_377));
    float _381 = as_type<float>(_362) * _379;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _393 = _391 != 0;
    float _395 = in.m_61.x;
    float _397 = in.m_61.y;
    float _399 = in.m_61.z;
    float _401 = in.m_61.w;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _409 = _407 != 0;
    float _411 = trunc(_381);
    float _413 = precise::max(_411, 0.0);
    uint _415 = uint(_413);
    bool _417 = !_389;
    int _419 = _417 ? 0 : 1;
    bool _421 = !_385;
    int _423 = _421 ? 0 : 1;
    bool _425 = !_393;
    int _427 = _425 ? 0 : 1;
    bool _429 = !_405;
    int _431 = _429 ? 0 : 1;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = int(_373) + int(_415);
    float _451 = in.m_63.x;
    float _453 = in.m_63.y;
    float _455 = in.m_63.z;
    float _457 = in.m_63.w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = _322 * _397;
    int _465 = _348 * _449;
    int _467 = _465 + _358;
    float _469 = in.m_65.x;
    float _471 = in.m_65.y;
    float _473 = in.m_65.z;
    float _475 = in.m_65.w;
    bool _477 = !_435;
    int _479 = _477 ? 0 : 1;
    float _481 = fma(_320, _395, _463);
    bool _483 = _326 > 0.5;
    float _485 = in.m_67.y;
    bool _487 = uint(_467) >= uint(_330);
    bool _489 = !_409;
    float _491 = _489 ? 7.345489978790283203125 : 1.0;
    bool _493 = !_487;
    int _495 = _493 ? 0 : (-1);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _499 = _497 != 0;
    float _501 = in.m_69.x;
    float _503 = in.m_69.y;
    float _505 = in.m_69.z;
    int _507 = ~_449;
    int _509 = _507 + _495;
    int _511 = _509 + 1;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _513;
    int _517 = abs(_479);
    int _519 = abs(_423);
    float _521 = _322 * _453;
    float _523 = _322 * _471;
    float _525 = fma(_320, _451, _521);
    float _527 = _491 * _332;
    float _529 = fma(_320, _469, _523);
    float _531 = fma(_324, _399, _481);
    float _533 = fma(_324, _455, _525);
    float _535 = in.m_53.y;
    float _537 = floor(_527);
    float _539 = float(_358);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _545 = fma(_324, _473, _529);
    float _547 = _501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _549 = _539 >= _360;
    bool _551 = isnan(_539);
    bool _553 = _549 || _551;
    bool _555 = isnan(_360);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _108 * _360;
    float _563 = 1.0 / _543;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _567 = _561 * _152;
    int _569 = _330 * _511;
    int _571 = _569 + _358;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _577 = -_565;
    float _579 = fma(_352, 2.0, _577);
    float _581 = trunc(_559);
    int _583 = int(_581);
    float _585 = -_485;
    float _587 = _585 + 1.0;
    float _589 = -_537;
    float _591 = _527 + _589;
    float _593 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _595 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = _483 ? _587 : _485;
    float _599 = _591 * _360;
    bool _601 = _330 == 0;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _605 = _535 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = 1.0 / _575;
    bool _609 = !_601;
    int _611 = _609 ? _571 : (-1);
    float _613 = _515 * _563;
    float _615 = fma(_605, -2.0, _603);
    int _617 = _330 + (-1);
    float _619 = _545 + _475;
    int _621 = ~_583;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = _533 + _457;
    float _629 = trunc(_567);
    int _631 = int(_629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _637 = _611 * _625;
    float _639 = _531 + _401;
    float _641 = _627 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _643 = _583 * _617;
    int _645 = _643 + _637;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _651 = trunc(_599);
    int _653 = int(_651);
    int _655 = abs(_419);
    float _657 = _635 * _607;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _661 = _597;
    float _663 = _485;
    bool _665 = _461;
    int _667 = as_type<int>(_457);
    if (_443)
    {
        float _669 = in.m_53.z;
        _659 = _669;
    }
    float _671 = _659;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _675 = _645 * _655;
    float _677 = 1.0 / _649;
    float _679 = in.m_71.x;
    float _681 = in.m_71.y;
    int _683 = _631 * _519;
    int _685 = _683 + _675;
    float _687 = _447 ? _597 : _485;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _689;
    bool _693 = _535 > 0.5;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _697 = _693;
    if (!_409)
    {
        _661 = _535;
    }
    float _699 = _661;
    int _701 = _653 * _517;
    int _703 = _701 + _358;
    int _705 = abs(_427);
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _709 = abs(_431);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _713 = _314 + _711;
    float _715 = _699;
    if (_461)
    {
        float _717 = _693 ? _587 : _485;
        _663 = _717;
    }
    float _719 = _663;
    int _721 = _703 * _705;
    int _723 = _721 + _685;
    float _725 = _691 * _677;
    float _727 = -_108;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[76].x, _579);
    float _731 = _639 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    if (_439)
    {
        bool _733 = _332 > 0.5;
        _665 = _733;
    }
    bool _735 = _665;
    int _737 = _653 * _709;
    int _739 = _737 + _723;
    if (_409)
    {
        _715 = _332;
    }
    float _741 = _715;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _745 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _681);
    float _747 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _749 = float(uint(_739));
    float _751 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[78].z, _743);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _679);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _757 = _314 + _755;
    float _759 = _747 * _745;
    float _761 = as_type<float>(_362) * _749;
    float _763 = _595 * _753;
    float _765 = fma(_613, _757, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _767 = ~_330;
    int _769 = _767 + 1;
    float _771 = _749;
    int _773 = as_type<int>(_765);
    if (!_409)
    {
        float _775 = in.m_53.z;
        _771 = _775;
    }
    float _777 = _771;
    float _779 = fma(_725, _713, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _781 = trunc(_761);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _314 + _787;
    bool _791 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _793 = isnan(_314);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _707 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _805 = _801;
    if (_443)
    {
        bool _807 = _671 > 0.5;
        _697 = _807;
    }
    bool _809 = _697;
    float _811 = fma(_657, _789, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _813 = in.m_67.x;
    bool _815 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _817 = isnan(_314);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -_801;
    float _829 = _827 + 1.0;
    bool _831 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _833 = isnan(_314);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _505 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _845 = _825 * _829;
    float _847 = -_825;
    float _849 = _847 + 1.0;
    float _851 = fma(_687, _803, -0.5);
    int _853 = _769 * int(_785);
    int _855 = _853 + _739;
    bool _857 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _859 = isnan(_314);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _871 = -_841;
    float _873 = _871 + 1.0;
    float _875 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _719, -0.5);
    float _877 = float(uint(_855));
    float _879 = _867 * _849;
    float _881 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _883 = _801 * _873;
    float _885 = as_type<float>(_362) * _877;
    float _887 = _877;
    float _889 = _777;
    if (!_409)
    {
        _887 = _777;
    }
    float _891 = _887;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _895 = _891;
    if (_409)
    {
        _895 = _535;
    }
    float _897 = _895;
    float _899 = trunc(_885);
    float _901 = precise::max(_899, 0.0);
    uint _903 = uint(_901);
    if (_409)
    {
        _889 = _535;
    }
    float _905 = _889;
    float _907 = _765 * _879;
    int _909 = ~_330;
    int _911 = _909 + 1;
    float _913 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[83].z, _893);
    float _915 = _741 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _917 = _813;
    if (_439)
    {
        float _919 = -_813;
        float _921 = _919 + 1.0;
        _667 = as_type<int>(_921);
    }
    int _923 = _667;
    if (!_439)
    {
        _805 = _813;
    }
    float _925 = _805;
    float _927 = _925;
    if (_443)
    {
        float _929 = -_813;
        float _931 = _929 + 1.0;
        _773 = as_type<int>(_931);
    }
    int _933 = _773;
    float _935 = -_673;
    float _937 = fma(_915, 2.0, _935);
    float _939 = float(uint(_703));
    float _941 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].w, _695);
    if (_439)
    {
        float _943 = _735 ? as_type<float>(_923) : _813;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _615);
    float _949 = -_867;
    float _951 = _949 + 1.0;
    float _953 = as_type<float>(_362) * _939;
    int _955 = int(_785) + int(_903);
    float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[131].x, _907);
    if (_443)
    {
        float _961 = _809 ? as_type<float>(_933) : _813;
        _917 = _961;
    }
    float _963 = _917;
    float _965 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    int _967 = _911 * _955;
    int _969 = _967 + _739;
    float _971 = fma(_811, _845, _959);
    float _973 = -_947;
    float _975 = fma(_965, _875, _973);
    float _977 = trunc(_953);
    float _979 = precise::max(_977, 0.0);
    uint _981 = uint(_979);
    bool _983 = uint(_969) >= uint(_330);
    float _985 = _897 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _987 = ~_330;
    int _989 = _987 + 1;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _993 = !_983;
    int _995 = _993 ? 0 : (-1);
    float _997 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _913);
    float _999 = fma(_985, -2.0, _991);
    int _1001 = ~_955;
    int _1003 = _1001 + _995;
    int _1005 = _1003 + 1;
    float _1007 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    float _1009 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _941);
    float _1011 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1013 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1015 = _330 * _1005;
    int _1017 = _1015 + _739;
    float _1019 = _957 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1021 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _999);
    float _1023 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1011);
    bool _1025 = !_601;
    int _1027 = _1025 ? _1017 : (-1);
    int _1029 = _989 * int(_981);
    int _1031 = _1029 + _703;
    float _1033 = -_108;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[81].x, _937);
    float _1037 = fma(_1019, _963, -0.5);
    int _1039 = _1027 >> 31;
    float _1041 = _619 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1043 = float(uint(_1031));
    float _1045 = -_1021;
    float _1047 = fma(_1009, _851, _1045);
    int _1049 = _1039 & 3;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1023);
    int _1053 = _1027 & 3;
    bool _1055 = _1053 != 0;
    float _1057 = as_type<float>(_362) * _1043;
    int _1059 = _1027 + _1049;
    float _1061 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1063 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1065 = trunc(_1057);
    float _1067 = precise::max(_1065, 0.0);
    uint _1069 = uint(_1067);
    int _1071 = _1059 >> 2;
    float _1073 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1061);
    float _1075 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1063);
    float _1077 = fma(_1007, _1013, _729);
    int _1079 = _1071 << 4;
    int _1081 = _1079 + 368;
    float _1083 = fma(_997, _1037, _1035);
    int _1085 = ~_330;
    int _1087 = _1085 + 1;
    float _1089 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    uint _1091 = uint(int(uint(_1081) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[int(_1101)][_1103];
    float _1107 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1073);
    float _1109 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1075);
    float _1111 = _1051 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1113 = fma(_779, _883, _971);
    float _1115 = _1107 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _1119 = int(_981) + int(_1069);
    int _1121 = _1081 + 8;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[int(_1133)][_1135];
    int _1139 = _1027 & 3;
    bool _1141 = _1139 != 0;
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1145 = _1055 ? 0 : 1;
    int _1147 = _1087 * _1119;
    int _1149 = _1147 + _703;
    bool _1151 = uint(_1139) > 1u;
    float _1153 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1113);
    bool _1155 = _1139 != 3;
    float _1157 = _1111 * _1089;
    bool _1159 = uint(_1139) >= 2u;
    float _1161 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1163 = ~_1145;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = fma(_1157, 0.5, 0.5);
    bool _1171 = uint(_1149) >= uint(_330);
    int _1173 = _1159 ? 0 : 1;
    bool _1175 = !_1171;
    int _1177 = _1175 ? 0 : (-1);
    float _1179 = _1115 * _1143;
    int _1181 = _1167;
    if (!_1151)
    {
        int _1183 = ~_1145;
        int _1185 = _1183 + 1;
        _1181 = _1185;
    }
    int _1187 = _1181;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _1191 = !_1141;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = fma(_1179, 0.5, 0.5);
    int _1197 = abs(_1187);
    int _1199 = ~_1173;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    int _1205 = abs(_1193);
    int _1207 = _1203;
    if (_1155)
    {
        int _1209 = ~_1173;
        int _1211 = _1209 + 1;
        _1207 = _1211;
    }
    int _1213 = _1207;
    int _1215 = ~_1119;
    int _1217 = _1215 + _1177;
    int _1219 = _1217 + 1;
    int _1221 = abs(_1213);
    float _1223 = _1117 * _1189;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    int _1231 = _330 * _1219;
    int _1233 = _1231 + _703;
    bool _1235 = _1139 != 3;
    float _1237 = fma(_1223, 0.5, 0.5);
    int _1239 = ~_1205;
    int _1241 = _1239 + 1;
    int _1243 = _1241 + 1;
    int _1245 = _1229 * as_type<int>(_1105);
    float _1247 = floor(_1169);
    bool _1249 = !_1235;
    int _1251 = _1249 ? 0 : (-1);
    int _1253 = _1243 * as_type<int>(_1097);
    int _1255 = _1253 + _1245;
    int _1257 = ~_1221;
    int _1259 = _1257 + 1;
    int _1261 = _1259 + 1;
    int _1263 = abs(_1251);
    bool _1265 = !_499;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1261 * as_type<int>(_1129);
    int _1271 = _1269 + _1255;
    float _1273 = floor(_1195);
    int _1275 = abs(_1267);
    float _1277 = _975 + 0.5;
    int _1279 = ~_1263;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    float _1285 = _1077 + 0.5;
    int _1287 = ~_1275;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = _1083 + 0.5;
    int _1295 = _1283 * as_type<int>(_1137);
    int _1297 = _1295 + _1271;
    float _1299 = _1047 + 0.5;
    float _1301 = floor(_1237);
    float _1303 = -_1247;
    float _1305 = _1169 + _1303;
    int _1307 = _1297 * _1291;
    bool _1309 = !_601;
    int _1311 = _1309 ? _1233 : (-1);
    out.m_73.x = _1285;
    out.m_73.y = _1277;
    out.m_73.z = _1293;
    out.m_73.w = _1299;
    float _1313 = -_1273;
    float _1315 = _1195 + _1313;
    int _1317 = _1311 * _1275;
    int _1319 = _1317 + _1307;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1325 = fma(_1305, 2.0, -1.0);
    float _1327 = -_1301;
    float _1329 = _1237 + _1327;
    float _1331 = fma(_1315, 2.0, -1.0);
    float _1333 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1335 = float(_1319);
    float _1337 = fma(_1329, 2.0, -1.0);
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _1335;
    float _1343 = _1325 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1345 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1349 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(1.0);
    bool _1357 = _1353 || _1355;
    float _1359 = _1331 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1361 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1363 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1365 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_77.x = _1333;
    out.m_77.y = _1345;
    out.m_77.z = _1347;
    out.m_77.w = _1341;
    float _1367 = _1337 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1369 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1361);
    float _1371 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1363);
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1365);
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1369);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1371);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1373);
    float _1381 = _1375 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1383 = _1377 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1385 = _1379 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1387 = _1335;
    float _1389 = _1335;
    float _1391 = _1331;
    float _1393 = _1325;
    float _1395 = _1373;
    float _1397 = _1337;
    float _1399 = _1341;
    float _1407;
    if (!_1357)
    {
        bool _1401 = _1383 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1403 = !_1401;
        _1405 = _1403;
        if (!_1405)
        {
            _1407 = 0.0;
            _1409 = true;
        }
    }
    if ((!_1409) || _1405)
    {
        bool _1433;
        if (!_1405)
        {
            bool _1411 = _1383 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1413 = isnan(_1383);
            bool _1415 = _1411 || _1413;
            bool _1417 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1419 = _1415 || _1417;
            bool _1421 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1423 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1425 = !_1419;
            bool _1427 = _1423 && _1425;
            if (_1427)
            {
                _1387 = 0.0;
            }
            float _1429 = _1387;
            bool _1431 = !_1419;
            _1433 = _1431 && _1421;
            _1389 = _1429;
            _1407 = _1429;
        }
        if ((!_1433) || _1405)
        {
            _1405 = false;
            float _1435 = _1389;
            bool _1437 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1439 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1441 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1443 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1445 = _1435;
            if (_1437)
            {
                float _1447 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1443 = _1447;
            }
            float _1449 = _1443;
            if (_1437)
            {
                float _1451 = abs(_1331);
                float _1453 = -_1451;
                float _1455 = _1453 + 1.0;
                _1391 = _1455;
            }
            float _1457 = _1391;
            if (_1439)
            {
                float _1459 = abs(_1325);
                float _1461 = -_1459;
                float _1463 = _1461 + 1.0;
                _1393 = _1463;
            }
            float _1465 = _1393;
            if (!_1437)
            {
                _1395 = 1.0;
            }
            float _1467 = _1395;
            float _1469 = _1467;
            if (_1441)
            {
                float _1471 = abs(_1337);
                float _1473 = -_1471;
                float _1475 = _1473 + 1.0;
                _1397 = _1475;
            }
            float _1477 = _1397;
            if (!_1439)
            {
                _1399 = 1.0;
            }
            float _1479 = _1399;
            float _1481 = _1479;
            if (!_1441)
            {
                _1445 = 1.0;
            }
            float _1483 = _1445;
            float _1485 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
            float _1487 = _1483;
            if (_1439)
            {
                float _1489 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1485 = _1489;
            }
            float _1491 = _1485;
            float _1493 = _1083;
            if (_1441)
            {
                float _1495 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1493 = _1495;
            }
            float _1497 = _1493;
            if (_1437)
            {
                float _1499 = _1457 * _1449;
                float _1501 = precise::clamp(_1499, 0.0, 1.0);
                _1469 = _1501;
            }
            float _1503 = _1469;
            if (_1439)
            {
                float _1505 = _1465 * _1491;
                float _1507 = precise::clamp(_1505, 0.0, 1.0);
                _1481 = _1507;
            }
            float _1509 = _1481;
            float _1511 = _1503 * _1509;
            if (_1441)
            {
                float _1513 = _1477 * _1497;
                float _1515 = precise::clamp(_1513, 0.0, 1.0);
                _1487 = _1515;
            }
            float _1517 = _1487;
            float _1519 = _1511 * _1517;
            _1407 = _1519;
        }
    }
    _1409 = false;
    float _1521 = _1407;
    float _1523 = -_1383;
    float _1525 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1527 = -_1381;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1531 = -_1385;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1535 = _1525 * _1525;
    float _1537 = fma(_1529, _1529, _1535);
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1541 = fma(_1533, _1533, _1537);
    float _1543 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1545 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1547 = rsqrt(_1541);
    float _1549 = -_1543;
    float _1551 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1549);
    float _1553 = -_1545;
    float _1555 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1553);
    float _1557 = -_1539;
    float _1559 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1557);
    float _1561 = _1529 * _1547;
    float _1563 = _1533 * _1547;
    float _1565 = _1525 * _1547;
    float _1567 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1569 = _1561 * _1561;
    float _1571 = fma(_1563, _1563, _1569);
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1575 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1577 = rsqrt(_1571);
    float _1579 = -_1573;
    float _1581 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1579);
    float _1583 = -_1575;
    float _1585 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1583);
    float _1587 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1591 = -_1587;
    float _1593 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1591);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1597 = -_1589;
    float _1599 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1597);
    float _1601 = -_1595;
    float _1603 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1605 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1599);
    float _1607 = _1563 * _1577;
    float _1609 = _1561 * _1577;
    float _1611 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1603);
    float _1613 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1615 = -_1607;
    float _1617 = _1563 * _1615;
    float _1619 = -_1607;
    float _1621 = _1565 * _1619;
    float _1623 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1625 = -_1613;
    float _1627 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1625);
    float _1629 = -_1617;
    float _1631 = fma(_1561, _1609, _1629);
    float _1633 = _1565 * _1609;
    float _1635 = -_1623;
    float _1637 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1635);
    float _1639 = -_1567;
    float _1641 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1643 = _1631 * _1631;
    float _1645 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1627);
    float _1647 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1649 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1641);
    float _1651 = fma(_1633, _1633, _1643);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1637);
    float _1655 = -_1647;
    float _1657 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1655);
    float _1659 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1661 = fma(_1621, _1621, _1651);
    float _1663 = -_1649;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1653);
    float _1667 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1657);
    float _1669 = -_1659;
    float _1671 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1669);
    float _1673 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1675 = 1.0 / _1665;
    float _1677 = in.m_71.z;
    float _1679 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1671);
    float _1681 = -_1673;
    float _1683 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1685 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1683);
    float _1687 = rsqrt(_1661);
    float _1689 = fma(_1667, _1675, -1.0);
    float _1691 = _1631 * _1687;
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = _1161 * _1677;
    float _1697 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1699 = -_1693;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1697);
    float _1705 = _1701 * _1675;
    float _1707 = fma(_1701, _1689, 1.0);
    float _1709 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    float _1711 = _1679 * _1705;
    float _1713 = _1707 * _1707;
    float _1715 = _1685 * _1705;
    float _1717 = fma(_1711, _1711, _1713);
    float _1719 = fma(_1715, _1715, _1717);
    float _1721 = rsqrt(_1719);
    float _1723 = _1715 * _1721;
    float _1725 = _1711 * _1721;
    float _1727 = _1707 * _1721;
    float _1729 = -_1723;
    float _1731 = _1561 * _1729;
    float _1733 = _1563 * _1727;
    float _1735 = -_1725;
    float _1737 = -_1731;
    float _1739 = fma(_1563, _1735, _1737);
    float _1741 = -_1725;
    float _1743 = _1565 * _1741;
    float _1745 = -_1723;
    float _1747 = -_1733;
    float _1749 = fma(_1565, _1745, _1747);
    float _1751 = _1739 * _1739;
    float _1753 = -_1743;
    float _1755 = fma(_1561, _1727, _1753);
    float _1757 = fma(_1749, _1749, _1751);
    float _1759 = fma(_1755, _1755, _1757);
    float _1761 = rsqrt(_1759);
    float _1763 = _1749 * _1761;
    float _1765 = _1755 * _1761;
    float _1767 = _1739 * _1761;
    float _1769 = _1563 * _1763;
    float _1771 = _1565 * _1765;
    float _1773 = -_1769;
    float _1775 = fma(_1561, _1765, _1773);
    float _1777 = _1561 * _1767;
    float _1779 = -_1771;
    float _1781 = fma(_1563, _1767, _1779);
    float _1783 = _1775 * _1775;
    float _1785 = -_1777;
    float _1787 = fma(_1565, _1763, _1785);
    float _1789 = fma(_1781, _1781, _1783);
    float _1791 = fma(_1787, _1787, _1789);
    float _1793 = rsqrt(_1791);
    float _1795 = _1787 * _1793;
    float _1797 = _1781 * _1793;
    float _1799 = _1775 * _1793;
    float _1801 = _1561 * _1795;
    float _1803 = _1565 * _1797;
    float _1805 = _1563 * _1799;
    float _1807 = _759 * _1795;
    float _1809 = -_1801;
    float _1811 = fma(_1563, _1797, _1809);
    float _1813 = -_1803;
    float _1815 = fma(_1561, _1799, _1813);
    float _1817 = -_1805;
    float _1819 = fma(_1565, _1795, _1817);
    float _1821 = _759 * _1797;
    float _1823 = _1811 * _1811;
    float _1825 = _759 * _1799;
    float _1827 = fma(_1819, _1819, _1823);
    float _1829 = fma(_1815, _1815, _1827);
    float _1831 = rsqrt(_1829);
    float _1833 = _763 * _1831;
    float _1835 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1837 = fma(_1815, _1833, _1807);
    float _1839 = fma(_1819, _1833, _1821);
    float _1841 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1835);
    float _1843 = fma(_1811, _1833, _1825);
    float _1845 = fma(_1695, _1563, _1837);
    float _1847 = fma(_1695, _1561, _1839);
    float _1849 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1841);
    float _1853 = _1385 + _1845;
    float _1855 = _1381 + _1847;
    float _1857 = 1.0 / _1849;
    float _1859 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1863 = _1853 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1867 = _1855 + _1865;
    float _1869 = _1859 + _1849;
    float _1871 = _1863 * _1863;
    float _1873 = fma(_1695, _1565, _1843);
    bool _1875 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan(0.5);
    bool _1883 = _1879 || _1881;
    float _1885 = fma(_1867, _1867, _1871);
    float _1887 = _1383 + _1873;
    float _1889 = sqrt(_1885);
    bool _1891 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.5);
    bool _1899 = _1895 || _1897;
    float _1901 = _1869 * _1857;
    float _1903 = _1901 * 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = 1.0 / _1907;
    bool _1911 = _1889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1915 = _1855;
    float _1917 = _1887;
    float _1919 = _1867;
    float _1921 = _1863;
    float _1923 = _1843;
    float _1925 = _1621;
    if (!_1911)
    {
        _1913 = _1853;
    }
    float _1927 = _1913;
    bool _1929 = !_1911;
    float _1931 = _1927;
    if (!_1929)
    {
        float _1933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1937 = _1889 + _1935;
        float _1939 = rsqrt(_1885);
        float _1941 = _1937 * _1933;
        float _1943 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1945 = _1941 * 0.15915493667125701904296875;
        float _1947 = _1945 * 6.283185482025146484375;
        float _1949 = cos(_1947);
        float _1951 = _1945 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        float _1955 = _1949 + (-1.0);
        float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = fma(_1953, _1943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1961 = fma(_1887, _1949, _1957);
        float _1963 = _1939 * _1959;
        float _1965 = fma(_1867, _1963, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1967 = fma(_1863, _1963, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1915 = _1965;
        _1917 = _1961;
        _1931 = _1967;
    }
    float _1969 = _1915;
    float _1971 = _1917;
    float _1973 = _1931;
    float _1975 = _1971;
    float _1977 = _1969;
    float _1979 = _1973;
    if (_1899)
    {
        _1919 = 1.0;
    }
    float _1981 = _1919;
    float _1983 = _1981;
    if (!_1883)
    {
        float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1987 = _1383 + _1985;
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1991 = _1381 + _1989;
        float _1993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1995 = -_1381;
        float _1997 = _1995 + _1969;
        float _1999 = _1987 * _1987;
        float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2003 = _1385 + _2001;
        float _2005 = fma(_1991, _1991, _1999);
        float _2007 = fma(_2003, _2003, _2005);
        float _2009 = sqrt(_2007);
        float _2011 = precise::min(_2009, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2013 = _2011 * _1993;
        float _2015 = -_1383;
        float _2017 = _2015 + _1971;
        float _2019 = -_1385;
        float _2021 = _2019 + _1973;
        float _2023 = fma(_1997, _2013, _1381);
        float _2025 = fma(_2017, _2013, _1383);
        float _2027 = fma(_2021, _2013, _1385);
        _1975 = _2025;
        _1977 = _2023;
        _1979 = _2027;
        _1921 = _2009;
    }
    float _2029 = _1975;
    float _2031 = _1977;
    float _2033 = _1979;
    float _2035 = _1921;
    float _2037 = _2035;
    if (_1899)
    {
        _2037 = 1.0;
    }
    float _2039 = _2037;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2043 = _1909 * _2041;
    float _2045 = _2039;
    if (!_1899)
    {
        float _2047 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2049 = _2047 * 0.15915493667125701904296875;
        float _2051 = _2049 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2057 = _2055 * 0.15915493667125701904296875;
        float _2059 = _2049 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        float _2063 = 1.0 / _2053;
        float _2065 = _2057 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2061 * _2063;
        float _2071 = _2057 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = 1.0 / _2075;
        float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2081 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2079;
        float _2083 = 1.0 / _2081;
        float _2085 = _2073 * _2077;
        float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2089 = fma(_2043, _2085, _2087);
        float _2091 = _2089 * _2083;
        float _2093 = precise::clamp(_2091, 0.0, 1.0);
        _1983 = _2093;
    }
    float _2095 = _1983;
    if (!_1899)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2099 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2107 = _2105 * 0.15915493667125701904296875;
        float _2109 = _2099 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = 1.0 / _2103;
        float _2115 = _2107 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = _2107 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2117 * _2119;
        float _2127 = 1.0 / _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2129;
        float _2133 = 1.0 / _2131;
        float _2135 = _2123 * _2127;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2139 = fma(_2043, _2135, _2137);
        float _2141 = _2139 * _2133;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        float _2145 = -_2143;
        float _2147 = _2145 + 1.0;
        _2045 = _2147;
    }
    float _2149 = _2045;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2153 = _2029 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2157 = _2031 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2161 = _2033 + _2159;
    float _2163 = _2153 * _2153;
    float _2165 = fma(_2157, _2157, _2163);
    float _2167 = fma(_2161, _2161, _2165);
    float _2169 = rsqrt(_2167);
    float _2171 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2173 = _2157 * _2171;
    float _2175 = _2161 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 * _2175;
    float _2181 = _2177 + _2179;
    float _2183 = sqrt(_2181);
    bool _2185 = _2183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2189 = _2183 + _2187;
    float _2191 = _2169;
    float _2193 = _2181;
    float _2195 = _2189;
    float _2197 = _2153;
    float _2199 = _2173;
    if (_2185)
    {
        float _2201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2191 = _2201;
    }
    float _2203 = _2191;
    if (_2185)
    {
        float _2205 = rsqrt(_2181);
        _2193 = _2205;
    }
    float _2207 = _2193;
    if (_2185)
    {
        float _2209 = _2189 * _2203;
        _2195 = _2209;
    }
    float _2211 = _2195;
    if (_2185)
    {
        float _2213 = _2211 * 0.15915493667125701904296875;
        _1923 = _2213;
    }
    float _2215 = _1923;
    float _2217 = _2203;
    if (_2185)
    {
        float _2219 = _2215 * 6.283185482025146484375;
        float _2221 = sin(_2219);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2227 = precise::max(0.0, _2225);
    float _2229 = _2161;
    float _2231 = _2227;
    if (_2185)
    {
        float _2233 = _2215 * 6.283185482025146484375;
        float _2235 = cos(_2233);
        _2229 = _2235;
    }
    float _2237 = _2229;
    float _2239 = -_2171;
    float _2241 = -_2227;
    float _2243 = fma(_2153, _2239, _2241);
    float _2245 = _2243;
    if (!_2185)
    {
        _2197 = _2175;
    }
    float _2247 = _2197;
    float _2249 = _2247;
    if (_2185)
    {
        float _2251 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2231 = _2251;
    }
    float _2253 = _2231;
    float _2255 = sqrt(_2167);
    float _2257 = _2223;
    float _2259 = _2253;
    if (_2185)
    {
        float _2261 = fma(_2223, _2253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2257 = _2261;
    }
    float _2263 = _2257;
    float _2265 = _2263;
    float _2267 = _2237;
    if (_2185)
    {
        float _2269 = _2237 + (-1.0);
        _2259 = _2269;
    }
    float _2271 = _2259;
    float _2273 = _2271;
    if (_2185)
    {
        float _2275 = _2207 * _2263;
        _1925 = _2275;
    }
    float _2277 = _1925;
    if (_2185)
    {
        float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2265 = _2279;
    }
    float _2281 = _2265;
    if (_2185)
    {
        float _2283 = _2173 * _2277;
        _2199 = _2283;
    }
    float _2285 = _2199;
    if (!_2185)
    {
        _2273 = _2177;
    }
    float _2287 = _2273;
    float _2289 = _2287;
    if (_2185)
    {
        float _2291 = _2175 * _2277;
        _2249 = _2291;
    }
    float _2293 = _2249;
    if (_2185)
    {
        float _2295 = fma(_2243, _2237, _2281);
        _2245 = _2295;
    }
    float _2297 = _2245;
    if (_2185)
    {
        float _2299 = _2285 * _2285;
        _2289 = _2299;
    }
    float _2301 = _2289;
    if (!_2185)
    {
        _2267 = _2179;
    }
    float _2303 = _2267;
    float _2305 = _2303;
    if (_2185)
    {
        float _2307 = _2293 * _2293;
        _2305 = _2307;
    }
    float _2309 = _2305;
    float _2311 = fma(_2297, _2297, _2301);
    float _2313 = _2311 + _2309;
    float _2315 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2319 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2317);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2325 = rsqrt(_2313);
    float _2327 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2315);
    float _2329 = -_2321;
    float _2331 = _2329 + 1.0;
    float _2333 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2323);
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2337 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2327);
    float _2339 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2343 = abs(_2331);
    float _2345 = log2(_2343);
    float _2347 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2333);
    float _2349 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2351 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2341);
    float _2353 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2355 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2349);
    float _2357 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2359 = _2325 * _2285;
    float _2361 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2351);
    float _2363 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2365 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2367 = _2325 * _2297;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2371 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2373 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2365);
    float _2375 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2377 = _2325 * _2293;
    float _2379 = -_2369;
    float _2381 = fma(_2367, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2379);
    float _2383 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2373);
    float _2387 = -_2371;
    float _2389 = fma(_2387, _2335, 1.0);
    float _2391 = -_2377;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2381);
    float _2395 = exp2(_2375);
    float _2397 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2385);
    float _2399 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2401 = fma(_2393, -0.5, 0.5);
    float _2403 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = _2367 + 1.0;
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2399);
    float _2409 = fma(_2393, 0.5, 0.5);
    float _2411 = log2(_2389);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2415 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2407);
    float _2417 = fma(_2409, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2419 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2413);
    float _2421 = fma(_2409, _2417, -0.212114393711090087890625);
    float _2423 = 1.0 / _2397;
    float _2425 = -_2367;
    float _2427 = fma(_2395, _2405, _2425);
    float _2429 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2415);
    float _2431 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2433 = fma(_2409, _2421, 1.570728778839111328125);
    float _2435 = fma(_2427, 0.5, 0.5);
    float _2437 = sqrt(_2401);
    float _2439 = _2411 * 0.693147182464599609375;
    float _2441 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2443 = _2429 * _2423;
    float _2445 = _2431 * _2423;
    float _2447 = fma(_2443, 0.5, 0.5);
    float _2449 = fma(_2445, -0.5, 0.5);
    float _2451 = _2437 * 0.636619746685028076171875;
    float3 _6276 = float3(_2447, _2449, _2441);
    float _2453 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6276, float3(0.0), isnan(_6276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6276, float3(0.0), isnan(_6276)), level(0.0)).x;
    float3 _6287 = float3(_2447, _2449, _2441);
    float4 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6287, float3(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6287, float3(0.0), isnan(_6287)), level(0.0)).xyzw;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = _2456.w;
    float _2466 = -_2433;
    float _2468 = fma(_2451, _2466, 1.0);
    float2 _6309 = float2(_2468, _2435);
    float3 _2472 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6309, float2(0.0), isnan(_6309)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6309, float2(0.0), isnan(_6309)), level(0.0)).xyz;
    float _2474 = _2472.x;
    float _2476 = _2472.y;
    float _2478 = _2472.z;
    float _2480 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2482 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2484 = _2095 * _2149;
    bool _2486 = _2095 > 0.0;
    bool _2488 = isnan(_2095);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    out.m_79.x = _1381;
    out.m_79.y = _1383;
    out.m_79.z = _1385;
    float _2496 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    float _2498 = exp2(_2480);
    float _2500 = _2484 * _1521;
    bool _2502 = _2149 <= 0.0;
    bool _2504 = !_2494;
    bool _2506 = _2502 || _2504;
    float _2508 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2496);
    float _2510 = _2429 + _2397;
    float _2512 = _2500 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2514 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2508);
    float _2516 = _2397 * 0.5;
    float _2518 = _2512 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2520 = _2514 + _2397;
    float _2522 = fma(_2431, -0.5, _2516);
    float _2524 = _2510 * 0.5;
    out.gl_Position.x = _2429;
    out.gl_Position.y = _2431;
    out.gl_Position.z = _2514;
    out.gl_Position.w = _2397;
    float _2526 = _2520 * 0.5;
    float _2528 = -_2498;
    float _2530 = _2528 + 1.0;
    out.m_51.x = _2518;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2524;
    out.m_81.y = _2522;
    out.m_81.z = _2526;
    out.m_81.w = _2397;
    float _2534 = _2532 * _2453;
    float _2536 = -_2532;
    float _2538 = _2536 + 1.0;
    float _2540 = _2464 * _2534;
    float _2542 = _2464 * _2538;
    float _2544 = _2478 * _2534;
    float _2546 = fma(_2474, _2540, _2458);
    float _2548 = fma(_2476, _2540, _2460);
    float _2550 = fma(_2464, _2544, _2462);
    out.m_83.x = _2546;
    out.m_83.y = _2548;
    out.m_83.z = _2550;
    out.m_83.w = _2542;
    if (!_2506)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2552;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1409 = false;
    bool _1405 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = in.m_46.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = _99;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2619 = as_type<float>(_124);
        out.gl_Position.z = _2619;
    }
    if (!_112)
    {
        return out;
    }
    bool _128 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_99);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_104);
    bool _140 = _108 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _116;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _126 = as_type<int>(_148);
    }
    int _150 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2674 = as_type<float>(_150);
        out.gl_Position.z = _2674;
    }
    if (_144)
    {
        return out;
    }
    float _152 = 1.0 / _138;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _156 = _108 * _152;
    bool _158 = !_154;
    float _160 = _156;
    float _178;
    if (!_158)
    {
        float _162 = in.m_53.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _156;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _186 = _182 + _184;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _190 = _188 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _192 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _194 = isnan(_182);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _208 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _210 = isnan(_182);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _220;
    bool _224 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _226 = isnan(_182);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = 1.0 / _190;
    float _238 = -_202;
    float _240 = _238 + 1.0;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _244 = _218 * _240;
    float _246 = -_218;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _206;
    float _252 = _222 * _236;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _258 = fma(_252, _186, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _260 = _256 * _250;
    float _262 = _258 * _244;
    float _264 = -_234;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _270 = _182 + _268;
    float _272 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[115].x, _262);
    float _274 = _202 * _266;
    float _276 = fma(_260, _270, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _280 = fma(_276, _274, _272);
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _286 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[117].x, _280);
    float _288 = _278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _290 = _282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _292 = _284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _288;
    out.m_55.y = _290;
    out.m_55.z = _292;
    out.m_55.w = _294;
    bool _296 = !_242;
    if (!_296)
    {
        float _298 = in.m_53.x;
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _160 = _312;
    }
    float _314 = _160;
    float _316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _318 = int(_316);
    float _320 = in.m_44.x;
    float _322 = in.m_44.y;
    float _324 = in.m_44.z;
    float _326 = in.m_53.w;
    float _328 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _330 = int(_328);
    float _332 = in.m_53.x;
    float _334 = in.m_57.w;
    float _336 = float(_318);
    float _338 = 1.0 / _336;
    float _340 = float(uint(_330));
    int _342 = ~_330;
    int _344 = _342 + 1;
    int _346 = ~_330;
    int _348 = _346 + 1;
    float _350 = 1.0 / _340;
    float _352 = _332 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_59.w = _334;
    float _354 = _108 * _338;
    float _356 = trunc(_354);
    int _358 = int(_356);
    float _360 = float(_330);
    int _362 = as_type<int>(_350) + (-2);
    float _364 = float(uint(_358));
    float _366 = as_type<float>(_362) * _364;
    float _368 = trunc(_366);
    float _370 = precise::max(_368, 0.0);
    uint _373 = uint(_370);
    int _375 = _344 * int(_373);
    int _377 = _375 + _358;
    float _379 = float(uint(_377));
    float _381 = as_type<float>(_362) * _379;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _393 = _391 != 0;
    float _395 = in.m_61.x;
    float _397 = in.m_61.y;
    float _399 = in.m_61.z;
    float _401 = in.m_61.w;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _409 = _407 != 0;
    float _411 = trunc(_381);
    float _413 = precise::max(_411, 0.0);
    uint _415 = uint(_413);
    bool _417 = !_389;
    int _419 = _417 ? 0 : 1;
    bool _421 = !_385;
    int _423 = _421 ? 0 : 1;
    bool _425 = !_393;
    int _427 = _425 ? 0 : 1;
    bool _429 = !_405;
    int _431 = _429 ? 0 : 1;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = int(_373) + int(_415);
    float _451 = in.m_63.x;
    float _453 = in.m_63.y;
    float _455 = in.m_63.z;
    float _457 = in.m_63.w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = _322 * _397;
    int _465 = _348 * _449;
    int _467 = _465 + _358;
    float _469 = in.m_65.x;
    float _471 = in.m_65.y;
    float _473 = in.m_65.z;
    float _475 = in.m_65.w;
    bool _477 = !_435;
    int _479 = _477 ? 0 : 1;
    float _481 = fma(_320, _395, _463);
    bool _483 = _326 > 0.5;
    float _485 = in.m_67.y;
    bool _487 = uint(_467) >= uint(_330);
    bool _489 = !_409;
    float _491 = _489 ? 7.345489978790283203125 : 1.0;
    bool _493 = !_487;
    int _495 = _493 ? 0 : (-1);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _499 = _497 != 0;
    float _501 = in.m_69.x;
    float _503 = in.m_69.y;
    float _505 = in.m_69.z;
    int _507 = ~_449;
    int _509 = _507 + _495;
    int _511 = _509 + 1;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _513;
    int _517 = abs(_479);
    int _519 = abs(_423);
    float _521 = _322 * _453;
    float _523 = _322 * _471;
    float _525 = fma(_320, _451, _521);
    float _527 = _491 * _332;
    float _529 = fma(_320, _469, _523);
    float _531 = fma(_324, _399, _481);
    float _533 = fma(_324, _455, _525);
    float _535 = in.m_53.y;
    float _537 = floor(_527);
    float _539 = float(_358);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _545 = fma(_324, _473, _529);
    float _547 = _501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _549 = _539 >= _360;
    bool _551 = isnan(_539);
    bool _553 = _549 || _551;
    bool _555 = isnan(_360);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _108 * _360;
    float _563 = 1.0 / _543;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _567 = _561 * _152;
    int _569 = _330 * _511;
    int _571 = _569 + _358;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _577 = -_565;
    float _579 = fma(_352, 2.0, _577);
    float _581 = trunc(_559);
    int _583 = int(_581);
    float _585 = -_485;
    float _587 = _585 + 1.0;
    float _589 = -_537;
    float _591 = _527 + _589;
    float _593 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _595 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = _483 ? _587 : _485;
    float _599 = _591 * _360;
    bool _601 = _330 == 0;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _605 = _535 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = 1.0 / _575;
    bool _609 = !_601;
    int _611 = _609 ? _571 : (-1);
    float _613 = _515 * _563;
    float _615 = fma(_605, -2.0, _603);
    int _617 = _330 + (-1);
    float _619 = _545 + _475;
    int _621 = ~_583;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = _533 + _457;
    float _629 = trunc(_567);
    int _631 = int(_629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _637 = _611 * _625;
    float _639 = _531 + _401;
    float _641 = _627 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _643 = _583 * _617;
    int _645 = _643 + _637;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _651 = trunc(_599);
    int _653 = int(_651);
    int _655 = abs(_419);
    float _657 = _635 * _607;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _661 = _597;
    float _663 = _485;
    bool _665 = _461;
    int _667 = as_type<int>(_457);
    if (_443)
    {
        float _669 = in.m_53.z;
        _659 = _669;
    }
    float _671 = _659;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _675 = _645 * _655;
    float _677 = 1.0 / _649;
    float _679 = in.m_71.x;
    float _681 = in.m_71.y;
    int _683 = _631 * _519;
    int _685 = _683 + _675;
    float _687 = _447 ? _597 : _485;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _689;
    bool _693 = _535 > 0.5;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _697 = _693;
    if (!_409)
    {
        _661 = _535;
    }
    float _699 = _661;
    int _701 = _653 * _517;
    int _703 = _701 + _358;
    int _705 = abs(_427);
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _709 = abs(_431);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _713 = _314 + _711;
    float _715 = _699;
    if (_461)
    {
        float _717 = _693 ? _587 : _485;
        _663 = _717;
    }
    float _719 = _663;
    int _721 = _703 * _705;
    int _723 = _721 + _685;
    float _725 = _691 * _677;
    float _727 = -_108;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[76].x, _579);
    float _731 = _639 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    if (_439)
    {
        bool _733 = _332 > 0.5;
        _665 = _733;
    }
    bool _735 = _665;
    int _737 = _653 * _709;
    int _739 = _737 + _723;
    if (_409)
    {
        _715 = _332;
    }
    float _741 = _715;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _745 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _681);
    float _747 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _749 = float(uint(_739));
    float _751 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[78].z, _743);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _679);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _757 = _314 + _755;
    float _759 = _747 * _745;
    float _761 = as_type<float>(_362) * _749;
    float _763 = _595 * _753;
    float _765 = fma(_613, _757, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _767 = ~_330;
    int _769 = _767 + 1;
    float _771 = _749;
    int _773 = as_type<int>(_765);
    if (!_409)
    {
        float _775 = in.m_53.z;
        _771 = _775;
    }
    float _777 = _771;
    float _779 = fma(_725, _713, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _781 = trunc(_761);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _314 + _787;
    bool _791 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _793 = isnan(_314);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _707 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _805 = _801;
    if (_443)
    {
        bool _807 = _671 > 0.5;
        _697 = _807;
    }
    bool _809 = _697;
    float _811 = fma(_657, _789, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _813 = in.m_67.x;
    bool _815 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _817 = isnan(_314);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -_801;
    float _829 = _827 + 1.0;
    bool _831 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _833 = isnan(_314);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _505 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _845 = _825 * _829;
    float _847 = -_825;
    float _849 = _847 + 1.0;
    float _851 = fma(_687, _803, -0.5);
    int _853 = _769 * int(_785);
    int _855 = _853 + _739;
    bool _857 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _859 = isnan(_314);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _871 = -_841;
    float _873 = _871 + 1.0;
    float _875 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _719, -0.5);
    float _877 = float(uint(_855));
    float _879 = _867 * _849;
    float _881 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _883 = _801 * _873;
    float _885 = as_type<float>(_362) * _877;
    float _887 = _877;
    float _889 = _777;
    if (!_409)
    {
        _887 = _777;
    }
    float _891 = _887;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _895 = _891;
    if (_409)
    {
        _895 = _535;
    }
    float _897 = _895;
    float _899 = trunc(_885);
    float _901 = precise::max(_899, 0.0);
    uint _903 = uint(_901);
    if (_409)
    {
        _889 = _535;
    }
    float _905 = _889;
    float _907 = _765 * _879;
    int _909 = ~_330;
    int _911 = _909 + 1;
    float _913 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[83].z, _893);
    float _915 = _741 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _917 = _813;
    if (_439)
    {
        float _919 = -_813;
        float _921 = _919 + 1.0;
        _667 = as_type<int>(_921);
    }
    int _923 = _667;
    if (!_439)
    {
        _805 = _813;
    }
    float _925 = _805;
    float _927 = _925;
    if (_443)
    {
        float _929 = -_813;
        float _931 = _929 + 1.0;
        _773 = as_type<int>(_931);
    }
    int _933 = _773;
    float _935 = -_673;
    float _937 = fma(_915, 2.0, _935);
    float _939 = float(uint(_703));
    float _941 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].w, _695);
    if (_439)
    {
        float _943 = _735 ? as_type<float>(_923) : _813;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _615);
    float _949 = -_867;
    float _951 = _949 + 1.0;
    float _953 = as_type<float>(_362) * _939;
    int _955 = int(_785) + int(_903);
    float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[131].x, _907);
    if (_443)
    {
        float _961 = _809 ? as_type<float>(_933) : _813;
        _917 = _961;
    }
    float _963 = _917;
    float _965 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    int _967 = _911 * _955;
    int _969 = _967 + _739;
    float _971 = fma(_811, _845, _959);
    float _973 = -_947;
    float _975 = fma(_965, _875, _973);
    float _977 = trunc(_953);
    float _979 = precise::max(_977, 0.0);
    uint _981 = uint(_979);
    bool _983 = uint(_969) >= uint(_330);
    float _985 = _897 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _987 = ~_330;
    int _989 = _987 + 1;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _993 = !_983;
    int _995 = _993 ? 0 : (-1);
    float _997 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _913);
    float _999 = fma(_985, -2.0, _991);
    int _1001 = ~_955;
    int _1003 = _1001 + _995;
    int _1005 = _1003 + 1;
    float _1007 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    float _1009 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _941);
    float _1011 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1013 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1015 = _330 * _1005;
    int _1017 = _1015 + _739;
    float _1019 = _957 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1021 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _999);
    float _1023 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1011);
    bool _1025 = !_601;
    int _1027 = _1025 ? _1017 : (-1);
    int _1029 = _989 * int(_981);
    int _1031 = _1029 + _703;
    float _1033 = -_108;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[81].x, _937);
    float _1037 = fma(_1019, _963, -0.5);
    int _1039 = _1027 >> 31;
    float _1041 = _619 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1043 = float(uint(_1031));
    float _1045 = -_1021;
    float _1047 = fma(_1009, _851, _1045);
    int _1049 = _1039 & 3;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1023);
    int _1053 = _1027 & 3;
    bool _1055 = _1053 != 0;
    float _1057 = as_type<float>(_362) * _1043;
    int _1059 = _1027 + _1049;
    float _1061 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1063 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1065 = trunc(_1057);
    float _1067 = precise::max(_1065, 0.0);
    uint _1069 = uint(_1067);
    int _1071 = _1059 >> 2;
    float _1073 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1061);
    float _1075 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1063);
    float _1077 = fma(_1007, _1013, _729);
    int _1079 = _1071 << 4;
    int _1081 = _1079 + 368;
    float _1083 = fma(_997, _1037, _1035);
    int _1085 = ~_330;
    int _1087 = _1085 + 1;
    float _1089 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    uint _1091 = uint(int(uint(_1081) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[int(_1101)][_1103];
    float _1107 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1073);
    float _1109 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1075);
    float _1111 = _1051 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1113 = fma(_779, _883, _971);
    float _1115 = _1107 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _1119 = int(_981) + int(_1069);
    int _1121 = _1081 + 8;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[int(_1133)][_1135];
    int _1139 = _1027 & 3;
    bool _1141 = _1139 != 0;
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1145 = _1055 ? 0 : 1;
    int _1147 = _1087 * _1119;
    int _1149 = _1147 + _703;
    bool _1151 = uint(_1139) > 1u;
    float _1153 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1113);
    bool _1155 = _1139 != 3;
    float _1157 = _1111 * _1089;
    bool _1159 = uint(_1139) >= 2u;
    float _1161 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1163 = ~_1145;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = fma(_1157, 0.5, 0.5);
    bool _1171 = uint(_1149) >= uint(_330);
    int _1173 = _1159 ? 0 : 1;
    bool _1175 = !_1171;
    int _1177 = _1175 ? 0 : (-1);
    float _1179 = _1115 * _1143;
    int _1181 = _1167;
    if (!_1151)
    {
        int _1183 = ~_1145;
        int _1185 = _1183 + 1;
        _1181 = _1185;
    }
    int _1187 = _1181;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _1191 = !_1141;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = fma(_1179, 0.5, 0.5);
    int _1197 = abs(_1187);
    int _1199 = ~_1173;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    int _1205 = abs(_1193);
    int _1207 = _1203;
    if (_1155)
    {
        int _1209 = ~_1173;
        int _1211 = _1209 + 1;
        _1207 = _1211;
    }
    int _1213 = _1207;
    int _1215 = ~_1119;
    int _1217 = _1215 + _1177;
    int _1219 = _1217 + 1;
    int _1221 = abs(_1213);
    float _1223 = _1117 * _1189;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    int _1231 = _330 * _1219;
    int _1233 = _1231 + _703;
    bool _1235 = _1139 != 3;
    float _1237 = fma(_1223, 0.5, 0.5);
    int _1239 = ~_1205;
    int _1241 = _1239 + 1;
    int _1243 = _1241 + 1;
    int _1245 = _1229 * as_type<int>(_1105);
    float _1247 = floor(_1169);
    bool _1249 = !_1235;
    int _1251 = _1249 ? 0 : (-1);
    int _1253 = _1243 * as_type<int>(_1097);
    int _1255 = _1253 + _1245;
    int _1257 = ~_1221;
    int _1259 = _1257 + 1;
    int _1261 = _1259 + 1;
    int _1263 = abs(_1251);
    bool _1265 = !_499;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1261 * as_type<int>(_1129);
    int _1271 = _1269 + _1255;
    float _1273 = floor(_1195);
    int _1275 = abs(_1267);
    float _1277 = _975 + 0.5;
    int _1279 = ~_1263;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    float _1285 = _1077 + 0.5;
    int _1287 = ~_1275;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = _1083 + 0.5;
    int _1295 = _1283 * as_type<int>(_1137);
    int _1297 = _1295 + _1271;
    float _1299 = _1047 + 0.5;
    float _1301 = floor(_1237);
    float _1303 = -_1247;
    float _1305 = _1169 + _1303;
    int _1307 = _1297 * _1291;
    bool _1309 = !_601;
    int _1311 = _1309 ? _1233 : (-1);
    out.m_73.x = _1285;
    out.m_73.y = _1277;
    out.m_73.z = _1293;
    out.m_73.w = _1299;
    float _1313 = -_1273;
    float _1315 = _1195 + _1313;
    int _1317 = _1311 * _1275;
    int _1319 = _1317 + _1307;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1325 = fma(_1305, 2.0, -1.0);
    float _1327 = -_1301;
    float _1329 = _1237 + _1327;
    float _1331 = fma(_1315, 2.0, -1.0);
    float _1333 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1335 = float(_1319);
    float _1337 = fma(_1329, 2.0, -1.0);
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _1335;
    float _1343 = _1325 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1345 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1349 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(1.0);
    bool _1357 = _1353 || _1355;
    float _1359 = _1331 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1361 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1363 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1365 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_77.x = _1333;
    out.m_77.y = _1345;
    out.m_77.z = _1347;
    out.m_77.w = _1341;
    float _1367 = _1337 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1369 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1361);
    float _1371 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1363);
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1365);
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1369);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1371);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1373);
    float _1381 = _1375 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1383 = _1377 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1385 = _1379 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1387 = _1335;
    float _1389 = _1335;
    float _1391 = _1331;
    float _1393 = _1325;
    float _1395 = _1373;
    float _1397 = _1337;
    float _1399 = _1341;
    float _1407;
    if (!_1357)
    {
        bool _1401 = _1383 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1403 = !_1401;
        _1405 = _1403;
        if (!_1405)
        {
            _1407 = 0.0;
            _1409 = true;
        }
    }
    if ((!_1409) || _1405)
    {
        bool _1433;
        if (!_1405)
        {
            bool _1411 = _1383 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1413 = isnan(_1383);
            bool _1415 = _1411 || _1413;
            bool _1417 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1419 = _1415 || _1417;
            bool _1421 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1423 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1425 = !_1419;
            bool _1427 = _1423 && _1425;
            if (_1427)
            {
                _1387 = 0.0;
            }
            float _1429 = _1387;
            bool _1431 = !_1419;
            _1433 = _1431 && _1421;
            _1389 = _1429;
            _1407 = _1429;
        }
        if ((!_1433) || _1405)
        {
            _1405 = false;
            float _1435 = _1389;
            bool _1437 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1439 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1441 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1443 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1445 = _1435;
            if (_1437)
            {
                float _1447 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1443 = _1447;
            }
            float _1449 = _1443;
            if (_1437)
            {
                float _1451 = abs(_1331);
                float _1453 = -_1451;
                float _1455 = _1453 + 1.0;
                _1391 = _1455;
            }
            float _1457 = _1391;
            if (_1439)
            {
                float _1459 = abs(_1325);
                float _1461 = -_1459;
                float _1463 = _1461 + 1.0;
                _1393 = _1463;
            }
            float _1465 = _1393;
            if (!_1437)
            {
                _1395 = 1.0;
            }
            float _1467 = _1395;
            float _1469 = _1467;
            if (_1441)
            {
                float _1471 = abs(_1337);
                float _1473 = -_1471;
                float _1475 = _1473 + 1.0;
                _1397 = _1475;
            }
            float _1477 = _1397;
            if (!_1439)
            {
                _1399 = 1.0;
            }
            float _1479 = _1399;
            float _1481 = _1479;
            if (!_1441)
            {
                _1445 = 1.0;
            }
            float _1483 = _1445;
            float _1485 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
            float _1487 = _1483;
            if (_1439)
            {
                float _1489 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1485 = _1489;
            }
            float _1491 = _1485;
            float _1493 = _1083;
            if (_1441)
            {
                float _1495 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1493 = _1495;
            }
            float _1497 = _1493;
            if (_1437)
            {
                float _1499 = _1457 * _1449;
                float _1501 = precise::clamp(_1499, 0.0, 1.0);
                _1469 = _1501;
            }
            float _1503 = _1469;
            if (_1439)
            {
                float _1505 = _1465 * _1491;
                float _1507 = precise::clamp(_1505, 0.0, 1.0);
                _1481 = _1507;
            }
            float _1509 = _1481;
            float _1511 = _1503 * _1509;
            if (_1441)
            {
                float _1513 = _1477 * _1497;
                float _1515 = precise::clamp(_1513, 0.0, 1.0);
                _1487 = _1515;
            }
            float _1517 = _1487;
            float _1519 = _1511 * _1517;
            _1407 = _1519;
        }
    }
    _1409 = false;
    float _1521 = _1407;
    float _1523 = -_1383;
    float _1525 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1527 = -_1381;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1531 = -_1385;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1535 = _1525 * _1525;
    float _1537 = fma(_1529, _1529, _1535);
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1541 = fma(_1533, _1533, _1537);
    float _1543 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1545 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1547 = rsqrt(_1541);
    float _1549 = -_1543;
    float _1551 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1549);
    float _1553 = -_1545;
    float _1555 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1553);
    float _1557 = -_1539;
    float _1559 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1557);
    float _1561 = _1529 * _1547;
    float _1563 = _1533 * _1547;
    float _1565 = _1525 * _1547;
    float _1567 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1569 = _1561 * _1561;
    float _1571 = fma(_1563, _1563, _1569);
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1575 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1577 = rsqrt(_1571);
    float _1579 = -_1573;
    float _1581 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1579);
    float _1583 = -_1575;
    float _1585 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1583);
    float _1587 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1591 = -_1587;
    float _1593 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1591);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1597 = -_1589;
    float _1599 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1597);
    float _1601 = -_1595;
    float _1603 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1605 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1599);
    float _1607 = _1563 * _1577;
    float _1609 = _1561 * _1577;
    float _1611 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1603);
    float _1613 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1615 = -_1607;
    float _1617 = _1563 * _1615;
    float _1619 = -_1607;
    float _1621 = _1565 * _1619;
    float _1623 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1625 = -_1613;
    float _1627 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1625);
    float _1629 = -_1617;
    float _1631 = fma(_1561, _1609, _1629);
    float _1633 = _1565 * _1609;
    float _1635 = -_1623;
    float _1637 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1635);
    float _1639 = -_1567;
    float _1641 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1643 = _1631 * _1631;
    float _1645 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1627);
    float _1647 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1649 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1641);
    float _1651 = fma(_1633, _1633, _1643);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1637);
    float _1655 = -_1647;
    float _1657 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1655);
    float _1659 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1661 = fma(_1621, _1621, _1651);
    float _1663 = -_1649;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1653);
    float _1667 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1657);
    float _1669 = -_1659;
    float _1671 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1669);
    float _1673 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1675 = 1.0 / _1665;
    float _1677 = in.m_71.z;
    float _1679 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1671);
    float _1681 = -_1673;
    float _1683 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1685 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1683);
    float _1687 = rsqrt(_1661);
    float _1689 = fma(_1667, _1675, -1.0);
    float _1691 = _1631 * _1687;
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = _1161 * _1677;
    float _1697 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1699 = -_1693;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1697);
    float _1705 = _1701 * _1675;
    float _1707 = fma(_1701, _1689, 1.0);
    float _1709 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    float _1711 = _1679 * _1705;
    float _1713 = _1707 * _1707;
    float _1715 = _1685 * _1705;
    float _1717 = fma(_1711, _1711, _1713);
    float _1719 = fma(_1715, _1715, _1717);
    float _1721 = rsqrt(_1719);
    float _1723 = _1715 * _1721;
    float _1725 = _1711 * _1721;
    float _1727 = _1707 * _1721;
    float _1729 = -_1723;
    float _1731 = _1561 * _1729;
    float _1733 = _1563 * _1727;
    float _1735 = -_1725;
    float _1737 = -_1731;
    float _1739 = fma(_1563, _1735, _1737);
    float _1741 = -_1725;
    float _1743 = _1565 * _1741;
    float _1745 = -_1723;
    float _1747 = -_1733;
    float _1749 = fma(_1565, _1745, _1747);
    float _1751 = _1739 * _1739;
    float _1753 = -_1743;
    float _1755 = fma(_1561, _1727, _1753);
    float _1757 = fma(_1749, _1749, _1751);
    float _1759 = fma(_1755, _1755, _1757);
    float _1761 = rsqrt(_1759);
    float _1763 = _1749 * _1761;
    float _1765 = _1755 * _1761;
    float _1767 = _1739 * _1761;
    float _1769 = _1563 * _1763;
    float _1771 = _1565 * _1765;
    float _1773 = -_1769;
    float _1775 = fma(_1561, _1765, _1773);
    float _1777 = _1561 * _1767;
    float _1779 = -_1771;
    float _1781 = fma(_1563, _1767, _1779);
    float _1783 = _1775 * _1775;
    float _1785 = -_1777;
    float _1787 = fma(_1565, _1763, _1785);
    float _1789 = fma(_1781, _1781, _1783);
    float _1791 = fma(_1787, _1787, _1789);
    float _1793 = rsqrt(_1791);
    float _1795 = _1787 * _1793;
    float _1797 = _1781 * _1793;
    float _1799 = _1775 * _1793;
    float _1801 = _1561 * _1795;
    float _1803 = _1565 * _1797;
    float _1805 = _1563 * _1799;
    float _1807 = _759 * _1795;
    float _1809 = -_1801;
    float _1811 = fma(_1563, _1797, _1809);
    float _1813 = -_1803;
    float _1815 = fma(_1561, _1799, _1813);
    float _1817 = -_1805;
    float _1819 = fma(_1565, _1795, _1817);
    float _1821 = _759 * _1797;
    float _1823 = _1811 * _1811;
    float _1825 = _759 * _1799;
    float _1827 = fma(_1819, _1819, _1823);
    float _1829 = fma(_1815, _1815, _1827);
    float _1831 = rsqrt(_1829);
    float _1833 = _763 * _1831;
    float _1835 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1837 = fma(_1815, _1833, _1807);
    float _1839 = fma(_1819, _1833, _1821);
    float _1841 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1835);
    float _1843 = fma(_1811, _1833, _1825);
    float _1845 = fma(_1695, _1563, _1837);
    float _1847 = fma(_1695, _1561, _1839);
    float _1849 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1841);
    float _1853 = _1385 + _1845;
    float _1855 = _1381 + _1847;
    float _1857 = 1.0 / _1849;
    float _1859 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1863 = _1853 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1867 = _1855 + _1865;
    float _1869 = _1859 + _1849;
    float _1871 = _1863 * _1863;
    float _1873 = fma(_1695, _1565, _1843);
    bool _1875 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan(0.5);
    bool _1883 = _1879 || _1881;
    float _1885 = fma(_1867, _1867, _1871);
    float _1887 = _1383 + _1873;
    float _1889 = sqrt(_1885);
    bool _1891 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.5);
    bool _1899 = _1895 || _1897;
    float _1901 = _1869 * _1857;
    float _1903 = _1901 * 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = 1.0 / _1907;
    bool _1911 = _1889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1915 = _1855;
    float _1917 = _1887;
    float _1919 = _1867;
    float _1921 = _1863;
    float _1923 = _1843;
    float _1925 = _1621;
    if (!_1911)
    {
        _1913 = _1853;
    }
    float _1927 = _1913;
    bool _1929 = !_1911;
    float _1931 = _1927;
    if (!_1929)
    {
        float _1933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1937 = _1889 + _1935;
        float _1939 = rsqrt(_1885);
        float _1941 = _1937 * _1933;
        float _1943 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1945 = _1941 * 0.15915493667125701904296875;
        float _1947 = _1945 * 6.283185482025146484375;
        float _1949 = cos(_1947);
        float _1951 = _1945 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        float _1955 = _1949 + (-1.0);
        float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = fma(_1953, _1943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1961 = fma(_1887, _1949, _1957);
        float _1963 = _1939 * _1959;
        float _1965 = fma(_1867, _1963, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1967 = fma(_1863, _1963, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1915 = _1965;
        _1917 = _1961;
        _1931 = _1967;
    }
    float _1969 = _1915;
    float _1971 = _1917;
    float _1973 = _1931;
    float _1975 = _1971;
    float _1977 = _1969;
    float _1979 = _1973;
    if (_1899)
    {
        _1919 = 1.0;
    }
    float _1981 = _1919;
    float _1983 = _1981;
    if (!_1883)
    {
        float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1987 = _1383 + _1985;
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1991 = _1381 + _1989;
        float _1993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1995 = -_1381;
        float _1997 = _1995 + _1969;
        float _1999 = _1987 * _1987;
        float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2003 = _1385 + _2001;
        float _2005 = fma(_1991, _1991, _1999);
        float _2007 = fma(_2003, _2003, _2005);
        float _2009 = sqrt(_2007);
        float _2011 = precise::min(_2009, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2013 = _2011 * _1993;
        float _2015 = -_1383;
        float _2017 = _2015 + _1971;
        float _2019 = -_1385;
        float _2021 = _2019 + _1973;
        float _2023 = fma(_1997, _2013, _1381);
        float _2025 = fma(_2017, _2013, _1383);
        float _2027 = fma(_2021, _2013, _1385);
        _1975 = _2025;
        _1977 = _2023;
        _1979 = _2027;
        _1921 = _2009;
    }
    float _2029 = _1975;
    float _2031 = _1977;
    float _2033 = _1979;
    float _2035 = _1921;
    float _2037 = _2035;
    if (_1899)
    {
        _2037 = 1.0;
    }
    float _2039 = _2037;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2043 = _1909 * _2041;
    float _2045 = _2039;
    if (!_1899)
    {
        float _2047 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2049 = _2047 * 0.15915493667125701904296875;
        float _2051 = _2049 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2057 = _2055 * 0.15915493667125701904296875;
        float _2059 = _2049 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        float _2063 = 1.0 / _2053;
        float _2065 = _2057 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2061 * _2063;
        float _2071 = _2057 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = 1.0 / _2075;
        float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2081 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2079;
        float _2083 = 1.0 / _2081;
        float _2085 = _2073 * _2077;
        float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2089 = fma(_2043, _2085, _2087);
        float _2091 = _2089 * _2083;
        float _2093 = precise::clamp(_2091, 0.0, 1.0);
        _1983 = _2093;
    }
    float _2095 = _1983;
    if (!_1899)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2099 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2107 = _2105 * 0.15915493667125701904296875;
        float _2109 = _2099 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = 1.0 / _2103;
        float _2115 = _2107 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = _2107 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2117 * _2119;
        float _2127 = 1.0 / _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2129;
        float _2133 = 1.0 / _2131;
        float _2135 = _2123 * _2127;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2139 = fma(_2043, _2135, _2137);
        float _2141 = _2139 * _2133;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        float _2145 = -_2143;
        float _2147 = _2145 + 1.0;
        _2045 = _2147;
    }
    float _2149 = _2045;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2153 = _2029 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2157 = _2031 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2161 = _2033 + _2159;
    float _2163 = _2153 * _2153;
    float _2165 = fma(_2157, _2157, _2163);
    float _2167 = fma(_2161, _2161, _2165);
    float _2169 = rsqrt(_2167);
    float _2171 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2173 = _2157 * _2171;
    float _2175 = _2161 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 * _2175;
    float _2181 = _2177 + _2179;
    float _2183 = sqrt(_2181);
    bool _2185 = _2183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2189 = _2183 + _2187;
    float _2191 = _2169;
    float _2193 = _2181;
    float _2195 = _2189;
    float _2197 = _2153;
    float _2199 = _2173;
    if (_2185)
    {
        float _2201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2191 = _2201;
    }
    float _2203 = _2191;
    if (_2185)
    {
        float _2205 = rsqrt(_2181);
        _2193 = _2205;
    }
    float _2207 = _2193;
    if (_2185)
    {
        float _2209 = _2189 * _2203;
        _2195 = _2209;
    }
    float _2211 = _2195;
    if (_2185)
    {
        float _2213 = _2211 * 0.15915493667125701904296875;
        _1923 = _2213;
    }
    float _2215 = _1923;
    float _2217 = _2203;
    if (_2185)
    {
        float _2219 = _2215 * 6.283185482025146484375;
        float _2221 = sin(_2219);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2227 = precise::max(0.0, _2225);
    float _2229 = _2161;
    float _2231 = _2227;
    if (_2185)
    {
        float _2233 = _2215 * 6.283185482025146484375;
        float _2235 = cos(_2233);
        _2229 = _2235;
    }
    float _2237 = _2229;
    float _2239 = -_2171;
    float _2241 = -_2227;
    float _2243 = fma(_2153, _2239, _2241);
    float _2245 = _2243;
    if (!_2185)
    {
        _2197 = _2175;
    }
    float _2247 = _2197;
    float _2249 = _2247;
    if (_2185)
    {
        float _2251 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2231 = _2251;
    }
    float _2253 = _2231;
    float _2255 = sqrt(_2167);
    float _2257 = _2223;
    float _2259 = _2253;
    if (_2185)
    {
        float _2261 = fma(_2223, _2253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2257 = _2261;
    }
    float _2263 = _2257;
    float _2265 = _2263;
    float _2267 = _2237;
    if (_2185)
    {
        float _2269 = _2237 + (-1.0);
        _2259 = _2269;
    }
    float _2271 = _2259;
    float _2273 = _2271;
    if (_2185)
    {
        float _2275 = _2207 * _2263;
        _1925 = _2275;
    }
    float _2277 = _1925;
    if (_2185)
    {
        float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2265 = _2279;
    }
    float _2281 = _2265;
    if (_2185)
    {
        float _2283 = _2173 * _2277;
        _2199 = _2283;
    }
    float _2285 = _2199;
    if (!_2185)
    {
        _2273 = _2177;
    }
    float _2287 = _2273;
    float _2289 = _2287;
    if (_2185)
    {
        float _2291 = _2175 * _2277;
        _2249 = _2291;
    }
    float _2293 = _2249;
    if (_2185)
    {
        float _2295 = fma(_2243, _2237, _2281);
        _2245 = _2295;
    }
    float _2297 = _2245;
    if (_2185)
    {
        float _2299 = _2285 * _2285;
        _2289 = _2299;
    }
    float _2301 = _2289;
    if (!_2185)
    {
        _2267 = _2179;
    }
    float _2303 = _2267;
    float _2305 = _2303;
    if (_2185)
    {
        float _2307 = _2293 * _2293;
        _2305 = _2307;
    }
    float _2309 = _2305;
    float _2311 = fma(_2297, _2297, _2301);
    float _2313 = _2311 + _2309;
    float _2315 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2319 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2317);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2325 = rsqrt(_2313);
    float _2327 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2315);
    float _2329 = -_2321;
    float _2331 = _2329 + 1.0;
    float _2333 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2323);
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2337 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2327);
    float _2339 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2343 = abs(_2331);
    float _2345 = log2(_2343);
    float _2347 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2333);
    float _2349 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2351 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2341);
    float _2353 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2355 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2349);
    float _2357 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2359 = _2325 * _2285;
    float _2361 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2351);
    float _2363 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2365 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2367 = _2325 * _2297;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2371 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2373 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2365);
    float _2375 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2377 = _2325 * _2293;
    float _2379 = -_2369;
    float _2381 = fma(_2367, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2379);
    float _2383 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2373);
    float _2387 = -_2371;
    float _2389 = fma(_2387, _2335, 1.0);
    float _2391 = -_2377;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2381);
    float _2395 = exp2(_2375);
    float _2397 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2385);
    float _2399 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2401 = fma(_2393, -0.5, 0.5);
    float _2403 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = _2367 + 1.0;
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2399);
    float _2409 = fma(_2393, 0.5, 0.5);
    float _2411 = log2(_2389);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2415 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2407);
    float _2417 = fma(_2409, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2419 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2413);
    float _2421 = fma(_2409, _2417, -0.212114393711090087890625);
    float _2423 = 1.0 / _2397;
    float _2425 = -_2367;
    float _2427 = fma(_2395, _2405, _2425);
    float _2429 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2415);
    float _2431 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2433 = fma(_2409, _2421, 1.570728778839111328125);
    float _2435 = fma(_2427, 0.5, 0.5);
    float _2437 = sqrt(_2401);
    float _2439 = _2411 * 0.693147182464599609375;
    float _2441 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2443 = _2429 * _2423;
    float _2445 = _2431 * _2423;
    float _2447 = fma(_2443, 0.5, 0.5);
    float _2449 = fma(_2445, -0.5, 0.5);
    float _2451 = _2437 * 0.636619746685028076171875;
    float3 _6276 = float3(_2447, _2449, _2441);
    float _2453 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6276, float3(0.0), isnan(_6276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6276, float3(0.0), isnan(_6276)), level(0.0)).x;
    float3 _6287 = float3(_2447, _2449, _2441);
    float4 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6287, float3(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6287, float3(0.0), isnan(_6287)), level(0.0)).xyzw;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = _2456.w;
    float _2466 = -_2433;
    float _2468 = fma(_2451, _2466, 1.0);
    float2 _6309 = float2(_2468, _2435);
    float3 _2472 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6309, float2(0.0), isnan(_6309)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6309, float2(0.0), isnan(_6309)), level(0.0)).xyz;
    float _2474 = _2472.x;
    float _2476 = _2472.y;
    float _2478 = _2472.z;
    float _2480 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2482 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2484 = _2095 * _2149;
    bool _2486 = _2095 > 0.0;
    bool _2488 = isnan(_2095);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    out.m_79.x = _1381;
    out.m_79.y = _1383;
    out.m_79.z = _1385;
    float _2496 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    float _2498 = exp2(_2480);
    float _2500 = _2484 * _1521;
    bool _2502 = _2149 <= 0.0;
    bool _2504 = !_2494;
    bool _2506 = _2502 || _2504;
    float _2508 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2496);
    float _2510 = _2429 + _2397;
    float _2512 = _2500 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2514 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2508);
    float _2516 = _2397 * 0.5;
    float _2518 = _2512 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2520 = _2514 + _2397;
    float _2522 = fma(_2431, -0.5, _2516);
    float _2524 = _2510 * 0.5;
    out.gl_Position.x = _2429;
    out.gl_Position.y = _2431;
    out.gl_Position.z = _2514;
    out.gl_Position.w = _2397;
    float _2526 = _2520 * 0.5;
    float _2528 = -_2498;
    float _2530 = _2528 + 1.0;
    out.m_51.x = _2518;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2524;
    out.m_81.y = _2522;
    out.m_81.z = _2526;
    out.m_81.w = _2397;
    float _2534 = _2532 * _2453;
    float _2536 = -_2532;
    float _2538 = _2536 + 1.0;
    float _2540 = _2464 * _2534;
    float _2542 = _2464 * _2538;
    float _2544 = _2478 * _2534;
    float _2546 = fma(_2474, _2540, _2458);
    float _2548 = fma(_2476, _2540, _2460);
    float _2550 = fma(_2464, _2544, _2462);
    out.m_83.x = _2546;
    out.m_83.y = _2548;
    out.m_83.z = _2550;
    out.m_83.w = _2542;
    if (!_2506)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2552;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1409 = false;
    bool _1405 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = in.m_46.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = _99;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2619 = as_type<float>(_124);
        out.gl_Position.z = _2619;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _128 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_99);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_104);
    bool _140 = _108 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _116;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _126 = as_type<int>(_148);
    }
    int _150 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2674 = as_type<float>(_150);
        out.gl_Position.z = _2674;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = 1.0 / _138;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _156 = _108 * _152;
    bool _158 = !_154;
    float _160 = _156;
    float _178;
    if (!_158)
    {
        float _162 = in.m_53.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _156;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _186 = _182 + _184;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _190 = _188 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _192 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _194 = isnan(_182);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _208 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _210 = isnan(_182);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _220;
    bool _224 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _226 = isnan(_182);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = 1.0 / _190;
    float _238 = -_202;
    float _240 = _238 + 1.0;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _244 = _218 * _240;
    float _246 = -_218;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _206;
    float _252 = _222 * _236;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _258 = fma(_252, _186, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _260 = _256 * _250;
    float _262 = _258 * _244;
    float _264 = -_234;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _270 = _182 + _268;
    float _272 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[115].x, _262);
    float _274 = _202 * _266;
    float _276 = fma(_260, _270, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _280 = fma(_276, _274, _272);
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _286 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[117].x, _280);
    float _288 = _278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _290 = _282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _292 = _284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _294 = _286 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _288;
    out.m_55.y = _290;
    out.m_55.z = _292;
    out.m_55.w = _294;
    bool _296 = !_242;
    if (!_296)
    {
        float _298 = in.m_53.x;
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _160 = _312;
    }
    float _314 = _160;
    float _316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _318 = int(_316);
    float _320 = in.m_44.x;
    float _322 = in.m_44.y;
    float _324 = in.m_44.z;
    float _326 = in.m_53.w;
    float _328 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _330 = int(_328);
    float _332 = in.m_53.x;
    float _334 = in.m_57.w;
    float _336 = float(_318);
    float _338 = 1.0 / _336;
    float _340 = float(uint(_330));
    int _342 = ~_330;
    int _344 = _342 + 1;
    int _346 = ~_330;
    int _348 = _346 + 1;
    float _350 = 1.0 / _340;
    float _352 = _332 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_59.w = _334;
    float _354 = _108 * _338;
    float _356 = trunc(_354);
    int _358 = int(_356);
    float _360 = float(_330);
    int _362 = as_type<int>(_350) + (-2);
    float _364 = float(uint(_358));
    float _366 = as_type<float>(_362) * _364;
    float _368 = trunc(_366);
    float _370 = precise::max(_368, 0.0);
    uint _373 = uint(_370);
    int _375 = _344 * int(_373);
    int _377 = _375 + _358;
    float _379 = float(uint(_377));
    float _381 = as_type<float>(_362) * _379;
    int _383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _385 = _383 != 0;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _393 = _391 != 0;
    float _395 = in.m_61.x;
    float _397 = in.m_61.y;
    float _399 = in.m_61.z;
    float _401 = in.m_61.w;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _409 = _407 != 0;
    float _411 = trunc(_381);
    float _413 = precise::max(_411, 0.0);
    uint _415 = uint(_413);
    bool _417 = !_389;
    int _419 = _417 ? 0 : 1;
    bool _421 = !_385;
    int _423 = _421 ? 0 : 1;
    bool _425 = !_393;
    int _427 = _425 ? 0 : 1;
    bool _429 = !_405;
    int _431 = _429 ? 0 : 1;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _435 = _433 != 0;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = int(_373) + int(_415);
    float _451 = in.m_63.x;
    float _453 = in.m_63.y;
    float _455 = in.m_63.z;
    float _457 = in.m_63.w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = _322 * _397;
    int _465 = _348 * _449;
    int _467 = _465 + _358;
    float _469 = in.m_65.x;
    float _471 = in.m_65.y;
    float _473 = in.m_65.z;
    float _475 = in.m_65.w;
    bool _477 = !_435;
    int _479 = _477 ? 0 : 1;
    float _481 = fma(_320, _395, _463);
    bool _483 = _326 > 0.5;
    float _485 = in.m_67.y;
    bool _487 = uint(_467) >= uint(_330);
    bool _489 = !_409;
    float _491 = _489 ? 7.345489978790283203125 : 1.0;
    bool _493 = !_487;
    int _495 = _493 ? 0 : (-1);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _499 = _497 != 0;
    float _501 = in.m_69.x;
    float _503 = in.m_69.y;
    float _505 = in.m_69.z;
    int _507 = ~_449;
    int _509 = _507 + _495;
    int _511 = _509 + 1;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _513;
    int _517 = abs(_479);
    int _519 = abs(_423);
    float _521 = _322 * _453;
    float _523 = _322 * _471;
    float _525 = fma(_320, _451, _521);
    float _527 = _491 * _332;
    float _529 = fma(_320, _469, _523);
    float _531 = fma(_324, _399, _481);
    float _533 = fma(_324, _455, _525);
    float _535 = in.m_53.y;
    float _537 = floor(_527);
    float _539 = float(_358);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _545 = fma(_324, _473, _529);
    float _547 = _501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _549 = _539 >= _360;
    bool _551 = isnan(_539);
    bool _553 = _549 || _551;
    bool _555 = isnan(_360);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _108 * _360;
    float _563 = 1.0 / _543;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _567 = _561 * _152;
    int _569 = _330 * _511;
    int _571 = _569 + _358;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _577 = -_565;
    float _579 = fma(_352, 2.0, _577);
    float _581 = trunc(_559);
    int _583 = int(_581);
    float _585 = -_485;
    float _587 = _585 + 1.0;
    float _589 = -_537;
    float _591 = _527 + _589;
    float _593 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _595 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = _483 ? _587 : _485;
    float _599 = _591 * _360;
    bool _601 = _330 == 0;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _605 = _535 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _607 = 1.0 / _575;
    bool _609 = !_601;
    int _611 = _609 ? _571 : (-1);
    float _613 = _515 * _563;
    float _615 = fma(_605, -2.0, _603);
    int _617 = _330 + (-1);
    float _619 = _545 + _475;
    int _621 = ~_583;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = _533 + _457;
    float _629 = trunc(_567);
    int _631 = int(_629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _637 = _611 * _625;
    float _639 = _531 + _401;
    float _641 = _627 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    int _643 = _583 * _617;
    int _645 = _643 + _637;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _651 = trunc(_599);
    int _653 = int(_651);
    int _655 = abs(_419);
    float _657 = _635 * _607;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _661 = _597;
    float _663 = _485;
    bool _665 = _461;
    int _667 = as_type<int>(_457);
    if (_443)
    {
        float _669 = in.m_53.z;
        _659 = _669;
    }
    float _671 = _659;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _675 = _645 * _655;
    float _677 = 1.0 / _649;
    float _679 = in.m_71.x;
    float _681 = in.m_71.y;
    int _683 = _631 * _519;
    int _685 = _683 + _675;
    float _687 = _447 ? _597 : _485;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _689;
    bool _693 = _535 > 0.5;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _697 = _693;
    if (!_409)
    {
        _661 = _535;
    }
    float _699 = _661;
    int _701 = _653 * _517;
    int _703 = _701 + _358;
    int _705 = abs(_427);
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _709 = abs(_431);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _713 = _314 + _711;
    float _715 = _699;
    if (_461)
    {
        float _717 = _693 ? _587 : _485;
        _663 = _717;
    }
    float _719 = _663;
    int _721 = _703 * _705;
    int _723 = _721 + _685;
    float _725 = _691 * _677;
    float _727 = -_108;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[76].x, _579);
    float _731 = _639 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    if (_439)
    {
        bool _733 = _332 > 0.5;
        _665 = _733;
    }
    bool _735 = _665;
    int _737 = _653 * _709;
    int _739 = _737 + _723;
    if (_409)
    {
        _715 = _332;
    }
    float _741 = _715;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _745 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _681);
    float _747 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _749 = float(uint(_739));
    float _751 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[78].z, _743);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _679);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _757 = _314 + _755;
    float _759 = _747 * _745;
    float _761 = as_type<float>(_362) * _749;
    float _763 = _595 * _753;
    float _765 = fma(_613, _757, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _767 = ~_330;
    int _769 = _767 + 1;
    float _771 = _749;
    int _773 = as_type<int>(_765);
    if (!_409)
    {
        float _775 = in.m_53.z;
        _771 = _775;
    }
    float _777 = _771;
    float _779 = fma(_725, _713, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _781 = trunc(_761);
    float _783 = precise::max(_781, 0.0);
    uint _785 = uint(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _314 + _787;
    bool _791 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _793 = isnan(_314);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _707 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _805 = _801;
    if (_443)
    {
        bool _807 = _671 > 0.5;
        _697 = _807;
    }
    bool _809 = _697;
    float _811 = fma(_657, _789, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _813 = in.m_67.x;
    bool _815 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _817 = isnan(_314);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -_801;
    float _829 = _827 + 1.0;
    bool _831 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _833 = isnan(_314);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _505 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _845 = _825 * _829;
    float _847 = -_825;
    float _849 = _847 + 1.0;
    float _851 = fma(_687, _803, -0.5);
    int _853 = _769 * int(_785);
    int _855 = _853 + _739;
    bool _857 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _859 = isnan(_314);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _871 = -_841;
    float _873 = _871 + 1.0;
    float _875 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _719, -0.5);
    float _877 = float(uint(_855));
    float _879 = _867 * _849;
    float _881 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    float _883 = _801 * _873;
    float _885 = as_type<float>(_362) * _877;
    float _887 = _877;
    float _889 = _777;
    if (!_409)
    {
        _887 = _777;
    }
    float _891 = _887;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _895 = _891;
    if (_409)
    {
        _895 = _535;
    }
    float _897 = _895;
    float _899 = trunc(_885);
    float _901 = precise::max(_899, 0.0);
    uint _903 = uint(_901);
    if (_409)
    {
        _889 = _535;
    }
    float _905 = _889;
    float _907 = _765 * _879;
    int _909 = ~_330;
    int _911 = _909 + 1;
    float _913 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[83].z, _893);
    float _915 = _741 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _917 = _813;
    if (_439)
    {
        float _919 = -_813;
        float _921 = _919 + 1.0;
        _667 = as_type<int>(_921);
    }
    int _923 = _667;
    if (!_439)
    {
        _805 = _813;
    }
    float _925 = _805;
    float _927 = _925;
    if (_443)
    {
        float _929 = -_813;
        float _931 = _929 + 1.0;
        _773 = as_type<int>(_931);
    }
    int _933 = _773;
    float _935 = -_673;
    float _937 = fma(_915, 2.0, _935);
    float _939 = float(uint(_703));
    float _941 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[83].w, _695);
    if (_439)
    {
        float _943 = _735 ? as_type<float>(_923) : _813;
        _927 = _943;
    }
    float _945 = _927;
    float _947 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _615);
    float _949 = -_867;
    float _951 = _949 + 1.0;
    float _953 = as_type<float>(_362) * _939;
    int _955 = int(_785) + int(_903);
    float _957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[131].x, _907);
    if (_443)
    {
        float _961 = _809 ? as_type<float>(_933) : _813;
        _917 = _961;
    }
    float _963 = _917;
    float _965 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    int _967 = _911 * _955;
    int _969 = _967 + _739;
    float _971 = fma(_811, _845, _959);
    float _973 = -_947;
    float _975 = fma(_965, _875, _973);
    float _977 = trunc(_953);
    float _979 = precise::max(_977, 0.0);
    uint _981 = uint(_979);
    bool _983 = uint(_969) >= uint(_330);
    float _985 = _897 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _987 = ~_330;
    int _989 = _987 + 1;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _993 = !_983;
    int _995 = _993 ? 0 : (-1);
    float _997 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _913);
    float _999 = fma(_985, -2.0, _991);
    int _1001 = ~_955;
    int _1003 = _1001 + _995;
    int _1005 = _1003 + 1;
    float _1007 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    float _1009 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _941);
    float _1011 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1013 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1015 = _330 * _1005;
    int _1017 = _1015 + _739;
    float _1019 = _957 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1021 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _999);
    float _1023 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1011);
    bool _1025 = !_601;
    int _1027 = _1025 ? _1017 : (-1);
    int _1029 = _989 * int(_981);
    int _1031 = _1029 + _703;
    float _1033 = -_108;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[81].x, _937);
    float _1037 = fma(_1019, _963, -0.5);
    int _1039 = _1027 >> 31;
    float _1041 = _619 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1043 = float(uint(_1031));
    float _1045 = -_1021;
    float _1047 = fma(_1009, _851, _1045);
    int _1049 = _1039 & 3;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1023);
    int _1053 = _1027 & 3;
    bool _1055 = _1053 != 0;
    float _1057 = as_type<float>(_362) * _1043;
    int _1059 = _1027 + _1049;
    float _1061 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1063 = _641 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1065 = trunc(_1057);
    float _1067 = precise::max(_1065, 0.0);
    uint _1069 = uint(_1067);
    int _1071 = _1059 >> 2;
    float _1073 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1061);
    float _1075 = fma(_731, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1063);
    float _1077 = fma(_1007, _1013, _729);
    int _1079 = _1071 << 4;
    int _1081 = _1079 + 368;
    float _1083 = fma(_997, _1037, _1035);
    int _1085 = ~_330;
    int _1087 = _1085 + 1;
    float _1089 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    uint _1091 = uint(int(uint(_1081) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[int(_1101)][_1103];
    float _1107 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1073);
    float _1109 = fma(_1041, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1075);
    float _1111 = _1051 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1113 = fma(_779, _883, _971);
    float _1115 = _1107 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1117 = _1109 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    int _1119 = int(_981) + int(_1069);
    int _1121 = _1081 + 8;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[int(_1133)][_1135];
    int _1139 = _1027 & 3;
    bool _1141 = _1139 != 0;
    float _1143 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _1145 = _1055 ? 0 : 1;
    int _1147 = _1087 * _1119;
    int _1149 = _1147 + _703;
    bool _1151 = uint(_1139) > 1u;
    float _1153 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1113);
    bool _1155 = _1139 != 3;
    float _1157 = _1111 * _1089;
    bool _1159 = uint(_1139) >= 2u;
    float _1161 = _843 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1163 = ~_1145;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = fma(_1157, 0.5, 0.5);
    bool _1171 = uint(_1149) >= uint(_330);
    int _1173 = _1159 ? 0 : 1;
    bool _1175 = !_1171;
    int _1177 = _1175 ? 0 : (-1);
    float _1179 = _1115 * _1143;
    int _1181 = _1167;
    if (!_1151)
    {
        int _1183 = ~_1145;
        int _1185 = _1183 + 1;
        _1181 = _1185;
    }
    int _1187 = _1181;
    float _1189 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    bool _1191 = !_1141;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = fma(_1179, 0.5, 0.5);
    int _1197 = abs(_1187);
    int _1199 = ~_1173;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    int _1205 = abs(_1193);
    int _1207 = _1203;
    if (_1155)
    {
        int _1209 = ~_1173;
        int _1211 = _1209 + 1;
        _1207 = _1211;
    }
    int _1213 = _1207;
    int _1215 = ~_1119;
    int _1217 = _1215 + _1177;
    int _1219 = _1217 + 1;
    int _1221 = abs(_1213);
    float _1223 = _1117 * _1189;
    int _1225 = ~_1197;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    int _1231 = _330 * _1219;
    int _1233 = _1231 + _703;
    bool _1235 = _1139 != 3;
    float _1237 = fma(_1223, 0.5, 0.5);
    int _1239 = ~_1205;
    int _1241 = _1239 + 1;
    int _1243 = _1241 + 1;
    int _1245 = _1229 * as_type<int>(_1105);
    float _1247 = floor(_1169);
    bool _1249 = !_1235;
    int _1251 = _1249 ? 0 : (-1);
    int _1253 = _1243 * as_type<int>(_1097);
    int _1255 = _1253 + _1245;
    int _1257 = ~_1221;
    int _1259 = _1257 + 1;
    int _1261 = _1259 + 1;
    int _1263 = abs(_1251);
    bool _1265 = !_499;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1261 * as_type<int>(_1129);
    int _1271 = _1269 + _1255;
    float _1273 = floor(_1195);
    int _1275 = abs(_1267);
    float _1277 = _975 + 0.5;
    int _1279 = ~_1263;
    int _1281 = _1279 + 1;
    int _1283 = _1281 + 1;
    float _1285 = _1077 + 0.5;
    int _1287 = ~_1275;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = _1083 + 0.5;
    int _1295 = _1283 * as_type<int>(_1137);
    int _1297 = _1295 + _1271;
    float _1299 = _1047 + 0.5;
    float _1301 = floor(_1237);
    float _1303 = -_1247;
    float _1305 = _1169 + _1303;
    int _1307 = _1297 * _1291;
    bool _1309 = !_601;
    int _1311 = _1309 ? _1233 : (-1);
    out.m_73.x = _1285;
    out.m_73.y = _1277;
    out.m_73.z = _1293;
    out.m_73.w = _1299;
    float _1313 = -_1273;
    float _1315 = _1195 + _1313;
    int _1317 = _1311 * _1275;
    int _1319 = _1317 + _1307;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1325 = fma(_1305, 2.0, -1.0);
    float _1327 = -_1301;
    float _1329 = _1237 + _1327;
    float _1331 = fma(_1315, 2.0, -1.0);
    float _1333 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1335 = float(_1319);
    float _1337 = fma(_1329, 2.0, -1.0);
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _1335;
    float _1343 = _1325 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1345 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1349 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(1.0);
    bool _1357 = _1353 || _1355;
    float _1359 = _1331 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1361 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1363 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _1365 = _1343 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    out.m_77.x = _1333;
    out.m_77.y = _1345;
    out.m_77.z = _1347;
    out.m_77.w = _1341;
    float _1367 = _1337 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1369 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1361);
    float _1371 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].y, _1363);
    float _1373 = fma(_1359, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1365);
    float _1375 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].x, _1369);
    float _1377 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].y, _1371);
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c12)._m0[4].z, _1373);
    float _1381 = _1375 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _1383 = _1377 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _1385 = _1379 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _1387 = _1335;
    float _1389 = _1335;
    float _1391 = _1331;
    float _1393 = _1325;
    float _1395 = _1373;
    float _1397 = _1337;
    float _1399 = _1341;
    float _1407;
    if (!_1357)
    {
        bool _1401 = _1383 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _1403 = !_1401;
        _1405 = _1403;
        if (!_1405)
        {
            _1407 = 0.0;
            _1409 = true;
        }
    }
    if ((!_1409) || _1405)
    {
        bool _1433;
        if (!_1405)
        {
            bool _1411 = _1383 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _1413 = isnan(_1383);
            bool _1415 = _1411 || _1413;
            bool _1417 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _1419 = _1415 || _1417;
            bool _1421 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1423 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _1425 = !_1419;
            bool _1427 = _1423 && _1425;
            if (_1427)
            {
                _1387 = 0.0;
            }
            float _1429 = _1387;
            bool _1431 = !_1419;
            _1433 = _1431 && _1421;
            _1389 = _1429;
            _1407 = _1429;
        }
        if ((!_1433) || _1405)
        {
            _1405 = false;
            float _1435 = _1389;
            bool _1437 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _1439 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _1441 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _1443 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _1445 = _1435;
            if (_1437)
            {
                float _1447 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _1443 = _1447;
            }
            float _1449 = _1443;
            if (_1437)
            {
                float _1451 = abs(_1331);
                float _1453 = -_1451;
                float _1455 = _1453 + 1.0;
                _1391 = _1455;
            }
            float _1457 = _1391;
            if (_1439)
            {
                float _1459 = abs(_1325);
                float _1461 = -_1459;
                float _1463 = _1461 + 1.0;
                _1393 = _1463;
            }
            float _1465 = _1393;
            if (!_1437)
            {
                _1395 = 1.0;
            }
            float _1467 = _1395;
            float _1469 = _1467;
            if (_1441)
            {
                float _1471 = abs(_1337);
                float _1473 = -_1471;
                float _1475 = _1473 + 1.0;
                _1397 = _1475;
            }
            float _1477 = _1397;
            if (!_1439)
            {
                _1399 = 1.0;
            }
            float _1479 = _1399;
            float _1481 = _1479;
            if (!_1441)
            {
                _1445 = 1.0;
            }
            float _1483 = _1445;
            float _1485 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
            float _1487 = _1483;
            if (_1439)
            {
                float _1489 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1485 = _1489;
            }
            float _1491 = _1485;
            float _1493 = _1083;
            if (_1441)
            {
                float _1495 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1493 = _1495;
            }
            float _1497 = _1493;
            if (_1437)
            {
                float _1499 = _1457 * _1449;
                float _1501 = precise::clamp(_1499, 0.0, 1.0);
                _1469 = _1501;
            }
            float _1503 = _1469;
            if (_1439)
            {
                float _1505 = _1465 * _1491;
                float _1507 = precise::clamp(_1505, 0.0, 1.0);
                _1481 = _1507;
            }
            float _1509 = _1481;
            float _1511 = _1503 * _1509;
            if (_1441)
            {
                float _1513 = _1477 * _1497;
                float _1515 = precise::clamp(_1513, 0.0, 1.0);
                _1487 = _1515;
            }
            float _1517 = _1487;
            float _1519 = _1511 * _1517;
            _1407 = _1519;
        }
    }
    _1409 = false;
    float _1521 = _1407;
    float _1523 = -_1383;
    float _1525 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1527 = -_1381;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1531 = -_1385;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1535 = _1525 * _1525;
    float _1537 = fma(_1529, _1529, _1535);
    float _1539 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1541 = fma(_1533, _1533, _1537);
    float _1543 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1545 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1547 = rsqrt(_1541);
    float _1549 = -_1543;
    float _1551 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1549);
    float _1553 = -_1545;
    float _1555 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1553);
    float _1557 = -_1539;
    float _1559 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1557);
    float _1561 = _1529 * _1547;
    float _1563 = _1533 * _1547;
    float _1565 = _1525 * _1547;
    float _1567 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1569 = _1561 * _1561;
    float _1571 = fma(_1563, _1563, _1569);
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1575 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1577 = rsqrt(_1571);
    float _1579 = -_1573;
    float _1581 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1579);
    float _1583 = -_1575;
    float _1585 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1583);
    float _1587 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1591 = -_1587;
    float _1593 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1591);
    float _1595 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1597 = -_1589;
    float _1599 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1597);
    float _1601 = -_1595;
    float _1603 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1605 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1599);
    float _1607 = _1563 * _1577;
    float _1609 = _1561 * _1577;
    float _1611 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1603);
    float _1613 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1615 = -_1607;
    float _1617 = _1563 * _1615;
    float _1619 = -_1607;
    float _1621 = _1565 * _1619;
    float _1623 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1625 = -_1613;
    float _1627 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1625);
    float _1629 = -_1617;
    float _1631 = fma(_1561, _1609, _1629);
    float _1633 = _1565 * _1609;
    float _1635 = -_1623;
    float _1637 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1635);
    float _1639 = -_1567;
    float _1641 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1639);
    float _1643 = _1631 * _1631;
    float _1645 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1627);
    float _1647 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1649 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1641);
    float _1651 = fma(_1633, _1633, _1643);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1637);
    float _1655 = -_1647;
    float _1657 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1655);
    float _1659 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1661 = fma(_1621, _1621, _1651);
    float _1663 = -_1649;
    float _1665 = fma(_1663, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1653);
    float _1667 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1657);
    float _1669 = -_1659;
    float _1671 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1669);
    float _1673 = _1585 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1675 = 1.0 / _1665;
    float _1677 = in.m_71.z;
    float _1679 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1671);
    float _1681 = -_1673;
    float _1683 = fma(_1581, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1685 = fma(_1593, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1683);
    float _1687 = rsqrt(_1661);
    float _1689 = fma(_1667, _1675, -1.0);
    float _1691 = _1631 * _1687;
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = _1161 * _1677;
    float _1697 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1699 = -_1693;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1697);
    float _1705 = _1701 * _1675;
    float _1707 = fma(_1701, _1689, 1.0);
    float _1709 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1703);
    float _1711 = _1679 * _1705;
    float _1713 = _1707 * _1707;
    float _1715 = _1685 * _1705;
    float _1717 = fma(_1711, _1711, _1713);
    float _1719 = fma(_1715, _1715, _1717);
    float _1721 = rsqrt(_1719);
    float _1723 = _1715 * _1721;
    float _1725 = _1711 * _1721;
    float _1727 = _1707 * _1721;
    float _1729 = -_1723;
    float _1731 = _1561 * _1729;
    float _1733 = _1563 * _1727;
    float _1735 = -_1725;
    float _1737 = -_1731;
    float _1739 = fma(_1563, _1735, _1737);
    float _1741 = -_1725;
    float _1743 = _1565 * _1741;
    float _1745 = -_1723;
    float _1747 = -_1733;
    float _1749 = fma(_1565, _1745, _1747);
    float _1751 = _1739 * _1739;
    float _1753 = -_1743;
    float _1755 = fma(_1561, _1727, _1753);
    float _1757 = fma(_1749, _1749, _1751);
    float _1759 = fma(_1755, _1755, _1757);
    float _1761 = rsqrt(_1759);
    float _1763 = _1749 * _1761;
    float _1765 = _1755 * _1761;
    float _1767 = _1739 * _1761;
    float _1769 = _1563 * _1763;
    float _1771 = _1565 * _1765;
    float _1773 = -_1769;
    float _1775 = fma(_1561, _1765, _1773);
    float _1777 = _1561 * _1767;
    float _1779 = -_1771;
    float _1781 = fma(_1563, _1767, _1779);
    float _1783 = _1775 * _1775;
    float _1785 = -_1777;
    float _1787 = fma(_1565, _1763, _1785);
    float _1789 = fma(_1781, _1781, _1783);
    float _1791 = fma(_1787, _1787, _1789);
    float _1793 = rsqrt(_1791);
    float _1795 = _1787 * _1793;
    float _1797 = _1781 * _1793;
    float _1799 = _1775 * _1793;
    float _1801 = _1561 * _1795;
    float _1803 = _1565 * _1797;
    float _1805 = _1563 * _1799;
    float _1807 = _759 * _1795;
    float _1809 = -_1801;
    float _1811 = fma(_1563, _1797, _1809);
    float _1813 = -_1803;
    float _1815 = fma(_1561, _1799, _1813);
    float _1817 = -_1805;
    float _1819 = fma(_1565, _1795, _1817);
    float _1821 = _759 * _1797;
    float _1823 = _1811 * _1811;
    float _1825 = _759 * _1799;
    float _1827 = fma(_1819, _1819, _1823);
    float _1829 = fma(_1815, _1815, _1827);
    float _1831 = rsqrt(_1829);
    float _1833 = _763 * _1831;
    float _1835 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1837 = fma(_1815, _1833, _1807);
    float _1839 = fma(_1819, _1833, _1821);
    float _1841 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1835);
    float _1843 = fma(_1811, _1833, _1825);
    float _1845 = fma(_1695, _1563, _1837);
    float _1847 = fma(_1695, _1561, _1839);
    float _1849 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1841);
    float _1853 = _1385 + _1845;
    float _1855 = _1381 + _1847;
    float _1857 = 1.0 / _1849;
    float _1859 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1863 = _1853 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1867 = _1855 + _1865;
    float _1869 = _1859 + _1849;
    float _1871 = _1863 * _1863;
    float _1873 = fma(_1695, _1565, _1843);
    bool _1875 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan(0.5);
    bool _1883 = _1879 || _1881;
    float _1885 = fma(_1867, _1867, _1871);
    float _1887 = _1383 + _1873;
    float _1889 = sqrt(_1885);
    bool _1891 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(0.5);
    bool _1899 = _1895 || _1897;
    float _1901 = _1869 * _1857;
    float _1903 = _1901 * 0.5;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1903, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = 1.0 / _1907;
    bool _1911 = _1889 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1913 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1915 = _1855;
    float _1917 = _1887;
    float _1919 = _1867;
    float _1921 = _1863;
    float _1923 = _1843;
    float _1925 = _1621;
    if (!_1911)
    {
        _1913 = _1853;
    }
    float _1927 = _1913;
    bool _1929 = !_1911;
    float _1931 = _1927;
    if (!_1929)
    {
        float _1933 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1937 = _1889 + _1935;
        float _1939 = rsqrt(_1885);
        float _1941 = _1937 * _1933;
        float _1943 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1945 = _1941 * 0.15915493667125701904296875;
        float _1947 = _1945 * 6.283185482025146484375;
        float _1949 = cos(_1947);
        float _1951 = _1945 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        float _1955 = _1949 + (-1.0);
        float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = fma(_1953, _1943, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1961 = fma(_1887, _1949, _1957);
        float _1963 = _1939 * _1959;
        float _1965 = fma(_1867, _1963, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1967 = fma(_1863, _1963, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1915 = _1965;
        _1917 = _1961;
        _1931 = _1967;
    }
    float _1969 = _1915;
    float _1971 = _1917;
    float _1973 = _1931;
    float _1975 = _1971;
    float _1977 = _1969;
    float _1979 = _1973;
    if (_1899)
    {
        _1919 = 1.0;
    }
    float _1981 = _1919;
    float _1983 = _1981;
    if (!_1883)
    {
        float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1987 = _1383 + _1985;
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1991 = _1381 + _1989;
        float _1993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1995 = -_1381;
        float _1997 = _1995 + _1969;
        float _1999 = _1987 * _1987;
        float _2001 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2003 = _1385 + _2001;
        float _2005 = fma(_1991, _1991, _1999);
        float _2007 = fma(_2003, _2003, _2005);
        float _2009 = sqrt(_2007);
        float _2011 = precise::min(_2009, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2013 = _2011 * _1993;
        float _2015 = -_1383;
        float _2017 = _2015 + _1971;
        float _2019 = -_1385;
        float _2021 = _2019 + _1973;
        float _2023 = fma(_1997, _2013, _1381);
        float _2025 = fma(_2017, _2013, _1383);
        float _2027 = fma(_2021, _2013, _1385);
        _1975 = _2025;
        _1977 = _2023;
        _1979 = _2027;
        _1921 = _2009;
    }
    float _2029 = _1975;
    float _2031 = _1977;
    float _2033 = _1979;
    float _2035 = _1921;
    float _2037 = _2035;
    if (_1899)
    {
        _2037 = 1.0;
    }
    float _2039 = _2037;
    float _2041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2043 = _1909 * _2041;
    float _2045 = _2039;
    if (!_1899)
    {
        float _2047 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2049 = _2047 * 0.15915493667125701904296875;
        float _2051 = _2049 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2057 = _2055 * 0.15915493667125701904296875;
        float _2059 = _2049 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        float _2063 = 1.0 / _2053;
        float _2065 = _2057 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = _2061 * _2063;
        float _2071 = _2057 * 6.283185482025146484375;
        float _2073 = sin(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = 1.0 / _2075;
        float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2081 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2079;
        float _2083 = 1.0 / _2081;
        float _2085 = _2073 * _2077;
        float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2089 = fma(_2043, _2085, _2087);
        float _2091 = _2089 * _2083;
        float _2093 = precise::clamp(_2091, 0.0, 1.0);
        _1983 = _2093;
    }
    float _2095 = _1983;
    if (!_1899)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = _2097 * 0.15915493667125701904296875;
        float _2101 = _2099 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2107 = _2105 * 0.15915493667125701904296875;
        float _2109 = _2099 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = 1.0 / _2103;
        float _2115 = _2107 * 6.283185482025146484375;
        float _2117 = cos(_2115);
        float _2119 = _2111 * _2113;
        float _2121 = _2107 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2117 * _2119;
        float _2127 = 1.0 / _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2131 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2129;
        float _2133 = 1.0 / _2131;
        float _2135 = _2123 * _2127;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2139 = fma(_2043, _2135, _2137);
        float _2141 = _2139 * _2133;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        float _2145 = -_2143;
        float _2147 = _2145 + 1.0;
        _2045 = _2147;
    }
    float _2149 = _2045;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2153 = _2029 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2157 = _2031 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2161 = _2033 + _2159;
    float _2163 = _2153 * _2153;
    float _2165 = fma(_2157, _2157, _2163);
    float _2167 = fma(_2161, _2161, _2165);
    float _2169 = rsqrt(_2167);
    float _2171 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2173 = _2157 * _2171;
    float _2175 = _2161 * _2171;
    float _2177 = _2173 * _2173;
    float _2179 = _2175 * _2175;
    float _2181 = _2177 + _2179;
    float _2183 = sqrt(_2181);
    bool _2185 = _2183 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2189 = _2183 + _2187;
    float _2191 = _2169;
    float _2193 = _2181;
    float _2195 = _2189;
    float _2197 = _2153;
    float _2199 = _2173;
    if (_2185)
    {
        float _2201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2191 = _2201;
    }
    float _2203 = _2191;
    if (_2185)
    {
        float _2205 = rsqrt(_2181);
        _2193 = _2205;
    }
    float _2207 = _2193;
    if (_2185)
    {
        float _2209 = _2189 * _2203;
        _2195 = _2209;
    }
    float _2211 = _2195;
    if (_2185)
    {
        float _2213 = _2211 * 0.15915493667125701904296875;
        _1923 = _2213;
    }
    float _2215 = _1923;
    float _2217 = _2203;
    if (_2185)
    {
        float _2219 = _2215 * 6.283185482025146484375;
        float _2221 = sin(_2219);
        _2217 = _2221;
    }
    float _2223 = _2217;
    float _2225 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2227 = precise::max(0.0, _2225);
    float _2229 = _2161;
    float _2231 = _2227;
    if (_2185)
    {
        float _2233 = _2215 * 6.283185482025146484375;
        float _2235 = cos(_2233);
        _2229 = _2235;
    }
    float _2237 = _2229;
    float _2239 = -_2171;
    float _2241 = -_2227;
    float _2243 = fma(_2153, _2239, _2241);
    float _2245 = _2243;
    if (!_2185)
    {
        _2197 = _2175;
    }
    float _2247 = _2197;
    float _2249 = _2247;
    if (_2185)
    {
        float _2251 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2231 = _2251;
    }
    float _2253 = _2231;
    float _2255 = sqrt(_2167);
    float _2257 = _2223;
    float _2259 = _2253;
    if (_2185)
    {
        float _2261 = fma(_2223, _2253, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2257 = _2261;
    }
    float _2263 = _2257;
    float _2265 = _2263;
    float _2267 = _2237;
    if (_2185)
    {
        float _2269 = _2237 + (-1.0);
        _2259 = _2269;
    }
    float _2271 = _2259;
    float _2273 = _2271;
    if (_2185)
    {
        float _2275 = _2207 * _2263;
        _1925 = _2275;
    }
    float _2277 = _1925;
    if (_2185)
    {
        float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2265 = _2279;
    }
    float _2281 = _2265;
    if (_2185)
    {
        float _2283 = _2173 * _2277;
        _2199 = _2283;
    }
    float _2285 = _2199;
    if (!_2185)
    {
        _2273 = _2177;
    }
    float _2287 = _2273;
    float _2289 = _2287;
    if (_2185)
    {
        float _2291 = _2175 * _2277;
        _2249 = _2291;
    }
    float _2293 = _2249;
    if (_2185)
    {
        float _2295 = fma(_2243, _2237, _2281);
        _2245 = _2295;
    }
    float _2297 = _2245;
    if (_2185)
    {
        float _2299 = _2285 * _2285;
        _2289 = _2299;
    }
    float _2301 = _2289;
    if (!_2185)
    {
        _2267 = _2179;
    }
    float _2303 = _2267;
    float _2305 = _2303;
    if (_2185)
    {
        float _2307 = _2293 * _2293;
        _2305 = _2307;
    }
    float _2309 = _2305;
    float _2311 = fma(_2297, _2297, _2301);
    float _2313 = _2311 + _2309;
    float _2315 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2319 = fma(_2255, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2317);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2325 = rsqrt(_2313);
    float _2327 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2315);
    float _2329 = -_2321;
    float _2331 = _2329 + 1.0;
    float _2333 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2323);
    float _2335 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2337 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2327);
    float _2339 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = _2029 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2343 = abs(_2331);
    float _2345 = log2(_2343);
    float _2347 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2333);
    float _2349 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2351 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2341);
    float _2353 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2355 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2349);
    float _2357 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2359 = _2325 * _2285;
    float _2361 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2351);
    float _2363 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2365 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2367 = _2325 * _2297;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2371 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2373 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2365);
    float _2375 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2377 = _2325 * _2293;
    float _2379 = -_2369;
    float _2381 = fma(_2367, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2379);
    float _2383 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2373);
    float _2387 = -_2371;
    float _2389 = fma(_2387, _2335, 1.0);
    float _2391 = -_2377;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2381);
    float _2395 = exp2(_2375);
    float _2397 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2385);
    float _2399 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2401 = fma(_2393, -0.5, 0.5);
    float _2403 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = _2367 + 1.0;
    float _2407 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2399);
    float _2409 = fma(_2393, 0.5, 0.5);
    float _2411 = log2(_2389);
    float _2413 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2415 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2407);
    float _2417 = fma(_2409, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2419 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2413);
    float _2421 = fma(_2409, _2417, -0.212114393711090087890625);
    float _2423 = 1.0 / _2397;
    float _2425 = -_2367;
    float _2427 = fma(_2395, _2405, _2425);
    float _2429 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2415);
    float _2431 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2433 = fma(_2409, _2421, 1.570728778839111328125);
    float _2435 = fma(_2427, 0.5, 0.5);
    float _2437 = sqrt(_2401);
    float _2439 = _2411 * 0.693147182464599609375;
    float _2441 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2443 = _2429 * _2423;
    float _2445 = _2431 * _2423;
    float _2447 = fma(_2443, 0.5, 0.5);
    float _2449 = fma(_2445, -0.5, 0.5);
    float _2451 = _2437 * 0.636619746685028076171875;
    float3 _6276 = float3(_2447, _2449, _2441);
    float _2453 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6276, float3(0.0), isnan(_6276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6276, float3(0.0), isnan(_6276)), level(0.0)).x;
    float3 _6287 = float3(_2447, _2449, _2441);
    float4 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6287, float3(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6287, float3(0.0), isnan(_6287)), level(0.0)).xyzw;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = _2456.w;
    float _2466 = -_2433;
    float _2468 = fma(_2451, _2466, 1.0);
    float2 _6309 = float2(_2468, _2435);
    float3 _2472 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6309, float2(0.0), isnan(_6309)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6309, float2(0.0), isnan(_6309)), level(0.0)).xyz;
    float _2474 = _2472.x;
    float _2476 = _2472.y;
    float _2478 = _2472.z;
    float _2480 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2482 = _2357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2484 = _2095 * _2149;
    bool _2486 = _2095 > 0.0;
    bool _2488 = isnan(_2095);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    out.m_79.x = _1381;
    out.m_79.y = _1383;
    out.m_79.z = _1385;
    float _2496 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    float _2498 = exp2(_2480);
    float _2500 = _2484 * _1521;
    bool _2502 = _2149 <= 0.0;
    bool _2504 = !_2494;
    bool _2506 = _2502 || _2504;
    float _2508 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2496);
    float _2510 = _2429 + _2397;
    float _2512 = _2500 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2514 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2508);
    float _2516 = _2397 * 0.5;
    float _2518 = _2512 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2520 = _2514 + _2397;
    float _2522 = fma(_2431, -0.5, _2516);
    float _2524 = _2510 * 0.5;
    out.gl_Position.x = _2429;
    out.gl_Position.y = _2431;
    out.gl_Position.z = _2514;
    out.gl_Position.w = _2397;
    float _2526 = _2520 * 0.5;
    float _2528 = -_2498;
    float _2530 = _2528 + 1.0;
    out.m_51.x = _2518;
    float _2532 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2524;
    out.m_81.y = _2522;
    out.m_81.z = _2526;
    out.m_81.w = _2397;
    float _2534 = _2532 * _2453;
    float _2536 = -_2532;
    float _2538 = _2536 + 1.0;
    float _2540 = _2464 * _2534;
    float _2542 = _2464 * _2538;
    float _2544 = _2478 * _2534;
    float _2546 = fma(_2474, _2540, _2458);
    float _2548 = fma(_2476, _2540, _2460);
    float _2550 = fma(_2464, _2544, _2462);
    out.m_83.x = _2546;
    out.m_83.y = _2548;
    out.m_83.z = _2550;
    out.m_83.w = _2542;
    if (!_2506)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2552;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

