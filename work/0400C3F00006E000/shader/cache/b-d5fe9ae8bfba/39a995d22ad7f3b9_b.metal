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
    texture2d<float> vp_t_tcb_20 [[id(5)]];
    sampler vp_t_tcb_20Smplr [[id(6)]];
    sampler vp_t_tcb_20Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_63 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_35 [[attribute(5)]];
    float4 m_40 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_50 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _636 = false;
    bool _536 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_35.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_38.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1495 = as_type<float>(_98);
        out.gl_Position.z = _1495;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_40.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = _116;
    if (_112)
    {
        float _120 = float(_82);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _116 >= _122;
    bool _126 = !_112;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_38.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_136);
        out.gl_Position.z = _1565;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_42.x;
    float _140 = in.m_42.y;
    float _142 = in.m_42.z;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _116 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_44.x;
    float _150 = in.m_44.y;
    float _152 = in.m_44.z;
    float _154 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_46.x;
    float _168 = in.m_46.y;
    float _170 = in.m_46.z;
    float _172 = _146 * _144;
    float _174 = 0.0;
    float _176 = _154;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_164)
    {
        float _180 = _154 * _154;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _138 * _138;
    float _188 = _140 * _140;
    float _190 = _142 * _142;
    float _192 = _184;
    float _194 = _138;
    if (!_164)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = fma(_148, _148, _186);
    float _202 = fma(_150, _150, _188);
    float _204 = fma(_152, _152, _190);
    float _206 = fma(_166, _166, _200);
    float _208 = fma(_168, _168, _202);
    float _210 = in.m_48.x;
    float _212 = fma(_170, _170, _204);
    float _214 = sqrt(_206);
    float _216 = sqrt(_208);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    bool _224 = _216 > 0.0;
    float _226 = floor(_222);
    float _228 = 0.0;
    float _230 = _206;
    float _232 = _198;
    if (!_220)
    {
        _228 = 0.0;
    }
    float _234 = _228;
    bool _236 = _218 > 0.0;
    float _238 = 0.0;
    float _240 = _218;
    float _242 = _234;
    if (_220)
    {
        float _244 = rsqrt(_206);
        _238 = _244;
    }
    float _246 = _238;
    int _248 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _250 = _248 != 0;
    if (!_220)
    {
        _240 = 0.0;
    }
    float _252 = _240;
    float _254 = _214;
    float _256 = _252;
    if (_224)
    {
        float _258 = rsqrt(_208);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = -_226;
    float _264 = _222 + _262;
    float _266 = _222 * 6.283185482025146484375;
    if (!_220)
    {
        _230 = 0.0;
    }
    float _268 = _230;
    float _270 = 0.0;
    float _272 = _268;
    if (_236)
    {
        float _274 = rsqrt(_212);
        _270 = _274;
    }
    float _276 = _270;
    bool _278 = !_164;
    float _280 = 0.0;
    float _282 = 0.0;
    if (!_278)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _154 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _154);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _312;
        _280 = _296;
        _282 = _302;
    }
    float _314 = _232;
    float _316 = _280;
    float _318 = _282;
    bool _320 = !_164;
    float _322 = _316;
    float _324 = _318;
    if (!_320)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _154 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _176 = _344;
        _178 = _334;
    }
    float _346 = _176;
    float _348 = _178;
    float _350 = _266 * 0.15915493667125701904296875;
    float _352 = in.m_40.x;
    float _354 = in.m_40.y;
    float _356 = in.m_40.z;
    float _358 = _348;
    if (!_224)
    {
        _358 = 0.0;
        _322 = 0.0;
    }
    float _360 = _358;
    float _362 = _322;
    float _364 = _350 * 6.283185482025146484375;
    float _366 = cos(_364);
    float _368 = _360;
    float _370 = _362;
    if (_220)
    {
        float _372 = _246 * _148;
        _272 = _372;
    }
    float _374 = _272;
    if (_220)
    {
        float _376 = _246 * _138;
        _256 = _376;
    }
    float _378 = _256;
    if (_220)
    {
        float _380 = _246 * _166;
        _242 = _380;
    }
    float _382 = _242;
    float _384 = 0.0;
    if (!_224)
    {
        _384 = 0.0;
    }
    float _386 = _384;
    float _388 = _386;
    if (_224)
    {
        float _390 = _260 * _150;
        _368 = _390;
    }
    float _392 = _368;
    if (_224)
    {
        float _394 = _260 * _140;
        _370 = _394;
    }
    float _396 = _370;
    if (_224)
    {
        float _398 = _260 * _168;
        _388 = _398;
    }
    float _400 = _388;
    float _402 = 0.0;
    float _404 = 0.0;
    if (!_236)
    {
        _402 = 0.0;
        _404 = 0.0;
    }
    float _406 = _402;
    float _408 = _404;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _416 = _414 != 0;
    float _418 = _408;
    float _420 = _406;
    if (_236)
    {
        float _422 = _276 * _142;
        _418 = _422;
    }
    float _424 = _418;
    if (_236)
    {
        float _426 = _276 * _170;
        _420 = _426;
    }
    float _428 = _420;
    bool _430 = _264 < 0.5;
    float _432 = float(_430);
    float _434 = in.m_50.w;
    if (!_236)
    {
        _324 = 0.0;
    }
    float _436 = _324;
    float _438 = _436;
    if (_236)
    {
        float _440 = _276 * _152;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = fma(_366, 0.5, 0.5);
    float _446 = in.m_35.x;
    float _448 = in.m_35.y;
    float _450 = in.m_35.z;
    bool _452 = !_412;
    int _454 = _452 ? 0 : 1;
    float _456 = -_264;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = -_432;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _464 = !_250;
    int _466 = _464 ? 0 : 1;
    float _468 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = -_444;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _474 = abs(_454);
    float _476 = fma(_346, _352, _468);
    int _478 = abs(_466);
    float _480 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _482 = !_416;
    int _484 = _482 ? 0 : 1;
    float _486 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _488 = fma(_346, _354, _480);
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _492 = fma(_346, _356, _486);
    int _494 = abs(_484);
    float _496 = float(_474);
    float _498 = float(_478);
    float _500 = abs(_458);
    float _502 = _496 * _500;
    float _504 = fma(_476, _434, _446);
    float _506 = fma(_488, _434, _448);
    float _508 = float(_494);
    float _510 = fma(_498, _472, _502);
    float _512 = fma(_492, _434, _450);
    float _514 = abs(_462);
    float _516 = fma(_508, _514, _510);
    bool _518 = !_490;
    float _534;
    if (!_518)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _522 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_82);
        float _540 = 1.0 / _538;
        float _542 = _116 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _548 = _544 + _546;
    bool _550 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _552 = isnan(_544);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _562;
    float _566 = -_560;
    float _568 = _566 + 1.0;
    bool _570 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _582;
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = 1.0 / _564;
    float _590 = _580 * _568;
    float _592 = -_580;
    float _594 = _592 + 1.0;
    float _596 = _548 * _588;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _598;
    float _602 = fma(_584, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _604 = fma(_600, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _606 = _602 * _590;
    float _608 = _604 * _590;
    float _610 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _606);
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _608);
    float _614 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[144].x, _610);
    float _616 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[144].y, _612);
    bool _618 = !_586;
    float _634;
    if (!_618)
    {
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _210 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_82);
        float _640 = 1.0 / _638;
        float _642 = _116 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_48.z;
    float _648 = _210 * 2.0;
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _664 = _662 != 0;
    float _666 = in.m_48.y;
    bool _668 = !_660;
    int _670 = _668 ? 0 : 1;
    float _672 = floor(_648);
    bool _674 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(1.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _686 = 1.0 + _684;
    int _688 = abs(_670);
    bool _690 = !_656;
    int _692 = _690 ? 0 : 1;
    float _694 = _652 * _116;
    float _696 = 1.0 / _686;
    float _698 = _646 * 2.0;
    bool _700 = _672 > 0.0;
    float _702 = exp2(_694);
    float _704 = _666 + _646;
    bool _706 = _672 >= 0.0;
    bool _708 = isnan(_672);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _666 * 2.0;
    float _718 = float(_688);
    float _720 = _704 + (-1.0);
    float _722 = floor(_698);
    int _724 = _714 ? 0 : 1;
    float _726 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _728 = ~_724;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    int _734 = _732;
    if (!_700)
    {
        int _736 = ~_724;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    float _742 = floor(_716);
    float _744 = -_702;
    float _746 = _744 + 1.0;
    bool _748 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _756 = _752 || _754;
    float _758 = float(_740);
    float _760 = _756 ? _746 : 0.0;
    bool _762 = _722 > 0.0;
    float _764 = _718 * _758;
    bool _766 = _722 >= 0.0;
    bool _768 = isnan(_722);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    if (_682)
    {
        float _776 = _760 * _696;
        _118 = _776;
    }
    float _778 = _118;
    float _780 = in.m_52.x;
    float _782 = in.m_52.y;
    float _784 = in.m_52.z;
    float _786 = _764 * (-2.0);
    int _788 = _774 ? 0 : 1;
    float _790 = _666 + (-0.5);
    bool _792 = _742 > 0.0;
    float _794 = fma(_726, _786, _726);
    int _796 = ~_788;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    bool _802 = _742 >= 0.0;
    bool _804 = isnan(_742);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    int _812 = _800;
    if (!_762)
    {
        int _814 = ~_788;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    int _820 = abs(_692);
    int _822 = _810 ? 0 : 1;
    bool _824 = !_664;
    int _826 = _824 ? 0 : 1;
    float _828 = float(_820);
    float _830 = float(_818);
    int _832 = ~_822;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = fma(_786, _782, _782);
    int _840 = _836;
    if (!_792)
    {
        int _842 = ~_822;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    float _848 = _210 + _666;
    int _850 = abs(_826);
    float _852 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _854 = _828 * _830;
    float _856 = _848 + (-1.0);
    float _858 = fma(_794, _778, _852);
    float _860 = float(_850);
    float _862 = _854 * (-2.0);
    float _864 = float(_846);
    float _866 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _868 = _210 + (-0.5);
    float _870 = fma(_862, _780, _780);
    float _872 = _858 * 0.15915493667125701904296875;
    float _874 = _860 * _864;
    float _876 = _210 + _646;
    float _878 = as_type<float>(int(gl_VertexIndex));
    float _880 = fma(_866, _862, _866);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _870);
    float _884 = _876 + (-1.0);
    float _886 = _874 * (-2.0);
    float _888 = fma(_880, _778, _882);
    float _890 = in.m_50.x;
    float _892 = in.m_50.y;
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _896 = fma(_886, _784, _784);
    float _898 = _646 + (-0.5);
    float _900 = _888 * 0.15915493667125701904296875;
    float _902 = fma(_894, _886, _894);
    float _904 = _872 * 6.283185482025146484375;
    float _906 = sin(_904);
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].z, _896);
    float _910 = _506 * _150;
    float _912 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _914 = in.m_46.w;
    float _916 = fma(_902, _778, _908);
    float _918 = fma(_504, _148, _910);
    float _920 = _872 * 6.283185482025146484375;
    float _922 = cos(_920);
    float _924 = _916 * 0.15915493667125701904296875;
    int _926 = as_type<int>(_878) & 1;
    bool _928 = _926 != 0;
    int _930 = as_type<int>(_878) & 2;
    bool _932 = _930 != 0;
    float _934 = _924 * 6.283185482025146484375;
    float _936 = cos(_934);
    bool _938 = !_928;
    float _940 = _938 ? (-0.5) : 0.5;
    float _942 = _614 * _890;
    bool _944 = !_932;
    float _946 = _944 ? (-0.5) : 0.5;
    float _948 = _616 * _892;
    float _950 = _506 * _168;
    float _952 = _942 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _940);
    float _956 = _900 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _964 = _952 * _954;
    float _966 = fma(_504, _166, _950);
    float _968 = _506 * _140;
    float _970 = _960 * _962;
    float _972 = in.m_44.w;
    float _974 = _900 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = fma(_512, _170, _966);
    float _980 = fma(_504, _138, _968);
    float _982 = _978 + _914;
    float _984 = fma(_512, _142, _980);
    float _986 = _924 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _958 * _906;
    float _992 = _958 * _922;
    float _994 = _976 * _922;
    float _996 = _936 * _912;
    float _998 = _976 * _906;
    float _1000 = _922 * _936;
    float _1002 = _906 * _936;
    float _1004 = _976 * _996;
    float _1006 = _958 * _996;
    float _1008 = fma(_988, _994, _990);
    float _1010 = _988 * _912;
    float _1012 = fma(_1008, _964, _1004);
    float _1014 = -_992;
    float _1016 = fma(_988, _998, _1014);
    float _1018 = -_998;
    float _1020 = fma(_988, _992, _1018);
    float _1022 = -_1010;
    float _1024 = fma(_1000, _964, _1022);
    float _1026 = fma(_988, _990, _994);
    float _1028 = -_970;
    float _1030 = fma(_1016, _1028, _1012);
    float _1032 = fma(_1020, _964, _1006);
    float _1034 = -_970;
    float _1036 = fma(_1002, _1034, _1024);
    float _1038 = _1030 * _400;
    float _1040 = -_970;
    float _1042 = fma(_1026, _1040, _1032);
    float _1044 = _1030 * _392;
    float _1046 = fma(_512, _152, _918);
    float _1048 = fma(_1036, _382, _1038);
    float _1050 = _1030 * _396;
    float _1052 = fma(_1036, _374, _1044);
    float _1054 = _1046 + _972;
    float _1056 = fma(_1042, _428, _1048);
    float _1058 = in.m_42.w;
    float _1060 = fma(_1042, _442, _1052);
    float _1062 = fma(_1036, _378, _1050);
    float _1064 = _982 + _1056;
    float _1066 = _1054 + _1060;
    float _1068 = fma(_1042, _424, _1062);
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1066 + _1074;
    float _1078 = _1072 * _1072;
    float _1080 = fma(_1076, _1076, _1078);
    float _1082 = sqrt(_1080);
    float _1084 = _984 + _1058;
    float _1086 = _1084 + _1068;
    bool _1088 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = _1082 + _1090;
    float _1094 = _170;
    float _1096 = _1030;
    float _1098 = _1082;
    float _1100 = _1092;
    float _1102 = _1064;
    if (_1088)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (_1088)
    {
        float _1108 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (!_1088)
    {
        _194 = _1066;
    }
    float _1114 = _194;
    float _1116 = _1106;
    float _1118 = _1114;
    if (_1088)
    {
        float _1120 = _1092 * _1106;
        _1098 = _1120;
    }
    float _1122 = _1098;
    if (_1088)
    {
        float _1124 = rsqrt(_1080);
        _1116 = _1124;
    }
    float _1126 = _1116;
    float _1128 = _1126;
    if (_1088)
    {
        float _1130 = _1122 * 0.15915493667125701904296875;
        _1100 = _1130;
    }
    float _1132 = _1100;
    float _1134 = _1122;
    float _1136 = _1132;
    if (_1088)
    {
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        _1134 = _1140;
    }
    float _1142 = _1134;
    if (_1088)
    {
        float _1144 = fma(_1142, _1110, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1112 = _1144;
    }
    float _1146 = _1112;
    if (_1088)
    {
        float _1148 = _1126 * _1146;
        _1128 = _1148;
    }
    float _1150 = _1128;
    if (_1088)
    {
        float _1152 = fma(_1076, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1118 = _1152;
    }
    float _1154 = _1118;
    if (_1088)
    {
        float _1156 = fma(_1072, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1102 = _1156;
    }
    float _1158 = _1102;
    float _1160 = fma(_1154, 6.2500002968590706586837768554688e-05, 0.5);
    float _1162 = fma(_1158, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3023 = float2(_1160, _1162);
    float3 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3023, float2(0.0), isnan(_3023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3023, float2(0.0), isnan(_3023)), level(0.0)).xyz;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    if (_1088)
    {
        float _1174 = _1132 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        _1136 = _1176;
    }
    float _1178 = _1136;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1186 = _210 > 0.5;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1192 = 1.0 / _1184;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1194;
    bool _1198 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1200 = isnan(_644);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1216 = _1214 != 0;
    float _1218 = -_1208;
    float _1220 = _1218 + 1.0;
    float _1222 = 1.0 / _1190;
    bool _1224 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1226 = isnan(_644);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1240 = _666 > 0.5;
    float _1242 = _1234 * _1220;
    float _1244 = -_1234;
    float _1246 = _1244 + 1.0;
    float _1248 = _1196 * _1192;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1252 = _644 + _1250;
    bool _1254 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1256 = isnan(_644);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1268 = _644 + _1266;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1272 = fma(_1248, _1252, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1274 = -_1264;
    float _1276 = _1274 + 1.0;
    float _1278 = _1238 * _1222;
    float _1280 = _1272 * _1242;
    float _1282 = _1272;
    float _1284 = _1208;
    float _1286 = _1268;
    if (!_1088)
    {
        _1282 = _1086;
    }
    float _1288 = _1282;
    float _1290 = _1208 * _1276;
    float _1292 = _1288;
    if (_1088)
    {
        float _1294 = _1178 + (-1.0);
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = fma(_1278, _1268, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1300 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1280);
    float _1302 = -_940;
    int _1304 = _1186 ? as_type<int>(_1302) : as_type<int>(_940);
    if (_1088)
    {
        float _1306 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1306;
    }
    float _1308 = _1286;
    float _1310 = -_946;
    int _1312 = _1240 ? as_type<int>(_1310) : as_type<int>(_946);
    float _1314 = fma(_1298, _1290, _1300);
    bool _1316 = !_1212;
    float _1318 = _1316 ? _940 : as_type<float>(_1304);
    if (_1088)
    {
        float _1320 = fma(_1086, _1178, _1308);
        _1292 = _1320;
    }
    float _1322 = _1292;
    bool _1324 = !_1216;
    float _1326 = _1324 ? _946 : as_type<float>(_1312);
    float _1328 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1314);
    float _1330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1346 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1338);
    float _1348 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1352 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1344);
    float _1354 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1360 = _1318 + 0.5;
    float _1362 = -_1326;
    float _1364 = _1362 + 0.5;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1368 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1370 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1372 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1374 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1366);
    float _1378 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1368);
    float _1380 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1370);
    float _1382 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1372);
    float _1384 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1390 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1378);
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1380);
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1382);
    float _1396 = _1384 * _1330;
    float _1398 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1400 = _1386 * _1270;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1412 = _1180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1416 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1392);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1434 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1388);
    float _1436 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1390);
    float _1438 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1394);
    out.m_38.x = _1412;
    out.m_57.x = _1426;
    out.m_57.y = _1428;
    out.m_57.z = _1430;
    out.m_57.w = _1418;
    out.m_59.x = _1396;
    out.m_59.y = _1400;
    out.m_61.x = _1420;
    out.m_61.y = _1422;
    out.m_61.z = _1424;
    out.m_61.w = _1432;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1436;
    out.gl_Position.z = _1416;
    out.gl_Position.w = _1438;
    out.m_63.x = _1168;
    out.m_63.y = _1170;
    out.m_63.z = _1172;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _636 = false;
    bool _536 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_35.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_38.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1495 = as_type<float>(_98);
        out.gl_Position.z = _1495;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_40.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = _116;
    if (_112)
    {
        float _120 = float(_82);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _116 >= _122;
    bool _126 = !_112;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_38.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_136);
        out.gl_Position.z = _1565;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_42.x;
    float _140 = in.m_42.y;
    float _142 = in.m_42.z;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _116 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_44.x;
    float _150 = in.m_44.y;
    float _152 = in.m_44.z;
    float _154 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_46.x;
    float _168 = in.m_46.y;
    float _170 = in.m_46.z;
    float _172 = _146 * _144;
    float _174 = 0.0;
    float _176 = _154;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_164)
    {
        float _180 = _154 * _154;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _138 * _138;
    float _188 = _140 * _140;
    float _190 = _142 * _142;
    float _192 = _184;
    float _194 = _138;
    if (!_164)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = fma(_148, _148, _186);
    float _202 = fma(_150, _150, _188);
    float _204 = fma(_152, _152, _190);
    float _206 = fma(_166, _166, _200);
    float _208 = fma(_168, _168, _202);
    float _210 = in.m_48.x;
    float _212 = fma(_170, _170, _204);
    float _214 = sqrt(_206);
    float _216 = sqrt(_208);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    bool _224 = _216 > 0.0;
    float _226 = floor(_222);
    float _228 = 0.0;
    float _230 = _206;
    float _232 = _198;
    if (!_220)
    {
        _228 = 0.0;
    }
    float _234 = _228;
    bool _236 = _218 > 0.0;
    float _238 = 0.0;
    float _240 = _218;
    float _242 = _234;
    if (_220)
    {
        float _244 = rsqrt(_206);
        _238 = _244;
    }
    float _246 = _238;
    int _248 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _250 = _248 != 0;
    if (!_220)
    {
        _240 = 0.0;
    }
    float _252 = _240;
    float _254 = _214;
    float _256 = _252;
    if (_224)
    {
        float _258 = rsqrt(_208);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = -_226;
    float _264 = _222 + _262;
    float _266 = _222 * 6.283185482025146484375;
    if (!_220)
    {
        _230 = 0.0;
    }
    float _268 = _230;
    float _270 = 0.0;
    float _272 = _268;
    if (_236)
    {
        float _274 = rsqrt(_212);
        _270 = _274;
    }
    float _276 = _270;
    bool _278 = !_164;
    float _280 = 0.0;
    float _282 = 0.0;
    if (!_278)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _154 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _154);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _312;
        _280 = _296;
        _282 = _302;
    }
    float _314 = _232;
    float _316 = _280;
    float _318 = _282;
    bool _320 = !_164;
    float _322 = _316;
    float _324 = _318;
    if (!_320)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _154 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _176 = _344;
        _178 = _334;
    }
    float _346 = _176;
    float _348 = _178;
    float _350 = _266 * 0.15915493667125701904296875;
    float _352 = in.m_40.x;
    float _354 = in.m_40.y;
    float _356 = in.m_40.z;
    float _358 = _348;
    if (!_224)
    {
        _358 = 0.0;
        _322 = 0.0;
    }
    float _360 = _358;
    float _362 = _322;
    float _364 = _350 * 6.283185482025146484375;
    float _366 = cos(_364);
    float _368 = _360;
    float _370 = _362;
    if (_220)
    {
        float _372 = _246 * _148;
        _272 = _372;
    }
    float _374 = _272;
    if (_220)
    {
        float _376 = _246 * _138;
        _256 = _376;
    }
    float _378 = _256;
    if (_220)
    {
        float _380 = _246 * _166;
        _242 = _380;
    }
    float _382 = _242;
    float _384 = 0.0;
    if (!_224)
    {
        _384 = 0.0;
    }
    float _386 = _384;
    float _388 = _386;
    if (_224)
    {
        float _390 = _260 * _150;
        _368 = _390;
    }
    float _392 = _368;
    if (_224)
    {
        float _394 = _260 * _140;
        _370 = _394;
    }
    float _396 = _370;
    if (_224)
    {
        float _398 = _260 * _168;
        _388 = _398;
    }
    float _400 = _388;
    float _402 = 0.0;
    float _404 = 0.0;
    if (!_236)
    {
        _402 = 0.0;
        _404 = 0.0;
    }
    float _406 = _402;
    float _408 = _404;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _416 = _414 != 0;
    float _418 = _408;
    float _420 = _406;
    if (_236)
    {
        float _422 = _276 * _142;
        _418 = _422;
    }
    float _424 = _418;
    if (_236)
    {
        float _426 = _276 * _170;
        _420 = _426;
    }
    float _428 = _420;
    bool _430 = _264 < 0.5;
    float _432 = float(_430);
    float _434 = in.m_50.w;
    if (!_236)
    {
        _324 = 0.0;
    }
    float _436 = _324;
    float _438 = _436;
    if (_236)
    {
        float _440 = _276 * _152;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = fma(_366, 0.5, 0.5);
    float _446 = in.m_35.x;
    float _448 = in.m_35.y;
    float _450 = in.m_35.z;
    bool _452 = !_412;
    int _454 = _452 ? 0 : 1;
    float _456 = -_264;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = -_432;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _464 = !_250;
    int _466 = _464 ? 0 : 1;
    float _468 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = -_444;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _474 = abs(_454);
    float _476 = fma(_346, _352, _468);
    int _478 = abs(_466);
    float _480 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _482 = !_416;
    int _484 = _482 ? 0 : 1;
    float _486 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _488 = fma(_346, _354, _480);
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _492 = fma(_346, _356, _486);
    int _494 = abs(_484);
    float _496 = float(_474);
    float _498 = float(_478);
    float _500 = abs(_458);
    float _502 = _496 * _500;
    float _504 = fma(_476, _434, _446);
    float _506 = fma(_488, _434, _448);
    float _508 = float(_494);
    float _510 = fma(_498, _472, _502);
    float _512 = fma(_492, _434, _450);
    float _514 = abs(_462);
    float _516 = fma(_508, _514, _510);
    bool _518 = !_490;
    float _534;
    if (!_518)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _522 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_82);
        float _540 = 1.0 / _538;
        float _542 = _116 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _548 = _544 + _546;
    bool _550 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _552 = isnan(_544);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _562;
    float _566 = -_560;
    float _568 = _566 + 1.0;
    bool _570 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _582;
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = 1.0 / _564;
    float _590 = _580 * _568;
    float _592 = -_580;
    float _594 = _592 + 1.0;
    float _596 = _548 * _588;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _598;
    float _602 = fma(_584, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _604 = fma(_600, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _606 = _602 * _590;
    float _608 = _604 * _590;
    float _610 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _606);
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _608);
    float _614 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[144].x, _610);
    float _616 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[144].y, _612);
    bool _618 = !_586;
    float _634;
    if (!_618)
    {
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _210 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_82);
        float _640 = 1.0 / _638;
        float _642 = _116 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_48.z;
    float _648 = _210 * 2.0;
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _664 = _662 != 0;
    float _666 = in.m_48.y;
    bool _668 = !_660;
    int _670 = _668 ? 0 : 1;
    float _672 = floor(_648);
    bool _674 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(1.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _686 = 1.0 + _684;
    int _688 = abs(_670);
    bool _690 = !_656;
    int _692 = _690 ? 0 : 1;
    float _694 = _652 * _116;
    float _696 = 1.0 / _686;
    float _698 = _646 * 2.0;
    bool _700 = _672 > 0.0;
    float _702 = exp2(_694);
    float _704 = _666 + _646;
    bool _706 = _672 >= 0.0;
    bool _708 = isnan(_672);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _666 * 2.0;
    float _718 = float(_688);
    float _720 = _704 + (-1.0);
    float _722 = floor(_698);
    int _724 = _714 ? 0 : 1;
    float _726 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _728 = ~_724;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    int _734 = _732;
    if (!_700)
    {
        int _736 = ~_724;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    float _742 = floor(_716);
    float _744 = -_702;
    float _746 = _744 + 1.0;
    bool _748 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _756 = _752 || _754;
    float _758 = float(_740);
    float _760 = _756 ? _746 : 0.0;
    bool _762 = _722 > 0.0;
    float _764 = _718 * _758;
    bool _766 = _722 >= 0.0;
    bool _768 = isnan(_722);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    if (_682)
    {
        float _776 = _760 * _696;
        _118 = _776;
    }
    float _778 = _118;
    float _780 = in.m_52.x;
    float _782 = in.m_52.y;
    float _784 = in.m_52.z;
    float _786 = _764 * (-2.0);
    int _788 = _774 ? 0 : 1;
    float _790 = _666 + (-0.5);
    bool _792 = _742 > 0.0;
    float _794 = fma(_726, _786, _726);
    int _796 = ~_788;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    bool _802 = _742 >= 0.0;
    bool _804 = isnan(_742);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    int _812 = _800;
    if (!_762)
    {
        int _814 = ~_788;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    int _820 = abs(_692);
    int _822 = _810 ? 0 : 1;
    bool _824 = !_664;
    int _826 = _824 ? 0 : 1;
    float _828 = float(_820);
    float _830 = float(_818);
    int _832 = ~_822;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = fma(_786, _782, _782);
    int _840 = _836;
    if (!_792)
    {
        int _842 = ~_822;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    float _848 = _210 + _666;
    int _850 = abs(_826);
    float _852 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _854 = _828 * _830;
    float _856 = _848 + (-1.0);
    float _858 = fma(_794, _778, _852);
    float _860 = float(_850);
    float _862 = _854 * (-2.0);
    float _864 = float(_846);
    float _866 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _868 = _210 + (-0.5);
    float _870 = fma(_862, _780, _780);
    float _872 = _858 * 0.15915493667125701904296875;
    float _874 = _860 * _864;
    float _876 = _210 + _646;
    float _878 = as_type<float>(int(gl_VertexIndex));
    float _880 = fma(_866, _862, _866);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _870);
    float _884 = _876 + (-1.0);
    float _886 = _874 * (-2.0);
    float _888 = fma(_880, _778, _882);
    float _890 = in.m_50.x;
    float _892 = in.m_50.y;
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _896 = fma(_886, _784, _784);
    float _898 = _646 + (-0.5);
    float _900 = _888 * 0.15915493667125701904296875;
    float _902 = fma(_894, _886, _894);
    float _904 = _872 * 6.283185482025146484375;
    float _906 = sin(_904);
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].z, _896);
    float _910 = _506 * _150;
    float _912 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _914 = in.m_46.w;
    float _916 = fma(_902, _778, _908);
    float _918 = fma(_504, _148, _910);
    float _920 = _872 * 6.283185482025146484375;
    float _922 = cos(_920);
    float _924 = _916 * 0.15915493667125701904296875;
    int _926 = as_type<int>(_878) & 1;
    bool _928 = _926 != 0;
    int _930 = as_type<int>(_878) & 2;
    bool _932 = _930 != 0;
    float _934 = _924 * 6.283185482025146484375;
    float _936 = cos(_934);
    bool _938 = !_928;
    float _940 = _938 ? (-0.5) : 0.5;
    float _942 = _614 * _890;
    bool _944 = !_932;
    float _946 = _944 ? (-0.5) : 0.5;
    float _948 = _616 * _892;
    float _950 = _506 * _168;
    float _952 = _942 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _940);
    float _956 = _900 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _964 = _952 * _954;
    float _966 = fma(_504, _166, _950);
    float _968 = _506 * _140;
    float _970 = _960 * _962;
    float _972 = in.m_44.w;
    float _974 = _900 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = fma(_512, _170, _966);
    float _980 = fma(_504, _138, _968);
    float _982 = _978 + _914;
    float _984 = fma(_512, _142, _980);
    float _986 = _924 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _958 * _906;
    float _992 = _958 * _922;
    float _994 = _976 * _922;
    float _996 = _936 * _912;
    float _998 = _976 * _906;
    float _1000 = _922 * _936;
    float _1002 = _906 * _936;
    float _1004 = _976 * _996;
    float _1006 = _958 * _996;
    float _1008 = fma(_988, _994, _990);
    float _1010 = _988 * _912;
    float _1012 = fma(_1008, _964, _1004);
    float _1014 = -_992;
    float _1016 = fma(_988, _998, _1014);
    float _1018 = -_998;
    float _1020 = fma(_988, _992, _1018);
    float _1022 = -_1010;
    float _1024 = fma(_1000, _964, _1022);
    float _1026 = fma(_988, _990, _994);
    float _1028 = -_970;
    float _1030 = fma(_1016, _1028, _1012);
    float _1032 = fma(_1020, _964, _1006);
    float _1034 = -_970;
    float _1036 = fma(_1002, _1034, _1024);
    float _1038 = _1030 * _400;
    float _1040 = -_970;
    float _1042 = fma(_1026, _1040, _1032);
    float _1044 = _1030 * _392;
    float _1046 = fma(_512, _152, _918);
    float _1048 = fma(_1036, _382, _1038);
    float _1050 = _1030 * _396;
    float _1052 = fma(_1036, _374, _1044);
    float _1054 = _1046 + _972;
    float _1056 = fma(_1042, _428, _1048);
    float _1058 = in.m_42.w;
    float _1060 = fma(_1042, _442, _1052);
    float _1062 = fma(_1036, _378, _1050);
    float _1064 = _982 + _1056;
    float _1066 = _1054 + _1060;
    float _1068 = fma(_1042, _424, _1062);
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1066 + _1074;
    float _1078 = _1072 * _1072;
    float _1080 = fma(_1076, _1076, _1078);
    float _1082 = sqrt(_1080);
    float _1084 = _984 + _1058;
    float _1086 = _1084 + _1068;
    bool _1088 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = _1082 + _1090;
    float _1094 = _170;
    float _1096 = _1030;
    float _1098 = _1082;
    float _1100 = _1092;
    float _1102 = _1064;
    if (_1088)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (_1088)
    {
        float _1108 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (!_1088)
    {
        _194 = _1066;
    }
    float _1114 = _194;
    float _1116 = _1106;
    float _1118 = _1114;
    if (_1088)
    {
        float _1120 = _1092 * _1106;
        _1098 = _1120;
    }
    float _1122 = _1098;
    if (_1088)
    {
        float _1124 = rsqrt(_1080);
        _1116 = _1124;
    }
    float _1126 = _1116;
    float _1128 = _1126;
    if (_1088)
    {
        float _1130 = _1122 * 0.15915493667125701904296875;
        _1100 = _1130;
    }
    float _1132 = _1100;
    float _1134 = _1122;
    float _1136 = _1132;
    if (_1088)
    {
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        _1134 = _1140;
    }
    float _1142 = _1134;
    if (_1088)
    {
        float _1144 = fma(_1142, _1110, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1112 = _1144;
    }
    float _1146 = _1112;
    if (_1088)
    {
        float _1148 = _1126 * _1146;
        _1128 = _1148;
    }
    float _1150 = _1128;
    if (_1088)
    {
        float _1152 = fma(_1076, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1118 = _1152;
    }
    float _1154 = _1118;
    if (_1088)
    {
        float _1156 = fma(_1072, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1102 = _1156;
    }
    float _1158 = _1102;
    float _1160 = fma(_1154, 6.2500002968590706586837768554688e-05, 0.5);
    float _1162 = fma(_1158, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3023 = float2(_1160, _1162);
    float3 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3023, float2(0.0), isnan(_3023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3023, float2(0.0), isnan(_3023)), level(0.0)).xyz;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    if (_1088)
    {
        float _1174 = _1132 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        _1136 = _1176;
    }
    float _1178 = _1136;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1186 = _210 > 0.5;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1192 = 1.0 / _1184;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1194;
    bool _1198 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1200 = isnan(_644);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1216 = _1214 != 0;
    float _1218 = -_1208;
    float _1220 = _1218 + 1.0;
    float _1222 = 1.0 / _1190;
    bool _1224 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1226 = isnan(_644);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1240 = _666 > 0.5;
    float _1242 = _1234 * _1220;
    float _1244 = -_1234;
    float _1246 = _1244 + 1.0;
    float _1248 = _1196 * _1192;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1252 = _644 + _1250;
    bool _1254 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1256 = isnan(_644);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1268 = _644 + _1266;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1272 = fma(_1248, _1252, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1274 = -_1264;
    float _1276 = _1274 + 1.0;
    float _1278 = _1238 * _1222;
    float _1280 = _1272 * _1242;
    float _1282 = _1272;
    float _1284 = _1208;
    float _1286 = _1268;
    if (!_1088)
    {
        _1282 = _1086;
    }
    float _1288 = _1282;
    float _1290 = _1208 * _1276;
    float _1292 = _1288;
    if (_1088)
    {
        float _1294 = _1178 + (-1.0);
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = fma(_1278, _1268, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1300 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1280);
    float _1302 = -_940;
    int _1304 = _1186 ? as_type<int>(_1302) : as_type<int>(_940);
    if (_1088)
    {
        float _1306 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1306;
    }
    float _1308 = _1286;
    float _1310 = -_946;
    int _1312 = _1240 ? as_type<int>(_1310) : as_type<int>(_946);
    float _1314 = fma(_1298, _1290, _1300);
    bool _1316 = !_1212;
    float _1318 = _1316 ? _940 : as_type<float>(_1304);
    if (_1088)
    {
        float _1320 = fma(_1086, _1178, _1308);
        _1292 = _1320;
    }
    float _1322 = _1292;
    bool _1324 = !_1216;
    float _1326 = _1324 ? _946 : as_type<float>(_1312);
    float _1328 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1314);
    float _1330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1346 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1338);
    float _1348 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1352 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1344);
    float _1354 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1360 = _1318 + 0.5;
    float _1362 = -_1326;
    float _1364 = _1362 + 0.5;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1368 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1370 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1372 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1374 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1366);
    float _1378 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1368);
    float _1380 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1370);
    float _1382 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1372);
    float _1384 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1390 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1378);
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1380);
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1382);
    float _1396 = _1384 * _1330;
    float _1398 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1400 = _1386 * _1270;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1412 = _1180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1416 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1392);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1434 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1388);
    float _1436 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1390);
    float _1438 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1394);
    out.m_38.x = _1412;
    out.m_57.x = _1426;
    out.m_57.y = _1428;
    out.m_57.z = _1430;
    out.m_57.w = _1418;
    out.m_59.x = _1396;
    out.m_59.y = _1400;
    out.m_61.x = _1420;
    out.m_61.y = _1422;
    out.m_61.z = _1424;
    out.m_61.w = _1432;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1436;
    out.gl_Position.z = _1416;
    out.gl_Position.w = _1438;
    out.m_63.x = _1168;
    out.m_63.y = _1170;
    out.m_63.z = _1172;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _636 = false;
    bool _536 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_35.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_38.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1495 = as_type<float>(_98);
        out.gl_Position.z = _1495;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_40.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = _116;
    if (_112)
    {
        float _120 = float(_82);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _116 >= _122;
    bool _126 = !_112;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_38.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_136);
        out.gl_Position.z = _1565;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_42.x;
    float _140 = in.m_42.y;
    float _142 = in.m_42.z;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _116 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_44.x;
    float _150 = in.m_44.y;
    float _152 = in.m_44.z;
    float _154 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_46.x;
    float _168 = in.m_46.y;
    float _170 = in.m_46.z;
    float _172 = _146 * _144;
    float _174 = 0.0;
    float _176 = _154;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_164)
    {
        float _180 = _154 * _154;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _138 * _138;
    float _188 = _140 * _140;
    float _190 = _142 * _142;
    float _192 = _184;
    float _194 = _138;
    if (!_164)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = fma(_148, _148, _186);
    float _202 = fma(_150, _150, _188);
    float _204 = fma(_152, _152, _190);
    float _206 = fma(_166, _166, _200);
    float _208 = fma(_168, _168, _202);
    float _210 = in.m_48.x;
    float _212 = fma(_170, _170, _204);
    float _214 = sqrt(_206);
    float _216 = sqrt(_208);
    float _218 = sqrt(_212);
    bool _220 = _214 > 0.0;
    float _222 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    bool _224 = _216 > 0.0;
    float _226 = floor(_222);
    float _228 = 0.0;
    float _230 = _206;
    float _232 = _198;
    if (!_220)
    {
        _228 = 0.0;
    }
    float _234 = _228;
    bool _236 = _218 > 0.0;
    float _238 = 0.0;
    float _240 = _218;
    float _242 = _234;
    if (_220)
    {
        float _244 = rsqrt(_206);
        _238 = _244;
    }
    float _246 = _238;
    int _248 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _250 = _248 != 0;
    if (!_220)
    {
        _240 = 0.0;
    }
    float _252 = _240;
    float _254 = _214;
    float _256 = _252;
    if (_224)
    {
        float _258 = rsqrt(_208);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = -_226;
    float _264 = _222 + _262;
    float _266 = _222 * 6.283185482025146484375;
    if (!_220)
    {
        _230 = 0.0;
    }
    float _268 = _230;
    float _270 = 0.0;
    float _272 = _268;
    if (_236)
    {
        float _274 = rsqrt(_212);
        _270 = _274;
    }
    float _276 = _270;
    bool _278 = !_164;
    float _280 = 0.0;
    float _282 = 0.0;
    if (!_278)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _154 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _154);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _312;
        _280 = _296;
        _282 = _302;
    }
    float _314 = _232;
    float _316 = _280;
    float _318 = _282;
    bool _320 = !_164;
    float _322 = _316;
    float _324 = _318;
    if (!_320)
    {
        float _326 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _328 = log2(_326);
        float _330 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _332 = _330 + 1.0;
        float _334 = 1.0 / _332;
        float _336 = _154 * _328;
        float _338 = exp2(_336);
        float _340 = -_338;
        float _342 = _340 + 1.0;
        float _344 = _342 * _334;
        _176 = _344;
        _178 = _334;
    }
    float _346 = _176;
    float _348 = _178;
    float _350 = _266 * 0.15915493667125701904296875;
    float _352 = in.m_40.x;
    float _354 = in.m_40.y;
    float _356 = in.m_40.z;
    float _358 = _348;
    if (!_224)
    {
        _358 = 0.0;
        _322 = 0.0;
    }
    float _360 = _358;
    float _362 = _322;
    float _364 = _350 * 6.283185482025146484375;
    float _366 = cos(_364);
    float _368 = _360;
    float _370 = _362;
    if (_220)
    {
        float _372 = _246 * _148;
        _272 = _372;
    }
    float _374 = _272;
    if (_220)
    {
        float _376 = _246 * _138;
        _256 = _376;
    }
    float _378 = _256;
    if (_220)
    {
        float _380 = _246 * _166;
        _242 = _380;
    }
    float _382 = _242;
    float _384 = 0.0;
    if (!_224)
    {
        _384 = 0.0;
    }
    float _386 = _384;
    float _388 = _386;
    if (_224)
    {
        float _390 = _260 * _150;
        _368 = _390;
    }
    float _392 = _368;
    if (_224)
    {
        float _394 = _260 * _140;
        _370 = _394;
    }
    float _396 = _370;
    if (_224)
    {
        float _398 = _260 * _168;
        _388 = _398;
    }
    float _400 = _388;
    float _402 = 0.0;
    float _404 = 0.0;
    if (!_236)
    {
        _402 = 0.0;
        _404 = 0.0;
    }
    float _406 = _402;
    float _408 = _404;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _412 = _410 != 0;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _416 = _414 != 0;
    float _418 = _408;
    float _420 = _406;
    if (_236)
    {
        float _422 = _276 * _142;
        _418 = _422;
    }
    float _424 = _418;
    if (_236)
    {
        float _426 = _276 * _170;
        _420 = _426;
    }
    float _428 = _420;
    bool _430 = _264 < 0.5;
    float _432 = float(_430);
    float _434 = in.m_50.w;
    if (!_236)
    {
        _324 = 0.0;
    }
    float _436 = _324;
    float _438 = _436;
    if (_236)
    {
        float _440 = _276 * _152;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = fma(_366, 0.5, 0.5);
    float _446 = in.m_35.x;
    float _448 = in.m_35.y;
    float _450 = in.m_35.z;
    bool _452 = !_412;
    int _454 = _452 ? 0 : 1;
    float _456 = -_264;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = -_432;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _464 = !_250;
    int _466 = _464 ? 0 : 1;
    float _468 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = -_444;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _474 = abs(_454);
    float _476 = fma(_346, _352, _468);
    int _478 = abs(_466);
    float _480 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _482 = !_416;
    int _484 = _482 ? 0 : 1;
    float _486 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _488 = fma(_346, _354, _480);
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _492 = fma(_346, _356, _486);
    int _494 = abs(_484);
    float _496 = float(_474);
    float _498 = float(_478);
    float _500 = abs(_458);
    float _502 = _496 * _500;
    float _504 = fma(_476, _434, _446);
    float _506 = fma(_488, _434, _448);
    float _508 = float(_494);
    float _510 = fma(_498, _472, _502);
    float _512 = fma(_492, _434, _450);
    float _514 = abs(_462);
    float _516 = fma(_508, _514, _510);
    bool _518 = !_490;
    float _534;
    if (!_518)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _522 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_82);
        float _540 = 1.0 / _538;
        float _542 = _116 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _548 = _544 + _546;
    bool _550 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _552 = isnan(_544);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _562;
    float _566 = -_560;
    float _568 = _566 + 1.0;
    bool _570 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _572 = isnan(_544);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _582;
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = 1.0 / _564;
    float _590 = _580 * _568;
    float _592 = -_580;
    float _594 = _592 + 1.0;
    float _596 = _548 * _588;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _598;
    float _602 = fma(_584, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _604 = fma(_600, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _606 = _602 * _590;
    float _608 = _604 * _590;
    float _610 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _606);
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _608);
    float _614 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[144].x, _610);
    float _616 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[144].y, _612);
    bool _618 = !_586;
    float _634;
    if (!_618)
    {
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _210 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_82);
        float _640 = 1.0 / _638;
        float _642 = _116 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_48.z;
    float _648 = _210 * 2.0;
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _664 = _662 != 0;
    float _666 = in.m_48.y;
    bool _668 = !_660;
    int _670 = _668 ? 0 : 1;
    float _672 = floor(_648);
    bool _674 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(1.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _686 = 1.0 + _684;
    int _688 = abs(_670);
    bool _690 = !_656;
    int _692 = _690 ? 0 : 1;
    float _694 = _652 * _116;
    float _696 = 1.0 / _686;
    float _698 = _646 * 2.0;
    bool _700 = _672 > 0.0;
    float _702 = exp2(_694);
    float _704 = _666 + _646;
    bool _706 = _672 >= 0.0;
    bool _708 = isnan(_672);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _666 * 2.0;
    float _718 = float(_688);
    float _720 = _704 + (-1.0);
    float _722 = floor(_698);
    int _724 = _714 ? 0 : 1;
    float _726 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _728 = ~_724;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    int _734 = _732;
    if (!_700)
    {
        int _736 = ~_724;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    float _742 = floor(_716);
    float _744 = -_702;
    float _746 = _744 + 1.0;
    bool _748 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _756 = _752 || _754;
    float _758 = float(_740);
    float _760 = _756 ? _746 : 0.0;
    bool _762 = _722 > 0.0;
    float _764 = _718 * _758;
    bool _766 = _722 >= 0.0;
    bool _768 = isnan(_722);
    bool _770 = _766 || _768;
    bool _772 = isnan(0.0);
    bool _774 = _770 || _772;
    if (_682)
    {
        float _776 = _760 * _696;
        _118 = _776;
    }
    float _778 = _118;
    float _780 = in.m_52.x;
    float _782 = in.m_52.y;
    float _784 = in.m_52.z;
    float _786 = _764 * (-2.0);
    int _788 = _774 ? 0 : 1;
    float _790 = _666 + (-0.5);
    bool _792 = _742 > 0.0;
    float _794 = fma(_726, _786, _726);
    int _796 = ~_788;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    bool _802 = _742 >= 0.0;
    bool _804 = isnan(_742);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    int _812 = _800;
    if (!_762)
    {
        int _814 = ~_788;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    int _820 = abs(_692);
    int _822 = _810 ? 0 : 1;
    bool _824 = !_664;
    int _826 = _824 ? 0 : 1;
    float _828 = float(_820);
    float _830 = float(_818);
    int _832 = ~_822;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = fma(_786, _782, _782);
    int _840 = _836;
    if (!_792)
    {
        int _842 = ~_822;
        int _844 = _842 + 1;
        _840 = _844;
    }
    int _846 = _840;
    float _848 = _210 + _666;
    int _850 = abs(_826);
    float _852 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _854 = _828 * _830;
    float _856 = _848 + (-1.0);
    float _858 = fma(_794, _778, _852);
    float _860 = float(_850);
    float _862 = _854 * (-2.0);
    float _864 = float(_846);
    float _866 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _868 = _210 + (-0.5);
    float _870 = fma(_862, _780, _780);
    float _872 = _858 * 0.15915493667125701904296875;
    float _874 = _860 * _864;
    float _876 = _210 + _646;
    float _878 = as_type<float>(int(gl_VertexIndex));
    float _880 = fma(_866, _862, _866);
    float _882 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].x, _870);
    float _884 = _876 + (-1.0);
    float _886 = _874 * (-2.0);
    float _888 = fma(_880, _778, _882);
    float _890 = in.m_50.x;
    float _892 = in.m_50.y;
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _896 = fma(_886, _784, _784);
    float _898 = _646 + (-0.5);
    float _900 = _888 * 0.15915493667125701904296875;
    float _902 = fma(_894, _886, _894);
    float _904 = _872 * 6.283185482025146484375;
    float _906 = sin(_904);
    float _908 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].z, _896);
    float _910 = _506 * _150;
    float _912 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _914 = in.m_46.w;
    float _916 = fma(_902, _778, _908);
    float _918 = fma(_504, _148, _910);
    float _920 = _872 * 6.283185482025146484375;
    float _922 = cos(_920);
    float _924 = _916 * 0.15915493667125701904296875;
    int _926 = as_type<int>(_878) & 1;
    bool _928 = _926 != 0;
    int _930 = as_type<int>(_878) & 2;
    bool _932 = _930 != 0;
    float _934 = _924 * 6.283185482025146484375;
    float _936 = cos(_934);
    bool _938 = !_928;
    float _940 = _938 ? (-0.5) : 0.5;
    float _942 = _614 * _890;
    bool _944 = !_932;
    float _946 = _944 ? (-0.5) : 0.5;
    float _948 = _616 * _892;
    float _950 = _506 * _168;
    float _952 = _942 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _940);
    float _956 = _900 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _964 = _952 * _954;
    float _966 = fma(_504, _166, _950);
    float _968 = _506 * _140;
    float _970 = _960 * _962;
    float _972 = in.m_44.w;
    float _974 = _900 * 6.283185482025146484375;
    float _976 = cos(_974);
    float _978 = fma(_512, _170, _966);
    float _980 = fma(_504, _138, _968);
    float _982 = _978 + _914;
    float _984 = fma(_512, _142, _980);
    float _986 = _924 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _958 * _906;
    float _992 = _958 * _922;
    float _994 = _976 * _922;
    float _996 = _936 * _912;
    float _998 = _976 * _906;
    float _1000 = _922 * _936;
    float _1002 = _906 * _936;
    float _1004 = _976 * _996;
    float _1006 = _958 * _996;
    float _1008 = fma(_988, _994, _990);
    float _1010 = _988 * _912;
    float _1012 = fma(_1008, _964, _1004);
    float _1014 = -_992;
    float _1016 = fma(_988, _998, _1014);
    float _1018 = -_998;
    float _1020 = fma(_988, _992, _1018);
    float _1022 = -_1010;
    float _1024 = fma(_1000, _964, _1022);
    float _1026 = fma(_988, _990, _994);
    float _1028 = -_970;
    float _1030 = fma(_1016, _1028, _1012);
    float _1032 = fma(_1020, _964, _1006);
    float _1034 = -_970;
    float _1036 = fma(_1002, _1034, _1024);
    float _1038 = _1030 * _400;
    float _1040 = -_970;
    float _1042 = fma(_1026, _1040, _1032);
    float _1044 = _1030 * _392;
    float _1046 = fma(_512, _152, _918);
    float _1048 = fma(_1036, _382, _1038);
    float _1050 = _1030 * _396;
    float _1052 = fma(_1036, _374, _1044);
    float _1054 = _1046 + _972;
    float _1056 = fma(_1042, _428, _1048);
    float _1058 = in.m_42.w;
    float _1060 = fma(_1042, _442, _1052);
    float _1062 = fma(_1036, _378, _1050);
    float _1064 = _982 + _1056;
    float _1066 = _1054 + _1060;
    float _1068 = fma(_1042, _424, _1062);
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1066 + _1074;
    float _1078 = _1072 * _1072;
    float _1080 = fma(_1076, _1076, _1078);
    float _1082 = sqrt(_1080);
    float _1084 = _984 + _1058;
    float _1086 = _1084 + _1068;
    bool _1088 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = _1082 + _1090;
    float _1094 = _170;
    float _1096 = _1030;
    float _1098 = _1082;
    float _1100 = _1092;
    float _1102 = _1064;
    if (_1088)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (_1088)
    {
        float _1108 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (!_1088)
    {
        _194 = _1066;
    }
    float _1114 = _194;
    float _1116 = _1106;
    float _1118 = _1114;
    if (_1088)
    {
        float _1120 = _1092 * _1106;
        _1098 = _1120;
    }
    float _1122 = _1098;
    if (_1088)
    {
        float _1124 = rsqrt(_1080);
        _1116 = _1124;
    }
    float _1126 = _1116;
    float _1128 = _1126;
    if (_1088)
    {
        float _1130 = _1122 * 0.15915493667125701904296875;
        _1100 = _1130;
    }
    float _1132 = _1100;
    float _1134 = _1122;
    float _1136 = _1132;
    if (_1088)
    {
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        _1134 = _1140;
    }
    float _1142 = _1134;
    if (_1088)
    {
        float _1144 = fma(_1142, _1110, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1112 = _1144;
    }
    float _1146 = _1112;
    if (_1088)
    {
        float _1148 = _1126 * _1146;
        _1128 = _1148;
    }
    float _1150 = _1128;
    if (_1088)
    {
        float _1152 = fma(_1076, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1118 = _1152;
    }
    float _1154 = _1118;
    if (_1088)
    {
        float _1156 = fma(_1072, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1102 = _1156;
    }
    float _1158 = _1102;
    float _1160 = fma(_1154, 6.2500002968590706586837768554688e-05, 0.5);
    float _1162 = fma(_1158, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3023 = float2(_1160, _1162);
    float3 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3023, float2(0.0), isnan(_3023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3023, float2(0.0), isnan(_3023)), level(0.0)).xyz;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    if (_1088)
    {
        float _1174 = _1132 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        _1136 = _1176;
    }
    float _1178 = _1136;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1184 = _1182 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1186 = _210 > 0.5;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1192 = 1.0 / _1184;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1194;
    bool _1198 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1200 = isnan(_644);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1216 = _1214 != 0;
    float _1218 = -_1208;
    float _1220 = _1218 + 1.0;
    float _1222 = 1.0 / _1190;
    bool _1224 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1226 = isnan(_644);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1240 = _666 > 0.5;
    float _1242 = _1234 * _1220;
    float _1244 = -_1234;
    float _1246 = _1244 + 1.0;
    float _1248 = _1196 * _1192;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1252 = _644 + _1250;
    bool _1254 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1256 = isnan(_644);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1268 = _644 + _1266;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1272 = fma(_1248, _1252, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1274 = -_1264;
    float _1276 = _1274 + 1.0;
    float _1278 = _1238 * _1222;
    float _1280 = _1272 * _1242;
    float _1282 = _1272;
    float _1284 = _1208;
    float _1286 = _1268;
    if (!_1088)
    {
        _1282 = _1086;
    }
    float _1288 = _1282;
    float _1290 = _1208 * _1276;
    float _1292 = _1288;
    if (_1088)
    {
        float _1294 = _1178 + (-1.0);
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = fma(_1278, _1268, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1300 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1280);
    float _1302 = -_940;
    int _1304 = _1186 ? as_type<int>(_1302) : as_type<int>(_940);
    if (_1088)
    {
        float _1306 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1286 = _1306;
    }
    float _1308 = _1286;
    float _1310 = -_946;
    int _1312 = _1240 ? as_type<int>(_1310) : as_type<int>(_946);
    float _1314 = fma(_1298, _1290, _1300);
    bool _1316 = !_1212;
    float _1318 = _1316 ? _940 : as_type<float>(_1304);
    if (_1088)
    {
        float _1320 = fma(_1086, _1178, _1308);
        _1292 = _1320;
    }
    float _1322 = _1292;
    bool _1324 = !_1216;
    float _1326 = _1324 ? _946 : as_type<float>(_1312);
    float _1328 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1314);
    float _1330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1346 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1338);
    float _1348 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1352 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1344);
    float _1354 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1360 = _1318 + 0.5;
    float _1362 = -_1326;
    float _1364 = _1362 + 0.5;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1368 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1370 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1372 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1374 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1366);
    float _1378 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1368);
    float _1380 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1370);
    float _1382 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1372);
    float _1384 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1388 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1390 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1378);
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1380);
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1382);
    float _1396 = _1384 * _1330;
    float _1398 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1400 = _1386 * _1270;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1412 = _1180 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1416 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1392);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1328 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1434 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1388);
    float _1436 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1390);
    float _1438 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1394);
    out.m_38.x = _1412;
    out.m_57.x = _1426;
    out.m_57.y = _1428;
    out.m_57.z = _1430;
    out.m_57.w = _1418;
    out.m_59.x = _1396;
    out.m_59.y = _1400;
    out.m_61.x = _1420;
    out.m_61.y = _1422;
    out.m_61.z = _1424;
    out.m_61.w = _1432;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1436;
    out.gl_Position.z = _1416;
    out.gl_Position.w = _1438;
    out.m_63.x = _1168;
    out.m_63.y = _1170;
    out.m_63.z = _1172;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

