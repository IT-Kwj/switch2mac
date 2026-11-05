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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3566 = false;
    bool _2935 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3851 = as_type<float>(_124);
        out.gl_Position.z = _3851;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _144 = 0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _118 = _148;
    }
    float _150 = _118;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _126 = as_type<int>(_162);
    }
    int _164 = _126;
    int _166 = _164;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3922 = as_type<float>(_164);
        out.gl_Position.z = _3922;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    bool _172 = _168;
    float _190;
    if (!_170)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_108);
        float _196 = 1.0 / _194;
        float _198 = _142 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _204 = int(_202);
    float _206 = in.m_53.x;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _200 + _208;
    float _212 = in.m_55.x;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _216 = _214 != 0;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    float _222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _224 = int(_222);
    float _226 = in.m_53.z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _230 = _228 != 0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = _200 + _232;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _238 = _236 != 0;
    float _240 = in.m_53.y;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _200 + _242;
    float _246 = float(_204);
    float _248 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _250 = int(_248);
    float _252 = in.m_55.y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _256 = 0.0;
    if (_230)
    {
        _256 = 1.0;
    }
    float _258 = _256;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _262 = float(_224);
    float _264 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _266 = int(_264);
    float _268 = _258;
    if (_216)
    {
        bool _270 = _206 > 0.5;
        _172 = _270;
    }
    bool _272 = _172;
    float _274 = 0.0;
    float _276 = _212;
    if (!_216)
    {
        _274 = _212;
    }
    float _278 = _274;
    float _280 = _278;
    if (_238)
    {
        float _282 = -_212;
        float _284 = _282 + 1.0;
        _144 = as_type<int>(_284);
    }
    int _286 = _144;
    float _288 = 0.0;
    if (!_238)
    {
        _288 = _212;
    }
    float _290 = _288;
    float _292 = float(uint(_250));
    float _294 = 1.0 / _262;
    float _296 = 0.0;
    float _298 = _290;
    if (_230)
    {
        _296 = _206;
    }
    float _300 = _296;
    int _302 = 0;
    float _304 = _300;
    if (_230)
    {
        _302 = 0;
    }
    int _306 = _302;
    float _308 = 0.0;
    int _310 = _306;
    if (_230)
    {
        _308 = 1.0;
    }
    float _312 = _308;
    float _314 = _312;
    if (!_230)
    {
        _268 = 7.345489978790283203125;
    }
    float _316 = _268;
    float _318 = 1.0 / _246;
    float _320 = float(uint(_266));
    float _322 = _206 * 2.0;
    if (!_230)
    {
        _304 = _240;
    }
    float _324 = _304;
    float _326 = _316 * _206;
    if (!_230)
    {
        _310 = 2;
    }
    int _328 = _310;
    if (!_230)
    {
        _314 = 1.2345600128173828125;
    }
    float _330 = _314;
    float _332 = _294 * _142;
    float _334 = 1.0 / _320;
    float _336 = _324 * _330;
    float _338 = _318 * _142;
    float _340 = trunc(_332);
    int _342 = int(_340);
    float _344 = in.m_53.w;
    int _346 = as_type<int>(_318);
    if (_216)
    {
        float _348 = -_212;
        float _350 = _348 + 1.0;
        _346 = as_type<int>(_350);
    }
    int _352 = _346;
    float _354 = float(_108);
    if (_216)
    {
        float _356 = _272 ? as_type<float>(_352) : _212;
        _280 = _356;
    }
    float _358 = _280;
    float _360 = 1.0 / _292;
    int _362 = as_type<int>(_334) + (-2);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = float(_250);
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _380 = _378 != 0;
    float _382 = trunc(_338);
    int _384 = int(_382);
    float _386 = float(uint(_342));
    float _388 = _368 * _142;
    bool _390 = _226 > 0.5;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _394 = _392 != 0;
    float _396 = as_type<float>(_362) * _386;
    if (_238)
    {
        float _398 = _390 ? as_type<float>(_286) : _212;
        _298 = _398;
    }
    float _400 = _298;
    float _402 = 1.0 / _354;
    int _404 = as_type<int>(_360) + (-2);
    bool _406 = _344 > 0.5;
    float _408 = _240 * 2.0;
    bool _410 = !_372;
    int _412 = _410 ? 0 : 1;
    bool _414 = !_376;
    int _416 = _414 ? 0 : 1;
    float _418 = trunc(_396);
    float _420 = precise::max(_418, 0.0);
    uint _423 = uint(_420);
    float _425 = float(uint(_384));
    float _427 = as_type<float>(_384);
    if (_394)
    {
        float _429 = -_212;
        float _431 = _429 + 1.0;
        _166 = as_type<int>(_431);
    }
    int _433 = _166;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _437 = _435 != 0;
    bool _439 = _240 > 0.5;
    float _441 = as_type<float>(_404) * _425;
    bool _443 = !_437;
    int _445 = _443 ? 0 : 1;
    float _447 = floor(_408);
    int _449 = ~_266;
    int _451 = _449 + 1;
    float _453 = _388 * _402;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _457 = _455 != 0;
    if (_394)
    {
        float _459 = _439 ? as_type<float>(_433) : _212;
        _276 = _459;
    }
    float _461 = _276;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _465 = _463 != 0;
    float _467 = trunc(_441);
    float _469 = precise::max(_467, 0.0);
    uint _471 = uint(_469);
    int _473 = _451 * int(_423);
    int _475 = _473 + _342;
    bool _477 = !_380;
    int _479 = _477 ? 0 : 1;
    bool _481 = !_465;
    int _483 = _481 ? 0 : 1;
    float _485 = float(uint(_475));
    float _487 = floor(_322);
    int _489 = ~_250;
    int _491 = _489 + 1;
    float _493 = as_type<float>(_362) * _485;
    float _495 = float(_266);
    int _497 = _491 * int(_471);
    int _499 = _497 + _384;
    float _501 = -_252;
    float _503 = _501 + 1.0;
    float _505 = trunc(_493);
    float _507 = precise::max(_505, 0.0);
    uint _509 = uint(_507);
    float _511 = _495 * _142;
    float _513 = float(uint(_499));
    int _515 = _439 ? as_type<int>(_503) : as_type<int>(_252);
    float _517 = _511 * _402;
    bool _519 = _447 >= 0.0;
    bool _521 = isnan(_447);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = as_type<float>(_404) * _513;
    float _531 = _457 ? as_type<float>(_515) : _252;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _533;
    bool _537 = _447 > 0.0;
    float _539 = trunc(_529);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _406 ? as_type<int>(_503) : as_type<int>(_252);
    int _547 = _390 ? as_type<int>(_503) : as_type<int>(_252);
    int _549 = as_type<int>(_503);
    float _551 = _531;
    if (_230)
    {
        _549 = 0;
    }
    int _553 = _549;
    bool _555 = _487 > 0.0;
    int _557 = _553;
    if (!_230)
    {
        _557 = 1;
    }
    int _559 = _557;
    int _561 = _527 ? 0 : 1;
    bool _563 = _487 >= 0.0;
    bool _565 = isnan(_487);
    bool _567 = _563 || _565;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    bool _573 = _559 != 1;
    int _575 = _571 ? 0 : 1;
    int _577 = int(_471) + int(_543);
    int _579 = int(_423) + int(_509);
    int _581 = ~_250;
    int _583 = _581 + 1;
    float _585 = in.m_46.x;
    float _587 = in.m_46.y;
    float _589 = in.m_46.z;
    int _591 = ~_575;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    int _597 = _595;
    if (!_555)
    {
        int _599 = ~_575;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    int _605 = _583 * _577;
    int _607 = _605 + _384;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _611 = _609 != 0;
    int _613 = ~_266;
    int _615 = _613 + 1;
    float _617 = 0.0;
    if (!_573)
    {
        _617 = _240;
    }
    float _619 = _617;
    bool _621 = !_611;
    int _623 = _621 ? 0 : 1;
    int _625 = _615 * _579;
    int _627 = _625 + _342;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _635 = _633 != 0;
    bool _637 = uint(_607) >= uint(_250);
    float _639 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _641 = ~_561;
    int _643 = _641 + 1;
    int _645 = _643 + 1;
    float _647 = 0.0;
    int _649 = _645;
    float _651 = _619;
    if (!_573)
    {
        _647 = _619;
    }
    float _653 = _647;
    float _655 = -_260;
    float _657 = fma(_639, 2.0, _655);
    float _659 = 0.0;
    float _661 = _653;
    if (!_573)
    {
        _659 = _226;
    }
    float _663 = _659;
    float _665 = _587 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = 0.0;
    float _669 = _663;
    if (!_573)
    {
        _667 = _226;
    }
    float _671 = _667;
    float _673 = _587 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _675 = _671;
    if (!_537)
    {
        int _677 = ~_561;
        int _679 = _677 + 1;
        _649 = _679;
    }
    int _681 = _649;
    float _683 = _587 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_573)
    {
        _661 = _206;
    }
    float _685 = _661;
    float _687 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    if (_573)
    {
        _651 = _206;
    }
    float _689 = _651;
    float _691 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].x, _673);
    if (_573)
    {
        _669 = _240;
    }
    float _693 = _669;
    float _695 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].x, _683);
    if (_573)
    {
        _675 = _240;
    }
    float _697 = _675;
    float _699 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[4].z, _687);
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _707 = _705 != 0;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _711 = _709 != 0;
    float _713 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    bool _715 = uint(_627) >= uint(_266);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _717;
    float _721 = _631 ? as_type<float>(_545) : _252;
    float _723 = _240 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _725 = !_637;
    int _727 = _725 ? 0 : (-1);
    float _729 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _737 = _735 != 0;
    float _739 = fma(_723, -2.0, _254);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _745 = _635 ? as_type<float>(_547) : _252;
    float _747 = _206 + _252;
    bool _749 = !_715;
    int _751 = _749 ? 0 : (-1);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _763 = _761 != 0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _765;
    float _769 = 1.0 / _755;
    float _771 = -_142;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[76].x, _657);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _783 = !_703;
    int _785 = _783 ? 0 : 1;
    float _787 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    float _789 = 1.0 / _767;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _793 = _713 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _795 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _797 = isnan(_200);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _809 = !_707;
    int _811 = _809 ? 0 : 1;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _817 = 1.0 / _777;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = _226 * 2.0;
    float _833 = 1.0 / _781;
    float _835 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _210 * _789;
    float _839 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _827;
    out.m_57.y = _807;
    out.m_57.z = _835;
    float _845 = _220 * _769;
    float _847 = floor(_831);
    float _849 = _206 + _240;
    float _851 = in.m_59.x;
    float _853 = in.m_59.y;
    float _855 = in.m_59.z;
    float _857 = _234 * _817;
    float _859 = _849 + (-1.0);
    float _861 = in.m_61.x;
    float _863 = in.m_61.y;
    float _865 = in.m_61.z;
    float _867 = in.m_61.w;
    float _869 = fma(_366, _837, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _871 = _244 * _833;
    out.m_63.x = _839;
    out.m_63.y = _841;
    out.m_63.z = _843;
    float _873 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _875 = fma(_719, _857, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _877 = fma(_535, _857, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _883 = fma(_743, _845, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _885 = _847 >= 0.0;
    bool _887 = isnan(_847);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = -_805;
    float _897 = _895 + 1.0;
    float _899 = floor(_326);
    bool _901 = !_711;
    int _903 = _901 ? 0 : 1;
    float _905 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _907 = _893 ? 0 : 1;
    float _909 = _206 + _226;
    float _911 = _240 + _226;
    bool _913 = _847 > 0.0;
    float _915 = _909 + (-1.0);
    int _917 = abs(_811);
    float _919 = _911 + (-1.0);
    int _921 = abs(_903);
    float _923 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _925 = _851 * _865;
    float _927 = _855 * _863;
    float _929 = _853 * _861;
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _933 = -_925;
    float _935 = fma(_855, _861, _933);
    float _937 = -_927;
    float _939 = fma(_853, _865, _937);
    float _941 = -_929;
    float _943 = fma(_851, _863, _941);
    float _945 = _935 * _867;
    float _947 = _939 * _867;
    float _949 = _943 * _867;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _955;
    float _959 = -_899;
    float _961 = _326 + _959;
    float _963 = float(_681);
    float _965 = fma(_953, _837, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _967 = fma(_957, _837, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _975 = _973 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _977;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _983 = fma(_971, _845, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _985 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _987 = isnan(_200);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = fma(_979, _857, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1003 = fma(_975, _845, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1005 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _1007 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1009 = isnan(_200);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1021 = fma(_1001, _871, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1023 = -_995;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_815, _871, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _1029 = ~_907;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = _995 * _897;
    int _1037 = _1033;
    float _1039 = _851;
    float _1041 = _853;
    float _1043 = _855;
    if (!_913)
    {
        int _1045 = ~_907;
        int _1047 = _1045 + 1;
        _1037 = _1047;
    }
    int _1049 = _1037;
    float _1051 = _1017 * _1025;
    bool _1053 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1055 = isnan(_200);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = fma(_142, 0.039999999105930328369140625, _747);
    bool _1067 = _328 != 2;
    float _1069 = -_1017;
    float _1071 = _1069 + 1.0;
    bool _1073 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1075 = isnan(_200);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -_1063;
    float _1087 = _1085 + 1.0;
    float _1089 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1091 = _1063 * _1071;
    float _1093 = floor(_336);
    float _1095 = _1083 * _1087;
    float _1097 = in.m_65.x;
    float _1099 = in.m_65.y;
    float _1101 = in.m_65.z;
    float _1103 = _1089 * 0.15915493667125701904296875;
    float _1105 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1107 = _965 * _1095;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    float _1113 = _869 * _1095;
    float _1115 = _1103 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = _967 * _1095;
    float _1121 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1107);
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1113);
    int _1125 = abs(_785);
    float _1127 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1119);
    float _1129 = fma(_983, _1091, _1121);
    float _1131 = float(_342);
    float _1133 = -_1093;
    float _1135 = _336 + _1133;
    float _1137 = float(_384);
    float _1139 = fma(_883, _1091, _1123);
    float _1141 = fma(_1003, _1091, _1127);
    bool _1143 = _1131 >= _495;
    bool _1145 = isnan(_1131);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_495);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = _495 * _1135;
    bool _1157 = _1137 >= _368;
    bool _1159 = isnan(_1137);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(_368);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = _961 * _368;
    float _1171 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1173 = _981 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1175 = fma(_875, _1051, _1129);
    float _1177 = fma(_877, _1051, _1139);
    float _1179 = fma(_851, _1171, _1097);
    float _1181 = fma(_853, _1171, _1099);
    float _1183 = _1097;
    if (_1067)
    {
        _1183 = _206;
    }
    float _1185 = _1183;
    float _1187 = fma(_855, _1171, _1101);
    float _1189 = fma(_997, _1051, _1141);
    float _1191 = _1185;
    if (!_1067)
    {
        _1191 = _226;
    }
    float _1193 = _1191;
    float _1195 = fma(_1173, _461, -0.5);
    float _1197 = float(_603);
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1201 = float(_917);
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1205 = float(_921);
    float _1207 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1209 = log2(_1207);
    float _1211 = float(_1049);
    float _1213 = -_1199;
    float _1215 = fma(_1203, 2.0, _1213);
    float _1217 = _1205 * _963;
    float _1219 = _685 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1221 = _1201 * _1197;
    float _1223 = trunc(_1169);
    int _1225 = int(_1223);
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1229 = ~_579;
    int _1231 = _1229 + _751;
    int _1233 = _1231 + 1;
    float _1235 = fma(_1021, _1035, _1175);
    float _1237 = float(_1125);
    float _1239 = -_1227;
    float _1241 = fma(_1219, 2.0, _1239);
    float _1243 = fma(_1027, _1035, _1189);
    float _1245 = trunc(_1155);
    int _1247 = int(_1245);
    int _1249 = ~_577;
    int _1251 = _1249 + _727;
    int _1253 = _1251 + 1;
    float _1255 = _1237 * _1211;
    int _1257 = abs(_623);
    float _1259 = _693 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1261 = _250 * _1253;
    int _1263 = _1261 + _384;
    int _1265 = abs(_445);
    float _1267 = trunc(_1167);
    int _1269 = int(_1267);
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1273 = in.m_67.x;
    float _1275 = in.m_67.y;
    float _1277 = in.m_67.z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = fma(_1259, -2.0, _1271);
    int _1283 = _1225 * _1265;
    int _1285 = _1283 + _384;
    float _1287 = _1209 * _142;
    float _1289 = trunc(_1153);
    int _1291 = int(_1289);
    if (_1067)
    {
        _427 = _240;
    }
    float _1293 = _427;
    int _1295 = _1247 * _1257;
    int _1297 = _1295 + _342;
    float _1299 = _1293;
    if (!_1067)
    {
        _1299 = _206;
    }
    float _1301 = _1299;
    int _1303 = _266 * _1233;
    int _1305 = _1303 + _342;
    float _1307 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    bool _1309 = !_737;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = _1255 * (-2.0);
    bool _1315 = _250 == 0;
    float _1317 = exp2(_1287);
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1321 = ~_1269;
    int _1323 = _1321 + 1;
    int _1325 = _1323 + 1;
    float _1327 = fma(_873, _1313, _873);
    bool _1329 = !_1315;
    int _1331 = _1329 ? _1263 : (-1);
    float _1333 = fma(_745, _1105, -0.5);
    float _1335 = _729 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1337 = _266 == 0;
    int _1339 = _1331 * _1325;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1343 = ~_1291;
    int _1345 = _1343 + 1;
    int _1347 = _1345 + 1;
    float _1349 = fma(_1313, _1273, _1273);
    bool _1351 = !_1337;
    int _1353 = _1351 ? _1305 : (-1);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1357 = !_733;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = -_1317;
    float _1363 = _1361 + 1.0;
    bool _1365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1367 = isnan(0.0);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1373 = _1369 || _1371;
    int _1375 = _1347 * _1353;
    float _1377 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1355);
    float _1379 = trunc(_453);
    int _1381 = int(_1379);
    float _1383 = float(uint(_1285));
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1387 = _1373 ? _1363 : 0.0;
    float _1389 = _206 + (-0.5);
    bool _1391 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1393 = isnan(1.0);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1399 = _1395 || _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1403 = 1.0 + _1401;
    float _1405 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1385);
    float _1407 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1377);
    float _1409 = as_type<float>(_404) * _1383;
    float _1411 = fma(_1319, -2.0, _1341);
    int _1413 = _250 + (-1);
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1417 = 1.0 / _1403;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1421 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1349);
    float _1423 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1415);
    int _1425 = _1269 * _1413;
    int _1427 = _1425 + _1339;
    int _1429 = abs(_416);
    float _1431 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1419);
    float _1433 = trunc(_1409);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1441 = _266 + (-1);
    float _1443 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1423);
    float _1445 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1439);
    float _1447 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1405);
    float _1449 = float(uint(_1297));
    float _1451 = trunc(_517);
    int _1453 = int(_1451);
    int _1455 = abs(_1311);
    int _1457 = _1291 * _1441;
    int _1459 = _1457 + _1375;
    int _1461 = ~_250;
    int _1463 = _1461 + 1;
    float _1465 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1445);
    float _1467 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1281);
    float _1469 = -_142;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1215);
    float _1473 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1307);
    float _1475 = as_type<float>(_362) * _1449;
    float _1477 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1431);
    float _1479 = -_142;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1241);
    float _1483 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1411);
    if (_1399)
    {
        float _1485 = _1387 * _1417;
        _146 = _1485;
    }
    float _1487 = _146;
    int _1489 = abs(_412);
    int _1491 = _1463 * int(_1437);
    int _1493 = _1491 + _1285;
    int _1495 = abs(_1359);
    int _1497 = _1459 * _1455;
    int _1499 = _1427 * _1429;
    float _1501 = fma(_1327, _1487, _1421);
    float _1503 = float(uint(_1493));
    int _1505 = _1381 * _1489;
    int _1507 = _1505 + _1499;
    int _1509 = ~_266;
    int _1511 = _1509 + 1;
    int _1513 = _1453 * _1495;
    int _1515 = _1513 + _1497;
    bool _1517 = !_759;
    int _1519 = _1517 ? 0 : 1;
    float _1521 = as_type<float>(_404) * _1503;
    int _1523 = abs(_479);
    float _1525 = trunc(_1475);
    float _1527 = precise::max(_1525, 0.0);
    uint _1529 = uint(_1527);
    float _1531 = fma(_1407, _1195, _1471);
    int _1533 = abs(_483);
    float _1535 = -_1483;
    float _1537 = fma(_1465, _1333, _1535);
    bool _1539 = !_763;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = trunc(_1521);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    int _1549 = abs(_1519);
    int _1551 = _1285 * _1523;
    int _1553 = _1551 + _1507;
    int _1555 = abs(_1541);
    float _1557 = _1501 * 0.15915493667125701904296875;
    int _1559 = _1511 * int(_1529);
    int _1561 = _1559 + _1297;
    int _1563 = _1225 * _1533;
    int _1565 = _1563 + _1553;
    float _1567 = fma(_1005, _1035, _1177);
    int _1569 = _1297 * _1549;
    int _1571 = _1569 + _1515;
    float _1573 = float(uint(_1561));
    float _1575 = _1221 * (-2.0);
    float _1577 = float(uint(_1565));
    int _1579 = _1247 * _1555;
    int _1581 = _1579 + _1571;
    float _1583 = _240 + (-0.5);
    float _1585 = as_type<float>(_362) * _1573;
    float _1587 = fma(_1575, _1275, _1275);
    float _1589 = as_type<float>(_404) * _1577;
    float _1591 = float(uint(_1581));
    float _1593 = trunc(_1585);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = ~_250;
    int _1601 = _1599 + 1;
    float _1603 = fma(_931, _1575, _931);
    float _1605 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1587);
    float _1607 = as_type<float>(_362) * _1591;
    float _1609 = in.m_69.x;
    float _1611 = in.m_69.y;
    float _1613 = in.m_69.z;
    int _1615 = ~_266;
    int _1617 = _1615 + 1;
    float _1619 = fma(_1603, _1487, _1605);
    float _1621 = trunc(_1589);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = _1217 * (-2.0);
    float _1629 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1567);
    bool _1631 = _1181 != 0.0;
    bool _1633 = isnan(_1181);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan(0.0);
    bool _1639 = _1635 || _1637;
    float _1641 = fma(_1627, _1277, _1277);
    float _1643 = _226 + (-0.5);
    bool _1645 = _1179 == 0.0;
    bool _1647 = !_1639;
    bool _1649 = _1645 && _1647;
    float _1651 = trunc(_1607);
    float _1653 = precise::max(_1651, 0.0);
    uint _1655 = uint(_1653);
    float _1657 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1235);
    float _1659 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1243);
    float _1661 = fma(_923, _1627, _923);
    float _1663 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1641);
    bool _1665 = _1187 == 0.0;
    bool _1667 = _1665 && _1649;
    int _1669 = _1601 * int(_1625);
    int _1671 = _1669 + _1565;
    float _1673 = _1619 * 0.15915493667125701904296875;
    float _1675 = _1557 * 6.283185482025146484375;
    float _1677 = cos(_1675);
    int _1679 = int(_1437) + int(_1547);
    float _1681 = float(uint(_1671));
    float _1683 = _1629 * _1611;
    float _1685 = _1657 * _1609;
    int _1687 = _1617 * int(_1655);
    int _1689 = _1687 + _1581;
    float _1691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1181);
    float _1693 = as_type<float>(_404) * _1681;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1697 = _1673 * 6.283185482025146484375;
    float _1699 = sin(_1697);
    float _1701 = float(uint(_1689));
    float _1703 = _1659 * _1613;
    float _1705 = fma(_1661, _1487, _1663);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1179);
    if (!_1667)
    {
        float _1709 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _851);
        _1039 = _1709;
    }
    float _1711 = _1039;
    float _1713 = as_type<float>(_362) * _1701;
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1717 = trunc(_1693);
    float _1719 = precise::max(_1717, 0.0);
    uint _1721 = uint(_1719);
    float _1723 = _1705 * 0.15915493667125701904296875;
    float _1725 = _1707 * _1695;
    float _1727 = _1691 * _1715;
    int _1729 = ~_250;
    int _1731 = _1729 + 1;
    if (!_1667)
    {
        float _1733 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[17].y, _853);
        _1041 = _1733;
    }
    float _1735 = _1041;
    int _1737 = ~_266;
    int _1739 = _1737 + 1;
    if (!_1667)
    {
        float _1741 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[17].y, _855);
        _1043 = _1741;
    }
    float _1743 = _1043;
    float _1745 = trunc(_1713);
    float _1747 = precise::max(_1745, 0.0);
    uint _1749 = uint(_1747);
    float _1751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1187);
    int _1753 = int(_1529) + int(_1597);
    int _1755 = ~_250;
    int _1757 = _1755 + 1;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1761 = _1759 != 0;
    float _1763 = _1673 * 6.283185482025146484375;
    float _1765 = cos(_1763);
    int _1767 = int(_1625) + int(_1721);
    int _1769 = _1731 * _1767;
    int _1771 = _1769 + _1565;
    float _1773 = _1723 * 6.283185482025146484375;
    float _1775 = cos(_1773);
    int _1777 = int(_1655) + int(_1749);
    float _1779 = _1703 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1781 = uint(_1771) >= uint(_250);
    float _1783 = _1677 * _1699;
    int _1785 = _1739 * _1777;
    int _1787 = _1785 + _1581;
    float _1789 = _1751 * _1779;
    float _1791 = _1557 * 6.283185482025146484375;
    float _1793 = sin(_1791);
    bool _1795 = !_1781;
    int _1797 = _1795 ? 0 : (-1);
    float _1799 = _1677 * _1765;
    bool _1801 = uint(_1787) >= uint(_266);
    int _1803 = ~_1767;
    int _1805 = _1803 + _1797;
    int _1807 = _1805 + 1;
    float _1809 = _1723 * 6.283185482025146484375;
    float _1811 = sin(_1809);
    float _1813 = _1677 * _1775;
    float _1815 = _1699 * _1775;
    float _1817 = _1813 * _863;
    float _1819 = _1813 * _1727;
    float _1821 = _1813 * _945;
    float _1823 = _1793 * _1765;
    float _1825 = _1793 * _1699;
    float _1827 = _1765 * _1775;
    float _1829 = _1793 * _1775;
    bool _1831 = !_1801;
    int _1833 = _1831 ? 0 : (-1);
    float _1835 = _1829 * _863;
    float _1837 = -_1783;
    float _1839 = fma(_1811, _1823, _1837);
    float _1841 = -_1823;
    float _1843 = fma(_1811, _1783, _1841);
    int _1845 = ~_1777;
    int _1847 = _1845 + _1833;
    int _1849 = _1847 + 1;
    int _1851 = _250 * _1807;
    int _1853 = _1851 + _1565;
    float _1855 = -_1727;
    float _1857 = _1811 * _1855;
    float _1859 = fma(_1811, _1799, _1825);
    float _1861 = fma(_1811, _1825, _1799);
    float _1863 = -_1735;
    float _1865 = _1811 * _1863;
    float _1867 = -_863;
    float _1869 = _1811 * _1867;
    float _1871 = -_945;
    float _1873 = _1811 * _1871;
    float _1875 = fma(_1827, _1725, _1857);
    bool _1877 = !_1315;
    int _1879 = _1877 ? _1853 : (-1);
    float _1881 = fma(_1827, _1711, _1865);
    float _1883 = fma(_1827, _861, _1869);
    float _1885 = fma(_1827, _947, _1873);
    int _1887 = _266 * _1849;
    int _1889 = _1887 + _1581;
    int _1891 = _1879 & 3;
    bool _1893 = _1891 != 0;
    int _1895 = _1757 * _1679;
    int _1897 = _1895 + _1285;
    int _1899 = _1879 & 3;
    bool _1901 = _1899 != 0;
    float _1903 = _1813 * _1735;
    bool _1905 = !_1337;
    int _1907 = _1905 ? _1889 : (-1);
    float _1909 = _1829 * _1735;
    int _1911 = _1893 ? 0 : 1;
    float _1913 = _1829 * _1727;
    bool _1915 = uint(_1899) > 1u;
    float _1917 = fma(_1859, _1711, _1903);
    int _1919 = _1907 >> 31;
    float _1921 = fma(_1859, _861, _1817);
    int _1923 = _1879 >> 31;
    float _1925 = fma(_1839, _861, _1835);
    int _1927 = _1919 & 3;
    float _1929 = _1829 * _945;
    int _1931 = _1923 & 3;
    float _1933 = fma(_1839, _1725, _1913);
    int _1935 = _1907 + _1927;
    float _1937 = fma(_1839, _947, _1929);
    int _1939 = ~_1911;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1815, _1789, _1875);
    int _1947 = _1879 + _1931;
    float _1949 = fma(_1815, _1743, _1881);
    int _1951 = _1943;
    if (!_1915)
    {
        int _1953 = ~_1911;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    float _1959 = fma(_1843, _1743, _1917);
    bool _1961 = uint(_1897) >= uint(_250);
    float _1963 = fma(_1861, _949, _1937);
    int _1965 = _1935 >> 2;
    float _1967 = fma(_1839, _1711, _1909);
    int _1969 = _1947 >> 2;
    float _1971 = fma(_1859, _1725, _1819);
    int _1973 = ~_266;
    int _1975 = _1973 + 1;
    float _1977 = fma(_1859, _947, _1821);
    int _1979 = _1965 << 4;
    int _1981 = _1979 + 512;
    float _1983 = fma(_1815, _865, _1883);
    int _1985 = _1969 << 4;
    int _1987 = _1985 + 368;
    float _1989 = fma(_1843, _1789, _1971);
    uint _1991 = uint(int(uint(_1981) >> uint(2)));
    uint _1993 = uint(int(uint(int(_1991)) >> uint(2)));
    int _1995 = int(_1991) & 3;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[int(_1993)][_1995];
    int _1999 = int(_1991) + 1;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    int _2003 = _1999 & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    bool _2007 = !_1961;
    int _2009 = _2007 ? 0 : (-1);
    float _2011 = fma(_1861, _1789, _1933);
    int _2013 = _1907 & 3;
    bool _2015 = _2013 != 0;
    int _2017 = _1975 * _1753;
    int _2019 = _2017 + _1297;
    int _2021 = ~_1679;
    int _2023 = _2021 + _2009;
    int _2025 = _2023 + 1;
    float _2027 = fma(_1815, _949, _1885);
    int _2029 = _2015 ? 0 : 1;
    uint _2031 = uint(int(uint(_1987) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[int(_2041)][_2043];
    bool _2047 = uint(_2019) >= uint(_266);
    int _2049 = _250 * _2025;
    int _2051 = _2049 + _1285;
    bool _2053 = uint(_2013) > 1u;
    float _2055 = fma(_1843, _865, _1921);
    bool _2057 = !_1901;
    int _2059 = _2057 ? 0 : 1;
    float _2061 = fma(_1843, _949, _1977);
    bool _2063 = _1899 != 3;
    int _2065 = _1987 + 8;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
    int _2071 = int(_2067) & 3;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[int(_2069)][_2071];
    int _2075 = int(_2067) + 1;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    int _2079 = _2075 & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    bool _2083 = !_2047;
    int _2085 = _2083 ? 0 : (-1);
    float _2087 = fma(_1861, _865, _1925);
    int _2089 = ~_2029;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1861, _1743, _1967);
    bool _2097 = uint(_1899) >= 2u;
    float _2099 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2101 = ~_1753;
    int _2103 = _2101 + _2085;
    int _2105 = _2103 + 1;
    int _2107 = _1981 + 8;
    uint _2109 = uint(int(uint(_2107) >> uint(2)));
    uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
    int _2113 = int(_2109) & 3;
    float _2115 = (*spvDescriptorSet0.vp_c9)._m0[int(_2111)][_2113];
    int _2117 = int(_2109) + 1;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    int _2121 = _2117 & 3;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[int(_2119)][_2121];
    int _2125 = _2093;
    float _2127 = _2027;
    float _2129 = _2061;
    if (!_2053)
    {
        int _2131 = ~_2029;
        int _2133 = _2131 + 1;
        _2125 = _2133;
    }
    int _2135 = _2125;
    float _2137 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2099);
    int _2139 = _2097 ? 0 : 1;
    int _2141 = _266 * _2105;
    int _2143 = _2141 + _1297;
    int _2145 = abs(_2135);
    float _2147 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2149 = abs(_1957);
    int _2151 = abs(_2059);
    int _2153 = _1907 & 3;
    bool _2155 = _2153 != 0;
    int _2157 = ~_2139;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    int _2163 = ~_2145;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    int _2169 = ~_2149;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    int _2175 = _2161;
    if (_2063)
    {
        int _2177 = ~_2139;
        int _2179 = _2177 + 1;
        _2175 = _2179;
    }
    int _2181 = _2175;
    bool _2183 = uint(_2013) >= 2u;
    int _2185 = _2167 * as_type<int>(_2005);
    int _2187 = ~_2151;
    int _2189 = _2187 + 1;
    int _2191 = _2189 + 1;
    int _2193 = abs(_2181);
    bool _2195 = _1899 != 3;
    bool _2197 = !_1315;
    int _2199 = _2197 ? _2051 : (-1);
    int _2201 = _2173 * as_type<int>(_2045);
    bool _2203 = !_2155;
    int _2205 = _2203 ? 0 : 1;
    bool _2207 = _2013 != 3;
    int _2209 = _2191 * as_type<int>(_2037);
    int _2211 = _2209 + _2201;
    float _2213 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2215 = int(_2213);
    int _2217 = abs(_2205);
    int _2219 = _2183 ? 0 : 1;
    int _2221 = ~_2193;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    int _2227 = ~_2217;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    bool _2233 = !_2195;
    int _2235 = _2233 ? 0 : (-1);
    int _2237 = _2225 * as_type<int>(_2073);
    int _2239 = _2237 + _2211;
    int _2241 = ~_2219;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    int _2247 = _2231 * as_type<int>(_1997);
    int _2249 = _2247 + _2185;
    int _2251 = _2245;
    if (_2207)
    {
        int _2253 = ~_2219;
        int _2255 = _2253 + 1;
        _2251 = _2255;
    }
    int _2257 = _2251;
    float _2259 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2261 = int(_2259);
    bool _2263 = !_1761;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = abs(_2235);
    bool _2269 = _2013 != 3;
    int _2271 = abs(_2257);
    int _2273 = abs(_2265);
    int _2275 = ~_2267;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    bool _2281 = !_2269;
    int _2283 = _2281 ? 0 : (-1);
    int _2285 = _2279 * as_type<int>(_2081);
    int _2287 = _2285 + _2239;
    float _2289 = float(uint(_2215));
    int _2291 = abs(_2283);
    int _2293 = ~_2271;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    float _2299 = 1.0 / _2289;
    int _2301 = ~_2273;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = ~_2291;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    int _2313 = _2297 * as_type<int>(_2115);
    int _2315 = _2313 + _2249;
    float _2317 = float(uint(_2261));
    int _2319 = _2287 * _2305;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2323 = _2321 != 0;
    int _2325 = _2311 * as_type<int>(_2123);
    int _2327 = _2325 + _2315;
    int _2329 = abs(_2215);
    int _2331 = _2199 * _2273;
    int _2333 = _2331 + _2319;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    float _2339 = 1.0 / _2317;
    float _2341 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2343 = float(uint(_2329));
    float _2345 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2347 = abs(_2337);
    float _2349 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2341);
    int _2351 = as_type<int>(_2299) + (-2);
    int _2353 = ~_2347;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    float _2359 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2147);
    int _2361 = abs(_2261);
    float _2363 = 1.0 / _2343;
    float _2365 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2349);
    float _2367 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2359);
    float _2369 = float(uint(_2333));
    int _2371 = _2357 * _2327;
    float _2373 = float(uint(_2361));
    float _2375 = _793 + _2367;
    int _2377 = as_type<int>(_2339) + (-2);
    float _2379 = _905 + _2365;
    float _2381 = as_type<float>(_2351) * _2369;
    bool _2383 = !_1337;
    int _2385 = _2383 ? _2143 : (-1);
    float _2387 = 1.0 / _2373;
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2391 = _2379 + _2389;
    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2395 = _2375 + _2393;
    int _2397 = _2385 * _2347;
    int _2399 = _2397 + _2371;
    int _2401 = abs(_2333);
    float _2403 = _2391 * _2391;
    int _2405 = ~_2215;
    int _2407 = _2405 + 1;
    float _2409 = trunc(_2381);
    float _2411 = precise::max(_2409, 0.0);
    uint _2413 = uint(_2411);
    float _2415 = float(uint(_2399));
    float _2417 = _2395 * _2395;
    int _2419 = as_type<int>(_2363) + (-2);
    float _2421 = float(uint(_2401));
    float _2423 = as_type<float>(_2377) * _2415;
    float _2425 = _2403 + _2417;
    int _2427 = abs(_2399);
    float _2429 = as_type<float>(_2419) * _2421;
    int _2431 = as_type<int>(_2387) + (-2);
    float _2433 = trunc(_2423);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = float(uint(_2427));
    float _2441 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2345);
    int _2443 = ~_2329;
    int _2445 = _2443 + 1;
    int _2447 = _2407 * int(_2413);
    int _2449 = _2447 + _2333;
    float _2451 = as_type<float>(_2431) * _2439;
    int _2453 = ~_2361;
    int _2455 = _2453 + 1;
    float _2457 = trunc(_2429);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    float _2463 = float(uint(_2449));
    float _2465 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2441);
    int _2467 = ~_2261;
    int _2469 = _2467 + 1;
    float _2471 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2473 = as_type<float>(_2351) * _2463;
    float _2475 = trunc(_2451);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2483 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2485 = _1335 + _2465;
    int _2487 = _2469 * int(_2437);
    int _2489 = _2487 + _2399;
    float _2491 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2481);
    float _2493 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2483);
    float _2495 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2497 = sqrt(_2425);
    float _2499 = float(uint(_2489));
    int _2501 = _2445 * int(_2461);
    int _2503 = _2501 + _2401;
    float _2505 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2471);
    float _2507 = as_type<float>(_2377) * _2499;
    float _2509 = float(uint(_2503));
    int _2511 = _2455 * int(_2479);
    int _2513 = _2511 + _2427;
    float _2515 = trunc(_2473);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    float _2521 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2523 = as_type<float>(_2419) * _2509;
    float _2525 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2527 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2521);
    float _2529 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2531 = _2497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = trunc(_2507);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    float _2539 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2495);
    float _2541 = float(uint(_2513));
    float _2543 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2545 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2529);
    float _2547 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2525);
    float _2549 = as_type<float>(_2431) * _2541;
    float _2551 = trunc(_2523);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    float _2557 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2543);
    float _2559 = _2403;
    float _2561 = _2417;
    float _2563 = _2375;
    float _2565 = _2527;
    if (!_2531)
    {
        _2127 = _2379;
    }
    float _2567 = _2127;
    float _2569 = _2567;
    if (!_2531)
    {
        _2129 = _2485;
    }
    float _2571 = _2129;
    float _2573 = trunc(_2549);
    float _2575 = precise::max(_2573, 0.0);
    uint _2577 = uint(_2575);
    bool _2579 = !_2531;
    float _2581 = _2571;
    if (!_2579)
    {
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2587 = _2497 + _2585;
        float _2589 = rsqrt(_2425);
        float _2591 = _2587 * _2583;
        float _2593 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2595 = _2591 * 0.15915493667125701904296875;
        float _2597 = _2595 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2595 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = fma(_2599, _2593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2607 = _2589 * _2605;
        float _2609 = _2603 + (-1.0);
        float _2611 = fma(_2391, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2613 = fma(_2395, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2615 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2619 = _2611 + _2617;
        float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2623 = _2613 + _2621;
        float _2625 = fma(_2485, _2603, _2615);
        float _2627 = _2619 * _2619;
        float _2629 = _2623 * _2623;
        _2581 = _2625;
        _2559 = _2627;
        _2561 = _2629;
        _2569 = _2611;
        _2563 = _2613;
    }
    float _2631 = _2581;
    float _2633 = _2559;
    float _2635 = _2561;
    float _2637 = _2569;
    float _2639 = _2563;
    int _2641 = int(_2413) + int(_2519);
    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2645 = _2631 + _2643;
    int _2647 = ~_2215;
    int _2649 = _2647 + 1;
    float _2651 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2505);
    int _2653 = int(_2437) + int(_2537);
    float _2655 = fma(_2645, _2645, _2633);
    int _2657 = ~_2261;
    int _2659 = _2657 + 1;
    int _2661 = _2649 * _2641;
    int _2663 = _2661 + _2333;
    int _2665 = int(_2461) + int(_2555);
    float _2667 = _2655 + _2635;
    int _2669 = ~_2329;
    int _2671 = _2669 + 1;
    int _2673 = _2659 * _2653;
    int _2675 = _2673 + _2399;
    bool _2677 = uint(_2663) >= uint(_2215);
    int _2679 = int(_2479) + int(_2577);
    int _2681 = _2671 * _2665;
    int _2683 = _2681 + _2401;
    int _2685 = ~_2361;
    int _2687 = _2685 + 1;
    float _2689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2691 = !_2677;
    int _2693 = _2691 ? 0 : (-1);
    bool _2695 = uint(_2675) >= uint(_2261);
    int _2697 = _2687 * _2679;
    int _2699 = _2697 + _2427;
    int _2701 = ~_2641;
    int _2703 = _2701 + _2693;
    int _2705 = _2703 + 1;
    bool _2707 = !_2695;
    int _2709 = _2707 ? 0 : (-1);
    float _2711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2713 = uint(_2683) >= uint(_2329);
    bool _2715 = uint(_2699) >= uint(_2361);
    bool _2717 = _2215 == 0;
    bool _2719 = _2215 == 0;
    float _2721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2723 = _2333 ^ _2215;
    int _2725 = _2215 * _2705;
    int _2727 = _2725 + _2333;
    int _2729 = _2399 ^ _2261;
    float _2731 = _2689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2733 = !_2715;
    int _2735 = _2733 ? 0 : (-1);
    bool _2737 = !_2713;
    int _2739 = _2737 ? 0 : (-1);
    float _2741 = sqrt(_2667);
    uint _2743 = uint(int(uint(_2723) >> uint(31)));
    uint _2745 = uint(int(uint(_2729) >> uint(31)));
    int _2747 = ~_2653;
    int _2749 = _2747 + _2709;
    int _2751 = _2749 + 1;
    bool _2753 = !_2717;
    int _2755 = _2753 ? _2727 : (-1);
    float _2757 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2759 = ~_2735;
    int _2761 = _2679 + _2759;
    int _2763 = _2761 + 1;
    int _2765 = _2261 * _2751;
    int _2767 = _2765 + _2399;
    int _2769 = ~_2739;
    int _2771 = _2665 + _2769;
    int _2773 = _2771 + 1;
    float _2775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2777 = ~int(_2743);
    int _2779 = _2777 + 1;
    float _2781 = fma(_2731, _358, -0.5);
    int _2783 = ~int(_2745);
    int _2785 = _2783 + 1;
    float _2787 = float(_2755);
    bool _2789 = _2261 == 0;
    int _2791 = _2773 ^ _2779;
    float _2793 = fma(_2731, _2787, _773);
    int _2795 = _2763 ^ _2785;
    float _2797 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2799 = _2261 == 0;
    float _2801 = fma(_2757, _400, -0.5);
    bool _2803 = !_2789;
    int _2805 = _2803 ? _2767 : (-1);
    float _2807 = _2775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2809 = ~_2779;
    int _2811 = _2809 + _2791;
    int _2813 = _2811 + 1;
    float _2815 = fma(_1447, _2781, _2793);
    int _2817 = ~_2785;
    int _2819 = _2817 + _2795;
    int _2821 = _2819 + 1;
    float _2823 = fma(_721, _2807, -0.5);
    float _2825 = float(_2805);
    float _2827 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2527);
    bool _2829 = !_2719;
    int _2831 = _2829 ? _2813 : (-1);
    bool _2833 = !_2799;
    int _2835 = _2833 ? _2821 : (-1);
    float _2837 = fma(_2757, _2825, _1481);
    float _2839 = float(_2831);
    float _2841 = float(_2835);
    float _2843 = fma(_531, _2797, -0.5);
    float _2845 = fma(_1473, _2801, _2837);
    float _2847 = -_787;
    float _2849 = fma(_2797, _2839, _2847);
    float _2851 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2853 = -_1467;
    float _2855 = fma(_2807, _2841, _2853);
    float _2857 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2545);
    float _2859 = fma(_1443, _2843, _2849);
    float _2861 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2539);
    float _2863 = fma(_1477, _2823, _2855);
    float _2865 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2547);
    float _2867 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2491);
    float _2869 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2557);
    float _2871 = _1531 + 0.5;
    float _2873 = _1537 + 0.5;
    float _2875 = _2815 + 0.5;
    float _2877 = _2845 + 0.5;
    float _2879 = _2859 + 0.5;
    float _2881 = _2863 + 0.5;
    float _2883 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2493);
    out.m_71.x = _2871;
    out.m_71.y = _2873;
    bool _2885 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2887 = isnan(_2741);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2893 = _2889 || _2891;
    out.m_73.x = _2861;
    out.m_73.y = _2827;
    out.m_73.z = _2865;
    out.m_75.x = _2857;
    out.m_75.y = _2651;
    out.m_75.z = _2869;
    out.m_77.x = _2875;
    out.m_77.y = _2879;
    out.m_77.z = _2877;
    out.m_77.w = _2881;
    float _2895 = _2815;
    float _2897 = _2865;
    float _2899 = _2827;
    if (!_2893)
    {
        _2895 = 1.0;
    }
    float _2901 = _2895;
    out.m_79.x = _2867;
    out.m_79.y = _2851;
    out.m_79.z = _2883;
    bool _2903 = !_2893;
    float _2905 = _2901;
    if (!_2903)
    {
        bool _2907 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2909 = isnan(_2741);
        bool _2911 = _2907 || _2909;
        bool _2913 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2915 = _2911 || _2913;
        if (!_2915)
        {
            float _2917 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2919 = _2741 + _2917;
            float _2921 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2923 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2921;
            float _2925 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2929 = 1.0 / _2923;
            float _2931 = _2919 * _2929;
            float _2933 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2905 = _2933;
            _2897 = _2927;
            _2935 = true;
        }
        else
        {
            bool _2937 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2939 = isnan(_2741);
            bool _2941 = _2937 || _2939;
            bool _2943 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2945 = _2941 || _2943;
            if (!_2945)
            {
                float _2947 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2949 = _2741 + _2947;
                float _2951 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2953 = _2951 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2955 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2957 = _2955 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2959 = 1.0 / _2953;
                float _2961 = _2949 * _2959;
                float _2963 = fma(_2961, _2957, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2905 = _2963;
                _2897 = _2957;
                _2935 = true;
            }
            else
            {
                _2905 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2935 = false;
    float _2965 = _2905;
    float _2967 = _2897;
    float _2969 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2971 = _2637 + _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2975 = _2631 + _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2979 = _2639 + _2977;
    bool _2981 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2983 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.5);
    bool _2989 = _2985 || _2987;
    float _2991 = fma(_2971, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2993 = fma(_2975, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2995 = fma(_2979, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2997 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2999 = _2967;
    float _3001 = _2971;
    if (_2989)
    {
        _2997 = _2991;
    }
    float _3003 = _2997;
    float _3005 = _3003;
    if (_2989)
    {
        _2899 = _2993;
    }
    float _3007 = _2899;
    float _3009 = _3007;
    if (_2989)
    {
        _2999 = _2995;
    }
    float _3011 = _2999;
    float _3013 = _3011;
    if (!_2989)
    {
        float _3015 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3017 = _1335 + _3015;
        float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3021 = _905 + _3019;
        float _3023 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3025 = _3017 * _3017;
        float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3029 = _793 + _3027;
        float _3031 = fma(_3021, _3021, _3025);
        float _3033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3035 = fma(_3029, _3029, _3031);
        float _3037 = sqrt(_3035);
        float _3039 = _3023 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3041 = precise::min(_3037, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3043 = _3041 * _3033;
        float _3045 = -_905;
        float _3047 = _3045 + _2991;
        float _3049 = -_1335;
        float _3051 = _3049 + _2993;
        float _3053 = _3039 * _3043;
        float _3055 = -_793;
        float _3057 = _3055 + _2995;
        float _3059 = fma(_3047, _3053, _905);
        float _3061 = fma(_3051, _3053, _1335);
        float _3063 = fma(_3057, _3053, _793);
        _3009 = _3061;
        _3005 = _3059;
        _3013 = _3063;
    }
    float _3065 = _3009;
    float _3067 = _3005;
    float _3069 = _3013;
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3073 = _3065 + _3071;
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3077 = _3067 + _3075;
    float _3079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3081 = _3069 + _3079;
    float _3083 = _3073 * _3073;
    float _3085 = fma(_3077, _3077, _3083);
    float _3087 = fma(_3081, _3081, _3085);
    float _3089 = rsqrt(_3087);
    float _3091 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3093 = _3077 * _3091;
    float _3095 = _3081 * _3091;
    float _3097 = _3093 * _3093;
    float _3099 = _3095 * _3095;
    float _3101 = _3097 + _3099;
    float _3103 = sqrt(_3101);
    bool _3105 = _3103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3109 = _3103 + _3107;
    float _3111 = _3081;
    float _3113 = _3101;
    float _3115 = _3109;
    float _3117 = _3073;
    if (_3105)
    {
        float _3119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3111 = _3119;
    }
    float _3121 = _3111;
    if (_3105)
    {
        float _3123 = rsqrt(_3101);
        _3113 = _3123;
    }
    float _3125 = _3113;
    float _3127 = _3125;
    if (_3105)
    {
        float _3129 = _3109 * _3121;
        _3115 = _3129;
    }
    float _3131 = _3115;
    if (_3105)
    {
        float _3133 = _3131 * 0.15915493667125701904296875;
        _3001 = _3133;
    }
    float _3135 = _3001;
    float _3137 = _3089;
    if (_3105)
    {
        float _3139 = _3135 * 6.283185482025146484375;
        float _3141 = sin(_3139);
        _3137 = _3141;
    }
    float _3143 = _3137;
    float _3145 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3147 = precise::max(0.0, _3145);
    float _3149 = _3083;
    float _3151 = _3147;
    float _3153 = _3145;
    if (_3105)
    {
        float _3155 = _3135 * 6.283185482025146484375;
        float _3157 = cos(_3155);
        _3149 = _3157;
    }
    float _3159 = _3149;
    float _3161 = -_3091;
    float _3163 = -_3147;
    float _3165 = fma(_3073, _3161, _3163);
    if (!_3105)
    {
        _3117 = _3095;
    }
    float _3167 = _3117;
    float _3169 = _3167;
    if (_3105)
    {
        float _3171 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3151 = _3171;
    }
    float _3173 = _3151;
    float _3175 = _3173;
    float _3177 = _3143;
    if (_3105)
    {
        float _3179 = fma(_3143, _3173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3175 = _3179;
    }
    float _3181 = _3175;
    float _3183 = _3181;
    if (!_3105)
    {
        _3177 = _3093;
    }
    float _3185 = _3177;
    float _3187 = _3185;
    float _3189 = _3159;
    if (_3105)
    {
        float _3191 = _3159 + (-1.0);
        _3153 = _3191;
    }
    float _3193 = _3153;
    if (_3105)
    {
        float _3195 = _3125 * _3181;
        _2565 = _3195;
    }
    float _3197 = _2565;
    if (!_3105)
    {
        _3183 = _3165;
    }
    float _3199 = _3183;
    float _3201 = _3199;
    if (_3105)
    {
        float _3203 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _551 = _3203;
    }
    float _3205 = _551;
    if (_3105)
    {
        float _3207 = _3093 * _3197;
        _3187 = _3207;
    }
    float _3209 = _3187;
    if (!_3105)
    {
        _3127 = _3097;
    }
    float _3211 = _3127;
    float _3213 = sqrt(_3087);
    float _3215 = _3211;
    if (_3105)
    {
        float _3217 = fma(_3165, _3159, _3205);
        _3201 = _3217;
    }
    float _3219 = _3201;
    if (_3105)
    {
        float _3221 = _3095 * _3197;
        _3169 = _3221;
    }
    float _3223 = _3169;
    if (_3105)
    {
        float _3225 = _3209 * _3209;
        _3215 = _3225;
    }
    float _3227 = _3215;
    if (!_3105)
    {
        _3189 = _3099;
    }
    float _3229 = _3189;
    float _3231 = _3229;
    if (_3105)
    {
        float _3233 = _3223 * _3223;
        _3231 = _3233;
    }
    float _3235 = _3231;
    float _3237 = fma(_3219, _3219, _3227);
    float _3239 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3241 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3243 = _3237 + _3235;
    float _3245 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3239);
    float _3247 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3241);
    float _3249 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3251 = rsqrt(_3243);
    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3255 = fma(_3213, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3253);
    float _3257 = precise::clamp(_3255, 0.0, 1.0);
    float _3259 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3245);
    float _3261 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3263 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3247);
    float _3265 = -_3257;
    float _3267 = _3265 + 1.0;
    float _3269 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3271 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3261);
    float _3273 = _3263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3275 = abs(_3267);
    float _3277 = log2(_3275);
    float _3279 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3249);
    float _3281 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3271);
    float _3283 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3285 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3287 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3279);
    float _3289 = _3281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3291 = _3251 * _3209;
    float _3293 = _3251 * _3219;
    float _3295 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3297 = _3251 * _3223;
    float _3299 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3301 = -_3285;
    float _3303 = fma(_3301, _3283, 1.0);
    float _3305 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3295);
    float _3307 = _3287 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3309 = -_3299;
    float _3311 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3309);
    float _3313 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3315 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3305);
    float _3317 = log2(_3303);
    float _3319 = -_3297;
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3311);
    float _3323 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3325 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3315);
    float _3327 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3329 = fma(_3321, -0.5, 0.5);
    float _3331 = fma(_3321, 0.5, 0.5);
    float _3333 = exp2(_3313);
    float _3335 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3323);
    float _3337 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3327);
    float _3339 = fma(_3331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3341 = _3293 + 1.0;
    float _3343 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3335);
    float _3345 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3337);
    float _3347 = fma(_3331, _3339, -0.212114393711090087890625);
    float _3349 = 1.0 / _3325;
    float _3351 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3343);
    float _3353 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3345);
    float _3355 = fma(_3331, _3347, 1.570728778839111328125);
    float _3357 = sqrt(_3329);
    float _3359 = -_3293;
    float _3361 = fma(_3333, _3341, _3359);
    float _3363 = _3317 * 0.693147182464599609375;
    float _3365 = fma(_3361, 0.5, 0.5);
    float _3367 = _3363 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3369 = _3351 * _3349;
    float _3371 = _3353 * _3349;
    float _3373 = fma(_3369, 0.5, 0.5);
    float _3375 = fma(_3371, -0.5, 0.5);
    float _3377 = _3357 * 0.636619746685028076171875;
    float3 _8817 = float3(_3373, _3375, _3367);
    float _3379 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8817, float3(0.0), isnan(_8817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8817, float3(0.0), isnan(_8817)), level(0.0)).x;
    float3 _8828 = float3(_3373, _3375, _3367);
    float4 _3382 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8828, float3(0.0), isnan(_8828)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8828, float3(0.0), isnan(_8828)), level(0.0)).xyzw;
    float _3384 = _3382.x;
    float _3386 = _3382.y;
    float _3388 = _3382.z;
    float _3390 = _3382.w;
    float _3392 = -_3355;
    float _3394 = fma(_3377, _3392, 1.0);
    float2 _8850 = float2(_3394, _3365);
    float3 _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8850, float2(0.0), isnan(_8850)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8850, float2(0.0), isnan(_8850)), level(0.0)).xyz;
    float _3400 = _3398.x;
    float _3402 = _3398.y;
    float _3404 = _3398.z;
    float _3406 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3408 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _3067;
    out.m_81.y = _3065;
    out.m_81.z = _3069;
    bool _3410 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3412 = isnan(_3213);
    bool _3414 = _3410 || _3412;
    bool _3416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3418 = _3414 || _3416;
    float _3420 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3408);
    float _3422 = exp2(_3406);
    float _3424 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3420);
    float _3426 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3424);
    float _3428 = _3351;
    float _3430 = _3426;
    float _3432 = _3351;
    float _3434 = _3325;
    if (!_3418)
    {
        _3428 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3436 = _3428;
    float _3438 = _3426 + _3325;
    out.gl_Position.x = _3351;
    out.gl_Position.y = _3353;
    out.gl_Position.z = _3426;
    out.gl_Position.w = _3325;
    float _3440 = _3438 * 0.5;
    float _3442 = -_3422;
    float _3444 = _3442 + 1.0;
    float _3446 = _3444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.z = _3440;
    out.m_83.w = _3325;
    float _3448 = -_3446;
    float _3450 = _3448 + 1.0;
    float _3452 = _3440;
    float _3454 = _3446;
    float _3456 = _3436;
    float _3458 = _3436;
    if (!_3418)
    {
        _3430 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3460 = _3430;
    float _3462 = _3460;
    float _3464 = _3460;
    if (!_3418)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3466 = _3432;
    float _3468 = _3466;
    float _3470 = _3466;
    if (!_3418)
    {
        _3434 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3472 = _3434;
    float _3474 = _3472;
    float _3476 = _3472;
    if (!_3418)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3478 = _3452;
    float _3480 = _3446 * _3379;
    float _3482 = _3390 * _3450;
    float _3484 = _3478;
    float _3486 = _3478;
    if (!_3418)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3488 = _3454;
    float _3490 = _3390 * _3480;
    float _3492 = _3404 * _3480;
    float _3494 = fma(_3400, _3490, _3384);
    float _3496 = fma(_3402, _3490, _3386);
    float _3498 = fma(_3390, _3492, _3388);
    out.m_85.x = _3494;
    out.m_85.y = _3496;
    out.m_85.z = _3498;
    out.m_85.w = _3482;
    bool _3500 = !_3418;
    float _3502 = _3488;
    float _3504 = _3488;
    if (!_3500)
    {
        bool _3506 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3508 = isnan(_3213);
        bool _3510 = _3506 || _3508;
        bool _3512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3514 = _3510 || _3512;
        if (!_3514)
        {
            float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3518 = _3213 + _3516;
            float _3520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3520;
            float _3524 = 1.0 / _3522;
            float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3546 = _3518 * _3524;
            float _3548 = precise::clamp(_3546, 0.0, 1.0);
            float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3554 = fma(_3548, _3528, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3556 = fma(_3548, _3552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3558 = fma(_3548, _3532, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3560 = fma(_3548, _3536, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3562 = fma(_3548, _3540, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3564 = fma(_3548, _3544, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3504 = _3556;
            _3486 = _3562;
            _3464 = _3554;
            _3476 = _3560;
            _3470 = _3558;
            _3458 = _3564;
            _3566 = true;
        }
        else
        {
            bool _3568 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3570 = isnan(_3213);
            bool _3572 = _3568 || _3570;
            bool _3574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3576 = _3572 || _3574;
            if (!_3576)
            {
                _3462 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3578 = _3462;
            _3464 = _3578;
            if (!_3576)
            {
                _3502 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3580 = _3502;
            _3504 = _3580;
            if (!_3576)
            {
                _3468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3582 = _3468;
            _3470 = _3582;
            if (!_3576)
            {
                _3474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3584 = _3474;
            _3476 = _3584;
            if (!_3576)
            {
                _3484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3586 = _3484;
            _3486 = _3586;
            if (!_3576)
            {
                _3456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3588 = _3456;
            bool _3590 = !_3576;
            _3458 = _3588;
            if (!_3590)
            {
                bool _3592 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3594 = isnan(_3213);
                bool _3596 = _3592 || _3594;
                bool _3598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3600 = _3596 || _3598;
                if (!_3600)
                {
                    float _3602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3604 = _3213 + _3602;
                    float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3608 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3606;
                    float _3610 = 1.0 / _3608;
                    float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3614 = _3612 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3616 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3618 = _3616 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3620 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3622 = _3620 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3624 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3626 = _3624 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3632 = _3604 * _3610;
                    float _3634 = precise::clamp(_3632, 0.0, 1.0);
                    float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3640 = fma(_3634, _3614, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3642 = fma(_3634, _3638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3644 = fma(_3634, _3618, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3646 = fma(_3634, _3622, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3648 = fma(_3634, _3626, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3650 = fma(_3634, _3630, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3504 = _3642;
                    _3486 = _3648;
                    _3464 = _3640;
                    _3476 = _3646;
                    _3470 = _3644;
                    _3458 = _3650;
                    _3566 = true;
                }
                else
                {
                    _3504 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3464 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3566 = false;
    float _3652 = _3504;
    float _3654 = _3486;
    float _3656 = _3464;
    float _3658 = _3476;
    float _3660 = _3470;
    float _3662 = _3458;
    float _3664 = fma(_2851, -0.5, 0.5);
    float _3666 = precise::clamp(_3664, 0.0, 1.0);
    float _3668 = -_3652;
    float _3670 = _3668 + _3654;
    float _3672 = -_3656;
    float _3674 = _3672 + _3658;
    float _3676 = -_3660;
    float _3678 = _3676 + _3662;
    bool _3680 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3682 = fma(_3666, _3670, _3652);
    float _3684 = fma(_3666, _3674, _3656);
    float _3686 = fma(_3666, _3678, _3660);
    float _3688 = _3682 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _3690 = fma(_3684, 0.298911988735198974609375, _3688);
    float _3692 = fma(_3686, 0.114477999508380889892578125, _3690);
    float _3694 = -_3692;
    float _3696 = _3684 + _3694;
    float _3698 = -_3692;
    float _3700 = _3682 + _3698;
    float _3702 = -_3692;
    float _3704 = _3686 + _3702;
    float _3706 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3708 = fma(_3696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    float _3710 = fma(_3700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    float _3712 = fma(_3704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    out.m_49.x = _3706;
    out.m_89.x = _3708;
    out.m_89.y = _3710;
    out.m_89.z = _3712;
    if (!_3680)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3714 = -_3065;
    float _3716 = _3714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3718 = -_3067;
    float _3720 = _3718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3722 = -_3069;
    float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3726 = _3716 * _3716;
    float _3728 = fma(_3720, _3720, _3726);
    float _3730 = fma(_3724, _3724, _3728);
    float _3732 = sqrt(_3730);
    float _3734 = rsqrt(_3730);
    float _3736 = -_3732;
    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3740 = _3738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3742 = precise::clamp(_3740, 0.0, 1.0);
    float _3744 = _3720 * _3734;
    float _3746 = _3716 * _3734;
    float _3748 = abs(_3742);
    float _3750 = log2(_3748);
    float _3752 = _3724 * _3734;
    float _3754 = _3744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3756 = _2851 * _3746;
    float _3758 = -_3746;
    float _3760 = -_3754;
    float _3762 = fma(_3758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3760);
    float _3764 = fma(_2867, _3744, _3756);
    float _3766 = -_3752;
    float _3768 = fma(_3766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3762);
    float _3770 = fma(_2883, _3752, _3764);
    float _3772 = precise::clamp(_3770, 0.0, 1.0);
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3776 = _3768 + _3774;
    float _3778 = _3750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3780 = _3776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3782 = precise::clamp(_3780, 0.0, 1.0);
    float _3784 = exp2(_3778);
    float _3786 = _3784 * _3782;
    float _3788 = _3772 * _3786;
    float _3790 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3792 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3794 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _3790;
    out.m_87.y = _3792;
    out.m_87.z = _3794;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3566 = false;
    bool _2935 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3851 = as_type<float>(_124);
        out.gl_Position.z = _3851;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _144 = 0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _118 = _148;
    }
    float _150 = _118;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _126 = as_type<int>(_162);
    }
    int _164 = _126;
    int _166 = _164;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3922 = as_type<float>(_164);
        out.gl_Position.z = _3922;
    }
    if (_156)
    {
        return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    bool _172 = _168;
    float _190;
    if (!_170)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_108);
        float _196 = 1.0 / _194;
        float _198 = _142 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _204 = int(_202);
    float _206 = in.m_53.x;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _200 + _208;
    float _212 = in.m_55.x;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _216 = _214 != 0;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    float _222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _224 = int(_222);
    float _226 = in.m_53.z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _230 = _228 != 0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = _200 + _232;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _238 = _236 != 0;
    float _240 = in.m_53.y;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _200 + _242;
    float _246 = float(_204);
    float _248 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _250 = int(_248);
    float _252 = in.m_55.y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _256 = 0.0;
    if (_230)
    {
        _256 = 1.0;
    }
    float _258 = _256;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _262 = float(_224);
    float _264 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _266 = int(_264);
    float _268 = _258;
    if (_216)
    {
        bool _270 = _206 > 0.5;
        _172 = _270;
    }
    bool _272 = _172;
    float _274 = 0.0;
    float _276 = _212;
    if (!_216)
    {
        _274 = _212;
    }
    float _278 = _274;
    float _280 = _278;
    if (_238)
    {
        float _282 = -_212;
        float _284 = _282 + 1.0;
        _144 = as_type<int>(_284);
    }
    int _286 = _144;
    float _288 = 0.0;
    if (!_238)
    {
        _288 = _212;
    }
    float _290 = _288;
    float _292 = float(uint(_250));
    float _294 = 1.0 / _262;
    float _296 = 0.0;
    float _298 = _290;
    if (_230)
    {
        _296 = _206;
    }
    float _300 = _296;
    int _302 = 0;
    float _304 = _300;
    if (_230)
    {
        _302 = 0;
    }
    int _306 = _302;
    float _308 = 0.0;
    int _310 = _306;
    if (_230)
    {
        _308 = 1.0;
    }
    float _312 = _308;
    float _314 = _312;
    if (!_230)
    {
        _268 = 7.345489978790283203125;
    }
    float _316 = _268;
    float _318 = 1.0 / _246;
    float _320 = float(uint(_266));
    float _322 = _206 * 2.0;
    if (!_230)
    {
        _304 = _240;
    }
    float _324 = _304;
    float _326 = _316 * _206;
    if (!_230)
    {
        _310 = 2;
    }
    int _328 = _310;
    if (!_230)
    {
        _314 = 1.2345600128173828125;
    }
    float _330 = _314;
    float _332 = _294 * _142;
    float _334 = 1.0 / _320;
    float _336 = _324 * _330;
    float _338 = _318 * _142;
    float _340 = trunc(_332);
    int _342 = int(_340);
    float _344 = in.m_53.w;
    int _346 = as_type<int>(_318);
    if (_216)
    {
        float _348 = -_212;
        float _350 = _348 + 1.0;
        _346 = as_type<int>(_350);
    }
    int _352 = _346;
    float _354 = float(_108);
    if (_216)
    {
        float _356 = _272 ? as_type<float>(_352) : _212;
        _280 = _356;
    }
    float _358 = _280;
    float _360 = 1.0 / _292;
    int _362 = as_type<int>(_334) + (-2);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = float(_250);
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _380 = _378 != 0;
    float _382 = trunc(_338);
    int _384 = int(_382);
    float _386 = float(uint(_342));
    float _388 = _368 * _142;
    bool _390 = _226 > 0.5;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _394 = _392 != 0;
    float _396 = as_type<float>(_362) * _386;
    if (_238)
    {
        float _398 = _390 ? as_type<float>(_286) : _212;
        _298 = _398;
    }
    float _400 = _298;
    float _402 = 1.0 / _354;
    int _404 = as_type<int>(_360) + (-2);
    bool _406 = _344 > 0.5;
    float _408 = _240 * 2.0;
    bool _410 = !_372;
    int _412 = _410 ? 0 : 1;
    bool _414 = !_376;
    int _416 = _414 ? 0 : 1;
    float _418 = trunc(_396);
    float _420 = precise::max(_418, 0.0);
    uint _423 = uint(_420);
    float _425 = float(uint(_384));
    float _427 = as_type<float>(_384);
    if (_394)
    {
        float _429 = -_212;
        float _431 = _429 + 1.0;
        _166 = as_type<int>(_431);
    }
    int _433 = _166;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _437 = _435 != 0;
    bool _439 = _240 > 0.5;
    float _441 = as_type<float>(_404) * _425;
    bool _443 = !_437;
    int _445 = _443 ? 0 : 1;
    float _447 = floor(_408);
    int _449 = ~_266;
    int _451 = _449 + 1;
    float _453 = _388 * _402;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _457 = _455 != 0;
    if (_394)
    {
        float _459 = _439 ? as_type<float>(_433) : _212;
        _276 = _459;
    }
    float _461 = _276;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _465 = _463 != 0;
    float _467 = trunc(_441);
    float _469 = precise::max(_467, 0.0);
    uint _471 = uint(_469);
    int _473 = _451 * int(_423);
    int _475 = _473 + _342;
    bool _477 = !_380;
    int _479 = _477 ? 0 : 1;
    bool _481 = !_465;
    int _483 = _481 ? 0 : 1;
    float _485 = float(uint(_475));
    float _487 = floor(_322);
    int _489 = ~_250;
    int _491 = _489 + 1;
    float _493 = as_type<float>(_362) * _485;
    float _495 = float(_266);
    int _497 = _491 * int(_471);
    int _499 = _497 + _384;
    float _501 = -_252;
    float _503 = _501 + 1.0;
    float _505 = trunc(_493);
    float _507 = precise::max(_505, 0.0);
    uint _509 = uint(_507);
    float _511 = _495 * _142;
    float _513 = float(uint(_499));
    int _515 = _439 ? as_type<int>(_503) : as_type<int>(_252);
    float _517 = _511 * _402;
    bool _519 = _447 >= 0.0;
    bool _521 = isnan(_447);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = as_type<float>(_404) * _513;
    float _531 = _457 ? as_type<float>(_515) : _252;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _533;
    bool _537 = _447 > 0.0;
    float _539 = trunc(_529);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _406 ? as_type<int>(_503) : as_type<int>(_252);
    int _547 = _390 ? as_type<int>(_503) : as_type<int>(_252);
    int _549 = as_type<int>(_503);
    float _551 = _531;
    if (_230)
    {
        _549 = 0;
    }
    int _553 = _549;
    bool _555 = _487 > 0.0;
    int _557 = _553;
    if (!_230)
    {
        _557 = 1;
    }
    int _559 = _557;
    int _561 = _527 ? 0 : 1;
    bool _563 = _487 >= 0.0;
    bool _565 = isnan(_487);
    bool _567 = _563 || _565;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    bool _573 = _559 != 1;
    int _575 = _571 ? 0 : 1;
    int _577 = int(_471) + int(_543);
    int _579 = int(_423) + int(_509);
    int _581 = ~_250;
    int _583 = _581 + 1;
    float _585 = in.m_46.x;
    float _587 = in.m_46.y;
    float _589 = in.m_46.z;
    int _591 = ~_575;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    int _597 = _595;
    if (!_555)
    {
        int _599 = ~_575;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    int _605 = _583 * _577;
    int _607 = _605 + _384;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _611 = _609 != 0;
    int _613 = ~_266;
    int _615 = _613 + 1;
    float _617 = 0.0;
    if (!_573)
    {
        _617 = _240;
    }
    float _619 = _617;
    bool _621 = !_611;
    int _623 = _621 ? 0 : 1;
    int _625 = _615 * _579;
    int _627 = _625 + _342;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _635 = _633 != 0;
    bool _637 = uint(_607) >= uint(_250);
    float _639 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _641 = ~_561;
    int _643 = _641 + 1;
    int _645 = _643 + 1;
    float _647 = 0.0;
    int _649 = _645;
    float _651 = _619;
    if (!_573)
    {
        _647 = _619;
    }
    float _653 = _647;
    float _655 = -_260;
    float _657 = fma(_639, 2.0, _655);
    float _659 = 0.0;
    float _661 = _653;
    if (!_573)
    {
        _659 = _226;
    }
    float _663 = _659;
    float _665 = _587 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = 0.0;
    float _669 = _663;
    if (!_573)
    {
        _667 = _226;
    }
    float _671 = _667;
    float _673 = _587 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _675 = _671;
    if (!_537)
    {
        int _677 = ~_561;
        int _679 = _677 + 1;
        _649 = _679;
    }
    int _681 = _649;
    float _683 = _587 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_573)
    {
        _661 = _206;
    }
    float _685 = _661;
    float _687 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    if (_573)
    {
        _651 = _206;
    }
    float _689 = _651;
    float _691 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].x, _673);
    if (_573)
    {
        _669 = _240;
    }
    float _693 = _669;
    float _695 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].x, _683);
    if (_573)
    {
        _675 = _240;
    }
    float _697 = _675;
    float _699 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[4].z, _687);
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _707 = _705 != 0;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _711 = _709 != 0;
    float _713 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    bool _715 = uint(_627) >= uint(_266);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _717;
    float _721 = _631 ? as_type<float>(_545) : _252;
    float _723 = _240 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _725 = !_637;
    int _727 = _725 ? 0 : (-1);
    float _729 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _737 = _735 != 0;
    float _739 = fma(_723, -2.0, _254);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _745 = _635 ? as_type<float>(_547) : _252;
    float _747 = _206 + _252;
    bool _749 = !_715;
    int _751 = _749 ? 0 : (-1);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _763 = _761 != 0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _765;
    float _769 = 1.0 / _755;
    float _771 = -_142;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[76].x, _657);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _783 = !_703;
    int _785 = _783 ? 0 : 1;
    float _787 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    float _789 = 1.0 / _767;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _793 = _713 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _795 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _797 = isnan(_200);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _809 = !_707;
    int _811 = _809 ? 0 : 1;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _817 = 1.0 / _777;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = _226 * 2.0;
    float _833 = 1.0 / _781;
    float _835 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _210 * _789;
    float _839 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _827;
    out.m_57.y = _807;
    out.m_57.z = _835;
    float _845 = _220 * _769;
    float _847 = floor(_831);
    float _849 = _206 + _240;
    float _851 = in.m_59.x;
    float _853 = in.m_59.y;
    float _855 = in.m_59.z;
    float _857 = _234 * _817;
    float _859 = _849 + (-1.0);
    float _861 = in.m_61.x;
    float _863 = in.m_61.y;
    float _865 = in.m_61.z;
    float _867 = in.m_61.w;
    float _869 = fma(_366, _837, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _871 = _244 * _833;
    out.m_63.x = _839;
    out.m_63.y = _841;
    out.m_63.z = _843;
    float _873 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _875 = fma(_719, _857, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _877 = fma(_535, _857, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _883 = fma(_743, _845, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _885 = _847 >= 0.0;
    bool _887 = isnan(_847);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = -_805;
    float _897 = _895 + 1.0;
    float _899 = floor(_326);
    bool _901 = !_711;
    int _903 = _901 ? 0 : 1;
    float _905 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _907 = _893 ? 0 : 1;
    float _909 = _206 + _226;
    float _911 = _240 + _226;
    bool _913 = _847 > 0.0;
    float _915 = _909 + (-1.0);
    int _917 = abs(_811);
    float _919 = _911 + (-1.0);
    int _921 = abs(_903);
    float _923 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _925 = _851 * _865;
    float _927 = _855 * _863;
    float _929 = _853 * _861;
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _933 = -_925;
    float _935 = fma(_855, _861, _933);
    float _937 = -_927;
    float _939 = fma(_853, _865, _937);
    float _941 = -_929;
    float _943 = fma(_851, _863, _941);
    float _945 = _935 * _867;
    float _947 = _939 * _867;
    float _949 = _943 * _867;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _955;
    float _959 = -_899;
    float _961 = _326 + _959;
    float _963 = float(_681);
    float _965 = fma(_953, _837, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _967 = fma(_957, _837, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _975 = _973 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _977;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _983 = fma(_971, _845, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _985 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _987 = isnan(_200);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = fma(_979, _857, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1003 = fma(_975, _845, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1005 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _1007 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1009 = isnan(_200);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1021 = fma(_1001, _871, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1023 = -_995;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_815, _871, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _1029 = ~_907;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = _995 * _897;
    int _1037 = _1033;
    float _1039 = _851;
    float _1041 = _853;
    float _1043 = _855;
    if (!_913)
    {
        int _1045 = ~_907;
        int _1047 = _1045 + 1;
        _1037 = _1047;
    }
    int _1049 = _1037;
    float _1051 = _1017 * _1025;
    bool _1053 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1055 = isnan(_200);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = fma(_142, 0.039999999105930328369140625, _747);
    bool _1067 = _328 != 2;
    float _1069 = -_1017;
    float _1071 = _1069 + 1.0;
    bool _1073 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1075 = isnan(_200);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -_1063;
    float _1087 = _1085 + 1.0;
    float _1089 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1091 = _1063 * _1071;
    float _1093 = floor(_336);
    float _1095 = _1083 * _1087;
    float _1097 = in.m_65.x;
    float _1099 = in.m_65.y;
    float _1101 = in.m_65.z;
    float _1103 = _1089 * 0.15915493667125701904296875;
    float _1105 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1107 = _965 * _1095;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    float _1113 = _869 * _1095;
    float _1115 = _1103 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = _967 * _1095;
    float _1121 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1107);
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1113);
    int _1125 = abs(_785);
    float _1127 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1119);
    float _1129 = fma(_983, _1091, _1121);
    float _1131 = float(_342);
    float _1133 = -_1093;
    float _1135 = _336 + _1133;
    float _1137 = float(_384);
    float _1139 = fma(_883, _1091, _1123);
    float _1141 = fma(_1003, _1091, _1127);
    bool _1143 = _1131 >= _495;
    bool _1145 = isnan(_1131);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_495);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = _495 * _1135;
    bool _1157 = _1137 >= _368;
    bool _1159 = isnan(_1137);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(_368);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = _961 * _368;
    float _1171 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1173 = _981 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1175 = fma(_875, _1051, _1129);
    float _1177 = fma(_877, _1051, _1139);
    float _1179 = fma(_851, _1171, _1097);
    float _1181 = fma(_853, _1171, _1099);
    float _1183 = _1097;
    if (_1067)
    {
        _1183 = _206;
    }
    float _1185 = _1183;
    float _1187 = fma(_855, _1171, _1101);
    float _1189 = fma(_997, _1051, _1141);
    float _1191 = _1185;
    if (!_1067)
    {
        _1191 = _226;
    }
    float _1193 = _1191;
    float _1195 = fma(_1173, _461, -0.5);
    float _1197 = float(_603);
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1201 = float(_917);
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1205 = float(_921);
    float _1207 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1209 = log2(_1207);
    float _1211 = float(_1049);
    float _1213 = -_1199;
    float _1215 = fma(_1203, 2.0, _1213);
    float _1217 = _1205 * _963;
    float _1219 = _685 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1221 = _1201 * _1197;
    float _1223 = trunc(_1169);
    int _1225 = int(_1223);
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1229 = ~_579;
    int _1231 = _1229 + _751;
    int _1233 = _1231 + 1;
    float _1235 = fma(_1021, _1035, _1175);
    float _1237 = float(_1125);
    float _1239 = -_1227;
    float _1241 = fma(_1219, 2.0, _1239);
    float _1243 = fma(_1027, _1035, _1189);
    float _1245 = trunc(_1155);
    int _1247 = int(_1245);
    int _1249 = ~_577;
    int _1251 = _1249 + _727;
    int _1253 = _1251 + 1;
    float _1255 = _1237 * _1211;
    int _1257 = abs(_623);
    float _1259 = _693 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1261 = _250 * _1253;
    int _1263 = _1261 + _384;
    int _1265 = abs(_445);
    float _1267 = trunc(_1167);
    int _1269 = int(_1267);
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1273 = in.m_67.x;
    float _1275 = in.m_67.y;
    float _1277 = in.m_67.z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = fma(_1259, -2.0, _1271);
    int _1283 = _1225 * _1265;
    int _1285 = _1283 + _384;
    float _1287 = _1209 * _142;
    float _1289 = trunc(_1153);
    int _1291 = int(_1289);
    if (_1067)
    {
        _427 = _240;
    }
    float _1293 = _427;
    int _1295 = _1247 * _1257;
    int _1297 = _1295 + _342;
    float _1299 = _1293;
    if (!_1067)
    {
        _1299 = _206;
    }
    float _1301 = _1299;
    int _1303 = _266 * _1233;
    int _1305 = _1303 + _342;
    float _1307 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    bool _1309 = !_737;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = _1255 * (-2.0);
    bool _1315 = _250 == 0;
    float _1317 = exp2(_1287);
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1321 = ~_1269;
    int _1323 = _1321 + 1;
    int _1325 = _1323 + 1;
    float _1327 = fma(_873, _1313, _873);
    bool _1329 = !_1315;
    int _1331 = _1329 ? _1263 : (-1);
    float _1333 = fma(_745, _1105, -0.5);
    float _1335 = _729 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1337 = _266 == 0;
    int _1339 = _1331 * _1325;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1343 = ~_1291;
    int _1345 = _1343 + 1;
    int _1347 = _1345 + 1;
    float _1349 = fma(_1313, _1273, _1273);
    bool _1351 = !_1337;
    int _1353 = _1351 ? _1305 : (-1);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1357 = !_733;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = -_1317;
    float _1363 = _1361 + 1.0;
    bool _1365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1367 = isnan(0.0);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1373 = _1369 || _1371;
    int _1375 = _1347 * _1353;
    float _1377 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1355);
    float _1379 = trunc(_453);
    int _1381 = int(_1379);
    float _1383 = float(uint(_1285));
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1387 = _1373 ? _1363 : 0.0;
    float _1389 = _206 + (-0.5);
    bool _1391 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1393 = isnan(1.0);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1399 = _1395 || _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1403 = 1.0 + _1401;
    float _1405 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1385);
    float _1407 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1377);
    float _1409 = as_type<float>(_404) * _1383;
    float _1411 = fma(_1319, -2.0, _1341);
    int _1413 = _250 + (-1);
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1417 = 1.0 / _1403;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1421 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1349);
    float _1423 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1415);
    int _1425 = _1269 * _1413;
    int _1427 = _1425 + _1339;
    int _1429 = abs(_416);
    float _1431 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1419);
    float _1433 = trunc(_1409);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1441 = _266 + (-1);
    float _1443 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1423);
    float _1445 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1439);
    float _1447 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1405);
    float _1449 = float(uint(_1297));
    float _1451 = trunc(_517);
    int _1453 = int(_1451);
    int _1455 = abs(_1311);
    int _1457 = _1291 * _1441;
    int _1459 = _1457 + _1375;
    int _1461 = ~_250;
    int _1463 = _1461 + 1;
    float _1465 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1445);
    float _1467 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1281);
    float _1469 = -_142;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1215);
    float _1473 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1307);
    float _1475 = as_type<float>(_362) * _1449;
    float _1477 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1431);
    float _1479 = -_142;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1241);
    float _1483 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1411);
    if (_1399)
    {
        float _1485 = _1387 * _1417;
        _146 = _1485;
    }
    float _1487 = _146;
    int _1489 = abs(_412);
    int _1491 = _1463 * int(_1437);
    int _1493 = _1491 + _1285;
    int _1495 = abs(_1359);
    int _1497 = _1459 * _1455;
    int _1499 = _1427 * _1429;
    float _1501 = fma(_1327, _1487, _1421);
    float _1503 = float(uint(_1493));
    int _1505 = _1381 * _1489;
    int _1507 = _1505 + _1499;
    int _1509 = ~_266;
    int _1511 = _1509 + 1;
    int _1513 = _1453 * _1495;
    int _1515 = _1513 + _1497;
    bool _1517 = !_759;
    int _1519 = _1517 ? 0 : 1;
    float _1521 = as_type<float>(_404) * _1503;
    int _1523 = abs(_479);
    float _1525 = trunc(_1475);
    float _1527 = precise::max(_1525, 0.0);
    uint _1529 = uint(_1527);
    float _1531 = fma(_1407, _1195, _1471);
    int _1533 = abs(_483);
    float _1535 = -_1483;
    float _1537 = fma(_1465, _1333, _1535);
    bool _1539 = !_763;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = trunc(_1521);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    int _1549 = abs(_1519);
    int _1551 = _1285 * _1523;
    int _1553 = _1551 + _1507;
    int _1555 = abs(_1541);
    float _1557 = _1501 * 0.15915493667125701904296875;
    int _1559 = _1511 * int(_1529);
    int _1561 = _1559 + _1297;
    int _1563 = _1225 * _1533;
    int _1565 = _1563 + _1553;
    float _1567 = fma(_1005, _1035, _1177);
    int _1569 = _1297 * _1549;
    int _1571 = _1569 + _1515;
    float _1573 = float(uint(_1561));
    float _1575 = _1221 * (-2.0);
    float _1577 = float(uint(_1565));
    int _1579 = _1247 * _1555;
    int _1581 = _1579 + _1571;
    float _1583 = _240 + (-0.5);
    float _1585 = as_type<float>(_362) * _1573;
    float _1587 = fma(_1575, _1275, _1275);
    float _1589 = as_type<float>(_404) * _1577;
    float _1591 = float(uint(_1581));
    float _1593 = trunc(_1585);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = ~_250;
    int _1601 = _1599 + 1;
    float _1603 = fma(_931, _1575, _931);
    float _1605 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1587);
    float _1607 = as_type<float>(_362) * _1591;
    float _1609 = in.m_69.x;
    float _1611 = in.m_69.y;
    float _1613 = in.m_69.z;
    int _1615 = ~_266;
    int _1617 = _1615 + 1;
    float _1619 = fma(_1603, _1487, _1605);
    float _1621 = trunc(_1589);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = _1217 * (-2.0);
    float _1629 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1567);
    bool _1631 = _1181 != 0.0;
    bool _1633 = isnan(_1181);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan(0.0);
    bool _1639 = _1635 || _1637;
    float _1641 = fma(_1627, _1277, _1277);
    float _1643 = _226 + (-0.5);
    bool _1645 = _1179 == 0.0;
    bool _1647 = !_1639;
    bool _1649 = _1645 && _1647;
    float _1651 = trunc(_1607);
    float _1653 = precise::max(_1651, 0.0);
    uint _1655 = uint(_1653);
    float _1657 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1235);
    float _1659 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1243);
    float _1661 = fma(_923, _1627, _923);
    float _1663 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1641);
    bool _1665 = _1187 == 0.0;
    bool _1667 = _1665 && _1649;
    int _1669 = _1601 * int(_1625);
    int _1671 = _1669 + _1565;
    float _1673 = _1619 * 0.15915493667125701904296875;
    float _1675 = _1557 * 6.283185482025146484375;
    float _1677 = cos(_1675);
    int _1679 = int(_1437) + int(_1547);
    float _1681 = float(uint(_1671));
    float _1683 = _1629 * _1611;
    float _1685 = _1657 * _1609;
    int _1687 = _1617 * int(_1655);
    int _1689 = _1687 + _1581;
    float _1691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1181);
    float _1693 = as_type<float>(_404) * _1681;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1697 = _1673 * 6.283185482025146484375;
    float _1699 = sin(_1697);
    float _1701 = float(uint(_1689));
    float _1703 = _1659 * _1613;
    float _1705 = fma(_1661, _1487, _1663);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1179);
    if (!_1667)
    {
        float _1709 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _851);
        _1039 = _1709;
    }
    float _1711 = _1039;
    float _1713 = as_type<float>(_362) * _1701;
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1717 = trunc(_1693);
    float _1719 = precise::max(_1717, 0.0);
    uint _1721 = uint(_1719);
    float _1723 = _1705 * 0.15915493667125701904296875;
    float _1725 = _1707 * _1695;
    float _1727 = _1691 * _1715;
    int _1729 = ~_250;
    int _1731 = _1729 + 1;
    if (!_1667)
    {
        float _1733 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[17].y, _853);
        _1041 = _1733;
    }
    float _1735 = _1041;
    int _1737 = ~_266;
    int _1739 = _1737 + 1;
    if (!_1667)
    {
        float _1741 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[17].y, _855);
        _1043 = _1741;
    }
    float _1743 = _1043;
    float _1745 = trunc(_1713);
    float _1747 = precise::max(_1745, 0.0);
    uint _1749 = uint(_1747);
    float _1751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1187);
    int _1753 = int(_1529) + int(_1597);
    int _1755 = ~_250;
    int _1757 = _1755 + 1;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1761 = _1759 != 0;
    float _1763 = _1673 * 6.283185482025146484375;
    float _1765 = cos(_1763);
    int _1767 = int(_1625) + int(_1721);
    int _1769 = _1731 * _1767;
    int _1771 = _1769 + _1565;
    float _1773 = _1723 * 6.283185482025146484375;
    float _1775 = cos(_1773);
    int _1777 = int(_1655) + int(_1749);
    float _1779 = _1703 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1781 = uint(_1771) >= uint(_250);
    float _1783 = _1677 * _1699;
    int _1785 = _1739 * _1777;
    int _1787 = _1785 + _1581;
    float _1789 = _1751 * _1779;
    float _1791 = _1557 * 6.283185482025146484375;
    float _1793 = sin(_1791);
    bool _1795 = !_1781;
    int _1797 = _1795 ? 0 : (-1);
    float _1799 = _1677 * _1765;
    bool _1801 = uint(_1787) >= uint(_266);
    int _1803 = ~_1767;
    int _1805 = _1803 + _1797;
    int _1807 = _1805 + 1;
    float _1809 = _1723 * 6.283185482025146484375;
    float _1811 = sin(_1809);
    float _1813 = _1677 * _1775;
    float _1815 = _1699 * _1775;
    float _1817 = _1813 * _863;
    float _1819 = _1813 * _1727;
    float _1821 = _1813 * _945;
    float _1823 = _1793 * _1765;
    float _1825 = _1793 * _1699;
    float _1827 = _1765 * _1775;
    float _1829 = _1793 * _1775;
    bool _1831 = !_1801;
    int _1833 = _1831 ? 0 : (-1);
    float _1835 = _1829 * _863;
    float _1837 = -_1783;
    float _1839 = fma(_1811, _1823, _1837);
    float _1841 = -_1823;
    float _1843 = fma(_1811, _1783, _1841);
    int _1845 = ~_1777;
    int _1847 = _1845 + _1833;
    int _1849 = _1847 + 1;
    int _1851 = _250 * _1807;
    int _1853 = _1851 + _1565;
    float _1855 = -_1727;
    float _1857 = _1811 * _1855;
    float _1859 = fma(_1811, _1799, _1825);
    float _1861 = fma(_1811, _1825, _1799);
    float _1863 = -_1735;
    float _1865 = _1811 * _1863;
    float _1867 = -_863;
    float _1869 = _1811 * _1867;
    float _1871 = -_945;
    float _1873 = _1811 * _1871;
    float _1875 = fma(_1827, _1725, _1857);
    bool _1877 = !_1315;
    int _1879 = _1877 ? _1853 : (-1);
    float _1881 = fma(_1827, _1711, _1865);
    float _1883 = fma(_1827, _861, _1869);
    float _1885 = fma(_1827, _947, _1873);
    int _1887 = _266 * _1849;
    int _1889 = _1887 + _1581;
    int _1891 = _1879 & 3;
    bool _1893 = _1891 != 0;
    int _1895 = _1757 * _1679;
    int _1897 = _1895 + _1285;
    int _1899 = _1879 & 3;
    bool _1901 = _1899 != 0;
    float _1903 = _1813 * _1735;
    bool _1905 = !_1337;
    int _1907 = _1905 ? _1889 : (-1);
    float _1909 = _1829 * _1735;
    int _1911 = _1893 ? 0 : 1;
    float _1913 = _1829 * _1727;
    bool _1915 = uint(_1899) > 1u;
    float _1917 = fma(_1859, _1711, _1903);
    int _1919 = _1907 >> 31;
    float _1921 = fma(_1859, _861, _1817);
    int _1923 = _1879 >> 31;
    float _1925 = fma(_1839, _861, _1835);
    int _1927 = _1919 & 3;
    float _1929 = _1829 * _945;
    int _1931 = _1923 & 3;
    float _1933 = fma(_1839, _1725, _1913);
    int _1935 = _1907 + _1927;
    float _1937 = fma(_1839, _947, _1929);
    int _1939 = ~_1911;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1815, _1789, _1875);
    int _1947 = _1879 + _1931;
    float _1949 = fma(_1815, _1743, _1881);
    int _1951 = _1943;
    if (!_1915)
    {
        int _1953 = ~_1911;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    float _1959 = fma(_1843, _1743, _1917);
    bool _1961 = uint(_1897) >= uint(_250);
    float _1963 = fma(_1861, _949, _1937);
    int _1965 = _1935 >> 2;
    float _1967 = fma(_1839, _1711, _1909);
    int _1969 = _1947 >> 2;
    float _1971 = fma(_1859, _1725, _1819);
    int _1973 = ~_266;
    int _1975 = _1973 + 1;
    float _1977 = fma(_1859, _947, _1821);
    int _1979 = _1965 << 4;
    int _1981 = _1979 + 512;
    float _1983 = fma(_1815, _865, _1883);
    int _1985 = _1969 << 4;
    int _1987 = _1985 + 368;
    float _1989 = fma(_1843, _1789, _1971);
    uint _1991 = uint(int(uint(_1981) >> uint(2)));
    uint _1993 = uint(int(uint(int(_1991)) >> uint(2)));
    int _1995 = int(_1991) & 3;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[int(_1993)][_1995];
    int _1999 = int(_1991) + 1;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    int _2003 = _1999 & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    bool _2007 = !_1961;
    int _2009 = _2007 ? 0 : (-1);
    float _2011 = fma(_1861, _1789, _1933);
    int _2013 = _1907 & 3;
    bool _2015 = _2013 != 0;
    int _2017 = _1975 * _1753;
    int _2019 = _2017 + _1297;
    int _2021 = ~_1679;
    int _2023 = _2021 + _2009;
    int _2025 = _2023 + 1;
    float _2027 = fma(_1815, _949, _1885);
    int _2029 = _2015 ? 0 : 1;
    uint _2031 = uint(int(uint(_1987) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[int(_2041)][_2043];
    bool _2047 = uint(_2019) >= uint(_266);
    int _2049 = _250 * _2025;
    int _2051 = _2049 + _1285;
    bool _2053 = uint(_2013) > 1u;
    float _2055 = fma(_1843, _865, _1921);
    bool _2057 = !_1901;
    int _2059 = _2057 ? 0 : 1;
    float _2061 = fma(_1843, _949, _1977);
    bool _2063 = _1899 != 3;
    int _2065 = _1987 + 8;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
    int _2071 = int(_2067) & 3;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[int(_2069)][_2071];
    int _2075 = int(_2067) + 1;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    int _2079 = _2075 & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    bool _2083 = !_2047;
    int _2085 = _2083 ? 0 : (-1);
    float _2087 = fma(_1861, _865, _1925);
    int _2089 = ~_2029;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1861, _1743, _1967);
    bool _2097 = uint(_1899) >= 2u;
    float _2099 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2101 = ~_1753;
    int _2103 = _2101 + _2085;
    int _2105 = _2103 + 1;
    int _2107 = _1981 + 8;
    uint _2109 = uint(int(uint(_2107) >> uint(2)));
    uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
    int _2113 = int(_2109) & 3;
    float _2115 = (*spvDescriptorSet0.vp_c9)._m0[int(_2111)][_2113];
    int _2117 = int(_2109) + 1;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    int _2121 = _2117 & 3;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[int(_2119)][_2121];
    int _2125 = _2093;
    float _2127 = _2027;
    float _2129 = _2061;
    if (!_2053)
    {
        int _2131 = ~_2029;
        int _2133 = _2131 + 1;
        _2125 = _2133;
    }
    int _2135 = _2125;
    float _2137 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2099);
    int _2139 = _2097 ? 0 : 1;
    int _2141 = _266 * _2105;
    int _2143 = _2141 + _1297;
    int _2145 = abs(_2135);
    float _2147 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2149 = abs(_1957);
    int _2151 = abs(_2059);
    int _2153 = _1907 & 3;
    bool _2155 = _2153 != 0;
    int _2157 = ~_2139;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    int _2163 = ~_2145;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    int _2169 = ~_2149;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    int _2175 = _2161;
    if (_2063)
    {
        int _2177 = ~_2139;
        int _2179 = _2177 + 1;
        _2175 = _2179;
    }
    int _2181 = _2175;
    bool _2183 = uint(_2013) >= 2u;
    int _2185 = _2167 * as_type<int>(_2005);
    int _2187 = ~_2151;
    int _2189 = _2187 + 1;
    int _2191 = _2189 + 1;
    int _2193 = abs(_2181);
    bool _2195 = _1899 != 3;
    bool _2197 = !_1315;
    int _2199 = _2197 ? _2051 : (-1);
    int _2201 = _2173 * as_type<int>(_2045);
    bool _2203 = !_2155;
    int _2205 = _2203 ? 0 : 1;
    bool _2207 = _2013 != 3;
    int _2209 = _2191 * as_type<int>(_2037);
    int _2211 = _2209 + _2201;
    float _2213 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2215 = int(_2213);
    int _2217 = abs(_2205);
    int _2219 = _2183 ? 0 : 1;
    int _2221 = ~_2193;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    int _2227 = ~_2217;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    bool _2233 = !_2195;
    int _2235 = _2233 ? 0 : (-1);
    int _2237 = _2225 * as_type<int>(_2073);
    int _2239 = _2237 + _2211;
    int _2241 = ~_2219;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    int _2247 = _2231 * as_type<int>(_1997);
    int _2249 = _2247 + _2185;
    int _2251 = _2245;
    if (_2207)
    {
        int _2253 = ~_2219;
        int _2255 = _2253 + 1;
        _2251 = _2255;
    }
    int _2257 = _2251;
    float _2259 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2261 = int(_2259);
    bool _2263 = !_1761;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = abs(_2235);
    bool _2269 = _2013 != 3;
    int _2271 = abs(_2257);
    int _2273 = abs(_2265);
    int _2275 = ~_2267;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    bool _2281 = !_2269;
    int _2283 = _2281 ? 0 : (-1);
    int _2285 = _2279 * as_type<int>(_2081);
    int _2287 = _2285 + _2239;
    float _2289 = float(uint(_2215));
    int _2291 = abs(_2283);
    int _2293 = ~_2271;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    float _2299 = 1.0 / _2289;
    int _2301 = ~_2273;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = ~_2291;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    int _2313 = _2297 * as_type<int>(_2115);
    int _2315 = _2313 + _2249;
    float _2317 = float(uint(_2261));
    int _2319 = _2287 * _2305;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2323 = _2321 != 0;
    int _2325 = _2311 * as_type<int>(_2123);
    int _2327 = _2325 + _2315;
    int _2329 = abs(_2215);
    int _2331 = _2199 * _2273;
    int _2333 = _2331 + _2319;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    float _2339 = 1.0 / _2317;
    float _2341 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2343 = float(uint(_2329));
    float _2345 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2347 = abs(_2337);
    float _2349 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2341);
    int _2351 = as_type<int>(_2299) + (-2);
    int _2353 = ~_2347;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    float _2359 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2147);
    int _2361 = abs(_2261);
    float _2363 = 1.0 / _2343;
    float _2365 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2349);
    float _2367 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2359);
    float _2369 = float(uint(_2333));
    int _2371 = _2357 * _2327;
    float _2373 = float(uint(_2361));
    float _2375 = _793 + _2367;
    int _2377 = as_type<int>(_2339) + (-2);
    float _2379 = _905 + _2365;
    float _2381 = as_type<float>(_2351) * _2369;
    bool _2383 = !_1337;
    int _2385 = _2383 ? _2143 : (-1);
    float _2387 = 1.0 / _2373;
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2391 = _2379 + _2389;
    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2395 = _2375 + _2393;
    int _2397 = _2385 * _2347;
    int _2399 = _2397 + _2371;
    int _2401 = abs(_2333);
    float _2403 = _2391 * _2391;
    int _2405 = ~_2215;
    int _2407 = _2405 + 1;
    float _2409 = trunc(_2381);
    float _2411 = precise::max(_2409, 0.0);
    uint _2413 = uint(_2411);
    float _2415 = float(uint(_2399));
    float _2417 = _2395 * _2395;
    int _2419 = as_type<int>(_2363) + (-2);
    float _2421 = float(uint(_2401));
    float _2423 = as_type<float>(_2377) * _2415;
    float _2425 = _2403 + _2417;
    int _2427 = abs(_2399);
    float _2429 = as_type<float>(_2419) * _2421;
    int _2431 = as_type<int>(_2387) + (-2);
    float _2433 = trunc(_2423);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = float(uint(_2427));
    float _2441 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2345);
    int _2443 = ~_2329;
    int _2445 = _2443 + 1;
    int _2447 = _2407 * int(_2413);
    int _2449 = _2447 + _2333;
    float _2451 = as_type<float>(_2431) * _2439;
    int _2453 = ~_2361;
    int _2455 = _2453 + 1;
    float _2457 = trunc(_2429);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    float _2463 = float(uint(_2449));
    float _2465 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2441);
    int _2467 = ~_2261;
    int _2469 = _2467 + 1;
    float _2471 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2473 = as_type<float>(_2351) * _2463;
    float _2475 = trunc(_2451);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2483 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2485 = _1335 + _2465;
    int _2487 = _2469 * int(_2437);
    int _2489 = _2487 + _2399;
    float _2491 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2481);
    float _2493 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2483);
    float _2495 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2497 = sqrt(_2425);
    float _2499 = float(uint(_2489));
    int _2501 = _2445 * int(_2461);
    int _2503 = _2501 + _2401;
    float _2505 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2471);
    float _2507 = as_type<float>(_2377) * _2499;
    float _2509 = float(uint(_2503));
    int _2511 = _2455 * int(_2479);
    int _2513 = _2511 + _2427;
    float _2515 = trunc(_2473);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    float _2521 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2523 = as_type<float>(_2419) * _2509;
    float _2525 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2527 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2521);
    float _2529 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2531 = _2497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = trunc(_2507);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    float _2539 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2495);
    float _2541 = float(uint(_2513));
    float _2543 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2545 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2529);
    float _2547 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2525);
    float _2549 = as_type<float>(_2431) * _2541;
    float _2551 = trunc(_2523);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    float _2557 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2543);
    float _2559 = _2403;
    float _2561 = _2417;
    float _2563 = _2375;
    float _2565 = _2527;
    if (!_2531)
    {
        _2127 = _2379;
    }
    float _2567 = _2127;
    float _2569 = _2567;
    if (!_2531)
    {
        _2129 = _2485;
    }
    float _2571 = _2129;
    float _2573 = trunc(_2549);
    float _2575 = precise::max(_2573, 0.0);
    uint _2577 = uint(_2575);
    bool _2579 = !_2531;
    float _2581 = _2571;
    if (!_2579)
    {
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2587 = _2497 + _2585;
        float _2589 = rsqrt(_2425);
        float _2591 = _2587 * _2583;
        float _2593 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2595 = _2591 * 0.15915493667125701904296875;
        float _2597 = _2595 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2595 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = fma(_2599, _2593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2607 = _2589 * _2605;
        float _2609 = _2603 + (-1.0);
        float _2611 = fma(_2391, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2613 = fma(_2395, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2615 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2619 = _2611 + _2617;
        float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2623 = _2613 + _2621;
        float _2625 = fma(_2485, _2603, _2615);
        float _2627 = _2619 * _2619;
        float _2629 = _2623 * _2623;
        _2581 = _2625;
        _2559 = _2627;
        _2561 = _2629;
        _2569 = _2611;
        _2563 = _2613;
    }
    float _2631 = _2581;
    float _2633 = _2559;
    float _2635 = _2561;
    float _2637 = _2569;
    float _2639 = _2563;
    int _2641 = int(_2413) + int(_2519);
    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2645 = _2631 + _2643;
    int _2647 = ~_2215;
    int _2649 = _2647 + 1;
    float _2651 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2505);
    int _2653 = int(_2437) + int(_2537);
    float _2655 = fma(_2645, _2645, _2633);
    int _2657 = ~_2261;
    int _2659 = _2657 + 1;
    int _2661 = _2649 * _2641;
    int _2663 = _2661 + _2333;
    int _2665 = int(_2461) + int(_2555);
    float _2667 = _2655 + _2635;
    int _2669 = ~_2329;
    int _2671 = _2669 + 1;
    int _2673 = _2659 * _2653;
    int _2675 = _2673 + _2399;
    bool _2677 = uint(_2663) >= uint(_2215);
    int _2679 = int(_2479) + int(_2577);
    int _2681 = _2671 * _2665;
    int _2683 = _2681 + _2401;
    int _2685 = ~_2361;
    int _2687 = _2685 + 1;
    float _2689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2691 = !_2677;
    int _2693 = _2691 ? 0 : (-1);
    bool _2695 = uint(_2675) >= uint(_2261);
    int _2697 = _2687 * _2679;
    int _2699 = _2697 + _2427;
    int _2701 = ~_2641;
    int _2703 = _2701 + _2693;
    int _2705 = _2703 + 1;
    bool _2707 = !_2695;
    int _2709 = _2707 ? 0 : (-1);
    float _2711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2713 = uint(_2683) >= uint(_2329);
    bool _2715 = uint(_2699) >= uint(_2361);
    bool _2717 = _2215 == 0;
    bool _2719 = _2215 == 0;
    float _2721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2723 = _2333 ^ _2215;
    int _2725 = _2215 * _2705;
    int _2727 = _2725 + _2333;
    int _2729 = _2399 ^ _2261;
    float _2731 = _2689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2733 = !_2715;
    int _2735 = _2733 ? 0 : (-1);
    bool _2737 = !_2713;
    int _2739 = _2737 ? 0 : (-1);
    float _2741 = sqrt(_2667);
    uint _2743 = uint(int(uint(_2723) >> uint(31)));
    uint _2745 = uint(int(uint(_2729) >> uint(31)));
    int _2747 = ~_2653;
    int _2749 = _2747 + _2709;
    int _2751 = _2749 + 1;
    bool _2753 = !_2717;
    int _2755 = _2753 ? _2727 : (-1);
    float _2757 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2759 = ~_2735;
    int _2761 = _2679 + _2759;
    int _2763 = _2761 + 1;
    int _2765 = _2261 * _2751;
    int _2767 = _2765 + _2399;
    int _2769 = ~_2739;
    int _2771 = _2665 + _2769;
    int _2773 = _2771 + 1;
    float _2775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2777 = ~int(_2743);
    int _2779 = _2777 + 1;
    float _2781 = fma(_2731, _358, -0.5);
    int _2783 = ~int(_2745);
    int _2785 = _2783 + 1;
    float _2787 = float(_2755);
    bool _2789 = _2261 == 0;
    int _2791 = _2773 ^ _2779;
    float _2793 = fma(_2731, _2787, _773);
    int _2795 = _2763 ^ _2785;
    float _2797 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2799 = _2261 == 0;
    float _2801 = fma(_2757, _400, -0.5);
    bool _2803 = !_2789;
    int _2805 = _2803 ? _2767 : (-1);
    float _2807 = _2775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2809 = ~_2779;
    int _2811 = _2809 + _2791;
    int _2813 = _2811 + 1;
    float _2815 = fma(_1447, _2781, _2793);
    int _2817 = ~_2785;
    int _2819 = _2817 + _2795;
    int _2821 = _2819 + 1;
    float _2823 = fma(_721, _2807, -0.5);
    float _2825 = float(_2805);
    float _2827 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2527);
    bool _2829 = !_2719;
    int _2831 = _2829 ? _2813 : (-1);
    bool _2833 = !_2799;
    int _2835 = _2833 ? _2821 : (-1);
    float _2837 = fma(_2757, _2825, _1481);
    float _2839 = float(_2831);
    float _2841 = float(_2835);
    float _2843 = fma(_531, _2797, -0.5);
    float _2845 = fma(_1473, _2801, _2837);
    float _2847 = -_787;
    float _2849 = fma(_2797, _2839, _2847);
    float _2851 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2853 = -_1467;
    float _2855 = fma(_2807, _2841, _2853);
    float _2857 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2545);
    float _2859 = fma(_1443, _2843, _2849);
    float _2861 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2539);
    float _2863 = fma(_1477, _2823, _2855);
    float _2865 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2547);
    float _2867 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2491);
    float _2869 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2557);
    float _2871 = _1531 + 0.5;
    float _2873 = _1537 + 0.5;
    float _2875 = _2815 + 0.5;
    float _2877 = _2845 + 0.5;
    float _2879 = _2859 + 0.5;
    float _2881 = _2863 + 0.5;
    float _2883 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2493);
    out.m_71.x = _2871;
    out.m_71.y = _2873;
    bool _2885 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2887 = isnan(_2741);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2893 = _2889 || _2891;
    out.m_73.x = _2861;
    out.m_73.y = _2827;
    out.m_73.z = _2865;
    out.m_75.x = _2857;
    out.m_75.y = _2651;
    out.m_75.z = _2869;
    out.m_77.x = _2875;
    out.m_77.y = _2879;
    out.m_77.z = _2877;
    out.m_77.w = _2881;
    float _2895 = _2815;
    float _2897 = _2865;
    float _2899 = _2827;
    if (!_2893)
    {
        _2895 = 1.0;
    }
    float _2901 = _2895;
    out.m_79.x = _2867;
    out.m_79.y = _2851;
    out.m_79.z = _2883;
    bool _2903 = !_2893;
    float _2905 = _2901;
    if (!_2903)
    {
        bool _2907 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2909 = isnan(_2741);
        bool _2911 = _2907 || _2909;
        bool _2913 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2915 = _2911 || _2913;
        if (!_2915)
        {
            float _2917 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2919 = _2741 + _2917;
            float _2921 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2923 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2921;
            float _2925 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2929 = 1.0 / _2923;
            float _2931 = _2919 * _2929;
            float _2933 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2905 = _2933;
            _2897 = _2927;
            _2935 = true;
        }
        else
        {
            bool _2937 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2939 = isnan(_2741);
            bool _2941 = _2937 || _2939;
            bool _2943 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2945 = _2941 || _2943;
            if (!_2945)
            {
                float _2947 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2949 = _2741 + _2947;
                float _2951 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2953 = _2951 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2955 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2957 = _2955 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2959 = 1.0 / _2953;
                float _2961 = _2949 * _2959;
                float _2963 = fma(_2961, _2957, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2905 = _2963;
                _2897 = _2957;
                _2935 = true;
            }
            else
            {
                _2905 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2935 = false;
    float _2965 = _2905;
    float _2967 = _2897;
    float _2969 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2971 = _2637 + _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2975 = _2631 + _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2979 = _2639 + _2977;
    bool _2981 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2983 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.5);
    bool _2989 = _2985 || _2987;
    float _2991 = fma(_2971, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2993 = fma(_2975, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2995 = fma(_2979, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2997 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2999 = _2967;
    float _3001 = _2971;
    if (_2989)
    {
        _2997 = _2991;
    }
    float _3003 = _2997;
    float _3005 = _3003;
    if (_2989)
    {
        _2899 = _2993;
    }
    float _3007 = _2899;
    float _3009 = _3007;
    if (_2989)
    {
        _2999 = _2995;
    }
    float _3011 = _2999;
    float _3013 = _3011;
    if (!_2989)
    {
        float _3015 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3017 = _1335 + _3015;
        float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3021 = _905 + _3019;
        float _3023 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3025 = _3017 * _3017;
        float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3029 = _793 + _3027;
        float _3031 = fma(_3021, _3021, _3025);
        float _3033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3035 = fma(_3029, _3029, _3031);
        float _3037 = sqrt(_3035);
        float _3039 = _3023 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3041 = precise::min(_3037, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3043 = _3041 * _3033;
        float _3045 = -_905;
        float _3047 = _3045 + _2991;
        float _3049 = -_1335;
        float _3051 = _3049 + _2993;
        float _3053 = _3039 * _3043;
        float _3055 = -_793;
        float _3057 = _3055 + _2995;
        float _3059 = fma(_3047, _3053, _905);
        float _3061 = fma(_3051, _3053, _1335);
        float _3063 = fma(_3057, _3053, _793);
        _3009 = _3061;
        _3005 = _3059;
        _3013 = _3063;
    }
    float _3065 = _3009;
    float _3067 = _3005;
    float _3069 = _3013;
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3073 = _3065 + _3071;
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3077 = _3067 + _3075;
    float _3079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3081 = _3069 + _3079;
    float _3083 = _3073 * _3073;
    float _3085 = fma(_3077, _3077, _3083);
    float _3087 = fma(_3081, _3081, _3085);
    float _3089 = rsqrt(_3087);
    float _3091 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3093 = _3077 * _3091;
    float _3095 = _3081 * _3091;
    float _3097 = _3093 * _3093;
    float _3099 = _3095 * _3095;
    float _3101 = _3097 + _3099;
    float _3103 = sqrt(_3101);
    bool _3105 = _3103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3109 = _3103 + _3107;
    float _3111 = _3081;
    float _3113 = _3101;
    float _3115 = _3109;
    float _3117 = _3073;
    if (_3105)
    {
        float _3119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3111 = _3119;
    }
    float _3121 = _3111;
    if (_3105)
    {
        float _3123 = rsqrt(_3101);
        _3113 = _3123;
    }
    float _3125 = _3113;
    float _3127 = _3125;
    if (_3105)
    {
        float _3129 = _3109 * _3121;
        _3115 = _3129;
    }
    float _3131 = _3115;
    if (_3105)
    {
        float _3133 = _3131 * 0.15915493667125701904296875;
        _3001 = _3133;
    }
    float _3135 = _3001;
    float _3137 = _3089;
    if (_3105)
    {
        float _3139 = _3135 * 6.283185482025146484375;
        float _3141 = sin(_3139);
        _3137 = _3141;
    }
    float _3143 = _3137;
    float _3145 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3147 = precise::max(0.0, _3145);
    float _3149 = _3083;
    float _3151 = _3147;
    float _3153 = _3145;
    if (_3105)
    {
        float _3155 = _3135 * 6.283185482025146484375;
        float _3157 = cos(_3155);
        _3149 = _3157;
    }
    float _3159 = _3149;
    float _3161 = -_3091;
    float _3163 = -_3147;
    float _3165 = fma(_3073, _3161, _3163);
    if (!_3105)
    {
        _3117 = _3095;
    }
    float _3167 = _3117;
    float _3169 = _3167;
    if (_3105)
    {
        float _3171 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3151 = _3171;
    }
    float _3173 = _3151;
    float _3175 = _3173;
    float _3177 = _3143;
    if (_3105)
    {
        float _3179 = fma(_3143, _3173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3175 = _3179;
    }
    float _3181 = _3175;
    float _3183 = _3181;
    if (!_3105)
    {
        _3177 = _3093;
    }
    float _3185 = _3177;
    float _3187 = _3185;
    float _3189 = _3159;
    if (_3105)
    {
        float _3191 = _3159 + (-1.0);
        _3153 = _3191;
    }
    float _3193 = _3153;
    if (_3105)
    {
        float _3195 = _3125 * _3181;
        _2565 = _3195;
    }
    float _3197 = _2565;
    if (!_3105)
    {
        _3183 = _3165;
    }
    float _3199 = _3183;
    float _3201 = _3199;
    if (_3105)
    {
        float _3203 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _551 = _3203;
    }
    float _3205 = _551;
    if (_3105)
    {
        float _3207 = _3093 * _3197;
        _3187 = _3207;
    }
    float _3209 = _3187;
    if (!_3105)
    {
        _3127 = _3097;
    }
    float _3211 = _3127;
    float _3213 = sqrt(_3087);
    float _3215 = _3211;
    if (_3105)
    {
        float _3217 = fma(_3165, _3159, _3205);
        _3201 = _3217;
    }
    float _3219 = _3201;
    if (_3105)
    {
        float _3221 = _3095 * _3197;
        _3169 = _3221;
    }
    float _3223 = _3169;
    if (_3105)
    {
        float _3225 = _3209 * _3209;
        _3215 = _3225;
    }
    float _3227 = _3215;
    if (!_3105)
    {
        _3189 = _3099;
    }
    float _3229 = _3189;
    float _3231 = _3229;
    if (_3105)
    {
        float _3233 = _3223 * _3223;
        _3231 = _3233;
    }
    float _3235 = _3231;
    float _3237 = fma(_3219, _3219, _3227);
    float _3239 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3241 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3243 = _3237 + _3235;
    float _3245 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3239);
    float _3247 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3241);
    float _3249 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3251 = rsqrt(_3243);
    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3255 = fma(_3213, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3253);
    float _3257 = precise::clamp(_3255, 0.0, 1.0);
    float _3259 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3245);
    float _3261 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3263 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3247);
    float _3265 = -_3257;
    float _3267 = _3265 + 1.0;
    float _3269 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3271 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3261);
    float _3273 = _3263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3275 = abs(_3267);
    float _3277 = log2(_3275);
    float _3279 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3249);
    float _3281 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3271);
    float _3283 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3285 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3287 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3279);
    float _3289 = _3281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3291 = _3251 * _3209;
    float _3293 = _3251 * _3219;
    float _3295 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3297 = _3251 * _3223;
    float _3299 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3301 = -_3285;
    float _3303 = fma(_3301, _3283, 1.0);
    float _3305 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3295);
    float _3307 = _3287 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3309 = -_3299;
    float _3311 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3309);
    float _3313 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3315 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3305);
    float _3317 = log2(_3303);
    float _3319 = -_3297;
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3311);
    float _3323 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3325 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3315);
    float _3327 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3329 = fma(_3321, -0.5, 0.5);
    float _3331 = fma(_3321, 0.5, 0.5);
    float _3333 = exp2(_3313);
    float _3335 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3323);
    float _3337 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3327);
    float _3339 = fma(_3331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3341 = _3293 + 1.0;
    float _3343 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3335);
    float _3345 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3337);
    float _3347 = fma(_3331, _3339, -0.212114393711090087890625);
    float _3349 = 1.0 / _3325;
    float _3351 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3343);
    float _3353 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3345);
    float _3355 = fma(_3331, _3347, 1.570728778839111328125);
    float _3357 = sqrt(_3329);
    float _3359 = -_3293;
    float _3361 = fma(_3333, _3341, _3359);
    float _3363 = _3317 * 0.693147182464599609375;
    float _3365 = fma(_3361, 0.5, 0.5);
    float _3367 = _3363 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3369 = _3351 * _3349;
    float _3371 = _3353 * _3349;
    float _3373 = fma(_3369, 0.5, 0.5);
    float _3375 = fma(_3371, -0.5, 0.5);
    float _3377 = _3357 * 0.636619746685028076171875;
    float3 _8817 = float3(_3373, _3375, _3367);
    float _3379 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8817, float3(0.0), isnan(_8817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8817, float3(0.0), isnan(_8817)), level(0.0)).x;
    float3 _8828 = float3(_3373, _3375, _3367);
    float4 _3382 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8828, float3(0.0), isnan(_8828)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8828, float3(0.0), isnan(_8828)), level(0.0)).xyzw;
    float _3384 = _3382.x;
    float _3386 = _3382.y;
    float _3388 = _3382.z;
    float _3390 = _3382.w;
    float _3392 = -_3355;
    float _3394 = fma(_3377, _3392, 1.0);
    float2 _8850 = float2(_3394, _3365);
    float3 _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8850, float2(0.0), isnan(_8850)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8850, float2(0.0), isnan(_8850)), level(0.0)).xyz;
    float _3400 = _3398.x;
    float _3402 = _3398.y;
    float _3404 = _3398.z;
    float _3406 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3408 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _3067;
    out.m_81.y = _3065;
    out.m_81.z = _3069;
    bool _3410 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3412 = isnan(_3213);
    bool _3414 = _3410 || _3412;
    bool _3416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3418 = _3414 || _3416;
    float _3420 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3408);
    float _3422 = exp2(_3406);
    float _3424 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3420);
    float _3426 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3424);
    float _3428 = _3351;
    float _3430 = _3426;
    float _3432 = _3351;
    float _3434 = _3325;
    if (!_3418)
    {
        _3428 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3436 = _3428;
    float _3438 = _3426 + _3325;
    out.gl_Position.x = _3351;
    out.gl_Position.y = _3353;
    out.gl_Position.z = _3426;
    out.gl_Position.w = _3325;
    float _3440 = _3438 * 0.5;
    float _3442 = -_3422;
    float _3444 = _3442 + 1.0;
    float _3446 = _3444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.z = _3440;
    out.m_83.w = _3325;
    float _3448 = -_3446;
    float _3450 = _3448 + 1.0;
    float _3452 = _3440;
    float _3454 = _3446;
    float _3456 = _3436;
    float _3458 = _3436;
    if (!_3418)
    {
        _3430 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3460 = _3430;
    float _3462 = _3460;
    float _3464 = _3460;
    if (!_3418)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3466 = _3432;
    float _3468 = _3466;
    float _3470 = _3466;
    if (!_3418)
    {
        _3434 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3472 = _3434;
    float _3474 = _3472;
    float _3476 = _3472;
    if (!_3418)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3478 = _3452;
    float _3480 = _3446 * _3379;
    float _3482 = _3390 * _3450;
    float _3484 = _3478;
    float _3486 = _3478;
    if (!_3418)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3488 = _3454;
    float _3490 = _3390 * _3480;
    float _3492 = _3404 * _3480;
    float _3494 = fma(_3400, _3490, _3384);
    float _3496 = fma(_3402, _3490, _3386);
    float _3498 = fma(_3390, _3492, _3388);
    out.m_85.x = _3494;
    out.m_85.y = _3496;
    out.m_85.z = _3498;
    out.m_85.w = _3482;
    bool _3500 = !_3418;
    float _3502 = _3488;
    float _3504 = _3488;
    if (!_3500)
    {
        bool _3506 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3508 = isnan(_3213);
        bool _3510 = _3506 || _3508;
        bool _3512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3514 = _3510 || _3512;
        if (!_3514)
        {
            float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3518 = _3213 + _3516;
            float _3520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3520;
            float _3524 = 1.0 / _3522;
            float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3546 = _3518 * _3524;
            float _3548 = precise::clamp(_3546, 0.0, 1.0);
            float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3554 = fma(_3548, _3528, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3556 = fma(_3548, _3552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3558 = fma(_3548, _3532, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3560 = fma(_3548, _3536, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3562 = fma(_3548, _3540, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3564 = fma(_3548, _3544, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3504 = _3556;
            _3486 = _3562;
            _3464 = _3554;
            _3476 = _3560;
            _3470 = _3558;
            _3458 = _3564;
            _3566 = true;
        }
        else
        {
            bool _3568 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3570 = isnan(_3213);
            bool _3572 = _3568 || _3570;
            bool _3574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3576 = _3572 || _3574;
            if (!_3576)
            {
                _3462 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3578 = _3462;
            _3464 = _3578;
            if (!_3576)
            {
                _3502 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3580 = _3502;
            _3504 = _3580;
            if (!_3576)
            {
                _3468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3582 = _3468;
            _3470 = _3582;
            if (!_3576)
            {
                _3474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3584 = _3474;
            _3476 = _3584;
            if (!_3576)
            {
                _3484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3586 = _3484;
            _3486 = _3586;
            if (!_3576)
            {
                _3456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3588 = _3456;
            bool _3590 = !_3576;
            _3458 = _3588;
            if (!_3590)
            {
                bool _3592 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3594 = isnan(_3213);
                bool _3596 = _3592 || _3594;
                bool _3598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3600 = _3596 || _3598;
                if (!_3600)
                {
                    float _3602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3604 = _3213 + _3602;
                    float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3608 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3606;
                    float _3610 = 1.0 / _3608;
                    float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3614 = _3612 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3616 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3618 = _3616 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3620 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3622 = _3620 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3624 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3626 = _3624 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3632 = _3604 * _3610;
                    float _3634 = precise::clamp(_3632, 0.0, 1.0);
                    float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3640 = fma(_3634, _3614, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3642 = fma(_3634, _3638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3644 = fma(_3634, _3618, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3646 = fma(_3634, _3622, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3648 = fma(_3634, _3626, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3650 = fma(_3634, _3630, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3504 = _3642;
                    _3486 = _3648;
                    _3464 = _3640;
                    _3476 = _3646;
                    _3470 = _3644;
                    _3458 = _3650;
                    _3566 = true;
                }
                else
                {
                    _3504 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3464 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3566 = false;
    float _3652 = _3504;
    float _3654 = _3486;
    float _3656 = _3464;
    float _3658 = _3476;
    float _3660 = _3470;
    float _3662 = _3458;
    float _3664 = fma(_2851, -0.5, 0.5);
    float _3666 = precise::clamp(_3664, 0.0, 1.0);
    float _3668 = -_3652;
    float _3670 = _3668 + _3654;
    float _3672 = -_3656;
    float _3674 = _3672 + _3658;
    float _3676 = -_3660;
    float _3678 = _3676 + _3662;
    bool _3680 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3682 = fma(_3666, _3670, _3652);
    float _3684 = fma(_3666, _3674, _3656);
    float _3686 = fma(_3666, _3678, _3660);
    float _3688 = _3682 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _3690 = fma(_3684, 0.298911988735198974609375, _3688);
    float _3692 = fma(_3686, 0.114477999508380889892578125, _3690);
    float _3694 = -_3692;
    float _3696 = _3684 + _3694;
    float _3698 = -_3692;
    float _3700 = _3682 + _3698;
    float _3702 = -_3692;
    float _3704 = _3686 + _3702;
    float _3706 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3708 = fma(_3696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    float _3710 = fma(_3700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    float _3712 = fma(_3704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    out.m_49.x = _3706;
    out.m_89.x = _3708;
    out.m_89.y = _3710;
    out.m_89.z = _3712;
    if (!_3680)
    {
        return out;
    }
    float _3714 = -_3065;
    float _3716 = _3714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3718 = -_3067;
    float _3720 = _3718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3722 = -_3069;
    float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3726 = _3716 * _3716;
    float _3728 = fma(_3720, _3720, _3726);
    float _3730 = fma(_3724, _3724, _3728);
    float _3732 = sqrt(_3730);
    float _3734 = rsqrt(_3730);
    float _3736 = -_3732;
    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3740 = _3738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3742 = precise::clamp(_3740, 0.0, 1.0);
    float _3744 = _3720 * _3734;
    float _3746 = _3716 * _3734;
    float _3748 = abs(_3742);
    float _3750 = log2(_3748);
    float _3752 = _3724 * _3734;
    float _3754 = _3744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3756 = _2851 * _3746;
    float _3758 = -_3746;
    float _3760 = -_3754;
    float _3762 = fma(_3758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3760);
    float _3764 = fma(_2867, _3744, _3756);
    float _3766 = -_3752;
    float _3768 = fma(_3766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3762);
    float _3770 = fma(_2883, _3752, _3764);
    float _3772 = precise::clamp(_3770, 0.0, 1.0);
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3776 = _3768 + _3774;
    float _3778 = _3750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3780 = _3776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3782 = precise::clamp(_3780, 0.0, 1.0);
    float _3784 = exp2(_3778);
    float _3786 = _3784 * _3782;
    float _3788 = _3772 * _3786;
    float _3790 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3792 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3794 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _3790;
    out.m_87.y = _3792;
    out.m_87.z = _3794;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3566 = false;
    bool _2935 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3851 = as_type<float>(_124);
        out.gl_Position.z = _3851;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    int _144 = 0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _118 = _148;
    }
    float _150 = _118;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _126 = as_type<int>(_162);
    }
    int _164 = _126;
    int _166 = _164;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3922 = as_type<float>(_164);
        out.gl_Position.z = _3922;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    bool _172 = _168;
    float _190;
    if (!_170)
    {
        float _174 = in.m_53.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_108);
        float _196 = 1.0 / _194;
        float _198 = _142 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _204 = int(_202);
    float _206 = in.m_53.x;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _200 + _208;
    float _212 = in.m_55.x;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _216 = _214 != 0;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    float _222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _224 = int(_222);
    float _226 = in.m_53.z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _230 = _228 != 0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = _200 + _232;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _238 = _236 != 0;
    float _240 = in.m_53.y;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _244 = _200 + _242;
    float _246 = float(_204);
    float _248 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _250 = int(_248);
    float _252 = in.m_55.y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _256 = 0.0;
    if (_230)
    {
        _256 = 1.0;
    }
    float _258 = _256;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _262 = float(_224);
    float _264 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _266 = int(_264);
    float _268 = _258;
    if (_216)
    {
        bool _270 = _206 > 0.5;
        _172 = _270;
    }
    bool _272 = _172;
    float _274 = 0.0;
    float _276 = _212;
    if (!_216)
    {
        _274 = _212;
    }
    float _278 = _274;
    float _280 = _278;
    if (_238)
    {
        float _282 = -_212;
        float _284 = _282 + 1.0;
        _144 = as_type<int>(_284);
    }
    int _286 = _144;
    float _288 = 0.0;
    if (!_238)
    {
        _288 = _212;
    }
    float _290 = _288;
    float _292 = float(uint(_250));
    float _294 = 1.0 / _262;
    float _296 = 0.0;
    float _298 = _290;
    if (_230)
    {
        _296 = _206;
    }
    float _300 = _296;
    int _302 = 0;
    float _304 = _300;
    if (_230)
    {
        _302 = 0;
    }
    int _306 = _302;
    float _308 = 0.0;
    int _310 = _306;
    if (_230)
    {
        _308 = 1.0;
    }
    float _312 = _308;
    float _314 = _312;
    if (!_230)
    {
        _268 = 7.345489978790283203125;
    }
    float _316 = _268;
    float _318 = 1.0 / _246;
    float _320 = float(uint(_266));
    float _322 = _206 * 2.0;
    if (!_230)
    {
        _304 = _240;
    }
    float _324 = _304;
    float _326 = _316 * _206;
    if (!_230)
    {
        _310 = 2;
    }
    int _328 = _310;
    if (!_230)
    {
        _314 = 1.2345600128173828125;
    }
    float _330 = _314;
    float _332 = _294 * _142;
    float _334 = 1.0 / _320;
    float _336 = _324 * _330;
    float _338 = _318 * _142;
    float _340 = trunc(_332);
    int _342 = int(_340);
    float _344 = in.m_53.w;
    int _346 = as_type<int>(_318);
    if (_216)
    {
        float _348 = -_212;
        float _350 = _348 + 1.0;
        _346 = as_type<int>(_350);
    }
    int _352 = _346;
    float _354 = float(_108);
    if (_216)
    {
        float _356 = _272 ? as_type<float>(_352) : _212;
        _280 = _356;
    }
    float _358 = _280;
    float _360 = 1.0 / _292;
    int _362 = as_type<int>(_334) + (-2);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = float(_250);
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _380 = _378 != 0;
    float _382 = trunc(_338);
    int _384 = int(_382);
    float _386 = float(uint(_342));
    float _388 = _368 * _142;
    bool _390 = _226 > 0.5;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _394 = _392 != 0;
    float _396 = as_type<float>(_362) * _386;
    if (_238)
    {
        float _398 = _390 ? as_type<float>(_286) : _212;
        _298 = _398;
    }
    float _400 = _298;
    float _402 = 1.0 / _354;
    int _404 = as_type<int>(_360) + (-2);
    bool _406 = _344 > 0.5;
    float _408 = _240 * 2.0;
    bool _410 = !_372;
    int _412 = _410 ? 0 : 1;
    bool _414 = !_376;
    int _416 = _414 ? 0 : 1;
    float _418 = trunc(_396);
    float _420 = precise::max(_418, 0.0);
    uint _423 = uint(_420);
    float _425 = float(uint(_384));
    float _427 = as_type<float>(_384);
    if (_394)
    {
        float _429 = -_212;
        float _431 = _429 + 1.0;
        _166 = as_type<int>(_431);
    }
    int _433 = _166;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _437 = _435 != 0;
    bool _439 = _240 > 0.5;
    float _441 = as_type<float>(_404) * _425;
    bool _443 = !_437;
    int _445 = _443 ? 0 : 1;
    float _447 = floor(_408);
    int _449 = ~_266;
    int _451 = _449 + 1;
    float _453 = _388 * _402;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _457 = _455 != 0;
    if (_394)
    {
        float _459 = _439 ? as_type<float>(_433) : _212;
        _276 = _459;
    }
    float _461 = _276;
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _465 = _463 != 0;
    float _467 = trunc(_441);
    float _469 = precise::max(_467, 0.0);
    uint _471 = uint(_469);
    int _473 = _451 * int(_423);
    int _475 = _473 + _342;
    bool _477 = !_380;
    int _479 = _477 ? 0 : 1;
    bool _481 = !_465;
    int _483 = _481 ? 0 : 1;
    float _485 = float(uint(_475));
    float _487 = floor(_322);
    int _489 = ~_250;
    int _491 = _489 + 1;
    float _493 = as_type<float>(_362) * _485;
    float _495 = float(_266);
    int _497 = _491 * int(_471);
    int _499 = _497 + _384;
    float _501 = -_252;
    float _503 = _501 + 1.0;
    float _505 = trunc(_493);
    float _507 = precise::max(_505, 0.0);
    uint _509 = uint(_507);
    float _511 = _495 * _142;
    float _513 = float(uint(_499));
    int _515 = _439 ? as_type<int>(_503) : as_type<int>(_252);
    float _517 = _511 * _402;
    bool _519 = _447 >= 0.0;
    bool _521 = isnan(_447);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    float _529 = as_type<float>(_404) * _513;
    float _531 = _457 ? as_type<float>(_515) : _252;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _533;
    bool _537 = _447 > 0.0;
    float _539 = trunc(_529);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _406 ? as_type<int>(_503) : as_type<int>(_252);
    int _547 = _390 ? as_type<int>(_503) : as_type<int>(_252);
    int _549 = as_type<int>(_503);
    float _551 = _531;
    if (_230)
    {
        _549 = 0;
    }
    int _553 = _549;
    bool _555 = _487 > 0.0;
    int _557 = _553;
    if (!_230)
    {
        _557 = 1;
    }
    int _559 = _557;
    int _561 = _527 ? 0 : 1;
    bool _563 = _487 >= 0.0;
    bool _565 = isnan(_487);
    bool _567 = _563 || _565;
    bool _569 = isnan(0.0);
    bool _571 = _567 || _569;
    bool _573 = _559 != 1;
    int _575 = _571 ? 0 : 1;
    int _577 = int(_471) + int(_543);
    int _579 = int(_423) + int(_509);
    int _581 = ~_250;
    int _583 = _581 + 1;
    float _585 = in.m_46.x;
    float _587 = in.m_46.y;
    float _589 = in.m_46.z;
    int _591 = ~_575;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    int _597 = _595;
    if (!_555)
    {
        int _599 = ~_575;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    int _605 = _583 * _577;
    int _607 = _605 + _384;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _611 = _609 != 0;
    int _613 = ~_266;
    int _615 = _613 + 1;
    float _617 = 0.0;
    if (!_573)
    {
        _617 = _240;
    }
    float _619 = _617;
    bool _621 = !_611;
    int _623 = _621 ? 0 : 1;
    int _625 = _615 * _579;
    int _627 = _625 + _342;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _635 = _633 != 0;
    bool _637 = uint(_607) >= uint(_250);
    float _639 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _641 = ~_561;
    int _643 = _641 + 1;
    int _645 = _643 + 1;
    float _647 = 0.0;
    int _649 = _645;
    float _651 = _619;
    if (!_573)
    {
        _647 = _619;
    }
    float _653 = _647;
    float _655 = -_260;
    float _657 = fma(_639, 2.0, _655);
    float _659 = 0.0;
    float _661 = _653;
    if (!_573)
    {
        _659 = _226;
    }
    float _663 = _659;
    float _665 = _587 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = 0.0;
    float _669 = _663;
    if (!_573)
    {
        _667 = _226;
    }
    float _671 = _667;
    float _673 = _587 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _675 = _671;
    if (!_537)
    {
        int _677 = ~_561;
        int _679 = _677 + 1;
        _649 = _679;
    }
    int _681 = _649;
    float _683 = _587 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_573)
    {
        _661 = _206;
    }
    float _685 = _661;
    float _687 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    if (_573)
    {
        _651 = _206;
    }
    float _689 = _651;
    float _691 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].x, _673);
    if (_573)
    {
        _669 = _240;
    }
    float _693 = _669;
    float _695 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].x, _683);
    if (_573)
    {
        _675 = _240;
    }
    float _697 = _675;
    float _699 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[4].z, _687);
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _703 = _701 != 0;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _707 = _705 != 0;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _711 = _709 != 0;
    float _713 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[6].z, _695);
    bool _715 = uint(_627) >= uint(_266);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _717;
    float _721 = _631 ? as_type<float>(_545) : _252;
    float _723 = _240 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _725 = !_637;
    int _727 = _725 ? 0 : (-1);
    float _729 = fma(_589, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    int _731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _733 = _731 != 0;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _737 = _735 != 0;
    float _739 = fma(_723, -2.0, _254);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _745 = _635 ? as_type<float>(_547) : _252;
    float _747 = _206 + _252;
    bool _749 = !_715;
    int _751 = _749 ? 0 : (-1);
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _763 = _761 != 0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _765;
    float _769 = 1.0 / _755;
    float _771 = -_142;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[76].x, _657);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _783 = !_703;
    int _785 = _783 ? 0 : 1;
    float _787 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _739);
    float _789 = 1.0 / _767;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _793 = _713 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _795 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _797 = isnan(_200);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _809 = !_707;
    int _811 = _809 ? 0 : 1;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _817 = 1.0 / _777;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _831 = _226 * 2.0;
    float _833 = 1.0 / _781;
    float _835 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _837 = _210 * _789;
    float _839 = _823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _827;
    out.m_57.y = _807;
    out.m_57.z = _835;
    float _845 = _220 * _769;
    float _847 = floor(_831);
    float _849 = _206 + _240;
    float _851 = in.m_59.x;
    float _853 = in.m_59.y;
    float _855 = in.m_59.z;
    float _857 = _234 * _817;
    float _859 = _849 + (-1.0);
    float _861 = in.m_61.x;
    float _863 = in.m_61.y;
    float _865 = in.m_61.z;
    float _867 = in.m_61.w;
    float _869 = fma(_366, _837, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _871 = _244 * _833;
    out.m_63.x = _839;
    out.m_63.y = _841;
    out.m_63.z = _843;
    float _873 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _875 = fma(_719, _857, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _877 = fma(_535, _857, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _883 = fma(_743, _845, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _885 = _847 >= 0.0;
    bool _887 = isnan(_847);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    float _895 = -_805;
    float _897 = _895 + 1.0;
    float _899 = floor(_326);
    bool _901 = !_711;
    int _903 = _901 ? 0 : 1;
    float _905 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _907 = _893 ? 0 : 1;
    float _909 = _206 + _226;
    float _911 = _240 + _226;
    bool _913 = _847 > 0.0;
    float _915 = _909 + (-1.0);
    int _917 = abs(_811);
    float _919 = _911 + (-1.0);
    int _921 = abs(_903);
    float _923 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _925 = _851 * _865;
    float _927 = _855 * _863;
    float _929 = _853 * _861;
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _933 = -_925;
    float _935 = fma(_855, _861, _933);
    float _937 = -_927;
    float _939 = fma(_853, _865, _937);
    float _941 = -_929;
    float _943 = fma(_851, _863, _941);
    float _945 = _935 * _867;
    float _947 = _939 * _867;
    float _949 = _943 * _867;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _955;
    float _959 = -_899;
    float _961 = _326 + _959;
    float _963 = float(_681);
    float _965 = fma(_953, _837, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _967 = fma(_957, _837, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _975 = _973 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _977;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _983 = fma(_971, _845, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _985 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _987 = isnan(_200);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = fma(_979, _857, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1003 = fma(_975, _845, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1005 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _1007 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1009 = isnan(_200);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1021 = fma(_1001, _871, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1023 = -_995;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_815, _871, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    int _1029 = ~_907;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = _995 * _897;
    int _1037 = _1033;
    float _1039 = _851;
    float _1041 = _853;
    float _1043 = _855;
    if (!_913)
    {
        int _1045 = ~_907;
        int _1047 = _1045 + 1;
        _1037 = _1047;
    }
    int _1049 = _1037;
    float _1051 = _1017 * _1025;
    bool _1053 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1055 = isnan(_200);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1061 = _1057 || _1059;
    float _1063 = float(_1061);
    float _1065 = fma(_142, 0.039999999105930328369140625, _747);
    bool _1067 = _328 != 2;
    float _1069 = -_1017;
    float _1071 = _1069 + 1.0;
    bool _1073 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1075 = isnan(_200);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -_1063;
    float _1087 = _1085 + 1.0;
    float _1089 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1091 = _1063 * _1071;
    float _1093 = floor(_336);
    float _1095 = _1083 * _1087;
    float _1097 = in.m_65.x;
    float _1099 = in.m_65.y;
    float _1101 = in.m_65.z;
    float _1103 = _1089 * 0.15915493667125701904296875;
    float _1105 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1107 = _965 * _1095;
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    float _1113 = _869 * _1095;
    float _1115 = _1103 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = _967 * _1095;
    float _1121 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1107);
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1113);
    int _1125 = abs(_785);
    float _1127 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1119);
    float _1129 = fma(_983, _1091, _1121);
    float _1131 = float(_342);
    float _1133 = -_1093;
    float _1135 = _336 + _1133;
    float _1137 = float(_384);
    float _1139 = fma(_883, _1091, _1123);
    float _1141 = fma(_1003, _1091, _1127);
    bool _1143 = _1131 >= _495;
    bool _1145 = isnan(_1131);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_495);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = _495 * _1135;
    bool _1157 = _1137 >= _368;
    bool _1159 = isnan(_1137);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(_368);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = _961 * _368;
    float _1171 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1173 = _981 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1175 = fma(_875, _1051, _1129);
    float _1177 = fma(_877, _1051, _1139);
    float _1179 = fma(_851, _1171, _1097);
    float _1181 = fma(_853, _1171, _1099);
    float _1183 = _1097;
    if (_1067)
    {
        _1183 = _206;
    }
    float _1185 = _1183;
    float _1187 = fma(_855, _1171, _1101);
    float _1189 = fma(_997, _1051, _1141);
    float _1191 = _1185;
    if (!_1067)
    {
        _1191 = _226;
    }
    float _1193 = _1191;
    float _1195 = fma(_1173, _461, -0.5);
    float _1197 = float(_603);
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1201 = float(_917);
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1205 = float(_921);
    float _1207 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1209 = log2(_1207);
    float _1211 = float(_1049);
    float _1213 = -_1199;
    float _1215 = fma(_1203, 2.0, _1213);
    float _1217 = _1205 * _963;
    float _1219 = _685 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1221 = _1201 * _1197;
    float _1223 = trunc(_1169);
    int _1225 = int(_1223);
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1229 = ~_579;
    int _1231 = _1229 + _751;
    int _1233 = _1231 + 1;
    float _1235 = fma(_1021, _1035, _1175);
    float _1237 = float(_1125);
    float _1239 = -_1227;
    float _1241 = fma(_1219, 2.0, _1239);
    float _1243 = fma(_1027, _1035, _1189);
    float _1245 = trunc(_1155);
    int _1247 = int(_1245);
    int _1249 = ~_577;
    int _1251 = _1249 + _727;
    int _1253 = _1251 + 1;
    float _1255 = _1237 * _1211;
    int _1257 = abs(_623);
    float _1259 = _693 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1261 = _250 * _1253;
    int _1263 = _1261 + _384;
    int _1265 = abs(_445);
    float _1267 = trunc(_1167);
    int _1269 = int(_1267);
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1273 = in.m_67.x;
    float _1275 = in.m_67.y;
    float _1277 = in.m_67.z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1281 = fma(_1259, -2.0, _1271);
    int _1283 = _1225 * _1265;
    int _1285 = _1283 + _384;
    float _1287 = _1209 * _142;
    float _1289 = trunc(_1153);
    int _1291 = int(_1289);
    if (_1067)
    {
        _427 = _240;
    }
    float _1293 = _427;
    int _1295 = _1247 * _1257;
    int _1297 = _1295 + _342;
    float _1299 = _1293;
    if (!_1067)
    {
        _1299 = _206;
    }
    float _1301 = _1299;
    int _1303 = _266 * _1233;
    int _1305 = _1303 + _342;
    float _1307 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1279);
    bool _1309 = !_737;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = _1255 * (-2.0);
    bool _1315 = _250 == 0;
    float _1317 = exp2(_1287);
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1321 = ~_1269;
    int _1323 = _1321 + 1;
    int _1325 = _1323 + 1;
    float _1327 = fma(_873, _1313, _873);
    bool _1329 = !_1315;
    int _1331 = _1329 ? _1263 : (-1);
    float _1333 = fma(_745, _1105, -0.5);
    float _1335 = _729 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1337 = _266 == 0;
    int _1339 = _1331 * _1325;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1343 = ~_1291;
    int _1345 = _1343 + 1;
    int _1347 = _1345 + 1;
    float _1349 = fma(_1313, _1273, _1273);
    bool _1351 = !_1337;
    int _1353 = _1351 ? _1305 : (-1);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1357 = !_733;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = -_1317;
    float _1363 = _1361 + 1.0;
    bool _1365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1367 = isnan(0.0);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1373 = _1369 || _1371;
    int _1375 = _1347 * _1353;
    float _1377 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1355);
    float _1379 = trunc(_453);
    int _1381 = int(_1379);
    float _1383 = float(uint(_1285));
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1387 = _1373 ? _1363 : 0.0;
    float _1389 = _206 + (-0.5);
    bool _1391 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1393 = isnan(1.0);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1399 = _1395 || _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1403 = 1.0 + _1401;
    float _1405 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1385);
    float _1407 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1377);
    float _1409 = as_type<float>(_404) * _1383;
    float _1411 = fma(_1319, -2.0, _1341);
    int _1413 = _250 + (-1);
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1417 = 1.0 / _1403;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1421 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1349);
    float _1423 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1415);
    int _1425 = _1269 * _1413;
    int _1427 = _1425 + _1339;
    int _1429 = abs(_416);
    float _1431 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1419);
    float _1433 = trunc(_1409);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1441 = _266 + (-1);
    float _1443 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1423);
    float _1445 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1439);
    float _1447 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1405);
    float _1449 = float(uint(_1297));
    float _1451 = trunc(_517);
    int _1453 = int(_1451);
    int _1455 = abs(_1311);
    int _1457 = _1291 * _1441;
    int _1459 = _1457 + _1375;
    int _1461 = ~_250;
    int _1463 = _1461 + 1;
    float _1465 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1445);
    float _1467 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1281);
    float _1469 = -_142;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1215);
    float _1473 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1307);
    float _1475 = as_type<float>(_362) * _1449;
    float _1477 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1431);
    float _1479 = -_142;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1241);
    float _1483 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1411);
    if (_1399)
    {
        float _1485 = _1387 * _1417;
        _146 = _1485;
    }
    float _1487 = _146;
    int _1489 = abs(_412);
    int _1491 = _1463 * int(_1437);
    int _1493 = _1491 + _1285;
    int _1495 = abs(_1359);
    int _1497 = _1459 * _1455;
    int _1499 = _1427 * _1429;
    float _1501 = fma(_1327, _1487, _1421);
    float _1503 = float(uint(_1493));
    int _1505 = _1381 * _1489;
    int _1507 = _1505 + _1499;
    int _1509 = ~_266;
    int _1511 = _1509 + 1;
    int _1513 = _1453 * _1495;
    int _1515 = _1513 + _1497;
    bool _1517 = !_759;
    int _1519 = _1517 ? 0 : 1;
    float _1521 = as_type<float>(_404) * _1503;
    int _1523 = abs(_479);
    float _1525 = trunc(_1475);
    float _1527 = precise::max(_1525, 0.0);
    uint _1529 = uint(_1527);
    float _1531 = fma(_1407, _1195, _1471);
    int _1533 = abs(_483);
    float _1535 = -_1483;
    float _1537 = fma(_1465, _1333, _1535);
    bool _1539 = !_763;
    int _1541 = _1539 ? 0 : 1;
    float _1543 = trunc(_1521);
    float _1545 = precise::max(_1543, 0.0);
    uint _1547 = uint(_1545);
    int _1549 = abs(_1519);
    int _1551 = _1285 * _1523;
    int _1553 = _1551 + _1507;
    int _1555 = abs(_1541);
    float _1557 = _1501 * 0.15915493667125701904296875;
    int _1559 = _1511 * int(_1529);
    int _1561 = _1559 + _1297;
    int _1563 = _1225 * _1533;
    int _1565 = _1563 + _1553;
    float _1567 = fma(_1005, _1035, _1177);
    int _1569 = _1297 * _1549;
    int _1571 = _1569 + _1515;
    float _1573 = float(uint(_1561));
    float _1575 = _1221 * (-2.0);
    float _1577 = float(uint(_1565));
    int _1579 = _1247 * _1555;
    int _1581 = _1579 + _1571;
    float _1583 = _240 + (-0.5);
    float _1585 = as_type<float>(_362) * _1573;
    float _1587 = fma(_1575, _1275, _1275);
    float _1589 = as_type<float>(_404) * _1577;
    float _1591 = float(uint(_1581));
    float _1593 = trunc(_1585);
    float _1595 = precise::max(_1593, 0.0);
    uint _1597 = uint(_1595);
    int _1599 = ~_250;
    int _1601 = _1599 + 1;
    float _1603 = fma(_931, _1575, _931);
    float _1605 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1587);
    float _1607 = as_type<float>(_362) * _1591;
    float _1609 = in.m_69.x;
    float _1611 = in.m_69.y;
    float _1613 = in.m_69.z;
    int _1615 = ~_266;
    int _1617 = _1615 + 1;
    float _1619 = fma(_1603, _1487, _1605);
    float _1621 = trunc(_1589);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = _1217 * (-2.0);
    float _1629 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1567);
    bool _1631 = _1181 != 0.0;
    bool _1633 = isnan(_1181);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan(0.0);
    bool _1639 = _1635 || _1637;
    float _1641 = fma(_1627, _1277, _1277);
    float _1643 = _226 + (-0.5);
    bool _1645 = _1179 == 0.0;
    bool _1647 = !_1639;
    bool _1649 = _1645 && _1647;
    float _1651 = trunc(_1607);
    float _1653 = precise::max(_1651, 0.0);
    uint _1655 = uint(_1653);
    float _1657 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1235);
    float _1659 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1243);
    float _1661 = fma(_923, _1627, _923);
    float _1663 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1641);
    bool _1665 = _1187 == 0.0;
    bool _1667 = _1665 && _1649;
    int _1669 = _1601 * int(_1625);
    int _1671 = _1669 + _1565;
    float _1673 = _1619 * 0.15915493667125701904296875;
    float _1675 = _1557 * 6.283185482025146484375;
    float _1677 = cos(_1675);
    int _1679 = int(_1437) + int(_1547);
    float _1681 = float(uint(_1671));
    float _1683 = _1629 * _1611;
    float _1685 = _1657 * _1609;
    int _1687 = _1617 * int(_1655);
    int _1689 = _1687 + _1581;
    float _1691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1181);
    float _1693 = as_type<float>(_404) * _1681;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1697 = _1673 * 6.283185482025146484375;
    float _1699 = sin(_1697);
    float _1701 = float(uint(_1689));
    float _1703 = _1659 * _1613;
    float _1705 = fma(_1661, _1487, _1663);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1179);
    if (!_1667)
    {
        float _1709 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _851);
        _1039 = _1709;
    }
    float _1711 = _1039;
    float _1713 = as_type<float>(_362) * _1701;
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1717 = trunc(_1693);
    float _1719 = precise::max(_1717, 0.0);
    uint _1721 = uint(_1719);
    float _1723 = _1705 * 0.15915493667125701904296875;
    float _1725 = _1707 * _1695;
    float _1727 = _1691 * _1715;
    int _1729 = ~_250;
    int _1731 = _1729 + 1;
    if (!_1667)
    {
        float _1733 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[17].y, _853);
        _1041 = _1733;
    }
    float _1735 = _1041;
    int _1737 = ~_266;
    int _1739 = _1737 + 1;
    if (!_1667)
    {
        float _1741 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[17].y, _855);
        _1043 = _1741;
    }
    float _1743 = _1043;
    float _1745 = trunc(_1713);
    float _1747 = precise::max(_1745, 0.0);
    uint _1749 = uint(_1747);
    float _1751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1187);
    int _1753 = int(_1529) + int(_1597);
    int _1755 = ~_250;
    int _1757 = _1755 + 1;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1761 = _1759 != 0;
    float _1763 = _1673 * 6.283185482025146484375;
    float _1765 = cos(_1763);
    int _1767 = int(_1625) + int(_1721);
    int _1769 = _1731 * _1767;
    int _1771 = _1769 + _1565;
    float _1773 = _1723 * 6.283185482025146484375;
    float _1775 = cos(_1773);
    int _1777 = int(_1655) + int(_1749);
    float _1779 = _1703 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1781 = uint(_1771) >= uint(_250);
    float _1783 = _1677 * _1699;
    int _1785 = _1739 * _1777;
    int _1787 = _1785 + _1581;
    float _1789 = _1751 * _1779;
    float _1791 = _1557 * 6.283185482025146484375;
    float _1793 = sin(_1791);
    bool _1795 = !_1781;
    int _1797 = _1795 ? 0 : (-1);
    float _1799 = _1677 * _1765;
    bool _1801 = uint(_1787) >= uint(_266);
    int _1803 = ~_1767;
    int _1805 = _1803 + _1797;
    int _1807 = _1805 + 1;
    float _1809 = _1723 * 6.283185482025146484375;
    float _1811 = sin(_1809);
    float _1813 = _1677 * _1775;
    float _1815 = _1699 * _1775;
    float _1817 = _1813 * _863;
    float _1819 = _1813 * _1727;
    float _1821 = _1813 * _945;
    float _1823 = _1793 * _1765;
    float _1825 = _1793 * _1699;
    float _1827 = _1765 * _1775;
    float _1829 = _1793 * _1775;
    bool _1831 = !_1801;
    int _1833 = _1831 ? 0 : (-1);
    float _1835 = _1829 * _863;
    float _1837 = -_1783;
    float _1839 = fma(_1811, _1823, _1837);
    float _1841 = -_1823;
    float _1843 = fma(_1811, _1783, _1841);
    int _1845 = ~_1777;
    int _1847 = _1845 + _1833;
    int _1849 = _1847 + 1;
    int _1851 = _250 * _1807;
    int _1853 = _1851 + _1565;
    float _1855 = -_1727;
    float _1857 = _1811 * _1855;
    float _1859 = fma(_1811, _1799, _1825);
    float _1861 = fma(_1811, _1825, _1799);
    float _1863 = -_1735;
    float _1865 = _1811 * _1863;
    float _1867 = -_863;
    float _1869 = _1811 * _1867;
    float _1871 = -_945;
    float _1873 = _1811 * _1871;
    float _1875 = fma(_1827, _1725, _1857);
    bool _1877 = !_1315;
    int _1879 = _1877 ? _1853 : (-1);
    float _1881 = fma(_1827, _1711, _1865);
    float _1883 = fma(_1827, _861, _1869);
    float _1885 = fma(_1827, _947, _1873);
    int _1887 = _266 * _1849;
    int _1889 = _1887 + _1581;
    int _1891 = _1879 & 3;
    bool _1893 = _1891 != 0;
    int _1895 = _1757 * _1679;
    int _1897 = _1895 + _1285;
    int _1899 = _1879 & 3;
    bool _1901 = _1899 != 0;
    float _1903 = _1813 * _1735;
    bool _1905 = !_1337;
    int _1907 = _1905 ? _1889 : (-1);
    float _1909 = _1829 * _1735;
    int _1911 = _1893 ? 0 : 1;
    float _1913 = _1829 * _1727;
    bool _1915 = uint(_1899) > 1u;
    float _1917 = fma(_1859, _1711, _1903);
    int _1919 = _1907 >> 31;
    float _1921 = fma(_1859, _861, _1817);
    int _1923 = _1879 >> 31;
    float _1925 = fma(_1839, _861, _1835);
    int _1927 = _1919 & 3;
    float _1929 = _1829 * _945;
    int _1931 = _1923 & 3;
    float _1933 = fma(_1839, _1725, _1913);
    int _1935 = _1907 + _1927;
    float _1937 = fma(_1839, _947, _1929);
    int _1939 = ~_1911;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1815, _1789, _1875);
    int _1947 = _1879 + _1931;
    float _1949 = fma(_1815, _1743, _1881);
    int _1951 = _1943;
    if (!_1915)
    {
        int _1953 = ~_1911;
        int _1955 = _1953 + 1;
        _1951 = _1955;
    }
    int _1957 = _1951;
    float _1959 = fma(_1843, _1743, _1917);
    bool _1961 = uint(_1897) >= uint(_250);
    float _1963 = fma(_1861, _949, _1937);
    int _1965 = _1935 >> 2;
    float _1967 = fma(_1839, _1711, _1909);
    int _1969 = _1947 >> 2;
    float _1971 = fma(_1859, _1725, _1819);
    int _1973 = ~_266;
    int _1975 = _1973 + 1;
    float _1977 = fma(_1859, _947, _1821);
    int _1979 = _1965 << 4;
    int _1981 = _1979 + 512;
    float _1983 = fma(_1815, _865, _1883);
    int _1985 = _1969 << 4;
    int _1987 = _1985 + 368;
    float _1989 = fma(_1843, _1789, _1971);
    uint _1991 = uint(int(uint(_1981) >> uint(2)));
    uint _1993 = uint(int(uint(int(_1991)) >> uint(2)));
    int _1995 = int(_1991) & 3;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[int(_1993)][_1995];
    int _1999 = int(_1991) + 1;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    int _2003 = _1999 & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    bool _2007 = !_1961;
    int _2009 = _2007 ? 0 : (-1);
    float _2011 = fma(_1861, _1789, _1933);
    int _2013 = _1907 & 3;
    bool _2015 = _2013 != 0;
    int _2017 = _1975 * _1753;
    int _2019 = _2017 + _1297;
    int _2021 = ~_1679;
    int _2023 = _2021 + _2009;
    int _2025 = _2023 + 1;
    float _2027 = fma(_1815, _949, _1885);
    int _2029 = _2015 ? 0 : 1;
    uint _2031 = uint(int(uint(_1987) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[int(_2041)][_2043];
    bool _2047 = uint(_2019) >= uint(_266);
    int _2049 = _250 * _2025;
    int _2051 = _2049 + _1285;
    bool _2053 = uint(_2013) > 1u;
    float _2055 = fma(_1843, _865, _1921);
    bool _2057 = !_1901;
    int _2059 = _2057 ? 0 : 1;
    float _2061 = fma(_1843, _949, _1977);
    bool _2063 = _1899 != 3;
    int _2065 = _1987 + 8;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
    int _2071 = int(_2067) & 3;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[int(_2069)][_2071];
    int _2075 = int(_2067) + 1;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    int _2079 = _2075 & 3;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[int(_2077)][_2079];
    bool _2083 = !_2047;
    int _2085 = _2083 ? 0 : (-1);
    float _2087 = fma(_1861, _865, _1925);
    int _2089 = ~_2029;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1861, _1743, _1967);
    bool _2097 = uint(_1899) >= 2u;
    float _2099 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2101 = ~_1753;
    int _2103 = _2101 + _2085;
    int _2105 = _2103 + 1;
    int _2107 = _1981 + 8;
    uint _2109 = uint(int(uint(_2107) >> uint(2)));
    uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
    int _2113 = int(_2109) & 3;
    float _2115 = (*spvDescriptorSet0.vp_c9)._m0[int(_2111)][_2113];
    int _2117 = int(_2109) + 1;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    int _2121 = _2117 & 3;
    float _2123 = (*spvDescriptorSet0.vp_c9)._m0[int(_2119)][_2121];
    int _2125 = _2093;
    float _2127 = _2027;
    float _2129 = _2061;
    if (!_2053)
    {
        int _2131 = ~_2029;
        int _2133 = _2131 + 1;
        _2125 = _2133;
    }
    int _2135 = _2125;
    float _2137 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2099);
    int _2139 = _2097 ? 0 : 1;
    int _2141 = _266 * _2105;
    int _2143 = _2141 + _1297;
    int _2145 = abs(_2135);
    float _2147 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _2149 = abs(_1957);
    int _2151 = abs(_2059);
    int _2153 = _1907 & 3;
    bool _2155 = _2153 != 0;
    int _2157 = ~_2139;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    int _2163 = ~_2145;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    int _2169 = ~_2149;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    int _2175 = _2161;
    if (_2063)
    {
        int _2177 = ~_2139;
        int _2179 = _2177 + 1;
        _2175 = _2179;
    }
    int _2181 = _2175;
    bool _2183 = uint(_2013) >= 2u;
    int _2185 = _2167 * as_type<int>(_2005);
    int _2187 = ~_2151;
    int _2189 = _2187 + 1;
    int _2191 = _2189 + 1;
    int _2193 = abs(_2181);
    bool _2195 = _1899 != 3;
    bool _2197 = !_1315;
    int _2199 = _2197 ? _2051 : (-1);
    int _2201 = _2173 * as_type<int>(_2045);
    bool _2203 = !_2155;
    int _2205 = _2203 ? 0 : 1;
    bool _2207 = _2013 != 3;
    int _2209 = _2191 * as_type<int>(_2037);
    int _2211 = _2209 + _2201;
    float _2213 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2215 = int(_2213);
    int _2217 = abs(_2205);
    int _2219 = _2183 ? 0 : 1;
    int _2221 = ~_2193;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    int _2227 = ~_2217;
    int _2229 = _2227 + 1;
    int _2231 = _2229 + 1;
    bool _2233 = !_2195;
    int _2235 = _2233 ? 0 : (-1);
    int _2237 = _2225 * as_type<int>(_2073);
    int _2239 = _2237 + _2211;
    int _2241 = ~_2219;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    int _2247 = _2231 * as_type<int>(_1997);
    int _2249 = _2247 + _2185;
    int _2251 = _2245;
    if (_2207)
    {
        int _2253 = ~_2219;
        int _2255 = _2253 + 1;
        _2251 = _2255;
    }
    int _2257 = _2251;
    float _2259 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2261 = int(_2259);
    bool _2263 = !_1761;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = abs(_2235);
    bool _2269 = _2013 != 3;
    int _2271 = abs(_2257);
    int _2273 = abs(_2265);
    int _2275 = ~_2267;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    bool _2281 = !_2269;
    int _2283 = _2281 ? 0 : (-1);
    int _2285 = _2279 * as_type<int>(_2081);
    int _2287 = _2285 + _2239;
    float _2289 = float(uint(_2215));
    int _2291 = abs(_2283);
    int _2293 = ~_2271;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    float _2299 = 1.0 / _2289;
    int _2301 = ~_2273;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = ~_2291;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    int _2313 = _2297 * as_type<int>(_2115);
    int _2315 = _2313 + _2249;
    float _2317 = float(uint(_2261));
    int _2319 = _2287 * _2305;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2323 = _2321 != 0;
    int _2325 = _2311 * as_type<int>(_2123);
    int _2327 = _2325 + _2315;
    int _2329 = abs(_2215);
    int _2331 = _2199 * _2273;
    int _2333 = _2331 + _2319;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    float _2339 = 1.0 / _2317;
    float _2341 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2343 = float(uint(_2329));
    float _2345 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _2347 = abs(_2337);
    float _2349 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2341);
    int _2351 = as_type<int>(_2299) + (-2);
    int _2353 = ~_2347;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    float _2359 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2147);
    int _2361 = abs(_2261);
    float _2363 = 1.0 / _2343;
    float _2365 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2349);
    float _2367 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2359);
    float _2369 = float(uint(_2333));
    int _2371 = _2357 * _2327;
    float _2373 = float(uint(_2361));
    float _2375 = _793 + _2367;
    int _2377 = as_type<int>(_2339) + (-2);
    float _2379 = _905 + _2365;
    float _2381 = as_type<float>(_2351) * _2369;
    bool _2383 = !_1337;
    int _2385 = _2383 ? _2143 : (-1);
    float _2387 = 1.0 / _2373;
    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2391 = _2379 + _2389;
    float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2395 = _2375 + _2393;
    int _2397 = _2385 * _2347;
    int _2399 = _2397 + _2371;
    int _2401 = abs(_2333);
    float _2403 = _2391 * _2391;
    int _2405 = ~_2215;
    int _2407 = _2405 + 1;
    float _2409 = trunc(_2381);
    float _2411 = precise::max(_2409, 0.0);
    uint _2413 = uint(_2411);
    float _2415 = float(uint(_2399));
    float _2417 = _2395 * _2395;
    int _2419 = as_type<int>(_2363) + (-2);
    float _2421 = float(uint(_2401));
    float _2423 = as_type<float>(_2377) * _2415;
    float _2425 = _2403 + _2417;
    int _2427 = abs(_2399);
    float _2429 = as_type<float>(_2419) * _2421;
    int _2431 = as_type<int>(_2387) + (-2);
    float _2433 = trunc(_2423);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = float(uint(_2427));
    float _2441 = fma(_1945, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2345);
    int _2443 = ~_2329;
    int _2445 = _2443 + 1;
    int _2447 = _2407 * int(_2413);
    int _2449 = _2447 + _2333;
    float _2451 = as_type<float>(_2431) * _2439;
    int _2453 = ~_2361;
    int _2455 = _2453 + 1;
    float _2457 = trunc(_2429);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    float _2463 = float(uint(_2449));
    float _2465 = fma(_2011, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2441);
    int _2467 = ~_2261;
    int _2469 = _2467 + 1;
    float _2471 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2473 = as_type<float>(_2351) * _2463;
    float _2475 = trunc(_2451);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2483 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2485 = _1335 + _2465;
    int _2487 = _2469 * int(_2437);
    int _2489 = _2487 + _2399;
    float _2491 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2481);
    float _2493 = fma(_1949, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2483);
    float _2495 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2497 = sqrt(_2425);
    float _2499 = float(uint(_2489));
    int _2501 = _2445 * int(_2461);
    int _2503 = _2501 + _2401;
    float _2505 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2471);
    float _2507 = as_type<float>(_2377) * _2499;
    float _2509 = float(uint(_2503));
    int _2511 = _2455 * int(_2479);
    int _2513 = _2511 + _2427;
    float _2515 = trunc(_2473);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    float _2521 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2523 = as_type<float>(_2419) * _2509;
    float _2525 = _2055 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2527 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2521);
    float _2529 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2531 = _2497 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2533 = trunc(_2507);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    float _2539 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2495);
    float _2541 = float(uint(_2513));
    float _2543 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2545 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2529);
    float _2547 = fma(_1983, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2525);
    float _2549 = as_type<float>(_2431) * _2541;
    float _2551 = trunc(_2523);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    float _2557 = fma(_2027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2543);
    float _2559 = _2403;
    float _2561 = _2417;
    float _2563 = _2375;
    float _2565 = _2527;
    if (!_2531)
    {
        _2127 = _2379;
    }
    float _2567 = _2127;
    float _2569 = _2567;
    if (!_2531)
    {
        _2129 = _2485;
    }
    float _2571 = _2129;
    float _2573 = trunc(_2549);
    float _2575 = precise::max(_2573, 0.0);
    uint _2577 = uint(_2575);
    bool _2579 = !_2531;
    float _2581 = _2571;
    if (!_2579)
    {
        float _2583 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2587 = _2497 + _2585;
        float _2589 = rsqrt(_2425);
        float _2591 = _2587 * _2583;
        float _2593 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2595 = _2591 * 0.15915493667125701904296875;
        float _2597 = _2595 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = _2595 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = fma(_2599, _2593, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2607 = _2589 * _2605;
        float _2609 = _2603 + (-1.0);
        float _2611 = fma(_2391, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2613 = fma(_2395, _2607, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2615 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2619 = _2611 + _2617;
        float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2623 = _2613 + _2621;
        float _2625 = fma(_2485, _2603, _2615);
        float _2627 = _2619 * _2619;
        float _2629 = _2623 * _2623;
        _2581 = _2625;
        _2559 = _2627;
        _2561 = _2629;
        _2569 = _2611;
        _2563 = _2613;
    }
    float _2631 = _2581;
    float _2633 = _2559;
    float _2635 = _2561;
    float _2637 = _2569;
    float _2639 = _2563;
    int _2641 = int(_2413) + int(_2519);
    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2645 = _2631 + _2643;
    int _2647 = ~_2215;
    int _2649 = _2647 + 1;
    float _2651 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2505);
    int _2653 = int(_2437) + int(_2537);
    float _2655 = fma(_2645, _2645, _2633);
    int _2657 = ~_2261;
    int _2659 = _2657 + 1;
    int _2661 = _2649 * _2641;
    int _2663 = _2661 + _2333;
    int _2665 = int(_2461) + int(_2555);
    float _2667 = _2655 + _2635;
    int _2669 = ~_2329;
    int _2671 = _2669 + 1;
    int _2673 = _2659 * _2653;
    int _2675 = _2673 + _2399;
    bool _2677 = uint(_2663) >= uint(_2215);
    int _2679 = int(_2479) + int(_2577);
    int _2681 = _2671 * _2665;
    int _2683 = _2681 + _2401;
    int _2685 = ~_2361;
    int _2687 = _2685 + 1;
    float _2689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2691 = !_2677;
    int _2693 = _2691 ? 0 : (-1);
    bool _2695 = uint(_2675) >= uint(_2261);
    int _2697 = _2687 * _2679;
    int _2699 = _2697 + _2427;
    int _2701 = ~_2641;
    int _2703 = _2701 + _2693;
    int _2705 = _2703 + 1;
    bool _2707 = !_2695;
    int _2709 = _2707 ? 0 : (-1);
    float _2711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2713 = uint(_2683) >= uint(_2329);
    bool _2715 = uint(_2699) >= uint(_2361);
    bool _2717 = _2215 == 0;
    bool _2719 = _2215 == 0;
    float _2721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2723 = _2333 ^ _2215;
    int _2725 = _2215 * _2705;
    int _2727 = _2725 + _2333;
    int _2729 = _2399 ^ _2261;
    float _2731 = _2689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2733 = !_2715;
    int _2735 = _2733 ? 0 : (-1);
    bool _2737 = !_2713;
    int _2739 = _2737 ? 0 : (-1);
    float _2741 = sqrt(_2667);
    uint _2743 = uint(int(uint(_2723) >> uint(31)));
    uint _2745 = uint(int(uint(_2729) >> uint(31)));
    int _2747 = ~_2653;
    int _2749 = _2747 + _2709;
    int _2751 = _2749 + 1;
    bool _2753 = !_2717;
    int _2755 = _2753 ? _2727 : (-1);
    float _2757 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2759 = ~_2735;
    int _2761 = _2679 + _2759;
    int _2763 = _2761 + 1;
    int _2765 = _2261 * _2751;
    int _2767 = _2765 + _2399;
    int _2769 = ~_2739;
    int _2771 = _2665 + _2769;
    int _2773 = _2771 + 1;
    float _2775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2777 = ~int(_2743);
    int _2779 = _2777 + 1;
    float _2781 = fma(_2731, _358, -0.5);
    int _2783 = ~int(_2745);
    int _2785 = _2783 + 1;
    float _2787 = float(_2755);
    bool _2789 = _2261 == 0;
    int _2791 = _2773 ^ _2779;
    float _2793 = fma(_2731, _2787, _773);
    int _2795 = _2763 ^ _2785;
    float _2797 = _2711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2799 = _2261 == 0;
    float _2801 = fma(_2757, _400, -0.5);
    bool _2803 = !_2789;
    int _2805 = _2803 ? _2767 : (-1);
    float _2807 = _2775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2809 = ~_2779;
    int _2811 = _2809 + _2791;
    int _2813 = _2811 + 1;
    float _2815 = fma(_1447, _2781, _2793);
    int _2817 = ~_2785;
    int _2819 = _2817 + _2795;
    int _2821 = _2819 + 1;
    float _2823 = fma(_721, _2807, -0.5);
    float _2825 = float(_2805);
    float _2827 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2527);
    bool _2829 = !_2719;
    int _2831 = _2829 ? _2813 : (-1);
    bool _2833 = !_2799;
    int _2835 = _2833 ? _2821 : (-1);
    float _2837 = fma(_2757, _2825, _1481);
    float _2839 = float(_2831);
    float _2841 = float(_2835);
    float _2843 = fma(_531, _2797, -0.5);
    float _2845 = fma(_1473, _2801, _2837);
    float _2847 = -_787;
    float _2849 = fma(_2797, _2839, _2847);
    float _2851 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2853 = -_1467;
    float _2855 = fma(_2807, _2841, _2853);
    float _2857 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2545);
    float _2859 = fma(_1443, _2843, _2849);
    float _2861 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2539);
    float _2863 = fma(_1477, _2823, _2855);
    float _2865 = fma(_2087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2547);
    float _2867 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2491);
    float _2869 = fma(_1963, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2557);
    float _2871 = _1531 + 0.5;
    float _2873 = _1537 + 0.5;
    float _2875 = _2815 + 0.5;
    float _2877 = _2845 + 0.5;
    float _2879 = _2859 + 0.5;
    float _2881 = _2863 + 0.5;
    float _2883 = fma(_2095, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2493);
    out.m_71.x = _2871;
    out.m_71.y = _2873;
    bool _2885 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2887 = isnan(_2741);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2893 = _2889 || _2891;
    out.m_73.x = _2861;
    out.m_73.y = _2827;
    out.m_73.z = _2865;
    out.m_75.x = _2857;
    out.m_75.y = _2651;
    out.m_75.z = _2869;
    out.m_77.x = _2875;
    out.m_77.y = _2879;
    out.m_77.z = _2877;
    out.m_77.w = _2881;
    float _2895 = _2815;
    float _2897 = _2865;
    float _2899 = _2827;
    if (!_2893)
    {
        _2895 = 1.0;
    }
    float _2901 = _2895;
    out.m_79.x = _2867;
    out.m_79.y = _2851;
    out.m_79.z = _2883;
    bool _2903 = !_2893;
    float _2905 = _2901;
    if (!_2903)
    {
        bool _2907 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2909 = isnan(_2741);
        bool _2911 = _2907 || _2909;
        bool _2913 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2915 = _2911 || _2913;
        if (!_2915)
        {
            float _2917 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2919 = _2741 + _2917;
            float _2921 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2923 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2921;
            float _2925 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2927 = _2925 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2929 = 1.0 / _2923;
            float _2931 = _2919 * _2929;
            float _2933 = fma(_2931, _2927, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2905 = _2933;
            _2897 = _2927;
            _2935 = true;
        }
        else
        {
            bool _2937 = _2741 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2939 = isnan(_2741);
            bool _2941 = _2937 || _2939;
            bool _2943 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2945 = _2941 || _2943;
            if (!_2945)
            {
                float _2947 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2949 = _2741 + _2947;
                float _2951 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2953 = _2951 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2955 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2957 = _2955 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2959 = 1.0 / _2953;
                float _2961 = _2949 * _2959;
                float _2963 = fma(_2961, _2957, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2905 = _2963;
                _2897 = _2957;
                _2935 = true;
            }
            else
            {
                _2905 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2935 = false;
    float _2965 = _2905;
    float _2967 = _2897;
    float _2969 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2971 = _2637 + _2969;
    float _2973 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2975 = _2631 + _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2979 = _2639 + _2977;
    bool _2981 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2983 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2985 = _2981 || _2983;
    bool _2987 = isnan(0.5);
    bool _2989 = _2985 || _2987;
    float _2991 = fma(_2971, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2993 = fma(_2975, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2995 = fma(_2979, _2965, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2997 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2999 = _2967;
    float _3001 = _2971;
    if (_2989)
    {
        _2997 = _2991;
    }
    float _3003 = _2997;
    float _3005 = _3003;
    if (_2989)
    {
        _2899 = _2993;
    }
    float _3007 = _2899;
    float _3009 = _3007;
    if (_2989)
    {
        _2999 = _2995;
    }
    float _3011 = _2999;
    float _3013 = _3011;
    if (!_2989)
    {
        float _3015 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3017 = _1335 + _3015;
        float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3021 = _905 + _3019;
        float _3023 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3025 = _3017 * _3017;
        float _3027 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3029 = _793 + _3027;
        float _3031 = fma(_3021, _3021, _3025);
        float _3033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3035 = fma(_3029, _3029, _3031);
        float _3037 = sqrt(_3035);
        float _3039 = _3023 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3041 = precise::min(_3037, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3043 = _3041 * _3033;
        float _3045 = -_905;
        float _3047 = _3045 + _2991;
        float _3049 = -_1335;
        float _3051 = _3049 + _2993;
        float _3053 = _3039 * _3043;
        float _3055 = -_793;
        float _3057 = _3055 + _2995;
        float _3059 = fma(_3047, _3053, _905);
        float _3061 = fma(_3051, _3053, _1335);
        float _3063 = fma(_3057, _3053, _793);
        _3009 = _3061;
        _3005 = _3059;
        _3013 = _3063;
    }
    float _3065 = _3009;
    float _3067 = _3005;
    float _3069 = _3013;
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3073 = _3065 + _3071;
    float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3077 = _3067 + _3075;
    float _3079 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3081 = _3069 + _3079;
    float _3083 = _3073 * _3073;
    float _3085 = fma(_3077, _3077, _3083);
    float _3087 = fma(_3081, _3081, _3085);
    float _3089 = rsqrt(_3087);
    float _3091 = _3089 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3093 = _3077 * _3091;
    float _3095 = _3081 * _3091;
    float _3097 = _3093 * _3093;
    float _3099 = _3095 * _3095;
    float _3101 = _3097 + _3099;
    float _3103 = sqrt(_3101);
    bool _3105 = _3103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3109 = _3103 + _3107;
    float _3111 = _3081;
    float _3113 = _3101;
    float _3115 = _3109;
    float _3117 = _3073;
    if (_3105)
    {
        float _3119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3111 = _3119;
    }
    float _3121 = _3111;
    if (_3105)
    {
        float _3123 = rsqrt(_3101);
        _3113 = _3123;
    }
    float _3125 = _3113;
    float _3127 = _3125;
    if (_3105)
    {
        float _3129 = _3109 * _3121;
        _3115 = _3129;
    }
    float _3131 = _3115;
    if (_3105)
    {
        float _3133 = _3131 * 0.15915493667125701904296875;
        _3001 = _3133;
    }
    float _3135 = _3001;
    float _3137 = _3089;
    if (_3105)
    {
        float _3139 = _3135 * 6.283185482025146484375;
        float _3141 = sin(_3139);
        _3137 = _3141;
    }
    float _3143 = _3137;
    float _3145 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3147 = precise::max(0.0, _3145);
    float _3149 = _3083;
    float _3151 = _3147;
    float _3153 = _3145;
    if (_3105)
    {
        float _3155 = _3135 * 6.283185482025146484375;
        float _3157 = cos(_3155);
        _3149 = _3157;
    }
    float _3159 = _3149;
    float _3161 = -_3091;
    float _3163 = -_3147;
    float _3165 = fma(_3073, _3161, _3163);
    if (!_3105)
    {
        _3117 = _3095;
    }
    float _3167 = _3117;
    float _3169 = _3167;
    if (_3105)
    {
        float _3171 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3151 = _3171;
    }
    float _3173 = _3151;
    float _3175 = _3173;
    float _3177 = _3143;
    if (_3105)
    {
        float _3179 = fma(_3143, _3173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3175 = _3179;
    }
    float _3181 = _3175;
    float _3183 = _3181;
    if (!_3105)
    {
        _3177 = _3093;
    }
    float _3185 = _3177;
    float _3187 = _3185;
    float _3189 = _3159;
    if (_3105)
    {
        float _3191 = _3159 + (-1.0);
        _3153 = _3191;
    }
    float _3193 = _3153;
    if (_3105)
    {
        float _3195 = _3125 * _3181;
        _2565 = _3195;
    }
    float _3197 = _2565;
    if (!_3105)
    {
        _3183 = _3165;
    }
    float _3199 = _3183;
    float _3201 = _3199;
    if (_3105)
    {
        float _3203 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _551 = _3203;
    }
    float _3205 = _551;
    if (_3105)
    {
        float _3207 = _3093 * _3197;
        _3187 = _3207;
    }
    float _3209 = _3187;
    if (!_3105)
    {
        _3127 = _3097;
    }
    float _3211 = _3127;
    float _3213 = sqrt(_3087);
    float _3215 = _3211;
    if (_3105)
    {
        float _3217 = fma(_3165, _3159, _3205);
        _3201 = _3217;
    }
    float _3219 = _3201;
    if (_3105)
    {
        float _3221 = _3095 * _3197;
        _3169 = _3221;
    }
    float _3223 = _3169;
    if (_3105)
    {
        float _3225 = _3209 * _3209;
        _3215 = _3225;
    }
    float _3227 = _3215;
    if (!_3105)
    {
        _3189 = _3099;
    }
    float _3229 = _3189;
    float _3231 = _3229;
    if (_3105)
    {
        float _3233 = _3223 * _3223;
        _3231 = _3233;
    }
    float _3235 = _3231;
    float _3237 = fma(_3219, _3219, _3227);
    float _3239 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3241 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3243 = _3237 + _3235;
    float _3245 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3239);
    float _3247 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3241);
    float _3249 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3251 = rsqrt(_3243);
    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3255 = fma(_3213, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3253);
    float _3257 = precise::clamp(_3255, 0.0, 1.0);
    float _3259 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3245);
    float _3261 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3263 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3247);
    float _3265 = -_3257;
    float _3267 = _3265 + 1.0;
    float _3269 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3271 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3261);
    float _3273 = _3263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3275 = abs(_3267);
    float _3277 = log2(_3275);
    float _3279 = fma(_3067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3249);
    float _3281 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3271);
    float _3283 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3285 = _3269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3287 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3279);
    float _3289 = _3281 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3291 = _3251 * _3209;
    float _3293 = _3251 * _3219;
    float _3295 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3297 = _3251 * _3223;
    float _3299 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3301 = -_3285;
    float _3303 = fma(_3301, _3283, 1.0);
    float _3305 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3295);
    float _3307 = _3287 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3309 = -_3299;
    float _3311 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3309);
    float _3313 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3315 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3305);
    float _3317 = log2(_3303);
    float _3319 = -_3297;
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3311);
    float _3323 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3325 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3315);
    float _3327 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3329 = fma(_3321, -0.5, 0.5);
    float _3331 = fma(_3321, 0.5, 0.5);
    float _3333 = exp2(_3313);
    float _3335 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3323);
    float _3337 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3327);
    float _3339 = fma(_3331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3341 = _3293 + 1.0;
    float _3343 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3335);
    float _3345 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3337);
    float _3347 = fma(_3331, _3339, -0.212114393711090087890625);
    float _3349 = 1.0 / _3325;
    float _3351 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3343);
    float _3353 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3345);
    float _3355 = fma(_3331, _3347, 1.570728778839111328125);
    float _3357 = sqrt(_3329);
    float _3359 = -_3293;
    float _3361 = fma(_3333, _3341, _3359);
    float _3363 = _3317 * 0.693147182464599609375;
    float _3365 = fma(_3361, 0.5, 0.5);
    float _3367 = _3363 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3369 = _3351 * _3349;
    float _3371 = _3353 * _3349;
    float _3373 = fma(_3369, 0.5, 0.5);
    float _3375 = fma(_3371, -0.5, 0.5);
    float _3377 = _3357 * 0.636619746685028076171875;
    float3 _8817 = float3(_3373, _3375, _3367);
    float _3379 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8817, float3(0.0), isnan(_8817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8817, float3(0.0), isnan(_8817)), level(0.0)).x;
    float3 _8828 = float3(_3373, _3375, _3367);
    float4 _3382 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8828, float3(0.0), isnan(_8828)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8828, float3(0.0), isnan(_8828)), level(0.0)).xyzw;
    float _3384 = _3382.x;
    float _3386 = _3382.y;
    float _3388 = _3382.z;
    float _3390 = _3382.w;
    float _3392 = -_3355;
    float _3394 = fma(_3377, _3392, 1.0);
    float2 _8850 = float2(_3394, _3365);
    float3 _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8850, float2(0.0), isnan(_8850)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8850, float2(0.0), isnan(_8850)), level(0.0)).xyz;
    float _3400 = _3398.x;
    float _3402 = _3398.y;
    float _3404 = _3398.z;
    float _3406 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3408 = _3273 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _3067;
    out.m_81.y = _3065;
    out.m_81.z = _3069;
    bool _3410 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3412 = isnan(_3213);
    bool _3414 = _3410 || _3412;
    bool _3416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3418 = _3414 || _3416;
    float _3420 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3408);
    float _3422 = exp2(_3406);
    float _3424 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3420);
    float _3426 = fma(_3307, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3424);
    float _3428 = _3351;
    float _3430 = _3426;
    float _3432 = _3351;
    float _3434 = _3325;
    if (!_3418)
    {
        _3428 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3436 = _3428;
    float _3438 = _3426 + _3325;
    out.gl_Position.x = _3351;
    out.gl_Position.y = _3353;
    out.gl_Position.z = _3426;
    out.gl_Position.w = _3325;
    float _3440 = _3438 * 0.5;
    float _3442 = -_3422;
    float _3444 = _3442 + 1.0;
    float _3446 = _3444 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.z = _3440;
    out.m_83.w = _3325;
    float _3448 = -_3446;
    float _3450 = _3448 + 1.0;
    float _3452 = _3440;
    float _3454 = _3446;
    float _3456 = _3436;
    float _3458 = _3436;
    if (!_3418)
    {
        _3430 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3460 = _3430;
    float _3462 = _3460;
    float _3464 = _3460;
    if (!_3418)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3466 = _3432;
    float _3468 = _3466;
    float _3470 = _3466;
    if (!_3418)
    {
        _3434 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3472 = _3434;
    float _3474 = _3472;
    float _3476 = _3472;
    if (!_3418)
    {
        _3452 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3478 = _3452;
    float _3480 = _3446 * _3379;
    float _3482 = _3390 * _3450;
    float _3484 = _3478;
    float _3486 = _3478;
    if (!_3418)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3488 = _3454;
    float _3490 = _3390 * _3480;
    float _3492 = _3404 * _3480;
    float _3494 = fma(_3400, _3490, _3384);
    float _3496 = fma(_3402, _3490, _3386);
    float _3498 = fma(_3390, _3492, _3388);
    out.m_85.x = _3494;
    out.m_85.y = _3496;
    out.m_85.z = _3498;
    out.m_85.w = _3482;
    bool _3500 = !_3418;
    float _3502 = _3488;
    float _3504 = _3488;
    if (!_3500)
    {
        bool _3506 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3508 = isnan(_3213);
        bool _3510 = _3506 || _3508;
        bool _3512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3514 = _3510 || _3512;
        if (!_3514)
        {
            float _3516 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3518 = _3213 + _3516;
            float _3520 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3522 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3520;
            float _3524 = 1.0 / _3522;
            float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3534 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3542 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3546 = _3518 * _3524;
            float _3548 = precise::clamp(_3546, 0.0, 1.0);
            float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3554 = fma(_3548, _3528, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3556 = fma(_3548, _3552, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3558 = fma(_3548, _3532, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3560 = fma(_3548, _3536, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3562 = fma(_3548, _3540, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3564 = fma(_3548, _3544, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3504 = _3556;
            _3486 = _3562;
            _3464 = _3554;
            _3476 = _3560;
            _3470 = _3558;
            _3458 = _3564;
            _3566 = true;
        }
        else
        {
            bool _3568 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3570 = isnan(_3213);
            bool _3572 = _3568 || _3570;
            bool _3574 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3576 = _3572 || _3574;
            if (!_3576)
            {
                _3462 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3578 = _3462;
            _3464 = _3578;
            if (!_3576)
            {
                _3502 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3580 = _3502;
            _3504 = _3580;
            if (!_3576)
            {
                _3468 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3582 = _3468;
            _3470 = _3582;
            if (!_3576)
            {
                _3474 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3584 = _3474;
            _3476 = _3584;
            if (!_3576)
            {
                _3484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3586 = _3484;
            _3486 = _3586;
            if (!_3576)
            {
                _3456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3588 = _3456;
            bool _3590 = !_3576;
            _3458 = _3588;
            if (!_3590)
            {
                bool _3592 = _3213 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3594 = isnan(_3213);
                bool _3596 = _3592 || _3594;
                bool _3598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3600 = _3596 || _3598;
                if (!_3600)
                {
                    float _3602 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3604 = _3213 + _3602;
                    float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3608 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3606;
                    float _3610 = 1.0 / _3608;
                    float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3614 = _3612 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3616 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3618 = _3616 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3620 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3622 = _3620 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3624 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3626 = _3624 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3630 = _3628 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3632 = _3604 * _3610;
                    float _3634 = precise::clamp(_3632, 0.0, 1.0);
                    float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3640 = fma(_3634, _3614, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3642 = fma(_3634, _3638, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3644 = fma(_3634, _3618, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3646 = fma(_3634, _3622, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3648 = fma(_3634, _3626, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3650 = fma(_3634, _3630, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3504 = _3642;
                    _3486 = _3648;
                    _3464 = _3640;
                    _3476 = _3646;
                    _3470 = _3644;
                    _3458 = _3650;
                    _3566 = true;
                }
                else
                {
                    _3504 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3464 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3476 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3470 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3566 = false;
    float _3652 = _3504;
    float _3654 = _3486;
    float _3656 = _3464;
    float _3658 = _3476;
    float _3660 = _3470;
    float _3662 = _3458;
    float _3664 = fma(_2851, -0.5, 0.5);
    float _3666 = precise::clamp(_3664, 0.0, 1.0);
    float _3668 = -_3652;
    float _3670 = _3668 + _3654;
    float _3672 = -_3656;
    float _3674 = _3672 + _3658;
    float _3676 = -_3660;
    float _3678 = _3676 + _3662;
    bool _3680 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3682 = fma(_3666, _3670, _3652);
    float _3684 = fma(_3666, _3674, _3656);
    float _3686 = fma(_3666, _3678, _3660);
    float _3688 = _3682 * 0.586610972881317138671875;
    out.m_87.x = 0.0;
    float _3690 = fma(_3684, 0.298911988735198974609375, _3688);
    float _3692 = fma(_3686, 0.114477999508380889892578125, _3690);
    float _3694 = -_3692;
    float _3696 = _3684 + _3694;
    float _3698 = -_3692;
    float _3700 = _3682 + _3698;
    float _3702 = -_3692;
    float _3704 = _3686 + _3702;
    float _3706 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3708 = fma(_3696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    float _3710 = fma(_3700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    float _3712 = fma(_3704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3692);
    out.m_49.x = _3706;
    out.m_89.x = _3708;
    out.m_89.y = _3710;
    out.m_89.z = _3712;
    if (!_3680)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3714 = -_3065;
    float _3716 = _3714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3718 = -_3067;
    float _3720 = _3718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3722 = -_3069;
    float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3726 = _3716 * _3716;
    float _3728 = fma(_3720, _3720, _3726);
    float _3730 = fma(_3724, _3724, _3728);
    float _3732 = sqrt(_3730);
    float _3734 = rsqrt(_3730);
    float _3736 = -_3732;
    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3740 = _3738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3742 = precise::clamp(_3740, 0.0, 1.0);
    float _3744 = _3720 * _3734;
    float _3746 = _3716 * _3734;
    float _3748 = abs(_3742);
    float _3750 = log2(_3748);
    float _3752 = _3724 * _3734;
    float _3754 = _3744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3756 = _2851 * _3746;
    float _3758 = -_3746;
    float _3760 = -_3754;
    float _3762 = fma(_3758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3760);
    float _3764 = fma(_2867, _3744, _3756);
    float _3766 = -_3752;
    float _3768 = fma(_3766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3762);
    float _3770 = fma(_2883, _3752, _3764);
    float _3772 = precise::clamp(_3770, 0.0, 1.0);
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3776 = _3768 + _3774;
    float _3778 = _3750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3780 = _3776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3782 = precise::clamp(_3780, 0.0, 1.0);
    float _3784 = exp2(_3778);
    float _3786 = _3784 * _3782;
    float _3788 = _3772 * _3786;
    float _3790 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3792 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3794 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _3790;
    out.m_87.y = _3792;
    out.m_87.z = _3794;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

