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
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_67 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1617 = false;
    bool _665 = false;
    bool _410 = false;
    bool _176 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2105 = as_type<float>(_114);
        out.gl_Position.z = _2105;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_152);
        out.gl_Position.z = _2174;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _156 = !_154;
    float _174;
    if (!_156)
    {
        float _158 = in.m_51.x;
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _164 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _166 = _164 * _160;
        float _168 = floor(_166);
        float _170 = -_168;
        float _172 = _166 + _170;
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = float(_98);
        float _180 = 1.0 / _178;
        float _182 = _132 * _180;
        _174 = _182;
    }
    _176 = false;
    float _184 = _174;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _184 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _184 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = 1.0 / _200;
    float _212 = in.m_51.x;
    bool _214 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _216 = 1.0 / _208;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _218;
    float _222 = 1.0 / _204;
    float _224 = _188 * _210;
    bool _226 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_184);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _238;
    float _242 = fma(_220, _224, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _244 = fma(_240, _224, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _246 = _192 * _216;
    bool _248 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_184);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_236;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    bool _266 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _268 = isnan(_184);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _196 * _222;
    bool _280 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _282 = isnan(_184);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = -_258;
    float _298 = _296 + 1.0;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = fma(_294, _224, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = -_290;
    float _308 = _306 + 1.0;
    float _310 = _290 * _298;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = fma(_302, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _318 = _276 * _308;
    float _320 = -_276;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = fma(_314, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _330 = _242 * _318;
    float _332 = _244 * _318;
    float _334 = _304 * _318;
    float _336 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _340 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _342 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _344 = _336 * _212;
    float _346 = fma(_316, _310, _338);
    float _348 = fma(_326, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = trunc(_344);
    int _356 = int(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _362;
    float _366 = fma(_328, _310, _340);
    float _368 = fma(_352, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _370 = fma(_360, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _374 = fma(_348, _310, _342);
    float _376 = fma(_368, _264, _346);
    float _378 = fma(_370, _264, _366);
    float _380 = fma(_372, _264, _374);
    float _382 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].x, _376);
    float _384 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].y, _378);
    float _386 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].z, _380);
    int _388 = _356 << 4;
    int _390 = _388 + 1712;
    bool _392 = !_214;
    float _408;
    if (!_392)
    {
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _396 = _212 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = true;
    }
    else
    {
        float _412 = float(_98);
        float _414 = 1.0 / _412;
        float _416 = _132 * _414;
        _408 = _416;
    }
    _410 = false;
    float _418 = _408;
    uint _421 = uint(int(uint(_390) >> uint(2)));
    uint _423 = uint(int(uint(int(_421)) >> uint(2)));
    int _425 = int(_421) & 3;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[int(_423)][_425];
    int _429 = int(_421) + 1;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    int _433 = _429 & 3;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[int(_431)][_433];
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    int _445 = _390 + 8;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    uint _449 = uint(int(uint(int(_447)) >> uint(2)));
    int _451 = int(_447) & 3;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[int(_449)][_451];
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _459 = 1.0 / _439;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _465 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _467 = isnan(_418);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _481 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_418);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    bool _493 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _495 = isnan(_418);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_475;
    float _507 = _505 + 1.0;
    float _509 = 1.0 / _457;
    bool _511 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _517 = _443 * _459;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _418 + _519;
    float _523 = 1.0 / _463;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _525;
    float _529 = fma(_517, _521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _531 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_418);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _479;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = _541 * _507;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _555 = -_503;
    float _557 = _555 + 1.0;
    float _559 = _491 * _547;
    float _561 = -_491;
    float _563 = _561 + 1.0;
    float _565 = _553 * _509;
    float _567 = _475 * _557;
    float _569 = _529 * _559;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _418 + _571;
    float _575 = _527 * _523;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _418 + _577;
    bool _581 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _583 = isnan(_418);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_565, _573, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _595 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _597 = fma(_575, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _599 = _515 * _543;
    float _601 = -_591;
    float _603 = _601 + 1.0;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _607 = _418 + _605;
    float _609 = fma(_593, _549, _595);
    float _611 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = _503 * _603;
    float _615 = fma(_599, _607, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _617 = fma(_597, _567, _609);
    float _619 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _621 = _453 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = fma(_615, _613, _617);
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = in.m_53.x;
    float _633 = in.m_53.y;
    float _635 = in.m_53.z;
    float _637 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[119].x, _625);
    float _639 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _623;
    out.m_55.y = _627;
    out.m_55.z = _629;
    out.m_55.w = _639;
    float _641 = _386 * _635;
    float _643 = _384 * _633;
    float _645 = _382 * _631;
    bool _647 = !_511;
    float _663;
    if (!_647)
    {
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _651 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        float _667 = float(_98);
        float _669 = 1.0 / _667;
        float _671 = _132 * _669;
        _663 = _671;
    }
    _665 = false;
    float _673 = _663;
    float _675 = in.m_51.w;
    float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _679 = in.m_44.x;
    float _681 = in.m_44.y;
    float _683 = in.m_44.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _687 = _685 != 0;
    float _689 = in.m_57.x;
    float _691 = in.m_57.y;
    float _693 = in.m_57.z;
    float _695 = in.m_59.x;
    float _697 = in.m_59.y;
    float _699 = in.m_59.z;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = in.m_61.y;
    float _711 = _212 * 2.0;
    float _713 = in.m_63.x;
    float _715 = in.m_63.y;
    float _717 = in.m_63.z;
    float _719 = floor(_711);
    float _721 = in.m_51.z;
    bool _723 = _675 > 0.5;
    float _725 = in.m_61.x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _727 = _681 * _691;
    float _729 = _681 * _697;
    float _731 = fma(_679, _695, _729);
    float _733 = -_709;
    float _735 = _733 + 1.0;
    float _737 = _681 * _715;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(_683, _699, _731);
    float _745 = _709;
    float _747 = _727;
    float _749 = _679;
    if (_687)
    {
        float _751 = _723 ? _735 : _709;
        _745 = _751;
    }
    float _753 = _745;
    float _755 = fma(_679, _713, _737);
    bool _757 = _721 > 0.5;
    bool _759 = _757 && _703;
    float _761 = 1.0 / _741;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _767 = fma(_683, _717, _755);
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _779 = _777 != 0;
    float _781 = fma(_679, _689, _727);
    float _783 = _721 * 2.0;
    if (_703)
    {
        _747 = _725;
    }
    float _785 = _747;
    float _787 = 1.0 / _765;
    float _789 = fma(_683, _693, _781);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _791;
    float _795 = in.m_51.y;
    float _797 = _785;
    if (_759)
    {
        float _799 = -_785;
        float _801 = _799 + 1.0;
        _797 = _801;
    }
    float _803 = _797;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _807 = _673 + _805;
    bool _809 = _719 > 0.0;
    float _811 = floor(_783);
    float _813 = _212 + _721;
    float _815 = _793 * _761;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _821 = _719 >= 0.0;
    bool _823 = isnan(_719);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.0);
    bool _829 = _825 || _827;
    float _831 = _813 + (-1.0);
    float _833 = _815;
    float _835 = _807;
    if (!_703)
    {
        _749 = _725;
    }
    float _837 = _749;
    float _839 = _677 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _843 = _819 * _787;
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _847 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _849 = isnan(_673);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_839, _753, -0.5);
    bool _861 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _863 = isnan(_673);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = _743 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _875 = _837;
    if (_703)
    {
        _875 = _803;
    }
    float _877 = _875;
    float _879 = -_857;
    float _881 = _879 + 1.0;
    int _883 = _829 ? 0 : 1;
    float _885 = _789 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _887 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _889 = isnan(_673);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _901 = _673 + _899;
    bool _903 = _811 > 0.0;
    float _905 = _871 * _881;
    bool _907 = _811 >= 0.0;
    bool _909 = isnan(_811);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = -_871;
    float _919 = _917 + 1.0;
    float _921 = fma(_815, _807, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _923 = fma(_843, _901, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_707)
    {
        _833 = _795;
    }
    float _925 = _833;
    float _927 = _897 * _919;
    float _929 = _841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = _925;
    if (!_707)
    {
        _835 = _925;
    }
    float _937 = _835;
    float _939 = fma(_929, _877, -0.5);
    float _941 = _937;
    if (_707)
    {
        _941 = _212;
    }
    float _943 = _941;
    float _945 = _921 * _927;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _949 = ~_883;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[131].x, _945);
    int _957 = _953;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_809)
    {
        int _961 = ~_883;
        int _963 = _961 + 1;
        _957 = _963;
    }
    int _965 = _957;
    float _967 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[83].z, _947);
    if (_707)
    {
        _935 = _795;
    }
    float _969 = _935;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _973 = _943 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _975 = _973;
    if (!_707)
    {
        _959 = _721;
    }
    float _977 = _959;
    float _979 = _977;
    if (_707)
    {
        _979 = _969;
    }
    float _981 = _979;
    float _983 = -_971;
    float _985 = fma(_973, 2.0, _983);
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_707)
    {
        _975 = _721;
    }
    float _989 = _975;
    int _991 = _915 ? 0 : 1;
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[83].w, _987);
    float _995 = fma(_923, _905, _955);
    float _997 = _989;
    if (_707)
    {
        _997 = _969;
    }
    float _999 = _997;
    float _1001 = _212 + _969;
    int _1003 = ~_991;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1011 = _1007;
    if (!_903)
    {
        int _1013 = ~_991;
        int _1015 = _1013 + 1;
        _1011 = _1015;
    }
    int _1017 = _1011;
    float _1019 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1021 = _969 * 2.0;
    float _1023 = _1001 + (-1.0);
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _873 + _1025;
    float _1029 = fma(_1019, -2.0, _1009);
    float _1031 = floor(_1021);
    float _1033 = _767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1035 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _967);
    float _1037 = -_132;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[81].x, _985);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _885 + _1043;
    float _1047 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1049 = fma(_1035, _939, _1039);
    float _1051 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1053 = log2(_1051);
    float _1055 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1029);
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1033 + _1057;
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1047);
    bool _1063 = !_771;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _993);
    float _1069 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[133].x, _995);
    float _1071 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1061);
    int _1073 = abs(_1065);
    float _1075 = _1027 * _1027;
    bool _1077 = _1031 > 0.0;
    float _1079 = -_1055;
    float _1081 = fma(_1067, _859, _1079);
    bool _1083 = _1031 >= 0.0;
    bool _1085 = isnan(_1031);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = fma(_1045, _1045, _1075);
    bool _1095 = _1071 >= 0.0;
    float _1097 = _1049 + 0.5;
    float _1099 = _1053 * _132;
    float _1101 = float(_1073);
    float _1103 = fma(_1059, _1059, _1093);
    float _1105 = float(_1017);
    float _1107 = exp2(_1099);
    float _1109 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1111 = _1081 + 0.5;
    float _1113 = _1101 * _1105;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1117 = 1.0 + _1115;
    bool _1119 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1127 = _1123 || _1125;
    out.m_67.w = _1109;
    float _1129 = rsqrt(_1103);
    float _1131 = as_type<float>(_1017);
    if (_1095)
    {
        _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1133 = _1131;
    float _1135 = in.m_69.x;
    float _1137 = in.m_69.y;
    float _1139 = in.m_69.z;
    bool _1141 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1143 = isnan(1.0);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1149 = _1145 || _1147;
    int _1151 = as_type<int>(_1133);
    if (_1095)
    {
        float _1153 = _1133 * 5.0;
        _1151 = as_type<int>(_1153);
    }
    int _1155 = _1151;
    out.m_71.z = _1097;
    out.m_71.w = _1111;
    float _1157 = 1.0 / _1117;
    float _1159 = -_1107;
    float _1161 = _1159 + 1.0;
    bool _1163 = !_775;
    int _1165 = _1163 ? 0 : 1;
    if (_1095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3770 = as_type<float>(_1155);
        out.gl_Position.z = _3770;
    }
    bool _1167 = !_779;
    int _1169 = _1167 ? 0 : 1;
    float _1171 = _1127 ? _1161 : 0.0;
    if (_1095)
    {
        out.m_47.x = 0.0;
    }
    float _1173 = _1027 * _1129;
    int _1175 = _1091 ? 0 : 1;
    float _1177 = _1045 * _1129;
    if (_1095)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1179 = -_1173;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1183 = -_1177;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1187 = _1113 * (-2.0);
    if (_1149)
    {
        float _1189 = _1171 * _1157;
        _136 = _1189;
    }
    float _1191 = _136;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1181 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1185 + _1197;
    int _1201 = abs(_1169);
    float _1203 = _212 + (-0.5);
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1207 = fma(_1041, _1187, _1041);
    float _1209 = _1059 * _1129;
    int _1211 = ~_1175;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    float _1217 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1205);
    int _1219 = _1215;
    if (!_1077)
    {
        int _1221 = ~_1175;
        int _1223 = _1221 + 1;
        _1219 = _1223;
    }
    int _1225 = _1219;
    float _1227 = fma(_1187, _1135, _1135);
    float _1229 = -_1209;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1233 = float(_1225);
    float _1235 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1227);
    float _1237 = float(_1201);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1241 = _1231 + _1239;
    int _1243 = abs(_1165);
    float _1245 = fma(_1207, _1191, _1235);
    float _1247 = -_1173;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1251 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1217);
    float _1253 = _1237 * _1233;
    float _1255 = -_1177;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1045);
    float _1259 = float(_965);
    float _1261 = _1253 * (-2.0);
    bool _1263 = _1251 >= 0.0;
    float _1265 = _1245 * 0.15915493667125701904296875;
    float _1267 = float(_1243);
    float _1269 = _1249 * _1249;
    float _1271 = _721 + _969;
    float _1273 = _721 + (-0.5);
    float _1275 = fma(_1261, _1139, _1139);
    float _1277 = _1267 * _1259;
    float _1279 = fma(_1257, _1257, _1269);
    float _1281 = -_1209;
    float _1283 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1059);
    float _1285 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1275);
    float _1287 = _1265 * 6.283185482025146484375;
    float _1289 = sin(_1287);
    float _1291 = fma(_1283, _1283, _1279);
    float _1293 = _1269;
    if (_1263)
    {
        _1293 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1293;
    float _1297 = fma(_845, _1261, _845);
    float _1299 = _1277 * (-2.0);
    float _1301 = _1271 + (-1.0);
    float _1303 = _1265 * 6.283185482025146484375;
    float _1305 = cos(_1303);
    int _1307 = as_type<int>(_1295);
    if (_1263)
    {
        float _1309 = _1295 * 5.0;
        _1307 = as_type<int>(_1309);
    }
    int _1311 = _1307;
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1315 = fma(_1297, _1191, _1285);
    if (_1263)
    {
        out.m_47.x = 0.0;
    }
    float _1317 = fma(_1299, _1137, _1137);
    float _1319 = fma(_1313, _1299, _1313);
    float _1321 = _969 + (-0.5);
    float _1323 = sqrt(_1291);
    if (_1263)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4035 = as_type<float>(_1311);
        out.gl_Position.z = _4035;
    }
    float _1325 = _1315 * 0.15915493667125701904296875;
    float _1327 = _1305;
    if (_1263)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1329 = in.m_73.x;
    float _1331 = in.m_73.y;
    float _1333 = in.m_73.z;
    float _1335 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1317);
    float _1337 = _1325 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1343 = _1129 * _1323;
    float _1345 = fma(_1319, _1191, _1335);
    float _1347 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1349 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1351 = _1343 * _1341;
    float _1353 = _1345 * 0.15915493667125701904296875;
    float _1355 = _1325 * 6.283185482025146484375;
    float _1357 = cos(_1355);
    float _1359 = _1343 * _1347;
    float _1361 = _1343 * _1349;
    float _1363 = _1353 * 6.283185482025146484375;
    float _1365 = sin(_1363);
    float _1367 = _1289 * _1339;
    float _1369 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1331);
    float _1371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1329);
    float _1373 = _1353 * 6.283185482025146484375;
    float _1375 = cos(_1373);
    float _1377 = _1305 * _1357;
    float _1379 = _1305 * _1339;
    float _1381 = _1289 * _1357;
    float _1383 = _1359 * _1369;
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1333);
    float _1387 = _1361 * _1371;
    float _1389 = fma(_1365, _1367, _1377);
    float _1391 = -_1379;
    float _1393 = fma(_1365, _1381, _1391);
    float _1395 = -_1381;
    float _1397 = fma(_1365, _1379, _1395);
    float _1399 = _1351 * _1385;
    float _1401 = _1389 * _1383;
    float _1403 = _1393 * _1383;
    float _1405 = fma(_1365, _1377, _1367);
    float _1407 = _1375 * _1387;
    float _1409 = _1289 * _1375;
    float _1411 = _1305 * _1375;
    float _1413 = fma(_1339, _1407, _1401);
    float _1415 = fma(_1357, _1407, _1403);
    float _1417 = _1409 * _1383;
    float _1419 = fma(_1397, _1399, _1413);
    float _1421 = fma(_1405, _1399, _1415);
    float _1423 = -_1365;
    float _1425 = fma(_1423, _1387, _1417);
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1431 = fma(_1411, _1399, _1425);
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1435 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1427);
    float _1437 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1429);
    float _1439 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1433);
    float _1441 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1435);
    float _1443 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1437);
    float _1445 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1439);
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1449 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1451 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1453 = _885 + _1447;
    float _1455 = _1033 + _1449;
    float _1457 = _873 + _1451;
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1453 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1455 + _1463;
    float _1467 = _1461 * _1461;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1449;
    float _1479 = _1451;
    float _1481 = _1445;
    float _1483 = _1467;
    float _1485 = _1469;
    if (!_1475)
    {
        _1477 = _1453;
    }
    float _1487 = _1477;
    float _1489 = _1487;
    if (!_1475)
    {
        _1479 = _1455;
    }
    float _1491 = _1479;
    float _1493 = _1491;
    if (!_1475)
    {
        _1481 = _1457;
    }
    float _1495 = _1481;
    bool _1497 = !_1475;
    float _1499 = _1495;
    if (!_1497)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1505 = _1473 + _1503;
        float _1507 = rsqrt(_1471);
        float _1509 = _1505 * _1501;
        float _1511 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1509 * 0.15915493667125701904296875;
        float _1515 = _1513 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = fma(_1517, _1511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1525 = _1507 * _1523;
        float _1527 = _1521 + (-1.0);
        float _1529 = fma(_1461, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1531 = fma(_1465, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1533 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1537 = _1529 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1541 = _1531 + _1539;
        float _1543 = fma(_1457, _1521, _1533);
        float _1545 = _1537 * _1537;
        float _1547 = _1541 * _1541;
        _1499 = _1543;
        _1483 = _1545;
        _1485 = _1547;
        _1489 = _1529;
        _1493 = _1531;
    }
    float _1549 = _1499;
    float _1551 = _1483;
    float _1553 = _1485;
    float _1555 = _1489;
    float _1557 = _1493;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1561 = _1549 + _1559;
    float _1563 = fma(_1561, _1561, _1551);
    float _1565 = _1563 + _1553;
    float _1567 = sqrt(_1565);
    bool _1569 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1571 = isnan(_1567);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1577 = _1573 || _1575;
    float _1579 = _1551;
    float _1581 = _1567;
    if (!_1577)
    {
        _1579 = 1.0;
    }
    float _1583 = _1579;
    bool _1585 = !_1577;
    float _1587 = _1583;
    if (!_1585)
    {
        bool _1589 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1591 = isnan(_1567);
        bool _1593 = _1589 || _1591;
        bool _1595 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1597 = _1593 || _1595;
        if (!_1597)
        {
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1601 = _1567 + _1599;
            float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1605 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1603;
            float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1611 = 1.0 / _1605;
            float _1613 = _1601 * _1611;
            float _1615 = fma(_1613, _1609, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1587 = _1615;
            _1617 = true;
        }
        else
        {
            bool _1619 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1621 = isnan(_1567);
            bool _1623 = _1619 || _1621;
            bool _1625 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1627 = _1623 || _1625;
            if (!_1627)
            {
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1631 = _1567 + _1629;
                float _1633 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1635 = _1633 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1639 = _1637 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1641 = 1.0 / _1635;
                float _1643 = _1631 * _1641;
                float _1645 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1587 = _1645;
                _1617 = true;
            }
            else
            {
                _1587 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1617 = false;
    float _1647 = _1587;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1651 = _1549 + _1649;
    float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1655 = _1555 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1557 + _1657;
    float _1661 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1663 = fma(_1655, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1665 = fma(_1659, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1667 = -_1173;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1661);
    float _1671 = -_1177;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1663);
    float _1675 = -_1209;
    float _1677 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1665);
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1669 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1673 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1677 + _1687;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = rsqrt(_1695);
    float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1701 = _1685 * _1699;
    float _1703 = _1689 * _1699;
    float _1705 = _1701 * _1701;
    float _1707 = _1703 * _1703;
    float _1709 = _1705 + _1707;
    float _1711 = sqrt(_1709);
    bool _1713 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = _1711 + _1715;
    float _1719 = _1697;
    float _1721 = _1709;
    float _1723 = _1717;
    float _1725 = _1681;
    float _1727 = _1701;
    if (_1713)
    {
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1729;
    }
    float _1731 = _1719;
    if (_1713)
    {
        float _1733 = rsqrt(_1709);
        _1721 = _1733;
    }
    float _1735 = _1721;
    if (_1713)
    {
        float _1737 = _1717 * _1731;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1581 = _1741;
    }
    float _1743 = _1581;
    float _1745 = _1731;
    if (_1713)
    {
        float _1747 = _1743 * 6.283185482025146484375;
        float _1749 = sin(_1747);
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1755 = precise::max(0.0, _1753);
    float _1757 = _1689;
    float _1759 = _1755;
    if (_1713)
    {
        float _1761 = _1743 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = -_1699;
    float _1769 = -_1755;
    float _1771 = fma(_1681, _1767, _1769);
    float _1773 = _1771;
    if (_1713)
    {
        float _1775 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1775;
    }
    float _1777 = _1759;
    float _1779 = _1751;
    float _1781 = _1777;
    if (_1713)
    {
        float _1783 = fma(_1751, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    if (_1713)
    {
        float _1789 = _1765 + (-1.0);
        _1781 = _1789;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    if (_1713)
    {
        float _1795 = _1735 * _1785;
        _1327 = _1795;
    }
    float _1797 = _1327;
    if (!_1713)
    {
        _1787 = _1703;
    }
    float _1799 = _1787;
    float _1801 = sqrt(_1695);
    float _1803 = _1799;
    if (_1713)
    {
        float _1805 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1805;
    }
    float _1807 = _1725;
    float _1809 = _1807;
    if (_1713)
    {
        float _1811 = _1701 * _1797;
        _1727 = _1811;
    }
    float _1813 = _1727;
    if (!_1713)
    {
        _1793 = _1705;
    }
    float _1815 = _1793;
    float _1817 = _1815;
    if (_1713)
    {
        float _1819 = _1703 * _1797;
        _1803 = _1819;
    }
    float _1821 = _1803;
    if (_1713)
    {
        float _1823 = fma(_1771, _1765, _1807);
        _1773 = _1823;
    }
    float _1825 = _1773;
    if (_1713)
    {
        float _1827 = _1813 * _1813;
        _1817 = _1827;
    }
    float _1829 = _1817;
    if (!_1713)
    {
        _1809 = _1707;
    }
    float _1831 = _1809;
    float _1833 = _1831;
    if (_1713)
    {
        float _1835 = _1821 * _1821;
        _1833 = _1835;
    }
    float _1837 = _1833;
    float _1839 = fma(_1825, _1825, _1829);
    float _1841 = _1839 + _1837;
    float _1843 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1847 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1845);
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1853 = rsqrt(_1841);
    float _1855 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1843);
    float _1857 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1859 = -_1849;
    float _1861 = _1859 + 1.0;
    float _1863 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1865 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1855);
    float _1867 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1857);
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1871 = abs(_1861);
    float _1873 = log2(_1871);
    float _1875 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1877 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1867);
    float _1879 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1863);
    float _1881 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1885 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1887 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1889 = _1853 * _1813;
    float _1891 = -_1883;
    float _1893 = fma(_1891, _1869, 1.0);
    float _1895 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _1897 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1899 = _1853 * _1825;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1903 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1905 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1897);
    float _1907 = _1853 * _1821;
    float _1909 = -_1901;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1909);
    float _1913 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1915 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _1917 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1919 = -_1907;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1911);
    float _1923 = log2(_1893);
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1915);
    float _1927 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1929 = fma(_1921, -0.5, 0.5);
    float _1931 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1933 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1927);
    float _1935 = fma(_1921, 0.5, 0.5);
    float _1937 = exp2(_1917);
    float _1939 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1931);
    float _1941 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1933);
    float _1943 = _1899 + 1.0;
    float _1945 = 1.0 / _1925;
    float _1947 = fma(_1935, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1949 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1939);
    float _1951 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1941);
    float _1953 = fma(_1935, _1947, -0.212114393711090087890625);
    float _1955 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1957 = _1923 * 0.693147182464599609375;
    float _1959 = sqrt(_1929);
    float _1961 = -_1899;
    float _1963 = fma(_1937, _1943, _1961);
    float _1965 = fma(_1935, _1953, 1.570728778839111328125);
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1969 = fma(_1963, 0.5, 0.5);
    float _1971 = _1951 * _1945;
    float _1973 = _1955 * _1945;
    float _1975 = fma(_1971, 0.5, 0.5);
    float _1977 = fma(_1973, -0.5, 0.5);
    float _1979 = _1959 * 0.636619746685028076171875;
    float3 _5115 = float3(_1975, _1977, _1967);
    float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5115, float3(0.0), isnan(_5115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5115, float3(0.0), isnan(_5115)), level(0.0)).x;
    float3 _5126 = float3(_1975, _1977, _1967);
    float4 _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5126, float3(0.0), isnan(_5126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5126, float3(0.0), isnan(_5126)), level(0.0)).xyzw;
    float _1986 = _1984.x;
    float _1988 = _1984.y;
    float _1990 = _1984.z;
    float _1992 = _1984.w;
    float _1994 = -_1965;
    float _1996 = fma(_1979, _1994, 1.0);
    float2 _5148 = float2(_1996, _1969);
    float3 _2000 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5148, float2(0.0), isnan(_5148)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5148, float2(0.0), isnan(_5148)), level(0.0)).xyz;
    float _2002 = _2000.x;
    float _2004 = _2000.y;
    float _2006 = _2000.z;
    float _2008 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2010 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2012 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2014 = exp2(_2008);
    float _2016 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2012);
    float _2018 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    float _2020 = _2018 + _1925;
    out.gl_Position.x = _1951;
    out.gl_Position.y = _1955;
    out.gl_Position.z = _2018;
    out.gl_Position.w = _1925;
    float _2022 = _2020 * 0.5;
    float _2024 = -_2014;
    float _2026 = _2024 + 1.0;
    float _2028 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2022;
    out.m_75.w = _1925;
    float _2030 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.w = _2030;
    float _2032 = _2028 * _1981;
    float _2034 = -_2028;
    float _2036 = _2034 + 1.0;
    float _2038 = _1992 * _2032;
    float _2040 = _1992 * _2036;
    float _2042 = _2006 * _2032;
    float _2044 = fma(_2002, _2038, _1986);
    float _2046 = fma(_2004, _2038, _1988);
    float _2048 = fma(_1992, _2042, _1990);
    out.m_79.x = _2044;
    out.m_79.y = _2046;
    out.m_79.z = _2048;
    out.m_79.w = _2040;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1617 = false;
    bool _665 = false;
    bool _410 = false;
    bool _176 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2105 = as_type<float>(_114);
        out.gl_Position.z = _2105;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_152);
        out.gl_Position.z = _2174;
    }
    if (_146)
    {
        return out;
    }
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _156 = !_154;
    float _174;
    if (!_156)
    {
        float _158 = in.m_51.x;
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _164 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _166 = _164 * _160;
        float _168 = floor(_166);
        float _170 = -_168;
        float _172 = _166 + _170;
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = float(_98);
        float _180 = 1.0 / _178;
        float _182 = _132 * _180;
        _174 = _182;
    }
    _176 = false;
    float _184 = _174;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _184 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _184 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = 1.0 / _200;
    float _212 = in.m_51.x;
    bool _214 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _216 = 1.0 / _208;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _218;
    float _222 = 1.0 / _204;
    float _224 = _188 * _210;
    bool _226 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_184);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _238;
    float _242 = fma(_220, _224, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _244 = fma(_240, _224, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _246 = _192 * _216;
    bool _248 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_184);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_236;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    bool _266 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _268 = isnan(_184);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _196 * _222;
    bool _280 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _282 = isnan(_184);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = -_258;
    float _298 = _296 + 1.0;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = fma(_294, _224, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = -_290;
    float _308 = _306 + 1.0;
    float _310 = _290 * _298;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = fma(_302, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _318 = _276 * _308;
    float _320 = -_276;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = fma(_314, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _330 = _242 * _318;
    float _332 = _244 * _318;
    float _334 = _304 * _318;
    float _336 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _340 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _342 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _344 = _336 * _212;
    float _346 = fma(_316, _310, _338);
    float _348 = fma(_326, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = trunc(_344);
    int _356 = int(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _362;
    float _366 = fma(_328, _310, _340);
    float _368 = fma(_352, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _370 = fma(_360, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _374 = fma(_348, _310, _342);
    float _376 = fma(_368, _264, _346);
    float _378 = fma(_370, _264, _366);
    float _380 = fma(_372, _264, _374);
    float _382 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].x, _376);
    float _384 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].y, _378);
    float _386 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].z, _380);
    int _388 = _356 << 4;
    int _390 = _388 + 1712;
    bool _392 = !_214;
    float _408;
    if (!_392)
    {
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _396 = _212 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = true;
    }
    else
    {
        float _412 = float(_98);
        float _414 = 1.0 / _412;
        float _416 = _132 * _414;
        _408 = _416;
    }
    _410 = false;
    float _418 = _408;
    uint _421 = uint(int(uint(_390) >> uint(2)));
    uint _423 = uint(int(uint(int(_421)) >> uint(2)));
    int _425 = int(_421) & 3;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[int(_423)][_425];
    int _429 = int(_421) + 1;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    int _433 = _429 & 3;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[int(_431)][_433];
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    int _445 = _390 + 8;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    uint _449 = uint(int(uint(int(_447)) >> uint(2)));
    int _451 = int(_447) & 3;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[int(_449)][_451];
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _459 = 1.0 / _439;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _465 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _467 = isnan(_418);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _481 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_418);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    bool _493 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _495 = isnan(_418);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_475;
    float _507 = _505 + 1.0;
    float _509 = 1.0 / _457;
    bool _511 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _517 = _443 * _459;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _418 + _519;
    float _523 = 1.0 / _463;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _525;
    float _529 = fma(_517, _521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _531 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_418);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _479;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = _541 * _507;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _555 = -_503;
    float _557 = _555 + 1.0;
    float _559 = _491 * _547;
    float _561 = -_491;
    float _563 = _561 + 1.0;
    float _565 = _553 * _509;
    float _567 = _475 * _557;
    float _569 = _529 * _559;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _418 + _571;
    float _575 = _527 * _523;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _418 + _577;
    bool _581 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _583 = isnan(_418);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_565, _573, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _595 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _597 = fma(_575, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _599 = _515 * _543;
    float _601 = -_591;
    float _603 = _601 + 1.0;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _607 = _418 + _605;
    float _609 = fma(_593, _549, _595);
    float _611 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = _503 * _603;
    float _615 = fma(_599, _607, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _617 = fma(_597, _567, _609);
    float _619 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _621 = _453 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = fma(_615, _613, _617);
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = in.m_53.x;
    float _633 = in.m_53.y;
    float _635 = in.m_53.z;
    float _637 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[119].x, _625);
    float _639 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _623;
    out.m_55.y = _627;
    out.m_55.z = _629;
    out.m_55.w = _639;
    float _641 = _386 * _635;
    float _643 = _384 * _633;
    float _645 = _382 * _631;
    bool _647 = !_511;
    float _663;
    if (!_647)
    {
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _651 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        float _667 = float(_98);
        float _669 = 1.0 / _667;
        float _671 = _132 * _669;
        _663 = _671;
    }
    _665 = false;
    float _673 = _663;
    float _675 = in.m_51.w;
    float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _679 = in.m_44.x;
    float _681 = in.m_44.y;
    float _683 = in.m_44.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _687 = _685 != 0;
    float _689 = in.m_57.x;
    float _691 = in.m_57.y;
    float _693 = in.m_57.z;
    float _695 = in.m_59.x;
    float _697 = in.m_59.y;
    float _699 = in.m_59.z;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = in.m_61.y;
    float _711 = _212 * 2.0;
    float _713 = in.m_63.x;
    float _715 = in.m_63.y;
    float _717 = in.m_63.z;
    float _719 = floor(_711);
    float _721 = in.m_51.z;
    bool _723 = _675 > 0.5;
    float _725 = in.m_61.x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _727 = _681 * _691;
    float _729 = _681 * _697;
    float _731 = fma(_679, _695, _729);
    float _733 = -_709;
    float _735 = _733 + 1.0;
    float _737 = _681 * _715;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(_683, _699, _731);
    float _745 = _709;
    float _747 = _727;
    float _749 = _679;
    if (_687)
    {
        float _751 = _723 ? _735 : _709;
        _745 = _751;
    }
    float _753 = _745;
    float _755 = fma(_679, _713, _737);
    bool _757 = _721 > 0.5;
    bool _759 = _757 && _703;
    float _761 = 1.0 / _741;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _767 = fma(_683, _717, _755);
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _779 = _777 != 0;
    float _781 = fma(_679, _689, _727);
    float _783 = _721 * 2.0;
    if (_703)
    {
        _747 = _725;
    }
    float _785 = _747;
    float _787 = 1.0 / _765;
    float _789 = fma(_683, _693, _781);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _791;
    float _795 = in.m_51.y;
    float _797 = _785;
    if (_759)
    {
        float _799 = -_785;
        float _801 = _799 + 1.0;
        _797 = _801;
    }
    float _803 = _797;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _807 = _673 + _805;
    bool _809 = _719 > 0.0;
    float _811 = floor(_783);
    float _813 = _212 + _721;
    float _815 = _793 * _761;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _821 = _719 >= 0.0;
    bool _823 = isnan(_719);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.0);
    bool _829 = _825 || _827;
    float _831 = _813 + (-1.0);
    float _833 = _815;
    float _835 = _807;
    if (!_703)
    {
        _749 = _725;
    }
    float _837 = _749;
    float _839 = _677 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _843 = _819 * _787;
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _847 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _849 = isnan(_673);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_839, _753, -0.5);
    bool _861 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _863 = isnan(_673);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = _743 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _875 = _837;
    if (_703)
    {
        _875 = _803;
    }
    float _877 = _875;
    float _879 = -_857;
    float _881 = _879 + 1.0;
    int _883 = _829 ? 0 : 1;
    float _885 = _789 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _887 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _889 = isnan(_673);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _901 = _673 + _899;
    bool _903 = _811 > 0.0;
    float _905 = _871 * _881;
    bool _907 = _811 >= 0.0;
    bool _909 = isnan(_811);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = -_871;
    float _919 = _917 + 1.0;
    float _921 = fma(_815, _807, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _923 = fma(_843, _901, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_707)
    {
        _833 = _795;
    }
    float _925 = _833;
    float _927 = _897 * _919;
    float _929 = _841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = _925;
    if (!_707)
    {
        _835 = _925;
    }
    float _937 = _835;
    float _939 = fma(_929, _877, -0.5);
    float _941 = _937;
    if (_707)
    {
        _941 = _212;
    }
    float _943 = _941;
    float _945 = _921 * _927;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _949 = ~_883;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[131].x, _945);
    int _957 = _953;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_809)
    {
        int _961 = ~_883;
        int _963 = _961 + 1;
        _957 = _963;
    }
    int _965 = _957;
    float _967 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[83].z, _947);
    if (_707)
    {
        _935 = _795;
    }
    float _969 = _935;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _973 = _943 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _975 = _973;
    if (!_707)
    {
        _959 = _721;
    }
    float _977 = _959;
    float _979 = _977;
    if (_707)
    {
        _979 = _969;
    }
    float _981 = _979;
    float _983 = -_971;
    float _985 = fma(_973, 2.0, _983);
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_707)
    {
        _975 = _721;
    }
    float _989 = _975;
    int _991 = _915 ? 0 : 1;
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[83].w, _987);
    float _995 = fma(_923, _905, _955);
    float _997 = _989;
    if (_707)
    {
        _997 = _969;
    }
    float _999 = _997;
    float _1001 = _212 + _969;
    int _1003 = ~_991;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1011 = _1007;
    if (!_903)
    {
        int _1013 = ~_991;
        int _1015 = _1013 + 1;
        _1011 = _1015;
    }
    int _1017 = _1011;
    float _1019 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1021 = _969 * 2.0;
    float _1023 = _1001 + (-1.0);
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _873 + _1025;
    float _1029 = fma(_1019, -2.0, _1009);
    float _1031 = floor(_1021);
    float _1033 = _767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1035 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _967);
    float _1037 = -_132;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[81].x, _985);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _885 + _1043;
    float _1047 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1049 = fma(_1035, _939, _1039);
    float _1051 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1053 = log2(_1051);
    float _1055 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1029);
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1033 + _1057;
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1047);
    bool _1063 = !_771;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _993);
    float _1069 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[133].x, _995);
    float _1071 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1061);
    int _1073 = abs(_1065);
    float _1075 = _1027 * _1027;
    bool _1077 = _1031 > 0.0;
    float _1079 = -_1055;
    float _1081 = fma(_1067, _859, _1079);
    bool _1083 = _1031 >= 0.0;
    bool _1085 = isnan(_1031);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = fma(_1045, _1045, _1075);
    bool _1095 = _1071 >= 0.0;
    float _1097 = _1049 + 0.5;
    float _1099 = _1053 * _132;
    float _1101 = float(_1073);
    float _1103 = fma(_1059, _1059, _1093);
    float _1105 = float(_1017);
    float _1107 = exp2(_1099);
    float _1109 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1111 = _1081 + 0.5;
    float _1113 = _1101 * _1105;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1117 = 1.0 + _1115;
    bool _1119 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1127 = _1123 || _1125;
    out.m_67.w = _1109;
    float _1129 = rsqrt(_1103);
    float _1131 = as_type<float>(_1017);
    if (_1095)
    {
        _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1133 = _1131;
    float _1135 = in.m_69.x;
    float _1137 = in.m_69.y;
    float _1139 = in.m_69.z;
    bool _1141 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1143 = isnan(1.0);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1149 = _1145 || _1147;
    int _1151 = as_type<int>(_1133);
    if (_1095)
    {
        float _1153 = _1133 * 5.0;
        _1151 = as_type<int>(_1153);
    }
    int _1155 = _1151;
    out.m_71.z = _1097;
    out.m_71.w = _1111;
    float _1157 = 1.0 / _1117;
    float _1159 = -_1107;
    float _1161 = _1159 + 1.0;
    bool _1163 = !_775;
    int _1165 = _1163 ? 0 : 1;
    if (_1095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3770 = as_type<float>(_1155);
        out.gl_Position.z = _3770;
    }
    bool _1167 = !_779;
    int _1169 = _1167 ? 0 : 1;
    float _1171 = _1127 ? _1161 : 0.0;
    if (_1095)
    {
        out.m_47.x = 0.0;
    }
    float _1173 = _1027 * _1129;
    int _1175 = _1091 ? 0 : 1;
    float _1177 = _1045 * _1129;
    if (_1095)
    {
        return out;
    }
    float _1179 = -_1173;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1183 = -_1177;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1187 = _1113 * (-2.0);
    if (_1149)
    {
        float _1189 = _1171 * _1157;
        _136 = _1189;
    }
    float _1191 = _136;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1181 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1185 + _1197;
    int _1201 = abs(_1169);
    float _1203 = _212 + (-0.5);
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1207 = fma(_1041, _1187, _1041);
    float _1209 = _1059 * _1129;
    int _1211 = ~_1175;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    float _1217 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1205);
    int _1219 = _1215;
    if (!_1077)
    {
        int _1221 = ~_1175;
        int _1223 = _1221 + 1;
        _1219 = _1223;
    }
    int _1225 = _1219;
    float _1227 = fma(_1187, _1135, _1135);
    float _1229 = -_1209;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1233 = float(_1225);
    float _1235 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1227);
    float _1237 = float(_1201);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1241 = _1231 + _1239;
    int _1243 = abs(_1165);
    float _1245 = fma(_1207, _1191, _1235);
    float _1247 = -_1173;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1251 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1217);
    float _1253 = _1237 * _1233;
    float _1255 = -_1177;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1045);
    float _1259 = float(_965);
    float _1261 = _1253 * (-2.0);
    bool _1263 = _1251 >= 0.0;
    float _1265 = _1245 * 0.15915493667125701904296875;
    float _1267 = float(_1243);
    float _1269 = _1249 * _1249;
    float _1271 = _721 + _969;
    float _1273 = _721 + (-0.5);
    float _1275 = fma(_1261, _1139, _1139);
    float _1277 = _1267 * _1259;
    float _1279 = fma(_1257, _1257, _1269);
    float _1281 = -_1209;
    float _1283 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1059);
    float _1285 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1275);
    float _1287 = _1265 * 6.283185482025146484375;
    float _1289 = sin(_1287);
    float _1291 = fma(_1283, _1283, _1279);
    float _1293 = _1269;
    if (_1263)
    {
        _1293 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1293;
    float _1297 = fma(_845, _1261, _845);
    float _1299 = _1277 * (-2.0);
    float _1301 = _1271 + (-1.0);
    float _1303 = _1265 * 6.283185482025146484375;
    float _1305 = cos(_1303);
    int _1307 = as_type<int>(_1295);
    if (_1263)
    {
        float _1309 = _1295 * 5.0;
        _1307 = as_type<int>(_1309);
    }
    int _1311 = _1307;
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1315 = fma(_1297, _1191, _1285);
    if (_1263)
    {
        out.m_47.x = 0.0;
    }
    float _1317 = fma(_1299, _1137, _1137);
    float _1319 = fma(_1313, _1299, _1313);
    float _1321 = _969 + (-0.5);
    float _1323 = sqrt(_1291);
    if (_1263)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4035 = as_type<float>(_1311);
        out.gl_Position.z = _4035;
    }
    float _1325 = _1315 * 0.15915493667125701904296875;
    float _1327 = _1305;
    if (_1263)
    {
        return out;
    }
    float _1329 = in.m_73.x;
    float _1331 = in.m_73.y;
    float _1333 = in.m_73.z;
    float _1335 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1317);
    float _1337 = _1325 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1343 = _1129 * _1323;
    float _1345 = fma(_1319, _1191, _1335);
    float _1347 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1349 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1351 = _1343 * _1341;
    float _1353 = _1345 * 0.15915493667125701904296875;
    float _1355 = _1325 * 6.283185482025146484375;
    float _1357 = cos(_1355);
    float _1359 = _1343 * _1347;
    float _1361 = _1343 * _1349;
    float _1363 = _1353 * 6.283185482025146484375;
    float _1365 = sin(_1363);
    float _1367 = _1289 * _1339;
    float _1369 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1331);
    float _1371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1329);
    float _1373 = _1353 * 6.283185482025146484375;
    float _1375 = cos(_1373);
    float _1377 = _1305 * _1357;
    float _1379 = _1305 * _1339;
    float _1381 = _1289 * _1357;
    float _1383 = _1359 * _1369;
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1333);
    float _1387 = _1361 * _1371;
    float _1389 = fma(_1365, _1367, _1377);
    float _1391 = -_1379;
    float _1393 = fma(_1365, _1381, _1391);
    float _1395 = -_1381;
    float _1397 = fma(_1365, _1379, _1395);
    float _1399 = _1351 * _1385;
    float _1401 = _1389 * _1383;
    float _1403 = _1393 * _1383;
    float _1405 = fma(_1365, _1377, _1367);
    float _1407 = _1375 * _1387;
    float _1409 = _1289 * _1375;
    float _1411 = _1305 * _1375;
    float _1413 = fma(_1339, _1407, _1401);
    float _1415 = fma(_1357, _1407, _1403);
    float _1417 = _1409 * _1383;
    float _1419 = fma(_1397, _1399, _1413);
    float _1421 = fma(_1405, _1399, _1415);
    float _1423 = -_1365;
    float _1425 = fma(_1423, _1387, _1417);
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1431 = fma(_1411, _1399, _1425);
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1435 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1427);
    float _1437 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1429);
    float _1439 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1433);
    float _1441 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1435);
    float _1443 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1437);
    float _1445 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1439);
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1449 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1451 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1453 = _885 + _1447;
    float _1455 = _1033 + _1449;
    float _1457 = _873 + _1451;
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1453 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1455 + _1463;
    float _1467 = _1461 * _1461;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1449;
    float _1479 = _1451;
    float _1481 = _1445;
    float _1483 = _1467;
    float _1485 = _1469;
    if (!_1475)
    {
        _1477 = _1453;
    }
    float _1487 = _1477;
    float _1489 = _1487;
    if (!_1475)
    {
        _1479 = _1455;
    }
    float _1491 = _1479;
    float _1493 = _1491;
    if (!_1475)
    {
        _1481 = _1457;
    }
    float _1495 = _1481;
    bool _1497 = !_1475;
    float _1499 = _1495;
    if (!_1497)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1505 = _1473 + _1503;
        float _1507 = rsqrt(_1471);
        float _1509 = _1505 * _1501;
        float _1511 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1509 * 0.15915493667125701904296875;
        float _1515 = _1513 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = fma(_1517, _1511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1525 = _1507 * _1523;
        float _1527 = _1521 + (-1.0);
        float _1529 = fma(_1461, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1531 = fma(_1465, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1533 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1537 = _1529 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1541 = _1531 + _1539;
        float _1543 = fma(_1457, _1521, _1533);
        float _1545 = _1537 * _1537;
        float _1547 = _1541 * _1541;
        _1499 = _1543;
        _1483 = _1545;
        _1485 = _1547;
        _1489 = _1529;
        _1493 = _1531;
    }
    float _1549 = _1499;
    float _1551 = _1483;
    float _1553 = _1485;
    float _1555 = _1489;
    float _1557 = _1493;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1561 = _1549 + _1559;
    float _1563 = fma(_1561, _1561, _1551);
    float _1565 = _1563 + _1553;
    float _1567 = sqrt(_1565);
    bool _1569 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1571 = isnan(_1567);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1577 = _1573 || _1575;
    float _1579 = _1551;
    float _1581 = _1567;
    if (!_1577)
    {
        _1579 = 1.0;
    }
    float _1583 = _1579;
    bool _1585 = !_1577;
    float _1587 = _1583;
    if (!_1585)
    {
        bool _1589 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1591 = isnan(_1567);
        bool _1593 = _1589 || _1591;
        bool _1595 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1597 = _1593 || _1595;
        if (!_1597)
        {
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1601 = _1567 + _1599;
            float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1605 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1603;
            float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1611 = 1.0 / _1605;
            float _1613 = _1601 * _1611;
            float _1615 = fma(_1613, _1609, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1587 = _1615;
            _1617 = true;
        }
        else
        {
            bool _1619 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1621 = isnan(_1567);
            bool _1623 = _1619 || _1621;
            bool _1625 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1627 = _1623 || _1625;
            if (!_1627)
            {
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1631 = _1567 + _1629;
                float _1633 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1635 = _1633 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1639 = _1637 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1641 = 1.0 / _1635;
                float _1643 = _1631 * _1641;
                float _1645 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1587 = _1645;
                _1617 = true;
            }
            else
            {
                _1587 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1617 = false;
    float _1647 = _1587;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1651 = _1549 + _1649;
    float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1655 = _1555 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1557 + _1657;
    float _1661 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1663 = fma(_1655, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1665 = fma(_1659, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1667 = -_1173;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1661);
    float _1671 = -_1177;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1663);
    float _1675 = -_1209;
    float _1677 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1665);
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1669 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1673 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1677 + _1687;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = rsqrt(_1695);
    float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1701 = _1685 * _1699;
    float _1703 = _1689 * _1699;
    float _1705 = _1701 * _1701;
    float _1707 = _1703 * _1703;
    float _1709 = _1705 + _1707;
    float _1711 = sqrt(_1709);
    bool _1713 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = _1711 + _1715;
    float _1719 = _1697;
    float _1721 = _1709;
    float _1723 = _1717;
    float _1725 = _1681;
    float _1727 = _1701;
    if (_1713)
    {
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1729;
    }
    float _1731 = _1719;
    if (_1713)
    {
        float _1733 = rsqrt(_1709);
        _1721 = _1733;
    }
    float _1735 = _1721;
    if (_1713)
    {
        float _1737 = _1717 * _1731;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1581 = _1741;
    }
    float _1743 = _1581;
    float _1745 = _1731;
    if (_1713)
    {
        float _1747 = _1743 * 6.283185482025146484375;
        float _1749 = sin(_1747);
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1755 = precise::max(0.0, _1753);
    float _1757 = _1689;
    float _1759 = _1755;
    if (_1713)
    {
        float _1761 = _1743 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = -_1699;
    float _1769 = -_1755;
    float _1771 = fma(_1681, _1767, _1769);
    float _1773 = _1771;
    if (_1713)
    {
        float _1775 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1775;
    }
    float _1777 = _1759;
    float _1779 = _1751;
    float _1781 = _1777;
    if (_1713)
    {
        float _1783 = fma(_1751, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    if (_1713)
    {
        float _1789 = _1765 + (-1.0);
        _1781 = _1789;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    if (_1713)
    {
        float _1795 = _1735 * _1785;
        _1327 = _1795;
    }
    float _1797 = _1327;
    if (!_1713)
    {
        _1787 = _1703;
    }
    float _1799 = _1787;
    float _1801 = sqrt(_1695);
    float _1803 = _1799;
    if (_1713)
    {
        float _1805 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1805;
    }
    float _1807 = _1725;
    float _1809 = _1807;
    if (_1713)
    {
        float _1811 = _1701 * _1797;
        _1727 = _1811;
    }
    float _1813 = _1727;
    if (!_1713)
    {
        _1793 = _1705;
    }
    float _1815 = _1793;
    float _1817 = _1815;
    if (_1713)
    {
        float _1819 = _1703 * _1797;
        _1803 = _1819;
    }
    float _1821 = _1803;
    if (_1713)
    {
        float _1823 = fma(_1771, _1765, _1807);
        _1773 = _1823;
    }
    float _1825 = _1773;
    if (_1713)
    {
        float _1827 = _1813 * _1813;
        _1817 = _1827;
    }
    float _1829 = _1817;
    if (!_1713)
    {
        _1809 = _1707;
    }
    float _1831 = _1809;
    float _1833 = _1831;
    if (_1713)
    {
        float _1835 = _1821 * _1821;
        _1833 = _1835;
    }
    float _1837 = _1833;
    float _1839 = fma(_1825, _1825, _1829);
    float _1841 = _1839 + _1837;
    float _1843 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1847 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1845);
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1853 = rsqrt(_1841);
    float _1855 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1843);
    float _1857 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1859 = -_1849;
    float _1861 = _1859 + 1.0;
    float _1863 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1865 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1855);
    float _1867 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1857);
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1871 = abs(_1861);
    float _1873 = log2(_1871);
    float _1875 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1877 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1867);
    float _1879 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1863);
    float _1881 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1885 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1887 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1889 = _1853 * _1813;
    float _1891 = -_1883;
    float _1893 = fma(_1891, _1869, 1.0);
    float _1895 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _1897 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1899 = _1853 * _1825;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1903 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1905 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1897);
    float _1907 = _1853 * _1821;
    float _1909 = -_1901;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1909);
    float _1913 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1915 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _1917 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1919 = -_1907;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1911);
    float _1923 = log2(_1893);
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1915);
    float _1927 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1929 = fma(_1921, -0.5, 0.5);
    float _1931 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1933 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1927);
    float _1935 = fma(_1921, 0.5, 0.5);
    float _1937 = exp2(_1917);
    float _1939 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1931);
    float _1941 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1933);
    float _1943 = _1899 + 1.0;
    float _1945 = 1.0 / _1925;
    float _1947 = fma(_1935, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1949 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1939);
    float _1951 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1941);
    float _1953 = fma(_1935, _1947, -0.212114393711090087890625);
    float _1955 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1957 = _1923 * 0.693147182464599609375;
    float _1959 = sqrt(_1929);
    float _1961 = -_1899;
    float _1963 = fma(_1937, _1943, _1961);
    float _1965 = fma(_1935, _1953, 1.570728778839111328125);
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1969 = fma(_1963, 0.5, 0.5);
    float _1971 = _1951 * _1945;
    float _1973 = _1955 * _1945;
    float _1975 = fma(_1971, 0.5, 0.5);
    float _1977 = fma(_1973, -0.5, 0.5);
    float _1979 = _1959 * 0.636619746685028076171875;
    float3 _5115 = float3(_1975, _1977, _1967);
    float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5115, float3(0.0), isnan(_5115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5115, float3(0.0), isnan(_5115)), level(0.0)).x;
    float3 _5126 = float3(_1975, _1977, _1967);
    float4 _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5126, float3(0.0), isnan(_5126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5126, float3(0.0), isnan(_5126)), level(0.0)).xyzw;
    float _1986 = _1984.x;
    float _1988 = _1984.y;
    float _1990 = _1984.z;
    float _1992 = _1984.w;
    float _1994 = -_1965;
    float _1996 = fma(_1979, _1994, 1.0);
    float2 _5148 = float2(_1996, _1969);
    float3 _2000 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5148, float2(0.0), isnan(_5148)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5148, float2(0.0), isnan(_5148)), level(0.0)).xyz;
    float _2002 = _2000.x;
    float _2004 = _2000.y;
    float _2006 = _2000.z;
    float _2008 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2010 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2012 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2014 = exp2(_2008);
    float _2016 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2012);
    float _2018 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    float _2020 = _2018 + _1925;
    out.gl_Position.x = _1951;
    out.gl_Position.y = _1955;
    out.gl_Position.z = _2018;
    out.gl_Position.w = _1925;
    float _2022 = _2020 * 0.5;
    float _2024 = -_2014;
    float _2026 = _2024 + 1.0;
    float _2028 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2022;
    out.m_75.w = _1925;
    float _2030 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.w = _2030;
    float _2032 = _2028 * _1981;
    float _2034 = -_2028;
    float _2036 = _2034 + 1.0;
    float _2038 = _1992 * _2032;
    float _2040 = _1992 * _2036;
    float _2042 = _2006 * _2032;
    float _2044 = fma(_2002, _2038, _1986);
    float _2046 = fma(_2004, _2038, _1988);
    float _2048 = fma(_1992, _2042, _1990);
    out.m_79.x = _2044;
    out.m_79.y = _2046;
    out.m_79.z = _2048;
    out.m_79.w = _2040;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1617 = false;
    bool _665 = false;
    bool _410 = false;
    bool _176 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2105 = as_type<float>(_114);
        out.gl_Position.z = _2105;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_152);
        out.gl_Position.z = _2174;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _156 = !_154;
    float _174;
    if (!_156)
    {
        float _158 = in.m_51.x;
        float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _164 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _166 = _164 * _160;
        float _168 = floor(_166);
        float _170 = -_168;
        float _172 = _166 + _170;
        _174 = _172;
        _176 = true;
    }
    else
    {
        float _178 = float(_98);
        float _180 = 1.0 / _178;
        float _182 = _132 * _180;
        _174 = _182;
    }
    _176 = false;
    float _184 = _174;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _188 = _184 + _186;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _184 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = 1.0 / _200;
    float _212 = in.m_51.x;
    bool _214 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _216 = 1.0 / _208;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _218;
    float _222 = 1.0 / _204;
    float _224 = _188 * _210;
    bool _226 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_184);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _238;
    float _242 = fma(_220, _224, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _244 = fma(_240, _224, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _246 = _192 * _216;
    bool _248 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_184);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_236;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    bool _266 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _268 = isnan(_184);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _196 * _222;
    bool _280 = _184 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _282 = isnan(_184);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = -_258;
    float _298 = _296 + 1.0;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = fma(_294, _224, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _306 = -_290;
    float _308 = _306 + 1.0;
    float _310 = _290 * _298;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = fma(_302, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _318 = _276 * _308;
    float _320 = -_276;
    float _322 = _320 + 1.0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = fma(_314, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _330 = _242 * _318;
    float _332 = _244 * _318;
    float _334 = _304 * _318;
    float _336 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _340 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _342 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _344 = _336 * _212;
    float _346 = fma(_316, _310, _338);
    float _348 = fma(_326, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = trunc(_344);
    int _356 = int(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _362;
    float _366 = fma(_328, _310, _340);
    float _368 = fma(_352, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _370 = fma(_360, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _374 = fma(_348, _310, _342);
    float _376 = fma(_368, _264, _346);
    float _378 = fma(_370, _264, _366);
    float _380 = fma(_372, _264, _374);
    float _382 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].x, _376);
    float _384 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].y, _378);
    float _386 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].z, _380);
    int _388 = _356 << 4;
    int _390 = _388 + 1712;
    bool _392 = !_214;
    float _408;
    if (!_392)
    {
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _396 = _212 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = true;
    }
    else
    {
        float _412 = float(_98);
        float _414 = 1.0 / _412;
        float _416 = _132 * _414;
        _408 = _416;
    }
    _410 = false;
    float _418 = _408;
    uint _421 = uint(int(uint(_390) >> uint(2)));
    uint _423 = uint(int(uint(int(_421)) >> uint(2)));
    int _425 = int(_421) & 3;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[int(_423)][_425];
    int _429 = int(_421) + 1;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    int _433 = _429 & 3;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[int(_431)][_433];
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _441;
    int _445 = _390 + 8;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    uint _449 = uint(int(uint(int(_447)) >> uint(2)));
    int _451 = int(_447) & 3;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[int(_449)][_451];
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _459 = 1.0 / _439;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _465 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _467 = isnan(_418);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _481 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _483 = isnan(_418);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    bool _493 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _495 = isnan(_418);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_475;
    float _507 = _505 + 1.0;
    float _509 = 1.0 / _457;
    bool _511 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _517 = _443 * _459;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _521 = _418 + _519;
    float _523 = 1.0 / _463;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _525;
    float _529 = fma(_517, _521, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _531 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_418);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _479;
    float _545 = -_541;
    float _547 = _545 + 1.0;
    float _549 = _541 * _507;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _555 = -_503;
    float _557 = _555 + 1.0;
    float _559 = _491 * _547;
    float _561 = -_491;
    float _563 = _561 + 1.0;
    float _565 = _553 * _509;
    float _567 = _475 * _557;
    float _569 = _529 * _559;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _418 + _571;
    float _575 = _527 * _523;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _418 + _577;
    bool _581 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _583 = isnan(_418);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_565, _573, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _595 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _597 = fma(_575, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _599 = _515 * _543;
    float _601 = -_591;
    float _603 = _601 + 1.0;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _607 = _418 + _605;
    float _609 = fma(_593, _549, _595);
    float _611 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _613 = _503 * _603;
    float _615 = fma(_599, _607, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _617 = fma(_597, _567, _609);
    float _619 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _621 = _453 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = fma(_615, _613, _617);
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = in.m_53.x;
    float _633 = in.m_53.y;
    float _635 = in.m_53.z;
    float _637 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[119].x, _625);
    float _639 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _623;
    out.m_55.y = _627;
    out.m_55.z = _629;
    out.m_55.w = _639;
    float _641 = _386 * _635;
    float _643 = _384 * _633;
    float _645 = _382 * _631;
    bool _647 = !_511;
    float _663;
    if (!_647)
    {
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _651 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        float _667 = float(_98);
        float _669 = 1.0 / _667;
        float _671 = _132 * _669;
        _663 = _671;
    }
    _665 = false;
    float _673 = _663;
    float _675 = in.m_51.w;
    float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _679 = in.m_44.x;
    float _681 = in.m_44.y;
    float _683 = in.m_44.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _687 = _685 != 0;
    float _689 = in.m_57.x;
    float _691 = in.m_57.y;
    float _693 = in.m_57.z;
    float _695 = in.m_59.x;
    float _697 = in.m_59.y;
    float _699 = in.m_59.z;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = in.m_61.y;
    float _711 = _212 * 2.0;
    float _713 = in.m_63.x;
    float _715 = in.m_63.y;
    float _717 = in.m_63.z;
    float _719 = floor(_711);
    float _721 = in.m_51.z;
    bool _723 = _675 > 0.5;
    float _725 = in.m_61.x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _727 = _681 * _691;
    float _729 = _681 * _697;
    float _731 = fma(_679, _695, _729);
    float _733 = -_709;
    float _735 = _733 + 1.0;
    float _737 = _681 * _715;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _743 = fma(_683, _699, _731);
    float _745 = _709;
    float _747 = _727;
    float _749 = _679;
    if (_687)
    {
        float _751 = _723 ? _735 : _709;
        _745 = _751;
    }
    float _753 = _745;
    float _755 = fma(_679, _713, _737);
    bool _757 = _721 > 0.5;
    bool _759 = _757 && _703;
    float _761 = 1.0 / _741;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _767 = fma(_683, _717, _755);
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _775 = _773 != 0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _779 = _777 != 0;
    float _781 = fma(_679, _689, _727);
    float _783 = _721 * 2.0;
    if (_703)
    {
        _747 = _725;
    }
    float _785 = _747;
    float _787 = 1.0 / _765;
    float _789 = fma(_683, _693, _781);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _791;
    float _795 = in.m_51.y;
    float _797 = _785;
    if (_759)
    {
        float _799 = -_785;
        float _801 = _799 + 1.0;
        _797 = _801;
    }
    float _803 = _797;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _807 = _673 + _805;
    bool _809 = _719 > 0.0;
    float _811 = floor(_783);
    float _813 = _212 + _721;
    float _815 = _793 * _761;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _821 = _719 >= 0.0;
    bool _823 = isnan(_719);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.0);
    bool _829 = _825 || _827;
    float _831 = _813 + (-1.0);
    float _833 = _815;
    float _835 = _807;
    if (!_703)
    {
        _749 = _725;
    }
    float _837 = _749;
    float _839 = _677 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _843 = _819 * _787;
    float _845 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _847 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _849 = isnan(_673);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_839, _753, -0.5);
    bool _861 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _863 = isnan(_673);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = _743 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _875 = _837;
    if (_703)
    {
        _875 = _803;
    }
    float _877 = _875;
    float _879 = -_857;
    float _881 = _879 + 1.0;
    int _883 = _829 ? 0 : 1;
    float _885 = _789 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _887 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _889 = isnan(_673);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _901 = _673 + _899;
    bool _903 = _811 > 0.0;
    float _905 = _871 * _881;
    bool _907 = _811 >= 0.0;
    bool _909 = isnan(_811);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = -_871;
    float _919 = _917 + 1.0;
    float _921 = fma(_815, _807, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _923 = fma(_843, _901, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (!_707)
    {
        _833 = _795;
    }
    float _925 = _833;
    float _927 = _897 * _919;
    float _929 = _841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _931 = -_897;
    float _933 = _931 + 1.0;
    float _935 = _925;
    if (!_707)
    {
        _835 = _925;
    }
    float _937 = _835;
    float _939 = fma(_929, _877, -0.5);
    float _941 = _937;
    if (_707)
    {
        _941 = _212;
    }
    float _943 = _941;
    float _945 = _921 * _927;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _949 = ~_883;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[131].x, _945);
    int _957 = _953;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_809)
    {
        int _961 = ~_883;
        int _963 = _961 + 1;
        _957 = _963;
    }
    int _965 = _957;
    float _967 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[83].z, _947);
    if (_707)
    {
        _935 = _795;
    }
    float _969 = _935;
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _973 = _943 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _975 = _973;
    if (!_707)
    {
        _959 = _721;
    }
    float _977 = _959;
    float _979 = _977;
    if (_707)
    {
        _979 = _969;
    }
    float _981 = _979;
    float _983 = -_971;
    float _985 = fma(_973, 2.0, _983);
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_707)
    {
        _975 = _721;
    }
    float _989 = _975;
    int _991 = _915 ? 0 : 1;
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[83].w, _987);
    float _995 = fma(_923, _905, _955);
    float _997 = _989;
    if (_707)
    {
        _997 = _969;
    }
    float _999 = _997;
    float _1001 = _212 + _969;
    int _1003 = ~_991;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1011 = _1007;
    if (!_903)
    {
        int _1013 = ~_991;
        int _1015 = _1013 + 1;
        _1011 = _1015;
    }
    int _1017 = _1011;
    float _1019 = _999 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1021 = _969 * 2.0;
    float _1023 = _1001 + (-1.0);
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1027 = _873 + _1025;
    float _1029 = fma(_1019, -2.0, _1009);
    float _1031 = floor(_1021);
    float _1033 = _767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1035 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _967);
    float _1037 = -_132;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[81].x, _985);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1045 = _885 + _1043;
    float _1047 = _1027 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1049 = fma(_1035, _939, _1039);
    float _1051 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1053 = log2(_1051);
    float _1055 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1029);
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1033 + _1057;
    float _1061 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1047);
    bool _1063 = !_771;
    int _1065 = _1063 ? 0 : 1;
    float _1067 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _993);
    float _1069 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[133].x, _995);
    float _1071 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1061);
    int _1073 = abs(_1065);
    float _1075 = _1027 * _1027;
    bool _1077 = _1031 > 0.0;
    float _1079 = -_1055;
    float _1081 = fma(_1067, _859, _1079);
    bool _1083 = _1031 >= 0.0;
    bool _1085 = isnan(_1031);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = fma(_1045, _1045, _1075);
    bool _1095 = _1071 >= 0.0;
    float _1097 = _1049 + 0.5;
    float _1099 = _1053 * _132;
    float _1101 = float(_1073);
    float _1103 = fma(_1059, _1059, _1093);
    float _1105 = float(_1017);
    float _1107 = exp2(_1099);
    float _1109 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1111 = _1081 + 0.5;
    float _1113 = _1101 * _1105;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1117 = 1.0 + _1115;
    bool _1119 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1121 = isnan(0.0);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1127 = _1123 || _1125;
    out.m_67.w = _1109;
    float _1129 = rsqrt(_1103);
    float _1131 = as_type<float>(_1017);
    if (_1095)
    {
        _1131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1133 = _1131;
    float _1135 = in.m_69.x;
    float _1137 = in.m_69.y;
    float _1139 = in.m_69.z;
    bool _1141 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1143 = isnan(1.0);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1149 = _1145 || _1147;
    int _1151 = as_type<int>(_1133);
    if (_1095)
    {
        float _1153 = _1133 * 5.0;
        _1151 = as_type<int>(_1153);
    }
    int _1155 = _1151;
    out.m_71.z = _1097;
    out.m_71.w = _1111;
    float _1157 = 1.0 / _1117;
    float _1159 = -_1107;
    float _1161 = _1159 + 1.0;
    bool _1163 = !_775;
    int _1165 = _1163 ? 0 : 1;
    if (_1095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3770 = as_type<float>(_1155);
        out.gl_Position.z = _3770;
    }
    bool _1167 = !_779;
    int _1169 = _1167 ? 0 : 1;
    float _1171 = _1127 ? _1161 : 0.0;
    if (_1095)
    {
        out.m_47.x = 0.0;
    }
    float _1173 = _1027 * _1129;
    int _1175 = _1091 ? 0 : 1;
    float _1177 = _1045 * _1129;
    if (_1095)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1179 = -_1173;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _1183 = -_1177;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _1187 = _1113 * (-2.0);
    if (_1149)
    {
        float _1189 = _1171 * _1157;
        _136 = _1189;
    }
    float _1191 = _136;
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _1181 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1199 = _1185 + _1197;
    int _1201 = abs(_1169);
    float _1203 = _212 + (-0.5);
    float _1205 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1207 = fma(_1041, _1187, _1041);
    float _1209 = _1059 * _1129;
    int _1211 = ~_1175;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    float _1217 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1205);
    int _1219 = _1215;
    if (!_1077)
    {
        int _1221 = ~_1175;
        int _1223 = _1221 + 1;
        _1219 = _1223;
    }
    int _1225 = _1219;
    float _1227 = fma(_1187, _1135, _1135);
    float _1229 = -_1209;
    float _1231 = fma(_1229, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1033);
    float _1233 = float(_1225);
    float _1235 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1227);
    float _1237 = float(_1201);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1241 = _1231 + _1239;
    int _1243 = abs(_1165);
    float _1245 = fma(_1207, _1191, _1235);
    float _1247 = -_1173;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1251 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1217);
    float _1253 = _1237 * _1233;
    float _1255 = -_1177;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1045);
    float _1259 = float(_965);
    float _1261 = _1253 * (-2.0);
    bool _1263 = _1251 >= 0.0;
    float _1265 = _1245 * 0.15915493667125701904296875;
    float _1267 = float(_1243);
    float _1269 = _1249 * _1249;
    float _1271 = _721 + _969;
    float _1273 = _721 + (-0.5);
    float _1275 = fma(_1261, _1139, _1139);
    float _1277 = _1267 * _1259;
    float _1279 = fma(_1257, _1257, _1269);
    float _1281 = -_1209;
    float _1283 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1059);
    float _1285 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1275);
    float _1287 = _1265 * 6.283185482025146484375;
    float _1289 = sin(_1287);
    float _1291 = fma(_1283, _1283, _1279);
    float _1293 = _1269;
    if (_1263)
    {
        _1293 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1295 = _1293;
    float _1297 = fma(_845, _1261, _845);
    float _1299 = _1277 * (-2.0);
    float _1301 = _1271 + (-1.0);
    float _1303 = _1265 * 6.283185482025146484375;
    float _1305 = cos(_1303);
    int _1307 = as_type<int>(_1295);
    if (_1263)
    {
        float _1309 = _1295 * 5.0;
        _1307 = as_type<int>(_1309);
    }
    int _1311 = _1307;
    float _1313 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1315 = fma(_1297, _1191, _1285);
    if (_1263)
    {
        out.m_47.x = 0.0;
    }
    float _1317 = fma(_1299, _1137, _1137);
    float _1319 = fma(_1313, _1299, _1313);
    float _1321 = _969 + (-0.5);
    float _1323 = sqrt(_1291);
    if (_1263)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4035 = as_type<float>(_1311);
        out.gl_Position.z = _4035;
    }
    float _1325 = _1315 * 0.15915493667125701904296875;
    float _1327 = _1305;
    if (_1263)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1329 = in.m_73.x;
    float _1331 = in.m_73.y;
    float _1333 = in.m_73.z;
    float _1335 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1317);
    float _1337 = _1325 * 6.283185482025146484375;
    float _1339 = sin(_1337);
    float _1341 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1343 = _1129 * _1323;
    float _1345 = fma(_1319, _1191, _1335);
    float _1347 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1349 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1351 = _1343 * _1341;
    float _1353 = _1345 * 0.15915493667125701904296875;
    float _1355 = _1325 * 6.283185482025146484375;
    float _1357 = cos(_1355);
    float _1359 = _1343 * _1347;
    float _1361 = _1343 * _1349;
    float _1363 = _1353 * 6.283185482025146484375;
    float _1365 = sin(_1363);
    float _1367 = _1289 * _1339;
    float _1369 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1331);
    float _1371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1329);
    float _1373 = _1353 * 6.283185482025146484375;
    float _1375 = cos(_1373);
    float _1377 = _1305 * _1357;
    float _1379 = _1305 * _1339;
    float _1381 = _1289 * _1357;
    float _1383 = _1359 * _1369;
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1333);
    float _1387 = _1361 * _1371;
    float _1389 = fma(_1365, _1367, _1377);
    float _1391 = -_1379;
    float _1393 = fma(_1365, _1381, _1391);
    float _1395 = -_1381;
    float _1397 = fma(_1365, _1379, _1395);
    float _1399 = _1351 * _1385;
    float _1401 = _1389 * _1383;
    float _1403 = _1393 * _1383;
    float _1405 = fma(_1365, _1377, _1367);
    float _1407 = _1375 * _1387;
    float _1409 = _1289 * _1375;
    float _1411 = _1305 * _1375;
    float _1413 = fma(_1339, _1407, _1401);
    float _1415 = fma(_1357, _1407, _1403);
    float _1417 = _1409 * _1383;
    float _1419 = fma(_1397, _1399, _1413);
    float _1421 = fma(_1405, _1399, _1415);
    float _1423 = -_1365;
    float _1425 = fma(_1423, _1387, _1417);
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1431 = fma(_1411, _1399, _1425);
    float _1433 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1435 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1427);
    float _1437 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1429);
    float _1439 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1433);
    float _1441 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1435);
    float _1443 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1437);
    float _1445 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1439);
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1449 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1451 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1453 = _885 + _1447;
    float _1455 = _1033 + _1449;
    float _1457 = _873 + _1451;
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1453 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1455 + _1463;
    float _1467 = _1461 * _1461;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1449;
    float _1479 = _1451;
    float _1481 = _1445;
    float _1483 = _1467;
    float _1485 = _1469;
    if (!_1475)
    {
        _1477 = _1453;
    }
    float _1487 = _1477;
    float _1489 = _1487;
    if (!_1475)
    {
        _1479 = _1455;
    }
    float _1491 = _1479;
    float _1493 = _1491;
    if (!_1475)
    {
        _1481 = _1457;
    }
    float _1495 = _1481;
    bool _1497 = !_1475;
    float _1499 = _1495;
    if (!_1497)
    {
        float _1501 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1505 = _1473 + _1503;
        float _1507 = rsqrt(_1471);
        float _1509 = _1505 * _1501;
        float _1511 = _1457 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1513 = _1509 * 0.15915493667125701904296875;
        float _1515 = _1513 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = cos(_1519);
        float _1523 = fma(_1517, _1511, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1525 = _1507 * _1523;
        float _1527 = _1521 + (-1.0);
        float _1529 = fma(_1461, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1531 = fma(_1465, _1525, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1533 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1537 = _1529 + _1535;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1541 = _1531 + _1539;
        float _1543 = fma(_1457, _1521, _1533);
        float _1545 = _1537 * _1537;
        float _1547 = _1541 * _1541;
        _1499 = _1543;
        _1483 = _1545;
        _1485 = _1547;
        _1489 = _1529;
        _1493 = _1531;
    }
    float _1549 = _1499;
    float _1551 = _1483;
    float _1553 = _1485;
    float _1555 = _1489;
    float _1557 = _1493;
    float _1559 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1561 = _1549 + _1559;
    float _1563 = fma(_1561, _1561, _1551);
    float _1565 = _1563 + _1553;
    float _1567 = sqrt(_1565);
    bool _1569 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1571 = isnan(_1567);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1577 = _1573 || _1575;
    float _1579 = _1551;
    float _1581 = _1567;
    if (!_1577)
    {
        _1579 = 1.0;
    }
    float _1583 = _1579;
    bool _1585 = !_1577;
    float _1587 = _1583;
    if (!_1585)
    {
        bool _1589 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1591 = isnan(_1567);
        bool _1593 = _1589 || _1591;
        bool _1595 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1597 = _1593 || _1595;
        if (!_1597)
        {
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1601 = _1567 + _1599;
            float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1605 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1603;
            float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1611 = 1.0 / _1605;
            float _1613 = _1601 * _1611;
            float _1615 = fma(_1613, _1609, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1587 = _1615;
            _1617 = true;
        }
        else
        {
            bool _1619 = _1567 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1621 = isnan(_1567);
            bool _1623 = _1619 || _1621;
            bool _1625 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1627 = _1623 || _1625;
            if (!_1627)
            {
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1631 = _1567 + _1629;
                float _1633 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1635 = _1633 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1639 = _1637 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1641 = 1.0 / _1635;
                float _1643 = _1631 * _1641;
                float _1645 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1587 = _1645;
                _1617 = true;
            }
            else
            {
                _1587 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1617 = false;
    float _1647 = _1587;
    float _1649 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1651 = _1549 + _1649;
    float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1655 = _1555 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1557 + _1657;
    float _1661 = fma(_1651, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1663 = fma(_1655, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1665 = fma(_1659, _1647, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1667 = -_1173;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1661);
    float _1671 = -_1177;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1663);
    float _1675 = -_1209;
    float _1677 = fma(_1675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1665);
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1669 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1673 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1677 + _1687;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = rsqrt(_1695);
    float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1701 = _1685 * _1699;
    float _1703 = _1689 * _1699;
    float _1705 = _1701 * _1701;
    float _1707 = _1703 * _1703;
    float _1709 = _1705 + _1707;
    float _1711 = sqrt(_1709);
    bool _1713 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = _1711 + _1715;
    float _1719 = _1697;
    float _1721 = _1709;
    float _1723 = _1717;
    float _1725 = _1681;
    float _1727 = _1701;
    if (_1713)
    {
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1729;
    }
    float _1731 = _1719;
    if (_1713)
    {
        float _1733 = rsqrt(_1709);
        _1721 = _1733;
    }
    float _1735 = _1721;
    if (_1713)
    {
        float _1737 = _1717 * _1731;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1581 = _1741;
    }
    float _1743 = _1581;
    float _1745 = _1731;
    if (_1713)
    {
        float _1747 = _1743 * 6.283185482025146484375;
        float _1749 = sin(_1747);
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1755 = precise::max(0.0, _1753);
    float _1757 = _1689;
    float _1759 = _1755;
    if (_1713)
    {
        float _1761 = _1743 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = -_1699;
    float _1769 = -_1755;
    float _1771 = fma(_1681, _1767, _1769);
    float _1773 = _1771;
    if (_1713)
    {
        float _1775 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1775;
    }
    float _1777 = _1759;
    float _1779 = _1751;
    float _1781 = _1777;
    if (_1713)
    {
        float _1783 = fma(_1751, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1785;
    if (_1713)
    {
        float _1789 = _1765 + (-1.0);
        _1781 = _1789;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    if (_1713)
    {
        float _1795 = _1735 * _1785;
        _1327 = _1795;
    }
    float _1797 = _1327;
    if (!_1713)
    {
        _1787 = _1703;
    }
    float _1799 = _1787;
    float _1801 = sqrt(_1695);
    float _1803 = _1799;
    if (_1713)
    {
        float _1805 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1805;
    }
    float _1807 = _1725;
    float _1809 = _1807;
    if (_1713)
    {
        float _1811 = _1701 * _1797;
        _1727 = _1811;
    }
    float _1813 = _1727;
    if (!_1713)
    {
        _1793 = _1705;
    }
    float _1815 = _1793;
    float _1817 = _1815;
    if (_1713)
    {
        float _1819 = _1703 * _1797;
        _1803 = _1819;
    }
    float _1821 = _1803;
    if (_1713)
    {
        float _1823 = fma(_1771, _1765, _1807);
        _1773 = _1823;
    }
    float _1825 = _1773;
    if (_1713)
    {
        float _1827 = _1813 * _1813;
        _1817 = _1827;
    }
    float _1829 = _1817;
    if (!_1713)
    {
        _1809 = _1707;
    }
    float _1831 = _1809;
    float _1833 = _1831;
    if (_1713)
    {
        float _1835 = _1821 * _1821;
        _1833 = _1835;
    }
    float _1837 = _1833;
    float _1839 = fma(_1825, _1825, _1829);
    float _1841 = _1839 + _1837;
    float _1843 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1847 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1845);
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1853 = rsqrt(_1841);
    float _1855 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1843);
    float _1857 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1859 = -_1849;
    float _1861 = _1859 + 1.0;
    float _1863 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1865 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1855);
    float _1867 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1857);
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1871 = abs(_1861);
    float _1873 = log2(_1871);
    float _1875 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1877 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1867);
    float _1879 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1863);
    float _1881 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1885 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1887 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1889 = _1853 * _1813;
    float _1891 = -_1883;
    float _1893 = fma(_1891, _1869, 1.0);
    float _1895 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _1897 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1899 = _1853 * _1825;
    float _1901 = _1889 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1903 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1895);
    float _1905 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1897);
    float _1907 = _1853 * _1821;
    float _1909 = -_1901;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1909);
    float _1913 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1915 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _1917 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1919 = -_1907;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1911);
    float _1923 = log2(_1893);
    float _1925 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1915);
    float _1927 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1929 = fma(_1921, -0.5, 0.5);
    float _1931 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1933 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1927);
    float _1935 = fma(_1921, 0.5, 0.5);
    float _1937 = exp2(_1917);
    float _1939 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1931);
    float _1941 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1933);
    float _1943 = _1899 + 1.0;
    float _1945 = 1.0 / _1925;
    float _1947 = fma(_1935, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1949 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1939);
    float _1951 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1941);
    float _1953 = fma(_1935, _1947, -0.212114393711090087890625);
    float _1955 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1957 = _1923 * 0.693147182464599609375;
    float _1959 = sqrt(_1929);
    float _1961 = -_1899;
    float _1963 = fma(_1937, _1943, _1961);
    float _1965 = fma(_1935, _1953, 1.570728778839111328125);
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1969 = fma(_1963, 0.5, 0.5);
    float _1971 = _1951 * _1945;
    float _1973 = _1955 * _1945;
    float _1975 = fma(_1971, 0.5, 0.5);
    float _1977 = fma(_1973, -0.5, 0.5);
    float _1979 = _1959 * 0.636619746685028076171875;
    float3 _5115 = float3(_1975, _1977, _1967);
    float _1981 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5115, float3(0.0), isnan(_5115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5115, float3(0.0), isnan(_5115)), level(0.0)).x;
    float3 _5126 = float3(_1975, _1977, _1967);
    float4 _1984 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5126, float3(0.0), isnan(_5126)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5126, float3(0.0), isnan(_5126)), level(0.0)).xyzw;
    float _1986 = _1984.x;
    float _1988 = _1984.y;
    float _1990 = _1984.z;
    float _1992 = _1984.w;
    float _1994 = -_1965;
    float _1996 = fma(_1979, _1994, 1.0);
    float2 _5148 = float2(_1996, _1969);
    float3 _2000 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5148, float2(0.0), isnan(_5148)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5148, float2(0.0), isnan(_5148)), level(0.0)).xyz;
    float _2002 = _2000.x;
    float _2004 = _2000.y;
    float _2006 = _2000.z;
    float _2008 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2010 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2012 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2014 = exp2(_2008);
    float _2016 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2012);
    float _2018 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    float _2020 = _2018 + _1925;
    out.gl_Position.x = _1951;
    out.gl_Position.y = _1955;
    out.gl_Position.z = _2018;
    out.gl_Position.w = _1925;
    float _2022 = _2020 * 0.5;
    float _2024 = -_2014;
    float _2026 = _2024 + 1.0;
    float _2028 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2022;
    out.m_75.w = _1925;
    float _2030 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.w = _2030;
    float _2032 = _2028 * _1981;
    float _2034 = -_2028;
    float _2036 = _2034 + 1.0;
    float _2038 = _1992 * _2032;
    float _2040 = _1992 * _2036;
    float _2042 = _2006 * _2032;
    float _2044 = fma(_2002, _2038, _1986);
    float _2046 = fma(_2004, _2038, _1988);
    float _2048 = fma(_1992, _2042, _1990);
    out.m_79.x = _2044;
    out.m_79.y = _2046;
    out.m_79.z = _2048;
    out.m_79.w = _2040;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

