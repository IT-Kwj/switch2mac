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
    float4 m_61 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
    bool _518 = false;
    bool _382 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2693 = as_type<float>(_112);
        out.gl_Position.z = _2693;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    if (_126)
    {
        float _134 = float(_96);
        _132 = _134;
    }
    float _136 = _132;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    if (_142)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _106;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2761 = as_type<float>(_148);
        out.gl_Position.z = _2761;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_51.y;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _154 * _152;
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = _174 * 6.283185482025146484375;
    float _184 = floor(_174);
    float _186 = _182 * 0.15915493667125701904296875;
    float _188 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = 0.0;
    float _192 = _188;
    if (!_166)
    {
        float _194 = _188 * _188;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = _198;
    if (!_166)
    {
        float _206 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = -_184;
    float _212 = _174 + _210;
    bool _214 = !_166;
    float _216 = _208;
    float _218 = _156;
    if (!_214)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _188 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _188);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _248;
    }
    float _250 = _216;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _188 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _192 = _272;
    }
    float _274 = _192;
    float _276 = in.m_53.w;
    float _278 = in.m_42.x;
    float _280 = in.m_42.y;
    float _282 = in.m_42.z;
    bool _284 = _212 < 0.5;
    float _286 = float(_284);
    float _288 = -_212;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _298 = _296 != 0;
    float _300 = fma(_202, 0.5, 0.5);
    out.m_55.y = _156;
    float _302 = -_286;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_294;
    int _310 = _308 ? 0 : 1;
    float _312 = -_300;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _316 = !_170;
    int _318 = _316 ? 0 : 1;
    float _320 = fma(_274, _176, _306);
    int _322 = abs(_310);
    int _324 = abs(_318);
    bool _326 = !_298;
    int _328 = _326 ? 0 : 1;
    float _330 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = fma(_274, _178, _330);
    float _338 = float(_322);
    float _340 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _342 = float(_324);
    float _344 = fma(_320, _276, _278);
    float _346 = abs(_290);
    float _348 = _338 * _346;
    float _350 = fma(_274, _180, _340);
    float _352 = fma(_336, _276, _280);
    float _354 = float(_334);
    float _356 = fma(_342, _314, _348);
    float _358 = fma(_350, _276, _282);
    float _360 = abs(_304);
    float _362 = fma(_354, _360, _356);
    bool _364 = !_332;
    float _380;
    if (!_364)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _368 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _372 = _370 * _366;
        float _374 = floor(_372);
        float _376 = -_374;
        float _378 = _372 + _376;
        _380 = _378;
        _382 = true;
    }
    else
    {
        float _384 = float(_96);
        float _386 = 1.0 / _384;
        float _388 = _130 * _386;
        _380 = _388;
    }
    _382 = false;
    float _390 = _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = _390 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _396;
    float _400 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _402 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_390);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    bool _414 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _416 = isnan(_390);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _398;
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _430 = -_424;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _394 * _426;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = in.m_53.x;
    float _446 = in.m_53.y;
    float _448 = in.m_53.z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _450;
    float _454 = _400 * _150;
    float _456 = _412 * _432;
    float _458 = fma(_436, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = fma(_442, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _462 = fma(_452, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _464 = -_412;
    float _466 = _464 + 1.0;
    float _468 = trunc(_454);
    int _470 = int(_468);
    float _472 = _458 * _456;
    float _474 = _460 * _456;
    float _476 = _462 * _456;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _480 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _484 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].x, _478);
    float _486 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].y, _480);
    float _488 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].z, _482);
    float _490 = _484 * _444;
    float _492 = _486 * _446;
    float _494 = _488 * _448;
    int _496 = _470 << 4;
    int _498 = _496 + 1712;
    bool _500 = !_428;
    float _516;
    if (!_500)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_96);
        float _522 = 1.0 / _520;
        float _524 = _130 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    uint _529 = uint(int(uint(_498) >> uint(2)));
    uint _531 = uint(int(uint(int(_529)) >> uint(2)));
    int _533 = int(_529) & 3;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[int(_531)][_533];
    int _537 = int(_529) + 1;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    int _541 = _537 & 3;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[int(_539)][_541];
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _526 + _545;
    bool _549 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_526);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _565 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_526);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    int _577 = _498 + 8;
    uint _579 = uint(int(uint(_577) >> uint(2)));
    uint _581 = uint(int(uint(int(_579)) >> uint(2)));
    int _583 = int(_579) & 3;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[int(_581)][_583];
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _587;
    float _591 = -_559;
    float _593 = _591 + 1.0;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _597 = 1.0 / _563;
    float _599 = _589 * _597;
    float _601 = fma(_599, _547, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _603 = _575 * _593;
    float _605 = -_575;
    float _607 = _605 + 1.0;
    float _609 = _601 * _603;
    float _611 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[115].x, _609);
    float _613 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[116].x, _611);
    float _615 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _617 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _625 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _629 = !_595;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _633 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_96);
        float _651 = 1.0 / _649;
        float _653 = _130 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_49.z;
    float _659 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _661 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _663 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = in.m_49.y;
    float _667 = _150 * 2.0;
    float _669 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    float _671 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    float _673 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _661);
    float _675 = floor(_667);
    float _677 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _669);
    float _679 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _681 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _673);
    float _683 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _691 = _679 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _695 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = _689 + _697;
    float _701 = _657 * 2.0;
    float _703 = _150 + _657;
    bool _705 = _675 > 0.0;
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _709 = _691 + _707;
    float _711 = _665 + _657;
    bool _713 = _675 >= 0.0;
    bool _715 = isnan(_675);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = floor(_701);
    float _725 = _703 + (-1.0);
    float _727 = _711 + (-1.0);
    float _729 = _130 * _687;
    float _731 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _733 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _737 = _150 + _665;
    float _739 = _665 * 2.0;
    float _741 = exp2(_729);
    float _743 = _737 + (-1.0);
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _747 = _723 > 0.0;
    float _749 = floor(_739);
    bool _751 = _723 >= 0.0;
    bool _753 = isnan(_723);
    bool _755 = _751 || _753;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _683 + _761;
    int _765 = _721 ? 0 : 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _777 = _775 != 0;
    int _779 = ~_765;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    float _785 = -_741;
    float _787 = _785 + 1.0;
    int _789 = _783;
    if (!_705)
    {
        int _791 = ~_765;
        int _793 = _791 + 1;
        _789 = _793;
    }
    int _795 = _789;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _799 = 1.0 + _797;
    bool _801 = !_773;
    int _803 = _801 ? 0 : 1;
    float _805 = float(_795);
    float _807 = 1.0 / _799;
    int _809 = abs(_803);
    float _811 = in.m_57.x;
    float _813 = in.m_57.y;
    float _815 = in.m_57.z;
    bool _817 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _819 = isnan(0.0);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _825 = _821 || _823;
    float _827 = float(_809);
    bool _829 = _749 > 0.0;
    bool _831 = _749 >= 0.0;
    bool _833 = isnan(_749);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _699 * _699;
    float _843 = _827 * _805;
    float _845 = _825 ? _787 : 0.0;
    float _847 = fma(_763, _763, _841);
    float _849 = _843 * (-2.0);
    int _851 = _759 ? 0 : 1;
    float _853 = _845 * _807;
    bool _855 = !_769;
    int _857 = _855 ? 0 : 1;
    float _859 = fma(_735, _849, _735);
    float _861 = fma(_709, _709, _847);
    bool _863 = !_777;
    int _865 = _863 ? 0 : 1;
    int _867 = ~_851;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = rsqrt(_861);
    int _875 = abs(_857);
    float _877 = fma(_849, _813, _813);
    float _879 = _665 + (-0.5);
    int _881 = _871;
    if (!_747)
    {
        int _883 = ~_851;
        int _885 = _883 + 1;
        _881 = _885;
    }
    int _887 = _881;
    int _889 = _839 ? 0 : 1;
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[196].y, _877);
    int _893 = abs(_865);
    int _895 = ~_889;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = _899;
    if (!_829)
    {
        int _903 = ~_889;
        int _905 = _903 + 1;
        _901 = _905;
    }
    int _907 = _901;
    float _909 = _699 * _873;
    float _911 = float(_875);
    float _913 = _763 * _873;
    float _915 = float(_887);
    float _917 = -_909;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _921 = float(_893);
    float _923 = -_913;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    float _927 = float(_907);
    float _929 = _911 * _915;
    bool _931 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(1.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = _709 * _873;
    float _943 = _921 * _927;
    float _945 = _929 * (-2.0);
    bool _947 = !_939;
    float _949 = _947 ? _130 : _853;
    float _951 = _150 + (-0.5);
    float _953 = _943 * (-2.0);
    float _955 = fma(_945, _811, _811);
    float _957 = fma(_745, _945, _745);
    float _959 = fma(_949, _859, _891);
    float _961 = fma(_953, _815, _815);
    float _963 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[196].x, _955);
    float _965 = _657 + (-0.5);
    float _967 = _959 * 0.15915493667125701904296875;
    float _969 = _919 * _919;
    float _971 = fma(_733, _953, _733);
    float _973 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _975 = -_941;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _979 = fma(_925, _925, _969);
    float _981 = fma(_949, _957, _963);
    float _983 = fma(_949, _971, _973);
    float _985 = _967 * 6.283185482025146484375;
    float _987 = sin(_985);
    float _989 = fma(_977, _977, _979);
    float _991 = _981 * 0.15915493667125701904296875;
    float _993 = _983 * 0.15915493667125701904296875;
    float _995 = in.m_59.x;
    float _997 = in.m_59.y;
    float _999 = in.m_59.z;
    float _1001 = sqrt(_989);
    float _1003 = _967 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = _991 * 6.283185482025146484375;
    float _1009 = sin(_1007);
    float _1011 = _873 * _1001;
    float _1013 = _693 * _1011;
    float _1015 = _695 * _1011;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _995);
    float _1019 = _991 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _731 * _1011;
    float _1025 = _1015 * _1017;
    float _1027 = _993 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _1009 * _1005;
    float _1033 = _1009 * _987;
    float _1035 = fma(_130, 0.01200000010430812835693359375, _150);
    float _1037 = _993 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1021 * _987;
    float _1043 = _1021 * _1005;
    float _1045 = -_1041;
    float _1047 = fma(_1029, _1031, _1045);
    float _1049 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _997);
    float _1051 = -_1031;
    float _1053 = fma(_1029, _1041, _1051);
    float _1055 = fma(_1029, _1043, _1033);
    float _1057 = floor(_1035);
    float _1059 = _1013 * _1049;
    float _1061 = fma(_1029, _1033, _1043);
    float _1063 = _1021 * _1039;
    float _1065 = _1009 * _1039;
    float _1067 = _1005 * _1039;
    float _1069 = _987 * _1039;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _999);
    float _1073 = _1063 * _1059;
    float _1075 = -_1059;
    float _1077 = _1029 * _1075;
    float _1079 = _1023 * _1071;
    float _1081 = fma(_1055, _1025, _1073);
    float _1083 = _1065 * _1059;
    float _1085 = fma(_1067, _1025, _1077);
    float _1087 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1089 = fma(_1053, _1079, _1081);
    float _1091 = fma(_1047, _1025, _1083);
    float _1093 = fma(_1069, _1079, _1085);
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1097 = fma(_1061, _1079, _1091);
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1103 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1095);
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1099);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1101);
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1103);
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1107);
    float _1115 = _691 + _1109;
    float _1117 = _683 + _1111;
    float _1119 = _689 + _1113;
    float _1121 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1115);
    float _1123 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1117);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1119);
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1121 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1133 = _1123 + _1131;
    float _1135 = _1129 * _1129;
    float _1137 = fma(_1133, _1133, _1135);
    float _1139 = sqrt(_1137);
    bool _1141 = _1139 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1145 = _1143 != 0;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1149;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1135;
    float _1165 = _1119;
    float _1167 = _1123;
    float _1169 = _1125;
    float _1171 = _919;
    if (!_1141)
    {
        _1163 = _1123;
    }
    float _1173 = _1163;
    bool _1175 = !_1145;
    int _1177 = _1175 ? 0 : 1;
    bool _1179 = !_1153;
    int _1181 = _1179 ? 0 : 1;
    bool _1183 = !_1157;
    float _1185 = _1183 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1187 = _1173;
    float _1189 = _1185;
    if (!_1141)
    {
        _1165 = _1121;
    }
    float _1191 = _1165;
    float _1193 = _1191;
    if (!_1141)
    {
        _1167 = _1125;
    }
    float _1195 = _1167;
    bool _1197 = !_1141;
    float _1199 = _1195;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1205 = _1139 + _1203;
        float _1207 = rsqrt(_1137);
        float _1209 = _1205 * _1201;
        float _1211 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1213 = _1209 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = fma(_1221, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = fma(_1125, _1217, _1225);
        float _1231 = _1207 * _1227;
        float _1233 = fma(_1133, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1129, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1199 = _1229;
        _1187 = _1233;
        _1193 = _1235;
    }
    float _1237 = _1199;
    float _1239 = _1187;
    float _1241 = _1193;
    float _1243 = -_909;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1237);
    float _1247 = -_913;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1251 = -_941;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1257 = _1245 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1261 = _1249 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1265 = _1253 + _1263;
    float _1267 = _1257 * _1257;
    float _1269 = fma(_1261, _1261, _1267);
    float _1271 = fma(_1265, _1265, _1269);
    float _1273 = rsqrt(_1271);
    float _1275 = sqrt(_1271);
    float _1277 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1279 = _1261 * _1277;
    float _1281 = _1265 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 + _1285;
    float _1289 = sqrt(_1287);
    bool _1291 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1289 + _1293;
    float _1297 = _1269;
    float _1299 = _1287;
    float _1301 = _1295;
    float _1303 = _1257;
    if (_1291)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1305;
    }
    float _1307 = _1297;
    if (_1291)
    {
        float _1309 = rsqrt(_1287);
        _1299 = _1309;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (_1291)
    {
        float _1315 = _1295 * _1307;
        _1301 = _1315;
    }
    float _1317 = _1301;
    if (_1291)
    {
        float _1319 = _1317 * 0.15915493667125701904296875;
        _1169 = _1319;
    }
    float _1321 = _1169;
    float _1323 = _1265;
    float _1325 = _1321;
    if (_1291)
    {
        float _1327 = _1321 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        _1323 = _1329;
    }
    float _1331 = _1323;
    float _1333 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1335 = precise::max(0.0, _1333);
    float _1337 = _1307;
    float _1339 = _1335;
    if (_1291)
    {
        float _1341 = _1321 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        _1337 = _1343;
    }
    float _1345 = _1337;
    float _1347 = -_1277;
    float _1349 = -_1335;
    float _1351 = fma(_1257, _1347, _1349);
    if (_1291)
    {
        float _1353 = _1351 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1303 = _1353;
    }
    float _1355 = _1303;
    float _1357 = _1355;
    float _1359 = _1331;
    if (_1291)
    {
        float _1361 = fma(_1331, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1363;
    if (!_1291)
    {
        _1359 = _1279;
    }
    float _1367 = _1359;
    float _1369 = _1367;
    float _1371 = _1345;
    if (_1291)
    {
        float _1373 = _1345 + (-1.0);
        _1339 = _1373;
    }
    float _1375 = _1339;
    float _1377 = _1375;
    if (_1291)
    {
        float _1379 = _1311 * _1363;
        _1171 = _1379;
    }
    float _1381 = _1171;
    if (!_1291)
    {
        _1365 = _1351;
    }
    float _1383 = _1365;
    float _1385 = _1383;
    if (_1291)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1387;
    }
    float _1389 = _1325;
    if (_1291)
    {
        float _1391 = _1279 * _1381;
        _1369 = _1391;
    }
    float _1393 = _1369;
    if (!_1291)
    {
        _1377 = _1281;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1291)
    {
        float _1399 = _1281 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (!_1291)
    {
        _1313 = _1283;
    }
    float _1403 = _1313;
    float _1405 = _1403;
    if (_1291)
    {
        float _1407 = fma(_1351, _1345, _1389);
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (_1291)
    {
        float _1411 = _1393 * _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1291)
    {
        _1371 = _1285;
    }
    float _1415 = _1371;
    float _1417 = _1415;
    if (_1291)
    {
        float _1419 = _1401 * _1401;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1427 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = _1423 + _1421;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1433 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1431);
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1439 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1425);
    float _1441 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = -_1435;
    float _1445 = _1443 + 1.0;
    float _1447 = rsqrt(_1429);
    float _1449 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1437);
    float _1451 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1453 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1455 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1457 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1449);
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1461 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1453);
    float _1463 = abs(_1445);
    float _1465 = log2(_1463);
    float _1467 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1473 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1477 = -_1469;
    float _1479 = fma(_1477, _1455, 1.0);
    float _1481 = _1447 * _1393;
    float _1483 = _1447 * _1409;
    float _1485 = _1447 * _1401;
    float _1487 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1473);
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1475);
    float _1493 = log2(_1479);
    float _1495 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = -_1489;
    float _1499 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1497);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1491);
    float _1503 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1505 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1507 = -_1485;
    float _1509 = fma(_1507, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1499);
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1513 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1515 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1505);
    float _1517 = fma(_1509, -0.5, 0.5);
    float _1519 = exp2(_1503);
    float _1521 = fma(_1509, 0.5, 0.5);
    float _1523 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1513);
    float _1525 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1515);
    float _1527 = _1483 + 1.0;
    float _1529 = fma(_1521, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1531 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1523);
    float _1533 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1525);
    float _1535 = sqrt(_1517);
    float _1537 = fma(_1521, _1529, -0.212114393711090087890625);
    float _1539 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1541 = _1493 * 0.693147182464599609375;
    float _1543 = fma(_1521, _1537, 1.570728778839111328125);
    float _1545 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1547 = 1.0 / _1511;
    float _1549 = -_1483;
    float _1551 = fma(_1519, _1527, _1549);
    float _1553 = _1535 * 0.636619746685028076171875;
    float _1555 = _1539 * _1547;
    float _1557 = _1533 * _1547;
    float _1559 = -_1543;
    float _1561 = fma(_1553, _1559, 1.0);
    float _1563 = fma(_1551, 0.5, 0.5);
    float _1565 = fma(_1555, 0.5, 0.5);
    float _1567 = fma(_1557, -0.5, 0.5);
    float3 _4950 = float3(_1565, _1567, _1545);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4950, float3(0.0), isnan(_4950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4950, float3(0.0), isnan(_4950)), level(0.0)).x;
    float3 _4961 = float3(_1565, _1567, _1545);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4961, float3(0.0), isnan(_4961)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4961, float3(0.0), isnan(_4961)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4978 = float2(_1561, _1563);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4978, float2(0.0), isnan(_4978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4978, float2(0.0), isnan(_4978)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1594 = int(_1592);
    out.m_61.x = _619;
    out.m_61.y = _621;
    out.m_61.z = _627;
    out.m_61.w = _625;
    bool _1596 = _665 > 0.5;
    float _1598 = -_909;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1604 = _1602 != 0;
    float _1606 = -_913;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    bool _1610 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1612 = isnan(0.5);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1618 = _1614 || _1616;
    float _1620 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1622 = int(_1620);
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1626 = _1624 != 0;
    float _1628 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1630 = -_941;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1636 = _1634 != 0;
    float _1638 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1628);
    float _1640 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1642 = float(_1594);
    float _1644 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1638);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1650 = 1.0 / _1642;
    float _1652 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1654 = float(uint(_1622));
    float _1656 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1658 = ~_1622;
    int _1660 = _1658 + 1;
    float _1662 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1664 = float(_1622);
    float _1666 = 1.0 / _1654;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1670 = _1668 != 0;
    float _1672 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1662);
    out.m_63.y = _1013;
    float _1674 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1672);
    float _1676 = _130 * _1650;
    float _1678 = 1.0 / _1648;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1682 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1686 = _1684 != 0;
    out.m_65.x = _1249;
    out.m_65.y = _1245;
    out.m_65.z = _1253;
    float _1688 = float(_96);
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1692 = as_type<int>(_1666) + (-2);
    float _1694 = trunc(_1676);
    int _1696 = int(_1694);
    bool _1698 = !_1686;
    float _1700 = _1698 ? 1.2345600128173828125 : 1.0;
    bool _1702 = !_1686;
    float _1704 = _1702 ? _665 : _150;
    float _1706 = _1700 * _1704;
    float _1708 = 1.0 / _1688;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1712 = float(uint(_1696));
    float _1714 = float(_1696);
    float _1716 = floor(_1706);
    float _1718 = as_type<float>(_1692) * _1712;
    float _1720 = in.m_49.w;
    float _1722 = trunc(_1718);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    float _1728 = -_1716;
    float _1730 = _1706 + _1728;
    float _1732 = exp2(_1656);
    int _1734 = _1660 * int(_1726);
    int _1736 = _1734 + _1696;
    float _1738 = float(uint(_1736));
    float _1740 = -_156;
    float _1742 = _1740 + 1.0;
    float _1744 = -_1732;
    float _1746 = _1744 + 1.0;
    float _1748 = as_type<float>(_1692) * _1738;
    int _1750 = _1596 ? as_type<int>(_1742) : as_type<int>(_156);
    bool _1752 = _1720 > 0.5;
    float _1754 = trunc(_1748);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = _1626 ? as_type<float>(_1750) : _156;
    float _1762 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1764 = _1604;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (_1604)
    {
        float _1768 = _1752 ? _1742 : _156;
        _218 = _1768;
    }
    float _1770 = _218;
    int _1772 = ~_1622;
    int _1774 = _1772 + 1;
    int _1776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1778 = _1776 != 0;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1636)
    {
        bool _1782 = _150 > 0.5;
        _1764 = _1782;
    }
    bool _1784 = _1764;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1788 = _1786 != 0;
    float _1790 = -_1780;
    float _1792 = fma(_1640, 2.0, _1790);
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1796 = int(_1726) + int(_1758);
    float _1798 = as_type<float>(_1758);
    float _1800 = _1794;
    if (!_1686)
    {
        _1798 = _665;
    }
    float _1802 = _1798;
    float _1804 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1794);
    float _1806 = _1802;
    if (!_1686)
    {
        _1800 = _657;
    }
    float _1808 = _1800;
    int _1810 = _1774 * _1796;
    int _1812 = _1810 + _1696;
    float _1814 = _1808;
    if (!_1686)
    {
        _1766 = _657;
    }
    float _1816 = _1766;
    float _1818 = -_130;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1792);
    float _1822 = _1816;
    if (_1686)
    {
        _1806 = _150;
    }
    float _1824 = _1806;
    if (_1686)
    {
        _1814 = _665;
    }
    float _1826 = _1814;
    if (_1686)
    {
        _1822 = _665;
    }
    float _1828 = _1822;
    bool _1830 = uint(_1812) >= uint(_1622);
    bool _1832 = _1714 >= _1664;
    bool _1834 = isnan(_1714);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan(_1664);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _665 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1848 = !_1830;
    int _1850 = _1848 ? 0 : (-1);
    float _1852 = fma(_1844, -2.0, _1710);
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1858 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1846);
    bool _1860 = _1830;
    if (_1778)
    {
        bool _1862 = _657 > 0.5;
        _1860 = _1862;
    }
    bool _1864 = _1860;
    float _1866 = trunc(_1842);
    int _1868 = int(_1866);
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1870;
    float _1874 = _130 * _1664;
    int _1876 = ~_1796;
    int _1878 = _1876 + _1850;
    int _1880 = _1878 + 1;
    float _1882 = _1872 * _1678;
    float _1884 = _1664 * _1730;
    float _1886 = _1874 * _1708;
    float _1888 = 1.0 / _1856;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1894 = _1622 * _1880;
    int _1896 = _1894 + _1696;
    bool _1898 = !_1670;
    int _1900 = _1898 ? 0 : 1;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1904 = _655 + _1902;
    bool _1906 = _1622 == 0;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1908;
    float _1912 = 1.0 / _1892;
    int _1914 = ~_1868;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1852);
    bool _1922 = !_1906;
    int _1924 = _1922 ? _1896 : (-1);
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1930 = _1622 + (-1);
    float _1932 = in.m_51.x;
    int _1934 = abs(_1900);
    float _1936 = trunc(_1884);
    int _1938 = int(_1936);
    float _1940 = _1910 * _1888;
    float _1942 = fma(_1882, _1904, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1944 = _1918 * _1924;
    int _1946 = abs(_1161);
    int _1948 = _1868 * _1930;
    int _1950 = _1948 + _1944;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1956 = _655 + _1954;
    float _1958 = _1928 * _1912;
    int _1960 = abs(_1177);
    int _1962 = _1950 * _1946;
    float _1964 = fma(_1940, _1956, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1968 = _655 + _1966;
    int _1970 = abs(as_type<int>(_1185));
    float _1972 = trunc(_1886);
    int _1974 = int(_1972);
    int _1976 = _1938 * _1934;
    int _1978 = _1976 + _1696;
    int _1980 = abs(_1181);
    float _1982 = fma(_1958, _1968, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1984 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1986 = ~_1622;
    int _1988 = _1986 + 1;
    int _1990 = as_type<int>(_1910);
    float _1992 = _1932;
    if (_1778)
    {
        float _1994 = -_1932;
        float _1996 = _1994 + 1.0;
        _1990 = as_type<int>(_1996);
    }
    int _1998 = _1990;
    float _2000 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2004 = as_type<int>(_2002);
    if (!_1636)
    {
        _1189 = _1932;
    }
    float _2006 = _1189;
    int _2008 = _1974 * _1960;
    int _2010 = _2008 + _1962;
    float _2012 = fma(_2000, _1760, -0.5);
    bool _2014 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2016 = isnan(_655);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2022 = _2018 || _2020;
    float _2024 = float(_2022);
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2028 = _1978 * _1980;
    int _2030 = _2028 + _2010;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2034 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1858);
    bool _2036 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2038 = isnan(_655);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    int _2048 = _1938 * _1970;
    int _2050 = _2048 + _2030;
    float _2052 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2032);
    float _2054 = -_1920;
    float _2056 = fma(_2034, _2012, _2054);
    bool _2058 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2060 = isnan(_655);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2066);
    float _2070 = -_2024;
    float _2072 = _2070 + 1.0;
    float _2074 = float(uint(_2050));
    bool _2076 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2078 = isnan(_655);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = _2068 * _2072;
    float _2090 = as_type<float>(_1692) * _2074;
    float _2092 = -_2068;
    float _2094 = _2092 + 1.0;
    float _2096 = -_2086;
    float _2098 = _2096 + 1.0;
    float _2100 = trunc(_2090);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2108 = _2046 * _2098;
    float _2110 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2112 = _2086 * _2094;
    float _2114 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2106);
    float _2116 = -_2046;
    float _2118 = _2116 + 1.0;
    float _2120 = -_2002;
    float _2122 = fma(_2110, 2.0, _2120);
    float _2124 = _1942 * _2108;
    float _2126 = fma(_1984, -2.0, _2026);
    float _2128 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2114);
    float _2130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2052);
    float _2134 = _2006;
    if (_1636)
    {
        float _2136 = -_1932;
        float _2138 = _2136 + 1.0;
        _2004 = as_type<int>(_2138);
    }
    int _2140 = _2004;
    int _2142 = _1988 * int(_2104);
    int _2144 = _2142 + _2050;
    if (_1636)
    {
        float _2146 = _1784 ? as_type<float>(_2140) : _1932;
        _2134 = _2146;
    }
    float _2148 = _2134;
    float _2150 = float(uint(_2144));
    float _2152 = fma((*spvDescriptorSet0.vp_c9)._m0[85].y, _1770, -0.5);
    float _2154 = float(uint(_1978));
    if (_1778)
    {
        float _2156 = _1864 ? as_type<float>(_1998) : _1932;
        _1992 = _2156;
    }
    float _2158 = _1992;
    float _2160 = as_type<float>(_1692) * _2150;
    float _2162 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2124);
    float _2164 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1804);
    float _2166 = as_type<float>(_1692) * _2154;
    float _2168 = trunc(_2160);
    float _2170 = precise::max(_2168, 0.0);
    uint _2172 = uint(_2170);
    float _2174 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2126);
    float _2176 = -_130;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    int _2180 = ~_1622;
    int _2182 = _2180 + 1;
    float _2184 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2186 = -_2174;
    float _2188 = fma(_2132, _2152, _2186);
    float _2190 = fma(_1982, _2112, _2162);
    float _2192 = trunc(_2166);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = fma(_2184, _2148, -0.5);
    int _2200 = ~_1622;
    int _2202 = _2200 + 1;
    float _2204 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2206 = fma(_1964, _2088, _2190);
    float _2208 = fma(_2164, _2198, _1820);
    float _2210 = fma(_2128, _2204, _2178);
    int _2212 = int(_2104) + int(_2172);
    float _2214 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2206);
    float _2216 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2218 = _2188 + 0.5;
    float _2220 = _2208 + 0.5;
    int _2222 = _2182 * _2212;
    int _2224 = _2222 + _2050;
    float _2226 = _995 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2228 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2216);
    int _2230 = _2202 * int(_2196);
    int _2232 = _2230 + _1978;
    float _2234 = _997 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2236 = uint(_2224) >= uint(_1622);
    float _2238 = _2214 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2240 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2228);
    float _2242 = float(uint(_2232));
    float _2244 = -_2234;
    float _2246 = _1029 * _2244;
    bool _2248 = !_2236;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2254 = _1063 * _2234;
    float _2256 = as_type<float>(_1692) * _2242;
    int _2258 = ~_2212;
    int _2260 = _2258 + _2250;
    int _2262 = _2260 + 1;
    float _2264 = _2056 + 0.5;
    float _2266 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2268 = _2210 + 0.5;
    float _2270 = trunc(_2256);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    int _2276 = _1622 * _2262;
    int _2278 = _2276 + _2050;
    float _2280 = _1065 * _2234;
    out.m_67.x = _2220;
    out.m_67.y = _2264;
    out.m_67.z = _2268;
    out.m_67.w = _2218;
    float _2282 = _2252 + _2266;
    bool _2284 = !_1906;
    int _2286 = _2284 ? _2278 : (-1);
    float _2288 = 1.0 / _2266;
    float _2290 = fma(_1067, _2226, _2246);
    float _2292 = _2210;
    float _2294 = _2220;
    if (!_1618)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2296 = _2292;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2300 = _2286 >> 31;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2304 = _2286 & 3;
    bool _2306 = _2304 != 0;
    float _2308 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2310 = int(_2196) + int(_2274);
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2314 = _2300 & 3;
    float _2316 = fma(_1055, _2226, _2254);
    int _2318 = ~_1622;
    int _2320 = _2318 + 1;
    float _2322 = fma(_1047, _2226, _2280);
    int _2324 = _2286 + _2314;
    out.m_69.x = _2308;
    out.m_69.y = _2312;
    out.m_69.z = _1690;
    out.m_69.w = _2238;
    float _2326 = _2282 * _2288;
    float _2328 = _2326 * 0.5;
    int _2330 = _2320 * _2310;
    int _2332 = _2330 + _1978;
    int _2334 = _2324 >> 2;
    float _2336 = fma(_1053, _1652, _2316);
    float _2338 = as_type<float>(_2324);
    float _2340 = _2312;
    if (!_1618)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2344 = fma(_2328, _2296, _2342);
        _2294 = _2344;
    }
    float _2346 = _2294;
    if (!_1618)
    {
        _2338 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2348 = _2338;
    float _2350 = fma(_1069, _1652, _2290);
    int _2352 = _2334 << 4;
    int _2354 = _2352 + 512;
    float _2356 = _2218;
    if (!_1618)
    {
        float _2358 = 1.0 / _2346;
        _2356 = _2358;
    }
    float _2360 = _2356;
    bool _2362 = uint(_2332) >= uint(_1622);
    float _2364 = fma(_1061, _1652, _2322);
    uint _2366 = uint(int(uint(_2354) >> uint(2)));
    uint _2368 = uint(int(uint(int(_2366)) >> uint(2)));
    int _2370 = int(_2366) & 3;
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[int(_2368)][_2370];
    int _2374 = int(_2366) + 1;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    int _2378 = _2374 & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = _2286 & 3;
    if (!_1618)
    {
        float _2384 = -_2348;
        float _2386 = _2384 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2340 = _2386;
    }
    float _2388 = _2340;
    bool _2390 = !_2362;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2396 = uint(_2382) > 1u;
    float _2398 = _1690;
    float _2400 = _2388;
    if (!_1618)
    {
        float _2402 = 1.0 / _2388;
        _2398 = _2402;
    }
    float _2404 = _2398;
    bool _2406 = _2382 != 3;
    int _2408 = _2354 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    float _2426 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2394);
    int _2428 = ~_2310;
    int _2430 = _2428 + _2392;
    int _2432 = _2430 + 1;
    float _2434 = _1762 * _1569;
    bool _2436 = uint(_2382) >= 2u;
    float _2438 = _2360;
    if (!_1618)
    {
        float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2442 = -_2348;
        float _2444 = fma(_2360, _2440, _2442);
        _2438 = _2444;
    }
    float _2446 = _2438;
    float _2448 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2450 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2452 = !_2306;
    int _2454 = _2452 ? 0 : 1;
    int _2456 = _1622 * _2432;
    int _2458 = _2456 + _1978;
    float _2460 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2448);
    float _2462 = _2448;
    if (_1618)
    {
        _2462 = 1.0;
    }
    float _2464 = _2462;
    float _2466 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2450);
    float _2468 = -_1762;
    float _2470 = _2468 + 1.0;
    float _2472 = _2464;
    if (!_1618)
    {
        float _2474 = _2446 * _2404;
        float _2476 = precise::clamp(_2474, 0.0, 1.0);
        _2400 = _2476;
    }
    float _2478 = _2400;
    int _2480 = _2306 ? 0 : 1;
    int _2482 = _2436 ? 0 : 1;
    if (!_1618)
    {
        float _2484 = -_2478;
        float _2486 = _2484 + 1.0;
        _2472 = _2486;
    }
    float _2488 = _2472;
    int _2490 = ~_2480;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2494;
    if (!_2396)
    {
        int _2498 = ~_2480;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    bool _2504 = _2382 != 3;
    float _2506 = _1590 * _2434;
    int _2508 = abs(_2502);
    float _2510 = _1580 * _2470;
    int _2512 = abs(_2454);
    float _2514 = fma(_1580, _2506, _1578);
    int _2516 = ~_2482;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    bool _2522 = !_2504;
    int _2524 = _2522 ? 0 : (-1);
    int _2526 = _2520;
    if (_2406)
    {
        int _2528 = ~_2482;
        int _2530 = _2528 + 1;
        _2526 = _2530;
    }
    int _2532 = _2526;
    int _2534 = ~_2508;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    int _2540 = abs(_2524);
    int _2542 = abs(_2532);
    int _2544 = ~_2512;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    int _2550 = _2538 * as_type<int>(_2380);
    bool _2552 = !_1788;
    int _2554 = _2552 ? 0 : 1;
    int _2556 = _2548 * as_type<int>(_2372);
    int _2558 = _2556 + _2550;
    int _2560 = ~_2542;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    int _2566 = abs(_2554);
    int _2568 = ~_2540;
    int _2570 = _2568 + 1;
    int _2572 = _2570 + 1;
    int _2574 = _2564 * as_type<int>(_2416);
    int _2576 = _2574 + _2558;
    float _2578 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2426);
    bool _2580 = !_1906;
    int _2582 = _2580 ? _2458 : (-1);
    int _2584 = _2572 * as_type<int>(_2424);
    int _2586 = _2584 + _2576;
    int _2588 = ~_2566;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    float _2594 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2460);
    float _2596 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2466);
    float _2598 = _2488 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2600 = _2488 > 0.0;
    bool _2602 = isnan(_2488);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan(0.0);
    bool _2608 = _2604 || _2606;
    int _2610 = _2592 * _2586;
    float _2612 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2614 = _1682 + _2612;
    out.m_71.x = _2594;
    out.m_71.y = _2578;
    out.m_71.z = _2596;
    float _2616 = _362 * _2598;
    int _2618 = _2582 * _2566;
    int _2620 = _2618 + _2610;
    float _2622 = _1511 + _2614;
    out.gl_Position.x = _1539;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _2614;
    out.gl_Position.w = _1511;
    float _2624 = _2622 * 0.5;
    float _2626 = float(_2620);
    float _2628 = _1580 * _2434;
    float _2630 = _2616 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2624;
    out.m_73.w = _1511;
    float _2632 = fma(_1586, _2628, _1574);
    float _2634 = fma(_1588, _2628, _1576);
    out.m_75.y = _2626;
    out.m_45.x = _2630;
    out.m_77.x = _2632;
    out.m_77.y = _2634;
    out.m_77.z = _2514;
    out.m_77.w = _2510;
    if (_2608)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2636 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2636;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
    bool _518 = false;
    bool _382 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2693 = as_type<float>(_112);
        out.gl_Position.z = _2693;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    if (_126)
    {
        float _134 = float(_96);
        _132 = _134;
    }
    float _136 = _132;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    if (_142)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _106;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2761 = as_type<float>(_148);
        out.gl_Position.z = _2761;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_51.y;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _154 * _152;
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = _174 * 6.283185482025146484375;
    float _184 = floor(_174);
    float _186 = _182 * 0.15915493667125701904296875;
    float _188 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = 0.0;
    float _192 = _188;
    if (!_166)
    {
        float _194 = _188 * _188;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = _198;
    if (!_166)
    {
        float _206 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = -_184;
    float _212 = _174 + _210;
    bool _214 = !_166;
    float _216 = _208;
    float _218 = _156;
    if (!_214)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _188 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _188);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _248;
    }
    float _250 = _216;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _188 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _192 = _272;
    }
    float _274 = _192;
    float _276 = in.m_53.w;
    float _278 = in.m_42.x;
    float _280 = in.m_42.y;
    float _282 = in.m_42.z;
    bool _284 = _212 < 0.5;
    float _286 = float(_284);
    float _288 = -_212;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _298 = _296 != 0;
    float _300 = fma(_202, 0.5, 0.5);
    out.m_55.y = _156;
    float _302 = -_286;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_294;
    int _310 = _308 ? 0 : 1;
    float _312 = -_300;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _316 = !_170;
    int _318 = _316 ? 0 : 1;
    float _320 = fma(_274, _176, _306);
    int _322 = abs(_310);
    int _324 = abs(_318);
    bool _326 = !_298;
    int _328 = _326 ? 0 : 1;
    float _330 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = fma(_274, _178, _330);
    float _338 = float(_322);
    float _340 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _342 = float(_324);
    float _344 = fma(_320, _276, _278);
    float _346 = abs(_290);
    float _348 = _338 * _346;
    float _350 = fma(_274, _180, _340);
    float _352 = fma(_336, _276, _280);
    float _354 = float(_334);
    float _356 = fma(_342, _314, _348);
    float _358 = fma(_350, _276, _282);
    float _360 = abs(_304);
    float _362 = fma(_354, _360, _356);
    bool _364 = !_332;
    float _380;
    if (!_364)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _368 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _372 = _370 * _366;
        float _374 = floor(_372);
        float _376 = -_374;
        float _378 = _372 + _376;
        _380 = _378;
        _382 = true;
    }
    else
    {
        float _384 = float(_96);
        float _386 = 1.0 / _384;
        float _388 = _130 * _386;
        _380 = _388;
    }
    _382 = false;
    float _390 = _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = _390 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _396;
    float _400 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _402 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_390);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    bool _414 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _416 = isnan(_390);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _398;
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _430 = -_424;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _394 * _426;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = in.m_53.x;
    float _446 = in.m_53.y;
    float _448 = in.m_53.z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _450;
    float _454 = _400 * _150;
    float _456 = _412 * _432;
    float _458 = fma(_436, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = fma(_442, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _462 = fma(_452, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _464 = -_412;
    float _466 = _464 + 1.0;
    float _468 = trunc(_454);
    int _470 = int(_468);
    float _472 = _458 * _456;
    float _474 = _460 * _456;
    float _476 = _462 * _456;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _480 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _484 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].x, _478);
    float _486 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].y, _480);
    float _488 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].z, _482);
    float _490 = _484 * _444;
    float _492 = _486 * _446;
    float _494 = _488 * _448;
    int _496 = _470 << 4;
    int _498 = _496 + 1712;
    bool _500 = !_428;
    float _516;
    if (!_500)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_96);
        float _522 = 1.0 / _520;
        float _524 = _130 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    uint _529 = uint(int(uint(_498) >> uint(2)));
    uint _531 = uint(int(uint(int(_529)) >> uint(2)));
    int _533 = int(_529) & 3;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[int(_531)][_533];
    int _537 = int(_529) + 1;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    int _541 = _537 & 3;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[int(_539)][_541];
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _526 + _545;
    bool _549 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_526);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _565 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_526);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    int _577 = _498 + 8;
    uint _579 = uint(int(uint(_577) >> uint(2)));
    uint _581 = uint(int(uint(int(_579)) >> uint(2)));
    int _583 = int(_579) & 3;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[int(_581)][_583];
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _587;
    float _591 = -_559;
    float _593 = _591 + 1.0;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _597 = 1.0 / _563;
    float _599 = _589 * _597;
    float _601 = fma(_599, _547, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _603 = _575 * _593;
    float _605 = -_575;
    float _607 = _605 + 1.0;
    float _609 = _601 * _603;
    float _611 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[115].x, _609);
    float _613 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[116].x, _611);
    float _615 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _617 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _625 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _629 = !_595;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _633 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_96);
        float _651 = 1.0 / _649;
        float _653 = _130 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_49.z;
    float _659 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _661 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _663 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = in.m_49.y;
    float _667 = _150 * 2.0;
    float _669 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    float _671 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    float _673 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _661);
    float _675 = floor(_667);
    float _677 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _669);
    float _679 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _681 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _673);
    float _683 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _691 = _679 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _695 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = _689 + _697;
    float _701 = _657 * 2.0;
    float _703 = _150 + _657;
    bool _705 = _675 > 0.0;
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _709 = _691 + _707;
    float _711 = _665 + _657;
    bool _713 = _675 >= 0.0;
    bool _715 = isnan(_675);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = floor(_701);
    float _725 = _703 + (-1.0);
    float _727 = _711 + (-1.0);
    float _729 = _130 * _687;
    float _731 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _733 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _737 = _150 + _665;
    float _739 = _665 * 2.0;
    float _741 = exp2(_729);
    float _743 = _737 + (-1.0);
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _747 = _723 > 0.0;
    float _749 = floor(_739);
    bool _751 = _723 >= 0.0;
    bool _753 = isnan(_723);
    bool _755 = _751 || _753;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _683 + _761;
    int _765 = _721 ? 0 : 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _777 = _775 != 0;
    int _779 = ~_765;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    float _785 = -_741;
    float _787 = _785 + 1.0;
    int _789 = _783;
    if (!_705)
    {
        int _791 = ~_765;
        int _793 = _791 + 1;
        _789 = _793;
    }
    int _795 = _789;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _799 = 1.0 + _797;
    bool _801 = !_773;
    int _803 = _801 ? 0 : 1;
    float _805 = float(_795);
    float _807 = 1.0 / _799;
    int _809 = abs(_803);
    float _811 = in.m_57.x;
    float _813 = in.m_57.y;
    float _815 = in.m_57.z;
    bool _817 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _819 = isnan(0.0);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _825 = _821 || _823;
    float _827 = float(_809);
    bool _829 = _749 > 0.0;
    bool _831 = _749 >= 0.0;
    bool _833 = isnan(_749);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _699 * _699;
    float _843 = _827 * _805;
    float _845 = _825 ? _787 : 0.0;
    float _847 = fma(_763, _763, _841);
    float _849 = _843 * (-2.0);
    int _851 = _759 ? 0 : 1;
    float _853 = _845 * _807;
    bool _855 = !_769;
    int _857 = _855 ? 0 : 1;
    float _859 = fma(_735, _849, _735);
    float _861 = fma(_709, _709, _847);
    bool _863 = !_777;
    int _865 = _863 ? 0 : 1;
    int _867 = ~_851;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = rsqrt(_861);
    int _875 = abs(_857);
    float _877 = fma(_849, _813, _813);
    float _879 = _665 + (-0.5);
    int _881 = _871;
    if (!_747)
    {
        int _883 = ~_851;
        int _885 = _883 + 1;
        _881 = _885;
    }
    int _887 = _881;
    int _889 = _839 ? 0 : 1;
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[196].y, _877);
    int _893 = abs(_865);
    int _895 = ~_889;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = _899;
    if (!_829)
    {
        int _903 = ~_889;
        int _905 = _903 + 1;
        _901 = _905;
    }
    int _907 = _901;
    float _909 = _699 * _873;
    float _911 = float(_875);
    float _913 = _763 * _873;
    float _915 = float(_887);
    float _917 = -_909;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _921 = float(_893);
    float _923 = -_913;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    float _927 = float(_907);
    float _929 = _911 * _915;
    bool _931 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(1.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = _709 * _873;
    float _943 = _921 * _927;
    float _945 = _929 * (-2.0);
    bool _947 = !_939;
    float _949 = _947 ? _130 : _853;
    float _951 = _150 + (-0.5);
    float _953 = _943 * (-2.0);
    float _955 = fma(_945, _811, _811);
    float _957 = fma(_745, _945, _745);
    float _959 = fma(_949, _859, _891);
    float _961 = fma(_953, _815, _815);
    float _963 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[196].x, _955);
    float _965 = _657 + (-0.5);
    float _967 = _959 * 0.15915493667125701904296875;
    float _969 = _919 * _919;
    float _971 = fma(_733, _953, _733);
    float _973 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _975 = -_941;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _979 = fma(_925, _925, _969);
    float _981 = fma(_949, _957, _963);
    float _983 = fma(_949, _971, _973);
    float _985 = _967 * 6.283185482025146484375;
    float _987 = sin(_985);
    float _989 = fma(_977, _977, _979);
    float _991 = _981 * 0.15915493667125701904296875;
    float _993 = _983 * 0.15915493667125701904296875;
    float _995 = in.m_59.x;
    float _997 = in.m_59.y;
    float _999 = in.m_59.z;
    float _1001 = sqrt(_989);
    float _1003 = _967 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = _991 * 6.283185482025146484375;
    float _1009 = sin(_1007);
    float _1011 = _873 * _1001;
    float _1013 = _693 * _1011;
    float _1015 = _695 * _1011;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _995);
    float _1019 = _991 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _731 * _1011;
    float _1025 = _1015 * _1017;
    float _1027 = _993 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _1009 * _1005;
    float _1033 = _1009 * _987;
    float _1035 = fma(_130, 0.01200000010430812835693359375, _150);
    float _1037 = _993 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1021 * _987;
    float _1043 = _1021 * _1005;
    float _1045 = -_1041;
    float _1047 = fma(_1029, _1031, _1045);
    float _1049 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _997);
    float _1051 = -_1031;
    float _1053 = fma(_1029, _1041, _1051);
    float _1055 = fma(_1029, _1043, _1033);
    float _1057 = floor(_1035);
    float _1059 = _1013 * _1049;
    float _1061 = fma(_1029, _1033, _1043);
    float _1063 = _1021 * _1039;
    float _1065 = _1009 * _1039;
    float _1067 = _1005 * _1039;
    float _1069 = _987 * _1039;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _999);
    float _1073 = _1063 * _1059;
    float _1075 = -_1059;
    float _1077 = _1029 * _1075;
    float _1079 = _1023 * _1071;
    float _1081 = fma(_1055, _1025, _1073);
    float _1083 = _1065 * _1059;
    float _1085 = fma(_1067, _1025, _1077);
    float _1087 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1089 = fma(_1053, _1079, _1081);
    float _1091 = fma(_1047, _1025, _1083);
    float _1093 = fma(_1069, _1079, _1085);
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1097 = fma(_1061, _1079, _1091);
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1103 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1095);
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1099);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1101);
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1103);
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1107);
    float _1115 = _691 + _1109;
    float _1117 = _683 + _1111;
    float _1119 = _689 + _1113;
    float _1121 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1115);
    float _1123 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1117);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1119);
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1121 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1133 = _1123 + _1131;
    float _1135 = _1129 * _1129;
    float _1137 = fma(_1133, _1133, _1135);
    float _1139 = sqrt(_1137);
    bool _1141 = _1139 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1145 = _1143 != 0;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1149;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1135;
    float _1165 = _1119;
    float _1167 = _1123;
    float _1169 = _1125;
    float _1171 = _919;
    if (!_1141)
    {
        _1163 = _1123;
    }
    float _1173 = _1163;
    bool _1175 = !_1145;
    int _1177 = _1175 ? 0 : 1;
    bool _1179 = !_1153;
    int _1181 = _1179 ? 0 : 1;
    bool _1183 = !_1157;
    float _1185 = _1183 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1187 = _1173;
    float _1189 = _1185;
    if (!_1141)
    {
        _1165 = _1121;
    }
    float _1191 = _1165;
    float _1193 = _1191;
    if (!_1141)
    {
        _1167 = _1125;
    }
    float _1195 = _1167;
    bool _1197 = !_1141;
    float _1199 = _1195;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1205 = _1139 + _1203;
        float _1207 = rsqrt(_1137);
        float _1209 = _1205 * _1201;
        float _1211 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1213 = _1209 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = fma(_1221, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = fma(_1125, _1217, _1225);
        float _1231 = _1207 * _1227;
        float _1233 = fma(_1133, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1129, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1199 = _1229;
        _1187 = _1233;
        _1193 = _1235;
    }
    float _1237 = _1199;
    float _1239 = _1187;
    float _1241 = _1193;
    float _1243 = -_909;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1237);
    float _1247 = -_913;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1251 = -_941;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1257 = _1245 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1261 = _1249 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1265 = _1253 + _1263;
    float _1267 = _1257 * _1257;
    float _1269 = fma(_1261, _1261, _1267);
    float _1271 = fma(_1265, _1265, _1269);
    float _1273 = rsqrt(_1271);
    float _1275 = sqrt(_1271);
    float _1277 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1279 = _1261 * _1277;
    float _1281 = _1265 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 + _1285;
    float _1289 = sqrt(_1287);
    bool _1291 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1289 + _1293;
    float _1297 = _1269;
    float _1299 = _1287;
    float _1301 = _1295;
    float _1303 = _1257;
    if (_1291)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1305;
    }
    float _1307 = _1297;
    if (_1291)
    {
        float _1309 = rsqrt(_1287);
        _1299 = _1309;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (_1291)
    {
        float _1315 = _1295 * _1307;
        _1301 = _1315;
    }
    float _1317 = _1301;
    if (_1291)
    {
        float _1319 = _1317 * 0.15915493667125701904296875;
        _1169 = _1319;
    }
    float _1321 = _1169;
    float _1323 = _1265;
    float _1325 = _1321;
    if (_1291)
    {
        float _1327 = _1321 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        _1323 = _1329;
    }
    float _1331 = _1323;
    float _1333 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1335 = precise::max(0.0, _1333);
    float _1337 = _1307;
    float _1339 = _1335;
    if (_1291)
    {
        float _1341 = _1321 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        _1337 = _1343;
    }
    float _1345 = _1337;
    float _1347 = -_1277;
    float _1349 = -_1335;
    float _1351 = fma(_1257, _1347, _1349);
    if (_1291)
    {
        float _1353 = _1351 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1303 = _1353;
    }
    float _1355 = _1303;
    float _1357 = _1355;
    float _1359 = _1331;
    if (_1291)
    {
        float _1361 = fma(_1331, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1363;
    if (!_1291)
    {
        _1359 = _1279;
    }
    float _1367 = _1359;
    float _1369 = _1367;
    float _1371 = _1345;
    if (_1291)
    {
        float _1373 = _1345 + (-1.0);
        _1339 = _1373;
    }
    float _1375 = _1339;
    float _1377 = _1375;
    if (_1291)
    {
        float _1379 = _1311 * _1363;
        _1171 = _1379;
    }
    float _1381 = _1171;
    if (!_1291)
    {
        _1365 = _1351;
    }
    float _1383 = _1365;
    float _1385 = _1383;
    if (_1291)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1387;
    }
    float _1389 = _1325;
    if (_1291)
    {
        float _1391 = _1279 * _1381;
        _1369 = _1391;
    }
    float _1393 = _1369;
    if (!_1291)
    {
        _1377 = _1281;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1291)
    {
        float _1399 = _1281 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (!_1291)
    {
        _1313 = _1283;
    }
    float _1403 = _1313;
    float _1405 = _1403;
    if (_1291)
    {
        float _1407 = fma(_1351, _1345, _1389);
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (_1291)
    {
        float _1411 = _1393 * _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1291)
    {
        _1371 = _1285;
    }
    float _1415 = _1371;
    float _1417 = _1415;
    if (_1291)
    {
        float _1419 = _1401 * _1401;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1427 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = _1423 + _1421;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1433 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1431);
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1439 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1425);
    float _1441 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = -_1435;
    float _1445 = _1443 + 1.0;
    float _1447 = rsqrt(_1429);
    float _1449 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1437);
    float _1451 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1453 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1455 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1457 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1449);
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1461 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1453);
    float _1463 = abs(_1445);
    float _1465 = log2(_1463);
    float _1467 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1473 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1477 = -_1469;
    float _1479 = fma(_1477, _1455, 1.0);
    float _1481 = _1447 * _1393;
    float _1483 = _1447 * _1409;
    float _1485 = _1447 * _1401;
    float _1487 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1473);
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1475);
    float _1493 = log2(_1479);
    float _1495 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = -_1489;
    float _1499 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1497);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1491);
    float _1503 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1505 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1507 = -_1485;
    float _1509 = fma(_1507, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1499);
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1513 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1515 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1505);
    float _1517 = fma(_1509, -0.5, 0.5);
    float _1519 = exp2(_1503);
    float _1521 = fma(_1509, 0.5, 0.5);
    float _1523 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1513);
    float _1525 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1515);
    float _1527 = _1483 + 1.0;
    float _1529 = fma(_1521, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1531 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1523);
    float _1533 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1525);
    float _1535 = sqrt(_1517);
    float _1537 = fma(_1521, _1529, -0.212114393711090087890625);
    float _1539 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1541 = _1493 * 0.693147182464599609375;
    float _1543 = fma(_1521, _1537, 1.570728778839111328125);
    float _1545 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1547 = 1.0 / _1511;
    float _1549 = -_1483;
    float _1551 = fma(_1519, _1527, _1549);
    float _1553 = _1535 * 0.636619746685028076171875;
    float _1555 = _1539 * _1547;
    float _1557 = _1533 * _1547;
    float _1559 = -_1543;
    float _1561 = fma(_1553, _1559, 1.0);
    float _1563 = fma(_1551, 0.5, 0.5);
    float _1565 = fma(_1555, 0.5, 0.5);
    float _1567 = fma(_1557, -0.5, 0.5);
    float3 _4950 = float3(_1565, _1567, _1545);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4950, float3(0.0), isnan(_4950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4950, float3(0.0), isnan(_4950)), level(0.0)).x;
    float3 _4961 = float3(_1565, _1567, _1545);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4961, float3(0.0), isnan(_4961)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4961, float3(0.0), isnan(_4961)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4978 = float2(_1561, _1563);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4978, float2(0.0), isnan(_4978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4978, float2(0.0), isnan(_4978)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1594 = int(_1592);
    out.m_61.x = _619;
    out.m_61.y = _621;
    out.m_61.z = _627;
    out.m_61.w = _625;
    bool _1596 = _665 > 0.5;
    float _1598 = -_909;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1604 = _1602 != 0;
    float _1606 = -_913;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    bool _1610 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1612 = isnan(0.5);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1618 = _1614 || _1616;
    float _1620 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1622 = int(_1620);
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1626 = _1624 != 0;
    float _1628 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1630 = -_941;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1636 = _1634 != 0;
    float _1638 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1628);
    float _1640 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1642 = float(_1594);
    float _1644 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1638);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1650 = 1.0 / _1642;
    float _1652 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1654 = float(uint(_1622));
    float _1656 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1658 = ~_1622;
    int _1660 = _1658 + 1;
    float _1662 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1664 = float(_1622);
    float _1666 = 1.0 / _1654;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1670 = _1668 != 0;
    float _1672 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1662);
    out.m_63.y = _1013;
    float _1674 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1672);
    float _1676 = _130 * _1650;
    float _1678 = 1.0 / _1648;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1682 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1686 = _1684 != 0;
    out.m_65.x = _1249;
    out.m_65.y = _1245;
    out.m_65.z = _1253;
    float _1688 = float(_96);
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1692 = as_type<int>(_1666) + (-2);
    float _1694 = trunc(_1676);
    int _1696 = int(_1694);
    bool _1698 = !_1686;
    float _1700 = _1698 ? 1.2345600128173828125 : 1.0;
    bool _1702 = !_1686;
    float _1704 = _1702 ? _665 : _150;
    float _1706 = _1700 * _1704;
    float _1708 = 1.0 / _1688;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1712 = float(uint(_1696));
    float _1714 = float(_1696);
    float _1716 = floor(_1706);
    float _1718 = as_type<float>(_1692) * _1712;
    float _1720 = in.m_49.w;
    float _1722 = trunc(_1718);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    float _1728 = -_1716;
    float _1730 = _1706 + _1728;
    float _1732 = exp2(_1656);
    int _1734 = _1660 * int(_1726);
    int _1736 = _1734 + _1696;
    float _1738 = float(uint(_1736));
    float _1740 = -_156;
    float _1742 = _1740 + 1.0;
    float _1744 = -_1732;
    float _1746 = _1744 + 1.0;
    float _1748 = as_type<float>(_1692) * _1738;
    int _1750 = _1596 ? as_type<int>(_1742) : as_type<int>(_156);
    bool _1752 = _1720 > 0.5;
    float _1754 = trunc(_1748);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = _1626 ? as_type<float>(_1750) : _156;
    float _1762 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1764 = _1604;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (_1604)
    {
        float _1768 = _1752 ? _1742 : _156;
        _218 = _1768;
    }
    float _1770 = _218;
    int _1772 = ~_1622;
    int _1774 = _1772 + 1;
    int _1776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1778 = _1776 != 0;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1636)
    {
        bool _1782 = _150 > 0.5;
        _1764 = _1782;
    }
    bool _1784 = _1764;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1788 = _1786 != 0;
    float _1790 = -_1780;
    float _1792 = fma(_1640, 2.0, _1790);
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1796 = int(_1726) + int(_1758);
    float _1798 = as_type<float>(_1758);
    float _1800 = _1794;
    if (!_1686)
    {
        _1798 = _665;
    }
    float _1802 = _1798;
    float _1804 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1794);
    float _1806 = _1802;
    if (!_1686)
    {
        _1800 = _657;
    }
    float _1808 = _1800;
    int _1810 = _1774 * _1796;
    int _1812 = _1810 + _1696;
    float _1814 = _1808;
    if (!_1686)
    {
        _1766 = _657;
    }
    float _1816 = _1766;
    float _1818 = -_130;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1792);
    float _1822 = _1816;
    if (_1686)
    {
        _1806 = _150;
    }
    float _1824 = _1806;
    if (_1686)
    {
        _1814 = _665;
    }
    float _1826 = _1814;
    if (_1686)
    {
        _1822 = _665;
    }
    float _1828 = _1822;
    bool _1830 = uint(_1812) >= uint(_1622);
    bool _1832 = _1714 >= _1664;
    bool _1834 = isnan(_1714);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan(_1664);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _665 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1848 = !_1830;
    int _1850 = _1848 ? 0 : (-1);
    float _1852 = fma(_1844, -2.0, _1710);
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1858 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1846);
    bool _1860 = _1830;
    if (_1778)
    {
        bool _1862 = _657 > 0.5;
        _1860 = _1862;
    }
    bool _1864 = _1860;
    float _1866 = trunc(_1842);
    int _1868 = int(_1866);
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1870;
    float _1874 = _130 * _1664;
    int _1876 = ~_1796;
    int _1878 = _1876 + _1850;
    int _1880 = _1878 + 1;
    float _1882 = _1872 * _1678;
    float _1884 = _1664 * _1730;
    float _1886 = _1874 * _1708;
    float _1888 = 1.0 / _1856;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1894 = _1622 * _1880;
    int _1896 = _1894 + _1696;
    bool _1898 = !_1670;
    int _1900 = _1898 ? 0 : 1;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1904 = _655 + _1902;
    bool _1906 = _1622 == 0;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1908;
    float _1912 = 1.0 / _1892;
    int _1914 = ~_1868;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1852);
    bool _1922 = !_1906;
    int _1924 = _1922 ? _1896 : (-1);
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1930 = _1622 + (-1);
    float _1932 = in.m_51.x;
    int _1934 = abs(_1900);
    float _1936 = trunc(_1884);
    int _1938 = int(_1936);
    float _1940 = _1910 * _1888;
    float _1942 = fma(_1882, _1904, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1944 = _1918 * _1924;
    int _1946 = abs(_1161);
    int _1948 = _1868 * _1930;
    int _1950 = _1948 + _1944;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1956 = _655 + _1954;
    float _1958 = _1928 * _1912;
    int _1960 = abs(_1177);
    int _1962 = _1950 * _1946;
    float _1964 = fma(_1940, _1956, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1968 = _655 + _1966;
    int _1970 = abs(as_type<int>(_1185));
    float _1972 = trunc(_1886);
    int _1974 = int(_1972);
    int _1976 = _1938 * _1934;
    int _1978 = _1976 + _1696;
    int _1980 = abs(_1181);
    float _1982 = fma(_1958, _1968, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1984 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1986 = ~_1622;
    int _1988 = _1986 + 1;
    int _1990 = as_type<int>(_1910);
    float _1992 = _1932;
    if (_1778)
    {
        float _1994 = -_1932;
        float _1996 = _1994 + 1.0;
        _1990 = as_type<int>(_1996);
    }
    int _1998 = _1990;
    float _2000 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2004 = as_type<int>(_2002);
    if (!_1636)
    {
        _1189 = _1932;
    }
    float _2006 = _1189;
    int _2008 = _1974 * _1960;
    int _2010 = _2008 + _1962;
    float _2012 = fma(_2000, _1760, -0.5);
    bool _2014 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2016 = isnan(_655);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2022 = _2018 || _2020;
    float _2024 = float(_2022);
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2028 = _1978 * _1980;
    int _2030 = _2028 + _2010;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2034 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1858);
    bool _2036 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2038 = isnan(_655);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    int _2048 = _1938 * _1970;
    int _2050 = _2048 + _2030;
    float _2052 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2032);
    float _2054 = -_1920;
    float _2056 = fma(_2034, _2012, _2054);
    bool _2058 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2060 = isnan(_655);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2066);
    float _2070 = -_2024;
    float _2072 = _2070 + 1.0;
    float _2074 = float(uint(_2050));
    bool _2076 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2078 = isnan(_655);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = _2068 * _2072;
    float _2090 = as_type<float>(_1692) * _2074;
    float _2092 = -_2068;
    float _2094 = _2092 + 1.0;
    float _2096 = -_2086;
    float _2098 = _2096 + 1.0;
    float _2100 = trunc(_2090);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2108 = _2046 * _2098;
    float _2110 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2112 = _2086 * _2094;
    float _2114 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2106);
    float _2116 = -_2046;
    float _2118 = _2116 + 1.0;
    float _2120 = -_2002;
    float _2122 = fma(_2110, 2.0, _2120);
    float _2124 = _1942 * _2108;
    float _2126 = fma(_1984, -2.0, _2026);
    float _2128 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2114);
    float _2130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2052);
    float _2134 = _2006;
    if (_1636)
    {
        float _2136 = -_1932;
        float _2138 = _2136 + 1.0;
        _2004 = as_type<int>(_2138);
    }
    int _2140 = _2004;
    int _2142 = _1988 * int(_2104);
    int _2144 = _2142 + _2050;
    if (_1636)
    {
        float _2146 = _1784 ? as_type<float>(_2140) : _1932;
        _2134 = _2146;
    }
    float _2148 = _2134;
    float _2150 = float(uint(_2144));
    float _2152 = fma((*spvDescriptorSet0.vp_c9)._m0[85].y, _1770, -0.5);
    float _2154 = float(uint(_1978));
    if (_1778)
    {
        float _2156 = _1864 ? as_type<float>(_1998) : _1932;
        _1992 = _2156;
    }
    float _2158 = _1992;
    float _2160 = as_type<float>(_1692) * _2150;
    float _2162 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2124);
    float _2164 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1804);
    float _2166 = as_type<float>(_1692) * _2154;
    float _2168 = trunc(_2160);
    float _2170 = precise::max(_2168, 0.0);
    uint _2172 = uint(_2170);
    float _2174 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2126);
    float _2176 = -_130;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    int _2180 = ~_1622;
    int _2182 = _2180 + 1;
    float _2184 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2186 = -_2174;
    float _2188 = fma(_2132, _2152, _2186);
    float _2190 = fma(_1982, _2112, _2162);
    float _2192 = trunc(_2166);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = fma(_2184, _2148, -0.5);
    int _2200 = ~_1622;
    int _2202 = _2200 + 1;
    float _2204 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2206 = fma(_1964, _2088, _2190);
    float _2208 = fma(_2164, _2198, _1820);
    float _2210 = fma(_2128, _2204, _2178);
    int _2212 = int(_2104) + int(_2172);
    float _2214 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2206);
    float _2216 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2218 = _2188 + 0.5;
    float _2220 = _2208 + 0.5;
    int _2222 = _2182 * _2212;
    int _2224 = _2222 + _2050;
    float _2226 = _995 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2228 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2216);
    int _2230 = _2202 * int(_2196);
    int _2232 = _2230 + _1978;
    float _2234 = _997 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2236 = uint(_2224) >= uint(_1622);
    float _2238 = _2214 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2240 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2228);
    float _2242 = float(uint(_2232));
    float _2244 = -_2234;
    float _2246 = _1029 * _2244;
    bool _2248 = !_2236;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2254 = _1063 * _2234;
    float _2256 = as_type<float>(_1692) * _2242;
    int _2258 = ~_2212;
    int _2260 = _2258 + _2250;
    int _2262 = _2260 + 1;
    float _2264 = _2056 + 0.5;
    float _2266 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2268 = _2210 + 0.5;
    float _2270 = trunc(_2256);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    int _2276 = _1622 * _2262;
    int _2278 = _2276 + _2050;
    float _2280 = _1065 * _2234;
    out.m_67.x = _2220;
    out.m_67.y = _2264;
    out.m_67.z = _2268;
    out.m_67.w = _2218;
    float _2282 = _2252 + _2266;
    bool _2284 = !_1906;
    int _2286 = _2284 ? _2278 : (-1);
    float _2288 = 1.0 / _2266;
    float _2290 = fma(_1067, _2226, _2246);
    float _2292 = _2210;
    float _2294 = _2220;
    if (!_1618)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2296 = _2292;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2300 = _2286 >> 31;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2304 = _2286 & 3;
    bool _2306 = _2304 != 0;
    float _2308 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2310 = int(_2196) + int(_2274);
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2314 = _2300 & 3;
    float _2316 = fma(_1055, _2226, _2254);
    int _2318 = ~_1622;
    int _2320 = _2318 + 1;
    float _2322 = fma(_1047, _2226, _2280);
    int _2324 = _2286 + _2314;
    out.m_69.x = _2308;
    out.m_69.y = _2312;
    out.m_69.z = _1690;
    out.m_69.w = _2238;
    float _2326 = _2282 * _2288;
    float _2328 = _2326 * 0.5;
    int _2330 = _2320 * _2310;
    int _2332 = _2330 + _1978;
    int _2334 = _2324 >> 2;
    float _2336 = fma(_1053, _1652, _2316);
    float _2338 = as_type<float>(_2324);
    float _2340 = _2312;
    if (!_1618)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2344 = fma(_2328, _2296, _2342);
        _2294 = _2344;
    }
    float _2346 = _2294;
    if (!_1618)
    {
        _2338 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2348 = _2338;
    float _2350 = fma(_1069, _1652, _2290);
    int _2352 = _2334 << 4;
    int _2354 = _2352 + 512;
    float _2356 = _2218;
    if (!_1618)
    {
        float _2358 = 1.0 / _2346;
        _2356 = _2358;
    }
    float _2360 = _2356;
    bool _2362 = uint(_2332) >= uint(_1622);
    float _2364 = fma(_1061, _1652, _2322);
    uint _2366 = uint(int(uint(_2354) >> uint(2)));
    uint _2368 = uint(int(uint(int(_2366)) >> uint(2)));
    int _2370 = int(_2366) & 3;
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[int(_2368)][_2370];
    int _2374 = int(_2366) + 1;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    int _2378 = _2374 & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = _2286 & 3;
    if (!_1618)
    {
        float _2384 = -_2348;
        float _2386 = _2384 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2340 = _2386;
    }
    float _2388 = _2340;
    bool _2390 = !_2362;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2396 = uint(_2382) > 1u;
    float _2398 = _1690;
    float _2400 = _2388;
    if (!_1618)
    {
        float _2402 = 1.0 / _2388;
        _2398 = _2402;
    }
    float _2404 = _2398;
    bool _2406 = _2382 != 3;
    int _2408 = _2354 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    float _2426 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2394);
    int _2428 = ~_2310;
    int _2430 = _2428 + _2392;
    int _2432 = _2430 + 1;
    float _2434 = _1762 * _1569;
    bool _2436 = uint(_2382) >= 2u;
    float _2438 = _2360;
    if (!_1618)
    {
        float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2442 = -_2348;
        float _2444 = fma(_2360, _2440, _2442);
        _2438 = _2444;
    }
    float _2446 = _2438;
    float _2448 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2450 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2452 = !_2306;
    int _2454 = _2452 ? 0 : 1;
    int _2456 = _1622 * _2432;
    int _2458 = _2456 + _1978;
    float _2460 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2448);
    float _2462 = _2448;
    if (_1618)
    {
        _2462 = 1.0;
    }
    float _2464 = _2462;
    float _2466 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2450);
    float _2468 = -_1762;
    float _2470 = _2468 + 1.0;
    float _2472 = _2464;
    if (!_1618)
    {
        float _2474 = _2446 * _2404;
        float _2476 = precise::clamp(_2474, 0.0, 1.0);
        _2400 = _2476;
    }
    float _2478 = _2400;
    int _2480 = _2306 ? 0 : 1;
    int _2482 = _2436 ? 0 : 1;
    if (!_1618)
    {
        float _2484 = -_2478;
        float _2486 = _2484 + 1.0;
        _2472 = _2486;
    }
    float _2488 = _2472;
    int _2490 = ~_2480;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2494;
    if (!_2396)
    {
        int _2498 = ~_2480;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    bool _2504 = _2382 != 3;
    float _2506 = _1590 * _2434;
    int _2508 = abs(_2502);
    float _2510 = _1580 * _2470;
    int _2512 = abs(_2454);
    float _2514 = fma(_1580, _2506, _1578);
    int _2516 = ~_2482;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    bool _2522 = !_2504;
    int _2524 = _2522 ? 0 : (-1);
    int _2526 = _2520;
    if (_2406)
    {
        int _2528 = ~_2482;
        int _2530 = _2528 + 1;
        _2526 = _2530;
    }
    int _2532 = _2526;
    int _2534 = ~_2508;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    int _2540 = abs(_2524);
    int _2542 = abs(_2532);
    int _2544 = ~_2512;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    int _2550 = _2538 * as_type<int>(_2380);
    bool _2552 = !_1788;
    int _2554 = _2552 ? 0 : 1;
    int _2556 = _2548 * as_type<int>(_2372);
    int _2558 = _2556 + _2550;
    int _2560 = ~_2542;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    int _2566 = abs(_2554);
    int _2568 = ~_2540;
    int _2570 = _2568 + 1;
    int _2572 = _2570 + 1;
    int _2574 = _2564 * as_type<int>(_2416);
    int _2576 = _2574 + _2558;
    float _2578 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2426);
    bool _2580 = !_1906;
    int _2582 = _2580 ? _2458 : (-1);
    int _2584 = _2572 * as_type<int>(_2424);
    int _2586 = _2584 + _2576;
    int _2588 = ~_2566;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    float _2594 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2460);
    float _2596 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2466);
    float _2598 = _2488 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2600 = _2488 > 0.0;
    bool _2602 = isnan(_2488);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan(0.0);
    bool _2608 = _2604 || _2606;
    int _2610 = _2592 * _2586;
    float _2612 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2614 = _1682 + _2612;
    out.m_71.x = _2594;
    out.m_71.y = _2578;
    out.m_71.z = _2596;
    float _2616 = _362 * _2598;
    int _2618 = _2582 * _2566;
    int _2620 = _2618 + _2610;
    float _2622 = _1511 + _2614;
    out.gl_Position.x = _1539;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _2614;
    out.gl_Position.w = _1511;
    float _2624 = _2622 * 0.5;
    float _2626 = float(_2620);
    float _2628 = _1580 * _2434;
    float _2630 = _2616 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2624;
    out.m_73.w = _1511;
    float _2632 = fma(_1586, _2628, _1574);
    float _2634 = fma(_1588, _2628, _1576);
    out.m_75.y = _2626;
    out.m_45.x = _2630;
    out.m_77.x = _2632;
    out.m_77.y = _2634;
    out.m_77.z = _2514;
    out.m_77.w = _2510;
    if (_2608)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2636 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2636;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _647 = false;
    bool _518 = false;
    bool _382 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2693 = as_type<float>(_112);
        out.gl_Position.z = _2693;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = 0.0;
    if (_126)
    {
        float _134 = float(_96);
        _132 = _134;
    }
    float _136 = _132;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    if (_142)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _106;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2761 = as_type<float>(_148);
        out.gl_Position.z = _2761;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_51.y;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _154 * _152;
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = _174 * 6.283185482025146484375;
    float _184 = floor(_174);
    float _186 = _182 * 0.15915493667125701904296875;
    float _188 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = 0.0;
    float _192 = _188;
    if (!_166)
    {
        float _194 = _188 * _188;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = _198;
    if (!_166)
    {
        float _206 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = -_184;
    float _212 = _174 + _210;
    bool _214 = !_166;
    float _216 = _208;
    float _218 = _156;
    if (!_214)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _188 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _188);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _248;
    }
    float _250 = _216;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _188 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _192 = _272;
    }
    float _274 = _192;
    float _276 = in.m_53.w;
    float _278 = in.m_42.x;
    float _280 = in.m_42.y;
    float _282 = in.m_42.z;
    bool _284 = _212 < 0.5;
    float _286 = float(_284);
    float _288 = -_212;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _298 = _296 != 0;
    float _300 = fma(_202, 0.5, 0.5);
    out.m_55.y = _156;
    float _302 = -_286;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_294;
    int _310 = _308 ? 0 : 1;
    float _312 = -_300;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _316 = !_170;
    int _318 = _316 ? 0 : 1;
    float _320 = fma(_274, _176, _306);
    int _322 = abs(_310);
    int _324 = abs(_318);
    bool _326 = !_298;
    int _328 = _326 ? 0 : 1;
    float _330 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = fma(_274, _178, _330);
    float _338 = float(_322);
    float _340 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _342 = float(_324);
    float _344 = fma(_320, _276, _278);
    float _346 = abs(_290);
    float _348 = _338 * _346;
    float _350 = fma(_274, _180, _340);
    float _352 = fma(_336, _276, _280);
    float _354 = float(_334);
    float _356 = fma(_342, _314, _348);
    float _358 = fma(_350, _276, _282);
    float _360 = abs(_304);
    float _362 = fma(_354, _360, _356);
    bool _364 = !_332;
    float _380;
    if (!_364)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _368 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _370 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _372 = _370 * _366;
        float _374 = floor(_372);
        float _376 = -_374;
        float _378 = _372 + _376;
        _380 = _378;
        _382 = true;
    }
    else
    {
        float _384 = float(_96);
        float _386 = 1.0 / _384;
        float _388 = _130 * _386;
        _380 = _388;
    }
    _382 = false;
    float _390 = _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = _390 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _396;
    float _400 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _402 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_390);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    bool _414 = _390 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _416 = isnan(_390);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _398;
    bool _428 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _430 = -_424;
    float _432 = _430 + 1.0;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _394 * _426;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = in.m_53.x;
    float _446 = in.m_53.y;
    float _448 = in.m_53.z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _450;
    float _454 = _400 * _150;
    float _456 = _412 * _432;
    float _458 = fma(_436, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _460 = fma(_442, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _462 = fma(_452, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _464 = -_412;
    float _466 = _464 + 1.0;
    float _468 = trunc(_454);
    int _470 = int(_468);
    float _472 = _458 * _456;
    float _474 = _460 * _456;
    float _476 = _462 * _456;
    float _478 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _480 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _484 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].x, _478);
    float _486 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].y, _480);
    float _488 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[144].z, _482);
    float _490 = _484 * _444;
    float _492 = _486 * _446;
    float _494 = _488 * _448;
    int _496 = _470 << 4;
    int _498 = _496 + 1712;
    bool _500 = !_428;
    float _516;
    if (!_500)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _504 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_96);
        float _522 = 1.0 / _520;
        float _524 = _130 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    uint _529 = uint(int(uint(_498) >> uint(2)));
    uint _531 = uint(int(uint(int(_529)) >> uint(2)));
    int _533 = int(_529) & 3;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[int(_531)][_533];
    int _537 = int(_529) + 1;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    int _541 = _537 & 3;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[int(_539)][_541];
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _526 + _545;
    bool _549 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_526);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _565 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_526);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    int _577 = _498 + 8;
    uint _579 = uint(int(uint(_577) >> uint(2)));
    uint _581 = uint(int(uint(int(_579)) >> uint(2)));
    int _583 = int(_579) & 3;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[int(_581)][_583];
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _587;
    float _591 = -_559;
    float _593 = _591 + 1.0;
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _597 = 1.0 / _563;
    float _599 = _589 * _597;
    float _601 = fma(_599, _547, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _603 = _575 * _593;
    float _605 = -_575;
    float _607 = _605 + 1.0;
    float _609 = _601 * _603;
    float _611 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[115].x, _609);
    float _613 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[116].x, _611);
    float _615 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _617 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _623 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _625 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _629 = !_595;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _633 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_96);
        float _651 = 1.0 / _649;
        float _653 = _130 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_49.z;
    float _659 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _661 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _663 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = in.m_49.y;
    float _667 = _150 * 2.0;
    float _669 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _659);
    float _671 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    float _673 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _661);
    float _675 = floor(_667);
    float _677 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _669);
    float _679 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _681 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _673);
    float _683 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _691 = _679 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _695 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _699 = _689 + _697;
    float _701 = _657 * 2.0;
    float _703 = _150 + _657;
    bool _705 = _675 > 0.0;
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _709 = _691 + _707;
    float _711 = _665 + _657;
    bool _713 = _675 >= 0.0;
    bool _715 = isnan(_675);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.0);
    bool _721 = _717 || _719;
    float _723 = floor(_701);
    float _725 = _703 + (-1.0);
    float _727 = _711 + (-1.0);
    float _729 = _130 * _687;
    float _731 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _733 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _737 = _150 + _665;
    float _739 = _665 * 2.0;
    float _741 = exp2(_729);
    float _743 = _737 + (-1.0);
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _747 = _723 > 0.0;
    float _749 = floor(_739);
    bool _751 = _723 >= 0.0;
    bool _753 = isnan(_723);
    bool _755 = _751 || _753;
    bool _757 = isnan(0.0);
    bool _759 = _755 || _757;
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _763 = _683 + _761;
    int _765 = _721 ? 0 : 1;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _769 = _767 != 0;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _773 = _771 != 0;
    int _775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _777 = _775 != 0;
    int _779 = ~_765;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    float _785 = -_741;
    float _787 = _785 + 1.0;
    int _789 = _783;
    if (!_705)
    {
        int _791 = ~_765;
        int _793 = _791 + 1;
        _789 = _793;
    }
    int _795 = _789;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _799 = 1.0 + _797;
    bool _801 = !_773;
    int _803 = _801 ? 0 : 1;
    float _805 = float(_795);
    float _807 = 1.0 / _799;
    int _809 = abs(_803);
    float _811 = in.m_57.x;
    float _813 = in.m_57.y;
    float _815 = in.m_57.z;
    bool _817 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _819 = isnan(0.0);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _825 = _821 || _823;
    float _827 = float(_809);
    bool _829 = _749 > 0.0;
    bool _831 = _749 >= 0.0;
    bool _833 = isnan(_749);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _699 * _699;
    float _843 = _827 * _805;
    float _845 = _825 ? _787 : 0.0;
    float _847 = fma(_763, _763, _841);
    float _849 = _843 * (-2.0);
    int _851 = _759 ? 0 : 1;
    float _853 = _845 * _807;
    bool _855 = !_769;
    int _857 = _855 ? 0 : 1;
    float _859 = fma(_735, _849, _735);
    float _861 = fma(_709, _709, _847);
    bool _863 = !_777;
    int _865 = _863 ? 0 : 1;
    int _867 = ~_851;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = rsqrt(_861);
    int _875 = abs(_857);
    float _877 = fma(_849, _813, _813);
    float _879 = _665 + (-0.5);
    int _881 = _871;
    if (!_747)
    {
        int _883 = ~_851;
        int _885 = _883 + 1;
        _881 = _885;
    }
    int _887 = _881;
    int _889 = _839 ? 0 : 1;
    float _891 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[196].y, _877);
    int _893 = abs(_865);
    int _895 = ~_889;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = _899;
    if (!_829)
    {
        int _903 = ~_889;
        int _905 = _903 + 1;
        _901 = _905;
    }
    int _907 = _901;
    float _909 = _699 * _873;
    float _911 = float(_875);
    float _913 = _763 * _873;
    float _915 = float(_887);
    float _917 = -_909;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _921 = float(_893);
    float _923 = -_913;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _763);
    float _927 = float(_907);
    float _929 = _911 * _915;
    bool _931 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(1.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = _709 * _873;
    float _943 = _921 * _927;
    float _945 = _929 * (-2.0);
    bool _947 = !_939;
    float _949 = _947 ? _130 : _853;
    float _951 = _150 + (-0.5);
    float _953 = _943 * (-2.0);
    float _955 = fma(_945, _811, _811);
    float _957 = fma(_745, _945, _745);
    float _959 = fma(_949, _859, _891);
    float _961 = fma(_953, _815, _815);
    float _963 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[196].x, _955);
    float _965 = _657 + (-0.5);
    float _967 = _959 * 0.15915493667125701904296875;
    float _969 = _919 * _919;
    float _971 = fma(_733, _953, _733);
    float _973 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _975 = -_941;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _979 = fma(_925, _925, _969);
    float _981 = fma(_949, _957, _963);
    float _983 = fma(_949, _971, _973);
    float _985 = _967 * 6.283185482025146484375;
    float _987 = sin(_985);
    float _989 = fma(_977, _977, _979);
    float _991 = _981 * 0.15915493667125701904296875;
    float _993 = _983 * 0.15915493667125701904296875;
    float _995 = in.m_59.x;
    float _997 = in.m_59.y;
    float _999 = in.m_59.z;
    float _1001 = sqrt(_989);
    float _1003 = _967 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = _991 * 6.283185482025146484375;
    float _1009 = sin(_1007);
    float _1011 = _873 * _1001;
    float _1013 = _693 * _1011;
    float _1015 = _695 * _1011;
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _995);
    float _1019 = _991 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _731 * _1011;
    float _1025 = _1015 * _1017;
    float _1027 = _993 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    float _1031 = _1009 * _1005;
    float _1033 = _1009 * _987;
    float _1035 = fma(_130, 0.01200000010430812835693359375, _150);
    float _1037 = _993 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1021 * _987;
    float _1043 = _1021 * _1005;
    float _1045 = -_1041;
    float _1047 = fma(_1029, _1031, _1045);
    float _1049 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _997);
    float _1051 = -_1031;
    float _1053 = fma(_1029, _1041, _1051);
    float _1055 = fma(_1029, _1043, _1033);
    float _1057 = floor(_1035);
    float _1059 = _1013 * _1049;
    float _1061 = fma(_1029, _1033, _1043);
    float _1063 = _1021 * _1039;
    float _1065 = _1009 * _1039;
    float _1067 = _1005 * _1039;
    float _1069 = _987 * _1039;
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _999);
    float _1073 = _1063 * _1059;
    float _1075 = -_1059;
    float _1077 = _1029 * _1075;
    float _1079 = _1023 * _1071;
    float _1081 = fma(_1055, _1025, _1073);
    float _1083 = _1065 * _1059;
    float _1085 = fma(_1067, _1025, _1077);
    float _1087 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1089 = fma(_1053, _1079, _1081);
    float _1091 = fma(_1047, _1025, _1083);
    float _1093 = fma(_1069, _1079, _1085);
    float _1095 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1097 = fma(_1061, _1079, _1091);
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1103 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1095);
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1099);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1101);
    float _1109 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1103);
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1107);
    float _1115 = _691 + _1109;
    float _1117 = _683 + _1111;
    float _1119 = _689 + _1113;
    float _1121 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1115);
    float _1123 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1117);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1119);
    float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1129 = _1121 + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1133 = _1123 + _1131;
    float _1135 = _1129 * _1129;
    float _1137 = fma(_1133, _1133, _1135);
    float _1139 = sqrt(_1137);
    bool _1141 = _1139 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1145 = _1143 != 0;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1157 = _1155 != 0;
    bool _1159 = !_1149;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _1135;
    float _1165 = _1119;
    float _1167 = _1123;
    float _1169 = _1125;
    float _1171 = _919;
    if (!_1141)
    {
        _1163 = _1123;
    }
    float _1173 = _1163;
    bool _1175 = !_1145;
    int _1177 = _1175 ? 0 : 1;
    bool _1179 = !_1153;
    int _1181 = _1179 ? 0 : 1;
    bool _1183 = !_1157;
    float _1185 = _1183 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1187 = _1173;
    float _1189 = _1185;
    if (!_1141)
    {
        _1165 = _1121;
    }
    float _1191 = _1165;
    float _1193 = _1191;
    if (!_1141)
    {
        _1167 = _1125;
    }
    float _1195 = _1167;
    bool _1197 = !_1141;
    float _1199 = _1195;
    if (!_1197)
    {
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1205 = _1139 + _1203;
        float _1207 = rsqrt(_1137);
        float _1209 = _1205 * _1201;
        float _1211 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1213 = _1209 * 0.15915493667125701904296875;
        float _1215 = _1213 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        float _1219 = _1213 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 + (-1.0);
        float _1225 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = fma(_1221, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = fma(_1125, _1217, _1225);
        float _1231 = _1207 * _1227;
        float _1233 = fma(_1133, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1129, _1231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1199 = _1229;
        _1187 = _1233;
        _1193 = _1235;
    }
    float _1237 = _1199;
    float _1239 = _1187;
    float _1241 = _1193;
    float _1243 = -_909;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1237);
    float _1247 = -_913;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _1251 = -_941;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1255 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1257 = _1245 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1261 = _1249 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1265 = _1253 + _1263;
    float _1267 = _1257 * _1257;
    float _1269 = fma(_1261, _1261, _1267);
    float _1271 = fma(_1265, _1265, _1269);
    float _1273 = rsqrt(_1271);
    float _1275 = sqrt(_1271);
    float _1277 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1279 = _1261 * _1277;
    float _1281 = _1265 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 * _1281;
    float _1287 = _1283 + _1285;
    float _1289 = sqrt(_1287);
    bool _1291 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = _1289 + _1293;
    float _1297 = _1269;
    float _1299 = _1287;
    float _1301 = _1295;
    float _1303 = _1257;
    if (_1291)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1305;
    }
    float _1307 = _1297;
    if (_1291)
    {
        float _1309 = rsqrt(_1287);
        _1299 = _1309;
    }
    float _1311 = _1299;
    float _1313 = _1311;
    if (_1291)
    {
        float _1315 = _1295 * _1307;
        _1301 = _1315;
    }
    float _1317 = _1301;
    if (_1291)
    {
        float _1319 = _1317 * 0.15915493667125701904296875;
        _1169 = _1319;
    }
    float _1321 = _1169;
    float _1323 = _1265;
    float _1325 = _1321;
    if (_1291)
    {
        float _1327 = _1321 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        _1323 = _1329;
    }
    float _1331 = _1323;
    float _1333 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1335 = precise::max(0.0, _1333);
    float _1337 = _1307;
    float _1339 = _1335;
    if (_1291)
    {
        float _1341 = _1321 * 6.283185482025146484375;
        float _1343 = cos(_1341);
        _1337 = _1343;
    }
    float _1345 = _1337;
    float _1347 = -_1277;
    float _1349 = -_1335;
    float _1351 = fma(_1257, _1347, _1349);
    if (_1291)
    {
        float _1353 = _1351 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1303 = _1353;
    }
    float _1355 = _1303;
    float _1357 = _1355;
    float _1359 = _1331;
    if (_1291)
    {
        float _1361 = fma(_1331, _1355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1363;
    if (!_1291)
    {
        _1359 = _1279;
    }
    float _1367 = _1359;
    float _1369 = _1367;
    float _1371 = _1345;
    if (_1291)
    {
        float _1373 = _1345 + (-1.0);
        _1339 = _1373;
    }
    float _1375 = _1339;
    float _1377 = _1375;
    if (_1291)
    {
        float _1379 = _1311 * _1363;
        _1171 = _1379;
    }
    float _1381 = _1171;
    if (!_1291)
    {
        _1365 = _1351;
    }
    float _1383 = _1365;
    float _1385 = _1383;
    if (_1291)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1387;
    }
    float _1389 = _1325;
    if (_1291)
    {
        float _1391 = _1279 * _1381;
        _1369 = _1391;
    }
    float _1393 = _1369;
    if (!_1291)
    {
        _1377 = _1281;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1291)
    {
        float _1399 = _1281 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (!_1291)
    {
        _1313 = _1283;
    }
    float _1403 = _1313;
    float _1405 = _1403;
    if (_1291)
    {
        float _1407 = fma(_1351, _1345, _1389);
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (_1291)
    {
        float _1411 = _1393 * _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1291)
    {
        _1371 = _1285;
    }
    float _1415 = _1371;
    float _1417 = _1415;
    if (_1291)
    {
        float _1419 = _1401 * _1401;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1427 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1429 = _1423 + _1421;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1433 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1431);
    float _1435 = precise::clamp(_1433, 0.0, 1.0);
    float _1437 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1439 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1425);
    float _1441 = _1245 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = -_1435;
    float _1445 = _1443 + 1.0;
    float _1447 = rsqrt(_1429);
    float _1449 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1437);
    float _1451 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1453 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1455 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1457 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1449);
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1461 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1453);
    float _1463 = abs(_1445);
    float _1465 = log2(_1463);
    float _1467 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1469 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1473 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1427);
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1477 = -_1469;
    float _1479 = fma(_1477, _1455, 1.0);
    float _1481 = _1447 * _1393;
    float _1483 = _1447 * _1409;
    float _1485 = _1447 * _1401;
    float _1487 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1473);
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1475);
    float _1493 = log2(_1479);
    float _1495 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1497 = -_1489;
    float _1499 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1497);
    float _1501 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1491);
    float _1503 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1505 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1507 = -_1485;
    float _1509 = fma(_1507, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1499);
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1501);
    float _1513 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1515 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1505);
    float _1517 = fma(_1509, -0.5, 0.5);
    float _1519 = exp2(_1503);
    float _1521 = fma(_1509, 0.5, 0.5);
    float _1523 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1513);
    float _1525 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1515);
    float _1527 = _1483 + 1.0;
    float _1529 = fma(_1521, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1531 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1523);
    float _1533 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1525);
    float _1535 = sqrt(_1517);
    float _1537 = fma(_1521, _1529, -0.212114393711090087890625);
    float _1539 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1531);
    float _1541 = _1493 * 0.693147182464599609375;
    float _1543 = fma(_1521, _1537, 1.570728778839111328125);
    float _1545 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1547 = 1.0 / _1511;
    float _1549 = -_1483;
    float _1551 = fma(_1519, _1527, _1549);
    float _1553 = _1535 * 0.636619746685028076171875;
    float _1555 = _1539 * _1547;
    float _1557 = _1533 * _1547;
    float _1559 = -_1543;
    float _1561 = fma(_1553, _1559, 1.0);
    float _1563 = fma(_1551, 0.5, 0.5);
    float _1565 = fma(_1555, 0.5, 0.5);
    float _1567 = fma(_1557, -0.5, 0.5);
    float3 _4950 = float3(_1565, _1567, _1545);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4950, float3(0.0), isnan(_4950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4950, float3(0.0), isnan(_4950)), level(0.0)).x;
    float3 _4961 = float3(_1565, _1567, _1545);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4961, float3(0.0), isnan(_4961)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4961, float3(0.0), isnan(_4961)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4978 = float2(_1561, _1563);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4978, float2(0.0), isnan(_4978)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4978, float2(0.0), isnan(_4978)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1594 = int(_1592);
    out.m_61.x = _619;
    out.m_61.y = _621;
    out.m_61.z = _627;
    out.m_61.w = _625;
    bool _1596 = _665 > 0.5;
    float _1598 = -_909;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1604 = _1602 != 0;
    float _1606 = -_913;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    bool _1610 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1612 = isnan(0.5);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1618 = _1614 || _1616;
    float _1620 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1622 = int(_1620);
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1626 = _1624 != 0;
    float _1628 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1630 = -_941;
    float _1632 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _691);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1636 = _1634 != 0;
    float _1638 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1628);
    float _1640 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1642 = float(_1594);
    float _1644 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1638);
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1650 = 1.0 / _1642;
    float _1652 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1654 = float(uint(_1622));
    float _1656 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1658 = ~_1622;
    int _1660 = _1658 + 1;
    float _1662 = _1467 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1664 = float(_1622);
    float _1666 = 1.0 / _1654;
    int _1668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1670 = _1668 != 0;
    float _1672 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1662);
    out.m_63.y = _1013;
    float _1674 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1672);
    float _1676 = _130 * _1650;
    float _1678 = 1.0 / _1648;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1682 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1686 = _1684 != 0;
    out.m_65.x = _1249;
    out.m_65.y = _1245;
    out.m_65.z = _1253;
    float _1688 = float(_96);
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1692 = as_type<int>(_1666) + (-2);
    float _1694 = trunc(_1676);
    int _1696 = int(_1694);
    bool _1698 = !_1686;
    float _1700 = _1698 ? 1.2345600128173828125 : 1.0;
    bool _1702 = !_1686;
    float _1704 = _1702 ? _665 : _150;
    float _1706 = _1700 * _1704;
    float _1708 = 1.0 / _1688;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1712 = float(uint(_1696));
    float _1714 = float(_1696);
    float _1716 = floor(_1706);
    float _1718 = as_type<float>(_1692) * _1712;
    float _1720 = in.m_49.w;
    float _1722 = trunc(_1718);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    float _1728 = -_1716;
    float _1730 = _1706 + _1728;
    float _1732 = exp2(_1656);
    int _1734 = _1660 * int(_1726);
    int _1736 = _1734 + _1696;
    float _1738 = float(uint(_1736));
    float _1740 = -_156;
    float _1742 = _1740 + 1.0;
    float _1744 = -_1732;
    float _1746 = _1744 + 1.0;
    float _1748 = as_type<float>(_1692) * _1738;
    int _1750 = _1596 ? as_type<int>(_1742) : as_type<int>(_156);
    bool _1752 = _1720 > 0.5;
    float _1754 = trunc(_1748);
    float _1756 = precise::max(_1754, 0.0);
    uint _1758 = uint(_1756);
    float _1760 = _1626 ? as_type<float>(_1750) : _156;
    float _1762 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1764 = _1604;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (_1604)
    {
        float _1768 = _1752 ? _1742 : _156;
        _218 = _1768;
    }
    float _1770 = _218;
    int _1772 = ~_1622;
    int _1774 = _1772 + 1;
    int _1776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1778 = _1776 != 0;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    if (_1636)
    {
        bool _1782 = _150 > 0.5;
        _1764 = _1782;
    }
    bool _1784 = _1764;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1788 = _1786 != 0;
    float _1790 = -_1780;
    float _1792 = fma(_1640, 2.0, _1790);
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1796 = int(_1726) + int(_1758);
    float _1798 = as_type<float>(_1758);
    float _1800 = _1794;
    if (!_1686)
    {
        _1798 = _665;
    }
    float _1802 = _1798;
    float _1804 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1794);
    float _1806 = _1802;
    if (!_1686)
    {
        _1800 = _657;
    }
    float _1808 = _1800;
    int _1810 = _1774 * _1796;
    int _1812 = _1810 + _1696;
    float _1814 = _1808;
    if (!_1686)
    {
        _1766 = _657;
    }
    float _1816 = _1766;
    float _1818 = -_130;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1792);
    float _1822 = _1816;
    if (_1686)
    {
        _1806 = _150;
    }
    float _1824 = _1806;
    if (_1686)
    {
        _1814 = _665;
    }
    float _1826 = _1814;
    if (_1686)
    {
        _1822 = _665;
    }
    float _1828 = _1822;
    bool _1830 = uint(_1812) >= uint(_1622);
    bool _1832 = _1714 >= _1664;
    bool _1834 = isnan(_1714);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan(_1664);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _665 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1848 = !_1830;
    int _1850 = _1848 ? 0 : (-1);
    float _1852 = fma(_1844, -2.0, _1710);
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1858 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1846);
    bool _1860 = _1830;
    if (_1778)
    {
        bool _1862 = _657 > 0.5;
        _1860 = _1862;
    }
    bool _1864 = _1860;
    float _1866 = trunc(_1842);
    int _1868 = int(_1866);
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1870;
    float _1874 = _130 * _1664;
    int _1876 = ~_1796;
    int _1878 = _1876 + _1850;
    int _1880 = _1878 + 1;
    float _1882 = _1872 * _1678;
    float _1884 = _1664 * _1730;
    float _1886 = _1874 * _1708;
    float _1888 = 1.0 / _1856;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _1890 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1894 = _1622 * _1880;
    int _1896 = _1894 + _1696;
    bool _1898 = !_1670;
    int _1900 = _1898 ? 0 : 1;
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1904 = _655 + _1902;
    bool _1906 = _1622 == 0;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1908;
    float _1912 = 1.0 / _1892;
    int _1914 = ~_1868;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    float _1920 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1852);
    bool _1922 = !_1906;
    int _1924 = _1922 ? _1896 : (-1);
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1930 = _1622 + (-1);
    float _1932 = in.m_51.x;
    int _1934 = abs(_1900);
    float _1936 = trunc(_1884);
    int _1938 = int(_1936);
    float _1940 = _1910 * _1888;
    float _1942 = fma(_1882, _1904, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1944 = _1918 * _1924;
    int _1946 = abs(_1161);
    int _1948 = _1868 * _1930;
    int _1950 = _1948 + _1944;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1956 = _655 + _1954;
    float _1958 = _1928 * _1912;
    int _1960 = abs(_1177);
    int _1962 = _1950 * _1946;
    float _1964 = fma(_1940, _1956, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1968 = _655 + _1966;
    int _1970 = abs(as_type<int>(_1185));
    float _1972 = trunc(_1886);
    int _1974 = int(_1972);
    int _1976 = _1938 * _1934;
    int _1978 = _1976 + _1696;
    int _1980 = abs(_1181);
    float _1982 = fma(_1958, _1968, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1984 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1986 = ~_1622;
    int _1988 = _1986 + 1;
    int _1990 = as_type<int>(_1910);
    float _1992 = _1932;
    if (_1778)
    {
        float _1994 = -_1932;
        float _1996 = _1994 + 1.0;
        _1990 = as_type<int>(_1996);
    }
    int _1998 = _1990;
    float _2000 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2004 = as_type<int>(_2002);
    if (!_1636)
    {
        _1189 = _1932;
    }
    float _2006 = _1189;
    int _2008 = _1974 * _1960;
    int _2010 = _2008 + _1962;
    float _2012 = fma(_2000, _1760, -0.5);
    bool _2014 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2016 = isnan(_655);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2022 = _2018 || _2020;
    float _2024 = float(_2022);
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2028 = _1978 * _1980;
    int _2030 = _2028 + _2010;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2034 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1858);
    bool _2036 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2038 = isnan(_655);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    int _2048 = _1938 * _1970;
    int _2050 = _2048 + _2030;
    float _2052 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2032);
    float _2054 = -_1920;
    float _2056 = fma(_2034, _2012, _2054);
    bool _2058 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2060 = isnan(_655);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2066);
    float _2070 = -_2024;
    float _2072 = _2070 + 1.0;
    float _2074 = float(uint(_2050));
    bool _2076 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2078 = isnan(_655);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = _2068 * _2072;
    float _2090 = as_type<float>(_1692) * _2074;
    float _2092 = -_2068;
    float _2094 = _2092 + 1.0;
    float _2096 = -_2086;
    float _2098 = _2096 + 1.0;
    float _2100 = trunc(_2090);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2108 = _2046 * _2098;
    float _2110 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2112 = _2086 * _2094;
    float _2114 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2106);
    float _2116 = -_2046;
    float _2118 = _2116 + 1.0;
    float _2120 = -_2002;
    float _2122 = fma(_2110, 2.0, _2120);
    float _2124 = _1942 * _2108;
    float _2126 = fma(_1984, -2.0, _2026);
    float _2128 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2114);
    float _2130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2052);
    float _2134 = _2006;
    if (_1636)
    {
        float _2136 = -_1932;
        float _2138 = _2136 + 1.0;
        _2004 = as_type<int>(_2138);
    }
    int _2140 = _2004;
    int _2142 = _1988 * int(_2104);
    int _2144 = _2142 + _2050;
    if (_1636)
    {
        float _2146 = _1784 ? as_type<float>(_2140) : _1932;
        _2134 = _2146;
    }
    float _2148 = _2134;
    float _2150 = float(uint(_2144));
    float _2152 = fma((*spvDescriptorSet0.vp_c9)._m0[85].y, _1770, -0.5);
    float _2154 = float(uint(_1978));
    if (_1778)
    {
        float _2156 = _1864 ? as_type<float>(_1998) : _1932;
        _1992 = _2156;
    }
    float _2158 = _1992;
    float _2160 = as_type<float>(_1692) * _2150;
    float _2162 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2124);
    float _2164 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1804);
    float _2166 = as_type<float>(_1692) * _2154;
    float _2168 = trunc(_2160);
    float _2170 = precise::max(_2168, 0.0);
    uint _2172 = uint(_2170);
    float _2174 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2126);
    float _2176 = -_130;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2122);
    int _2180 = ~_1622;
    int _2182 = _2180 + 1;
    float _2184 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2186 = -_2174;
    float _2188 = fma(_2132, _2152, _2186);
    float _2190 = fma(_1982, _2112, _2162);
    float _2192 = trunc(_2166);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    float _2198 = fma(_2184, _2148, -0.5);
    int _2200 = ~_1622;
    int _2202 = _2200 + 1;
    float _2204 = fma(_2158, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _2206 = fma(_1964, _2088, _2190);
    float _2208 = fma(_2164, _2198, _1820);
    float _2210 = fma(_2128, _2204, _2178);
    int _2212 = int(_2104) + int(_2172);
    float _2214 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2206);
    float _2216 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2218 = _2188 + 0.5;
    float _2220 = _2208 + 0.5;
    int _2222 = _2182 * _2212;
    int _2224 = _2222 + _2050;
    float _2226 = _995 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2228 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2216);
    int _2230 = _2202 * int(_2196);
    int _2232 = _2230 + _1978;
    float _2234 = _997 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2236 = uint(_2224) >= uint(_1622);
    float _2238 = _2214 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2240 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2228);
    float _2242 = float(uint(_2232));
    float _2244 = -_2234;
    float _2246 = _1029 * _2244;
    bool _2248 = !_2236;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2254 = _1063 * _2234;
    float _2256 = as_type<float>(_1692) * _2242;
    int _2258 = ~_2212;
    int _2260 = _2258 + _2250;
    int _2262 = _2260 + 1;
    float _2264 = _2056 + 0.5;
    float _2266 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2268 = _2210 + 0.5;
    float _2270 = trunc(_2256);
    float _2272 = precise::max(_2270, 0.0);
    uint _2274 = uint(_2272);
    int _2276 = _1622 * _2262;
    int _2278 = _2276 + _2050;
    float _2280 = _1065 * _2234;
    out.m_67.x = _2220;
    out.m_67.y = _2264;
    out.m_67.z = _2268;
    out.m_67.w = _2218;
    float _2282 = _2252 + _2266;
    bool _2284 = !_1906;
    int _2286 = _2284 ? _2278 : (-1);
    float _2288 = 1.0 / _2266;
    float _2290 = fma(_1067, _2226, _2246);
    float _2292 = _2210;
    float _2294 = _2220;
    if (!_1618)
    {
        _2292 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2296 = _2292;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2300 = _2286 >> 31;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2304 = _2286 & 3;
    bool _2306 = _2304 != 0;
    float _2308 = _2298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2310 = int(_2196) + int(_2274);
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2314 = _2300 & 3;
    float _2316 = fma(_1055, _2226, _2254);
    int _2318 = ~_1622;
    int _2320 = _2318 + 1;
    float _2322 = fma(_1047, _2226, _2280);
    int _2324 = _2286 + _2314;
    out.m_69.x = _2308;
    out.m_69.y = _2312;
    out.m_69.z = _1690;
    out.m_69.w = _2238;
    float _2326 = _2282 * _2288;
    float _2328 = _2326 * 0.5;
    int _2330 = _2320 * _2310;
    int _2332 = _2330 + _1978;
    int _2334 = _2324 >> 2;
    float _2336 = fma(_1053, _1652, _2316);
    float _2338 = as_type<float>(_2324);
    float _2340 = _2312;
    if (!_1618)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2344 = fma(_2328, _2296, _2342);
        _2294 = _2344;
    }
    float _2346 = _2294;
    if (!_1618)
    {
        _2338 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2348 = _2338;
    float _2350 = fma(_1069, _1652, _2290);
    int _2352 = _2334 << 4;
    int _2354 = _2352 + 512;
    float _2356 = _2218;
    if (!_1618)
    {
        float _2358 = 1.0 / _2346;
        _2356 = _2358;
    }
    float _2360 = _2356;
    bool _2362 = uint(_2332) >= uint(_1622);
    float _2364 = fma(_1061, _1652, _2322);
    uint _2366 = uint(int(uint(_2354) >> uint(2)));
    uint _2368 = uint(int(uint(int(_2366)) >> uint(2)));
    int _2370 = int(_2366) & 3;
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[int(_2368)][_2370];
    int _2374 = int(_2366) + 1;
    uint _2376 = uint(int(uint(_2374) >> uint(2)));
    int _2378 = _2374 & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = _2286 & 3;
    if (!_1618)
    {
        float _2384 = -_2348;
        float _2386 = _2384 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2340 = _2386;
    }
    float _2388 = _2340;
    bool _2390 = !_2362;
    int _2392 = _2390 ? 0 : (-1);
    float _2394 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2396 = uint(_2382) > 1u;
    float _2398 = _1690;
    float _2400 = _2388;
    if (!_1618)
    {
        float _2402 = 1.0 / _2388;
        _2398 = _2402;
    }
    float _2404 = _2398;
    bool _2406 = _2382 != 3;
    int _2408 = _2354 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    float _2426 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2394);
    int _2428 = ~_2310;
    int _2430 = _2428 + _2392;
    int _2432 = _2430 + 1;
    float _2434 = _1762 * _1569;
    bool _2436 = uint(_2382) >= 2u;
    float _2438 = _2360;
    if (!_1618)
    {
        float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2442 = -_2348;
        float _2444 = fma(_2360, _2440, _2442);
        _2438 = _2444;
    }
    float _2446 = _2438;
    float _2448 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2450 = _2336 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2452 = !_2306;
    int _2454 = _2452 ? 0 : 1;
    int _2456 = _1622 * _2432;
    int _2458 = _2456 + _1978;
    float _2460 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2448);
    float _2462 = _2448;
    if (_1618)
    {
        _2462 = 1.0;
    }
    float _2464 = _2462;
    float _2466 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2450);
    float _2468 = -_1762;
    float _2470 = _2468 + 1.0;
    float _2472 = _2464;
    if (!_1618)
    {
        float _2474 = _2446 * _2404;
        float _2476 = precise::clamp(_2474, 0.0, 1.0);
        _2400 = _2476;
    }
    float _2478 = _2400;
    int _2480 = _2306 ? 0 : 1;
    int _2482 = _2436 ? 0 : 1;
    if (!_1618)
    {
        float _2484 = -_2478;
        float _2486 = _2484 + 1.0;
        _2472 = _2486;
    }
    float _2488 = _2472;
    int _2490 = ~_2480;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2494;
    if (!_2396)
    {
        int _2498 = ~_2480;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    bool _2504 = _2382 != 3;
    float _2506 = _1590 * _2434;
    int _2508 = abs(_2502);
    float _2510 = _1580 * _2470;
    int _2512 = abs(_2454);
    float _2514 = fma(_1580, _2506, _1578);
    int _2516 = ~_2482;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    bool _2522 = !_2504;
    int _2524 = _2522 ? 0 : (-1);
    int _2526 = _2520;
    if (_2406)
    {
        int _2528 = ~_2482;
        int _2530 = _2528 + 1;
        _2526 = _2530;
    }
    int _2532 = _2526;
    int _2534 = ~_2508;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    int _2540 = abs(_2524);
    int _2542 = abs(_2532);
    int _2544 = ~_2512;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    int _2550 = _2538 * as_type<int>(_2380);
    bool _2552 = !_1788;
    int _2554 = _2552 ? 0 : 1;
    int _2556 = _2548 * as_type<int>(_2372);
    int _2558 = _2556 + _2550;
    int _2560 = ~_2542;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    int _2566 = abs(_2554);
    int _2568 = ~_2540;
    int _2570 = _2568 + 1;
    int _2572 = _2570 + 1;
    int _2574 = _2564 * as_type<int>(_2416);
    int _2576 = _2574 + _2558;
    float _2578 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2426);
    bool _2580 = !_1906;
    int _2582 = _2580 ? _2458 : (-1);
    int _2584 = _2572 * as_type<int>(_2424);
    int _2586 = _2584 + _2576;
    int _2588 = ~_2566;
    int _2590 = _2588 + 1;
    int _2592 = _2590 + 1;
    float _2594 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2460);
    float _2596 = fma(_2364, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2466);
    float _2598 = _2488 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2600 = _2488 > 0.0;
    bool _2602 = isnan(_2488);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan(0.0);
    bool _2608 = _2604 || _2606;
    int _2610 = _2592 * _2586;
    float _2612 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2614 = _1682 + _2612;
    out.m_71.x = _2594;
    out.m_71.y = _2578;
    out.m_71.z = _2596;
    float _2616 = _362 * _2598;
    int _2618 = _2582 * _2566;
    int _2620 = _2618 + _2610;
    float _2622 = _1511 + _2614;
    out.gl_Position.x = _1539;
    out.gl_Position.y = _1533;
    out.gl_Position.z = _2614;
    out.gl_Position.w = _1511;
    float _2624 = _2622 * 0.5;
    float _2626 = float(_2620);
    float _2628 = _1580 * _2434;
    float _2630 = _2616 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2624;
    out.m_73.w = _1511;
    float _2632 = fma(_1586, _2628, _1574);
    float _2634 = fma(_1588, _2628, _1576);
    out.m_75.y = _2626;
    out.m_45.x = _2630;
    out.m_77.x = _2632;
    out.m_77.y = _2634;
    out.m_77.z = _2514;
    out.m_77.w = _2510;
    if (_2608)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2636 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2636;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

