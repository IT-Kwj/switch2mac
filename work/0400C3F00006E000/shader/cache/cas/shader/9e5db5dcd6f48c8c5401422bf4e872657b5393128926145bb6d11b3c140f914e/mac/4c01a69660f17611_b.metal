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
        float _1876 = as_type<float>(_108);
        out.gl_Position.z = _1876;
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
        float _1945 = as_type<float>(_144);
        out.gl_Position.z = _1945;
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
    float _192 = 0.0;
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
    float _206 = 0.0;
    if (!_188)
    {
        _204 = 0.0;
        _206 = 0.0;
    }
    float _208 = _204;
    float _210 = _206;
    float _212 = fma(_180, _162, _198);
    float _214 = fma(_180, _166, _200);
    float _216 = fma(_180, _170, _202);
    float _218 = _178;
    float _220 = _208;
    float _222 = _210;
    if (_190)
    {
        float _224 = rsqrt(_178);
        _218 = _224;
    }
    float _226 = _218;
    float _228 = 0.0;
    float _230 = 0.0;
    if (!_190)
    {
        _228 = 0.0;
        _230 = 0.0;
    }
    float _232 = _228;
    float _234 = _230;
    float _236 = 0.0;
    float _238 = _232;
    float _240 = _234;
    if (!_190)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    float _244 = fma(_146, _184, _212);
    float _246 = 0.0;
    float _248 = _242;
    if (!_188)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = fma(_150, _184, _214);
    float _254 = fma(_154, _184, _216);
    float _256 = _196;
    float _258 = _250;
    if (_188)
    {
        float _260 = _196 * 0.001000000047497451305389404296875;
        _256 = _260;
    }
    float _262 = _256;
    if (_188)
    {
        float _264 = _150 * _262;
        _220 = _264;
    }
    float _266 = _220;
    if (_188)
    {
        float _268 = _146 * _262;
        _258 = _268;
    }
    float _270 = _258;
    if (_188)
    {
        float _272 = _154 * _262;
        _222 = _272;
    }
    float _274 = _222;
    if (_190)
    {
        float _276 = _226 * _156;
        _248 = _276;
    }
    float _278 = _248;
    float _280 = _278;
    if (_190)
    {
        float _282 = _226 * _152;
        _238 = _282;
    }
    float _284 = _238;
    float _286 = _284;
    if (_190)
    {
        float _288 = _226 * _158;
        _240 = _288;
    }
    float _290 = _240;
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
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = _322 + _328;
    bool _332 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = isnan(_322);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _322 + _356;
    float _360 = 1.0 / _350;
    float _362 = -_342;
    float _364 = _362 + 1.0;
    bool _366 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _368 = isnan(_322);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _380 = 1.0 / _354;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -_376;
    float _388 = _386 + 1.0;
    float _390 = _376 * _364;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = 1.0 / _346;
    float _398 = _326 * _360;
    bool _400 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _402 = isnan(_322);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = fma(_394, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = _410 * _388;
    float _416 = _330 * _380;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -_410;
    float _428 = _426 + 1.0;
    float _430 = _358 * _396;
    bool _432 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _434 = isnan(_322);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = fma(_384, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = fma(_420, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = fma(_424, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = -_442;
    float _456 = _454 + 1.0;
    float _458 = _448 * _414;
    float _460 = _450 * _414;
    float _462 = _452 * _414;
    float _464 = _342 * _456;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = fma(_446, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _474 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _476 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _482;
    float _486 = fma(_468, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_470, _390, _472);
    float _494 = fma(_480, _416, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_484, _416, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_490, _416, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_412, _390, _474);
    float _502 = fma(_486, _390, _476);
    float _504 = fma(_494, _464, _492);
    float _506 = fma(_496, _464, _500);
    float _508 = fma(_498, _464, _502);
    float _510 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    float _514 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].z, _508);
    bool _516 = !_378;
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
    float _546 = in.m_42.x;
    float _548 = in.m_42.y;
    float _550 = in.m_42.z;
    float _552 = _244 * _244;
    float _554 = in.m_57.x;
    float _556 = in.m_57.y;
    float _558 = fma(_252, _252, _552);
    float _560 = in.m_59.x;
    float _562 = in.m_59.y;
    float _564 = in.m_59.z;
    float _566 = fma(_254, _254, _558);
    float _568 = in.m_61.x;
    float _570 = in.m_61.y;
    float _572 = in.m_61.z;
    float _574 = rsqrt(_566);
    float _576 = _156 * _548;
    float _578 = _152 * _548;
    float _580 = _158 * _548;
    float _582 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _584 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[191].w, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _586 = _554 * 100.0;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _590 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _588;
    float _592 = fma(_162, _546, _578);
    float _594 = _244 * _574;
    float _596 = fma(_582, _584, _586);
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _600 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _598;
    float _602 = _590 * _590;
    float _604 = fma(_166, _546, _576);
    float _606 = _596 + _562;
    float _608 = _252 * _574;
    float _610 = _594 * _284;
    float _612 = fma(_600, _600, _602);
    float _614 = _254 * _574;
    float _616 = in.m_49.w;
    float _618 = fma(_608, _278, _610);
    float _620 = abs(_560);
    float _622 = fma(_620, 2.0, _606);
    float _624 = in.m_51.w;
    bool _626 = _560 >= 0.0;
    bool _628 = isnan(_560);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_614, _290, _618);
    bool _638 = _560 > 0.0;
    float _640 = in.m_53.w;
    float _642 = _622 * 0.15915493667125701904296875;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _646 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _644;
    int _648 = _634 ? 0 : 1;
    float _650 = fma(_170, _546, _580);
    float _652 = abs(_636);
    bool _654 = _652 > 0.99989998340606689453125;
    float _656 = _642 * 6.283185482025146484375;
    float _658 = sin(_656);
    int _660 = ~_648;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = fma(_646, _646, _612);
    float _668 = fma(_146, _550, _592);
    float _670 = fma(_150, _550, _604);
    float _672 = fma(_154, _550, _650);
    int _674 = _664;
    if (!_638)
    {
        int _676 = ~_648;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    float _682 = sqrt(_666);
    float _684 = _512 * _570;
    float _686 = _668 + _616;
    float _688 = float(_680);
    if (_654)
    {
        float _690 = _278 + _266;
        _280 = _690;
    }
    float _692 = _280;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _694;
    if (_654)
    {
        float _698 = _290 + _274;
        _294 = _698;
    }
    float _700 = _294;
    float _702 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _704 = _686 + _702;
    float _706 = -_692;
    float _708 = _614 * _706;
    float _710 = _658 * _688;
    float _712 = _670 + _624;
    float _714 = _672 + _640;
    if (_654)
    {
        float _716 = _284 + _270;
        _286 = _716;
    }
    float _718 = _286;
    float _720 = -_700;
    float _722 = -_708;
    float _724 = fma(_608, _720, _722);
    float _726 = -_700;
    float _728 = _594 * _726;
    float _730 = _710 * 0.15915493667125701904296875;
    float _732 = _704 * _704;
    float _734 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _736 = _712 + _734;
    float _738 = -_718;
    float _740 = _608 * _738;
    float _742 = -_718;
    float _744 = -_728;
    float _746 = fma(_614, _742, _744);
    float _748 = _724 * _724;
    float _750 = 1.0 / _696;
    float _752 = fma(_736, _736, _732);
    float _754 = -_692;
    float _756 = -_740;
    float _758 = fma(_594, _754, _756);
    float _760 = fma(_746, _746, _748);
    float _762 = precise::max(_682, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _764 = _554 + 0.5;
    float _766 = fma(_758, _758, _760);
    float _768 = _730 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = precise::min(_762, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _774 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _776 = _714 + _774;
    float _778 = _764 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _780 = _510 * _568;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _786 = _772 + _784;
    float _788 = fma(_776, _776, _752);
    float _790 = _730 * 6.283185482025146484375;
    float _792 = cos(_790);
    float _794 = _514 * _572;
    float _796 = _786 * _750;
    float _798 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _800 = rsqrt(_766);
    float _802 = _770 * _560;
    float _804 = _796 * _778;
    float _806 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _810 = _792 * _560;
    float _812 = rsqrt(_788);
    float _814 = -_802;
    float _816 = fma(_792, _564, _814);
    float _818 = fma(_770, _564, _810);
    float _820 = _808 * _782;
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    float _824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _818);
    float _826 = _724 * _800;
    float _828 = _758 * _800;
    float _830 = _746 * _800;
    float _832 = _806 * _824;
    float _834 = _820 * _614;
    float _836 = _608 * _826;
    float _838 = _798 * _822;
    float _840 = _820 * _608;
    float _842 = fma(_832, _828, _834);
    float _844 = _594 * _828;
    float _846 = -_836;
    float _848 = fma(_594, _830, _846);
    float _850 = _812 * _804;
    float _852 = _686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _854 = -_844;
    float _856 = fma(_614, _826, _854);
    float _858 = fma(_832, _830, _840);
    float _860 = fma(_838, _848, _842);
    float _862 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[11].x, _852);
    float _864 = _820 * _594;
    float _866 = fma(_838, _856, _858);
    float _868 = fma(_776, _850, _860);
    float _870 = _714 + _860;
    float _872 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[11].z, _862);
    float _874 = fma(_736, _850, _866);
    float _876 = _712 + _866;
    float _878 = _870 + _868;
    float _880 = _872 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _882 = _614 * _830;
    float _884 = _876 + _874;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _878 + _886;
    float _890 = _686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _892 = 1.0 / _880;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _884 + _894;
    float _898 = _888 * _888;
    float _900 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[10].x, _890);
    float _902 = fma(_832, _826, _864);
    float _904 = fma(_896, _896, _898);
    float _906 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[10].z, _900);
    float _908 = -_882;
    float _910 = fma(_608, _828, _908);
    float _912 = sqrt(_904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _916 = fma(_838, _910, _902);
    float _918 = _914 + _880;
    float _920 = fma(_704, _850, _916);
    float _922 = _686 + _916;
    float _924 = _918 * _892;
    float _926 = _924 * 0.5;
    bool _928 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _930 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    float _938 = _922 + _920;
    bool _940 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _942 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _944 = _940 || _942;
    bool _946 = isnan(0.5);
    bool _948 = _944 || _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _952 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[30].w, _950);
    bool _954 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = 1.0 / _952;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _962 = _902;
    float _964 = _922;
    float _966 = _938;
    float _968 = _864;
    float _970 = _880;
    float _972 = _882;
    float _974 = _750;
    if (!_954)
    {
        _958 = _884;
    }
    float _976 = _958;
    float _978 = _976;
    if (!_954)
    {
        _960 = _878;
    }
    float _980 = _960;
    float _982 = _980;
    if (!_954)
    {
        _962 = _938;
    }
    float _984 = _962;
    bool _986 = !_954;
    float _988 = _984;
    if (!_986)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _994 = _912 + _992;
        float _996 = _938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = _994 * _990;
        float _1000 = rsqrt(_904);
        float _1002 = _998 * 0.15915493667125701904296875;
        float _1004 = _1002 * 6.283185482025146484375;
        float _1006 = cos(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        float _1012 = _1006 + (-1.0);
        float _1014 = _1012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = fma(_1010, _996, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1018 = fma(_938, _1006, _1014);
        float _1020 = _1000 * _1016;
        float _1022 = fma(_896, _1020, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1024 = fma(_888, _1020, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _988 = _1018;
        _978 = _1022;
        _982 = _1024;
        _964 = _1014;
    }
    float _1026 = _988;
    float _1028 = _978;
    float _1030 = _982;
    float _1032 = _964;
    float _1034 = _1032;
    float _1036 = _1026;
    float _1038 = _1028;
    float _1040 = _1030;
    if (_948)
    {
        _1034 = 1.0;
    }
    float _1042 = _1034;
    float _1044 = _1042;
    if (!_936)
    {
        float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1048 = _686 + _1046;
        float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1052 = _712 + _1050;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1056 = -_686;
        float _1058 = _1056 + _1026;
        float _1060 = _1048 * _1048;
        float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1064 = _714 + _1062;
        float _1066 = fma(_1052, _1052, _1060);
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1070 = fma(_1064, _1064, _1066);
        float _1072 = sqrt(_1070);
        float _1074 = _1054 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1076 = precise::min(_1072, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1078 = _1076 * _1068;
        float _1080 = -_712;
        float _1082 = _1080 + _1028;
        float _1084 = _1074 * _1078;
        float _1086 = -_714;
        float _1088 = _1086 + _1030;
        float _1090 = fma(_1082, _1084, _712);
        float _1092 = fma(_1058, _1084, _686);
        float _1094 = fma(_1088, _1084, _714);
        _966 = _1084;
        _1036 = _1092;
        _1038 = _1090;
        _1040 = _1094;
        _968 = _1088;
    }
    float _1096 = _966;
    float _1098 = _1036;
    float _1100 = _1038;
    float _1102 = _1040;
    float _1104 = _968;
    float _1106 = _1096;
    float _1108 = _1104;
    if (_948)
    {
        _970 = 1.0;
    }
    float _1110 = _970;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1114 = _956 * _1112;
    float _1116 = _1110;
    if (!_948)
    {
        float _1118 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1122 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1120;
        float _1124 = _1118 * 0.15915493667125701904296875;
        float _1126 = _1124 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1124 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = 1.0 / _1128;
        float _1140 = _1132 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = _1132 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1142 * _1144;
        float _1152 = 1.0 / _1122;
        float _1154 = 1.0 / _1150;
        float _1156 = _1148 * _1154;
        float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1160 = fma(_1114, _1156, _1158);
        float _1162 = _1160 * _1152;
        float _1164 = precise::clamp(_1162, 0.0, 1.0);
        _1106 = _1132;
        _1108 = _1152;
        _1044 = _1164;
    }
    float _1166 = _1106;
    float _1168 = _1108;
    float _1170 = _1044;
    float _1172 = _1166;
    float _1174 = _1168;
    if (!_948)
    {
        float _1176 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1178 = _1176 * 0.15915493667125701904296875;
        float _1180 = _1178 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        float _1184 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = _1178 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = 1.0 / _1182;
        float _1194 = _1186 * 6.283185482025146484375;
        float _1196 = cos(_1194);
        float _1198 = _1190 * _1192;
        float _1200 = _1186 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1196 * _1198;
        float _1206 = 1.0 / _1204;
        float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1210 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1208;
        float _1212 = 1.0 / _1210;
        float _1214 = _1202 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1218 = fma(_1114, _1214, _1216);
        float _1220 = _1218 * _1212;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        float _1224 = -_1222;
        float _1226 = _1224 + 1.0;
        _1172 = _1192;
        _1174 = _1206;
        _1116 = _1226;
    }
    float _1228 = _1172;
    float _1230 = _1174;
    float _1232 = _1116;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1236 = _1098 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1240 = _1100 + _1238;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1244 = _1102 + _1242;
    float _1246 = _1236 * _1236;
    float _1248 = fma(_1240, _1240, _1246);
    float _1250 = fma(_1244, _1244, _1248);
    float _1252 = rsqrt(_1250);
    float _1254 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1256 = _1240 * _1254;
    float _1258 = _1244 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 * _1258;
    float _1264 = _1260 + _1262;
    float _1266 = sqrt(_1264);
    bool _1268 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1266 + _1270;
    float _1274 = _1244;
    float _1276 = _1230;
    float _1278 = _1272;
    float _1280 = _1228;
    float _1282 = _1236;
    if (_1268)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (_1268)
    {
        float _1288 = rsqrt(_1264);
        _1276 = _1288;
    }
    float _1290 = _1276;
    float _1292 = _1290;
    if (_1268)
    {
        float _1294 = _1272 * _1286;
        _1278 = _1294;
    }
    float _1296 = _1278;
    if (_1268)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1280 = _1298;
    }
    float _1300 = _1280;
    float _1302 = _1252;
    if (_1268)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1246;
    float _1316 = _1312;
    float _1318 = _1310;
    if (_1268)
    {
        float _1320 = _1300 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = -_1254;
    float _1328 = -_1312;
    float _1330 = fma(_1236, _1326, _1328);
    if (!_1268)
    {
        _1282 = _1260;
    }
    float _1332 = _1282;
    float _1334 = _1332;
    if (_1268)
    {
        float _1336 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1316 = _1336;
    }
    float _1338 = _1316;
    float _1340 = sqrt(_1250);
    float _1342 = _1338;
    float _1344 = _1308;
    if (_1268)
    {
        float _1346 = fma(_1308, _1338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = _1348;
    if (!_1268)
    {
        _1344 = _1256;
    }
    float _1352 = _1344;
    float _1354 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1356 = _1352;
    float _1358 = _1324;
    if (_1268)
    {
        float _1360 = _1324 + (-1.0);
        _1318 = _1360;
    }
    float _1362 = _1318;
    float _1364 = _1362;
    if (_1268)
    {
        float _1366 = _1290 * _1348;
        _972 = _1366;
    }
    float _1368 = _972;
    if (!_1268)
    {
        _1350 = _1330;
    }
    float _1370 = _1350;
    float _1372 = _1370;
    if (_1268)
    {
        float _1374 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1374;
    }
    float _1376 = _1292;
    if (_1268)
    {
        float _1378 = _1256 * _1368;
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (!_1268)
    {
        _1364 = _1258;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1268)
    {
        float _1386 = _1258 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    if (_1268)
    {
        float _1390 = fma(_1330, _1324, _1376);
        _1372 = _1390;
    }
    float _1392 = _1372;
    if (_1268)
    {
        float _1394 = _1380 * _1380;
        _1334 = _1394;
    }
    float _1396 = _1334;
    if (!_1268)
    {
        _1358 = _1262;
    }
    float _1398 = _1358;
    float _1400 = _1398;
    if (_1268)
    {
        float _1402 = _1388 * _1388;
        _1400 = _1402;
    }
    float _1404 = _1400;
    float _1406 = fma(_1392, _1392, _1396);
    float _1408 = _1406 + _1404;
    float _1410 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1414 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1412);
    float _1416 = precise::clamp(_1414, 0.0, 1.0);
    float _1418 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1420 = rsqrt(_1408);
    float _1422 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1424 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1426 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1418);
    float _1428 = -_1416;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1434 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1436 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1424);
    float _1438 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1434);
    float _1444 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1436);
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1442);
    float _1452 = abs(_1430);
    float _1454 = log2(_1452);
    float _1456 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1458 = -_1448;
    float _1460 = fma(_1458, _1354, 1.0);
    float _1462 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1420 * _1380;
    float _1466 = _1420 * _1392;
    float _1468 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1456);
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = _1420 * _1388;
    float _1476 = log2(_1460);
    float _1478 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1470);
    float _1480 = -_1472;
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1480);
    float _1484 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1486 = _1466 + 1.0;
    float _1488 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1478);
    float _1490 = -_1474;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1482);
    float _1494 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1496 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = 1.0 / _1488;
    float _1500 = fma(_1492, -0.5, 0.5);
    float _1502 = fma(_1492, 0.5, 0.5);
    float _1504 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1506 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1484);
    float _1508 = exp2(_1494);
    float _1510 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1504);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1514 = sqrt(_1500);
    float _1516 = fma(_1502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1518 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1506);
    float _1520 = _1512 * _1498;
    float _1522 = fma(_1502, _1516, -0.212114393711090087890625);
    float _1524 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1526 = _1476 * 0.693147182464599609375;
    float _1528 = -_1466;
    float _1530 = fma(_1508, _1486, _1528);
    float _1532 = fma(_1502, _1522, 1.570728778839111328125);
    float _1534 = _1524 * _1498;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1538 = fma(_1520, 0.5, 0.5);
    float _1540 = fma(_1534, -0.5, 0.5);
    float _1542 = fma(_1530, 0.5, 0.5);
    float _1544 = _1514 * 0.636619746685028076171875;
    float3 _4087 = float3(_1538, _1540, _1536);
    float _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4087, float3(0.0), isnan(_4087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4087, float3(0.0), isnan(_4087)), level(0.0)).x;
    float3 _4098 = float3(_1538, _1540, _1536);
    float4 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4098, float3(0.0), isnan(_4098)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4098, float3(0.0), isnan(_4098)), level(0.0)).xyzw;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _1549.w;
    float _1559 = -_1532;
    float _1561 = fma(_1544, _1559, 1.0);
    float2 _4120 = float2(_1561, _1542);
    float3 _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4120, float2(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4120, float2(0.0), isnan(_4120)), level(0.0)).xyz;
    float _1567 = _1565.x;
    float _1569 = _1565.y;
    float _1571 = _1565.z;
    float _1573 = in.m_63.y;
    float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1579 = _1577 != 0;
    float _1581 = in.m_63.x;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1585 = _1583 != 0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1591 = _556 > 0.5;
    float _1593 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1597 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1593);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1603 = _1530;
    if (_1579)
    {
        float _1605 = in.m_57.x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1609;
    float _1613 = 1.0 / _1589;
    bool _1615 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1617 = isnan(_544);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1597);
    float _1629 = -_1573;
    float _1631 = _1629 + 1.0;
    float _1633 = -_1625;
    float _1635 = _1633 + 1.0;
    float _1637 = 1.0 / _1601;
    float _1639 = _1573;
    if (_1579)
    {
        _974 = _1581;
    }
    float _1641 = _974;
    float _1643 = _1641;
    if (_1585)
    {
        float _1645 = _1591 ? _1631 : _1573;
        _1639 = _1645;
    }
    float _1647 = _1639;
    bool _1649 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1651 = isnan(_544);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = _1611 * _1613;
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1665 = _544 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1671 = _1659 * _1635;
    float _1673 = -_1659;
    float _1675 = _1673 + 1.0;
    float _1677 = fma(_1661, _1665, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1679 = _1607 > 0.5;
    bool _1681 = _1679 && _1579;
    float _1683 = _1661;
    if (!_1579)
    {
        _1683 = _1581;
    }
    float _1685 = _1683;
    float _1687 = _1669 * _1637;
    bool _1689 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1691 = isnan(_544);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1699 * _1675;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1705 = _544 + _1703;
    float _1707 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1709 = -_1699;
    float _1711 = _1709 + 1.0;
    float _1713 = _1685;
    if (_1681)
    {
        float _1715 = -_1641;
        float _1717 = _1715 + 1.0;
        _1643 = _1717;
    }
    float _1719 = _1643;
    float _1721 = fma(_1687, _1705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1723 = _1677 * _1701;
    float _1725 = _1707 * _1595;
    if (_1579)
    {
        _1713 = _1719;
    }
    float _1727 = _1713;
    float _1729 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1731 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    bool _1733 = _1170 > 0.0;
    bool _1735 = isnan(_1170);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.0);
    bool _1741 = _1737 || _1739;
    float _1743 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_65.w = _1729;
    float _1745 = fma(_1721, _1671, _1731);
    float _1747 = _1743 * _1575;
    float _1749 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1751 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    float _1753 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1745);
    float _1755 = _1488 * 0.5;
    float _1757 = _1170 * _1232;
    float _1759 = exp2(_1749);
    float _1761 = fma(_1524, -0.5, _1755);
    float _1763 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1765 = _1232 <= 0.0;
    bool _1767 = !_1741;
    bool _1769 = _1765 || _1767;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1773 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1779 = _1751 + _1488;
    float _1781 = _1512 + _1488;
    float _1783 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1775;
    float _1785 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1791 = -_1759;
    float _1793 = _1791 + 1.0;
    float _1795 = _1779 * 0.5;
    float _1797 = _1781 * 0.5;
    out.m_67.x = _1747;
    out.m_67.y = _1725;
    float _1799 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1783;
    out.m_69.y = _1785;
    out.m_69.z = _1787;
    out.m_69.w = _1789;
    float _1801 = -_1799;
    float _1803 = _1801 + 1.0;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1751;
    out.gl_Position.w = _1488;
    out.m_71.x = _1797;
    out.m_71.y = _1761;
    out.m_71.z = _1795;
    out.m_71.w = _1488;
    float _1805 = _1799 * _1546;
    float _1807 = _1557 * _1803;
    float _1809 = _1557 * _1805;
    float _1811 = _1571 * _1805;
    float _1813 = fma(_1567, _1809, _1551);
    float _1815 = fma(_1569, _1809, _1553);
    float _1817 = fma(_1557, _1811, _1555);
    out.m_73.x = _1813;
    out.m_73.y = _1815;
    out.m_73.z = _1817;
    out.m_73.w = _1807;
    if (!_1769)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1819;
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
        float _1876 = as_type<float>(_108);
        out.gl_Position.z = _1876;
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
        float _1945 = as_type<float>(_144);
        out.gl_Position.z = _1945;
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
    float _192 = 0.0;
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
    float _206 = 0.0;
    if (!_188)
    {
        _204 = 0.0;
        _206 = 0.0;
    }
    float _208 = _204;
    float _210 = _206;
    float _212 = fma(_180, _162, _198);
    float _214 = fma(_180, _166, _200);
    float _216 = fma(_180, _170, _202);
    float _218 = _178;
    float _220 = _208;
    float _222 = _210;
    if (_190)
    {
        float _224 = rsqrt(_178);
        _218 = _224;
    }
    float _226 = _218;
    float _228 = 0.0;
    float _230 = 0.0;
    if (!_190)
    {
        _228 = 0.0;
        _230 = 0.0;
    }
    float _232 = _228;
    float _234 = _230;
    float _236 = 0.0;
    float _238 = _232;
    float _240 = _234;
    if (!_190)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    float _244 = fma(_146, _184, _212);
    float _246 = 0.0;
    float _248 = _242;
    if (!_188)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = fma(_150, _184, _214);
    float _254 = fma(_154, _184, _216);
    float _256 = _196;
    float _258 = _250;
    if (_188)
    {
        float _260 = _196 * 0.001000000047497451305389404296875;
        _256 = _260;
    }
    float _262 = _256;
    if (_188)
    {
        float _264 = _150 * _262;
        _220 = _264;
    }
    float _266 = _220;
    if (_188)
    {
        float _268 = _146 * _262;
        _258 = _268;
    }
    float _270 = _258;
    if (_188)
    {
        float _272 = _154 * _262;
        _222 = _272;
    }
    float _274 = _222;
    if (_190)
    {
        float _276 = _226 * _156;
        _248 = _276;
    }
    float _278 = _248;
    float _280 = _278;
    if (_190)
    {
        float _282 = _226 * _152;
        _238 = _282;
    }
    float _284 = _238;
    float _286 = _284;
    if (_190)
    {
        float _288 = _226 * _158;
        _240 = _288;
    }
    float _290 = _240;
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
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = _322 + _328;
    bool _332 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = isnan(_322);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _322 + _356;
    float _360 = 1.0 / _350;
    float _362 = -_342;
    float _364 = _362 + 1.0;
    bool _366 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _368 = isnan(_322);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _380 = 1.0 / _354;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -_376;
    float _388 = _386 + 1.0;
    float _390 = _376 * _364;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = 1.0 / _346;
    float _398 = _326 * _360;
    bool _400 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _402 = isnan(_322);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = fma(_394, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = _410 * _388;
    float _416 = _330 * _380;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -_410;
    float _428 = _426 + 1.0;
    float _430 = _358 * _396;
    bool _432 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _434 = isnan(_322);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = fma(_384, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = fma(_420, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = fma(_424, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = -_442;
    float _456 = _454 + 1.0;
    float _458 = _448 * _414;
    float _460 = _450 * _414;
    float _462 = _452 * _414;
    float _464 = _342 * _456;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = fma(_446, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _474 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _476 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _482;
    float _486 = fma(_468, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_470, _390, _472);
    float _494 = fma(_480, _416, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_484, _416, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_490, _416, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_412, _390, _474);
    float _502 = fma(_486, _390, _476);
    float _504 = fma(_494, _464, _492);
    float _506 = fma(_496, _464, _500);
    float _508 = fma(_498, _464, _502);
    float _510 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    float _514 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].z, _508);
    bool _516 = !_378;
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
    float _546 = in.m_42.x;
    float _548 = in.m_42.y;
    float _550 = in.m_42.z;
    float _552 = _244 * _244;
    float _554 = in.m_57.x;
    float _556 = in.m_57.y;
    float _558 = fma(_252, _252, _552);
    float _560 = in.m_59.x;
    float _562 = in.m_59.y;
    float _564 = in.m_59.z;
    float _566 = fma(_254, _254, _558);
    float _568 = in.m_61.x;
    float _570 = in.m_61.y;
    float _572 = in.m_61.z;
    float _574 = rsqrt(_566);
    float _576 = _156 * _548;
    float _578 = _152 * _548;
    float _580 = _158 * _548;
    float _582 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _584 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[191].w, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _586 = _554 * 100.0;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _590 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _588;
    float _592 = fma(_162, _546, _578);
    float _594 = _244 * _574;
    float _596 = fma(_582, _584, _586);
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _600 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _598;
    float _602 = _590 * _590;
    float _604 = fma(_166, _546, _576);
    float _606 = _596 + _562;
    float _608 = _252 * _574;
    float _610 = _594 * _284;
    float _612 = fma(_600, _600, _602);
    float _614 = _254 * _574;
    float _616 = in.m_49.w;
    float _618 = fma(_608, _278, _610);
    float _620 = abs(_560);
    float _622 = fma(_620, 2.0, _606);
    float _624 = in.m_51.w;
    bool _626 = _560 >= 0.0;
    bool _628 = isnan(_560);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_614, _290, _618);
    bool _638 = _560 > 0.0;
    float _640 = in.m_53.w;
    float _642 = _622 * 0.15915493667125701904296875;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _646 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _644;
    int _648 = _634 ? 0 : 1;
    float _650 = fma(_170, _546, _580);
    float _652 = abs(_636);
    bool _654 = _652 > 0.99989998340606689453125;
    float _656 = _642 * 6.283185482025146484375;
    float _658 = sin(_656);
    int _660 = ~_648;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = fma(_646, _646, _612);
    float _668 = fma(_146, _550, _592);
    float _670 = fma(_150, _550, _604);
    float _672 = fma(_154, _550, _650);
    int _674 = _664;
    if (!_638)
    {
        int _676 = ~_648;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    float _682 = sqrt(_666);
    float _684 = _512 * _570;
    float _686 = _668 + _616;
    float _688 = float(_680);
    if (_654)
    {
        float _690 = _278 + _266;
        _280 = _690;
    }
    float _692 = _280;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _694;
    if (_654)
    {
        float _698 = _290 + _274;
        _294 = _698;
    }
    float _700 = _294;
    float _702 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _704 = _686 + _702;
    float _706 = -_692;
    float _708 = _614 * _706;
    float _710 = _658 * _688;
    float _712 = _670 + _624;
    float _714 = _672 + _640;
    if (_654)
    {
        float _716 = _284 + _270;
        _286 = _716;
    }
    float _718 = _286;
    float _720 = -_700;
    float _722 = -_708;
    float _724 = fma(_608, _720, _722);
    float _726 = -_700;
    float _728 = _594 * _726;
    float _730 = _710 * 0.15915493667125701904296875;
    float _732 = _704 * _704;
    float _734 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _736 = _712 + _734;
    float _738 = -_718;
    float _740 = _608 * _738;
    float _742 = -_718;
    float _744 = -_728;
    float _746 = fma(_614, _742, _744);
    float _748 = _724 * _724;
    float _750 = 1.0 / _696;
    float _752 = fma(_736, _736, _732);
    float _754 = -_692;
    float _756 = -_740;
    float _758 = fma(_594, _754, _756);
    float _760 = fma(_746, _746, _748);
    float _762 = precise::max(_682, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _764 = _554 + 0.5;
    float _766 = fma(_758, _758, _760);
    float _768 = _730 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = precise::min(_762, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _774 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _776 = _714 + _774;
    float _778 = _764 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _780 = _510 * _568;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _786 = _772 + _784;
    float _788 = fma(_776, _776, _752);
    float _790 = _730 * 6.283185482025146484375;
    float _792 = cos(_790);
    float _794 = _514 * _572;
    float _796 = _786 * _750;
    float _798 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _800 = rsqrt(_766);
    float _802 = _770 * _560;
    float _804 = _796 * _778;
    float _806 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _810 = _792 * _560;
    float _812 = rsqrt(_788);
    float _814 = -_802;
    float _816 = fma(_792, _564, _814);
    float _818 = fma(_770, _564, _810);
    float _820 = _808 * _782;
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    float _824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _818);
    float _826 = _724 * _800;
    float _828 = _758 * _800;
    float _830 = _746 * _800;
    float _832 = _806 * _824;
    float _834 = _820 * _614;
    float _836 = _608 * _826;
    float _838 = _798 * _822;
    float _840 = _820 * _608;
    float _842 = fma(_832, _828, _834);
    float _844 = _594 * _828;
    float _846 = -_836;
    float _848 = fma(_594, _830, _846);
    float _850 = _812 * _804;
    float _852 = _686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _854 = -_844;
    float _856 = fma(_614, _826, _854);
    float _858 = fma(_832, _830, _840);
    float _860 = fma(_838, _848, _842);
    float _862 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[11].x, _852);
    float _864 = _820 * _594;
    float _866 = fma(_838, _856, _858);
    float _868 = fma(_776, _850, _860);
    float _870 = _714 + _860;
    float _872 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[11].z, _862);
    float _874 = fma(_736, _850, _866);
    float _876 = _712 + _866;
    float _878 = _870 + _868;
    float _880 = _872 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _882 = _614 * _830;
    float _884 = _876 + _874;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _878 + _886;
    float _890 = _686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _892 = 1.0 / _880;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _884 + _894;
    float _898 = _888 * _888;
    float _900 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[10].x, _890);
    float _902 = fma(_832, _826, _864);
    float _904 = fma(_896, _896, _898);
    float _906 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[10].z, _900);
    float _908 = -_882;
    float _910 = fma(_608, _828, _908);
    float _912 = sqrt(_904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _916 = fma(_838, _910, _902);
    float _918 = _914 + _880;
    float _920 = fma(_704, _850, _916);
    float _922 = _686 + _916;
    float _924 = _918 * _892;
    float _926 = _924 * 0.5;
    bool _928 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _930 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    float _938 = _922 + _920;
    bool _940 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _942 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _944 = _940 || _942;
    bool _946 = isnan(0.5);
    bool _948 = _944 || _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _952 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[30].w, _950);
    bool _954 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = 1.0 / _952;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _962 = _902;
    float _964 = _922;
    float _966 = _938;
    float _968 = _864;
    float _970 = _880;
    float _972 = _882;
    float _974 = _750;
    if (!_954)
    {
        _958 = _884;
    }
    float _976 = _958;
    float _978 = _976;
    if (!_954)
    {
        _960 = _878;
    }
    float _980 = _960;
    float _982 = _980;
    if (!_954)
    {
        _962 = _938;
    }
    float _984 = _962;
    bool _986 = !_954;
    float _988 = _984;
    if (!_986)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _994 = _912 + _992;
        float _996 = _938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = _994 * _990;
        float _1000 = rsqrt(_904);
        float _1002 = _998 * 0.15915493667125701904296875;
        float _1004 = _1002 * 6.283185482025146484375;
        float _1006 = cos(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        float _1012 = _1006 + (-1.0);
        float _1014 = _1012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = fma(_1010, _996, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1018 = fma(_938, _1006, _1014);
        float _1020 = _1000 * _1016;
        float _1022 = fma(_896, _1020, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1024 = fma(_888, _1020, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _988 = _1018;
        _978 = _1022;
        _982 = _1024;
        _964 = _1014;
    }
    float _1026 = _988;
    float _1028 = _978;
    float _1030 = _982;
    float _1032 = _964;
    float _1034 = _1032;
    float _1036 = _1026;
    float _1038 = _1028;
    float _1040 = _1030;
    if (_948)
    {
        _1034 = 1.0;
    }
    float _1042 = _1034;
    float _1044 = _1042;
    if (!_936)
    {
        float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1048 = _686 + _1046;
        float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1052 = _712 + _1050;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1056 = -_686;
        float _1058 = _1056 + _1026;
        float _1060 = _1048 * _1048;
        float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1064 = _714 + _1062;
        float _1066 = fma(_1052, _1052, _1060);
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1070 = fma(_1064, _1064, _1066);
        float _1072 = sqrt(_1070);
        float _1074 = _1054 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1076 = precise::min(_1072, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1078 = _1076 * _1068;
        float _1080 = -_712;
        float _1082 = _1080 + _1028;
        float _1084 = _1074 * _1078;
        float _1086 = -_714;
        float _1088 = _1086 + _1030;
        float _1090 = fma(_1082, _1084, _712);
        float _1092 = fma(_1058, _1084, _686);
        float _1094 = fma(_1088, _1084, _714);
        _966 = _1084;
        _1036 = _1092;
        _1038 = _1090;
        _1040 = _1094;
        _968 = _1088;
    }
    float _1096 = _966;
    float _1098 = _1036;
    float _1100 = _1038;
    float _1102 = _1040;
    float _1104 = _968;
    float _1106 = _1096;
    float _1108 = _1104;
    if (_948)
    {
        _970 = 1.0;
    }
    float _1110 = _970;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1114 = _956 * _1112;
    float _1116 = _1110;
    if (!_948)
    {
        float _1118 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1122 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1120;
        float _1124 = _1118 * 0.15915493667125701904296875;
        float _1126 = _1124 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1124 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = 1.0 / _1128;
        float _1140 = _1132 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = _1132 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1142 * _1144;
        float _1152 = 1.0 / _1122;
        float _1154 = 1.0 / _1150;
        float _1156 = _1148 * _1154;
        float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1160 = fma(_1114, _1156, _1158);
        float _1162 = _1160 * _1152;
        float _1164 = precise::clamp(_1162, 0.0, 1.0);
        _1106 = _1132;
        _1108 = _1152;
        _1044 = _1164;
    }
    float _1166 = _1106;
    float _1168 = _1108;
    float _1170 = _1044;
    float _1172 = _1166;
    float _1174 = _1168;
    if (!_948)
    {
        float _1176 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1178 = _1176 * 0.15915493667125701904296875;
        float _1180 = _1178 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        float _1184 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = _1178 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = 1.0 / _1182;
        float _1194 = _1186 * 6.283185482025146484375;
        float _1196 = cos(_1194);
        float _1198 = _1190 * _1192;
        float _1200 = _1186 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1196 * _1198;
        float _1206 = 1.0 / _1204;
        float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1210 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1208;
        float _1212 = 1.0 / _1210;
        float _1214 = _1202 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1218 = fma(_1114, _1214, _1216);
        float _1220 = _1218 * _1212;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        float _1224 = -_1222;
        float _1226 = _1224 + 1.0;
        _1172 = _1192;
        _1174 = _1206;
        _1116 = _1226;
    }
    float _1228 = _1172;
    float _1230 = _1174;
    float _1232 = _1116;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1236 = _1098 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1240 = _1100 + _1238;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1244 = _1102 + _1242;
    float _1246 = _1236 * _1236;
    float _1248 = fma(_1240, _1240, _1246);
    float _1250 = fma(_1244, _1244, _1248);
    float _1252 = rsqrt(_1250);
    float _1254 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1256 = _1240 * _1254;
    float _1258 = _1244 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 * _1258;
    float _1264 = _1260 + _1262;
    float _1266 = sqrt(_1264);
    bool _1268 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1266 + _1270;
    float _1274 = _1244;
    float _1276 = _1230;
    float _1278 = _1272;
    float _1280 = _1228;
    float _1282 = _1236;
    if (_1268)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (_1268)
    {
        float _1288 = rsqrt(_1264);
        _1276 = _1288;
    }
    float _1290 = _1276;
    float _1292 = _1290;
    if (_1268)
    {
        float _1294 = _1272 * _1286;
        _1278 = _1294;
    }
    float _1296 = _1278;
    if (_1268)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1280 = _1298;
    }
    float _1300 = _1280;
    float _1302 = _1252;
    if (_1268)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1246;
    float _1316 = _1312;
    float _1318 = _1310;
    if (_1268)
    {
        float _1320 = _1300 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = -_1254;
    float _1328 = -_1312;
    float _1330 = fma(_1236, _1326, _1328);
    if (!_1268)
    {
        _1282 = _1260;
    }
    float _1332 = _1282;
    float _1334 = _1332;
    if (_1268)
    {
        float _1336 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1316 = _1336;
    }
    float _1338 = _1316;
    float _1340 = sqrt(_1250);
    float _1342 = _1338;
    float _1344 = _1308;
    if (_1268)
    {
        float _1346 = fma(_1308, _1338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = _1348;
    if (!_1268)
    {
        _1344 = _1256;
    }
    float _1352 = _1344;
    float _1354 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1356 = _1352;
    float _1358 = _1324;
    if (_1268)
    {
        float _1360 = _1324 + (-1.0);
        _1318 = _1360;
    }
    float _1362 = _1318;
    float _1364 = _1362;
    if (_1268)
    {
        float _1366 = _1290 * _1348;
        _972 = _1366;
    }
    float _1368 = _972;
    if (!_1268)
    {
        _1350 = _1330;
    }
    float _1370 = _1350;
    float _1372 = _1370;
    if (_1268)
    {
        float _1374 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1374;
    }
    float _1376 = _1292;
    if (_1268)
    {
        float _1378 = _1256 * _1368;
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (!_1268)
    {
        _1364 = _1258;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1268)
    {
        float _1386 = _1258 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    if (_1268)
    {
        float _1390 = fma(_1330, _1324, _1376);
        _1372 = _1390;
    }
    float _1392 = _1372;
    if (_1268)
    {
        float _1394 = _1380 * _1380;
        _1334 = _1394;
    }
    float _1396 = _1334;
    if (!_1268)
    {
        _1358 = _1262;
    }
    float _1398 = _1358;
    float _1400 = _1398;
    if (_1268)
    {
        float _1402 = _1388 * _1388;
        _1400 = _1402;
    }
    float _1404 = _1400;
    float _1406 = fma(_1392, _1392, _1396);
    float _1408 = _1406 + _1404;
    float _1410 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1414 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1412);
    float _1416 = precise::clamp(_1414, 0.0, 1.0);
    float _1418 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1420 = rsqrt(_1408);
    float _1422 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1424 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1426 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1418);
    float _1428 = -_1416;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1434 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1436 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1424);
    float _1438 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1434);
    float _1444 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1436);
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1442);
    float _1452 = abs(_1430);
    float _1454 = log2(_1452);
    float _1456 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1458 = -_1448;
    float _1460 = fma(_1458, _1354, 1.0);
    float _1462 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1420 * _1380;
    float _1466 = _1420 * _1392;
    float _1468 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1456);
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = _1420 * _1388;
    float _1476 = log2(_1460);
    float _1478 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1470);
    float _1480 = -_1472;
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1480);
    float _1484 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1486 = _1466 + 1.0;
    float _1488 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1478);
    float _1490 = -_1474;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1482);
    float _1494 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1496 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = 1.0 / _1488;
    float _1500 = fma(_1492, -0.5, 0.5);
    float _1502 = fma(_1492, 0.5, 0.5);
    float _1504 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1506 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1484);
    float _1508 = exp2(_1494);
    float _1510 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1504);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1514 = sqrt(_1500);
    float _1516 = fma(_1502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1518 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1506);
    float _1520 = _1512 * _1498;
    float _1522 = fma(_1502, _1516, -0.212114393711090087890625);
    float _1524 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1526 = _1476 * 0.693147182464599609375;
    float _1528 = -_1466;
    float _1530 = fma(_1508, _1486, _1528);
    float _1532 = fma(_1502, _1522, 1.570728778839111328125);
    float _1534 = _1524 * _1498;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1538 = fma(_1520, 0.5, 0.5);
    float _1540 = fma(_1534, -0.5, 0.5);
    float _1542 = fma(_1530, 0.5, 0.5);
    float _1544 = _1514 * 0.636619746685028076171875;
    float3 _4087 = float3(_1538, _1540, _1536);
    float _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4087, float3(0.0), isnan(_4087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4087, float3(0.0), isnan(_4087)), level(0.0)).x;
    float3 _4098 = float3(_1538, _1540, _1536);
    float4 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4098, float3(0.0), isnan(_4098)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4098, float3(0.0), isnan(_4098)), level(0.0)).xyzw;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _1549.w;
    float _1559 = -_1532;
    float _1561 = fma(_1544, _1559, 1.0);
    float2 _4120 = float2(_1561, _1542);
    float3 _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4120, float2(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4120, float2(0.0), isnan(_4120)), level(0.0)).xyz;
    float _1567 = _1565.x;
    float _1569 = _1565.y;
    float _1571 = _1565.z;
    float _1573 = in.m_63.y;
    float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1579 = _1577 != 0;
    float _1581 = in.m_63.x;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1585 = _1583 != 0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1591 = _556 > 0.5;
    float _1593 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1597 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1593);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1603 = _1530;
    if (_1579)
    {
        float _1605 = in.m_57.x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1609;
    float _1613 = 1.0 / _1589;
    bool _1615 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1617 = isnan(_544);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1597);
    float _1629 = -_1573;
    float _1631 = _1629 + 1.0;
    float _1633 = -_1625;
    float _1635 = _1633 + 1.0;
    float _1637 = 1.0 / _1601;
    float _1639 = _1573;
    if (_1579)
    {
        _974 = _1581;
    }
    float _1641 = _974;
    float _1643 = _1641;
    if (_1585)
    {
        float _1645 = _1591 ? _1631 : _1573;
        _1639 = _1645;
    }
    float _1647 = _1639;
    bool _1649 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1651 = isnan(_544);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = _1611 * _1613;
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1665 = _544 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1671 = _1659 * _1635;
    float _1673 = -_1659;
    float _1675 = _1673 + 1.0;
    float _1677 = fma(_1661, _1665, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1679 = _1607 > 0.5;
    bool _1681 = _1679 && _1579;
    float _1683 = _1661;
    if (!_1579)
    {
        _1683 = _1581;
    }
    float _1685 = _1683;
    float _1687 = _1669 * _1637;
    bool _1689 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1691 = isnan(_544);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1699 * _1675;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1705 = _544 + _1703;
    float _1707 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1709 = -_1699;
    float _1711 = _1709 + 1.0;
    float _1713 = _1685;
    if (_1681)
    {
        float _1715 = -_1641;
        float _1717 = _1715 + 1.0;
        _1643 = _1717;
    }
    float _1719 = _1643;
    float _1721 = fma(_1687, _1705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1723 = _1677 * _1701;
    float _1725 = _1707 * _1595;
    if (_1579)
    {
        _1713 = _1719;
    }
    float _1727 = _1713;
    float _1729 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1731 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    bool _1733 = _1170 > 0.0;
    bool _1735 = isnan(_1170);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.0);
    bool _1741 = _1737 || _1739;
    float _1743 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_65.w = _1729;
    float _1745 = fma(_1721, _1671, _1731);
    float _1747 = _1743 * _1575;
    float _1749 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1751 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    float _1753 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1745);
    float _1755 = _1488 * 0.5;
    float _1757 = _1170 * _1232;
    float _1759 = exp2(_1749);
    float _1761 = fma(_1524, -0.5, _1755);
    float _1763 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1765 = _1232 <= 0.0;
    bool _1767 = !_1741;
    bool _1769 = _1765 || _1767;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1773 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1779 = _1751 + _1488;
    float _1781 = _1512 + _1488;
    float _1783 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1775;
    float _1785 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1791 = -_1759;
    float _1793 = _1791 + 1.0;
    float _1795 = _1779 * 0.5;
    float _1797 = _1781 * 0.5;
    out.m_67.x = _1747;
    out.m_67.y = _1725;
    float _1799 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1783;
    out.m_69.y = _1785;
    out.m_69.z = _1787;
    out.m_69.w = _1789;
    float _1801 = -_1799;
    float _1803 = _1801 + 1.0;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1751;
    out.gl_Position.w = _1488;
    out.m_71.x = _1797;
    out.m_71.y = _1761;
    out.m_71.z = _1795;
    out.m_71.w = _1488;
    float _1805 = _1799 * _1546;
    float _1807 = _1557 * _1803;
    float _1809 = _1557 * _1805;
    float _1811 = _1571 * _1805;
    float _1813 = fma(_1567, _1809, _1551);
    float _1815 = fma(_1569, _1809, _1553);
    float _1817 = fma(_1557, _1811, _1555);
    out.m_73.x = _1813;
    out.m_73.y = _1815;
    out.m_73.z = _1817;
    out.m_73.w = _1807;
    if (!_1769)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1819;
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
        float _1876 = as_type<float>(_108);
        out.gl_Position.z = _1876;
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
        float _1945 = as_type<float>(_144);
        out.gl_Position.z = _1945;
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
    float _192 = 0.0;
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
    float _206 = 0.0;
    if (!_188)
    {
        _204 = 0.0;
        _206 = 0.0;
    }
    float _208 = _204;
    float _210 = _206;
    float _212 = fma(_180, _162, _198);
    float _214 = fma(_180, _166, _200);
    float _216 = fma(_180, _170, _202);
    float _218 = _178;
    float _220 = _208;
    float _222 = _210;
    if (_190)
    {
        float _224 = rsqrt(_178);
        _218 = _224;
    }
    float _226 = _218;
    float _228 = 0.0;
    float _230 = 0.0;
    if (!_190)
    {
        _228 = 0.0;
        _230 = 0.0;
    }
    float _232 = _228;
    float _234 = _230;
    float _236 = 0.0;
    float _238 = _232;
    float _240 = _234;
    if (!_190)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    float _244 = fma(_146, _184, _212);
    float _246 = 0.0;
    float _248 = _242;
    if (!_188)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = fma(_150, _184, _214);
    float _254 = fma(_154, _184, _216);
    float _256 = _196;
    float _258 = _250;
    if (_188)
    {
        float _260 = _196 * 0.001000000047497451305389404296875;
        _256 = _260;
    }
    float _262 = _256;
    if (_188)
    {
        float _264 = _150 * _262;
        _220 = _264;
    }
    float _266 = _220;
    if (_188)
    {
        float _268 = _146 * _262;
        _258 = _268;
    }
    float _270 = _258;
    if (_188)
    {
        float _272 = _154 * _262;
        _222 = _272;
    }
    float _274 = _222;
    if (_190)
    {
        float _276 = _226 * _156;
        _248 = _276;
    }
    float _278 = _248;
    float _280 = _278;
    if (_190)
    {
        float _282 = _226 * _152;
        _238 = _282;
    }
    float _284 = _238;
    float _286 = _284;
    if (_190)
    {
        float _288 = _226 * _158;
        _240 = _288;
    }
    float _290 = _240;
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
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _330 = _322 + _328;
    bool _332 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _334 = isnan(_322);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _322 + _356;
    float _360 = 1.0 / _350;
    float _362 = -_342;
    float _364 = _362 + 1.0;
    bool _366 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _368 = isnan(_322);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _380 = 1.0 / _354;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -_376;
    float _388 = _386 + 1.0;
    float _390 = _376 * _364;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = 1.0 / _346;
    float _398 = _326 * _360;
    bool _400 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _402 = isnan(_322);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = fma(_394, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = _410 * _388;
    float _416 = _330 * _380;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -_410;
    float _428 = _426 + 1.0;
    float _430 = _358 * _396;
    bool _432 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _434 = isnan(_322);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = fma(_384, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = fma(_420, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = fma(_424, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = -_442;
    float _456 = _454 + 1.0;
    float _458 = _448 * _414;
    float _460 = _450 * _414;
    float _462 = _452 * _414;
    float _464 = _342 * _456;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = fma(_446, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _472 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _474 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _476 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _482;
    float _486 = fma(_468, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_470, _390, _472);
    float _494 = fma(_480, _416, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_484, _416, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_490, _416, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_412, _390, _474);
    float _502 = fma(_486, _390, _476);
    float _504 = fma(_494, _464, _492);
    float _506 = fma(_496, _464, _500);
    float _508 = fma(_498, _464, _502);
    float _510 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].y, _506);
    float _514 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[146].z, _508);
    bool _516 = !_378;
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
    float _546 = in.m_42.x;
    float _548 = in.m_42.y;
    float _550 = in.m_42.z;
    float _552 = _244 * _244;
    float _554 = in.m_57.x;
    float _556 = in.m_57.y;
    float _558 = fma(_252, _252, _552);
    float _560 = in.m_59.x;
    float _562 = in.m_59.y;
    float _564 = in.m_59.z;
    float _566 = fma(_254, _254, _558);
    float _568 = in.m_61.x;
    float _570 = in.m_61.y;
    float _572 = in.m_61.z;
    float _574 = rsqrt(_566);
    float _576 = _156 * _548;
    float _578 = _152 * _548;
    float _580 = _158 * _548;
    float _582 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _584 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[191].w, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _586 = _554 * 100.0;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _590 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _588;
    float _592 = fma(_162, _546, _578);
    float _594 = _244 * _574;
    float _596 = fma(_582, _584, _586);
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _600 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _598;
    float _602 = _590 * _590;
    float _604 = fma(_166, _546, _576);
    float _606 = _596 + _562;
    float _608 = _252 * _574;
    float _610 = _594 * _284;
    float _612 = fma(_600, _600, _602);
    float _614 = _254 * _574;
    float _616 = in.m_49.w;
    float _618 = fma(_608, _278, _610);
    float _620 = abs(_560);
    float _622 = fma(_620, 2.0, _606);
    float _624 = in.m_51.w;
    bool _626 = _560 >= 0.0;
    bool _628 = isnan(_560);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_614, _290, _618);
    bool _638 = _560 > 0.0;
    float _640 = in.m_53.w;
    float _642 = _622 * 0.15915493667125701904296875;
    float _644 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _646 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _644;
    int _648 = _634 ? 0 : 1;
    float _650 = fma(_170, _546, _580);
    float _652 = abs(_636);
    bool _654 = _652 > 0.99989998340606689453125;
    float _656 = _642 * 6.283185482025146484375;
    float _658 = sin(_656);
    int _660 = ~_648;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = fma(_646, _646, _612);
    float _668 = fma(_146, _550, _592);
    float _670 = fma(_150, _550, _604);
    float _672 = fma(_154, _550, _650);
    int _674 = _664;
    if (!_638)
    {
        int _676 = ~_648;
        int _678 = _676 + 1;
        _674 = _678;
    }
    int _680 = _674;
    float _682 = sqrt(_666);
    float _684 = _512 * _570;
    float _686 = _668 + _616;
    float _688 = float(_680);
    if (_654)
    {
        float _690 = _278 + _266;
        _280 = _690;
    }
    float _692 = _280;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _694;
    if (_654)
    {
        float _698 = _290 + _274;
        _294 = _698;
    }
    float _700 = _294;
    float _702 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _704 = _686 + _702;
    float _706 = -_692;
    float _708 = _614 * _706;
    float _710 = _658 * _688;
    float _712 = _670 + _624;
    float _714 = _672 + _640;
    if (_654)
    {
        float _716 = _284 + _270;
        _286 = _716;
    }
    float _718 = _286;
    float _720 = -_700;
    float _722 = -_708;
    float _724 = fma(_608, _720, _722);
    float _726 = -_700;
    float _728 = _594 * _726;
    float _730 = _710 * 0.15915493667125701904296875;
    float _732 = _704 * _704;
    float _734 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _736 = _712 + _734;
    float _738 = -_718;
    float _740 = _608 * _738;
    float _742 = -_718;
    float _744 = -_728;
    float _746 = fma(_614, _742, _744);
    float _748 = _724 * _724;
    float _750 = 1.0 / _696;
    float _752 = fma(_736, _736, _732);
    float _754 = -_692;
    float _756 = -_740;
    float _758 = fma(_594, _754, _756);
    float _760 = fma(_746, _746, _748);
    float _762 = precise::max(_682, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _764 = _554 + 0.5;
    float _766 = fma(_758, _758, _760);
    float _768 = _730 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = precise::min(_762, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _774 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _776 = _714 + _774;
    float _778 = _764 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _780 = _510 * _568;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _786 = _772 + _784;
    float _788 = fma(_776, _776, _752);
    float _790 = _730 * 6.283185482025146484375;
    float _792 = cos(_790);
    float _794 = _514 * _572;
    float _796 = _786 * _750;
    float _798 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _800 = rsqrt(_766);
    float _802 = _770 * _560;
    float _804 = _796 * _778;
    float _806 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _810 = _792 * _560;
    float _812 = rsqrt(_788);
    float _814 = -_802;
    float _816 = fma(_792, _564, _814);
    float _818 = fma(_770, _564, _810);
    float _820 = _808 * _782;
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    float _824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _818);
    float _826 = _724 * _800;
    float _828 = _758 * _800;
    float _830 = _746 * _800;
    float _832 = _806 * _824;
    float _834 = _820 * _614;
    float _836 = _608 * _826;
    float _838 = _798 * _822;
    float _840 = _820 * _608;
    float _842 = fma(_832, _828, _834);
    float _844 = _594 * _828;
    float _846 = -_836;
    float _848 = fma(_594, _830, _846);
    float _850 = _812 * _804;
    float _852 = _686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _854 = -_844;
    float _856 = fma(_614, _826, _854);
    float _858 = fma(_832, _830, _840);
    float _860 = fma(_838, _848, _842);
    float _862 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[11].x, _852);
    float _864 = _820 * _594;
    float _866 = fma(_838, _856, _858);
    float _868 = fma(_776, _850, _860);
    float _870 = _714 + _860;
    float _872 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[11].z, _862);
    float _874 = fma(_736, _850, _866);
    float _876 = _712 + _866;
    float _878 = _870 + _868;
    float _880 = _872 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _882 = _614 * _830;
    float _884 = _876 + _874;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _878 + _886;
    float _890 = _686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _892 = 1.0 / _880;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _884 + _894;
    float _898 = _888 * _888;
    float _900 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[10].x, _890);
    float _902 = fma(_832, _826, _864);
    float _904 = fma(_896, _896, _898);
    float _906 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[10].z, _900);
    float _908 = -_882;
    float _910 = fma(_608, _828, _908);
    float _912 = sqrt(_904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _916 = fma(_838, _910, _902);
    float _918 = _914 + _880;
    float _920 = fma(_704, _850, _916);
    float _922 = _686 + _916;
    float _924 = _918 * _892;
    float _926 = _924 * 0.5;
    bool _928 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _930 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _932 = _928 || _930;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    float _938 = _922 + _920;
    bool _940 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _942 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _944 = _940 || _942;
    bool _946 = isnan(0.5);
    bool _948 = _944 || _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _952 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[30].w, _950);
    bool _954 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = 1.0 / _952;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _960 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _962 = _902;
    float _964 = _922;
    float _966 = _938;
    float _968 = _864;
    float _970 = _880;
    float _972 = _882;
    float _974 = _750;
    if (!_954)
    {
        _958 = _884;
    }
    float _976 = _958;
    float _978 = _976;
    if (!_954)
    {
        _960 = _878;
    }
    float _980 = _960;
    float _982 = _980;
    if (!_954)
    {
        _962 = _938;
    }
    float _984 = _962;
    bool _986 = !_954;
    float _988 = _984;
    if (!_986)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _994 = _912 + _992;
        float _996 = _938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = _994 * _990;
        float _1000 = rsqrt(_904);
        float _1002 = _998 * 0.15915493667125701904296875;
        float _1004 = _1002 * 6.283185482025146484375;
        float _1006 = cos(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        float _1012 = _1006 + (-1.0);
        float _1014 = _1012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = fma(_1010, _996, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1018 = fma(_938, _1006, _1014);
        float _1020 = _1000 * _1016;
        float _1022 = fma(_896, _1020, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1024 = fma(_888, _1020, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _988 = _1018;
        _978 = _1022;
        _982 = _1024;
        _964 = _1014;
    }
    float _1026 = _988;
    float _1028 = _978;
    float _1030 = _982;
    float _1032 = _964;
    float _1034 = _1032;
    float _1036 = _1026;
    float _1038 = _1028;
    float _1040 = _1030;
    if (_948)
    {
        _1034 = 1.0;
    }
    float _1042 = _1034;
    float _1044 = _1042;
    if (!_936)
    {
        float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1048 = _686 + _1046;
        float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1052 = _712 + _1050;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1056 = -_686;
        float _1058 = _1056 + _1026;
        float _1060 = _1048 * _1048;
        float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1064 = _714 + _1062;
        float _1066 = fma(_1052, _1052, _1060);
        float _1068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1070 = fma(_1064, _1064, _1066);
        float _1072 = sqrt(_1070);
        float _1074 = _1054 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1076 = precise::min(_1072, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1078 = _1076 * _1068;
        float _1080 = -_712;
        float _1082 = _1080 + _1028;
        float _1084 = _1074 * _1078;
        float _1086 = -_714;
        float _1088 = _1086 + _1030;
        float _1090 = fma(_1082, _1084, _712);
        float _1092 = fma(_1058, _1084, _686);
        float _1094 = fma(_1088, _1084, _714);
        _966 = _1084;
        _1036 = _1092;
        _1038 = _1090;
        _1040 = _1094;
        _968 = _1088;
    }
    float _1096 = _966;
    float _1098 = _1036;
    float _1100 = _1038;
    float _1102 = _1040;
    float _1104 = _968;
    float _1106 = _1096;
    float _1108 = _1104;
    if (_948)
    {
        _970 = 1.0;
    }
    float _1110 = _970;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1114 = _956 * _1112;
    float _1116 = _1110;
    if (!_948)
    {
        float _1118 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1122 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1120;
        float _1124 = _1118 * 0.15915493667125701904296875;
        float _1126 = _1124 * 6.283185482025146484375;
        float _1128 = cos(_1126);
        float _1130 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1124 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = 1.0 / _1128;
        float _1140 = _1132 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = _1132 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = _1142 * _1144;
        float _1152 = 1.0 / _1122;
        float _1154 = 1.0 / _1150;
        float _1156 = _1148 * _1154;
        float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1160 = fma(_1114, _1156, _1158);
        float _1162 = _1160 * _1152;
        float _1164 = precise::clamp(_1162, 0.0, 1.0);
        _1106 = _1132;
        _1108 = _1152;
        _1044 = _1164;
    }
    float _1166 = _1106;
    float _1168 = _1108;
    float _1170 = _1044;
    float _1172 = _1166;
    float _1174 = _1168;
    if (!_948)
    {
        float _1176 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1178 = _1176 * 0.15915493667125701904296875;
        float _1180 = _1178 * 6.283185482025146484375;
        float _1182 = cos(_1180);
        float _1184 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1186 = _1184 * 0.15915493667125701904296875;
        float _1188 = _1178 * 6.283185482025146484375;
        float _1190 = sin(_1188);
        float _1192 = 1.0 / _1182;
        float _1194 = _1186 * 6.283185482025146484375;
        float _1196 = cos(_1194);
        float _1198 = _1190 * _1192;
        float _1200 = _1186 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1196 * _1198;
        float _1206 = 1.0 / _1204;
        float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1210 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1208;
        float _1212 = 1.0 / _1210;
        float _1214 = _1202 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1218 = fma(_1114, _1214, _1216);
        float _1220 = _1218 * _1212;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        float _1224 = -_1222;
        float _1226 = _1224 + 1.0;
        _1172 = _1192;
        _1174 = _1206;
        _1116 = _1226;
    }
    float _1228 = _1172;
    float _1230 = _1174;
    float _1232 = _1116;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1236 = _1098 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1240 = _1100 + _1238;
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1244 = _1102 + _1242;
    float _1246 = _1236 * _1236;
    float _1248 = fma(_1240, _1240, _1246);
    float _1250 = fma(_1244, _1244, _1248);
    float _1252 = rsqrt(_1250);
    float _1254 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1256 = _1240 * _1254;
    float _1258 = _1244 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 * _1258;
    float _1264 = _1260 + _1262;
    float _1266 = sqrt(_1264);
    bool _1268 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1266 + _1270;
    float _1274 = _1244;
    float _1276 = _1230;
    float _1278 = _1272;
    float _1280 = _1228;
    float _1282 = _1236;
    if (_1268)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (_1268)
    {
        float _1288 = rsqrt(_1264);
        _1276 = _1288;
    }
    float _1290 = _1276;
    float _1292 = _1290;
    if (_1268)
    {
        float _1294 = _1272 * _1286;
        _1278 = _1294;
    }
    float _1296 = _1278;
    if (_1268)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1280 = _1298;
    }
    float _1300 = _1280;
    float _1302 = _1252;
    if (_1268)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1246;
    float _1316 = _1312;
    float _1318 = _1310;
    if (_1268)
    {
        float _1320 = _1300 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = -_1254;
    float _1328 = -_1312;
    float _1330 = fma(_1236, _1326, _1328);
    if (!_1268)
    {
        _1282 = _1260;
    }
    float _1332 = _1282;
    float _1334 = _1332;
    if (_1268)
    {
        float _1336 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1316 = _1336;
    }
    float _1338 = _1316;
    float _1340 = sqrt(_1250);
    float _1342 = _1338;
    float _1344 = _1308;
    if (_1268)
    {
        float _1346 = fma(_1308, _1338, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = _1348;
    if (!_1268)
    {
        _1344 = _1256;
    }
    float _1352 = _1344;
    float _1354 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1356 = _1352;
    float _1358 = _1324;
    if (_1268)
    {
        float _1360 = _1324 + (-1.0);
        _1318 = _1360;
    }
    float _1362 = _1318;
    float _1364 = _1362;
    if (_1268)
    {
        float _1366 = _1290 * _1348;
        _972 = _1366;
    }
    float _1368 = _972;
    if (!_1268)
    {
        _1350 = _1330;
    }
    float _1370 = _1350;
    float _1372 = _1370;
    if (_1268)
    {
        float _1374 = _1362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1374;
    }
    float _1376 = _1292;
    if (_1268)
    {
        float _1378 = _1256 * _1368;
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (!_1268)
    {
        _1364 = _1258;
    }
    float _1382 = _1364;
    float _1384 = _1382;
    if (_1268)
    {
        float _1386 = _1258 * _1368;
        _1384 = _1386;
    }
    float _1388 = _1384;
    if (_1268)
    {
        float _1390 = fma(_1330, _1324, _1376);
        _1372 = _1390;
    }
    float _1392 = _1372;
    if (_1268)
    {
        float _1394 = _1380 * _1380;
        _1334 = _1394;
    }
    float _1396 = _1334;
    if (!_1268)
    {
        _1358 = _1262;
    }
    float _1398 = _1358;
    float _1400 = _1398;
    if (_1268)
    {
        float _1402 = _1388 * _1388;
        _1400 = _1402;
    }
    float _1404 = _1400;
    float _1406 = fma(_1392, _1392, _1396);
    float _1408 = _1406 + _1404;
    float _1410 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1414 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1412);
    float _1416 = precise::clamp(_1414, 0.0, 1.0);
    float _1418 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1420 = rsqrt(_1408);
    float _1422 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1410);
    float _1424 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1426 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1418);
    float _1428 = -_1416;
    float _1430 = _1428 + 1.0;
    float _1432 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1434 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1436 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1424);
    float _1438 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1442 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1434);
    float _1444 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1436);
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1450 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1442);
    float _1452 = abs(_1430);
    float _1454 = log2(_1452);
    float _1456 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1458 = -_1448;
    float _1460 = fma(_1458, _1354, 1.0);
    float _1462 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1420 * _1380;
    float _1466 = _1420 * _1392;
    float _1468 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1456);
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = _1420 * _1388;
    float _1476 = log2(_1460);
    float _1478 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1470);
    float _1480 = -_1472;
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1480);
    float _1484 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1486 = _1466 + 1.0;
    float _1488 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1478);
    float _1490 = -_1474;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1482);
    float _1494 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1496 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = 1.0 / _1488;
    float _1500 = fma(_1492, -0.5, 0.5);
    float _1502 = fma(_1492, 0.5, 0.5);
    float _1504 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1506 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1484);
    float _1508 = exp2(_1494);
    float _1510 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1504);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1514 = sqrt(_1500);
    float _1516 = fma(_1502, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1518 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1506);
    float _1520 = _1512 * _1498;
    float _1522 = fma(_1502, _1516, -0.212114393711090087890625);
    float _1524 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1526 = _1476 * 0.693147182464599609375;
    float _1528 = -_1466;
    float _1530 = fma(_1508, _1486, _1528);
    float _1532 = fma(_1502, _1522, 1.570728778839111328125);
    float _1534 = _1524 * _1498;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1538 = fma(_1520, 0.5, 0.5);
    float _1540 = fma(_1534, -0.5, 0.5);
    float _1542 = fma(_1530, 0.5, 0.5);
    float _1544 = _1514 * 0.636619746685028076171875;
    float3 _4087 = float3(_1538, _1540, _1536);
    float _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4087, float3(0.0), isnan(_4087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4087, float3(0.0), isnan(_4087)), level(0.0)).x;
    float3 _4098 = float3(_1538, _1540, _1536);
    float4 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4098, float3(0.0), isnan(_4098)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4098, float3(0.0), isnan(_4098)), level(0.0)).xyzw;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _1549.w;
    float _1559 = -_1532;
    float _1561 = fma(_1544, _1559, 1.0);
    float2 _4120 = float2(_1561, _1542);
    float3 _1565 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4120, float2(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4120, float2(0.0), isnan(_4120)), level(0.0)).xyz;
    float _1567 = _1565.x;
    float _1569 = _1565.y;
    float _1571 = _1565.z;
    float _1573 = in.m_63.y;
    float _1575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1579 = _1577 != 0;
    float _1581 = in.m_63.x;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1585 = _1583 != 0;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1591 = _556 > 0.5;
    float _1593 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1597 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1593);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1601 = _1599 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1603 = _1530;
    if (_1579)
    {
        float _1605 = in.m_57.x;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1609;
    float _1613 = 1.0 / _1589;
    bool _1615 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1617 = isnan(_544);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1597);
    float _1629 = -_1573;
    float _1631 = _1629 + 1.0;
    float _1633 = -_1625;
    float _1635 = _1633 + 1.0;
    float _1637 = 1.0 / _1601;
    float _1639 = _1573;
    if (_1579)
    {
        _974 = _1581;
    }
    float _1641 = _974;
    float _1643 = _1641;
    if (_1585)
    {
        float _1645 = _1591 ? _1631 : _1573;
        _1639 = _1645;
    }
    float _1647 = _1639;
    bool _1649 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1651 = isnan(_544);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = _1611 * _1613;
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1665 = _544 + _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1669 = _1667 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1671 = _1659 * _1635;
    float _1673 = -_1659;
    float _1675 = _1673 + 1.0;
    float _1677 = fma(_1661, _1665, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1679 = _1607 > 0.5;
    bool _1681 = _1679 && _1579;
    float _1683 = _1661;
    if (!_1579)
    {
        _1683 = _1581;
    }
    float _1685 = _1683;
    float _1687 = _1669 * _1637;
    bool _1689 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1691 = isnan(_544);
    bool _1693 = _1689 || _1691;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1697 = _1693 || _1695;
    float _1699 = float(_1697);
    float _1701 = _1699 * _1675;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1705 = _544 + _1703;
    float _1707 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1709 = -_1699;
    float _1711 = _1709 + 1.0;
    float _1713 = _1685;
    if (_1681)
    {
        float _1715 = -_1641;
        float _1717 = _1715 + 1.0;
        _1643 = _1717;
    }
    float _1719 = _1643;
    float _1721 = fma(_1687, _1705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1723 = _1677 * _1701;
    float _1725 = _1707 * _1595;
    if (_1579)
    {
        _1713 = _1719;
    }
    float _1727 = _1713;
    float _1729 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1731 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    bool _1733 = _1170 > 0.0;
    bool _1735 = isnan(_1170);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan(0.0);
    bool _1741 = _1737 || _1739;
    float _1743 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_65.w = _1729;
    float _1745 = fma(_1721, _1671, _1731);
    float _1747 = _1743 * _1575;
    float _1749 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1751 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    float _1753 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1745);
    float _1755 = _1488 * 0.5;
    float _1757 = _1170 * _1232;
    float _1759 = exp2(_1749);
    float _1761 = fma(_1524, -0.5, _1755);
    float _1763 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1765 = _1232 <= 0.0;
    bool _1767 = !_1741;
    bool _1769 = _1765 || _1767;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1773 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1779 = _1751 + _1488;
    float _1781 = _1512 + _1488;
    float _1783 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _1775;
    float _1785 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = _1753 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1791 = -_1759;
    float _1793 = _1791 + 1.0;
    float _1795 = _1779 * 0.5;
    float _1797 = _1781 * 0.5;
    out.m_67.x = _1747;
    out.m_67.y = _1725;
    float _1799 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _1783;
    out.m_69.y = _1785;
    out.m_69.z = _1787;
    out.m_69.w = _1789;
    float _1801 = -_1799;
    float _1803 = _1801 + 1.0;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1751;
    out.gl_Position.w = _1488;
    out.m_71.x = _1797;
    out.m_71.y = _1761;
    out.m_71.z = _1795;
    out.m_71.w = _1488;
    float _1805 = _1799 * _1546;
    float _1807 = _1557 * _1803;
    float _1809 = _1557 * _1805;
    float _1811 = _1571 * _1805;
    float _1813 = fma(_1567, _1809, _1551);
    float _1815 = fma(_1569, _1809, _1553);
    float _1817 = fma(_1557, _1811, _1555);
    out.m_73.x = _1813;
    out.m_73.y = _1815;
    out.m_73.z = _1817;
    out.m_73.w = _1807;
    if (!_1769)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1819;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

