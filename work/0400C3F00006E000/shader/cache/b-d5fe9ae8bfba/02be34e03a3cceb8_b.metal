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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_77 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_61 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3266 = false;
    bool _334 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3570 = as_type<float>(_124);
        out.gl_Position.z = _3570;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3635 = as_type<float>(_160);
        out.gl_Position.z = _3635;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _130;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _134 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _188;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    float _222 = in.m_59.x;
    float _224 = in.m_59.y;
    float _226 = in.m_59.z;
    bool _228 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    bool _244 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_216);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = 1.0 / _242;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = _254 * _258;
    float _270 = -_254;
    float _272 = _270 + 1.0;
    float _274 = _220 * _264;
    float _276 = fma(_262, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = _276 * _268;
    float _288 = fma(_280, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = _288 * _268;
    float _294 = _290 * _268;
    float _296 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _298 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _300 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _302 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _296);
    float _304 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _298);
    float _306 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _300);
    float _308 = _302 * _222;
    float _310 = _304 * _224;
    float _312 = _306 * _226;
    bool _314 = !_266;
    float _332;
    if (!_314)
    {
        float _316 = in.m_57.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _324 = _322 * _318;
        float _326 = floor(_324);
        float _328 = -_326;
        float _330 = _324 + _328;
        _332 = _330;
        _334 = true;
    }
    else
    {
        _332 = _172;
    }
    _334 = false;
    float _336 = _332;
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _340 = int(_338);
    float _342 = in.m_57.x;
    float _344 = in.m_57.y;
    float _346 = in.m_61.x;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _350 = int(_348);
    float _352 = in.m_57.z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _356 = float(_340);
    float _358 = 1.0 / _356;
    float _360 = float(uint(_350));
    int _362 = ~_350;
    int _364 = _362 + 1;
    int _366 = ~_350;
    int _368 = _366 + 1;
    float _370 = 1.0 / _360;
    bool _372 = _350 == 0;
    float _374 = _358 * _134;
    float _376 = trunc(_374);
    int _378 = int(_376);
    int _380 = as_type<int>(_370) + (-2);
    float _382 = float(uint(_378));
    float _384 = as_type<float>(_380) * _382;
    float _386 = trunc(_384);
    float _388 = precise::max(_386, 0.0);
    uint _391 = uint(_388);
    float _393 = float(_350);
    int _395 = _364 * int(_391);
    int _397 = _395 + _378;
    float _399 = float(uint(_397));
    float _401 = as_type<float>(_380) * _399;
    float _403 = trunc(_401);
    float _405 = precise::max(_403, 0.0);
    uint _407 = uint(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _411 = _409 != 0;
    bool _413 = !_411;
    float _415 = _413 ? 7.345489978790283203125 : 1.0;
    float _417 = _415 * _342;
    int _419 = int(_391) + int(_407);
    float _421 = floor(_417);
    float _423 = float(_378);
    int _425 = _368 * _419;
    int _427 = _425 + _378;
    bool _429 = _423 >= _393;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan(_393);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = uint(_427) >= uint(_350);
    float _443 = trunc(_439);
    int _445 = int(_443);
    bool _447 = !_441;
    int _449 = _447 ? 0 : (-1);
    float _451 = -_421;
    float _453 = _417 + _451;
    int _455 = ~_419;
    int _457 = _455 + _449;
    int _459 = _457 + 1;
    float _461 = _453 * _393;
    float _463 = _393 * _134;
    int _465 = _350 * _459;
    int _467 = _465 + _378;
    float _469 = _463 * _168;
    float _471 = trunc(_461);
    int _473 = int(_471);
    bool _475 = !_372;
    int _477 = _475 ? _467 : (-1);
    int _479 = ~_445;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _487 = _485 != 0;
    float _489 = trunc(_469);
    int _491 = int(_489);
    int _493 = _477 * _483;
    int _495 = _350 + (-1);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _511 = _509 != 0;
    int _513 = _445 * _495;
    int _515 = _513 + _493;
    bool _517 = !_487;
    int _519 = _517 ? 0 : 1;
    bool _521 = !_503;
    int _523 = _521 ? 0 : 1;
    bool _525 = !_499;
    int _527 = _525 ? 0 : 1;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _531 = _529 != 0;
    int _533 = abs(_523);
    bool _535 = !_507;
    int _537 = _535 ? 0 : 1;
    int _539 = abs(_519);
    int _541 = abs(_527);
    bool _543 = !_531;
    int _545 = _543 ? 0 : 1;
    int _547 = _473 * _539;
    int _549 = _547 + _378;
    int _551 = abs(_537);
    int _553 = _515 * _533;
    int _555 = abs(_545);
    float _557 = in.m_63.y;
    int _559 = _491 * _541;
    int _561 = _559 + _553;
    int _563 = ~_350;
    int _565 = _563 + 1;
    float _567 = in.m_63.z;
    float _569 = float(uint(_549));
    int _571 = _549 * _551;
    int _573 = _571 + _561;
    int _575 = ~_350;
    int _577 = _575 + 1;
    float _579 = in.m_63.w;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _583 = _581 != 0;
    int _585 = _473 * _555;
    int _587 = _585 + _573;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _591 = _589 != 0;
    float _593 = as_type<float>(_380) * _569;
    float _595 = float(uint(_587));
    float _597 = trunc(_593);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = as_type<float>(_380) * _595;
    float _605 = 0.0;
    if (_583)
    {
        float _607 = in.m_57.x;
        _605 = _607;
    }
    float _609 = _605;
    float _611 = 0.0;
    if (_583)
    {
        _611 = _346;
    }
    float _613 = _611;
    float _615 = trunc(_603);
    float _617 = precise::max(_615, 0.0);
    uint _619 = uint(_617);
    out.m_65.y = _557;
    out.m_65.z = _567;
    float _621 = in.m_61.y;
    out.m_65.w = _579;
    int _623 = _577 * int(_619);
    int _625 = _623 + _587;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _629 = float(uint(_625));
    float _631 = in.m_63.x;
    bool _633 = _609 > 0.5;
    bool _635 = _633 && _583;
    float _637 = as_type<float>(_380) * _629;
    float _639 = trunc(_637);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _645;
    float _649 = _613;
    float _651 = _621;
    if (_635)
    {
        float _653 = -_613;
        float _655 = _653 + 1.0;
        _649 = _655;
    }
    float _657 = _649;
    out.m_65.x = _631;
    int _659 = int(_619) + int(_643);
    int _661 = ~_350;
    int _663 = _661 + 1;
    int _665 = _565 * _659;
    int _667 = _665 + _587;
    float _669 = -_621;
    float _671 = _669 + 1.0;
    bool _673 = uint(_667) >= uint(_350);
    bool _675 = !_673;
    int _677 = _675 ? 0 : (-1);
    bool _679 = _344 > 0.5;
    int _681 = ~_659;
    int _683 = _681 + _677;
    int _685 = _683 + 1;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _342 * 2.0;
    if (_511)
    {
        float _693 = _679 ? _671 : _621;
        _651 = _693;
    }
    float _695 = _651;
    int _697 = _350 * _685;
    int _699 = _697 + _587;
    float _701 = 1.0 / _689;
    int _703 = _663 * int(_601);
    int _705 = _703 + _549;
    float _707 = -_354;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[77].x, _707);
    bool _711 = !_372;
    int _713 = _711 ? _699 : (-1);
    float _715 = float(uint(_705));
    int _717 = _713 >> 31;
    float _719 = floor(_691);
    int _721 = _713 & 3;
    bool _723 = _721 != 0;
    float _725 = as_type<float>(_380) * _715;
    int _727 = _717 & 3;
    float _729 = _344 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _731 = _713 + _727;
    float _733 = trunc(_725);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = fma(_729, -2.0, _627);
    float _741 = _647 * _701;
    int _743 = _731 >> 2;
    int _745 = _723 ? 0 : 1;
    int _747 = _743 << 4;
    int _749 = _747 + 368;
    float _751 = _344 + _342;
    bool _753 = _719 > 0.0;
    float _755 = _344 + _352;
    uint _757 = uint(int(uint(_749) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[int(_767)][_769];
    bool _773 = _719 >= 0.0;
    bool _775 = isnan(_719);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = _751 + (-1.0);
    float _785 = _755 + (-1.0);
    float _787 = _755;
    if (!_583)
    {
        _787 = _346;
    }
    float _789 = _787;
    int _791 = int(_601) + int(_737);
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _795 = _713 & 3;
    bool _797 = _795 != 0;
    int _799 = _749 + 8;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[int(_811)][_813];
    int _817 = ~_350;
    int _819 = _817 + 1;
    bool _821 = uint(_795) > 1u;
    int _823 = _819 * _791;
    int _825 = _823 + _549;
    int _827 = ~_745;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    bool _833 = !_797;
    int _835 = _833 ? 0 : 1;
    float _837 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _839 = _789;
    int _841 = _831;
    if (_583)
    {
        _839 = _657;
    }
    float _843 = _839;
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _847 = int(_845);
    bool _849 = uint(_825) >= uint(_350);
    bool _851 = _795 != 3;
    if (!_821)
    {
        int _853 = ~_745;
        int _855 = _853 + 1;
        _841 = _855;
    }
    int _857 = _841;
    bool _859 = !_591;
    int _861 = _859 ? 0 : 1;
    float _863 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _865 = log2(_863);
    bool _867 = _795 != 3;
    bool _869 = uint(_795) >= 2u;
    int _871 = abs(_857);
    int _873 = _869 ? 0 : 1;
    int _875 = ~_871;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    int _881 = ~_873;
    int _883 = _881 + 1;
    int _885 = _883 + 1;
    int _887 = abs(_835);
    int _889 = _885;
    if (_867)
    {
        int _891 = ~_873;
        int _893 = _891 + 1;
        _889 = _893;
    }
    int _895 = _889;
    float _897 = _865 * _134;
    bool _899 = !_849;
    int _901 = _899 ? 0 : (-1);
    int _903 = _879 * as_type<int>(_771);
    bool _905 = !_851;
    int _907 = _905 ? 0 : (-1);
    float _909 = exp2(_897);
    int _911 = abs(_895);
    float _913 = _344 * 2.0;
    int _915 = ~_791;
    int _917 = _915 + _901;
    int _919 = _917 + 1;
    int _921 = abs(_907);
    int _923 = _350 * _919;
    int _925 = _923 + _549;
    int _927 = ~_887;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = floor(_913);
    int _935 = abs(_861);
    int _937 = ~_911;
    int _939 = _937 + 1;
    int _941 = _939 + 1;
    int _943 = _931 * as_type<int>(_763);
    int _945 = _943 + _903;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = _352 * 2.0;
    int _961 = _941 * as_type<int>(_807);
    int _963 = _961 + _945;
    float _965 = float(uint(_847));
    float _967 = -_909;
    float _969 = _967 + 1.0;
    float _971 = floor(_959);
    int _973 = ~_921;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    int _979 = ~_935;
    int _981 = _979 + 1;
    int _983 = _981 + 1;
    bool _985 = !_372;
    int _987 = _985 ? _925 : (-1);
    int _989 = _977 * as_type<int>(_815);
    int _991 = _989 + _963;
    int _993 = abs(_847);
    float _995 = 1.0 / _965;
    bool _997 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _999 = isnan(_336);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    int _1009 = _991 * _983;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1013 = _336 + _1011;
    bool _1015 = !_949;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    int _1021 = _987 * _935;
    int _1023 = _1021 + _1009;
    float _1025 = fma(_741, _1013, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1027 = _971 > 0.0;
    bool _1029 = _971 >= 0.0;
    bool _1031 = isnan(_971);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = float(uint(_1023));
    int _1041 = _1037 ? 0 : 1;
    int _1043 = as_type<int>(_995) + (-2);
    int _1045 = ~_1041;
    int _1047 = _1045 + 1;
    int _1049 = _1047 + 1;
    bool _1051 = _933 > 0.0;
    float _1053 = as_type<float>(_1043) * _1039;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1057 = 1.0 + _1055;
    int _1059 = _1049;
    if (!_1027)
    {
        int _1061 = ~_1041;
        int _1063 = _1061 + 1;
        _1059 = _1063;
    }
    int _1065 = _1059;
    bool _1067 = _933 >= 0.0;
    bool _1069 = isnan(_933);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = 1.0 / _1057;
    bool _1079 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    float _1089 = in.m_48.x;
    float _1091 = in.m_48.y;
    float _1093 = in.m_48.z;
    bool _1095 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1097 = isnan(_336);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = float(uint(_993));
    float _1109 = trunc(_1053);
    float _1111 = precise::max(_1109, 0.0);
    uint _1113 = uint(_1111);
    float _1115 = -_1105;
    float _1117 = _1115 + 1.0;
    float _1119 = _1087 ? _969 : 0.0;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1123 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1125 = isnan(1.0);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1131 = _1127 || _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1135 = ~_847;
    int _1137 = _1135 + 1;
    float _1139 = 1.0 / _1107;
    float _1141 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1121);
    float _1143 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1133);
    int _1145 = abs(_1023);
    float _1147 = _1007 * _1117;
    float _1149 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1151 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1143);
    float _1153 = -_1007;
    float _1155 = _1153 + 1.0;
    int _1157 = _1137 * int(_1113);
    int _1159 = _1157 + _1023;
    float _1161 = -_134;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[76].x, _709);
    if (_1131)
    {
        float _1165 = _1119 * _1077;
        _154 = _1165;
    }
    float _1167 = _154;
    float _1169 = in.m_67.y;
    float _1171 = float(uint(_1159));
    float _1173 = _1025 * _1147;
    int _1175 = abs(_1017);
    float _1177 = float(_1065);
    float _1179 = as_type<float>(_1043) * _1171;
    int _1181 = as_type<int>(_1139) + (-2);
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1173);
    float _1185 = float(uint(_1145));
    float _1187 = trunc(_1179);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    int _1193 = _781 ? 0 : 1;
    float _1195 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1183);
    float _1197 = float(_1175);
    float _1199 = as_type<float>(_1181) * _1185;
    int _1201 = ~_1193;
    int _1203 = _1201 + 1;
    int _1205 = _1203 + 1;
    int _1207 = _1205;
    if (!_753)
    {
        int _1209 = ~_1193;
        int _1211 = _1209 + 1;
        _1207 = _1211;
    }
    int _1213 = _1207;
    float _1215 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1217 = ~_993;
    int _1219 = _1217 + 1;
    float _1221 = trunc(_1199);
    float _1223 = precise::max(_1221, 0.0);
    uint _1225 = uint(_1223);
    float _1227 = _1197 * _1177;
    float _1229 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1231 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1215);
    int _1233 = _1075 ? 0 : 1;
    float _1235 = _1091 + _1169;
    float _1237 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    float _1239 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1231);
    int _1241 = ~_1233;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1249 = _1235 + _1247;
    float _1251 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1237);
    float _1253 = _1239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1255 = _1245;
    if (!_1051)
    {
        int _1257 = ~_1233;
        int _1259 = _1257 + 1;
        _1255 = _1259;
    }
    int _1261 = _1255;
    float _1263 = _1249 * _1249;
    float _1265 = in.m_69.x;
    float _1267 = in.m_69.y;
    float _1269 = in.m_69.z;
    int _1271 = int(_1113) + int(_1191);
    int _1273 = _1219 * int(_1225);
    int _1275 = _1273 + _1145;
    float _1277 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1279 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1253 + _1281;
    int _1285 = ~_847;
    int _1287 = _1285 + 1;
    float _1289 = _1227 * (-2.0);
    float _1291 = float(uint(_1275));
    bool _1293 = !_953;
    int _1295 = _1293 ? 0 : 1;
    bool _1297 = _847 == 0;
    float _1299 = as_type<float>(_1181) * _1291;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1279 + _1301;
    float _1305 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1277);
    int _1307 = abs(_1295);
    float _1309 = trunc(_1299);
    float _1311 = precise::max(_1309, 0.0);
    uint _1313 = uint(_1311);
    float _1315 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1305);
    float _1317 = float(_1213);
    float _1319 = fma(_793, _1289, _793);
    float _1321 = float(_1307);
    float _1323 = fma(_1289, _1265, _1265);
    bool _1325 = _1315 >= 0.0;
    int _1327 = _1287 * _1271;
    int _1329 = _1327 + _1023;
    float _1331 = _1321 * _1317;
    float _1333 = fma(_1283, _1283, _1263);
    bool _1335 = uint(_1329) >= uint(_847);
    float _1337 = _1331 * (-2.0);
    float _1339 = fma(_1303, _1303, _1333);
    int _1341 = int(_1225) + int(_1313);
    float _1343 = fma(_1337, _1267, _1267);
    int _1345 = ~_993;
    int _1347 = _1345 + 1;
    float _1349 = rsqrt(_1339);
    float _1351 = _1265;
    int _1353 = as_type<int>(_1331);
    if (_1325)
    {
        _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1355 = _1351;
    if (_1325)
    {
        out.m_51.x = 0.0;
    }
    int _1357 = _1347 * _1341;
    int _1359 = _1357 + _1145;
    bool _1361 = !_1335;
    int _1363 = _1361 ? 0 : (-1);
    if (_1325)
    {
        float _1365 = _1355 * 5.0;
        _1353 = as_type<int>(_1365);
    }
    int _1367 = _1353;
    float _1369 = fma(_837, _1337, _837);
    bool _1371 = uint(_1359) >= uint(_993);
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1375 = _1023 ^ _847;
    if (_1325)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5391 = as_type<float>(_1367);
        out.gl_Position.z = _5391;
    }
    int _1377 = ~_1271;
    int _1379 = _1377 + _1363;
    int _1381 = _1379 + 1;
    bool _1383 = !_1371;
    int _1385 = _1383 ? 0 : (-1);
    uint _1387 = uint(int(uint(_1375) >> uint(31)));
    int _1389 = _847 * _1381;
    int _1391 = _1389 + _1023;
    float _1393 = _1249 * _1349;
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1397 = ~_1385;
    int _1399 = _1341 + _1397;
    int _1401 = _1399 + 1;
    float _1403 = _1283 * _1349;
    int _1405 = ~int(_1387);
    int _1407 = _1405 + 1;
    float _1409 = -_1393;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1413 = _342 + (-0.5);
    bool _1415 = _847 == 0;
    float _1417 = -_1403;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    int _1421 = _1401 ^ _1407;
    float _1423 = _1411 * _1411;
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1323);
    bool _1427 = !_1415;
    int _1429 = _1427 ? _1391 : (-1);
    float _1431 = _1303 * _1349;
    int _1433 = ~_1407;
    int _1435 = _1433 + _1421;
    int _1437 = _1435 + 1;
    float _1439 = fma(_1419, _1419, _1423);
    float _1441 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1443 = float(_1429);
    float _1445 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1447 = !_1297;
    int _1449 = _1447 ? _1437 : (-1);
    float _1451 = fma(_1441, _843, -0.5);
    float _1453 = fma(_1319, _1167, _1425);
    float _1455 = fma(_1441, _1443, _1163);
    float _1457 = float(_1449);
    float _1459 = fma(_1445, _695, -0.5);
    float _1461 = fma(_1149, _1451, _1455);
    float _1463 = -_1019;
    float _1465 = fma(_1445, _1457, _1463);
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1469 = fma(_1151, _1459, _1465);
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = _1461 + 0.5;
    float _1493 = _1469 + 0.5;
    float _1495 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1497 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1501 = -_1431;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    bool _1505 = !_957;
    int _1507 = _1505 ? 0 : 1;
    out.m_71.x = _1491;
    out.m_71.y = _1493;
    float _1509 = fma(_1503, _1503, _1439);
    int _1511 = abs(_1507);
    out.m_73.x = _1487;
    out.m_73.y = _1489;
    out.m_73.z = _1495;
    out.m_73.w = _1483;
    out.m_75.x = _1481;
    out.m_75.y = _1485;
    out.m_75.z = _1497;
    out.m_75.w = _1499;
    float _1513 = _1431;
    float _1515 = _1393;
    if (_1325)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1517 = -_1393;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1521 = _344 + (-0.5);
    float _1523 = -_1403;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1527 = float(_1261);
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1519 + _1529;
    float _1533 = float(_1511);
    float _1535 = -_1431;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1541 = _1525 + _1539;
    float _1543 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1545 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1343);
    float _1547 = _1533 * _1527;
    float _1549 = _352 + _342;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1537 + _1551;
    float _1555 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1543);
    float _1557 = fma(_1369, _1167, _1545);
    float _1559 = _1549 + (-1.0);
    float _1561 = _1547 * (-2.0);
    float _1563 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    float _1565 = _352 + (-0.5);
    float _1567 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1569 = fma(_1561, _1269, _1269);
    float _1571 = _1453 * 0.15915493667125701904296875;
    bool _1573 = _1563 >= 0.0;
    float _1575 = fma(_1567, _1561, _1567);
    float _1577 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1569);
    float _1579 = _1557 * 0.15915493667125701904296875;
    float _1581 = sqrt(_1509);
    float _1583 = fma(_1575, _1167, _1577);
    float _1585 = _1583 * 0.15915493667125701904296875;
    float _1587 = _1571 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1569;
    if (_1573)
    {
        _1591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1593 = _1591;
    int _1595 = as_type<int>(_1593);
    if (_1573)
    {
        out.m_51.x = 0.0;
    }
    if (_1573)
    {
        float _1597 = _1593 * 5.0;
        _1595 = as_type<int>(_1597);
    }
    int _1599 = _1595;
    float _1601 = _1571 * 6.283185482025146484375;
    float _1603 = cos(_1601);
    if (_1573)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5793 = as_type<float>(_1599);
        out.gl_Position.z = _5793;
    }
    float _1605 = _1579 * 6.283185482025146484375;
    float _1607 = sin(_1605);
    float _1609 = _1579 * 6.283185482025146484375;
    float _1611 = cos(_1609);
    float _1613 = _1585 * 6.283185482025146484375;
    float _1615 = sin(_1613);
    if (_1573)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1617 = _1585 * 6.283185482025146484375;
    float _1619 = cos(_1617);
    float _1621 = _1603 * _1611;
    float _1623 = _1589 * _1611;
    float _1625 = _1589 * _1607;
    float _1627 = _1349 * _1581;
    float _1629 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1631 = _1603 * _1607;
    float _1633 = fma(_1615, _1621, _1625);
    float _1635 = fma(_1615, _1625, _1621);
    float _1637 = in.m_77.x;
    float _1639 = in.m_77.y;
    float _1641 = in.m_77.z;
    float _1643 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1645 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1647 = _1611 * _1619;
    float _1649 = -_1253;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1653 = _1607 * _1619;
    float _1655 = -_1235;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1659 = _1603 * _1619;
    float _1661 = _1651 * _1651;
    float _1663 = _1589 * _1619;
    float _1665 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1629);
    float _1667 = -_1631;
    float _1669 = fma(_1615, _1623, _1667);
    float _1671 = -_1623;
    float _1673 = fma(_1615, _1631, _1671);
    float _1675 = -_1279;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1679 = fma(_1657, _1657, _1661);
    float _1681 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1665);
    float _1683 = _308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1685 = fma(_1677, _1677, _1679);
    float _1687 = _1681 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1689 = _1627 * _1643;
    float _1691 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1645);
    float _1693 = rsqrt(_1685);
    float _1695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1639);
    float _1697 = -_1687;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1701 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1703 = _1627 * _1683;
    float _1705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1637);
    float _1707 = _1695 * _1689;
    float _1709 = fma(_1699, _1699, _1661);
    float _1711 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1713 = _1705 * _1703;
    float _1715 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1691);
    float _1717 = _1627 * _1711;
    float _1719 = fma(_1677, _1677, _1709);
    float _1721 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1723 = _1651 * _1693;
    float _1725 = _1657 * _1693;
    float _1727 = _1677 * _1693;
    float _1729 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1701);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1733 = _1723 * _1731;
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1735;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1741 = _1727 * _1739;
    float _1743 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1729);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1747 = -_1733;
    float _1749 = fma(_1727, _1745, _1747);
    float _1751 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1755 = _1725 * _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1759 = -_1741;
    float _1761 = fma(_1725, _1757, _1759);
    float _1763 = _1749 * _1749;
    float _1765 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1769 = -_1755;
    float _1771 = fma(_1723, _1767, _1769);
    float _1773 = sqrt(_1719);
    float _1775 = fma(_1761, _1761, _1763);
    float _1777 = -_1765;
    float _1779 = _1751 + _1777;
    float _1781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1641);
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1721);
    float _1785 = fma(_1771, _1771, _1775);
    float _1787 = _1781 * _1717;
    float _1789 = 1.0 / _1737;
    float _1791 = abs(_1779);
    float _1793 = precise::max(_1791, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    bool _1795 = _1765 >= _1751;
    bool _1797 = isnan(_1765);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan(_1751);
    bool _1803 = _1799 || _1801;
    float _1805 = -_1707;
    float _1807 = _1615 * _1805;
    float _1809 = precise::min(_1793, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1811 = _1659 * _1707;
    float _1813 = _1663 * _1707;
    float _1815 = rsqrt(_1785);
    float _1817 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1783);
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1821 = _1809 + _1819;
    float _1823 = fma(_1647, _1713, _1807);
    float _1825 = abs(_1773);
    float _1827 = precise::max(0.0, _1825);
    float _1829 = fma(_1633, _1713, _1811);
    float _1831 = fma(_1669, _1713, _1813);
    bool _1833 = !_1803;
    float _1835 = _1833 ? 1.0 : (-1.0);
    float _1837 = _1821 * _1789;
    float _1839 = precise::min(_1827, 40.0);
    float _1841 = _172 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1843 = rsqrt(_1817);
    float _1845 = _1835 * _1837;
    float _1847 = fma(_1653, _1787, _1823);
    float _1849 = fma(_1839, -0.02500000037252902984619140625, 1.0);
    float _1851 = fma(_1673, _1787, _1829);
    float _1853 = _1771 * _1815;
    float _1855 = _1761 * _1815;
    float _1857 = _1749 * _1815;
    float _1859 = _1841 * _1845;
    float _1861 = _1723 * _1853;
    float _1863 = fma(_1635, _1787, _1831);
    float _1865 = _1727 * _1857;
    float _1867 = _1725 * _1855;
    float _1869 = -_1861;
    float _1871 = fma(_1727, _1855, _1869);
    float _1873 = -_1865;
    float _1875 = fma(_1725, _1853, _1873);
    float _1877 = -_1867;
    float _1879 = fma(_1723, _1857, _1877);
    float _1881 = _1871 * _1851;
    float _1883 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1885 = _1875 * _1851;
    float _1887 = _1879 * _1851;
    float _1889 = fma(_1857, _1847, _1881);
    float _1891 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1893 = fma(_1855, _1847, _1885);
    float _1895 = fma(_1853, _1847, _1887);
    float _1897 = fma(_1725, _1863, _1889);
    float _1899 = _1883 * _1883;
    float _1901 = fma(_1723, _1863, _1893);
    float _1903 = fma(_1727, _1863, _1895);
    float _1905 = _1235 + _1897;
    float _1907 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1909 = _1253 + _1901;
    float _1911 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = fma(_1891, _1891, _1899);
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1921 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1907);
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1925 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1927 = fma(_1911, _1911, _1917);
    float _1929 = _1279 + _1903;
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1919);
    float _1933 = _1859 * 0.15915493667125701904296875;
    float _1935 = rsqrt(_1927);
    float _1937 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1921);
    float _1939 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1925);
    float _1941 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1943 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1923);
    float _1945 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1947 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1949 = _1933 * 6.283185482025146484375;
    float _1951 = cos(_1949);
    float _1953 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1955 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1957 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1959 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1961 = -_1945;
    float _1963 = _1961 + _1953;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1967 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1957);
    float _1969 = _1933 * 6.283185482025146484375;
    float _1971 = sin(_1969);
    float _1973 = fma(_1849, _1963, _1945);
    float _1975 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1959);
    float _1977 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1965);
    float _1979 = _1911 * _1935;
    float _1981 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1967);
    float _1983 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1977);
    float _1985 = _1891 * _1935;
    float _1987 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1975);
    float _1989 = _1883 * _1935;
    float _1991 = -_1951;
    float _1993 = _1991 + 1.0;
    float _1995 = _1979 * _1979;
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2001 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2003 = _1989 * _1993;
    float _2005 = _1985 * _1971;
    float _2007 = _1989 * _1971;
    float _2009 = _1979 * _1971;
    float _2011 = fma(_1993, _1995, _1951);
    float _2013 = _1985 * _1993;
    float _2015 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2017 = fma(_1979, _2003, _2005);
    float _2019 = -_1687;
    float _2021 = _2019 + _2001;
    float _2023 = -_2009;
    float _2025 = fma(_1989, _2013, _2023);
    float _2027 = -_2007;
    float _2029 = fma(_1979, _2013, _2027);
    float _2031 = -_1253;
    float _2033 = _2031 + _2015;
    float _2035 = _2017 * _2021;
    float _2037 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2039 = fma(_1985, _2013, _1951);
    float _2041 = _2025 * _2021;
    float _2043 = fma(_2029, _2033, _2035);
    float _2045 = -_1279;
    float _2047 = _2045 + _2037;
    float _2049 = fma(_172, _1999, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2051 = fma(_2039, _2033, _2041);
    float _2053 = fma(_1979, _2013, _2007);
    float _2055 = fma(_2011, _2047, _2043);
    float _2057 = -_2005;
    float _2059 = fma(_1979, _2003, _2057);
    float _2061 = fma(_2053, _2047, _2051);
    float _2063 = fma(_2055, _2049, _1279);
    float _2065 = fma(_2061, _2049, _1253);
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2069 = _2063 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2073 = _2065 + _2071;
    float _2075 = _2069 * _2069;
    float _2077 = fma(_2073, _2073, _2075);
    float _2079 = sqrt(_2077);
    bool _2081 = _2079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2085 = _2079 + _2083;
    float _2087 = _2075;
    float _2089 = _2077;
    float _2091 = _1951;
    float _2093 = _1687;
    float _2095 = _2065;
    float _2097 = _2063;
    if (_2081)
    {
        float _2099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2099;
    }
    float _2101 = _2087;
    if (_2081)
    {
        float _2103 = rsqrt(_2077);
        _2089 = _2103;
    }
    float _2105 = _2089;
    float _2107 = _2101;
    if (_2081)
    {
        float _2109 = _2085 * _2101;
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = fma(_1989, _2003, _1951);
    float _2115 = fma(_1989, _2013, _2009);
    if (_2081)
    {
        float _2117 = _2111 * 0.15915493667125701904296875;
        _2091 = _2117;
    }
    float _2119 = _2091;
    float _2121 = _2113 * _2021;
    float _2123 = _2009;
    if (_2081)
    {
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _2123 = _2127;
    }
    float _2129 = _2123;
    float _2131 = fma(_2115, _2033, _2121);
    float _2133 = fma(_2059, _2047, _2131);
    float _2135 = _1687 + _2133;
    float _2137 = _2135;
    if (_2081)
    {
        float _2139 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2093 = _2139;
    }
    float _2141 = _2093;
    float _2143 = _2129;
    if (_2081)
    {
        float _2145 = fma(_2129, _2141, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2143 = _2145;
    }
    float _2147 = _2143;
    float _2149 = _2147;
    if (_2081)
    {
        float _2151 = _2105 * _2147;
        _2149 = _2151;
    }
    float _2153 = _2149;
    if (_2081)
    {
        float _2155 = fma(_2073, _2153, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2095 = _2155;
    }
    float _2157 = _2095;
    float _2159 = _2157;
    if (_2081)
    {
        float _2161 = fma(_2069, _2153, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2097 = _2161;
    }
    float _2163 = _2097;
    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2167 = _2157 + _2165;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2171 = _2163 + _2169;
    float _2173 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2175 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6755 = float2(_2173, _2175);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6755, float2(0.0), isnan(_6755)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6755, float2(0.0), isnan(_6755)), level(0.0)).x;
    float _2179 = _2119;
    float _2181 = _2167;
    float _2183 = _2163;
    if (_2081)
    {
        float _2185 = _2119 * 6.283185482025146484375;
        float _2187 = cos(_2185);
        _2179 = _2187;
    }
    float _2189 = _2179;
    if (_2081)
    {
        float _2191 = _2189 + (-1.0);
        _2181 = _2191;
    }
    float _2193 = _2181;
    float _2195 = _2193;
    if (_2081)
    {
        float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2197;
    }
    float _2199 = _2195;
    if (_2081)
    {
        float _2201 = fma(_2135, _2189, _2199);
        _2137 = _2201;
    }
    float _2203 = _2137;
    float _2205 = fma(_2177, 100.0, _1235);
    float _2207 = -_1235;
    float _2209 = _2207 + _2203;
    float _2211 = fma(_2177, 100.0, _2203);
    float _2213 = -_1393;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    float _2217 = _2209 * _2209;
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2223 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    float _2225 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2221);
    float _2227 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2223);
    float _2229 = -_1253;
    float _2231 = _2229 + _2157;
    float _2233 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2225);
    float _2235 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2237 = -_1279;
    float _2239 = _2237 + _2163;
    float _2241 = fma(_2231, _2231, _2217);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2245 = 1.0 / _2235;
    float _2247 = fma(_2239, _2239, _2241);
    float _2249 = _2243 + _2235;
    float _2251 = sqrt(_2247);
    bool _2253 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.5);
    bool _2261 = _2257 || _2259;
    float _2263 = _2249 * _2245;
    float _2265 = _2263 * 0.5;
    bool _2267 = _2251 > 0.0;
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2271 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2269);
    bool _2273 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan(0.5);
    bool _2281 = _2277 || _2279;
    float _2283 = 1.0 / _2271;
    bool _2285 = !_2267;
    float _2287 = _2211;
    float _2289 = _2177;
    if (!_2285)
    {
        float _2291 = _188 * _188;
        float _2293 = rsqrt(_2247);
        float _2295 = fma(_186, _186, _2291);
        float _2297 = fma(_190, _190, _2295);
        float _2299 = sqrt(_2297);
        float _2301 = _2231 * _2293;
        float _2303 = _2209 * _2293;
        bool _2305 = _2299 > 0.0;
        float _2307 = _2239 * _2293;
        bool _2309 = !_2305;
        _2289 = _2297;
        if (!_2309)
        {
            float _2311 = rsqrt(_2297);
            float _2313 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2315 = _188 * _2311;
            float _2317 = _186 * _2311;
            float _2319 = _190 * _2311;
            float _2321 = _2303 * _2315;
            float _2323 = fma(_2301, _2317, _2321);
            float _2325 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2327 = fma(_2307, _2319, _2323);
            float _2329 = _2327 * _2325;
            float _2331 = fma(_186, _2329, _2157);
            float _2333 = fma(_188, _2329, _2211);
            float _2335 = fma(_190, _2329, _2163);
            _2183 = _2335;
            _2287 = _2333;
            _2159 = _2331;
        }
    }
    float _2337 = _2183;
    float _2339 = _2287;
    float _2341 = _2159;
    float _2343 = _2289;
    float _2345 = -_1431;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2337);
    float _2349 = -_1393;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2339);
    float _2353 = -_1403;
    float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2341);
    float _2357 = _2351;
    float _2359 = _2355;
    float _2361 = _2347;
    float _2363 = _2343;
    if (_2281)
    {
        _1513 = 1.0;
    }
    float _2365 = _1513;
    float _2367 = _2365;
    if (_2261)
    {
        _1515 = _2347;
    }
    float _2369 = _1515;
    float _2371 = _2369;
    if (!_2261)
    {
        float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2375 = _2215 + _2373;
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2379 = -_1279;
        float _2381 = _2379 + _2337;
        float _2383 = -_2205;
        float _2385 = _2383 + _2339;
        float _2387 = _2375 * _2375;
        float _2389 = -_1253;
        float _2391 = _2389 + _2341;
        float _2393 = fma(_1541, _1541, _2387);
        float _2395 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2397 = fma(_1553, _1553, _2393);
        float _2399 = 1.0 / _1627;
        float _2401 = sqrt(_2397);
        float _2403 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2405 = precise::min(_2401, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2407 = _2405 * _2377;
        float _2409 = _2407 * _2399;
        float _2411 = _2403 * _2409;
        float _2413 = _2381 * _2409;
        float _2415 = fma(_2385, _2411, _2215);
        float _2417 = fma(_2391, _2411, _1525);
        float _2419 = fma(_2403, _2413, _1537);
        _194 = _2411;
        _2357 = _2415;
        _2359 = _2417;
        _2371 = _2419;
        _2361 = _2401;
    }
    float _2421 = _194;
    float _2423 = _2357;
    float _2425 = _2359;
    float _2427 = _2371;
    float _2429 = _2361;
    float _2431 = _2421;
    float _2433 = _2429;
    if (_2281)
    {
        _2363 = 1.0;
    }
    float _2435 = _2363;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2439 = _2283 * _2437;
    float _2441 = _2435;
    if (!_2281)
    {
        float _2443 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2445 = _2443 * 0.15915493667125701904296875;
        float _2447 = _2445 * 6.283185482025146484375;
        float _2449 = cos(_2447);
        float _2451 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2453 = _2451 * 0.15915493667125701904296875;
        float _2455 = _2445 * 6.283185482025146484375;
        float _2457 = sin(_2455);
        float _2459 = 1.0 / _2449;
        float _2461 = _2453 * 6.283185482025146484375;
        float _2463 = cos(_2461);
        float _2465 = _2457 * _2459;
        float _2467 = _2453 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2473 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2471;
        float _2475 = _2463 * _2465;
        float _2477 = 1.0 / _2473;
        float _2479 = 1.0 / _2475;
        float _2481 = _2469 * _2479;
        float _2483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2485 = fma(_2439, _2481, _2483);
        float _2487 = _2485 * _2477;
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        _2431 = _2453;
        _2433 = _2465;
        _2367 = _2489;
    }
    float _2491 = _2431;
    float _2493 = _2433;
    float _2495 = _2367;
    float _2497 = _2493;
    float _2499 = _2491;
    if (!_2281)
    {
        float _2501 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2503 = _2501 * 0.15915493667125701904296875;
        float _2505 = _2503 * 6.283185482025146484375;
        float _2507 = cos(_2505);
        float _2509 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2511 = _2509 * 0.15915493667125701904296875;
        float _2513 = _2503 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = 1.0 / _2507;
        float _2519 = _2511 * 6.283185482025146484375;
        float _2521 = cos(_2519);
        float _2523 = _2515 * _2517;
        float _2525 = _2511 * 6.283185482025146484375;
        float _2527 = sin(_2525);
        float _2529 = _2521 * _2523;
        float _2531 = 1.0 / _2529;
        float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2535 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2533;
        float _2537 = 1.0 / _2535;
        float _2539 = _2527 * _2531;
        float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2543 = fma(_2439, _2539, _2541);
        float _2545 = _2543 * _2537;
        float _2547 = precise::clamp(_2545, 0.0, 1.0);
        float _2549 = -_2547;
        float _2551 = _2549 + 1.0;
        _2497 = _2529;
        _2499 = _2507;
        _2441 = _2551;
    }
    float _2553 = _2497;
    float _2555 = _2499;
    float _2557 = _2441;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2561 = _2423 + _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2565 = _2425 + _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2427 + _2567;
    float _2571 = _2561 * _2561;
    float _2573 = fma(_2565, _2565, _2571);
    float _2575 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2577 = fma(_2569, _2569, _2573);
    float _2579 = rsqrt(_2577);
    float _2581 = sqrt(_2577);
    float _2583 = _2579 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2585 = _2565 * _2583;
    float _2587 = _2569 * _2583;
    float _2589 = _2585 * _2585;
    float _2591 = _2587 * _2587;
    float _2593 = _2589 + _2591;
    float _2595 = sqrt(_2593);
    bool _2597 = _2595 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2601 = _2595 + _2599;
    float _2603 = _2569;
    float _2605 = _2593;
    float _2607 = _2601;
    float _2609 = _2553;
    float _2611 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2613 = _2583;
    if (_2597)
    {
        float _2615 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2603 = _2615;
    }
    float _2617 = _2603;
    if (_2597)
    {
        float _2619 = rsqrt(_2593);
        _2605 = _2619;
    }
    float _2621 = _2605;
    float _2623 = _2621;
    if (_2597)
    {
        float _2625 = _2601 * _2617;
        _2607 = _2625;
    }
    float _2627 = _2607;
    if (_2597)
    {
        float _2629 = _2627 * 0.15915493667125701904296875;
        _2609 = _2629;
    }
    float _2631 = _2609;
    float _2633 = _2617;
    float _2635 = _2631;
    if (_2597)
    {
        float _2637 = _2631 * 6.283185482025146484375;
        float _2639 = sin(_2637);
        _2633 = _2639;
    }
    float _2641 = _2633;
    float _2643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2645 = precise::max(0.0, _2643);
    float _2647 = _2555;
    float _2649 = _2645;
    if (_2597)
    {
        float _2651 = _2631 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        _2647 = _2653;
    }
    float _2655 = _2647;
    float _2657 = -_2583;
    float _2659 = -_2645;
    float _2661 = fma(_2561, _2657, _2659);
    float _2663 = _2661;
    if (_2597)
    {
        float _2665 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2649 = _2665;
    }
    float _2667 = _2649;
    float _2669 = _2667;
    if (!_2597)
    {
        _2635 = _2585;
    }
    float _2671 = _2635;
    float _2673 = _2641;
    float _2675 = _2671;
    if (_2597)
    {
        float _2677 = fma(_2641, _2667, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2673 = _2677;
    }
    float _2679 = _2673;
    float _2681 = _2679;
    float _2683 = _2655;
    if (_2597)
    {
        float _2685 = _2655 + (-1.0);
        _2669 = _2685;
    }
    float _2687 = _2669;
    if (_2597)
    {
        float _2689 = _2621 * _2679;
        _2611 = _2689;
    }
    float _2691 = _2611;
    if (!_2597)
    {
        _2681 = _2587;
    }
    float _2693 = _2681;
    float _2695 = _2693;
    if (_2597)
    {
        float _2697 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2613 = _2697;
    }
    float _2699 = _2613;
    if (_2597)
    {
        float _2701 = _2585 * _2691;
        _2675 = _2701;
    }
    float _2703 = _2675;
    if (!_2597)
    {
        _2623 = _2589;
    }
    float _2705 = _2623;
    float _2707 = _2705;
    if (_2597)
    {
        float _2709 = _2587 * _2691;
        _2695 = _2709;
    }
    float _2711 = _2695;
    if (_2597)
    {
        float _2713 = fma(_2661, _2655, _2699);
        _2663 = _2713;
    }
    float _2715 = _2663;
    if (_2597)
    {
        float _2717 = _2703 * _2703;
        _2707 = _2717;
    }
    float _2719 = _2707;
    if (!_2597)
    {
        _2683 = _2591;
    }
    float _2721 = _2683;
    float _2723 = _2721;
    if (_2597)
    {
        float _2725 = _2711 * _2711;
        _2723 = _2725;
    }
    float _2727 = _2723;
    float _2729 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2731 = fma(_2715, _2715, _2719);
    float _2733 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2735 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2729);
    float _2737 = _2731 + _2727;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2741 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2739);
    float _2743 = precise::clamp(_2741, 0.0, 1.0);
    float _2745 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2735);
    float _2747 = floor(_2575);
    float _2749 = -_2743;
    float _2751 = _2749 + 1.0;
    float _2753 = _2745 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2755 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2757 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2759 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2761 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2763 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2733);
    float _2765 = rsqrt(_2737);
    float _2767 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2757);
    float _2769 = -_2761;
    float _2771 = fma(_2769, _2755, 1.0);
    float _2773 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2775 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2763);
    float _2777 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2767);
    float _2779 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2773);
    float _2781 = abs(_2751);
    float _2783 = log2(_2781);
    float _2785 = _2777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2787 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2789 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2779);
    float _2791 = -_2747;
    float _2793 = _2575 + _2791;
    float _2795 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2797 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2799 = _2789 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2801 = _2765 * _2703;
    float _2803 = _2765 * _2715;
    float _2805 = _2765 * _2711;
    float _2807 = floor(_2759);
    float _2809 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2811 = -_2809;
    float _2813 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2811);
    float _2815 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2817 = log2(_2771);
    float _2819 = -_2805;
    float _2821 = fma(_2819, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2813);
    float _2823 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2795);
    float _2825 = fma(_2821, -0.5, 0.5);
    float _2827 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2823);
    float _2829 = fma(_2821, 0.5, 0.5);
    float _2831 = exp2(_2815);
    float _2833 = -_2807;
    float _2835 = _2759 + _2833;
    float _2837 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2827);
    float _2839 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2841 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2797);
    float _2843 = fma(_2829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2845 = 1.0 / _2837;
    float _2847 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2839);
    float _2849 = _2803 + 1.0;
    float _2851 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2841);
    float _2853 = fma(_2829, _2843, -0.212114393711090087890625);
    float _2855 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2847);
    float _2857 = _2817 * 0.693147182464599609375;
    float _2859 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2851);
    float _2861 = sqrt(_2825);
    float _2863 = -_2803;
    float _2865 = fma(_2831, _2849, _2863);
    float _2867 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2855);
    float _2869 = fma(_2829, _2853, 1.570728778839111328125);
    float2 _7830 = float2(_2793, _2835);
    float _2871 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7830, float2(0.0), isnan(_7830)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7830, float2(0.0), isnan(_7830)), level(0.0)).x;
    float _2873 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2875 = _2859 * _2845;
    float _2877 = _2867 * _2845;
    float _2879 = fma(_2865, 0.5, 0.5);
    float _2881 = fma(_2875, 0.5, 0.5);
    float _2883 = fma(_2877, -0.5, 0.5);
    float _2885 = _2861 * 0.636619746685028076171875;
    float3 _7858 = float3(_2881, _2883, _2873);
    float _2887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7858, float3(0.0), isnan(_7858)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7858, float3(0.0), isnan(_7858)), level(0.0)).x;
    float _2889 = -_2869;
    float _2891 = fma(_2885, _2889, 1.0);
    float3 _7874 = float3(_2881, _2883, _2873);
    float4 _2894 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7874, float3(0.0), isnan(_7874)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7874, float3(0.0), isnan(_7874)), level(0.0)).xyzw;
    float _2896 = _2894.x;
    float _2898 = _2894.y;
    float _2900 = _2894.z;
    float _2902 = _2894.w;
    float2 _7890 = float2(_2891, _2879);
    float3 _2906 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7890, float2(0.0), isnan(_7890)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7890, float2(0.0), isnan(_7890)), level(0.0)).xyz;
    float _2908 = _2906.x;
    float _2910 = _2906.y;
    float _2912 = _2906.z;
    float _2914 = in.m_79.x;
    float _2916 = in.m_79.y;
    float _2918 = in.m_79.z;
    bool _2920 = _1639 != 0.0;
    bool _2922 = isnan(_1639);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.0);
    bool _2928 = _2924 || _2926;
    float _2930 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2932 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1481;
    out.m_75.y = _1485;
    out.m_75.z = _1497;
    out.m_75.w = _1499;
    bool _2934 = _1637 == 0.0;
    bool _2936 = !_2928;
    bool _2938 = _2934 && _2936;
    float _2940 = _1659 * _1875;
    float _2942 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2932);
    float _2944 = _1659 * _1879;
    bool _2946 = _1641 == 0.0;
    bool _2948 = _2946 && _2938;
    float _2950 = exp2(_2930);
    out.m_73.x = _1487;
    out.m_73.y = _1489;
    out.m_73.z = _1495;
    out.m_73.w = _1483;
    float _2952 = -_1615;
    float _2954 = fma(_2952, _1855, _2940);
    float _2956 = -_1615;
    float _2958 = fma(_2956, _1853, _2944);
    float _2960 = fma(_1663, _1723, _2954);
    float _2962 = _2916;
    float _2964 = _2918;
    float _2966 = _2914;
    if (!_2948)
    {
        float _2968 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2916);
        _2962 = _2968;
    }
    float _2970 = _2962;
    if (!_2948)
    {
        float _2972 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2918);
        _2964 = _2972;
    }
    float _2974 = _2964;
    float _2976 = _1659 * _1871;
    float _2978 = _1633 * _1875;
    if (!_2948)
    {
        float _2980 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2914);
        _2966 = _2980;
    }
    float _2982 = _2966;
    float _2984 = _1633 * _1871;
    float _2986 = -_1615;
    float _2988 = fma(_2986, _1857, _2976);
    float _2990 = fma(_1647, _1855, _2978);
    float _2992 = _1633 * _1879;
    float _2994 = _1673 * _1875;
    float _2996 = fma(_1663, _1725, _2988);
    float _2998 = fma(_1669, _1723, _2990);
    float _3000 = fma(_1647, _1857, _2984);
    float _3002 = abs(_2439);
    float _3004 = log2(_3002);
    float _3006 = fma(_1647, _1853, _2992);
    float _3008 = fma(_1663, _1727, _2958);
    float _3010 = fma(_1653, _1855, _2994);
    float _3012 = _2960 * _2970;
    float _3014 = fma(_1669, _1725, _3000);
    float _3016 = fma(_1669, _1727, _3006);
    float _3018 = _2996 * _2970;
    float _3020 = _3008 * _2970;
    float _3022 = fma(_1635, _1723, _3010);
    float _3024 = fma(_2998, _2982, _3012);
    float _3026 = fma(_3014, _2982, _3018);
    float _3028 = fma(_3016, _2982, _3020);
    float _3030 = fma(_3022, _2974, _3024);
    float _3032 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3034 = in.m_67.x;
    bool _3036 = _2439 <= 8000.0;
    bool _3038 = isnan(_2439);
    bool _3040 = _3036 || _3038;
    bool _3042 = isnan(8000.0);
    bool _3044 = _3040 || _3042;
    float _3046 = float(_3044);
    float _3048 = _2837 * 0.5;
    float _3050 = -_2950;
    float _3052 = _3050 + 1.0;
    float _3054 = _1673 * _1871;
    float _3056 = exp2(_3032);
    float _3058 = _1673 * _1879;
    bool _3060 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3062 = isnan(_2581);
    bool _3064 = _3060 || _3062;
    bool _3066 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3068 = _3064 || _3066;
    float _3070 = fma(_1653, _1857, _3054);
    float _3072 = fma(_1653, _1853, _3058);
    float _3074 = fma(_1635, _1725, _3070);
    float _3076 = fma(_1635, _1727, _3072);
    float _3078 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2942);
    float _3080 = fma(_3074, _2974, _3026);
    float _3082 = fma(_3076, _2974, _3028);
    float _3084 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3078);
    float _3086 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3088 = precise::clamp(_3086, 0.0, 1.0);
    float _3090 = _2859 + _2837;
    out.m_81.x = _3030;
    out.m_81.y = _3080;
    out.m_81.z = _3082;
    float _3092 = fma(_3088, -2.0, 3.0);
    float _3094 = _3088 * _3088;
    out.gl_Position.x = _2859;
    out.gl_Position.y = _2867;
    out.gl_Position.z = _3084;
    out.gl_Position.w = _2837;
    float _3096 = _3090 * 0.5;
    float _3098 = _3094 * _3092;
    float _3100 = -_3098;
    float _3102 = _3100 + 1.0;
    float _3104 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3098);
    float _3106 = fma(_2867, -0.5, _3048);
    float _3108 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3110 = _3084 + _2837;
    float _3112 = _3046 * _3104;
    float _3114 = _3110 * 0.5;
    float _3116 = _3112 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3096;
    out.m_83.y = _3106;
    out.m_83.z = _3114;
    out.m_83.w = _2837;
    float _3118 = _2495 * _2557;
    float _3120 = _2837;
    float _3122 = _3114;
    float _3124 = _3106;
    float _3126 = _3118;
    if (!_3068)
    {
        _3120 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3128 = _3120;
    float _3130 = _3128;
    float _3132 = _3128;
    if (!_3068)
    {
        _3122 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3134 = _3122;
    float _3136 = _3118 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3138 = _3134;
    float _3140 = _3134;
    if (!_3068)
    {
        _3124 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3142 = _3124;
    float _3144 = _3142;
    float _3146 = _3142;
    if (!_3068)
    {
        _3126 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3148 = _3126;
    float _3150 = -_2871;
    float _3152 = _3150 + 1.0;
    float _3154 = _3152 * _3116;
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3156;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3162 = _3160 * _3034;
    float _3164 = _3108 * _2887;
    float _3166 = -_3108;
    float _3168 = _3166 + 1.0;
    float _3170 = _2902 * _3164;
    float _3172 = _2902 * _3168;
    float _3174 = _3168;
    float _3176 = _3162;
    float _3178 = _3148;
    float _3180 = _3148;
    if (!_3068)
    {
        _3174 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3182 = _3174;
    float _3184 = _2912 * _3164;
    float _3186 = fma(_2908, _3170, _2896);
    float _3188 = fma(_2910, _3170, _2898);
    float _3190 = _3162 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3192 = fma(_2902, _3184, _2900);
    float _3194 = _3182;
    float _3196 = _3182;
    if (!_3068)
    {
        _3176 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3198 = _3176;
    out.m_85.x = _3190;
    out.m_87.x = _3186;
    out.m_87.y = _3188;
    out.m_87.z = _3192;
    out.m_87.w = _3172;
    bool _3200 = !_3068;
    float _3202 = _3198;
    float _3204 = _3198;
    if (!_3200)
    {
        bool _3206 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3208 = isnan(_2581);
        bool _3210 = _3206 || _3208;
        bool _3212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3214 = _3210 || _3212;
        if (!_3214)
        {
            float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3218 = _2581 + _3216;
            float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3222 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3220;
            float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3228 = 1.0 / _3222;
            float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3246 = _3218 * _3228;
            float _3248 = precise::clamp(_3246, 0.0, 1.0);
            float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3254 = fma(_3248, _3226, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3256 = fma(_3248, _3252, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3258 = fma(_3248, _3232, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3260 = fma(_3248, _3236, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3262 = fma(_3248, _3240, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3264 = fma(_3248, _3244, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3196 = _3258;
            _3146 = _3262;
            _3204 = _3254;
            _3140 = _3260;
            _3132 = _3256;
            _3180 = _3264;
            _3266 = true;
        }
        else
        {
            bool _3268 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3270 = isnan(_2581);
            bool _3272 = _3268 || _3270;
            bool _3274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3276 = _3272 || _3274;
            if (!_3276)
            {
                _3202 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3278 = _3202;
            _3204 = _3278;
            if (!_3276)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3280 = _3194;
            _3196 = _3280;
            if (!_3276)
            {
                _3130 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3282 = _3130;
            _3132 = _3282;
            if (!_3276)
            {
                _3138 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3284 = _3138;
            _3140 = _3284;
            if (!_3276)
            {
                _3144 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3286 = _3144;
            _3146 = _3286;
            if (!_3276)
            {
                _3178 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3288 = _3178;
            bool _3290 = !_3276;
            _3180 = _3288;
            if (!_3290)
            {
                bool _3292 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3294 = isnan(_2581);
                bool _3296 = _3292 || _3294;
                bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3300 = _3296 || _3298;
                if (!_3300)
                {
                    float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3304 = _2581 + _3302;
                    float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3308 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3306;
                    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3314 = 1.0 / _3308;
                    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3322 = _3320 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3332 = _3304 * _3314;
                    float _3334 = precise::clamp(_3332, 0.0, 1.0);
                    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3340 = fma(_3334, _3312, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3342 = fma(_3334, _3338, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3344 = fma(_3334, _3318, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3346 = fma(_3334, _3322, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3348 = fma(_3334, _3326, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3350 = fma(_3334, _3330, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3196 = _3344;
                    _3146 = _3348;
                    _3204 = _3340;
                    _3140 = _3346;
                    _3132 = _3342;
                    _3180 = _3350;
                    _3266 = true;
                }
                else
                {
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3146 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3204 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3140 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3132 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3180 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3266 = false;
    float _3352 = _3196;
    float _3354 = _3146;
    float _3356 = _3204;
    float _3358 = _3140;
    float _3360 = _3132;
    float _3362 = _3180;
    float _3364 = fma(_3080, -0.5, 0.5);
    float _3366 = precise::clamp(_3364, 0.0, 1.0);
    float _3368 = -_3352;
    float _3370 = _3368 + _3354;
    float _3372 = _3136 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3374 = -_3356;
    float _3376 = _3374 + _3358;
    float _3378 = fma(_3366, _3370, _3352);
    out.m_89.x = 0.0;
    float _3380 = -_3360;
    float _3382 = _3380 + _3362;
    float _3384 = fma(_3366, _3376, _3356);
    float _3386 = _3378 * 0.586610972881317138671875;
    out.m_51.x = _3372;
    bool _3388 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3390 = fma(_3366, _3382, _3360);
    float _3392 = fma(_3384, 0.298911988735198974609375, _3386);
    bool _3394 = _2495 > 0.0;
    bool _3396 = isnan(_2495);
    bool _3398 = _3394 || _3396;
    bool _3400 = isnan(0.0);
    bool _3402 = _3398 || _3400;
    float _3404 = fma(_3390, 0.114477999508380889892578125, _3392);
    bool _3406 = _2557 <= 0.0;
    bool _3408 = !_3402;
    bool _3410 = _3406 || _3408;
    float _3412 = -_3404;
    float _3414 = _3384 + _3412;
    float _3416 = -_3404;
    float _3418 = _3378 + _3416;
    float _3420 = -_3404;
    float _3422 = _3390 + _3420;
    float _3424 = fma(_3414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    float _3426 = fma(_3418, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    float _3428 = fma(_3422, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    bool _3430 = !_3388;
    if (!_3430)
    {
        float _3432 = -_2423;
        float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3436 = -_2425;
        float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3440 = -_2427;
        float _3442 = _3440 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3444 = _3434 * _3434;
        float _3446 = fma(_3438, _3438, _3444);
        float _3448 = fma(_3442, _3442, _3446);
        float _3450 = sqrt(_3448);
        float _3452 = rsqrt(_3448);
        float _3454 = -_3450;
        float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3458 = _3456 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3460 = precise::clamp(_3458, 0.0, 1.0);
        float _3462 = _3438 * _3452;
        float _3464 = _3434 * _3452;
        float _3466 = abs(_3460);
        float _3468 = log2(_3466);
        float _3470 = _3442 * _3452;
        float _3472 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3474 = _3080 * _3464;
        float _3476 = -_3464;
        float _3478 = -_3472;
        float _3480 = fma(_3476, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3478);
        float _3482 = fma(_3030, _3462, _3474);
        float _3484 = -_3470;
        float _3486 = fma(_3484, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3480);
        float _3488 = fma(_3082, _3470, _3482);
        float _3490 = precise::clamp(_3488, 0.0, 1.0);
        float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3494 = _3486 + _3492;
        float _3496 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3498 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3500 = precise::clamp(_3498, 0.0, 1.0);
        float _3502 = exp2(_3496);
        float _3504 = _3502 * _3500;
        float _3506 = _3490 * _3504;
        float _3508 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3510 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3512 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3508;
        out.m_89.y = _3510;
        out.m_89.z = _3512;
    }
    out.m_91.x = _3424;
    out.m_91.y = _3426;
    out.m_91.z = _3428;
    if (!_3410)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3514 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3514;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3266 = false;
    bool _334 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3570 = as_type<float>(_124);
        out.gl_Position.z = _3570;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3635 = as_type<float>(_160);
        out.gl_Position.z = _3635;
    }
    if (_150)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _130;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _134 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _188;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    float _222 = in.m_59.x;
    float _224 = in.m_59.y;
    float _226 = in.m_59.z;
    bool _228 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    bool _244 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_216);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = 1.0 / _242;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = _254 * _258;
    float _270 = -_254;
    float _272 = _270 + 1.0;
    float _274 = _220 * _264;
    float _276 = fma(_262, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = _276 * _268;
    float _288 = fma(_280, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = _288 * _268;
    float _294 = _290 * _268;
    float _296 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _298 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _300 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _302 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _296);
    float _304 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _298);
    float _306 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _300);
    float _308 = _302 * _222;
    float _310 = _304 * _224;
    float _312 = _306 * _226;
    bool _314 = !_266;
    float _332;
    if (!_314)
    {
        float _316 = in.m_57.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _324 = _322 * _318;
        float _326 = floor(_324);
        float _328 = -_326;
        float _330 = _324 + _328;
        _332 = _330;
        _334 = true;
    }
    else
    {
        _332 = _172;
    }
    _334 = false;
    float _336 = _332;
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _340 = int(_338);
    float _342 = in.m_57.x;
    float _344 = in.m_57.y;
    float _346 = in.m_61.x;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _350 = int(_348);
    float _352 = in.m_57.z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _356 = float(_340);
    float _358 = 1.0 / _356;
    float _360 = float(uint(_350));
    int _362 = ~_350;
    int _364 = _362 + 1;
    int _366 = ~_350;
    int _368 = _366 + 1;
    float _370 = 1.0 / _360;
    bool _372 = _350 == 0;
    float _374 = _358 * _134;
    float _376 = trunc(_374);
    int _378 = int(_376);
    int _380 = as_type<int>(_370) + (-2);
    float _382 = float(uint(_378));
    float _384 = as_type<float>(_380) * _382;
    float _386 = trunc(_384);
    float _388 = precise::max(_386, 0.0);
    uint _391 = uint(_388);
    float _393 = float(_350);
    int _395 = _364 * int(_391);
    int _397 = _395 + _378;
    float _399 = float(uint(_397));
    float _401 = as_type<float>(_380) * _399;
    float _403 = trunc(_401);
    float _405 = precise::max(_403, 0.0);
    uint _407 = uint(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _411 = _409 != 0;
    bool _413 = !_411;
    float _415 = _413 ? 7.345489978790283203125 : 1.0;
    float _417 = _415 * _342;
    int _419 = int(_391) + int(_407);
    float _421 = floor(_417);
    float _423 = float(_378);
    int _425 = _368 * _419;
    int _427 = _425 + _378;
    bool _429 = _423 >= _393;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan(_393);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = uint(_427) >= uint(_350);
    float _443 = trunc(_439);
    int _445 = int(_443);
    bool _447 = !_441;
    int _449 = _447 ? 0 : (-1);
    float _451 = -_421;
    float _453 = _417 + _451;
    int _455 = ~_419;
    int _457 = _455 + _449;
    int _459 = _457 + 1;
    float _461 = _453 * _393;
    float _463 = _393 * _134;
    int _465 = _350 * _459;
    int _467 = _465 + _378;
    float _469 = _463 * _168;
    float _471 = trunc(_461);
    int _473 = int(_471);
    bool _475 = !_372;
    int _477 = _475 ? _467 : (-1);
    int _479 = ~_445;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _487 = _485 != 0;
    float _489 = trunc(_469);
    int _491 = int(_489);
    int _493 = _477 * _483;
    int _495 = _350 + (-1);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _511 = _509 != 0;
    int _513 = _445 * _495;
    int _515 = _513 + _493;
    bool _517 = !_487;
    int _519 = _517 ? 0 : 1;
    bool _521 = !_503;
    int _523 = _521 ? 0 : 1;
    bool _525 = !_499;
    int _527 = _525 ? 0 : 1;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _531 = _529 != 0;
    int _533 = abs(_523);
    bool _535 = !_507;
    int _537 = _535 ? 0 : 1;
    int _539 = abs(_519);
    int _541 = abs(_527);
    bool _543 = !_531;
    int _545 = _543 ? 0 : 1;
    int _547 = _473 * _539;
    int _549 = _547 + _378;
    int _551 = abs(_537);
    int _553 = _515 * _533;
    int _555 = abs(_545);
    float _557 = in.m_63.y;
    int _559 = _491 * _541;
    int _561 = _559 + _553;
    int _563 = ~_350;
    int _565 = _563 + 1;
    float _567 = in.m_63.z;
    float _569 = float(uint(_549));
    int _571 = _549 * _551;
    int _573 = _571 + _561;
    int _575 = ~_350;
    int _577 = _575 + 1;
    float _579 = in.m_63.w;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _583 = _581 != 0;
    int _585 = _473 * _555;
    int _587 = _585 + _573;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _591 = _589 != 0;
    float _593 = as_type<float>(_380) * _569;
    float _595 = float(uint(_587));
    float _597 = trunc(_593);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = as_type<float>(_380) * _595;
    float _605 = 0.0;
    if (_583)
    {
        float _607 = in.m_57.x;
        _605 = _607;
    }
    float _609 = _605;
    float _611 = 0.0;
    if (_583)
    {
        _611 = _346;
    }
    float _613 = _611;
    float _615 = trunc(_603);
    float _617 = precise::max(_615, 0.0);
    uint _619 = uint(_617);
    out.m_65.y = _557;
    out.m_65.z = _567;
    float _621 = in.m_61.y;
    out.m_65.w = _579;
    int _623 = _577 * int(_619);
    int _625 = _623 + _587;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _629 = float(uint(_625));
    float _631 = in.m_63.x;
    bool _633 = _609 > 0.5;
    bool _635 = _633 && _583;
    float _637 = as_type<float>(_380) * _629;
    float _639 = trunc(_637);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _645;
    float _649 = _613;
    float _651 = _621;
    if (_635)
    {
        float _653 = -_613;
        float _655 = _653 + 1.0;
        _649 = _655;
    }
    float _657 = _649;
    out.m_65.x = _631;
    int _659 = int(_619) + int(_643);
    int _661 = ~_350;
    int _663 = _661 + 1;
    int _665 = _565 * _659;
    int _667 = _665 + _587;
    float _669 = -_621;
    float _671 = _669 + 1.0;
    bool _673 = uint(_667) >= uint(_350);
    bool _675 = !_673;
    int _677 = _675 ? 0 : (-1);
    bool _679 = _344 > 0.5;
    int _681 = ~_659;
    int _683 = _681 + _677;
    int _685 = _683 + 1;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _342 * 2.0;
    if (_511)
    {
        float _693 = _679 ? _671 : _621;
        _651 = _693;
    }
    float _695 = _651;
    int _697 = _350 * _685;
    int _699 = _697 + _587;
    float _701 = 1.0 / _689;
    int _703 = _663 * int(_601);
    int _705 = _703 + _549;
    float _707 = -_354;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[77].x, _707);
    bool _711 = !_372;
    int _713 = _711 ? _699 : (-1);
    float _715 = float(uint(_705));
    int _717 = _713 >> 31;
    float _719 = floor(_691);
    int _721 = _713 & 3;
    bool _723 = _721 != 0;
    float _725 = as_type<float>(_380) * _715;
    int _727 = _717 & 3;
    float _729 = _344 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _731 = _713 + _727;
    float _733 = trunc(_725);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = fma(_729, -2.0, _627);
    float _741 = _647 * _701;
    int _743 = _731 >> 2;
    int _745 = _723 ? 0 : 1;
    int _747 = _743 << 4;
    int _749 = _747 + 368;
    float _751 = _344 + _342;
    bool _753 = _719 > 0.0;
    float _755 = _344 + _352;
    uint _757 = uint(int(uint(_749) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[int(_767)][_769];
    bool _773 = _719 >= 0.0;
    bool _775 = isnan(_719);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = _751 + (-1.0);
    float _785 = _755 + (-1.0);
    float _787 = _755;
    if (!_583)
    {
        _787 = _346;
    }
    float _789 = _787;
    int _791 = int(_601) + int(_737);
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _795 = _713 & 3;
    bool _797 = _795 != 0;
    int _799 = _749 + 8;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[int(_811)][_813];
    int _817 = ~_350;
    int _819 = _817 + 1;
    bool _821 = uint(_795) > 1u;
    int _823 = _819 * _791;
    int _825 = _823 + _549;
    int _827 = ~_745;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    bool _833 = !_797;
    int _835 = _833 ? 0 : 1;
    float _837 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _839 = _789;
    int _841 = _831;
    if (_583)
    {
        _839 = _657;
    }
    float _843 = _839;
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _847 = int(_845);
    bool _849 = uint(_825) >= uint(_350);
    bool _851 = _795 != 3;
    if (!_821)
    {
        int _853 = ~_745;
        int _855 = _853 + 1;
        _841 = _855;
    }
    int _857 = _841;
    bool _859 = !_591;
    int _861 = _859 ? 0 : 1;
    float _863 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _865 = log2(_863);
    bool _867 = _795 != 3;
    bool _869 = uint(_795) >= 2u;
    int _871 = abs(_857);
    int _873 = _869 ? 0 : 1;
    int _875 = ~_871;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    int _881 = ~_873;
    int _883 = _881 + 1;
    int _885 = _883 + 1;
    int _887 = abs(_835);
    int _889 = _885;
    if (_867)
    {
        int _891 = ~_873;
        int _893 = _891 + 1;
        _889 = _893;
    }
    int _895 = _889;
    float _897 = _865 * _134;
    bool _899 = !_849;
    int _901 = _899 ? 0 : (-1);
    int _903 = _879 * as_type<int>(_771);
    bool _905 = !_851;
    int _907 = _905 ? 0 : (-1);
    float _909 = exp2(_897);
    int _911 = abs(_895);
    float _913 = _344 * 2.0;
    int _915 = ~_791;
    int _917 = _915 + _901;
    int _919 = _917 + 1;
    int _921 = abs(_907);
    int _923 = _350 * _919;
    int _925 = _923 + _549;
    int _927 = ~_887;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = floor(_913);
    int _935 = abs(_861);
    int _937 = ~_911;
    int _939 = _937 + 1;
    int _941 = _939 + 1;
    int _943 = _931 * as_type<int>(_763);
    int _945 = _943 + _903;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = _352 * 2.0;
    int _961 = _941 * as_type<int>(_807);
    int _963 = _961 + _945;
    float _965 = float(uint(_847));
    float _967 = -_909;
    float _969 = _967 + 1.0;
    float _971 = floor(_959);
    int _973 = ~_921;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    int _979 = ~_935;
    int _981 = _979 + 1;
    int _983 = _981 + 1;
    bool _985 = !_372;
    int _987 = _985 ? _925 : (-1);
    int _989 = _977 * as_type<int>(_815);
    int _991 = _989 + _963;
    int _993 = abs(_847);
    float _995 = 1.0 / _965;
    bool _997 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _999 = isnan(_336);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    int _1009 = _991 * _983;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1013 = _336 + _1011;
    bool _1015 = !_949;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    int _1021 = _987 * _935;
    int _1023 = _1021 + _1009;
    float _1025 = fma(_741, _1013, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1027 = _971 > 0.0;
    bool _1029 = _971 >= 0.0;
    bool _1031 = isnan(_971);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = float(uint(_1023));
    int _1041 = _1037 ? 0 : 1;
    int _1043 = as_type<int>(_995) + (-2);
    int _1045 = ~_1041;
    int _1047 = _1045 + 1;
    int _1049 = _1047 + 1;
    bool _1051 = _933 > 0.0;
    float _1053 = as_type<float>(_1043) * _1039;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1057 = 1.0 + _1055;
    int _1059 = _1049;
    if (!_1027)
    {
        int _1061 = ~_1041;
        int _1063 = _1061 + 1;
        _1059 = _1063;
    }
    int _1065 = _1059;
    bool _1067 = _933 >= 0.0;
    bool _1069 = isnan(_933);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = 1.0 / _1057;
    bool _1079 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    float _1089 = in.m_48.x;
    float _1091 = in.m_48.y;
    float _1093 = in.m_48.z;
    bool _1095 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1097 = isnan(_336);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = float(uint(_993));
    float _1109 = trunc(_1053);
    float _1111 = precise::max(_1109, 0.0);
    uint _1113 = uint(_1111);
    float _1115 = -_1105;
    float _1117 = _1115 + 1.0;
    float _1119 = _1087 ? _969 : 0.0;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1123 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1125 = isnan(1.0);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1131 = _1127 || _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1135 = ~_847;
    int _1137 = _1135 + 1;
    float _1139 = 1.0 / _1107;
    float _1141 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1121);
    float _1143 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1133);
    int _1145 = abs(_1023);
    float _1147 = _1007 * _1117;
    float _1149 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1151 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1143);
    float _1153 = -_1007;
    float _1155 = _1153 + 1.0;
    int _1157 = _1137 * int(_1113);
    int _1159 = _1157 + _1023;
    float _1161 = -_134;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[76].x, _709);
    if (_1131)
    {
        float _1165 = _1119 * _1077;
        _154 = _1165;
    }
    float _1167 = _154;
    float _1169 = in.m_67.y;
    float _1171 = float(uint(_1159));
    float _1173 = _1025 * _1147;
    int _1175 = abs(_1017);
    float _1177 = float(_1065);
    float _1179 = as_type<float>(_1043) * _1171;
    int _1181 = as_type<int>(_1139) + (-2);
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1173);
    float _1185 = float(uint(_1145));
    float _1187 = trunc(_1179);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    int _1193 = _781 ? 0 : 1;
    float _1195 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1183);
    float _1197 = float(_1175);
    float _1199 = as_type<float>(_1181) * _1185;
    int _1201 = ~_1193;
    int _1203 = _1201 + 1;
    int _1205 = _1203 + 1;
    int _1207 = _1205;
    if (!_753)
    {
        int _1209 = ~_1193;
        int _1211 = _1209 + 1;
        _1207 = _1211;
    }
    int _1213 = _1207;
    float _1215 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1217 = ~_993;
    int _1219 = _1217 + 1;
    float _1221 = trunc(_1199);
    float _1223 = precise::max(_1221, 0.0);
    uint _1225 = uint(_1223);
    float _1227 = _1197 * _1177;
    float _1229 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1231 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1215);
    int _1233 = _1075 ? 0 : 1;
    float _1235 = _1091 + _1169;
    float _1237 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    float _1239 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1231);
    int _1241 = ~_1233;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1249 = _1235 + _1247;
    float _1251 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1237);
    float _1253 = _1239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1255 = _1245;
    if (!_1051)
    {
        int _1257 = ~_1233;
        int _1259 = _1257 + 1;
        _1255 = _1259;
    }
    int _1261 = _1255;
    float _1263 = _1249 * _1249;
    float _1265 = in.m_69.x;
    float _1267 = in.m_69.y;
    float _1269 = in.m_69.z;
    int _1271 = int(_1113) + int(_1191);
    int _1273 = _1219 * int(_1225);
    int _1275 = _1273 + _1145;
    float _1277 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1279 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1253 + _1281;
    int _1285 = ~_847;
    int _1287 = _1285 + 1;
    float _1289 = _1227 * (-2.0);
    float _1291 = float(uint(_1275));
    bool _1293 = !_953;
    int _1295 = _1293 ? 0 : 1;
    bool _1297 = _847 == 0;
    float _1299 = as_type<float>(_1181) * _1291;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1279 + _1301;
    float _1305 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1277);
    int _1307 = abs(_1295);
    float _1309 = trunc(_1299);
    float _1311 = precise::max(_1309, 0.0);
    uint _1313 = uint(_1311);
    float _1315 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1305);
    float _1317 = float(_1213);
    float _1319 = fma(_793, _1289, _793);
    float _1321 = float(_1307);
    float _1323 = fma(_1289, _1265, _1265);
    bool _1325 = _1315 >= 0.0;
    int _1327 = _1287 * _1271;
    int _1329 = _1327 + _1023;
    float _1331 = _1321 * _1317;
    float _1333 = fma(_1283, _1283, _1263);
    bool _1335 = uint(_1329) >= uint(_847);
    float _1337 = _1331 * (-2.0);
    float _1339 = fma(_1303, _1303, _1333);
    int _1341 = int(_1225) + int(_1313);
    float _1343 = fma(_1337, _1267, _1267);
    int _1345 = ~_993;
    int _1347 = _1345 + 1;
    float _1349 = rsqrt(_1339);
    float _1351 = _1265;
    int _1353 = as_type<int>(_1331);
    if (_1325)
    {
        _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1355 = _1351;
    if (_1325)
    {
        out.m_51.x = 0.0;
    }
    int _1357 = _1347 * _1341;
    int _1359 = _1357 + _1145;
    bool _1361 = !_1335;
    int _1363 = _1361 ? 0 : (-1);
    if (_1325)
    {
        float _1365 = _1355 * 5.0;
        _1353 = as_type<int>(_1365);
    }
    int _1367 = _1353;
    float _1369 = fma(_837, _1337, _837);
    bool _1371 = uint(_1359) >= uint(_993);
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1375 = _1023 ^ _847;
    if (_1325)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5391 = as_type<float>(_1367);
        out.gl_Position.z = _5391;
    }
    int _1377 = ~_1271;
    int _1379 = _1377 + _1363;
    int _1381 = _1379 + 1;
    bool _1383 = !_1371;
    int _1385 = _1383 ? 0 : (-1);
    uint _1387 = uint(int(uint(_1375) >> uint(31)));
    int _1389 = _847 * _1381;
    int _1391 = _1389 + _1023;
    float _1393 = _1249 * _1349;
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1397 = ~_1385;
    int _1399 = _1341 + _1397;
    int _1401 = _1399 + 1;
    float _1403 = _1283 * _1349;
    int _1405 = ~int(_1387);
    int _1407 = _1405 + 1;
    float _1409 = -_1393;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1413 = _342 + (-0.5);
    bool _1415 = _847 == 0;
    float _1417 = -_1403;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    int _1421 = _1401 ^ _1407;
    float _1423 = _1411 * _1411;
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1323);
    bool _1427 = !_1415;
    int _1429 = _1427 ? _1391 : (-1);
    float _1431 = _1303 * _1349;
    int _1433 = ~_1407;
    int _1435 = _1433 + _1421;
    int _1437 = _1435 + 1;
    float _1439 = fma(_1419, _1419, _1423);
    float _1441 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1443 = float(_1429);
    float _1445 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1447 = !_1297;
    int _1449 = _1447 ? _1437 : (-1);
    float _1451 = fma(_1441, _843, -0.5);
    float _1453 = fma(_1319, _1167, _1425);
    float _1455 = fma(_1441, _1443, _1163);
    float _1457 = float(_1449);
    float _1459 = fma(_1445, _695, -0.5);
    float _1461 = fma(_1149, _1451, _1455);
    float _1463 = -_1019;
    float _1465 = fma(_1445, _1457, _1463);
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1469 = fma(_1151, _1459, _1465);
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = _1461 + 0.5;
    float _1493 = _1469 + 0.5;
    float _1495 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1497 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1501 = -_1431;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    bool _1505 = !_957;
    int _1507 = _1505 ? 0 : 1;
    out.m_71.x = _1491;
    out.m_71.y = _1493;
    float _1509 = fma(_1503, _1503, _1439);
    int _1511 = abs(_1507);
    out.m_73.x = _1487;
    out.m_73.y = _1489;
    out.m_73.z = _1495;
    out.m_73.w = _1483;
    out.m_75.x = _1481;
    out.m_75.y = _1485;
    out.m_75.z = _1497;
    out.m_75.w = _1499;
    float _1513 = _1431;
    float _1515 = _1393;
    if (_1325)
    {
        return out;
    }
    float _1517 = -_1393;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1521 = _344 + (-0.5);
    float _1523 = -_1403;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1527 = float(_1261);
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1519 + _1529;
    float _1533 = float(_1511);
    float _1535 = -_1431;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1541 = _1525 + _1539;
    float _1543 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1545 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1343);
    float _1547 = _1533 * _1527;
    float _1549 = _352 + _342;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1537 + _1551;
    float _1555 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1543);
    float _1557 = fma(_1369, _1167, _1545);
    float _1559 = _1549 + (-1.0);
    float _1561 = _1547 * (-2.0);
    float _1563 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    float _1565 = _352 + (-0.5);
    float _1567 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1569 = fma(_1561, _1269, _1269);
    float _1571 = _1453 * 0.15915493667125701904296875;
    bool _1573 = _1563 >= 0.0;
    float _1575 = fma(_1567, _1561, _1567);
    float _1577 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1569);
    float _1579 = _1557 * 0.15915493667125701904296875;
    float _1581 = sqrt(_1509);
    float _1583 = fma(_1575, _1167, _1577);
    float _1585 = _1583 * 0.15915493667125701904296875;
    float _1587 = _1571 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1569;
    if (_1573)
    {
        _1591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1593 = _1591;
    int _1595 = as_type<int>(_1593);
    if (_1573)
    {
        out.m_51.x = 0.0;
    }
    if (_1573)
    {
        float _1597 = _1593 * 5.0;
        _1595 = as_type<int>(_1597);
    }
    int _1599 = _1595;
    float _1601 = _1571 * 6.283185482025146484375;
    float _1603 = cos(_1601);
    if (_1573)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5793 = as_type<float>(_1599);
        out.gl_Position.z = _5793;
    }
    float _1605 = _1579 * 6.283185482025146484375;
    float _1607 = sin(_1605);
    float _1609 = _1579 * 6.283185482025146484375;
    float _1611 = cos(_1609);
    float _1613 = _1585 * 6.283185482025146484375;
    float _1615 = sin(_1613);
    if (_1573)
    {
        return out;
    }
    float _1617 = _1585 * 6.283185482025146484375;
    float _1619 = cos(_1617);
    float _1621 = _1603 * _1611;
    float _1623 = _1589 * _1611;
    float _1625 = _1589 * _1607;
    float _1627 = _1349 * _1581;
    float _1629 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1631 = _1603 * _1607;
    float _1633 = fma(_1615, _1621, _1625);
    float _1635 = fma(_1615, _1625, _1621);
    float _1637 = in.m_77.x;
    float _1639 = in.m_77.y;
    float _1641 = in.m_77.z;
    float _1643 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1645 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1647 = _1611 * _1619;
    float _1649 = -_1253;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1653 = _1607 * _1619;
    float _1655 = -_1235;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1659 = _1603 * _1619;
    float _1661 = _1651 * _1651;
    float _1663 = _1589 * _1619;
    float _1665 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1629);
    float _1667 = -_1631;
    float _1669 = fma(_1615, _1623, _1667);
    float _1671 = -_1623;
    float _1673 = fma(_1615, _1631, _1671);
    float _1675 = -_1279;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1679 = fma(_1657, _1657, _1661);
    float _1681 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1665);
    float _1683 = _308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1685 = fma(_1677, _1677, _1679);
    float _1687 = _1681 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1689 = _1627 * _1643;
    float _1691 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1645);
    float _1693 = rsqrt(_1685);
    float _1695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1639);
    float _1697 = -_1687;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1701 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1703 = _1627 * _1683;
    float _1705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1637);
    float _1707 = _1695 * _1689;
    float _1709 = fma(_1699, _1699, _1661);
    float _1711 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1713 = _1705 * _1703;
    float _1715 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1691);
    float _1717 = _1627 * _1711;
    float _1719 = fma(_1677, _1677, _1709);
    float _1721 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1723 = _1651 * _1693;
    float _1725 = _1657 * _1693;
    float _1727 = _1677 * _1693;
    float _1729 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1701);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1733 = _1723 * _1731;
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1735;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1741 = _1727 * _1739;
    float _1743 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1729);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1747 = -_1733;
    float _1749 = fma(_1727, _1745, _1747);
    float _1751 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1755 = _1725 * _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1759 = -_1741;
    float _1761 = fma(_1725, _1757, _1759);
    float _1763 = _1749 * _1749;
    float _1765 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1769 = -_1755;
    float _1771 = fma(_1723, _1767, _1769);
    float _1773 = sqrt(_1719);
    float _1775 = fma(_1761, _1761, _1763);
    float _1777 = -_1765;
    float _1779 = _1751 + _1777;
    float _1781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1641);
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1721);
    float _1785 = fma(_1771, _1771, _1775);
    float _1787 = _1781 * _1717;
    float _1789 = 1.0 / _1737;
    float _1791 = abs(_1779);
    float _1793 = precise::max(_1791, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    bool _1795 = _1765 >= _1751;
    bool _1797 = isnan(_1765);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan(_1751);
    bool _1803 = _1799 || _1801;
    float _1805 = -_1707;
    float _1807 = _1615 * _1805;
    float _1809 = precise::min(_1793, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1811 = _1659 * _1707;
    float _1813 = _1663 * _1707;
    float _1815 = rsqrt(_1785);
    float _1817 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1783);
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1821 = _1809 + _1819;
    float _1823 = fma(_1647, _1713, _1807);
    float _1825 = abs(_1773);
    float _1827 = precise::max(0.0, _1825);
    float _1829 = fma(_1633, _1713, _1811);
    float _1831 = fma(_1669, _1713, _1813);
    bool _1833 = !_1803;
    float _1835 = _1833 ? 1.0 : (-1.0);
    float _1837 = _1821 * _1789;
    float _1839 = precise::min(_1827, 40.0);
    float _1841 = _172 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1843 = rsqrt(_1817);
    float _1845 = _1835 * _1837;
    float _1847 = fma(_1653, _1787, _1823);
    float _1849 = fma(_1839, -0.02500000037252902984619140625, 1.0);
    float _1851 = fma(_1673, _1787, _1829);
    float _1853 = _1771 * _1815;
    float _1855 = _1761 * _1815;
    float _1857 = _1749 * _1815;
    float _1859 = _1841 * _1845;
    float _1861 = _1723 * _1853;
    float _1863 = fma(_1635, _1787, _1831);
    float _1865 = _1727 * _1857;
    float _1867 = _1725 * _1855;
    float _1869 = -_1861;
    float _1871 = fma(_1727, _1855, _1869);
    float _1873 = -_1865;
    float _1875 = fma(_1725, _1853, _1873);
    float _1877 = -_1867;
    float _1879 = fma(_1723, _1857, _1877);
    float _1881 = _1871 * _1851;
    float _1883 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1885 = _1875 * _1851;
    float _1887 = _1879 * _1851;
    float _1889 = fma(_1857, _1847, _1881);
    float _1891 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1893 = fma(_1855, _1847, _1885);
    float _1895 = fma(_1853, _1847, _1887);
    float _1897 = fma(_1725, _1863, _1889);
    float _1899 = _1883 * _1883;
    float _1901 = fma(_1723, _1863, _1893);
    float _1903 = fma(_1727, _1863, _1895);
    float _1905 = _1235 + _1897;
    float _1907 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1909 = _1253 + _1901;
    float _1911 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = fma(_1891, _1891, _1899);
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1921 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1907);
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1925 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1927 = fma(_1911, _1911, _1917);
    float _1929 = _1279 + _1903;
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1919);
    float _1933 = _1859 * 0.15915493667125701904296875;
    float _1935 = rsqrt(_1927);
    float _1937 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1921);
    float _1939 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1925);
    float _1941 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1943 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1923);
    float _1945 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1947 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1949 = _1933 * 6.283185482025146484375;
    float _1951 = cos(_1949);
    float _1953 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1955 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1957 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1959 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1961 = -_1945;
    float _1963 = _1961 + _1953;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1967 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1957);
    float _1969 = _1933 * 6.283185482025146484375;
    float _1971 = sin(_1969);
    float _1973 = fma(_1849, _1963, _1945);
    float _1975 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1959);
    float _1977 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1965);
    float _1979 = _1911 * _1935;
    float _1981 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1967);
    float _1983 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1977);
    float _1985 = _1891 * _1935;
    float _1987 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1975);
    float _1989 = _1883 * _1935;
    float _1991 = -_1951;
    float _1993 = _1991 + 1.0;
    float _1995 = _1979 * _1979;
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2001 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2003 = _1989 * _1993;
    float _2005 = _1985 * _1971;
    float _2007 = _1989 * _1971;
    float _2009 = _1979 * _1971;
    float _2011 = fma(_1993, _1995, _1951);
    float _2013 = _1985 * _1993;
    float _2015 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2017 = fma(_1979, _2003, _2005);
    float _2019 = -_1687;
    float _2021 = _2019 + _2001;
    float _2023 = -_2009;
    float _2025 = fma(_1989, _2013, _2023);
    float _2027 = -_2007;
    float _2029 = fma(_1979, _2013, _2027);
    float _2031 = -_1253;
    float _2033 = _2031 + _2015;
    float _2035 = _2017 * _2021;
    float _2037 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2039 = fma(_1985, _2013, _1951);
    float _2041 = _2025 * _2021;
    float _2043 = fma(_2029, _2033, _2035);
    float _2045 = -_1279;
    float _2047 = _2045 + _2037;
    float _2049 = fma(_172, _1999, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2051 = fma(_2039, _2033, _2041);
    float _2053 = fma(_1979, _2013, _2007);
    float _2055 = fma(_2011, _2047, _2043);
    float _2057 = -_2005;
    float _2059 = fma(_1979, _2003, _2057);
    float _2061 = fma(_2053, _2047, _2051);
    float _2063 = fma(_2055, _2049, _1279);
    float _2065 = fma(_2061, _2049, _1253);
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2069 = _2063 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2073 = _2065 + _2071;
    float _2075 = _2069 * _2069;
    float _2077 = fma(_2073, _2073, _2075);
    float _2079 = sqrt(_2077);
    bool _2081 = _2079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2085 = _2079 + _2083;
    float _2087 = _2075;
    float _2089 = _2077;
    float _2091 = _1951;
    float _2093 = _1687;
    float _2095 = _2065;
    float _2097 = _2063;
    if (_2081)
    {
        float _2099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2099;
    }
    float _2101 = _2087;
    if (_2081)
    {
        float _2103 = rsqrt(_2077);
        _2089 = _2103;
    }
    float _2105 = _2089;
    float _2107 = _2101;
    if (_2081)
    {
        float _2109 = _2085 * _2101;
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = fma(_1989, _2003, _1951);
    float _2115 = fma(_1989, _2013, _2009);
    if (_2081)
    {
        float _2117 = _2111 * 0.15915493667125701904296875;
        _2091 = _2117;
    }
    float _2119 = _2091;
    float _2121 = _2113 * _2021;
    float _2123 = _2009;
    if (_2081)
    {
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _2123 = _2127;
    }
    float _2129 = _2123;
    float _2131 = fma(_2115, _2033, _2121);
    float _2133 = fma(_2059, _2047, _2131);
    float _2135 = _1687 + _2133;
    float _2137 = _2135;
    if (_2081)
    {
        float _2139 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2093 = _2139;
    }
    float _2141 = _2093;
    float _2143 = _2129;
    if (_2081)
    {
        float _2145 = fma(_2129, _2141, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2143 = _2145;
    }
    float _2147 = _2143;
    float _2149 = _2147;
    if (_2081)
    {
        float _2151 = _2105 * _2147;
        _2149 = _2151;
    }
    float _2153 = _2149;
    if (_2081)
    {
        float _2155 = fma(_2073, _2153, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2095 = _2155;
    }
    float _2157 = _2095;
    float _2159 = _2157;
    if (_2081)
    {
        float _2161 = fma(_2069, _2153, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2097 = _2161;
    }
    float _2163 = _2097;
    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2167 = _2157 + _2165;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2171 = _2163 + _2169;
    float _2173 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2175 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6755 = float2(_2173, _2175);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6755, float2(0.0), isnan(_6755)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6755, float2(0.0), isnan(_6755)), level(0.0)).x;
    float _2179 = _2119;
    float _2181 = _2167;
    float _2183 = _2163;
    if (_2081)
    {
        float _2185 = _2119 * 6.283185482025146484375;
        float _2187 = cos(_2185);
        _2179 = _2187;
    }
    float _2189 = _2179;
    if (_2081)
    {
        float _2191 = _2189 + (-1.0);
        _2181 = _2191;
    }
    float _2193 = _2181;
    float _2195 = _2193;
    if (_2081)
    {
        float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2197;
    }
    float _2199 = _2195;
    if (_2081)
    {
        float _2201 = fma(_2135, _2189, _2199);
        _2137 = _2201;
    }
    float _2203 = _2137;
    float _2205 = fma(_2177, 100.0, _1235);
    float _2207 = -_1235;
    float _2209 = _2207 + _2203;
    float _2211 = fma(_2177, 100.0, _2203);
    float _2213 = -_1393;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    float _2217 = _2209 * _2209;
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2223 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    float _2225 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2221);
    float _2227 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2223);
    float _2229 = -_1253;
    float _2231 = _2229 + _2157;
    float _2233 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2225);
    float _2235 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2237 = -_1279;
    float _2239 = _2237 + _2163;
    float _2241 = fma(_2231, _2231, _2217);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2245 = 1.0 / _2235;
    float _2247 = fma(_2239, _2239, _2241);
    float _2249 = _2243 + _2235;
    float _2251 = sqrt(_2247);
    bool _2253 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.5);
    bool _2261 = _2257 || _2259;
    float _2263 = _2249 * _2245;
    float _2265 = _2263 * 0.5;
    bool _2267 = _2251 > 0.0;
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2271 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2269);
    bool _2273 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan(0.5);
    bool _2281 = _2277 || _2279;
    float _2283 = 1.0 / _2271;
    bool _2285 = !_2267;
    float _2287 = _2211;
    float _2289 = _2177;
    if (!_2285)
    {
        float _2291 = _188 * _188;
        float _2293 = rsqrt(_2247);
        float _2295 = fma(_186, _186, _2291);
        float _2297 = fma(_190, _190, _2295);
        float _2299 = sqrt(_2297);
        float _2301 = _2231 * _2293;
        float _2303 = _2209 * _2293;
        bool _2305 = _2299 > 0.0;
        float _2307 = _2239 * _2293;
        bool _2309 = !_2305;
        _2289 = _2297;
        if (!_2309)
        {
            float _2311 = rsqrt(_2297);
            float _2313 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2315 = _188 * _2311;
            float _2317 = _186 * _2311;
            float _2319 = _190 * _2311;
            float _2321 = _2303 * _2315;
            float _2323 = fma(_2301, _2317, _2321);
            float _2325 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2327 = fma(_2307, _2319, _2323);
            float _2329 = _2327 * _2325;
            float _2331 = fma(_186, _2329, _2157);
            float _2333 = fma(_188, _2329, _2211);
            float _2335 = fma(_190, _2329, _2163);
            _2183 = _2335;
            _2287 = _2333;
            _2159 = _2331;
        }
    }
    float _2337 = _2183;
    float _2339 = _2287;
    float _2341 = _2159;
    float _2343 = _2289;
    float _2345 = -_1431;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2337);
    float _2349 = -_1393;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2339);
    float _2353 = -_1403;
    float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2341);
    float _2357 = _2351;
    float _2359 = _2355;
    float _2361 = _2347;
    float _2363 = _2343;
    if (_2281)
    {
        _1513 = 1.0;
    }
    float _2365 = _1513;
    float _2367 = _2365;
    if (_2261)
    {
        _1515 = _2347;
    }
    float _2369 = _1515;
    float _2371 = _2369;
    if (!_2261)
    {
        float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2375 = _2215 + _2373;
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2379 = -_1279;
        float _2381 = _2379 + _2337;
        float _2383 = -_2205;
        float _2385 = _2383 + _2339;
        float _2387 = _2375 * _2375;
        float _2389 = -_1253;
        float _2391 = _2389 + _2341;
        float _2393 = fma(_1541, _1541, _2387);
        float _2395 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2397 = fma(_1553, _1553, _2393);
        float _2399 = 1.0 / _1627;
        float _2401 = sqrt(_2397);
        float _2403 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2405 = precise::min(_2401, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2407 = _2405 * _2377;
        float _2409 = _2407 * _2399;
        float _2411 = _2403 * _2409;
        float _2413 = _2381 * _2409;
        float _2415 = fma(_2385, _2411, _2215);
        float _2417 = fma(_2391, _2411, _1525);
        float _2419 = fma(_2403, _2413, _1537);
        _194 = _2411;
        _2357 = _2415;
        _2359 = _2417;
        _2371 = _2419;
        _2361 = _2401;
    }
    float _2421 = _194;
    float _2423 = _2357;
    float _2425 = _2359;
    float _2427 = _2371;
    float _2429 = _2361;
    float _2431 = _2421;
    float _2433 = _2429;
    if (_2281)
    {
        _2363 = 1.0;
    }
    float _2435 = _2363;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2439 = _2283 * _2437;
    float _2441 = _2435;
    if (!_2281)
    {
        float _2443 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2445 = _2443 * 0.15915493667125701904296875;
        float _2447 = _2445 * 6.283185482025146484375;
        float _2449 = cos(_2447);
        float _2451 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2453 = _2451 * 0.15915493667125701904296875;
        float _2455 = _2445 * 6.283185482025146484375;
        float _2457 = sin(_2455);
        float _2459 = 1.0 / _2449;
        float _2461 = _2453 * 6.283185482025146484375;
        float _2463 = cos(_2461);
        float _2465 = _2457 * _2459;
        float _2467 = _2453 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2473 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2471;
        float _2475 = _2463 * _2465;
        float _2477 = 1.0 / _2473;
        float _2479 = 1.0 / _2475;
        float _2481 = _2469 * _2479;
        float _2483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2485 = fma(_2439, _2481, _2483);
        float _2487 = _2485 * _2477;
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        _2431 = _2453;
        _2433 = _2465;
        _2367 = _2489;
    }
    float _2491 = _2431;
    float _2493 = _2433;
    float _2495 = _2367;
    float _2497 = _2493;
    float _2499 = _2491;
    if (!_2281)
    {
        float _2501 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2503 = _2501 * 0.15915493667125701904296875;
        float _2505 = _2503 * 6.283185482025146484375;
        float _2507 = cos(_2505);
        float _2509 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2511 = _2509 * 0.15915493667125701904296875;
        float _2513 = _2503 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = 1.0 / _2507;
        float _2519 = _2511 * 6.283185482025146484375;
        float _2521 = cos(_2519);
        float _2523 = _2515 * _2517;
        float _2525 = _2511 * 6.283185482025146484375;
        float _2527 = sin(_2525);
        float _2529 = _2521 * _2523;
        float _2531 = 1.0 / _2529;
        float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2535 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2533;
        float _2537 = 1.0 / _2535;
        float _2539 = _2527 * _2531;
        float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2543 = fma(_2439, _2539, _2541);
        float _2545 = _2543 * _2537;
        float _2547 = precise::clamp(_2545, 0.0, 1.0);
        float _2549 = -_2547;
        float _2551 = _2549 + 1.0;
        _2497 = _2529;
        _2499 = _2507;
        _2441 = _2551;
    }
    float _2553 = _2497;
    float _2555 = _2499;
    float _2557 = _2441;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2561 = _2423 + _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2565 = _2425 + _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2427 + _2567;
    float _2571 = _2561 * _2561;
    float _2573 = fma(_2565, _2565, _2571);
    float _2575 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2577 = fma(_2569, _2569, _2573);
    float _2579 = rsqrt(_2577);
    float _2581 = sqrt(_2577);
    float _2583 = _2579 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2585 = _2565 * _2583;
    float _2587 = _2569 * _2583;
    float _2589 = _2585 * _2585;
    float _2591 = _2587 * _2587;
    float _2593 = _2589 + _2591;
    float _2595 = sqrt(_2593);
    bool _2597 = _2595 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2601 = _2595 + _2599;
    float _2603 = _2569;
    float _2605 = _2593;
    float _2607 = _2601;
    float _2609 = _2553;
    float _2611 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2613 = _2583;
    if (_2597)
    {
        float _2615 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2603 = _2615;
    }
    float _2617 = _2603;
    if (_2597)
    {
        float _2619 = rsqrt(_2593);
        _2605 = _2619;
    }
    float _2621 = _2605;
    float _2623 = _2621;
    if (_2597)
    {
        float _2625 = _2601 * _2617;
        _2607 = _2625;
    }
    float _2627 = _2607;
    if (_2597)
    {
        float _2629 = _2627 * 0.15915493667125701904296875;
        _2609 = _2629;
    }
    float _2631 = _2609;
    float _2633 = _2617;
    float _2635 = _2631;
    if (_2597)
    {
        float _2637 = _2631 * 6.283185482025146484375;
        float _2639 = sin(_2637);
        _2633 = _2639;
    }
    float _2641 = _2633;
    float _2643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2645 = precise::max(0.0, _2643);
    float _2647 = _2555;
    float _2649 = _2645;
    if (_2597)
    {
        float _2651 = _2631 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        _2647 = _2653;
    }
    float _2655 = _2647;
    float _2657 = -_2583;
    float _2659 = -_2645;
    float _2661 = fma(_2561, _2657, _2659);
    float _2663 = _2661;
    if (_2597)
    {
        float _2665 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2649 = _2665;
    }
    float _2667 = _2649;
    float _2669 = _2667;
    if (!_2597)
    {
        _2635 = _2585;
    }
    float _2671 = _2635;
    float _2673 = _2641;
    float _2675 = _2671;
    if (_2597)
    {
        float _2677 = fma(_2641, _2667, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2673 = _2677;
    }
    float _2679 = _2673;
    float _2681 = _2679;
    float _2683 = _2655;
    if (_2597)
    {
        float _2685 = _2655 + (-1.0);
        _2669 = _2685;
    }
    float _2687 = _2669;
    if (_2597)
    {
        float _2689 = _2621 * _2679;
        _2611 = _2689;
    }
    float _2691 = _2611;
    if (!_2597)
    {
        _2681 = _2587;
    }
    float _2693 = _2681;
    float _2695 = _2693;
    if (_2597)
    {
        float _2697 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2613 = _2697;
    }
    float _2699 = _2613;
    if (_2597)
    {
        float _2701 = _2585 * _2691;
        _2675 = _2701;
    }
    float _2703 = _2675;
    if (!_2597)
    {
        _2623 = _2589;
    }
    float _2705 = _2623;
    float _2707 = _2705;
    if (_2597)
    {
        float _2709 = _2587 * _2691;
        _2695 = _2709;
    }
    float _2711 = _2695;
    if (_2597)
    {
        float _2713 = fma(_2661, _2655, _2699);
        _2663 = _2713;
    }
    float _2715 = _2663;
    if (_2597)
    {
        float _2717 = _2703 * _2703;
        _2707 = _2717;
    }
    float _2719 = _2707;
    if (!_2597)
    {
        _2683 = _2591;
    }
    float _2721 = _2683;
    float _2723 = _2721;
    if (_2597)
    {
        float _2725 = _2711 * _2711;
        _2723 = _2725;
    }
    float _2727 = _2723;
    float _2729 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2731 = fma(_2715, _2715, _2719);
    float _2733 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2735 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2729);
    float _2737 = _2731 + _2727;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2741 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2739);
    float _2743 = precise::clamp(_2741, 0.0, 1.0);
    float _2745 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2735);
    float _2747 = floor(_2575);
    float _2749 = -_2743;
    float _2751 = _2749 + 1.0;
    float _2753 = _2745 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2755 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2757 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2759 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2761 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2763 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2733);
    float _2765 = rsqrt(_2737);
    float _2767 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2757);
    float _2769 = -_2761;
    float _2771 = fma(_2769, _2755, 1.0);
    float _2773 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2775 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2763);
    float _2777 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2767);
    float _2779 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2773);
    float _2781 = abs(_2751);
    float _2783 = log2(_2781);
    float _2785 = _2777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2787 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2789 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2779);
    float _2791 = -_2747;
    float _2793 = _2575 + _2791;
    float _2795 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2797 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2799 = _2789 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2801 = _2765 * _2703;
    float _2803 = _2765 * _2715;
    float _2805 = _2765 * _2711;
    float _2807 = floor(_2759);
    float _2809 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2811 = -_2809;
    float _2813 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2811);
    float _2815 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2817 = log2(_2771);
    float _2819 = -_2805;
    float _2821 = fma(_2819, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2813);
    float _2823 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2795);
    float _2825 = fma(_2821, -0.5, 0.5);
    float _2827 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2823);
    float _2829 = fma(_2821, 0.5, 0.5);
    float _2831 = exp2(_2815);
    float _2833 = -_2807;
    float _2835 = _2759 + _2833;
    float _2837 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2827);
    float _2839 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2841 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2797);
    float _2843 = fma(_2829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2845 = 1.0 / _2837;
    float _2847 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2839);
    float _2849 = _2803 + 1.0;
    float _2851 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2841);
    float _2853 = fma(_2829, _2843, -0.212114393711090087890625);
    float _2855 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2847);
    float _2857 = _2817 * 0.693147182464599609375;
    float _2859 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2851);
    float _2861 = sqrt(_2825);
    float _2863 = -_2803;
    float _2865 = fma(_2831, _2849, _2863);
    float _2867 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2855);
    float _2869 = fma(_2829, _2853, 1.570728778839111328125);
    float2 _7830 = float2(_2793, _2835);
    float _2871 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7830, float2(0.0), isnan(_7830)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7830, float2(0.0), isnan(_7830)), level(0.0)).x;
    float _2873 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2875 = _2859 * _2845;
    float _2877 = _2867 * _2845;
    float _2879 = fma(_2865, 0.5, 0.5);
    float _2881 = fma(_2875, 0.5, 0.5);
    float _2883 = fma(_2877, -0.5, 0.5);
    float _2885 = _2861 * 0.636619746685028076171875;
    float3 _7858 = float3(_2881, _2883, _2873);
    float _2887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7858, float3(0.0), isnan(_7858)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7858, float3(0.0), isnan(_7858)), level(0.0)).x;
    float _2889 = -_2869;
    float _2891 = fma(_2885, _2889, 1.0);
    float3 _7874 = float3(_2881, _2883, _2873);
    float4 _2894 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7874, float3(0.0), isnan(_7874)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7874, float3(0.0), isnan(_7874)), level(0.0)).xyzw;
    float _2896 = _2894.x;
    float _2898 = _2894.y;
    float _2900 = _2894.z;
    float _2902 = _2894.w;
    float2 _7890 = float2(_2891, _2879);
    float3 _2906 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7890, float2(0.0), isnan(_7890)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7890, float2(0.0), isnan(_7890)), level(0.0)).xyz;
    float _2908 = _2906.x;
    float _2910 = _2906.y;
    float _2912 = _2906.z;
    float _2914 = in.m_79.x;
    float _2916 = in.m_79.y;
    float _2918 = in.m_79.z;
    bool _2920 = _1639 != 0.0;
    bool _2922 = isnan(_1639);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.0);
    bool _2928 = _2924 || _2926;
    float _2930 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2932 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1481;
    out.m_75.y = _1485;
    out.m_75.z = _1497;
    out.m_75.w = _1499;
    bool _2934 = _1637 == 0.0;
    bool _2936 = !_2928;
    bool _2938 = _2934 && _2936;
    float _2940 = _1659 * _1875;
    float _2942 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2932);
    float _2944 = _1659 * _1879;
    bool _2946 = _1641 == 0.0;
    bool _2948 = _2946 && _2938;
    float _2950 = exp2(_2930);
    out.m_73.x = _1487;
    out.m_73.y = _1489;
    out.m_73.z = _1495;
    out.m_73.w = _1483;
    float _2952 = -_1615;
    float _2954 = fma(_2952, _1855, _2940);
    float _2956 = -_1615;
    float _2958 = fma(_2956, _1853, _2944);
    float _2960 = fma(_1663, _1723, _2954);
    float _2962 = _2916;
    float _2964 = _2918;
    float _2966 = _2914;
    if (!_2948)
    {
        float _2968 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2916);
        _2962 = _2968;
    }
    float _2970 = _2962;
    if (!_2948)
    {
        float _2972 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2918);
        _2964 = _2972;
    }
    float _2974 = _2964;
    float _2976 = _1659 * _1871;
    float _2978 = _1633 * _1875;
    if (!_2948)
    {
        float _2980 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2914);
        _2966 = _2980;
    }
    float _2982 = _2966;
    float _2984 = _1633 * _1871;
    float _2986 = -_1615;
    float _2988 = fma(_2986, _1857, _2976);
    float _2990 = fma(_1647, _1855, _2978);
    float _2992 = _1633 * _1879;
    float _2994 = _1673 * _1875;
    float _2996 = fma(_1663, _1725, _2988);
    float _2998 = fma(_1669, _1723, _2990);
    float _3000 = fma(_1647, _1857, _2984);
    float _3002 = abs(_2439);
    float _3004 = log2(_3002);
    float _3006 = fma(_1647, _1853, _2992);
    float _3008 = fma(_1663, _1727, _2958);
    float _3010 = fma(_1653, _1855, _2994);
    float _3012 = _2960 * _2970;
    float _3014 = fma(_1669, _1725, _3000);
    float _3016 = fma(_1669, _1727, _3006);
    float _3018 = _2996 * _2970;
    float _3020 = _3008 * _2970;
    float _3022 = fma(_1635, _1723, _3010);
    float _3024 = fma(_2998, _2982, _3012);
    float _3026 = fma(_3014, _2982, _3018);
    float _3028 = fma(_3016, _2982, _3020);
    float _3030 = fma(_3022, _2974, _3024);
    float _3032 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3034 = in.m_67.x;
    bool _3036 = _2439 <= 8000.0;
    bool _3038 = isnan(_2439);
    bool _3040 = _3036 || _3038;
    bool _3042 = isnan(8000.0);
    bool _3044 = _3040 || _3042;
    float _3046 = float(_3044);
    float _3048 = _2837 * 0.5;
    float _3050 = -_2950;
    float _3052 = _3050 + 1.0;
    float _3054 = _1673 * _1871;
    float _3056 = exp2(_3032);
    float _3058 = _1673 * _1879;
    bool _3060 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3062 = isnan(_2581);
    bool _3064 = _3060 || _3062;
    bool _3066 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3068 = _3064 || _3066;
    float _3070 = fma(_1653, _1857, _3054);
    float _3072 = fma(_1653, _1853, _3058);
    float _3074 = fma(_1635, _1725, _3070);
    float _3076 = fma(_1635, _1727, _3072);
    float _3078 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2942);
    float _3080 = fma(_3074, _2974, _3026);
    float _3082 = fma(_3076, _2974, _3028);
    float _3084 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3078);
    float _3086 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3088 = precise::clamp(_3086, 0.0, 1.0);
    float _3090 = _2859 + _2837;
    out.m_81.x = _3030;
    out.m_81.y = _3080;
    out.m_81.z = _3082;
    float _3092 = fma(_3088, -2.0, 3.0);
    float _3094 = _3088 * _3088;
    out.gl_Position.x = _2859;
    out.gl_Position.y = _2867;
    out.gl_Position.z = _3084;
    out.gl_Position.w = _2837;
    float _3096 = _3090 * 0.5;
    float _3098 = _3094 * _3092;
    float _3100 = -_3098;
    float _3102 = _3100 + 1.0;
    float _3104 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3098);
    float _3106 = fma(_2867, -0.5, _3048);
    float _3108 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3110 = _3084 + _2837;
    float _3112 = _3046 * _3104;
    float _3114 = _3110 * 0.5;
    float _3116 = _3112 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3096;
    out.m_83.y = _3106;
    out.m_83.z = _3114;
    out.m_83.w = _2837;
    float _3118 = _2495 * _2557;
    float _3120 = _2837;
    float _3122 = _3114;
    float _3124 = _3106;
    float _3126 = _3118;
    if (!_3068)
    {
        _3120 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3128 = _3120;
    float _3130 = _3128;
    float _3132 = _3128;
    if (!_3068)
    {
        _3122 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3134 = _3122;
    float _3136 = _3118 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3138 = _3134;
    float _3140 = _3134;
    if (!_3068)
    {
        _3124 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3142 = _3124;
    float _3144 = _3142;
    float _3146 = _3142;
    if (!_3068)
    {
        _3126 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3148 = _3126;
    float _3150 = -_2871;
    float _3152 = _3150 + 1.0;
    float _3154 = _3152 * _3116;
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3156;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3162 = _3160 * _3034;
    float _3164 = _3108 * _2887;
    float _3166 = -_3108;
    float _3168 = _3166 + 1.0;
    float _3170 = _2902 * _3164;
    float _3172 = _2902 * _3168;
    float _3174 = _3168;
    float _3176 = _3162;
    float _3178 = _3148;
    float _3180 = _3148;
    if (!_3068)
    {
        _3174 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3182 = _3174;
    float _3184 = _2912 * _3164;
    float _3186 = fma(_2908, _3170, _2896);
    float _3188 = fma(_2910, _3170, _2898);
    float _3190 = _3162 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3192 = fma(_2902, _3184, _2900);
    float _3194 = _3182;
    float _3196 = _3182;
    if (!_3068)
    {
        _3176 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3198 = _3176;
    out.m_85.x = _3190;
    out.m_87.x = _3186;
    out.m_87.y = _3188;
    out.m_87.z = _3192;
    out.m_87.w = _3172;
    bool _3200 = !_3068;
    float _3202 = _3198;
    float _3204 = _3198;
    if (!_3200)
    {
        bool _3206 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3208 = isnan(_2581);
        bool _3210 = _3206 || _3208;
        bool _3212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3214 = _3210 || _3212;
        if (!_3214)
        {
            float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3218 = _2581 + _3216;
            float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3222 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3220;
            float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3228 = 1.0 / _3222;
            float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3246 = _3218 * _3228;
            float _3248 = precise::clamp(_3246, 0.0, 1.0);
            float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3254 = fma(_3248, _3226, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3256 = fma(_3248, _3252, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3258 = fma(_3248, _3232, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3260 = fma(_3248, _3236, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3262 = fma(_3248, _3240, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3264 = fma(_3248, _3244, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3196 = _3258;
            _3146 = _3262;
            _3204 = _3254;
            _3140 = _3260;
            _3132 = _3256;
            _3180 = _3264;
            _3266 = true;
        }
        else
        {
            bool _3268 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3270 = isnan(_2581);
            bool _3272 = _3268 || _3270;
            bool _3274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3276 = _3272 || _3274;
            if (!_3276)
            {
                _3202 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3278 = _3202;
            _3204 = _3278;
            if (!_3276)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3280 = _3194;
            _3196 = _3280;
            if (!_3276)
            {
                _3130 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3282 = _3130;
            _3132 = _3282;
            if (!_3276)
            {
                _3138 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3284 = _3138;
            _3140 = _3284;
            if (!_3276)
            {
                _3144 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3286 = _3144;
            _3146 = _3286;
            if (!_3276)
            {
                _3178 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3288 = _3178;
            bool _3290 = !_3276;
            _3180 = _3288;
            if (!_3290)
            {
                bool _3292 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3294 = isnan(_2581);
                bool _3296 = _3292 || _3294;
                bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3300 = _3296 || _3298;
                if (!_3300)
                {
                    float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3304 = _2581 + _3302;
                    float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3308 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3306;
                    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3314 = 1.0 / _3308;
                    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3322 = _3320 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3332 = _3304 * _3314;
                    float _3334 = precise::clamp(_3332, 0.0, 1.0);
                    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3340 = fma(_3334, _3312, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3342 = fma(_3334, _3338, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3344 = fma(_3334, _3318, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3346 = fma(_3334, _3322, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3348 = fma(_3334, _3326, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3350 = fma(_3334, _3330, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3196 = _3344;
                    _3146 = _3348;
                    _3204 = _3340;
                    _3140 = _3346;
                    _3132 = _3342;
                    _3180 = _3350;
                    _3266 = true;
                }
                else
                {
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3146 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3204 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3140 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3132 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3180 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3266 = false;
    float _3352 = _3196;
    float _3354 = _3146;
    float _3356 = _3204;
    float _3358 = _3140;
    float _3360 = _3132;
    float _3362 = _3180;
    float _3364 = fma(_3080, -0.5, 0.5);
    float _3366 = precise::clamp(_3364, 0.0, 1.0);
    float _3368 = -_3352;
    float _3370 = _3368 + _3354;
    float _3372 = _3136 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3374 = -_3356;
    float _3376 = _3374 + _3358;
    float _3378 = fma(_3366, _3370, _3352);
    out.m_89.x = 0.0;
    float _3380 = -_3360;
    float _3382 = _3380 + _3362;
    float _3384 = fma(_3366, _3376, _3356);
    float _3386 = _3378 * 0.586610972881317138671875;
    out.m_51.x = _3372;
    bool _3388 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3390 = fma(_3366, _3382, _3360);
    float _3392 = fma(_3384, 0.298911988735198974609375, _3386);
    bool _3394 = _2495 > 0.0;
    bool _3396 = isnan(_2495);
    bool _3398 = _3394 || _3396;
    bool _3400 = isnan(0.0);
    bool _3402 = _3398 || _3400;
    float _3404 = fma(_3390, 0.114477999508380889892578125, _3392);
    bool _3406 = _2557 <= 0.0;
    bool _3408 = !_3402;
    bool _3410 = _3406 || _3408;
    float _3412 = -_3404;
    float _3414 = _3384 + _3412;
    float _3416 = -_3404;
    float _3418 = _3378 + _3416;
    float _3420 = -_3404;
    float _3422 = _3390 + _3420;
    float _3424 = fma(_3414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    float _3426 = fma(_3418, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    float _3428 = fma(_3422, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    bool _3430 = !_3388;
    if (!_3430)
    {
        float _3432 = -_2423;
        float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3436 = -_2425;
        float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3440 = -_2427;
        float _3442 = _3440 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3444 = _3434 * _3434;
        float _3446 = fma(_3438, _3438, _3444);
        float _3448 = fma(_3442, _3442, _3446);
        float _3450 = sqrt(_3448);
        float _3452 = rsqrt(_3448);
        float _3454 = -_3450;
        float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3458 = _3456 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3460 = precise::clamp(_3458, 0.0, 1.0);
        float _3462 = _3438 * _3452;
        float _3464 = _3434 * _3452;
        float _3466 = abs(_3460);
        float _3468 = log2(_3466);
        float _3470 = _3442 * _3452;
        float _3472 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3474 = _3080 * _3464;
        float _3476 = -_3464;
        float _3478 = -_3472;
        float _3480 = fma(_3476, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3478);
        float _3482 = fma(_3030, _3462, _3474);
        float _3484 = -_3470;
        float _3486 = fma(_3484, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3480);
        float _3488 = fma(_3082, _3470, _3482);
        float _3490 = precise::clamp(_3488, 0.0, 1.0);
        float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3494 = _3486 + _3492;
        float _3496 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3498 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3500 = precise::clamp(_3498, 0.0, 1.0);
        float _3502 = exp2(_3496);
        float _3504 = _3502 * _3500;
        float _3506 = _3490 * _3504;
        float _3508 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3510 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3512 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3508;
        out.m_89.y = _3510;
        out.m_89.z = _3512;
    }
    out.m_91.x = _3424;
    out.m_91.y = _3426;
    out.m_91.z = _3428;
    if (!_3410)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3514 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3514;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3266 = false;
    bool _334 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3570 = as_type<float>(_124);
        out.gl_Position.z = _3570;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3635 = as_type<float>(_160);
        out.gl_Position.z = _3635;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _130;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _134 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _188;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    float _222 = in.m_59.x;
    float _224 = in.m_59.y;
    float _226 = in.m_59.z;
    bool _228 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    bool _244 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_216);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = 1.0 / _242;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = _254 * _258;
    float _270 = -_254;
    float _272 = _270 + 1.0;
    float _274 = _220 * _264;
    float _276 = fma(_262, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = _276 * _268;
    float _288 = fma(_280, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = _288 * _268;
    float _294 = _290 * _268;
    float _296 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _298 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _300 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _302 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _296);
    float _304 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _298);
    float _306 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _300);
    float _308 = _302 * _222;
    float _310 = _304 * _224;
    float _312 = _306 * _226;
    bool _314 = !_266;
    float _332;
    if (!_314)
    {
        float _316 = in.m_57.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _324 = _322 * _318;
        float _326 = floor(_324);
        float _328 = -_326;
        float _330 = _324 + _328;
        _332 = _330;
        _334 = true;
    }
    else
    {
        _332 = _172;
    }
    _334 = false;
    float _336 = _332;
    float _338 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _340 = int(_338);
    float _342 = in.m_57.x;
    float _344 = in.m_57.y;
    float _346 = in.m_61.x;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _350 = int(_348);
    float _352 = in.m_57.z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _356 = float(_340);
    float _358 = 1.0 / _356;
    float _360 = float(uint(_350));
    int _362 = ~_350;
    int _364 = _362 + 1;
    int _366 = ~_350;
    int _368 = _366 + 1;
    float _370 = 1.0 / _360;
    bool _372 = _350 == 0;
    float _374 = _358 * _134;
    float _376 = trunc(_374);
    int _378 = int(_376);
    int _380 = as_type<int>(_370) + (-2);
    float _382 = float(uint(_378));
    float _384 = as_type<float>(_380) * _382;
    float _386 = trunc(_384);
    float _388 = precise::max(_386, 0.0);
    uint _391 = uint(_388);
    float _393 = float(_350);
    int _395 = _364 * int(_391);
    int _397 = _395 + _378;
    float _399 = float(uint(_397));
    float _401 = as_type<float>(_380) * _399;
    float _403 = trunc(_401);
    float _405 = precise::max(_403, 0.0);
    uint _407 = uint(_405);
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _411 = _409 != 0;
    bool _413 = !_411;
    float _415 = _413 ? 7.345489978790283203125 : 1.0;
    float _417 = _415 * _342;
    int _419 = int(_391) + int(_407);
    float _421 = floor(_417);
    float _423 = float(_378);
    int _425 = _368 * _419;
    int _427 = _425 + _378;
    bool _429 = _423 >= _393;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan(_393);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = uint(_427) >= uint(_350);
    float _443 = trunc(_439);
    int _445 = int(_443);
    bool _447 = !_441;
    int _449 = _447 ? 0 : (-1);
    float _451 = -_421;
    float _453 = _417 + _451;
    int _455 = ~_419;
    int _457 = _455 + _449;
    int _459 = _457 + 1;
    float _461 = _453 * _393;
    float _463 = _393 * _134;
    int _465 = _350 * _459;
    int _467 = _465 + _378;
    float _469 = _463 * _168;
    float _471 = trunc(_461);
    int _473 = int(_471);
    bool _475 = !_372;
    int _477 = _475 ? _467 : (-1);
    int _479 = ~_445;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _487 = _485 != 0;
    float _489 = trunc(_469);
    int _491 = int(_489);
    int _493 = _477 * _483;
    int _495 = _350 + (-1);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _503 = _501 != 0;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _511 = _509 != 0;
    int _513 = _445 * _495;
    int _515 = _513 + _493;
    bool _517 = !_487;
    int _519 = _517 ? 0 : 1;
    bool _521 = !_503;
    int _523 = _521 ? 0 : 1;
    bool _525 = !_499;
    int _527 = _525 ? 0 : 1;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _531 = _529 != 0;
    int _533 = abs(_523);
    bool _535 = !_507;
    int _537 = _535 ? 0 : 1;
    int _539 = abs(_519);
    int _541 = abs(_527);
    bool _543 = !_531;
    int _545 = _543 ? 0 : 1;
    int _547 = _473 * _539;
    int _549 = _547 + _378;
    int _551 = abs(_537);
    int _553 = _515 * _533;
    int _555 = abs(_545);
    float _557 = in.m_63.y;
    int _559 = _491 * _541;
    int _561 = _559 + _553;
    int _563 = ~_350;
    int _565 = _563 + 1;
    float _567 = in.m_63.z;
    float _569 = float(uint(_549));
    int _571 = _549 * _551;
    int _573 = _571 + _561;
    int _575 = ~_350;
    int _577 = _575 + 1;
    float _579 = in.m_63.w;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _583 = _581 != 0;
    int _585 = _473 * _555;
    int _587 = _585 + _573;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _591 = _589 != 0;
    float _593 = as_type<float>(_380) * _569;
    float _595 = float(uint(_587));
    float _597 = trunc(_593);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = as_type<float>(_380) * _595;
    float _605 = 0.0;
    if (_583)
    {
        float _607 = in.m_57.x;
        _605 = _607;
    }
    float _609 = _605;
    float _611 = 0.0;
    if (_583)
    {
        _611 = _346;
    }
    float _613 = _611;
    float _615 = trunc(_603);
    float _617 = precise::max(_615, 0.0);
    uint _619 = uint(_617);
    out.m_65.y = _557;
    out.m_65.z = _567;
    float _621 = in.m_61.y;
    out.m_65.w = _579;
    int _623 = _577 * int(_619);
    int _625 = _623 + _587;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _629 = float(uint(_625));
    float _631 = in.m_63.x;
    bool _633 = _609 > 0.5;
    bool _635 = _633 && _583;
    float _637 = as_type<float>(_380) * _629;
    float _639 = trunc(_637);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _645;
    float _649 = _613;
    float _651 = _621;
    if (_635)
    {
        float _653 = -_613;
        float _655 = _653 + 1.0;
        _649 = _655;
    }
    float _657 = _649;
    out.m_65.x = _631;
    int _659 = int(_619) + int(_643);
    int _661 = ~_350;
    int _663 = _661 + 1;
    int _665 = _565 * _659;
    int _667 = _665 + _587;
    float _669 = -_621;
    float _671 = _669 + 1.0;
    bool _673 = uint(_667) >= uint(_350);
    bool _675 = !_673;
    int _677 = _675 ? 0 : (-1);
    bool _679 = _344 > 0.5;
    int _681 = ~_659;
    int _683 = _681 + _677;
    int _685 = _683 + 1;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _691 = _342 * 2.0;
    if (_511)
    {
        float _693 = _679 ? _671 : _621;
        _651 = _693;
    }
    float _695 = _651;
    int _697 = _350 * _685;
    int _699 = _697 + _587;
    float _701 = 1.0 / _689;
    int _703 = _663 * int(_601);
    int _705 = _703 + _549;
    float _707 = -_354;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[77].x, _707);
    bool _711 = !_372;
    int _713 = _711 ? _699 : (-1);
    float _715 = float(uint(_705));
    int _717 = _713 >> 31;
    float _719 = floor(_691);
    int _721 = _713 & 3;
    bool _723 = _721 != 0;
    float _725 = as_type<float>(_380) * _715;
    int _727 = _717 & 3;
    float _729 = _344 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _731 = _713 + _727;
    float _733 = trunc(_725);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = fma(_729, -2.0, _627);
    float _741 = _647 * _701;
    int _743 = _731 >> 2;
    int _745 = _723 ? 0 : 1;
    int _747 = _743 << 4;
    int _749 = _747 + 368;
    float _751 = _344 + _342;
    bool _753 = _719 > 0.0;
    float _755 = _344 + _352;
    uint _757 = uint(int(uint(_749) >> uint(2)));
    uint _759 = uint(int(uint(int(_757)) >> uint(2)));
    int _761 = int(_757) & 3;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[int(_759)][_761];
    int _765 = int(_757) + 1;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    int _769 = _765 & 3;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[int(_767)][_769];
    bool _773 = _719 >= 0.0;
    bool _775 = isnan(_719);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = _751 + (-1.0);
    float _785 = _755 + (-1.0);
    float _787 = _755;
    if (!_583)
    {
        _787 = _346;
    }
    float _789 = _787;
    int _791 = int(_601) + int(_737);
    float _793 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _795 = _713 & 3;
    bool _797 = _795 != 0;
    int _799 = _749 + 8;
    uint _801 = uint(int(uint(_799) >> uint(2)));
    uint _803 = uint(int(uint(int(_801)) >> uint(2)));
    int _805 = int(_801) & 3;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[int(_803)][_805];
    int _809 = int(_801) + 1;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    int _813 = _809 & 3;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[int(_811)][_813];
    int _817 = ~_350;
    int _819 = _817 + 1;
    bool _821 = uint(_795) > 1u;
    int _823 = _819 * _791;
    int _825 = _823 + _549;
    int _827 = ~_745;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    bool _833 = !_797;
    int _835 = _833 ? 0 : 1;
    float _837 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _839 = _789;
    int _841 = _831;
    if (_583)
    {
        _839 = _657;
    }
    float _843 = _839;
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _847 = int(_845);
    bool _849 = uint(_825) >= uint(_350);
    bool _851 = _795 != 3;
    if (!_821)
    {
        int _853 = ~_745;
        int _855 = _853 + 1;
        _841 = _855;
    }
    int _857 = _841;
    bool _859 = !_591;
    int _861 = _859 ? 0 : 1;
    float _863 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _865 = log2(_863);
    bool _867 = _795 != 3;
    bool _869 = uint(_795) >= 2u;
    int _871 = abs(_857);
    int _873 = _869 ? 0 : 1;
    int _875 = ~_871;
    int _877 = _875 + 1;
    int _879 = _877 + 1;
    int _881 = ~_873;
    int _883 = _881 + 1;
    int _885 = _883 + 1;
    int _887 = abs(_835);
    int _889 = _885;
    if (_867)
    {
        int _891 = ~_873;
        int _893 = _891 + 1;
        _889 = _893;
    }
    int _895 = _889;
    float _897 = _865 * _134;
    bool _899 = !_849;
    int _901 = _899 ? 0 : (-1);
    int _903 = _879 * as_type<int>(_771);
    bool _905 = !_851;
    int _907 = _905 ? 0 : (-1);
    float _909 = exp2(_897);
    int _911 = abs(_895);
    float _913 = _344 * 2.0;
    int _915 = ~_791;
    int _917 = _915 + _901;
    int _919 = _917 + 1;
    int _921 = abs(_907);
    int _923 = _350 * _919;
    int _925 = _923 + _549;
    int _927 = ~_887;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = floor(_913);
    int _935 = abs(_861);
    int _937 = ~_911;
    int _939 = _937 + 1;
    int _941 = _939 + 1;
    int _943 = _931 * as_type<int>(_763);
    int _945 = _943 + _903;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _949 = _947 != 0;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _957 = _955 != 0;
    float _959 = _352 * 2.0;
    int _961 = _941 * as_type<int>(_807);
    int _963 = _961 + _945;
    float _965 = float(uint(_847));
    float _967 = -_909;
    float _969 = _967 + 1.0;
    float _971 = floor(_959);
    int _973 = ~_921;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    int _979 = ~_935;
    int _981 = _979 + 1;
    int _983 = _981 + 1;
    bool _985 = !_372;
    int _987 = _985 ? _925 : (-1);
    int _989 = _977 * as_type<int>(_815);
    int _991 = _989 + _963;
    int _993 = abs(_847);
    float _995 = 1.0 / _965;
    bool _997 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _999 = isnan(_336);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    int _1009 = _991 * _983;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1013 = _336 + _1011;
    bool _1015 = !_949;
    int _1017 = _1015 ? 0 : 1;
    float _1019 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    int _1021 = _987 * _935;
    int _1023 = _1021 + _1009;
    float _1025 = fma(_741, _1013, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1027 = _971 > 0.0;
    bool _1029 = _971 >= 0.0;
    bool _1031 = isnan(_971);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(0.0);
    bool _1037 = _1033 || _1035;
    float _1039 = float(uint(_1023));
    int _1041 = _1037 ? 0 : 1;
    int _1043 = as_type<int>(_995) + (-2);
    int _1045 = ~_1041;
    int _1047 = _1045 + 1;
    int _1049 = _1047 + 1;
    bool _1051 = _933 > 0.0;
    float _1053 = as_type<float>(_1043) * _1039;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1057 = 1.0 + _1055;
    int _1059 = _1049;
    if (!_1027)
    {
        int _1061 = ~_1041;
        int _1063 = _1061 + 1;
        _1059 = _1063;
    }
    int _1065 = _1059;
    bool _1067 = _933 >= 0.0;
    bool _1069 = isnan(_933);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan(0.0);
    bool _1075 = _1071 || _1073;
    float _1077 = 1.0 / _1057;
    bool _1079 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1081 = isnan(0.0);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1087 = _1083 || _1085;
    float _1089 = in.m_48.x;
    float _1091 = in.m_48.y;
    float _1093 = in.m_48.z;
    bool _1095 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1097 = isnan(_336);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = float(uint(_993));
    float _1109 = trunc(_1053);
    float _1111 = precise::max(_1109, 0.0);
    uint _1113 = uint(_1111);
    float _1115 = -_1105;
    float _1117 = _1115 + 1.0;
    float _1119 = _1087 ? _969 : 0.0;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1123 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1125 = isnan(1.0);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1131 = _1127 || _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1135 = ~_847;
    int _1137 = _1135 + 1;
    float _1139 = 1.0 / _1107;
    float _1141 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1121);
    float _1143 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1133);
    int _1145 = abs(_1023);
    float _1147 = _1007 * _1117;
    float _1149 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1151 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1143);
    float _1153 = -_1007;
    float _1155 = _1153 + 1.0;
    int _1157 = _1137 * int(_1113);
    int _1159 = _1157 + _1023;
    float _1161 = -_134;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[76].x, _709);
    if (_1131)
    {
        float _1165 = _1119 * _1077;
        _154 = _1165;
    }
    float _1167 = _154;
    float _1169 = in.m_67.y;
    float _1171 = float(uint(_1159));
    float _1173 = _1025 * _1147;
    int _1175 = abs(_1017);
    float _1177 = float(_1065);
    float _1179 = as_type<float>(_1043) * _1171;
    int _1181 = as_type<int>(_1139) + (-2);
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1173);
    float _1185 = float(uint(_1145));
    float _1187 = trunc(_1179);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    int _1193 = _781 ? 0 : 1;
    float _1195 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1183);
    float _1197 = float(_1175);
    float _1199 = as_type<float>(_1181) * _1185;
    int _1201 = ~_1193;
    int _1203 = _1201 + 1;
    int _1205 = _1203 + 1;
    int _1207 = _1205;
    if (!_753)
    {
        int _1209 = ~_1193;
        int _1211 = _1209 + 1;
        _1207 = _1211;
    }
    int _1213 = _1207;
    float _1215 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1217 = ~_993;
    int _1219 = _1217 + 1;
    float _1221 = trunc(_1199);
    float _1223 = precise::max(_1221, 0.0);
    uint _1225 = uint(_1223);
    float _1227 = _1197 * _1177;
    float _1229 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1231 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1215);
    int _1233 = _1075 ? 0 : 1;
    float _1235 = _1091 + _1169;
    float _1237 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    float _1239 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1231);
    int _1241 = ~_1233;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1249 = _1235 + _1247;
    float _1251 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1237);
    float _1253 = _1239 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1255 = _1245;
    if (!_1051)
    {
        int _1257 = ~_1233;
        int _1259 = _1257 + 1;
        _1255 = _1259;
    }
    int _1261 = _1255;
    float _1263 = _1249 * _1249;
    float _1265 = in.m_69.x;
    float _1267 = in.m_69.y;
    float _1269 = in.m_69.z;
    int _1271 = int(_1113) + int(_1191);
    int _1273 = _1219 * int(_1225);
    int _1275 = _1273 + _1145;
    float _1277 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1279 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1253 + _1281;
    int _1285 = ~_847;
    int _1287 = _1285 + 1;
    float _1289 = _1227 * (-2.0);
    float _1291 = float(uint(_1275));
    bool _1293 = !_953;
    int _1295 = _1293 ? 0 : 1;
    bool _1297 = _847 == 0;
    float _1299 = as_type<float>(_1181) * _1291;
    float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1303 = _1279 + _1301;
    float _1305 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1277);
    int _1307 = abs(_1295);
    float _1309 = trunc(_1299);
    float _1311 = precise::max(_1309, 0.0);
    uint _1313 = uint(_1311);
    float _1315 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1305);
    float _1317 = float(_1213);
    float _1319 = fma(_793, _1289, _793);
    float _1321 = float(_1307);
    float _1323 = fma(_1289, _1265, _1265);
    bool _1325 = _1315 >= 0.0;
    int _1327 = _1287 * _1271;
    int _1329 = _1327 + _1023;
    float _1331 = _1321 * _1317;
    float _1333 = fma(_1283, _1283, _1263);
    bool _1335 = uint(_1329) >= uint(_847);
    float _1337 = _1331 * (-2.0);
    float _1339 = fma(_1303, _1303, _1333);
    int _1341 = int(_1225) + int(_1313);
    float _1343 = fma(_1337, _1267, _1267);
    int _1345 = ~_993;
    int _1347 = _1345 + 1;
    float _1349 = rsqrt(_1339);
    float _1351 = _1265;
    int _1353 = as_type<int>(_1331);
    if (_1325)
    {
        _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1355 = _1351;
    if (_1325)
    {
        out.m_51.x = 0.0;
    }
    int _1357 = _1347 * _1341;
    int _1359 = _1357 + _1145;
    bool _1361 = !_1335;
    int _1363 = _1361 ? 0 : (-1);
    if (_1325)
    {
        float _1365 = _1355 * 5.0;
        _1353 = as_type<int>(_1365);
    }
    int _1367 = _1353;
    float _1369 = fma(_837, _1337, _837);
    bool _1371 = uint(_1359) >= uint(_993);
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1375 = _1023 ^ _847;
    if (_1325)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5391 = as_type<float>(_1367);
        out.gl_Position.z = _5391;
    }
    int _1377 = ~_1271;
    int _1379 = _1377 + _1363;
    int _1381 = _1379 + 1;
    bool _1383 = !_1371;
    int _1385 = _1383 ? 0 : (-1);
    uint _1387 = uint(int(uint(_1375) >> uint(31)));
    int _1389 = _847 * _1381;
    int _1391 = _1389 + _1023;
    float _1393 = _1249 * _1349;
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1397 = ~_1385;
    int _1399 = _1341 + _1397;
    int _1401 = _1399 + 1;
    float _1403 = _1283 * _1349;
    int _1405 = ~int(_1387);
    int _1407 = _1405 + 1;
    float _1409 = -_1393;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1413 = _342 + (-0.5);
    bool _1415 = _847 == 0;
    float _1417 = -_1403;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    int _1421 = _1401 ^ _1407;
    float _1423 = _1411 * _1411;
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1323);
    bool _1427 = !_1415;
    int _1429 = _1427 ? _1391 : (-1);
    float _1431 = _1303 * _1349;
    int _1433 = ~_1407;
    int _1435 = _1433 + _1421;
    int _1437 = _1435 + 1;
    float _1439 = fma(_1419, _1419, _1423);
    float _1441 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1443 = float(_1429);
    float _1445 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1447 = !_1297;
    int _1449 = _1447 ? _1437 : (-1);
    float _1451 = fma(_1441, _843, -0.5);
    float _1453 = fma(_1319, _1167, _1425);
    float _1455 = fma(_1441, _1443, _1163);
    float _1457 = float(_1449);
    float _1459 = fma(_1445, _695, -0.5);
    float _1461 = fma(_1149, _1451, _1455);
    float _1463 = -_1019;
    float _1465 = fma(_1445, _1457, _1463);
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1469 = fma(_1151, _1459, _1465);
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1481 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = _1461 + 0.5;
    float _1493 = _1469 + 0.5;
    float _1495 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1497 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1501 = -_1431;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    bool _1505 = !_957;
    int _1507 = _1505 ? 0 : 1;
    out.m_71.x = _1491;
    out.m_71.y = _1493;
    float _1509 = fma(_1503, _1503, _1439);
    int _1511 = abs(_1507);
    out.m_73.x = _1487;
    out.m_73.y = _1489;
    out.m_73.z = _1495;
    out.m_73.w = _1483;
    out.m_75.x = _1481;
    out.m_75.y = _1485;
    out.m_75.z = _1497;
    out.m_75.w = _1499;
    float _1513 = _1431;
    float _1515 = _1393;
    if (_1325)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1517 = -_1393;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _1521 = _344 + (-0.5);
    float _1523 = -_1403;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1527 = float(_1261);
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1531 = _1519 + _1529;
    float _1533 = float(_1511);
    float _1535 = -_1431;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1539 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1541 = _1525 + _1539;
    float _1543 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1545 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1343);
    float _1547 = _1533 * _1527;
    float _1549 = _352 + _342;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1537 + _1551;
    float _1555 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1543);
    float _1557 = fma(_1369, _1167, _1545);
    float _1559 = _1549 + (-1.0);
    float _1561 = _1547 * (-2.0);
    float _1563 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1555);
    float _1565 = _352 + (-0.5);
    float _1567 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1569 = fma(_1561, _1269, _1269);
    float _1571 = _1453 * 0.15915493667125701904296875;
    bool _1573 = _1563 >= 0.0;
    float _1575 = fma(_1567, _1561, _1567);
    float _1577 = fma(_1565, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1569);
    float _1579 = _1557 * 0.15915493667125701904296875;
    float _1581 = sqrt(_1509);
    float _1583 = fma(_1575, _1167, _1577);
    float _1585 = _1583 * 0.15915493667125701904296875;
    float _1587 = _1571 * 6.283185482025146484375;
    float _1589 = sin(_1587);
    float _1591 = _1569;
    if (_1573)
    {
        _1591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1593 = _1591;
    int _1595 = as_type<int>(_1593);
    if (_1573)
    {
        out.m_51.x = 0.0;
    }
    if (_1573)
    {
        float _1597 = _1593 * 5.0;
        _1595 = as_type<int>(_1597);
    }
    int _1599 = _1595;
    float _1601 = _1571 * 6.283185482025146484375;
    float _1603 = cos(_1601);
    if (_1573)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5793 = as_type<float>(_1599);
        out.gl_Position.z = _5793;
    }
    float _1605 = _1579 * 6.283185482025146484375;
    float _1607 = sin(_1605);
    float _1609 = _1579 * 6.283185482025146484375;
    float _1611 = cos(_1609);
    float _1613 = _1585 * 6.283185482025146484375;
    float _1615 = sin(_1613);
    if (_1573)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1617 = _1585 * 6.283185482025146484375;
    float _1619 = cos(_1617);
    float _1621 = _1603 * _1611;
    float _1623 = _1589 * _1611;
    float _1625 = _1589 * _1607;
    float _1627 = _1349 * _1581;
    float _1629 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1631 = _1603 * _1607;
    float _1633 = fma(_1615, _1621, _1625);
    float _1635 = fma(_1615, _1625, _1621);
    float _1637 = in.m_77.x;
    float _1639 = in.m_77.y;
    float _1641 = in.m_77.z;
    float _1643 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1645 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1647 = _1611 * _1619;
    float _1649 = -_1253;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1653 = _1607 * _1619;
    float _1655 = -_1235;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1659 = _1603 * _1619;
    float _1661 = _1651 * _1651;
    float _1663 = _1589 * _1619;
    float _1665 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1629);
    float _1667 = -_1631;
    float _1669 = fma(_1615, _1623, _1667);
    float _1671 = -_1623;
    float _1673 = fma(_1615, _1631, _1671);
    float _1675 = -_1279;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1679 = fma(_1657, _1657, _1661);
    float _1681 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1665);
    float _1683 = _308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1685 = fma(_1677, _1677, _1679);
    float _1687 = _1681 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1689 = _1627 * _1643;
    float _1691 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1645);
    float _1693 = rsqrt(_1685);
    float _1695 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1639);
    float _1697 = -_1687;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1701 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1703 = _1627 * _1683;
    float _1705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1637);
    float _1707 = _1695 * _1689;
    float _1709 = fma(_1699, _1699, _1661);
    float _1711 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1713 = _1705 * _1703;
    float _1715 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1691);
    float _1717 = _1627 * _1711;
    float _1719 = fma(_1677, _1677, _1709);
    float _1721 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1723 = _1651 * _1693;
    float _1725 = _1657 * _1693;
    float _1727 = _1677 * _1693;
    float _1729 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1701);
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1733 = _1723 * _1731;
    float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1735;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1741 = _1727 * _1739;
    float _1743 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1729);
    float _1745 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1747 = -_1733;
    float _1749 = fma(_1727, _1745, _1747);
    float _1751 = _1715 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1753 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1755 = _1725 * _1753;
    float _1757 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1759 = -_1741;
    float _1761 = fma(_1725, _1757, _1759);
    float _1763 = _1749 * _1749;
    float _1765 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1769 = -_1755;
    float _1771 = fma(_1723, _1767, _1769);
    float _1773 = sqrt(_1719);
    float _1775 = fma(_1761, _1761, _1763);
    float _1777 = -_1765;
    float _1779 = _1751 + _1777;
    float _1781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1641);
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1721);
    float _1785 = fma(_1771, _1771, _1775);
    float _1787 = _1781 * _1717;
    float _1789 = 1.0 / _1737;
    float _1791 = abs(_1779);
    float _1793 = precise::max(_1791, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    bool _1795 = _1765 >= _1751;
    bool _1797 = isnan(_1765);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan(_1751);
    bool _1803 = _1799 || _1801;
    float _1805 = -_1707;
    float _1807 = _1615 * _1805;
    float _1809 = precise::min(_1793, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1811 = _1659 * _1707;
    float _1813 = _1663 * _1707;
    float _1815 = rsqrt(_1785);
    float _1817 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1783);
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1821 = _1809 + _1819;
    float _1823 = fma(_1647, _1713, _1807);
    float _1825 = abs(_1773);
    float _1827 = precise::max(0.0, _1825);
    float _1829 = fma(_1633, _1713, _1811);
    float _1831 = fma(_1669, _1713, _1813);
    bool _1833 = !_1803;
    float _1835 = _1833 ? 1.0 : (-1.0);
    float _1837 = _1821 * _1789;
    float _1839 = precise::min(_1827, 40.0);
    float _1841 = _172 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1843 = rsqrt(_1817);
    float _1845 = _1835 * _1837;
    float _1847 = fma(_1653, _1787, _1823);
    float _1849 = fma(_1839, -0.02500000037252902984619140625, 1.0);
    float _1851 = fma(_1673, _1787, _1829);
    float _1853 = _1771 * _1815;
    float _1855 = _1761 * _1815;
    float _1857 = _1749 * _1815;
    float _1859 = _1841 * _1845;
    float _1861 = _1723 * _1853;
    float _1863 = fma(_1635, _1787, _1831);
    float _1865 = _1727 * _1857;
    float _1867 = _1725 * _1855;
    float _1869 = -_1861;
    float _1871 = fma(_1727, _1855, _1869);
    float _1873 = -_1865;
    float _1875 = fma(_1725, _1853, _1873);
    float _1877 = -_1867;
    float _1879 = fma(_1723, _1857, _1877);
    float _1881 = _1871 * _1851;
    float _1883 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1885 = _1875 * _1851;
    float _1887 = _1879 * _1851;
    float _1889 = fma(_1857, _1847, _1881);
    float _1891 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1893 = fma(_1855, _1847, _1885);
    float _1895 = fma(_1853, _1847, _1887);
    float _1897 = fma(_1725, _1863, _1889);
    float _1899 = _1883 * _1883;
    float _1901 = fma(_1723, _1863, _1893);
    float _1903 = fma(_1727, _1863, _1895);
    float _1905 = _1235 + _1897;
    float _1907 = _1687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1909 = _1253 + _1901;
    float _1911 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = fma(_1891, _1891, _1899);
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1921 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1907);
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1913);
    float _1925 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1927 = fma(_1911, _1911, _1917);
    float _1929 = _1279 + _1903;
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1919);
    float _1933 = _1859 * 0.15915493667125701904296875;
    float _1935 = rsqrt(_1927);
    float _1937 = fma(_1279, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1921);
    float _1939 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1925);
    float _1941 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1943 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1923);
    float _1945 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1947 = _1941 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1949 = _1933 * 6.283185482025146484375;
    float _1951 = cos(_1949);
    float _1953 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1955 = _1943 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1957 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _1959 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _1961 = -_1945;
    float _1963 = _1961 + _1953;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _1967 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[13].x, _1957);
    float _1969 = _1933 * 6.283185482025146484375;
    float _1971 = sin(_1969);
    float _1973 = fma(_1849, _1963, _1945);
    float _1975 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[12].x, _1959);
    float _1977 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[14].x, _1965);
    float _1979 = _1911 * _1935;
    float _1981 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[13].z, _1967);
    float _1983 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[14].z, _1977);
    float _1985 = _1891 * _1935;
    float _1987 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[12].z, _1975);
    float _1989 = _1883 * _1935;
    float _1991 = -_1951;
    float _1993 = _1991 + 1.0;
    float _1995 = _1979 * _1979;
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2001 = _1981 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2003 = _1989 * _1993;
    float _2005 = _1985 * _1971;
    float _2007 = _1989 * _1971;
    float _2009 = _1979 * _1971;
    float _2011 = fma(_1993, _1995, _1951);
    float _2013 = _1985 * _1993;
    float _2015 = _1987 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2017 = fma(_1979, _2003, _2005);
    float _2019 = -_1687;
    float _2021 = _2019 + _2001;
    float _2023 = -_2009;
    float _2025 = fma(_1989, _2013, _2023);
    float _2027 = -_2007;
    float _2029 = fma(_1979, _2013, _2027);
    float _2031 = -_1253;
    float _2033 = _2031 + _2015;
    float _2035 = _2017 * _2021;
    float _2037 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2039 = fma(_1985, _2013, _1951);
    float _2041 = _2025 * _2021;
    float _2043 = fma(_2029, _2033, _2035);
    float _2045 = -_1279;
    float _2047 = _2045 + _2037;
    float _2049 = fma(_172, _1999, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2051 = fma(_2039, _2033, _2041);
    float _2053 = fma(_1979, _2013, _2007);
    float _2055 = fma(_2011, _2047, _2043);
    float _2057 = -_2005;
    float _2059 = fma(_1979, _2003, _2057);
    float _2061 = fma(_2053, _2047, _2051);
    float _2063 = fma(_2055, _2049, _1279);
    float _2065 = fma(_2061, _2049, _1253);
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2069 = _2063 + _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2073 = _2065 + _2071;
    float _2075 = _2069 * _2069;
    float _2077 = fma(_2073, _2073, _2075);
    float _2079 = sqrt(_2077);
    bool _2081 = _2079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2085 = _2079 + _2083;
    float _2087 = _2075;
    float _2089 = _2077;
    float _2091 = _1951;
    float _2093 = _1687;
    float _2095 = _2065;
    float _2097 = _2063;
    if (_2081)
    {
        float _2099 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2099;
    }
    float _2101 = _2087;
    if (_2081)
    {
        float _2103 = rsqrt(_2077);
        _2089 = _2103;
    }
    float _2105 = _2089;
    float _2107 = _2101;
    if (_2081)
    {
        float _2109 = _2085 * _2101;
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = fma(_1989, _2003, _1951);
    float _2115 = fma(_1989, _2013, _2009);
    if (_2081)
    {
        float _2117 = _2111 * 0.15915493667125701904296875;
        _2091 = _2117;
    }
    float _2119 = _2091;
    float _2121 = _2113 * _2021;
    float _2123 = _2009;
    if (_2081)
    {
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _2123 = _2127;
    }
    float _2129 = _2123;
    float _2131 = fma(_2115, _2033, _2121);
    float _2133 = fma(_2059, _2047, _2131);
    float _2135 = _1687 + _2133;
    float _2137 = _2135;
    if (_2081)
    {
        float _2139 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2093 = _2139;
    }
    float _2141 = _2093;
    float _2143 = _2129;
    if (_2081)
    {
        float _2145 = fma(_2129, _2141, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2143 = _2145;
    }
    float _2147 = _2143;
    float _2149 = _2147;
    if (_2081)
    {
        float _2151 = _2105 * _2147;
        _2149 = _2151;
    }
    float _2153 = _2149;
    if (_2081)
    {
        float _2155 = fma(_2073, _2153, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2095 = _2155;
    }
    float _2157 = _2095;
    float _2159 = _2157;
    if (_2081)
    {
        float _2161 = fma(_2069, _2153, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2097 = _2161;
    }
    float _2163 = _2097;
    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2167 = _2157 + _2165;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2171 = _2163 + _2169;
    float _2173 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2175 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6755 = float2(_2173, _2175);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6755, float2(0.0), isnan(_6755)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6755, float2(0.0), isnan(_6755)), level(0.0)).x;
    float _2179 = _2119;
    float _2181 = _2167;
    float _2183 = _2163;
    if (_2081)
    {
        float _2185 = _2119 * 6.283185482025146484375;
        float _2187 = cos(_2185);
        _2179 = _2187;
    }
    float _2189 = _2179;
    if (_2081)
    {
        float _2191 = _2189 + (-1.0);
        _2181 = _2191;
    }
    float _2193 = _2181;
    float _2195 = _2193;
    if (_2081)
    {
        float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2197;
    }
    float _2199 = _2195;
    if (_2081)
    {
        float _2201 = fma(_2135, _2189, _2199);
        _2137 = _2201;
    }
    float _2203 = _2137;
    float _2205 = fma(_2177, 100.0, _1235);
    float _2207 = -_1235;
    float _2209 = _2207 + _2203;
    float _2211 = fma(_2177, 100.0, _2203);
    float _2213 = -_1393;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    float _2217 = _2209 * _2209;
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2223 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    float _2225 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2221);
    float _2227 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2223);
    float _2229 = -_1253;
    float _2231 = _2229 + _2157;
    float _2233 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2225);
    float _2235 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2237 = -_1279;
    float _2239 = _2237 + _2163;
    float _2241 = fma(_2231, _2231, _2217);
    float _2243 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2245 = 1.0 / _2235;
    float _2247 = fma(_2239, _2239, _2241);
    float _2249 = _2243 + _2235;
    float _2251 = sqrt(_2247);
    bool _2253 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.5);
    bool _2261 = _2257 || _2259;
    float _2263 = _2249 * _2245;
    float _2265 = _2263 * 0.5;
    bool _2267 = _2251 > 0.0;
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2271 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2269);
    bool _2273 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan(0.5);
    bool _2281 = _2277 || _2279;
    float _2283 = 1.0 / _2271;
    bool _2285 = !_2267;
    float _2287 = _2211;
    float _2289 = _2177;
    if (!_2285)
    {
        float _2291 = _188 * _188;
        float _2293 = rsqrt(_2247);
        float _2295 = fma(_186, _186, _2291);
        float _2297 = fma(_190, _190, _2295);
        float _2299 = sqrt(_2297);
        float _2301 = _2231 * _2293;
        float _2303 = _2209 * _2293;
        bool _2305 = _2299 > 0.0;
        float _2307 = _2239 * _2293;
        bool _2309 = !_2305;
        _2289 = _2297;
        if (!_2309)
        {
            float _2311 = rsqrt(_2297);
            float _2313 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2315 = _188 * _2311;
            float _2317 = _186 * _2311;
            float _2319 = _190 * _2311;
            float _2321 = _2303 * _2315;
            float _2323 = fma(_2301, _2317, _2321);
            float _2325 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2327 = fma(_2307, _2319, _2323);
            float _2329 = _2327 * _2325;
            float _2331 = fma(_186, _2329, _2157);
            float _2333 = fma(_188, _2329, _2211);
            float _2335 = fma(_190, _2329, _2163);
            _2183 = _2335;
            _2287 = _2333;
            _2159 = _2331;
        }
    }
    float _2337 = _2183;
    float _2339 = _2287;
    float _2341 = _2159;
    float _2343 = _2289;
    float _2345 = -_1431;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2337);
    float _2349 = -_1393;
    float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2339);
    float _2353 = -_1403;
    float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2341);
    float _2357 = _2351;
    float _2359 = _2355;
    float _2361 = _2347;
    float _2363 = _2343;
    if (_2281)
    {
        _1513 = 1.0;
    }
    float _2365 = _1513;
    float _2367 = _2365;
    if (_2261)
    {
        _1515 = _2347;
    }
    float _2369 = _1515;
    float _2371 = _2369;
    if (!_2261)
    {
        float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2375 = _2215 + _2373;
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2379 = -_1279;
        float _2381 = _2379 + _2337;
        float _2383 = -_2205;
        float _2385 = _2383 + _2339;
        float _2387 = _2375 * _2375;
        float _2389 = -_1253;
        float _2391 = _2389 + _2341;
        float _2393 = fma(_1541, _1541, _2387);
        float _2395 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2397 = fma(_1553, _1553, _2393);
        float _2399 = 1.0 / _1627;
        float _2401 = sqrt(_2397);
        float _2403 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2405 = precise::min(_2401, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2407 = _2405 * _2377;
        float _2409 = _2407 * _2399;
        float _2411 = _2403 * _2409;
        float _2413 = _2381 * _2409;
        float _2415 = fma(_2385, _2411, _2215);
        float _2417 = fma(_2391, _2411, _1525);
        float _2419 = fma(_2403, _2413, _1537);
        _194 = _2411;
        _2357 = _2415;
        _2359 = _2417;
        _2371 = _2419;
        _2361 = _2401;
    }
    float _2421 = _194;
    float _2423 = _2357;
    float _2425 = _2359;
    float _2427 = _2371;
    float _2429 = _2361;
    float _2431 = _2421;
    float _2433 = _2429;
    if (_2281)
    {
        _2363 = 1.0;
    }
    float _2435 = _2363;
    float _2437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2439 = _2283 * _2437;
    float _2441 = _2435;
    if (!_2281)
    {
        float _2443 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2445 = _2443 * 0.15915493667125701904296875;
        float _2447 = _2445 * 6.283185482025146484375;
        float _2449 = cos(_2447);
        float _2451 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2453 = _2451 * 0.15915493667125701904296875;
        float _2455 = _2445 * 6.283185482025146484375;
        float _2457 = sin(_2455);
        float _2459 = 1.0 / _2449;
        float _2461 = _2453 * 6.283185482025146484375;
        float _2463 = cos(_2461);
        float _2465 = _2457 * _2459;
        float _2467 = _2453 * 6.283185482025146484375;
        float _2469 = sin(_2467);
        float _2471 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2473 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2471;
        float _2475 = _2463 * _2465;
        float _2477 = 1.0 / _2473;
        float _2479 = 1.0 / _2475;
        float _2481 = _2469 * _2479;
        float _2483 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2485 = fma(_2439, _2481, _2483);
        float _2487 = _2485 * _2477;
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        _2431 = _2453;
        _2433 = _2465;
        _2367 = _2489;
    }
    float _2491 = _2431;
    float _2493 = _2433;
    float _2495 = _2367;
    float _2497 = _2493;
    float _2499 = _2491;
    if (!_2281)
    {
        float _2501 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2503 = _2501 * 0.15915493667125701904296875;
        float _2505 = _2503 * 6.283185482025146484375;
        float _2507 = cos(_2505);
        float _2509 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2511 = _2509 * 0.15915493667125701904296875;
        float _2513 = _2503 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = 1.0 / _2507;
        float _2519 = _2511 * 6.283185482025146484375;
        float _2521 = cos(_2519);
        float _2523 = _2515 * _2517;
        float _2525 = _2511 * 6.283185482025146484375;
        float _2527 = sin(_2525);
        float _2529 = _2521 * _2523;
        float _2531 = 1.0 / _2529;
        float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2535 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2533;
        float _2537 = 1.0 / _2535;
        float _2539 = _2527 * _2531;
        float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2543 = fma(_2439, _2539, _2541);
        float _2545 = _2543 * _2537;
        float _2547 = precise::clamp(_2545, 0.0, 1.0);
        float _2549 = -_2547;
        float _2551 = _2549 + 1.0;
        _2497 = _2529;
        _2499 = _2507;
        _2441 = _2551;
    }
    float _2553 = _2497;
    float _2555 = _2499;
    float _2557 = _2441;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2561 = _2423 + _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2565 = _2425 + _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2427 + _2567;
    float _2571 = _2561 * _2561;
    float _2573 = fma(_2565, _2565, _2571);
    float _2575 = fma(_1525, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2577 = fma(_2569, _2569, _2573);
    float _2579 = rsqrt(_2577);
    float _2581 = sqrt(_2577);
    float _2583 = _2579 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2585 = _2565 * _2583;
    float _2587 = _2569 * _2583;
    float _2589 = _2585 * _2585;
    float _2591 = _2587 * _2587;
    float _2593 = _2589 + _2591;
    float _2595 = sqrt(_2593);
    bool _2597 = _2595 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2601 = _2595 + _2599;
    float _2603 = _2569;
    float _2605 = _2593;
    float _2607 = _2601;
    float _2609 = _2553;
    float _2611 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2613 = _2583;
    if (_2597)
    {
        float _2615 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2603 = _2615;
    }
    float _2617 = _2603;
    if (_2597)
    {
        float _2619 = rsqrt(_2593);
        _2605 = _2619;
    }
    float _2621 = _2605;
    float _2623 = _2621;
    if (_2597)
    {
        float _2625 = _2601 * _2617;
        _2607 = _2625;
    }
    float _2627 = _2607;
    if (_2597)
    {
        float _2629 = _2627 * 0.15915493667125701904296875;
        _2609 = _2629;
    }
    float _2631 = _2609;
    float _2633 = _2617;
    float _2635 = _2631;
    if (_2597)
    {
        float _2637 = _2631 * 6.283185482025146484375;
        float _2639 = sin(_2637);
        _2633 = _2639;
    }
    float _2641 = _2633;
    float _2643 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2645 = precise::max(0.0, _2643);
    float _2647 = _2555;
    float _2649 = _2645;
    if (_2597)
    {
        float _2651 = _2631 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        _2647 = _2653;
    }
    float _2655 = _2647;
    float _2657 = -_2583;
    float _2659 = -_2645;
    float _2661 = fma(_2561, _2657, _2659);
    float _2663 = _2661;
    if (_2597)
    {
        float _2665 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2649 = _2665;
    }
    float _2667 = _2649;
    float _2669 = _2667;
    if (!_2597)
    {
        _2635 = _2585;
    }
    float _2671 = _2635;
    float _2673 = _2641;
    float _2675 = _2671;
    if (_2597)
    {
        float _2677 = fma(_2641, _2667, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2673 = _2677;
    }
    float _2679 = _2673;
    float _2681 = _2679;
    float _2683 = _2655;
    if (_2597)
    {
        float _2685 = _2655 + (-1.0);
        _2669 = _2685;
    }
    float _2687 = _2669;
    if (_2597)
    {
        float _2689 = _2621 * _2679;
        _2611 = _2689;
    }
    float _2691 = _2611;
    if (!_2597)
    {
        _2681 = _2587;
    }
    float _2693 = _2681;
    float _2695 = _2693;
    if (_2597)
    {
        float _2697 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2613 = _2697;
    }
    float _2699 = _2613;
    if (_2597)
    {
        float _2701 = _2585 * _2691;
        _2675 = _2701;
    }
    float _2703 = _2675;
    if (!_2597)
    {
        _2623 = _2589;
    }
    float _2705 = _2623;
    float _2707 = _2705;
    if (_2597)
    {
        float _2709 = _2587 * _2691;
        _2695 = _2709;
    }
    float _2711 = _2695;
    if (_2597)
    {
        float _2713 = fma(_2661, _2655, _2699);
        _2663 = _2713;
    }
    float _2715 = _2663;
    if (_2597)
    {
        float _2717 = _2703 * _2703;
        _2707 = _2717;
    }
    float _2719 = _2707;
    if (!_2597)
    {
        _2683 = _2591;
    }
    float _2721 = _2683;
    float _2723 = _2721;
    if (_2597)
    {
        float _2725 = _2711 * _2711;
        _2723 = _2725;
    }
    float _2727 = _2723;
    float _2729 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2731 = fma(_2715, _2715, _2719);
    float _2733 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2735 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2729);
    float _2737 = _2731 + _2727;
    float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2741 = fma(_2581, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2739);
    float _2743 = precise::clamp(_2741, 0.0, 1.0);
    float _2745 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2735);
    float _2747 = floor(_2575);
    float _2749 = -_2743;
    float _2751 = _2749 + 1.0;
    float _2753 = _2745 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2755 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2757 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2759 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2761 = _2753 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2763 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2733);
    float _2765 = rsqrt(_2737);
    float _2767 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2757);
    float _2769 = -_2761;
    float _2771 = fma(_2769, _2755, 1.0);
    float _2773 = _2423 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2775 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2763);
    float _2777 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2767);
    float _2779 = fma(_2425, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2773);
    float _2781 = abs(_2751);
    float _2783 = log2(_2781);
    float _2785 = _2777 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2787 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2789 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2779);
    float _2791 = -_2747;
    float _2793 = _2575 + _2791;
    float _2795 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2797 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2799 = _2789 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2801 = _2765 * _2703;
    float _2803 = _2765 * _2715;
    float _2805 = _2765 * _2711;
    float _2807 = floor(_2759);
    float _2809 = _2801 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2811 = -_2809;
    float _2813 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2811);
    float _2815 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2817 = log2(_2771);
    float _2819 = -_2805;
    float _2821 = fma(_2819, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2813);
    float _2823 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2795);
    float _2825 = fma(_2821, -0.5, 0.5);
    float _2827 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2823);
    float _2829 = fma(_2821, 0.5, 0.5);
    float _2831 = exp2(_2815);
    float _2833 = -_2807;
    float _2835 = _2759 + _2833;
    float _2837 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2827);
    float _2839 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2841 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2797);
    float _2843 = fma(_2829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2845 = 1.0 / _2837;
    float _2847 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2839);
    float _2849 = _2803 + 1.0;
    float _2851 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2841);
    float _2853 = fma(_2829, _2843, -0.212114393711090087890625);
    float _2855 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2847);
    float _2857 = _2817 * 0.693147182464599609375;
    float _2859 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2851);
    float _2861 = sqrt(_2825);
    float _2863 = -_2803;
    float _2865 = fma(_2831, _2849, _2863);
    float _2867 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2855);
    float _2869 = fma(_2829, _2853, 1.570728778839111328125);
    float2 _7830 = float2(_2793, _2835);
    float _2871 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7830, float2(0.0), isnan(_7830)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7830, float2(0.0), isnan(_7830)), level(0.0)).x;
    float _2873 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2875 = _2859 * _2845;
    float _2877 = _2867 * _2845;
    float _2879 = fma(_2865, 0.5, 0.5);
    float _2881 = fma(_2875, 0.5, 0.5);
    float _2883 = fma(_2877, -0.5, 0.5);
    float _2885 = _2861 * 0.636619746685028076171875;
    float3 _7858 = float3(_2881, _2883, _2873);
    float _2887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7858, float3(0.0), isnan(_7858)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7858, float3(0.0), isnan(_7858)), level(0.0)).x;
    float _2889 = -_2869;
    float _2891 = fma(_2885, _2889, 1.0);
    float3 _7874 = float3(_2881, _2883, _2873);
    float4 _2894 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7874, float3(0.0), isnan(_7874)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7874, float3(0.0), isnan(_7874)), level(0.0)).xyzw;
    float _2896 = _2894.x;
    float _2898 = _2894.y;
    float _2900 = _2894.z;
    float _2902 = _2894.w;
    float2 _7890 = float2(_2891, _2879);
    float3 _2906 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7890, float2(0.0), isnan(_7890)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7890, float2(0.0), isnan(_7890)), level(0.0)).xyz;
    float _2908 = _2906.x;
    float _2910 = _2906.y;
    float _2912 = _2906.z;
    float _2914 = in.m_79.x;
    float _2916 = in.m_79.y;
    float _2918 = in.m_79.z;
    bool _2920 = _1639 != 0.0;
    bool _2922 = isnan(_1639);
    bool _2924 = _2920 || _2922;
    bool _2926 = isnan(0.0);
    bool _2928 = _2924 || _2926;
    float _2930 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2932 = _2785 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1481;
    out.m_75.y = _1485;
    out.m_75.z = _1497;
    out.m_75.w = _1499;
    bool _2934 = _1637 == 0.0;
    bool _2936 = !_2928;
    bool _2938 = _2934 && _2936;
    float _2940 = _1659 * _1875;
    float _2942 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2932);
    float _2944 = _1659 * _1879;
    bool _2946 = _1641 == 0.0;
    bool _2948 = _2946 && _2938;
    float _2950 = exp2(_2930);
    out.m_73.x = _1487;
    out.m_73.y = _1489;
    out.m_73.z = _1495;
    out.m_73.w = _1483;
    float _2952 = -_1615;
    float _2954 = fma(_2952, _1855, _2940);
    float _2956 = -_1615;
    float _2958 = fma(_2956, _1853, _2944);
    float _2960 = fma(_1663, _1723, _2954);
    float _2962 = _2916;
    float _2964 = _2918;
    float _2966 = _2914;
    if (!_2948)
    {
        float _2968 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2916);
        _2962 = _2968;
    }
    float _2970 = _2962;
    if (!_2948)
    {
        float _2972 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2918);
        _2964 = _2972;
    }
    float _2974 = _2964;
    float _2976 = _1659 * _1871;
    float _2978 = _1633 * _1875;
    if (!_2948)
    {
        float _2980 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2914);
        _2966 = _2980;
    }
    float _2982 = _2966;
    float _2984 = _1633 * _1871;
    float _2986 = -_1615;
    float _2988 = fma(_2986, _1857, _2976);
    float _2990 = fma(_1647, _1855, _2978);
    float _2992 = _1633 * _1879;
    float _2994 = _1673 * _1875;
    float _2996 = fma(_1663, _1725, _2988);
    float _2998 = fma(_1669, _1723, _2990);
    float _3000 = fma(_1647, _1857, _2984);
    float _3002 = abs(_2439);
    float _3004 = log2(_3002);
    float _3006 = fma(_1647, _1853, _2992);
    float _3008 = fma(_1663, _1727, _2958);
    float _3010 = fma(_1653, _1855, _2994);
    float _3012 = _2960 * _2970;
    float _3014 = fma(_1669, _1725, _3000);
    float _3016 = fma(_1669, _1727, _3006);
    float _3018 = _2996 * _2970;
    float _3020 = _3008 * _2970;
    float _3022 = fma(_1635, _1723, _3010);
    float _3024 = fma(_2998, _2982, _3012);
    float _3026 = fma(_3014, _2982, _3018);
    float _3028 = fma(_3016, _2982, _3020);
    float _3030 = fma(_3022, _2974, _3024);
    float _3032 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3034 = in.m_67.x;
    bool _3036 = _2439 <= 8000.0;
    bool _3038 = isnan(_2439);
    bool _3040 = _3036 || _3038;
    bool _3042 = isnan(8000.0);
    bool _3044 = _3040 || _3042;
    float _3046 = float(_3044);
    float _3048 = _2837 * 0.5;
    float _3050 = -_2950;
    float _3052 = _3050 + 1.0;
    float _3054 = _1673 * _1871;
    float _3056 = exp2(_3032);
    float _3058 = _1673 * _1879;
    bool _3060 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3062 = isnan(_2581);
    bool _3064 = _3060 || _3062;
    bool _3066 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3068 = _3064 || _3066;
    float _3070 = fma(_1653, _1857, _3054);
    float _3072 = fma(_1653, _1853, _3058);
    float _3074 = fma(_1635, _1725, _3070);
    float _3076 = fma(_1635, _1727, _3072);
    float _3078 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2942);
    float _3080 = fma(_3074, _2974, _3026);
    float _3082 = fma(_3076, _2974, _3028);
    float _3084 = fma(_2787, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3078);
    float _3086 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3088 = precise::clamp(_3086, 0.0, 1.0);
    float _3090 = _2859 + _2837;
    out.m_81.x = _3030;
    out.m_81.y = _3080;
    out.m_81.z = _3082;
    float _3092 = fma(_3088, -2.0, 3.0);
    float _3094 = _3088 * _3088;
    out.gl_Position.x = _2859;
    out.gl_Position.y = _2867;
    out.gl_Position.z = _3084;
    out.gl_Position.w = _2837;
    float _3096 = _3090 * 0.5;
    float _3098 = _3094 * _3092;
    float _3100 = -_3098;
    float _3102 = _3100 + 1.0;
    float _3104 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3098);
    float _3106 = fma(_2867, -0.5, _3048);
    float _3108 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3110 = _3084 + _2837;
    float _3112 = _3046 * _3104;
    float _3114 = _3110 * 0.5;
    float _3116 = _3112 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3096;
    out.m_83.y = _3106;
    out.m_83.z = _3114;
    out.m_83.w = _2837;
    float _3118 = _2495 * _2557;
    float _3120 = _2837;
    float _3122 = _3114;
    float _3124 = _3106;
    float _3126 = _3118;
    if (!_3068)
    {
        _3120 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3128 = _3120;
    float _3130 = _3128;
    float _3132 = _3128;
    if (!_3068)
    {
        _3122 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3134 = _3122;
    float _3136 = _3118 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3138 = _3134;
    float _3140 = _3134;
    if (!_3068)
    {
        _3124 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3142 = _3124;
    float _3144 = _3142;
    float _3146 = _3142;
    if (!_3068)
    {
        _3126 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3148 = _3126;
    float _3150 = -_2871;
    float _3152 = _3150 + 1.0;
    float _3154 = _3152 * _3116;
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3156;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3162 = _3160 * _3034;
    float _3164 = _3108 * _2887;
    float _3166 = -_3108;
    float _3168 = _3166 + 1.0;
    float _3170 = _2902 * _3164;
    float _3172 = _2902 * _3168;
    float _3174 = _3168;
    float _3176 = _3162;
    float _3178 = _3148;
    float _3180 = _3148;
    if (!_3068)
    {
        _3174 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3182 = _3174;
    float _3184 = _2912 * _3164;
    float _3186 = fma(_2908, _3170, _2896);
    float _3188 = fma(_2910, _3170, _2898);
    float _3190 = _3162 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3192 = fma(_2902, _3184, _2900);
    float _3194 = _3182;
    float _3196 = _3182;
    if (!_3068)
    {
        _3176 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3198 = _3176;
    out.m_85.x = _3190;
    out.m_87.x = _3186;
    out.m_87.y = _3188;
    out.m_87.z = _3192;
    out.m_87.w = _3172;
    bool _3200 = !_3068;
    float _3202 = _3198;
    float _3204 = _3198;
    if (!_3200)
    {
        bool _3206 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3208 = isnan(_2581);
        bool _3210 = _3206 || _3208;
        bool _3212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3214 = _3210 || _3212;
        if (!_3214)
        {
            float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3218 = _2581 + _3216;
            float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3222 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3220;
            float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3228 = 1.0 / _3222;
            float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3246 = _3218 * _3228;
            float _3248 = precise::clamp(_3246, 0.0, 1.0);
            float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3252 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3254 = fma(_3248, _3226, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3256 = fma(_3248, _3252, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3258 = fma(_3248, _3232, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3260 = fma(_3248, _3236, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3262 = fma(_3248, _3240, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3264 = fma(_3248, _3244, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3196 = _3258;
            _3146 = _3262;
            _3204 = _3254;
            _3140 = _3260;
            _3132 = _3256;
            _3180 = _3264;
            _3266 = true;
        }
        else
        {
            bool _3268 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3270 = isnan(_2581);
            bool _3272 = _3268 || _3270;
            bool _3274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3276 = _3272 || _3274;
            if (!_3276)
            {
                _3202 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3278 = _3202;
            _3204 = _3278;
            if (!_3276)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3280 = _3194;
            _3196 = _3280;
            if (!_3276)
            {
                _3130 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3282 = _3130;
            _3132 = _3282;
            if (!_3276)
            {
                _3138 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3284 = _3138;
            _3140 = _3284;
            if (!_3276)
            {
                _3144 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3286 = _3144;
            _3146 = _3286;
            if (!_3276)
            {
                _3178 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3288 = _3178;
            bool _3290 = !_3276;
            _3180 = _3288;
            if (!_3290)
            {
                bool _3292 = _2581 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3294 = isnan(_2581);
                bool _3296 = _3292 || _3294;
                bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3300 = _3296 || _3298;
                if (!_3300)
                {
                    float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3304 = _2581 + _3302;
                    float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3308 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3306;
                    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3314 = 1.0 / _3308;
                    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3322 = _3320 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3332 = _3304 * _3314;
                    float _3334 = precise::clamp(_3332, 0.0, 1.0);
                    float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3340 = fma(_3334, _3312, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3342 = fma(_3334, _3338, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3344 = fma(_3334, _3318, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3346 = fma(_3334, _3322, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3348 = fma(_3334, _3326, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3350 = fma(_3334, _3330, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3196 = _3344;
                    _3146 = _3348;
                    _3204 = _3340;
                    _3140 = _3346;
                    _3132 = _3342;
                    _3180 = _3350;
                    _3266 = true;
                }
                else
                {
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3146 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3204 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3140 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3132 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3180 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3266 = false;
    float _3352 = _3196;
    float _3354 = _3146;
    float _3356 = _3204;
    float _3358 = _3140;
    float _3360 = _3132;
    float _3362 = _3180;
    float _3364 = fma(_3080, -0.5, 0.5);
    float _3366 = precise::clamp(_3364, 0.0, 1.0);
    float _3368 = -_3352;
    float _3370 = _3368 + _3354;
    float _3372 = _3136 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3374 = -_3356;
    float _3376 = _3374 + _3358;
    float _3378 = fma(_3366, _3370, _3352);
    out.m_89.x = 0.0;
    float _3380 = -_3360;
    float _3382 = _3380 + _3362;
    float _3384 = fma(_3366, _3376, _3356);
    float _3386 = _3378 * 0.586610972881317138671875;
    out.m_51.x = _3372;
    bool _3388 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3390 = fma(_3366, _3382, _3360);
    float _3392 = fma(_3384, 0.298911988735198974609375, _3386);
    bool _3394 = _2495 > 0.0;
    bool _3396 = isnan(_2495);
    bool _3398 = _3394 || _3396;
    bool _3400 = isnan(0.0);
    bool _3402 = _3398 || _3400;
    float _3404 = fma(_3390, 0.114477999508380889892578125, _3392);
    bool _3406 = _2557 <= 0.0;
    bool _3408 = !_3402;
    bool _3410 = _3406 || _3408;
    float _3412 = -_3404;
    float _3414 = _3384 + _3412;
    float _3416 = -_3404;
    float _3418 = _3378 + _3416;
    float _3420 = -_3404;
    float _3422 = _3390 + _3420;
    float _3424 = fma(_3414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    float _3426 = fma(_3418, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    float _3428 = fma(_3422, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3404);
    bool _3430 = !_3388;
    if (!_3430)
    {
        float _3432 = -_2423;
        float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3436 = -_2425;
        float _3438 = _3436 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3440 = -_2427;
        float _3442 = _3440 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3444 = _3434 * _3434;
        float _3446 = fma(_3438, _3438, _3444);
        float _3448 = fma(_3442, _3442, _3446);
        float _3450 = sqrt(_3448);
        float _3452 = rsqrt(_3448);
        float _3454 = -_3450;
        float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3458 = _3456 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3460 = precise::clamp(_3458, 0.0, 1.0);
        float _3462 = _3438 * _3452;
        float _3464 = _3434 * _3452;
        float _3466 = abs(_3460);
        float _3468 = log2(_3466);
        float _3470 = _3442 * _3452;
        float _3472 = _3462 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3474 = _3080 * _3464;
        float _3476 = -_3464;
        float _3478 = -_3472;
        float _3480 = fma(_3476, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3478);
        float _3482 = fma(_3030, _3462, _3474);
        float _3484 = -_3470;
        float _3486 = fma(_3484, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3480);
        float _3488 = fma(_3082, _3470, _3482);
        float _3490 = precise::clamp(_3488, 0.0, 1.0);
        float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3494 = _3486 + _3492;
        float _3496 = _3468 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3498 = _3494 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3500 = precise::clamp(_3498, 0.0, 1.0);
        float _3502 = exp2(_3496);
        float _3504 = _3502 * _3500;
        float _3506 = _3490 * _3504;
        float _3508 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3510 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3512 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3508;
        out.m_89.y = _3510;
        out.m_89.z = _3512;
    }
    out.m_91.x = _3424;
    out.m_91.y = _3426;
    out.m_91.z = _3428;
    if (!_3410)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3514 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3514;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

