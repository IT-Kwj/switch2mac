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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad5 [[user(locn5)]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_63 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _536 = false;
    bool _314 = false;
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
        float _1804 = as_type<float>(_108);
        out.gl_Position.z = _1804;
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
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1873 = as_type<float>(_144);
        out.gl_Position.z = _1873;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_51.z;
    float _152 = in.m_49.y;
    float _154 = in.m_53.z;
    float _156 = in.m_51.y;
    float _158 = in.m_53.y;
    float _160 = _146 * _146;
    float _162 = in.m_49.x;
    float _164 = fma(_150, _150, _160);
    float _166 = in.m_51.x;
    float _168 = _152 * _152;
    float _170 = in.m_53.x;
    float _172 = fma(_154, _154, _164);
    float _174 = fma(_156, _156, _168);
    float _176 = sqrt(_172);
    float _178 = fma(_158, _158, _174);
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    float _186 = sqrt(_178);
    bool _188 = _176 > 0.0;
    bool _190 = _186 > 0.0;
    float _192 = as_type<float>(_144);
    if (_188)
    {
        float _194 = rsqrt(_172);
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _152 * _182;
    float _200 = _156 * _182;
    float _202 = _158 * _182;
    float _204 = 0.0;
    if (!_188)
    {
        _204 = 0.0;
    }
    float _206 = _204;
    float _208 = fma(_180, _162, _198);
    float _210 = fma(_180, _166, _200);
    float _212 = fma(_180, _170, _202);
    float _214 = _178;
    float _216 = _206;
    if (_190)
    {
        float _218 = rsqrt(_178);
        _214 = _218;
    }
    float _220 = _214;
    float _222 = 0.0;
    if (!_190)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    float _226 = fma(_146, _184, _208);
    float _228 = 0.0;
    float _230 = _224;
    if (!_190)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = fma(_150, _184, _210);
    float _236 = 0.0;
    float _238 = _232;
    if (!_190)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = fma(_154, _184, _212);
    float _244 = 0.0;
    float _246 = _240;
    if (!_188)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _196;
    float _252 = _248;
    if (_188)
    {
        float _254 = _196 * 0.001000000047497451305389404296875;
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_188)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = _260;
    if (_188)
    {
        float _264 = _150 * _256;
        _216 = _264;
    }
    float _266 = _216;
    if (_188)
    {
        float _268 = _146 * _256;
        _252 = _268;
    }
    float _270 = _252;
    if (_188)
    {
        float _272 = _154 * _256;
        _262 = _272;
    }
    float _274 = _262;
    if (_190)
    {
        float _276 = _220 * _156;
        _230 = _276;
    }
    float _278 = _230;
    float _280 = _278;
    if (_190)
    {
        float _282 = _220 * _152;
        _238 = _282;
    }
    float _284 = _238;
    float _286 = _284;
    if (_190)
    {
        float _288 = _220 * _158;
        _246 = _288;
    }
    float _290 = _246;
    bool _292 = !_148;
    float _294 = _290;
    float _312;
    if (!_292)
    {
        float _296 = in.m_57.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_92);
        float _318 = 1.0 / _316;
        float _320 = _126 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _322 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _322 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = _322 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _344;
    float _348 = 1.0 / _342;
    bool _350 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_322);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _338;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = 1.0 / _346;
    float _372 = _326 * _348;
    bool _374 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _376 = isnan(_322);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_384;
    float _388 = _386 + 1.0;
    float _390 = _330 * _364;
    bool _392 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _394 = isnan(_322);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = fma(_368, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -_402;
    float _408 = _406 + 1.0;
    float _410 = _334 * _370;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _416;
    float _420 = _360 * _408;
    float _422 = -_360;
    float _424 = _422 + 1.0;
    float _426 = fma(_414, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _428 = fma(_418, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _430 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_322);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = _384 * _424;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _440 * _388;
    float _454 = -_440;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = fma(_444, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _464 = _404 * _452;
    float _466 = _426 * _452;
    float _468 = _428 * _452;
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _468);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = fma(_460, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _482;
    float _486 = fma(_450, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_462, _446, _470);
    float _494 = fma(_478, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_484, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_490, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_480, _446, _472);
    float _502 = fma(_486, _446, _474);
    float _504 = fma(_494, _420, _492);
    float _506 = fma(_496, _420, _500);
    float _508 = fma(_498, _420, _502);
    float _510 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    float _514 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].z, _508);
    bool _516 = !_362;
    float _534;
    if (!_516)
    {
        float _518 = in.m_57.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_92);
        float _540 = 1.0 / _538;
        float _542 = _126 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = _226 * _226;
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    float _558 = fma(_234, _234, _550);
    float _560 = fma(_242, _242, _558);
    float _562 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _564 = rsqrt(_560);
    float _566 = _546 * 100.0;
    float _568 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[191].w, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    bool _570 = _552 > 0.0;
    float _572 = fma(_562, _568, _566);
    float _574 = _234 * _564;
    bool _576 = _552 >= 0.0;
    bool _578 = isnan(_552);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = in.m_61.x;
    float _588 = in.m_61.y;
    float _590 = in.m_61.z;
    float _592 = _572 + _554;
    int _594 = _584 ? 0 : 1;
    float _596 = in.m_42.x;
    float _598 = in.m_42.y;
    float _600 = in.m_42.z;
    float _602 = abs(_552);
    float _604 = fma(_602, 2.0, _592);
    float _606 = _226 * _564;
    float _608 = _242 * _564;
    float _610 = _604 * 0.15915493667125701904296875;
    float _612 = _606 * _284;
    float _614 = _610 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = fma(_574, _278, _612);
    int _620 = ~_594;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    int _626 = _624;
    float _628 = _608;
    if (!_570)
    {
        int _630 = ~_594;
        int _632 = _630 + 1;
        _626 = _632;
    }
    int _634 = _626;
    float _636 = fma(_608, _290, _618);
    float _638 = float(_634);
    float _640 = abs(_636);
    bool _642 = _640 > 0.99989998340606689453125;
    float _644 = _510 * _586;
    float _646 = _512 * _588;
    float _648 = _514 * _590;
    float _650 = _156 * _598;
    float _652 = _616 * _638;
    float _654 = _152 * _598;
    float _656 = _158 * _598;
    float _658 = fma(_166, _596, _650);
    float _660 = _652 * 0.15915493667125701904296875;
    float _662 = fma(_162, _596, _654);
    float _664 = fma(_170, _596, _656);
    if (_642)
    {
        float _666 = _278 + _266;
        _280 = _666;
    }
    float _668 = _280;
    if (_642)
    {
        float _670 = _290 + _274;
        _294 = _670;
    }
    float _672 = _294;
    if (_642)
    {
        float _674 = _284 + _270;
        _286 = _674;
    }
    float _676 = _286;
    float _678 = _660 * 6.283185482025146484375;
    float _680 = sin(_678);
    float _682 = -_668;
    float _684 = _608 * _682;
    float _686 = -_672;
    float _688 = _606 * _686;
    float _690 = in.m_53.w;
    float _692 = fma(_150, _600, _658);
    float _694 = -_672;
    float _696 = -_684;
    float _698 = fma(_574, _694, _696);
    float _700 = -_676;
    float _702 = -_688;
    float _704 = fma(_608, _700, _702);
    float _706 = -_676;
    float _708 = _574 * _706;
    float _710 = _660 * 6.283185482025146484375;
    float _712 = cos(_710);
    float _714 = _698 * _698;
    float _716 = in.m_49.w;
    float _718 = -_668;
    float _720 = -_708;
    float _722 = fma(_606, _718, _720);
    float _724 = fma(_146, _600, _662);
    float _726 = fma(_704, _704, _714);
    float _728 = in.m_51.w;
    float _730 = fma(_154, _600, _664);
    float _732 = fma(_722, _722, _726);
    float _734 = _680 * _552;
    float _736 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _554);
    float _742 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = rsqrt(_732);
    float _746 = _712 * _552;
    float _748 = -_734;
    float _750 = fma(_712, _556, _748);
    float _752 = _736 * _740;
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _762 = _758 || _760;
    float _764 = fma(_680, _556, _746);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _750);
    float _768 = _730 + _690;
    bool _770 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _772 = isnan(0.5);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _778 = _774 || _776;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _764);
    float _782 = _738 * _766;
    float _784 = _724 + _716;
    float _786 = _752 * _608;
    float _788 = _742 * _780;
    float _790 = _692 + _728;
    float _792 = _698 * _744;
    float _794 = _722 * _744;
    float _796 = _704 * _744;
    float _798 = _784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _800 = _574 * _792;
    float _802 = fma(_788, _794, _786);
    float _804 = _752 * _574;
    float _806 = _606 * _794;
    float _808 = -_800;
    float _810 = fma(_606, _796, _808);
    float _812 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].x, _798);
    float _814 = fma(_788, _796, _804);
    float _816 = -_806;
    float _818 = fma(_608, _792, _816);
    float _820 = fma(_782, _810, _802);
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    float _824 = fma(_782, _818, _814);
    float _826 = _768 + _820;
    float _828 = _822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _830 = _784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = _790 + _824;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _836 = _826 + _834;
    float _838 = 1.0 / _828;
    float _840 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _844 = _832 + _842;
    float _846 = _836 * _836;
    float _848 = _752 * _606;
    float _850 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[10].z, _840);
    float _852 = _608 * _796;
    float _854 = fma(_844, _844, _846);
    float _856 = fma(_788, _792, _848);
    float _858 = _850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _860 = -_852;
    float _862 = fma(_574, _794, _860);
    float _864 = sqrt(_854);
    float _866 = _858 + _828;
    float _868 = fma(_782, _862, _856);
    float _870 = _866 * _838;
    float _872 = _870 * 0.5;
    float _874 = _784 + _868;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _876);
    float _880 = 1.0 / _878;
    bool _882 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = _868;
    float _886 = _788;
    float _888 = _846;
    float _890 = _864;
    float _892 = _862;
    float _894 = _878;
    float _896 = _832;
    if (!_882)
    {
        _884 = _832;
    }
    float _898 = _884;
    float _900 = _898;
    if (!_882)
    {
        _886 = _826;
    }
    float _902 = _886;
    float _904 = _902;
    if (!_882)
    {
        _888 = _874;
    }
    float _906 = _888;
    bool _908 = !_882;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _864 + _914;
        float _918 = _874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _920 = rsqrt(_854);
        float _922 = _916 * _912;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = fma(_932, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _940 = fma(_874, _928, _936);
        float _942 = _920 * _938;
        float _944 = fma(_844, _942, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_836, _942, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _904 = _946;
        _900 = _944;
        _910 = _940;
        _890 = _924;
        _892 = _936;
    }
    float _948 = _904;
    float _950 = _900;
    float _952 = _910;
    float _954 = _890;
    float _956 = _892;
    float _958 = _956;
    float _960 = _952;
    float _962 = _950;
    float _964 = _948;
    float _966 = _954;
    if (_778)
    {
        _958 = 1.0;
    }
    float _968 = _958;
    float _970 = _968;
    if (!_762)
    {
        float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _974 = _784 + _972;
        float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _978 = _790 + _976;
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _982 = -_768;
        float _984 = _982 + _948;
        float _986 = _974 * _974;
        float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _990 = _768 + _988;
        float _992 = fma(_978, _978, _986);
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _996 = fma(_990, _990, _992);
        float _998 = sqrt(_996);
        float _1000 = _980 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1002 = -_790;
        float _1004 = _1002 + _950;
        float _1006 = precise::min(_998, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1008 = _1006 * _994;
        float _1010 = _1000 * _1008;
        float _1012 = -_784;
        float _1014 = _1012 + _952;
        float _1016 = fma(_1004, _1010, _790);
        float _1018 = fma(_1014, _1010, _784);
        float _1020 = fma(_984, _1010, _768);
        _894 = _1004;
        _960 = _1018;
        _962 = _1016;
        _964 = _1020;
        _966 = _1014;
        _896 = _1010;
    }
    float _1022 = _894;
    float _1024 = _960;
    float _1026 = _962;
    float _1028 = _964;
    float _1030 = _966;
    float _1032 = _896;
    float _1034 = _1032;
    float _1036 = _1022;
    float _1038 = _1030;
    if (_778)
    {
        _1034 = 1.0;
    }
    float _1040 = _1034;
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1044 = _880 * _1042;
    float _1046 = _1040;
    if (!_778)
    {
        float _1048 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1056 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1054;
        float _1058 = _1050 * 6.283185482025146484375;
        float _1060 = cos(_1058);
        float _1062 = _1052 * 0.15915493667125701904296875;
        float _1064 = _1050 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = 1.0 / _1060;
        float _1070 = _1062 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1066 * _1068;
        float _1076 = _1062 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1072 * _1074;
        float _1082 = 1.0 / _1056;
        float _1084 = 1.0 / _1080;
        float _1086 = _1078 * _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1090 = fma(_1044, _1086, _1088);
        float _1092 = _1090 * _1082;
        float _1094 = precise::clamp(_1092, 0.0, 1.0);
        _1036 = _1074;
        _1038 = _1082;
        _970 = _1094;
    }
    float _1096 = _1036;
    float _1098 = _1038;
    float _1100 = _970;
    float _1102 = _1096;
    float _1104 = _1098;
    if (!_778)
    {
        float _1106 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1112 = _1108 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        float _1116 = _1110 * 0.15915493667125701904296875;
        float _1118 = _1108 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = 1.0 / _1114;
        float _1124 = _1116 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1120 * _1122;
        float _1130 = _1116 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1126 * _1128;
        float _1136 = 1.0 / _1134;
        float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1140 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1138;
        float _1142 = 1.0 / _1140;
        float _1144 = _1132 * _1136;
        float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1148 = fma(_1044, _1144, _1146);
        float _1150 = _1148 * _1142;
        float _1152 = precise::clamp(_1150, 0.0, 1.0);
        float _1154 = -_1152;
        float _1156 = _1154 + 1.0;
        _1102 = _1122;
        _1104 = _1108;
        _1046 = _1156;
    }
    float _1158 = _1102;
    float _1160 = _1104;
    float _1162 = _1046;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1166 = _1024 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1170 = _1026 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1174 = _1028 + _1172;
    float _1176 = _1166 * _1166;
    float _1178 = fma(_1170, _1170, _1176);
    float _1180 = fma(_1174, _1174, _1178);
    float _1182 = rsqrt(_1180);
    float _1184 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1186 = _1170 * _1184;
    float _1188 = _1174 * _1184;
    float _1190 = _1186 * _1186;
    float _1192 = _1188 * _1188;
    float _1194 = _1190 + _1192;
    float _1196 = sqrt(_1194);
    bool _1198 = _1196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1196 + _1200;
    float _1204 = _1158;
    float _1206 = _1194;
    float _1208 = _1202;
    float _1210 = _1166;
    float _1212 = _1184;
    float _1214 = _1186;
    if (_1198)
    {
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1204 = _1216;
    }
    float _1218 = _1204;
    if (_1198)
    {
        float _1220 = rsqrt(_1194);
        _1206 = _1220;
    }
    float _1222 = _1206;
    float _1224 = _1218;
    if (_1198)
    {
        float _1226 = _1202 * _1218;
        _1208 = _1226;
    }
    float _1228 = _1208;
    if (_1198)
    {
        float _1230 = _1228 * 0.15915493667125701904296875;
        _1224 = _1230;
    }
    float _1232 = _1224;
    float _1234 = _1174;
    float _1236 = _1232;
    if (_1198)
    {
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        _1234 = _1240;
    }
    float _1242 = _1234;
    float _1244 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1246 = precise::max(0.0, _1244);
    float _1248 = _1160;
    float _1250 = _1246;
    if (_1198)
    {
        float _1252 = _1232 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        _1248 = _1254;
    }
    float _1256 = _1248;
    float _1258 = -_1184;
    float _1260 = -_1246;
    float _1262 = fma(_1166, _1258, _1260);
    if (_1198)
    {
        float _1264 = _1262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1210 = _1264;
    }
    float _1266 = _1210;
    float _1268 = _1266;
    float _1270 = _1242;
    if (_1198)
    {
        float _1272 = fma(_1242, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1268 = _1272;
    }
    float _1274 = _1268;
    float _1276 = _1274;
    if (!_1198)
    {
        _1270 = _1190;
    }
    float _1278 = _1270;
    float _1280 = _1278;
    float _1282 = _1256;
    if (_1198)
    {
        float _1284 = _1256 + (-1.0);
        _1250 = _1284;
    }
    float _1286 = _1250;
    float _1288 = _1286;
    if (_1198)
    {
        float _1290 = _1222 * _1274;
        _1212 = _1290;
    }
    float _1292 = _1212;
    if (!_1198)
    {
        _1276 = _1262;
    }
    float _1294 = _1276;
    float _1296 = sqrt(_1180);
    float _1298 = _1294;
    if (_1198)
    {
        float _1300 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1300;
    }
    float _1302 = _1236;
    if (_1198)
    {
        float _1304 = _1186 * _1292;
        _1214 = _1304;
    }
    float _1306 = _1214;
    if (!_1198)
    {
        _1288 = _1188;
    }
    float _1308 = _1288;
    float _1310 = _1308;
    if (_1198)
    {
        float _1312 = _1188 * _1292;
        _1310 = _1312;
    }
    float _1314 = _1310;
    if (_1198)
    {
        float _1316 = fma(_1262, _1256, _1302);
        _1298 = _1316;
    }
    float _1318 = _1298;
    if (_1198)
    {
        float _1320 = _1306 * _1306;
        _1280 = _1320;
    }
    float _1322 = _1280;
    if (!_1198)
    {
        _1282 = _1192;
    }
    float _1324 = _1282;
    float _1326 = _1324;
    if (_1198)
    {
        float _1328 = _1314 * _1314;
        _1326 = _1328;
    }
    float _1330 = _1326;
    float _1332 = fma(_1318, _1318, _1322);
    float _1334 = _1332 + _1330;
    float _1336 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1340 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1338);
    float _1342 = precise::clamp(_1340, 0.0, 1.0);
    float _1344 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = rsqrt(_1334);
    float _1348 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1350 = -_1342;
    float _1352 = _1350 + 1.0;
    float _1354 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1358 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1348);
    float _1360 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1364 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1356);
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1368 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1360);
    float _1370 = abs(_1352);
    float _1372 = log2(_1370);
    float _1374 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1376 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1378 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1368);
    float _1380 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1382 = _1346 * _1306;
    float _1384 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1386 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1388 = _1346 * _1318;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1392 = _1346 * _1314;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1386);
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1398 = -_1390;
    float _1400 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1398);
    float _1402 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1404 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1394);
    float _1406 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1408 = -_1392;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1400);
    float _1412 = -_1396;
    float _1414 = fma(_1412, _1380, 1.0);
    float _1416 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1404);
    float _1418 = exp2(_1406);
    float _1420 = fma(_1410, -0.5, 0.5);
    float _1422 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1424 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1426 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1422);
    float _1428 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1424);
    float _1430 = log2(_1414);
    float _1432 = fma(_1410, 0.5, 0.5);
    float _1434 = _1388 + 1.0;
    float _1436 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1428);
    float _1440 = fma(_1432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1442 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1444 = 1.0 / _1416;
    float _1446 = -_1388;
    float _1448 = fma(_1418, _1434, _1446);
    float _1450 = fma(_1432, _1440, -0.212114393711090087890625);
    float _1452 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1438);
    float _1454 = fma(_1448, 0.5, 0.5);
    float _1456 = fma(_1432, _1450, 1.570728778839111328125);
    float _1458 = sqrt(_1420);
    float _1460 = _1430 * 0.693147182464599609375;
    float _1462 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1464 = _1442 * _1444;
    float _1466 = _1452 * _1444;
    float _1468 = fma(_1464, 0.5, 0.5);
    float _1470 = fma(_1466, -0.5, 0.5);
    float _1472 = _1458 * 0.636619746685028076171875;
    float _1474 = -_1456;
    float _1476 = fma(_1472, _1474, 1.0);
    float3 _3901 = float3(_1468, _1470, _1462);
    float _1478 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3901, float3(0.0), isnan(_3901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3901, float3(0.0), isnan(_3901)), level(0.0)).x;
    float3 _3912 = float3(_1468, _1470, _1462);
    float4 _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3912, float3(0.0), isnan(_3912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3912, float3(0.0), isnan(_3912)), level(0.0)).xyzw;
    float _1483 = _1481.x;
    float _1485 = _1481.y;
    float _1487 = _1481.z;
    float _1489 = _1481.w;
    float2 _3929 = float2(_1476, _1454);
    float3 _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3929, float2(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3929, float2(0.0), isnan(_3929)), level(0.0)).xyz;
    float _1495 = _1493.x;
    float _1497 = _1493.y;
    float _1499 = _1493.z;
    float _1501 = in.m_63.y;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_63.x;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1513 = _1511 != 0;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1517 = _1515 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1519 = _548 > 0.5;
    float _1521 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1525 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1521);
    bool _1527 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1529 = isnan(_544);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1535 = _1531 || _1533;
    float _1537 = float(_1535);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1543 = _1456;
    if (_1507)
    {
        float _1545 = in.m_57.x;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1549;
    float _1553 = 1.0 / _1517;
    float _1555 = -_1537;
    float _1557 = _1555 + 1.0;
    float _1559 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1561 = -_1501;
    float _1563 = _1561 + 1.0;
    float _1565 = 1.0 / _1541;
    float _1567 = _1501;
    if (_1507)
    {
        _628 = _1509;
    }
    float _1569 = _628;
    float _1571 = _1569;
    if (_1513)
    {
        float _1573 = _1519 ? _1563 : _1501;
        _1567 = _1573;
    }
    float _1575 = _1567;
    bool _1577 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1579 = isnan(_544);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = _1551 * _1553;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1593 = _544 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1599 = _1587 * _1557;
    float _1601 = -_1587;
    float _1603 = _1601 + 1.0;
    float _1605 = fma(_1589, _1593, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1607 = _1547 > 0.5;
    bool _1609 = _1607 && _1507;
    bool _1611 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1613 = isnan(_544);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1597 * _1565;
    float _1625 = _1589;
    if (!_1507)
    {
        _1625 = _1509;
    }
    float _1627 = _1625;
    float _1629 = _1621 * _1603;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1633 = _544 + _1631;
    float _1635 = -_1621;
    float _1637 = _1635 + 1.0;
    float _1639 = _1605 * _1629;
    float _1641 = _1627;
    if (_1609)
    {
        float _1643 = -_1569;
        float _1645 = _1643 + 1.0;
        _1571 = _1645;
    }
    float _1647 = _1571;
    float _1649 = fma(_1623, _1633, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1651 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1639);
    float _1653 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1507)
    {
        _1641 = _1647;
    }
    float _1655 = _1641;
    float _1657 = fma(_1649, _1599, _1651);
    bool _1659 = _1100 > 0.0;
    bool _1661 = isnan(_1100);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = _1653 * _1523;
    float _1671 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1675 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1657);
    float _1677 = _1671 * _1503;
    float _1679 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1681 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1559);
    float _1683 = _1416 * 0.5;
    out.m_65.w = _1673;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1687 = exp2(_1679);
    bool _1689 = _1162 <= 0.0;
    bool _1691 = !_1667;
    bool _1693 = _1689 || _1691;
    float _1695 = fma(_1452, -0.5, _1683);
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1701 = _1100 * _1162;
    float _1703 = _1681 + _1416;
    float _1705 = _1442 + _1416;
    float _1707 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1711 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1717 = _1709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1719 = _1703 * 0.5;
    float _1721 = _1705 * 0.5;
    float _1723 = -_1687;
    float _1725 = _1723 + 1.0;
    out.m_67.x = _1677;
    out.m_67.y = _1669;
    float _1727 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1707;
    out.m_69.y = _1711;
    out.m_69.z = _1713;
    out.m_69.w = _1715;
    float _1729 = -_1727;
    float _1731 = _1729 + 1.0;
    out.m_45.x = _1717;
    out.gl_Position.x = _1442;
    out.gl_Position.y = _1452;
    out.gl_Position.z = _1681;
    out.gl_Position.w = _1416;
    out.m_71.x = _1721;
    out.m_71.y = _1695;
    out.m_71.z = _1719;
    out.m_71.w = _1416;
    float _1733 = _1727 * _1478;
    float _1735 = _1489 * _1731;
    float _1737 = _1489 * _1733;
    float _1739 = _1499 * _1733;
    float _1741 = fma(_1495, _1737, _1483);
    float _1743 = fma(_1497, _1737, _1485);
    float _1745 = fma(_1489, _1739, _1487);
    out.m_73.x = _1741;
    out.m_73.y = _1743;
    out.m_73.z = _1745;
    out.m_73.w = _1735;
    if (!_1693)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1747 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1747;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _536 = false;
    bool _314 = false;
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
        float _1804 = as_type<float>(_108);
        out.gl_Position.z = _1804;
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
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1873 = as_type<float>(_144);
        out.gl_Position.z = _1873;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_51.z;
    float _152 = in.m_49.y;
    float _154 = in.m_53.z;
    float _156 = in.m_51.y;
    float _158 = in.m_53.y;
    float _160 = _146 * _146;
    float _162 = in.m_49.x;
    float _164 = fma(_150, _150, _160);
    float _166 = in.m_51.x;
    float _168 = _152 * _152;
    float _170 = in.m_53.x;
    float _172 = fma(_154, _154, _164);
    float _174 = fma(_156, _156, _168);
    float _176 = sqrt(_172);
    float _178 = fma(_158, _158, _174);
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    float _186 = sqrt(_178);
    bool _188 = _176 > 0.0;
    bool _190 = _186 > 0.0;
    float _192 = as_type<float>(_144);
    if (_188)
    {
        float _194 = rsqrt(_172);
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _152 * _182;
    float _200 = _156 * _182;
    float _202 = _158 * _182;
    float _204 = 0.0;
    if (!_188)
    {
        _204 = 0.0;
    }
    float _206 = _204;
    float _208 = fma(_180, _162, _198);
    float _210 = fma(_180, _166, _200);
    float _212 = fma(_180, _170, _202);
    float _214 = _178;
    float _216 = _206;
    if (_190)
    {
        float _218 = rsqrt(_178);
        _214 = _218;
    }
    float _220 = _214;
    float _222 = 0.0;
    if (!_190)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    float _226 = fma(_146, _184, _208);
    float _228 = 0.0;
    float _230 = _224;
    if (!_190)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = fma(_150, _184, _210);
    float _236 = 0.0;
    float _238 = _232;
    if (!_190)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = fma(_154, _184, _212);
    float _244 = 0.0;
    float _246 = _240;
    if (!_188)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _196;
    float _252 = _248;
    if (_188)
    {
        float _254 = _196 * 0.001000000047497451305389404296875;
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_188)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = _260;
    if (_188)
    {
        float _264 = _150 * _256;
        _216 = _264;
    }
    float _266 = _216;
    if (_188)
    {
        float _268 = _146 * _256;
        _252 = _268;
    }
    float _270 = _252;
    if (_188)
    {
        float _272 = _154 * _256;
        _262 = _272;
    }
    float _274 = _262;
    if (_190)
    {
        float _276 = _220 * _156;
        _230 = _276;
    }
    float _278 = _230;
    float _280 = _278;
    if (_190)
    {
        float _282 = _220 * _152;
        _238 = _282;
    }
    float _284 = _238;
    float _286 = _284;
    if (_190)
    {
        float _288 = _220 * _158;
        _246 = _288;
    }
    float _290 = _246;
    bool _292 = !_148;
    float _294 = _290;
    float _312;
    if (!_292)
    {
        float _296 = in.m_57.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_92);
        float _318 = 1.0 / _316;
        float _320 = _126 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _322 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _322 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = _322 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _344;
    float _348 = 1.0 / _342;
    bool _350 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_322);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _338;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = 1.0 / _346;
    float _372 = _326 * _348;
    bool _374 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _376 = isnan(_322);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_384;
    float _388 = _386 + 1.0;
    float _390 = _330 * _364;
    bool _392 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _394 = isnan(_322);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = fma(_368, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -_402;
    float _408 = _406 + 1.0;
    float _410 = _334 * _370;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _416;
    float _420 = _360 * _408;
    float _422 = -_360;
    float _424 = _422 + 1.0;
    float _426 = fma(_414, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _428 = fma(_418, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _430 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_322);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = _384 * _424;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _440 * _388;
    float _454 = -_440;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = fma(_444, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _464 = _404 * _452;
    float _466 = _426 * _452;
    float _468 = _428 * _452;
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _468);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = fma(_460, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _482;
    float _486 = fma(_450, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_462, _446, _470);
    float _494 = fma(_478, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_484, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_490, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_480, _446, _472);
    float _502 = fma(_486, _446, _474);
    float _504 = fma(_494, _420, _492);
    float _506 = fma(_496, _420, _500);
    float _508 = fma(_498, _420, _502);
    float _510 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    float _514 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].z, _508);
    bool _516 = !_362;
    float _534;
    if (!_516)
    {
        float _518 = in.m_57.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_92);
        float _540 = 1.0 / _538;
        float _542 = _126 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = _226 * _226;
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    float _558 = fma(_234, _234, _550);
    float _560 = fma(_242, _242, _558);
    float _562 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _564 = rsqrt(_560);
    float _566 = _546 * 100.0;
    float _568 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[191].w, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    bool _570 = _552 > 0.0;
    float _572 = fma(_562, _568, _566);
    float _574 = _234 * _564;
    bool _576 = _552 >= 0.0;
    bool _578 = isnan(_552);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = in.m_61.x;
    float _588 = in.m_61.y;
    float _590 = in.m_61.z;
    float _592 = _572 + _554;
    int _594 = _584 ? 0 : 1;
    float _596 = in.m_42.x;
    float _598 = in.m_42.y;
    float _600 = in.m_42.z;
    float _602 = abs(_552);
    float _604 = fma(_602, 2.0, _592);
    float _606 = _226 * _564;
    float _608 = _242 * _564;
    float _610 = _604 * 0.15915493667125701904296875;
    float _612 = _606 * _284;
    float _614 = _610 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = fma(_574, _278, _612);
    int _620 = ~_594;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    int _626 = _624;
    float _628 = _608;
    if (!_570)
    {
        int _630 = ~_594;
        int _632 = _630 + 1;
        _626 = _632;
    }
    int _634 = _626;
    float _636 = fma(_608, _290, _618);
    float _638 = float(_634);
    float _640 = abs(_636);
    bool _642 = _640 > 0.99989998340606689453125;
    float _644 = _510 * _586;
    float _646 = _512 * _588;
    float _648 = _514 * _590;
    float _650 = _156 * _598;
    float _652 = _616 * _638;
    float _654 = _152 * _598;
    float _656 = _158 * _598;
    float _658 = fma(_166, _596, _650);
    float _660 = _652 * 0.15915493667125701904296875;
    float _662 = fma(_162, _596, _654);
    float _664 = fma(_170, _596, _656);
    if (_642)
    {
        float _666 = _278 + _266;
        _280 = _666;
    }
    float _668 = _280;
    if (_642)
    {
        float _670 = _290 + _274;
        _294 = _670;
    }
    float _672 = _294;
    if (_642)
    {
        float _674 = _284 + _270;
        _286 = _674;
    }
    float _676 = _286;
    float _678 = _660 * 6.283185482025146484375;
    float _680 = sin(_678);
    float _682 = -_668;
    float _684 = _608 * _682;
    float _686 = -_672;
    float _688 = _606 * _686;
    float _690 = in.m_53.w;
    float _692 = fma(_150, _600, _658);
    float _694 = -_672;
    float _696 = -_684;
    float _698 = fma(_574, _694, _696);
    float _700 = -_676;
    float _702 = -_688;
    float _704 = fma(_608, _700, _702);
    float _706 = -_676;
    float _708 = _574 * _706;
    float _710 = _660 * 6.283185482025146484375;
    float _712 = cos(_710);
    float _714 = _698 * _698;
    float _716 = in.m_49.w;
    float _718 = -_668;
    float _720 = -_708;
    float _722 = fma(_606, _718, _720);
    float _724 = fma(_146, _600, _662);
    float _726 = fma(_704, _704, _714);
    float _728 = in.m_51.w;
    float _730 = fma(_154, _600, _664);
    float _732 = fma(_722, _722, _726);
    float _734 = _680 * _552;
    float _736 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _554);
    float _742 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = rsqrt(_732);
    float _746 = _712 * _552;
    float _748 = -_734;
    float _750 = fma(_712, _556, _748);
    float _752 = _736 * _740;
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _762 = _758 || _760;
    float _764 = fma(_680, _556, _746);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _750);
    float _768 = _730 + _690;
    bool _770 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _772 = isnan(0.5);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _778 = _774 || _776;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _764);
    float _782 = _738 * _766;
    float _784 = _724 + _716;
    float _786 = _752 * _608;
    float _788 = _742 * _780;
    float _790 = _692 + _728;
    float _792 = _698 * _744;
    float _794 = _722 * _744;
    float _796 = _704 * _744;
    float _798 = _784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _800 = _574 * _792;
    float _802 = fma(_788, _794, _786);
    float _804 = _752 * _574;
    float _806 = _606 * _794;
    float _808 = -_800;
    float _810 = fma(_606, _796, _808);
    float _812 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].x, _798);
    float _814 = fma(_788, _796, _804);
    float _816 = -_806;
    float _818 = fma(_608, _792, _816);
    float _820 = fma(_782, _810, _802);
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    float _824 = fma(_782, _818, _814);
    float _826 = _768 + _820;
    float _828 = _822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _830 = _784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = _790 + _824;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _836 = _826 + _834;
    float _838 = 1.0 / _828;
    float _840 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _844 = _832 + _842;
    float _846 = _836 * _836;
    float _848 = _752 * _606;
    float _850 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[10].z, _840);
    float _852 = _608 * _796;
    float _854 = fma(_844, _844, _846);
    float _856 = fma(_788, _792, _848);
    float _858 = _850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _860 = -_852;
    float _862 = fma(_574, _794, _860);
    float _864 = sqrt(_854);
    float _866 = _858 + _828;
    float _868 = fma(_782, _862, _856);
    float _870 = _866 * _838;
    float _872 = _870 * 0.5;
    float _874 = _784 + _868;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _876);
    float _880 = 1.0 / _878;
    bool _882 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = _868;
    float _886 = _788;
    float _888 = _846;
    float _890 = _864;
    float _892 = _862;
    float _894 = _878;
    float _896 = _832;
    if (!_882)
    {
        _884 = _832;
    }
    float _898 = _884;
    float _900 = _898;
    if (!_882)
    {
        _886 = _826;
    }
    float _902 = _886;
    float _904 = _902;
    if (!_882)
    {
        _888 = _874;
    }
    float _906 = _888;
    bool _908 = !_882;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _864 + _914;
        float _918 = _874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _920 = rsqrt(_854);
        float _922 = _916 * _912;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = fma(_932, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _940 = fma(_874, _928, _936);
        float _942 = _920 * _938;
        float _944 = fma(_844, _942, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_836, _942, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _904 = _946;
        _900 = _944;
        _910 = _940;
        _890 = _924;
        _892 = _936;
    }
    float _948 = _904;
    float _950 = _900;
    float _952 = _910;
    float _954 = _890;
    float _956 = _892;
    float _958 = _956;
    float _960 = _952;
    float _962 = _950;
    float _964 = _948;
    float _966 = _954;
    if (_778)
    {
        _958 = 1.0;
    }
    float _968 = _958;
    float _970 = _968;
    if (!_762)
    {
        float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _974 = _784 + _972;
        float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _978 = _790 + _976;
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _982 = -_768;
        float _984 = _982 + _948;
        float _986 = _974 * _974;
        float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _990 = _768 + _988;
        float _992 = fma(_978, _978, _986);
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _996 = fma(_990, _990, _992);
        float _998 = sqrt(_996);
        float _1000 = _980 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1002 = -_790;
        float _1004 = _1002 + _950;
        float _1006 = precise::min(_998, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1008 = _1006 * _994;
        float _1010 = _1000 * _1008;
        float _1012 = -_784;
        float _1014 = _1012 + _952;
        float _1016 = fma(_1004, _1010, _790);
        float _1018 = fma(_1014, _1010, _784);
        float _1020 = fma(_984, _1010, _768);
        _894 = _1004;
        _960 = _1018;
        _962 = _1016;
        _964 = _1020;
        _966 = _1014;
        _896 = _1010;
    }
    float _1022 = _894;
    float _1024 = _960;
    float _1026 = _962;
    float _1028 = _964;
    float _1030 = _966;
    float _1032 = _896;
    float _1034 = _1032;
    float _1036 = _1022;
    float _1038 = _1030;
    if (_778)
    {
        _1034 = 1.0;
    }
    float _1040 = _1034;
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1044 = _880 * _1042;
    float _1046 = _1040;
    if (!_778)
    {
        float _1048 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1056 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1054;
        float _1058 = _1050 * 6.283185482025146484375;
        float _1060 = cos(_1058);
        float _1062 = _1052 * 0.15915493667125701904296875;
        float _1064 = _1050 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = 1.0 / _1060;
        float _1070 = _1062 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1066 * _1068;
        float _1076 = _1062 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1072 * _1074;
        float _1082 = 1.0 / _1056;
        float _1084 = 1.0 / _1080;
        float _1086 = _1078 * _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1090 = fma(_1044, _1086, _1088);
        float _1092 = _1090 * _1082;
        float _1094 = precise::clamp(_1092, 0.0, 1.0);
        _1036 = _1074;
        _1038 = _1082;
        _970 = _1094;
    }
    float _1096 = _1036;
    float _1098 = _1038;
    float _1100 = _970;
    float _1102 = _1096;
    float _1104 = _1098;
    if (!_778)
    {
        float _1106 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1112 = _1108 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        float _1116 = _1110 * 0.15915493667125701904296875;
        float _1118 = _1108 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = 1.0 / _1114;
        float _1124 = _1116 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1120 * _1122;
        float _1130 = _1116 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1126 * _1128;
        float _1136 = 1.0 / _1134;
        float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1140 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1138;
        float _1142 = 1.0 / _1140;
        float _1144 = _1132 * _1136;
        float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1148 = fma(_1044, _1144, _1146);
        float _1150 = _1148 * _1142;
        float _1152 = precise::clamp(_1150, 0.0, 1.0);
        float _1154 = -_1152;
        float _1156 = _1154 + 1.0;
        _1102 = _1122;
        _1104 = _1108;
        _1046 = _1156;
    }
    float _1158 = _1102;
    float _1160 = _1104;
    float _1162 = _1046;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1166 = _1024 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1170 = _1026 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1174 = _1028 + _1172;
    float _1176 = _1166 * _1166;
    float _1178 = fma(_1170, _1170, _1176);
    float _1180 = fma(_1174, _1174, _1178);
    float _1182 = rsqrt(_1180);
    float _1184 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1186 = _1170 * _1184;
    float _1188 = _1174 * _1184;
    float _1190 = _1186 * _1186;
    float _1192 = _1188 * _1188;
    float _1194 = _1190 + _1192;
    float _1196 = sqrt(_1194);
    bool _1198 = _1196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1196 + _1200;
    float _1204 = _1158;
    float _1206 = _1194;
    float _1208 = _1202;
    float _1210 = _1166;
    float _1212 = _1184;
    float _1214 = _1186;
    if (_1198)
    {
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1204 = _1216;
    }
    float _1218 = _1204;
    if (_1198)
    {
        float _1220 = rsqrt(_1194);
        _1206 = _1220;
    }
    float _1222 = _1206;
    float _1224 = _1218;
    if (_1198)
    {
        float _1226 = _1202 * _1218;
        _1208 = _1226;
    }
    float _1228 = _1208;
    if (_1198)
    {
        float _1230 = _1228 * 0.15915493667125701904296875;
        _1224 = _1230;
    }
    float _1232 = _1224;
    float _1234 = _1174;
    float _1236 = _1232;
    if (_1198)
    {
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        _1234 = _1240;
    }
    float _1242 = _1234;
    float _1244 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1246 = precise::max(0.0, _1244);
    float _1248 = _1160;
    float _1250 = _1246;
    if (_1198)
    {
        float _1252 = _1232 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        _1248 = _1254;
    }
    float _1256 = _1248;
    float _1258 = -_1184;
    float _1260 = -_1246;
    float _1262 = fma(_1166, _1258, _1260);
    if (_1198)
    {
        float _1264 = _1262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1210 = _1264;
    }
    float _1266 = _1210;
    float _1268 = _1266;
    float _1270 = _1242;
    if (_1198)
    {
        float _1272 = fma(_1242, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1268 = _1272;
    }
    float _1274 = _1268;
    float _1276 = _1274;
    if (!_1198)
    {
        _1270 = _1190;
    }
    float _1278 = _1270;
    float _1280 = _1278;
    float _1282 = _1256;
    if (_1198)
    {
        float _1284 = _1256 + (-1.0);
        _1250 = _1284;
    }
    float _1286 = _1250;
    float _1288 = _1286;
    if (_1198)
    {
        float _1290 = _1222 * _1274;
        _1212 = _1290;
    }
    float _1292 = _1212;
    if (!_1198)
    {
        _1276 = _1262;
    }
    float _1294 = _1276;
    float _1296 = sqrt(_1180);
    float _1298 = _1294;
    if (_1198)
    {
        float _1300 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1300;
    }
    float _1302 = _1236;
    if (_1198)
    {
        float _1304 = _1186 * _1292;
        _1214 = _1304;
    }
    float _1306 = _1214;
    if (!_1198)
    {
        _1288 = _1188;
    }
    float _1308 = _1288;
    float _1310 = _1308;
    if (_1198)
    {
        float _1312 = _1188 * _1292;
        _1310 = _1312;
    }
    float _1314 = _1310;
    if (_1198)
    {
        float _1316 = fma(_1262, _1256, _1302);
        _1298 = _1316;
    }
    float _1318 = _1298;
    if (_1198)
    {
        float _1320 = _1306 * _1306;
        _1280 = _1320;
    }
    float _1322 = _1280;
    if (!_1198)
    {
        _1282 = _1192;
    }
    float _1324 = _1282;
    float _1326 = _1324;
    if (_1198)
    {
        float _1328 = _1314 * _1314;
        _1326 = _1328;
    }
    float _1330 = _1326;
    float _1332 = fma(_1318, _1318, _1322);
    float _1334 = _1332 + _1330;
    float _1336 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1340 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1338);
    float _1342 = precise::clamp(_1340, 0.0, 1.0);
    float _1344 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = rsqrt(_1334);
    float _1348 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1350 = -_1342;
    float _1352 = _1350 + 1.0;
    float _1354 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1358 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1348);
    float _1360 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1364 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1356);
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1368 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1360);
    float _1370 = abs(_1352);
    float _1372 = log2(_1370);
    float _1374 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1376 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1378 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1368);
    float _1380 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1382 = _1346 * _1306;
    float _1384 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1386 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1388 = _1346 * _1318;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1392 = _1346 * _1314;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1386);
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1398 = -_1390;
    float _1400 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1398);
    float _1402 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1404 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1394);
    float _1406 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1408 = -_1392;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1400);
    float _1412 = -_1396;
    float _1414 = fma(_1412, _1380, 1.0);
    float _1416 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1404);
    float _1418 = exp2(_1406);
    float _1420 = fma(_1410, -0.5, 0.5);
    float _1422 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1424 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1426 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1422);
    float _1428 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1424);
    float _1430 = log2(_1414);
    float _1432 = fma(_1410, 0.5, 0.5);
    float _1434 = _1388 + 1.0;
    float _1436 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1428);
    float _1440 = fma(_1432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1442 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1444 = 1.0 / _1416;
    float _1446 = -_1388;
    float _1448 = fma(_1418, _1434, _1446);
    float _1450 = fma(_1432, _1440, -0.212114393711090087890625);
    float _1452 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1438);
    float _1454 = fma(_1448, 0.5, 0.5);
    float _1456 = fma(_1432, _1450, 1.570728778839111328125);
    float _1458 = sqrt(_1420);
    float _1460 = _1430 * 0.693147182464599609375;
    float _1462 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1464 = _1442 * _1444;
    float _1466 = _1452 * _1444;
    float _1468 = fma(_1464, 0.5, 0.5);
    float _1470 = fma(_1466, -0.5, 0.5);
    float _1472 = _1458 * 0.636619746685028076171875;
    float _1474 = -_1456;
    float _1476 = fma(_1472, _1474, 1.0);
    float3 _3901 = float3(_1468, _1470, _1462);
    float _1478 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3901, float3(0.0), isnan(_3901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3901, float3(0.0), isnan(_3901)), level(0.0)).x;
    float3 _3912 = float3(_1468, _1470, _1462);
    float4 _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3912, float3(0.0), isnan(_3912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3912, float3(0.0), isnan(_3912)), level(0.0)).xyzw;
    float _1483 = _1481.x;
    float _1485 = _1481.y;
    float _1487 = _1481.z;
    float _1489 = _1481.w;
    float2 _3929 = float2(_1476, _1454);
    float3 _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3929, float2(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3929, float2(0.0), isnan(_3929)), level(0.0)).xyz;
    float _1495 = _1493.x;
    float _1497 = _1493.y;
    float _1499 = _1493.z;
    float _1501 = in.m_63.y;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_63.x;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1513 = _1511 != 0;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1517 = _1515 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1519 = _548 > 0.5;
    float _1521 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1525 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1521);
    bool _1527 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1529 = isnan(_544);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1535 = _1531 || _1533;
    float _1537 = float(_1535);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1543 = _1456;
    if (_1507)
    {
        float _1545 = in.m_57.x;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1549;
    float _1553 = 1.0 / _1517;
    float _1555 = -_1537;
    float _1557 = _1555 + 1.0;
    float _1559 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1561 = -_1501;
    float _1563 = _1561 + 1.0;
    float _1565 = 1.0 / _1541;
    float _1567 = _1501;
    if (_1507)
    {
        _628 = _1509;
    }
    float _1569 = _628;
    float _1571 = _1569;
    if (_1513)
    {
        float _1573 = _1519 ? _1563 : _1501;
        _1567 = _1573;
    }
    float _1575 = _1567;
    bool _1577 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1579 = isnan(_544);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = _1551 * _1553;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1593 = _544 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1599 = _1587 * _1557;
    float _1601 = -_1587;
    float _1603 = _1601 + 1.0;
    float _1605 = fma(_1589, _1593, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1607 = _1547 > 0.5;
    bool _1609 = _1607 && _1507;
    bool _1611 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1613 = isnan(_544);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1597 * _1565;
    float _1625 = _1589;
    if (!_1507)
    {
        _1625 = _1509;
    }
    float _1627 = _1625;
    float _1629 = _1621 * _1603;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1633 = _544 + _1631;
    float _1635 = -_1621;
    float _1637 = _1635 + 1.0;
    float _1639 = _1605 * _1629;
    float _1641 = _1627;
    if (_1609)
    {
        float _1643 = -_1569;
        float _1645 = _1643 + 1.0;
        _1571 = _1645;
    }
    float _1647 = _1571;
    float _1649 = fma(_1623, _1633, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1651 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1639);
    float _1653 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1507)
    {
        _1641 = _1647;
    }
    float _1655 = _1641;
    float _1657 = fma(_1649, _1599, _1651);
    bool _1659 = _1100 > 0.0;
    bool _1661 = isnan(_1100);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = _1653 * _1523;
    float _1671 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1675 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1657);
    float _1677 = _1671 * _1503;
    float _1679 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1681 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1559);
    float _1683 = _1416 * 0.5;
    out.m_65.w = _1673;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1687 = exp2(_1679);
    bool _1689 = _1162 <= 0.0;
    bool _1691 = !_1667;
    bool _1693 = _1689 || _1691;
    float _1695 = fma(_1452, -0.5, _1683);
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1701 = _1100 * _1162;
    float _1703 = _1681 + _1416;
    float _1705 = _1442 + _1416;
    float _1707 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1711 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1717 = _1709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1719 = _1703 * 0.5;
    float _1721 = _1705 * 0.5;
    float _1723 = -_1687;
    float _1725 = _1723 + 1.0;
    out.m_67.x = _1677;
    out.m_67.y = _1669;
    float _1727 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1707;
    out.m_69.y = _1711;
    out.m_69.z = _1713;
    out.m_69.w = _1715;
    float _1729 = -_1727;
    float _1731 = _1729 + 1.0;
    out.m_45.x = _1717;
    out.gl_Position.x = _1442;
    out.gl_Position.y = _1452;
    out.gl_Position.z = _1681;
    out.gl_Position.w = _1416;
    out.m_71.x = _1721;
    out.m_71.y = _1695;
    out.m_71.z = _1719;
    out.m_71.w = _1416;
    float _1733 = _1727 * _1478;
    float _1735 = _1489 * _1731;
    float _1737 = _1489 * _1733;
    float _1739 = _1499 * _1733;
    float _1741 = fma(_1495, _1737, _1483);
    float _1743 = fma(_1497, _1737, _1485);
    float _1745 = fma(_1489, _1739, _1487);
    out.m_73.x = _1741;
    out.m_73.y = _1743;
    out.m_73.z = _1745;
    out.m_73.w = _1735;
    if (!_1693)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1747 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1747;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _536 = false;
    bool _314 = false;
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
        float _1804 = as_type<float>(_108);
        out.gl_Position.z = _1804;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1873 = as_type<float>(_144);
        out.gl_Position.z = _1873;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_51.z;
    float _152 = in.m_49.y;
    float _154 = in.m_53.z;
    float _156 = in.m_51.y;
    float _158 = in.m_53.y;
    float _160 = _146 * _146;
    float _162 = in.m_49.x;
    float _164 = fma(_150, _150, _160);
    float _166 = in.m_51.x;
    float _168 = _152 * _152;
    float _170 = in.m_53.x;
    float _172 = fma(_154, _154, _164);
    float _174 = fma(_156, _156, _168);
    float _176 = sqrt(_172);
    float _178 = fma(_158, _158, _174);
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    float _186 = sqrt(_178);
    bool _188 = _176 > 0.0;
    bool _190 = _186 > 0.0;
    float _192 = as_type<float>(_144);
    if (_188)
    {
        float _194 = rsqrt(_172);
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _152 * _182;
    float _200 = _156 * _182;
    float _202 = _158 * _182;
    float _204 = 0.0;
    if (!_188)
    {
        _204 = 0.0;
    }
    float _206 = _204;
    float _208 = fma(_180, _162, _198);
    float _210 = fma(_180, _166, _200);
    float _212 = fma(_180, _170, _202);
    float _214 = _178;
    float _216 = _206;
    if (_190)
    {
        float _218 = rsqrt(_178);
        _214 = _218;
    }
    float _220 = _214;
    float _222 = 0.0;
    if (!_190)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    float _226 = fma(_146, _184, _208);
    float _228 = 0.0;
    float _230 = _224;
    if (!_190)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = fma(_150, _184, _210);
    float _236 = 0.0;
    float _238 = _232;
    if (!_190)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = fma(_154, _184, _212);
    float _244 = 0.0;
    float _246 = _240;
    if (!_188)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _196;
    float _252 = _248;
    if (_188)
    {
        float _254 = _196 * 0.001000000047497451305389404296875;
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_188)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = _260;
    if (_188)
    {
        float _264 = _150 * _256;
        _216 = _264;
    }
    float _266 = _216;
    if (_188)
    {
        float _268 = _146 * _256;
        _252 = _268;
    }
    float _270 = _252;
    if (_188)
    {
        float _272 = _154 * _256;
        _262 = _272;
    }
    float _274 = _262;
    if (_190)
    {
        float _276 = _220 * _156;
        _230 = _276;
    }
    float _278 = _230;
    float _280 = _278;
    if (_190)
    {
        float _282 = _220 * _152;
        _238 = _282;
    }
    float _284 = _238;
    float _286 = _284;
    if (_190)
    {
        float _288 = _220 * _158;
        _246 = _288;
    }
    float _290 = _246;
    bool _292 = !_148;
    float _294 = _290;
    float _312;
    if (!_292)
    {
        float _296 = in.m_57.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_92);
        float _318 = 1.0 / _316;
        float _320 = _126 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _322 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _322 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = _322 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _344;
    float _348 = 1.0 / _342;
    bool _350 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_322);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _338;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _366;
    float _370 = 1.0 / _346;
    float _372 = _326 * _348;
    bool _374 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _376 = isnan(_322);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_384;
    float _388 = _386 + 1.0;
    float _390 = _330 * _364;
    bool _392 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _394 = isnan(_322);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = fma(_368, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -_402;
    float _408 = _406 + 1.0;
    float _410 = _334 * _370;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _416;
    float _420 = _360 * _408;
    float _422 = -_360;
    float _424 = _422 + 1.0;
    float _426 = fma(_414, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _428 = fma(_418, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _430 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_322);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = _384 * _424;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _440 * _388;
    float _454 = -_440;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = fma(_444, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _464 = _404 * _452;
    float _466 = _426 * _452;
    float _468 = _428 * _452;
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _464);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _466);
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _468);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = fma(_460, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _482;
    float _486 = fma(_450, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_462, _446, _470);
    float _494 = fma(_478, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_484, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_490, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_480, _446, _472);
    float _502 = fma(_486, _446, _474);
    float _504 = fma(_494, _420, _492);
    float _506 = fma(_496, _420, _500);
    float _508 = fma(_498, _420, _502);
    float _510 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    float _514 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[146].z, _508);
    bool _516 = !_362;
    float _534;
    if (!_516)
    {
        float _518 = in.m_57.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_92);
        float _540 = 1.0 / _538;
        float _542 = _126 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = _226 * _226;
    float _552 = in.m_59.x;
    float _554 = in.m_59.y;
    float _556 = in.m_59.z;
    float _558 = fma(_234, _234, _550);
    float _560 = fma(_242, _242, _558);
    float _562 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _564 = rsqrt(_560);
    float _566 = _546 * 100.0;
    float _568 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[191].w, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    bool _570 = _552 > 0.0;
    float _572 = fma(_562, _568, _566);
    float _574 = _234 * _564;
    bool _576 = _552 >= 0.0;
    bool _578 = isnan(_552);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = in.m_61.x;
    float _588 = in.m_61.y;
    float _590 = in.m_61.z;
    float _592 = _572 + _554;
    int _594 = _584 ? 0 : 1;
    float _596 = in.m_42.x;
    float _598 = in.m_42.y;
    float _600 = in.m_42.z;
    float _602 = abs(_552);
    float _604 = fma(_602, 2.0, _592);
    float _606 = _226 * _564;
    float _608 = _242 * _564;
    float _610 = _604 * 0.15915493667125701904296875;
    float _612 = _606 * _284;
    float _614 = _610 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = fma(_574, _278, _612);
    int _620 = ~_594;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    int _626 = _624;
    float _628 = _608;
    if (!_570)
    {
        int _630 = ~_594;
        int _632 = _630 + 1;
        _626 = _632;
    }
    int _634 = _626;
    float _636 = fma(_608, _290, _618);
    float _638 = float(_634);
    float _640 = abs(_636);
    bool _642 = _640 > 0.99989998340606689453125;
    float _644 = _510 * _586;
    float _646 = _512 * _588;
    float _648 = _514 * _590;
    float _650 = _156 * _598;
    float _652 = _616 * _638;
    float _654 = _152 * _598;
    float _656 = _158 * _598;
    float _658 = fma(_166, _596, _650);
    float _660 = _652 * 0.15915493667125701904296875;
    float _662 = fma(_162, _596, _654);
    float _664 = fma(_170, _596, _656);
    if (_642)
    {
        float _666 = _278 + _266;
        _280 = _666;
    }
    float _668 = _280;
    if (_642)
    {
        float _670 = _290 + _274;
        _294 = _670;
    }
    float _672 = _294;
    if (_642)
    {
        float _674 = _284 + _270;
        _286 = _674;
    }
    float _676 = _286;
    float _678 = _660 * 6.283185482025146484375;
    float _680 = sin(_678);
    float _682 = -_668;
    float _684 = _608 * _682;
    float _686 = -_672;
    float _688 = _606 * _686;
    float _690 = in.m_53.w;
    float _692 = fma(_150, _600, _658);
    float _694 = -_672;
    float _696 = -_684;
    float _698 = fma(_574, _694, _696);
    float _700 = -_676;
    float _702 = -_688;
    float _704 = fma(_608, _700, _702);
    float _706 = -_676;
    float _708 = _574 * _706;
    float _710 = _660 * 6.283185482025146484375;
    float _712 = cos(_710);
    float _714 = _698 * _698;
    float _716 = in.m_49.w;
    float _718 = -_668;
    float _720 = -_708;
    float _722 = fma(_606, _718, _720);
    float _724 = fma(_146, _600, _662);
    float _726 = fma(_704, _704, _714);
    float _728 = in.m_51.w;
    float _730 = fma(_154, _600, _664);
    float _732 = fma(_722, _722, _726);
    float _734 = _680 * _552;
    float _736 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = _648 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _554);
    float _742 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = rsqrt(_732);
    float _746 = _712 * _552;
    float _748 = -_734;
    float _750 = fma(_712, _556, _748);
    float _752 = _736 * _740;
    bool _754 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _756 = isnan(0.5);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _762 = _758 || _760;
    float _764 = fma(_680, _556, _746);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _750);
    float _768 = _730 + _690;
    bool _770 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _772 = isnan(0.5);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _778 = _774 || _776;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _764);
    float _782 = _738 * _766;
    float _784 = _724 + _716;
    float _786 = _752 * _608;
    float _788 = _742 * _780;
    float _790 = _692 + _728;
    float _792 = _698 * _744;
    float _794 = _722 * _744;
    float _796 = _704 * _744;
    float _798 = _784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _800 = _574 * _792;
    float _802 = fma(_788, _794, _786);
    float _804 = _752 * _574;
    float _806 = _606 * _794;
    float _808 = -_800;
    float _810 = fma(_606, _796, _808);
    float _812 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].x, _798);
    float _814 = fma(_788, _796, _804);
    float _816 = -_806;
    float _818 = fma(_608, _792, _816);
    float _820 = fma(_782, _810, _802);
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    float _824 = fma(_782, _818, _814);
    float _826 = _768 + _820;
    float _828 = _822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _830 = _784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _832 = _790 + _824;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _836 = _826 + _834;
    float _838 = 1.0 / _828;
    float _840 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].x, _830);
    float _842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _844 = _832 + _842;
    float _846 = _836 * _836;
    float _848 = _752 * _606;
    float _850 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[10].z, _840);
    float _852 = _608 * _796;
    float _854 = fma(_844, _844, _846);
    float _856 = fma(_788, _792, _848);
    float _858 = _850 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _860 = -_852;
    float _862 = fma(_574, _794, _860);
    float _864 = sqrt(_854);
    float _866 = _858 + _828;
    float _868 = fma(_782, _862, _856);
    float _870 = _866 * _838;
    float _872 = _870 * 0.5;
    float _874 = _784 + _868;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _878 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[30].w, _876);
    float _880 = 1.0 / _878;
    bool _882 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = _868;
    float _886 = _788;
    float _888 = _846;
    float _890 = _864;
    float _892 = _862;
    float _894 = _878;
    float _896 = _832;
    if (!_882)
    {
        _884 = _832;
    }
    float _898 = _884;
    float _900 = _898;
    if (!_882)
    {
        _886 = _826;
    }
    float _902 = _886;
    float _904 = _902;
    if (!_882)
    {
        _888 = _874;
    }
    float _906 = _888;
    bool _908 = !_882;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _864 + _914;
        float _918 = _874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _920 = rsqrt(_854);
        float _922 = _916 * _912;
        float _924 = _922 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _938 = fma(_932, _918, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _940 = fma(_874, _928, _936);
        float _942 = _920 * _938;
        float _944 = fma(_844, _942, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_836, _942, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _904 = _946;
        _900 = _944;
        _910 = _940;
        _890 = _924;
        _892 = _936;
    }
    float _948 = _904;
    float _950 = _900;
    float _952 = _910;
    float _954 = _890;
    float _956 = _892;
    float _958 = _956;
    float _960 = _952;
    float _962 = _950;
    float _964 = _948;
    float _966 = _954;
    if (_778)
    {
        _958 = 1.0;
    }
    float _968 = _958;
    float _970 = _968;
    if (!_762)
    {
        float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _974 = _784 + _972;
        float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _978 = _790 + _976;
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _982 = -_768;
        float _984 = _982 + _948;
        float _986 = _974 * _974;
        float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _990 = _768 + _988;
        float _992 = fma(_978, _978, _986);
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _996 = fma(_990, _990, _992);
        float _998 = sqrt(_996);
        float _1000 = _980 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1002 = -_790;
        float _1004 = _1002 + _950;
        float _1006 = precise::min(_998, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1008 = _1006 * _994;
        float _1010 = _1000 * _1008;
        float _1012 = -_784;
        float _1014 = _1012 + _952;
        float _1016 = fma(_1004, _1010, _790);
        float _1018 = fma(_1014, _1010, _784);
        float _1020 = fma(_984, _1010, _768);
        _894 = _1004;
        _960 = _1018;
        _962 = _1016;
        _964 = _1020;
        _966 = _1014;
        _896 = _1010;
    }
    float _1022 = _894;
    float _1024 = _960;
    float _1026 = _962;
    float _1028 = _964;
    float _1030 = _966;
    float _1032 = _896;
    float _1034 = _1032;
    float _1036 = _1022;
    float _1038 = _1030;
    if (_778)
    {
        _1034 = 1.0;
    }
    float _1040 = _1034;
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1044 = _880 * _1042;
    float _1046 = _1040;
    if (!_778)
    {
        float _1048 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1056 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1054;
        float _1058 = _1050 * 6.283185482025146484375;
        float _1060 = cos(_1058);
        float _1062 = _1052 * 0.15915493667125701904296875;
        float _1064 = _1050 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = 1.0 / _1060;
        float _1070 = _1062 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1066 * _1068;
        float _1076 = _1062 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1072 * _1074;
        float _1082 = 1.0 / _1056;
        float _1084 = 1.0 / _1080;
        float _1086 = _1078 * _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1090 = fma(_1044, _1086, _1088);
        float _1092 = _1090 * _1082;
        float _1094 = precise::clamp(_1092, 0.0, 1.0);
        _1036 = _1074;
        _1038 = _1082;
        _970 = _1094;
    }
    float _1096 = _1036;
    float _1098 = _1038;
    float _1100 = _970;
    float _1102 = _1096;
    float _1104 = _1098;
    if (!_778)
    {
        float _1106 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1112 = _1108 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        float _1116 = _1110 * 0.15915493667125701904296875;
        float _1118 = _1108 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        float _1122 = 1.0 / _1114;
        float _1124 = _1116 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1120 * _1122;
        float _1130 = _1116 * 6.283185482025146484375;
        float _1132 = sin(_1130);
        float _1134 = _1126 * _1128;
        float _1136 = 1.0 / _1134;
        float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1140 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1138;
        float _1142 = 1.0 / _1140;
        float _1144 = _1132 * _1136;
        float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1148 = fma(_1044, _1144, _1146);
        float _1150 = _1148 * _1142;
        float _1152 = precise::clamp(_1150, 0.0, 1.0);
        float _1154 = -_1152;
        float _1156 = _1154 + 1.0;
        _1102 = _1122;
        _1104 = _1108;
        _1046 = _1156;
    }
    float _1158 = _1102;
    float _1160 = _1104;
    float _1162 = _1046;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1166 = _1024 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1170 = _1026 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1174 = _1028 + _1172;
    float _1176 = _1166 * _1166;
    float _1178 = fma(_1170, _1170, _1176);
    float _1180 = fma(_1174, _1174, _1178);
    float _1182 = rsqrt(_1180);
    float _1184 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1186 = _1170 * _1184;
    float _1188 = _1174 * _1184;
    float _1190 = _1186 * _1186;
    float _1192 = _1188 * _1188;
    float _1194 = _1190 + _1192;
    float _1196 = sqrt(_1194);
    bool _1198 = _1196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1196 + _1200;
    float _1204 = _1158;
    float _1206 = _1194;
    float _1208 = _1202;
    float _1210 = _1166;
    float _1212 = _1184;
    float _1214 = _1186;
    if (_1198)
    {
        float _1216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1204 = _1216;
    }
    float _1218 = _1204;
    if (_1198)
    {
        float _1220 = rsqrt(_1194);
        _1206 = _1220;
    }
    float _1222 = _1206;
    float _1224 = _1218;
    if (_1198)
    {
        float _1226 = _1202 * _1218;
        _1208 = _1226;
    }
    float _1228 = _1208;
    if (_1198)
    {
        float _1230 = _1228 * 0.15915493667125701904296875;
        _1224 = _1230;
    }
    float _1232 = _1224;
    float _1234 = _1174;
    float _1236 = _1232;
    if (_1198)
    {
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        _1234 = _1240;
    }
    float _1242 = _1234;
    float _1244 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1246 = precise::max(0.0, _1244);
    float _1248 = _1160;
    float _1250 = _1246;
    if (_1198)
    {
        float _1252 = _1232 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        _1248 = _1254;
    }
    float _1256 = _1248;
    float _1258 = -_1184;
    float _1260 = -_1246;
    float _1262 = fma(_1166, _1258, _1260);
    if (_1198)
    {
        float _1264 = _1262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1210 = _1264;
    }
    float _1266 = _1210;
    float _1268 = _1266;
    float _1270 = _1242;
    if (_1198)
    {
        float _1272 = fma(_1242, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1268 = _1272;
    }
    float _1274 = _1268;
    float _1276 = _1274;
    if (!_1198)
    {
        _1270 = _1190;
    }
    float _1278 = _1270;
    float _1280 = _1278;
    float _1282 = _1256;
    if (_1198)
    {
        float _1284 = _1256 + (-1.0);
        _1250 = _1284;
    }
    float _1286 = _1250;
    float _1288 = _1286;
    if (_1198)
    {
        float _1290 = _1222 * _1274;
        _1212 = _1290;
    }
    float _1292 = _1212;
    if (!_1198)
    {
        _1276 = _1262;
    }
    float _1294 = _1276;
    float _1296 = sqrt(_1180);
    float _1298 = _1294;
    if (_1198)
    {
        float _1300 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1300;
    }
    float _1302 = _1236;
    if (_1198)
    {
        float _1304 = _1186 * _1292;
        _1214 = _1304;
    }
    float _1306 = _1214;
    if (!_1198)
    {
        _1288 = _1188;
    }
    float _1308 = _1288;
    float _1310 = _1308;
    if (_1198)
    {
        float _1312 = _1188 * _1292;
        _1310 = _1312;
    }
    float _1314 = _1310;
    if (_1198)
    {
        float _1316 = fma(_1262, _1256, _1302);
        _1298 = _1316;
    }
    float _1318 = _1298;
    if (_1198)
    {
        float _1320 = _1306 * _1306;
        _1280 = _1320;
    }
    float _1322 = _1280;
    if (!_1198)
    {
        _1282 = _1192;
    }
    float _1324 = _1282;
    float _1326 = _1324;
    if (_1198)
    {
        float _1328 = _1314 * _1314;
        _1326 = _1328;
    }
    float _1330 = _1326;
    float _1332 = fma(_1318, _1318, _1322);
    float _1334 = _1332 + _1330;
    float _1336 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1340 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1338);
    float _1342 = precise::clamp(_1340, 0.0, 1.0);
    float _1344 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = rsqrt(_1334);
    float _1348 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1350 = -_1342;
    float _1352 = _1350 + 1.0;
    float _1354 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1358 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1348);
    float _1360 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1364 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1356);
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1368 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1360);
    float _1370 = abs(_1352);
    float _1372 = log2(_1370);
    float _1374 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1376 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1378 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1368);
    float _1380 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1382 = _1346 * _1306;
    float _1384 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1386 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1388 = _1346 * _1318;
    float _1390 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1392 = _1346 * _1314;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1386);
    float _1396 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1398 = -_1390;
    float _1400 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1398);
    float _1402 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1404 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1394);
    float _1406 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1408 = -_1392;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1400);
    float _1412 = -_1396;
    float _1414 = fma(_1412, _1380, 1.0);
    float _1416 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1404);
    float _1418 = exp2(_1406);
    float _1420 = fma(_1410, -0.5, 0.5);
    float _1422 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1424 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1426 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1422);
    float _1428 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1424);
    float _1430 = log2(_1414);
    float _1432 = fma(_1410, 0.5, 0.5);
    float _1434 = _1388 + 1.0;
    float _1436 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1428);
    float _1440 = fma(_1432, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1442 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1444 = 1.0 / _1416;
    float _1446 = -_1388;
    float _1448 = fma(_1418, _1434, _1446);
    float _1450 = fma(_1432, _1440, -0.212114393711090087890625);
    float _1452 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1438);
    float _1454 = fma(_1448, 0.5, 0.5);
    float _1456 = fma(_1432, _1450, 1.570728778839111328125);
    float _1458 = sqrt(_1420);
    float _1460 = _1430 * 0.693147182464599609375;
    float _1462 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1464 = _1442 * _1444;
    float _1466 = _1452 * _1444;
    float _1468 = fma(_1464, 0.5, 0.5);
    float _1470 = fma(_1466, -0.5, 0.5);
    float _1472 = _1458 * 0.636619746685028076171875;
    float _1474 = -_1456;
    float _1476 = fma(_1472, _1474, 1.0);
    float3 _3901 = float3(_1468, _1470, _1462);
    float _1478 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3901, float3(0.0), isnan(_3901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3901, float3(0.0), isnan(_3901)), level(0.0)).x;
    float3 _3912 = float3(_1468, _1470, _1462);
    float4 _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3912, float3(0.0), isnan(_3912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3912, float3(0.0), isnan(_3912)), level(0.0)).xyzw;
    float _1483 = _1481.x;
    float _1485 = _1481.y;
    float _1487 = _1481.z;
    float _1489 = _1481.w;
    float2 _3929 = float2(_1476, _1454);
    float3 _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3929, float2(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3929, float2(0.0), isnan(_3929)), level(0.0)).xyz;
    float _1495 = _1493.x;
    float _1497 = _1493.y;
    float _1499 = _1493.z;
    float _1501 = in.m_63.y;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_63.x;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1513 = _1511 != 0;
    float _1515 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1517 = _1515 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1519 = _548 > 0.5;
    float _1521 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1525 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1521);
    bool _1527 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1529 = isnan(_544);
    bool _1531 = _1527 || _1529;
    bool _1533 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1535 = _1531 || _1533;
    float _1537 = float(_1535);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1543 = _1456;
    if (_1507)
    {
        float _1545 = in.m_57.x;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1549;
    float _1553 = 1.0 / _1517;
    float _1555 = -_1537;
    float _1557 = _1555 + 1.0;
    float _1559 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1561 = -_1501;
    float _1563 = _1561 + 1.0;
    float _1565 = 1.0 / _1541;
    float _1567 = _1501;
    if (_1507)
    {
        _628 = _1509;
    }
    float _1569 = _628;
    float _1571 = _1569;
    if (_1513)
    {
        float _1573 = _1519 ? _1563 : _1501;
        _1567 = _1573;
    }
    float _1575 = _1567;
    bool _1577 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1579 = isnan(_544);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1585 = _1581 || _1583;
    float _1587 = float(_1585);
    float _1589 = _1551 * _1553;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1593 = _544 + _1591;
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1599 = _1587 * _1557;
    float _1601 = -_1587;
    float _1603 = _1601 + 1.0;
    float _1605 = fma(_1589, _1593, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1607 = _1547 > 0.5;
    bool _1609 = _1607 && _1507;
    bool _1611 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1613 = isnan(_544);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1597 * _1565;
    float _1625 = _1589;
    if (!_1507)
    {
        _1625 = _1509;
    }
    float _1627 = _1625;
    float _1629 = _1621 * _1603;
    float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1633 = _544 + _1631;
    float _1635 = -_1621;
    float _1637 = _1635 + 1.0;
    float _1639 = _1605 * _1629;
    float _1641 = _1627;
    if (_1609)
    {
        float _1643 = -_1569;
        float _1645 = _1643 + 1.0;
        _1571 = _1645;
    }
    float _1647 = _1571;
    float _1649 = fma(_1623, _1633, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1651 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1639);
    float _1653 = _1575 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1507)
    {
        _1641 = _1647;
    }
    float _1655 = _1641;
    float _1657 = fma(_1649, _1599, _1651);
    bool _1659 = _1100 > 0.0;
    bool _1661 = isnan(_1100);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = _1653 * _1523;
    float _1671 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1675 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1657);
    float _1677 = _1671 * _1503;
    float _1679 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1681 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1559);
    float _1683 = _1416 * 0.5;
    out.m_65.w = _1673;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1687 = exp2(_1679);
    bool _1689 = _1162 <= 0.0;
    bool _1691 = !_1667;
    bool _1693 = _1689 || _1691;
    float _1695 = fma(_1452, -0.5, _1683);
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1701 = _1100 * _1162;
    float _1703 = _1681 + _1416;
    float _1705 = _1442 + _1416;
    float _1707 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1711 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1717 = _1709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1719 = _1703 * 0.5;
    float _1721 = _1705 * 0.5;
    float _1723 = -_1687;
    float _1725 = _1723 + 1.0;
    out.m_67.x = _1677;
    out.m_67.y = _1669;
    float _1727 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1707;
    out.m_69.y = _1711;
    out.m_69.z = _1713;
    out.m_69.w = _1715;
    float _1729 = -_1727;
    float _1731 = _1729 + 1.0;
    out.m_45.x = _1717;
    out.gl_Position.x = _1442;
    out.gl_Position.y = _1452;
    out.gl_Position.z = _1681;
    out.gl_Position.w = _1416;
    out.m_71.x = _1721;
    out.m_71.y = _1695;
    out.m_71.z = _1719;
    out.m_71.w = _1416;
    float _1733 = _1727 * _1478;
    float _1735 = _1489 * _1731;
    float _1737 = _1489 * _1733;
    float _1739 = _1499 * _1733;
    float _1741 = fma(_1495, _1737, _1483);
    float _1743 = fma(_1497, _1737, _1485);
    float _1745 = fma(_1489, _1739, _1487);
    out.m_73.x = _1741;
    out.m_73.y = _1743;
    out.m_73.z = _1745;
    out.m_73.w = _1735;
    if (!_1693)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1747 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1747;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

