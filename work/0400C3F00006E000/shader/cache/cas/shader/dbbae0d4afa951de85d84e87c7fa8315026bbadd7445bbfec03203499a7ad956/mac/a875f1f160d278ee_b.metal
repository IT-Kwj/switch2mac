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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_69 [[user(locn14)]];
    float4 m_81 [[user(locn15)]];
    float4 m_85 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3146 = false;
    bool _358 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3404 = as_type<float>(_132);
        out.gl_Position.z = _3404;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_144;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _134 = as_type<int>(_158);
    }
    int _160 = _134;
    out.m_55.x = _146;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3463 = as_type<float>(_160);
        out.gl_Position.z = _3463;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _184;
    if (!_168)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _172 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _166;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _196 = _194 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _202 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _204 = isnan(_188);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _218 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _220 = isnan(_188);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = 1.0 / _196;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _232;
    float _236 = -_212;
    float _238 = _236 + 1.0;
    bool _240 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _242 = isnan(_188);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _254 = 1.0 / _200;
    float _256 = 1.0 / _216;
    float _258 = _234 * _230;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _264 = _228 * _238;
    float _266 = -_228;
    float _268 = _266 + 1.0;
    float _270 = fma(_258, _192, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _272;
    float _276 = _250 * _268;
    float _278 = _262 * _254;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _282 = _188 + _280;
    bool _284 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _286 = isnan(_188);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = _270 * _276;
    float _298 = -_250;
    float _300 = _298 + 1.0;
    float _302 = fma(_278, _282, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = _188 + _304;
    float _308 = _274 * _256;
    float _310 = -_294;
    float _312 = _310 + 1.0;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[115].x, _296);
    float _316 = fma(_308, _306, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _318 = _212 * _312;
    float _320 = fma(_302, _264, _314);
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _324 = fma(_316, _318, _320);
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _328 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[118].x, _324);
    float _334 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _336 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = _332 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _328;
    out.m_57.y = _334;
    out.m_57.z = _336;
    out.m_57.w = _338;
    bool _340 = !_252;
    float _356;
    if (!_340)
    {
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _344 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        _356 = _166;
    }
    _358 = false;
    float _360 = _356;
    float _362 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _364 = int(_362);
    float _366 = in.m_59.y;
    float _368 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _370 = in.m_53.y;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _374 = int(_372);
    float _376 = in.m_53.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _382 = in.m_59.x;
    float _384 = float(_364);
    float _386 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _388 = int(_386);
    float _390 = float(_374);
    float _392 = 1.0 / _384;
    bool _394 = _370 > 0.5;
    float _396 = _370 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _398 = 1.0 / _390;
    float _400 = float(uint(_388));
    bool _402 = _376 > 0.5;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _406 = int(_404);
    float _408 = _116 * _392;
    float _410 = 1.0 / _400;
    float _412 = _116 * _398;
    int _414 = ~_388;
    int _416 = _414 + 1;
    float _418 = trunc(_408);
    int _420 = int(_418);
    float _422 = float(uint(_406));
    float _424 = 1.0 / _422;
    int _426 = as_type<int>(_410) + (-2);
    float _428 = trunc(_412);
    int _430 = int(_428);
    float _432 = float(uint(_420));
    float _434 = as_type<float>(_426) * _432;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _438 = _436 != 0;
    float _440 = 1.0 / _380;
    int _442 = as_type<int>(_424) + (-2);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = trunc(_434);
    float _454 = precise::max(_452, 0.0);
    uint _457 = uint(_454);
    float _459 = float(uint(_430));
    float _461 = float(_430);
    float _463 = as_type<float>(_442) * _459;
    int _465 = ~_406;
    int _467 = _465 + 1;
    float _469 = trunc(_463);
    float _471 = precise::max(_469, 0.0);
    uint _473 = uint(_471);
    int _475 = _416 * int(_457);
    int _477 = _475 + _420;
    float _479 = _463;
    bool _481 = _394;
    float _483 = _366;
    if (!_438)
    {
        _479 = _382;
    }
    float _485 = _479;
    float _487 = float(uint(_477));
    float _489 = -_366;
    float _491 = _489 + 1.0;
    int _493 = _467 * int(_473);
    int _495 = _493 + _430;
    float _497 = as_type<float>(_426) * _487;
    float _499 = _394 ? _491 : _366;
    float _501 = _485;
    float _503 = _499;
    if (_438)
    {
        bool _505 = _146 > 0.5;
        _481 = _505;
    }
    bool _507 = _481;
    float _509 = float(uint(_495));
    float _511 = trunc(_497);
    float _513 = precise::max(_511, 0.0);
    uint _515 = uint(_513);
    float _517 = _450 ? _499 : _366;
    int _519 = as_type<int>(_509);
    if (_446)
    {
        float _521 = _402 ? _491 : _366;
        _483 = _521;
    }
    float _523 = _483;
    float _525 = as_type<float>(_442) * _509;
    if (_438)
    {
        float _527 = -_382;
        float _529 = _527 + 1.0;
        _519 = as_type<int>(_529);
    }
    int _531 = _519;
    int _533 = ~_406;
    int _535 = _533 + 1;
    float _537 = trunc(_525);
    float _539 = precise::max(_537, 0.0);
    uint _541 = uint(_539);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _553 = _551 != 0;
    if (_438)
    {
        float _555 = _507 ? as_type<float>(_531) : _382;
        _501 = _555;
    }
    float _557 = _501;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _561 = _559 != 0;
    int _563 = int(_457) + int(_515);
    int _565 = ~_388;
    int _567 = _565 + 1;
    bool _569 = !_549;
    int _571 = _569 ? 0 : 1;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _575 = _573 != 0;
    int _577 = _567 * _563;
    int _579 = _577 + _420;
    int _581 = int(_473) + int(_541);
    bool _583 = !_561;
    int _585 = _583 ? 0 : 1;
    bool _587 = uint(_579) >= uint(_388);
    int _589 = _535 * _581;
    int _591 = _589 + _430;
    bool _593 = !_545;
    int _595 = _593 ? 0 : 1;
    bool _597 = !_587;
    int _599 = _597 ? 0 : (-1);
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _615 = _613 != 0;
    bool _617 = uint(_591) >= uint(_406);
    float _619 = in.m_44.x;
    float _621 = in.m_44.y;
    float _623 = in.m_44.z;
    bool _625 = !_553;
    int _627 = _625 ? 0 : 1;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _631 = _629 != 0;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _635 = fma(_396, -2.0, _633);
    bool _637 = !_575;
    int _639 = _637 ? 0 : 1;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _645 = !_617;
    int _647 = _645 ? 0 : (-1);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _651 = !_607;
    int _653 = _651 ? 0 : 1;
    float _655 = 1.0 / _643;
    bool _657 = !_603;
    int _659 = _657 ? 0 : 1;
    float _661 = -_649;
    float _663 = fma(_368, 2.0, _661);
    if (_631)
    {
        _503 = 1.0;
    }
    float _665 = _503;
    float _667 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _635);
    float _669 = 0.0;
    float _671 = _665;
    if (_631)
    {
        _669 = _146;
    }
    float _673 = _669;
    float _675 = -_116;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[76].x, _663);
    float _679 = 0.0;
    float _681 = _673;
    if (_631)
    {
        _679 = 1.0;
    }
    float _683 = _679;
    float _685 = _683;
    if (!_631)
    {
        _671 = 7.345489978790283203125;
    }
    float _687 = _671;
    float _689 = _621 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_631)
    {
        _681 = _370;
    }
    float _691 = _681;
    float _693 = _621 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_631)
    {
        _685 = 1.2345600128173828125;
    }
    float _695 = _685;
    float _697 = _687 * _146;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _701 = _699 != 0;
    float _703 = _621 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _707 = _705 != 0;
    float _709 = _691 * _695;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _713 = _711 != 0;
    float _715 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _719 = _717 != 0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    float _725 = floor(_697);
    float _727 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[4].x, _693);
    float _729 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[6].x, _703);
    float _731 = _723 * _655;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _737 = float(_388);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _360 + _739;
    float _743 = float(_420);
    float _745 = floor(_709);
    float _747 = _735 * _440;
    float _749 = float(_406);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _753 = _360 + _751;
    bool _755 = _743 >= _737;
    bool _757 = isnan(_743);
    bool _759 = _755 || _757;
    bool _761 = isnan(_737);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    bool _769 = _461 >= _749;
    bool _771 = isnan(_461);
    bool _773 = _769 || _771;
    bool _775 = isnan(_749);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[5].z, _715);
    float _783 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[6].z, _729);
    float _785 = fma(_731, _741, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _787 = trunc(_765);
    int _789 = int(_787);
    float _791 = fma(_747, _753, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _793 = -_725;
    float _795 = _697 + _793;
    int _797 = 0;
    if (_631)
    {
        _797 = 0;
    }
    int _799 = _797;
    float _801 = _767 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _803 = _799;
    if (!_631)
    {
        _803 = 2;
    }
    int _805 = _803;
    float _807 = -_745;
    float _809 = _709 + _807;
    int _811 = ~_563;
    int _813 = _811 + _599;
    int _815 = _813 + 1;
    float _817 = trunc(_779);
    int _819 = int(_817);
    float _821 = _795 * _737;
    bool _823 = !_615;
    int _825 = _823 ? 0 : 1;
    float _827 = _166 * _737;
    int _829 = _388 * _815;
    int _831 = _829 + _420;
    bool _833 = _388 == 0;
    float _835 = _166 * _749;
    int _837 = ~_581;
    int _839 = _837 + _647;
    int _841 = _839 + 1;
    float _843 = _809 * _749;
    bool _845 = !_833;
    int _847 = _845 ? _831 : (-1);
    float _849 = trunc(_821);
    int _851 = int(_849);
    bool _853 = !_707;
    int _855 = _853 ? 0 : 1;
    int _857 = _406 * _841;
    int _859 = _857 + _430;
    bool _861 = _406 == 0;
    float _863 = _783 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _865 = ~_789;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    bool _871 = !_611;
    int _873 = _871 ? 0 : 1;
    float _875 = trunc(_835);
    int _877 = int(_875);
    bool _879 = _805 != 2;
    int _881 = _847 * _869;
    int _883 = ~_819;
    int _885 = _883 + 1;
    int _887 = _885 + 1;
    bool _889 = !_861;
    int _891 = _889 ? _859 : (-1);
    int _893 = abs(_585);
    float _895 = trunc(_843);
    int _897 = int(_895);
    int _899 = _388 + (-1);
    int _901 = _891 * _887;
    int _903 = abs(_571);
    int _905 = _406 + (-1);
    int _907 = _789 * _899;
    int _909 = _907 + _881;
    int _911 = abs(_653);
    float _913 = trunc(_827);
    int _915 = int(_913);
    int _917 = abs(_659);
    int _919 = _819 * _905;
    int _921 = _919 + _901;
    int _923 = abs(_855);
    int _925 = _909 * _903;
    int _927 = abs(_627);
    int _929 = _921 * _911;
    int _931 = abs(_595);
    int _933 = _897 * _923;
    int _935 = _933 + _430;
    int _937 = _877 * _917;
    int _939 = _937 + _929;
    int _941 = _851 * _893;
    int _943 = _941 + _420;
    bool _945 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _947 = isnan(_360);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    bool _957 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _959 = isnan(_360);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    int _969 = _915 * _931;
    int _971 = _969 + _925;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _975 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_360);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    int _987 = _943 * _927;
    int _989 = _987 + _971;
    float _991 = -_955;
    float _993 = _991 + 1.0;
    float _995 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[78].w, _973);
    float _997 = -_985;
    float _999 = _997 + 1.0;
    int _1001 = abs(_639);
    float _1003 = _985 * _993;
    float _1005 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _995);
    int _1007 = abs(_873);
    float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1011 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1013 = abs(_825);
    float _1015 = _967 * _999;
    bool _1017 = _370 > 0.5;
    float _1019 = -_667;
    float _1021 = fma(_1005, _1011, _1019);
    int _1023 = _851 * _1001;
    int _1025 = _1023 + _989;
    int _1027 = _935 * _1007;
    int _1029 = _1027 + _939;
    float _1031 = _785 * _1015;
    float _1033 = _1015;
    if (!_713)
    {
        _1033 = _382;
    }
    float _1035 = _1033;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1039 = float(uint(_1025));
    int _1041 = _897 * _1013;
    int _1043 = _1041 + _1029;
    float _1045 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1047 = -_967;
    float _1049 = _1047 + 1.0;
    float _1051 = as_type<float>(_426) * _1039;
    float _1053 = float(uint(_1043));
    int _1055 = as_type<int>(_1039);
    float _1057 = _1035;
    float _1059 = _1053;
    if (_713)
    {
        float _1061 = -_382;
        float _1063 = _1061 + 1.0;
        _1055 = as_type<int>(_1063);
    }
    int _1065 = _1055;
    float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1031);
    float _1069 = fma(_1045, _523, -0.5);
    int _1071 = ~_388;
    int _1073 = _1071 + 1;
    float _1075 = as_type<float>(_442) * _1053;
    float _1077 = trunc(_1051);
    float _1079 = precise::max(_1077, 0.0);
    uint _1081 = uint(_1079);
    if (_713)
    {
        float _1083 = _1017 ? as_type<float>(_1065) : _382;
        _1057 = _1083;
    }
    float _1085 = _1057;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1089 = float(uint(_943));
    if (_879)
    {
        _1059 = _146;
    }
    float _1091 = _1059;
    float _1093 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1087);
    float _1095 = _1091;
    if (!_879)
    {
        _1095 = _376;
    }
    float _1097 = _1095;
    float _1099 = trunc(_1075);
    float _1101 = precise::max(_1099, 0.0);
    uint _1103 = uint(_1101);
    float _1105 = as_type<float>(_426) * _1089;
    float _1107 = float(uint(_935));
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1111 = _1073 * int(_1081);
    int _1113 = _1111 + _1025;
    int _1115 = ~_406;
    int _1117 = _1115 + 1;
    float _1119 = trunc(_1105);
    float _1121 = precise::max(_1119, 0.0);
    uint _1123 = uint(_1121);
    float _1125 = as_type<float>(_442) * _1107;
    int _1127 = ~_388;
    int _1129 = _1127 + 1;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1133 = float(uint(_1113));
    int _1135 = _1117 * int(_1103);
    int _1137 = _1135 + _1043;
    float _1139 = trunc(_1125);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = as_type<float>(_426) * _1133;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1149 = float(uint(_1137));
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_879)
    {
        _1151 = _370;
    }
    float _1153 = _1151;
    float _1155 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1147);
    float _1157 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1131);
    float _1159 = trunc(_1145);
    float _1161 = precise::max(_1159, 0.0);
    uint _1163 = uint(_1161);
    float _1165 = as_type<float>(_442) * _1149;
    float _1167 = _1153;
    if (!_879)
    {
        _1167 = _146;
    }
    float _1169 = _1167;
    int _1171 = _1129 * int(_1123);
    int _1173 = _1171 + _943;
    int _1175 = ~_406;
    int _1177 = _1175 + 1;
    float _1179 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1093);
    float _1183 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1185 = trunc(_1165);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    float _1191 = float(uint(_1173));
    float _1193 = fma(_791, _1003, _1067);
    float _1195 = fma(_1179, _1085, -0.5);
    int _1197 = ~_388;
    int _1199 = _1197 + 1;
    float _1201 = as_type<float>(_426) * _1191;
    float _1203 = fma(_1181, _1183, _677);
    int _1205 = _1177 * int(_1143);
    int _1207 = _1205 + _935;
    int _1209 = int(_1081) + int(_1163);
    float _1211 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1193);
    int _1213 = ~_406;
    int _1215 = _1213 + 1;
    float _1217 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1155);
    float _1219 = float(uint(_1207));
    int _1221 = _1199 * _1209;
    int _1223 = _1221 + _1025;
    float _1225 = trunc(_1201);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    int _1231 = int(_1103) + int(_1189);
    float _1233 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1235 = as_type<float>(_442) * _1219;
    int _1237 = _1215 * _1231;
    int _1239 = _1237 + _1043;
    out.m_61.w = _1233;
    bool _1241 = uint(_1223) >= uint(_388);
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1245 = uint(_1239) >= uint(_406);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1249 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1251 = !_1241;
    int _1253 = _1251 ? 0 : (-1);
    float _1255 = -_1243;
    float _1257 = fma(_1109, 2.0, _1255);
    float _1259 = trunc(_1235);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = fma(_1249, -2.0, _1247);
    int _1267 = ~_1209;
    int _1269 = _1267 + _1253;
    int _1271 = _1269 + 1;
    float _1273 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1157);
    float _1275 = -_116;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1257);
    float _1279 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1265);
    bool _1281 = !_1245;
    int _1283 = _1281 ? 0 : (-1);
    int _1285 = _388 * _1271;
    int _1287 = _1285 + _1025;
    float _1289 = _781 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1293 = _863 + _1291;
    int _1295 = ~_1231;
    int _1297 = _1295 + _1283;
    int _1299 = _1297 + 1;
    float _1301 = fma(_1273, _1195, _1277);
    bool _1303 = !_833;
    int _1305 = _1303 ? _1287 : (-1);
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1289 + _1307;
    int _1311 = int(_1123) + int(_1229);
    int _1313 = _406 * _1299;
    int _1315 = _1313 + _1043;
    int _1317 = _1305 >> 31;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1321 = _801 + _1319;
    float _1323 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1325 = int(_1143) + int(_1263);
    float _1327 = -_1279;
    float _1329 = fma(_1217, _1069, _1327);
    int _1331 = _1317 & 3;
    float _1333 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1323);
    bool _1335 = !_861;
    int _1337 = _1335 ? _1315 : (-1);
    int _1339 = _1305 + _1331;
    float _1341 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1333);
    int _1343 = _1337 >> 31;
    int _1345 = _1339 >> 2;
    int _1347 = _1343 & 3;
    int _1349 = _1305 & 3;
    bool _1351 = _1349 != 0;
    int _1353 = _1337 + _1347;
    int _1355 = _1305 & 3;
    bool _1357 = _1355 != 0;
    int _1359 = _1345 << 4;
    int _1361 = _1359 + 368;
    int _1363 = _1353 >> 2;
    bool _1365 = !_1357;
    int _1367 = _1365 ? 0 : 1;
    uint _1369 = uint(int(uint(_1361) >> uint(2)));
    uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
    int _1373 = int(_1369) & 3;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[int(_1371)][_1373];
    int _1377 = int(_1369) + 1;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    int _1381 = _1377 & 3;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[int(_1379)][_1381];
    bool _1385 = uint(_1355) >= 2u;
    int _1387 = _1351 ? 0 : 1;
    bool _1389 = uint(_1355) > 1u;
    bool _1391 = _1355 != 3;
    int _1393 = _1363 << 4;
    int _1395 = _1393 + 512;
    int _1397 = _1385 ? 0 : 1;
    bool _1399 = _1341 >= 0.0;
    uint _1401 = uint(int(uint(_1395) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[int(_1411)][_1413];
    int _1417 = ~_406;
    int _1419 = _1417 + 1;
    int _1421 = ~_388;
    int _1423 = _1421 + 1;
    int _1425 = ~_1387;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _1419 * _1325;
    int _1433 = _1431 + _935;
    int _1435 = ~_1397;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    int _1441 = _1423 * _1311;
    int _1443 = _1441 + _943;
    int _1445 = _1429;
    int _1447 = _1439;
    if (!_1389)
    {
        int _1449 = ~_1387;
        int _1451 = _1449 + 1;
        _1445 = _1451;
    }
    int _1453 = _1445;
    if (_1391)
    {
        int _1455 = ~_1397;
        int _1457 = _1455 + 1;
        _1447 = _1457;
    }
    int _1459 = _1447;
    int _1461 = _1361 + 8;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[int(_1473)][_1475];
    bool _1479 = uint(_1433) >= uint(_406);
    if (_1399)
    {
        out.m_51.x = 0.0;
    }
    bool _1481 = uint(_1443) >= uint(_388);
    bool _1483 = !_1479;
    int _1485 = _1483 ? 0 : (-1);
    bool _1487 = !_1481;
    int _1489 = _1487 ? 0 : (-1);
    int _1491 = _1395 + 8;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = _1337 & 3;
    bool _1511 = _1509 != 0;
    int _1513 = _1337 & 3;
    bool _1515 = _1513 != 0;
    float _1517 = _1021 + 0.5;
    float _1519 = _1203 + 0.5;
    int _1521 = _1511 ? 0 : 1;
    bool _1523 = uint(_1513) > 1u;
    bool _1525 = !_1515;
    int _1527 = _1525 ? 0 : 1;
    out.m_63.x = _1519;
    out.m_63.y = _1517;
    bool _1529 = uint(_1513) >= 2u;
    int _1531 = ~_1311;
    int _1533 = _1531 + _1489;
    int _1535 = _1533 + 1;
    int _1537 = _1529 ? 0 : 1;
    bool _1539 = _1513 != 3;
    int _1541 = _388 * _1535;
    int _1543 = _1541 + _943;
    int _1545 = abs(_1453);
    int _1547 = ~_1325;
    int _1549 = _1547 + _1485;
    int _1551 = _1549 + 1;
    int _1553 = ~_1521;
    int _1555 = _1553 + 1;
    int _1557 = _1555 + 1;
    int _1559 = _1557;
    if (!_1523)
    {
        int _1561 = ~_1521;
        int _1563 = _1561 + 1;
        _1559 = _1563;
    }
    int _1565 = _1559;
    int _1567 = _406 * _1551;
    int _1569 = _1567 + _935;
    int _1571 = ~_1545;
    int _1573 = _1571 + 1;
    int _1575 = _1573 + 1;
    int _1577 = abs(_1367);
    int _1579 = abs(_1565);
    int _1581 = _1575 * as_type<int>(_1383);
    int _1583 = abs(_1527);
    int _1585 = ~_1537;
    int _1587 = _1585 + 1;
    int _1589 = _1587 + 1;
    int _1591 = ~_1579;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    int _1597 = _1589;
    if (_1539)
    {
        int _1599 = ~_1537;
        int _1601 = _1599 + 1;
        _1597 = _1601;
    }
    int _1603 = _1597;
    int _1605 = ~_1577;
    int _1607 = _1605 + 1;
    int _1609 = _1607 + 1;
    int _1611 = _1595 * as_type<int>(_1415);
    int _1613 = ~_1583;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    int _1619 = abs(_1459);
    int _1621 = _1609 * as_type<int>(_1375);
    int _1623 = _1621 + _1581;
    int _1625 = abs(_1603);
    int _1627 = _1617 * as_type<int>(_1407);
    int _1629 = _1627 + _1611;
    int _1631 = ~_1619;
    int _1633 = _1631 + 1;
    int _1635 = _1633 + 1;
    int _1637 = ~_1625;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    bool _1643 = _1355 != 3;
    int _1645 = _1635 * as_type<int>(_1469);
    int _1647 = _1645 + _1623;
    bool _1649 = _1513 != 3;
    int _1651 = _1641 * as_type<int>(_1499);
    int _1653 = _1651 + _1629;
    bool _1655 = !_1643;
    int _1657 = _1655 ? 0 : (-1);
    float _1659 = in.m_65.x;
    float _1661 = in.m_65.y;
    float _1663 = in.m_65.z;
    bool _1665 = !_1649;
    int _1667 = _1665 ? 0 : (-1);
    bool _1669 = !_701;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = abs(_1657);
    bool _1675 = !_719;
    int _1677 = _1675 ? 0 : 1;
    int _1679 = abs(_1667);
    int _1681 = abs(_1671);
    float _1683 = _1309 * _1309;
    int _1685 = abs(_1677);
    float _1687 = fma(_1321, _1321, _1683);
    int _1689 = ~_1673;
    int _1691 = _1689 + 1;
    int _1693 = _1691 + 1;
    int _1695 = ~_1679;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    float _1701 = fma(_1293, _1293, _1687);
    int _1703 = ~_1681;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1693 * as_type<int>(_1477);
    int _1711 = _1709 + _1647;
    bool _1713 = !_833;
    int _1715 = _1713 ? _1543 : (-1);
    int _1717 = _1699 * as_type<int>(_1507);
    int _1719 = _1717 + _1653;
    int _1721 = ~_1685;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    float _1727 = rsqrt(_1701);
    bool _1729 = !_861;
    int _1731 = _1729 ? _1569 : (-1);
    int _1733 = _1711 * _1707;
    float _1735 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1737 = _1719 * _1725;
    float _1739 = as_type<float>(_1711);
    if (_1399)
    {
        _1739 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1741 = _1739;
    int _1743 = _1715 * _1681;
    int _1745 = _1743 + _1733;
    float _1747 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1749 = _1731 * _1685;
    int _1751 = _1749 + _1737;
    float _1753 = _1301 + 0.5;
    float _1755 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1757 = as_type<int>(_1741);
    if (_1399)
    {
        float _1759 = _1741 * 5.0;
        _1757 = as_type<int>(_1759);
    }
    int _1761 = _1757;
    float _1763 = _1329 + 0.5;
    float _1765 = float(_1745);
    float _1767 = float(_1751);
    float _1769 = _1755 * _1727;
    float _1771 = _1769;
    if (_1399)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5830 = as_type<float>(_1761);
        out.gl_Position.z = _5830;
    }
    float _1773 = _1321 * _1769;
    out.m_67.x = _1753;
    out.m_67.y = _1763;
    float _1775 = _1309 * _1769;
    out.m_69.x = _1765;
    out.m_69.y = _1767;
    if (_1399)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1777 = -_1775;
    float _1779 = _1289 + _1777;
    float _1781 = _1293 * _1769;
    float _1783 = -_1773;
    float _1785 = _801 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 + _1787;
    float _1791 = -_1781;
    float _1793 = _863 + _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1797 = _1785 + _1795;
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1803 = _1793 + _1801;
    float _1805 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1799);
    float _1807 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1805);
    bool _1809 = _1807 >= 0.0;
    float _1811 = _1781;
    float _1813 = _1803;
    float _1815 = _1779;
    float _1817 = _1785;
    if (_1809)
    {
        _1771 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1819 = _1771;
    int _1821 = as_type<int>(_1819);
    if (_1809)
    {
        out.m_51.x = 0.0;
    }
    if (_1809)
    {
        float _1823 = _1819 * 5.0;
        _1821 = as_type<int>(_1823);
    }
    int _1825 = _1821;
    if (_1809)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5931 = as_type<float>(_1825);
        out.gl_Position.z = _5931;
    }
    if (_1809)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1827 = -_1289;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1831 = -_801;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1835 = -_863;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1839 = _1829 * _1829;
    float _1841 = -_1775;
    float _1843 = _1309 + _1841;
    float _1845 = fma(_1833, _1833, _1839);
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1849 = fma(_1837, _1837, _1845);
    float _1851 = -_1773;
    float _1853 = _1321 + _1851;
    float _1855 = -_1847;
    float _1857 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1855);
    float _1859 = -_1781;
    float _1861 = _1293 + _1859;
    float _1863 = rsqrt(_1849);
    float _1865 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1867 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1869 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1871 = -_1869;
    float _1873 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1871);
    float _1875 = _1833 * _1863;
    float _1877 = _1837 * _1863;
    float _1879 = _1829 * _1863;
    float _1881 = _1875 * _1875;
    float _1883 = fma(_1877, _1877, _1881);
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1887 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1891 = rsqrt(_1883);
    float _1893 = -_1885;
    float _1895 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    float _1897 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1899 = -_1889;
    float _1901 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1903 = -_1887;
    float _1905 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1903);
    float _1907 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1909 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1913 = -_1897;
    float _1915 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1913);
    float _1917 = -_1909;
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1921 = -_1911;
    float _1923 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1921);
    float _1925 = -_1907;
    float _1927 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1925);
    float _1929 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1915);
    float _1931 = _1877 * _1891;
    float _1933 = _1875 * _1891;
    float _1935 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1927);
    float _1937 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1919);
    float _1939 = -_1931;
    float _1941 = _1877 * _1939;
    float _1943 = -_1931;
    float _1945 = _1879 * _1943;
    float _1947 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1949 = -_1941;
    float _1951 = fma(_1875, _1933, _1949);
    float _1953 = _1879 * _1933;
    float _1955 = -_1947;
    float _1957 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1955);
    float _1959 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1961 = _1951 * _1951;
    float _1963 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1957);
    float _1965 = -_1959;
    float _1967 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1969 = fma(_1953, _1953, _1961);
    float _1971 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1973 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1975 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1967);
    float _1977 = fma(_1945, _1945, _1969);
    float _1979 = -_1971;
    float _1981 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1979);
    float _1983 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1985 = -_1975;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1963);
    float _1989 = rsqrt(_1977);
    float _1991 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1981);
    float _1993 = -_1983;
    float _1995 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1993);
    float _1997 = -_1973;
    float _1999 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1997);
    float _2001 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1995);
    float _2003 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1999);
    float _2005 = 1.0 / _1987;
    float _2007 = _1951 * _1989;
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = 1.0 / _1735;
    float _2013 = -_2009;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_1991, _2005, -1.0);
    float _2019 = _2015 * _2005;
    float _2021 = 1.0 / _1865;
    float _2023 = fma(_2015, _2017, 1.0);
    float _2025 = _2001 * _2019;
    float _2027 = _2003 * _2019;
    float _2029 = _2023 * _2023;
    float _2031 = 1.0 / _1867;
    float _2033 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2035 = fma(_2025, _2025, _2029);
    float _2037 = fma(_2027, _2027, _2035);
    float _2039 = rsqrt(_2037);
    float _2041 = _2027 * _2039;
    float _2043 = _2023 * _2039;
    float _2045 = _2025 * _2039;
    float _2047 = -_2041;
    float _2049 = _1875 * _2047;
    float _2051 = _1877 * _2043;
    float _2053 = -_2045;
    float _2055 = -_2049;
    float _2057 = fma(_1877, _2053, _2055);
    float _2059 = -_2041;
    float _2061 = -_2051;
    float _2063 = fma(_1879, _2059, _2061);
    float _2065 = -_2045;
    float _2067 = _1879 * _2065;
    float _2069 = _2057 * _2057;
    float _2071 = -_2067;
    float _2073 = fma(_1875, _2043, _2071);
    float _2075 = fma(_2063, _2063, _2069);
    float _2077 = fma(_2073, _2073, _2075);
    float _2079 = rsqrt(_2077);
    float _2081 = _2063 * _2079;
    float _2083 = _2073 * _2079;
    float _2085 = _2057 * _2079;
    float _2087 = _1843 * _1843;
    float _2089 = _1877 * _2081;
    float _2091 = _1879 * _2083;
    float _2093 = _1875 * _2085;
    float _2095 = fma(_1853, _1853, _2087);
    float _2097 = -_2089;
    float _2099 = fma(_1875, _2083, _2097);
    float _2101 = -_2091;
    float _2103 = fma(_1877, _2085, _2101);
    float _2105 = -_2093;
    float _2107 = fma(_1879, _2081, _2105);
    float _2109 = fma(_1861, _1861, _2095);
    float _2111 = _2099 * _2099;
    float _2113 = sqrt(_2109);
    float _2115 = fma(_2103, _2103, _2111);
    float _2117 = fma(_2107, _2107, _2115);
    float _2119 = rsqrt(_2117);
    float _2121 = _1727 * _2113;
    float _2123 = in.m_71.x;
    float _2125 = in.m_71.y;
    float _2127 = in.m_71.z;
    float _2129 = _2107 * _2119;
    float _2131 = _2099 * _2119;
    float _2133 = _2103 * _2119;
    float _2135 = _1875 * _2129;
    float _2137 = _1877 * _2131;
    float _2139 = -_2135;
    float _2141 = fma(_1877, _2133, _2139);
    float _2143 = -_2137;
    float _2145 = fma(_1879, _2129, _2143);
    float _2147 = _1879 * _2133;
    float _2149 = _2141 * _2141;
    float _2151 = -_2147;
    float _2153 = fma(_1875, _2131, _2151);
    float _2155 = _1867 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2157 = fma(_2145, _2145, _2149);
    float _2159 = _2011 * _2123;
    float _2161 = fma(_2153, _2153, _2157);
    float _2163 = _2021 * _2125;
    float _2165 = _2121 * _2033;
    float _2167 = _1747 * _2121;
    float _2169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2159);
    float _2171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2173 = rsqrt(_2161);
    float _2175 = _2031 * _2127;
    float _2177 = _2121 * _2155;
    float _2179 = _2171 * _2165;
    float _2181 = _2169 * _2167;
    float _2183 = _2175 * _2177;
    float _2185 = _2179 * _2133;
    float _2187 = _2179 * _2131;
    bool _2189 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.5);
    bool _2197 = _2193 || _2195;
    float _2199 = _2145 * _2173;
    float _2201 = _2141 * _2173;
    float _2203 = _2153 * _2173;
    float _2205 = _2179 * _2129;
    float _2207 = fma(_2181, _2199, _2185);
    float _2209 = fma(_2181, _2201, _2187);
    float _2211 = fma(_2181, _2203, _2205);
    float _2213 = fma(_1875, _2183, _2207);
    float _2215 = fma(_1879, _2183, _2209);
    float _2217 = fma(_1877, _2183, _2211);
    float _2219 = _801 + _2213;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2223 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2225 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2227 = _2219 * 0.20000000298023223876953125;
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2221);
    float _2231 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2223);
    float _2233 = _1289 + _2215;
    float _2235 = floor(_2227);
    float _2237 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2229);
    float _2239 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2225);
    float _2241 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2231);
    float _2243 = _863 + _2217;
    float _2245 = _2237 * 64.0;
    float _2247 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2239);
    float _2249 = _2241 * 49.0;
    float _2251 = _2243 * 0.20000000298023223876953125;
    float _2253 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2255 = _2247 * 64.0;
    float _2257 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2259 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2253);
    float _2261 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2257);
    float _2263 = -_2235;
    float _2265 = _2227 + _2263;
    float _2267 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2259);
    float _2269 = floor(_2251);
    float _2271 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2261);
    float _2273 = _2265 * 6.283185482025146484375;
    float _2275 = _2243 + _2267;
    float _2277 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2279 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2281 = _2273 * 0.15915493667125701904296875;
    float _2283 = _2219 + _2271;
    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2277);
    float _2291 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2279);
    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2295 = _2283 + _2293;
    float _2297 = _2287 * _2287;
    float _2299 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2301 = _2281 * 6.283185482025146484375;
    float _2303 = sin(_2301);
    float _2305 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2291);
    float _2307 = -_2269;
    float _2309 = _2251 + _2307;
    float _2311 = fma(_2295, _2295, _2297);
    float _2313 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2289);
    float _2315 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2299);
    float _2317 = _2309 * 6.283185482025146484375;
    float _2319 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2321 = sqrt(_2311);
    float _2323 = _2233 + _2313;
    float _2325 = _2317 * 0.15915493667125701904296875;
    float _2327 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2315);
    float _2329 = _2325 * 6.283185482025146484375;
    float _2331 = sin(_2329);
    bool _2333 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(0.5);
    bool _2341 = _2337 || _2339;
    float _2343 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2345 = _2321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2347 = 1.0 / _2319;
    float _2349 = _2303 + _2331;
    float _2351 = _2343 + _2319;
    float _2353 = fma(_2349, 0.20000000298023223876953125, _2323);
    float _2355 = _2343;
    float _2357 = _2283;
    float _2359 = _2353;
    float _2361 = _2275;
    if (!_2345)
    {
        _2355 = _2275;
    }
    float _2363 = _2355;
    bool _2365 = !_2345;
    float _2367 = _2363;
    if (!_2365)
    {
        float _2369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2373 = _2321 + _2371;
        float _2375 = rsqrt(_2311);
        float _2377 = _2373 * _2369;
        float _2379 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2381 = _2377 * 0.15915493667125701904296875;
        float _2383 = _2381 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        float _2387 = _2381 * 6.283185482025146484375;
        float _2389 = sin(_2387);
        float _2391 = _2385 + (-1.0);
        float _2393 = fma(_2389, _2379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2397 = _2375 * _2393;
        float _2399 = fma(_2353, _2385, _2395);
        float _2401 = fma(_2295, _2397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2403 = fma(_2287, _2397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2357 = _2401;
        _2359 = _2399;
        _2367 = _2403;
        _2361 = _2395;
    }
    float _2405 = _2357;
    float _2407 = _2359;
    float _2409 = _2367;
    float _2411 = _2361;
    float _2413 = -_1773;
    float _2415 = _2413 + _2405;
    float _2417 = -_1775;
    float _2419 = _2417 + _2407;
    float _2421 = -_1781;
    float _2423 = _2421 + _2409;
    float _2425 = _2351 * _2347;
    float _2427 = _2425 * 0.5;
    float _2429 = _2411;
    float _2431 = _2419;
    float _2433 = _2415;
    float _2435 = _2423;
    float _2437 = _2409;
    if (_2341)
    {
        _2429 = 1.0;
    }
    float _2439 = _2429;
    float _2441 = _2439;
    if (!_2197)
    {
        float _2443 = _1789 * _1789;
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2447 = -_863;
        float _2449 = _2447 + _2409;
        float _2451 = -_801;
        float _2453 = _2451 + _2405;
        float _2455 = fma(_1797, _1797, _2443);
        float _2457 = -_1289;
        float _2459 = _2457 + _2407;
        float _2461 = fma(_1803, _1803, _2455);
        float _2463 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2465 = sqrt(_2461);
        float _2467 = 1.0 / _2121;
        float _2469 = _2463 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2471 = precise::min(_2465, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2473 = _2471 * _2445;
        float _2475 = _2473 * _2467;
        float _2477 = _2469 * _2475;
        float _2479 = _2449 * _2475;
        float _2481 = fma(_2453, _2477, _1785);
        float _2483 = fma(_2459, _2477, _1779);
        float _2485 = fma(_2469, _2479, _1793);
        _2431 = _2483;
        _2433 = _2481;
        _2435 = _2485;
        _1811 = _2445;
    }
    float _2487 = _2431;
    float _2489 = _2433;
    float _2491 = _2435;
    float _2493 = _1811;
    float _2495 = _2493;
    if (!_2341)
    {
        float _2497 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2501 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2499);
        float _2503 = _2497 * 0.15915493667125701904296875;
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
        float _2525 = 1.0 / _2501;
        float _2527 = _2521 * _2523;
        float _2529 = _2511 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2535 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2533;
        float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2539 = _2525 * _2537;
        float _2541 = 1.0 / _2527;
        float _2543 = 1.0 / _2535;
        float _2545 = _2531 * _2541;
        float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2549 = fma(_2545, _2539, _2547);
        float _2551 = _2549 * _2543;
        float _2553 = precise::clamp(_2551, 0.0, 1.0);
        _1813 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _2441 = _2553;
    }
    float _2555 = _1813;
    float _2557 = _2441;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2561 = _2487 + _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2565 = _2489 + _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2491 + _2567;
    float _2571 = _2561 * _2561;
    float _2573 = fma(_2565, _2565, _2571);
    float _2575 = fma(_2569, _2569, _2573);
    float _2577 = rsqrt(_2575);
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2581 = _2565 * _2579;
    float _2583 = _2569 * _2579;
    float _2585 = _2581 * _2581;
    float _2587 = _2583 * _2583;
    float _2589 = _2585 + _2587;
    float _2591 = sqrt(_2589);
    bool _2593 = _2591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2597 = _2591 + _2595;
    float _2599 = _2569;
    float _2601 = _2589;
    float _2603 = _2597;
    float _2605 = _2555;
    float _2607 = _2561;
    if (_2593)
    {
        float _2609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2599 = _2609;
    }
    float _2611 = _2599;
    if (_2593)
    {
        float _2613 = rsqrt(_2589);
        _2601 = _2613;
    }
    float _2615 = _2601;
    float _2617 = _2615;
    if (_2593)
    {
        float _2619 = _2597 * _2611;
        _2603 = _2619;
    }
    float _2621 = _2603;
    if (_2593)
    {
        float _2623 = _2621 * 0.15915493667125701904296875;
        _2605 = _2623;
    }
    float _2625 = _2605;
    float _2627 = _2577;
    if (_2593)
    {
        float _2629 = _2625 * 6.283185482025146484375;
        float _2631 = sin(_2629);
        _2627 = _2631;
    }
    float _2633 = _2627;
    float _2635 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2637 = precise::max(0.0, _2635);
    float _2639 = _2571;
    float _2641 = _2637;
    float _2643 = _2635;
    if (_2593)
    {
        float _2645 = _2625 * 6.283185482025146484375;
        float _2647 = cos(_2645);
        _2639 = _2647;
    }
    float _2649 = _2639;
    float _2651 = -_2579;
    float _2653 = -_2637;
    float _2655 = fma(_2561, _2651, _2653);
    if (!_2593)
    {
        _2607 = _2583;
    }
    float _2657 = _2607;
    float _2659 = _2657;
    if (_2593)
    {
        float _2661 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2641 = _2661;
    }
    float _2663 = _2641;
    float _2665 = _2663;
    float _2667 = _2633;
    if (_2593)
    {
        float _2669 = fma(_2633, _2663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2669;
    }
    float _2671 = _2665;
    float _2673 = _2671;
    if (!_2593)
    {
        _2667 = _2581;
    }
    float _2675 = _2667;
    float _2677 = _2675;
    float _2679 = _2649;
    if (_2593)
    {
        float _2681 = _2649 + (-1.0);
        _2643 = _2681;
    }
    float _2683 = _2643;
    if (_2593)
    {
        float _2685 = _2615 * _2671;
        _2437 = _2685;
    }
    float _2687 = _2437;
    if (!_2593)
    {
        _2673 = _2655;
    }
    float _2689 = _2673;
    float _2691 = _2689;
    if (_2593)
    {
        float _2693 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2495 = _2693;
    }
    float _2695 = _2495;
    if (_2593)
    {
        float _2697 = _2581 * _2687;
        _2677 = _2697;
    }
    float _2699 = _2677;
    if (!_2593)
    {
        _2617 = _2585;
    }
    float _2701 = _2617;
    float _2703 = _2701;
    if (_2593)
    {
        float _2705 = _2583 * _2687;
        _2659 = _2705;
    }
    float _2707 = _2659;
    if (_2593)
    {
        float _2709 = fma(_2655, _2649, _2695);
        _2691 = _2709;
    }
    float _2711 = _2691;
    if (_2593)
    {
        float _2713 = _2699 * _2699;
        _2703 = _2713;
    }
    float _2715 = _2703;
    float _2717 = sqrt(_2575);
    if (!_2593)
    {
        _2679 = _2587;
    }
    float _2719 = _2679;
    float _2721 = _2719;
    if (_2593)
    {
        float _2723 = _2707 * _2707;
        _2721 = _2723;
    }
    float _2725 = _2721;
    float _2727 = fma(_2711, _2711, _2715);
    float _2729 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2731 = _2727 + _2725;
    float _2733 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2729);
    float _2735 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2737 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2739 = rsqrt(_2731);
    float _2741 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2733);
    float _2743 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2745 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2735);
    float _2747 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2737);
    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2751 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2749);
    float _2753 = precise::clamp(_2751, 0.0, 1.0);
    float _2755 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2743);
    float _2757 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2745);
    float _2759 = _2741 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2761 = -_2753;
    float _2763 = _2761 + 1.0;
    float _2765 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2755);
    float _2767 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2769 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2747);
    float _2771 = abs(_2763);
    float _2773 = log2(_2771);
    float _2775 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2777 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2779 = _2739 * _2699;
    float _2781 = _2739 * _2711;
    float _2783 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2785 = _2739 * _2707;
    float _2787 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2789 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2791 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    float _2793 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2795 = -_2787;
    float _2797 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2795);
    float _2799 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2801 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2791);
    float _2803 = -_2793;
    float _2805 = fma(_2803, _2789, 1.0);
    float _2807 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2809 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2801);
    float _2811 = -_2785;
    float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2797);
    float _2815 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2817 = exp2(_2807);
    float _2819 = fma(_2813, -0.5, 0.5);
    float _2821 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2815);
    float _2823 = _2781 + 1.0;
    float _2825 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2821);
    float _2827 = log2(_2805);
    float _2829 = fma(_2813, 0.5, 0.5);
    float _2831 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2799);
    float _2833 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2825);
    float _2835 = fma(_2829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2837 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2831);
    float _2839 = 1.0 / _2809;
    float _2841 = -_2781;
    float _2843 = fma(_2817, _2823, _2841);
    float _2845 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2837);
    float _2847 = fma(_2829, _2835, -0.212114393711090087890625);
    float _2849 = fma(_2843, 0.5, 0.5);
    float _2851 = fma(_2829, _2847, 1.570728778839111328125);
    float _2853 = sqrt(_2819);
    float _2855 = _2827 * 0.693147182464599609375;
    float _2857 = _2833 * _2839;
    float _2859 = _2845 * _2839;
    float _2861 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2863 = fma(_2857, 0.5, 0.5);
    float _2865 = fma(_2859, -0.5, 0.5);
    float _2867 = _2853 * 0.636619746685028076171875;
    float3 _7616 = float3(_2863, _2865, _2861);
    float _2869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7616, float3(0.0), isnan(_7616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7616, float3(0.0), isnan(_7616)), level(0.0)).x;
    float3 _7627 = float3(_2863, _2865, _2861);
    float4 _2872 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7627, float3(0.0), isnan(_7627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7627, float3(0.0), isnan(_7627)), level(0.0)).xyzw;
    float _2874 = _2872.x;
    float _2876 = _2872.y;
    float _2878 = _2872.z;
    float _2880 = _2872.w;
    float _2882 = -_2851;
    float _2884 = fma(_2867, _2882, 1.0);
    float2 _7649 = float2(_2884, _2849);
    float3 _2888 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7649, float2(0.0), isnan(_7649)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7649, float2(0.0), isnan(_7649)), level(0.0)).xyz;
    float _2890 = _2888.x;
    float _2892 = _2888.y;
    float _2894 = _2888.z;
    float _2896 = in.m_73.y;
    bool _2898 = _2163 != 0.0;
    bool _2900 = isnan(_2163);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = in.m_73.z;
    bool _2910 = _2159 == 0.0;
    bool _2912 = !_2906;
    bool _2914 = _2910 && _2912;
    out.m_57.x = _328;
    out.m_57.y = _334;
    out.m_57.z = _336;
    out.m_57.w = _338;
    bool _2916 = _2175 == 0.0;
    bool _2918 = _2916 && _2914;
    out.m_61.w = _1233;
    out.m_75.x = _2199;
    out.m_75.y = _2201;
    out.m_75.z = _2203;
    out.m_77.x = _2489;
    out.m_77.y = _2487;
    out.m_77.z = _2491;
    int _2920 = as_type<int>(_2851);
    int _2922 = as_type<int>(_2863);
    float _2924 = _2767;
    if (_2918)
    {
        float _2926 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2896);
        _2920 = as_type<int>(_2926);
    }
    int _2928 = _2920;
    int _2930 = _2928;
    if (!_2918)
    {
        float _2932 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2896);
        _2930 = as_type<int>(_2932);
    }
    int _2934 = _2930;
    out.m_79.x = _1785;
    out.m_79.y = _1779;
    out.m_79.z = _1793;
    if (_2918)
    {
        float _2936 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2922 = as_type<int>(_2936);
    }
    int _2938 = _2922;
    int _2940 = _2938;
    if (!_2918)
    {
        float _2942 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2940 = as_type<int>(_2942);
    }
    int _2944 = _2940;
    bool _2946 = !_2918;
    float _2948 = _2946 ? as_type<float>(_2934) : _2896;
    float _2950 = in.m_73.x;
    bool _2952 = !_2918;
    float _2954 = _2952 ? as_type<float>(_2944) : _2908;
    float _2956 = _2948 * _2948;
    float _2958 = fma(_2954, _2954, _2956);
    float _2960 = _2956;
    if (_2918)
    {
        _2960 = _2896;
    }
    float _2962 = _2960;
    float _2964 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2966 = _2962;
    if (!_2918)
    {
        _2966 = as_type<float>(_2934);
    }
    float _2968 = _2966;
    float _2970 = rsqrt(_2958);
    if (_2918)
    {
        _2924 = _2908;
    }
    float _2972 = _2924;
    float _2974 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2964);
    float _2976 = _2972;
    if (!_2918)
    {
        _2976 = as_type<float>(_2944);
    }
    float _2978 = _2976;
    float _2980 = _2133 * _2968;
    float _2982 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2974);
    float _2984 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2982);
    float _2986 = _2950;
    if (!_2918)
    {
        float _2988 = fma(_2159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2950);
        _2986 = _2988;
    }
    float _2990 = _2986;
    bool _2992 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2994 = isnan(_2717);
    bool _2996 = _2992 || _2994;
    bool _2998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3000 = _2996 || _2998;
    out.gl_Position.x = _2833;
    out.gl_Position.y = _2845;
    out.gl_Position.z = _2984;
    out.gl_Position.w = _2809;
    float _3002 = _2948 * _2970;
    float _3004 = _2954 * _2970;
    float _3006 = fma(_2199, _2990, _2980);
    float _3008 = -_1875;
    float _3010 = _3002 * _3008;
    float _3012 = -_1879;
    float _3014 = _3002 * _3012;
    float _3016 = -_1877;
    float _3018 = _3002 * _3016;
    float _3020 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3022 = fma(_3004, _2133, _3010);
    float _3024 = fma(_3004, _2131, _3014);
    float _3026 = fma(_3004, _2129, _3018);
    float _3028 = exp2(_3020);
    float _3030 = _2129 * _2968;
    float _3032 = _2131 * _2968;
    float _3034 = _2984 + _2809;
    out.m_81.x = _3022;
    out.m_81.y = _3024;
    out.m_81.z = _3026;
    float _3036 = fma(_2203, _2990, _3030);
    float _3038 = fma(_2201, _2990, _3032);
    float _3040 = _2833 + _2809;
    float _3042 = _2809 * 0.5;
    float _3044 = _3034 * 0.5;
    if (!_3000)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3046 = _1815;
    float _3048 = _3040 * 0.5;
    float _3050 = fma(_2845, -0.5, _3042);
    float _3052 = _3046;
    float _3054 = _3046;
    if (!_3000)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3056 = _1817;
    float _3058 = -_3028;
    float _3060 = _3058 + 1.0;
    float _3062 = fma(_1875, _2978, _3006);
    float _3064 = fma(_1879, _2978, _3038);
    float _3066 = fma(_1877, _2978, _3036);
    float _3068 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3048;
    out.m_83.y = _3050;
    out.m_83.z = _3044;
    out.m_83.w = _2809;
    out.m_85.x = _3062;
    out.m_85.y = _3064;
    out.m_85.z = _3066;
    float _3070 = _3068 * _2869;
    float _3072 = -_3068;
    float _3074 = _3072 + 1.0;
    float _3076 = _2557 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3078 = _2880 * _3070;
    float _3080 = _2880 * _3074;
    float _3082 = _2894 * _3070;
    float _3084 = fma(_2890, _3078, _2874);
    float _3086 = fma(_2892, _3078, _2876);
    float _3088 = _3078;
    float _3090 = _3056;
    float _3092 = _3056;
    if (!_3000)
    {
        _3088 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3094 = _3088;
    float _3096 = fma(_2880, _3082, _2878);
    out.m_87.x = _3084;
    out.m_87.y = _3086;
    out.m_87.z = _3096;
    out.m_87.w = _3080;
    bool _3098 = !_3000;
    float _3100 = _3094;
    float _3102 = _3094;
    if (!_3098)
    {
        bool _3104 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3106 = isnan(_2717);
        bool _3108 = _3104 || _3106;
        bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3112 = _3108 || _3110;
        if (!_3112)
        {
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3116 = _2717 + _3114;
            float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3120 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3118;
            float _3122 = 1.0 / _3120;
            float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3130 = _3128 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3132 = _3116 * _3122;
            float _3134 = precise::clamp(_3132, 0.0, 1.0);
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3140 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3142 = fma(_3134, _3138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3144 = fma(_3134, _3126, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3092 = _3144;
            _3054 = _3142;
            _3102 = _3140;
            _3146 = true;
        }
        else
        {
            bool _3148 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3150 = isnan(_2717);
            bool _3152 = _3148 || _3150;
            bool _3154 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3156 = _3152 || _3154;
            if (!_3156)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3158 = _3052;
            _3054 = _3158;
            if (!_3156)
            {
                _3090 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3160 = _3090;
            _3092 = _3160;
            if (!_3156)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3162 = _3100;
            bool _3164 = !_3156;
            _3102 = _3162;
            if (!_3164)
            {
                bool _3166 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3168 = isnan(_2717);
                bool _3170 = _3166 || _3168;
                bool _3172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3174 = _3170 || _3172;
                if (!_3174)
                {
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3178 = _2717 + _3176;
                    float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3182 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3180;
                    float _3184 = 1.0 / _3182;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3194 = _3178 * _3184;
                    float _3196 = precise::clamp(_3194, 0.0, 1.0);
                    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3200 = _3198 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3202 = fma(_3196, _3192, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3204 = fma(_3196, _3200, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3206 = fma(_3196, _3188, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3092 = _3206;
                    _3054 = _3204;
                    _3102 = _3202;
                    _3146 = true;
                }
                else
                {
                    _3092 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3146 = false;
    float _3208 = _3092;
    float _3210 = _3054;
    float _3212 = _3102;
    float _3214 = _3076 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_89.x = 0.0;
    float _3216 = _3208 * 0.586610972881317138671875;
    bool _3218 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3214;
    float _3220 = fma(_3210, 0.298911988735198974609375, _3216);
    bool _3222 = _2557 > 0.0;
    bool _3224 = isnan(_2557);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan(0.0);
    bool _3230 = _3226 || _3228;
    float _3232 = fma(_3212, 0.114477999508380889892578125, _3220);
    float _3234 = -_3232;
    float _3236 = _3234 + _3210;
    float _3238 = -_3232;
    float _3240 = _3238 + _3208;
    float _3242 = -_3232;
    float _3244 = _3242 + _3212;
    float _3246 = fma(_3236, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    float _3248 = fma(_3240, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    float _3250 = fma(_3244, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    bool _3252 = !_3218;
    if (!_3252)
    {
        float _3254 = -_2487;
        float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3258 = -_2489;
        float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3262 = -_2491;
        float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3266 = _3256 * _3256;
        float _3268 = fma(_3260, _3260, _3266);
        float _3270 = fma(_3264, _3264, _3268);
        float _3272 = sqrt(_3270);
        float _3274 = rsqrt(_3270);
        float _3276 = -_3272;
        float _3278 = _3276 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3280 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3282 = precise::clamp(_3280, 0.0, 1.0);
        float _3284 = _3260 * _3274;
        float _3286 = _3256 * _3274;
        float _3288 = abs(_3282);
        float _3290 = log2(_3288);
        float _3292 = _3264 * _3274;
        float _3294 = _3284 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3296 = _3064 * _3286;
        float _3298 = -_3286;
        float _3300 = -_3294;
        float _3302 = fma(_3298, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3300);
        float _3304 = fma(_3062, _3284, _3296);
        float _3306 = -_3292;
        float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3302);
        float _3310 = fma(_3066, _3292, _3304);
        float _3312 = precise::clamp(_3310, 0.0, 1.0);
        float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3316 = _3308 + _3314;
        float _3318 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3320 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3322 = precise::clamp(_3320, 0.0, 1.0);
        float _3324 = exp2(_3318);
        float _3326 = _3324 * _3322;
        float _3328 = _3312 * _3326;
        float _3330 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3332 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3334 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3330;
        out.m_89.y = _3332;
        out.m_89.z = _3334;
    }
    out.m_91.x = _3246;
    out.m_91.y = _3248;
    out.m_91.z = _3250;
    if (_3230)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3336;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3146 = false;
    bool _358 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3404 = as_type<float>(_132);
        out.gl_Position.z = _3404;
    }
    if (!_120)
    {
        return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_144;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _134 = as_type<int>(_158);
    }
    int _160 = _134;
    out.m_55.x = _146;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3463 = as_type<float>(_160);
        out.gl_Position.z = _3463;
    }
    if (_154)
    {
        return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _184;
    if (!_168)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _172 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _166;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _196 = _194 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _202 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _204 = isnan(_188);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _218 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _220 = isnan(_188);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = 1.0 / _196;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _232;
    float _236 = -_212;
    float _238 = _236 + 1.0;
    bool _240 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _242 = isnan(_188);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _254 = 1.0 / _200;
    float _256 = 1.0 / _216;
    float _258 = _234 * _230;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _264 = _228 * _238;
    float _266 = -_228;
    float _268 = _266 + 1.0;
    float _270 = fma(_258, _192, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _272;
    float _276 = _250 * _268;
    float _278 = _262 * _254;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _282 = _188 + _280;
    bool _284 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _286 = isnan(_188);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = _270 * _276;
    float _298 = -_250;
    float _300 = _298 + 1.0;
    float _302 = fma(_278, _282, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = _188 + _304;
    float _308 = _274 * _256;
    float _310 = -_294;
    float _312 = _310 + 1.0;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[115].x, _296);
    float _316 = fma(_308, _306, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _318 = _212 * _312;
    float _320 = fma(_302, _264, _314);
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _324 = fma(_316, _318, _320);
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _328 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[118].x, _324);
    float _334 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _336 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = _332 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _328;
    out.m_57.y = _334;
    out.m_57.z = _336;
    out.m_57.w = _338;
    bool _340 = !_252;
    float _356;
    if (!_340)
    {
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _344 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        _356 = _166;
    }
    _358 = false;
    float _360 = _356;
    float _362 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _364 = int(_362);
    float _366 = in.m_59.y;
    float _368 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _370 = in.m_53.y;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _374 = int(_372);
    float _376 = in.m_53.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _382 = in.m_59.x;
    float _384 = float(_364);
    float _386 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _388 = int(_386);
    float _390 = float(_374);
    float _392 = 1.0 / _384;
    bool _394 = _370 > 0.5;
    float _396 = _370 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _398 = 1.0 / _390;
    float _400 = float(uint(_388));
    bool _402 = _376 > 0.5;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _406 = int(_404);
    float _408 = _116 * _392;
    float _410 = 1.0 / _400;
    float _412 = _116 * _398;
    int _414 = ~_388;
    int _416 = _414 + 1;
    float _418 = trunc(_408);
    int _420 = int(_418);
    float _422 = float(uint(_406));
    float _424 = 1.0 / _422;
    int _426 = as_type<int>(_410) + (-2);
    float _428 = trunc(_412);
    int _430 = int(_428);
    float _432 = float(uint(_420));
    float _434 = as_type<float>(_426) * _432;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _438 = _436 != 0;
    float _440 = 1.0 / _380;
    int _442 = as_type<int>(_424) + (-2);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = trunc(_434);
    float _454 = precise::max(_452, 0.0);
    uint _457 = uint(_454);
    float _459 = float(uint(_430));
    float _461 = float(_430);
    float _463 = as_type<float>(_442) * _459;
    int _465 = ~_406;
    int _467 = _465 + 1;
    float _469 = trunc(_463);
    float _471 = precise::max(_469, 0.0);
    uint _473 = uint(_471);
    int _475 = _416 * int(_457);
    int _477 = _475 + _420;
    float _479 = _463;
    bool _481 = _394;
    float _483 = _366;
    if (!_438)
    {
        _479 = _382;
    }
    float _485 = _479;
    float _487 = float(uint(_477));
    float _489 = -_366;
    float _491 = _489 + 1.0;
    int _493 = _467 * int(_473);
    int _495 = _493 + _430;
    float _497 = as_type<float>(_426) * _487;
    float _499 = _394 ? _491 : _366;
    float _501 = _485;
    float _503 = _499;
    if (_438)
    {
        bool _505 = _146 > 0.5;
        _481 = _505;
    }
    bool _507 = _481;
    float _509 = float(uint(_495));
    float _511 = trunc(_497);
    float _513 = precise::max(_511, 0.0);
    uint _515 = uint(_513);
    float _517 = _450 ? _499 : _366;
    int _519 = as_type<int>(_509);
    if (_446)
    {
        float _521 = _402 ? _491 : _366;
        _483 = _521;
    }
    float _523 = _483;
    float _525 = as_type<float>(_442) * _509;
    if (_438)
    {
        float _527 = -_382;
        float _529 = _527 + 1.0;
        _519 = as_type<int>(_529);
    }
    int _531 = _519;
    int _533 = ~_406;
    int _535 = _533 + 1;
    float _537 = trunc(_525);
    float _539 = precise::max(_537, 0.0);
    uint _541 = uint(_539);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _553 = _551 != 0;
    if (_438)
    {
        float _555 = _507 ? as_type<float>(_531) : _382;
        _501 = _555;
    }
    float _557 = _501;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _561 = _559 != 0;
    int _563 = int(_457) + int(_515);
    int _565 = ~_388;
    int _567 = _565 + 1;
    bool _569 = !_549;
    int _571 = _569 ? 0 : 1;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _575 = _573 != 0;
    int _577 = _567 * _563;
    int _579 = _577 + _420;
    int _581 = int(_473) + int(_541);
    bool _583 = !_561;
    int _585 = _583 ? 0 : 1;
    bool _587 = uint(_579) >= uint(_388);
    int _589 = _535 * _581;
    int _591 = _589 + _430;
    bool _593 = !_545;
    int _595 = _593 ? 0 : 1;
    bool _597 = !_587;
    int _599 = _597 ? 0 : (-1);
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _615 = _613 != 0;
    bool _617 = uint(_591) >= uint(_406);
    float _619 = in.m_44.x;
    float _621 = in.m_44.y;
    float _623 = in.m_44.z;
    bool _625 = !_553;
    int _627 = _625 ? 0 : 1;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _631 = _629 != 0;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _635 = fma(_396, -2.0, _633);
    bool _637 = !_575;
    int _639 = _637 ? 0 : 1;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _645 = !_617;
    int _647 = _645 ? 0 : (-1);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _651 = !_607;
    int _653 = _651 ? 0 : 1;
    float _655 = 1.0 / _643;
    bool _657 = !_603;
    int _659 = _657 ? 0 : 1;
    float _661 = -_649;
    float _663 = fma(_368, 2.0, _661);
    if (_631)
    {
        _503 = 1.0;
    }
    float _665 = _503;
    float _667 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _635);
    float _669 = 0.0;
    float _671 = _665;
    if (_631)
    {
        _669 = _146;
    }
    float _673 = _669;
    float _675 = -_116;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[76].x, _663);
    float _679 = 0.0;
    float _681 = _673;
    if (_631)
    {
        _679 = 1.0;
    }
    float _683 = _679;
    float _685 = _683;
    if (!_631)
    {
        _671 = 7.345489978790283203125;
    }
    float _687 = _671;
    float _689 = _621 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_631)
    {
        _681 = _370;
    }
    float _691 = _681;
    float _693 = _621 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_631)
    {
        _685 = 1.2345600128173828125;
    }
    float _695 = _685;
    float _697 = _687 * _146;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _701 = _699 != 0;
    float _703 = _621 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _707 = _705 != 0;
    float _709 = _691 * _695;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _713 = _711 != 0;
    float _715 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _719 = _717 != 0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    float _725 = floor(_697);
    float _727 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[4].x, _693);
    float _729 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[6].x, _703);
    float _731 = _723 * _655;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _737 = float(_388);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _360 + _739;
    float _743 = float(_420);
    float _745 = floor(_709);
    float _747 = _735 * _440;
    float _749 = float(_406);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _753 = _360 + _751;
    bool _755 = _743 >= _737;
    bool _757 = isnan(_743);
    bool _759 = _755 || _757;
    bool _761 = isnan(_737);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    bool _769 = _461 >= _749;
    bool _771 = isnan(_461);
    bool _773 = _769 || _771;
    bool _775 = isnan(_749);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[5].z, _715);
    float _783 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[6].z, _729);
    float _785 = fma(_731, _741, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _787 = trunc(_765);
    int _789 = int(_787);
    float _791 = fma(_747, _753, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _793 = -_725;
    float _795 = _697 + _793;
    int _797 = 0;
    if (_631)
    {
        _797 = 0;
    }
    int _799 = _797;
    float _801 = _767 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _803 = _799;
    if (!_631)
    {
        _803 = 2;
    }
    int _805 = _803;
    float _807 = -_745;
    float _809 = _709 + _807;
    int _811 = ~_563;
    int _813 = _811 + _599;
    int _815 = _813 + 1;
    float _817 = trunc(_779);
    int _819 = int(_817);
    float _821 = _795 * _737;
    bool _823 = !_615;
    int _825 = _823 ? 0 : 1;
    float _827 = _166 * _737;
    int _829 = _388 * _815;
    int _831 = _829 + _420;
    bool _833 = _388 == 0;
    float _835 = _166 * _749;
    int _837 = ~_581;
    int _839 = _837 + _647;
    int _841 = _839 + 1;
    float _843 = _809 * _749;
    bool _845 = !_833;
    int _847 = _845 ? _831 : (-1);
    float _849 = trunc(_821);
    int _851 = int(_849);
    bool _853 = !_707;
    int _855 = _853 ? 0 : 1;
    int _857 = _406 * _841;
    int _859 = _857 + _430;
    bool _861 = _406 == 0;
    float _863 = _783 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _865 = ~_789;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    bool _871 = !_611;
    int _873 = _871 ? 0 : 1;
    float _875 = trunc(_835);
    int _877 = int(_875);
    bool _879 = _805 != 2;
    int _881 = _847 * _869;
    int _883 = ~_819;
    int _885 = _883 + 1;
    int _887 = _885 + 1;
    bool _889 = !_861;
    int _891 = _889 ? _859 : (-1);
    int _893 = abs(_585);
    float _895 = trunc(_843);
    int _897 = int(_895);
    int _899 = _388 + (-1);
    int _901 = _891 * _887;
    int _903 = abs(_571);
    int _905 = _406 + (-1);
    int _907 = _789 * _899;
    int _909 = _907 + _881;
    int _911 = abs(_653);
    float _913 = trunc(_827);
    int _915 = int(_913);
    int _917 = abs(_659);
    int _919 = _819 * _905;
    int _921 = _919 + _901;
    int _923 = abs(_855);
    int _925 = _909 * _903;
    int _927 = abs(_627);
    int _929 = _921 * _911;
    int _931 = abs(_595);
    int _933 = _897 * _923;
    int _935 = _933 + _430;
    int _937 = _877 * _917;
    int _939 = _937 + _929;
    int _941 = _851 * _893;
    int _943 = _941 + _420;
    bool _945 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _947 = isnan(_360);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    bool _957 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _959 = isnan(_360);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    int _969 = _915 * _931;
    int _971 = _969 + _925;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _975 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_360);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    int _987 = _943 * _927;
    int _989 = _987 + _971;
    float _991 = -_955;
    float _993 = _991 + 1.0;
    float _995 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[78].w, _973);
    float _997 = -_985;
    float _999 = _997 + 1.0;
    int _1001 = abs(_639);
    float _1003 = _985 * _993;
    float _1005 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _995);
    int _1007 = abs(_873);
    float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1011 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1013 = abs(_825);
    float _1015 = _967 * _999;
    bool _1017 = _370 > 0.5;
    float _1019 = -_667;
    float _1021 = fma(_1005, _1011, _1019);
    int _1023 = _851 * _1001;
    int _1025 = _1023 + _989;
    int _1027 = _935 * _1007;
    int _1029 = _1027 + _939;
    float _1031 = _785 * _1015;
    float _1033 = _1015;
    if (!_713)
    {
        _1033 = _382;
    }
    float _1035 = _1033;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1039 = float(uint(_1025));
    int _1041 = _897 * _1013;
    int _1043 = _1041 + _1029;
    float _1045 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1047 = -_967;
    float _1049 = _1047 + 1.0;
    float _1051 = as_type<float>(_426) * _1039;
    float _1053 = float(uint(_1043));
    int _1055 = as_type<int>(_1039);
    float _1057 = _1035;
    float _1059 = _1053;
    if (_713)
    {
        float _1061 = -_382;
        float _1063 = _1061 + 1.0;
        _1055 = as_type<int>(_1063);
    }
    int _1065 = _1055;
    float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1031);
    float _1069 = fma(_1045, _523, -0.5);
    int _1071 = ~_388;
    int _1073 = _1071 + 1;
    float _1075 = as_type<float>(_442) * _1053;
    float _1077 = trunc(_1051);
    float _1079 = precise::max(_1077, 0.0);
    uint _1081 = uint(_1079);
    if (_713)
    {
        float _1083 = _1017 ? as_type<float>(_1065) : _382;
        _1057 = _1083;
    }
    float _1085 = _1057;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1089 = float(uint(_943));
    if (_879)
    {
        _1059 = _146;
    }
    float _1091 = _1059;
    float _1093 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1087);
    float _1095 = _1091;
    if (!_879)
    {
        _1095 = _376;
    }
    float _1097 = _1095;
    float _1099 = trunc(_1075);
    float _1101 = precise::max(_1099, 0.0);
    uint _1103 = uint(_1101);
    float _1105 = as_type<float>(_426) * _1089;
    float _1107 = float(uint(_935));
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1111 = _1073 * int(_1081);
    int _1113 = _1111 + _1025;
    int _1115 = ~_406;
    int _1117 = _1115 + 1;
    float _1119 = trunc(_1105);
    float _1121 = precise::max(_1119, 0.0);
    uint _1123 = uint(_1121);
    float _1125 = as_type<float>(_442) * _1107;
    int _1127 = ~_388;
    int _1129 = _1127 + 1;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1133 = float(uint(_1113));
    int _1135 = _1117 * int(_1103);
    int _1137 = _1135 + _1043;
    float _1139 = trunc(_1125);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = as_type<float>(_426) * _1133;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1149 = float(uint(_1137));
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_879)
    {
        _1151 = _370;
    }
    float _1153 = _1151;
    float _1155 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1147);
    float _1157 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1131);
    float _1159 = trunc(_1145);
    float _1161 = precise::max(_1159, 0.0);
    uint _1163 = uint(_1161);
    float _1165 = as_type<float>(_442) * _1149;
    float _1167 = _1153;
    if (!_879)
    {
        _1167 = _146;
    }
    float _1169 = _1167;
    int _1171 = _1129 * int(_1123);
    int _1173 = _1171 + _943;
    int _1175 = ~_406;
    int _1177 = _1175 + 1;
    float _1179 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1093);
    float _1183 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1185 = trunc(_1165);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    float _1191 = float(uint(_1173));
    float _1193 = fma(_791, _1003, _1067);
    float _1195 = fma(_1179, _1085, -0.5);
    int _1197 = ~_388;
    int _1199 = _1197 + 1;
    float _1201 = as_type<float>(_426) * _1191;
    float _1203 = fma(_1181, _1183, _677);
    int _1205 = _1177 * int(_1143);
    int _1207 = _1205 + _935;
    int _1209 = int(_1081) + int(_1163);
    float _1211 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1193);
    int _1213 = ~_406;
    int _1215 = _1213 + 1;
    float _1217 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1155);
    float _1219 = float(uint(_1207));
    int _1221 = _1199 * _1209;
    int _1223 = _1221 + _1025;
    float _1225 = trunc(_1201);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    int _1231 = int(_1103) + int(_1189);
    float _1233 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1235 = as_type<float>(_442) * _1219;
    int _1237 = _1215 * _1231;
    int _1239 = _1237 + _1043;
    out.m_61.w = _1233;
    bool _1241 = uint(_1223) >= uint(_388);
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1245 = uint(_1239) >= uint(_406);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1249 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1251 = !_1241;
    int _1253 = _1251 ? 0 : (-1);
    float _1255 = -_1243;
    float _1257 = fma(_1109, 2.0, _1255);
    float _1259 = trunc(_1235);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = fma(_1249, -2.0, _1247);
    int _1267 = ~_1209;
    int _1269 = _1267 + _1253;
    int _1271 = _1269 + 1;
    float _1273 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1157);
    float _1275 = -_116;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1257);
    float _1279 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1265);
    bool _1281 = !_1245;
    int _1283 = _1281 ? 0 : (-1);
    int _1285 = _388 * _1271;
    int _1287 = _1285 + _1025;
    float _1289 = _781 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1293 = _863 + _1291;
    int _1295 = ~_1231;
    int _1297 = _1295 + _1283;
    int _1299 = _1297 + 1;
    float _1301 = fma(_1273, _1195, _1277);
    bool _1303 = !_833;
    int _1305 = _1303 ? _1287 : (-1);
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1289 + _1307;
    int _1311 = int(_1123) + int(_1229);
    int _1313 = _406 * _1299;
    int _1315 = _1313 + _1043;
    int _1317 = _1305 >> 31;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1321 = _801 + _1319;
    float _1323 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1325 = int(_1143) + int(_1263);
    float _1327 = -_1279;
    float _1329 = fma(_1217, _1069, _1327);
    int _1331 = _1317 & 3;
    float _1333 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1323);
    bool _1335 = !_861;
    int _1337 = _1335 ? _1315 : (-1);
    int _1339 = _1305 + _1331;
    float _1341 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1333);
    int _1343 = _1337 >> 31;
    int _1345 = _1339 >> 2;
    int _1347 = _1343 & 3;
    int _1349 = _1305 & 3;
    bool _1351 = _1349 != 0;
    int _1353 = _1337 + _1347;
    int _1355 = _1305 & 3;
    bool _1357 = _1355 != 0;
    int _1359 = _1345 << 4;
    int _1361 = _1359 + 368;
    int _1363 = _1353 >> 2;
    bool _1365 = !_1357;
    int _1367 = _1365 ? 0 : 1;
    uint _1369 = uint(int(uint(_1361) >> uint(2)));
    uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
    int _1373 = int(_1369) & 3;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[int(_1371)][_1373];
    int _1377 = int(_1369) + 1;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    int _1381 = _1377 & 3;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[int(_1379)][_1381];
    bool _1385 = uint(_1355) >= 2u;
    int _1387 = _1351 ? 0 : 1;
    bool _1389 = uint(_1355) > 1u;
    bool _1391 = _1355 != 3;
    int _1393 = _1363 << 4;
    int _1395 = _1393 + 512;
    int _1397 = _1385 ? 0 : 1;
    bool _1399 = _1341 >= 0.0;
    uint _1401 = uint(int(uint(_1395) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[int(_1411)][_1413];
    int _1417 = ~_406;
    int _1419 = _1417 + 1;
    int _1421 = ~_388;
    int _1423 = _1421 + 1;
    int _1425 = ~_1387;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _1419 * _1325;
    int _1433 = _1431 + _935;
    int _1435 = ~_1397;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    int _1441 = _1423 * _1311;
    int _1443 = _1441 + _943;
    int _1445 = _1429;
    int _1447 = _1439;
    if (!_1389)
    {
        int _1449 = ~_1387;
        int _1451 = _1449 + 1;
        _1445 = _1451;
    }
    int _1453 = _1445;
    if (_1391)
    {
        int _1455 = ~_1397;
        int _1457 = _1455 + 1;
        _1447 = _1457;
    }
    int _1459 = _1447;
    int _1461 = _1361 + 8;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[int(_1473)][_1475];
    bool _1479 = uint(_1433) >= uint(_406);
    if (_1399)
    {
        out.m_51.x = 0.0;
    }
    bool _1481 = uint(_1443) >= uint(_388);
    bool _1483 = !_1479;
    int _1485 = _1483 ? 0 : (-1);
    bool _1487 = !_1481;
    int _1489 = _1487 ? 0 : (-1);
    int _1491 = _1395 + 8;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = _1337 & 3;
    bool _1511 = _1509 != 0;
    int _1513 = _1337 & 3;
    bool _1515 = _1513 != 0;
    float _1517 = _1021 + 0.5;
    float _1519 = _1203 + 0.5;
    int _1521 = _1511 ? 0 : 1;
    bool _1523 = uint(_1513) > 1u;
    bool _1525 = !_1515;
    int _1527 = _1525 ? 0 : 1;
    out.m_63.x = _1519;
    out.m_63.y = _1517;
    bool _1529 = uint(_1513) >= 2u;
    int _1531 = ~_1311;
    int _1533 = _1531 + _1489;
    int _1535 = _1533 + 1;
    int _1537 = _1529 ? 0 : 1;
    bool _1539 = _1513 != 3;
    int _1541 = _388 * _1535;
    int _1543 = _1541 + _943;
    int _1545 = abs(_1453);
    int _1547 = ~_1325;
    int _1549 = _1547 + _1485;
    int _1551 = _1549 + 1;
    int _1553 = ~_1521;
    int _1555 = _1553 + 1;
    int _1557 = _1555 + 1;
    int _1559 = _1557;
    if (!_1523)
    {
        int _1561 = ~_1521;
        int _1563 = _1561 + 1;
        _1559 = _1563;
    }
    int _1565 = _1559;
    int _1567 = _406 * _1551;
    int _1569 = _1567 + _935;
    int _1571 = ~_1545;
    int _1573 = _1571 + 1;
    int _1575 = _1573 + 1;
    int _1577 = abs(_1367);
    int _1579 = abs(_1565);
    int _1581 = _1575 * as_type<int>(_1383);
    int _1583 = abs(_1527);
    int _1585 = ~_1537;
    int _1587 = _1585 + 1;
    int _1589 = _1587 + 1;
    int _1591 = ~_1579;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    int _1597 = _1589;
    if (_1539)
    {
        int _1599 = ~_1537;
        int _1601 = _1599 + 1;
        _1597 = _1601;
    }
    int _1603 = _1597;
    int _1605 = ~_1577;
    int _1607 = _1605 + 1;
    int _1609 = _1607 + 1;
    int _1611 = _1595 * as_type<int>(_1415);
    int _1613 = ~_1583;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    int _1619 = abs(_1459);
    int _1621 = _1609 * as_type<int>(_1375);
    int _1623 = _1621 + _1581;
    int _1625 = abs(_1603);
    int _1627 = _1617 * as_type<int>(_1407);
    int _1629 = _1627 + _1611;
    int _1631 = ~_1619;
    int _1633 = _1631 + 1;
    int _1635 = _1633 + 1;
    int _1637 = ~_1625;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    bool _1643 = _1355 != 3;
    int _1645 = _1635 * as_type<int>(_1469);
    int _1647 = _1645 + _1623;
    bool _1649 = _1513 != 3;
    int _1651 = _1641 * as_type<int>(_1499);
    int _1653 = _1651 + _1629;
    bool _1655 = !_1643;
    int _1657 = _1655 ? 0 : (-1);
    float _1659 = in.m_65.x;
    float _1661 = in.m_65.y;
    float _1663 = in.m_65.z;
    bool _1665 = !_1649;
    int _1667 = _1665 ? 0 : (-1);
    bool _1669 = !_701;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = abs(_1657);
    bool _1675 = !_719;
    int _1677 = _1675 ? 0 : 1;
    int _1679 = abs(_1667);
    int _1681 = abs(_1671);
    float _1683 = _1309 * _1309;
    int _1685 = abs(_1677);
    float _1687 = fma(_1321, _1321, _1683);
    int _1689 = ~_1673;
    int _1691 = _1689 + 1;
    int _1693 = _1691 + 1;
    int _1695 = ~_1679;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    float _1701 = fma(_1293, _1293, _1687);
    int _1703 = ~_1681;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1693 * as_type<int>(_1477);
    int _1711 = _1709 + _1647;
    bool _1713 = !_833;
    int _1715 = _1713 ? _1543 : (-1);
    int _1717 = _1699 * as_type<int>(_1507);
    int _1719 = _1717 + _1653;
    int _1721 = ~_1685;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    float _1727 = rsqrt(_1701);
    bool _1729 = !_861;
    int _1731 = _1729 ? _1569 : (-1);
    int _1733 = _1711 * _1707;
    float _1735 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1737 = _1719 * _1725;
    float _1739 = as_type<float>(_1711);
    if (_1399)
    {
        _1739 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1741 = _1739;
    int _1743 = _1715 * _1681;
    int _1745 = _1743 + _1733;
    float _1747 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1749 = _1731 * _1685;
    int _1751 = _1749 + _1737;
    float _1753 = _1301 + 0.5;
    float _1755 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1757 = as_type<int>(_1741);
    if (_1399)
    {
        float _1759 = _1741 * 5.0;
        _1757 = as_type<int>(_1759);
    }
    int _1761 = _1757;
    float _1763 = _1329 + 0.5;
    float _1765 = float(_1745);
    float _1767 = float(_1751);
    float _1769 = _1755 * _1727;
    float _1771 = _1769;
    if (_1399)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5830 = as_type<float>(_1761);
        out.gl_Position.z = _5830;
    }
    float _1773 = _1321 * _1769;
    out.m_67.x = _1753;
    out.m_67.y = _1763;
    float _1775 = _1309 * _1769;
    out.m_69.x = _1765;
    out.m_69.y = _1767;
    if (_1399)
    {
        return out;
    }
    float _1777 = -_1775;
    float _1779 = _1289 + _1777;
    float _1781 = _1293 * _1769;
    float _1783 = -_1773;
    float _1785 = _801 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 + _1787;
    float _1791 = -_1781;
    float _1793 = _863 + _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1797 = _1785 + _1795;
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1803 = _1793 + _1801;
    float _1805 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1799);
    float _1807 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1805);
    bool _1809 = _1807 >= 0.0;
    float _1811 = _1781;
    float _1813 = _1803;
    float _1815 = _1779;
    float _1817 = _1785;
    if (_1809)
    {
        _1771 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1819 = _1771;
    int _1821 = as_type<int>(_1819);
    if (_1809)
    {
        out.m_51.x = 0.0;
    }
    if (_1809)
    {
        float _1823 = _1819 * 5.0;
        _1821 = as_type<int>(_1823);
    }
    int _1825 = _1821;
    if (_1809)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5931 = as_type<float>(_1825);
        out.gl_Position.z = _5931;
    }
    if (_1809)
    {
        return out;
    }
    float _1827 = -_1289;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1831 = -_801;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1835 = -_863;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1839 = _1829 * _1829;
    float _1841 = -_1775;
    float _1843 = _1309 + _1841;
    float _1845 = fma(_1833, _1833, _1839);
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1849 = fma(_1837, _1837, _1845);
    float _1851 = -_1773;
    float _1853 = _1321 + _1851;
    float _1855 = -_1847;
    float _1857 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1855);
    float _1859 = -_1781;
    float _1861 = _1293 + _1859;
    float _1863 = rsqrt(_1849);
    float _1865 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1867 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1869 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1871 = -_1869;
    float _1873 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1871);
    float _1875 = _1833 * _1863;
    float _1877 = _1837 * _1863;
    float _1879 = _1829 * _1863;
    float _1881 = _1875 * _1875;
    float _1883 = fma(_1877, _1877, _1881);
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1887 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1891 = rsqrt(_1883);
    float _1893 = -_1885;
    float _1895 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    float _1897 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1899 = -_1889;
    float _1901 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1903 = -_1887;
    float _1905 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1903);
    float _1907 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1909 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1913 = -_1897;
    float _1915 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1913);
    float _1917 = -_1909;
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1921 = -_1911;
    float _1923 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1921);
    float _1925 = -_1907;
    float _1927 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1925);
    float _1929 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1915);
    float _1931 = _1877 * _1891;
    float _1933 = _1875 * _1891;
    float _1935 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1927);
    float _1937 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1919);
    float _1939 = -_1931;
    float _1941 = _1877 * _1939;
    float _1943 = -_1931;
    float _1945 = _1879 * _1943;
    float _1947 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1949 = -_1941;
    float _1951 = fma(_1875, _1933, _1949);
    float _1953 = _1879 * _1933;
    float _1955 = -_1947;
    float _1957 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1955);
    float _1959 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1961 = _1951 * _1951;
    float _1963 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1957);
    float _1965 = -_1959;
    float _1967 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1969 = fma(_1953, _1953, _1961);
    float _1971 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1973 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1975 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1967);
    float _1977 = fma(_1945, _1945, _1969);
    float _1979 = -_1971;
    float _1981 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1979);
    float _1983 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1985 = -_1975;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1963);
    float _1989 = rsqrt(_1977);
    float _1991 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1981);
    float _1993 = -_1983;
    float _1995 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1993);
    float _1997 = -_1973;
    float _1999 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1997);
    float _2001 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1995);
    float _2003 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1999);
    float _2005 = 1.0 / _1987;
    float _2007 = _1951 * _1989;
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = 1.0 / _1735;
    float _2013 = -_2009;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_1991, _2005, -1.0);
    float _2019 = _2015 * _2005;
    float _2021 = 1.0 / _1865;
    float _2023 = fma(_2015, _2017, 1.0);
    float _2025 = _2001 * _2019;
    float _2027 = _2003 * _2019;
    float _2029 = _2023 * _2023;
    float _2031 = 1.0 / _1867;
    float _2033 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2035 = fma(_2025, _2025, _2029);
    float _2037 = fma(_2027, _2027, _2035);
    float _2039 = rsqrt(_2037);
    float _2041 = _2027 * _2039;
    float _2043 = _2023 * _2039;
    float _2045 = _2025 * _2039;
    float _2047 = -_2041;
    float _2049 = _1875 * _2047;
    float _2051 = _1877 * _2043;
    float _2053 = -_2045;
    float _2055 = -_2049;
    float _2057 = fma(_1877, _2053, _2055);
    float _2059 = -_2041;
    float _2061 = -_2051;
    float _2063 = fma(_1879, _2059, _2061);
    float _2065 = -_2045;
    float _2067 = _1879 * _2065;
    float _2069 = _2057 * _2057;
    float _2071 = -_2067;
    float _2073 = fma(_1875, _2043, _2071);
    float _2075 = fma(_2063, _2063, _2069);
    float _2077 = fma(_2073, _2073, _2075);
    float _2079 = rsqrt(_2077);
    float _2081 = _2063 * _2079;
    float _2083 = _2073 * _2079;
    float _2085 = _2057 * _2079;
    float _2087 = _1843 * _1843;
    float _2089 = _1877 * _2081;
    float _2091 = _1879 * _2083;
    float _2093 = _1875 * _2085;
    float _2095 = fma(_1853, _1853, _2087);
    float _2097 = -_2089;
    float _2099 = fma(_1875, _2083, _2097);
    float _2101 = -_2091;
    float _2103 = fma(_1877, _2085, _2101);
    float _2105 = -_2093;
    float _2107 = fma(_1879, _2081, _2105);
    float _2109 = fma(_1861, _1861, _2095);
    float _2111 = _2099 * _2099;
    float _2113 = sqrt(_2109);
    float _2115 = fma(_2103, _2103, _2111);
    float _2117 = fma(_2107, _2107, _2115);
    float _2119 = rsqrt(_2117);
    float _2121 = _1727 * _2113;
    float _2123 = in.m_71.x;
    float _2125 = in.m_71.y;
    float _2127 = in.m_71.z;
    float _2129 = _2107 * _2119;
    float _2131 = _2099 * _2119;
    float _2133 = _2103 * _2119;
    float _2135 = _1875 * _2129;
    float _2137 = _1877 * _2131;
    float _2139 = -_2135;
    float _2141 = fma(_1877, _2133, _2139);
    float _2143 = -_2137;
    float _2145 = fma(_1879, _2129, _2143);
    float _2147 = _1879 * _2133;
    float _2149 = _2141 * _2141;
    float _2151 = -_2147;
    float _2153 = fma(_1875, _2131, _2151);
    float _2155 = _1867 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2157 = fma(_2145, _2145, _2149);
    float _2159 = _2011 * _2123;
    float _2161 = fma(_2153, _2153, _2157);
    float _2163 = _2021 * _2125;
    float _2165 = _2121 * _2033;
    float _2167 = _1747 * _2121;
    float _2169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2159);
    float _2171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2173 = rsqrt(_2161);
    float _2175 = _2031 * _2127;
    float _2177 = _2121 * _2155;
    float _2179 = _2171 * _2165;
    float _2181 = _2169 * _2167;
    float _2183 = _2175 * _2177;
    float _2185 = _2179 * _2133;
    float _2187 = _2179 * _2131;
    bool _2189 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.5);
    bool _2197 = _2193 || _2195;
    float _2199 = _2145 * _2173;
    float _2201 = _2141 * _2173;
    float _2203 = _2153 * _2173;
    float _2205 = _2179 * _2129;
    float _2207 = fma(_2181, _2199, _2185);
    float _2209 = fma(_2181, _2201, _2187);
    float _2211 = fma(_2181, _2203, _2205);
    float _2213 = fma(_1875, _2183, _2207);
    float _2215 = fma(_1879, _2183, _2209);
    float _2217 = fma(_1877, _2183, _2211);
    float _2219 = _801 + _2213;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2223 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2225 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2227 = _2219 * 0.20000000298023223876953125;
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2221);
    float _2231 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2223);
    float _2233 = _1289 + _2215;
    float _2235 = floor(_2227);
    float _2237 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2229);
    float _2239 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2225);
    float _2241 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2231);
    float _2243 = _863 + _2217;
    float _2245 = _2237 * 64.0;
    float _2247 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2239);
    float _2249 = _2241 * 49.0;
    float _2251 = _2243 * 0.20000000298023223876953125;
    float _2253 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2255 = _2247 * 64.0;
    float _2257 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2259 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2253);
    float _2261 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2257);
    float _2263 = -_2235;
    float _2265 = _2227 + _2263;
    float _2267 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2259);
    float _2269 = floor(_2251);
    float _2271 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2261);
    float _2273 = _2265 * 6.283185482025146484375;
    float _2275 = _2243 + _2267;
    float _2277 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2279 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2281 = _2273 * 0.15915493667125701904296875;
    float _2283 = _2219 + _2271;
    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2277);
    float _2291 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2279);
    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2295 = _2283 + _2293;
    float _2297 = _2287 * _2287;
    float _2299 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2301 = _2281 * 6.283185482025146484375;
    float _2303 = sin(_2301);
    float _2305 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2291);
    float _2307 = -_2269;
    float _2309 = _2251 + _2307;
    float _2311 = fma(_2295, _2295, _2297);
    float _2313 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2289);
    float _2315 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2299);
    float _2317 = _2309 * 6.283185482025146484375;
    float _2319 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2321 = sqrt(_2311);
    float _2323 = _2233 + _2313;
    float _2325 = _2317 * 0.15915493667125701904296875;
    float _2327 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2315);
    float _2329 = _2325 * 6.283185482025146484375;
    float _2331 = sin(_2329);
    bool _2333 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(0.5);
    bool _2341 = _2337 || _2339;
    float _2343 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2345 = _2321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2347 = 1.0 / _2319;
    float _2349 = _2303 + _2331;
    float _2351 = _2343 + _2319;
    float _2353 = fma(_2349, 0.20000000298023223876953125, _2323);
    float _2355 = _2343;
    float _2357 = _2283;
    float _2359 = _2353;
    float _2361 = _2275;
    if (!_2345)
    {
        _2355 = _2275;
    }
    float _2363 = _2355;
    bool _2365 = !_2345;
    float _2367 = _2363;
    if (!_2365)
    {
        float _2369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2373 = _2321 + _2371;
        float _2375 = rsqrt(_2311);
        float _2377 = _2373 * _2369;
        float _2379 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2381 = _2377 * 0.15915493667125701904296875;
        float _2383 = _2381 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        float _2387 = _2381 * 6.283185482025146484375;
        float _2389 = sin(_2387);
        float _2391 = _2385 + (-1.0);
        float _2393 = fma(_2389, _2379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2397 = _2375 * _2393;
        float _2399 = fma(_2353, _2385, _2395);
        float _2401 = fma(_2295, _2397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2403 = fma(_2287, _2397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2357 = _2401;
        _2359 = _2399;
        _2367 = _2403;
        _2361 = _2395;
    }
    float _2405 = _2357;
    float _2407 = _2359;
    float _2409 = _2367;
    float _2411 = _2361;
    float _2413 = -_1773;
    float _2415 = _2413 + _2405;
    float _2417 = -_1775;
    float _2419 = _2417 + _2407;
    float _2421 = -_1781;
    float _2423 = _2421 + _2409;
    float _2425 = _2351 * _2347;
    float _2427 = _2425 * 0.5;
    float _2429 = _2411;
    float _2431 = _2419;
    float _2433 = _2415;
    float _2435 = _2423;
    float _2437 = _2409;
    if (_2341)
    {
        _2429 = 1.0;
    }
    float _2439 = _2429;
    float _2441 = _2439;
    if (!_2197)
    {
        float _2443 = _1789 * _1789;
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2447 = -_863;
        float _2449 = _2447 + _2409;
        float _2451 = -_801;
        float _2453 = _2451 + _2405;
        float _2455 = fma(_1797, _1797, _2443);
        float _2457 = -_1289;
        float _2459 = _2457 + _2407;
        float _2461 = fma(_1803, _1803, _2455);
        float _2463 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2465 = sqrt(_2461);
        float _2467 = 1.0 / _2121;
        float _2469 = _2463 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2471 = precise::min(_2465, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2473 = _2471 * _2445;
        float _2475 = _2473 * _2467;
        float _2477 = _2469 * _2475;
        float _2479 = _2449 * _2475;
        float _2481 = fma(_2453, _2477, _1785);
        float _2483 = fma(_2459, _2477, _1779);
        float _2485 = fma(_2469, _2479, _1793);
        _2431 = _2483;
        _2433 = _2481;
        _2435 = _2485;
        _1811 = _2445;
    }
    float _2487 = _2431;
    float _2489 = _2433;
    float _2491 = _2435;
    float _2493 = _1811;
    float _2495 = _2493;
    if (!_2341)
    {
        float _2497 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2501 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2499);
        float _2503 = _2497 * 0.15915493667125701904296875;
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
        float _2525 = 1.0 / _2501;
        float _2527 = _2521 * _2523;
        float _2529 = _2511 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2535 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2533;
        float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2539 = _2525 * _2537;
        float _2541 = 1.0 / _2527;
        float _2543 = 1.0 / _2535;
        float _2545 = _2531 * _2541;
        float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2549 = fma(_2545, _2539, _2547);
        float _2551 = _2549 * _2543;
        float _2553 = precise::clamp(_2551, 0.0, 1.0);
        _1813 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _2441 = _2553;
    }
    float _2555 = _1813;
    float _2557 = _2441;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2561 = _2487 + _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2565 = _2489 + _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2491 + _2567;
    float _2571 = _2561 * _2561;
    float _2573 = fma(_2565, _2565, _2571);
    float _2575 = fma(_2569, _2569, _2573);
    float _2577 = rsqrt(_2575);
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2581 = _2565 * _2579;
    float _2583 = _2569 * _2579;
    float _2585 = _2581 * _2581;
    float _2587 = _2583 * _2583;
    float _2589 = _2585 + _2587;
    float _2591 = sqrt(_2589);
    bool _2593 = _2591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2597 = _2591 + _2595;
    float _2599 = _2569;
    float _2601 = _2589;
    float _2603 = _2597;
    float _2605 = _2555;
    float _2607 = _2561;
    if (_2593)
    {
        float _2609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2599 = _2609;
    }
    float _2611 = _2599;
    if (_2593)
    {
        float _2613 = rsqrt(_2589);
        _2601 = _2613;
    }
    float _2615 = _2601;
    float _2617 = _2615;
    if (_2593)
    {
        float _2619 = _2597 * _2611;
        _2603 = _2619;
    }
    float _2621 = _2603;
    if (_2593)
    {
        float _2623 = _2621 * 0.15915493667125701904296875;
        _2605 = _2623;
    }
    float _2625 = _2605;
    float _2627 = _2577;
    if (_2593)
    {
        float _2629 = _2625 * 6.283185482025146484375;
        float _2631 = sin(_2629);
        _2627 = _2631;
    }
    float _2633 = _2627;
    float _2635 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2637 = precise::max(0.0, _2635);
    float _2639 = _2571;
    float _2641 = _2637;
    float _2643 = _2635;
    if (_2593)
    {
        float _2645 = _2625 * 6.283185482025146484375;
        float _2647 = cos(_2645);
        _2639 = _2647;
    }
    float _2649 = _2639;
    float _2651 = -_2579;
    float _2653 = -_2637;
    float _2655 = fma(_2561, _2651, _2653);
    if (!_2593)
    {
        _2607 = _2583;
    }
    float _2657 = _2607;
    float _2659 = _2657;
    if (_2593)
    {
        float _2661 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2641 = _2661;
    }
    float _2663 = _2641;
    float _2665 = _2663;
    float _2667 = _2633;
    if (_2593)
    {
        float _2669 = fma(_2633, _2663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2669;
    }
    float _2671 = _2665;
    float _2673 = _2671;
    if (!_2593)
    {
        _2667 = _2581;
    }
    float _2675 = _2667;
    float _2677 = _2675;
    float _2679 = _2649;
    if (_2593)
    {
        float _2681 = _2649 + (-1.0);
        _2643 = _2681;
    }
    float _2683 = _2643;
    if (_2593)
    {
        float _2685 = _2615 * _2671;
        _2437 = _2685;
    }
    float _2687 = _2437;
    if (!_2593)
    {
        _2673 = _2655;
    }
    float _2689 = _2673;
    float _2691 = _2689;
    if (_2593)
    {
        float _2693 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2495 = _2693;
    }
    float _2695 = _2495;
    if (_2593)
    {
        float _2697 = _2581 * _2687;
        _2677 = _2697;
    }
    float _2699 = _2677;
    if (!_2593)
    {
        _2617 = _2585;
    }
    float _2701 = _2617;
    float _2703 = _2701;
    if (_2593)
    {
        float _2705 = _2583 * _2687;
        _2659 = _2705;
    }
    float _2707 = _2659;
    if (_2593)
    {
        float _2709 = fma(_2655, _2649, _2695);
        _2691 = _2709;
    }
    float _2711 = _2691;
    if (_2593)
    {
        float _2713 = _2699 * _2699;
        _2703 = _2713;
    }
    float _2715 = _2703;
    float _2717 = sqrt(_2575);
    if (!_2593)
    {
        _2679 = _2587;
    }
    float _2719 = _2679;
    float _2721 = _2719;
    if (_2593)
    {
        float _2723 = _2707 * _2707;
        _2721 = _2723;
    }
    float _2725 = _2721;
    float _2727 = fma(_2711, _2711, _2715);
    float _2729 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2731 = _2727 + _2725;
    float _2733 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2729);
    float _2735 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2737 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2739 = rsqrt(_2731);
    float _2741 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2733);
    float _2743 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2745 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2735);
    float _2747 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2737);
    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2751 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2749);
    float _2753 = precise::clamp(_2751, 0.0, 1.0);
    float _2755 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2743);
    float _2757 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2745);
    float _2759 = _2741 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2761 = -_2753;
    float _2763 = _2761 + 1.0;
    float _2765 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2755);
    float _2767 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2769 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2747);
    float _2771 = abs(_2763);
    float _2773 = log2(_2771);
    float _2775 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2777 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2779 = _2739 * _2699;
    float _2781 = _2739 * _2711;
    float _2783 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2785 = _2739 * _2707;
    float _2787 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2789 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2791 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    float _2793 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2795 = -_2787;
    float _2797 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2795);
    float _2799 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2801 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2791);
    float _2803 = -_2793;
    float _2805 = fma(_2803, _2789, 1.0);
    float _2807 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2809 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2801);
    float _2811 = -_2785;
    float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2797);
    float _2815 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2817 = exp2(_2807);
    float _2819 = fma(_2813, -0.5, 0.5);
    float _2821 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2815);
    float _2823 = _2781 + 1.0;
    float _2825 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2821);
    float _2827 = log2(_2805);
    float _2829 = fma(_2813, 0.5, 0.5);
    float _2831 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2799);
    float _2833 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2825);
    float _2835 = fma(_2829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2837 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2831);
    float _2839 = 1.0 / _2809;
    float _2841 = -_2781;
    float _2843 = fma(_2817, _2823, _2841);
    float _2845 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2837);
    float _2847 = fma(_2829, _2835, -0.212114393711090087890625);
    float _2849 = fma(_2843, 0.5, 0.5);
    float _2851 = fma(_2829, _2847, 1.570728778839111328125);
    float _2853 = sqrt(_2819);
    float _2855 = _2827 * 0.693147182464599609375;
    float _2857 = _2833 * _2839;
    float _2859 = _2845 * _2839;
    float _2861 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2863 = fma(_2857, 0.5, 0.5);
    float _2865 = fma(_2859, -0.5, 0.5);
    float _2867 = _2853 * 0.636619746685028076171875;
    float3 _7616 = float3(_2863, _2865, _2861);
    float _2869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7616, float3(0.0), isnan(_7616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7616, float3(0.0), isnan(_7616)), level(0.0)).x;
    float3 _7627 = float3(_2863, _2865, _2861);
    float4 _2872 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7627, float3(0.0), isnan(_7627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7627, float3(0.0), isnan(_7627)), level(0.0)).xyzw;
    float _2874 = _2872.x;
    float _2876 = _2872.y;
    float _2878 = _2872.z;
    float _2880 = _2872.w;
    float _2882 = -_2851;
    float _2884 = fma(_2867, _2882, 1.0);
    float2 _7649 = float2(_2884, _2849);
    float3 _2888 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7649, float2(0.0), isnan(_7649)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7649, float2(0.0), isnan(_7649)), level(0.0)).xyz;
    float _2890 = _2888.x;
    float _2892 = _2888.y;
    float _2894 = _2888.z;
    float _2896 = in.m_73.y;
    bool _2898 = _2163 != 0.0;
    bool _2900 = isnan(_2163);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = in.m_73.z;
    bool _2910 = _2159 == 0.0;
    bool _2912 = !_2906;
    bool _2914 = _2910 && _2912;
    out.m_57.x = _328;
    out.m_57.y = _334;
    out.m_57.z = _336;
    out.m_57.w = _338;
    bool _2916 = _2175 == 0.0;
    bool _2918 = _2916 && _2914;
    out.m_61.w = _1233;
    out.m_75.x = _2199;
    out.m_75.y = _2201;
    out.m_75.z = _2203;
    out.m_77.x = _2489;
    out.m_77.y = _2487;
    out.m_77.z = _2491;
    int _2920 = as_type<int>(_2851);
    int _2922 = as_type<int>(_2863);
    float _2924 = _2767;
    if (_2918)
    {
        float _2926 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2896);
        _2920 = as_type<int>(_2926);
    }
    int _2928 = _2920;
    int _2930 = _2928;
    if (!_2918)
    {
        float _2932 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2896);
        _2930 = as_type<int>(_2932);
    }
    int _2934 = _2930;
    out.m_79.x = _1785;
    out.m_79.y = _1779;
    out.m_79.z = _1793;
    if (_2918)
    {
        float _2936 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2922 = as_type<int>(_2936);
    }
    int _2938 = _2922;
    int _2940 = _2938;
    if (!_2918)
    {
        float _2942 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2940 = as_type<int>(_2942);
    }
    int _2944 = _2940;
    bool _2946 = !_2918;
    float _2948 = _2946 ? as_type<float>(_2934) : _2896;
    float _2950 = in.m_73.x;
    bool _2952 = !_2918;
    float _2954 = _2952 ? as_type<float>(_2944) : _2908;
    float _2956 = _2948 * _2948;
    float _2958 = fma(_2954, _2954, _2956);
    float _2960 = _2956;
    if (_2918)
    {
        _2960 = _2896;
    }
    float _2962 = _2960;
    float _2964 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2966 = _2962;
    if (!_2918)
    {
        _2966 = as_type<float>(_2934);
    }
    float _2968 = _2966;
    float _2970 = rsqrt(_2958);
    if (_2918)
    {
        _2924 = _2908;
    }
    float _2972 = _2924;
    float _2974 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2964);
    float _2976 = _2972;
    if (!_2918)
    {
        _2976 = as_type<float>(_2944);
    }
    float _2978 = _2976;
    float _2980 = _2133 * _2968;
    float _2982 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2974);
    float _2984 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2982);
    float _2986 = _2950;
    if (!_2918)
    {
        float _2988 = fma(_2159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2950);
        _2986 = _2988;
    }
    float _2990 = _2986;
    bool _2992 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2994 = isnan(_2717);
    bool _2996 = _2992 || _2994;
    bool _2998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3000 = _2996 || _2998;
    out.gl_Position.x = _2833;
    out.gl_Position.y = _2845;
    out.gl_Position.z = _2984;
    out.gl_Position.w = _2809;
    float _3002 = _2948 * _2970;
    float _3004 = _2954 * _2970;
    float _3006 = fma(_2199, _2990, _2980);
    float _3008 = -_1875;
    float _3010 = _3002 * _3008;
    float _3012 = -_1879;
    float _3014 = _3002 * _3012;
    float _3016 = -_1877;
    float _3018 = _3002 * _3016;
    float _3020 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3022 = fma(_3004, _2133, _3010);
    float _3024 = fma(_3004, _2131, _3014);
    float _3026 = fma(_3004, _2129, _3018);
    float _3028 = exp2(_3020);
    float _3030 = _2129 * _2968;
    float _3032 = _2131 * _2968;
    float _3034 = _2984 + _2809;
    out.m_81.x = _3022;
    out.m_81.y = _3024;
    out.m_81.z = _3026;
    float _3036 = fma(_2203, _2990, _3030);
    float _3038 = fma(_2201, _2990, _3032);
    float _3040 = _2833 + _2809;
    float _3042 = _2809 * 0.5;
    float _3044 = _3034 * 0.5;
    if (!_3000)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3046 = _1815;
    float _3048 = _3040 * 0.5;
    float _3050 = fma(_2845, -0.5, _3042);
    float _3052 = _3046;
    float _3054 = _3046;
    if (!_3000)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3056 = _1817;
    float _3058 = -_3028;
    float _3060 = _3058 + 1.0;
    float _3062 = fma(_1875, _2978, _3006);
    float _3064 = fma(_1879, _2978, _3038);
    float _3066 = fma(_1877, _2978, _3036);
    float _3068 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3048;
    out.m_83.y = _3050;
    out.m_83.z = _3044;
    out.m_83.w = _2809;
    out.m_85.x = _3062;
    out.m_85.y = _3064;
    out.m_85.z = _3066;
    float _3070 = _3068 * _2869;
    float _3072 = -_3068;
    float _3074 = _3072 + 1.0;
    float _3076 = _2557 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3078 = _2880 * _3070;
    float _3080 = _2880 * _3074;
    float _3082 = _2894 * _3070;
    float _3084 = fma(_2890, _3078, _2874);
    float _3086 = fma(_2892, _3078, _2876);
    float _3088 = _3078;
    float _3090 = _3056;
    float _3092 = _3056;
    if (!_3000)
    {
        _3088 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3094 = _3088;
    float _3096 = fma(_2880, _3082, _2878);
    out.m_87.x = _3084;
    out.m_87.y = _3086;
    out.m_87.z = _3096;
    out.m_87.w = _3080;
    bool _3098 = !_3000;
    float _3100 = _3094;
    float _3102 = _3094;
    if (!_3098)
    {
        bool _3104 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3106 = isnan(_2717);
        bool _3108 = _3104 || _3106;
        bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3112 = _3108 || _3110;
        if (!_3112)
        {
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3116 = _2717 + _3114;
            float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3120 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3118;
            float _3122 = 1.0 / _3120;
            float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3130 = _3128 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3132 = _3116 * _3122;
            float _3134 = precise::clamp(_3132, 0.0, 1.0);
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3140 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3142 = fma(_3134, _3138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3144 = fma(_3134, _3126, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3092 = _3144;
            _3054 = _3142;
            _3102 = _3140;
            _3146 = true;
        }
        else
        {
            bool _3148 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3150 = isnan(_2717);
            bool _3152 = _3148 || _3150;
            bool _3154 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3156 = _3152 || _3154;
            if (!_3156)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3158 = _3052;
            _3054 = _3158;
            if (!_3156)
            {
                _3090 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3160 = _3090;
            _3092 = _3160;
            if (!_3156)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3162 = _3100;
            bool _3164 = !_3156;
            _3102 = _3162;
            if (!_3164)
            {
                bool _3166 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3168 = isnan(_2717);
                bool _3170 = _3166 || _3168;
                bool _3172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3174 = _3170 || _3172;
                if (!_3174)
                {
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3178 = _2717 + _3176;
                    float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3182 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3180;
                    float _3184 = 1.0 / _3182;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3194 = _3178 * _3184;
                    float _3196 = precise::clamp(_3194, 0.0, 1.0);
                    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3200 = _3198 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3202 = fma(_3196, _3192, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3204 = fma(_3196, _3200, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3206 = fma(_3196, _3188, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3092 = _3206;
                    _3054 = _3204;
                    _3102 = _3202;
                    _3146 = true;
                }
                else
                {
                    _3092 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3146 = false;
    float _3208 = _3092;
    float _3210 = _3054;
    float _3212 = _3102;
    float _3214 = _3076 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_89.x = 0.0;
    float _3216 = _3208 * 0.586610972881317138671875;
    bool _3218 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3214;
    float _3220 = fma(_3210, 0.298911988735198974609375, _3216);
    bool _3222 = _2557 > 0.0;
    bool _3224 = isnan(_2557);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan(0.0);
    bool _3230 = _3226 || _3228;
    float _3232 = fma(_3212, 0.114477999508380889892578125, _3220);
    float _3234 = -_3232;
    float _3236 = _3234 + _3210;
    float _3238 = -_3232;
    float _3240 = _3238 + _3208;
    float _3242 = -_3232;
    float _3244 = _3242 + _3212;
    float _3246 = fma(_3236, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    float _3248 = fma(_3240, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    float _3250 = fma(_3244, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    bool _3252 = !_3218;
    if (!_3252)
    {
        float _3254 = -_2487;
        float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3258 = -_2489;
        float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3262 = -_2491;
        float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3266 = _3256 * _3256;
        float _3268 = fma(_3260, _3260, _3266);
        float _3270 = fma(_3264, _3264, _3268);
        float _3272 = sqrt(_3270);
        float _3274 = rsqrt(_3270);
        float _3276 = -_3272;
        float _3278 = _3276 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3280 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3282 = precise::clamp(_3280, 0.0, 1.0);
        float _3284 = _3260 * _3274;
        float _3286 = _3256 * _3274;
        float _3288 = abs(_3282);
        float _3290 = log2(_3288);
        float _3292 = _3264 * _3274;
        float _3294 = _3284 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3296 = _3064 * _3286;
        float _3298 = -_3286;
        float _3300 = -_3294;
        float _3302 = fma(_3298, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3300);
        float _3304 = fma(_3062, _3284, _3296);
        float _3306 = -_3292;
        float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3302);
        float _3310 = fma(_3066, _3292, _3304);
        float _3312 = precise::clamp(_3310, 0.0, 1.0);
        float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3316 = _3308 + _3314;
        float _3318 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3320 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3322 = precise::clamp(_3320, 0.0, 1.0);
        float _3324 = exp2(_3318);
        float _3326 = _3324 * _3322;
        float _3328 = _3312 * _3326;
        float _3330 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3332 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3334 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3330;
        out.m_89.y = _3332;
        out.m_89.z = _3334;
    }
    out.m_91.x = _3246;
    out.m_91.y = _3248;
    out.m_91.z = _3250;
    if (_3230)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3336;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3146 = false;
    bool _358 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3404 = as_type<float>(_132);
        out.gl_Position.z = _3404;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_144;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _134 = as_type<int>(_158);
    }
    int _160 = _134;
    out.m_55.x = _146;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3463 = as_type<float>(_160);
        out.gl_Position.z = _3463;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _184;
    if (!_168)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _172 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _166;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _196 = _194 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _202 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _204 = isnan(_188);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _218 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _220 = isnan(_188);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = 1.0 / _196;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _232;
    float _236 = -_212;
    float _238 = _236 + 1.0;
    bool _240 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _242 = isnan(_188);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _254 = 1.0 / _200;
    float _256 = 1.0 / _216;
    float _258 = _234 * _230;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _264 = _228 * _238;
    float _266 = -_228;
    float _268 = _266 + 1.0;
    float _270 = fma(_258, _192, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _272;
    float _276 = _250 * _268;
    float _278 = _262 * _254;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _282 = _188 + _280;
    bool _284 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _286 = isnan(_188);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = _270 * _276;
    float _298 = -_250;
    float _300 = _298 + 1.0;
    float _302 = fma(_278, _282, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _306 = _188 + _304;
    float _308 = _274 * _256;
    float _310 = -_294;
    float _312 = _310 + 1.0;
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[115].x, _296);
    float _316 = fma(_308, _306, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _318 = _212 * _312;
    float _320 = fma(_302, _264, _314);
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _324 = fma(_316, _318, _320);
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _328 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[118].x, _324);
    float _334 = _326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _336 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = _332 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _328;
    out.m_57.y = _334;
    out.m_57.z = _336;
    out.m_57.w = _338;
    bool _340 = !_252;
    float _356;
    if (!_340)
    {
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _344 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        _356 = _166;
    }
    _358 = false;
    float _360 = _356;
    float _362 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _364 = int(_362);
    float _366 = in.m_59.y;
    float _368 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _370 = in.m_53.y;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _374 = int(_372);
    float _376 = in.m_53.z;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _382 = in.m_59.x;
    float _384 = float(_364);
    float _386 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _388 = int(_386);
    float _390 = float(_374);
    float _392 = 1.0 / _384;
    bool _394 = _370 > 0.5;
    float _396 = _370 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _398 = 1.0 / _390;
    float _400 = float(uint(_388));
    bool _402 = _376 > 0.5;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _406 = int(_404);
    float _408 = _116 * _392;
    float _410 = 1.0 / _400;
    float _412 = _116 * _398;
    int _414 = ~_388;
    int _416 = _414 + 1;
    float _418 = trunc(_408);
    int _420 = int(_418);
    float _422 = float(uint(_406));
    float _424 = 1.0 / _422;
    int _426 = as_type<int>(_410) + (-2);
    float _428 = trunc(_412);
    int _430 = int(_428);
    float _432 = float(uint(_420));
    float _434 = as_type<float>(_426) * _432;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _438 = _436 != 0;
    float _440 = 1.0 / _380;
    int _442 = as_type<int>(_424) + (-2);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = trunc(_434);
    float _454 = precise::max(_452, 0.0);
    uint _457 = uint(_454);
    float _459 = float(uint(_430));
    float _461 = float(_430);
    float _463 = as_type<float>(_442) * _459;
    int _465 = ~_406;
    int _467 = _465 + 1;
    float _469 = trunc(_463);
    float _471 = precise::max(_469, 0.0);
    uint _473 = uint(_471);
    int _475 = _416 * int(_457);
    int _477 = _475 + _420;
    float _479 = _463;
    bool _481 = _394;
    float _483 = _366;
    if (!_438)
    {
        _479 = _382;
    }
    float _485 = _479;
    float _487 = float(uint(_477));
    float _489 = -_366;
    float _491 = _489 + 1.0;
    int _493 = _467 * int(_473);
    int _495 = _493 + _430;
    float _497 = as_type<float>(_426) * _487;
    float _499 = _394 ? _491 : _366;
    float _501 = _485;
    float _503 = _499;
    if (_438)
    {
        bool _505 = _146 > 0.5;
        _481 = _505;
    }
    bool _507 = _481;
    float _509 = float(uint(_495));
    float _511 = trunc(_497);
    float _513 = precise::max(_511, 0.0);
    uint _515 = uint(_513);
    float _517 = _450 ? _499 : _366;
    int _519 = as_type<int>(_509);
    if (_446)
    {
        float _521 = _402 ? _491 : _366;
        _483 = _521;
    }
    float _523 = _483;
    float _525 = as_type<float>(_442) * _509;
    if (_438)
    {
        float _527 = -_382;
        float _529 = _527 + 1.0;
        _519 = as_type<int>(_529);
    }
    int _531 = _519;
    int _533 = ~_406;
    int _535 = _533 + 1;
    float _537 = trunc(_525);
    float _539 = precise::max(_537, 0.0);
    uint _541 = uint(_539);
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _553 = _551 != 0;
    if (_438)
    {
        float _555 = _507 ? as_type<float>(_531) : _382;
        _501 = _555;
    }
    float _557 = _501;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _561 = _559 != 0;
    int _563 = int(_457) + int(_515);
    int _565 = ~_388;
    int _567 = _565 + 1;
    bool _569 = !_549;
    int _571 = _569 ? 0 : 1;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _575 = _573 != 0;
    int _577 = _567 * _563;
    int _579 = _577 + _420;
    int _581 = int(_473) + int(_541);
    bool _583 = !_561;
    int _585 = _583 ? 0 : 1;
    bool _587 = uint(_579) >= uint(_388);
    int _589 = _535 * _581;
    int _591 = _589 + _430;
    bool _593 = !_545;
    int _595 = _593 ? 0 : 1;
    bool _597 = !_587;
    int _599 = _597 ? 0 : (-1);
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _615 = _613 != 0;
    bool _617 = uint(_591) >= uint(_406);
    float _619 = in.m_44.x;
    float _621 = in.m_44.y;
    float _623 = in.m_44.z;
    bool _625 = !_553;
    int _627 = _625 ? 0 : 1;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _631 = _629 != 0;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _635 = fma(_396, -2.0, _633);
    bool _637 = !_575;
    int _639 = _637 ? 0 : 1;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _645 = !_617;
    int _647 = _645 ? 0 : (-1);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _651 = !_607;
    int _653 = _651 ? 0 : 1;
    float _655 = 1.0 / _643;
    bool _657 = !_603;
    int _659 = _657 ? 0 : 1;
    float _661 = -_649;
    float _663 = fma(_368, 2.0, _661);
    if (_631)
    {
        _503 = 1.0;
    }
    float _665 = _503;
    float _667 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _635);
    float _669 = 0.0;
    float _671 = _665;
    if (_631)
    {
        _669 = _146;
    }
    float _673 = _669;
    float _675 = -_116;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[76].x, _663);
    float _679 = 0.0;
    float _681 = _673;
    if (_631)
    {
        _679 = 1.0;
    }
    float _683 = _679;
    float _685 = _683;
    if (!_631)
    {
        _671 = 7.345489978790283203125;
    }
    float _687 = _671;
    float _689 = _621 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_631)
    {
        _681 = _370;
    }
    float _691 = _681;
    float _693 = _621 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_631)
    {
        _685 = 1.2345600128173828125;
    }
    float _695 = _685;
    float _697 = _687 * _146;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _701 = _699 != 0;
    float _703 = _621 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _707 = _705 != 0;
    float _709 = _691 * _695;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _713 = _711 != 0;
    float _715 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    int _717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _719 = _717 != 0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _721;
    float _725 = floor(_697);
    float _727 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[4].x, _693);
    float _729 = fma(_619, (*spvDescriptorSet0.vp_c10)._m0[6].x, _703);
    float _731 = _723 * _655;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _737 = float(_388);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _741 = _360 + _739;
    float _743 = float(_420);
    float _745 = floor(_709);
    float _747 = _735 * _440;
    float _749 = float(_406);
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _753 = _360 + _751;
    bool _755 = _743 >= _737;
    bool _757 = isnan(_743);
    bool _759 = _755 || _757;
    bool _761 = isnan(_737);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    bool _769 = _461 >= _749;
    bool _771 = isnan(_461);
    bool _773 = _769 || _771;
    bool _775 = isnan(_749);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[5].z, _715);
    float _783 = fma(_623, (*spvDescriptorSet0.vp_c10)._m0[6].z, _729);
    float _785 = fma(_731, _741, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _787 = trunc(_765);
    int _789 = int(_787);
    float _791 = fma(_747, _753, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _793 = -_725;
    float _795 = _697 + _793;
    int _797 = 0;
    if (_631)
    {
        _797 = 0;
    }
    int _799 = _797;
    float _801 = _767 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _803 = _799;
    if (!_631)
    {
        _803 = 2;
    }
    int _805 = _803;
    float _807 = -_745;
    float _809 = _709 + _807;
    int _811 = ~_563;
    int _813 = _811 + _599;
    int _815 = _813 + 1;
    float _817 = trunc(_779);
    int _819 = int(_817);
    float _821 = _795 * _737;
    bool _823 = !_615;
    int _825 = _823 ? 0 : 1;
    float _827 = _166 * _737;
    int _829 = _388 * _815;
    int _831 = _829 + _420;
    bool _833 = _388 == 0;
    float _835 = _166 * _749;
    int _837 = ~_581;
    int _839 = _837 + _647;
    int _841 = _839 + 1;
    float _843 = _809 * _749;
    bool _845 = !_833;
    int _847 = _845 ? _831 : (-1);
    float _849 = trunc(_821);
    int _851 = int(_849);
    bool _853 = !_707;
    int _855 = _853 ? 0 : 1;
    int _857 = _406 * _841;
    int _859 = _857 + _430;
    bool _861 = _406 == 0;
    float _863 = _783 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _865 = ~_789;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    bool _871 = !_611;
    int _873 = _871 ? 0 : 1;
    float _875 = trunc(_835);
    int _877 = int(_875);
    bool _879 = _805 != 2;
    int _881 = _847 * _869;
    int _883 = ~_819;
    int _885 = _883 + 1;
    int _887 = _885 + 1;
    bool _889 = !_861;
    int _891 = _889 ? _859 : (-1);
    int _893 = abs(_585);
    float _895 = trunc(_843);
    int _897 = int(_895);
    int _899 = _388 + (-1);
    int _901 = _891 * _887;
    int _903 = abs(_571);
    int _905 = _406 + (-1);
    int _907 = _789 * _899;
    int _909 = _907 + _881;
    int _911 = abs(_653);
    float _913 = trunc(_827);
    int _915 = int(_913);
    int _917 = abs(_659);
    int _919 = _819 * _905;
    int _921 = _919 + _901;
    int _923 = abs(_855);
    int _925 = _909 * _903;
    int _927 = abs(_627);
    int _929 = _921 * _911;
    int _931 = abs(_595);
    int _933 = _897 * _923;
    int _935 = _933 + _430;
    int _937 = _877 * _917;
    int _939 = _937 + _929;
    int _941 = _851 * _893;
    int _943 = _941 + _420;
    bool _945 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _947 = isnan(_360);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    bool _957 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _959 = isnan(_360);
    bool _961 = _957 || _959;
    bool _963 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _965 = _961 || _963;
    float _967 = float(_965);
    int _969 = _915 * _931;
    int _971 = _969 + _925;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _975 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_360);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    int _987 = _943 * _927;
    int _989 = _987 + _971;
    float _991 = -_955;
    float _993 = _991 + 1.0;
    float _995 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[78].w, _973);
    float _997 = -_985;
    float _999 = _997 + 1.0;
    int _1001 = abs(_639);
    float _1003 = _985 * _993;
    float _1005 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _995);
    int _1007 = abs(_873);
    float _1009 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1011 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1013 = abs(_825);
    float _1015 = _967 * _999;
    bool _1017 = _370 > 0.5;
    float _1019 = -_667;
    float _1021 = fma(_1005, _1011, _1019);
    int _1023 = _851 * _1001;
    int _1025 = _1023 + _989;
    int _1027 = _935 * _1007;
    int _1029 = _1027 + _939;
    float _1031 = _785 * _1015;
    float _1033 = _1015;
    if (!_713)
    {
        _1033 = _382;
    }
    float _1035 = _1033;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1039 = float(uint(_1025));
    int _1041 = _897 * _1013;
    int _1043 = _1041 + _1029;
    float _1045 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1047 = -_967;
    float _1049 = _1047 + 1.0;
    float _1051 = as_type<float>(_426) * _1039;
    float _1053 = float(uint(_1043));
    int _1055 = as_type<int>(_1039);
    float _1057 = _1035;
    float _1059 = _1053;
    if (_713)
    {
        float _1061 = -_382;
        float _1063 = _1061 + 1.0;
        _1055 = as_type<int>(_1063);
    }
    int _1065 = _1055;
    float _1067 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1031);
    float _1069 = fma(_1045, _523, -0.5);
    int _1071 = ~_388;
    int _1073 = _1071 + 1;
    float _1075 = as_type<float>(_442) * _1053;
    float _1077 = trunc(_1051);
    float _1079 = precise::max(_1077, 0.0);
    uint _1081 = uint(_1079);
    if (_713)
    {
        float _1083 = _1017 ? as_type<float>(_1065) : _382;
        _1057 = _1083;
    }
    float _1085 = _1057;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1089 = float(uint(_943));
    if (_879)
    {
        _1059 = _146;
    }
    float _1091 = _1059;
    float _1093 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1087);
    float _1095 = _1091;
    if (!_879)
    {
        _1095 = _376;
    }
    float _1097 = _1095;
    float _1099 = trunc(_1075);
    float _1101 = precise::max(_1099, 0.0);
    uint _1103 = uint(_1101);
    float _1105 = as_type<float>(_426) * _1089;
    float _1107 = float(uint(_935));
    float _1109 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1111 = _1073 * int(_1081);
    int _1113 = _1111 + _1025;
    int _1115 = ~_406;
    int _1117 = _1115 + 1;
    float _1119 = trunc(_1105);
    float _1121 = precise::max(_1119, 0.0);
    uint _1123 = uint(_1121);
    float _1125 = as_type<float>(_442) * _1107;
    int _1127 = ~_388;
    int _1129 = _1127 + 1;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1133 = float(uint(_1113));
    int _1135 = _1117 * int(_1103);
    int _1137 = _1135 + _1043;
    float _1139 = trunc(_1125);
    float _1141 = precise::max(_1139, 0.0);
    uint _1143 = uint(_1141);
    float _1145 = as_type<float>(_426) * _1133;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1149 = float(uint(_1137));
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_879)
    {
        _1151 = _370;
    }
    float _1153 = _1151;
    float _1155 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1147);
    float _1157 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1131);
    float _1159 = trunc(_1145);
    float _1161 = precise::max(_1159, 0.0);
    uint _1163 = uint(_1161);
    float _1165 = as_type<float>(_442) * _1149;
    float _1167 = _1153;
    if (!_879)
    {
        _1167 = _146;
    }
    float _1169 = _1167;
    int _1171 = _1129 * int(_1123);
    int _1173 = _1171 + _943;
    int _1175 = ~_406;
    int _1177 = _1175 + 1;
    float _1179 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1181 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1093);
    float _1183 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1185 = trunc(_1165);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    float _1191 = float(uint(_1173));
    float _1193 = fma(_791, _1003, _1067);
    float _1195 = fma(_1179, _1085, -0.5);
    int _1197 = ~_388;
    int _1199 = _1197 + 1;
    float _1201 = as_type<float>(_426) * _1191;
    float _1203 = fma(_1181, _1183, _677);
    int _1205 = _1177 * int(_1143);
    int _1207 = _1205 + _935;
    int _1209 = int(_1081) + int(_1163);
    float _1211 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1193);
    int _1213 = ~_406;
    int _1215 = _1213 + 1;
    float _1217 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1155);
    float _1219 = float(uint(_1207));
    int _1221 = _1199 * _1209;
    int _1223 = _1221 + _1025;
    float _1225 = trunc(_1201);
    float _1227 = precise::max(_1225, 0.0);
    uint _1229 = uint(_1227);
    int _1231 = int(_1103) + int(_1189);
    float _1233 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1235 = as_type<float>(_442) * _1219;
    int _1237 = _1215 * _1231;
    int _1239 = _1237 + _1043;
    out.m_61.w = _1233;
    bool _1241 = uint(_1223) >= uint(_388);
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1245 = uint(_1239) >= uint(_406);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1249 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1251 = !_1241;
    int _1253 = _1251 ? 0 : (-1);
    float _1255 = -_1243;
    float _1257 = fma(_1109, 2.0, _1255);
    float _1259 = trunc(_1235);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = fma(_1249, -2.0, _1247);
    int _1267 = ~_1209;
    int _1269 = _1267 + _1253;
    int _1271 = _1269 + 1;
    float _1273 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1157);
    float _1275 = -_116;
    float _1277 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1257);
    float _1279 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1265);
    bool _1281 = !_1245;
    int _1283 = _1281 ? 0 : (-1);
    int _1285 = _388 * _1271;
    int _1287 = _1285 + _1025;
    float _1289 = _781 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1293 = _863 + _1291;
    int _1295 = ~_1231;
    int _1297 = _1295 + _1283;
    int _1299 = _1297 + 1;
    float _1301 = fma(_1273, _1195, _1277);
    bool _1303 = !_833;
    int _1305 = _1303 ? _1287 : (-1);
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1289 + _1307;
    int _1311 = int(_1123) + int(_1229);
    int _1313 = _406 * _1299;
    int _1315 = _1313 + _1043;
    int _1317 = _1305 >> 31;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1321 = _801 + _1319;
    float _1323 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1325 = int(_1143) + int(_1263);
    float _1327 = -_1279;
    float _1329 = fma(_1217, _1069, _1327);
    int _1331 = _1317 & 3;
    float _1333 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1323);
    bool _1335 = !_861;
    int _1337 = _1335 ? _1315 : (-1);
    int _1339 = _1305 + _1331;
    float _1341 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1333);
    int _1343 = _1337 >> 31;
    int _1345 = _1339 >> 2;
    int _1347 = _1343 & 3;
    int _1349 = _1305 & 3;
    bool _1351 = _1349 != 0;
    int _1353 = _1337 + _1347;
    int _1355 = _1305 & 3;
    bool _1357 = _1355 != 0;
    int _1359 = _1345 << 4;
    int _1361 = _1359 + 368;
    int _1363 = _1353 >> 2;
    bool _1365 = !_1357;
    int _1367 = _1365 ? 0 : 1;
    uint _1369 = uint(int(uint(_1361) >> uint(2)));
    uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
    int _1373 = int(_1369) & 3;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[int(_1371)][_1373];
    int _1377 = int(_1369) + 1;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    int _1381 = _1377 & 3;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[int(_1379)][_1381];
    bool _1385 = uint(_1355) >= 2u;
    int _1387 = _1351 ? 0 : 1;
    bool _1389 = uint(_1355) > 1u;
    bool _1391 = _1355 != 3;
    int _1393 = _1363 << 4;
    int _1395 = _1393 + 512;
    int _1397 = _1385 ? 0 : 1;
    bool _1399 = _1341 >= 0.0;
    uint _1401 = uint(int(uint(_1395) >> uint(2)));
    uint _1403 = uint(int(uint(int(_1401)) >> uint(2)));
    int _1405 = int(_1401) & 3;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[int(_1403)][_1405];
    int _1409 = int(_1401) + 1;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    int _1413 = _1409 & 3;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[int(_1411)][_1413];
    int _1417 = ~_406;
    int _1419 = _1417 + 1;
    int _1421 = ~_388;
    int _1423 = _1421 + 1;
    int _1425 = ~_1387;
    int _1427 = _1425 + 1;
    int _1429 = _1427 + 1;
    int _1431 = _1419 * _1325;
    int _1433 = _1431 + _935;
    int _1435 = ~_1397;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    int _1441 = _1423 * _1311;
    int _1443 = _1441 + _943;
    int _1445 = _1429;
    int _1447 = _1439;
    if (!_1389)
    {
        int _1449 = ~_1387;
        int _1451 = _1449 + 1;
        _1445 = _1451;
    }
    int _1453 = _1445;
    if (_1391)
    {
        int _1455 = ~_1397;
        int _1457 = _1455 + 1;
        _1447 = _1457;
    }
    int _1459 = _1447;
    int _1461 = _1361 + 8;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[int(_1473)][_1475];
    bool _1479 = uint(_1433) >= uint(_406);
    if (_1399)
    {
        out.m_51.x = 0.0;
    }
    bool _1481 = uint(_1443) >= uint(_388);
    bool _1483 = !_1479;
    int _1485 = _1483 ? 0 : (-1);
    bool _1487 = !_1481;
    int _1489 = _1487 ? 0 : (-1);
    int _1491 = _1395 + 8;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    int _1509 = _1337 & 3;
    bool _1511 = _1509 != 0;
    int _1513 = _1337 & 3;
    bool _1515 = _1513 != 0;
    float _1517 = _1021 + 0.5;
    float _1519 = _1203 + 0.5;
    int _1521 = _1511 ? 0 : 1;
    bool _1523 = uint(_1513) > 1u;
    bool _1525 = !_1515;
    int _1527 = _1525 ? 0 : 1;
    out.m_63.x = _1519;
    out.m_63.y = _1517;
    bool _1529 = uint(_1513) >= 2u;
    int _1531 = ~_1311;
    int _1533 = _1531 + _1489;
    int _1535 = _1533 + 1;
    int _1537 = _1529 ? 0 : 1;
    bool _1539 = _1513 != 3;
    int _1541 = _388 * _1535;
    int _1543 = _1541 + _943;
    int _1545 = abs(_1453);
    int _1547 = ~_1325;
    int _1549 = _1547 + _1485;
    int _1551 = _1549 + 1;
    int _1553 = ~_1521;
    int _1555 = _1553 + 1;
    int _1557 = _1555 + 1;
    int _1559 = _1557;
    if (!_1523)
    {
        int _1561 = ~_1521;
        int _1563 = _1561 + 1;
        _1559 = _1563;
    }
    int _1565 = _1559;
    int _1567 = _406 * _1551;
    int _1569 = _1567 + _935;
    int _1571 = ~_1545;
    int _1573 = _1571 + 1;
    int _1575 = _1573 + 1;
    int _1577 = abs(_1367);
    int _1579 = abs(_1565);
    int _1581 = _1575 * as_type<int>(_1383);
    int _1583 = abs(_1527);
    int _1585 = ~_1537;
    int _1587 = _1585 + 1;
    int _1589 = _1587 + 1;
    int _1591 = ~_1579;
    int _1593 = _1591 + 1;
    int _1595 = _1593 + 1;
    int _1597 = _1589;
    if (_1539)
    {
        int _1599 = ~_1537;
        int _1601 = _1599 + 1;
        _1597 = _1601;
    }
    int _1603 = _1597;
    int _1605 = ~_1577;
    int _1607 = _1605 + 1;
    int _1609 = _1607 + 1;
    int _1611 = _1595 * as_type<int>(_1415);
    int _1613 = ~_1583;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    int _1619 = abs(_1459);
    int _1621 = _1609 * as_type<int>(_1375);
    int _1623 = _1621 + _1581;
    int _1625 = abs(_1603);
    int _1627 = _1617 * as_type<int>(_1407);
    int _1629 = _1627 + _1611;
    int _1631 = ~_1619;
    int _1633 = _1631 + 1;
    int _1635 = _1633 + 1;
    int _1637 = ~_1625;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    bool _1643 = _1355 != 3;
    int _1645 = _1635 * as_type<int>(_1469);
    int _1647 = _1645 + _1623;
    bool _1649 = _1513 != 3;
    int _1651 = _1641 * as_type<int>(_1499);
    int _1653 = _1651 + _1629;
    bool _1655 = !_1643;
    int _1657 = _1655 ? 0 : (-1);
    float _1659 = in.m_65.x;
    float _1661 = in.m_65.y;
    float _1663 = in.m_65.z;
    bool _1665 = !_1649;
    int _1667 = _1665 ? 0 : (-1);
    bool _1669 = !_701;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = abs(_1657);
    bool _1675 = !_719;
    int _1677 = _1675 ? 0 : 1;
    int _1679 = abs(_1667);
    int _1681 = abs(_1671);
    float _1683 = _1309 * _1309;
    int _1685 = abs(_1677);
    float _1687 = fma(_1321, _1321, _1683);
    int _1689 = ~_1673;
    int _1691 = _1689 + 1;
    int _1693 = _1691 + 1;
    int _1695 = ~_1679;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    float _1701 = fma(_1293, _1293, _1687);
    int _1703 = ~_1681;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1693 * as_type<int>(_1477);
    int _1711 = _1709 + _1647;
    bool _1713 = !_833;
    int _1715 = _1713 ? _1543 : (-1);
    int _1717 = _1699 * as_type<int>(_1507);
    int _1719 = _1717 + _1653;
    int _1721 = ~_1685;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    float _1727 = rsqrt(_1701);
    bool _1729 = !_861;
    int _1731 = _1729 ? _1569 : (-1);
    int _1733 = _1711 * _1707;
    float _1735 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1737 = _1719 * _1725;
    float _1739 = as_type<float>(_1711);
    if (_1399)
    {
        _1739 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1741 = _1739;
    int _1743 = _1715 * _1681;
    int _1745 = _1743 + _1733;
    float _1747 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1749 = _1731 * _1685;
    int _1751 = _1749 + _1737;
    float _1753 = _1301 + 0.5;
    float _1755 = _1747 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1757 = as_type<int>(_1741);
    if (_1399)
    {
        float _1759 = _1741 * 5.0;
        _1757 = as_type<int>(_1759);
    }
    int _1761 = _1757;
    float _1763 = _1329 + 0.5;
    float _1765 = float(_1745);
    float _1767 = float(_1751);
    float _1769 = _1755 * _1727;
    float _1771 = _1769;
    if (_1399)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5830 = as_type<float>(_1761);
        out.gl_Position.z = _5830;
    }
    float _1773 = _1321 * _1769;
    out.m_67.x = _1753;
    out.m_67.y = _1763;
    float _1775 = _1309 * _1769;
    out.m_69.x = _1765;
    out.m_69.y = _1767;
    if (_1399)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1777 = -_1775;
    float _1779 = _1289 + _1777;
    float _1781 = _1293 * _1769;
    float _1783 = -_1773;
    float _1785 = _801 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 + _1787;
    float _1791 = -_1781;
    float _1793 = _863 + _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1797 = _1785 + _1795;
    float _1799 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1803 = _1793 + _1801;
    float _1805 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1799);
    float _1807 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1805);
    bool _1809 = _1807 >= 0.0;
    float _1811 = _1781;
    float _1813 = _1803;
    float _1815 = _1779;
    float _1817 = _1785;
    if (_1809)
    {
        _1771 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1819 = _1771;
    int _1821 = as_type<int>(_1819);
    if (_1809)
    {
        out.m_51.x = 0.0;
    }
    if (_1809)
    {
        float _1823 = _1819 * 5.0;
        _1821 = as_type<int>(_1823);
    }
    int _1825 = _1821;
    if (_1809)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5931 = as_type<float>(_1825);
        out.gl_Position.z = _5931;
    }
    if (_1809)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1827 = -_1289;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1831 = -_801;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1835 = -_863;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1839 = _1829 * _1829;
    float _1841 = -_1775;
    float _1843 = _1309 + _1841;
    float _1845 = fma(_1833, _1833, _1839);
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1849 = fma(_1837, _1837, _1845);
    float _1851 = -_1773;
    float _1853 = _1321 + _1851;
    float _1855 = -_1847;
    float _1857 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1855);
    float _1859 = -_1781;
    float _1861 = _1293 + _1859;
    float _1863 = rsqrt(_1849);
    float _1865 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1867 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1869 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1871 = -_1869;
    float _1873 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1871);
    float _1875 = _1833 * _1863;
    float _1877 = _1837 * _1863;
    float _1879 = _1829 * _1863;
    float _1881 = _1875 * _1875;
    float _1883 = fma(_1877, _1877, _1881);
    float _1885 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1887 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1891 = rsqrt(_1883);
    float _1893 = -_1885;
    float _1895 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    float _1897 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1899 = -_1889;
    float _1901 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1903 = -_1887;
    float _1905 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1903);
    float _1907 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1909 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1913 = -_1897;
    float _1915 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1913);
    float _1917 = -_1909;
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1921 = -_1911;
    float _1923 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1921);
    float _1925 = -_1907;
    float _1927 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1925);
    float _1929 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1915);
    float _1931 = _1877 * _1891;
    float _1933 = _1875 * _1891;
    float _1935 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1927);
    float _1937 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1919);
    float _1939 = -_1931;
    float _1941 = _1877 * _1939;
    float _1943 = -_1931;
    float _1945 = _1879 * _1943;
    float _1947 = _1935 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1949 = -_1941;
    float _1951 = fma(_1875, _1933, _1949);
    float _1953 = _1879 * _1933;
    float _1955 = -_1947;
    float _1957 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1955);
    float _1959 = _1901 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1961 = _1951 * _1951;
    float _1963 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1957);
    float _1965 = -_1959;
    float _1967 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1969 = fma(_1953, _1953, _1961);
    float _1971 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1973 = _1895 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1975 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1967);
    float _1977 = fma(_1945, _1945, _1969);
    float _1979 = -_1971;
    float _1981 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1979);
    float _1983 = _1857 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1985 = -_1975;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1963);
    float _1989 = rsqrt(_1977);
    float _1991 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1981);
    float _1993 = -_1983;
    float _1995 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1993);
    float _1997 = -_1973;
    float _1999 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1997);
    float _2001 = fma(_1905, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1995);
    float _2003 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1999);
    float _2005 = 1.0 / _1987;
    float _2007 = _1951 * _1989;
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = 1.0 / _1735;
    float _2013 = -_2009;
    float _2015 = _2013 + 1.0;
    float _2017 = fma(_1991, _2005, -1.0);
    float _2019 = _2015 * _2005;
    float _2021 = 1.0 / _1865;
    float _2023 = fma(_2015, _2017, 1.0);
    float _2025 = _2001 * _2019;
    float _2027 = _2003 * _2019;
    float _2029 = _2023 * _2023;
    float _2031 = 1.0 / _1867;
    float _2033 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2035 = fma(_2025, _2025, _2029);
    float _2037 = fma(_2027, _2027, _2035);
    float _2039 = rsqrt(_2037);
    float _2041 = _2027 * _2039;
    float _2043 = _2023 * _2039;
    float _2045 = _2025 * _2039;
    float _2047 = -_2041;
    float _2049 = _1875 * _2047;
    float _2051 = _1877 * _2043;
    float _2053 = -_2045;
    float _2055 = -_2049;
    float _2057 = fma(_1877, _2053, _2055);
    float _2059 = -_2041;
    float _2061 = -_2051;
    float _2063 = fma(_1879, _2059, _2061);
    float _2065 = -_2045;
    float _2067 = _1879 * _2065;
    float _2069 = _2057 * _2057;
    float _2071 = -_2067;
    float _2073 = fma(_1875, _2043, _2071);
    float _2075 = fma(_2063, _2063, _2069);
    float _2077 = fma(_2073, _2073, _2075);
    float _2079 = rsqrt(_2077);
    float _2081 = _2063 * _2079;
    float _2083 = _2073 * _2079;
    float _2085 = _2057 * _2079;
    float _2087 = _1843 * _1843;
    float _2089 = _1877 * _2081;
    float _2091 = _1879 * _2083;
    float _2093 = _1875 * _2085;
    float _2095 = fma(_1853, _1853, _2087);
    float _2097 = -_2089;
    float _2099 = fma(_1875, _2083, _2097);
    float _2101 = -_2091;
    float _2103 = fma(_1877, _2085, _2101);
    float _2105 = -_2093;
    float _2107 = fma(_1879, _2081, _2105);
    float _2109 = fma(_1861, _1861, _2095);
    float _2111 = _2099 * _2099;
    float _2113 = sqrt(_2109);
    float _2115 = fma(_2103, _2103, _2111);
    float _2117 = fma(_2107, _2107, _2115);
    float _2119 = rsqrt(_2117);
    float _2121 = _1727 * _2113;
    float _2123 = in.m_71.x;
    float _2125 = in.m_71.y;
    float _2127 = in.m_71.z;
    float _2129 = _2107 * _2119;
    float _2131 = _2099 * _2119;
    float _2133 = _2103 * _2119;
    float _2135 = _1875 * _2129;
    float _2137 = _1877 * _2131;
    float _2139 = -_2135;
    float _2141 = fma(_1877, _2133, _2139);
    float _2143 = -_2137;
    float _2145 = fma(_1879, _2129, _2143);
    float _2147 = _1879 * _2133;
    float _2149 = _2141 * _2141;
    float _2151 = -_2147;
    float _2153 = fma(_1875, _2131, _2151);
    float _2155 = _1867 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2157 = fma(_2145, _2145, _2149);
    float _2159 = _2011 * _2123;
    float _2161 = fma(_2153, _2153, _2157);
    float _2163 = _2021 * _2125;
    float _2165 = _2121 * _2033;
    float _2167 = _1747 * _2121;
    float _2169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2159);
    float _2171 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2173 = rsqrt(_2161);
    float _2175 = _2031 * _2127;
    float _2177 = _2121 * _2155;
    float _2179 = _2171 * _2165;
    float _2181 = _2169 * _2167;
    float _2183 = _2175 * _2177;
    float _2185 = _2179 * _2133;
    float _2187 = _2179 * _2131;
    bool _2189 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.5);
    bool _2197 = _2193 || _2195;
    float _2199 = _2145 * _2173;
    float _2201 = _2141 * _2173;
    float _2203 = _2153 * _2173;
    float _2205 = _2179 * _2129;
    float _2207 = fma(_2181, _2199, _2185);
    float _2209 = fma(_2181, _2201, _2187);
    float _2211 = fma(_2181, _2203, _2205);
    float _2213 = fma(_1875, _2183, _2207);
    float _2215 = fma(_1879, _2183, _2209);
    float _2217 = fma(_1877, _2183, _2211);
    float _2219 = _801 + _2213;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2223 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2225 = _2215 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2227 = _2219 * 0.20000000298023223876953125;
    float _2229 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2221);
    float _2231 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2223);
    float _2233 = _1289 + _2215;
    float _2235 = floor(_2227);
    float _2237 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2229);
    float _2239 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2225);
    float _2241 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2231);
    float _2243 = _863 + _2217;
    float _2245 = _2237 * 64.0;
    float _2247 = fma(_2217, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2239);
    float _2249 = _2241 * 49.0;
    float _2251 = _2243 * 0.20000000298023223876953125;
    float _2253 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2255 = _2247 * 64.0;
    float _2257 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2259 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2253);
    float _2261 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2257);
    float _2263 = -_2235;
    float _2265 = _2227 + _2263;
    float _2267 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2259);
    float _2269 = floor(_2251);
    float _2271 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2261);
    float _2273 = _2265 * 6.283185482025146484375;
    float _2275 = _2243 + _2267;
    float _2277 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2279 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2281 = _2273 * 0.15915493667125701904296875;
    float _2283 = _2219 + _2271;
    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2249, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2277);
    float _2291 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2279);
    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2295 = _2283 + _2293;
    float _2297 = _2287 * _2287;
    float _2299 = _1779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2301 = _2281 * 6.283185482025146484375;
    float _2303 = sin(_2301);
    float _2305 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2291);
    float _2307 = -_2269;
    float _2309 = _2251 + _2307;
    float _2311 = fma(_2295, _2295, _2297);
    float _2313 = fma(_2255, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2289);
    float _2315 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2299);
    float _2317 = _2309 * 6.283185482025146484375;
    float _2319 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2321 = sqrt(_2311);
    float _2323 = _2233 + _2313;
    float _2325 = _2317 * 0.15915493667125701904296875;
    float _2327 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2315);
    float _2329 = _2325 * 6.283185482025146484375;
    float _2331 = sin(_2329);
    bool _2333 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(0.5);
    bool _2341 = _2337 || _2339;
    float _2343 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2345 = _2321 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2347 = 1.0 / _2319;
    float _2349 = _2303 + _2331;
    float _2351 = _2343 + _2319;
    float _2353 = fma(_2349, 0.20000000298023223876953125, _2323);
    float _2355 = _2343;
    float _2357 = _2283;
    float _2359 = _2353;
    float _2361 = _2275;
    if (!_2345)
    {
        _2355 = _2275;
    }
    float _2363 = _2355;
    bool _2365 = !_2345;
    float _2367 = _2363;
    if (!_2365)
    {
        float _2369 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2373 = _2321 + _2371;
        float _2375 = rsqrt(_2311);
        float _2377 = _2373 * _2369;
        float _2379 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2381 = _2377 * 0.15915493667125701904296875;
        float _2383 = _2381 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        float _2387 = _2381 * 6.283185482025146484375;
        float _2389 = sin(_2387);
        float _2391 = _2385 + (-1.0);
        float _2393 = fma(_2389, _2379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2397 = _2375 * _2393;
        float _2399 = fma(_2353, _2385, _2395);
        float _2401 = fma(_2295, _2397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2403 = fma(_2287, _2397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2357 = _2401;
        _2359 = _2399;
        _2367 = _2403;
        _2361 = _2395;
    }
    float _2405 = _2357;
    float _2407 = _2359;
    float _2409 = _2367;
    float _2411 = _2361;
    float _2413 = -_1773;
    float _2415 = _2413 + _2405;
    float _2417 = -_1775;
    float _2419 = _2417 + _2407;
    float _2421 = -_1781;
    float _2423 = _2421 + _2409;
    float _2425 = _2351 * _2347;
    float _2427 = _2425 * 0.5;
    float _2429 = _2411;
    float _2431 = _2419;
    float _2433 = _2415;
    float _2435 = _2423;
    float _2437 = _2409;
    if (_2341)
    {
        _2429 = 1.0;
    }
    float _2439 = _2429;
    float _2441 = _2439;
    if (!_2197)
    {
        float _2443 = _1789 * _1789;
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2447 = -_863;
        float _2449 = _2447 + _2409;
        float _2451 = -_801;
        float _2453 = _2451 + _2405;
        float _2455 = fma(_1797, _1797, _2443);
        float _2457 = -_1289;
        float _2459 = _2457 + _2407;
        float _2461 = fma(_1803, _1803, _2455);
        float _2463 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2465 = sqrt(_2461);
        float _2467 = 1.0 / _2121;
        float _2469 = _2463 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2471 = precise::min(_2465, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2473 = _2471 * _2445;
        float _2475 = _2473 * _2467;
        float _2477 = _2469 * _2475;
        float _2479 = _2449 * _2475;
        float _2481 = fma(_2453, _2477, _1785);
        float _2483 = fma(_2459, _2477, _1779);
        float _2485 = fma(_2469, _2479, _1793);
        _2431 = _2483;
        _2433 = _2481;
        _2435 = _2485;
        _1811 = _2445;
    }
    float _2487 = _2431;
    float _2489 = _2433;
    float _2491 = _2435;
    float _2493 = _1811;
    float _2495 = _2493;
    if (!_2341)
    {
        float _2497 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2501 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2499);
        float _2503 = _2497 * 0.15915493667125701904296875;
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
        float _2525 = 1.0 / _2501;
        float _2527 = _2521 * _2523;
        float _2529 = _2511 * 6.283185482025146484375;
        float _2531 = sin(_2529);
        float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2535 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2533;
        float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2539 = _2525 * _2537;
        float _2541 = 1.0 / _2527;
        float _2543 = 1.0 / _2535;
        float _2545 = _2531 * _2541;
        float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2549 = fma(_2545, _2539, _2547);
        float _2551 = _2549 * _2543;
        float _2553 = precise::clamp(_2551, 0.0, 1.0);
        _1813 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _2441 = _2553;
    }
    float _2555 = _1813;
    float _2557 = _2441;
    float _2559 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2561 = _2487 + _2559;
    float _2563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2565 = _2489 + _2563;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2569 = _2491 + _2567;
    float _2571 = _2561 * _2561;
    float _2573 = fma(_2565, _2565, _2571);
    float _2575 = fma(_2569, _2569, _2573);
    float _2577 = rsqrt(_2575);
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2581 = _2565 * _2579;
    float _2583 = _2569 * _2579;
    float _2585 = _2581 * _2581;
    float _2587 = _2583 * _2583;
    float _2589 = _2585 + _2587;
    float _2591 = sqrt(_2589);
    bool _2593 = _2591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2597 = _2591 + _2595;
    float _2599 = _2569;
    float _2601 = _2589;
    float _2603 = _2597;
    float _2605 = _2555;
    float _2607 = _2561;
    if (_2593)
    {
        float _2609 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2599 = _2609;
    }
    float _2611 = _2599;
    if (_2593)
    {
        float _2613 = rsqrt(_2589);
        _2601 = _2613;
    }
    float _2615 = _2601;
    float _2617 = _2615;
    if (_2593)
    {
        float _2619 = _2597 * _2611;
        _2603 = _2619;
    }
    float _2621 = _2603;
    if (_2593)
    {
        float _2623 = _2621 * 0.15915493667125701904296875;
        _2605 = _2623;
    }
    float _2625 = _2605;
    float _2627 = _2577;
    if (_2593)
    {
        float _2629 = _2625 * 6.283185482025146484375;
        float _2631 = sin(_2629);
        _2627 = _2631;
    }
    float _2633 = _2627;
    float _2635 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2637 = precise::max(0.0, _2635);
    float _2639 = _2571;
    float _2641 = _2637;
    float _2643 = _2635;
    if (_2593)
    {
        float _2645 = _2625 * 6.283185482025146484375;
        float _2647 = cos(_2645);
        _2639 = _2647;
    }
    float _2649 = _2639;
    float _2651 = -_2579;
    float _2653 = -_2637;
    float _2655 = fma(_2561, _2651, _2653);
    if (!_2593)
    {
        _2607 = _2583;
    }
    float _2657 = _2607;
    float _2659 = _2657;
    if (_2593)
    {
        float _2661 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2641 = _2661;
    }
    float _2663 = _2641;
    float _2665 = _2663;
    float _2667 = _2633;
    if (_2593)
    {
        float _2669 = fma(_2633, _2663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2665 = _2669;
    }
    float _2671 = _2665;
    float _2673 = _2671;
    if (!_2593)
    {
        _2667 = _2581;
    }
    float _2675 = _2667;
    float _2677 = _2675;
    float _2679 = _2649;
    if (_2593)
    {
        float _2681 = _2649 + (-1.0);
        _2643 = _2681;
    }
    float _2683 = _2643;
    if (_2593)
    {
        float _2685 = _2615 * _2671;
        _2437 = _2685;
    }
    float _2687 = _2437;
    if (!_2593)
    {
        _2673 = _2655;
    }
    float _2689 = _2673;
    float _2691 = _2689;
    if (_2593)
    {
        float _2693 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2495 = _2693;
    }
    float _2695 = _2495;
    if (_2593)
    {
        float _2697 = _2581 * _2687;
        _2677 = _2697;
    }
    float _2699 = _2677;
    if (!_2593)
    {
        _2617 = _2585;
    }
    float _2701 = _2617;
    float _2703 = _2701;
    if (_2593)
    {
        float _2705 = _2583 * _2687;
        _2659 = _2705;
    }
    float _2707 = _2659;
    if (_2593)
    {
        float _2709 = fma(_2655, _2649, _2695);
        _2691 = _2709;
    }
    float _2711 = _2691;
    if (_2593)
    {
        float _2713 = _2699 * _2699;
        _2703 = _2713;
    }
    float _2715 = _2703;
    float _2717 = sqrt(_2575);
    if (!_2593)
    {
        _2679 = _2587;
    }
    float _2719 = _2679;
    float _2721 = _2719;
    if (_2593)
    {
        float _2723 = _2707 * _2707;
        _2721 = _2723;
    }
    float _2725 = _2721;
    float _2727 = fma(_2711, _2711, _2715);
    float _2729 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2731 = _2727 + _2725;
    float _2733 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2729);
    float _2735 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2737 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2739 = rsqrt(_2731);
    float _2741 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2733);
    float _2743 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2745 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2735);
    float _2747 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2737);
    float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2751 = fma(_2717, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2749);
    float _2753 = precise::clamp(_2751, 0.0, 1.0);
    float _2755 = fma(_2489, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2743);
    float _2757 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2745);
    float _2759 = _2741 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2761 = -_2753;
    float _2763 = _2761 + 1.0;
    float _2765 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2755);
    float _2767 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2769 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2747);
    float _2771 = abs(_2763);
    float _2773 = log2(_2771);
    float _2775 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2777 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2779 = _2739 * _2699;
    float _2781 = _2739 * _2711;
    float _2783 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2785 = _2739 * _2707;
    float _2787 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2789 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2791 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    float _2793 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2795 = -_2787;
    float _2797 = fma(_2781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2795);
    float _2799 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2801 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2791);
    float _2803 = -_2793;
    float _2805 = fma(_2803, _2789, 1.0);
    float _2807 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2809 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2801);
    float _2811 = -_2785;
    float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2797);
    float _2815 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2817 = exp2(_2807);
    float _2819 = fma(_2813, -0.5, 0.5);
    float _2821 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2815);
    float _2823 = _2781 + 1.0;
    float _2825 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2821);
    float _2827 = log2(_2805);
    float _2829 = fma(_2813, 0.5, 0.5);
    float _2831 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2799);
    float _2833 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2825);
    float _2835 = fma(_2829, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2837 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2831);
    float _2839 = 1.0 / _2809;
    float _2841 = -_2781;
    float _2843 = fma(_2817, _2823, _2841);
    float _2845 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2837);
    float _2847 = fma(_2829, _2835, -0.212114393711090087890625);
    float _2849 = fma(_2843, 0.5, 0.5);
    float _2851 = fma(_2829, _2847, 1.570728778839111328125);
    float _2853 = sqrt(_2819);
    float _2855 = _2827 * 0.693147182464599609375;
    float _2857 = _2833 * _2839;
    float _2859 = _2845 * _2839;
    float _2861 = _2855 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2863 = fma(_2857, 0.5, 0.5);
    float _2865 = fma(_2859, -0.5, 0.5);
    float _2867 = _2853 * 0.636619746685028076171875;
    float3 _7616 = float3(_2863, _2865, _2861);
    float _2869 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7616, float3(0.0), isnan(_7616)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7616, float3(0.0), isnan(_7616)), level(0.0)).x;
    float3 _7627 = float3(_2863, _2865, _2861);
    float4 _2872 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7627, float3(0.0), isnan(_7627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7627, float3(0.0), isnan(_7627)), level(0.0)).xyzw;
    float _2874 = _2872.x;
    float _2876 = _2872.y;
    float _2878 = _2872.z;
    float _2880 = _2872.w;
    float _2882 = -_2851;
    float _2884 = fma(_2867, _2882, 1.0);
    float2 _7649 = float2(_2884, _2849);
    float3 _2888 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7649, float2(0.0), isnan(_7649)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7649, float2(0.0), isnan(_7649)), level(0.0)).xyz;
    float _2890 = _2888.x;
    float _2892 = _2888.y;
    float _2894 = _2888.z;
    float _2896 = in.m_73.y;
    bool _2898 = _2163 != 0.0;
    bool _2900 = isnan(_2163);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(0.0);
    bool _2906 = _2902 || _2904;
    float _2908 = in.m_73.z;
    bool _2910 = _2159 == 0.0;
    bool _2912 = !_2906;
    bool _2914 = _2910 && _2912;
    out.m_57.x = _328;
    out.m_57.y = _334;
    out.m_57.z = _336;
    out.m_57.w = _338;
    bool _2916 = _2175 == 0.0;
    bool _2918 = _2916 && _2914;
    out.m_61.w = _1233;
    out.m_75.x = _2199;
    out.m_75.y = _2201;
    out.m_75.z = _2203;
    out.m_77.x = _2489;
    out.m_77.y = _2487;
    out.m_77.z = _2491;
    int _2920 = as_type<int>(_2851);
    int _2922 = as_type<int>(_2863);
    float _2924 = _2767;
    if (_2918)
    {
        float _2926 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2896);
        _2920 = as_type<int>(_2926);
    }
    int _2928 = _2920;
    int _2930 = _2928;
    if (!_2918)
    {
        float _2932 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2896);
        _2930 = as_type<int>(_2932);
    }
    int _2934 = _2930;
    out.m_79.x = _1785;
    out.m_79.y = _1779;
    out.m_79.z = _1793;
    if (_2918)
    {
        float _2936 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2922 = as_type<int>(_2936);
    }
    int _2938 = _2922;
    int _2940 = _2938;
    if (!_2918)
    {
        float _2942 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2908);
        _2940 = as_type<int>(_2942);
    }
    int _2944 = _2940;
    bool _2946 = !_2918;
    float _2948 = _2946 ? as_type<float>(_2934) : _2896;
    float _2950 = in.m_73.x;
    bool _2952 = !_2918;
    float _2954 = _2952 ? as_type<float>(_2944) : _2908;
    float _2956 = _2948 * _2948;
    float _2958 = fma(_2954, _2954, _2956);
    float _2960 = _2956;
    if (_2918)
    {
        _2960 = _2896;
    }
    float _2962 = _2960;
    float _2964 = _2767 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2966 = _2962;
    if (!_2918)
    {
        _2966 = as_type<float>(_2934);
    }
    float _2968 = _2966;
    float _2970 = rsqrt(_2958);
    if (_2918)
    {
        _2924 = _2908;
    }
    float _2972 = _2924;
    float _2974 = fma(_2775, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2964);
    float _2976 = _2972;
    if (!_2918)
    {
        _2976 = as_type<float>(_2944);
    }
    float _2978 = _2976;
    float _2980 = _2133 * _2968;
    float _2982 = fma(_2759, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2974);
    float _2984 = fma(_2783, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2982);
    float _2986 = _2950;
    if (!_2918)
    {
        float _2988 = fma(_2159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2950);
        _2986 = _2988;
    }
    float _2990 = _2986;
    bool _2992 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2994 = isnan(_2717);
    bool _2996 = _2992 || _2994;
    bool _2998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3000 = _2996 || _2998;
    out.gl_Position.x = _2833;
    out.gl_Position.y = _2845;
    out.gl_Position.z = _2984;
    out.gl_Position.w = _2809;
    float _3002 = _2948 * _2970;
    float _3004 = _2954 * _2970;
    float _3006 = fma(_2199, _2990, _2980);
    float _3008 = -_1875;
    float _3010 = _3002 * _3008;
    float _3012 = -_1879;
    float _3014 = _3002 * _3012;
    float _3016 = -_1877;
    float _3018 = _3002 * _3016;
    float _3020 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3022 = fma(_3004, _2133, _3010);
    float _3024 = fma(_3004, _2131, _3014);
    float _3026 = fma(_3004, _2129, _3018);
    float _3028 = exp2(_3020);
    float _3030 = _2129 * _2968;
    float _3032 = _2131 * _2968;
    float _3034 = _2984 + _2809;
    out.m_81.x = _3022;
    out.m_81.y = _3024;
    out.m_81.z = _3026;
    float _3036 = fma(_2203, _2990, _3030);
    float _3038 = fma(_2201, _2990, _3032);
    float _3040 = _2833 + _2809;
    float _3042 = _2809 * 0.5;
    float _3044 = _3034 * 0.5;
    if (!_3000)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3046 = _1815;
    float _3048 = _3040 * 0.5;
    float _3050 = fma(_2845, -0.5, _3042);
    float _3052 = _3046;
    float _3054 = _3046;
    if (!_3000)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3056 = _1817;
    float _3058 = -_3028;
    float _3060 = _3058 + 1.0;
    float _3062 = fma(_1875, _2978, _3006);
    float _3064 = fma(_1879, _2978, _3038);
    float _3066 = fma(_1877, _2978, _3036);
    float _3068 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3048;
    out.m_83.y = _3050;
    out.m_83.z = _3044;
    out.m_83.w = _2809;
    out.m_85.x = _3062;
    out.m_85.y = _3064;
    out.m_85.z = _3066;
    float _3070 = _3068 * _2869;
    float _3072 = -_3068;
    float _3074 = _3072 + 1.0;
    float _3076 = _2557 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3078 = _2880 * _3070;
    float _3080 = _2880 * _3074;
    float _3082 = _2894 * _3070;
    float _3084 = fma(_2890, _3078, _2874);
    float _3086 = fma(_2892, _3078, _2876);
    float _3088 = _3078;
    float _3090 = _3056;
    float _3092 = _3056;
    if (!_3000)
    {
        _3088 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3094 = _3088;
    float _3096 = fma(_2880, _3082, _2878);
    out.m_87.x = _3084;
    out.m_87.y = _3086;
    out.m_87.z = _3096;
    out.m_87.w = _3080;
    bool _3098 = !_3000;
    float _3100 = _3094;
    float _3102 = _3094;
    if (!_3098)
    {
        bool _3104 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3106 = isnan(_2717);
        bool _3108 = _3104 || _3106;
        bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3112 = _3108 || _3110;
        if (!_3112)
        {
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3116 = _2717 + _3114;
            float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3120 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3118;
            float _3122 = 1.0 / _3120;
            float _3124 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3126 = _3124 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3130 = _3128 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3132 = _3116 * _3122;
            float _3134 = precise::clamp(_3132, 0.0, 1.0);
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3140 = fma(_3134, _3130, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3142 = fma(_3134, _3138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3144 = fma(_3134, _3126, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3092 = _3144;
            _3054 = _3142;
            _3102 = _3140;
            _3146 = true;
        }
        else
        {
            bool _3148 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3150 = isnan(_2717);
            bool _3152 = _3148 || _3150;
            bool _3154 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3156 = _3152 || _3154;
            if (!_3156)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3158 = _3052;
            _3054 = _3158;
            if (!_3156)
            {
                _3090 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3160 = _3090;
            _3092 = _3160;
            if (!_3156)
            {
                _3100 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3162 = _3100;
            bool _3164 = !_3156;
            _3102 = _3162;
            if (!_3164)
            {
                bool _3166 = _2717 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3168 = isnan(_2717);
                bool _3170 = _3166 || _3168;
                bool _3172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3174 = _3170 || _3172;
                if (!_3174)
                {
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3178 = _2717 + _3176;
                    float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3182 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3180;
                    float _3184 = 1.0 / _3182;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3194 = _3178 * _3184;
                    float _3196 = precise::clamp(_3194, 0.0, 1.0);
                    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3200 = _3198 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3202 = fma(_3196, _3192, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3204 = fma(_3196, _3200, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3206 = fma(_3196, _3188, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3092 = _3206;
                    _3054 = _3204;
                    _3102 = _3202;
                    _3146 = true;
                }
                else
                {
                    _3092 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3102 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3146 = false;
    float _3208 = _3092;
    float _3210 = _3054;
    float _3212 = _3102;
    float _3214 = _3076 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_89.x = 0.0;
    float _3216 = _3208 * 0.586610972881317138671875;
    bool _3218 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3214;
    float _3220 = fma(_3210, 0.298911988735198974609375, _3216);
    bool _3222 = _2557 > 0.0;
    bool _3224 = isnan(_2557);
    bool _3226 = _3222 || _3224;
    bool _3228 = isnan(0.0);
    bool _3230 = _3226 || _3228;
    float _3232 = fma(_3212, 0.114477999508380889892578125, _3220);
    float _3234 = -_3232;
    float _3236 = _3234 + _3210;
    float _3238 = -_3232;
    float _3240 = _3238 + _3208;
    float _3242 = -_3232;
    float _3244 = _3242 + _3212;
    float _3246 = fma(_3236, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    float _3248 = fma(_3240, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    float _3250 = fma(_3244, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3232);
    bool _3252 = !_3218;
    if (!_3252)
    {
        float _3254 = -_2487;
        float _3256 = _3254 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3258 = -_2489;
        float _3260 = _3258 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3262 = -_2491;
        float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3266 = _3256 * _3256;
        float _3268 = fma(_3260, _3260, _3266);
        float _3270 = fma(_3264, _3264, _3268);
        float _3272 = sqrt(_3270);
        float _3274 = rsqrt(_3270);
        float _3276 = -_3272;
        float _3278 = _3276 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3280 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3282 = precise::clamp(_3280, 0.0, 1.0);
        float _3284 = _3260 * _3274;
        float _3286 = _3256 * _3274;
        float _3288 = abs(_3282);
        float _3290 = log2(_3288);
        float _3292 = _3264 * _3274;
        float _3294 = _3284 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3296 = _3064 * _3286;
        float _3298 = -_3286;
        float _3300 = -_3294;
        float _3302 = fma(_3298, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3300);
        float _3304 = fma(_3062, _3284, _3296);
        float _3306 = -_3292;
        float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3302);
        float _3310 = fma(_3066, _3292, _3304);
        float _3312 = precise::clamp(_3310, 0.0, 1.0);
        float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3316 = _3308 + _3314;
        float _3318 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3320 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3322 = precise::clamp(_3320, 0.0, 1.0);
        float _3324 = exp2(_3318);
        float _3326 = _3324 * _3322;
        float _3328 = _3312 * _3326;
        float _3330 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3332 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3334 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3330;
        out.m_89.y = _3332;
        out.m_89.z = _3334;
    }
    out.m_91.x = _3246;
    out.m_91.y = _3248;
    out.m_91.z = _3250;
    if (_3230)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3336;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

