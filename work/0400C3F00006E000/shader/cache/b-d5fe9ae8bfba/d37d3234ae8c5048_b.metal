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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad5 [[user(locn5)]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _721 = false;
    bool _504 = false;
    bool _380 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_108);
        out.gl_Position.z = _2251;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2320 = as_type<float>(_146);
        out.gl_Position.z = _2320;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _152 * _150;
    float _168 = 0.0;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _178 = _174;
    if (!_164)
    {
        float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = floor(_176);
    float _194 = _190 * 0.15915493667125701904296875;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _194 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = 1.4012984643248170709237295832899e-45;
    float _206 = _182;
    if (!_164)
    {
        _204 = _154;
    }
    float _208 = _204;
    float _210 = -_192;
    float _212 = _176 + _210;
    bool _214 = !_164;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _154 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _154);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _246;
    }
    float _248 = _206;
    bool _250 = !_164;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _154 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _216 = _270;
    }
    float _272 = _216;
    float _274 = in.m_51.w;
    float _276 = in.m_42.x;
    float _278 = in.m_42.y;
    float _280 = in.m_42.z;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _288 = _286 != 0;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    float _298 = fma(_202, 0.5, 0.5);
    bool _300 = !_198;
    int _302 = _300 ? 0 : 1;
    float _304 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _306 = !_284;
    int _308 = _306 ? 0 : 1;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = -_298;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _318 = abs(_302);
    int _320 = abs(_308);
    float _322 = fma(_272, _184, _304);
    bool _324 = !_288;
    int _326 = _324 ? 0 : 1;
    float _328 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _332 = fma(_272, _186, _328);
    int _334 = abs(_326);
    float _336 = float(_320);
    float _338 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = float(_318);
    float _342 = fma(_322, _274, _276);
    float _344 = abs(_292);
    float _346 = _336 * _344;
    float _348 = fma(_272, _188, _338);
    float _350 = fma(_332, _274, _278);
    float _352 = float(_334);
    float _354 = fma(_340, _316, _346);
    float _356 = fma(_348, _274, _280);
    float _358 = abs(_312);
    float _360 = fma(_352, _358, _354);
    bool _362 = !_330;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_92);
        float _384 = 1.0 / _382;
        float _386 = _126 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _388 + _390;
    bool _394 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_388);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -_404;
    float _412 = _410 + 1.0;
    bool _414 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_388);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _408;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _434 = _424 * _412;
    float _436 = -_424;
    float _438 = _436 + 1.0;
    float _440 = _392 * _426;
    float _442 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = fma(_430, _440, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = _442 * _148;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = fma(_446, _440, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _458 = _448 * _434;
    float _460 = fma(_454, _440, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _462 = trunc(_450);
    int _464 = int(_462);
    float _466 = _456 * _434;
    float _468 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _470 = _460 * _434;
    float _472 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _474 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].x, _468);
    float _476 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _478 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].y, _472);
    float _480 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].z, _476);
    int _482 = _464 << 4;
    int _484 = _482 + 1712;
    bool _486 = !_432;
    float _502;
    if (!_486)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _490 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_92);
        float _508 = 1.0 / _506;
        float _510 = _126 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    uint _515 = uint(int(uint(_484) >> uint(2)));
    uint _517 = uint(int(uint(int(_515)) >> uint(2)));
    int _519 = int(_515) & 3;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[int(_517)][_519];
    int _523 = int(_515) + 1;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    int _527 = _523 & 3;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[int(_525)][_527];
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_512);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    int _551 = _484 + 8;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[int(_555)][_557];
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _565 = 1.0 / _533;
    bool _567 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_512);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _579;
    float _583 = -_549;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _591 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_512);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _537;
    float _605 = _577 * _585;
    float _607 = -_577;
    float _609 = _607 + 1.0;
    bool _611 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = isnan(_512);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _625 = _601 * _609;
    float _627 = -_601;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _563;
    float _633 = _581 * _565;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _512 + _635;
    float _639 = fma(_633, _637, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _512 + _641;
    float _645 = _589 * _603;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _647;
    float _651 = fma(_645, _643, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _653 = _649 * _631;
    float _655 = _639 * _625;
    float _657 = -_621;
    float _659 = _657 + 1.0;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _512 + _661;
    float _665 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _655);
    float _667 = _549 * _659;
    float _669 = fma(_653, _663, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _671 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _673 = fma(_651, _605, _665);
    float _675 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = fma(_669, _667, _673);
    float _681 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = in.m_51.x;
    float _687 = in.m_51.y;
    float _689 = in.m_51.z;
    float _691 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[118].x, _679);
    float _693 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _677;
    out.m_53.y = _683;
    out.m_53.z = _693;
    out.m_53.w = _695;
    float _697 = _480 * _689;
    float _699 = _478 * _687;
    float _701 = _474 * _685;
    bool _703 = !_623;
    float _719;
    if (!_703)
    {
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _707 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _711 = _709 * _705;
        float _713 = floor(_711);
        float _715 = -_713;
        float _717 = _711 + _715;
        _719 = _717;
        _721 = true;
    }
    else
    {
        float _723 = float(_92);
        float _725 = 1.0 / _723;
        float _727 = _126 * _725;
        _719 = _727;
    }
    _721 = false;
    float _729 = _719;
    float _731 = in.m_49.z;
    float _733 = _148 * 2.0;
    float _735 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _737 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _739 = in.m_49.y;
    float _741 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _743 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _735);
    float _745 = floor(_733);
    float _747 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _737);
    float _749 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _741);
    float _751 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _743);
    float _753 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _747);
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _769 = _767 != 0;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _775 = _773 != 0;
    float _777 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _781 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _749);
    float _783 = -_771;
    float _785 = fma(_777, 2.0, _783);
    float _787 = _731 * 2.0;
    bool _789 = _745 > 0.0;
    float _791 = _753 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _793 = _745 >= 0.0;
    bool _795 = isnan(_745);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = _739 * 2.0;
    float _805 = _739 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _807 = floor(_787);
    float _809 = _148 + _739;
    float _811 = _739 + _731;
    float _813 = fma(_805, -2.0, _779);
    float _815 = _148 + _731;
    float _817 = _809 + (-1.0);
    float _819 = floor(_803);
    float _821 = _815 + (-1.0);
    float _823 = _811 + (-1.0);
    int _825 = _801 ? 0 : 1;
    float _827 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = _821;
    float _833 = _817;
    float _835 = _823;
    if (!_775)
    {
        _831 = _739;
    }
    float _837 = _831;
    float _839 = _757 * _126;
    float _841 = _837;
    if (!_775)
    {
        _833 = _731;
    }
    float _843 = _833;
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _847 = ~_825;
    int _849 = _847 + 1;
    int _851 = _849 + 1;
    float _853 = _751 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _855 = _851;
    float _857 = _843;
    if (!_775)
    {
        _835 = _731;
    }
    float _859 = _835;
    float _861 = _781 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = _859;
    if (!_789)
    {
        int _865 = ~_825;
        int _867 = _865 + 1;
        _855 = _867;
    }
    int _869 = _855;
    float _871 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _813);
    if (_775)
    {
        _841 = _148;
    }
    float _873 = _841;
    float _875 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_775)
    {
        _863 = _739;
    }
    float _877 = _863;
    float _879 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_775)
    {
        _857 = _739;
    }
    float _881 = _857;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _885 = _807 > 0.0;
    float _887 = _877 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _889 = _807 >= 0.0;
    bool _891 = isnan(_807);
    bool _893 = _889 || _891;
    bool _895 = isnan(0.0);
    bool _897 = _893 || _895;
    float _899 = _697 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _901 = _819 > 0.0;
    bool _903 = _819 >= 0.0;
    bool _905 = isnan(_819);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _915 = !_765;
    int _917 = _915 ? 0 : 1;
    float _919 = -_913;
    float _921 = fma(_883, 2.0, _919);
    int _923 = abs(_917);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _929 = fma(_887, -2.0, _925);
    float _931 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[83].z, _927);
    float _933 = float(_923);
    float _935 = exp2(_839);
    float _937 = float(_869);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _943 = _911 ? 0 : 1;
    float _945 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[83].w, _939);
    float _947 = _933 * _937;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _951 = 1.0 + _949;
    float _953 = in.m_55.x;
    float _955 = in.m_55.y;
    float _957 = in.m_55.z;
    float _959 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[78].w, _941);
    float _961 = 1.0 / _951;
    int _963 = ~_943;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _959);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _791 + _971;
    bool _975 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _977 = isnan(1.0);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _983 = _979 || _981;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _987 = _967;
    if (!_901)
    {
        int _989 = ~_943;
        int _991 = _989 + 1;
        _987 = _991;
    }
    int _993 = _987;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _997 = _853 + _995;
    float _999 = _973 * _973;
    float _1001 = -_935;
    float _1003 = _1001 + 1.0;
    bool _1005 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(0.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _861 + _1017;
    float _1021 = fma(_997, _997, _999);
    float _1023 = -_126;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[76].x, _785);
    float _1027 = _1013 ? _1003 : 0.0;
    float _1029 = _947 * (-2.0);
    float _1031 = fma(_1019, _1019, _1021);
    float _1033 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1015);
    float _1035 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _931);
    float _1037 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _945);
    float _1039 = -_126;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[81].x, _921);
    float _1043 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _929);
    float _1045 = _1033;
    if (_983)
    {
        float _1047 = _1027 * _961;
        _130 = _1047;
    }
    float _1049 = _130;
    float _1051 = fma(_845, _1029, _845);
    float _1053 = rsqrt(_1031);
    bool _1055 = !_761;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = fma(_1029, _955, _955);
    bool _1061 = !_769;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _739 + (-0.5);
    int _1067 = _897 ? 0 : 1;
    int _1069 = abs(_1057);
    float _1071 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1059);
    int _1073 = abs(_1063);
    int _1075 = ~_1067;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1079;
    if (!_885)
    {
        int _1083 = ~_1067;
        int _1085 = _1083 + 1;
        _1081 = _1085;
    }
    int _1087 = _1081;
    float _1089 = fma(_1051, _1049, _1071);
    float _1091 = _973 * _1053;
    float _1093 = _997 * _1053;
    float _1095 = float(_1069);
    float _1097 = -_1091;
    float _1099 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1101 = float(_1087);
    float _1103 = -_1093;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1107 = float(_1073);
    float _1109 = _1099 * _1099;
    float _1111 = float(_993);
    float _1113 = _1095 * _1101;
    float _1115 = _1019 * _1053;
    float _1117 = fma(_1105, _1105, _1109);
    float _1119 = _1089 * 0.15915493667125701904296875;
    float _1121 = _1107 * _1111;
    float _1123 = _1113 * (-2.0);
    float _1125 = _148 + (-0.5);
    float _1127 = -_1115;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1131 = _1121 * (-2.0);
    float _1133 = fma(_1123, _953, _953);
    float _1135 = fma(_827, _1123, _827);
    float _1137 = fma(_1129, _1129, _1117);
    float _1139 = fma(_1131, _957, _957);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1133);
    float _1143 = _731 + (-0.5);
    float _1145 = fma(_829, _1131, _829);
    float _1147 = sqrt(_1137);
    float _1149 = fma(_1135, _1049, _1141);
    float _1151 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1139);
    float _1153 = _1149 * 0.15915493667125701904296875;
    float _1155 = fma(_1145, _1049, _1151);
    float _1157 = _1119 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = _1155 * 0.15915493667125701904296875;
    float _1163 = in.m_57.x;
    float _1165 = in.m_57.y;
    float _1167 = in.m_57.z;
    float _1169 = _1119 * 6.283185482025146484375;
    float _1171 = cos(_1169);
    float _1173 = _1053 * _1147;
    float _1175 = _875 * _1173;
    float _1177 = _879 * _1173;
    float _1179 = _899 * _1173;
    float _1181 = _1161 * 6.283185482025146484375;
    float _1183 = cos(_1181);
    float _1185 = _1153 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = _1153 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = _1171 * _1183;
    float _1195 = _1161 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1187 * _1171;
    float _1201 = _1187 * _1159;
    float _1203 = _1187 * _1183;
    float _1205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1163);
    float _1207 = _1191 * _1159;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1165);
    float _1211 = _1191 * _1171;
    float _1213 = _1191 * _1183;
    float _1215 = _1159 * _1183;
    float _1217 = _1175 * _1209;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1167);
    float _1221 = _1177 * _1205;
    float _1223 = fma(_1197, _1199, _1207);
    float _1225 = _1203 * _1217;
    float _1227 = _1179 * _1219;
    float _1229 = -_1211;
    float _1231 = fma(_1197, _1201, _1229);
    float _1233 = -_1217;
    float _1235 = _1197 * _1233;
    float _1237 = fma(_1223, _1221, _1225);
    float _1239 = -_1201;
    float _1241 = fma(_1197, _1211, _1239);
    float _1243 = _1213 * _1217;
    float _1245 = fma(_1193, _1221, _1235);
    float _1247 = fma(_1231, _1227, _1237);
    float _1249 = fma(_1197, _1207, _1199);
    float _1251 = fma(_1241, _1221, _1243);
    float _1253 = fma(_1215, _1227, _1245);
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1257 = fma(_1249, _1227, _1251);
    float _1259 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1261 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1255);
    float _1263 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1259);
    float _1267 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1263);
    float _1271 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1265);
    float _1273 = _861 + _1267;
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1269);
    float _1277 = _853 + _1271;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1273 + _1279;
    float _1283 = _791 + _1275;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1287 = _1277 + _1285;
    float _1289 = _1281 * _1281;
    float _1291 = fma(_1287, _1287, _1289);
    float _1293 = sqrt(_1291);
    bool _1295 = _1293 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1275;
    float _1299 = _1289;
    float _1301 = _1277;
    float _1303 = _1137;
    float _1305 = _1101;
    if (!_1295)
    {
        _1297 = _1277;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (!_1295)
    {
        _1299 = _1273;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (!_1295)
    {
        _1301 = _1283;
    }
    float _1315 = _1301;
    bool _1317 = !_1295;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1293 + _1323;
        float _1327 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1291);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337 + (-1.0);
        float _1345 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = fma(_1341, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1349 = fma(_1283, _1337, _1345);
        float _1351 = _1329 * _1347;
        float _1353 = fma(_1287, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1355 = fma(_1281, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1319 = _1349;
        _1309 = _1353;
        _1313 = _1355;
    }
    float _1357 = _1319;
    float _1359 = _1309;
    float _1361 = _1313;
    float _1363 = -_1091;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1367 = -_1093;
    float _1369 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1359);
    float _1371 = -_1115;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1361);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1377 = _1365 + _1375;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1381 = _1369 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1385 = _1373 + _1383;
    float _1387 = _1377 * _1377;
    float _1389 = fma(_1381, _1381, _1387);
    float _1391 = fma(_1385, _1385, _1389);
    float _1393 = rsqrt(_1391);
    float _1395 = sqrt(_1391);
    float _1397 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1399 = _1381 * _1397;
    float _1401 = _1385 * _1397;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 * _1401;
    float _1407 = _1403 + _1405;
    float _1409 = sqrt(_1407);
    bool _1411 = _1409 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1415 = _1409 + _1413;
    float _1417 = _1281;
    float _1419 = _1415;
    float _1421 = _1399;
    float _1423 = _1401;
    float _1425 = _1403;
    float _1427 = _1405;
    if (_1411)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1417 = _1429;
    }
    float _1431 = _1417;
    if (_1411)
    {
        float _1433 = _1415 * _1431;
        _1419 = _1433;
    }
    float _1435 = _1419;
    if (_1411)
    {
        float _1437 = _1435 * 0.15915493667125701904296875;
        _1303 = _1437;
    }
    float _1439 = _1303;
    float _1441 = _1139;
    if (_1411)
    {
        float _1443 = _1439 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1451 = precise::max(0.0, _1449);
    float _1453 = _1431;
    float _1455 = _1451;
    if (_1411)
    {
        float _1457 = _1439 * 6.283185482025146484375;
        float _1459 = cos(_1457);
        _1453 = _1459;
    }
    float _1461 = _1453;
    float _1463 = -_1397;
    float _1465 = -_1451;
    float _1467 = fma(_1377, _1463, _1465);
    float _1469 = _1449;
    if (_1411)
    {
        float _1471 = rsqrt(_1407);
        _1469 = _1471;
    }
    float _1473 = _1469;
    if (_1411)
    {
        float _1475 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1475;
    }
    float _1477 = _1455;
    float _1479 = _1477;
    float _1481 = _1447;
    if (_1411)
    {
        float _1483 = fma(_1447, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1305 = _1483;
    }
    float _1485 = _1305;
    float _1487 = _1485;
    if (_1411)
    {
        float _1489 = _1461 + (-1.0);
        _1479 = _1489;
    }
    float _1491 = _1479;
    if (_1411)
    {
        float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1493;
    }
    float _1495 = _1481;
    float _1497 = _1473;
    if (_1411)
    {
        float _1499 = _1473 * _1485;
        _1487 = _1499;
    }
    float _1501 = _1487;
    if (!_1411)
    {
        _1497 = _1467;
    }
    float _1503 = _1497;
    float _1505 = _1503;
    if (_1411)
    {
        float _1507 = fma(_1467, _1461, _1495);
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1411)
    {
        float _1513 = _1399 * _1501;
        _1421 = _1513;
    }
    float _1515 = _1421;
    if (_1411)
    {
        float _1517 = _1401 * _1501;
        _1423 = _1517;
    }
    float _1519 = _1423;
    float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1523 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1521);
    float _1525 = precise::clamp(_1523, 0.0, 1.0);
    float _1527 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1511);
    if (_1411)
    {
        float _1529 = _1515 * _1515;
        _1425 = _1529;
    }
    float _1531 = _1425;
    if (_1411)
    {
        float _1533 = _1519 * _1519;
        _1427 = _1533;
    }
    float _1535 = _1427;
    float _1537 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1539 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1527);
    float _1541 = fma(_1509, _1509, _1531);
    float _1543 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1545 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1537);
    float _1547 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1549 = _1541 + _1535;
    float _1551 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1543);
    float _1553 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1545);
    float _1555 = -_1525;
    float _1557 = _1555 + 1.0;
    float _1559 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1547);
    float _1561 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1551);
    float _1563 = rsqrt(_1549);
    float _1565 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1567 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1569 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1571 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1559);
    float _1573 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = abs(_1557);
    float _1581 = log2(_1579);
    float _1583 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1573);
    float _1585 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1587 = -_1577;
    float _1589 = fma(_1587, _1575, 1.0);
    float _1591 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1593 = _1563 * _1515;
    float _1595 = _1563 * _1509;
    float _1597 = _1563 * _1519;
    float _1599 = log2(_1589);
    float _1601 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1603 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1583);
    float _1605 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1591);
    float _1607 = _1595 + 1.0;
    float _1609 = -_1601;
    float _1611 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1609);
    float _1613 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1603);
    float _1615 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1617 = -_1597;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1611);
    float _1621 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1623 = 1.0 / _1613;
    float _1625 = fma(_1619, -0.5, 0.5);
    float _1627 = fma(_1619, 0.5, 0.5);
    float _1629 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1621);
    float _1631 = _1599 * 0.693147182464599609375;
    float _1633 = fma(_1627, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1635 = sqrt(_1625);
    float _1637 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1629);
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1641 = fma(_1627, _1633, -0.212114393711090087890625);
    float _1643 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1637);
    float _1645 = fma(_1627, _1641, 1.570728778839111328125);
    float _1647 = exp2(_1615);
    float _1649 = _1635 * 0.636619746685028076171875;
    float _1651 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1605);
    float _1653 = -_1645;
    float _1655 = fma(_1649, _1653, 1.0);
    float _1657 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1651);
    float _1659 = _1643 * _1623;
    float _1661 = -_1595;
    float _1663 = fma(_1647, _1607, _1661);
    float _1665 = _1657 * _1623;
    float _1667 = fma(_1659, 0.5, 0.5);
    float _1669 = fma(_1663, 0.5, 0.5);
    float _1671 = fma(_1665, -0.5, 0.5);
    float3 _4724 = float3(_1667, _1671, _1639);
    float _1673 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4724, float3(0.0), isnan(_4724)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4724, float3(0.0), isnan(_4724)), level(0.0)).x;
    float3 _4735 = float3(_1667, _1671, _1639);
    float4 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4735, float3(0.0), isnan(_4735)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4735, float3(0.0), isnan(_4735)), level(0.0)).xyzw;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = _1676.w;
    float2 _4752 = float2(_1655, _1669);
    float3 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4752, float2(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4752, float2(0.0), isnan(_4752)), level(0.0)).xyz;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = in.m_59.y;
    float _1698 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _1700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1702 = isnan(0.5);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1708 = _1704 || _1706;
    float _1710 = in.m_49.w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1716 = in.m_59.x;
    bool _1718 = _739 > 0.5;
    float _1720 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1722 = 1.0 / _1714;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1734 = _1732 != 0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1738 = _729 + _1736;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1742 = _1740 != 0;
    float _1744 = -_1091;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1750 = _1748 != 0;
    float _1752 = 1.0 / _1726;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1756 = _1754 != 0;
    float _1758 = -_1093;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1762 = -_1696;
    float _1764 = _1762 + 1.0;
    float _1766 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1768 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1770 = isnan(_729);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1782 = _1710 > 0.5;
    float _1784 = 1.0 / _1730;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1786;
    int _1790 = _1718 ? as_type<int>(_1764) : as_type<int>(_1696);
    float _1792 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1794 = _1718;
    bool _1796 = _1750;
    float _1798 = _1696;
    if (_1734)
    {
        bool _1800 = _148 > 0.5;
        _1794 = _1800;
    }
    bool _1802 = _1794;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1808 = _1750 ? as_type<float>(_1790) : _1696;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1810;
    float _1814 = _1812;
    if (_1742)
    {
        bool _1816 = _731 > 0.5;
        _1796 = _1816;
    }
    bool _1818 = _1796;
    float _1820 = _1806 * _1722;
    float _1822 = _1788 * _1752;
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1828 = _729 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1832 = _729 + _1830;
    float _1834 = _1822;
    if (_1756)
    {
        float _1836 = _1782 ? _1764 : _1696;
        _1798 = _1836;
    }
    float _1838 = _1798;
    float _1840 = _1812 * _1784;
    if (!_1734)
    {
        _1814 = _1716;
    }
    float _1842 = _1814;
    float _1844 = -_1720;
    float _1846 = _1197 * _1844;
    float _1848 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1850 = fma(_1840, _1828, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1852 = fma(_1820, _1738, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1854 = fma(_1822, _1832, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1856 = _1842;
    if (!_1734)
    {
        _1834 = _1842;
    }
    float _1858 = _1834;
    float _1860 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1766);
    float _1862 = _1858;
    if (_1734)
    {
        _1856 = _1716;
    }
    float _1864 = _1856;
    float _1866 = -_1115;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    bool _1870 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1872 = isnan(_729);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1886 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1888 = isnan(_729);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_1778;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1882, _1808, -0.5);
    bool _1904 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1906 = isnan(_729);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1912 = _1908 || _1910;
    int _1914 = _1912 ? 1065353216 : 0;
    float _1916 = -_1880;
    float _1918 = _1916 + 1.0;
    float _1920 = _1896 * _1900;
    float _1922 = -_1896;
    float _1924 = _1922 + 1.0;
    float _1926 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1860);
    float _1928 = as_type<float>(_1914) * _1918;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = _1880 * _1924;
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1936 = _1850 * _1928;
    float _1938 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1940 = -_871;
    float _1942 = fma(_969, _1902, _1940);
    float _1944 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1946 = as_type<int>(_1884);
    int _1948 = _1914;
    float _1950 = _1864;
    if (_1734)
    {
        float _1952 = -_1864;
        float _1954 = _1952 + 1.0;
        _1946 = as_type<int>(_1954);
    }
    int _1956 = _1946;
    float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1960 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1938);
    float _1962 = fma(_1944, _1838, -0.5);
    float _1964 = -as_type<float>(_1914);
    float _1966 = _1964 + 1.0;
    float _1968 = as_type<float>(_1956);
    if (_1742)
    {
        float _1970 = -_1864;
        float _1972 = _1970 + 1.0;
        _1948 = as_type<int>(_1972);
    }
    int _1974 = _1948;
    float _1976 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1960);
    float _1978 = as_type<float>(_1974);
    if (_1734)
    {
        float _1980 = _1802 ? as_type<float>(_1956) : _1864;
        _1862 = _1980;
    }
    float _1982 = _1862;
    float _1984 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1936);
    float _1986 = 1.0 / _1934;
    float _1988 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1742)
    {
        float _1990 = _1818 ? as_type<float>(_1974) : _1864;
        _1950 = _1990;
    }
    float _1992 = _1950;
    float _1994 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1996 = _1992;
    if (!_1708)
    {
        _1968 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1998 = _1968;
    float _2000 = _1988 + _1934;
    float _2002 = fma(_1852, _1932, _1984);
    float _2004 = fma(_1994, _1982, -0.5);
    float _2006 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2008 = exp2(_1780);
    float _2010 = fma(_1854, _1920, _2002);
    float _2012 = fma(_1033, _2004, _1025);
    float _2014 = fma(_2006, _1992, -0.5);
    float _2016 = _1958;
    if (!_1708)
    {
        _1996 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2018 = _1996;
    float _2020 = fma(_1193, _1792, _1846);
    float _2022 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2010);
    float _2024 = _2000 * _1986;
    float _2026 = _2024 * 0.5;
    float _2028 = fma(_1035, _2014, _1041);
    if (!_1708)
    {
        float _2030 = -_2018;
        float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1045 = _2032;
    }
    float _2034 = _1045;
    if (!_1708)
    {
        float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2038 = fma(_2026, _1998, _2036);
        _2016 = _2038;
    }
    float _2040 = _2016;
    float _2042 = _1203 * _1720;
    float _2044 = _1213 * _1720;
    float _2046 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1848);
    float _2048 = _1982;
    if (!_1708)
    {
        float _2050 = 1.0 / _2040;
        _2048 = _2050;
    }
    float _2052 = _2048;
    float _2054 = fma(_1223, _1792, _2042);
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2058 = fma(_1241, _1792, _2044);
    float _2060 = fma(_1231, _1698, _2054);
    float _2062 = fma(_1215, _1698, _2020);
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2066 = _2034;
    if (!_1708)
    {
        float _2068 = 1.0 / _2034;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2074 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2080 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2082 = -_2008;
    float _2084 = _2082 + 1.0;
    float _2086 = -_1043;
    float _2088 = fma(_1037, _1962, _2086);
    float _2090 = _2052;
    if (!_1708)
    {
        float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2094 = -_2018;
        float _2096 = fma(_2052, _2092, _2094);
        _2090 = _2096;
    }
    float _2098 = _2090;
    float _2100 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2102 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2104 = fma(_1249, _1698, _2058);
    float _2106 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2072);
    float _2108 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2100);
    float _2110 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2102);
    float _2112 = _2098;
    if (_1708)
    {
        _1978 = 1.0;
    }
    float _2114 = _1978;
    float _2116 = _2114;
    if (!_1708)
    {
        float _2118 = _2098 * _2070;
        float _2120 = precise::clamp(_2118, 0.0, 1.0);
        _2112 = _2120;
    }
    float _2122 = _2112;
    float _2124 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2080);
    float _2126 = _2088 + 0.5;
    if (!_1708)
    {
        float _2128 = -_2122;
        float _2130 = _2128 + 1.0;
        _2116 = _2130;
    }
    float _2132 = _2116;
    float _2134 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2106);
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2108);
    float _2140 = _2012 + 0.5;
    float _2142 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2110);
    float _2144 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2146 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2150 = _2124 + _2148;
    float _2152 = _1942 + 0.5;
    float _2154 = _2028 + 0.5;
    out.m_61.x = _2074;
    out.m_61.y = _2144;
    out.m_61.z = _2076;
    out.m_61.w = _2078;
    bool _2156 = _2132 > 0.0;
    bool _2158 = isnan(_2132);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.0);
    bool _2164 = _2160 || _2162;
    float _2166 = _360 * _2146;
    float _2168 = _1613 + _2150;
    out.m_63.x = _2134;
    out.m_63.y = _2138;
    out.m_63.z = _2142;
    float _2170 = _2166 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2172 = _2168 * 0.5;
    out.m_65.x = _1381;
    out.m_65.y = _1377;
    out.m_65.z = _1385;
    out.m_67.x = _2140;
    out.m_67.y = _2152;
    out.m_67.z = _2154;
    out.m_67.w = _2126;
    float _2174 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.y = _1365;
    out.gl_Position.x = _1643;
    out.gl_Position.y = _1657;
    out.gl_Position.z = _2150;
    out.gl_Position.w = _1613;
    out.m_71.z = _2172;
    out.m_71.w = _1613;
    out.m_45.x = _2170;
    float _2176 = _2174 * _1673;
    float _2178 = -_2174;
    float _2180 = _2178 + 1.0;
    float _2182 = _1684 * _2176;
    float _2184 = _1694 * _2176;
    float _2186 = _1684 * _2180;
    float _2188 = fma(_1690, _2182, _1678);
    float _2190 = fma(_1692, _2182, _1680);
    float _2192 = fma(_1684, _2184, _1682);
    out.m_73.x = _2188;
    out.m_73.y = _2190;
    out.m_73.z = _2192;
    out.m_73.w = _2186;
    if (_2164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2194 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2194;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _721 = false;
    bool _504 = false;
    bool _380 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_108);
        out.gl_Position.z = _2251;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2320 = as_type<float>(_146);
        out.gl_Position.z = _2320;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _152 * _150;
    float _168 = 0.0;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _178 = _174;
    if (!_164)
    {
        float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = floor(_176);
    float _194 = _190 * 0.15915493667125701904296875;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _194 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = 1.4012984643248170709237295832899e-45;
    float _206 = _182;
    if (!_164)
    {
        _204 = _154;
    }
    float _208 = _204;
    float _210 = -_192;
    float _212 = _176 + _210;
    bool _214 = !_164;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _154 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _154);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _246;
    }
    float _248 = _206;
    bool _250 = !_164;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _154 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _216 = _270;
    }
    float _272 = _216;
    float _274 = in.m_51.w;
    float _276 = in.m_42.x;
    float _278 = in.m_42.y;
    float _280 = in.m_42.z;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _288 = _286 != 0;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    float _298 = fma(_202, 0.5, 0.5);
    bool _300 = !_198;
    int _302 = _300 ? 0 : 1;
    float _304 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _306 = !_284;
    int _308 = _306 ? 0 : 1;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = -_298;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _318 = abs(_302);
    int _320 = abs(_308);
    float _322 = fma(_272, _184, _304);
    bool _324 = !_288;
    int _326 = _324 ? 0 : 1;
    float _328 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _332 = fma(_272, _186, _328);
    int _334 = abs(_326);
    float _336 = float(_320);
    float _338 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = float(_318);
    float _342 = fma(_322, _274, _276);
    float _344 = abs(_292);
    float _346 = _336 * _344;
    float _348 = fma(_272, _188, _338);
    float _350 = fma(_332, _274, _278);
    float _352 = float(_334);
    float _354 = fma(_340, _316, _346);
    float _356 = fma(_348, _274, _280);
    float _358 = abs(_312);
    float _360 = fma(_352, _358, _354);
    bool _362 = !_330;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_92);
        float _384 = 1.0 / _382;
        float _386 = _126 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _388 + _390;
    bool _394 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_388);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -_404;
    float _412 = _410 + 1.0;
    bool _414 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_388);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _408;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _434 = _424 * _412;
    float _436 = -_424;
    float _438 = _436 + 1.0;
    float _440 = _392 * _426;
    float _442 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = fma(_430, _440, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = _442 * _148;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = fma(_446, _440, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _458 = _448 * _434;
    float _460 = fma(_454, _440, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _462 = trunc(_450);
    int _464 = int(_462);
    float _466 = _456 * _434;
    float _468 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _470 = _460 * _434;
    float _472 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _474 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].x, _468);
    float _476 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _478 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].y, _472);
    float _480 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].z, _476);
    int _482 = _464 << 4;
    int _484 = _482 + 1712;
    bool _486 = !_432;
    float _502;
    if (!_486)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _490 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_92);
        float _508 = 1.0 / _506;
        float _510 = _126 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    uint _515 = uint(int(uint(_484) >> uint(2)));
    uint _517 = uint(int(uint(int(_515)) >> uint(2)));
    int _519 = int(_515) & 3;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[int(_517)][_519];
    int _523 = int(_515) + 1;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    int _527 = _523 & 3;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[int(_525)][_527];
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_512);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    int _551 = _484 + 8;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[int(_555)][_557];
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _565 = 1.0 / _533;
    bool _567 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_512);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _579;
    float _583 = -_549;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _591 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_512);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _537;
    float _605 = _577 * _585;
    float _607 = -_577;
    float _609 = _607 + 1.0;
    bool _611 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = isnan(_512);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _625 = _601 * _609;
    float _627 = -_601;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _563;
    float _633 = _581 * _565;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _512 + _635;
    float _639 = fma(_633, _637, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _512 + _641;
    float _645 = _589 * _603;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _647;
    float _651 = fma(_645, _643, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _653 = _649 * _631;
    float _655 = _639 * _625;
    float _657 = -_621;
    float _659 = _657 + 1.0;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _512 + _661;
    float _665 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _655);
    float _667 = _549 * _659;
    float _669 = fma(_653, _663, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _671 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _673 = fma(_651, _605, _665);
    float _675 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = fma(_669, _667, _673);
    float _681 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = in.m_51.x;
    float _687 = in.m_51.y;
    float _689 = in.m_51.z;
    float _691 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[118].x, _679);
    float _693 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _677;
    out.m_53.y = _683;
    out.m_53.z = _693;
    out.m_53.w = _695;
    float _697 = _480 * _689;
    float _699 = _478 * _687;
    float _701 = _474 * _685;
    bool _703 = !_623;
    float _719;
    if (!_703)
    {
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _707 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _711 = _709 * _705;
        float _713 = floor(_711);
        float _715 = -_713;
        float _717 = _711 + _715;
        _719 = _717;
        _721 = true;
    }
    else
    {
        float _723 = float(_92);
        float _725 = 1.0 / _723;
        float _727 = _126 * _725;
        _719 = _727;
    }
    _721 = false;
    float _729 = _719;
    float _731 = in.m_49.z;
    float _733 = _148 * 2.0;
    float _735 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _737 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _739 = in.m_49.y;
    float _741 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _743 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _735);
    float _745 = floor(_733);
    float _747 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _737);
    float _749 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _741);
    float _751 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _743);
    float _753 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _747);
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _769 = _767 != 0;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _775 = _773 != 0;
    float _777 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _781 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _749);
    float _783 = -_771;
    float _785 = fma(_777, 2.0, _783);
    float _787 = _731 * 2.0;
    bool _789 = _745 > 0.0;
    float _791 = _753 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _793 = _745 >= 0.0;
    bool _795 = isnan(_745);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = _739 * 2.0;
    float _805 = _739 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _807 = floor(_787);
    float _809 = _148 + _739;
    float _811 = _739 + _731;
    float _813 = fma(_805, -2.0, _779);
    float _815 = _148 + _731;
    float _817 = _809 + (-1.0);
    float _819 = floor(_803);
    float _821 = _815 + (-1.0);
    float _823 = _811 + (-1.0);
    int _825 = _801 ? 0 : 1;
    float _827 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = _821;
    float _833 = _817;
    float _835 = _823;
    if (!_775)
    {
        _831 = _739;
    }
    float _837 = _831;
    float _839 = _757 * _126;
    float _841 = _837;
    if (!_775)
    {
        _833 = _731;
    }
    float _843 = _833;
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _847 = ~_825;
    int _849 = _847 + 1;
    int _851 = _849 + 1;
    float _853 = _751 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _855 = _851;
    float _857 = _843;
    if (!_775)
    {
        _835 = _731;
    }
    float _859 = _835;
    float _861 = _781 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = _859;
    if (!_789)
    {
        int _865 = ~_825;
        int _867 = _865 + 1;
        _855 = _867;
    }
    int _869 = _855;
    float _871 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _813);
    if (_775)
    {
        _841 = _148;
    }
    float _873 = _841;
    float _875 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_775)
    {
        _863 = _739;
    }
    float _877 = _863;
    float _879 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_775)
    {
        _857 = _739;
    }
    float _881 = _857;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _885 = _807 > 0.0;
    float _887 = _877 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _889 = _807 >= 0.0;
    bool _891 = isnan(_807);
    bool _893 = _889 || _891;
    bool _895 = isnan(0.0);
    bool _897 = _893 || _895;
    float _899 = _697 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _901 = _819 > 0.0;
    bool _903 = _819 >= 0.0;
    bool _905 = isnan(_819);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _915 = !_765;
    int _917 = _915 ? 0 : 1;
    float _919 = -_913;
    float _921 = fma(_883, 2.0, _919);
    int _923 = abs(_917);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _929 = fma(_887, -2.0, _925);
    float _931 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[83].z, _927);
    float _933 = float(_923);
    float _935 = exp2(_839);
    float _937 = float(_869);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _943 = _911 ? 0 : 1;
    float _945 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[83].w, _939);
    float _947 = _933 * _937;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _951 = 1.0 + _949;
    float _953 = in.m_55.x;
    float _955 = in.m_55.y;
    float _957 = in.m_55.z;
    float _959 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[78].w, _941);
    float _961 = 1.0 / _951;
    int _963 = ~_943;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _959);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _791 + _971;
    bool _975 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _977 = isnan(1.0);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _983 = _979 || _981;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _987 = _967;
    if (!_901)
    {
        int _989 = ~_943;
        int _991 = _989 + 1;
        _987 = _991;
    }
    int _993 = _987;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _997 = _853 + _995;
    float _999 = _973 * _973;
    float _1001 = -_935;
    float _1003 = _1001 + 1.0;
    bool _1005 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(0.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _861 + _1017;
    float _1021 = fma(_997, _997, _999);
    float _1023 = -_126;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[76].x, _785);
    float _1027 = _1013 ? _1003 : 0.0;
    float _1029 = _947 * (-2.0);
    float _1031 = fma(_1019, _1019, _1021);
    float _1033 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1015);
    float _1035 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _931);
    float _1037 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _945);
    float _1039 = -_126;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[81].x, _921);
    float _1043 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _929);
    float _1045 = _1033;
    if (_983)
    {
        float _1047 = _1027 * _961;
        _130 = _1047;
    }
    float _1049 = _130;
    float _1051 = fma(_845, _1029, _845);
    float _1053 = rsqrt(_1031);
    bool _1055 = !_761;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = fma(_1029, _955, _955);
    bool _1061 = !_769;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _739 + (-0.5);
    int _1067 = _897 ? 0 : 1;
    int _1069 = abs(_1057);
    float _1071 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1059);
    int _1073 = abs(_1063);
    int _1075 = ~_1067;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1079;
    if (!_885)
    {
        int _1083 = ~_1067;
        int _1085 = _1083 + 1;
        _1081 = _1085;
    }
    int _1087 = _1081;
    float _1089 = fma(_1051, _1049, _1071);
    float _1091 = _973 * _1053;
    float _1093 = _997 * _1053;
    float _1095 = float(_1069);
    float _1097 = -_1091;
    float _1099 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1101 = float(_1087);
    float _1103 = -_1093;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1107 = float(_1073);
    float _1109 = _1099 * _1099;
    float _1111 = float(_993);
    float _1113 = _1095 * _1101;
    float _1115 = _1019 * _1053;
    float _1117 = fma(_1105, _1105, _1109);
    float _1119 = _1089 * 0.15915493667125701904296875;
    float _1121 = _1107 * _1111;
    float _1123 = _1113 * (-2.0);
    float _1125 = _148 + (-0.5);
    float _1127 = -_1115;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1131 = _1121 * (-2.0);
    float _1133 = fma(_1123, _953, _953);
    float _1135 = fma(_827, _1123, _827);
    float _1137 = fma(_1129, _1129, _1117);
    float _1139 = fma(_1131, _957, _957);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1133);
    float _1143 = _731 + (-0.5);
    float _1145 = fma(_829, _1131, _829);
    float _1147 = sqrt(_1137);
    float _1149 = fma(_1135, _1049, _1141);
    float _1151 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1139);
    float _1153 = _1149 * 0.15915493667125701904296875;
    float _1155 = fma(_1145, _1049, _1151);
    float _1157 = _1119 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = _1155 * 0.15915493667125701904296875;
    float _1163 = in.m_57.x;
    float _1165 = in.m_57.y;
    float _1167 = in.m_57.z;
    float _1169 = _1119 * 6.283185482025146484375;
    float _1171 = cos(_1169);
    float _1173 = _1053 * _1147;
    float _1175 = _875 * _1173;
    float _1177 = _879 * _1173;
    float _1179 = _899 * _1173;
    float _1181 = _1161 * 6.283185482025146484375;
    float _1183 = cos(_1181);
    float _1185 = _1153 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = _1153 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = _1171 * _1183;
    float _1195 = _1161 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1187 * _1171;
    float _1201 = _1187 * _1159;
    float _1203 = _1187 * _1183;
    float _1205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1163);
    float _1207 = _1191 * _1159;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1165);
    float _1211 = _1191 * _1171;
    float _1213 = _1191 * _1183;
    float _1215 = _1159 * _1183;
    float _1217 = _1175 * _1209;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1167);
    float _1221 = _1177 * _1205;
    float _1223 = fma(_1197, _1199, _1207);
    float _1225 = _1203 * _1217;
    float _1227 = _1179 * _1219;
    float _1229 = -_1211;
    float _1231 = fma(_1197, _1201, _1229);
    float _1233 = -_1217;
    float _1235 = _1197 * _1233;
    float _1237 = fma(_1223, _1221, _1225);
    float _1239 = -_1201;
    float _1241 = fma(_1197, _1211, _1239);
    float _1243 = _1213 * _1217;
    float _1245 = fma(_1193, _1221, _1235);
    float _1247 = fma(_1231, _1227, _1237);
    float _1249 = fma(_1197, _1207, _1199);
    float _1251 = fma(_1241, _1221, _1243);
    float _1253 = fma(_1215, _1227, _1245);
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1257 = fma(_1249, _1227, _1251);
    float _1259 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1261 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1255);
    float _1263 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1259);
    float _1267 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1263);
    float _1271 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1265);
    float _1273 = _861 + _1267;
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1269);
    float _1277 = _853 + _1271;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1273 + _1279;
    float _1283 = _791 + _1275;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1287 = _1277 + _1285;
    float _1289 = _1281 * _1281;
    float _1291 = fma(_1287, _1287, _1289);
    float _1293 = sqrt(_1291);
    bool _1295 = _1293 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1275;
    float _1299 = _1289;
    float _1301 = _1277;
    float _1303 = _1137;
    float _1305 = _1101;
    if (!_1295)
    {
        _1297 = _1277;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (!_1295)
    {
        _1299 = _1273;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (!_1295)
    {
        _1301 = _1283;
    }
    float _1315 = _1301;
    bool _1317 = !_1295;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1293 + _1323;
        float _1327 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1291);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337 + (-1.0);
        float _1345 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = fma(_1341, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1349 = fma(_1283, _1337, _1345);
        float _1351 = _1329 * _1347;
        float _1353 = fma(_1287, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1355 = fma(_1281, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1319 = _1349;
        _1309 = _1353;
        _1313 = _1355;
    }
    float _1357 = _1319;
    float _1359 = _1309;
    float _1361 = _1313;
    float _1363 = -_1091;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1367 = -_1093;
    float _1369 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1359);
    float _1371 = -_1115;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1361);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1377 = _1365 + _1375;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1381 = _1369 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1385 = _1373 + _1383;
    float _1387 = _1377 * _1377;
    float _1389 = fma(_1381, _1381, _1387);
    float _1391 = fma(_1385, _1385, _1389);
    float _1393 = rsqrt(_1391);
    float _1395 = sqrt(_1391);
    float _1397 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1399 = _1381 * _1397;
    float _1401 = _1385 * _1397;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 * _1401;
    float _1407 = _1403 + _1405;
    float _1409 = sqrt(_1407);
    bool _1411 = _1409 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1415 = _1409 + _1413;
    float _1417 = _1281;
    float _1419 = _1415;
    float _1421 = _1399;
    float _1423 = _1401;
    float _1425 = _1403;
    float _1427 = _1405;
    if (_1411)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1417 = _1429;
    }
    float _1431 = _1417;
    if (_1411)
    {
        float _1433 = _1415 * _1431;
        _1419 = _1433;
    }
    float _1435 = _1419;
    if (_1411)
    {
        float _1437 = _1435 * 0.15915493667125701904296875;
        _1303 = _1437;
    }
    float _1439 = _1303;
    float _1441 = _1139;
    if (_1411)
    {
        float _1443 = _1439 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1451 = precise::max(0.0, _1449);
    float _1453 = _1431;
    float _1455 = _1451;
    if (_1411)
    {
        float _1457 = _1439 * 6.283185482025146484375;
        float _1459 = cos(_1457);
        _1453 = _1459;
    }
    float _1461 = _1453;
    float _1463 = -_1397;
    float _1465 = -_1451;
    float _1467 = fma(_1377, _1463, _1465);
    float _1469 = _1449;
    if (_1411)
    {
        float _1471 = rsqrt(_1407);
        _1469 = _1471;
    }
    float _1473 = _1469;
    if (_1411)
    {
        float _1475 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1475;
    }
    float _1477 = _1455;
    float _1479 = _1477;
    float _1481 = _1447;
    if (_1411)
    {
        float _1483 = fma(_1447, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1305 = _1483;
    }
    float _1485 = _1305;
    float _1487 = _1485;
    if (_1411)
    {
        float _1489 = _1461 + (-1.0);
        _1479 = _1489;
    }
    float _1491 = _1479;
    if (_1411)
    {
        float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1493;
    }
    float _1495 = _1481;
    float _1497 = _1473;
    if (_1411)
    {
        float _1499 = _1473 * _1485;
        _1487 = _1499;
    }
    float _1501 = _1487;
    if (!_1411)
    {
        _1497 = _1467;
    }
    float _1503 = _1497;
    float _1505 = _1503;
    if (_1411)
    {
        float _1507 = fma(_1467, _1461, _1495);
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1411)
    {
        float _1513 = _1399 * _1501;
        _1421 = _1513;
    }
    float _1515 = _1421;
    if (_1411)
    {
        float _1517 = _1401 * _1501;
        _1423 = _1517;
    }
    float _1519 = _1423;
    float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1523 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1521);
    float _1525 = precise::clamp(_1523, 0.0, 1.0);
    float _1527 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1511);
    if (_1411)
    {
        float _1529 = _1515 * _1515;
        _1425 = _1529;
    }
    float _1531 = _1425;
    if (_1411)
    {
        float _1533 = _1519 * _1519;
        _1427 = _1533;
    }
    float _1535 = _1427;
    float _1537 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1539 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1527);
    float _1541 = fma(_1509, _1509, _1531);
    float _1543 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1545 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1537);
    float _1547 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1549 = _1541 + _1535;
    float _1551 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1543);
    float _1553 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1545);
    float _1555 = -_1525;
    float _1557 = _1555 + 1.0;
    float _1559 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1547);
    float _1561 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1551);
    float _1563 = rsqrt(_1549);
    float _1565 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1567 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1569 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1571 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1559);
    float _1573 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = abs(_1557);
    float _1581 = log2(_1579);
    float _1583 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1573);
    float _1585 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1587 = -_1577;
    float _1589 = fma(_1587, _1575, 1.0);
    float _1591 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1593 = _1563 * _1515;
    float _1595 = _1563 * _1509;
    float _1597 = _1563 * _1519;
    float _1599 = log2(_1589);
    float _1601 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1603 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1583);
    float _1605 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1591);
    float _1607 = _1595 + 1.0;
    float _1609 = -_1601;
    float _1611 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1609);
    float _1613 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1603);
    float _1615 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1617 = -_1597;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1611);
    float _1621 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1623 = 1.0 / _1613;
    float _1625 = fma(_1619, -0.5, 0.5);
    float _1627 = fma(_1619, 0.5, 0.5);
    float _1629 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1621);
    float _1631 = _1599 * 0.693147182464599609375;
    float _1633 = fma(_1627, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1635 = sqrt(_1625);
    float _1637 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1629);
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1641 = fma(_1627, _1633, -0.212114393711090087890625);
    float _1643 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1637);
    float _1645 = fma(_1627, _1641, 1.570728778839111328125);
    float _1647 = exp2(_1615);
    float _1649 = _1635 * 0.636619746685028076171875;
    float _1651 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1605);
    float _1653 = -_1645;
    float _1655 = fma(_1649, _1653, 1.0);
    float _1657 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1651);
    float _1659 = _1643 * _1623;
    float _1661 = -_1595;
    float _1663 = fma(_1647, _1607, _1661);
    float _1665 = _1657 * _1623;
    float _1667 = fma(_1659, 0.5, 0.5);
    float _1669 = fma(_1663, 0.5, 0.5);
    float _1671 = fma(_1665, -0.5, 0.5);
    float3 _4724 = float3(_1667, _1671, _1639);
    float _1673 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4724, float3(0.0), isnan(_4724)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4724, float3(0.0), isnan(_4724)), level(0.0)).x;
    float3 _4735 = float3(_1667, _1671, _1639);
    float4 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4735, float3(0.0), isnan(_4735)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4735, float3(0.0), isnan(_4735)), level(0.0)).xyzw;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = _1676.w;
    float2 _4752 = float2(_1655, _1669);
    float3 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4752, float2(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4752, float2(0.0), isnan(_4752)), level(0.0)).xyz;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = in.m_59.y;
    float _1698 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _1700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1702 = isnan(0.5);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1708 = _1704 || _1706;
    float _1710 = in.m_49.w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1716 = in.m_59.x;
    bool _1718 = _739 > 0.5;
    float _1720 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1722 = 1.0 / _1714;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1734 = _1732 != 0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1738 = _729 + _1736;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1742 = _1740 != 0;
    float _1744 = -_1091;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1750 = _1748 != 0;
    float _1752 = 1.0 / _1726;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1756 = _1754 != 0;
    float _1758 = -_1093;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1762 = -_1696;
    float _1764 = _1762 + 1.0;
    float _1766 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1768 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1770 = isnan(_729);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1782 = _1710 > 0.5;
    float _1784 = 1.0 / _1730;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1786;
    int _1790 = _1718 ? as_type<int>(_1764) : as_type<int>(_1696);
    float _1792 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1794 = _1718;
    bool _1796 = _1750;
    float _1798 = _1696;
    if (_1734)
    {
        bool _1800 = _148 > 0.5;
        _1794 = _1800;
    }
    bool _1802 = _1794;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1808 = _1750 ? as_type<float>(_1790) : _1696;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1810;
    float _1814 = _1812;
    if (_1742)
    {
        bool _1816 = _731 > 0.5;
        _1796 = _1816;
    }
    bool _1818 = _1796;
    float _1820 = _1806 * _1722;
    float _1822 = _1788 * _1752;
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1828 = _729 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1832 = _729 + _1830;
    float _1834 = _1822;
    if (_1756)
    {
        float _1836 = _1782 ? _1764 : _1696;
        _1798 = _1836;
    }
    float _1838 = _1798;
    float _1840 = _1812 * _1784;
    if (!_1734)
    {
        _1814 = _1716;
    }
    float _1842 = _1814;
    float _1844 = -_1720;
    float _1846 = _1197 * _1844;
    float _1848 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1850 = fma(_1840, _1828, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1852 = fma(_1820, _1738, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1854 = fma(_1822, _1832, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1856 = _1842;
    if (!_1734)
    {
        _1834 = _1842;
    }
    float _1858 = _1834;
    float _1860 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1766);
    float _1862 = _1858;
    if (_1734)
    {
        _1856 = _1716;
    }
    float _1864 = _1856;
    float _1866 = -_1115;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    bool _1870 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1872 = isnan(_729);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1886 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1888 = isnan(_729);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_1778;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1882, _1808, -0.5);
    bool _1904 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1906 = isnan(_729);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1912 = _1908 || _1910;
    int _1914 = _1912 ? 1065353216 : 0;
    float _1916 = -_1880;
    float _1918 = _1916 + 1.0;
    float _1920 = _1896 * _1900;
    float _1922 = -_1896;
    float _1924 = _1922 + 1.0;
    float _1926 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1860);
    float _1928 = as_type<float>(_1914) * _1918;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = _1880 * _1924;
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1936 = _1850 * _1928;
    float _1938 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1940 = -_871;
    float _1942 = fma(_969, _1902, _1940);
    float _1944 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1946 = as_type<int>(_1884);
    int _1948 = _1914;
    float _1950 = _1864;
    if (_1734)
    {
        float _1952 = -_1864;
        float _1954 = _1952 + 1.0;
        _1946 = as_type<int>(_1954);
    }
    int _1956 = _1946;
    float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1960 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1938);
    float _1962 = fma(_1944, _1838, -0.5);
    float _1964 = -as_type<float>(_1914);
    float _1966 = _1964 + 1.0;
    float _1968 = as_type<float>(_1956);
    if (_1742)
    {
        float _1970 = -_1864;
        float _1972 = _1970 + 1.0;
        _1948 = as_type<int>(_1972);
    }
    int _1974 = _1948;
    float _1976 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1960);
    float _1978 = as_type<float>(_1974);
    if (_1734)
    {
        float _1980 = _1802 ? as_type<float>(_1956) : _1864;
        _1862 = _1980;
    }
    float _1982 = _1862;
    float _1984 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1936);
    float _1986 = 1.0 / _1934;
    float _1988 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1742)
    {
        float _1990 = _1818 ? as_type<float>(_1974) : _1864;
        _1950 = _1990;
    }
    float _1992 = _1950;
    float _1994 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1996 = _1992;
    if (!_1708)
    {
        _1968 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1998 = _1968;
    float _2000 = _1988 + _1934;
    float _2002 = fma(_1852, _1932, _1984);
    float _2004 = fma(_1994, _1982, -0.5);
    float _2006 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2008 = exp2(_1780);
    float _2010 = fma(_1854, _1920, _2002);
    float _2012 = fma(_1033, _2004, _1025);
    float _2014 = fma(_2006, _1992, -0.5);
    float _2016 = _1958;
    if (!_1708)
    {
        _1996 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2018 = _1996;
    float _2020 = fma(_1193, _1792, _1846);
    float _2022 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2010);
    float _2024 = _2000 * _1986;
    float _2026 = _2024 * 0.5;
    float _2028 = fma(_1035, _2014, _1041);
    if (!_1708)
    {
        float _2030 = -_2018;
        float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1045 = _2032;
    }
    float _2034 = _1045;
    if (!_1708)
    {
        float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2038 = fma(_2026, _1998, _2036);
        _2016 = _2038;
    }
    float _2040 = _2016;
    float _2042 = _1203 * _1720;
    float _2044 = _1213 * _1720;
    float _2046 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1848);
    float _2048 = _1982;
    if (!_1708)
    {
        float _2050 = 1.0 / _2040;
        _2048 = _2050;
    }
    float _2052 = _2048;
    float _2054 = fma(_1223, _1792, _2042);
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2058 = fma(_1241, _1792, _2044);
    float _2060 = fma(_1231, _1698, _2054);
    float _2062 = fma(_1215, _1698, _2020);
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2066 = _2034;
    if (!_1708)
    {
        float _2068 = 1.0 / _2034;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2074 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2080 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2082 = -_2008;
    float _2084 = _2082 + 1.0;
    float _2086 = -_1043;
    float _2088 = fma(_1037, _1962, _2086);
    float _2090 = _2052;
    if (!_1708)
    {
        float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2094 = -_2018;
        float _2096 = fma(_2052, _2092, _2094);
        _2090 = _2096;
    }
    float _2098 = _2090;
    float _2100 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2102 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2104 = fma(_1249, _1698, _2058);
    float _2106 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2072);
    float _2108 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2100);
    float _2110 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2102);
    float _2112 = _2098;
    if (_1708)
    {
        _1978 = 1.0;
    }
    float _2114 = _1978;
    float _2116 = _2114;
    if (!_1708)
    {
        float _2118 = _2098 * _2070;
        float _2120 = precise::clamp(_2118, 0.0, 1.0);
        _2112 = _2120;
    }
    float _2122 = _2112;
    float _2124 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2080);
    float _2126 = _2088 + 0.5;
    if (!_1708)
    {
        float _2128 = -_2122;
        float _2130 = _2128 + 1.0;
        _2116 = _2130;
    }
    float _2132 = _2116;
    float _2134 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2106);
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2108);
    float _2140 = _2012 + 0.5;
    float _2142 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2110);
    float _2144 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2146 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2150 = _2124 + _2148;
    float _2152 = _1942 + 0.5;
    float _2154 = _2028 + 0.5;
    out.m_61.x = _2074;
    out.m_61.y = _2144;
    out.m_61.z = _2076;
    out.m_61.w = _2078;
    bool _2156 = _2132 > 0.0;
    bool _2158 = isnan(_2132);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.0);
    bool _2164 = _2160 || _2162;
    float _2166 = _360 * _2146;
    float _2168 = _1613 + _2150;
    out.m_63.x = _2134;
    out.m_63.y = _2138;
    out.m_63.z = _2142;
    float _2170 = _2166 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2172 = _2168 * 0.5;
    out.m_65.x = _1381;
    out.m_65.y = _1377;
    out.m_65.z = _1385;
    out.m_67.x = _2140;
    out.m_67.y = _2152;
    out.m_67.z = _2154;
    out.m_67.w = _2126;
    float _2174 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.y = _1365;
    out.gl_Position.x = _1643;
    out.gl_Position.y = _1657;
    out.gl_Position.z = _2150;
    out.gl_Position.w = _1613;
    out.m_71.z = _2172;
    out.m_71.w = _1613;
    out.m_45.x = _2170;
    float _2176 = _2174 * _1673;
    float _2178 = -_2174;
    float _2180 = _2178 + 1.0;
    float _2182 = _1684 * _2176;
    float _2184 = _1694 * _2176;
    float _2186 = _1684 * _2180;
    float _2188 = fma(_1690, _2182, _1678);
    float _2190 = fma(_1692, _2182, _1680);
    float _2192 = fma(_1684, _2184, _1682);
    out.m_73.x = _2188;
    out.m_73.y = _2190;
    out.m_73.z = _2192;
    out.m_73.w = _2186;
    if (_2164)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2194 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2194;
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
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _721 = false;
    bool _504 = false;
    bool _380 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_108);
        out.gl_Position.z = _2251;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2320 = as_type<float>(_146);
        out.gl_Position.z = _2320;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _152 * _150;
    float _168 = 0.0;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _178 = _174;
    if (!_164)
    {
        float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = floor(_176);
    float _194 = _190 * 0.15915493667125701904296875;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _194 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = 1.4012984643248170709237295832899e-45;
    float _206 = _182;
    if (!_164)
    {
        _204 = _154;
    }
    float _208 = _204;
    float _210 = -_192;
    float _212 = _176 + _210;
    bool _214 = !_164;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _154 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _154);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _246;
    }
    float _248 = _206;
    bool _250 = !_164;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _154 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _216 = _270;
    }
    float _272 = _216;
    float _274 = in.m_51.w;
    float _276 = in.m_42.x;
    float _278 = in.m_42.y;
    float _280 = in.m_42.z;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _284 = _282 != 0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _288 = _286 != 0;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    float _298 = fma(_202, 0.5, 0.5);
    bool _300 = !_198;
    int _302 = _300 ? 0 : 1;
    float _304 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _306 = !_284;
    int _308 = _306 ? 0 : 1;
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = -_298;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _318 = abs(_302);
    int _320 = abs(_308);
    float _322 = fma(_272, _184, _304);
    bool _324 = !_288;
    int _326 = _324 ? 0 : 1;
    float _328 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _332 = fma(_272, _186, _328);
    int _334 = abs(_326);
    float _336 = float(_320);
    float _338 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = float(_318);
    float _342 = fma(_322, _274, _276);
    float _344 = abs(_292);
    float _346 = _336 * _344;
    float _348 = fma(_272, _188, _338);
    float _350 = fma(_332, _274, _278);
    float _352 = float(_334);
    float _354 = fma(_340, _316, _346);
    float _356 = fma(_348, _274, _280);
    float _358 = abs(_312);
    float _360 = fma(_352, _358, _354);
    bool _362 = !_330;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_92);
        float _384 = 1.0 / _382;
        float _386 = _126 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _388 + _390;
    bool _394 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_388);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -_404;
    float _412 = _410 + 1.0;
    bool _414 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_388);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _408;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    bool _432 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _434 = _424 * _412;
    float _436 = -_424;
    float _438 = _436 + 1.0;
    float _440 = _392 * _426;
    float _442 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _444;
    float _448 = fma(_430, _440, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = _442 * _148;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = fma(_446, _440, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _458 = _448 * _434;
    float _460 = fma(_454, _440, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _462 = trunc(_450);
    int _464 = int(_462);
    float _466 = _456 * _434;
    float _468 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _470 = _460 * _434;
    float _472 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _474 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].x, _468);
    float _476 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _478 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].y, _472);
    float _480 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].z, _476);
    int _482 = _464 << 4;
    int _484 = _482 + 1712;
    bool _486 = !_432;
    float _502;
    if (!_486)
    {
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _490 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_92);
        float _508 = 1.0 / _506;
        float _510 = _126 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    uint _515 = uint(int(uint(_484) >> uint(2)));
    uint _517 = uint(int(uint(int(_515)) >> uint(2)));
    int _519 = int(_515) & 3;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[int(_517)][_519];
    int _523 = int(_515) + 1;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    int _527 = _523 & 3;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[int(_525)][_527];
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_512);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    int _551 = _484 + 8;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    uint _555 = uint(int(uint(int(_553)) >> uint(2)));
    int _557 = int(_553) & 3;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[int(_555)][_557];
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _565 = 1.0 / _533;
    bool _567 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_512);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _579;
    float _583 = -_549;
    float _585 = _583 + 1.0;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _591 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_512);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _537;
    float _605 = _577 * _585;
    float _607 = -_577;
    float _609 = _607 + 1.0;
    bool _611 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = isnan(_512);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _625 = _601 * _609;
    float _627 = -_601;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _563;
    float _633 = _581 * _565;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _512 + _635;
    float _639 = fma(_633, _637, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _643 = _512 + _641;
    float _645 = _589 * _603;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _647;
    float _651 = fma(_645, _643, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _653 = _649 * _631;
    float _655 = _639 * _625;
    float _657 = -_621;
    float _659 = _657 + 1.0;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _512 + _661;
    float _665 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _655);
    float _667 = _549 * _659;
    float _669 = fma(_653, _663, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _671 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _673 = fma(_651, _605, _665);
    float _675 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = fma(_669, _667, _673);
    float _681 = _559 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = in.m_51.x;
    float _687 = in.m_51.y;
    float _689 = in.m_51.z;
    float _691 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[118].x, _679);
    float _693 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _677;
    out.m_53.y = _683;
    out.m_53.z = _693;
    out.m_53.w = _695;
    float _697 = _480 * _689;
    float _699 = _478 * _687;
    float _701 = _474 * _685;
    bool _703 = !_623;
    float _719;
    if (!_703)
    {
        float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _707 = _148 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _711 = _709 * _705;
        float _713 = floor(_711);
        float _715 = -_713;
        float _717 = _711 + _715;
        _719 = _717;
        _721 = true;
    }
    else
    {
        float _723 = float(_92);
        float _725 = 1.0 / _723;
        float _727 = _126 * _725;
        _719 = _727;
    }
    _721 = false;
    float _729 = _719;
    float _731 = in.m_49.z;
    float _733 = _148 * 2.0;
    float _735 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _737 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _739 = in.m_49.y;
    float _741 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _743 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _735);
    float _745 = floor(_733);
    float _747 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _737);
    float _749 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _741);
    float _751 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _743);
    float _753 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _747);
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _769 = _767 != 0;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _775 = _773 != 0;
    float _777 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _781 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _749);
    float _783 = -_771;
    float _785 = fma(_777, 2.0, _783);
    float _787 = _731 * 2.0;
    bool _789 = _745 > 0.0;
    float _791 = _753 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _793 = _745 >= 0.0;
    bool _795 = isnan(_745);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    float _803 = _739 * 2.0;
    float _805 = _739 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _807 = floor(_787);
    float _809 = _148 + _739;
    float _811 = _739 + _731;
    float _813 = fma(_805, -2.0, _779);
    float _815 = _148 + _731;
    float _817 = _809 + (-1.0);
    float _819 = floor(_803);
    float _821 = _815 + (-1.0);
    float _823 = _811 + (-1.0);
    int _825 = _801 ? 0 : 1;
    float _827 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _831 = _821;
    float _833 = _817;
    float _835 = _823;
    if (!_775)
    {
        _831 = _739;
    }
    float _837 = _831;
    float _839 = _757 * _126;
    float _841 = _837;
    if (!_775)
    {
        _833 = _731;
    }
    float _843 = _833;
    float _845 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _847 = ~_825;
    int _849 = _847 + 1;
    int _851 = _849 + 1;
    float _853 = _751 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _855 = _851;
    float _857 = _843;
    if (!_775)
    {
        _835 = _731;
    }
    float _859 = _835;
    float _861 = _781 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _863 = _859;
    if (!_789)
    {
        int _865 = ~_825;
        int _867 = _865 + 1;
        _855 = _867;
    }
    int _869 = _855;
    float _871 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _813);
    if (_775)
    {
        _841 = _148;
    }
    float _873 = _841;
    float _875 = _699 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_775)
    {
        _863 = _739;
    }
    float _877 = _863;
    float _879 = _701 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_775)
    {
        _857 = _739;
    }
    float _881 = _857;
    float _883 = _873 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _885 = _807 > 0.0;
    float _887 = _877 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _889 = _807 >= 0.0;
    bool _891 = isnan(_807);
    bool _893 = _889 || _891;
    bool _895 = isnan(0.0);
    bool _897 = _893 || _895;
    float _899 = _697 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _901 = _819 > 0.0;
    bool _903 = _819 >= 0.0;
    bool _905 = isnan(_819);
    bool _907 = _903 || _905;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _915 = !_765;
    int _917 = _915 ? 0 : 1;
    float _919 = -_913;
    float _921 = fma(_883, 2.0, _919);
    int _923 = abs(_917);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _929 = fma(_887, -2.0, _925);
    float _931 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[83].z, _927);
    float _933 = float(_923);
    float _935 = exp2(_839);
    float _937 = float(_869);
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _943 = _911 ? 0 : 1;
    float _945 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[83].w, _939);
    float _947 = _933 * _937;
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _951 = 1.0 + _949;
    float _953 = in.m_55.x;
    float _955 = in.m_55.y;
    float _957 = in.m_55.z;
    float _959 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[78].w, _941);
    float _961 = 1.0 / _951;
    int _963 = ~_943;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _959);
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _791 + _971;
    bool _975 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _977 = isnan(1.0);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _983 = _979 || _981;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _987 = _967;
    if (!_901)
    {
        int _989 = ~_943;
        int _991 = _989 + 1;
        _987 = _991;
    }
    int _993 = _987;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _997 = _853 + _995;
    float _999 = _973 * _973;
    float _1001 = -_935;
    float _1003 = _1001 + 1.0;
    bool _1005 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(0.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _861 + _1017;
    float _1021 = fma(_997, _997, _999);
    float _1023 = -_126;
    float _1025 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[76].x, _785);
    float _1027 = _1013 ? _1003 : 0.0;
    float _1029 = _947 * (-2.0);
    float _1031 = fma(_1019, _1019, _1021);
    float _1033 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1015);
    float _1035 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _931);
    float _1037 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _945);
    float _1039 = -_126;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[81].x, _921);
    float _1043 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _929);
    float _1045 = _1033;
    if (_983)
    {
        float _1047 = _1027 * _961;
        _130 = _1047;
    }
    float _1049 = _130;
    float _1051 = fma(_845, _1029, _845);
    float _1053 = rsqrt(_1031);
    bool _1055 = !_761;
    int _1057 = _1055 ? 0 : 1;
    float _1059 = fma(_1029, _955, _955);
    bool _1061 = !_769;
    int _1063 = _1061 ? 0 : 1;
    float _1065 = _739 + (-0.5);
    int _1067 = _897 ? 0 : 1;
    int _1069 = abs(_1057);
    float _1071 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1059);
    int _1073 = abs(_1063);
    int _1075 = ~_1067;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    int _1081 = _1079;
    if (!_885)
    {
        int _1083 = ~_1067;
        int _1085 = _1083 + 1;
        _1081 = _1085;
    }
    int _1087 = _1081;
    float _1089 = fma(_1051, _1049, _1071);
    float _1091 = _973 * _1053;
    float _1093 = _997 * _1053;
    float _1095 = float(_1069);
    float _1097 = -_1091;
    float _1099 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1101 = float(_1087);
    float _1103 = -_1093;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1107 = float(_1073);
    float _1109 = _1099 * _1099;
    float _1111 = float(_993);
    float _1113 = _1095 * _1101;
    float _1115 = _1019 * _1053;
    float _1117 = fma(_1105, _1105, _1109);
    float _1119 = _1089 * 0.15915493667125701904296875;
    float _1121 = _1107 * _1111;
    float _1123 = _1113 * (-2.0);
    float _1125 = _148 + (-0.5);
    float _1127 = -_1115;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1131 = _1121 * (-2.0);
    float _1133 = fma(_1123, _953, _953);
    float _1135 = fma(_827, _1123, _827);
    float _1137 = fma(_1129, _1129, _1117);
    float _1139 = fma(_1131, _957, _957);
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1133);
    float _1143 = _731 + (-0.5);
    float _1145 = fma(_829, _1131, _829);
    float _1147 = sqrt(_1137);
    float _1149 = fma(_1135, _1049, _1141);
    float _1151 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1139);
    float _1153 = _1149 * 0.15915493667125701904296875;
    float _1155 = fma(_1145, _1049, _1151);
    float _1157 = _1119 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = _1155 * 0.15915493667125701904296875;
    float _1163 = in.m_57.x;
    float _1165 = in.m_57.y;
    float _1167 = in.m_57.z;
    float _1169 = _1119 * 6.283185482025146484375;
    float _1171 = cos(_1169);
    float _1173 = _1053 * _1147;
    float _1175 = _875 * _1173;
    float _1177 = _879 * _1173;
    float _1179 = _899 * _1173;
    float _1181 = _1161 * 6.283185482025146484375;
    float _1183 = cos(_1181);
    float _1185 = _1153 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = _1153 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = _1171 * _1183;
    float _1195 = _1161 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = _1187 * _1171;
    float _1201 = _1187 * _1159;
    float _1203 = _1187 * _1183;
    float _1205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1163);
    float _1207 = _1191 * _1159;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1165);
    float _1211 = _1191 * _1171;
    float _1213 = _1191 * _1183;
    float _1215 = _1159 * _1183;
    float _1217 = _1175 * _1209;
    float _1219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1167);
    float _1221 = _1177 * _1205;
    float _1223 = fma(_1197, _1199, _1207);
    float _1225 = _1203 * _1217;
    float _1227 = _1179 * _1219;
    float _1229 = -_1211;
    float _1231 = fma(_1197, _1201, _1229);
    float _1233 = -_1217;
    float _1235 = _1197 * _1233;
    float _1237 = fma(_1223, _1221, _1225);
    float _1239 = -_1201;
    float _1241 = fma(_1197, _1211, _1239);
    float _1243 = _1213 * _1217;
    float _1245 = fma(_1193, _1221, _1235);
    float _1247 = fma(_1231, _1227, _1237);
    float _1249 = fma(_1197, _1207, _1199);
    float _1251 = fma(_1241, _1221, _1243);
    float _1253 = fma(_1215, _1227, _1245);
    float _1255 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1257 = fma(_1249, _1227, _1251);
    float _1259 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1261 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1255);
    float _1263 = _1247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1259);
    float _1267 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    float _1269 = fma(_1253, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1263);
    float _1271 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1265);
    float _1273 = _861 + _1267;
    float _1275 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1269);
    float _1277 = _853 + _1271;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1273 + _1279;
    float _1283 = _791 + _1275;
    float _1285 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1287 = _1277 + _1285;
    float _1289 = _1281 * _1281;
    float _1291 = fma(_1287, _1287, _1289);
    float _1293 = sqrt(_1291);
    bool _1295 = _1293 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1275;
    float _1299 = _1289;
    float _1301 = _1277;
    float _1303 = _1137;
    float _1305 = _1101;
    if (!_1295)
    {
        _1297 = _1277;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (!_1295)
    {
        _1299 = _1273;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (!_1295)
    {
        _1301 = _1283;
    }
    float _1315 = _1301;
    bool _1317 = !_1295;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1293 + _1323;
        float _1327 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1291);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = sin(_1339);
        float _1343 = _1337 + (-1.0);
        float _1345 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = fma(_1341, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1349 = fma(_1283, _1337, _1345);
        float _1351 = _1329 * _1347;
        float _1353 = fma(_1287, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1355 = fma(_1281, _1351, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1319 = _1349;
        _1309 = _1353;
        _1313 = _1355;
    }
    float _1357 = _1319;
    float _1359 = _1309;
    float _1361 = _1313;
    float _1363 = -_1091;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1367 = -_1093;
    float _1369 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1359);
    float _1371 = -_1115;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1361);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1377 = _1365 + _1375;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1381 = _1369 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1385 = _1373 + _1383;
    float _1387 = _1377 * _1377;
    float _1389 = fma(_1381, _1381, _1387);
    float _1391 = fma(_1385, _1385, _1389);
    float _1393 = rsqrt(_1391);
    float _1395 = sqrt(_1391);
    float _1397 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1399 = _1381 * _1397;
    float _1401 = _1385 * _1397;
    float _1403 = _1399 * _1399;
    float _1405 = _1401 * _1401;
    float _1407 = _1403 + _1405;
    float _1409 = sqrt(_1407);
    bool _1411 = _1409 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1415 = _1409 + _1413;
    float _1417 = _1281;
    float _1419 = _1415;
    float _1421 = _1399;
    float _1423 = _1401;
    float _1425 = _1403;
    float _1427 = _1405;
    if (_1411)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1417 = _1429;
    }
    float _1431 = _1417;
    if (_1411)
    {
        float _1433 = _1415 * _1431;
        _1419 = _1433;
    }
    float _1435 = _1419;
    if (_1411)
    {
        float _1437 = _1435 * 0.15915493667125701904296875;
        _1303 = _1437;
    }
    float _1439 = _1303;
    float _1441 = _1139;
    if (_1411)
    {
        float _1443 = _1439 * 6.283185482025146484375;
        float _1445 = sin(_1443);
        _1441 = _1445;
    }
    float _1447 = _1441;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1451 = precise::max(0.0, _1449);
    float _1453 = _1431;
    float _1455 = _1451;
    if (_1411)
    {
        float _1457 = _1439 * 6.283185482025146484375;
        float _1459 = cos(_1457);
        _1453 = _1459;
    }
    float _1461 = _1453;
    float _1463 = -_1397;
    float _1465 = -_1451;
    float _1467 = fma(_1377, _1463, _1465);
    float _1469 = _1449;
    if (_1411)
    {
        float _1471 = rsqrt(_1407);
        _1469 = _1471;
    }
    float _1473 = _1469;
    if (_1411)
    {
        float _1475 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1455 = _1475;
    }
    float _1477 = _1455;
    float _1479 = _1477;
    float _1481 = _1447;
    if (_1411)
    {
        float _1483 = fma(_1447, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1305 = _1483;
    }
    float _1485 = _1305;
    float _1487 = _1485;
    if (_1411)
    {
        float _1489 = _1461 + (-1.0);
        _1479 = _1489;
    }
    float _1491 = _1479;
    if (_1411)
    {
        float _1493 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1493;
    }
    float _1495 = _1481;
    float _1497 = _1473;
    if (_1411)
    {
        float _1499 = _1473 * _1485;
        _1487 = _1499;
    }
    float _1501 = _1487;
    if (!_1411)
    {
        _1497 = _1467;
    }
    float _1503 = _1497;
    float _1505 = _1503;
    if (_1411)
    {
        float _1507 = fma(_1467, _1461, _1495);
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1411)
    {
        float _1513 = _1399 * _1501;
        _1421 = _1513;
    }
    float _1515 = _1421;
    if (_1411)
    {
        float _1517 = _1401 * _1501;
        _1423 = _1517;
    }
    float _1519 = _1423;
    float _1521 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1523 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1521);
    float _1525 = precise::clamp(_1523, 0.0, 1.0);
    float _1527 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1511);
    if (_1411)
    {
        float _1529 = _1515 * _1515;
        _1425 = _1529;
    }
    float _1531 = _1425;
    if (_1411)
    {
        float _1533 = _1519 * _1519;
        _1427 = _1533;
    }
    float _1535 = _1427;
    float _1537 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1539 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1527);
    float _1541 = fma(_1509, _1509, _1531);
    float _1543 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1545 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1537);
    float _1547 = _1365 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1549 = _1541 + _1535;
    float _1551 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1543);
    float _1553 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1545);
    float _1555 = -_1525;
    float _1557 = _1555 + 1.0;
    float _1559 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1547);
    float _1561 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1551);
    float _1563 = rsqrt(_1549);
    float _1565 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1567 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1569 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1571 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1559);
    float _1573 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1577 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = abs(_1557);
    float _1581 = log2(_1579);
    float _1583 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1573);
    float _1585 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1587 = -_1577;
    float _1589 = fma(_1587, _1575, 1.0);
    float _1591 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1593 = _1563 * _1515;
    float _1595 = _1563 * _1509;
    float _1597 = _1563 * _1519;
    float _1599 = log2(_1589);
    float _1601 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1603 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1583);
    float _1605 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1591);
    float _1607 = _1595 + 1.0;
    float _1609 = -_1601;
    float _1611 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1609);
    float _1613 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1603);
    float _1615 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1617 = -_1597;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1611);
    float _1621 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1623 = 1.0 / _1613;
    float _1625 = fma(_1619, -0.5, 0.5);
    float _1627 = fma(_1619, 0.5, 0.5);
    float _1629 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1621);
    float _1631 = _1599 * 0.693147182464599609375;
    float _1633 = fma(_1627, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1635 = sqrt(_1625);
    float _1637 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1629);
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1641 = fma(_1627, _1633, -0.212114393711090087890625);
    float _1643 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1637);
    float _1645 = fma(_1627, _1641, 1.570728778839111328125);
    float _1647 = exp2(_1615);
    float _1649 = _1635 * 0.636619746685028076171875;
    float _1651 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1605);
    float _1653 = -_1645;
    float _1655 = fma(_1649, _1653, 1.0);
    float _1657 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1651);
    float _1659 = _1643 * _1623;
    float _1661 = -_1595;
    float _1663 = fma(_1647, _1607, _1661);
    float _1665 = _1657 * _1623;
    float _1667 = fma(_1659, 0.5, 0.5);
    float _1669 = fma(_1663, 0.5, 0.5);
    float _1671 = fma(_1665, -0.5, 0.5);
    float3 _4724 = float3(_1667, _1671, _1639);
    float _1673 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4724, float3(0.0), isnan(_4724)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4724, float3(0.0), isnan(_4724)), level(0.0)).x;
    float3 _4735 = float3(_1667, _1671, _1639);
    float4 _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4735, float3(0.0), isnan(_4735)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4735, float3(0.0), isnan(_4735)), level(0.0)).xyzw;
    float _1678 = _1676.x;
    float _1680 = _1676.y;
    float _1682 = _1676.z;
    float _1684 = _1676.w;
    float2 _4752 = float2(_1655, _1669);
    float3 _1688 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4752, float2(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4752, float2(0.0), isnan(_4752)), level(0.0)).xyz;
    float _1690 = _1688.x;
    float _1692 = _1688.y;
    float _1694 = _1688.z;
    float _1696 = in.m_59.y;
    float _1698 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _1700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1702 = isnan(0.5);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1708 = _1704 || _1706;
    float _1710 = in.m_49.w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1716 = in.m_59.x;
    bool _1718 = _739 > 0.5;
    float _1720 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1722 = 1.0 / _1714;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1734 = _1732 != 0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1738 = _729 + _1736;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1742 = _1740 != 0;
    float _1744 = -_1091;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _791);
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1750 = _1748 != 0;
    float _1752 = 1.0 / _1726;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1756 = _1754 != 0;
    float _1758 = -_1093;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _1762 = -_1696;
    float _1764 = _1762 + 1.0;
    float _1766 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1768 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1770 = isnan(_729);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    float _1780 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1782 = _1710 > 0.5;
    float _1784 = 1.0 / _1730;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1786;
    int _1790 = _1718 ? as_type<int>(_1764) : as_type<int>(_1696);
    float _1792 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1794 = _1718;
    bool _1796 = _1750;
    float _1798 = _1696;
    if (_1734)
    {
        bool _1800 = _148 > 0.5;
        _1794 = _1800;
    }
    bool _1802 = _1794;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1808 = _1750 ? as_type<float>(_1790) : _1696;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1810;
    float _1814 = _1812;
    if (_1742)
    {
        bool _1816 = _731 > 0.5;
        _1796 = _1816;
    }
    bool _1818 = _1796;
    float _1820 = _1806 * _1722;
    float _1822 = _1788 * _1752;
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1828 = _729 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1832 = _729 + _1830;
    float _1834 = _1822;
    if (_1756)
    {
        float _1836 = _1782 ? _1764 : _1696;
        _1798 = _1836;
    }
    float _1838 = _1798;
    float _1840 = _1812 * _1784;
    if (!_1734)
    {
        _1814 = _1716;
    }
    float _1842 = _1814;
    float _1844 = -_1720;
    float _1846 = _1197 * _1844;
    float _1848 = _1565 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1850 = fma(_1840, _1828, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1852 = fma(_1820, _1738, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1854 = fma(_1822, _1832, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1856 = _1842;
    if (!_1734)
    {
        _1834 = _1842;
    }
    float _1858 = _1834;
    float _1860 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1766);
    float _1862 = _1858;
    if (_1734)
    {
        _1856 = _1716;
    }
    float _1864 = _1856;
    float _1866 = -_1115;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    bool _1870 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1872 = isnan(_729);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1886 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1888 = isnan(_729);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_1778;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1882, _1808, -0.5);
    bool _1904 = _729 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1906 = isnan(_729);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1912 = _1908 || _1910;
    int _1914 = _1912 ? 1065353216 : 0;
    float _1916 = -_1880;
    float _1918 = _1916 + 1.0;
    float _1920 = _1896 * _1900;
    float _1922 = -_1896;
    float _1924 = _1922 + 1.0;
    float _1926 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1860);
    float _1928 = as_type<float>(_1914) * _1918;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = _1880 * _1924;
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1936 = _1850 * _1928;
    float _1938 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1940 = -_871;
    float _1942 = fma(_969, _1902, _1940);
    float _1944 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1946 = as_type<int>(_1884);
    int _1948 = _1914;
    float _1950 = _1864;
    if (_1734)
    {
        float _1952 = -_1864;
        float _1954 = _1952 + 1.0;
        _1946 = as_type<int>(_1954);
    }
    int _1956 = _1946;
    float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1960 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1938);
    float _1962 = fma(_1944, _1838, -0.5);
    float _1964 = -as_type<float>(_1914);
    float _1966 = _1964 + 1.0;
    float _1968 = as_type<float>(_1956);
    if (_1742)
    {
        float _1970 = -_1864;
        float _1972 = _1970 + 1.0;
        _1948 = as_type<int>(_1972);
    }
    int _1974 = _1948;
    float _1976 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1960);
    float _1978 = as_type<float>(_1974);
    if (_1734)
    {
        float _1980 = _1802 ? as_type<float>(_1956) : _1864;
        _1862 = _1980;
    }
    float _1982 = _1862;
    float _1984 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1936);
    float _1986 = 1.0 / _1934;
    float _1988 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1742)
    {
        float _1990 = _1818 ? as_type<float>(_1974) : _1864;
        _1950 = _1990;
    }
    float _1992 = _1950;
    float _1994 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1996 = _1992;
    if (!_1708)
    {
        _1968 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1998 = _1968;
    float _2000 = _1988 + _1934;
    float _2002 = fma(_1852, _1932, _1984);
    float _2004 = fma(_1994, _1982, -0.5);
    float _2006 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2008 = exp2(_1780);
    float _2010 = fma(_1854, _1920, _2002);
    float _2012 = fma(_1033, _2004, _1025);
    float _2014 = fma(_2006, _1992, -0.5);
    float _2016 = _1958;
    if (!_1708)
    {
        _1996 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2018 = _1996;
    float _2020 = fma(_1193, _1792, _1846);
    float _2022 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2010);
    float _2024 = _2000 * _1986;
    float _2026 = _2024 * 0.5;
    float _2028 = fma(_1035, _2014, _1041);
    if (!_1708)
    {
        float _2030 = -_2018;
        float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1045 = _2032;
    }
    float _2034 = _1045;
    if (!_1708)
    {
        float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2038 = fma(_2026, _1998, _2036);
        _2016 = _2038;
    }
    float _2040 = _2016;
    float _2042 = _1203 * _1720;
    float _2044 = _1213 * _1720;
    float _2046 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1848);
    float _2048 = _1982;
    if (!_1708)
    {
        float _2050 = 1.0 / _2040;
        _2048 = _2050;
    }
    float _2052 = _2048;
    float _2054 = fma(_1223, _1792, _2042);
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2058 = fma(_1241, _1792, _2044);
    float _2060 = fma(_1231, _1698, _2054);
    float _2062 = fma(_1215, _1698, _2020);
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2066 = _2034;
    if (!_1708)
    {
        float _2068 = 1.0 / _2034;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2074 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2080 = fma(_1567, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2046);
    float _2082 = -_2008;
    float _2084 = _2082 + 1.0;
    float _2086 = -_1043;
    float _2088 = fma(_1037, _1962, _2086);
    float _2090 = _2052;
    if (!_1708)
    {
        float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2094 = -_2018;
        float _2096 = fma(_2052, _2092, _2094);
        _2090 = _2096;
    }
    float _2098 = _2090;
    float _2100 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2102 = _2060 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2104 = fma(_1249, _1698, _2058);
    float _2106 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2072);
    float _2108 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2100);
    float _2110 = fma(_2062, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2102);
    float _2112 = _2098;
    if (_1708)
    {
        _1978 = 1.0;
    }
    float _2114 = _1978;
    float _2116 = _2114;
    if (!_1708)
    {
        float _2118 = _2098 * _2070;
        float _2120 = precise::clamp(_2118, 0.0, 1.0);
        _2112 = _2120;
    }
    float _2122 = _2112;
    float _2124 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2080);
    float _2126 = _2088 + 0.5;
    if (!_1708)
    {
        float _2128 = -_2122;
        float _2130 = _2128 + 1.0;
        _2116 = _2130;
    }
    float _2132 = _2116;
    float _2134 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2106);
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2108);
    float _2140 = _2012 + 0.5;
    float _2142 = fma(_2104, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2110);
    float _2144 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2146 = _2132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2150 = _2124 + _2148;
    float _2152 = _1942 + 0.5;
    float _2154 = _2028 + 0.5;
    out.m_61.x = _2074;
    out.m_61.y = _2144;
    out.m_61.z = _2076;
    out.m_61.w = _2078;
    bool _2156 = _2132 > 0.0;
    bool _2158 = isnan(_2132);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.0);
    bool _2164 = _2160 || _2162;
    float _2166 = _360 * _2146;
    float _2168 = _1613 + _2150;
    out.m_63.x = _2134;
    out.m_63.y = _2138;
    out.m_63.z = _2142;
    float _2170 = _2166 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2172 = _2168 * 0.5;
    out.m_65.x = _1381;
    out.m_65.y = _1377;
    out.m_65.z = _1385;
    out.m_67.x = _2140;
    out.m_67.y = _2152;
    out.m_67.z = _2154;
    out.m_67.w = _2126;
    float _2174 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.y = _1365;
    out.gl_Position.x = _1643;
    out.gl_Position.y = _1657;
    out.gl_Position.z = _2150;
    out.gl_Position.w = _1613;
    out.m_71.z = _2172;
    out.m_71.w = _1613;
    out.m_45.x = _2170;
    float _2176 = _2174 * _1673;
    float _2178 = -_2174;
    float _2180 = _2178 + 1.0;
    float _2182 = _1684 * _2176;
    float _2184 = _1694 * _2176;
    float _2186 = _1684 * _2180;
    float _2188 = fma(_1690, _2182, _1678);
    float _2190 = fma(_1692, _2182, _1680);
    float _2192 = fma(_1684, _2184, _1682);
    out.m_73.x = _2188;
    out.m_73.y = _2190;
    out.m_73.z = _2192;
    out.m_73.w = _2186;
    if (_2164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2194 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2194;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

